use crate::ir::expr::subcode;
use crate::ir::{node::*, visitor::Visitor};

use crate::ir::*;

use self::user::Operand;

/// NOTE: This module is to verify the soundness of an system IR. Not a RTL verification generator.
use super::SysBuilder;

impl Operand {
  fn verify(&self, sys: &SysBuilder) {
    assert!(sys.contains(&self.upcast()));
    match self.get_user().get_kind() {
      NodeKind::Expr => {
        let expr = self
          .get_user()
          .as_ref::<Expr>(sys)
          .expect("User should be an expression!");
        let operand = expr
          .operand_iter()
          .position(|op| self.upcast().eq(&op.upcast()));
        assert!(operand.is_some());
      }
      NodeKind::Block => {
        let block = self
          .get_user()
          .as_ref::<Block>(sys)
          .expect("User should be a block!");
        if let Some(condition) = block.get_condition() {
          assert!(block.idx_of(&condition).unwrap() == 0);
        } else if let Some(value) = block.get_value() {
          assert!(block.idx_of(&value).unwrap() == block.get_num_exprs() - 1);
        }
      }
      _ => panic!("Invalid user type!"),
    }
  }
}

struct Verifier {}

impl Verifier {
  fn new() -> Self {
    Self {}
  }
}

impl Visitor<()> for Verifier {
  fn visit_block(&mut self, block: BlockRef<'_>) -> Option<()> {
    for expr in block.body_iter() {
      self.dispatch(block.sys, &expr, vec![]);
    }
    None
  }

  fn visit_expr(&mut self, expr: ExprRef<'_>) -> Option<()> {
    for user in expr.users().iter() {
      let operand = user.as_ref::<Operand>(expr.sys).unwrap();
      assert!(operand.get_value().eq(&expr.upcast()));
      operand.verify(expr.sys);
    }
    for operand in expr.operand_iter() {
      let operand = operand.get_value();
      match operand.get_kind() {
        NodeKind::FIFO => {
          let fifo = operand.as_ref::<FIFO>(expr.sys).unwrap();
          fifo.users().contains(operand);
        }
        NodeKind::Expr => {
          let expr = operand.as_ref::<Expr>(expr.sys).unwrap();
          expr.users().contains(operand);
        }
        NodeKind::Module => {
          let module = operand.as_ref::<Module>(expr.sys).unwrap();
          module.users().contains(operand);
        }
        NodeKind::IntImm => {
          let imm_value = operand.as_ref::<IntImm>(expr.sys).unwrap().get_value();
          let imm_dtype = operand.get_dtype(expr.sys).unwrap();
          let imm_dtype_width = imm_dtype.get_bits();
          assert!(
            imm_value < (1 << (imm_dtype_width - if imm_dtype.is_signed() { 1 } else { 0 })),
            "Datatype {} can not hold immediate {}",
            imm_dtype,
            imm_value
          )
        }
        _ => {}
      }
    }
    if matches!(expr.get_opcode(), Opcode::Cast { .. }) {
      let cast = expr.as_sub::<instructions::Cast>().unwrap();
      let src_ty = cast.src_type();
      let dest_ty = cast.dest_type();
      match cast.get_opcode() {
        subcode::Cast::BitCast => {
          assert!(
            // only support same-width data type conversions
            dest_ty.get_bits() == src_ty.get_bits(),
            "Only support bitcast between types of the same width"
          );
        }
        subcode::Cast::SExt | subcode::Cast::ZExt => {
          assert!(
            // disallow trimming or "extend" to same width
            dest_ty.get_bits() > src_ty.get_bits(),
            "Dest type must be wider than src type for extension"
          );
        }
      }
    }
    None
  }

  fn visit_module(&mut self, m: ModuleRef<'_>) -> Option<()> {
    for user in m.users().iter() {
      user.as_ref::<Operand>(m.sys).unwrap().verify(m.sys);
    }
    self.visit_block(m.get_body());
    None
  }
}

pub fn verify(sys: &SysBuilder) {
  Verifier::new().enter(sys);
}
