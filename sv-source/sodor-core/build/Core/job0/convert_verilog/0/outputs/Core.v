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
module Core (
	clock,
	reset,
	io_imem_req_valid,
	io_imem_req_bits_addr,
	io_imem_resp_valid,
	io_imem_resp_bits_data,
	io_dmem_req_valid,
	io_dmem_req_bits_addr,
	io_dmem_req_bits_data,
	io_dmem_req_bits_fcn,
	io_dmem_req_bits_typ,
	io_dmem_resp_valid,
	io_dmem_resp_bits_data,
	io_interrupt_debug,
	io_interrupt_mtip,
	io_interrupt_msip,
	io_interrupt_meip,
	io_hartid
);
	input clock;
	input reset;
	output wire io_imem_req_valid;
	output wire [31:0] io_imem_req_bits_addr;
	input io_imem_resp_valid;
	input [31:0] io_imem_resp_bits_data;
	output wire io_dmem_req_valid;
	output wire [31:0] io_dmem_req_bits_addr;
	output wire [31:0] io_dmem_req_bits_data;
	output wire io_dmem_req_bits_fcn;
	output wire [2:0] io_dmem_req_bits_typ;
	input io_dmem_resp_valid;
	input [31:0] io_dmem_resp_bits_data;
	input io_interrupt_debug;
	input io_interrupt_mtip;
	input io_interrupt_msip;
	input io_interrupt_meip;
	input io_hartid;
	wire [31:0] _d_io_dat_dec_inst;
	wire _d_io_dat_dec_valid;
	wire _d_io_dat_exe_br_eq;
	wire _d_io_dat_exe_br_lt;
	wire _d_io_dat_exe_br_ltu;
	wire [3:0] _d_io_dat_exe_br_type;
	wire _d_io_dat_exe_inst_misaligned;
	wire _d_io_dat_mem_ctrl_dmem_val;
	wire _d_io_dat_mem_data_misaligned;
	wire _d_io_dat_mem_store;
	wire _d_io_dat_csr_eret;
	wire _d_io_dat_csr_interrupt;
	wire _c_io_ctl_dec_stall;
	wire _c_io_ctl_full_stall;
	wire [1:0] _c_io_ctl_exe_pc_sel;
	wire [3:0] _c_io_ctl_br_type;
	wire _c_io_ctl_if_kill;
	wire _c_io_ctl_dec_kill;
	wire [1:0] _c_io_ctl_op1_sel;
	wire [2:0] _c_io_ctl_op2_sel;
	wire [3:0] _c_io_ctl_alu_fun;
	wire [1:0] _c_io_ctl_wb_sel;
	wire _c_io_ctl_rf_wen;
	wire _c_io_ctl_mem_val;
	wire [1:0] _c_io_ctl_mem_fcn;
	wire [2:0] _c_io_ctl_mem_typ;
	wire [2:0] _c_io_ctl_csr_cmd;
	wire _c_io_ctl_fencei;
	wire _c_io_ctl_pipeline_kill;
	wire _c_io_ctl_mem_exception;
	wire [31:0] _c_io_ctl_mem_exception_cause;
	CtlPath c(
		.clock(clock),
		.reset(reset),
		.io_dmem_resp_valid(io_dmem_resp_valid),
		.io_dat_dec_inst(_d_io_dat_dec_inst),
		.io_dat_dec_valid(_d_io_dat_dec_valid),
		.io_dat_exe_br_eq(_d_io_dat_exe_br_eq),
		.io_dat_exe_br_lt(_d_io_dat_exe_br_lt),
		.io_dat_exe_br_ltu(_d_io_dat_exe_br_ltu),
		.io_dat_exe_br_type(_d_io_dat_exe_br_type),
		.io_dat_exe_inst_misaligned(_d_io_dat_exe_inst_misaligned),
		.io_dat_mem_ctrl_dmem_val(_d_io_dat_mem_ctrl_dmem_val),
		.io_dat_mem_data_misaligned(_d_io_dat_mem_data_misaligned),
		.io_dat_mem_store(_d_io_dat_mem_store),
		.io_dat_csr_eret(_d_io_dat_csr_eret),
		.io_dat_csr_interrupt(_d_io_dat_csr_interrupt),
		.io_ctl_dec_stall(_c_io_ctl_dec_stall),
		.io_ctl_full_stall(_c_io_ctl_full_stall),
		.io_ctl_exe_pc_sel(_c_io_ctl_exe_pc_sel),
		.io_ctl_br_type(_c_io_ctl_br_type),
		.io_ctl_if_kill(_c_io_ctl_if_kill),
		.io_ctl_dec_kill(_c_io_ctl_dec_kill),
		.io_ctl_op1_sel(_c_io_ctl_op1_sel),
		.io_ctl_op2_sel(_c_io_ctl_op2_sel),
		.io_ctl_alu_fun(_c_io_ctl_alu_fun),
		.io_ctl_wb_sel(_c_io_ctl_wb_sel),
		.io_ctl_rf_wen(_c_io_ctl_rf_wen),
		.io_ctl_mem_val(_c_io_ctl_mem_val),
		.io_ctl_mem_fcn(_c_io_ctl_mem_fcn),
		.io_ctl_mem_typ(_c_io_ctl_mem_typ),
		.io_ctl_csr_cmd(_c_io_ctl_csr_cmd),
		.io_ctl_fencei(_c_io_ctl_fencei),
		.io_ctl_pipeline_kill(_c_io_ctl_pipeline_kill),
		.io_ctl_mem_exception(_c_io_ctl_mem_exception),
		.io_ctl_mem_exception_cause(_c_io_ctl_mem_exception_cause)
	);
	DatPath d(
		.clock(clock),
		.reset(reset),
		.io_imem_req_valid(io_imem_req_valid),
		.io_imem_req_bits_addr(io_imem_req_bits_addr),
		.io_imem_resp_valid(io_imem_resp_valid),
		.io_imem_resp_bits_data(io_imem_resp_bits_data),
		.io_dmem_req_valid(io_dmem_req_valid),
		.io_dmem_req_bits_addr(io_dmem_req_bits_addr),
		.io_dmem_req_bits_data(io_dmem_req_bits_data),
		.io_dmem_req_bits_fcn(io_dmem_req_bits_fcn),
		.io_dmem_req_bits_typ(io_dmem_req_bits_typ),
		.io_dmem_resp_bits_data(io_dmem_resp_bits_data),
		.io_ctl_dec_stall(_c_io_ctl_dec_stall),
		.io_ctl_full_stall(_c_io_ctl_full_stall),
		.io_ctl_exe_pc_sel(_c_io_ctl_exe_pc_sel),
		.io_ctl_br_type(_c_io_ctl_br_type),
		.io_ctl_if_kill(_c_io_ctl_if_kill),
		.io_ctl_dec_kill(_c_io_ctl_dec_kill),
		.io_ctl_op1_sel(_c_io_ctl_op1_sel),
		.io_ctl_op2_sel(_c_io_ctl_op2_sel),
		.io_ctl_alu_fun(_c_io_ctl_alu_fun),
		.io_ctl_wb_sel(_c_io_ctl_wb_sel),
		.io_ctl_rf_wen(_c_io_ctl_rf_wen),
		.io_ctl_mem_val(_c_io_ctl_mem_val),
		.io_ctl_mem_fcn(_c_io_ctl_mem_fcn),
		.io_ctl_mem_typ(_c_io_ctl_mem_typ),
		.io_ctl_csr_cmd(_c_io_ctl_csr_cmd),
		.io_ctl_fencei(_c_io_ctl_fencei),
		.io_ctl_pipeline_kill(_c_io_ctl_pipeline_kill),
		.io_ctl_mem_exception(_c_io_ctl_mem_exception),
		.io_ctl_mem_exception_cause(_c_io_ctl_mem_exception_cause),
		.io_dat_dec_inst(_d_io_dat_dec_inst),
		.io_dat_dec_valid(_d_io_dat_dec_valid),
		.io_dat_exe_br_eq(_d_io_dat_exe_br_eq),
		.io_dat_exe_br_lt(_d_io_dat_exe_br_lt),
		.io_dat_exe_br_ltu(_d_io_dat_exe_br_ltu),
		.io_dat_exe_br_type(_d_io_dat_exe_br_type),
		.io_dat_exe_inst_misaligned(_d_io_dat_exe_inst_misaligned),
		.io_dat_mem_ctrl_dmem_val(_d_io_dat_mem_ctrl_dmem_val),
		.io_dat_mem_data_misaligned(_d_io_dat_mem_data_misaligned),
		.io_dat_mem_store(_d_io_dat_mem_store),
		.io_dat_csr_eret(_d_io_dat_csr_eret),
		.io_dat_csr_interrupt(_d_io_dat_csr_interrupt),
		.io_interrupt_debug(io_interrupt_debug),
		.io_interrupt_mtip(io_interrupt_mtip),
		.io_interrupt_msip(io_interrupt_msip),
		.io_interrupt_meip(io_interrupt_meip),
		.io_hartid(io_hartid)
	);
endmodule
module CtlPath (
	clock,
	reset,
	io_dmem_resp_valid,
	io_dat_dec_inst,
	io_dat_dec_valid,
	io_dat_exe_br_eq,
	io_dat_exe_br_lt,
	io_dat_exe_br_ltu,
	io_dat_exe_br_type,
	io_dat_exe_inst_misaligned,
	io_dat_mem_ctrl_dmem_val,
	io_dat_mem_data_misaligned,
	io_dat_mem_store,
	io_dat_csr_eret,
	io_dat_csr_interrupt,
	io_ctl_dec_stall,
	io_ctl_full_stall,
	io_ctl_exe_pc_sel,
	io_ctl_br_type,
	io_ctl_if_kill,
	io_ctl_dec_kill,
	io_ctl_op1_sel,
	io_ctl_op2_sel,
	io_ctl_alu_fun,
	io_ctl_wb_sel,
	io_ctl_rf_wen,
	io_ctl_mem_val,
	io_ctl_mem_fcn,
	io_ctl_mem_typ,
	io_ctl_csr_cmd,
	io_ctl_fencei,
	io_ctl_pipeline_kill,
	io_ctl_mem_exception,
	io_ctl_mem_exception_cause
);
	input clock;
	input reset;
	input io_dmem_resp_valid;
	input [31:0] io_dat_dec_inst;
	input io_dat_dec_valid;
	input io_dat_exe_br_eq;
	input io_dat_exe_br_lt;
	input io_dat_exe_br_ltu;
	input [3:0] io_dat_exe_br_type;
	input io_dat_exe_inst_misaligned;
	input io_dat_mem_ctrl_dmem_val;
	input io_dat_mem_data_misaligned;
	input io_dat_mem_store;
	input io_dat_csr_eret;
	input io_dat_csr_interrupt;
	output wire io_ctl_dec_stall;
	output wire io_ctl_full_stall;
	output wire [1:0] io_ctl_exe_pc_sel;
	output wire [3:0] io_ctl_br_type;
	output wire io_ctl_if_kill;
	output wire io_ctl_dec_kill;
	output wire [1:0] io_ctl_op1_sel;
	output wire [2:0] io_ctl_op2_sel;
	output wire [3:0] io_ctl_alu_fun;
	output wire [1:0] io_ctl_wb_sel;
	output wire io_ctl_rf_wen;
	output wire io_ctl_mem_val;
	output wire [1:0] io_ctl_mem_fcn;
	output wire [2:0] io_ctl_mem_typ;
	output wire [2:0] io_ctl_csr_cmd;
	output wire io_ctl_fencei;
	output wire io_ctl_pipeline_kill;
	output wire io_ctl_mem_exception;
	output wire [31:0] io_ctl_mem_exception_cause;
	wire io_ctl_mem_exception_0;
	wire io_ctl_pipeline_kill_0;
	wire [9:0] _GEN = {io_dat_dec_inst[14:12], io_dat_dec_inst[6:0]};
	wire _csignals_T_1 = _GEN == 10'h103;
	wire _csignals_T_3 = _GEN == 10'h003;
	wire _csignals_T_5 = _GEN == 10'h203;
	wire _csignals_T_7 = _GEN == 10'h083;
	wire _csignals_T_9 = _GEN == 10'h283;
	wire _csignals_T_11 = _GEN == 10'h123;
	wire _csignals_T_13 = _GEN == 10'h023;
	wire _csignals_T_632 = _GEN == 10'h0a3;
	wire _csignals_T_17 = io_dat_dec_inst[6:0] == 7'h17;
	wire _csignals_T_19 = io_dat_dec_inst[6:0] == 7'h37;
	wire _csignals_T_21 = _GEN == 10'h013;
	wire _csignals_T_23 = _GEN == 10'h393;
	wire _csignals_T_25 = _GEN == 10'h313;
	wire _csignals_T_27 = _GEN == 10'h213;
	wire _csignals_T_29 = _GEN == 10'h113;
	wire _csignals_T_31 = _GEN == 10'h193;
	wire [16:0] _GEN_0 = {io_dat_dec_inst[31:25], io_dat_dec_inst[14:12], io_dat_dec_inst[6:0]};
	wire _csignals_T_33 = _GEN_0 == 17'h00093;
	wire _csignals_T_35 = _GEN_0 == 17'h08293;
	wire _csignals_T_37 = _GEN_0 == 17'h00293;
	wire _csignals_T_39 = _GEN_0 == 17'h000b3;
	wire _csignals_T_41 = _GEN_0 == 17'h00033;
	wire _csignals_T_43 = _GEN_0 == 17'h08033;
	wire _csignals_T_45 = _GEN_0 == 17'h00133;
	wire _csignals_T_47 = _GEN_0 == 17'h001b3;
	wire _csignals_T_49 = _GEN_0 == 17'h003b3;
	wire _csignals_T_51 = _GEN_0 == 17'h00333;
	wire _csignals_T_53 = _GEN_0 == 17'h00233;
	wire _csignals_T_55 = _GEN_0 == 17'h082b3;
	wire _csignals_T_57 = {io_dat_dec_inst[31:25], io_dat_dec_inst[14:12], io_dat_dec_inst[6:0]} == 17'h002b3;
	wire _csignals_T_59 = io_dat_dec_inst[6:0] == 7'h6f;
	wire _csignals_T_61 = _GEN == 10'h067;
	wire _csignals_T_63 = _GEN == 10'h063;
	wire _csignals_T_65 = _GEN == 10'h0e3;
	wire _csignals_T_67 = _GEN == 10'h2e3;
	wire _csignals_T_69 = _GEN == 10'h3e3;
	wire _csignals_T_71 = _GEN == 10'h263;
	wire _csignals_T_73 = _GEN == 10'h363;
	wire _csignals_T_75 = _GEN == 10'h2f3;
	wire _csignals_T_77 = _GEN == 10'h373;
	wire _csignals_T_79 = _GEN == 10'h0f3;
	wire _csignals_T_81 = _GEN == 10'h173;
	wire _csignals_T_83 = _GEN == 10'h1f3;
	wire _csignals_T_499 = _GEN == 10'h3f3;
	wire _csignals_T_87 = io_dat_dec_inst == 32'h00000073;
	wire _csignals_T_89 = io_dat_dec_inst == 32'h30200073;
	wire _csignals_T_91 = io_dat_dec_inst == 32'h7b200073;
	wire _csignals_T_93 = io_dat_dec_inst == 32'h00100073;
	wire _csignals_T_95 = io_dat_dec_inst == 32'h10500073;
	wire _csignals_T_738 = _GEN == 10'h08f;
	wire _GEN_1 = ((((((((_csignals_T_39 | _csignals_T_41) | _csignals_T_43) | _csignals_T_45) | _csignals_T_47) | _csignals_T_49) | _csignals_T_51) | _csignals_T_53) | _csignals_T_55) | _csignals_T_57;
	wire _GEN_2 = ((((((((_csignals_T_21 | _csignals_T_23) | _csignals_T_25) | _csignals_T_27) | _csignals_T_29) | _csignals_T_31) | _csignals_T_33) | _csignals_T_35) | _csignals_T_37) | _GEN_1;
	wire _GEN_3 = ((((_csignals_T_11 | _csignals_T_13) | _csignals_T_632) | _csignals_T_17) | _csignals_T_19) | _GEN_2;
	wire _GEN_4 = (_csignals_T_79 | _csignals_T_81) | _csignals_T_83;
	wire _GEN_5 = ((((_csignals_T_63 | _csignals_T_65) | _csignals_T_67) | _csignals_T_69) | _csignals_T_71) | _csignals_T_73;
	wire _GEN_6 = (_csignals_T_59 | _csignals_T_61) | _GEN_5;
	wire _GEN_7 = (((((((((((((((((((_csignals_T_19 | _csignals_T_21) | _csignals_T_23) | _csignals_T_25) | _csignals_T_27) | _csignals_T_29) | _csignals_T_31) | _csignals_T_33) | _csignals_T_35) | _csignals_T_37) | _csignals_T_39) | _csignals_T_41) | _csignals_T_43) | _csignals_T_45) | _csignals_T_47) | _csignals_T_49) | _csignals_T_51) | _csignals_T_53) | _csignals_T_55) | _csignals_T_57) | _GEN_6;
	wire _GEN_8 = (_csignals_T_11 | _csignals_T_13) | _csignals_T_632;
	wire _GEN_9 = ((((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9) | _GEN_8;
	wire _GEN_10 = (((((((_csignals_T_21 | _csignals_T_23) | _csignals_T_25) | _csignals_T_27) | _csignals_T_29) | _csignals_T_31) | _csignals_T_33) | _csignals_T_35) | _csignals_T_37;
	wire _GEN_11 = _csignals_T_17 | _csignals_T_19;
	wire _GEN_12 = (((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9;
	wire _GEN_13 = (_csignals_T_75 | _csignals_T_77) | _GEN_4;
	wire _GEN_14 = (((((_csignals_T_63 | _csignals_T_65) | _csignals_T_67) | _csignals_T_69) | _csignals_T_71) | _csignals_T_73) | _GEN_13;
	wire _GEN_15 = _csignals_T_59 | _csignals_T_61;
	wire _GEN_16 = _csignals_T_83 | _csignals_T_499;
	wire _GEN_17 = (((_csignals_T_75 | _csignals_T_77) | _csignals_T_79) | _csignals_T_81) | _GEN_16;
	wire _GEN_18 = _csignals_T_11 | _csignals_T_13;
	wire csignals_9 = (((((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9) | _GEN_18) | _csignals_T_632;
	wire csignals_10 = ~_GEN_12 & (_GEN_18 | _csignals_T_632);
	wire [2:0] csignals_12 = (((((((((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9) | _csignals_T_11) | _csignals_T_13) | _csignals_T_632) | _csignals_T_17) | _GEN_7 ? 3'h0 : (_csignals_T_75 ? 3'h5 : (_csignals_T_77 ? 3'h6 : (_csignals_T_79 ? 3'h5 : (_csignals_T_81 ? 3'h6 : (_GEN_16 ? 3'h7 : {((_csignals_T_87 | _csignals_T_89) | _csignals_T_91) | _csignals_T_93, 2'h0}))))));
	wire csignals_13 = ~(((((((((((((((((((((((((((((((((((((((((((((((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9) | _csignals_T_11) | _csignals_T_13) | _csignals_T_632) | _csignals_T_17) | _csignals_T_19) | _csignals_T_21) | _csignals_T_23) | _csignals_T_25) | _csignals_T_27) | _csignals_T_29) | _csignals_T_31) | _csignals_T_33) | _csignals_T_35) | _csignals_T_37) | _csignals_T_39) | _csignals_T_41) | _csignals_T_43) | _csignals_T_45) | _csignals_T_47) | _csignals_T_49) | _csignals_T_51) | _csignals_T_53) | _csignals_T_55) | _csignals_T_57) | _csignals_T_59) | _csignals_T_61) | _csignals_T_63) | _csignals_T_65) | _csignals_T_67) | _csignals_T_69) | _csignals_T_71) | _csignals_T_73) | _csignals_T_75) | _csignals_T_77) | _csignals_T_79) | _csignals_T_81) | _csignals_T_83) | _csignals_T_499) | _csignals_T_87) | _csignals_T_89) | _csignals_T_91) | _csignals_T_93) | _csignals_T_95) & _csignals_T_738;
	wire [1:0] ctrl_exe_pc_sel = (io_ctl_pipeline_kill_0 ? 2'h3 : (io_dat_exe_br_type == 4'h0 ? 2'h0 : (io_dat_exe_br_type == 4'h1 ? {1'h0, ~io_dat_exe_br_eq} : (io_dat_exe_br_type == 4'h2 ? {1'h0, io_dat_exe_br_eq} : (io_dat_exe_br_type == 4'h3 ? {1'h0, ~io_dat_exe_br_lt} : (io_dat_exe_br_type == 4'h4 ? {1'h0, ~io_dat_exe_br_ltu} : (io_dat_exe_br_type == 4'h5 ? {1'h0, io_dat_exe_br_lt} : (io_dat_exe_br_type == 4'h6 ? {1'h0, io_dat_exe_br_ltu} : (io_dat_exe_br_type == 4'h7 ? 2'h1 : {io_dat_exe_br_type == 4'h8, 1'h0})))))))));
	reg ifkill_REG;
	assign io_ctl_pipeline_kill_0 = (io_dat_csr_eret | io_ctl_mem_exception_0) | io_dat_csr_interrupt;
	reg [4:0] exe_reg_wbaddr;
	reg exe_reg_illegal;
	reg exe_reg_is_csr;
	reg exe_inst_is_load;
	wire stall = (((((exe_inst_is_load & (exe_reg_wbaddr == io_dat_dec_inst[19:15])) & |exe_reg_wbaddr) & ~(|ctrl_exe_pc_sel)) & (_GEN_9 | (~_GEN_11 & (_GEN_2 | (~_csignals_T_59 & ((_csignals_T_61 | _GEN_14) | _csignals_T_499)))))) | ((((exe_inst_is_load & (exe_reg_wbaddr == io_dat_dec_inst[24:20])) & |exe_reg_wbaddr) & ~(|ctrl_exe_pc_sel | _GEN_12)) & (_GEN_8 | (~((_csignals_T_17 | _csignals_T_19) | _GEN_10) & (_GEN_1 | (~_GEN_15 & (_GEN_14 | _csignals_T_499))))))) | exe_reg_is_csr;
	wire _full_stall_T_2 = (io_dat_mem_ctrl_dmem_val & io_dmem_resp_valid) | ~io_dat_mem_ctrl_dmem_val;
	reg io_ctl_fencei_REG;
	reg io_ctl_mem_exception_REG;
	assign io_ctl_mem_exception_0 = io_ctl_mem_exception_REG | io_dat_mem_data_misaligned;
	reg io_ctl_mem_exception_cause_REG;
	reg io_ctl_mem_exception_cause_REG_1;
	wire _GEN_19 = ~stall & _full_stall_T_2;
	wire _GEN_20 = stall & _full_stall_T_2;
	always @(posedge clock) begin
		ifkill_REG <= csignals_13;
		if (_GEN_19)
			exe_reg_wbaddr <= (|ctrl_exe_pc_sel ? 5'h00 : io_dat_dec_inst[11:7]);
		else if (_GEN_20)
			exe_reg_wbaddr <= 5'h00;
		io_ctl_fencei_REG <= csignals_13;
		io_ctl_mem_exception_REG <= (exe_reg_illegal | io_dat_exe_inst_misaligned) & ~io_dat_csr_eret;
		io_ctl_mem_exception_cause_REG <= exe_reg_illegal;
		io_ctl_mem_exception_cause_REG_1 <= io_dat_exe_inst_misaligned;
		if (reset) begin
			exe_reg_illegal <= 1'h0;
			exe_reg_is_csr <= 1'h0;
			exe_inst_is_load <= 1'h0;
		end
		else begin
			exe_reg_illegal <= ~io_dat_csr_eret & (_GEN_19 ? (~(|ctrl_exe_pc_sel) & ~(((((((((((((((((((((((((((((((((((((((((((((((((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9) | _csignals_T_11) | _csignals_T_13) | _csignals_T_632) | _csignals_T_17) | _csignals_T_19) | _csignals_T_21) | _csignals_T_23) | _csignals_T_25) | _csignals_T_27) | _csignals_T_29) | _csignals_T_31) | _csignals_T_33) | _csignals_T_35) | _csignals_T_37) | _csignals_T_39) | _csignals_T_41) | _csignals_T_43) | _csignals_T_45) | _csignals_T_47) | _csignals_T_49) | _csignals_T_51) | _csignals_T_53) | _csignals_T_55) | _csignals_T_57) | _csignals_T_59) | _csignals_T_61) | _csignals_T_63) | _csignals_T_65) | _csignals_T_67) | _csignals_T_69) | _csignals_T_71) | _csignals_T_73) | _csignals_T_75) | _csignals_T_77) | _csignals_T_79) | _csignals_T_81) | _csignals_T_83) | _csignals_T_499) | _csignals_T_87) | _csignals_T_89) | _csignals_T_91) | _csignals_T_93) | _csignals_T_95) | _csignals_T_738) | (_GEN == 10'h00f))) & io_dat_dec_valid : ~_GEN_20 & exe_reg_illegal);
			exe_reg_is_csr <= (_GEN_19 ? (~(|ctrl_exe_pc_sel) & |csignals_12) & (csignals_12 != 3'h4) : ~_GEN_20 & exe_reg_is_csr);
			if (_full_stall_T_2)
				exe_inst_is_load <= csignals_9 & ~csignals_10;
		end
	end
	assign io_ctl_dec_stall = stall;
	assign io_ctl_full_stall = ~_full_stall_T_2;
	assign io_ctl_exe_pc_sel = ctrl_exe_pc_sel;
	assign io_ctl_br_type = (((((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9) | _GEN_3 ? 4'h0 : (_csignals_T_59 ? 4'h7 : (_csignals_T_61 ? 4'h8 : (_csignals_T_63 ? 4'h2 : (_csignals_T_65 ? 4'h1 : (_csignals_T_67 ? 4'h3 : (_csignals_T_69 ? 4'h4 : (_csignals_T_71 ? 4'h5 : (_csignals_T_73 ? 4'h6 : 4'h0)))))))));
	assign io_ctl_if_kill = (|ctrl_exe_pc_sel | csignals_13) | ifkill_REG;
	assign io_ctl_dec_kill = |ctrl_exe_pc_sel;
	assign io_ctl_op1_sel = (_GEN_9 ? 2'h0 : (_csignals_T_17 ? 2'h1 : (_GEN_7 ? 2'h0 : (_csignals_T_75 | _csignals_T_77 ? 2'h2 : (_GEN_4 ? 2'h0 : {_csignals_T_499, 1'h0})))));
	assign io_ctl_op2_sel = (_GEN_12 ? 3'h1 : (_GEN_8 ? 3'h2 : (_GEN_11 ? 3'h4 : (_GEN_10 ? 3'h1 : (_GEN_1 ? 3'h0 : (_csignals_T_59 ? 3'h5 : (_csignals_T_61 ? 3'h1 : (_GEN_5 ? 3'h3 : 3'h0))))))));
	assign io_ctl_alu_fun = ((((((((_csignals_T_1 | _csignals_T_3) | _csignals_T_5) | _csignals_T_7) | _csignals_T_9) | _csignals_T_11) | _csignals_T_13) | _csignals_T_632) | _csignals_T_17 ? 4'h0 : (_csignals_T_19 ? 4'hb : (_csignals_T_21 ? 4'h0 : (_csignals_T_23 ? 4'h5 : (_csignals_T_25 ? 4'h6 : (_csignals_T_27 ? 4'h7 : (_csignals_T_29 ? 4'h8 : (_csignals_T_31 ? 4'h9 : (_csignals_T_33 ? 4'h2 : (_csignals_T_35 ? 4'h4 : (_csignals_T_37 ? 4'h3 : (_csignals_T_39 ? 4'h2 : (_csignals_T_41 ? 4'h0 : (_csignals_T_43 ? 4'h1 : (_csignals_T_45 ? 4'h8 : (_csignals_T_47 ? 4'h9 : (_csignals_T_49 ? 4'h5 : (_csignals_T_51 ? 4'h6 : (_csignals_T_53 ? 4'h7 : (_csignals_T_55 ? 4'h4 : (_csignals_T_57 ? 4'h3 : (_GEN_6 | ~_GEN_17 ? 4'h0 : 4'ha))))))))))))))))))))));
	assign io_ctl_wb_sel = (_GEN_12 ? 2'h1 : (_GEN_3 ? 2'h0 : (_GEN_15 ? 2'h2 : (_GEN_5 ? 2'h0 : {2 {_GEN_17}}))));
	assign io_ctl_rf_wen = _GEN_12 | (~_GEN_8 & ((((((((((((((((((((((_csignals_T_17 | _csignals_T_19) | _csignals_T_21) | _csignals_T_23) | _csignals_T_25) | _csignals_T_27) | _csignals_T_29) | _csignals_T_31) | _csignals_T_33) | _csignals_T_35) | _csignals_T_37) | _csignals_T_39) | _csignals_T_41) | _csignals_T_43) | _csignals_T_45) | _csignals_T_47) | _csignals_T_49) | _csignals_T_51) | _csignals_T_53) | _csignals_T_55) | _csignals_T_57) | _GEN_15) | (~_GEN_5 & (_GEN_13 | _csignals_T_499))));
	assign io_ctl_mem_val = csignals_9;
	assign io_ctl_mem_fcn = {1'h0, csignals_10};
	assign io_ctl_mem_typ = (_csignals_T_1 ? 3'h3 : (_csignals_T_3 ? 3'h1 : (_csignals_T_5 ? 3'h5 : (_csignals_T_7 ? 3'h2 : (_csignals_T_9 ? 3'h6 : (_csignals_T_11 ? 3'h3 : (_csignals_T_13 ? 3'h1 : {1'h0, _csignals_T_632, 1'h0})))))));
	assign io_ctl_csr_cmd = (((csignals_12 == 3'h6) | &csignals_12) & (io_dat_dec_inst[19:15] == 5'h00) ? 3'h2 : csignals_12);
	assign io_ctl_fencei = csignals_13 | io_ctl_fencei_REG;
	assign io_ctl_pipeline_kill = io_ctl_pipeline_kill_0;
	assign io_ctl_mem_exception = io_ctl_mem_exception_0;
	assign io_ctl_mem_exception_cause = {29'h00000000, (io_ctl_mem_exception_cause_REG ? 3'h2 : (io_ctl_mem_exception_cause_REG_1 ? 3'h0 : {1'h1, io_dat_mem_store, 1'h0}))};
endmodule
module DatPath (
	clock,
	reset,
	io_imem_req_valid,
	io_imem_req_bits_addr,
	io_imem_resp_valid,
	io_imem_resp_bits_data,
	io_dmem_req_valid,
	io_dmem_req_bits_addr,
	io_dmem_req_bits_data,
	io_dmem_req_bits_fcn,
	io_dmem_req_bits_typ,
	io_dmem_resp_bits_data,
	io_ctl_dec_stall,
	io_ctl_full_stall,
	io_ctl_exe_pc_sel,
	io_ctl_br_type,
	io_ctl_if_kill,
	io_ctl_dec_kill,
	io_ctl_op1_sel,
	io_ctl_op2_sel,
	io_ctl_alu_fun,
	io_ctl_wb_sel,
	io_ctl_rf_wen,
	io_ctl_mem_val,
	io_ctl_mem_fcn,
	io_ctl_mem_typ,
	io_ctl_csr_cmd,
	io_ctl_fencei,
	io_ctl_pipeline_kill,
	io_ctl_mem_exception,
	io_ctl_mem_exception_cause,
	io_dat_dec_inst,
	io_dat_dec_valid,
	io_dat_exe_br_eq,
	io_dat_exe_br_lt,
	io_dat_exe_br_ltu,
	io_dat_exe_br_type,
	io_dat_exe_inst_misaligned,
	io_dat_mem_ctrl_dmem_val,
	io_dat_mem_data_misaligned,
	io_dat_mem_store,
	io_dat_csr_eret,
	io_dat_csr_interrupt,
	io_interrupt_debug,
	io_interrupt_mtip,
	io_interrupt_msip,
	io_interrupt_meip,
	io_hartid
);
	input clock;
	input reset;
	output wire io_imem_req_valid;
	output wire [31:0] io_imem_req_bits_addr;
	input io_imem_resp_valid;
	input [31:0] io_imem_resp_bits_data;
	output wire io_dmem_req_valid;
	output wire [31:0] io_dmem_req_bits_addr;
	output wire [31:0] io_dmem_req_bits_data;
	output wire io_dmem_req_bits_fcn;
	output wire [2:0] io_dmem_req_bits_typ;
	input [31:0] io_dmem_resp_bits_data;
	input io_ctl_dec_stall;
	input io_ctl_full_stall;
	input [1:0] io_ctl_exe_pc_sel;
	input [3:0] io_ctl_br_type;
	input io_ctl_if_kill;
	input io_ctl_dec_kill;
	input [1:0] io_ctl_op1_sel;
	input [2:0] io_ctl_op2_sel;
	input [3:0] io_ctl_alu_fun;
	input [1:0] io_ctl_wb_sel;
	input io_ctl_rf_wen;
	input io_ctl_mem_val;
	input [1:0] io_ctl_mem_fcn;
	input [2:0] io_ctl_mem_typ;
	input [2:0] io_ctl_csr_cmd;
	input io_ctl_fencei;
	input io_ctl_pipeline_kill;
	input io_ctl_mem_exception;
	input [31:0] io_ctl_mem_exception_cause;
	output wire [31:0] io_dat_dec_inst;
	output wire io_dat_dec_valid;
	output wire io_dat_exe_br_eq;
	output wire io_dat_exe_br_lt;
	output wire io_dat_exe_br_ltu;
	output wire [3:0] io_dat_exe_br_type;
	output wire io_dat_exe_inst_misaligned;
	output wire io_dat_mem_ctrl_dmem_val;
	output wire io_dat_mem_data_misaligned;
	output wire io_dat_mem_store;
	output wire io_dat_csr_eret;
	output wire io_dat_csr_interrupt;
	input io_interrupt_debug;
	input io_interrupt_mtip;
	input io_interrupt_msip;
	input io_interrupt_meip;
	input io_hartid;
	wire [31:0] _csr_io_rw_rdata;
	wire [31:0] _csr_io_evec;
	wire [31:0] _csr_io_time;
	wire _csr_io_interrupt;
	wire [31:0] _csr_io_interrupt_cause;
	wire [31:0] _regfile_io_rs1_data;
	wire [31:0] _regfile_io_rs2_data;
	wire [31:0] _if_pc_buffer_out_q_io_deq_bits;
	wire _if_buffer_out_q_io_enq_ready;
	wire _if_buffer_out_q_io_deq_valid;
	wire [31:0] _if_buffer_out_q_io_deq_bits_data;
	reg [31:0] if_reg_pc;
	reg dec_reg_valid;
	reg [31:0] dec_reg_inst;
	reg [31:0] dec_reg_pc;
	reg exe_reg_valid;
	reg [31:0] exe_reg_inst;
	reg [31:0] exe_reg_pc;
	reg [4:0] exe_reg_wbaddr;
	reg [4:0] exe_reg_rs1_addr;
	reg [4:0] exe_reg_rs2_addr;
	reg [31:0] exe_reg_op1_data;
	reg [31:0] exe_reg_op2_data;
	reg [31:0] exe_reg_rs2_data;
	reg [3:0] exe_reg_ctrl_br_type;
	reg [3:0] exe_reg_ctrl_alu_fun;
	reg [1:0] exe_reg_ctrl_wb_sel;
	reg exe_reg_ctrl_rf_wen;
	reg exe_reg_ctrl_mem_val;
	reg exe_reg_ctrl_mem_fcn;
	reg [2:0] exe_reg_ctrl_mem_typ;
	reg [2:0] exe_reg_ctrl_csr_cmd;
	reg mem_reg_valid;
	reg [31:0] mem_reg_pc;
	reg [31:0] mem_reg_inst;
	reg [31:0] mem_reg_alu_out;
	reg [4:0] mem_reg_wbaddr;
	reg [4:0] mem_reg_rs1_addr;
	reg [4:0] mem_reg_rs2_addr;
	reg [31:0] mem_reg_op1_data;
	reg [31:0] mem_reg_op2_data;
	reg [31:0] mem_reg_rs2_data;
	reg mem_reg_ctrl_rf_wen;
	reg mem_reg_ctrl_mem_val;
	reg mem_reg_ctrl_mem_fcn;
	reg [2:0] mem_reg_ctrl_mem_typ;
	reg [1:0] mem_reg_ctrl_wb_sel;
	reg [2:0] mem_reg_ctrl_csr_cmd;
	reg wb_reg_valid;
	reg [4:0] wb_reg_wbaddr;
	reg [31:0] wb_reg_wbdata;
	reg wb_reg_ctrl_rf_wen;
	wire if_buffer_out_q_io_deq_ready = ~io_ctl_dec_stall & ~io_ctl_full_stall;
	reg if_reg_killed;
	wire _if_pc_next_T = io_ctl_exe_pc_sel == 2'h0;
	wire _mem_tval_inst_ma_T = io_ctl_exe_pc_sel == 2'h1;
	wire _io_dat_exe_inst_misaligned_T_6 = io_ctl_exe_pc_sel == 2'h2;
	wire [31:0] _exe_adder_out_T = exe_reg_op1_data + exe_reg_op2_data;
	wire [62:0] _exe_alu_out_T_17 = {31'h00000000, exe_reg_op1_data} << exe_reg_op2_data[4:0];
	wire [31:0] _GEN = {27'h0000000, exe_reg_op2_data[4:0]};
	wire [511:0] _GEN_0 = {exe_reg_inst, exe_reg_inst, exe_reg_inst, exe_reg_inst, exe_reg_op2_data, exe_reg_op1_data, 31'h00000000, exe_reg_op1_data < exe_reg_op2_data, 31'h00000000, $signed(exe_reg_op1_data) < $signed(exe_reg_op2_data), exe_reg_op1_data ^ exe_reg_op2_data, exe_reg_op1_data | exe_reg_op2_data, exe_reg_op1_data & exe_reg_op2_data, $signed($signed(exe_reg_op1_data) >>> _GEN), exe_reg_op1_data >> _GEN, _exe_alu_out_T_17[31:0], exe_reg_op1_data - exe_reg_op2_data, _exe_adder_out_T};
	wire [31:0] exe_alu_out = _GEN_0[exe_reg_ctrl_alu_fun * 32+:32];
	wire [31:0] _exe_brjmp_target_T = exe_reg_pc + exe_reg_op2_data;
	wire [31:0] exe_jump_reg_target = _exe_adder_out_T & 32'hfffffffe;
	reg [31:0] mem_tval_inst_ma_REG;
	reg [31:0] csr_io_tval_REG;
	reg reg_interrupt_handled;
	wire interrupt_edge = _csr_io_interrupt & ~reg_interrupt_handled;
	wire [5:0] _misaligned_mask_T_3 = 6'h07 << (mem_reg_ctrl_mem_typ[1:0] - 2'h1);
	wire io_dat_mem_data_misaligned_0 = |(~_misaligned_mask_T_3[2:0] & mem_reg_alu_out[2:0]) & mem_reg_ctrl_mem_val;
	wire [31:0] mem_wbdata = ((mem_reg_ctrl_wb_sel == 2'h0) | (mem_reg_ctrl_wb_sel == 2'h2) ? mem_reg_alu_out : (mem_reg_ctrl_wb_sel == 2'h1 ? io_dmem_resp_bits_data : (&mem_reg_ctrl_wb_sel ? _csr_io_rw_rdata : mem_reg_alu_out)));
	reg [31:0] wb_reg_inst;
	reg [31:0] REG;
	reg [4:0] REG_1;
	reg [31:0] REG_2;
	reg [4:0] REG_3;
	reg [31:0] REG_4;
	wire [127:0] _GEN_1 = {_csr_io_evec, exe_jump_reg_target, _exe_brjmp_target_T, if_reg_pc + 32'h00000004};
	wire _GEN_2 = if_buffer_out_q_io_deq_ready & _if_buffer_out_q_io_deq_valid;
	wire _GEN_3 = io_ctl_if_kill | if_reg_killed;
	wire _dec_op2_data_T_16 = io_ctl_op2_sel == 3'h0;
	wire _dec_rs2_data_T = exe_reg_wbaddr == dec_reg_inst[24:20];
	wire _dec_rs2_data_T_4 = mem_reg_wbaddr == dec_reg_inst[24:20];
	wire _dec_rs2_data_T_8 = wb_reg_wbaddr == dec_reg_inst[24:20];
	wire _GEN_4 = ~io_ctl_dec_stall & ~io_ctl_full_stall;
	wire _GEN_5 = (io_ctl_dec_stall & ~io_ctl_full_stall) | io_ctl_pipeline_kill;
	wire _GEN_6 = _GEN_5 | ~_GEN_4;
	wire _GEN_7 = io_ctl_pipeline_kill | io_ctl_full_stall;
	wire [255:0] _GEN_8 = {64'h0000000000000000, {12 {dec_reg_inst[31]}}, dec_reg_inst[19:12], dec_reg_inst[20], dec_reg_inst[30:21], 1'h0, dec_reg_inst[31:12], 12'h000, {20 {dec_reg_inst[31]}}, dec_reg_inst[7], dec_reg_inst[30:25], dec_reg_inst[11:8], 1'h0, {20 {dec_reg_inst[31]}}, dec_reg_inst[31:25], dec_reg_inst[11:7], {20 {dec_reg_inst[31]}}, dec_reg_inst[31:20], _regfile_io_rs2_data};
	always @(posedge clock) begin
		if (reset) begin
			if_reg_pc <= 32'h00010000;
			dec_reg_valid <= 1'h0;
			dec_reg_inst <= 32'h00004033;
			dec_reg_pc <= 32'h00000000;
			exe_reg_valid <= 1'h0;
			exe_reg_inst <= 32'h00004033;
			exe_reg_pc <= 32'h00000000;
			exe_reg_ctrl_br_type <= 4'h0;
			exe_reg_ctrl_rf_wen <= 1'h0;
			exe_reg_ctrl_mem_val <= 1'h0;
			exe_reg_ctrl_mem_fcn <= 1'h0;
			exe_reg_ctrl_mem_typ <= 3'h0;
			exe_reg_ctrl_csr_cmd <= 3'h0;
			mem_reg_valid <= 1'h0;
			mem_reg_ctrl_rf_wen <= 1'h0;
			mem_reg_ctrl_mem_val <= 1'h0;
			mem_reg_ctrl_mem_fcn <= 1'h0;
			mem_reg_ctrl_mem_typ <= 3'h0;
			mem_reg_ctrl_csr_cmd <= 3'h0;
			wb_reg_valid <= 1'h0;
			wb_reg_ctrl_rf_wen <= 1'h0;
			if_reg_killed <= 1'h0;
			reg_interrupt_handled <= 1'h0;
		end
		else begin
			if (~((((_if_buffer_out_q_io_enq_ready & io_imem_resp_valid) & ~if_reg_killed) | io_ctl_if_kill) | io_ctl_pipeline_kill) | ((((io_ctl_fencei & _if_pc_next_T) & ~io_ctl_dec_stall) & ~io_ctl_full_stall) & ~io_ctl_pipeline_kill))
				;
			else
				if_reg_pc <= _GEN_1[io_ctl_exe_pc_sel * 32+:32];
			dec_reg_valid <= ~io_ctl_pipeline_kill & (_GEN_4 ? ~_GEN_3 & _if_buffer_out_q_io_deq_valid : dec_reg_valid);
			if (io_ctl_pipeline_kill) begin
				dec_reg_inst <= 32'h00004033;
				mem_reg_ctrl_csr_cmd <= 3'h0;
			end
			else begin
				if (_GEN_4)
					dec_reg_inst <= (_GEN_3 | ~_if_buffer_out_q_io_deq_valid ? 32'h00004033 : _if_buffer_out_q_io_deq_bits_data);
				if (io_ctl_full_stall)
					;
				else
					mem_reg_ctrl_csr_cmd <= exe_reg_ctrl_csr_cmd;
			end
			if (io_ctl_pipeline_kill | ~_GEN_4)
				;
			else
				dec_reg_pc <= _if_pc_buffer_out_q_io_deq_bits;
			exe_reg_valid <= ~_GEN_5 & (_GEN_4 ? ~io_ctl_dec_kill & dec_reg_valid : exe_reg_valid);
			if (_GEN_5) begin
				exe_reg_inst <= 32'h00004033;
				exe_reg_ctrl_br_type <= 4'h0;
				exe_reg_ctrl_csr_cmd <= 3'h0;
			end
			else if (_GEN_4) begin
				exe_reg_inst <= (io_ctl_dec_kill ? 32'h00004033 : dec_reg_inst);
				exe_reg_ctrl_br_type <= (io_ctl_dec_kill ? 4'h0 : io_ctl_br_type);
				exe_reg_ctrl_csr_cmd <= (io_ctl_dec_kill ? 3'h0 : io_ctl_csr_cmd);
			end
			if (_GEN_6)
				;
			else
				exe_reg_pc <= dec_reg_pc;
			exe_reg_ctrl_rf_wen <= ~_GEN_5 & (_GEN_4 ? ~io_ctl_dec_kill & io_ctl_rf_wen : exe_reg_ctrl_rf_wen);
			exe_reg_ctrl_mem_val <= ~_GEN_5 & (_GEN_4 ? ~io_ctl_dec_kill & io_ctl_mem_val : exe_reg_ctrl_mem_val);
			exe_reg_ctrl_mem_fcn <= ~_GEN_5 & (_GEN_4 ? ~io_ctl_dec_kill & io_ctl_mem_fcn[0] : exe_reg_ctrl_mem_fcn);
			if ((_GEN_5 | ~_GEN_4) | io_ctl_dec_kill)
				;
			else
				exe_reg_ctrl_mem_typ <= io_ctl_mem_typ;
			mem_reg_valid <= ~io_ctl_pipeline_kill & (io_ctl_full_stall ? mem_reg_valid : exe_reg_valid);
			mem_reg_ctrl_rf_wen <= ~io_ctl_pipeline_kill & (io_ctl_full_stall ? mem_reg_ctrl_rf_wen : exe_reg_ctrl_rf_wen);
			mem_reg_ctrl_mem_val <= ~io_ctl_pipeline_kill & (io_ctl_full_stall ? mem_reg_ctrl_mem_val : exe_reg_ctrl_mem_val);
			if (_GEN_7)
				;
			else begin
				mem_reg_ctrl_mem_fcn <= exe_reg_ctrl_mem_fcn;
				mem_reg_ctrl_mem_typ <= exe_reg_ctrl_mem_typ;
			end
			wb_reg_valid <= ((~io_ctl_full_stall & mem_reg_valid) & ~io_ctl_mem_exception) & ~interrupt_edge;
			wb_reg_ctrl_rf_wen <= (~io_ctl_full_stall & ~(io_ctl_mem_exception | interrupt_edge)) & mem_reg_ctrl_rf_wen;
			if_reg_killed <= ~(if_reg_killed & _GEN_2) & (((io_ctl_pipeline_kill | io_ctl_if_kill) & ~_GEN_2) | if_reg_killed);
			reg_interrupt_handled <= _csr_io_interrupt;
		end
		if (_GEN_5)
			exe_reg_wbaddr <= 5'h00;
		else if (_GEN_4)
			exe_reg_wbaddr <= (io_ctl_dec_kill ? 5'h00 : dec_reg_inst[11:7]);
		if (_GEN_6)
			;
		else begin
			exe_reg_rs1_addr <= dec_reg_inst[19:15];
			exe_reg_rs2_addr <= dec_reg_inst[24:20];
			if (io_ctl_op1_sel == 2'h2)
				exe_reg_op1_data <= {27'h0000000, dec_reg_inst[19:15]};
			else if (io_ctl_op1_sel == 2'h1)
				exe_reg_op1_data <= dec_reg_pc;
			else if (((exe_reg_wbaddr == dec_reg_inst[19:15]) & |dec_reg_inst[19:15]) & exe_reg_ctrl_rf_wen)
				exe_reg_op1_data <= exe_alu_out;
			else
				exe_reg_op1_data <= (((mem_reg_wbaddr == dec_reg_inst[19:15]) & |dec_reg_inst[19:15]) & mem_reg_ctrl_rf_wen ? mem_wbdata : (((wb_reg_wbaddr == dec_reg_inst[19:15]) & |dec_reg_inst[19:15]) & wb_reg_ctrl_rf_wen ? wb_reg_wbdata : _regfile_io_rs1_data));
			if (((_dec_rs2_data_T & |dec_reg_inst[24:20]) & exe_reg_ctrl_rf_wen) & _dec_op2_data_T_16)
				exe_reg_op2_data <= exe_alu_out;
			else
				exe_reg_op2_data <= (((_dec_rs2_data_T_4 & |dec_reg_inst[24:20]) & mem_reg_ctrl_rf_wen) & _dec_op2_data_T_16 ? mem_wbdata : (((_dec_rs2_data_T_8 & |dec_reg_inst[24:20]) & wb_reg_ctrl_rf_wen) & _dec_op2_data_T_16 ? wb_reg_wbdata : _GEN_8[io_ctl_op2_sel * 32+:32]));
			exe_reg_rs2_data <= ((_dec_rs2_data_T & |dec_reg_inst[24:20]) & exe_reg_ctrl_rf_wen ? exe_alu_out : ((_dec_rs2_data_T_4 & |dec_reg_inst[24:20]) & mem_reg_ctrl_rf_wen ? mem_wbdata : ((_dec_rs2_data_T_8 & |dec_reg_inst[24:20]) & wb_reg_ctrl_rf_wen ? wb_reg_wbdata : _regfile_io_rs2_data)));
			exe_reg_ctrl_alu_fun <= io_ctl_alu_fun;
			exe_reg_ctrl_wb_sel <= io_ctl_wb_sel;
		end
		if (_GEN_7)
			;
		else begin
			mem_reg_pc <= exe_reg_pc;
			mem_reg_alu_out <= (exe_reg_ctrl_wb_sel == 2'h2 ? exe_reg_pc + 32'h00000004 : exe_alu_out);
			mem_reg_wbaddr <= exe_reg_wbaddr;
			mem_reg_rs1_addr <= exe_reg_rs1_addr;
			mem_reg_rs2_addr <= exe_reg_rs2_addr;
			mem_reg_op1_data <= exe_reg_op1_data;
			mem_reg_op2_data <= exe_reg_op2_data;
			mem_reg_rs2_data <= exe_reg_rs2_data;
			mem_reg_ctrl_wb_sel <= exe_reg_ctrl_wb_sel;
		end
		if (io_ctl_full_stall)
			;
		else begin
			wb_reg_wbaddr <= mem_reg_wbaddr;
			wb_reg_wbdata <= mem_wbdata;
		end
		mem_tval_inst_ma_REG <= (_mem_tval_inst_ma_T ? _exe_brjmp_target_T : exe_jump_reg_target);
		csr_io_tval_REG <= exe_reg_inst;
		wb_reg_inst <= mem_reg_inst;
		REG <= mem_reg_pc;
		REG_1 <= mem_reg_rs1_addr;
		REG_2 <= mem_reg_op1_data;
		REG_3 <= mem_reg_rs2_addr;
		REG_4 <= mem_reg_op2_data;
		if (io_ctl_pipeline_kill)
			mem_reg_inst <= 32'h00004033;
		else if (io_ctl_full_stall)
			;
		else
			mem_reg_inst <= exe_reg_inst;
	end
	Queue1_MemResp if_buffer_out_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_if_buffer_out_q_io_enq_ready),
		.io_enq_valid(io_imem_resp_valid),
		.io_enq_bits_data(io_imem_resp_bits_data),
		.io_deq_ready(if_buffer_out_q_io_deq_ready),
		.io_deq_valid(_if_buffer_out_q_io_deq_valid),
		.io_deq_bits_data(_if_buffer_out_q_io_deq_bits_data)
	);
	Queue1_UInt32 if_pc_buffer_out_q(
		.clock(clock),
		.reset(reset),
		.io_enq_valid(io_imem_resp_valid),
		.io_enq_bits(if_reg_pc),
		.io_deq_ready(if_buffer_out_q_io_deq_ready),
		.io_deq_bits(_if_pc_buffer_out_q_io_deq_bits)
	);
	RegisterFile regfile(
		.clock(clock),
		.io_rs1_addr(dec_reg_inst[19:15]),
		.io_rs1_data(_regfile_io_rs1_data),
		.io_rs2_addr(dec_reg_inst[24:20]),
		.io_rs2_data(_regfile_io_rs2_data),
		.io_waddr(wb_reg_wbaddr),
		.io_wdata(wb_reg_wbdata),
		.io_wen(wb_reg_ctrl_rf_wen)
	);
	CSRFile csr(
		.clock(clock),
		.reset(reset),
		.io_ungated_clock(clock),
		.io_interrupts_debug(io_interrupt_debug),
		.io_interrupts_mtip(io_interrupt_mtip),
		.io_interrupts_msip(io_interrupt_msip),
		.io_interrupts_meip(io_interrupt_meip),
		.io_hartid(io_hartid),
		.io_rw_addr(mem_reg_inst[31:20]),
		.io_rw_cmd(mem_reg_ctrl_csr_cmd),
		.io_rw_rdata(_csr_io_rw_rdata),
		.io_rw_wdata(mem_reg_alu_out),
		.io_eret(io_dat_csr_eret),
		.io_evec(_csr_io_evec),
		.io_exception(io_ctl_mem_exception),
		.io_retire(wb_reg_valid),
		.io_cause((io_ctl_mem_exception ? io_ctl_mem_exception_cause : _csr_io_interrupt_cause)),
		.io_pc(mem_reg_pc),
		.io_tval((io_ctl_mem_exception_cause == 32'h00000002 ? csr_io_tval_REG : (io_ctl_mem_exception_cause == 32'h00000000 ? mem_tval_inst_ma_REG : ((io_ctl_mem_exception_cause == 32'h00000006) | (io_ctl_mem_exception_cause == 32'h00000004) ? mem_reg_alu_out : 32'h00000000)))),
		.io_time(_csr_io_time),
		.io_interrupt(_csr_io_interrupt),
		.io_interrupt_cause(_csr_io_interrupt_cause)
	);
	assign io_imem_req_valid = _if_buffer_out_q_io_enq_ready;
	assign io_imem_req_bits_addr = if_reg_pc;
	assign io_dmem_req_valid = mem_reg_ctrl_mem_val & ~io_dat_mem_data_misaligned_0;
	assign io_dmem_req_bits_addr = mem_reg_alu_out;
	assign io_dmem_req_bits_data = mem_reg_rs2_data;
	assign io_dmem_req_bits_fcn = mem_reg_ctrl_mem_fcn;
	assign io_dmem_req_bits_typ = mem_reg_ctrl_mem_typ;
	assign io_dat_dec_inst = dec_reg_inst;
	assign io_dat_dec_valid = dec_reg_valid;
	assign io_dat_exe_br_eq = exe_reg_op1_data == exe_reg_rs2_data;
	assign io_dat_exe_br_lt = $signed(exe_reg_op1_data) < $signed(exe_reg_rs2_data);
	assign io_dat_exe_br_ltu = exe_reg_op1_data < exe_reg_rs2_data;
	assign io_dat_exe_br_type = exe_reg_ctrl_br_type;
	assign io_dat_exe_inst_misaligned = (|_exe_brjmp_target_T[1:0] & _mem_tval_inst_ma_T) | (_exe_adder_out_T[1] & _io_dat_exe_inst_misaligned_T_6);
	assign io_dat_mem_ctrl_dmem_val = mem_reg_ctrl_mem_val;
	assign io_dat_mem_data_misaligned = io_dat_mem_data_misaligned_0;
	assign io_dat_mem_store = mem_reg_ctrl_mem_fcn;
	assign io_dat_csr_interrupt = interrupt_edge;
endmodule
module Queue1_MemResp (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_data,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_data
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [31:0] io_enq_bits_data;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [31:0] io_deq_bits_data;
	reg [31:0] ram_data;
	reg full;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire do_enq = (~(~full & io_deq_ready) & ~full) & io_enq_valid;
	always @(posedge clock) begin
		if (do_enq)
			ram_data <= io_enq_bits_data;
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & io_deq_valid_0)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_data = (full ? ram_data : io_enq_bits_data);
endmodule
module Queue1_UInt32 (
	clock,
	reset,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_bits
);
	input clock;
	input reset;
	input io_enq_valid;
	input [31:0] io_enq_bits;
	input io_deq_ready;
	output wire [31:0] io_deq_bits;
	reg [31:0] ram;
	reg full;
	wire do_enq = (~(~full & io_deq_ready) & ~full) & io_enq_valid;
	always @(posedge clock) begin
		if (do_enq)
			ram <= io_enq_bits;
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & (io_enq_valid | full))))
			full <= do_enq;
	end
	assign io_deq_bits = (full ? ram : io_enq_bits);
endmodule
module RegisterFile (
	clock,
	io_rs1_addr,
	io_rs1_data,
	io_rs2_addr,
	io_rs2_data,
	io_waddr,
	io_wdata,
	io_wen
);
	input clock;
	input [4:0] io_rs1_addr;
	output wire [31:0] io_rs1_data;
	input [4:0] io_rs2_addr;
	output wire [31:0] io_rs2_data;
	input [4:0] io_waddr;
	input [31:0] io_wdata;
	input io_wen;
	wire [31:0] _regfile_ext_R0_data;
	wire [31:0] _regfile_ext_R1_data;
	regfile_32x32 regfile_ext(
		.R0_addr(io_rs2_addr),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_regfile_ext_R0_data),
		.R1_addr(io_rs1_addr),
		.R1_en(1'h1),
		.R1_clk(clock),
		.R1_data(_regfile_ext_R1_data),
		.W0_addr(io_waddr),
		.W0_en(io_wen & |io_waddr),
		.W0_clk(clock),
		.W0_data(io_wdata)
	);
	assign io_rs1_data = (|io_rs1_addr ? _regfile_ext_R1_data : 32'h00000000);
	assign io_rs2_data = (|io_rs2_addr ? _regfile_ext_R0_data : 32'h00000000);
endmodule
module regfile_32x32 (
	R0_addr,
	R0_en,
	R0_clk,
	R0_data,
	R1_addr,
	R1_en,
	R1_clk,
	R1_data,
	W0_addr,
	W0_en,
	W0_clk,
	W0_data
);
	input [4:0] R0_addr;
	input R0_en;
	input R0_clk;
	output wire [31:0] R0_data;
	input [4:0] R1_addr;
	input R1_en;
	input R1_clk;
	output wire [31:0] R1_data;
	input [4:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [31:0] W0_data;
	reg [31:0] Memory [0:31];
	always @(posedge W0_clk)
		if (W0_en & 1'h1)
			Memory[W0_addr] <= W0_data;
	assign R0_data = (R0_en ? Memory[R0_addr] : 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
	assign R1_data = (R1_en ? Memory[R1_addr] : 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule