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