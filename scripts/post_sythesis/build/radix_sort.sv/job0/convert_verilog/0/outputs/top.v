module numbers_mem (
	clk,
	rst_n,
	fifo_memuser_4e4c2_rdata_push_valid,
	fifo_memuser_4e4c2_rdata_push_data,
	fifo_memuser_4e4c2_rdata_push_ready,
	driver_executed,
	var_201,
	var_201_valid,
	var_435,
	var_435_valid,
	var_195,
	var_195_valid,
	var_198,
	var_198_valid,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] fifo_memuser_4e4c2_rdata_push_valid;
	output wire [31:0] fifo_memuser_4e4c2_rdata_push_data;
	input wire [0:0] fifo_memuser_4e4c2_rdata_push_ready;
	input wire [0:0] driver_executed;
	input wire [31:0] var_201;
	input wire [0:0] var_201_valid;
	input wire [12:0] var_435;
	input wire [0:0] var_435_valid;
	input wire [0:0] var_195;
	input wire [0:0] var_195_valid;
	input wire [0:0] var_198;
	input wire [0:0] var_198_valid;
	output wire expose_executed;
	wire executed;
	wire [31:0] dataout;
	wire [31:0] var_458;
	assign var_458 = dataout;
	assign fifo_memuser_4e4c2_rdata_push_valid = executed && var_198;
	assign fifo_memuser_4e4c2_rdata_push_data = {32 {var_198}} & var_458;
	wire array_array_4e654_w;
	wire [31:0] array_array_4e654_d;
	wire [12:0] array_array_4e654_widx;
	assign array_array_4e654_w = executed && var_195;
	assign array_array_4e654_d = {32 {var_195}} & var_201;
	assign array_array_4e654_widx = var_435;
	memory_blackbox_array_4e654 #(
		.DATA_WIDTH(32),
		.ADDR_WIDTH(13)
	) memory_blackbox_array_4e654(
		.clk(clk),
		.address(array_array_4e654_widx),
		.wd(array_array_4e654_d),
		.banksel(1'd1),
		.read(1'd1),
		.write(array_array_4e654_w),
		.dataout(dataout),
		.rst_n(rst_n)
	);
	assign executed = driver_executed;
	assign expose_executed = executed;
endmodule
(* blackbox *) module memory_blackbox_array_4e654 (
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
module memuser_4e4c2 (
	clk,
	rst_n,
	fifo_rdata_pop_valid,
	fifo_rdata_pop_data,
	fifo_rdata_pop_ready,
	array_array_4e48f_q,
	array_array_4e4b3_q,
	array_array_4e4b3_w,
	array_array_4e4b3_widx,
	array_array_4e4b3_d,
	array_array_4e4b9_q,
	array_array_4e49e_q,
	expose_var_44,
	expose_var_44_valid,
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
	input wire [1:0] array_array_4e48f_q;
	input wire [511:0] array_array_4e4b3_q;
	output wire [0:0] array_array_4e4b3_w;
	output wire [3:0] array_array_4e4b3_widx;
	output wire [31:0] array_array_4e4b3_d;
	input wire [31:0] array_array_4e4b9_q;
	input wire [12:0] array_array_4e49e_q;
	output wire [31:0] expose_var_44;
	output wire [0:0] expose_var_44_valid;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire [0:0] var_38;
	assign var_38 = fifo_rdata_pop_valid;
	wire executed;
	wire [31:0] var_42;
	assign var_42 = fifo_rdata_pop_data;
	assign fifo_rdata_pop_ready = executed;
	wire [31:0] var_44;
	assign var_44 = var_42;
	assign expose_var_44 = var_44;
	assign expose_var_44_valid = executed && 1;
	wire [31:0] var_46;
	assign var_46 = array_array_4e4b9_q[31:0];
	wire [31:0] var_49;
	assign var_49 = var_44 >> var_46;
	wire [3:0] var_53;
	assign var_53 = var_49[3:0];
	wire [1:0] var_57;
	assign var_57 = array_array_4e48f_q[1:0];
	wire [0:0] var_60;
	assign var_60 = var_57 == 2'd1;
	wire [12:0] var_66;
	assign var_66 = array_array_4e49e_q[12:0];
	wire [12:0] var_70;
	assign var_70 = var_66 - 13'd1;
	always @(posedge clk)
		if (executed && var_60)
			$display("%t\t[memuser_4e4c2]\t\tStage 1: Read rdata=(%08x) from memory addr_reg[0]=(%08x)", $time, var_44, var_70);
	wire [31:0] var_78;
	assign var_78 = (15 == var_53 ? array_array_4e4b3_q[511:480] : (14 == var_53 ? array_array_4e4b3_q[479:448] : (13 == var_53 ? array_array_4e4b3_q[447:416] : (12 == var_53 ? array_array_4e4b3_q[415:384] : (11 == var_53 ? array_array_4e4b3_q[383:352] : (10 == var_53 ? array_array_4e4b3_q[351:320] : (9 == var_53 ? array_array_4e4b3_q[319:288] : (8 == var_53 ? array_array_4e4b3_q[287:256] : (7 == var_53 ? array_array_4e4b3_q[255:224] : (6 == var_53 ? array_array_4e4b3_q[223:192] : (5 == var_53 ? array_array_4e4b3_q[191:160] : (4 == var_53 ? array_array_4e4b3_q[159:128] : (3 == var_53 ? array_array_4e4b3_q[127:96] : (2 == var_53 ? array_array_4e4b3_q[95:64] : (1 == var_53 ? array_array_4e4b3_q[63:32] : (0 == var_53 ? array_array_4e4b3_q[31:0] : {32 {1'sbx}}))))))))))))))));
	wire [31:0] var_82;
	assign var_82 = var_78 + 32'd1;
	assign array_array_4e4b3_w = executed && var_60;
	assign array_array_4e4b3_d = {32 {var_60}} & var_82;
	assign array_array_4e4b3_widx = {4 {var_60}} & var_53;
	assign executed = counter_pop_valid && var_38;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module radixreducer_b33b6 (
	clk,
	rst_n,
	array_array_4e4b3_q,
	array_array_4e4b3_w,
	array_array_4e4b3_widx,
	array_array_4e4b3_d,
	array_array_4e498_q,
	array_array_4e498_w,
	array_array_4e498_widx,
	array_array_4e498_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [511:0] array_array_4e4b3_q;
	output wire [0:0] array_array_4e4b3_w;
	output wire [3:0] array_array_4e4b3_widx;
	output wire [31:0] array_array_4e4b3_d;
	input wire [31:0] array_array_4e498_q;
	output wire [0:0] array_array_4e498_w;
	output wire [0:0] array_array_4e498_widx;
	output wire [31:0] array_array_4e498_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [31:0] var_833;
	assign var_833 = array_array_4e498_q[31:0];
	wire [0:0] var_93;
	assign var_93 = var_833 < 32'd16;
	wire [3:0] var_102;
	assign var_102 = var_833[3:0];
	wire [3:0] var_106;
	assign var_106 = var_102;
	wire [31:0] var_108;
	assign var_108 = (15 == var_106 ? array_array_4e4b3_q[511:480] : (14 == var_106 ? array_array_4e4b3_q[479:448] : (13 == var_106 ? array_array_4e4b3_q[447:416] : (12 == var_106 ? array_array_4e4b3_q[415:384] : (11 == var_106 ? array_array_4e4b3_q[383:352] : (10 == var_106 ? array_array_4e4b3_q[351:320] : (9 == var_106 ? array_array_4e4b3_q[319:288] : (8 == var_106 ? array_array_4e4b3_q[287:256] : (7 == var_106 ? array_array_4e4b3_q[255:224] : (6 == var_106 ? array_array_4e4b3_q[223:192] : (5 == var_106 ? array_array_4e4b3_q[191:160] : (4 == var_106 ? array_array_4e4b3_q[159:128] : (3 == var_106 ? array_array_4e4b3_q[127:96] : (2 == var_106 ? array_array_4e4b3_q[95:64] : (1 == var_106 ? array_array_4e4b3_q[63:32] : (0 == var_106 ? array_array_4e4b3_q[31:0] : {32 {1'sbx}}))))))))))))))));
	wire [3:0] var_112;
	assign var_112 = var_106 - 4'd1;
	wire [31:0] var_115;
	assign var_115 = (15 == var_112 ? array_array_4e4b3_q[511:480] : (14 == var_112 ? array_array_4e4b3_q[479:448] : (13 == var_112 ? array_array_4e4b3_q[447:416] : (12 == var_112 ? array_array_4e4b3_q[415:384] : (11 == var_112 ? array_array_4e4b3_q[383:352] : (10 == var_112 ? array_array_4e4b3_q[351:320] : (9 == var_112 ? array_array_4e4b3_q[319:288] : (8 == var_112 ? array_array_4e4b3_q[287:256] : (7 == var_112 ? array_array_4e4b3_q[255:224] : (6 == var_112 ? array_array_4e4b3_q[223:192] : (5 == var_112 ? array_array_4e4b3_q[191:160] : (4 == var_112 ? array_array_4e4b3_q[159:128] : (3 == var_112 ? array_array_4e4b3_q[127:96] : (2 == var_112 ? array_array_4e4b3_q[95:64] : (1 == var_112 ? array_array_4e4b3_q[63:32] : (0 == var_112 ? array_array_4e4b3_q[31:0] : {32 {1'sbx}}))))))))))))))));
	wire [31:0] var_118;
	assign var_118 = var_108 + var_115;
	wire [31:0] var_128;
	assign var_128 = var_833 - 32'd1;
	wire [31:0] var_134;
	assign var_134 = var_833 - 32'd1;
	wire [31:0] var_137;
	assign var_137 = (15 == var_134 ? array_array_4e4b3_q[511:480] : (14 == var_134 ? array_array_4e4b3_q[479:448] : (13 == var_134 ? array_array_4e4b3_q[447:416] : (12 == var_134 ? array_array_4e4b3_q[415:384] : (11 == var_134 ? array_array_4e4b3_q[383:352] : (10 == var_134 ? array_array_4e4b3_q[351:320] : (9 == var_134 ? array_array_4e4b3_q[319:288] : (8 == var_134 ? array_array_4e4b3_q[287:256] : (7 == var_134 ? array_array_4e4b3_q[255:224] : (6 == var_134 ? array_array_4e4b3_q[223:192] : (5 == var_134 ? array_array_4e4b3_q[191:160] : (4 == var_134 ? array_array_4e4b3_q[159:128] : (3 == var_134 ? array_array_4e4b3_q[127:96] : (2 == var_134 ? array_array_4e4b3_q[95:64] : (1 == var_134 ? array_array_4e4b3_q[63:32] : (0 == var_134 ? array_array_4e4b3_q[31:0] : {32 {1'sbx}}))))))))))))))));
	always @(posedge clk)
		if (executed && var_93)
			$display("%t\t[radixreducer_b33b6]\t\tStage 2: radix_reg[%d]: %08x; cycle_index: %04x;cycle_reg[0]: %08x", $time, var_128, var_137, var_106, var_833);
	wire [31:0] var_153;
	assign var_153 = var_833 + 32'd1;
	assign array_array_4e498_w = executed && var_93;
	assign array_array_4e498_d = {32 {var_93}} & var_153;
	assign array_array_4e498_widx = {var_93} & 1'd0;
	assign array_array_4e4b3_w = executed && var_93;
	assign array_array_4e4b3_d = {32 {var_93}} & var_118;
	assign array_array_4e4b3_widx = {4 {var_93}} & var_106;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module driver (
	clk,
	rst_n,
	array_array_4e48f_q,
	array_array_4e48f_w,
	array_array_4e48f_widx,
	array_array_4e48f_d,
	radixreducer_b33b6_counter_delta,
	radixreducer_b33b6_counter_delta_ready,
	array_array_4e4ad_q,
	array_array_4e4ad_w,
	array_array_4e4ad_widx,
	array_array_4e4ad_d,
	array_array_4e498_q,
	array_array_4e498_w,
	array_array_4e498_widx,
	array_array_4e498_d,
	array_array_4e4a7_q,
	array_array_4e4a7_w,
	array_array_4e4a7_widx,
	array_array_4e4a7_d,
	array_array_7668a_q,
	array_array_4e4bf_q,
	array_array_4e4bf_w,
	array_array_4e4bf_widx,
	array_array_4e4bf_d,
	array_array_4e49e_q,
	array_array_4e49e_w,
	array_array_4e49e_widx,
	array_array_4e49e_d,
	array_array_4e4b9_q,
	array_array_4e4b9_w,
	array_array_4e4b9_widx,
	array_array_4e4b9_d,
	memuser_4e4c2_counter_delta,
	memuser_4e4c2_counter_delta_ready,
	expose_var_220,
	expose_var_220_valid,
	expose_var_435,
	expose_var_435_valid,
	expose_var_223,
	expose_var_223_valid,
	expose_var_198,
	expose_var_198_valid,
	expose_var_201,
	expose_var_201_valid,
	expose_var_195,
	expose_var_195_valid,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [1:0] array_array_4e48f_q;
	output wire [0:0] array_array_4e48f_w;
	output wire [0:0] array_array_4e48f_widx;
	output wire [1:0] array_array_4e48f_d;
	output wire [7:0] radixreducer_b33b6_counter_delta;
	input wire [0:0] radixreducer_b33b6_counter_delta_ready;
	input wire [0:0] array_array_4e4ad_q;
	output wire [0:0] array_array_4e4ad_w;
	output wire [0:0] array_array_4e4ad_widx;
	output wire [0:0] array_array_4e4ad_d;
	input wire [31:0] array_array_4e498_q;
	output wire [0:0] array_array_4e498_w;
	output wire [0:0] array_array_4e498_widx;
	output wire [31:0] array_array_4e498_d;
	input wire [0:0] array_array_4e4a7_q;
	output wire [0:0] array_array_4e4a7_w;
	output wire [0:0] array_array_4e4a7_widx;
	output wire [0:0] array_array_4e4a7_d;
	input wire [31:0] array_array_7668a_q;
	input wire [0:0] array_array_4e4bf_q;
	output wire [0:0] array_array_4e4bf_w;
	output wire [0:0] array_array_4e4bf_widx;
	output wire [0:0] array_array_4e4bf_d;
	input wire [12:0] array_array_4e49e_q;
	output wire [0:0] array_array_4e49e_w;
	output wire [0:0] array_array_4e49e_widx;
	output wire [12:0] array_array_4e49e_d;
	input wire [31:0] array_array_4e4b9_q;
	output wire [0:0] array_array_4e4b9_w;
	output wire [0:0] array_array_4e4b9_widx;
	output wire [31:0] array_array_4e4b9_d;
	output wire [7:0] memuser_4e4c2_counter_delta;
	input wire [0:0] memuser_4e4c2_counter_delta_ready;
	output wire [12:0] expose_var_220;
	output wire [0:0] expose_var_220_valid;
	output wire [12:0] expose_var_435;
	output wire [0:0] expose_var_435_valid;
	output wire [12:0] expose_var_223;
	output wire [0:0] expose_var_223_valid;
	output wire [0:0] expose_var_198;
	output wire [0:0] expose_var_198_valid;
	output wire [31:0] expose_var_201;
	output wire [0:0] expose_var_201_valid;
	output wire [0:0] expose_var_195;
	output wire [0:0] expose_var_195_valid;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [0:0] var_377;
	assign var_377 = array_array_4e4bf_q[0:0];
	wire [0:0] var_163;
	assign var_163 = var_377 == 1'd0;
	wire [12:0] var_435;
	assign var_435 = array_array_4e49e_q[12:0];
	assign expose_var_435 = var_435;
	assign expose_var_435_valid = executed && 1;
	wire [0:0] var_169;
	assign var_169 = var_435 < 13'd2048;
	wire [0:0] var_172;
	assign var_172 = var_163 & var_169;
	wire [0:0] var_179;
	assign var_179 = var_377 == 1'd1;
	wire [0:0] var_186;
	assign var_186 = var_435 < 13'd4096;
	wire [0:0] var_189;
	assign var_189 = var_179 & var_186;
	wire [0:0] var_192;
	assign var_192 = var_172 | var_189;
	wire [0:0] var_195;
	assign var_195 = array_array_4e4a7_q[0:0];
	assign expose_var_195 = var_195;
	assign expose_var_195_valid = executed && 1;
	wire [0:0] var_198;
	assign var_198 = array_array_4e4ad_q[0:0];
	assign expose_var_198 = var_198;
	assign expose_var_198_valid = executed && 1;
	wire [31:0] var_201;
	assign var_201 = array_array_7668a_q[31:0];
	assign expose_var_201 = var_201;
	assign expose_var_201_valid = executed && 1;
	wire [13:0] var_210;
	assign var_210 = var_377 * 13'd2048;
	wire [12:0] var_214;
	assign var_214 = var_210[12:0];
	wire [12:0] var_218;
	assign var_218 = var_214;
	wire [12:0] var_220;
	assign var_220 = 13'd0 + var_218;
	assign expose_var_220 = var_220;
	assign expose_var_220_valid = executed && 1;
	wire [12:0] var_223;
	assign var_223 = var_220 + 13'd2048;
	assign expose_var_223 = var_223;
	assign expose_var_223_valid = executed && 1;
	wire [31:0] var_150;
	assign var_150 = array_array_4e4b9_q[31:0];
	wire [0:0] var_230;
	assign var_230 = var_150 < 32'd32;
	wire [1:0] var_306;
	assign var_306 = array_array_4e48f_q[1:0];
	wire [0:0] var_239;
	assign var_239 = var_306 == 2'd0;
	wire [31:0] var_252;
	assign var_252 = var_150 + 32'd4;
	always @(posedge clk)
		if (executed && (var_230 && var_239))
			$display("%t\t[driver]\t\tRadix Sort: Bits %d - %d Completed!", $time, var_150, var_252);
	always @(posedge clk)
		if (executed && (var_230 && var_239))
			$display("%t\t[driver]\t\t========================================================================", $time);
	wire [31:0] var_266;
	assign var_266 = var_150 + 32'd4;
	wire [0:0] var_280;
	assign var_280 = ~var_377;
	wire [13:0] var_282;
	assign var_282 = var_280 * 13'd2048;
	wire [12:0] var_285;
	assign var_285 = var_282[12:0];
	wire [12:0] var_289;
	assign var_289 = var_285;
	wire [12:0] var_291;
	assign var_291 = 13'd0 + var_289;
	wire [0:0] var_309;
	assign var_309 = ~var_377;
	wire [0:0] var_318;
	assign var_318 = var_306 == 2'd1;
	wire [0:0] var_327;
	assign var_327 = var_435 < var_223;
	wire [12:0] var_340;
	assign var_340 = var_435 + 13'd1;
	wire [12:0] var_350;
	assign var_350 = var_223 - 13'd1;
	wire [0:0] var_353;
	assign var_353 = var_435 == var_350;
	wire [0:0] var_363;
	assign var_363 = ~var_192;
	wire [12:0] var_380;
	assign var_380 = var_435 - 13'd1;
	wire [0:0] var_390;
	assign var_390 = var_306 == 2'd2;
	wire [31:0] var_400;
	assign var_400 = array_array_4e498_q[31:0];
	wire [0:0] var_404;
	assign var_404 = var_400 == 32'd15;
	wire [0:0] var_425;
	assign var_425 = var_306 == 2'd3;
	wire [0:0] var_438;
	assign var_438 = var_150 == 32'd32;
	always @(posedge clk)
		if (executed && var_438)
			$display("%t\t[driver]\t\tfinish", $time);
	assign memuser_4e4c2_counter_delta = (executed ? {7'b0000000, |((var_230 && var_318) && var_327)} + {7'b0000000, |(var_230 && var_425)} : 0);
	assign radixreducer_b33b6_counter_delta = (executed ? {7'b0000000, |(var_230 && var_390)} : 0);
	assign array_array_4e49e_w = executed && (((var_230 && var_239) || ((var_230 && var_318) && var_327)) || ((var_230 && var_318) && var_363));
	assign array_array_4e49e_d = (({13 {var_230 && var_239}} & var_291) | ({13 {(var_230 && var_318) && var_327}} & var_340)) | ({13 {(var_230 && var_318) && var_363}} & var_380);
	assign array_array_4e49e_widx = (({var_230 && var_239} & 1'd0) | ({(var_230 && var_318) && var_327} & 1'd0)) | ({(var_230 && var_318) && var_363} & 1'd0);
	assign array_array_4e4b9_w = executed && (var_230 && var_239);
	assign array_array_4e4b9_d = {32 {var_230 && var_239}} & var_266;
	assign array_array_4e4b9_widx = {var_230 && var_239} & 1'd0;
	assign array_array_4e48f_w = executed && (((var_230 && var_239) || ((var_230 && var_318) && var_363)) || ((var_230 && var_390) && var_404));
	assign array_array_4e48f_d = (({2 {var_230 && var_239}} & 2'd1) | ({2 {(var_230 && var_318) && var_363}} & 2'd2)) | ({2 {(var_230 && var_390) && var_404}} & 2'd3);
	assign array_array_4e48f_widx = (({var_230 && var_239} & 1'd0) | ({(var_230 && var_318) && var_363} & 1'd0)) | ({(var_230 && var_390) && var_404} & 1'd0);
	assign array_array_4e4bf_w = executed && (var_230 && var_239);
	assign array_array_4e4bf_d = {var_230 && var_239} & var_309;
	assign array_array_4e4bf_widx = {var_230 && var_239} & 1'd0;
	assign array_array_4e4a7_w = executed && ((var_230 && var_239) || ((var_230 && var_390) && var_404));
	assign array_array_4e4a7_d = ({var_230 && var_239} & 1'd0) | ({(var_230 && var_390) && var_404} & 1'd0);
	assign array_array_4e4a7_widx = ({var_230 && var_239} & 1'd0) | ({(var_230 && var_390) && var_404} & 1'd0);
	assign array_array_4e498_w = executed && ((var_230 && var_318) && var_363);
	assign array_array_4e498_d = {32 {(var_230 && var_318) && var_363}} & 32'd1;
	assign array_array_4e498_widx = {(var_230 && var_318) && var_363} & 1'd0;
	assign array_array_4e4ad_w = executed && (((var_230 && var_239) || ((var_230 && var_318) && var_353)) || ((var_230 && var_390) && var_404));
	assign array_array_4e4ad_d = (({var_230 && var_239} & 1'd1) | ({(var_230 && var_318) && var_353} & 1'd0)) | ({(var_230 && var_390) && var_404} & 1'd1);
	assign array_array_4e4ad_widx = (({var_230 && var_239} & 1'd0) | ({(var_230 && var_318) && var_353} & 1'd0)) | ({(var_230 && var_390) && var_404} & 1'd0);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module MemImpl (
	clk,
	rst_n,
	array_array_4e4a7_w,
	array_array_4e4a7_widx,
	array_array_4e4a7_d,
	array_array_4e48f_q,
	array_array_4e48f_w,
	array_array_4e48f_widx,
	array_array_4e48f_d,
	array_array_5192e_q,
	array_array_5192e_w,
	array_array_5192e_widx,
	array_array_5192e_d,
	array_array_5193a_q,
	array_array_5193a_w,
	array_array_5193a_widx,
	array_array_5193a_d,
	array_array_4e4b9_q,
	array_array_5192b_q,
	array_array_5192b_w,
	array_array_5192b_widx,
	array_array_5192b_d,
	array_array_7668a_q,
	array_array_7668a_w,
	array_array_7668a_widx,
	array_array_7668a_d,
	array_array_51934_q,
	array_array_51934_w,
	array_array_51934_widx,
	array_array_51934_d,
	array_array_4e4b3_q,
	array_array_4e4b3_w,
	array_array_4e4b3_widx,
	array_array_4e4b3_d,
	array_array_4e4ad_w,
	array_array_4e4ad_widx,
	array_array_4e4ad_d,
	array_array_4e49e_q,
	array_array_4e49e_w,
	array_array_4e49e_widx,
	array_array_4e49e_d,
	array_array_51940_q,
	array_array_51940_w,
	array_array_51940_widx,
	array_array_51940_d,
	driver_executed,
	memuser_4e4c2_executed,
	var_223,
	var_223_valid,
	var_44,
	var_44_valid,
	var_220,
	var_220_valid,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] array_array_4e4a7_w;
	output wire [0:0] array_array_4e4a7_widx;
	output wire [0:0] array_array_4e4a7_d;
	input wire [1:0] array_array_4e48f_q;
	output wire [0:0] array_array_4e48f_w;
	output wire [0:0] array_array_4e48f_widx;
	output wire [1:0] array_array_4e48f_d;
	input wire [1:0] array_array_5192e_q;
	output wire [0:0] array_array_5192e_w;
	output wire [0:0] array_array_5192e_widx;
	output wire [1:0] array_array_5192e_d;
	input wire [0:0] array_array_5193a_q;
	output wire [0:0] array_array_5193a_w;
	output wire [0:0] array_array_5193a_widx;
	output wire [0:0] array_array_5193a_d;
	input wire [31:0] array_array_4e4b9_q;
	input wire [12:0] array_array_5192b_q;
	output wire [0:0] array_array_5192b_w;
	output wire [0:0] array_array_5192b_widx;
	output wire [12:0] array_array_5192b_d;
	input wire [31:0] array_array_7668a_q;
	output wire [0:0] array_array_7668a_w;
	output wire [0:0] array_array_7668a_widx;
	output wire [31:0] array_array_7668a_d;
	input wire [12:0] array_array_51934_q;
	output wire [0:0] array_array_51934_w;
	output wire [0:0] array_array_51934_widx;
	output wire [12:0] array_array_51934_d;
	input wire [511:0] array_array_4e4b3_q;
	output wire [0:0] array_array_4e4b3_w;
	output wire [3:0] array_array_4e4b3_widx;
	output wire [31:0] array_array_4e4b3_d;
	output wire [0:0] array_array_4e4ad_w;
	output wire [0:0] array_array_4e4ad_widx;
	output wire [0:0] array_array_4e4ad_d;
	input wire [12:0] array_array_4e49e_q;
	output wire [0:0] array_array_4e49e_w;
	output wire [0:0] array_array_4e49e_widx;
	output wire [12:0] array_array_4e49e_d;
	input wire [3:0] array_array_51940_q;
	output wire [0:0] array_array_51940_w;
	output wire [0:0] array_array_51940_widx;
	output wire [3:0] array_array_51940_d;
	input wire [0:0] driver_executed;
	input wire [0:0] memuser_4e4c2_executed;
	input wire [12:0] var_223;
	input wire [0:0] var_223_valid;
	input wire [31:0] var_44;
	input wire [0:0] var_44_valid;
	input wire [12:0] var_220;
	input wire [0:0] var_220_valid;
	output wire expose_executed;
	wire executed;
	wire [1:0] var_465;
	assign var_465 = array_array_4e48f_q[1:0];
	wire [0:0] var_468;
	assign var_468 = var_465 == 2'd3;
	wire [1:0] var_665;
	assign var_665 = array_array_5192e_q[1:0];
	wire [0:0] var_477;
	assign var_477 = var_665 == 2'd0;
	wire [12:0] var_735;
	assign var_735 = array_array_4e49e_q[12:0];
	always @(posedge clk)
		if (executed && (var_468 && var_477))
			$display("%t\t[MemImpl]\t\tStage 3-0: Initialization Cycle: Copy addr_reg[0]=%08x to read_addr_reg[0]; mem_start=%08x; mem_end=%08x.", $time, var_735, var_220, var_223);
	wire [12:0] var_503;
	assign var_503 = 13'd2048 - var_220;
	wire [0:0] var_513;
	assign var_513 = var_665 == 2'd1;
	wire [12:0] var_810;
	assign var_810 = var_220;
	wire [12:0] var_680;
	assign var_680 = array_array_5192b_q[12:0];
	always @(posedge clk)
		if (executed && (var_468 && var_513))
			$display("%t\t[MemImpl]\t\tStage 3-1: Reading from mem_addr (%d).", $time, var_735);
	wire [12:0] var_534;
	assign var_534 = array_array_51934_q[12:0];
	wire [0:0] var_546;
	assign var_546 = var_680 > var_810;
	wire [12:0] var_555;
	assign var_555 = var_680 - 13'd1;
	wire [0:0] var_569;
	assign var_569 = var_665 == 2'd2;
	wire [31:0] var_717;
	assign var_717 = array_array_7668a_q[31:0];
	always @(posedge clk)
		if (executed && (var_468 && var_569))
			$display("%t\t[MemImpl]\t\tStage 3-2: Writing wdata (%08x) to mem_addr (%d); wdata <= rdata (%08x).", $time, var_717, var_735, var_44);
	wire [31:0] var_587;
	assign var_587 = array_array_4e4b9_q[31:0];
	wire [31:0] var_590;
	assign var_590 = var_44 >> var_587;
	wire [3:0] var_593;
	assign var_593 = var_590[3:0];
	wire [31:0] var_597;
	assign var_597 = var_44;
	wire [31:0] var_422;
	assign var_422 = (15 == var_593 ? array_array_4e4b3_q[511:480] : (14 == var_593 ? array_array_4e4b3_q[479:448] : (13 == var_593 ? array_array_4e4b3_q[447:416] : (12 == var_593 ? array_array_4e4b3_q[415:384] : (11 == var_593 ? array_array_4e4b3_q[383:352] : (10 == var_593 ? array_array_4e4b3_q[351:320] : (9 == var_593 ? array_array_4e4b3_q[319:288] : (8 == var_593 ? array_array_4e4b3_q[287:256] : (7 == var_593 ? array_array_4e4b3_q[255:224] : (6 == var_593 ? array_array_4e4b3_q[223:192] : (5 == var_593 ? array_array_4e4b3_q[191:160] : (4 == var_593 ? array_array_4e4b3_q[159:128] : (3 == var_593 ? array_array_4e4b3_q[127:96] : (2 == var_593 ? array_array_4e4b3_q[95:64] : (1 == var_593 ? array_array_4e4b3_q[63:32] : (0 == var_593 ? array_array_4e4b3_q[31:0] : {32 {1'sbx}}))))))))))))))));
	wire [12:0] var_606;
	assign var_606 = var_422[12:0];
	wire [12:0] var_610;
	assign var_610 = var_606;
	wire [12:0] var_612;
	assign var_612 = var_610 - 13'd1;
	wire [12:0] var_615;
	assign var_615 = var_612 + 13'd2048;
	wire [12:0] var_620;
	assign var_620 = var_615 - var_810;
	wire [31:0] var_630;
	assign var_630 = var_422 - 32'd1;
	wire [0:0] var_642;
	assign var_642 = var_680 == var_810;
	wire [0:0] var_708;
	assign var_708 = array_array_5193a_q[0:0];
	wire [0:0] var_655;
	assign var_655 = var_708 == 1'd0;
	wire [0:0] var_683;
	assign var_683 = var_708 == 1'd1;
	wire [12:0] var_696;
	assign var_696 = var_422[12:0];
	wire [12:0] var_700;
	assign var_700 = var_696;
	wire [12:0] var_702;
	assign var_702 = var_700 - 13'd1;
	wire [12:0] var_705;
	assign var_705 = var_702 + 13'd2048;
	wire [12:0] var_710;
	assign var_710 = var_705 - var_810;
	wire [0:0] var_720;
	assign var_720 = var_665 == 2'd3;
	wire [3:0] var_693;
	assign var_693 = array_array_51940_q[3:0];
	wire [0:0] var_729;
	assign var_729 = var_693 == 4'd0;
	always @(posedge clk)
		if (executed && ((var_468 && var_720) && var_729))
			$display("%t\t[MemImpl]\t\tStage 3-3: Writing wdata (%08x) to mem_addr (%d);", $time, var_717, var_735);
	wire [0:0] var_758;
	assign var_758 = var_693 <= 4'd14;
	always @(posedge clk)
		if (executed && ((var_468 && var_720) && var_758))
			$display("%t\t[MemImpl]\t\tStage 3-3: Reset radix_reg[%d] to %08x.", $time, var_693, 0);
	wire [3:0] var_782;
	assign var_782 = var_693 + 4'd1;
	wire [0:0] var_793;
	assign var_793 = var_693 == 4'd15;
	always @(posedge clk)
		if (executed && ((var_468 && var_720) && var_793))
			$display("%t\t[MemImpl]\t\tStage 3-3: Reset radix_reg[%d] to %08x.", $time, var_693, 0);
	always @(posedge clk)
		if (executed && ((var_468 && var_720) && var_793))
			$display("%t\t[MemImpl]\t\tStage 3-3: Reset other registers: reset_cycle_reg[0]=0; SM_MemImpl[0]=0; SM_reg[0]=0; read_addr_reg[0]=0; write_addr_reg[0]=data_depth; stop_reg[0]=0;", $time);
	assign array_array_4e49e_w = executed && (((var_468 && var_513) || ((var_468 && var_569) && var_655)) || ((var_468 && var_569) && var_683));
	assign array_array_4e49e_d = (({13 {var_468 && var_513}} & var_534) | ({13 {(var_468 && var_569) && var_655}} & var_680)) | ({13 {(var_468 && var_569) && var_683}} & var_710);
	assign array_array_4e49e_widx = (({var_468 && var_513} & 1'd0) | ({(var_468 && var_569) && var_655} & 1'd0)) | ({(var_468 && var_569) && var_683} & 1'd0);
	assign array_array_4e4ad_w = executed && (((var_468 && var_513) || ((var_468 && var_569) && var_655)) || ((var_468 && var_720) && var_729));
	assign array_array_4e4ad_d = (({var_468 && var_513} & 1'd0) | ({(var_468 && var_569) && var_655} & 1'd1)) | ({(var_468 && var_720) && var_729} & 1'd0);
	assign array_array_4e4ad_widx = (({var_468 && var_513} & 1'd0) | ({(var_468 && var_569) && var_655} & 1'd0)) | ({(var_468 && var_720) && var_729} & 1'd0);
	assign array_array_51940_w = executed && (((var_468 && var_720) && var_758) || ((var_468 && var_720) && var_793));
	assign array_array_51940_d = ({4 {(var_468 && var_720) && var_758}} & var_782) | ({4 {(var_468 && var_720) && var_793}} & 4'd0);
	assign array_array_51940_widx = ({(var_468 && var_720) && var_758} & 1'd0) | ({(var_468 && var_720) && var_793} & 1'd0);
	assign array_array_5193a_w = executed && (((var_468 && var_569) && var_642) || ((var_468 && var_720) && var_793));
	assign array_array_5193a_d = ({(var_468 && var_569) && var_642} & 1'd1) | ({(var_468 && var_720) && var_793} & 1'd0);
	assign array_array_5193a_widx = ({(var_468 && var_569) && var_642} & 1'd0) | ({(var_468 && var_720) && var_793} & 1'd0);
	assign array_array_4e4b3_w = executed && (((var_468 && var_569) || ((var_468 && var_720) && var_758)) || ((var_468 && var_720) && var_793));
	assign array_array_4e4b3_d = (({32 {var_468 && var_569}} & var_630) | ({32 {(var_468 && var_720) && var_758}} & 32'd0)) | ({32 {(var_468 && var_720) && var_793}} & 32'd0);
	assign array_array_4e4b3_widx = (({4 {var_468 && var_569}} & var_593) | ({4 {(var_468 && var_720) && var_758}} & var_693)) | ({4 {(var_468 && var_720) && var_793}} & var_693);
	assign array_array_5192b_w = executed && ((var_468 && var_477) || ((var_468 && var_513) && var_546));
	assign array_array_5192b_d = ({13 {var_468 && var_477}} & var_735) | ({13 {(var_468 && var_513) && var_546}} & var_555);
	assign array_array_5192b_widx = ({var_468 && var_477} & 1'd0) | ({(var_468 && var_513) && var_546} & 1'd0);
	assign array_array_51934_w = executed && ((var_468 && var_477) || (var_468 && var_569));
	assign array_array_51934_d = ({13 {var_468 && var_477}} & var_503) | ({13 {var_468 && var_569}} & var_620);
	assign array_array_51934_widx = ({var_468 && var_477} & 1'd0) | ({var_468 && var_569} & 1'd0);
	assign array_array_5192e_w = executed && (((((var_468 && var_477) || (var_468 && var_513)) || ((var_468 && var_569) && var_655)) || ((var_468 && var_569) && var_683)) || ((var_468 && var_720) && var_793));
	assign array_array_5192e_d = (((({2 {var_468 && var_477}} & 2'd1) | ({2 {var_468 && var_513}} & 2'd2)) | ({2 {(var_468 && var_569) && var_655}} & 2'd1)) | ({2 {(var_468 && var_569) && var_683}} & 2'd3)) | ({2 {(var_468 && var_720) && var_793}} & 2'd0);
	assign array_array_5192e_widx = (((({var_468 && var_477} & 1'd0) | ({var_468 && var_513} & 1'd0)) | ({(var_468 && var_569) && var_655} & 1'd0)) | ({(var_468 && var_569) && var_683} & 1'd0)) | ({(var_468 && var_720) && var_793} & 1'd0);
	assign array_array_4e48f_w = executed && ((var_468 && var_720) && var_793);
	assign array_array_4e48f_d = {2 {(var_468 && var_720) && var_793}} & 2'd0;
	assign array_array_4e48f_widx = {(var_468 && var_720) && var_793} & 1'd0;
	assign array_array_4e4a7_w = executed && (((var_468 && var_513) || ((var_468 && var_569) && var_655)) || ((var_468 && var_720) && var_729));
	assign array_array_4e4a7_d = (({var_468 && var_513} & 1'd1) | ({(var_468 && var_569) && var_655} & 1'd0)) | ({(var_468 && var_720) && var_729} & 1'd0);
	assign array_array_4e4a7_widx = (({var_468 && var_513} & 1'd0) | ({(var_468 && var_569) && var_655} & 1'd0)) | ({(var_468 && var_720) && var_729} & 1'd0);
	assign array_array_7668a_w = executed && (var_468 && var_569);
	assign array_array_7668a_d = {32 {var_468 && var_569}} & var_597;
	assign array_array_7668a_widx = {var_468 && var_569} & 1'd0;
	assign executed = driver_executed || memuser_4e4c2_executed;
	assign expose_executed = executed;
endmodule
module top (
	array_array_4e4b3_exposed_o,
	clk,
	rst_n
);
	output wire [511:0] array_array_4e4b3_exposed_o;
	input wire clk;
	input wire rst_n;
	reg [12:0] array_array_4e49e_q;
	wire [12:0] array_array_4e49e_driver_MemImpl_d;
	wire [0:0] array_array_4e49e_driver_MemImpl_w;
	wire [0:0] array_array_4e49e_driver_MemImpl_widx;
	wire [12:0] array_array_4e49e_driver_driver_d;
	wire [0:0] array_array_4e49e_driver_driver_w;
	wire [0:0] array_array_4e49e_driver_driver_widx;
	wire [12:0] array_array_4e49e_d;
	wire [0:0] array_array_4e49e_widx;
	wire [0:0] array_array_4e49e_w;
	assign array_array_4e49e_d = ({13 {array_array_4e49e_driver_MemImpl_w}} & array_array_4e49e_driver_MemImpl_d) | ({13 {array_array_4e49e_driver_driver_w}} & array_array_4e49e_driver_driver_d);
	assign array_array_4e49e_widx = ({array_array_4e49e_driver_MemImpl_w} & array_array_4e49e_driver_MemImpl_widx) | ({array_array_4e49e_driver_driver_w} & array_array_4e49e_driver_driver_widx);
	assign array_array_4e49e_w = array_array_4e49e_driver_MemImpl_w | array_array_4e49e_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_4e49e_q[12:0] <= 13'd0;
		else if (array_array_4e49e_w)
			case (array_array_4e49e_widx)
				0: array_array_4e49e_q[12:0] <= array_array_4e49e_d;
				default:
					;
			endcase
	reg [3:0] array_array_51940_q;
	wire [3:0] array_array_51940_driver_MemImpl_d;
	wire [0:0] array_array_51940_driver_MemImpl_w;
	wire [0:0] array_array_51940_driver_MemImpl_widx;
	wire [3:0] array_array_51940_d;
	wire [0:0] array_array_51940_widx;
	wire [0:0] array_array_51940_w;
	assign array_array_51940_d = {4 {array_array_51940_driver_MemImpl_w}} & array_array_51940_driver_MemImpl_d;
	assign array_array_51940_widx = {array_array_51940_driver_MemImpl_w} & array_array_51940_driver_MemImpl_widx;
	assign array_array_51940_w = array_array_51940_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_51940_q[3:0] <= 4'd0;
		else if (array_array_51940_w)
			case (array_array_51940_widx)
				0: array_array_51940_q[3:0] <= array_array_51940_d;
				default:
					;
			endcase
	reg [31:0] array_array_4e498_q;
	wire [31:0] array_array_4e498_driver_radixreducer_b33b6_d;
	wire [0:0] array_array_4e498_driver_radixreducer_b33b6_w;
	wire [0:0] array_array_4e498_driver_radixreducer_b33b6_widx;
	wire [31:0] array_array_4e498_driver_driver_d;
	wire [0:0] array_array_4e498_driver_driver_w;
	wire [0:0] array_array_4e498_driver_driver_widx;
	wire [31:0] array_array_4e498_d;
	wire [0:0] array_array_4e498_widx;
	wire [0:0] array_array_4e498_w;
	assign array_array_4e498_d = ({32 {array_array_4e498_driver_radixreducer_b33b6_w}} & array_array_4e498_driver_radixreducer_b33b6_d) | ({32 {array_array_4e498_driver_driver_w}} & array_array_4e498_driver_driver_d);
	assign array_array_4e498_widx = ({array_array_4e498_driver_radixreducer_b33b6_w} & array_array_4e498_driver_radixreducer_b33b6_widx) | ({array_array_4e498_driver_driver_w} & array_array_4e498_driver_driver_widx);
	assign array_array_4e498_w = array_array_4e498_driver_radixreducer_b33b6_w | array_array_4e498_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_4e498_q[31:0] <= 32'd0;
		else if (array_array_4e498_w)
			case (array_array_4e498_widx)
				0: array_array_4e498_q[31:0] <= array_array_4e498_d;
				default:
					;
			endcase
	reg [0:0] array_array_4e4ad_q;
	wire [0:0] array_array_4e4ad_driver_MemImpl_d;
	wire [0:0] array_array_4e4ad_driver_MemImpl_w;
	wire [0:0] array_array_4e4ad_driver_MemImpl_widx;
	wire [0:0] array_array_4e4ad_driver_driver_d;
	wire [0:0] array_array_4e4ad_driver_driver_w;
	wire [0:0] array_array_4e4ad_driver_driver_widx;
	wire [0:0] array_array_4e4ad_d;
	wire [0:0] array_array_4e4ad_widx;
	wire [0:0] array_array_4e4ad_w;
	assign array_array_4e4ad_d = ({array_array_4e4ad_driver_MemImpl_w} & array_array_4e4ad_driver_MemImpl_d) | ({array_array_4e4ad_driver_driver_w} & array_array_4e4ad_driver_driver_d);
	assign array_array_4e4ad_widx = ({array_array_4e4ad_driver_MemImpl_w} & array_array_4e4ad_driver_MemImpl_widx) | ({array_array_4e4ad_driver_driver_w} & array_array_4e4ad_driver_driver_widx);
	assign array_array_4e4ad_w = array_array_4e4ad_driver_MemImpl_w | array_array_4e4ad_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_4e4ad_q[0:0] <= 1'd1;
		else if (array_array_4e4ad_w)
			case (array_array_4e4ad_widx)
				0: array_array_4e4ad_q[0:0] <= array_array_4e4ad_d;
				default:
					;
			endcase
	reg [12:0] array_array_51934_q;
	wire [12:0] array_array_51934_driver_MemImpl_d;
	wire [0:0] array_array_51934_driver_MemImpl_w;
	wire [0:0] array_array_51934_driver_MemImpl_widx;
	wire [12:0] array_array_51934_d;
	wire [0:0] array_array_51934_widx;
	wire [0:0] array_array_51934_w;
	assign array_array_51934_d = {13 {array_array_51934_driver_MemImpl_w}} & array_array_51934_driver_MemImpl_d;
	assign array_array_51934_widx = {array_array_51934_driver_MemImpl_w} & array_array_51934_driver_MemImpl_widx;
	assign array_array_51934_w = array_array_51934_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_51934_q[12:0] <= 13'd2048;
		else if (array_array_51934_w)
			case (array_array_51934_widx)
				0: array_array_51934_q[12:0] <= array_array_51934_d;
				default:
					;
			endcase
	reg [0:0] array_array_4e4a7_q;
	wire [0:0] array_array_4e4a7_driver_driver_d;
	wire [0:0] array_array_4e4a7_driver_driver_w;
	wire [0:0] array_array_4e4a7_driver_driver_widx;
	wire [0:0] array_array_4e4a7_driver_MemImpl_d;
	wire [0:0] array_array_4e4a7_driver_MemImpl_w;
	wire [0:0] array_array_4e4a7_driver_MemImpl_widx;
	wire [0:0] array_array_4e4a7_d;
	wire [0:0] array_array_4e4a7_widx;
	wire [0:0] array_array_4e4a7_w;
	assign array_array_4e4a7_d = ({array_array_4e4a7_driver_driver_w} & array_array_4e4a7_driver_driver_d) | ({array_array_4e4a7_driver_MemImpl_w} & array_array_4e4a7_driver_MemImpl_d);
	assign array_array_4e4a7_widx = ({array_array_4e4a7_driver_driver_w} & array_array_4e4a7_driver_driver_widx) | ({array_array_4e4a7_driver_MemImpl_w} & array_array_4e4a7_driver_MemImpl_widx);
	assign array_array_4e4a7_w = array_array_4e4a7_driver_driver_w | array_array_4e4a7_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_4e4a7_q[0:0] <= 1'd0;
		else if (array_array_4e4a7_w)
			case (array_array_4e4a7_widx)
				0: array_array_4e4a7_q[0:0] <= array_array_4e4a7_d;
				default:
					;
			endcase
	reg [511:0] array_array_4e4b3_q;
	wire [31:0] array_array_4e4b3_driver_radixreducer_b33b6_d;
	wire [0:0] array_array_4e4b3_driver_radixreducer_b33b6_w;
	wire [3:0] array_array_4e4b3_driver_radixreducer_b33b6_widx;
	wire [31:0] array_array_4e4b3_driver_memuser_4e4c2_d;
	wire [0:0] array_array_4e4b3_driver_memuser_4e4c2_w;
	wire [3:0] array_array_4e4b3_driver_memuser_4e4c2_widx;
	wire [31:0] array_array_4e4b3_driver_MemImpl_d;
	wire [0:0] array_array_4e4b3_driver_MemImpl_w;
	wire [3:0] array_array_4e4b3_driver_MemImpl_widx;
	assign array_array_4e4b3_exposed_o = array_array_4e4b3_q;
	wire [31:0] array_array_4e4b3_d;
	wire [3:0] array_array_4e4b3_widx;
	wire [0:0] array_array_4e4b3_w;
	assign array_array_4e4b3_d = (({32 {array_array_4e4b3_driver_radixreducer_b33b6_w}} & array_array_4e4b3_driver_radixreducer_b33b6_d) | ({32 {array_array_4e4b3_driver_memuser_4e4c2_w}} & array_array_4e4b3_driver_memuser_4e4c2_d)) | ({32 {array_array_4e4b3_driver_MemImpl_w}} & array_array_4e4b3_driver_MemImpl_d);
	assign array_array_4e4b3_widx = (({4 {array_array_4e4b3_driver_radixreducer_b33b6_w}} & array_array_4e4b3_driver_radixreducer_b33b6_widx) | ({4 {array_array_4e4b3_driver_memuser_4e4c2_w}} & array_array_4e4b3_driver_memuser_4e4c2_widx)) | ({4 {array_array_4e4b3_driver_MemImpl_w}} & array_array_4e4b3_driver_MemImpl_widx);
	assign array_array_4e4b3_w = (array_array_4e4b3_driver_radixreducer_b33b6_w | array_array_4e4b3_driver_memuser_4e4c2_w) | array_array_4e4b3_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			array_array_4e4b3_q[31:0] <= 32'd0;
			array_array_4e4b3_q[63:32] <= 32'd0;
			array_array_4e4b3_q[95:64] <= 32'd0;
			array_array_4e4b3_q[127:96] <= 32'd0;
			array_array_4e4b3_q[159:128] <= 32'd0;
			array_array_4e4b3_q[191:160] <= 32'd0;
			array_array_4e4b3_q[223:192] <= 32'd0;
			array_array_4e4b3_q[255:224] <= 32'd0;
			array_array_4e4b3_q[287:256] <= 32'd0;
			array_array_4e4b3_q[319:288] <= 32'd0;
			array_array_4e4b3_q[351:320] <= 32'd0;
			array_array_4e4b3_q[383:352] <= 32'd0;
			array_array_4e4b3_q[415:384] <= 32'd0;
			array_array_4e4b3_q[447:416] <= 32'd0;
			array_array_4e4b3_q[479:448] <= 32'd0;
			array_array_4e4b3_q[511:480] <= 32'd0;
		end
		else if (array_array_4e4b3_w)
			case (array_array_4e4b3_widx)
				0: array_array_4e4b3_q[31:0] <= array_array_4e4b3_d;
				1: array_array_4e4b3_q[63:32] <= array_array_4e4b3_d;
				2: array_array_4e4b3_q[95:64] <= array_array_4e4b3_d;
				3: array_array_4e4b3_q[127:96] <= array_array_4e4b3_d;
				4: array_array_4e4b3_q[159:128] <= array_array_4e4b3_d;
				5: array_array_4e4b3_q[191:160] <= array_array_4e4b3_d;
				6: array_array_4e4b3_q[223:192] <= array_array_4e4b3_d;
				7: array_array_4e4b3_q[255:224] <= array_array_4e4b3_d;
				8: array_array_4e4b3_q[287:256] <= array_array_4e4b3_d;
				9: array_array_4e4b3_q[319:288] <= array_array_4e4b3_d;
				10: array_array_4e4b3_q[351:320] <= array_array_4e4b3_d;
				11: array_array_4e4b3_q[383:352] <= array_array_4e4b3_d;
				12: array_array_4e4b3_q[415:384] <= array_array_4e4b3_d;
				13: array_array_4e4b3_q[447:416] <= array_array_4e4b3_d;
				14: array_array_4e4b3_q[479:448] <= array_array_4e4b3_d;
				15: array_array_4e4b3_q[511:480] <= array_array_4e4b3_d;
				default:
					;
			endcase
	wire [31:0] array_array_4e654_q;
	wire [31:0] array_array_4e654_driver_numbers_mem_d;
	wire [0:0] array_array_4e654_driver_numbers_mem_w;
	wire [12:0] array_array_4e654_driver_numbers_mem_widx;
	reg [0:0] array_array_4e4bf_q;
	wire [0:0] array_array_4e4bf_driver_driver_d;
	wire [0:0] array_array_4e4bf_driver_driver_w;
	wire [0:0] array_array_4e4bf_driver_driver_widx;
	wire [0:0] array_array_4e4bf_d;
	wire [0:0] array_array_4e4bf_widx;
	wire [0:0] array_array_4e4bf_w;
	assign array_array_4e4bf_d = {array_array_4e4bf_driver_driver_w} & array_array_4e4bf_driver_driver_d;
	assign array_array_4e4bf_widx = {array_array_4e4bf_driver_driver_w} & array_array_4e4bf_driver_driver_widx;
	assign array_array_4e4bf_w = array_array_4e4bf_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_4e4bf_q[0:0] <= 1'd0;
		else if (array_array_4e4bf_w)
			case (array_array_4e4bf_widx)
				0: array_array_4e4bf_q[0:0] <= array_array_4e4bf_d;
				default:
					;
			endcase
	reg [1:0] array_array_4e48f_q;
	wire [1:0] array_array_4e48f_driver_MemImpl_d;
	wire [0:0] array_array_4e48f_driver_MemImpl_w;
	wire [0:0] array_array_4e48f_driver_MemImpl_widx;
	wire [1:0] array_array_4e48f_driver_driver_d;
	wire [0:0] array_array_4e48f_driver_driver_w;
	wire [0:0] array_array_4e48f_driver_driver_widx;
	wire [1:0] array_array_4e48f_d;
	wire [0:0] array_array_4e48f_widx;
	wire [0:0] array_array_4e48f_w;
	assign array_array_4e48f_d = ({2 {array_array_4e48f_driver_MemImpl_w}} & array_array_4e48f_driver_MemImpl_d) | ({2 {array_array_4e48f_driver_driver_w}} & array_array_4e48f_driver_driver_d);
	assign array_array_4e48f_widx = ({array_array_4e48f_driver_MemImpl_w} & array_array_4e48f_driver_MemImpl_widx) | ({array_array_4e48f_driver_driver_w} & array_array_4e48f_driver_driver_widx);
	assign array_array_4e48f_w = array_array_4e48f_driver_MemImpl_w | array_array_4e48f_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_4e48f_q[1:0] <= 2'd1;
		else if (array_array_4e48f_w)
			case (array_array_4e48f_widx)
				0: array_array_4e48f_q[1:0] <= array_array_4e48f_d;
				default:
					;
			endcase
	reg [31:0] array_array_4e4b9_q;
	wire [31:0] array_array_4e4b9_driver_driver_d;
	wire [0:0] array_array_4e4b9_driver_driver_w;
	wire [0:0] array_array_4e4b9_driver_driver_widx;
	wire [31:0] array_array_4e4b9_d;
	wire [0:0] array_array_4e4b9_widx;
	wire [0:0] array_array_4e4b9_w;
	assign array_array_4e4b9_d = {32 {array_array_4e4b9_driver_driver_w}} & array_array_4e4b9_driver_driver_d;
	assign array_array_4e4b9_widx = {array_array_4e4b9_driver_driver_w} & array_array_4e4b9_driver_driver_widx;
	assign array_array_4e4b9_w = array_array_4e4b9_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_4e4b9_q[31:0] <= 32'd0;
		else if (array_array_4e4b9_w)
			case (array_array_4e4b9_widx)
				0: array_array_4e4b9_q[31:0] <= array_array_4e4b9_d;
				default:
					;
			endcase
	reg [12:0] array_array_5192b_q;
	wire [12:0] array_array_5192b_driver_MemImpl_d;
	wire [0:0] array_array_5192b_driver_MemImpl_w;
	wire [0:0] array_array_5192b_driver_MemImpl_widx;
	wire [12:0] array_array_5192b_d;
	wire [0:0] array_array_5192b_widx;
	wire [0:0] array_array_5192b_w;
	assign array_array_5192b_d = {13 {array_array_5192b_driver_MemImpl_w}} & array_array_5192b_driver_MemImpl_d;
	assign array_array_5192b_widx = {array_array_5192b_driver_MemImpl_w} & array_array_5192b_driver_MemImpl_widx;
	assign array_array_5192b_w = array_array_5192b_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_5192b_q[12:0] <= 13'd0;
		else if (array_array_5192b_w)
			case (array_array_5192b_widx)
				0: array_array_5192b_q[12:0] <= array_array_5192b_d;
				default:
					;
			endcase
	reg [0:0] array_array_5193a_q;
	wire [0:0] array_array_5193a_driver_MemImpl_d;
	wire [0:0] array_array_5193a_driver_MemImpl_w;
	wire [0:0] array_array_5193a_driver_MemImpl_widx;
	wire [0:0] array_array_5193a_d;
	wire [0:0] array_array_5193a_widx;
	wire [0:0] array_array_5193a_w;
	assign array_array_5193a_d = {array_array_5193a_driver_MemImpl_w} & array_array_5193a_driver_MemImpl_d;
	assign array_array_5193a_widx = {array_array_5193a_driver_MemImpl_w} & array_array_5193a_driver_MemImpl_widx;
	assign array_array_5193a_w = array_array_5193a_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_5193a_q[0:0] <= 1'd0;
		else if (array_array_5193a_w)
			case (array_array_5193a_widx)
				0: array_array_5193a_q[0:0] <= array_array_5193a_d;
				default:
					;
			endcase
	reg [1:0] array_array_5192e_q;
	wire [1:0] array_array_5192e_driver_MemImpl_d;
	wire [0:0] array_array_5192e_driver_MemImpl_w;
	wire [0:0] array_array_5192e_driver_MemImpl_widx;
	wire [1:0] array_array_5192e_d;
	wire [0:0] array_array_5192e_widx;
	wire [0:0] array_array_5192e_w;
	assign array_array_5192e_d = {2 {array_array_5192e_driver_MemImpl_w}} & array_array_5192e_driver_MemImpl_d;
	assign array_array_5192e_widx = {array_array_5192e_driver_MemImpl_w} & array_array_5192e_driver_MemImpl_widx;
	assign array_array_5192e_w = array_array_5192e_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_5192e_q[1:0] <= 2'd0;
		else if (array_array_5192e_w)
			case (array_array_5192e_widx)
				0: array_array_5192e_q[1:0] <= array_array_5192e_d;
				default:
					;
			endcase
	reg [31:0] array_array_7668a_q;
	wire [31:0] array_array_7668a_driver_MemImpl_d;
	wire [0:0] array_array_7668a_driver_MemImpl_w;
	wire [0:0] array_array_7668a_driver_MemImpl_widx;
	wire [31:0] array_array_7668a_d;
	wire [0:0] array_array_7668a_widx;
	wire [0:0] array_array_7668a_w;
	assign array_array_7668a_d = {32 {array_array_7668a_driver_MemImpl_w}} & array_array_7668a_driver_MemImpl_d;
	assign array_array_7668a_widx = {array_array_7668a_driver_MemImpl_w} & array_array_7668a_driver_MemImpl_widx;
	assign array_array_7668a_w = array_array_7668a_driver_MemImpl_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_7668a_q[31:0] <= 32'd0;
		else if (array_array_7668a_w)
			case (array_array_7668a_widx)
				0: array_array_7668a_q[31:0] <= array_array_7668a_d;
				default:
					;
			endcase
	wire [31:0] fifo_memuser_4e4c2_rdata_pop_data;
	wire [0:0] fifo_memuser_4e4c2_rdata_pop_valid;
	wire [0:0] fifo_memuser_4e4c2_rdata_pop_ready;
	wire [31:0] fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_data;
	wire [0:0] fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_valid;
	wire [0:0] fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_ready;
	wire fifo_memuser_4e4c2_rdata_push_ready;
	assign fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_ready = fifo_memuser_4e4c2_rdata_push_ready;
	wire [0:0] fifo_memuser_4e4c2_rdata_push_valid;
	assign fifo_memuser_4e4c2_rdata_push_valid = fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_valid;
	wire [31:0] fifo_memuser_4e4c2_rdata_push_data;
	assign fifo_memuser_4e4c2_rdata_push_data = {32 {fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_valid}} & fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(0)
	) fifo_memuser_4e4c2_rdata_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_memuser_4e4c2_rdata_push_valid),
		.push_data(fifo_memuser_4e4c2_rdata_push_data),
		.push_ready(fifo_memuser_4e4c2_rdata_push_ready),
		.pop_valid(fifo_memuser_4e4c2_rdata_pop_valid),
		.pop_data(fifo_memuser_4e4c2_rdata_pop_data),
		.pop_ready(fifo_memuser_4e4c2_rdata_pop_ready)
	);
	wire [7:0] memuser_4e4c2_driver_driver_counter_delta;
	wire [0:0] memuser_4e4c2_driver_driver_counter_delta_ready;
	wire [0:0] memuser_4e4c2_counter_delta_ready;
	wire [7:0] memuser_4e4c2_counter_delta;
	assign memuser_4e4c2_counter_delta = memuser_4e4c2_driver_driver_counter_delta;
	wire [0:0] memuser_4e4c2_counter_pop_ready;
	assign memuser_4e4c2_driver_driver_counter_delta_ready = memuser_4e4c2_counter_pop_ready;
	wire [0:0] memuser_4e4c2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) memuser_4e4c2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(memuser_4e4c2_counter_delta),
		.delta_ready(memuser_4e4c2_counter_delta_ready),
		.pop_valid(memuser_4e4c2_counter_pop_valid),
		.pop_ready(memuser_4e4c2_counter_pop_ready)
	);
	wire [7:0] radixreducer_b33b6_driver_driver_counter_delta;
	wire [0:0] radixreducer_b33b6_driver_driver_counter_delta_ready;
	wire [0:0] radixreducer_b33b6_counter_delta_ready;
	wire [7:0] radixreducer_b33b6_counter_delta;
	assign radixreducer_b33b6_counter_delta = radixreducer_b33b6_driver_driver_counter_delta;
	wire [0:0] radixreducer_b33b6_counter_pop_ready;
	assign radixreducer_b33b6_driver_driver_counter_delta_ready = radixreducer_b33b6_counter_pop_ready;
	wire [0:0] radixreducer_b33b6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) radixreducer_b33b6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(radixreducer_b33b6_counter_delta),
		.delta_ready(radixreducer_b33b6_counter_delta_ready),
		.pop_valid(radixreducer_b33b6_counter_pop_valid),
		.pop_ready(radixreducer_b33b6_counter_pop_ready)
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
	assign driver_counter_delta = 8'b00000001;
	wire [31:0] logic_var_44;
	wire [0:0] logic_var_44_valid;
	wire [0:0] memuser_4e4c2_executed;
	memuser_4e4c2 memuser_4e4c2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_rdata_pop_ready(fifo_memuser_4e4c2_rdata_pop_ready),
		.fifo_rdata_pop_data(fifo_memuser_4e4c2_rdata_pop_data),
		.fifo_rdata_pop_valid(fifo_memuser_4e4c2_rdata_pop_valid),
		.array_array_4e48f_q(array_array_4e48f_q),
		.array_array_4e4b3_q(array_array_4e4b3_q),
		.array_array_4e4b3_w(array_array_4e4b3_driver_memuser_4e4c2_w),
		.array_array_4e4b3_widx(array_array_4e4b3_driver_memuser_4e4c2_widx),
		.array_array_4e4b3_d(array_array_4e4b3_driver_memuser_4e4c2_d),
		.array_array_4e4b9_q(array_array_4e4b9_q),
		.array_array_4e49e_q(array_array_4e49e_q),
		.expose_var_44(logic_var_44),
		.expose_var_44_valid(logic_var_44_valid),
		.counter_delta_ready(memuser_4e4c2_counter_delta_ready),
		.counter_pop_ready(memuser_4e4c2_counter_pop_ready),
		.counter_pop_valid(memuser_4e4c2_counter_pop_valid),
		.expose_executed(memuser_4e4c2_executed)
	);
	wire [0:0] radixreducer_b33b6_executed;
	radixreducer_b33b6 radixreducer_b33b6_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_4e4b3_q(array_array_4e4b3_q),
		.array_array_4e4b3_w(array_array_4e4b3_driver_radixreducer_b33b6_w),
		.array_array_4e4b3_widx(array_array_4e4b3_driver_radixreducer_b33b6_widx),
		.array_array_4e4b3_d(array_array_4e4b3_driver_radixreducer_b33b6_d),
		.array_array_4e498_q(array_array_4e498_q),
		.array_array_4e498_w(array_array_4e498_driver_radixreducer_b33b6_w),
		.array_array_4e498_widx(array_array_4e498_driver_radixreducer_b33b6_widx),
		.array_array_4e498_d(array_array_4e498_driver_radixreducer_b33b6_d),
		.counter_delta_ready(radixreducer_b33b6_counter_delta_ready),
		.counter_pop_ready(radixreducer_b33b6_counter_pop_ready),
		.counter_pop_valid(radixreducer_b33b6_counter_pop_valid),
		.expose_executed(radixreducer_b33b6_executed)
	);
	wire [12:0] logic_var_220;
	wire [0:0] logic_var_220_valid;
	wire [12:0] logic_var_435;
	wire [0:0] logic_var_435_valid;
	wire [12:0] logic_var_223;
	wire [0:0] logic_var_223_valid;
	wire [0:0] logic_var_198;
	wire [0:0] logic_var_198_valid;
	wire [31:0] logic_var_201;
	wire [0:0] logic_var_201_valid;
	wire [0:0] logic_var_195;
	wire [0:0] logic_var_195_valid;
	wire [0:0] driver_executed;
	driver driver_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_4e48f_q(array_array_4e48f_q),
		.array_array_4e48f_w(array_array_4e48f_driver_driver_w),
		.array_array_4e48f_widx(array_array_4e48f_driver_driver_widx),
		.array_array_4e48f_d(array_array_4e48f_driver_driver_d),
		.radixreducer_b33b6_counter_delta_ready(radixreducer_b33b6_driver_driver_counter_delta_ready),
		.radixreducer_b33b6_counter_delta(radixreducer_b33b6_driver_driver_counter_delta),
		.array_array_4e4ad_q(array_array_4e4ad_q),
		.array_array_4e4ad_w(array_array_4e4ad_driver_driver_w),
		.array_array_4e4ad_widx(array_array_4e4ad_driver_driver_widx),
		.array_array_4e4ad_d(array_array_4e4ad_driver_driver_d),
		.array_array_4e498_q(array_array_4e498_q),
		.array_array_4e498_w(array_array_4e498_driver_driver_w),
		.array_array_4e498_widx(array_array_4e498_driver_driver_widx),
		.array_array_4e498_d(array_array_4e498_driver_driver_d),
		.array_array_4e4a7_q(array_array_4e4a7_q),
		.array_array_4e4a7_w(array_array_4e4a7_driver_driver_w),
		.array_array_4e4a7_widx(array_array_4e4a7_driver_driver_widx),
		.array_array_4e4a7_d(array_array_4e4a7_driver_driver_d),
		.array_array_7668a_q(array_array_7668a_q),
		.array_array_4e4bf_q(array_array_4e4bf_q),
		.array_array_4e4bf_w(array_array_4e4bf_driver_driver_w),
		.array_array_4e4bf_widx(array_array_4e4bf_driver_driver_widx),
		.array_array_4e4bf_d(array_array_4e4bf_driver_driver_d),
		.array_array_4e49e_q(array_array_4e49e_q),
		.array_array_4e49e_w(array_array_4e49e_driver_driver_w),
		.array_array_4e49e_widx(array_array_4e49e_driver_driver_widx),
		.array_array_4e49e_d(array_array_4e49e_driver_driver_d),
		.array_array_4e4b9_q(array_array_4e4b9_q),
		.array_array_4e4b9_w(array_array_4e4b9_driver_driver_w),
		.array_array_4e4b9_widx(array_array_4e4b9_driver_driver_widx),
		.array_array_4e4b9_d(array_array_4e4b9_driver_driver_d),
		.memuser_4e4c2_counter_delta_ready(memuser_4e4c2_driver_driver_counter_delta_ready),
		.memuser_4e4c2_counter_delta(memuser_4e4c2_driver_driver_counter_delta),
		.expose_var_220(logic_var_220),
		.expose_var_220_valid(logic_var_220_valid),
		.expose_var_435(logic_var_435),
		.expose_var_435_valid(logic_var_435_valid),
		.expose_var_223(logic_var_223),
		.expose_var_223_valid(logic_var_223_valid),
		.expose_var_198(logic_var_198),
		.expose_var_198_valid(logic_var_198_valid),
		.expose_var_201(logic_var_201),
		.expose_var_201_valid(logic_var_201_valid),
		.expose_var_195(logic_var_195),
		.expose_var_195_valid(logic_var_195_valid),
		.counter_delta_ready(driver_counter_delta_ready),
		.counter_pop_ready(driver_counter_pop_ready),
		.counter_pop_valid(driver_counter_pop_valid),
		.expose_executed(driver_executed)
	);
	wire [0:0] numbers_mem_executed;
	numbers_mem numbers_mem_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_memuser_4e4c2_rdata_push_valid(fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_valid),
		.fifo_memuser_4e4c2_rdata_push_data(fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_data),
		.fifo_memuser_4e4c2_rdata_push_ready(fifo_memuser_4e4c2_rdata_driver_numbers_mem_push_ready),
		.driver_executed(driver_executed),
		.var_201(logic_var_201),
		.var_201_valid(logic_var_201_valid),
		.var_435(logic_var_435),
		.var_435_valid(logic_var_435_valid),
		.var_195(logic_var_195),
		.var_195_valid(logic_var_195_valid),
		.var_198(logic_var_198),
		.var_198_valid(logic_var_198_valid),
		.expose_executed(numbers_mem_executed)
	);
	wire [0:0] MemImpl_executed;
	MemImpl MemImpl_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_4e4a7_w(array_array_4e4a7_driver_MemImpl_w),
		.array_array_4e4a7_widx(array_array_4e4a7_driver_MemImpl_widx),
		.array_array_4e4a7_d(array_array_4e4a7_driver_MemImpl_d),
		.array_array_4e48f_q(array_array_4e48f_q),
		.array_array_4e48f_w(array_array_4e48f_driver_MemImpl_w),
		.array_array_4e48f_widx(array_array_4e48f_driver_MemImpl_widx),
		.array_array_4e48f_d(array_array_4e48f_driver_MemImpl_d),
		.array_array_5192e_q(array_array_5192e_q),
		.array_array_5192e_w(array_array_5192e_driver_MemImpl_w),
		.array_array_5192e_widx(array_array_5192e_driver_MemImpl_widx),
		.array_array_5192e_d(array_array_5192e_driver_MemImpl_d),
		.array_array_5193a_q(array_array_5193a_q),
		.array_array_5193a_w(array_array_5193a_driver_MemImpl_w),
		.array_array_5193a_widx(array_array_5193a_driver_MemImpl_widx),
		.array_array_5193a_d(array_array_5193a_driver_MemImpl_d),
		.array_array_4e4b9_q(array_array_4e4b9_q),
		.array_array_5192b_q(array_array_5192b_q),
		.array_array_5192b_w(array_array_5192b_driver_MemImpl_w),
		.array_array_5192b_widx(array_array_5192b_driver_MemImpl_widx),
		.array_array_5192b_d(array_array_5192b_driver_MemImpl_d),
		.array_array_7668a_q(array_array_7668a_q),
		.array_array_7668a_w(array_array_7668a_driver_MemImpl_w),
		.array_array_7668a_widx(array_array_7668a_driver_MemImpl_widx),
		.array_array_7668a_d(array_array_7668a_driver_MemImpl_d),
		.array_array_51934_q(array_array_51934_q),
		.array_array_51934_w(array_array_51934_driver_MemImpl_w),
		.array_array_51934_widx(array_array_51934_driver_MemImpl_widx),
		.array_array_51934_d(array_array_51934_driver_MemImpl_d),
		.array_array_4e4b3_q(array_array_4e4b3_q),
		.array_array_4e4b3_w(array_array_4e4b3_driver_MemImpl_w),
		.array_array_4e4b3_widx(array_array_4e4b3_driver_MemImpl_widx),
		.array_array_4e4b3_d(array_array_4e4b3_driver_MemImpl_d),
		.array_array_4e4ad_w(array_array_4e4ad_driver_MemImpl_w),
		.array_array_4e4ad_widx(array_array_4e4ad_driver_MemImpl_widx),
		.array_array_4e4ad_d(array_array_4e4ad_driver_MemImpl_d),
		.array_array_4e49e_q(array_array_4e49e_q),
		.array_array_4e49e_w(array_array_4e49e_driver_MemImpl_w),
		.array_array_4e49e_widx(array_array_4e49e_driver_MemImpl_widx),
		.array_array_4e49e_d(array_array_4e49e_driver_MemImpl_d),
		.array_array_51940_q(array_array_51940_q),
		.array_array_51940_w(array_array_51940_driver_MemImpl_w),
		.array_array_51940_widx(array_array_51940_driver_MemImpl_widx),
		.array_array_51940_d(array_array_51940_driver_MemImpl_d),
		.memuser_4e4c2_executed(memuser_4e4c2_executed),
		.driver_executed(driver_executed),
		.var_223(logic_var_223),
		.var_223_valid(logic_var_223_valid),
		.var_44(logic_var_44),
		.var_44_valid(logic_var_44_valid),
		.var_220(logic_var_220),
		.var_220_valid(logic_var_220_valid),
		.expose_executed(MemImpl_executed)
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
	wire [511:0] array_array_4e4b3_exposed_o;
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
		.array_array_4e4b3_exposed_o(array_array_4e4b3_exposed_o)
	);
endmodule