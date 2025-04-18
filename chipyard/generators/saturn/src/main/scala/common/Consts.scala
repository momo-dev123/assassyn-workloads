package saturn.common

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import freechips.rocketchip.rocket._
import freechips.rocketchip.util._
import chisel3.util.experimental.decode._

object OPIFunct6 extends ChiselEnum {
  val add = Value
  val andn = Value
  val sub, rsub, minu, min, maxu, max = Value
  val _ = Value
  val and, or, xor, rgather = Value
  val _ = Value
  val slideup, slidedown = Value
  def rgatherei16 = slideup

  val adc = Value
  val madc, sbc, msbc = Value
  val ror, rol, _ = Value
  val merge, mseq, msne, msltu, mslt, msleu, msle, msgtu, msgt = Value

  val saddu, sadd, ssubu, ssub = Value
  val _ = Value
  val sll = Value
  val _ = Value
  val smul = Value
  def mvnrr = smul
  val srl, sra, ssrl, ssra, nsrl, nsra, nclipu, nclip = Value
  val wredsumu, wredsum = Value
  val _, _, _ = Value
  val wsll = Value

  val illegal = Value(0x40.U)
}

object OPMFunct6 extends ChiselEnum {
  val redsum, redand, redor, redxor, redminu, redmin, redmaxu, redmax, aaddu, aadd, asubu, asub = Value
  val _, _ = Value
  val slide1up, slide1down = Value

  val wrxunary0 = Value
  val _ = Value
  val xunary0 = Value
  val _ = Value
  val munary0 = Value
  val _, _ = Value
  val compress, mandnot, mand, mor, mxor, mornot, mnand, mnor, mxnor = Value

  val divu, div, remu, rem, mulhu, mul, mulhsu, mulh = Value
  val _ = Value
  val madd = Value
  val _ = Value
  val nmsub = Value
  val _ = Value
  val macc = Value
  val _ = Value
  val nmsac = Value

  val waddu, wadd, wsubu, wsub, wadduw, waddw, wsubuw, wsubw, wmulu = Value
  val _ = Value
  val wmulsu, wmul, wmaccu, wmacc, wmaccus, wmaccsu = Value

  val illegal = Value(0x40.U)
}

object OPFFunct6 extends ChiselEnum {
  val fadd, fredusum, fsub, fredosum, fmin, fredmin, fmax, fredmax, fsgnj, fsgnjn, fsgnjx = Value
  val _, _, _ = Value
  val fslide1up, fslide1down = Value
  val wrfunary0 = Value
  val _ = Value
  val funary0, funary1 = Value
  val _, _, _ = Value
  val fmerge, mfeq, mfle = Value
  val _ = Value
  val mflt, mfne, mfgt = Value
  val _ = Value
  val mfge, fdiv, frdiv = Value
  val _, _ = Value
  val fmul = Value
  val _, _ = Value
  val frsub = Value
  val fmadd, fnmadd, fmsub, fnmsub, fmacc, fnmacc, fmsac, fnmsac, fwadd, fwredusum, fwsub, fwredosum = Value
  val fwaddw, _, fwsubw, _, fwmul, _, _, _, fwmacc, fwnmacc, fwmsac, fwnmsac = Value
  val illegal = Value(0x40.U)
}

trait HasVectorConsts {
  def mopUnit      = 0.U(2.W)
  def mopUnordered = 1.U(2.W)
  def mopStrided   = 2.U(2.W)
  def mopOrdered   = 3.U(2.W)

  def lumopUnit  = "b00000".U
  def lumopWhole = "b01000".U
  def lumopMask  = "b01011".U
  def lumopFF    = "b10000".U


  def sumopUnit  = "b00000".U
  def sumopWhole = "b01000".U
  def sumopMask  = "b01011".U

  def opcLoad   = "b0000111".U
  def opcStore  = "b0100111".U
  def opcVector = "b1010111".U

  def OPIVV = "b000".U(3.W)
  def OPFVV = "b001".U(3.W)
  def OPMVV = "b010".U(3.W)
  def OPIVI = "b011".U(3.W)
  def OPIVX = "b100".U(3.W)
  def OPFVF = "b101".U(3.W)
  def OPMVX = "b110".U(3.W)
  def OPCFG = "b111".U(3.W)

  def X = BitPat("b?")
  def N = BitPat("b0")
  def Y = BitPat("b1")
}

object VectorConsts extends HasVectorConsts

object VecDecode extends HasVectorConsts {
  def apply(funct3: UInt, funct6: UInt, default: Seq[BitPat], table: Seq[(EnumType, Seq[BitPat])]): Seq[UInt] = {
    def enumToUInt(e: EnumType): Seq[UInt] = e match {
      case v: OPIFunct6.Type => Seq(OPIVV, OPIVI, OPIVX).map { f3 => ((f3.litValue << 6) + v.litValue).U(9.W) }
      case v: OPMFunct6.Type => Seq(OPMVV, OPMVX       ).map { f3 => ((f3.litValue << 6) + v.litValue).U(9.W) }
      case v: OPFFunct6.Type => Seq(OPFVV, OPFVF       ).map { f3 => ((f3.litValue << 6) + v.litValue).U(9.W) }
    }
    val nElts = default.size
    require(table.forall(_._2.size == nElts))

    val elementsGrouped = table.map(_._2).transpose
    val elementWidths = elementsGrouped.zip(default).map { case (elts, default) =>
      require(elts.forall(_.getWidth == default.getWidth))
      default.getWidth
    }
    val resultWidth = elementWidths.sum
    val elementIndices = elementWidths.scan(resultWidth - 1) { case (l, r) => l - r }
    val truthTable = TruthTable(table.map(e => enumToUInt(e._1).map(u => (BitPat(u), e._2.reduce(_ ## _)))).flatten, default.reduce(_ ## _))
    val decoded = chisel3.util.experimental.decode.decoder(Cat(funct3(2,0), funct6(5,0)), truthTable)
    elementIndices.zip(elementIndices.tail).map { case (msb, lsb) => decoded(msb, lsb + 1) }.toSeq
  }


  def applyBools(funct3: UInt, funct6: UInt, default: Seq[BitPat], table: Seq[(EnumType, Seq[BitPat])]): Seq[Bool] = apply(
    funct3, funct6, default, table).map(_(0))

  def apply(funct3: UInt, funct6: UInt, trues: Seq[EnumType], falses: Seq[EnumType]): Bool = applyBools(
    funct3, funct6, Seq(BitPat.dontCare(1)), trues.map(e => (e, Seq(BitPat(true.B)))) ++ falses.map(e => (e, Seq(BitPat(false.B)))))(0)
  def apply(funct3: UInt, funct6: UInt, trues: Seq[EnumType]): Bool = applyBools(
    funct3, funct6, Seq(BitPat(false.B)), trues.map(e => (e, Seq(BitPat(true.B)))))(0)
}

