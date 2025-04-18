package saturn.mem

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import freechips.rocketchip.rocket._
import freechips.rocketchip.util._
import freechips.rocketchip.tile._
import saturn.common._

class LoadSegmentBuffer(doubleBuffer: Boolean)(implicit p: Parameters) extends CoreModule()(p) with HasVectorParams {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(new Bundle {
      val data = UInt(dLen.W)
      val eew = UInt(2.W)
      val nf = UInt(3.W)
      val eidx = UInt(log2Ceil(maxVLMax).W)
      val segstart = UInt(3.W)
      val sidx = UInt(3.W)
      val sidx_tail = Bool()
      val tail = Bool()
      val debug_id = UInt(debugIdSz.W)
    }))
    val out = Decoupled(new Bundle {
      val data = UInt(dLen.W)
      val debug_id = UInt(debugIdSz.W)
    })
    val busy = Output(Bool())
  })

  val nB = if (doubleBuffer) 2 else 1

  val rows = 8
  val cols = dLenB

  val wdata = Wire(Vec(4, UInt((rows*8*8).W)))
  val warr = wdata(io.in.bits.eew).asTypeOf(Vec(rows, Vec(8, UInt(8.W))))
  val wrow = WireInit(0.U(rows.W))
  val wcol = WireInit(0.U(cols.W))
  val wmode = Wire(Bool())
  val array = Seq.tabulate(rows, cols, nB) { case (_,_,_) => Reg(UInt(8.W)) }

  for (r <- 0 until 8) {
    for (c <- 0 until cols) {
      for (s <- 0 until nB) {
        when (wrow(r) && wcol(c) && wmode === s.U) {
          array(r)(c)(s) := warr(r)(c % 8)
        }
      }
    }
  }

  val modes = RegInit(VecInit.fill(nB)(false.B))
  val in_sel = RegInit(false.B)
  val out_sel = RegInit(false.B)
  val out_nf  = Reg(Vec(nB, UInt(3.W)))
  val out_row = Reg(Vec(nB, UInt(3.W)))
  val out_id = Reg(Vec(nB, UInt(debugIdSz.W)))

  io.in.ready := !modes(in_sel)
  io.out.valid := modes(out_sel)
  io.out.bits.data := Mux1H(UIntToOH(out_row(out_sel)), array.map(row => VecInit(row.map(_(out_sel))).asUInt))
  io.out.bits.debug_id := out_id(out_sel)

  when (io.in.fire) {
    wrow := ((1.U << (dLenB.U >> io.in.bits.eew)) - 1.U)(7,0) << io.in.bits.sidx
  }
  wcol := ((1.U << (1.U << io.in.bits.eew)) - 1.U)(7,0) << (io.in.bits.eidx(log2Ceil(dLenB)-1,0) << io.in.bits.eew)(log2Ceil(dLenB)-1,0)
  wmode := in_sel

  for (eew <- 0 until 4) {
    val in_rows = 8 min (dLenB >> eew)
    val in_cols = 8 >> eew
    val in_elems = dLenB >> eew

    val col = Wire(Vec(in_rows, UInt((8 << eew).W)))
    val arr = Wire(Vec(in_rows, Vec(in_cols, UInt((8 << eew).W))))

    col := io.in.bits.data.asTypeOf(Vec(in_rows, UInt((8 << eew).W)))
    for (r <- 0 until in_rows) {
      for (c <- 0 until in_cols) {
        arr(r)(c) := col(r)
      }
    }

    wdata(eew) := Fill(8 / in_rows, arr.asUInt)
  }

  when (io.in.fire && io.in.bits.sidx_tail && (wcol(cols-1) || io.in.bits.tail)) {
    in_sel := (if (doubleBuffer) (!in_sel) else false.B)
    modes(in_sel) := true.B
    out_nf(in_sel) := io.in.bits.nf
    out_row(in_sel) := io.in.bits.segstart
    out_id(in_sel) := io.in.bits.debug_id
  }

  when (io.out.fire) {
    when (out_row(out_sel) === out_nf(out_sel)) {
      out_sel := (if (doubleBuffer) (!out_sel) else false.B)
      modes(out_sel) := false.B
    } .otherwise {
      out_row(out_sel) := out_row(out_sel) + 1.U
    }
  }

  io.busy := modes.orR
}

class StoreSegmentBuffer(doubleBuffer: Boolean)(implicit p: Parameters) extends CoreModule()(p) with HasVectorParams {

  val io = IO(new Bundle {
    val in = Flipped(Decoupled(new Bundle {
      val data = UInt(dLen.W)
      val mask = UInt(dLenB.W)
      val debug_id = UInt(debugIdSz.W)
      val eew = UInt(2.W)
      val nf = UInt(3.W)
      val rows = UInt(4.W)
      val sidx = UInt(3.W)
      val segstart = UInt(3.W)
      val segend = UInt(3.W)
    }))

    val out = Decoupled(new Bundle {
      val data = new StoreDataMicroOp
      val head = UInt(log2Ceil(dLenB).W)
      val tail = UInt(log2Ceil(dLenB).W)
    })
    val busy = Output(Bool())
  })

  val nB = if (doubleBuffer) 2 else 1
  val rows = 8
  val cols = dLenB

  val wdata = Wire(Vec(4, UInt((rows*8*8).W)))
  val warr = wdata(io.in.bits.eew).asTypeOf(Vec(rows, Vec(8, UInt(8.W))))
  val wrow = WireInit(0.U(rows.W))
  val wcol = WireInit(0.U(cols.W))
  val wmode = Wire(Bool())
  val array = Seq.tabulate(rows, cols, nB) { case (_,_,_) => Reg(UInt(8.W)) }
  val mask = Seq.fill(nB) { Reg(UInt(dLenB.W)) }

  for (r <- 0 until 8) {
    for (c <- 0 until cols) {
      for (s <- 0 until nB) {
        when (wrow(r) && wcol(c) && wmode === s.U) {
          array(r)(c)(s) := warr(r)(c % 8)
        }
      }
    }
  }
  val modes = RegInit(VecInit.fill(nB)(false.B))
  val in_sel = RegInit(false.B)
  val out_sidx = Reg(Vec(nB, UInt(3.W)))
  val out_row = RegInit(0.U(3.W))
  val out_sel = RegInit(false.B)
  val out_nf = Reg(Vec(nB, UInt(3.W)))
  val out_eew = Reg(Vec(nB, UInt(2.W)))
  val out_rows = Reg(Vec(nB, UInt(4.W)))
  val out_segstart = Reg(Vec(nB, UInt(3.W)))
  val out_id = Reg(Vec(nB, UInt(debugIdSz.W)))


  def sidxOff(sidx: UInt, eew: UInt) = sidx & ~((1.U << (log2Ceil(cols).U - eew)) - 1.U)

  io.in.ready := !modes(in_sel)
  io.out.valid := modes(out_sel)
  val row_sel = out_row + sidxOff(out_sidx(out_sel), out_eew(out_sel))
  io.out.bits.data.tail := DontCare
  io.out.bits.data.vat := DontCare
  io.out.bits.data.stdata := Mux1H(UIntToOH(row_sel), array.map(row => VecInit(row.map(_(out_sel))).asUInt))
  io.out.bits.data.stmask := Fill(dLenB, (Mux1H(UIntToOH(out_sel), mask) >> (out_row << out_eew(out_sel)))(0))
  io.out.bits.data.debug_id := out_id(out_sel)
  io.out.bits.head := out_sidx(out_sel) << out_eew(out_sel)
  val remaining_bytes = (out_nf(out_sel) +& 1.U - out_sidx(out_sel)) << out_eew(out_sel)
  io.out.bits.tail := Mux((remaining_bytes +& io.out.bits.head) >= dLenB.U, dLenB.U, remaining_bytes + io.out.bits.head)

  when (io.in.fire) {
    wrow := ((1.U << (1.U << (log2Ceil(cols).U - io.in.bits.eew))) - 1.U)(7,0) << sidxOff(io.in.bits.sidx, io.in.bits.eew)
    for (s <- 0 until nB) {
      when (wmode === s.U && io.in.bits.sidx === 0.U) {
        mask(s) := io.in.bits.mask
      }
    }
  }
  wcol := ((1.U << (1.U << io.in.bits.eew)) - 1.U)(7,0) << (io.in.bits.sidx << io.in.bits.eew)(log2Ceil(cols)-1,0)

  wmode := in_sel

  for (eew <- 0 until 4) {
    val in_rows = 8 min (dLenB >> eew)
    val in_cols = 8 >> eew
    val in_elems = cols >> eew

    val col = Wire(Vec(in_rows, UInt((8 << eew).W)))
    val arr = Wire(Vec(in_rows, Vec(in_cols, UInt((8 << eew).W))))

    col := io.in.bits.data.asTypeOf(Vec(in_rows, UInt((8 << eew).W)))

    for (r <- 0 until in_rows) {
      for (c <- 0 until in_cols) {
        arr(r)(c) := col(r)
      }
    }
    wdata(eew) := Fill(8 / in_rows, arr.asUInt)
  }

  when (io.in.fire && io.in.bits.sidx === io.in.bits.nf) {
    in_sel := (if (doubleBuffer) (!in_sel) else false.B)
    modes(in_sel) := true.B
    out_sidx(in_sel) := io.in.bits.segstart
    out_nf(in_sel) := io.in.bits.segend
    out_eew(in_sel) := io.in.bits.eew
    out_rows(in_sel) := io.in.bits.rows
    out_segstart(in_sel) := io.in.bits.segstart
    out_id(in_sel) := io.in.bits.debug_id
  }

  when (io.out.fire) {
    val sidx_tail = ((out_sidx(out_sel) +& (cols.U >> out_eew(out_sel))) > out_nf(out_sel))
    when ((out_row +& 1.U === out_rows(out_sel)) && sidx_tail) {
      out_sel := (if (doubleBuffer) (!out_sel) else false.B)
      out_row := 0.U
      modes(out_sel) := false.B
    } .elsewhen (sidx_tail) {
      out_sidx(out_sel) := out_segstart(out_sel)
      out_row := out_row + 1.U
    } .otherwise {
      out_sidx(out_sel) := out_sidx(out_sel) + (cols.U >> out_eew(out_sel))
    }
  }

  io.busy := modes.orR
}
