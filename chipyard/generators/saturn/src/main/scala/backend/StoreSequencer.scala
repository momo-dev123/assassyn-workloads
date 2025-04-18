package saturn.backend

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import saturn.common._

class StoreSequencer(implicit p: Parameters) extends PipeSequencer(new StoreDataMicroOp)(p) {
  def accepts(inst: VectorIssueInst) = inst.vmu && inst.opcode(5)

  val valid    = RegInit(false.B)
  val inst     = Reg(new VectorIssueInst)
  val eidx     = Reg(UInt(log2Ceil(maxVLMax).W))
  val sidx     = Reg(UInt(3.W))
  val rvd_mask = Reg(UInt(egsTotal.W))
  val rvm_mask = Reg(UInt(egsPerVReg.W))
  val sub_dlen = Reg(UInt(2.W))
  val head     = Reg(Bool())

  val renvm     = !inst.vm && inst.mop === mopUnit
  val next_eidx = get_next_eidx(inst.vconfig.vl, eidx, inst.mem_elem_size, sub_dlen, false.B, false.B)
  val tail      = next_eidx === inst.vconfig.vl && sidx === inst.seg_nf

  io.dis.ready := !valid || (tail && io.iss.fire) && !io.dis_stall

  when (io.dis.fire) {
    val iss_inst = io.dis.bits
    valid := true.B
    inst  := iss_inst
    eidx  := iss_inst.vstart
    sidx  := 0.U

    val rvd_arch_mask = Wire(Vec(32, Bool()))
    for (i <- 0 until 32) {
      val group = i.U >> iss_inst.emul
      val rd_group = iss_inst.rd >> iss_inst.emul
      rvd_arch_mask(i) := group >= rd_group && group <= (rd_group + iss_inst.nf)
    }
    rvd_mask := FillInterleaved(egsPerVReg, rvd_arch_mask.asUInt)
    rvm_mask := Mux(!iss_inst.vm, ~(0.U(egsPerVReg.W)), 0.U)
    sub_dlen := Mux(iss_inst.seg_nf =/= 0.U && (dLenOffBits.U > (3.U +& iss_inst.mem_elem_size)),
      dLenOffBits.U - 3.U - iss_inst.mem_elem_size,
      0.U)
    head := true.B
  } .elsewhen (io.iss.fire) {
    valid := !tail
    head := false.B
  }

  io.vat := inst.vat
  io.seq_hazard.valid := valid
  io.seq_hazard.bits.rintent := hazardMultiply(rvd_mask | rvm_mask)
  io.seq_hazard.bits.wintent := 0.U
  io.seq_hazard.bits.vat := inst.vat

  val vd_read_oh = UIntToOH(io.rvd.req.bits.eg)
  val vm_read_oh = Mux(renvm, UIntToOH(io.rvm.req.bits.eg), 0.U)

  val raw_hazard = ((vm_read_oh | vd_read_oh) & io.older_writes) =/= 0.U
  val data_hazard = raw_hazard

  val oldest = inst.vat === io.vat_head

  io.rvd.req.valid := valid && io.iss.ready
  io.rvd.req.bits.eg := getEgId(inst.rd + (sidx << inst.emul), eidx, inst.mem_elem_size, false.B)
  io.rvd.req.bits.oldest := oldest
  io.rvm.req.valid := valid && renvm && io.iss.ready
  io.rvm.req.bits.eg := getEgId(0.U, eidx, 0.U, true.B)
  io.rvm.req.bits.oldest := oldest

  io.iss.valid := valid && !data_hazard && (!renvm || io.rvm.req.ready) && io.rvd.req.ready
  io.iss.bits.stdata  := io.rvd.resp
  val head_mask = get_head_mask(~(0.U(dLenB.W)), eidx     , inst.mem_elem_size)
  val tail_mask = get_tail_mask(~(0.U(dLenB.W)), next_eidx, inst.mem_elem_size)
  val vm_mask   = Mux(!renvm, ~(0.U(dLenB.W)), get_vm_mask(io.rvm.resp, eidx, inst.mem_elem_size))
  io.iss.bits.stmask := vm_mask
  io.iss.bits.debug_id := inst.debug_id
  io.iss.bits.tail := tail
  io.iss.bits.vat := inst.vat

  when (io.iss.fire && !tail) {
    when (next_is_new_eg(eidx, next_eidx, inst.mem_elem_size, false.B) && vParams.enableChaining.B) {
      rvd_mask := rvd_mask & ~UIntToOH(io.rvd.req.bits.eg)
    }
    when (next_is_new_eg(eidx, next_eidx, 0.U, true.B) && vParams.enableChaining.B) {
      rvm_mask := rvm_mask & ~UIntToOH(io.rvm.req.bits.eg)
    }
    when (sidx === inst.seg_nf) {
      sidx := 0.U
      eidx := next_eidx
    } .otherwise {
      sidx := sidx + 1.U
    }
  }

  io.busy := valid
  io.head := head
}
