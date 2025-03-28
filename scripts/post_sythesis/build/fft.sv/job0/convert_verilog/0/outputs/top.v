module calculate_loop_92b65 (
	clk,
	rst_n,
	fifo_In_full_flag_pop_valid,
	fifo_In_full_flag_pop_data,
	fifo_In_full_flag_pop_ready,
	array_array_92b5c_q,
	array_array_92b5c_w,
	array_array_92b5c_widx,
	array_array_92b5c_d,
	array_array_92b62_q,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_In_full_flag_pop_valid;
	input wire [0:0] fifo_In_full_flag_pop_data;
	output wire [0:0] fifo_In_full_flag_pop_ready;
	input wire [3:0] array_array_92b5c_q;
	output wire [0:0] array_array_92b5c_w;
	output wire [0:0] array_array_92b5c_widx;
	output wire [3:0] array_array_92b5c_d;
	input wire [31:0] array_array_92b62_q;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire [0:0] var_37;
	assign var_37 = fifo_In_full_flag_pop_valid;
	wire executed;
	wire [0:0] var_41;
	assign var_41 = fifo_In_full_flag_pop_data;
	assign fifo_In_full_flag_pop_ready = executed;
	wire [3:0] var_901;
	assign var_901 = array_array_92b5c_q[3:0];
	wire [0:0] var_48;
	assign var_48 = var_901 < 4'd10;
	wire [3:0] var_54;
	assign var_54 = var_901;
	wire [3:0] var_57;
	assign var_57 = var_54 + 4'd1;
	wire [3:0] var_60;
	assign var_60 = var_57;
	wire [3:0] var_62;
	assign var_62 = (var_48 ? var_60 : 4'd0);
	wire [0:0] var_70;
	assign var_70 = var_901 == 4'd8;
	wire [31:0] var_73;
	assign var_73 = array_array_92b62_q[31:0];
	wire [31:0] var_76;
	assign var_76 = var_73;
	wire [0:0] var_78;
	assign var_78 = var_76 == 32'd0;
	wire [0:0] var_81;
	assign var_81 = var_70 & var_78;
	wire [3:0] var_84;
	assign var_84 = (var_81 ? 4'd10 : var_62);
	wire [3:0] var_88;
	assign var_88 = var_84;
	assign array_array_92b5c_w = executed;
	assign array_array_92b5c_d = var_88;
	assign array_array_92b5c_widx = 1'd0;
	assign executed = counter_pop_valid && var_37;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module SRAM_683b0 (
	clk,
	rst_n,
	fifo_memuser_92bfe_rdata_push_valid,
	fifo_memuser_92bfe_rdata_push_data,
	fifo_memuser_92bfe_rdata_push_ready,
	external_loop_66c6b_executed,
	var_227,
	var_227_valid,
	var_801,
	var_801_valid,
	var_201,
	var_201_valid,
	var_748,
	var_748_valid,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] fifo_memuser_92bfe_rdata_push_valid;
	output wire [63:0] fifo_memuser_92bfe_rdata_push_data;
	input wire [0:0] fifo_memuser_92bfe_rdata_push_ready;
	input wire [0:0] external_loop_66c6b_executed;
	input wire [0:0] var_227;
	input wire [0:0] var_227_valid;
	input wire [63:0] var_801;
	input wire [0:0] var_801_valid;
	input wire [0:0] var_201;
	input wire [0:0] var_201_valid;
	input wire [11:0] var_748;
	input wire [0:0] var_748_valid;
	output wire expose_executed;
	wire executed;
	wire [63:0] dataout;
	wire [63:0] var_894;
	assign var_894 = dataout;
	assign fifo_memuser_92bfe_rdata_push_valid = executed && var_201;
	assign fifo_memuser_92bfe_rdata_push_data = {64 {var_201}} & var_894;
	wire array_array_683e6_w;
	wire [63:0] array_array_683e6_d;
	wire [11:0] array_array_683e6_widx;
	assign array_array_683e6_w = executed && var_227;
	assign array_array_683e6_d = {64 {var_227}} & var_801;
	assign array_array_683e6_widx = var_748;
	memory_blackbox_array_683e6 #(
		.DATA_WIDTH(64),
		.ADDR_WIDTH(12)
	) memory_blackbox_array_683e6(
		.clk(clk),
		.address(array_array_683e6_widx),
		.wd(array_array_683e6_d),
		.banksel(1'd1),
		.read(1'd1),
		.write(array_array_683e6_w),
		.dataout(dataout),
		.rst_n(rst_n)
	);
	assign executed = external_loop_66c6b_executed;
	assign expose_executed = executed;
endmodule
(* blackbox *) module memory_blackbox_array_683e6 (
	clk,
	address,
	wd,
	banksel,
	read,
	write,
	dataout,
	rst_n
);
	parameter DATA_WIDTH = 64;
	parameter ADDR_WIDTH = 12;
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
module memuser_92bfe (
	clk,
	rst_n,
	fifo_rdata_pop_valid,
	fifo_rdata_pop_data,
	fifo_rdata_pop_ready,
	array_array_92b50_q,
	array_array_92b50_w,
	array_array_92b50_widx,
	array_array_92b50_d,
	array_array_92b56_q,
	array_array_92b56_w,
	array_array_92b56_widx,
	array_array_92b56_d,
	array_array_92b5c_q,
	array_array_92b47_q,
	array_array_92b47_w,
	array_array_92b47_widx,
	array_array_92b47_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_rdata_pop_valid;
	input wire [63:0] fifo_rdata_pop_data;
	output wire [0:0] fifo_rdata_pop_ready;
	input wire [63:0] array_array_92b50_q;
	output wire [0:0] array_array_92b50_w;
	output wire [0:0] array_array_92b50_widx;
	output wire [63:0] array_array_92b50_d;
	input wire [63:0] array_array_92b56_q;
	output wire [0:0] array_array_92b56_w;
	output wire [0:0] array_array_92b56_widx;
	output wire [63:0] array_array_92b56_d;
	input wire [3:0] array_array_92b5c_q;
	input wire [63:0] array_array_92b47_q;
	output wire [0:0] array_array_92b47_w;
	output wire [0:0] array_array_92b47_widx;
	output wire [63:0] array_array_92b47_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire [0:0] var_94;
	assign var_94 = fifo_rdata_pop_valid;
	wire executed;
	wire [63:0] var_98;
	assign var_98 = fifo_rdata_pop_data;
	assign fifo_rdata_pop_ready = executed;
	wire [3:0] var_163;
	assign var_163 = array_array_92b5c_q[3:0];
	wire [0:0] var_104;
	assign var_104 = var_163 == 4'd2;
	wire [63:0] var_169;
	assign var_169 = var_98;
	wire [63:0] var_66;
	assign var_66 = array_array_92b47_q[63:0];
	wire [63:0] var_112;
	assign var_112 = (var_104 ? var_169 : var_66);
	wire [0:0] var_124;
	assign var_124 = var_163 == 4'd3;
	wire [63:0] var_160;
	assign var_160 = array_array_92b50_q[63:0];
	wire [63:0] var_132;
	assign var_132 = (var_124 ? var_169 : var_160);
	wire [0:0] var_144;
	assign var_144 = var_163 == 4'd9;
	wire [63:0] var_166;
	assign var_166 = array_array_92b56_q[63:0];
	wire [63:0] var_152;
	assign var_152 = (var_144 ? var_169 : var_166);
	always @(posedge clk)
		if (executed)
			$display("%t\t[memuser_92bfe]\t\t        state: %d | even_reg: %d | odd_reg: %d | twid_reg: %d", $time, var_163, var_66, var_160, var_166);
	assign array_array_92b47_w = executed;
	assign array_array_92b47_d = var_112;
	assign array_array_92b47_widx = 1'd0;
	assign array_array_92b50_w = executed;
	assign array_array_92b50_d = var_132;
	assign array_array_92b50_widx = 1'd0;
	assign array_array_92b56_w = executed;
	assign array_array_92b56_d = var_152;
	assign array_array_92b56_widx = 1'd0;
	assign executed = counter_pop_valid && var_94;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module loop_user_68877 (
	clk,
	rst_n,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module driver (
	clk,
	rst_n,
	external_loop_66c6b_counter_delta,
	external_loop_66c6b_counter_delta_ready,
	loop_user_68877_counter_delta,
	loop_user_68877_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [7:0] external_loop_66c6b_counter_delta;
	input wire [0:0] external_loop_66c6b_counter_delta_ready;
	output wire [7:0] loop_user_68877_counter_delta;
	input wire [0:0] loop_user_68877_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	assign loop_user_68877_counter_delta = (executed ? 1 : 0);
	assign external_loop_66c6b_counter_delta = (executed ? 1 : 0);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module external_loop_66c6b (
	clk,
	rst_n,
	array_array_66ce9_q,
	array_array_66ce9_w,
	array_array_66ce9_widx,
	array_array_66ce9_d,
	memuser_92bfe_counter_delta,
	memuser_92bfe_counter_delta_ready,
	fifo_calculate_loop_92b65_In_full_flag_push_valid,
	fifo_calculate_loop_92b65_In_full_flag_push_data,
	fifo_calculate_loop_92b65_In_full_flag_push_ready,
	array_array_66cd1_q,
	array_array_66cd1_w,
	array_array_66cd1_widx,
	array_array_66cd1_d,
	array_array_66cc8_q,
	array_array_66cc8_w,
	array_array_66cc8_widx,
	array_array_66cc8_d,
	array_array_92b5c_q,
	array_array_92bf5_q,
	array_array_92bf5_w,
	array_array_92bf5_widx,
	array_array_92bf5_d,
	array_array_92b47_q,
	array_array_66cd7_q,
	array_array_66cd7_w,
	array_array_66cd7_widx,
	array_array_66cd7_d,
	array_array_92b50_q,
	calculate_loop_92b65_counter_delta,
	calculate_loop_92b65_counter_delta_ready,
	array_array_66cbf_q,
	array_array_66cbf_w,
	array_array_66cbf_widx,
	array_array_66cbf_d,
	array_array_92b56_q,
	array_array_92b62_q,
	array_array_92b62_w,
	array_array_92b62_widx,
	array_array_92b62_d,
	array_array_66ce3_q,
	array_array_66ce3_w,
	array_array_66ce3_widx,
	array_array_66ce3_d,
	array_array_66cdd_q,
	array_array_66cdd_w,
	array_array_66cdd_widx,
	array_array_66cdd_d,
	expose_var_201,
	expose_var_201_valid,
	expose_var_748,
	expose_var_748_valid,
	expose_var_801,
	expose_var_801_valid,
	expose_var_227,
	expose_var_227_valid,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [63:0] array_array_66ce9_q;
	output wire [0:0] array_array_66ce9_w;
	output wire [0:0] array_array_66ce9_widx;
	output wire [63:0] array_array_66ce9_d;
	output wire [7:0] memuser_92bfe_counter_delta;
	input wire [0:0] memuser_92bfe_counter_delta_ready;
	output wire [0:0] fifo_calculate_loop_92b65_In_full_flag_push_valid;
	output wire [0:0] fifo_calculate_loop_92b65_In_full_flag_push_data;
	input wire [0:0] fifo_calculate_loop_92b65_In_full_flag_push_ready;
	input wire [31:0] array_array_66cd1_q;
	output wire [0:0] array_array_66cd1_w;
	output wire [0:0] array_array_66cd1_widx;
	output wire [31:0] array_array_66cd1_d;
	input wire [31:0] array_array_66cc8_q;
	output wire [0:0] array_array_66cc8_w;
	output wire [0:0] array_array_66cc8_widx;
	output wire [31:0] array_array_66cc8_d;
	input wire [3:0] array_array_92b5c_q;
	input wire [63:0] array_array_92bf5_q;
	output wire [0:0] array_array_92bf5_w;
	output wire [0:0] array_array_92bf5_widx;
	output wire [63:0] array_array_92bf5_d;
	input wire [63:0] array_array_92b47_q;
	input wire [31:0] array_array_66cd7_q;
	output wire [0:0] array_array_66cd7_w;
	output wire [0:0] array_array_66cd7_widx;
	output wire [31:0] array_array_66cd7_d;
	input wire [63:0] array_array_92b50_q;
	output wire [7:0] calculate_loop_92b65_counter_delta;
	input wire [0:0] calculate_loop_92b65_counter_delta_ready;
	input wire [31:0] array_array_66cbf_q;
	output wire [0:0] array_array_66cbf_w;
	output wire [0:0] array_array_66cbf_widx;
	output wire [31:0] array_array_66cbf_d;
	input wire [63:0] array_array_92b56_q;
	input wire [31:0] array_array_92b62_q;
	output wire [0:0] array_array_92b62_w;
	output wire [0:0] array_array_92b62_widx;
	output wire [31:0] array_array_92b62_d;
	input wire [63:0] array_array_66ce3_q;
	output wire [0:0] array_array_66ce3_w;
	output wire [0:0] array_array_66ce3_widx;
	output wire [63:0] array_array_66ce3_d;
	input wire [63:0] array_array_66cdd_q;
	output wire [0:0] array_array_66cdd_w;
	output wire [0:0] array_array_66cdd_widx;
	output wire [63:0] array_array_66cdd_d;
	output wire [0:0] expose_var_201;
	output wire [0:0] expose_var_201_valid;
	output wire [11:0] expose_var_748;
	output wire [0:0] expose_var_748_valid;
	output wire [63:0] expose_var_801;
	output wire [0:0] expose_var_801_valid;
	output wire [0:0] expose_var_227;
	output wire [0:0] expose_var_227_valid;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [3:0] var_836;
	assign var_836 = array_array_92b5c_q[3:0];
	wire [0:0] var_183;
	assign var_183 = var_836 == 4'd1;
	wire [0:0] var_189;
	assign var_189 = var_836 == 4'd2;
	wire [0:0] var_192;
	assign var_192 = var_183 | var_189;
	wire [0:0] var_198;
	assign var_198 = var_836 == 4'd8;
	wire [0:0] var_201;
	assign var_201 = var_192 | var_198;
	assign expose_var_201 = var_201;
	assign expose_var_201_valid = executed && 1;
	wire [0:0] var_208;
	assign var_208 = var_836 == 4'd5;
	wire [0:0] var_215;
	assign var_215 = var_836 == 4'd6;
	wire [0:0] var_218;
	assign var_218 = var_208 | var_215;
	wire [0:0] var_224;
	assign var_224 = var_836 == 4'd10;
	wire [0:0] var_227;
	assign var_227 = var_218 | var_224;
	assign expose_var_227 = var_227;
	assign expose_var_227_valid = executed && 1;
	wire [0:0] var_233;
	assign var_233 = var_836 == 4'd0;
	wire [31:0] var_519;
	assign var_519 = array_array_66cbf_q[31:0];
	wire [31:0] var_823;
	assign var_823 = array_array_66cc8_q[31:0];
	wire [31:0] var_242;
	assign var_242 = var_823;
	wire [31:0] var_247;
	assign var_247 = var_519;
	wire [31:0] var_249;
	assign var_249 = var_242 | var_247;
	wire [31:0] var_252;
	assign var_252 = var_249;
	wire [31:0] var_258;
	assign var_258 = var_252;
	wire [31:0] var_263;
	assign var_263 = var_519;
	wire [31:0] var_265;
	assign var_265 = var_258 ^ var_263;
	wire [31:0] var_268;
	assign var_268 = var_265;
	wire [0:0] var_278;
	assign var_278 = var_836 == 4'd4;
	wire [63:0] var_147;
	assign var_147 = array_array_92b47_q[63:0];
	wire [63:0] var_856;
	assign var_856 = array_array_92b50_q[63:0];
	wire [31:0] var_289;
	assign var_289 = var_147[63:32];
	wire [31:0] var_293;
	assign var_293 = var_289;
	wire [31:0] var_298;
	assign var_298 = var_856[63:32];
	wire [31:0] var_302;
	assign var_302 = var_298;
	wire [31:0] var_304;
	assign var_304 = $signed(var_293) + $signed(var_302);
	wire [31:0] var_307;
	assign var_307 = var_304;
	wire [31:0] var_312;
	assign var_312 = var_147[63:32];
	wire [31:0] var_316;
	assign var_316 = var_312;
	wire [31:0] var_321;
	assign var_321 = var_856[63:32];
	wire [31:0] var_325;
	assign var_325 = var_321;
	wire [31:0] var_327;
	assign var_327 = $signed(var_316) - $signed(var_325);
	wire [31:0] var_330;
	assign var_330 = var_327;
	wire [31:0] var_336;
	assign var_336 = var_147[31:0];
	wire [31:0] var_340;
	assign var_340 = var_336;
	wire [31:0] var_345;
	assign var_345 = var_856[31:0];
	wire [31:0] var_349;
	assign var_349 = var_345;
	wire [31:0] var_351;
	assign var_351 = $signed(var_340) + $signed(var_349);
	wire [31:0] var_354;
	assign var_354 = var_351;
	wire [31:0] var_359;
	assign var_359 = var_147[31:0];
	wire [31:0] var_363;
	assign var_363 = var_359;
	wire [31:0] var_368;
	assign var_368 = var_856[31:0];
	wire [31:0] var_372;
	assign var_372 = var_368;
	wire [31:0] var_374;
	assign var_374 = $signed(var_363) - $signed(var_372);
	wire [31:0] var_377;
	assign var_377 = var_374;
	wire [31:0] var_379;
	assign var_379 = var_307;
	wire [31:0] var_381;
	assign var_381 = var_354;
	wire [63:0] var_383;
	assign var_383 = {var_379, var_381};
	wire [63:0] var_386;
	assign var_386 = var_383;
	wire [31:0] var_392;
	assign var_392 = var_330;
	wire [31:0] var_394;
	assign var_394 = var_377;
	wire [63:0] var_396;
	assign var_396 = {var_392, var_394};
	wire [63:0] var_399;
	assign var_399 = var_396;
	wire [0:0] var_409;
	assign var_409 = var_836 == 4'd7;
	wire [31:0] var_845;
	assign var_845 = array_array_66cd7_q[31:0];
	wire [31:0] var_814;
	assign var_814 = array_array_66cd1_q[31:0];
	wire [31:0] var_418;
	assign var_418 = var_845;
	wire [31:0] var_423;
	assign var_423 = var_814;
	wire [31:0] var_425;
	assign var_425 = var_418 << var_423;
	wire [31:0] var_429;
	assign var_429 = var_425 & 32'd1023;
	wire [31:0] var_432;
	assign var_432 = var_429;
	wire [0:0] var_441;
	assign var_441 = var_836 == 4'd9;
	wire [63:0] var_820;
	assign var_820 = array_array_92b56_q[63:0];
	wire [31:0] var_450;
	assign var_450 = var_820[63:32];
	wire [31:0] var_454;
	assign var_454 = var_450;
	wire [31:0] var_459;
	assign var_459 = var_856[63:32];
	wire [31:0] var_463;
	assign var_463 = var_459;
	wire [63:0] var_465;
	assign var_465 = $signed(var_454) * $signed(var_463);
	wire [31:0] var_471;
	assign var_471 = var_820[31:0];
	wire [31:0] var_475;
	assign var_475 = var_471;
	wire [31:0] var_480;
	assign var_480 = var_856[31:0];
	wire [31:0] var_484;
	assign var_484 = var_480;
	wire [63:0] var_486;
	assign var_486 = $signed(var_475) * $signed(var_484);
	wire [63:0] var_489;
	assign var_489 = $signed(var_465) - $signed(var_486);
	wire [31:0] var_492;
	assign var_492 = var_489[31:0];
	wire [31:0] var_496;
	assign var_496 = var_492;
	wire [31:0] var_501;
	assign var_501 = var_820[63:32];
	wire [31:0] var_505;
	assign var_505 = var_501;
	wire [31:0] var_510;
	assign var_510 = var_856[31:0];
	wire [31:0] var_514;
	assign var_514 = var_510;
	wire [63:0] var_516;
	assign var_516 = $signed(var_505) * $signed(var_514);
	wire [31:0] var_522;
	assign var_522 = var_820[31:0];
	wire [31:0] var_526;
	assign var_526 = var_522;
	wire [31:0] var_531;
	assign var_531 = var_856[63:32];
	wire [31:0] var_535;
	assign var_535 = var_531;
	wire [63:0] var_537;
	assign var_537 = $signed(var_526) * $signed(var_535);
	wire [63:0] var_540;
	assign var_540 = $signed(var_516) - $signed(var_537);
	wire [31:0] var_543;
	assign var_543 = var_540[31:0];
	wire [31:0] var_547;
	assign var_547 = var_543;
	wire [31:0] var_549;
	assign var_549 = var_496;
	wire [31:0] var_551;
	assign var_551 = var_547;
	wire [63:0] var_553;
	assign var_553 = {var_549, var_551};
	wire [63:0] var_556;
	assign var_556 = var_553;
	wire [0:0] var_565;
	assign var_565 = var_836 == 4'd10;
	wire [0:0] var_574;
	assign var_574 = var_519 == 32'd0;
	always @(posedge clk)
		if (executed && (var_565 && var_574))
			$display("%t\t[external_loop_66c6b]\t\tfinish", $time);
	wire [0:0] var_587;
	assign var_587 = var_823 == 32'd1023;
	wire [31:0] var_593;
	assign var_593 = var_823;
	wire [31:0] var_596;
	assign var_596 = var_593 + 32'd1;
	wire [31:0] var_599;
	assign var_599 = (var_587 ? 32'd0 : var_596);
	wire [31:0] var_610;
	assign var_610 = var_519;
	wire [31:0] var_612;
	assign var_612 = var_610 >> 32'd1;
	wire [31:0] var_618;
	assign var_618 = (var_587 ? var_612 : var_519);
	wire [31:0] var_629;
	assign var_629 = var_814;
	wire [31:0] var_631;
	assign var_631 = var_629 + 32'd1;
	wire [31:0] var_637;
	assign var_637 = (var_587 ? var_631 : var_814);
	wire [11:0] var_652;
	assign var_652 = var_845[11:0];
	wire [11:0] var_656;
	assign var_656 = var_652;
	wire [11:0] var_661;
	assign var_661 = var_823[11:0];
	wire [11:0] var_665;
	assign var_665 = var_661;
	wire [11:0] var_670;
	assign var_670 = var_845[11:0];
	wire [11:0] var_674;
	assign var_674 = var_670;
	wire [11:0] var_679;
	assign var_679 = var_823[11:0];
	wire [11:0] var_683;
	assign var_683 = var_679;
	wire [31:0] var_685;
	assign var_685 = array_array_92b62_q[31:0];
	wire [11:0] var_688;
	assign var_688 = var_685[11:0];
	wire [11:0] var_692;
	assign var_692 = var_688;
	wire [11:0] var_695;
	assign var_695 = var_692 + 12'd1024;
	wire [11:0] var_698;
	assign var_698 = var_695;
	wire [11:0] var_703;
	assign var_703 = var_823[11:0];
	wire [11:0] var_707;
	assign var_707 = var_703;
	wire [0:0] var_709;
	assign var_709 = var_836 == 4'd1;
	wire [11:0] var_713;
	assign var_713 = (var_709 ? var_656 : 12'd0);
	wire [0:0] var_717;
	assign var_717 = var_836 == 4'd2;
	wire [11:0] var_720;
	assign var_720 = (var_717 ? var_665 : var_713);
	wire [0:0] var_724;
	assign var_724 = var_836 == 4'd5;
	wire [11:0] var_727;
	assign var_727 = (var_724 ? var_674 : var_720);
	wire [0:0] var_731;
	assign var_731 = var_836 == 4'd6;
	wire [11:0] var_734;
	assign var_734 = (var_731 ? var_683 : var_727);
	wire [0:0] var_738;
	assign var_738 = var_836 == 4'd8;
	wire [11:0] var_741;
	assign var_741 = (var_738 ? var_698 : var_734);
	wire [0:0] var_745;
	assign var_745 = var_836 == 4'd10;
	wire [11:0] var_748;
	assign var_748 = (var_745 ? var_707 : var_741);
	assign expose_var_748 = var_748;
	assign expose_var_748_valid = executed && 1;
	wire [63:0] var_755;
	assign var_755 = array_array_66cdd_q[63:0];
	wire [63:0] var_758;
	assign var_758 = var_755;
	wire [63:0] var_760;
	assign var_760 = array_array_66ce3_q[63:0];
	wire [63:0] var_763;
	assign var_763 = var_760;
	wire [63:0] var_765;
	assign var_765 = array_array_66ce9_q[63:0];
	wire [63:0] var_768;
	assign var_768 = var_765;
	wire [63:0] var_833;
	assign var_833 = array_array_92bf5_q[63:0];
	wire [0:0] var_773;
	assign var_773 = var_836 == 4'd5;
	wire [63:0] var_776;
	assign var_776 = (var_773 ? var_758 : var_833);
	wire [0:0] var_780;
	assign var_780 = var_836 == 4'd6;
	wire [63:0] var_783;
	assign var_783 = (var_780 ? var_763 : var_776);
	wire [0:0] var_787;
	assign var_787 = var_836 == 4'd10;
	wire [63:0] var_790;
	assign var_790 = (var_787 ? var_768 : var_783);
	wire [63:0] var_801;
	assign var_801 = var_833;
	assign expose_var_801 = var_801;
	assign expose_var_801_valid = executed && 1;
	always @(posedge clk)
		if (executed)
			$display("%t\t[external_loop_66c6b]\t\tstate: %d", $time, var_836);
	always @(posedge clk)
		if (executed)
			$display("%t\t[external_loop_66c6b]\t\tspan: %d odd: %d | even: %d | log0: %d", $time, var_519, var_823, var_845, var_814);
	always @(posedge clk)
		if (executed)
			$display("%t\t[external_loop_66c6b]\t\taddress_wire: %d     even_reg: %d | odd_reg: %d", $time, var_748, var_147, var_856);
	wire [63:0] var_848;
	assign var_848 = var_833;
	always @(posedge clk)
		if (executed)
			$display("%t\t[external_loop_66c6b]\t\twe: %d | re: %d | out: %d", $time, var_227, var_201, var_848);
	wire [31:0] var_860;
	assign var_860 = 32'd1024 - 32'd1;
	wire [0:0] var_863;
	assign var_863 = var_823 == var_860;
	wire [0:0] var_866;
	assign var_866 = var_863;
	assign calculate_loop_92b65_counter_delta = (executed ? 1 : 0);
	assign memuser_92bfe_counter_delta = (executed ? 1 : 0);
	assign fifo_calculate_loop_92b65_In_full_flag_push_valid = executed;
	assign fifo_calculate_loop_92b65_In_full_flag_push_data = var_866;
	assign array_array_66cc8_w = executed && (var_233 || var_565);
	assign array_array_66cc8_d = ({32 {var_233}} & var_252) | ({32 {var_565}} & var_599);
	assign array_array_66cc8_widx = ({var_233} & 1'd0) | ({var_565} & 1'd0);
	assign array_array_66ce3_w = executed && var_278;
	assign array_array_66ce3_d = {64 {var_278}} & var_399;
	assign array_array_66ce3_widx = {var_278} & 1'd0;
	assign array_array_66cbf_w = executed && var_565;
	assign array_array_66cbf_d = {32 {var_565}} & var_618;
	assign array_array_66cbf_widx = {var_565} & 1'd0;
	assign array_array_66cd1_w = executed && var_565;
	assign array_array_66cd1_d = {32 {var_565}} & var_637;
	assign array_array_66cd1_widx = {var_565} & 1'd0;
	assign array_array_66ce9_w = executed && var_441;
	assign array_array_66ce9_d = {64 {var_441}} & var_556;
	assign array_array_66ce9_widx = {var_441} & 1'd0;
	assign array_array_66cd7_w = executed && var_233;
	assign array_array_66cd7_d = {32 {var_233}} & var_268;
	assign array_array_66cd7_widx = {var_233} & 1'd0;
	assign array_array_92bf5_w = executed;
	assign array_array_92bf5_d = var_790;
	assign array_array_92bf5_widx = 1'd0;
	assign array_array_66cdd_w = executed && var_278;
	assign array_array_66cdd_d = {64 {var_278}} & var_386;
	assign array_array_66cdd_widx = {var_278} & 1'd0;
	assign array_array_92b62_w = executed && var_409;
	assign array_array_92b62_d = {32 {var_409}} & var_432;
	assign array_array_92b62_widx = {var_409} & 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module top (
	array_array_66cdd_exposed_o,
	array_array_66cdd_exposed_i,
	array_array_66cdd_exposed_i_valid,
	array_array_66ce9_exposed_o,
	array_array_66ce9_exposed_i,
	array_array_66ce9_exposed_i_valid,
	array_array_66ce3_exposed_o,
	array_array_66ce3_exposed_i,
	array_array_66ce3_exposed_i_valid,
	array_array_66cbf_exposed_o,
	array_array_66cbf_exposed_i,
	array_array_66cbf_exposed_i_valid,
	array_array_66cd1_exposed_o,
	array_array_66cd1_exposed_i,
	array_array_66cd1_exposed_i_valid,
	array_array_66cc8_exposed_o,
	array_array_66cc8_exposed_i,
	array_array_66cc8_exposed_i_valid,
	array_array_66cd7_exposed_o,
	array_array_66cd7_exposed_i,
	array_array_66cd7_exposed_i_valid,
	clk,
	rst_n
);
	output wire [63:0] array_array_66cdd_exposed_o;
	input wire [63:0] array_array_66cdd_exposed_i;
	input wire [0:0] array_array_66cdd_exposed_i_valid;
	output wire [63:0] array_array_66ce9_exposed_o;
	input wire [63:0] array_array_66ce9_exposed_i;
	input wire [0:0] array_array_66ce9_exposed_i_valid;
	output wire [63:0] array_array_66ce3_exposed_o;
	input wire [63:0] array_array_66ce3_exposed_i;
	input wire [0:0] array_array_66ce3_exposed_i_valid;
	output wire [31:0] array_array_66cbf_exposed_o;
	input wire [31:0] array_array_66cbf_exposed_i;
	input wire [0:0] array_array_66cbf_exposed_i_valid;
	output wire [31:0] array_array_66cd1_exposed_o;
	input wire [31:0] array_array_66cd1_exposed_i;
	input wire [0:0] array_array_66cd1_exposed_i_valid;
	output wire [31:0] array_array_66cc8_exposed_o;
	input wire [31:0] array_array_66cc8_exposed_i;
	input wire [0:0] array_array_66cc8_exposed_i_valid;
	output wire [31:0] array_array_66cd7_exposed_o;
	input wire [31:0] array_array_66cd7_exposed_i;
	input wire [0:0] array_array_66cd7_exposed_i_valid;
	input wire clk;
	input wire rst_n;
	reg [63:0] array_array_66ce3_q;
	wire [63:0] array_array_66ce3_driver_external_loop_66c6b_d;
	wire [0:0] array_array_66ce3_driver_external_loop_66c6b_w;
	wire [0:0] array_array_66ce3_driver_external_loop_66c6b_widx;
	assign array_array_66ce3_exposed_o = array_array_66ce3_q;
	wire [63:0] array_array_66ce3_temp;
	wire [63:0] array_array_66ce3_d;
	assign array_array_66ce3_temp = (array_array_66ce3_exposed_i_valid ? array_array_66ce3_exposed_i : array_array_66ce3_d);
	wire [0:0] array_array_66ce3_widx;
	wire [0:0] array_array_66ce3_w;
	assign array_array_66ce3_d = {64 {array_array_66ce3_driver_external_loop_66c6b_w}} & array_array_66ce3_driver_external_loop_66c6b_d;
	assign array_array_66ce3_widx = {array_array_66ce3_driver_external_loop_66c6b_w} & array_array_66ce3_driver_external_loop_66c6b_widx;
	assign array_array_66ce3_w = array_array_66ce3_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66ce3_q[63:0] <= 64'd0;
		else if (array_array_66ce3_w)
			case (array_array_66ce3_widx)
				0: array_array_66ce3_q[63:0] <= array_array_66ce3_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66cd1_q;
	wire [31:0] array_array_66cd1_driver_external_loop_66c6b_d;
	wire [0:0] array_array_66cd1_driver_external_loop_66c6b_w;
	wire [0:0] array_array_66cd1_driver_external_loop_66c6b_widx;
	assign array_array_66cd1_exposed_o = array_array_66cd1_q;
	wire [31:0] array_array_66cd1_temp;
	wire [31:0] array_array_66cd1_d;
	assign array_array_66cd1_temp = (array_array_66cd1_exposed_i_valid ? array_array_66cd1_exposed_i : array_array_66cd1_d);
	wire [0:0] array_array_66cd1_widx;
	wire [0:0] array_array_66cd1_w;
	assign array_array_66cd1_d = {32 {array_array_66cd1_driver_external_loop_66c6b_w}} & array_array_66cd1_driver_external_loop_66c6b_d;
	assign array_array_66cd1_widx = {array_array_66cd1_driver_external_loop_66c6b_w} & array_array_66cd1_driver_external_loop_66c6b_widx;
	assign array_array_66cd1_w = array_array_66cd1_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66cd1_q[31:0] <= 32'd0;
		else if (array_array_66cd1_w)
			case (array_array_66cd1_widx)
				0: array_array_66cd1_q[31:0] <= array_array_66cd1_temp;
				default:
					;
			endcase
	wire [63:0] array_array_683e6_q;
	wire [63:0] array_array_683e6_driver_SRAM_683b0_d;
	wire [0:0] array_array_683e6_driver_SRAM_683b0_w;
	wire [11:0] array_array_683e6_driver_SRAM_683b0_widx;
	reg [63:0] array_array_92bf5_q;
	wire [63:0] array_array_92bf5_driver_external_loop_66c6b_d;
	wire [0:0] array_array_92bf5_driver_external_loop_66c6b_w;
	wire [0:0] array_array_92bf5_driver_external_loop_66c6b_widx;
	wire [63:0] array_array_92bf5_d;
	wire [0:0] array_array_92bf5_widx;
	wire [0:0] array_array_92bf5_w;
	assign array_array_92bf5_d = {64 {array_array_92bf5_driver_external_loop_66c6b_w}} & array_array_92bf5_driver_external_loop_66c6b_d;
	assign array_array_92bf5_widx = {array_array_92bf5_driver_external_loop_66c6b_w} & array_array_92bf5_driver_external_loop_66c6b_widx;
	assign array_array_92bf5_w = array_array_92bf5_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_92bf5_q <= 64'd0;
		else if (array_array_92bf5_w)
			case (array_array_92bf5_widx)
				0: array_array_92bf5_q[63:0] <= array_array_92bf5_d;
				default:
					;
			endcase
	reg [63:0] array_array_66ce9_q;
	wire [63:0] array_array_66ce9_driver_external_loop_66c6b_d;
	wire [0:0] array_array_66ce9_driver_external_loop_66c6b_w;
	wire [0:0] array_array_66ce9_driver_external_loop_66c6b_widx;
	assign array_array_66ce9_exposed_o = array_array_66ce9_q;
	wire [63:0] array_array_66ce9_temp;
	wire [63:0] array_array_66ce9_d;
	assign array_array_66ce9_temp = (array_array_66ce9_exposed_i_valid ? array_array_66ce9_exposed_i : array_array_66ce9_d);
	wire [0:0] array_array_66ce9_widx;
	wire [0:0] array_array_66ce9_w;
	assign array_array_66ce9_d = {64 {array_array_66ce9_driver_external_loop_66c6b_w}} & array_array_66ce9_driver_external_loop_66c6b_d;
	assign array_array_66ce9_widx = {array_array_66ce9_driver_external_loop_66c6b_w} & array_array_66ce9_driver_external_loop_66c6b_widx;
	assign array_array_66ce9_w = array_array_66ce9_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66ce9_q[63:0] <= 64'd0;
		else if (array_array_66ce9_w)
			case (array_array_66ce9_widx)
				0: array_array_66ce9_q[63:0] <= array_array_66ce9_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66cd7_q;
	wire [31:0] array_array_66cd7_driver_external_loop_66c6b_d;
	wire [0:0] array_array_66cd7_driver_external_loop_66c6b_w;
	wire [0:0] array_array_66cd7_driver_external_loop_66c6b_widx;
	assign array_array_66cd7_exposed_o = array_array_66cd7_q;
	wire [31:0] array_array_66cd7_temp;
	wire [31:0] array_array_66cd7_d;
	assign array_array_66cd7_temp = (array_array_66cd7_exposed_i_valid ? array_array_66cd7_exposed_i : array_array_66cd7_d);
	wire [0:0] array_array_66cd7_widx;
	wire [0:0] array_array_66cd7_w;
	assign array_array_66cd7_d = {32 {array_array_66cd7_driver_external_loop_66c6b_w}} & array_array_66cd7_driver_external_loop_66c6b_d;
	assign array_array_66cd7_widx = {array_array_66cd7_driver_external_loop_66c6b_w} & array_array_66cd7_driver_external_loop_66c6b_widx;
	assign array_array_66cd7_w = array_array_66cd7_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66cd7_q[31:0] <= 32'd0;
		else if (array_array_66cd7_w)
			case (array_array_66cd7_widx)
				0: array_array_66cd7_q[31:0] <= array_array_66cd7_temp;
				default:
					;
			endcase
	reg [63:0] array_array_92b47_q;
	wire [63:0] array_array_92b47_driver_memuser_92bfe_d;
	wire [0:0] array_array_92b47_driver_memuser_92bfe_w;
	wire [0:0] array_array_92b47_driver_memuser_92bfe_widx;
	wire [63:0] array_array_92b47_d;
	wire [0:0] array_array_92b47_widx;
	wire [0:0] array_array_92b47_w;
	assign array_array_92b47_d = {64 {array_array_92b47_driver_memuser_92bfe_w}} & array_array_92b47_driver_memuser_92bfe_d;
	assign array_array_92b47_widx = {array_array_92b47_driver_memuser_92bfe_w} & array_array_92b47_driver_memuser_92bfe_widx;
	assign array_array_92b47_w = array_array_92b47_driver_memuser_92bfe_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_92b47_q <= 64'd0;
		else if (array_array_92b47_w)
			case (array_array_92b47_widx)
				0: array_array_92b47_q[63:0] <= array_array_92b47_d;
				default:
					;
			endcase
	reg [31:0] array_array_92b62_q;
	wire [31:0] array_array_92b62_driver_external_loop_66c6b_d;
	wire [0:0] array_array_92b62_driver_external_loop_66c6b_w;
	wire [0:0] array_array_92b62_driver_external_loop_66c6b_widx;
	wire [31:0] array_array_92b62_d;
	wire [0:0] array_array_92b62_widx;
	wire [0:0] array_array_92b62_w;
	assign array_array_92b62_d = {32 {array_array_92b62_driver_external_loop_66c6b_w}} & array_array_92b62_driver_external_loop_66c6b_d;
	assign array_array_92b62_widx = {array_array_92b62_driver_external_loop_66c6b_w} & array_array_92b62_driver_external_loop_66c6b_widx;
	assign array_array_92b62_w = array_array_92b62_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_92b62_q[31:0] <= 32'd0;
		else if (array_array_92b62_w)
			case (array_array_92b62_widx)
				0: array_array_92b62_q[31:0] <= array_array_92b62_d;
				default:
					;
			endcase
	reg [31:0] array_array_66cbf_q;
	wire [31:0] array_array_66cbf_driver_external_loop_66c6b_d;
	wire [0:0] array_array_66cbf_driver_external_loop_66c6b_w;
	wire [0:0] array_array_66cbf_driver_external_loop_66c6b_widx;
	assign array_array_66cbf_exposed_o = array_array_66cbf_q;
	wire [31:0] array_array_66cbf_temp;
	wire [31:0] array_array_66cbf_d;
	assign array_array_66cbf_temp = (array_array_66cbf_exposed_i_valid ? array_array_66cbf_exposed_i : array_array_66cbf_d);
	wire [0:0] array_array_66cbf_widx;
	wire [0:0] array_array_66cbf_w;
	assign array_array_66cbf_d = {32 {array_array_66cbf_driver_external_loop_66c6b_w}} & array_array_66cbf_driver_external_loop_66c6b_d;
	assign array_array_66cbf_widx = {array_array_66cbf_driver_external_loop_66c6b_w} & array_array_66cbf_driver_external_loop_66c6b_widx;
	assign array_array_66cbf_w = array_array_66cbf_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66cbf_q[31:0] <= 32'd512;
		else if (array_array_66cbf_w)
			case (array_array_66cbf_widx)
				0: array_array_66cbf_q[31:0] <= array_array_66cbf_temp;
				default:
					;
			endcase
	reg [63:0] array_array_92b56_q;
	wire [63:0] array_array_92b56_driver_memuser_92bfe_d;
	wire [0:0] array_array_92b56_driver_memuser_92bfe_w;
	wire [0:0] array_array_92b56_driver_memuser_92bfe_widx;
	wire [63:0] array_array_92b56_d;
	wire [0:0] array_array_92b56_widx;
	wire [0:0] array_array_92b56_w;
	assign array_array_92b56_d = {64 {array_array_92b56_driver_memuser_92bfe_w}} & array_array_92b56_driver_memuser_92bfe_d;
	assign array_array_92b56_widx = {array_array_92b56_driver_memuser_92bfe_w} & array_array_92b56_driver_memuser_92bfe_widx;
	assign array_array_92b56_w = array_array_92b56_driver_memuser_92bfe_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_92b56_q <= 64'd0;
		else if (array_array_92b56_w)
			case (array_array_92b56_widx)
				0: array_array_92b56_q[63:0] <= array_array_92b56_d;
				default:
					;
			endcase
	reg [63:0] array_array_92b50_q;
	wire [63:0] array_array_92b50_driver_memuser_92bfe_d;
	wire [0:0] array_array_92b50_driver_memuser_92bfe_w;
	wire [0:0] array_array_92b50_driver_memuser_92bfe_widx;
	wire [63:0] array_array_92b50_d;
	wire [0:0] array_array_92b50_widx;
	wire [0:0] array_array_92b50_w;
	assign array_array_92b50_d = {64 {array_array_92b50_driver_memuser_92bfe_w}} & array_array_92b50_driver_memuser_92bfe_d;
	assign array_array_92b50_widx = {array_array_92b50_driver_memuser_92bfe_w} & array_array_92b50_driver_memuser_92bfe_widx;
	assign array_array_92b50_w = array_array_92b50_driver_memuser_92bfe_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_92b50_q <= 64'd0;
		else if (array_array_92b50_w)
			case (array_array_92b50_widx)
				0: array_array_92b50_q[63:0] <= array_array_92b50_d;
				default:
					;
			endcase
	reg [3:0] array_array_92b5c_q;
	wire [3:0] array_array_92b5c_driver_calculate_loop_92b65_d;
	wire [0:0] array_array_92b5c_driver_calculate_loop_92b65_w;
	wire [0:0] array_array_92b5c_driver_calculate_loop_92b65_widx;
	wire [3:0] array_array_92b5c_d;
	wire [0:0] array_array_92b5c_widx;
	wire [0:0] array_array_92b5c_w;
	assign array_array_92b5c_d = {4 {array_array_92b5c_driver_calculate_loop_92b65_w}} & array_array_92b5c_driver_calculate_loop_92b65_d;
	assign array_array_92b5c_widx = {array_array_92b5c_driver_calculate_loop_92b65_w} & array_array_92b5c_driver_calculate_loop_92b65_widx;
	assign array_array_92b5c_w = array_array_92b5c_driver_calculate_loop_92b65_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_92b5c_q[3:0] <= 4'd0;
		else if (array_array_92b5c_w)
			case (array_array_92b5c_widx)
				0: array_array_92b5c_q[3:0] <= array_array_92b5c_d;
				default:
					;
			endcase
	reg [63:0] array_array_66cdd_q;
	wire [63:0] array_array_66cdd_driver_external_loop_66c6b_d;
	wire [0:0] array_array_66cdd_driver_external_loop_66c6b_w;
	wire [0:0] array_array_66cdd_driver_external_loop_66c6b_widx;
	assign array_array_66cdd_exposed_o = array_array_66cdd_q;
	wire [63:0] array_array_66cdd_temp;
	wire [63:0] array_array_66cdd_d;
	assign array_array_66cdd_temp = (array_array_66cdd_exposed_i_valid ? array_array_66cdd_exposed_i : array_array_66cdd_d);
	wire [0:0] array_array_66cdd_widx;
	wire [0:0] array_array_66cdd_w;
	assign array_array_66cdd_d = {64 {array_array_66cdd_driver_external_loop_66c6b_w}} & array_array_66cdd_driver_external_loop_66c6b_d;
	assign array_array_66cdd_widx = {array_array_66cdd_driver_external_loop_66c6b_w} & array_array_66cdd_driver_external_loop_66c6b_widx;
	assign array_array_66cdd_w = array_array_66cdd_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66cdd_q[63:0] <= 64'd0;
		else if (array_array_66cdd_w)
			case (array_array_66cdd_widx)
				0: array_array_66cdd_q[63:0] <= array_array_66cdd_temp;
				default:
					;
			endcase
	reg [31:0] array_array_688b3_q;
	wire [31:0] array_array_688b3_d;
	wire [0:0] array_array_688b3_widx;
	wire [0:0] array_array_688b3_w;
	assign array_array_688b3_d = 1'sbx;
	assign array_array_688b3_widx = 1'sbx;
	assign array_array_688b3_w = 1'sbx;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_688b3_q <= 32'd0;
		else if (array_array_688b3_w)
			case (array_array_688b3_widx)
				0: array_array_688b3_q[31:0] <= array_array_688b3_d;
				default:
					;
			endcase
	reg [31:0] array_array_66cc8_q;
	wire [31:0] array_array_66cc8_driver_external_loop_66c6b_d;
	wire [0:0] array_array_66cc8_driver_external_loop_66c6b_w;
	wire [0:0] array_array_66cc8_driver_external_loop_66c6b_widx;
	assign array_array_66cc8_exposed_o = array_array_66cc8_q;
	wire [31:0] array_array_66cc8_temp;
	wire [31:0] array_array_66cc8_d;
	assign array_array_66cc8_temp = (array_array_66cc8_exposed_i_valid ? array_array_66cc8_exposed_i : array_array_66cc8_d);
	wire [0:0] array_array_66cc8_widx;
	wire [0:0] array_array_66cc8_w;
	assign array_array_66cc8_d = {32 {array_array_66cc8_driver_external_loop_66c6b_w}} & array_array_66cc8_driver_external_loop_66c6b_d;
	assign array_array_66cc8_widx = {array_array_66cc8_driver_external_loop_66c6b_w} & array_array_66cc8_driver_external_loop_66c6b_widx;
	assign array_array_66cc8_w = array_array_66cc8_driver_external_loop_66c6b_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66cc8_q[31:0] <= 32'd0;
		else if (array_array_66cc8_w)
			case (array_array_66cc8_widx)
				0: array_array_66cc8_q[31:0] <= array_array_66cc8_temp;
				default:
					;
			endcase
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_pop_data;
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_pop_valid;
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_pop_ready;
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_data;
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_valid;
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_ready;
	wire fifo_calculate_loop_92b65_In_full_flag_push_ready;
	assign fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_ready = fifo_calculate_loop_92b65_In_full_flag_push_ready;
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_push_valid;
	assign fifo_calculate_loop_92b65_In_full_flag_push_valid = fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_valid;
	wire [0:0] fifo_calculate_loop_92b65_In_full_flag_push_data;
	assign fifo_calculate_loop_92b65_In_full_flag_push_data = {fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_valid} & fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_data;
	fifo #(
		.WIDTH(1),
		.DEPTH_LOG2(2)
	) fifo_calculate_loop_92b65_In_full_flag_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_calculate_loop_92b65_In_full_flag_push_valid),
		.push_data(fifo_calculate_loop_92b65_In_full_flag_push_data),
		.push_ready(fifo_calculate_loop_92b65_In_full_flag_push_ready),
		.pop_valid(fifo_calculate_loop_92b65_In_full_flag_pop_valid),
		.pop_data(fifo_calculate_loop_92b65_In_full_flag_pop_data),
		.pop_ready(fifo_calculate_loop_92b65_In_full_flag_pop_ready)
	);
	wire [63:0] fifo_memuser_92bfe_rdata_pop_data;
	wire [0:0] fifo_memuser_92bfe_rdata_pop_valid;
	wire [0:0] fifo_memuser_92bfe_rdata_pop_ready;
	wire [63:0] fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_data;
	wire [0:0] fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid;
	wire [0:0] fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_ready;
	wire fifo_memuser_92bfe_rdata_push_ready;
	assign fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_ready = fifo_memuser_92bfe_rdata_push_ready;
	wire [0:0] fifo_memuser_92bfe_rdata_push_valid;
	assign fifo_memuser_92bfe_rdata_push_valid = fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid;
	wire [63:0] fifo_memuser_92bfe_rdata_push_data;
	assign fifo_memuser_92bfe_rdata_push_data = {64 {fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid}} & fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_data;
	fifo #(
		.WIDTH(64),
		.DEPTH_LOG2(2)
	) fifo_memuser_92bfe_rdata_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_memuser_92bfe_rdata_push_valid),
		.push_data(fifo_memuser_92bfe_rdata_push_data),
		.push_ready(fifo_memuser_92bfe_rdata_push_ready),
		.pop_valid(fifo_memuser_92bfe_rdata_pop_valid),
		.pop_data(fifo_memuser_92bfe_rdata_pop_data),
		.pop_ready(fifo_memuser_92bfe_rdata_pop_ready)
	);
	wire [7:0] calculate_loop_92b65_driver_external_loop_66c6b_counter_delta;
	wire [0:0] calculate_loop_92b65_driver_external_loop_66c6b_counter_delta_ready;
	wire [0:0] calculate_loop_92b65_counter_delta_ready;
	wire [7:0] calculate_loop_92b65_counter_delta;
	assign calculate_loop_92b65_counter_delta = calculate_loop_92b65_driver_external_loop_66c6b_counter_delta;
	wire [0:0] calculate_loop_92b65_counter_pop_ready;
	assign calculate_loop_92b65_driver_external_loop_66c6b_counter_delta_ready = calculate_loop_92b65_counter_pop_ready;
	wire [0:0] calculate_loop_92b65_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) calculate_loop_92b65_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(calculate_loop_92b65_counter_delta),
		.delta_ready(calculate_loop_92b65_counter_delta_ready),
		.pop_valid(calculate_loop_92b65_counter_pop_valid),
		.pop_ready(calculate_loop_92b65_counter_pop_ready)
	);
	wire [7:0] memuser_92bfe_driver_external_loop_66c6b_counter_delta;
	wire [0:0] memuser_92bfe_driver_external_loop_66c6b_counter_delta_ready;
	wire [0:0] memuser_92bfe_counter_delta_ready;
	wire [7:0] memuser_92bfe_counter_delta;
	assign memuser_92bfe_counter_delta = memuser_92bfe_driver_external_loop_66c6b_counter_delta;
	wire [0:0] memuser_92bfe_counter_pop_ready;
	assign memuser_92bfe_driver_external_loop_66c6b_counter_delta_ready = memuser_92bfe_counter_pop_ready;
	wire [0:0] memuser_92bfe_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) memuser_92bfe_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(memuser_92bfe_counter_delta),
		.delta_ready(memuser_92bfe_counter_delta_ready),
		.pop_valid(memuser_92bfe_counter_pop_valid),
		.pop_ready(memuser_92bfe_counter_pop_ready)
	);
	wire [7:0] loop_user_68877_driver_driver_counter_delta;
	wire [0:0] loop_user_68877_driver_driver_counter_delta_ready;
	wire [0:0] loop_user_68877_counter_delta_ready;
	wire [7:0] loop_user_68877_counter_delta;
	assign loop_user_68877_counter_delta = loop_user_68877_driver_driver_counter_delta;
	wire [0:0] loop_user_68877_counter_pop_ready;
	assign loop_user_68877_driver_driver_counter_delta_ready = loop_user_68877_counter_pop_ready;
	wire [0:0] loop_user_68877_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) loop_user_68877_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(loop_user_68877_counter_delta),
		.delta_ready(loop_user_68877_counter_delta_ready),
		.pop_valid(loop_user_68877_counter_pop_valid),
		.pop_ready(loop_user_68877_counter_pop_ready)
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
	wire [7:0] external_loop_66c6b_driver_driver_counter_delta;
	wire [0:0] external_loop_66c6b_driver_driver_counter_delta_ready;
	wire [0:0] external_loop_66c6b_counter_delta_ready;
	wire [7:0] external_loop_66c6b_counter_delta;
	assign external_loop_66c6b_counter_delta = external_loop_66c6b_driver_driver_counter_delta;
	wire [0:0] external_loop_66c6b_counter_pop_ready;
	assign external_loop_66c6b_driver_driver_counter_delta_ready = external_loop_66c6b_counter_pop_ready;
	wire [0:0] external_loop_66c6b_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) external_loop_66c6b_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(external_loop_66c6b_counter_delta),
		.delta_ready(external_loop_66c6b_counter_delta_ready),
		.pop_valid(external_loop_66c6b_counter_pop_valid),
		.pop_ready(external_loop_66c6b_counter_pop_ready)
	);
	assign driver_counter_delta = 8'b00000001;
	wire [0:0] calculate_loop_92b65_executed;
	calculate_loop_92b65 calculate_loop_92b65_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_In_full_flag_pop_ready(fifo_calculate_loop_92b65_In_full_flag_pop_ready),
		.fifo_In_full_flag_pop_data(fifo_calculate_loop_92b65_In_full_flag_pop_data),
		.fifo_In_full_flag_pop_valid(fifo_calculate_loop_92b65_In_full_flag_pop_valid),
		.array_array_92b5c_q(array_array_92b5c_q),
		.array_array_92b5c_w(array_array_92b5c_driver_calculate_loop_92b65_w),
		.array_array_92b5c_widx(array_array_92b5c_driver_calculate_loop_92b65_widx),
		.array_array_92b5c_d(array_array_92b5c_driver_calculate_loop_92b65_d),
		.array_array_92b62_q(array_array_92b62_q),
		.counter_delta_ready(calculate_loop_92b65_counter_delta_ready),
		.counter_pop_ready(calculate_loop_92b65_counter_pop_ready),
		.counter_pop_valid(calculate_loop_92b65_counter_pop_valid),
		.expose_executed(calculate_loop_92b65_executed)
	);
	wire [0:0] memuser_92bfe_executed;
	memuser_92bfe memuser_92bfe_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_rdata_pop_ready(fifo_memuser_92bfe_rdata_pop_ready),
		.fifo_rdata_pop_data(fifo_memuser_92bfe_rdata_pop_data),
		.fifo_rdata_pop_valid(fifo_memuser_92bfe_rdata_pop_valid),
		.array_array_92b50_q(array_array_92b50_q),
		.array_array_92b50_w(array_array_92b50_driver_memuser_92bfe_w),
		.array_array_92b50_widx(array_array_92b50_driver_memuser_92bfe_widx),
		.array_array_92b50_d(array_array_92b50_driver_memuser_92bfe_d),
		.array_array_92b56_q(array_array_92b56_q),
		.array_array_92b56_w(array_array_92b56_driver_memuser_92bfe_w),
		.array_array_92b56_widx(array_array_92b56_driver_memuser_92bfe_widx),
		.array_array_92b56_d(array_array_92b56_driver_memuser_92bfe_d),
		.array_array_92b5c_q(array_array_92b5c_q),
		.array_array_92b47_q(array_array_92b47_q),
		.array_array_92b47_w(array_array_92b47_driver_memuser_92bfe_w),
		.array_array_92b47_widx(array_array_92b47_driver_memuser_92bfe_widx),
		.array_array_92b47_d(array_array_92b47_driver_memuser_92bfe_d),
		.counter_delta_ready(memuser_92bfe_counter_delta_ready),
		.counter_pop_ready(memuser_92bfe_counter_pop_ready),
		.counter_pop_valid(memuser_92bfe_counter_pop_valid),
		.expose_executed(memuser_92bfe_executed)
	);
	wire [0:0] loop_user_68877_executed;
	loop_user_68877 loop_user_68877_i(
		.clk(clk),
		.rst_n(rst_n),
		.counter_delta_ready(loop_user_68877_counter_delta_ready),
		.counter_pop_ready(loop_user_68877_counter_pop_ready),
		.counter_pop_valid(loop_user_68877_counter_pop_valid),
		.expose_executed(loop_user_68877_executed)
	);
	wire [0:0] driver_executed;
	driver driver_i(
		.clk(clk),
		.rst_n(rst_n),
		.external_loop_66c6b_counter_delta_ready(external_loop_66c6b_driver_driver_counter_delta_ready),
		.external_loop_66c6b_counter_delta(external_loop_66c6b_driver_driver_counter_delta),
		.loop_user_68877_counter_delta_ready(loop_user_68877_driver_driver_counter_delta_ready),
		.loop_user_68877_counter_delta(loop_user_68877_driver_driver_counter_delta),
		.counter_delta_ready(driver_counter_delta_ready),
		.counter_pop_ready(driver_counter_pop_ready),
		.counter_pop_valid(driver_counter_pop_valid),
		.expose_executed(driver_executed)
	);
	wire [0:0] logic_var_201;
	wire [0:0] logic_var_201_valid;
	wire [11:0] logic_var_748;
	wire [0:0] logic_var_748_valid;
	wire [63:0] logic_var_801;
	wire [0:0] logic_var_801_valid;
	wire [0:0] logic_var_227;
	wire [0:0] logic_var_227_valid;
	wire [0:0] external_loop_66c6b_executed;
	external_loop_66c6b external_loop_66c6b_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_66ce9_q(array_array_66ce9_q),
		.array_array_66ce9_w(array_array_66ce9_driver_external_loop_66c6b_w),
		.array_array_66ce9_widx(array_array_66ce9_driver_external_loop_66c6b_widx),
		.array_array_66ce9_d(array_array_66ce9_driver_external_loop_66c6b_d),
		.memuser_92bfe_counter_delta_ready(memuser_92bfe_driver_external_loop_66c6b_counter_delta_ready),
		.memuser_92bfe_counter_delta(memuser_92bfe_driver_external_loop_66c6b_counter_delta),
		.fifo_calculate_loop_92b65_In_full_flag_push_valid(fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_valid),
		.fifo_calculate_loop_92b65_In_full_flag_push_data(fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_data),
		.fifo_calculate_loop_92b65_In_full_flag_push_ready(fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_ready),
		.array_array_66cd1_q(array_array_66cd1_q),
		.array_array_66cd1_w(array_array_66cd1_driver_external_loop_66c6b_w),
		.array_array_66cd1_widx(array_array_66cd1_driver_external_loop_66c6b_widx),
		.array_array_66cd1_d(array_array_66cd1_driver_external_loop_66c6b_d),
		.array_array_66cc8_q(array_array_66cc8_q),
		.array_array_66cc8_w(array_array_66cc8_driver_external_loop_66c6b_w),
		.array_array_66cc8_widx(array_array_66cc8_driver_external_loop_66c6b_widx),
		.array_array_66cc8_d(array_array_66cc8_driver_external_loop_66c6b_d),
		.array_array_92b5c_q(array_array_92b5c_q),
		.array_array_92bf5_q(array_array_92bf5_q),
		.array_array_92bf5_w(array_array_92bf5_driver_external_loop_66c6b_w),
		.array_array_92bf5_widx(array_array_92bf5_driver_external_loop_66c6b_widx),
		.array_array_92bf5_d(array_array_92bf5_driver_external_loop_66c6b_d),
		.array_array_92b47_q(array_array_92b47_q),
		.array_array_66cd7_q(array_array_66cd7_q),
		.array_array_66cd7_w(array_array_66cd7_driver_external_loop_66c6b_w),
		.array_array_66cd7_widx(array_array_66cd7_driver_external_loop_66c6b_widx),
		.array_array_66cd7_d(array_array_66cd7_driver_external_loop_66c6b_d),
		.array_array_92b50_q(array_array_92b50_q),
		.calculate_loop_92b65_counter_delta_ready(calculate_loop_92b65_driver_external_loop_66c6b_counter_delta_ready),
		.calculate_loop_92b65_counter_delta(calculate_loop_92b65_driver_external_loop_66c6b_counter_delta),
		.array_array_66cbf_q(array_array_66cbf_q),
		.array_array_66cbf_w(array_array_66cbf_driver_external_loop_66c6b_w),
		.array_array_66cbf_widx(array_array_66cbf_driver_external_loop_66c6b_widx),
		.array_array_66cbf_d(array_array_66cbf_driver_external_loop_66c6b_d),
		.array_array_92b56_q(array_array_92b56_q),
		.array_array_92b62_q(array_array_92b62_q),
		.array_array_92b62_w(array_array_92b62_driver_external_loop_66c6b_w),
		.array_array_92b62_widx(array_array_92b62_driver_external_loop_66c6b_widx),
		.array_array_92b62_d(array_array_92b62_driver_external_loop_66c6b_d),
		.array_array_66ce3_q(array_array_66ce3_q),
		.array_array_66ce3_w(array_array_66ce3_driver_external_loop_66c6b_w),
		.array_array_66ce3_widx(array_array_66ce3_driver_external_loop_66c6b_widx),
		.array_array_66ce3_d(array_array_66ce3_driver_external_loop_66c6b_d),
		.array_array_66cdd_q(array_array_66cdd_q),
		.array_array_66cdd_w(array_array_66cdd_driver_external_loop_66c6b_w),
		.array_array_66cdd_widx(array_array_66cdd_driver_external_loop_66c6b_widx),
		.array_array_66cdd_d(array_array_66cdd_driver_external_loop_66c6b_d),
		.expose_var_201(logic_var_201),
		.expose_var_201_valid(logic_var_201_valid),
		.expose_var_748(logic_var_748),
		.expose_var_748_valid(logic_var_748_valid),
		.expose_var_801(logic_var_801),
		.expose_var_801_valid(logic_var_801_valid),
		.expose_var_227(logic_var_227),
		.expose_var_227_valid(logic_var_227_valid),
		.counter_delta_ready(external_loop_66c6b_counter_delta_ready),
		.counter_pop_ready(external_loop_66c6b_counter_pop_ready),
		.counter_pop_valid(external_loop_66c6b_counter_pop_valid),
		.expose_executed(external_loop_66c6b_executed)
	);
	wire [0:0] SRAM_683b0_executed;
	SRAM_683b0 SRAM_683b0_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_memuser_92bfe_rdata_push_valid(fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid),
		.fifo_memuser_92bfe_rdata_push_data(fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_data),
		.fifo_memuser_92bfe_rdata_push_ready(fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_ready),
		.external_loop_66c6b_executed(external_loop_66c6b_executed),
		.var_227(logic_var_227),
		.var_227_valid(logic_var_227_valid),
		.var_801(logic_var_801),
		.var_801_valid(logic_var_801_valid),
		.var_201(logic_var_201),
		.var_201_valid(logic_var_201_valid),
		.var_748(logic_var_748),
		.var_748_valid(logic_var_748_valid),
		.expose_executed(SRAM_683b0_executed)
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
	wire [63:0] array_array_66cdd_exposed_o;
	wire [63:0] array_array_66cdd_exposed_i;
	wire array_array_66cdd_exposed_i_valid;
	assign array_array_66cdd_exposed_i_valid = 1'd0;
	assign array_array_66cdd_exposed_i = 64'd0;
	wire [63:0] array_array_66ce9_exposed_o;
	wire [63:0] array_array_66ce9_exposed_i;
	wire array_array_66ce9_exposed_i_valid;
	assign array_array_66ce9_exposed_i_valid = 1'd0;
	assign array_array_66ce9_exposed_i = 64'd0;
	wire [63:0] array_array_66ce3_exposed_o;
	wire [63:0] array_array_66ce3_exposed_i;
	wire array_array_66ce3_exposed_i_valid;
	assign array_array_66ce3_exposed_i_valid = 1'd0;
	assign array_array_66ce3_exposed_i = 64'd0;
	wire [31:0] array_array_66cbf_exposed_o;
	wire [31:0] array_array_66cbf_exposed_i;
	wire array_array_66cbf_exposed_i_valid;
	assign array_array_66cbf_exposed_i_valid = 1'd0;
	assign array_array_66cbf_exposed_i = 32'd0;
	wire [31:0] array_array_66cd1_exposed_o;
	wire [31:0] array_array_66cd1_exposed_i;
	wire array_array_66cd1_exposed_i_valid;
	assign array_array_66cd1_exposed_i_valid = 1'd0;
	assign array_array_66cd1_exposed_i = 32'd0;
	wire [31:0] array_array_66cc8_exposed_o;
	wire [31:0] array_array_66cc8_exposed_i;
	wire array_array_66cc8_exposed_i_valid;
	assign array_array_66cc8_exposed_i_valid = 1'd0;
	assign array_array_66cc8_exposed_i = 32'd0;
	wire [31:0] array_array_66cd7_exposed_o;
	wire [31:0] array_array_66cd7_exposed_i;
	wire array_array_66cd7_exposed_i_valid;
	assign array_array_66cd7_exposed_i_valid = 1'd0;
	assign array_array_66cd7_exposed_i = 32'd0;
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
		.array_array_66cdd_exposed_o(array_array_66cdd_exposed_o),
		.array_array_66cdd_exposed_i(array_array_66cdd_exposed_i),
		.array_array_66cdd_exposed_i_valid(array_array_66cdd_exposed_i_valid),
		.array_array_66ce9_exposed_o(array_array_66ce9_exposed_o),
		.array_array_66ce9_exposed_i(array_array_66ce9_exposed_i),
		.array_array_66ce9_exposed_i_valid(array_array_66ce9_exposed_i_valid),
		.array_array_66ce3_exposed_o(array_array_66ce3_exposed_o),
		.array_array_66ce3_exposed_i(array_array_66ce3_exposed_i),
		.array_array_66ce3_exposed_i_valid(array_array_66ce3_exposed_i_valid),
		.array_array_66cbf_exposed_o(array_array_66cbf_exposed_o),
		.array_array_66cbf_exposed_i(array_array_66cbf_exposed_i),
		.array_array_66cbf_exposed_i_valid(array_array_66cbf_exposed_i_valid),
		.array_array_66cd1_exposed_o(array_array_66cd1_exposed_o),
		.array_array_66cd1_exposed_i(array_array_66cd1_exposed_i),
		.array_array_66cd1_exposed_i_valid(array_array_66cd1_exposed_i_valid),
		.array_array_66cc8_exposed_o(array_array_66cc8_exposed_o),
		.array_array_66cc8_exposed_i(array_array_66cc8_exposed_i),
		.array_array_66cc8_exposed_i_valid(array_array_66cc8_exposed_i_valid),
		.array_array_66cd7_exposed_o(array_array_66cd7_exposed_o),
		.array_array_66cd7_exposed_i(array_array_66cd7_exposed_i),
		.array_array_66cd7_exposed_i_valid(array_array_66cd7_exposed_i_valid)
	);
endmodule