use std::collections::HashSet;

use crate::ir::{node::*, *};

pub struct FIFO {
  /// A unique key of this instance in the slab buffer.
  pub(crate) key: usize,
  /// The parent module of this FIFO.
  pub(super) parent: BaseNode,
  /// The name of this FIFO.
  name: String,
  /// The data type of this FIFO.
  dtype: DataType,
  /// The redundant data structure to store the users of this FIFO.
  pub(crate) user_set: HashSet<BaseNode>,
}

impl FIFO {
  pub fn new(dtype: &DataType, name: &str) -> Self {
    Self {
      key: 0,
      // When instantiating a port input FIFO, the parent module is not constructed yet.
      // To avoid running into a chicken-egg paradox, we set the parent to a dummy node for now.
      // Later SysBuilder will call set_parent() to set the correct parent.
      parent: BaseNode::new(NodeKind::Unknown, 0),
      name: name.to_string(),
      dtype: dtype.clone(),
      user_set: HashSet::new(),
    }
  }

  pub fn get_name(&self) -> &String {
    &self.name
  }

  pub fn scalar_ty(&self) -> DataType {
    self.dtype.clone()
  }
}

impl FIFORef<'_> {
  pub fn get_module(&self) -> ModuleRef<'_> {
    self.get_parent().as_ref::<Module>(self.sys).unwrap()
  }
}

impl FIFOMut<'_> {
  pub fn set_name(&mut self, name: String) {
    self.get_mut().name = name;
  }
}

impl Typed for FIFO {
  fn dtype(&self) -> DataType {
    DataType::void()
  }
}

impl Parented for FIFO {
  fn get_parent(&self) -> BaseNode {
    self.parent
  }
  fn set_parent(&mut self, parent: BaseNode) {
    self.parent = parent;
  }
}
