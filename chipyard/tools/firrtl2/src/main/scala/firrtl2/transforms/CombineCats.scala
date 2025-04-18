// SPDX-License-Identifier: Apache-2.0

package firrtl2
package transforms

import firrtl2.ir._
import firrtl2.Mappers._
import firrtl2.PrimOps._
import firrtl2.WrappedExpression._
import firrtl2.annotations.NoTargetAnnotation
import firrtl2.options.Dependency
import firrtl2.stage.PrettyNoExprInlining

import scala.collection.mutable

case class MaxCatLenAnnotation(maxCatLen: Int) extends NoTargetAnnotation

object CombineCats {

  /** Mapping from references to the [[firrtl2.ir.Expression Expression]]s that drive them paired with their Cat length */
  type Netlist = mutable.HashMap[WrappedExpression, (Int, Expression)]

  def expandCatArgs(maxCatLen: Int, netlist: Netlist)(expr: Expression): (Int, Expression) = expr match {
    case cat @ DoPrim(Cat, args, _, _) =>
      val (a0Len, a0Expanded) = expandCatArgs(maxCatLen - 1, netlist)(args.head)
      val (a1Len, a1Expanded) = expandCatArgs(maxCatLen - a0Len, netlist)(args(1))
      (a0Len + a1Len, cat.copy(args = Seq(a0Expanded, a1Expanded)).asInstanceOf[Expression])
    case other =>
      netlist
        .get(we(expr))
        .collect {
          case (len, cat @ DoPrim(Cat, _, _, _)) if maxCatLen >= len => expandCatArgs(maxCatLen, netlist)(cat)
        }
        .getOrElse((1, other))
  }

  def onStmt(maxCatLen: Int, netlist: Netlist)(stmt: Statement): Statement = {
    stmt.map(onStmt(maxCatLen, netlist)) match {
      case node @ DefNode(_, name, value) =>
        val catLenAndVal = value match {
          case cat @ DoPrim(Cat, _, _, _) => expandCatArgs(maxCatLen, netlist)(cat)
          case other                      => (1, other)
        }
        netlist(we(WRef(name))) = catLenAndVal
        node.copy(value = catLenAndVal._2)
      case other => other
    }
  }

  def onMod(maxCatLen: Int)(mod: DefModule): DefModule = mod.map(onStmt(maxCatLen, new Netlist))
}

/** Combine Cat DoPrims
  *
  * Expands the arguments of any Cat DoPrims if they are references to other Cat DoPrims.
  * Operates only on Cat DoPrims that are node values.
  *
  * Use [[MaxCatLenAnnotation]] to limit the number of elements that can be concatenated.
  * The default maximum number of elements is 10.
  */
class CombineCats extends Transform {

  override def prerequisites = firrtl2.stage.Forms.LowForm ++
    Seq(
      Dependency(passes.RemoveValidIf),
      Dependency(firrtl2.passes.SplitExpressions)
    )

  override def optionalPrerequisites =
    Seq(Dependency(firrtl2.passes.memlib.VerilogMemDelays), Dependency[firrtl2.transforms.ConstantPropagation])

  override def optionalPrerequisiteOf = Seq(Dependency[SystemVerilogEmitter], Dependency[VerilogEmitter])

  override def invalidates(a: Transform) = false

  val defaultMaxCatLen = 10

  def execute(state: CircuitState): CircuitState = {
    val run = !state.annotations.contains(PrettyNoExprInlining)

    if (run) {
      val maxCatLen = state.annotations.collectFirst {
        case m: MaxCatLenAnnotation => m.maxCatLen
      }.getOrElse(defaultMaxCatLen)

      val modulesx = state.circuit.modules.map(CombineCats.onMod(maxCatLen))
      state.copy(circuit = state.circuit.copy(modules = modulesx))
    } else {
      logger.info(s"--${PrettyNoExprInlining.longOption} specified, skipping...")
      state
    }
  }
}
