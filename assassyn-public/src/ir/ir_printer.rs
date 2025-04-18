use std::{collections::HashSet, fmt};

use expr::subcode;

use crate::ir::{node::*, *};

use self::user::Operand;

use super::{block::Block, visitor::Visitor};

pub struct IRPrinter {
  redundancy: bool,
  indent: usize,
}

impl IRPrinter {
  pub fn new(redundancy: bool) -> IRPrinter {
    IRPrinter {
      indent: 0,
      redundancy,
    }
  }
  pub fn inc_indent(&mut self) {
    self.indent += 2;
  }
  pub fn dec_indent(&mut self) {
    self.indent -= 2;
  }
}

struct ExtInterDumper<'a> {
  redundancy: bool,
  ident: usize,
  users: &'a HashSet<BaseNode>,
}

// TODO(@were): Fix this, dump the actual value of the operand_of one a line.
impl Visitor<String> for ExtInterDumper<'_> {
  fn visit_fifo(&mut self, input: FIFORef<'_>) -> Option<String> {
    let module = input.get_parent().as_ref::<Module>(input.sys).unwrap();
    let mut res =
      format!("{}.{}: fifo<{}> {{\n", module.get_name(), input.get_name(), input.scalar_ty());
    for op in self.users.iter() {
      let expr = IRPrinter::new(self.redundancy)
        .visit_expr(
          op.as_ref::<Operand>(input.sys)
            .unwrap()
            .get_user()
            .as_ref::<Expr>(input.sys)
            .unwrap(),
        )
        .unwrap();
      res.push_str(&format!("{}//   {}\n", " ".repeat(self.ident), expr));
    }
    res.push_str(&format!("{}// }}", " ".repeat(self.ident)));
    res.into()
  }

  fn visit_array(&mut self, array: ArrayRef<'_>) -> Option<String> {
    let mut res =
      format!("Array: {}[{} x {}] {{\n", array.get_name(), array.get_size(), array.scalar_ty(),);
    for op in self.users.iter() {
      let expr = IRPrinter::new(self.redundancy)
        .visit_expr(
          op.as_ref::<Operand>(array.sys)
            .unwrap()
            .get_user()
            .as_ref::<Expr>(array.sys)
            .unwrap(),
        )
        .unwrap();
      res.push_str(&format!("{}//   {}\n", " ".repeat(self.ident), expr));
    }
    res.push_str(&format!("{}// }}", " ".repeat(self.ident)));
    res.into()
  }

  fn visit_expr(&mut self, expr: ExprRef<'_>) -> Option<String> {
    format!("External Expr: {}", expr).into()
  }

  fn visit_module(&mut self, module: ModuleRef<'_>) -> Option<String> {
    format!("Module: {}", module.get_name()).into()
  }
}

impl Visitor<String> for IRPrinter {
  fn visit_fifo(&mut self, input: FIFORef<'_>) -> Option<String> {
    format!("{}: fifo<{}>", input.get_name(), input.scalar_ty()).into()
  }

  fn visit_array(&mut self, array: ArrayRef<'_>) -> Option<String> {
    let mut res = String::new();
    let attrs = array
      .get_attrs()
      .iter()
      .map(|x| x.to_string(array.sys))
      .collect::<Vec<_>>()
      .join(", ");
    if !attrs.is_empty() {
      res.push_str(&format!("#[{}]\n", attrs));
    }
    if !res.is_empty() {
      res.push_str("  ");
    }
    res.push_str(&format!(
      "Array: {}[{} x {}]",
      array.get_name(),
      array.get_size(),
      array.scalar_ty(),
    ));
    Some(res)
  }

  fn visit_int_imm(&mut self, int_imm: IntImmRef<'_>) -> Option<String> {
    format!("({}:{})", int_imm.get_value(), int_imm.dtype()).into()
  }

  fn visit_operand(&mut self, operand: OperandRef<'_>) -> Option<String> {
    let expr = operand.get_user().to_string(operand.sys);
    format!("{} /* in {} */", operand.get_value().to_string(operand.sys), expr).into()
  }

  fn visit_module(&mut self, module: ModuleRef<'_>) -> Option<String> {
    let mut res = String::new();
    for (elem, ops) in module.ext_interf_iter() {
      res.push_str(&format!(
        "{}// {}\n",
        " ".repeat(self.indent),
        ExtInterDumper {
          users: ops,
          ident: self.indent,
          redundancy: self.redundancy
        }
        .dispatch(module.sys, elem, vec![])
        .unwrap_or_else(|| panic!("Failed to dump: {:?}", elem))
      ));
    }
    // TODO(@were): Later support parameterized fusion.
    // if let Some(param) = module.get_parameterizable() {
    //   if !param.is_empty() {
    //     res.push_str(&" ".repeat(self.indent));
    //     res.push_str("// Parameters: ");
    //     for (i, elem) in param.iter().enumerate() {
    //       res.push_str(if i == 0 { " " } else { ", " });
    //       res.push_str(&elem.to_string(module.sys));
    //     }
    //     res.push('\n');
    //   }
    // }
    // if let Some(builder_ptr) = module.get_builder_func_ptr() {
    //   res.push_str(&" ".repeat(self.indent));
    //   res.push_str(&format!("// Builder Function: 0x{:x}\n", builder_ptr));
    // }
    res.push_str(&" ".repeat(self.indent));
    res.push_str(&format!("// Key: {}\n", module.get_key()));
    res.push_str(&" ".repeat(self.indent));
    res.push_str(&format!("#{:?}\n", module.get_attrs().iter().collect::<Vec<_>>()));
    res.push_str(&format!(
      "{}{} {}(",
      " ".repeat(self.indent),
      if module.has_attr(module::Attribute::Downstream) {
        "module.downstream"
      } else {
        "module"
      },
      module.get_name()
    ));
    if module.get_num_inputs() != 0 {
      res.push('\n');
    }
    for elem in module.fifo_iter() {
      res.push_str(" ".repeat(self.indent + 2).as_str());
      res.push_str(&self.visit_fifo(elem).unwrap());
      res.push_str(",\n");
    }
    res.push_str(
      format!(
        "{}) {{ // block-key: {}\n",
        " ".repeat(self.indent),
        module.get_body().get_key()
      )
      .as_str(),
    );
    self.inc_indent();
    if module.get_name().eq("driver") {
      res.push_str(&format!("{}while true {{\n", " ".repeat(self.indent)));
      self.inc_indent();
    }

    let body = self.visit_block(module.get_body()).unwrap();
    res.push_str(&body);

    if module.get_name().eq("driver") {
      self.dec_indent();
      res.push_str(&format!("{}}}\n", " ".repeat(self.indent)));
    }
    self.dec_indent();
    res.push_str(&" ".repeat(self.indent));
    res.push_str("}\n");
    res.into()
  }

  fn visit_string_imm(&mut self, str_imm: StrImmRef<'_>) -> Option<String> {
    let value = str_imm.get_value();
    quote::quote!(#value).to_string().into()
  }

  fn visit_expr(&mut self, expr: ExprRef<'_>) -> Option<String> {
    let res = format!("{}{}", " ".repeat(self.indent), expr).into();
    if let Ok(bi) = expr.as_sub::<instructions::BlockIntrinsic>() {
      if matches!(
        bi.get_subcode(),
        subcode::BlockIntrinsic::Condition | subcode::BlockIntrinsic::Cycled
      ) {
        self.inc_indent();
      }
    }
    res
  }

  fn visit_block(&mut self, block: BlockRef<'_>) -> Option<String> {
    let mut res = String::new();
    let ip = block.sys.get_insert_point();
    let here = ip.module == block.get_module() && ip.block == block.upcast();
    let restore_ident = self.indent;
    for (i, elem) in block.body_iter().enumerate() {
      if here && ip.at == Some(i) {
        res.push_str(&format!("{}-----{{Insert Here}}-----\n", " ".repeat(self.indent)));
      }
      match elem.get_kind() {
        NodeKind::Expr => {
          let expr = elem.as_ref::<Expr>(block.sys).unwrap();
          res.push_str(&format!("{}\n", self.visit_expr(expr).unwrap()));
        }
        NodeKind::Block => {
          let sub = elem.as_ref::<Block>(block.sys).unwrap();
          res.push_str(&format!("{}\n", self.visit_block(sub).unwrap()));
        }
        _ => {
          panic!("Not an block-able element: {:?}", elem);
        }
      }
    }
    if here && ip.at.is_none() {
      res.push_str(&format!("{}-----{{Insert Here}}-----\n", " ".repeat(self.indent)));
    }
    if restore_ident != self.indent {
      self.indent -= 2;
      res.push_str(&format!("{}}}", " ".repeat(self.indent)));
    }
    if block.get_value().is_some() {
      let indent = " ".repeat(self.indent);
      res = format!("{}{{{}\n{}}}", indent, res, indent);
    }
    res.into()
  }
}

impl fmt::Display for ArrayRef<'_> {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    write!(f, "{}", IRPrinter::new(false).visit_array(self.clone()).unwrap())
  }
}

impl fmt::Display for FIFORef<'_> {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    write!(f, "{}", IRPrinter::new(false).visit_fifo(self.clone()).unwrap())
  }
}
