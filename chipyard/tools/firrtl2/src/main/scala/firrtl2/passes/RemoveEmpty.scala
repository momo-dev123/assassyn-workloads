// SPDX-License-Identifier: Apache-2.0

package firrtl2
package passes

import firrtl2.ir._
import firrtl2.stage.Forms

object RemoveEmpty extends Pass {

  override def prerequisites = Seq.empty
  override def optionalPrerequisites = Forms.LowFormOptimized
  override def optionalPrerequisiteOf = Forms.ChirrtlEmitters
  override def invalidates(a: Transform) = false

  private def onModule(m: DefModule): DefModule = {
    m match {
      case m: Module    => Module(m.info, m.name, m.ports, Utils.squashEmpty(m.body))
      case m: ExtModule => m
    }
  }
  def run(c: Circuit): Circuit = Circuit(c.info, c.modules.map(onModule), c.main)
}
