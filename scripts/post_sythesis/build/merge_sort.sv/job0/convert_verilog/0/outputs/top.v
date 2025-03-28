module SRAM_15559 (
	clk,
	rst_n,
	fifo_reg_writer_rdata_push_valid,
	fifo_reg_writer_rdata_push_data,
	fifo_reg_writer_rdata_push_ready,
	SortImpl_07f11_executed,
	var_402,
	var_402_valid,
	var_493,
	var_493_valid,
	var_548,
	var_548_valid,
	var_510,
	var_510_valid,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] fifo_reg_writer_rdata_push_valid;
	output wire [31:0] fifo_reg_writer_rdata_push_data;
	input wire [0:0] fifo_reg_writer_rdata_push_ready;
	input wire [0:0] SortImpl_07f11_executed;
	input wire [0:0] var_402;
	input wire [0:0] var_402_valid;
	input wire [0:0] var_493;
	input wire [0:0] var_493_valid;
	input wire [31:0] var_548;
	input wire [0:0] var_548_valid;
	input wire [12:0] var_510;
	input wire [0:0] var_510_valid;
	output wire expose_executed;
	wire executed;
	wire [31:0] dataout;
	wire [31:0] var_578;
	assign var_578 = dataout;
	assign fifo_reg_writer_rdata_push_valid = executed && var_402;
	assign fifo_reg_writer_rdata_push_data = {32 {var_402}} & var_578;
	wire array_array_15565_w;
	wire [31:0] array_array_15565_d;
	wire [12:0] array_array_15565_widx;
	assign array_array_15565_w = executed && var_493;
	assign array_array_15565_d = {32 {var_493}} & var_548;
	assign array_array_15565_widx = var_510;
	memory_blackbox_array_15565 #(
		.DATA_WIDTH(32),
		.ADDR_WIDTH(13)
	) memory_blackbox_array_15565(
		.clk(clk),
		.address(array_array_15565_widx),
		.wd(array_array_15565_d),
		.banksel(1'd1),
		.read(1'd1),
		.write(array_array_15565_w),
		.dataout(dataout),
		.rst_n(rst_n)
	);
	assign executed = SortImpl_07f11_executed;
	assign expose_executed = executed;
endmodule
(* blackbox *) module memory_blackbox_array_15565 (
	clk,
	address,
	wd,
	banksel,
	read,
	write,
	dataout,
	rst_n
);
	parameter DATA_WIDTH = 32;
	parameter ADDR_WIDTH = 13;
	input clk;
	input [ADDR_WIDTH - 1:0] address;
	input [DATA_WIDTH - 1:0] wd;
	input banksel;
	input read;
	input write;
	output reg [DATA_WIDTH - 1:0] dataout;
	input rst_n;
	localparam DEPTH = 1 << ADDR_WIDTH;
	reg [DATA_WIDTH - 1:0] mem [DEPTH - 1:0];
	always @(posedge clk)
		if (write & banksel)
			mem[address] <= wd;
	wire [DATA_WIDTH:1] sv2v_tmp_DBCED;
	assign sv2v_tmp_DBCED = (read & banksel ? mem[address] : {DATA_WIDTH {1'b0}});
	always @(*) dataout = sv2v_tmp_DBCED;
endmodule
module SortImpl_07f11 (
	clk,
	rst_n,
	array_array_06b91_q,
	array_array_06b91_w,
	array_array_06b91_widx,
	array_array_06b91_d,
	array_array_06bb9_q,
	array_array_06bb9_w,
	array_array_06bb9_widx,
	array_array_06bb9_d,
	array_array_06b9d_q,
	array_array_06b89_q,
	array_array_07ec5_q,
	array_array_07ec5_w,
	array_array_07ec5_widx,
	array_array_07ec5_d,
	array_array_07f19_w,
	array_array_07f19_widx,
	array_array_07f19_d,
	array_array_07f31_q,
	array_array_07f31_w,
	array_array_07f31_widx,
	array_array_07f31_d,
	array_array_06ba9_q,
	reg_writer_counter_delta,
	reg_writer_counter_delta_ready,
	array_array_06bc9_q,
	array_array_06bc9_w,
	array_array_06bc9_widx,
	array_array_06bc9_d,
	sort_executed,
	reg_writer_executed,
	expose_var_510,
	expose_var_510_valid,
	expose_var_402,
	expose_var_402_valid,
	expose_var_548,
	expose_var_548_valid,
	expose_var_493,
	expose_var_493_valid,
	var_29,
	var_29_valid,
	var_38,
	var_38_valid,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [12:0] array_array_06b91_q;
	output wire [0:0] array_array_06b91_w;
	output wire [0:0] array_array_06b91_widx;
	output wire [12:0] array_array_06b91_d;
	input wire [0:0] array_array_06bb9_q;
	output wire [0:0] array_array_06bb9_w;
	output wire [0:0] array_array_06bb9_widx;
	output wire [0:0] array_array_06bb9_d;
	input wire [12:0] array_array_06b9d_q;
	input wire [12:0] array_array_06b89_q;
	input wire [63:0] array_array_07ec5_q;
	output wire [0:0] array_array_07ec5_w;
	output wire [0:0] array_array_07ec5_widx;
	output wire [31:0] array_array_07ec5_d;
	output wire [0:0] array_array_07f19_w;
	output wire [0:0] array_array_07f19_widx;
	output wire [7:0] array_array_07f19_d;
	input wire [25:0] array_array_07f31_q;
	output wire [0:0] array_array_07f31_w;
	output wire [0:0] array_array_07f31_widx;
	output wire [12:0] array_array_07f31_d;
	input wire [12:0] array_array_06ba9_q;
	output wire [7:0] reg_writer_counter_delta;
	input wire [0:0] reg_writer_counter_delta_ready;
	input wire [12:0] array_array_06bc9_q;
	output wire [0:0] array_array_06bc9_w;
	output wire [0:0] array_array_06bc9_widx;
	output wire [12:0] array_array_06bc9_d;
	input wire [0:0] sort_executed;
	input wire [0:0] reg_writer_executed;
	output wire [12:0] expose_var_510;
	output wire [0:0] expose_var_510_valid;
	output wire [0:0] expose_var_402;
	output wire [0:0] expose_var_402_valid;
	output wire [31:0] expose_var_548;
	output wire [0:0] expose_var_548_valid;
	output wire [0:0] expose_var_493;
	output wire [0:0] expose_var_493_valid;
	input wire [31:0] var_29;
	input wire [0:0] var_29_valid;
	input wire [7:0] var_38;
	input wire [0:0] var_38_valid;
	output wire expose_executed;
	wire executed;
	wire [0:0] var_315;
	assign var_315 = var_38 == 8'd1;
	wire [12:0] var_585;
	assign var_585 = array_array_06b91_q[12:0];
	wire [12:0] var_500;
	assign var_500 = array_array_06b89_q[12:0];
	always @(posedge clk)
		if (executed && var_315)
			$display("%t\t[SortImpl_07f11]\t\t[sort.init] for block.size: %d, block.start: %d, and 1st element", $time, var_500, var_585);
	wire [0:0] var_449;
	assign var_449 = var_38 == 8'd2;
	always @(posedge clk)
		if (executed && var_449)
			$display("%t\t[SortImpl_07f11]\t\t[sort.init] 2nd element", $time);
	wire [0:0] var_153;
	assign var_153 = var_29_valid;
	wire [31:0] var_156;
	assign var_156 = (var_153 ? var_29 : 32'd2147483647);
	wire [0:0] var_507;
	assign var_507 = array_array_06bb9_q[0:0];
	wire [0:0] var_163;
	assign var_163 = var_507 == 1'd0;
	wire [31:0] var_167;
	assign var_167 = array_array_07ec5_q[31:0];
	wire [31:0] var_170;
	assign var_170 = (var_163 ? var_156 : var_167);
	wire [0:0] var_177;
	assign var_177 = var_507 == 1'd1;
	wire [31:0] var_181;
	assign var_181 = array_array_07ec5_q[63:32];
	wire [31:0] var_184;
	assign var_184 = (var_177 ? var_156 : var_181);
	always @(posedge clk)
		if (executed)
			$display("%t\t[SortImpl_07f11]\t\t%d", $time, var_156);
	wire [0:0] var_192;
	assign var_192 = var_170 > var_184;
	wire [0:0] var_493;
	assign var_493 = var_38 == 8'd3;
	assign expose_var_493 = var_493;
	assign expose_var_493_valid = executed && 1;
	wire [12:0] var_529;
	assign var_529 = array_array_06bc9_q[12:0];
	wire [12:0] var_213;
	assign var_213 = var_529 + 13'd1;
	always @(posedge clk)
		if (executed && var_493)
			$display("%t\t[SortImpl_07f11]\t\t[loop.k++ ] %d", $time, var_529);
	always @(posedge clk)
		if (executed && var_493)
			$display("%t\t[SortImpl_07f11]\t\tnew_value: %d | a: %d | b: %d | cmp: %d", $time, var_156, var_170, var_184, var_192);
	wire [12:0] var_237;
	assign var_237 = var_500 >> 13'd1;
	wire [12:0] var_243;
	assign var_243 = (1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : {13 {1'sbx}}));
	wire [12:0] var_246;
	assign var_246 = var_243 + 13'd1;
	wire [0:0] var_249;
	assign var_249 = var_246 < var_237;
	wire [0:0] var_486;
	assign var_486 = var_38 == 8'd4;
	wire [12:0] var_514;
	assign var_514 = array_array_06b9d_q[12:0];
	wire [12:0] var_526;
	assign var_526 = array_array_06ba9_q[12:0];
	always @(posedge clk)
		if (executed && var_486)
			$display("%t\t[SortImpl_07f11]\t\t[sort.fill] refill the popped element", $time);
	always @(posedge clk)
		if (executed && var_486)
			$display("%t\t[SortImpl_07f11]\t\tk: %d | block.size: %d | block.start: %d | from: %d | to: %d", $time, var_529, var_500, var_585, var_514, var_526);
	wire [0:0] var_290;
	assign var_290 = var_529 < var_500;
	wire [0:0] var_306;
	assign var_306 = var_529 == var_500;
	wire [12:0] var_318;
	assign var_318 = var_585 + var_500;
	always @(posedge clk)
		if (executed && (var_486 && var_306))
			$display("%t\t[SortImpl_07f11]\t\t[loop.next] block.start: %d", $time, var_318);
	wire [0:0] var_333;
	assign var_333 = ~var_249;
	wire [12:0] var_348;
	assign var_348 = (1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : {13 {1'sbx}}));
	wire [12:0] var_351;
	assign var_351 = var_348 + 13'd1;
	wire [12:0] var_367;
	assign var_367 = (1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : {13 {1'sbx}}));
	always @(posedge clk)
		if (executed && var_486)
			$display("%t\t[SortImpl_07f11]\t\t[loop.idx] idx[%d]: %d", $time, var_507, var_367);
	wire [0:0] var_381;
	assign var_381 = (var_315 ? 1'd1 : 1'd0);
	wire [0:0] var_388;
	assign var_388 = (var_449 ? 1'd1 : var_381);
	wire [0:0] var_395;
	assign var_395 = (var_493 ? 1'd0 : var_388);
	wire [0:0] var_402;
	assign var_402 = (var_486 ? var_249 : var_395);
	assign expose_var_402 = var_402;
	assign expose_var_402_valid = executed && 1;
	wire [0:0] var_409;
	assign var_409 = var_585 == 13'd2048;
	wire [12:0] var_421;
	assign var_421 = var_585 + var_514;
	wire [12:0] var_424;
	assign var_424 = (var_409 ? var_526 : var_421);
	wire [12:0] var_431;
	assign var_431 = var_585 + var_237;
	wire [12:0] var_437;
	assign var_437 = var_431 + var_514;
	wire [12:0] var_446;
	assign var_446 = var_585 + var_529;
	wire [12:0] var_452;
	assign var_452 = var_446 + var_526;
	wire [12:0] var_461;
	assign var_461 = (1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : {13 {1'sbx}}));
	wire [12:0] var_464;
	assign var_464 = var_585 + var_461;
	wire [12:0] var_467;
	assign var_467 = var_464 + 13'd1;
	wire [12:0] var_473;
	assign var_473 = (var_507 ? var_237 : 13'd0);
	wire [12:0] var_477;
	assign var_477 = var_467 + var_473;
	wire [12:0] var_483;
	assign var_483 = var_477 + var_514;
	wire [12:0] var_489;
	assign var_489 = (var_315 ? var_424 : 13'd0);
	wire [12:0] var_496;
	assign var_496 = (var_449 ? var_437 : var_489);
	wire [12:0] var_503;
	assign var_503 = (var_493 ? var_452 : var_496);
	wire [12:0] var_510;
	assign var_510 = (var_486 ? var_483 : var_503);
	assign expose_var_510 = var_510;
	assign expose_var_510_valid = executed && 1;
	wire [12:0] var_520;
	assign var_520 = (1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : {13 {1'sbx}}));
	always @(posedge clk)
		if (executed)
			$display("%t\t[SortImpl_07f11]\t\tblock.start: %d | idx: %d | reg_idx: %d | k: %d | from: %d ", $time, var_585, var_520, var_507, var_529, var_514);
	always @(posedge clk)
		if (executed)
			$display("%t\t[SortImpl_07f11]\t\t[loop.sram] addr: %d", $time, var_510);
	wire [31:0] var_544;
	assign var_544 = (var_192 ? var_184 : var_170);
	wire [31:0] var_548;
	assign var_548 = (var_493 ? var_544 : 32'd0);
	assign expose_var_548 = var_548;
	assign expose_var_548_valid = executed && 1;
	always @(posedge clk)
		if (executed && var_493)
			$display("%t\t[SortImpl_07f11]\t\t[loop.sram] wdata: %d | a: %d | b: %d ", $time, var_548, var_170, var_184);
	assign reg_writer_counter_delta = (executed ? {7'b0000000, |var_402} : 0);
	assign array_array_06bc9_w = executed && (var_315 || var_493);
	assign array_array_06bc9_d = ({13 {var_315}} & 13'd0) | ({13 {var_493}} & var_213);
	assign array_array_06bc9_widx = ({var_315} & 1'd0) | ({var_493} & 1'd0);
	assign array_array_07f19_w = executed && ((((var_315 || var_449) || var_493) || (var_486 && var_290)) || (var_486 && var_306));
	assign array_array_07f19_d = (((({8 {var_315}} & 8'd2) | ({8 {var_449}} & 8'd3)) | ({8 {var_493}} & 8'd4)) | ({8 {var_486 && var_290}} & 8'd3)) | ({8 {var_486 && var_306}} & 8'd1);
	assign array_array_07f19_widx = (((({var_315} & 1'd0) | ({var_449} & 1'd0)) | ({var_493} & 1'd0)) | ({var_486 && var_290} & 1'd0)) | ({var_486 && var_306} & 1'd0);
	assign array_array_06bb9_w = executed && ((var_315 || var_449) || var_493);
	assign array_array_06bb9_d = (({var_315} & 1'd0) | ({var_449} & 1'd1)) | ({var_493} & var_192);
	assign array_array_06bb9_widx = (({var_315} & 1'd0) | ({var_449} & 1'd0)) | ({var_493} & 1'd0);
	assign array_array_06b91_w = executed && (var_486 && var_306);
	assign array_array_06b91_d = {13 {var_486 && var_306}} & var_318;
	assign array_array_06b91_widx = {var_486 && var_306} & 1'd0;
	assign array_array_07ec5_w = executed && (var_486 && var_333);
	assign array_array_07ec5_d = {32 {var_486 && var_333}} & 32'd2147483647;
	assign array_array_07ec5_widx = {var_486 && var_333} & var_507;
	assign array_array_07f31_w = executed && ((var_315 || var_449) || var_486);
	assign array_array_07f31_d = (({13 {var_315}} & 13'd0) | ({13 {var_449}} & 13'd0)) | ({13 {var_486}} & var_351);
	assign array_array_07f31_widx = (({var_315} & 1'd0) | ({var_449} & 1'd1)) | ({var_486} & var_507);
	assign executed = sort_executed || reg_writer_executed;
	assign expose_executed = executed;
endmodule
module sort (
	clk,
	rst_n,
	array_array_07f19_q,
	expose_var_38,
	expose_var_38_valid,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [7:0] array_array_07f19_q;
	output wire [7:0] expose_var_38;
	output wire [0:0] expose_var_38_valid;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_38;
	assign var_38 = array_array_07f19_q[7:0];
	assign expose_var_38 = var_38;
	assign expose_var_38_valid = executed && 1;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module driver (
	clk,
	rst_n,
	array_array_06b89_q,
	array_array_06b89_w,
	array_array_06b89_widx,
	array_array_06b89_d,
	array_array_06b9d_q,
	array_array_06b9d_w,
	array_array_06b9d_widx,
	array_array_06b9d_d,
	array_array_06ba9_q,
	array_array_06ba9_w,
	array_array_06ba9_widx,
	array_array_06ba9_d,
	array_array_06b91_q,
	array_array_06b91_w,
	array_array_06b91_widx,
	array_array_06b91_d,
	sort_counter_delta,
	sort_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [12:0] array_array_06b89_q;
	output wire [0:0] array_array_06b89_w;
	output wire [0:0] array_array_06b89_widx;
	output wire [12:0] array_array_06b89_d;
	input wire [12:0] array_array_06b9d_q;
	output wire [0:0] array_array_06b9d_w;
	output wire [0:0] array_array_06b9d_widx;
	output wire [12:0] array_array_06b9d_d;
	input wire [12:0] array_array_06ba9_q;
	output wire [0:0] array_array_06ba9_w;
	output wire [0:0] array_array_06ba9_widx;
	output wire [12:0] array_array_06ba9_d;
	input wire [12:0] array_array_06b91_q;
	output wire [0:0] array_array_06b91_w;
	output wire [0:0] array_array_06b91_widx;
	output wire [12:0] array_array_06b91_d;
	output wire [7:0] sort_counter_delta;
	input wire [0:0] sort_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [12:0] var_41;
	assign var_41 = array_array_06b91_q[12:0];
	wire [0:0] var_44;
	assign var_44 = var_41 == 13'd2048;
	wire [12:0] var_523;
	assign var_523 = array_array_06b89_q[12:0];
	wire [0:0] var_53;
	assign var_53 = var_523 == 13'd2048;
	wire [12:0] var_64;
	assign var_64 = var_523 << 13'd1;
	wire [12:0] var_75;
	assign var_75 = array_array_06ba9_q[12:0];
	wire [12:0] var_82;
	assign var_82 = array_array_06b9d_q[12:0];
	always @(posedge clk)
		if (executed && var_44)
			$display("%t\t[driver]\t\t[loop.2x  ] block.size, reset block.start, swap from/to", $time);
	assign sort_counter_delta = (executed ? 1 : 0);
	assign array_array_06b89_w = executed && var_44;
	assign array_array_06b89_d = {13 {var_44}} & var_64;
	assign array_array_06b89_widx = {var_44} & 1'd0;
	assign array_array_06b9d_w = executed && var_44;
	assign array_array_06b9d_d = {13 {var_44}} & var_75;
	assign array_array_06b9d_widx = {var_44} & 1'd0;
	assign array_array_06b91_w = executed && var_44;
	assign array_array_06b91_d = {13 {var_44}} & 13'd0;
	assign array_array_06b91_widx = {var_44} & 1'd0;
	assign array_array_06ba9_w = executed && var_44;
	assign array_array_06ba9_d = {13 {var_44}} & var_82;
	assign array_array_06ba9_widx = {var_44} & 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module reg_writer (
	clk,
	rst_n,
	fifo_rdata_pop_valid,
	fifo_rdata_pop_data,
	fifo_rdata_pop_ready,
	array_array_06bb9_q,
	array_array_07ec5_w,
	array_array_07ec5_widx,
	array_array_07ec5_d,
	expose_var_29,
	expose_var_29_valid,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_rdata_pop_valid;
	input wire [31:0] fifo_rdata_pop_data;
	output wire [0:0] fifo_rdata_pop_ready;
	input wire [0:0] array_array_06bb9_q;
	output wire [0:0] array_array_07ec5_w;
	output wire [0:0] array_array_07ec5_widx;
	output wire [31:0] array_array_07ec5_d;
	output wire [31:0] expose_var_29;
	output wire [0:0] expose_var_29_valid;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [31:0] var_29;
	assign var_29 = fifo_rdata_pop_data;
	assign expose_var_29 = var_29;
	assign expose_var_29_valid = executed && 1;
	assign fifo_rdata_pop_ready = executed;
	wire [0:0] var_31;
	assign var_31 = array_array_06bb9_q[0:0];
	assign array_array_07ec5_w = executed;
	assign array_array_07ec5_d = var_29;
	assign array_array_07ec5_widx = var_31;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module top (
	array_array_06bb9_exposed_o,
	array_array_06bb9_exposed_i,
	array_array_06bb9_exposed_i_valid,
	array_array_06b9d_exposed_o,
	array_array_06b9d_exposed_i,
	array_array_06b9d_exposed_i_valid,
	array_array_06b89_exposed_o,
	array_array_06b89_exposed_i,
	array_array_06b89_exposed_i_valid,
	array_array_06b91_exposed_o,
	array_array_06b91_exposed_i,
	array_array_06b91_exposed_i_valid,
	array_array_06ba9_exposed_o,
	array_array_06ba9_exposed_i,
	array_array_06ba9_exposed_i_valid,
	array_array_07ec5_exposed_o,
	array_array_07ec5_exposed_i,
	array_array_07ec5_exposed_i_valid,
	clk,
	rst_n
);
	output wire [0:0] array_array_06bb9_exposed_o;
	input wire [0:0] array_array_06bb9_exposed_i;
	input wire [0:0] array_array_06bb9_exposed_i_valid;
	output wire [12:0] array_array_06b9d_exposed_o;
	input wire [12:0] array_array_06b9d_exposed_i;
	input wire [0:0] array_array_06b9d_exposed_i_valid;
	output wire [12:0] array_array_06b89_exposed_o;
	input wire [12:0] array_array_06b89_exposed_i;
	input wire [0:0] array_array_06b89_exposed_i_valid;
	output wire [12:0] array_array_06b91_exposed_o;
	input wire [12:0] array_array_06b91_exposed_i;
	input wire [0:0] array_array_06b91_exposed_i_valid;
	output wire [12:0] array_array_06ba9_exposed_o;
	input wire [12:0] array_array_06ba9_exposed_i;
	input wire [0:0] array_array_06ba9_exposed_i_valid;
	output wire [63:0] array_array_07ec5_exposed_o;
	input wire [31:0] array_array_07ec5_exposed_i;
	input wire [0:0] array_array_07ec5_exposed_i_valid;
	input wire clk;
	input wire rst_n;
	reg [7:0] array_array_07f19_q;
	wire [7:0] array_array_07f19_driver_SortImpl_07f11_d;
	wire [0:0] array_array_07f19_driver_SortImpl_07f11_w;
	wire [0:0] array_array_07f19_driver_SortImpl_07f11_widx;
	wire [7:0] array_array_07f19_d;
	wire [0:0] array_array_07f19_widx;
	wire [0:0] array_array_07f19_w;
	assign array_array_07f19_d = {8 {array_array_07f19_driver_SortImpl_07f11_w}} & array_array_07f19_driver_SortImpl_07f11_d;
	assign array_array_07f19_widx = {array_array_07f19_driver_SortImpl_07f11_w} & array_array_07f19_driver_SortImpl_07f11_widx;
	assign array_array_07f19_w = array_array_07f19_driver_SortImpl_07f11_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_07f19_q[7:0] <= 8'd1;
		else if (array_array_07f19_w)
			case (array_array_07f19_widx)
				0: array_array_07f19_q[7:0] <= array_array_07f19_d;
				default:
					;
			endcase
	wire [31:0] array_array_15565_q;
	wire [31:0] array_array_15565_driver_SRAM_15559_d;
	wire [0:0] array_array_15565_driver_SRAM_15559_w;
	wire [11:0] array_array_15565_driver_SRAM_15559_widx;
	reg [63:0] array_array_07ec5_q;
	wire [31:0] array_array_07ec5_driver_SortImpl_07f11_d;
	wire [0:0] array_array_07ec5_driver_SortImpl_07f11_w;
	wire [0:0] array_array_07ec5_driver_SortImpl_07f11_widx;
	wire [31:0] array_array_07ec5_driver_reg_writer_d;
	wire [0:0] array_array_07ec5_driver_reg_writer_w;
	wire [0:0] array_array_07ec5_driver_reg_writer_widx;
	assign array_array_07ec5_exposed_o = array_array_07ec5_q;
	wire [31:0] array_array_07ec5_temp;
	wire [31:0] array_array_07ec5_d;
	assign array_array_07ec5_temp = (array_array_07ec5_exposed_i_valid ? array_array_07ec5_exposed_i : array_array_07ec5_d);
	wire [0:0] array_array_07ec5_widx;
	wire [0:0] array_array_07ec5_w;
	assign array_array_07ec5_d = ({32 {array_array_07ec5_driver_SortImpl_07f11_w}} & array_array_07ec5_driver_SortImpl_07f11_d) | ({32 {array_array_07ec5_driver_reg_writer_w}} & array_array_07ec5_driver_reg_writer_d);
	assign array_array_07ec5_widx = ({array_array_07ec5_driver_SortImpl_07f11_w} & array_array_07ec5_driver_SortImpl_07f11_widx) | ({array_array_07ec5_driver_reg_writer_w} & array_array_07ec5_driver_reg_writer_widx);
	assign array_array_07ec5_w = array_array_07ec5_driver_SortImpl_07f11_w | array_array_07ec5_driver_reg_writer_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			array_array_07ec5_q[31:0] <= 32'd0;
			array_array_07ec5_q[63:32] <= 32'd0;
		end
		else if (array_array_07ec5_w)
			case (array_array_07ec5_widx)
				0: array_array_07ec5_q[31:0] <= array_array_07ec5_temp;
				1: array_array_07ec5_q[63:32] <= array_array_07ec5_temp;
				default:
					;
			endcase
	reg [12:0] array_array_06ba9_q;
	wire [12:0] array_array_06ba9_driver_driver_d;
	wire [0:0] array_array_06ba9_driver_driver_w;
	wire [0:0] array_array_06ba9_driver_driver_widx;
	assign array_array_06ba9_exposed_o = array_array_06ba9_q;
	wire [12:0] array_array_06ba9_temp;
	wire [12:0] array_array_06ba9_d;
	assign array_array_06ba9_temp = (array_array_06ba9_exposed_i_valid ? array_array_06ba9_exposed_i : array_array_06ba9_d);
	wire [0:0] array_array_06ba9_widx;
	wire [0:0] array_array_06ba9_w;
	assign array_array_06ba9_d = {13 {array_array_06ba9_driver_driver_w}} & array_array_06ba9_driver_driver_d;
	assign array_array_06ba9_widx = {array_array_06ba9_driver_driver_w} & array_array_06ba9_driver_driver_widx;
	assign array_array_06ba9_w = array_array_06ba9_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_06ba9_q[12:0] <= 13'd2048;
		else if (array_array_06ba9_w)
			case (array_array_06ba9_widx)
				0: array_array_06ba9_q[12:0] <= array_array_06ba9_temp;
				default:
					;
			endcase
	reg [12:0] array_array_06b9d_q;
	wire [12:0] array_array_06b9d_driver_driver_d;
	wire [0:0] array_array_06b9d_driver_driver_w;
	wire [0:0] array_array_06b9d_driver_driver_widx;
	assign array_array_06b9d_exposed_o = array_array_06b9d_q;
	wire [12:0] array_array_06b9d_temp;
	wire [12:0] array_array_06b9d_d;
	assign array_array_06b9d_temp = (array_array_06b9d_exposed_i_valid ? array_array_06b9d_exposed_i : array_array_06b9d_d);
	wire [0:0] array_array_06b9d_widx;
	wire [0:0] array_array_06b9d_w;
	assign array_array_06b9d_d = {13 {array_array_06b9d_driver_driver_w}} & array_array_06b9d_driver_driver_d;
	assign array_array_06b9d_widx = {array_array_06b9d_driver_driver_w} & array_array_06b9d_driver_driver_widx;
	assign array_array_06b9d_w = array_array_06b9d_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_06b9d_q[12:0] <= 13'd0;
		else if (array_array_06b9d_w)
			case (array_array_06b9d_widx)
				0: array_array_06b9d_q[12:0] <= array_array_06b9d_temp;
				default:
					;
			endcase
	reg [25:0] array_array_07f31_q;
	wire [12:0] array_array_07f31_driver_SortImpl_07f11_d;
	wire [0:0] array_array_07f31_driver_SortImpl_07f11_w;
	wire [0:0] array_array_07f31_driver_SortImpl_07f11_widx;
	wire [12:0] array_array_07f31_d;
	wire [0:0] array_array_07f31_widx;
	wire [0:0] array_array_07f31_w;
	assign array_array_07f31_d = {13 {array_array_07f31_driver_SortImpl_07f11_w}} & array_array_07f31_driver_SortImpl_07f11_d;
	assign array_array_07f31_widx = {array_array_07f31_driver_SortImpl_07f11_w} & array_array_07f31_driver_SortImpl_07f11_widx;
	assign array_array_07f31_w = array_array_07f31_driver_SortImpl_07f11_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			array_array_07f31_q[12:0] <= 13'd0;
			array_array_07f31_q[25:13] <= 13'd0;
		end
		else if (array_array_07f31_w)
			case (array_array_07f31_widx)
				0: array_array_07f31_q[12:0] <= array_array_07f31_d;
				1: array_array_07f31_q[25:13] <= array_array_07f31_d;
				default:
					;
			endcase
	reg [12:0] array_array_06b91_q;
	wire [12:0] array_array_06b91_driver_driver_d;
	wire [0:0] array_array_06b91_driver_driver_w;
	wire [0:0] array_array_06b91_driver_driver_widx;
	wire [12:0] array_array_06b91_driver_SortImpl_07f11_d;
	wire [0:0] array_array_06b91_driver_SortImpl_07f11_w;
	wire [0:0] array_array_06b91_driver_SortImpl_07f11_widx;
	assign array_array_06b91_exposed_o = array_array_06b91_q;
	wire [12:0] array_array_06b91_temp;
	wire [12:0] array_array_06b91_d;
	assign array_array_06b91_temp = (array_array_06b91_exposed_i_valid ? array_array_06b91_exposed_i : array_array_06b91_d);
	wire [0:0] array_array_06b91_widx;
	wire [0:0] array_array_06b91_w;
	assign array_array_06b91_d = ({13 {array_array_06b91_driver_driver_w}} & array_array_06b91_driver_driver_d) | ({13 {array_array_06b91_driver_SortImpl_07f11_w}} & array_array_06b91_driver_SortImpl_07f11_d);
	assign array_array_06b91_widx = ({array_array_06b91_driver_driver_w} & array_array_06b91_driver_driver_widx) | ({array_array_06b91_driver_SortImpl_07f11_w} & array_array_06b91_driver_SortImpl_07f11_widx);
	assign array_array_06b91_w = array_array_06b91_driver_driver_w | array_array_06b91_driver_SortImpl_07f11_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_06b91_q[12:0] <= 13'd0;
		else if (array_array_06b91_w)
			case (array_array_06b91_widx)
				0: array_array_06b91_q[12:0] <= array_array_06b91_temp;
				default:
					;
			endcase
	reg [0:0] array_array_06bb9_q;
	wire [0:0] array_array_06bb9_driver_SortImpl_07f11_d;
	wire [0:0] array_array_06bb9_driver_SortImpl_07f11_w;
	wire [0:0] array_array_06bb9_driver_SortImpl_07f11_widx;
	assign array_array_06bb9_exposed_o = array_array_06bb9_q;
	wire [0:0] array_array_06bb9_temp;
	wire [0:0] array_array_06bb9_d;
	assign array_array_06bb9_temp = (array_array_06bb9_exposed_i_valid ? array_array_06bb9_exposed_i : array_array_06bb9_d);
	wire [0:0] array_array_06bb9_widx;
	wire [0:0] array_array_06bb9_w;
	assign array_array_06bb9_d = {array_array_06bb9_driver_SortImpl_07f11_w} & array_array_06bb9_driver_SortImpl_07f11_d;
	assign array_array_06bb9_widx = {array_array_06bb9_driver_SortImpl_07f11_w} & array_array_06bb9_driver_SortImpl_07f11_widx;
	assign array_array_06bb9_w = array_array_06bb9_driver_SortImpl_07f11_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_06bb9_q[0:0] <= 1'd0;
		else if (array_array_06bb9_w)
			case (array_array_06bb9_widx)
				0: array_array_06bb9_q[0:0] <= array_array_06bb9_temp;
				default:
					;
			endcase
	reg [12:0] array_array_06b89_q;
	wire [12:0] array_array_06b89_driver_driver_d;
	wire [0:0] array_array_06b89_driver_driver_w;
	wire [0:0] array_array_06b89_driver_driver_widx;
	assign array_array_06b89_exposed_o = array_array_06b89_q;
	wire [12:0] array_array_06b89_temp;
	wire [12:0] array_array_06b89_d;
	assign array_array_06b89_temp = (array_array_06b89_exposed_i_valid ? array_array_06b89_exposed_i : array_array_06b89_d);
	wire [0:0] array_array_06b89_widx;
	wire [0:0] array_array_06b89_w;
	assign array_array_06b89_d = {13 {array_array_06b89_driver_driver_w}} & array_array_06b89_driver_driver_d;
	assign array_array_06b89_widx = {array_array_06b89_driver_driver_w} & array_array_06b89_driver_driver_widx;
	assign array_array_06b89_w = array_array_06b89_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_06b89_q[12:0] <= 13'd2;
		else if (array_array_06b89_w)
			case (array_array_06b89_widx)
				0: array_array_06b89_q[12:0] <= array_array_06b89_temp;
				default:
					;
			endcase
	reg [12:0] array_array_06bc9_q;
	wire [12:0] array_array_06bc9_driver_SortImpl_07f11_d;
	wire [0:0] array_array_06bc9_driver_SortImpl_07f11_w;
	wire [0:0] array_array_06bc9_driver_SortImpl_07f11_widx;
	wire [12:0] array_array_06bc9_d;
	wire [0:0] array_array_06bc9_widx;
	wire [0:0] array_array_06bc9_w;
	assign array_array_06bc9_d = {13 {array_array_06bc9_driver_SortImpl_07f11_w}} & array_array_06bc9_driver_SortImpl_07f11_d;
	assign array_array_06bc9_widx = {array_array_06bc9_driver_SortImpl_07f11_w} & array_array_06bc9_driver_SortImpl_07f11_widx;
	assign array_array_06bc9_w = array_array_06bc9_driver_SortImpl_07f11_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_06bc9_q[12:0] <= 13'd0;
		else if (array_array_06bc9_w)
			case (array_array_06bc9_widx)
				0: array_array_06bc9_q[12:0] <= array_array_06bc9_d;
				default:
					;
			endcase
	wire [31:0] fifo_reg_writer_rdata_pop_data;
	wire [0:0] fifo_reg_writer_rdata_pop_valid;
	wire [0:0] fifo_reg_writer_rdata_pop_ready;
	wire [31:0] fifo_reg_writer_rdata_driver_SRAM_15559_push_data;
	wire [0:0] fifo_reg_writer_rdata_driver_SRAM_15559_push_valid;
	wire [0:0] fifo_reg_writer_rdata_driver_SRAM_15559_push_ready;
	wire fifo_reg_writer_rdata_push_ready;
	assign fifo_reg_writer_rdata_driver_SRAM_15559_push_ready = fifo_reg_writer_rdata_push_ready;
	wire [0:0] fifo_reg_writer_rdata_push_valid;
	assign fifo_reg_writer_rdata_push_valid = fifo_reg_writer_rdata_driver_SRAM_15559_push_valid;
	wire [31:0] fifo_reg_writer_rdata_push_data;
	assign fifo_reg_writer_rdata_push_data = {32 {fifo_reg_writer_rdata_driver_SRAM_15559_push_valid}} & fifo_reg_writer_rdata_driver_SRAM_15559_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(2)
	) fifo_reg_writer_rdata_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_reg_writer_rdata_push_valid),
		.push_data(fifo_reg_writer_rdata_push_data),
		.push_ready(fifo_reg_writer_rdata_push_ready),
		.pop_valid(fifo_reg_writer_rdata_pop_valid),
		.pop_data(fifo_reg_writer_rdata_pop_data),
		.pop_ready(fifo_reg_writer_rdata_pop_ready)
	);
	wire [7:0] sort_driver_driver_counter_delta;
	wire [0:0] sort_driver_driver_counter_delta_ready;
	wire [0:0] sort_counter_delta_ready;
	wire [7:0] sort_counter_delta;
	assign sort_counter_delta = sort_driver_driver_counter_delta;
	wire [0:0] sort_counter_pop_ready;
	assign sort_driver_driver_counter_delta_ready = sort_counter_pop_ready;
	wire [0:0] sort_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sort_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sort_counter_delta),
		.delta_ready(sort_counter_delta_ready),
		.pop_valid(sort_counter_pop_valid),
		.pop_ready(sort_counter_pop_ready)
	);
	wire [0:0] driver_counter_delta_ready;
	wire [7:0] driver_counter_delta;
	wire [0:0] driver_counter_pop_ready;
	wire [0:0] driver_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) driver_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(driver_counter_delta),
		.delta_ready(driver_counter_delta_ready),
		.pop_valid(driver_counter_pop_valid),
		.pop_ready(driver_counter_pop_ready)
	);
	wire [7:0] reg_writer_driver_SortImpl_07f11_counter_delta;
	wire [0:0] reg_writer_driver_SortImpl_07f11_counter_delta_ready;
	wire [0:0] reg_writer_counter_delta_ready;
	wire [7:0] reg_writer_counter_delta;
	assign reg_writer_counter_delta = reg_writer_driver_SortImpl_07f11_counter_delta;
	wire [0:0] reg_writer_counter_pop_ready;
	assign reg_writer_driver_SortImpl_07f11_counter_delta_ready = reg_writer_counter_pop_ready;
	wire [0:0] reg_writer_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) reg_writer_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(reg_writer_counter_delta),
		.delta_ready(reg_writer_counter_delta_ready),
		.pop_valid(reg_writer_counter_pop_valid),
		.pop_ready(reg_writer_counter_pop_ready)
	);
	assign driver_counter_delta = 8'b00000001;
	wire [7:0] logic_var_38;
	wire [0:0] logic_var_38_valid;
	wire [0:0] sort_executed;
	sort sort_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_07f19_q(array_array_07f19_q),
		.expose_var_38(logic_var_38),
		.expose_var_38_valid(logic_var_38_valid),
		.counter_delta_ready(sort_counter_delta_ready),
		.counter_pop_ready(sort_counter_pop_ready),
		.counter_pop_valid(sort_counter_pop_valid),
		.expose_executed(sort_executed)
	);
	wire [0:0] driver_executed;
	driver driver_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_06b89_q(array_array_06b89_q),
		.array_array_06b89_w(array_array_06b89_driver_driver_w),
		.array_array_06b89_widx(array_array_06b89_driver_driver_widx),
		.array_array_06b89_d(array_array_06b89_driver_driver_d),
		.array_array_06b9d_q(array_array_06b9d_q),
		.array_array_06b9d_w(array_array_06b9d_driver_driver_w),
		.array_array_06b9d_widx(array_array_06b9d_driver_driver_widx),
		.array_array_06b9d_d(array_array_06b9d_driver_driver_d),
		.array_array_06ba9_q(array_array_06ba9_q),
		.array_array_06ba9_w(array_array_06ba9_driver_driver_w),
		.array_array_06ba9_widx(array_array_06ba9_driver_driver_widx),
		.array_array_06ba9_d(array_array_06ba9_driver_driver_d),
		.array_array_06b91_q(array_array_06b91_q),
		.array_array_06b91_w(array_array_06b91_driver_driver_w),
		.array_array_06b91_widx(array_array_06b91_driver_driver_widx),
		.array_array_06b91_d(array_array_06b91_driver_driver_d),
		.sort_counter_delta_ready(sort_driver_driver_counter_delta_ready),
		.sort_counter_delta(sort_driver_driver_counter_delta),
		.counter_delta_ready(driver_counter_delta_ready),
		.counter_pop_ready(driver_counter_pop_ready),
		.counter_pop_valid(driver_counter_pop_valid),
		.expose_executed(driver_executed)
	);
	wire [31:0] logic_var_29;
	wire [0:0] logic_var_29_valid;
	wire [0:0] reg_writer_executed;
	reg_writer reg_writer_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_rdata_pop_ready(fifo_reg_writer_rdata_pop_ready),
		.fifo_rdata_pop_data(fifo_reg_writer_rdata_pop_data),
		.fifo_rdata_pop_valid(fifo_reg_writer_rdata_pop_valid),
		.array_array_06bb9_q(array_array_06bb9_q),
		.array_array_07ec5_w(array_array_07ec5_driver_reg_writer_w),
		.array_array_07ec5_widx(array_array_07ec5_driver_reg_writer_widx),
		.array_array_07ec5_d(array_array_07ec5_driver_reg_writer_d),
		.expose_var_29(logic_var_29),
		.expose_var_29_valid(logic_var_29_valid),
		.counter_delta_ready(reg_writer_counter_delta_ready),
		.counter_pop_ready(reg_writer_counter_pop_ready),
		.counter_pop_valid(reg_writer_counter_pop_valid),
		.expose_executed(reg_writer_executed)
	);
	wire [0:0] SRAM_15559_executed;
	wire [0:0] SortImpl_07f11_executed;
	wire [0:0] logic_var_402;
	wire [0:0] logic_var_402_valid;
	wire [0:0] logic_var_493;
	wire [0:0] logic_var_493_valid;
	wire [12:0] logic_var_510;
	wire [0:0] logic_var_510_valid;
	wire [31:0] logic_var_548;
	wire [0:0] logic_var_548_valid;
	SRAM_15559 SRAM_15559_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_reg_writer_rdata_push_valid(fifo_reg_writer_rdata_driver_SRAM_15559_push_valid),
		.fifo_reg_writer_rdata_push_data(fifo_reg_writer_rdata_driver_SRAM_15559_push_data),
		.fifo_reg_writer_rdata_push_ready(fifo_reg_writer_rdata_driver_SRAM_15559_push_ready),
		.SortImpl_07f11_executed(SortImpl_07f11_executed),
		.var_402(logic_var_402),
		.var_402_valid(logic_var_402_valid),
		.var_493(logic_var_493),
		.var_493_valid(logic_var_493_valid),
		.var_548(logic_var_548),
		.var_548_valid(logic_var_548_valid),
		.var_510(logic_var_510),
		.var_510_valid(logic_var_510_valid),
		.expose_executed(SRAM_15559_executed)
	);
	SortImpl_07f11 SortImpl_07f11_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_06b91_q(array_array_06b91_q),
		.array_array_06b91_w(array_array_06b91_driver_SortImpl_07f11_w),
		.array_array_06b91_widx(array_array_06b91_driver_SortImpl_07f11_widx),
		.array_array_06b91_d(array_array_06b91_driver_SortImpl_07f11_d),
		.array_array_06bb9_q(array_array_06bb9_q),
		.array_array_06bb9_w(array_array_06bb9_driver_SortImpl_07f11_w),
		.array_array_06bb9_widx(array_array_06bb9_driver_SortImpl_07f11_widx),
		.array_array_06bb9_d(array_array_06bb9_driver_SortImpl_07f11_d),
		.array_array_06b9d_q(array_array_06b9d_q),
		.array_array_06b89_q(array_array_06b89_q),
		.array_array_07ec5_q(array_array_07ec5_q),
		.array_array_07ec5_w(array_array_07ec5_driver_SortImpl_07f11_w),
		.array_array_07ec5_widx(array_array_07ec5_driver_SortImpl_07f11_widx),
		.array_array_07ec5_d(array_array_07ec5_driver_SortImpl_07f11_d),
		.array_array_07f19_w(array_array_07f19_driver_SortImpl_07f11_w),
		.array_array_07f19_widx(array_array_07f19_driver_SortImpl_07f11_widx),
		.array_array_07f19_d(array_array_07f19_driver_SortImpl_07f11_d),
		.array_array_07f31_q(array_array_07f31_q),
		.array_array_07f31_w(array_array_07f31_driver_SortImpl_07f11_w),
		.array_array_07f31_widx(array_array_07f31_driver_SortImpl_07f11_widx),
		.array_array_07f31_d(array_array_07f31_driver_SortImpl_07f11_d),
		.array_array_06ba9_q(array_array_06ba9_q),
		.reg_writer_counter_delta_ready(reg_writer_driver_SortImpl_07f11_counter_delta_ready),
		.reg_writer_counter_delta(reg_writer_driver_SortImpl_07f11_counter_delta),
		.array_array_06bc9_q(array_array_06bc9_q),
		.array_array_06bc9_w(array_array_06bc9_driver_SortImpl_07f11_w),
		.array_array_06bc9_widx(array_array_06bc9_driver_SortImpl_07f11_widx),
		.array_array_06bc9_d(array_array_06bc9_driver_SortImpl_07f11_d),
		.reg_writer_executed(reg_writer_executed),
		.sort_executed(sort_executed),
		.expose_var_510(logic_var_510),
		.expose_var_510_valid(logic_var_510_valid),
		.expose_var_402(logic_var_402),
		.expose_var_402_valid(logic_var_402_valid),
		.expose_var_548(logic_var_548),
		.expose_var_548_valid(logic_var_548_valid),
		.expose_var_493(logic_var_493),
		.expose_var_493_valid(logic_var_493_valid),
		.var_29(logic_var_29),
		.var_29_valid(logic_var_29_valid),
		.var_38(logic_var_38),
		.var_38_valid(logic_var_38_valid),
		.expose_executed(SortImpl_07f11_executed)
	);
endmodule
module fifo (
	clk,
	rst_n,
	push_valid,
	push_data,
	push_ready,
	pop_valid,
	pop_data,
	pop_ready
);
	parameter WIDTH = 8;
	parameter DEPTH_LOG2 = 2;
	input wire clk;
	input wire rst_n;
	input wire push_valid;
	input wire [WIDTH - 1:0] push_data;
	output reg push_ready;
	output reg pop_valid;
	output reg [WIDTH - 1:0] pop_data;
	input wire pop_ready;
	generate
		if (DEPTH_LOG2 == 0) begin : single_element_fifo
			reg fifo_full;
			wire [1:1] sv2v_tmp_A6A95;
			assign sv2v_tmp_A6A95 = ~fifo_full || (fifo_full && pop_ready);
			always @(*) push_ready = sv2v_tmp_A6A95;
			wire [1:1] sv2v_tmp_DF341;
			assign sv2v_tmp_DF341 = fifo_full;
			always @(*) pop_valid = sv2v_tmp_DF341;
			always @(posedge clk or negedge rst_n)
				if (!rst_n) begin
					fifo_full <= 1'b0;
					pop_data <= 1'sbx;
				end
				else if (push_valid && pop_ready) begin
					pop_data <= push_data;
					fifo_full <= 1'b1;
				end
				else if (push_valid && ~fifo_full) begin
					pop_data <= push_data;
					fifo_full <= 1'b1;
				end
				else if (pop_ready && fifo_full) begin
					fifo_full <= 1'b0;
					pop_data <= 1'sbx;
				end
		end
		else begin : multi_element_fifo
			reg [(DEPTH_LOG2 != 0 ? DEPTH_LOG2 - 1 : 0):0] front;
			reg [(DEPTH_LOG2 != 0 ? DEPTH_LOG2 - 1 : 0):0] back;
			reg [DEPTH_LOG2 + 1:0] count;
			reg [WIDTH - 1:0] q [0:(1 << DEPTH_LOG2) - 1];
			wire [DEPTH_LOG2 + 1:0] new_count;
			wire [(DEPTH_LOG2 != 0 ? DEPTH_LOG2 - 1 : 0):0] new_front;
			reg temp_pop_valid;
			assign new_count = (count + (push_valid ? 1 : 0)) - (pop_ready ? 1 : 0);
			assign new_front = front + (pop_ready && (count != 0) ? 1 : 0);
			always @(posedge clk or negedge rst_n)
				if (!rst_n) begin
					front <= 0;
					back <= 0;
					pop_valid <= 1'b0;
					pop_data <= 1'sbx;
					count <= 0;
					push_ready <= 1'b1;
				end
				else begin
					if (push_valid && (new_count <= (1 << DEPTH_LOG2))) begin
						q[back] <= push_data;
						back <= back + 1;
					end
					front <= new_front;
					count <= new_count;
					push_ready <= new_count < (1 << DEPTH_LOG2);
					temp_pop_valid = (new_count != 0) || push_valid;
					pop_valid <= temp_pop_valid;
					pop_data <= (temp_pop_valid ? ((new_front == back) && push_valid ? push_data : q[new_front]) : {WIDTH {1'sbx}});
				end
		end
	endgenerate
endmodule
module trigger_counter (
	clk,
	rst_n,
	delta,
	delta_ready,
	pop_ready,
	pop_valid
);
	parameter WIDTH = 8;
	input wire clk;
	input wire rst_n;
	input wire [WIDTH - 1:0] delta;
	output reg delta_ready;
	input wire pop_ready;
	output reg pop_valid;
	reg [WIDTH - 1:0] count;
	wire [WIDTH - 1:0] temp;
	wire [WIDTH - 1:0] new_count;
	assign temp = count + delta;
	assign new_count = (temp >= (pop_ready ? 1 : 0) ? temp - (pop_ready ? 1 : 0) : 0);
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			count <= 1'sb0;
		else begin
			delta_ready <= new_count != {WIDTH {1'b1}};
			count <= new_count;
			pop_valid <= (new_count != 0) || (delta != 0);
		end
endmodule
module tb;
	reg clk;
	reg rst_n;
	wire [0:0] array_array_06bb9_exposed_o;
	wire [0:0] array_array_06bb9_exposed_i;
	wire array_array_06bb9_exposed_i_valid;
	assign array_array_06bb9_exposed_i_valid = 1'd0;
	assign array_array_06bb9_exposed_i = 1'd0;
	wire [12:0] array_array_06b9d_exposed_o;
	wire [12:0] array_array_06b9d_exposed_i;
	wire array_array_06b9d_exposed_i_valid;
	assign array_array_06b9d_exposed_i_valid = 1'd0;
	assign array_array_06b9d_exposed_i = 13'd0;
	wire [12:0] array_array_06b89_exposed_o;
	wire [12:0] array_array_06b89_exposed_i;
	wire array_array_06b89_exposed_i_valid;
	assign array_array_06b89_exposed_i_valid = 1'd0;
	assign array_array_06b89_exposed_i = 13'd0;
	wire [12:0] array_array_06b91_exposed_o;
	wire [12:0] array_array_06b91_exposed_i;
	wire array_array_06b91_exposed_i_valid;
	assign array_array_06b91_exposed_i_valid = 1'd0;
	assign array_array_06b91_exposed_i = 13'd0;
	wire [12:0] array_array_06ba9_exposed_o;
	wire [12:0] array_array_06ba9_exposed_i;
	wire array_array_06ba9_exposed_i_valid;
	assign array_array_06ba9_exposed_i_valid = 1'd0;
	assign array_array_06ba9_exposed_i = 13'd0;
	wire [63:0] array_array_07ec5_exposed_o;
	wire [31:0] array_array_07ec5_exposed_i;
	wire array_array_07ec5_exposed_i_valid;
	assign array_array_07ec5_exposed_i_valid = 1'd0;
	assign array_array_07ec5_exposed_i = 32'd0;
	initial begin
		clk = 1'b1;
		rst_n = 1'b0;
		#(150)
			;
		rst_n = 1'b1;
		#(10000100)
			;
	end
	always #(50) clk <= !clk;
	top top_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_06bb9_exposed_o(array_array_06bb9_exposed_o),
		.array_array_06bb9_exposed_i(array_array_06bb9_exposed_i),
		.array_array_06bb9_exposed_i_valid(array_array_06bb9_exposed_i_valid),
		.array_array_06b9d_exposed_o(array_array_06b9d_exposed_o),
		.array_array_06b9d_exposed_i(array_array_06b9d_exposed_i),
		.array_array_06b9d_exposed_i_valid(array_array_06b9d_exposed_i_valid),
		.array_array_06b89_exposed_o(array_array_06b89_exposed_o),
		.array_array_06b89_exposed_i(array_array_06b89_exposed_i),
		.array_array_06b89_exposed_i_valid(array_array_06b89_exposed_i_valid),
		.array_array_06b91_exposed_o(array_array_06b91_exposed_o),
		.array_array_06b91_exposed_i(array_array_06b91_exposed_i),
		.array_array_06b91_exposed_i_valid(array_array_06b91_exposed_i_valid),
		.array_array_06ba9_exposed_o(array_array_06ba9_exposed_o),
		.array_array_06ba9_exposed_i(array_array_06ba9_exposed_i),
		.array_array_06ba9_exposed_i_valid(array_array_06ba9_exposed_i_valid),
		.array_array_07ec5_exposed_o(array_array_07ec5_exposed_o),
		.array_array_07ec5_exposed_i(array_array_07ec5_exposed_i),
		.array_array_07ec5_exposed_i_valid(array_array_07ec5_exposed_i_valid)
	);
endmodule