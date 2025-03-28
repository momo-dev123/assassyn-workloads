module CSRFile (
	clock,
	reset,
	io_ungated_clock,
	io_interrupts_debug,
	io_interrupts_mtip,
	io_interrupts_msip,
	io_interrupts_meip,
	io_hartid,
	io_rw_addr,
	io_rw_cmd,
	io_rw_rdata,
	io_rw_wdata,
	io_eret,
	io_evec,
	io_exception,
	io_retire,
	io_cause,
	io_pc,
	io_tval,
	io_time,
	io_interrupt,
	io_interrupt_cause
);
	input clock;
	input reset;
	input io_ungated_clock;
	input io_interrupts_debug;
	input io_interrupts_mtip;
	input io_interrupts_msip;
	input io_interrupts_meip;
	input io_hartid;
	input [11:0] io_rw_addr;
	input [2:0] io_rw_cmd;
	output wire [31:0] io_rw_rdata;
	input [31:0] io_rw_wdata;
	output wire io_eret;
	output wire [31:0] io_evec;
	input io_exception;
	input io_retire;
	input [31:0] io_cause;
	input [31:0] io_pc;
	input [31:0] io_tval;
	output wire [31:0] io_time;
	output wire io_interrupt;
	output wire [31:0] io_interrupt_cause;
	wire [31:0] io_rw_rdata_0;
	reg io_status_cease_r;
	wire io_singleStep;
	reg reg_mstatus_v;
	reg reg_mstatus_mpv;
	reg reg_mstatus_gva;
	reg [1:0] reg_mstatus_mpp;
	reg reg_mstatus_mpie;
	reg reg_mstatus_mie;
	reg reg_dcsr_ebreakm;
	reg [2:0] reg_dcsr_cause;
	reg reg_dcsr_v;
	reg reg_dcsr_step;
	reg reg_debug;
	reg [31:0] reg_dpc;
	reg [31:0] reg_dscratch0;
	reg reg_singleStepped;
	reg [31:0] reg_mie;
	reg [31:0] reg_mepc;
	reg [31:0] reg_mcause;
	reg [31:0] reg_mtval;
	reg [31:0] reg_mscratch;
	reg [31:0] reg_mtvec;
	reg reg_wfi;
	reg [2:0] reg_mcountinhibit;
	reg [5:0] small_0;
	reg [57:0] large_0;
	reg [5:0] small_1;
	reg [57:0] large_1;
	wire [15:0] read_mip = {4'h0, io_interrupts_meip, 3'h0, io_interrupts_mtip, 3'h0, io_interrupts_msip, 3'h0};
	wire [15:0] _GEN = reg_mie[15:0] & read_mip;
	wire [15:0] m_interrupts = (reg_mstatus_mie ? _GEN : 16'h0000);
	wire [6:0] _GEN_0 = ~(reg_mtvec[0] ? 7'h7e : 7'h02);
	wire [11:0] decoded_addr_decoded_decoded_invInputs = ~io_rw_addr;
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_2 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_3 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_4 = {decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_34 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_35 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_36 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_37 = {io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_43 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_44 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_45 = {io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_46 = {decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_47 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_77 = {decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_78 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [31:0] _wdata_T_2 = (io_rw_cmd[1] ? io_rw_rdata_0 : 32'h00000000) | io_rw_wdata;
	wire [31:0] _wdata_T_6 = ~(&io_rw_cmd[1:0] ? io_rw_wdata : 32'h00000000);
	wire [31:0] wdata = _wdata_T_2 & _wdata_T_6;
	wire system_insn = io_rw_cmd == 3'h4;
	wire [11:0] _GEN_1 = ~io_rw_addr;
	wire insn_call = system_insn & (&{_GEN_1[0], _GEN_1[1], _GEN_1[2], _GEN_1[3], _GEN_1[4], _GEN_1[5], _GEN_1[6], _GEN_1[7], _GEN_1[8], _GEN_1[9], _GEN_1[10], _GEN_1[11]});
	wire insn_break = system_insn & (&{io_rw_addr[0], _GEN_1[1], _GEN_1[2], _GEN_1[3], _GEN_1[4], _GEN_1[5], _GEN_1[6], _GEN_1[7], _GEN_1[8], _GEN_1[9], _GEN_1[10], _GEN_1[11]});
	wire insn_ret = system_insn & |{&{_GEN_1[2], _GEN_1[3], _GEN_1[4], _GEN_1[5], _GEN_1[6], _GEN_1[7], io_rw_addr[8], io_rw_addr[9], _GEN_1[10], _GEN_1[11]}, &{io_rw_addr[10], _GEN_1[11]}};
	wire [31:0] cause = (insn_call ? {28'h0000000, {3'h1, ~reg_mstatus_v} - 4'h8} : (insn_break ? 32'h00000003 : io_cause));
	wire _causeIsDebugTrigger_T_2 = cause[7:0] == 8'h0e;
	wire causeIsDebugInt = cause[31] & _causeIsDebugTrigger_T_2;
	wire causeIsDebugTrigger = ~cause[31] & _causeIsDebugTrigger_T_2;
	wire trapToDebug = (((reg_singleStepped | causeIsDebugInt) | causeIsDebugTrigger) | ((~cause[31] & insn_break) & reg_dcsr_ebreakm)) | reg_debug;
	wire _exception_T = insn_call | insn_break;
	assign io_singleStep = reg_dcsr_step & ~reg_debug;
	wire exception = _exception_T | io_exception;
	wire _GEN_3 = io_rw_addr[10] & io_rw_addr[7];
	wire [31:0] _GEN_4 = {large_1[25:0], small_1};
	wire [31:0] _GEN_5 = {large_0[25:0], small_0};
	wire [31:0] _io_rw_rdata_T_180 = ({1'h0, (&{io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]} ? 31'h40000100 : 31'h00000000)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T ? {19'h00000, reg_mstatus_mpp, 3'h0, reg_mstatus_mpie, 3'h0, reg_mstatus_mie, 3'h0} : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_3 ? reg_mtvec & {25'h1ffffff, _GEN_0} : 32'h00000000);
	wire [31:0] _io_rw_rdata_T_186 = (((({_io_rw_rdata_T_180[31:16], _io_rw_rdata_T_180[15:0] | (&{io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]} ? read_mip : 16'h0000)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_2 ? reg_mie : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_34 ? reg_mscratch : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_35 ? {reg_mepc[31:2], 2'h0} : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_37 ? reg_mtval : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_36 ? reg_mcause : 32'h00000000);
	wire [31:0] _io_rw_rdata_T_190 = (({_io_rw_rdata_T_186[31:1], _io_rw_rdata_T_186[0] | (&{decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], io_rw_addr[11]} & io_hartid)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_43 ? {16'h4000, reg_dcsr_ebreakm, 6'h00, reg_dcsr_cause, reg_dcsr_v, 2'h0, reg_dcsr_step, 2'h3} : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_44 ? {reg_dpc[31:2], 2'h0} : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_45 ? reg_dscratch0 : 32'h00000000);
	assign io_rw_rdata_0 = ((((((({_io_rw_rdata_T_190[31:3], _io_rw_rdata_T_190[2:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_4 ? reg_mcountinhibit : 3'h0)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_46 ? _GEN_4 : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_47 ? _GEN_5 : 32'h00000000)) | (&{decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? _GEN_4 : 32'h00000000)) | (&{decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? _GEN_5 : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_77 ? large_1[57:26] : 32'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_78 ? large_0[57:26] : 32'h00000000)) | (&{decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? large_1[57:26] : 32'h00000000)) | (&{decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? large_0[57:26] : 32'h00000000);
	wire csr_wen = ((io_rw_cmd == 3'h6) | &io_rw_cmd) | (io_rw_cmd == 3'h5);
	wire [6:0] nextSmall = {1'h0, small_0} + {6'h00, io_retire};
	wire _large_T_2 = nextSmall[6] & ~reg_mcountinhibit[2];
	wire [57:0] _large_r_T = large_0 + 58'h000000000000001;
	wire _GEN_6 = ~insn_ret | _GEN_3;
	wire _GEN_7 = csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T);
	wire [31:0] epc = {io_pc[31:2], 2'h0};
	wire _GEN_8 = (exception & trapToDebug) & ~reg_debug;
	wire _GEN_9 = ~exception | trapToDebug;
	always @(posedge clock) begin
		if (reset) begin
			reg_mstatus_v <= 1'h0;
			reg_mstatus_mpv <= 1'h0;
			reg_mstatus_gva <= 1'h0;
			reg_mstatus_mpp <= 2'h3;
			reg_mstatus_mpie <= 1'h0;
			reg_mstatus_mie <= 1'h0;
			reg_dcsr_ebreakm <= 1'h0;
			reg_dcsr_cause <= 3'h0;
			reg_dcsr_v <= 1'h0;
			reg_dcsr_step <= 1'h0;
			reg_debug <= 1'h0;
			reg_mcause <= 32'h00000000;
			reg_mtvec <= 32'h00000000;
			reg_mcountinhibit <= 3'h0;
			small_0 <= 6'h00;
			large_0 <= 58'h000000000000000;
			io_status_cease_r <= 1'h0;
		end
		else begin
			reg_mstatus_v <= (~insn_ret & (~exception | (trapToDebug & reg_debug))) & reg_mstatus_v;
			reg_mstatus_mpv <= _GEN_6 & (_GEN_9 ? reg_mstatus_mpv : reg_mstatus_v);
			reg_mstatus_gva <= _GEN_9 & reg_mstatus_gva;
			if (_GEN_6 & _GEN_9)
				;
			else
				reg_mstatus_mpp <= 2'h3;
			reg_mstatus_mpie <= (_GEN_7 ? wdata[7] : (insn_ret & ~_GEN_3) | (_GEN_9 ? reg_mstatus_mpie : reg_mstatus_mie));
			reg_mstatus_mie <= (_GEN_7 ? wdata[3] : (_GEN_6 ? _GEN_9 & reg_mstatus_mie : reg_mstatus_mpie));
			if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_43)) begin
				reg_dcsr_ebreakm <= wdata[15];
				reg_dcsr_step <= wdata[2];
			end
			if (_GEN_8) begin
				reg_dcsr_cause <= (reg_singleStepped ? 3'h4 : {1'h0, (causeIsDebugInt ? 2'h3 : (causeIsDebugTrigger ? 2'h2 : 2'h1))});
				reg_dcsr_v <= reg_mstatus_v;
			end
			reg_debug <= ~(insn_ret & _GEN_3) & (_GEN_8 | reg_debug);
			if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_36))
				reg_mcause <= wdata & 32'h8000000f;
			else if (_GEN_9)
				;
			else
				reg_mcause <= cause;
			if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_3))
				reg_mtvec <= wdata;
			if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_4))
				reg_mcountinhibit <= (_wdata_T_2[2:0] & _wdata_T_6[2:0]) & 3'h5;
			if (csr_wen) begin
				if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_78)
					large_0 <= {wdata, large_0[25:0]};
				else if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_47) begin
					small_0 <= wdata[5:0];
					large_0 <= {large_0[57:26], wdata[31:6]};
				end
				else begin
					if (reg_mcountinhibit[2])
						;
					else
						small_0 <= nextSmall[5:0];
					if (_large_T_2)
						large_0 <= _large_r_T;
				end
			end
			else begin
				if (reg_mcountinhibit[2])
					;
				else
					small_0 <= nextSmall[5:0];
				if (_large_T_2)
					large_0 <= _large_r_T;
			end
			io_status_cease_r <= (system_insn & (&{io_rw_addr[2], _GEN_1[3], _GEN_1[4], _GEN_1[5], _GEN_1[6], _GEN_1[7], io_rw_addr[8], io_rw_addr[9], _GEN_1[10], _GEN_1[11]})) | io_status_cease_r;
		end
		if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_44))
			reg_dpc <= {wdata[31:2], 2'h0};
		else if (_GEN_8)
			reg_dpc <= epc;
		if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_45))
			reg_dscratch0 <= wdata;
		reg_singleStepped <= io_singleStep & ((io_retire | exception) | reg_singleStepped);
		if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_2))
			reg_mie <= {16'h0000, (_wdata_T_2[15:0] & _wdata_T_6[15:0]) & 16'h0888};
		if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_35))
			reg_mepc <= {wdata[31:2], 2'h0};
		else if (_GEN_9)
			;
		else
			reg_mepc <= epc;
		if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_37))
			reg_mtval <= wdata;
		else if (_GEN_9)
			;
		else
			reg_mtval <= (insn_break ? epc : io_tval);
		if (csr_wen & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_34))
			reg_mscratch <= wdata;
	end
	wire [6:0] nextSmall_1 = {1'h0, small_1} + {6'h00, ~(reg_wfi | io_status_cease_r)};
	wire _large_T_5 = nextSmall_1[6] & ~reg_mcountinhibit[0];
	wire [57:0] _large_r_T_2 = large_1 + 58'h000000000000001;
	always @(posedge io_ungated_clock)
		if (reset) begin
			reg_wfi <= 1'h0;
			small_1 <= 6'h00;
			large_1 <= 58'h000000000000000;
		end
		else begin
			reg_wfi <= ~((|{_GEN[11], _GEN[7], _GEN[3]} | io_interrupts_debug) | exception) & ((((system_insn & (&{io_rw_addr[8], _GEN_1[9], _GEN_1[10], _GEN_1[11]})) & ~io_singleStep) & ~reg_debug) | reg_wfi);
			if (csr_wen) begin
				if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_77)
					large_1 <= {wdata, large_1[25:0]};
				else if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_46) begin
					small_1 <= wdata[5:0];
					large_1 <= {large_1[57:26], wdata[31:6]};
				end
				else begin
					if (reg_mcountinhibit[0])
						;
					else
						small_1 <= nextSmall_1[5:0];
					if (_large_T_5)
						large_1 <= _large_r_T_2;
				end
			end
			else begin
				if (reg_mcountinhibit[0])
					;
				else
					small_1 <= nextSmall_1[5:0];
				if (_large_T_5)
					large_1 <= _large_r_T_2;
			end
		end
	assign io_rw_rdata = io_rw_rdata_0;
	assign io_eret = _exception_T | insn_ret;
	assign io_evec = (insn_ret ? {(_GEN_3 ? reg_dpc[31:2] : reg_mepc[31:2]), 2'h0} : (trapToDebug ? {20'h00000, (reg_debug ? {8'h80, ~insn_break, 3'h0} : 12'h800)} : {(((reg_mtvec[0] & _GEN_0[0]) & cause[31]) & (cause[7:5] == 3'h0) ? {reg_mtvec[31:7], cause[4:0]} : reg_mtvec[31:2] & {25'h1ffffff, _GEN_0[6:2]}), 2'h0}));
	assign io_time = {large_1[25:0], small_1};
	assign io_interrupt = ((((((((((((((((((io_interrupts_debug | m_interrupts[15]) | m_interrupts[14]) | m_interrupts[13]) | m_interrupts[12]) | m_interrupts[11]) | m_interrupts[3]) | m_interrupts[7]) | m_interrupts[9]) | m_interrupts[1]) | m_interrupts[5]) | m_interrupts[10]) | m_interrupts[2]) | m_interrupts[6]) | m_interrupts[8]) | m_interrupts[0]) | m_interrupts[4]) & ~io_singleStep) | reg_singleStepped) & ~(reg_debug | io_status_cease_r);
	assign io_interrupt_cause = {28'h0000000, (io_interrupts_debug ? 4'he : (m_interrupts[15] ? 4'hf : (m_interrupts[14] ? 4'he : (m_interrupts[13] ? 4'hd : (m_interrupts[12] ? 4'hc : (m_interrupts[11] ? 4'hb : (m_interrupts[3] ? 4'h3 : (m_interrupts[7] ? 4'h7 : (m_interrupts[9] ? 4'h9 : (m_interrupts[1] ? 4'h1 : (m_interrupts[5] ? 4'h5 : (m_interrupts[10] ? 4'ha : (m_interrupts[2] ? 4'h2 : (m_interrupts[6] ? 4'h6 : (m_interrupts[8] ? 4'h8 : {1'h0, ~m_interrupts[0], 2'h0})))))))))))))))} - 32'h80000000;
endmodule