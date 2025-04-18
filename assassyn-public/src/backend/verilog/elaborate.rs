use std::{
  collections::{HashMap, HashSet, VecDeque},
  fs::File,
  io::{self, Error, Write},
  path::Path,
};

use instructions::FIFOPush;
// use instructions::FIFOPush;
// use regex::Regex;

use crate::{
  analysis::topo_sort,
  backend::common::{create_and_clean_dir, namify, upstreams, Config},
  builder::system::{ExposeKind, ModuleKind, SysBuilder},
  ir::{instructions::BlockIntrinsic, node::*, visitor::Visitor, *},
};

use self::{expr::subcode, expr::Metadata};

use super::{
  gather::{gather_exprs_externally_used, ExternalUsage, Gather},
  utils::{
    self, bool_ty, connect_top, declare_array, declare_in, declare_logic, declare_out, reduce,
    select_1h, Edge, Field,
  },
  Simulator,
};

use crate::ir::module::attrs::MemoryParams;
use crate::ir::module::attrs::MemoryPins;

macro_rules! fifo_name {
  ($fifo:expr) => {{
    format!("{}", namify($fifo.get_name()))
  }};
}

struct VerilogDumper<'a, 'b> {
  sys: &'a SysBuilder,
  config: &'b Config,
  pred_stack: VecDeque<String>,
  fifo_pushes: HashMap<String, Gather>, // fifo_name -> value
  array_stores: HashMap<String, (Gather, Gather)>, // array_name -> (idx, value)
  triggers: HashMap<String, Gather>,    // module_name -> [pred]
  external_usage: ExternalUsage,
  current_module: String,
  before_wait_until: bool,
  topo: HashMap<BaseNode, usize>,
  array_memory_params_map: HashMap<BaseNode, MemoryParams>,
  module_expr_map: HashMap<BaseNode, HashMap<BaseNode, ExposeKind>>,
}

impl<'a, 'b> VerilogDumper<'a, 'b> {
  fn new(
    sys: &'a SysBuilder,
    config: &'b Config,
    external_usage: ExternalUsage,
    topo: HashMap<BaseNode, usize>,
    array_memory_params_map: HashMap<BaseNode, MemoryParams>,
    module_expr_map: HashMap<BaseNode, HashMap<BaseNode, ExposeKind>>,
  ) -> Self {
    Self {
      sys,
      config,
      pred_stack: VecDeque::new(),
      fifo_pushes: HashMap::new(),
      array_stores: HashMap::new(),
      triggers: HashMap::new(),
      current_module: String::new(),
      external_usage,
      before_wait_until: false,
      topo,
      array_memory_params_map,
      module_expr_map,
    }
  }

  fn collect_array_memory_params_map(sys: &SysBuilder) -> HashMap<BaseNode, MemoryParams> {
    let mut map = HashMap::new();

    for module in sys.module_iter(ModuleKind::Downstream) {
      for attr in module.get_attrs() {
        if let module::Attribute::MemoryParams(mem) = attr {
          if module.is_downstream() {
            for (interf, _) in module.ext_interf_iter() {
              if interf.get_kind() == NodeKind::Array {
                let array_ref = interf.as_ref::<Array>(sys).unwrap();
                map.insert(array_ref.upcast(), mem.clone());
              }
            }
          }
        }
      }
    }

    map
  }

  fn dump_memory_nodes(&mut self, node: BaseNode, res: &mut String) {
    match node.get_kind() {
      NodeKind::Expr => {
        let expr = node.as_ref::<Expr>(self.sys).unwrap();
        if expr.get_opcode() == Opcode::Load {
          let id = namify(&expr.upcast().to_string(self.sys));
          let ty = expr.dtype();
          res.push_str(&declare_logic(ty, &id));
          res.push_str(&format!("  assign {} = dataout;\n", id));
        } else {
          res.push_str(&self.print_body(node));
        }
      }
      NodeKind::Block => {
        let block = node.as_ref::<Block>(self.sys).unwrap();
        let skip = if let Some(cond) = block.get_condition() {
          self
            .pred_stack
            .push_back(if cond.get_dtype(block.sys).unwrap().get_bits() == 1 {
              dump_ref(self.sys, &cond, true)
            } else {
              format!("(|{})", dump_ref(self.sys, &cond, false))
            });
          1
        } else if let Some(cycle) = block.get_cycle() {
          self
            .pred_stack
            .push_back(format!("(cycle_cnt == {})", cycle));
          1
        } else {
          0
        };
        for elem in block.body_iter().skip(skip) {
          self.dump_memory_nodes(elem, res);
        }
        self.pred_stack.pop_back();
      }
      _ => {
        panic!("Unexpected node kind: {:?}", node.get_kind());
      }
    }
  }

  fn get_pred(&self) -> Option<String> {
    if self.pred_stack.is_empty() {
      None
    } else {
      Some(format!(
        "({})",
        self
          .pred_stack
          .iter()
          .map(|s| s.as_str())
          .collect::<Vec<_>>()
          .join(" && ")
      ))
    }
  }

  fn dump_array(&self, array: &ArrayRef, mem_init_path: Option<&String>) -> String {
    let mut res = String::new();
    let display = utils::DisplayInstance::from_array(array);
    // write enable
    let w = display.field("w");
    // write index
    let widx = display.field("widx");
    // write data
    let d = display.field("d");
    // array buffer
    let q = display.field("q");

    res.push_str(&format!("  /* {} */\n", array));
    let map = &self.array_memory_params_map;

    if map.get(&array.upcast()).is_some() {
      res.push_str(&declare_logic(array.scalar_ty(), &q));
    } else {
      res.push_str(&declare_array("", array, &q, ";"));
    }

    let mut seen = HashSet::new();
    let drivers = array
      .users()
      .iter()
      .filter_map(move |x| {
        let expr = x.as_ref::<Operand>(array.sys).unwrap().get_expr();
        if matches!(expr.get_opcode(), Opcode::Store) {
          Some(expr.get_block().get_module())
        } else {
          None
        }
      })
      .filter(|x| seen.insert(x.get_key()))
      .map(|x| Edge::new(display.clone(), &x.as_ref::<Module>(array.sys).unwrap()))
      .collect::<Vec<_>>();

    let scalar_bits = array.scalar_ty().get_bits();
    let array_size = array.get_size();

    drivers.iter().for_each(|edge| {
      res.push_str(&declare_logic(array.scalar_ty(), &edge.field("d")));
      res.push_str(&declare_logic(DataType::int_ty(1), &edge.field("w")));
      res.push_str(&declare_logic(array.get_idx_type(), &edge.field("widx")));
    });

    if map.get(&array.upcast()).is_some() {
    } else {
      // if w: array[widx] = d;
      // where w is the gathered write enable signal
      // widx/d are 1-hot selected from all the writers
      res.push_str(&declare_logic(array.scalar_ty(), &d));
      res.push_str(&declare_logic(array.get_idx_type(), &widx));
      res.push_str(&declare_logic(DataType::int_ty(1), &w));

      let write_data = select_1h(
        drivers
          .iter()
          .map(|edge| (edge.field("w"), edge.field("d"))),
        scalar_bits,
      );
      res.push_str(&format!("  assign {d} = {};\n", write_data));

      let write_idx = select_1h(
        drivers
          .iter()
          .map(|edge| (edge.field("w"), edge.field("widx"))),
        array.get_idx_type().get_bits(),
      );
      res.push_str(&format!("  assign {widx} = {};\n", write_idx));

      let write_enable = reduce(drivers.iter().map(|edge| edge.field("w")), " | ");
      res.push_str(&format!("  assign {w} = {};\n", write_enable));

      res.push_str("  always_ff @(posedge clk or negedge rst_n)\n");
      // Dump the initializer
      res.push_str("    if (!rst_n)\n");
      if mem_init_path.is_some() {
        // Read from memory initialization file
        res.push_str(&format!("      $readmemh(\"{}\", {q});\n", mem_init_path.unwrap()));
      } else if let Some(initializer) = array.get_initializer() {
        // Read from the hardcoded initializer
        res.push_str("    begin\n");
        for (idx, value) in initializer.iter().enumerate() {
          let elem_init = value.as_ref::<IntImm>(self.sys).unwrap().get_value();
          let slice = format!("{}:{}", (idx + 1) * scalar_bits - 1, idx * scalar_bits);
          res.push_str(&format!("      {q}[{slice}] <= {scalar_bits}'d{elem_init};\n",));
        }
        res.push_str("    end\n");
      } else {
        let init_bits = array.get_flattened_size();
        // Initialize to 0
        res.push_str(&format!("      {q} <= {init_bits}'d0;\n",));
      }
      // Dump the array write
      res.push_str(&format!("    else if ({w}) begin\n\n",));
      res.push_str(&format!("      case ({widx})\n"));
      for i in 0..array_size {
        let slice = format!("{}:{}", (i + 1) * scalar_bits - 1, i * scalar_bits);
        res.push_str(&format!("        {i} : {q}[{slice}] <= {d};\n"));
      }
      res.push_str("        default: ;\n");
      res.push_str("      endcase\n");
      res.push_str("    end\n");
    }

    res
  }

  fn dump_exposed_array(
    &self,
    array: &ArrayRef,
    exposed_kind: &ExposeKind,
    mem_init_path: Option<&String>,
  ) -> String {
    let mut res = String::new();
    let display = utils::DisplayInstance::from_array(array);
    // write enable
    let w = display.field("w");
    // write index
    let widx = display.field("widx");
    // write data
    let d = display.field("d");
    // array buffer
    let q = display.field("q");

    let temp = display.field("temp");
    let i = display.field("exposed_i");
    let i_valid = display.field("exposed_i_valid");

    res.push_str(&format!("  /* {} */\n", array));
    let map = &self.array_memory_params_map;

    if map.get(&array.upcast()).is_some() {
      res.push_str(&declare_logic(array.scalar_ty(), &q));
    } else {
      res.push_str(&declare_array("", array, &q, ";"));
    }

    let mut seen = HashSet::new();
    let drivers = array
      .users()
      .iter()
      .filter_map(move |x| {
        let expr = x.as_ref::<Operand>(array.sys).unwrap().get_expr();
        if matches!(expr.get_opcode(), Opcode::Store) {
          Some(expr.get_block().get_module())
        } else {
          None
        }
      })
      .filter(|x| seen.insert(x.get_key()))
      .map(|x| Edge::new(display.clone(), &x.as_ref::<Module>(array.sys).unwrap()))
      .collect::<Vec<_>>();

    let scalar_bits = array.scalar_ty().get_bits();
    let array_size = array.get_size();

    drivers.iter().for_each(|edge| {
      res.push_str(&declare_logic(array.scalar_ty(), &edge.field("d")));
      res.push_str(&declare_logic(DataType::int_ty(1), &edge.field("w")));
      res.push_str(&declare_logic(array.get_idx_type(), &edge.field("widx")));
    });

    if (*exposed_kind == ExposeKind::Output) || (*exposed_kind == ExposeKind::Inout) {
      let o = display.field("exposed_o");
      res.push_str(&format!("  assign {o} = {q};\n"));
    }
    if (*exposed_kind == ExposeKind::Input) || (*exposed_kind == ExposeKind::Inout) {
      res.push_str(&declare_logic(array.scalar_ty(), &temp));
      res.push_str(&format!("  assign {temp} = {i_valid}?{i}:{d};\n"));
    }

    if map.get(&array.upcast()).is_some() {
    } else {
      // if w: array[widx] = d;
      // where w is the gathered write enable signal
      // widx/d are 1-hot selected from all the writers
      res.push_str(&declare_logic(array.scalar_ty(), &d));
      res.push_str(&declare_logic(array.get_idx_type(), &widx));
      res.push_str(&declare_logic(DataType::int_ty(1), &w));

      let write_data = select_1h(
        drivers
          .iter()
          .map(|edge| (edge.field("w"), edge.field("d"))),
        scalar_bits,
      );
      res.push_str(&format!("  assign {d} = {};\n", write_data));

      let write_idx = select_1h(
        drivers
          .iter()
          .map(|edge| (edge.field("w"), edge.field("widx"))),
        array.get_idx_type().get_bits(),
      );
      res.push_str(&format!("  assign {widx} = {};\n", write_idx));

      let write_enable = reduce(drivers.iter().map(|edge| edge.field("w")), " | ");
      res.push_str(&format!("  assign {w} = {};\n", write_enable));

      res.push_str("  always_ff @(posedge clk or negedge rst_n)\n");
      // Dump the initializer
      res.push_str("    if (!rst_n)\n");
      if mem_init_path.is_some() {
        // Read from memory initialization file
        res.push_str(&format!("      $readmemh(\"{}\", {q});\n", mem_init_path.unwrap()));
      } else if let Some(initializer) = array.get_initializer() {
        // Read from the hardcoded initializer
        res.push_str("    begin\n");
        for (idx, value) in initializer.iter().enumerate() {
          let elem_init = value.as_ref::<IntImm>(self.sys).unwrap().get_value();
          let slice = format!("{}:{}", (idx + 1) * scalar_bits - 1, idx * scalar_bits);
          res.push_str(&format!("      {q}[{slice}] <= {scalar_bits}'d{elem_init};\n",));
        }
        res.push_str("    end\n");
      } else {
        let init_bits = array.get_flattened_size();
        // Initialize to 0
        res.push_str(&format!("      {q} <= {init_bits}'d0;\n",));
      }
      // Dump the array write
      res.push_str(&format!("    else if ({w}) begin\n\n",));
      res.push_str(&format!("      case ({widx})\n"));
      if (*exposed_kind == ExposeKind::Input) || (*exposed_kind == ExposeKind::Inout) {
        for i in 0..array_size {
          let slice = format!("{}:{}", (i + 1) * scalar_bits - 1, i * scalar_bits);
          res.push_str(&format!("        {i} : {q}[{slice}] <= {temp};\n"));
        }
      } else {
        for i in 0..array_size {
          let slice = format!("{}:{}", (i + 1) * scalar_bits - 1, i * scalar_bits);
          res.push_str(&format!("        {i} : {q}[{slice}] <= {d};\n"));
        }
      }

      res.push_str("        default: ;\n");
      res.push_str("      endcase\n");
      res.push_str("    end\n");
    }

    res
  }

  fn dump_fifo(&self, fifo: &FIFORef) -> String {
    let mut res = String::new();
    let display = utils::DisplayInstance::from_fifo(fifo, true);
    let fifo_name = namify(&format!("{}_{}", fifo.get_module().get_name(), fifo_name!(fifo)));
    let fifo_width = fifo.scalar_ty().get_bits();
    let fifo_depth = fifo
      .users()
      .iter()
      .find_map(|node| {
        node
          .as_ref::<Operand>(self.sys)
          .ok()
          .and_then(|op| op.get_user().as_expr::<FIFOPush>(self.sys).ok())
      })
      .and_then(|push| {
        push.get().metadata_iter().next().map(|m| {
          let Metadata::FIFODepth(depth) = m;
          *depth
        })
      })
      .unwrap_or(self.config.fifo_depth)
      .next_power_of_two();

    res.push_str(&format!("  // fifo: {}, depth: {}\n", fifo, fifo_depth));

    let push_valid = display.field("push_valid"); // If external pushers have data to push
    let push_data = display.field("push_data"); // Data to be pushed
    let pop_ready = display.field("pop_ready"); // If the FIFO pops data
    let push_ready = display.field("push_ready"); // If the FIFO is ready to accept data
    let pop_valid = display.field("pop_valid"); // If the popped data is valid
    let pop_data = display.field("pop_data"); // Popped data

    let edges = fifo
      .users()
      .iter()
      .filter_map(|x| {
        x.as_ref::<Operand>(self.sys)
          .unwrap()
          .get_user()
          .as_expr::<FIFOPush>(self.sys)
          .ok()
          .map(|y| y.get().get_block().get_module())
      })
      .collect::<HashSet<_>>()
      .iter()
      .map(|x| Edge::new(display.clone(), &x.as_ref::<Module>(self.sys).unwrap()))
      .collect::<Vec<_>>();

    res.push_str("  // Declare the pop.{data/valid/ready}\n");
    res.push_str(&declare_logic(fifo.scalar_ty(), &pop_data));
    res.push_str(&declare_logic(bool_ty(), &pop_valid));
    res.push_str(&declare_logic(bool_ty(), &pop_ready));

    edges.iter().for_each(|edge| {
      res.push_str(&declare_logic(fifo.scalar_ty(), &edge.field("push_data")));
      res.push_str(&declare_logic(bool_ty(), &edge.field("push_valid")));
      res.push_str(&declare_logic(bool_ty(), &edge.field("push_ready")));
    });

    res.push_str("  // Broadcast the push_ready signal to all the pushers\n");
    res.push_str(&format!("  logic {push_ready};\n"));
    edges
      .iter()
      .for_each(|x| res.push_str(&format!("  assign {} = {push_ready};", x.field("push_ready"))));

    res.push_str("  // Gather all the push signal\n");
    let valid = reduce(edges.iter().map(|x| x.field("push_valid")), " | ");
    res.push_str(&declare_logic(DataType::int_ty(1), &push_valid));
    res.push_str(&format!("  assign {} = {};\n", push_valid, valid));

    res.push_str("  // 1-hot select the push data\n");
    let data = select_1h(
      edges
        .iter()
        .map(|x| (x.field("push_valid"), x.field("push_data"))),
      fifo_width,
    );
    res.push_str(&declare_logic(fifo.scalar_ty(), &push_data));
    res.push_str(&format!("  assign {push_data} = {data};\n"));

    let log2_depth = fifo_depth.trailing_zeros();
    // Instantiate the FIFO
    res.push_str(&format!(
      "
  fifo #({fifo_width}, {log2_depth}) fifo_{fifo_name}_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid({push_valid}),
    .push_data({push_data}),
    .push_ready({push_ready}),
    .pop_valid({pop_valid}),
    .pop_data({pop_data}),
    .pop_ready({pop_ready}));\n\n"
    ));

    res
  }

  /// Dump the trigger event state machine's instantiation.
  fn dump_trigger(&self, module: &ModuleRef) -> String {
    let mut res = String::new();
    let module_name = namify(module.get_name());
    let display = utils::DisplayInstance::from_module(module);
    res.push_str(&format!("  // Trigger SM of Module: {}\n", module.get_name()));
    let delta_value = display.field("counter_delta");
    let pop_ready = display.field("counter_pop_ready");
    let pop_valid = display.field("counter_pop_valid");
    let delta_ready = display.field("counter_delta_ready");

    let callers = module
      .callers()
      .map(|x| Edge::new(display.clone(), &x))
      .collect::<Vec<_>>();

    if module_name != "driver" && module_name != "testbench" {
      callers.iter().for_each(|edge| {
        res.push_str(&declare_logic(
          DataType::int_ty(8 /*FIXME(@were): Do not hardcode*/),
          &edge.field("counter_delta"),
        ));
        res.push_str(&declare_logic(bool_ty(), &edge.field("counter_delta_ready")));
      });
    }
    res.push_str(&declare_logic(bool_ty(), &delta_ready));
    res.push_str(&declare_logic(
      DataType::int_ty(8 /*FIXME(@were): Do not hardcode*/),
      &delta_value,
    ));

    res.push_str("  // Gather all the push signal\n");
    if module_name != "driver" && module_name != "testbench" {
      res.push_str(&format!(
        "  assign {delta_value} = {};\n",
        reduce(callers.iter().map(|x| x.field("counter_delta")), " + ")
      ));
    }
    res.push_str("  // Broadcast the push_ready signal to all the pushers\n");
    res.push_str(&declare_logic(bool_ty(), &pop_ready));
    if module_name != "driver" && module_name != "testbench" {
      callers.iter().for_each(|x| {
        res.push_str(&format!("  assign {} = {};\n", x.field("counter_delta_ready"), pop_ready));
      });
    }
    res.push_str(&declare_logic(bool_ty(), &pop_valid));
    res.push_str(&format!(
      "
  trigger_counter #(8) {}_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta({delta_value}),
    .delta_ready({delta_ready}),
    .pop_valid({pop_valid}),
    .pop_ready({pop_ready}));\n",
      module_name
    ));
    res
  }

  fn dump_module_instance(&self, module: &ModuleRef) -> String {
    let mut res = String::new();
    let module_name = namify(module.get_name());

    if let Some(out_bounds) = self.external_usage.out_bounds(module) {
      for elem in out_bounds {
        let id = namify(&elem.to_string(module.sys));
        let ty = elem.get_dtype(module.sys).unwrap();
        res.push_str(&declare_logic(ty, &format!("logic_{}", id)));
        res.push_str(&declare_logic(bool_ty(), &format!("logic_{}_valid", id)));
      }
    }
    let mut is_memory_instance = false;
    res.push_str(&declare_logic(bool_ty(), &format!("{}_executed", module_name)));

    res.push_str(&format!(
      "
  // {module}
  {module} {module}_i (
    .clk(clk),
    .rst_n(rst_n),
",
      module = module_name
    ));
    for port in module.fifo_iter() {
      let local = utils::DisplayInstance::from_fifo(&port, false);
      let global = utils::DisplayInstance::from_fifo(&port, true);
      res.push_str(&connect_top(&local, &global, &["pop_ready", "pop_data", "pop_valid"]));
    }
    for (interf, ops) in module.ext_interf_iter() {
      match interf.get_kind() {
        NodeKind::FIFO => {
          let fifo = interf.as_ref::<FIFO>(self.sys).unwrap();
          let fifo = utils::DisplayInstance::from_fifo(&fifo, true);
          let edge = Edge::new(fifo.clone(), module);
          res.push_str(&connect_top(&fifo, &edge, &["push_valid", "push_data", "push_ready"]));
        }
        NodeKind::Array => {
          let array_ref = interf.as_ref::<Array>(self.sys).unwrap();
          let display = utils::DisplayInstance::from_array(&array_ref);
          let edge = Edge::new(display.clone(), module);

          for attr in module.get_attrs() {
            if let module::Attribute::MemoryParams(_) = attr {
              if module.is_downstream() {
                is_memory_instance = true;
              }
            }
          }
          if is_memory_instance {
          } else {
            if self.sys.user_contains_opcode(ops, Opcode::Load) {
              res.push_str(&format!("    .{q}({q}),\n", q = display.field("q"),));
            }
            if self.sys.user_contains_opcode(ops, Opcode::Store) {
              res.push_str(&connect_top(&display, &edge, &["w", "widx", "d"]));
            }
          }
        }
        NodeKind::Module => {
          let interf = interf.as_ref::<Module>(self.sys).unwrap();
          let display = utils::DisplayInstance::from_module(&interf);
          let edge = Edge::new(display.clone(), module);
          res.push_str(&connect_top(&display, &edge, &["counter_delta_ready", "counter_delta"]));
        }
        NodeKind::Expr => {
          // This is handled below, since we need a deduplication for the modules to which these
          // expressions belong.
        }
        _ => panic!("Unknown interf kind {:?}", interf.get_kind()),
      }
    }

    if module.is_downstream() {
      res.push_str("    // Upstream executed signals\n");
      upstreams(module, &self.topo).iter().for_each(|x| {
        let name = namify(x.as_ref::<Module>(module.sys).unwrap().get_name());
        res.push_str(&format!("    .{}_executed({}_executed),\n", name, name));
      });
    }

    if let Some(out_bounds) = self.external_usage.out_bounds(module) {
      for elem in out_bounds {
        let id = namify(&elem.to_string(module.sys));
        // Put a "external_" prefix to avoid name collision with the original combinational logic.
        res.push_str(&format!("    .expose_{id}(logic_{id}),\n"));
        res.push_str(&format!("    .expose_{id}_valid(logic_{id}_valid),\n"));
      }
    }

    if let Some(in_bounds) = self.external_usage.in_bounds(module) {
      for elem in in_bounds {
        let id = namify(&elem.to_string(module.sys));
        // Use the original name to avoid re-naming the external signals.
        res.push_str(&format!("    .{id}(logic_{id}),\n"));
        res.push_str(&format!("    .{id}_valid(logic_{id}_valid),\n"));
      }
    }

    if let Some(exposed_map) = self.module_expr_map.get(&module.upcast()) {
      for (exposed_node, kind) in exposed_map {
        if exposed_node.get_kind() == NodeKind::Expr {
          let expr = exposed_node.as_ref::<Expr>(self.sys).unwrap();
          let id = namify(&expr.upcast().to_string(self.sys));
          if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
            res.push_str(&format!("    .{a}_exposed_o({a}_exposed_o),\n", a = id));
          }
          if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
            res.push_str(&format!("    .{a}_exposed_i({a}_exposed_i),\n", a = id));
            res.push_str(&format!("    .{a}_exposed_i_valid({a}_exposed_i_valid),\n", a = id));
          }
        }
      }
    }

    if !module.is_downstream() {
      let display = utils::DisplayInstance::from_module(module);
      res.push_str(&format!(
        "    .counter_delta_ready({}),\n",
        display.field("counter_delta_ready")
      ));
      res.push_str(&format!("    .counter_pop_ready({}),\n", display.field("counter_pop_ready")));
      res.push_str(&format!("    .counter_pop_valid({}),\n", display.field("counter_pop_valid")));
    }
    res.push_str(&format!("    .expose_executed({}_executed));\n", module_name));
    res
  }

  fn dump_runtime(
    self: VerilogDumper<'a, 'b>,
    mut fd: File,
    sim_threshold: usize,
  ) -> Result<(), Error> {
    // runtime
    let mut res = String::new();

    res.push_str("module top(\n");

    for (exposed_node, kind) in self.sys.exposed_nodes() {
      if exposed_node.get_kind() == NodeKind::Array {
        let exposed_nodes_ref = exposed_node.as_ref::<Array>(self.sys).unwrap();
        let display = utils::DisplayInstance::from_array(&exposed_nodes_ref);
        if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
          let o = display.field("exposed_o");
          res.push_str(&declare_array("output", &exposed_nodes_ref, &o, ","));
        }
        if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
          res.push_str(&declare_in(exposed_nodes_ref.scalar_ty(), &display.field("exposed_i")));
          res.push_str(&declare_in(bool_ty(), &display.field("exposed_i_valid")));
        }
      }
      if exposed_node.get_kind() == NodeKind::Expr {
        let expr = exposed_node.as_ref::<Expr>(self.sys).unwrap();
        let id = namify(&expr.upcast().to_string(self.sys));
        let dtype = exposed_node.get_dtype(self.sys).unwrap();
        let bits = dtype.get_bits() - 1;
        if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
          res.push_str(&format!("  output logic [{bits}:0] {a}_exposed_o,\n", bits = bits, a = id));
        }
        if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
          res.push_str(&format!("  input logic [{bits}:0] {a}_exposed_i,\n", bits = bits, a = id));
          res.push_str(&format!("  input logic {a}_exposed_i_valid,\n", a = id));
        }
      }
    }

    res.push_str(
      "
  input logic clk,
  input logic rst_n
);\n\n",
    );

    // memory initializations mapS
    // FIXME(@were): Fix the memory initialization.
    let mut mem_init_map: HashMap<BaseNode, String> = HashMap::new();

    // array -> init_file_path
    for m in self.sys.module_iter(ModuleKind::Downstream) {
      for attr in m.get_attrs() {
        if let module::Attribute::MemoryParams(mp) = attr {
          if let Some(init_file) = &mp.init_file {
            let mut init_file_path = self.config.resource_base.clone();
            init_file_path.push(init_file);
            let init_file_path = init_file_path.to_str().unwrap();
            mem_init_map.insert(mp.pins.array, init_file_path.to_string());
          }
        }
      }
    }
    for (key, value) in &mem_init_map {
      res.push_str(&format!("//Array: {}, Init File Path: {}\n", key.to_string(self.sys), value));
    }

    let exposed_map: HashMap<_, _> = self.sys.exposed_nodes().collect();

    // array storage element definitions
    for array in self.sys.array_iter() {
      if let Some(kind) = exposed_map.get(&array.upcast()) {
        res.push_str(&self.dump_exposed_array(&array, kind, mem_init_map.get(&array.upcast())));
      } else {
        res.push_str(&self.dump_array(&array, mem_init_map.get(&array.upcast())));
      }
    }

    // fifo storage element definitions
    for module in self.sys.module_iter(ModuleKind::Module) {
      for fifo in module.fifo_iter() {
        res.push_str(&self.dump_fifo(&fifo));
      }
    }

    // trigger fifo definitions
    for module in self.sys.module_iter(ModuleKind::Module) {
      res.push_str(&self.dump_trigger(&module));
    }

    // FIXME(@were): Do not hardcode the counter delta width.
    if self.sys.has_testbench() {
      res.push_str("  assign testbench_counter_delta = 8'b1;\n\n");
    }
    if self.sys.has_driver() {
      res.push_str("  assign driver_counter_delta = 8'b1;\n\n");
    }

    // module instances
    for module in self.sys.module_iter(ModuleKind::Module) {
      res.push_str(&self.dump_module_instance(&module));
    }

    // downstream instances
    for module in self.sys.module_iter(ModuleKind::Downstream) {
      res.push_str(&self.dump_module_instance(&module));
    }

    res.push_str("endmodule // top\n\n");

    fd.write_all(res.as_bytes()).unwrap();

    let init = match self.config.verilog {
      Simulator::VCS => {
        "
initial begin
  $fsdbDumpfile(\"wave.fsdb\");
  $fsdbDumpvars();
  $fsdbDumpMDA();
end"
      }
      Simulator::Verilator => "",
      Simulator::None => panic!("No simulator specified"),
    };

    fd.write_all(include_str!("./runtime.sv").as_bytes())
      .unwrap();

    let threashold = (sim_threshold + 1) * 100;
    fd.write_all(
      "
module tb;

logic clk;
logic rst_n;
"
      .to_string()
      .as_bytes(),
    )?;

    for (exposed_node, kind) in self.sys.exposed_nodes() {
      if exposed_node.get_kind() == NodeKind::Array {
        let array_ref = exposed_node.as_ref::<Array>(self.sys).unwrap();
        let display = utils::DisplayInstance::from_array(&array_ref);
        let bits = array_ref.scalar_ty().get_bits();
        let bits_1 = bits - 1;
        let flatten_bits_1 = array_ref.get_flattened_size() - 1;
        if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
          let o = display.field("exposed_o");
          fd.write_all(format!("logic [{flatten_bits_1}:0]{o};\n",).as_bytes())?;
        }
        if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
          let i = display.field("exposed_i");
          let i_valid = display.field("exposed_i_valid");
          fd.write_all(format!("logic [{bits_1}:0]{i};\n",).as_bytes())?;
          fd.write_all(format!("logic {i_valid};\n",).as_bytes())?;
          fd.write_all(format!("\nassign {i_valid} = 1'd0;\n",).as_bytes())?;
          fd.write_all(format!("assign {i} = {bits}'d0;\n",).as_bytes())?;
        }
      }
      if exposed_node.get_kind() == NodeKind::Expr {
        let expr = exposed_node.as_ref::<Expr>(self.sys).unwrap();
        let id = namify(&expr.upcast().to_string(self.sys));
        let dtype = exposed_node.get_dtype(self.sys).unwrap();
        let bits = dtype.get_bits();
        let bits_1 = bits - 1;
        if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
          fd.write_all(format!("logic [{bits_1}:0] {id}_exposed_o;\n",).as_bytes())?;
        }
        if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
          fd.write_all(format!("logic [{bits_1}:0] {id}_exposed_i;\n",).as_bytes())?;
          fd.write_all(format!("logic {id}_exposed_i_valid;\n",).as_bytes())?;
          fd.write_all(format!("\nassign {id}_exposed_i_valid = 1'd0;\n",).as_bytes())?;
          fd.write_all(format!("assign {id}_exposed_i = {bits}'d0;\n",).as_bytes())?;
        }
      }
    }

    fd.write_all(
      format!(
        "
initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #{threashold};
  `ifndef SYNTHESIS
  $finish();
  `endif
end

always #50 clk <= !clk;

{init}

top top_i (
  .clk(clk),
  .rst_n(rst_n)"
      )
      .as_bytes(),
    )?;

    for (exposed_node, kind) in self.sys.exposed_nodes() {
      if exposed_node.get_kind() == NodeKind::Array {
        let exposed_nodes_ref = exposed_node.as_ref::<Array>(self.sys).unwrap();
        let display = utils::DisplayInstance::from_array(&exposed_nodes_ref);
        if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
          let o = display.field("exposed_o");
          fd.write_all(format!(",\n  .{o}({o})").as_bytes())?;
        }
        if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
          let i = display.field("exposed_i");
          let i_valid = display.field("exposed_i_valid");
          fd.write_all(format!(",\n  .{i}({i}),\n  .{i_valid}({i_valid})",).as_bytes())?;
        }
      }
      if exposed_node.get_kind() == NodeKind::Expr {
        let expr = exposed_node.as_ref::<Expr>(self.sys).unwrap();
        let id = namify(&expr.upcast().to_string(self.sys));
        if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
          fd.write_all(format!(",\n  .{id}_exposed_o({id}_exposed_o)",).as_bytes())?;
        }
        if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
          fd.write_all(format!(",\n  .{id}_exposed_i({id}_exposed_i)",).as_bytes())?;
          fd.write_all(format!(",\n  .{id}_exposed_i_valid({id}_exposed_i_valid)",).as_bytes())?;
        }
      }
    }

    fd.write_all(
      "
);

endmodule
"
      .to_string()
      .as_bytes(),
    )?;

    Ok(())
  }
}

fn node_dump_ref(
  sys: &SysBuilder,
  node: &BaseNode,
  _: Vec<NodeKind>,
  immwidth: bool,
  signed: bool,
) -> Option<String> {
  match node.get_kind() {
    NodeKind::Array => {
      let array = node.as_ref::<Array>(sys).unwrap();
      namify(array.get_name()).into()
    }
    NodeKind::FIFO => namify(node.as_ref::<FIFO>(sys).unwrap().get_name()).into(),
    NodeKind::IntImm => {
      let int_imm = node.as_ref::<IntImm>(sys).unwrap();
      let dbits = int_imm.dtype().get_bits();
      let value = int_imm.get_value();
      if immwidth {
        Some(format!("{}'d{}", dbits, value))
      } else {
        Some(format!("{}", value))
      }
    }
    NodeKind::StrImm => {
      let str_imm = node.as_ref::<StrImm>(sys).unwrap();
      let value = str_imm.get_value();
      quote::quote!(#value).to_string().into()
    }
    NodeKind::Expr => {
      let dtype = node.get_dtype(sys).unwrap();
      let raw = namify(&node.to_string(sys));
      let res = match dtype {
        DataType::Int(_) => {
          if signed {
            format!("$signed({})", raw)
          } else {
            raw
          }
        }
        _ => raw,
      };
      Some(res)
    }
    _ => panic!("Unknown node of kind {:?}", node.get_kind()),
  }
}

fn dump_ref(sys: &SysBuilder, value: &BaseNode, with_imm_width: bool) -> String {
  node_dump_ref(sys, value, vec![], with_imm_width, false).unwrap()
}

/// This is a legacy hack helper function to dump the arithmetic expressions.
/// Verilog-2001 does not support $signed(x)[slice] syntax. So we avoid using
/// $signed(x[slice]) in most of the code.
fn dump_arith_ref(sys: &SysBuilder, value: &BaseNode) -> String {
  node_dump_ref(sys, value, vec![], true, true).unwrap()
}

impl VerilogDumper<'_, '_> {
  fn print_body(&mut self, node: BaseNode) -> String {
    match node.get_kind() {
      NodeKind::Expr => {
        let expr = node.as_ref::<Expr>(self.sys).unwrap();
        self.visit_expr(expr).unwrap()
      }
      NodeKind::Block => {
        let block = node.as_ref::<Block>(self.sys).unwrap();
        self.visit_block(block).unwrap()
      }
      _ => {
        panic!("Unexpected reference type: {:?}", node);
      }
    }
  }
}

impl Visitor<String> for VerilogDumper<'_, '_> {
  // Dump the implentation of each module.
  fn visit_module(&mut self, module: ModuleRef<'_>) -> Option<String> {
    self.current_module = namify(module.get_name()).to_string();

    let mut res = String::new();

    res.push_str(&format!(
      "
module {} (
  input logic clk,
  input logic rst_n,
",
      self.current_module
    ));

    for port in module.fifo_iter() {
      let name = fifo_name!(port);
      let ty = port.scalar_ty();
      let display = utils::DisplayInstance::from_fifo(&port, false);
      // (pop_valid, pop_data): something like `let front : Optional<T> = FIFO.pop();`.
      // `pop_ready: when enabled, it is something like fifo.pop()
      res.push_str(&format!("  // Port FIFO {name}\n", name = name));
      res.push_str(&declare_in(bool_ty(), &display.field("pop_valid")));
      res.push_str(&declare_in(ty, &display.field("pop_data")));
      res.push_str(&declare_out(bool_ty(), &display.field("pop_ready")));
    }

    let mut has_memory_params = false;
    let mut has_memory_init_path = false;
    let empty_pins = MemoryPins::new(
      BaseNode::unknown(), // array
      BaseNode::unknown(), // re
      BaseNode::unknown(), // we
      BaseNode::unknown(), // addr
      BaseNode::unknown(), // wdata
    );

    let mut memory_params = MemoryParams::new(
      0,          // width
      0,          // depth
      0..=0,      // lat
      None,       // init_file
      empty_pins, // 假设 `MemoryPins` 有一个 `new` 方法
    );
    let mut init_file_path = self.config.resource_base.clone();

    for (interf, ops) in module.ext_interf_iter() {
      match interf.get_kind() {
        NodeKind::FIFO => {
          let fifo = interf.as_ref::<FIFO>(self.sys).unwrap();
          let parent_name = fifo.get_module().get_name().to_string();
          let display = utils::DisplayInstance::from_fifo(&fifo, true);
          // TODO(@were): Support `push_ready` for backpressures.
          // (push_valid, push_data, push_ready) works like
          // `if push_valid && push_ready: FIFO.push()`
          res.push_str(&format!("  // External FIFO {}.{}\n", parent_name, fifo.get_name()));
          res.push_str(&declare_out(bool_ty(), &display.field("push_valid")));
          res.push_str(&declare_out(fifo.scalar_ty(), &display.field("push_data")));
          res.push_str(&declare_in(bool_ty(), &display.field("push_ready")));
        }
        NodeKind::Array => {
          let array = interf.as_ref::<Array>(self.sys).unwrap();
          let display = utils::DisplayInstance::from_array(&array);
          res.push_str(&format!("  /* {} */\n", array));

          for attr in module.get_attrs() {
            if let module::Attribute::MemoryParams(mem) = attr {
              has_memory_params = true;
              //memory_params.depth = mem.depth;
              //memory_params.width = mem.width;
              memory_params = mem.clone();
              if let Some(init_file) = &mem.init_file {
                init_file_path.push(init_file);
                let init_file_path = init_file_path.to_str().unwrap();
                res.push_str(&format!("  /* {} */\n", init_file_path));
                has_memory_init_path = true;
              }
            }
          }

          if has_memory_params {
          } else {
            if self.sys.user_contains_opcode(ops, Opcode::Load) {
              res.push_str(&declare_array("input", &array, &display.field("q"), ","));
            }
            // (w, widx, d): something like `array[widx] = d;`
            if self.sys.user_contains_opcode(ops, Opcode::Store) {
              res.push_str(&declare_out(bool_ty(), &display.field("w")));
              res.push_str(&declare_out(array.get_idx_type(), &display.field("widx")));
              res.push_str(&declare_out(array.scalar_ty(), &display.field("d")));
            }
          }
        }
        NodeKind::Module => {
          let module = interf.as_ref::<Module>(self.sys).unwrap();
          let display = utils::DisplayInstance::from_module(&module);
          res.push_str(&format!("  // Module {}\n", module.get_name()));
          // FIXME(@were): Do not hardcode the counter delta width.
          res.push_str(&declare_out(DataType::int_ty(8), &display.field("counter_delta")));
          res.push_str(&declare_in(bool_ty(), &display.field("counter_delta_ready")));
        }
        NodeKind::Expr => {
          // This is handled below, since we need a deduplication for the modules to which these
          // expressions belong.
        }
        _ => panic!("Unknown interf kind {:?}", interf.get_kind()),
      }
      res.push('\n');
    }

    if module.is_downstream() {
      res.push_str("  // Declare upstream executed signals\n");
      upstreams(&module, &self.topo).iter().for_each(|x| {
        let name = namify(x.as_ref::<Module>(module.sys).unwrap().get_name());
        res.push_str(&declare_in(bool_ty(), &format!("{}_executed", name)));
      });
    }

    if let Some(out_bounds) = self.external_usage.out_bounds(&module) {
      for elem in out_bounds {
        let id = namify(&elem.to_string(module.sys));
        let dtype = elem.get_dtype(module.sys).unwrap();
        res.push_str(&declare_out(dtype, &format!("expose_{}", id)));
        res.push_str(&declare_out(bool_ty(), &format!("expose_{}_valid", id)));
      }
    }

    if let Some(in_bounds) = self.external_usage.in_bounds(&module) {
      for elem in in_bounds {
        let id = namify(&elem.to_string(module.sys));
        let dtype = elem.get_dtype(module.sys).unwrap();
        res.push_str(&declare_in(dtype, &id));
        res.push_str(&declare_in(bool_ty(), &format!("{}_valid", id)));
      }
    }

    if let Some(exposed_map) = self.module_expr_map.get(&module.upcast()) {
      for (exposed_node, kind) in exposed_map {
        if exposed_node.get_kind() == NodeKind::Expr {
          let expr = exposed_node.as_ref::<Expr>(self.sys).unwrap();
          let id = namify(&expr.upcast().to_string(self.sys));
          let dtype = exposed_node.get_dtype(self.sys).unwrap();
          let bits = dtype.get_bits() - 1;
          if (*kind == ExposeKind::Output) || (*kind == ExposeKind::Inout) {
            res.push_str(&format!(
              "  output logic [{bits}:0] {a}_exposed_o,\n",
              bits = bits,
              a = id
            ));
          }
          if (*kind == ExposeKind::Input) || (*kind == ExposeKind::Inout) {
            res.push_str(&format!(
              "  input logic [{bits}:0] {a}_exposed_i,\n",
              bits = bits,
              a = id
            ));
            res.push_str(&format!("  input logic {a}_exposed_i_valid,\n", a = id));
          }
        }
      }
    }

    if !module.is_downstream() {
      res.push_str("  // self.event_q\n");
      res.push_str("  input logic counter_pop_valid,\n");
      res.push_str("  input logic counter_delta_ready,\n");
      res.push_str("  output logic counter_pop_ready,\n");
    }

    res.push_str("  output logic expose_executed);\n\n");

    let mut wait_until: String = "".to_string();

    let skip = if let Some(wu_intrin) = module.get_body().get_wait_until() {
      self.before_wait_until = true;
      let mut skip = 0;
      let body = module.get_body();
      let body_iter = body.body_iter();
      for (i, elem) in body_iter.enumerate() {
        if elem == wu_intrin {
          skip = i + 1;
          break;
        }
        res.push_str(&self.print_body(elem));
      }
      let bi = wu_intrin.as_expr::<BlockIntrinsic>(self.sys).unwrap();
      let value = bi.value();
      wait_until = format!(" && ({})", namify(&value?.to_string(self.sys)));
      skip
    } else {
      0
    };
    self.before_wait_until = false;

    res.push_str("  logic executed;\n");

    if self.current_module == "testbench" {
      res.push_str(
        "
  int cycle_cnt;
  always_ff @(posedge clk or negedge rst_n) if (!rst_n) cycle_cnt <= 0;
  else if (executed) cycle_cnt <= cycle_cnt + 1;
",
      );
    }

    self.fifo_pushes.clear();
    self.array_stores.clear();
    self.triggers.clear();
    if has_memory_params {
      res.push_str(&format!("  logic [{b}:0] dataout;\n", b = memory_params.width - 1));
      self.dump_memory_nodes(module.get_body().upcast(), &mut res);
    } else {
      for elem in module.get_body().body_iter().skip(skip) {
        res.push_str(&self.print_body(elem));
      }
    }

    for (m, g) in self.triggers.drain() {
      res.push_str(&format!(
        "  assign {}_counter_delta = executed ? {} : 0;\n\n",
        m,
        if g.is_conditional() {
          g.condition
            .iter()
            .map(|x| format!("{{ {}'b0, |{} }}", g.bits - 1, x))
            .collect::<Vec<_>>()
            .join(" + ")
        } else {
          "1".into()
        }
      ));
    }

    res.push_str("  // Gather FIFO pushes\n");

    for (fifo, g) in self.fifo_pushes.drain() {
      res.push_str(&format!(
        "  assign fifo_{fifo}_push_valid = {cond};
  assign fifo_{fifo}_push_data = {value};\n
",
        cond = g.and("executed", " || "),
        value = g.select_1h()
      ));
    }

    res.push_str("  // Gather Array writes\n");

    if has_memory_params {
      res.push_str("  // this is Mem Array \n");

      for (a, (idx, data)) in &self.array_stores {
        res.push_str(&format!("  logic array_{a}_w;\n", a = a));
        res.push_str(&format!(
          "  logic [{b}:0] array_{a}_d;\n",
          a = a,
          b = memory_params.width - 1
        ));
        res.push_str(&format!(
          "  logic [{b}:0] array_{a}_widx;\n",
          a = a,
          b = (63 - (memory_params.depth - 1).leading_zeros())
        ));

        res.push_str(&format!(
          "  assign array_{a}_w = {cond};
  assign array_{a}_d = {data};
  assign array_{a}_widx = {idx};\n",
          a = a,
          cond = idx.and("executed", " || "),
          idx = idx.value.first().unwrap().clone(),
          data = data.select_1h()
        ));
        res.push_str(&format!(
          "

  memory_blackbox_{a} #(
        .DATA_WIDTH({data_width}),   
        .ADDR_WIDTH({addr_bits})     
    ) memory_blackbox_{a}(
    .clk     (clk), 
    .address (array_{a}_widx), 
    .wd      (array_{a}_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_{a}_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          \n",
          data_width = memory_params.width,
          addr_bits = (63 - (memory_params.depth).leading_zeros()),
          a = a
        ));
      }
    } else {
      for (a, (idx, data)) in self.array_stores.drain() {
        res.push_str(&format!(
          "  assign array_{a}_w = {cond};
    assign array_{a}_d = {data};
    assign array_{a}_widx = {idx};\n
  ",
          a = a,
          cond = idx.and("executed", " || "),
          idx = idx.select_1h(),
          data = data.select_1h()
        ));
      }
    }

    if !module.is_downstream() {
      res.push_str(&format!("  assign executed = counter_pop_valid{};\n", wait_until));
      res.push_str("  assign counter_pop_ready = executed;\n");
    } else {
      let upstream_exec = upstreams(&module, &self.topo)
        .iter()
        .map(|x| format!("{}_executed", namify(x.as_ref::<Module>(module.sys).unwrap().get_name())))
        .collect::<Vec<_>>();
      res.push_str(&format!("  assign executed = {};\n", upstream_exec.join(" || ")));
    }

    res.push_str("  assign expose_executed = executed;\n");

    res.push_str(&format!("endmodule // {}\n\n", self.current_module));

    if has_memory_params {
      for (a, (_, _)) in self.array_stores.drain() {
        res.push_str(&format!(
          r#"

`ifdef SYNTHESIS
(* blackbox *)
`endif
module memory_blackbox_{a} #(
    parameter DATA_WIDTH = {data_width},   
    parameter ADDR_WIDTH = {addr_bits}     
)(
    input clk,
    input [ADDR_WIDTH-1:0] address,        
    input [DATA_WIDTH-1:0] wd,             
    input banksel,                         
    input read,                            
    input write,                           
    output reg [DATA_WIDTH-1:0] dataout,   
    input rst_n                            
);

    localparam DEPTH = 1 << ADDR_WIDTH;
    reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];

  "#,
          a = a,
          data_width = memory_params.width,
          addr_bits = (63 - (memory_params.depth).leading_zeros())
        ));
        if has_memory_init_path {
          res.push_str(&format!(
            r#"  initial begin
          $readmemh({:?}, mem);
      end
        always @ (posedge clk) begin
            if (write & banksel) begin
                mem[address] <= wd;
            end
        end
    
        assign dataout = (read & banksel) ? mem[address] : {{DATA_WIDTH{{1'b0}}}};
    
    endmodule
              "#,
            init_file_path
          ))
        } else {
          res.push_str(
            r#"
    
        always @ (posedge clk) begin
            if (!rst_n) begin
                mem[address] <= {{DATA_WIDTH{{1'b0}}}};
            end
            else if (write & banksel) begin
                mem[address] <= wd;
            end
        end
    
        assign dataout = (read & banksel) ? mem[address] : {{DATA_WIDTH{{1'b0}}}};
    
    endmodule
              "#,
          );
        }
      }
    }

    Some(res)
  }

  fn visit_block(&mut self, block: BlockRef<'_>) -> Option<String> {
    let mut res = String::new();
    let skip = if let Some(cond) = block.get_condition() {
      self
        .pred_stack
        .push_back(if cond.get_dtype(block.sys).unwrap().get_bits() == 1 {
          dump_ref(self.sys, &cond, true)
        } else {
          format!("(|{})", dump_ref(self.sys, &cond, false))
        });
      1
    } else if let Some(cycle) = block.get_cycle() {
      self
        .pred_stack
        .push_back(format!("(cycle_cnt == {})", cycle));
      1
    } else {
      0
    };
    for elem in block.body_iter().skip(skip) {
      match elem.get_kind() {
        NodeKind::Expr => {
          let expr = elem.as_ref::<Expr>(self.sys).unwrap();
          res.push_str(&self.visit_expr(expr).unwrap());
        }
        NodeKind::Block => {
          let block = elem.as_ref::<Block>(self.sys).unwrap();
          res.push_str(&self.visit_block(block).unwrap());
        }
        _ => {
          panic!("Unexpected reference type: {:?}", elem);
        }
      }
    }
    self.pred_stack.pop_back();
    res.into()
  }

  fn visit_expr(&mut self, expr: ExprRef<'_>) -> Option<String> {
    // If an expression is externally used by another downstream module,
    // we need to generate the corresponding assignment logic here.
    let (decl, expose) =
      if expr.get_opcode().is_valued() && !matches!(expr.get_opcode(), Opcode::Bind) {
        let id = namify(&expr.upcast().to_string(self.sys));
        let expose = if self.external_usage.is_externally_used(&expr) {
          format!(
            "  assign expose_{id} = {id};\n  assign expose_{id}_valid = executed && {};\n",
            self.get_pred().unwrap_or("1".to_string())
          )
        } else {
          "".into()
        };
        (Some((id, expr.dtype())), expose)
      } else {
        (None, "".into())
      };

    let exposed_map: HashMap<_, _> = self.sys.exposed_nodes().collect();
    let expr_clone = expr.clone();
    let expose_out_str = if let Some(exposed_kind) = exposed_map.get(&expr.upcast()) {
      let id = namify(&expr.upcast().to_string(self.sys));
      if (**exposed_kind == ExposeKind::Output) || (**exposed_kind == ExposeKind::Inout) {
        format!("  assign {id}_exposed_o = {id};\n")
      } else {
        "".into()
      }
    } else {
      "".into()
    };

    let mut is_pop = None;

    let body = match expr.get_opcode() {
      Opcode::Binary { binop } => {
        let dtype = expr.dtype();
        let bin = expr.as_sub::<instructions::Binary>().unwrap();
        format!(
          "{} {} {}",
          dump_arith_ref(self.sys, &bin.a()),
          if matches!(binop, subcode::Binary::Shr) {
            if dtype.is_signed() {
              ">>>".into()
            } else {
              ">>".into()
            }
          } else {
            binop.to_string()
          },
          dump_arith_ref(self.sys, &bin.b())
        )
      }

      Opcode::Unary { ref uop } => {
        let dump = match uop {
          subcode::Unary::Flip => "~",
          subcode::Unary::Neg => "-",
        };
        let uop = expr.as_sub::<instructions::Unary>().unwrap();
        format!("{}{}", dump, dump_arith_ref(self.sys, &uop.x()))
      }

      Opcode::Compare { .. } => {
        let cmp = expr.as_sub::<instructions::Compare>().unwrap();
        format!(
          "{} {} {}",
          dump_arith_ref(self.sys, &cmp.a()),
          cmp.get_opcode(),
          dump_arith_ref(self.sys, &cmp.b())
        )
      }

      Opcode::FIFOPop => {
        let pop = expr.as_sub::<instructions::FIFOPop>().unwrap();
        let fifo = pop.fifo();
        let display = utils::DisplayInstance::from_fifo(&fifo, false);
        is_pop = format!(
          "  assign {} = executed{};",
          display.field("pop_ready"),
          self
            .get_pred()
            .map(|p| format!(" && {}", p))
            .unwrap_or("".to_string())
        )
        .into();
        display.field("pop_data")
      }

      Opcode::Log => {
        let mut res = String::new();

        res.push_str(&format!(
          "  always_ff @(posedge clk) if ({}{})",
          if self.before_wait_until {
            "1'b1"
          } else {
            "executed"
          },
          self
            .get_pred()
            .map(|p| format!(" && {}", p))
            .unwrap_or("".to_string())
        ));

        let args = expr
          .operand_iter()
          .map(|elem| *elem.get_value())
          .collect::<Vec<_>>();

        let format_str = utils::parse_format_string(args, expr.sys);

        res.push_str(&format!("$display(\"%t\\t[{}]\\t\\t", self.current_module));
        res.push_str(&format_str);
        res.push_str(
          "\",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, ",
        );
        for elem in expr.operand_iter().skip(1) {
          res.push_str(&format!("{}, ", dump_ref(self.sys, elem.get_value(), false)));
        }
        res.pop();
        res.pop();
        res.push_str(");\n");
        res.push('\n');
        res
      }

      Opcode::Load => {
        let load = expr.as_sub::<instructions::Load>().unwrap();
        let (array_ref, array_idx) = (load.array(), load.idx());
        let size = array_ref.get_size();
        let bits = array_ref.scalar_ty().get_bits() as u64;
        let name = format!("array_{}_q", namify(array_ref.get_name()));

        match load.idx().get_kind() {
          NodeKind::IntImm => {
            let imm = array_idx.as_ref::<IntImm>(self.sys).unwrap().get_value();
            format!("{name}[{}:{}]", bits * (imm + 1) - 1, imm * bits)
          }
          NodeKind::Expr => {
            let mut res = "'x".into();
            let idx = dump_ref(load.get().sys, &array_idx, true);
            for i in 0..size {
              let slice = format!("{name}[{}:{}]", ((i + 1) as u64) * bits - 1, (i as u64) * bits);
              res = format!("{i} == {idx} ? {slice} : ({res})");
            }
            res
          }
          _ => {
            panic!("Unexpected reference type: {:?}", load.idx());
          }
        }
      }

      Opcode::Store => {
        let store = expr.as_sub::<instructions::Store>().unwrap();
        let (array_ref, array_idx) = (store.array(), store.idx());
        let array_name = namify(array_ref.get_name());
        let pred = self.get_pred().unwrap_or("".to_string());
        let idx = dump_ref(store.get().sys, &array_idx, true);
        let idx_bits = store.idx().get_dtype(self.sys).unwrap().get_bits();
        let value = dump_ref(store.get().sys, &store.value(), true);
        let value_bits = store.value().get_dtype(self.sys).unwrap().get_bits();
        match self.array_stores.get_mut(&array_name) {
          Some((g_idx, g_value)) => {
            g_idx.push(pred.clone(), idx, idx_bits);
            g_value.push(pred, value, value_bits);
          }
          None => {
            self.array_stores.insert(
              array_name.clone(),
              (Gather::new(pred.clone(), idx, idx_bits), Gather::new(pred, value, value_bits)),
            );
          }
        }
        "".to_string()
      }

      Opcode::FIFOPush => {
        let push = expr.as_sub::<instructions::FIFOPush>().unwrap();
        let fifo = push.fifo();
        let fifo_name = format!("{}_{}", namify(fifo.get_module().get_name()), fifo_name!(fifo));
        let pred = self.get_pred().unwrap_or("".to_string());
        let value = dump_ref(self.sys, &push.value(), false);
        match self.fifo_pushes.get_mut(&fifo_name) {
          Some(fps) => fps.push(pred, value, fifo.scalar_ty().get_bits()),
          None => {
            self
              .fifo_pushes
              .insert(fifo_name.clone(), Gather::new(pred, value, fifo.scalar_ty().get_bits()));
          }
        }
        "".to_string()
      }

      Opcode::PureIntrinsic { intrinsic } => {
        let call = expr.as_sub::<instructions::PureIntrinsic>().unwrap();
        match intrinsic {
          subcode::PureIntrinsic::FIFOValid | subcode::PureIntrinsic::FIFOPeek => {
            let fifo = call
              .get()
              .get_operand_value(0)
              .unwrap()
              .as_ref::<FIFO>(self.sys)
              .unwrap();
            let fifo_name = fifo_name!(fifo);
            match intrinsic {
              subcode::PureIntrinsic::FIFOValid => format!("fifo_{}_pop_valid", fifo_name),
              subcode::PureIntrinsic::FIFOPeek => format!("fifo_{}_pop_data", fifo_name),
              _ => unreachable!(),
            }
          }
          subcode::PureIntrinsic::ValueValid => {
            let value = call.get().get_operand_value(0).unwrap();
            let value = value.as_ref::<Expr>(self.sys).unwrap();
            if value.get_block().get_module().get_key()
              != call.get().get_block().get_module().get_key()
            {
              format!("{}_valid", namify(&value.upcast().to_string(self.sys)))
            } else {
              format!(
                "(executed{})",
                self
                  .get_pred()
                  .map_or("".to_string(), |x| format!(" && {}", x))
              )
            }
          }
          _ => todo!(),
        }
      }

      Opcode::AsyncCall => {
        let call = expr.as_sub::<instructions::AsyncCall>().unwrap();
        let callee = {
          let bind = call.bind();
          bind.callee().get_name().to_string()
        };
        let callee = namify(&callee);
        let pred = self.get_pred().unwrap_or("".to_string());
        // FIXME(@were): Do not hardcode the counter delta width.
        match self.triggers.get_mut(&callee) {
          Some(trgs) => trgs.push(pred, "".into(), 8),
          None => {
            self
              .triggers
              .insert(callee, Gather::new(pred, "".into(), 8));
          }
        }
        "".to_string()
      }

      Opcode::Slice => {
        let slice = expr.as_sub::<instructions::Slice>().unwrap();
        let a = dump_ref(self.sys, &slice.x(), false);
        let l = dump_ref(self.sys, &slice.l_intimm().upcast(), false);
        let r = dump_ref(self.sys, &slice.r_intimm().upcast(), false);
        format!("{}[{}:{}]", a, r, l)
      }

      Opcode::Concat => {
        let concat = expr.as_sub::<instructions::Concat>().unwrap();
        let a = dump_ref(self.sys, &concat.msb(), true);
        let b = dump_ref(self.sys, &concat.lsb(), true);
        format!("{{{}, {}}}", a, b)
      }

      Opcode::Cast { .. } => {
        let dbits = expr.dtype().get_bits();
        let cast = expr.as_sub::<instructions::Cast>().unwrap();
        let a = dump_ref(self.sys, &cast.x(), false);
        let src_dtype = cast.src_type();
        let pad = dbits - src_dtype.get_bits();
        match cast.get_opcode() {
          subcode::Cast::BitCast => a,
          subcode::Cast::ZExt => format!("{{{}'b0, {}}}", pad, a),
          subcode::Cast::SExt => {
            let dest_dtype = cast.dest_type();
            if src_dtype.is_int()
              && src_dtype.is_signed()
              && dest_dtype.is_int()
              && dest_dtype.is_signed()
              && dest_dtype.get_bits() > src_dtype.get_bits()
            {
              // perform sext
              format!("{{{}'{{{}[{}]}}, {}}}", pad, a, src_dtype.get_bits() - 1, a)
            } else {
              format!("{{{}'b0, {}}}", pad, a)
            }
          }
        }
      }

      Opcode::Select => {
        let select = expr.as_sub::<instructions::Select>().unwrap();
        let cond = dump_ref(self.sys, &select.cond(), true);
        let true_value = dump_ref(self.sys, &select.true_value(), true);
        let false_value = dump_ref(self.sys, &select.false_value(), true);
        format!("{} ? {} : {}", cond, true_value, false_value)
      }

      Opcode::Bind => {
        // currently handled in AsyncCall
        "".to_string()
      }

      Opcode::Select1Hot => {
        let dbits = expr.dtype().get_bits();
        let select1hot = expr.as_sub::<instructions::Select1Hot>().unwrap();
        let cond = dump_ref(self.sys, &select1hot.cond(), false);
        select1hot
          .value_iter()
          .enumerate()
          .map(|(i, elem)| {
            let value = dump_ref(self.sys, &elem, false);
            format!("({{{}{{{}[{}] == 1'b1}}}} & {})", dbits, cond, i, value)
          })
          .collect::<Vec<_>>()
          .join(" | ")
      }

      Opcode::BlockIntrinsic { intrinsic } => match intrinsic {
        subcode::BlockIntrinsic::Finish => {
          let pred = self.get_pred().unwrap_or("1".to_string());
          format!(
            "
`ifndef SYNTHESIS
  always_ff @(posedge clk) if (executed && {}) $finish();
`endif\n",
            pred
          )
        }
        subcode::BlockIntrinsic::Assert => {
          let assert = expr.as_sub::<instructions::BlockIntrinsic>().unwrap();
          let pred = self.get_pred().unwrap_or("1".to_string());
          let cond = dump_ref(self.sys, &assert.value().unwrap(), false);
          format!("  always_ff @(posedge clk) if (executed && {}) assert({});\n", pred, cond)
        }
        _ => panic!("Unknown block intrinsic: {:?}", intrinsic),
      },
    };

    let temp: String = body;

    let body: String = if let Some((id, _)) = decl.clone() {
      if let Some(kind) = exposed_map.get(&expr_clone.upcast()) {
        if (**kind == ExposeKind::Inout) || (**kind == ExposeKind::Input) {
          format!("{}_exposed_i_valid ? {}_exposed_i :({}) ", id, id, temp)
        } else {
          temp
        }
      } else {
        temp
      }
    } else {
      temp
    };

    let mut res: String = if let Some((id, ty)) = decl {
      format!(
        "{}  assign {} = {};\n{}\n{}\n",
        declare_logic(ty, &id),
        id,
        body,
        expose,
        expose_out_str
      )
    } else {
      body.clone()
    };

    if let Some(pop) = is_pop {
      res.push_str(&pop);
      res.push('\n');
    }

    res.into()
  }
}

pub fn generate_cpp_testbench(dir: &Path, sys: &SysBuilder, config: &Config) -> io::Result<()> {
  if matches!(config.verilog, Simulator::Verilator) {
    let main_fname = dir.join("main.cpp");
    let mut main_fd = File::create(main_fname)?;
    main_fd.write_all(include_str!("main.cpp").as_bytes())?;
    let make_fname = dir.join("Makefile");
    let mut make_fd = File::create(make_fname).unwrap();
    make_fd.write_all(format!(include_str!("Makefile"), sys.get_name()).as_bytes())?;
  }
  Ok(())
}

struct ExposeGather<'a> {
  exposed_map: HashMap<BaseNode, ExposeKind>,
  sys: &'a SysBuilder,
}
impl<'a> ExposeGather<'a> {
  pub fn new(sys: &'a SysBuilder) -> Self {
    ExposeGather {
      exposed_map: HashMap::new(),
      sys,
    }
  }
}
impl Visitor<()> for ExposeGather<'_> {
  fn visit_expr(&mut self, expr: ExprRef<'_>) -> Option<()> {
    if let Some((_, v)) = self
      .sys
      .exposed_nodes()
      .find(|(node, _)| *node == &expr.upcast())
    {
      let k = expr.upcast();
      self.exposed_map.insert(k, v.clone());
    }
    None
  }
  /*fn visit_module(&mut self, module: ModuleRef<'_>) -> Option<()> {
    let body = module.get_body();
    let body_iter = body.body_iter();
      for (_, elem) in body_iter.enumerate() {
        match elem.get_kind() {
          NodeKind::Expr =>  {
              let expr = elem.as_ref::<Expr>(self.sys).unwrap();
              self.visit_expr(expr)?;
          }
          NodeKind::Block => {
            let block = elem.as_ref::<Block>(self.sys).unwrap();
            self.visit_block(block)?;
          }
          _ => {
            panic!("Unexpected reference type: {:?}", elem);
          }
      }
    }None
  }

  fn visit_block(&mut self, block: BlockRef<'_>) -> Option<()> {

    for node in block.body_iter()
    {match node.get_kind() {
      NodeKind::Expr => {
        let expr = node.as_ref::<Expr>(self.sys).unwrap();
        self.visit_expr(expr)?;
      }
      NodeKind::Block => {
        let block = node.as_ref::<Block>(self.sys).unwrap();
        self.visit_block(block)?;
      }
      _ => {
        panic!("Unexpected reference type: {:?}", node);
      }
    }}
    None
  }*/
}

pub fn elaborate(sys: &SysBuilder, config: &Config) -> Result<(), Error> {
  if matches!(config.verilog, Simulator::None) {
    return Err(Error::new(
      io::ErrorKind::Other,
      "No simulator specified for verilog generation",
    ));
  }

  let mut module_expr_map = HashMap::new();
  for m in sys.module_iter(ModuleKind::All) {
    let mut eg = ExposeGather::new(sys);
    eg.visit_module(m.clone());
    module_expr_map.insert(m.upcast(), eg.exposed_map);
  }

  create_and_clean_dir(config.dirname(sys, "verilog"), config.override_dump);
  let verilog_name = config.dirname(sys, "verilog");
  let fname = verilog_name.join(format!("{}.sv", sys.get_name()));

  eprintln!("Writing verilog rtl to {}", fname.to_str().unwrap());

  generate_cpp_testbench(&verilog_name, sys, config)?;

  // We need the topological order across all the downstream modules so that we
  // make sure acyclic combinational logic is generated.
  let topo = topo_sort(sys);
  let topo = topo
    .into_iter()
    .enumerate()
    .map(|(i, x)| (x, i))
    .collect::<HashMap<_, _>>();
  let external_usage = gather_exprs_externally_used(sys);
  let array_memory_params_map = VerilogDumper::collect_array_memory_params_map(sys);

  let mut vd =
    VerilogDumper::new(sys, config, external_usage, topo, array_memory_params_map, module_expr_map);

  let mut fd = File::create(fname)?;

  for module in vd.sys.module_iter(ModuleKind::All) {
    fd.write_all(vd.visit_module(module).unwrap().as_bytes())?;
  }

  vd.dump_runtime(fd, config.sim_threshold)?;

  Ok(())
}
