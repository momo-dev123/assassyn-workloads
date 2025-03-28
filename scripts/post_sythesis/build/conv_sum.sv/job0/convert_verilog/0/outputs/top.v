module memuser_6e251 (
	clk,
	rst_n,
	fifo_count_pop_valid,
	fifo_count_pop_data,
	fifo_count_pop_ready,
	fifo_is_finish_pop_valid,
	fifo_is_finish_pop_data,
	fifo_is_finish_pop_ready,
	fifo_rdata_pop_valid,
	fifo_rdata_pop_data,
	fifo_rdata_pop_ready,
	array_array_6e275_q,
	array_array_6e275_w,
	array_array_6e275_widx,
	array_array_6e275_d,
	array_array_6e26c_q,
	array_array_6e26c_w,
	array_array_6e26c_widx,
	array_array_6e26c_d,
	array_array_6e25a_q,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_count_pop_valid;
	input wire [31:0] fifo_count_pop_data;
	output wire [0:0] fifo_count_pop_ready;
	input wire [0:0] fifo_is_finish_pop_valid;
	input wire [0:0] fifo_is_finish_pop_data;
	output wire [0:0] fifo_is_finish_pop_ready;
	input wire [0:0] fifo_rdata_pop_valid;
	input wire [31:0] fifo_rdata_pop_data;
	output wire [0:0] fifo_rdata_pop_ready;
	input wire [31:0] array_array_6e275_q;
	output wire [0:0] array_array_6e275_w;
	output wire [0:0] array_array_6e275_widx;
	output wire [31:0] array_array_6e275_d;
	input wire [31:0] array_array_6e26c_q;
	output wire [0:0] array_array_6e26c_w;
	output wire [0:0] array_array_6e26c_widx;
	output wire [31:0] array_array_6e26c_d;
	input wire [287:0] array_array_6e25a_q;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [31:0] var_29;
	assign var_29 = fifo_rdata_pop_data;
	assign fifo_rdata_pop_ready = executed;
	wire [31:0] var_31;
	assign var_31 = fifo_count_pop_data;
	assign fifo_count_pop_ready = executed;
	wire [0:0] var_33;
	assign var_33 = fifo_is_finish_pop_data;
	assign fifo_is_finish_pop_ready = executed;
	wire [31:0] var_35;
	assign var_35 = var_29;
	wire [31:0] var_37;
	assign var_37 = (8 == var_31 ? array_array_6e25a_q[287:256] : (7 == var_31 ? array_array_6e25a_q[255:224] : (6 == var_31 ? array_array_6e25a_q[223:192] : (5 == var_31 ? array_array_6e25a_q[191:160] : (4 == var_31 ? array_array_6e25a_q[159:128] : (3 == var_31 ? array_array_6e25a_q[127:96] : (2 == var_31 ? array_array_6e25a_q[95:64] : (1 == var_31 ? array_array_6e25a_q[63:32] : (0 == var_31 ? array_array_6e25a_q[31:0] : {32 {1'sbx}})))))))));
	wire [63:0] var_40;
	assign var_40 = $signed(var_35) * $signed(var_37);
	wire [31:0] var_45;
	assign var_45 = var_40[31:0];
	wire [31:0] var_49;
	assign var_49 = var_45;
	wire [31:0] var_51;
	assign var_51 = array_array_6e275_q[31:0];
	wire [31:0] var_54;
	assign var_54 = $signed(var_51) + $signed(var_49);
	wire [0:0] var_58;
	assign var_58 = var_31 < 32'd8;
	wire [0:0] var_68;
	assign var_68 = var_31 == 32'd8;
	wire [31:0] var_74;
	assign var_74 = array_array_6e26c_q[31:0];
	wire [31:0] var_78;
	assign var_78 = var_74 + 32'd1;
	always @(posedge clk)
		if (executed && var_68)
			$display("%t\t[memuser_6e251]\t\tStep: %d	Conv_sum: %d", $time, var_78, var_54);
	always @(posedge clk)
		if (executed && (var_68 && var_33))
			$display("%t\t[memuser_6e251]\t\tfinish", $time);
	assign array_array_6e26c_w = executed && var_68;
	assign array_array_6e26c_d = {32 {var_68}} & var_78;
	assign array_array_6e26c_widx = {var_68} & 1'd0;
	assign array_array_6e275_w = executed && (var_58 || var_68);
	assign array_array_6e275_d = ({32 {var_58}} & var_54) | ({32 {var_68}} & 32'd0);
	assign array_array_6e275_widx = ({var_58} & 1'd0) | ({var_68} & 1'd0);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module driver (
	clk,
	rst_n,
	array_array_6e323_q,
	array_array_6e323_w,
	array_array_6e323_widx,
	array_array_6e323_d,
	array_array_6e317_q,
	array_array_6e317_w,
	array_array_6e317_widx,
	array_array_6e317_d,
	array_array_6e329_q,
	array_array_6e329_w,
	array_array_6e329_widx,
	array_array_6e329_d,
	fifo_memuser_6e251_is_finish_push_valid,
	fifo_memuser_6e251_is_finish_push_data,
	fifo_memuser_6e251_is_finish_push_ready,
	array_array_6e335_q,
	array_array_6e335_w,
	array_array_6e335_widx,
	array_array_6e335_d,
	fifo_memuser_6e251_count_push_valid,
	fifo_memuser_6e251_count_push_data,
	fifo_memuser_6e251_count_push_ready,
	array_array_6e32f_q,
	array_array_6e32f_w,
	array_array_6e32f_widx,
	array_array_6e32f_d,
	memuser_6e251_counter_delta,
	memuser_6e251_counter_delta_ready,
	expose_var_149,
	expose_var_149_valid,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [31:0] array_array_6e323_q;
	output wire [0:0] array_array_6e323_w;
	output wire [0:0] array_array_6e323_widx;
	output wire [31:0] array_array_6e323_d;
	input wire [31:0] array_array_6e317_q;
	output wire [0:0] array_array_6e317_w;
	output wire [0:0] array_array_6e317_widx;
	output wire [31:0] array_array_6e317_d;
	input wire [31:0] array_array_6e329_q;
	output wire [0:0] array_array_6e329_w;
	output wire [0:0] array_array_6e329_widx;
	output wire [31:0] array_array_6e329_d;
	output wire [0:0] fifo_memuser_6e251_is_finish_push_valid;
	output wire [0:0] fifo_memuser_6e251_is_finish_push_data;
	input wire [0:0] fifo_memuser_6e251_is_finish_push_ready;
	input wire [31:0] array_array_6e335_q;
	output wire [0:0] array_array_6e335_w;
	output wire [0:0] array_array_6e335_widx;
	output wire [31:0] array_array_6e335_d;
	output wire [0:0] fifo_memuser_6e251_count_push_valid;
	output wire [31:0] fifo_memuser_6e251_count_push_data;
	input wire [0:0] fifo_memuser_6e251_count_push_ready;
	input wire [31:0] array_array_6e32f_q;
	output wire [0:0] array_array_6e32f_w;
	output wire [0:0] array_array_6e32f_widx;
	output wire [31:0] array_array_6e32f_d;
	output wire [7:0] memuser_6e251_counter_delta;
	input wire [0:0] memuser_6e251_counter_delta_ready;
	output wire [13:0] expose_var_149;
	output wire [0:0] expose_var_149_valid;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [31:0] var_101;
	assign var_101 = array_array_6e317_q[31:0];
	wire [31:0] var_104;
	assign var_104 = array_array_6e323_q[31:0];
	wire [31:0] var_107;
	assign var_107 = array_array_6e329_q[31:0];
	wire [31:0] var_110;
	assign var_110 = array_array_6e32f_q[31:0];
	wire [31:0] var_113;
	assign var_113 = array_array_6e335_q[31:0];
	wire [63:0] var_117;
	assign var_117 = var_101 * 32'd128;
	wire [31:0] var_120;
	assign var_120 = var_117[31:0];
	wire [31:0] var_124;
	assign var_124 = var_120;
	wire [31:0] var_126;
	assign var_126 = var_124 + var_104;
	wire [63:0] var_129;
	assign var_129 = var_107 * 32'd128;
	wire [31:0] var_132;
	assign var_132 = var_129[31:0];
	wire [31:0] var_136;
	assign var_136 = var_132;
	wire [31:0] var_138;
	assign var_138 = var_136 + var_110;
	wire [31:0] var_141;
	assign var_141 = var_126 + var_138;
	wire [13:0] var_145;
	assign var_145 = var_141[13:0];
	wire [13:0] var_149;
	assign var_149 = var_145;
	assign expose_var_149 = var_149;
	assign expose_var_149_valid = executed && 1;
	wire [0:0] var_152;
	assign var_152 = var_101 == 32'd61;
	wire [0:0] var_156;
	assign var_156 = (var_152 ? 1'd1 : 1'd0);
	wire [0:0] var_242;
	assign var_242 = var_104 == 32'd125;
	wire [0:0] var_164;
	assign var_164 = (var_242 ? var_156 : 1'd0);
	wire [0:0] var_224;
	assign var_224 = var_110 == 32'd2;
	wire [31:0] var_182;
	assign var_182 = var_107 + 32'd1;
	wire [31:0] var_185;
	assign var_185 = (var_224 ? var_182 : var_107);
	wire [0:0] var_190;
	assign var_190 = var_185 == 32'd3;
	wire [31:0] var_194;
	assign var_194 = (var_190 ? 32'd0 : var_185);
	wire [31:0] var_201;
	assign var_201 = var_110 + 32'd1;
	wire [31:0] var_204;
	assign var_204 = (var_224 ? 32'd0 : var_201);
	wire [0:0] var_282;
	assign var_282 = var_113 == 32'd8;
	wire [31:0] var_217;
	assign var_217 = var_101 + 32'd1;
	wire [31:0] var_220;
	assign var_220 = (var_242 ? var_217 : var_101);
	wire [31:0] var_227;
	assign var_227 = var_104 + 32'd1;
	wire [31:0] var_230;
	assign var_230 = (var_242 ? 32'd0 : var_227);
	wire [31:0] var_245;
	assign var_245 = var_113 + 32'd1;
	wire [31:0] var_248;
	assign var_248 = (var_282 ? 32'd0 : var_245);
	assign memuser_6e251_counter_delta = (executed ? 1 : 0);
	assign fifo_memuser_6e251_count_push_valid = executed;
	assign fifo_memuser_6e251_count_push_data = var_113;
	assign fifo_memuser_6e251_is_finish_push_valid = executed;
	assign fifo_memuser_6e251_is_finish_push_data = var_164;
	assign array_array_6e317_w = executed && var_282;
	assign array_array_6e317_d = {32 {var_282}} & var_220;
	assign array_array_6e317_widx = {var_282} & 1'd0;
	assign array_array_6e323_w = executed && var_282;
	assign array_array_6e323_d = {32 {var_282}} & var_230;
	assign array_array_6e323_widx = {var_282} & 1'd0;
	assign array_array_6e335_w = executed;
	assign array_array_6e335_d = var_248;
	assign array_array_6e335_widx = 1'd0;
	assign array_array_6e329_w = executed;
	assign array_array_6e329_d = var_194;
	assign array_array_6e329_widx = 1'd0;
	assign array_array_6e32f_w = executed;
	assign array_array_6e32f_d = var_204;
	assign array_array_6e32f_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module SRAM_6e3f2 (
	clk,
	rst_n,
	fifo_memuser_6e251_rdata_push_valid,
	fifo_memuser_6e251_rdata_push_data,
	fifo_memuser_6e251_rdata_push_ready,
	driver_executed,
	var_149,
	var_149_valid,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] fifo_memuser_6e251_rdata_push_valid;
	output wire [31:0] fifo_memuser_6e251_rdata_push_data;
	input wire [0:0] fifo_memuser_6e251_rdata_push_ready;
	input wire [0:0] driver_executed;
	input wire [13:0] var_149;
	input wire [0:0] var_149_valid;
	output wire expose_executed;
	wire executed;
	wire [31:0] dataout;
	wire [31:0] var_275;
	assign var_275 = dataout;
	assign fifo_memuser_6e251_rdata_push_valid = executed && 1'd1;
	assign fifo_memuser_6e251_rdata_push_data = {32 {1'd1}} & var_275;
	wire array_array_77af3_w;
	wire [31:0] array_array_77af3_d;
	wire [13:0] array_array_77af3_widx;
	assign array_array_77af3_w = executed && 1'd0;
	assign array_array_77af3_d = {32 {1'd0}} & 32'd0;
	assign array_array_77af3_widx = var_149;
	memory_blackbox_array_77af3 #(
		.DATA_WIDTH(32),
		.ADDR_WIDTH(14)
	) memory_blackbox_array_77af3(
		.clk(clk),
		.address(array_array_77af3_widx),
		.wd(array_array_77af3_d),
		.banksel(1'd1),
		.read(1'd1),
		.write(array_array_77af3_w),
		.dataout(dataout),
		.rst_n(rst_n)
	);
	assign executed = driver_executed;
	assign expose_executed = executed;
endmodule
(* blackbox *) module memory_blackbox_array_77af3 (
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
	parameter ADDR_WIDTH = 14;
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
module top (
	array_array_6e275_exposed_o,
	array_array_6e275_exposed_i,
	array_array_6e275_exposed_i_valid,
	clk,
	rst_n
);
	output wire [31:0] array_array_6e275_exposed_o;
	input wire [31:0] array_array_6e275_exposed_i;
	input wire [0:0] array_array_6e275_exposed_i_valid;
	input wire clk;
	input wire rst_n;
	reg [31:0] array_array_6e275_q;
	wire [31:0] array_array_6e275_driver_memuser_6e251_d;
	wire [0:0] array_array_6e275_driver_memuser_6e251_w;
	wire [0:0] array_array_6e275_driver_memuser_6e251_widx;
	assign array_array_6e275_exposed_o = array_array_6e275_q;
	wire [31:0] array_array_6e275_temp;
	wire [31:0] array_array_6e275_d;
	assign array_array_6e275_temp = (array_array_6e275_exposed_i_valid ? array_array_6e275_exposed_i : array_array_6e275_d);
	wire [0:0] array_array_6e275_widx;
	wire [0:0] array_array_6e275_w;
	assign array_array_6e275_d = {32 {array_array_6e275_driver_memuser_6e251_w}} & array_array_6e275_driver_memuser_6e251_d;
	assign array_array_6e275_widx = {array_array_6e275_driver_memuser_6e251_w} & array_array_6e275_driver_memuser_6e251_widx;
	assign array_array_6e275_w = array_array_6e275_driver_memuser_6e251_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6e275_q <= 32'd0;
		else if (array_array_6e275_w)
			case (array_array_6e275_widx)
				0: array_array_6e275_q[31:0] <= array_array_6e275_temp;
				default:
					;
			endcase
	reg [287:0] array_array_6e25a_q;
	wire [31:0] array_array_6e25a_d;
	wire [3:0] array_array_6e25a_widx;
	wire [0:0] array_array_6e25a_w;
	assign array_array_6e25a_d = 1'sbx;
	assign array_array_6e25a_widx = 1'sbx;
	assign array_array_6e25a_w = 1'sbx;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			array_array_6e25a_q[31:0] <= 32'd0;
			array_array_6e25a_q[63:32] <= 32'd1;
			array_array_6e25a_q[95:64] <= 32'd2;
			array_array_6e25a_q[127:96] <= 32'd3;
			array_array_6e25a_q[159:128] <= 32'd4;
			array_array_6e25a_q[191:160] <= 32'd5;
			array_array_6e25a_q[223:192] <= 32'd6;
			array_array_6e25a_q[255:224] <= 32'd7;
			array_array_6e25a_q[287:256] <= 32'd8;
		end
		else if (array_array_6e25a_w)
			case (array_array_6e25a_widx)
				0: array_array_6e25a_q[31:0] <= array_array_6e25a_d;
				1: array_array_6e25a_q[63:32] <= array_array_6e25a_d;
				2: array_array_6e25a_q[95:64] <= array_array_6e25a_d;
				3: array_array_6e25a_q[127:96] <= array_array_6e25a_d;
				4: array_array_6e25a_q[159:128] <= array_array_6e25a_d;
				5: array_array_6e25a_q[191:160] <= array_array_6e25a_d;
				6: array_array_6e25a_q[223:192] <= array_array_6e25a_d;
				7: array_array_6e25a_q[255:224] <= array_array_6e25a_d;
				8: array_array_6e25a_q[287:256] <= array_array_6e25a_d;
				default:
					;
			endcase
	reg [31:0] array_array_6e26c_q;
	wire [31:0] array_array_6e26c_driver_memuser_6e251_d;
	wire [0:0] array_array_6e26c_driver_memuser_6e251_w;
	wire [0:0] array_array_6e26c_driver_memuser_6e251_widx;
	wire [31:0] array_array_6e26c_d;
	wire [0:0] array_array_6e26c_widx;
	wire [0:0] array_array_6e26c_w;
	assign array_array_6e26c_d = {32 {array_array_6e26c_driver_memuser_6e251_w}} & array_array_6e26c_driver_memuser_6e251_d;
	assign array_array_6e26c_widx = {array_array_6e26c_driver_memuser_6e251_w} & array_array_6e26c_driver_memuser_6e251_widx;
	assign array_array_6e26c_w = array_array_6e26c_driver_memuser_6e251_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6e26c_q <= 32'd0;
		else if (array_array_6e26c_w)
			case (array_array_6e26c_widx)
				0: array_array_6e26c_q[31:0] <= array_array_6e26c_d;
				default:
					;
			endcase
	reg [31:0] array_array_6e317_q;
	wire [31:0] array_array_6e317_driver_driver_d;
	wire [0:0] array_array_6e317_driver_driver_w;
	wire [0:0] array_array_6e317_driver_driver_widx;
	wire [31:0] array_array_6e317_d;
	wire [0:0] array_array_6e317_widx;
	wire [0:0] array_array_6e317_w;
	assign array_array_6e317_d = {32 {array_array_6e317_driver_driver_w}} & array_array_6e317_driver_driver_d;
	assign array_array_6e317_widx = {array_array_6e317_driver_driver_w} & array_array_6e317_driver_driver_widx;
	assign array_array_6e317_w = array_array_6e317_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6e317_q <= 32'd0;
		else if (array_array_6e317_w)
			case (array_array_6e317_widx)
				0: array_array_6e317_q[31:0] <= array_array_6e317_d;
				default:
					;
			endcase
	reg [31:0] array_array_6e32f_q;
	wire [31:0] array_array_6e32f_driver_driver_d;
	wire [0:0] array_array_6e32f_driver_driver_w;
	wire [0:0] array_array_6e32f_driver_driver_widx;
	wire [31:0] array_array_6e32f_d;
	wire [0:0] array_array_6e32f_widx;
	wire [0:0] array_array_6e32f_w;
	assign array_array_6e32f_d = {32 {array_array_6e32f_driver_driver_w}} & array_array_6e32f_driver_driver_d;
	assign array_array_6e32f_widx = {array_array_6e32f_driver_driver_w} & array_array_6e32f_driver_driver_widx;
	assign array_array_6e32f_w = array_array_6e32f_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6e32f_q <= 32'd0;
		else if (array_array_6e32f_w)
			case (array_array_6e32f_widx)
				0: array_array_6e32f_q[31:0] <= array_array_6e32f_d;
				default:
					;
			endcase
	reg [31:0] array_array_6e323_q;
	wire [31:0] array_array_6e323_driver_driver_d;
	wire [0:0] array_array_6e323_driver_driver_w;
	wire [0:0] array_array_6e323_driver_driver_widx;
	wire [31:0] array_array_6e323_d;
	wire [0:0] array_array_6e323_widx;
	wire [0:0] array_array_6e323_w;
	assign array_array_6e323_d = {32 {array_array_6e323_driver_driver_w}} & array_array_6e323_driver_driver_d;
	assign array_array_6e323_widx = {array_array_6e323_driver_driver_w} & array_array_6e323_driver_driver_widx;
	assign array_array_6e323_w = array_array_6e323_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6e323_q <= 32'd0;
		else if (array_array_6e323_w)
			case (array_array_6e323_widx)
				0: array_array_6e323_q[31:0] <= array_array_6e323_d;
				default:
					;
			endcase
	reg [31:0] array_array_6e335_q;
	wire [31:0] array_array_6e335_driver_driver_d;
	wire [0:0] array_array_6e335_driver_driver_w;
	wire [0:0] array_array_6e335_driver_driver_widx;
	wire [31:0] array_array_6e335_d;
	wire [0:0] array_array_6e335_widx;
	wire [0:0] array_array_6e335_w;
	assign array_array_6e335_d = {32 {array_array_6e335_driver_driver_w}} & array_array_6e335_driver_driver_d;
	assign array_array_6e335_widx = {array_array_6e335_driver_driver_w} & array_array_6e335_driver_driver_widx;
	assign array_array_6e335_w = array_array_6e335_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6e335_q <= 32'd0;
		else if (array_array_6e335_w)
			case (array_array_6e335_widx)
				0: array_array_6e335_q[31:0] <= array_array_6e335_d;
				default:
					;
			endcase
	reg [31:0] array_array_6e329_q;
	wire [31:0] array_array_6e329_driver_driver_d;
	wire [0:0] array_array_6e329_driver_driver_w;
	wire [0:0] array_array_6e329_driver_driver_widx;
	wire [31:0] array_array_6e329_d;
	wire [0:0] array_array_6e329_widx;
	wire [0:0] array_array_6e329_w;
	assign array_array_6e329_d = {32 {array_array_6e329_driver_driver_w}} & array_array_6e329_driver_driver_d;
	assign array_array_6e329_widx = {array_array_6e329_driver_driver_w} & array_array_6e329_driver_driver_widx;
	assign array_array_6e329_w = array_array_6e329_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6e329_q <= 32'd0;
		else if (array_array_6e329_w)
			case (array_array_6e329_widx)
				0: array_array_6e329_q[31:0] <= array_array_6e329_d;
				default:
					;
			endcase
	wire [31:0] array_array_77af3_q;
	wire [31:0] array_array_77af3_driver_SRAM_6e3f2_d;
	wire [0:0] array_array_77af3_driver_SRAM_6e3f2_w;
	wire [13:0] array_array_77af3_driver_SRAM_6e3f2_widx;
	wire [31:0] fifo_memuser_6e251_count_pop_data;
	wire [0:0] fifo_memuser_6e251_count_pop_valid;
	wire [0:0] fifo_memuser_6e251_count_pop_ready;
	wire [31:0] fifo_memuser_6e251_count_driver_driver_push_data;
	wire [0:0] fifo_memuser_6e251_count_driver_driver_push_valid;
	wire [0:0] fifo_memuser_6e251_count_driver_driver_push_ready;
	wire fifo_memuser_6e251_count_push_ready;
	assign fifo_memuser_6e251_count_driver_driver_push_ready = fifo_memuser_6e251_count_push_ready;
	wire [0:0] fifo_memuser_6e251_count_push_valid;
	assign fifo_memuser_6e251_count_push_valid = fifo_memuser_6e251_count_driver_driver_push_valid;
	wire [31:0] fifo_memuser_6e251_count_push_data;
	assign fifo_memuser_6e251_count_push_data = {32 {fifo_memuser_6e251_count_driver_driver_push_valid}} & fifo_memuser_6e251_count_driver_driver_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(2)
	) fifo_memuser_6e251_count_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_memuser_6e251_count_push_valid),
		.push_data(fifo_memuser_6e251_count_push_data),
		.push_ready(fifo_memuser_6e251_count_push_ready),
		.pop_valid(fifo_memuser_6e251_count_pop_valid),
		.pop_data(fifo_memuser_6e251_count_pop_data),
		.pop_ready(fifo_memuser_6e251_count_pop_ready)
	);
	wire [0:0] fifo_memuser_6e251_is_finish_pop_data;
	wire [0:0] fifo_memuser_6e251_is_finish_pop_valid;
	wire [0:0] fifo_memuser_6e251_is_finish_pop_ready;
	wire [0:0] fifo_memuser_6e251_is_finish_driver_driver_push_data;
	wire [0:0] fifo_memuser_6e251_is_finish_driver_driver_push_valid;
	wire [0:0] fifo_memuser_6e251_is_finish_driver_driver_push_ready;
	wire fifo_memuser_6e251_is_finish_push_ready;
	assign fifo_memuser_6e251_is_finish_driver_driver_push_ready = fifo_memuser_6e251_is_finish_push_ready;
	wire [0:0] fifo_memuser_6e251_is_finish_push_valid;
	assign fifo_memuser_6e251_is_finish_push_valid = fifo_memuser_6e251_is_finish_driver_driver_push_valid;
	wire [0:0] fifo_memuser_6e251_is_finish_push_data;
	assign fifo_memuser_6e251_is_finish_push_data = {fifo_memuser_6e251_is_finish_driver_driver_push_valid} & fifo_memuser_6e251_is_finish_driver_driver_push_data;
	fifo #(
		.WIDTH(1),
		.DEPTH_LOG2(2)
	) fifo_memuser_6e251_is_finish_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_memuser_6e251_is_finish_push_valid),
		.push_data(fifo_memuser_6e251_is_finish_push_data),
		.push_ready(fifo_memuser_6e251_is_finish_push_ready),
		.pop_valid(fifo_memuser_6e251_is_finish_pop_valid),
		.pop_data(fifo_memuser_6e251_is_finish_pop_data),
		.pop_ready(fifo_memuser_6e251_is_finish_pop_ready)
	);
	wire [31:0] fifo_memuser_6e251_rdata_pop_data;
	wire [0:0] fifo_memuser_6e251_rdata_pop_valid;
	wire [0:0] fifo_memuser_6e251_rdata_pop_ready;
	wire [31:0] fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_data;
	wire [0:0] fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid;
	wire [0:0] fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_ready;
	wire fifo_memuser_6e251_rdata_push_ready;
	assign fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_ready = fifo_memuser_6e251_rdata_push_ready;
	wire [0:0] fifo_memuser_6e251_rdata_push_valid;
	assign fifo_memuser_6e251_rdata_push_valid = fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid;
	wire [31:0] fifo_memuser_6e251_rdata_push_data;
	assign fifo_memuser_6e251_rdata_push_data = {32 {fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid}} & fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(2)
	) fifo_memuser_6e251_rdata_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_memuser_6e251_rdata_push_valid),
		.push_data(fifo_memuser_6e251_rdata_push_data),
		.push_ready(fifo_memuser_6e251_rdata_push_ready),
		.pop_valid(fifo_memuser_6e251_rdata_pop_valid),
		.pop_data(fifo_memuser_6e251_rdata_pop_data),
		.pop_ready(fifo_memuser_6e251_rdata_pop_ready)
	);
	wire [7:0] memuser_6e251_driver_driver_counter_delta;
	wire [0:0] memuser_6e251_driver_driver_counter_delta_ready;
	wire [0:0] memuser_6e251_counter_delta_ready;
	wire [7:0] memuser_6e251_counter_delta;
	assign memuser_6e251_counter_delta = memuser_6e251_driver_driver_counter_delta;
	wire [0:0] memuser_6e251_counter_pop_ready;
	assign memuser_6e251_driver_driver_counter_delta_ready = memuser_6e251_counter_pop_ready;
	wire [0:0] memuser_6e251_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) memuser_6e251_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(memuser_6e251_counter_delta),
		.delta_ready(memuser_6e251_counter_delta_ready),
		.pop_valid(memuser_6e251_counter_pop_valid),
		.pop_ready(memuser_6e251_counter_pop_ready)
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
	wire [0:0] memuser_6e251_executed;
	memuser_6e251 memuser_6e251_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_count_pop_ready(fifo_memuser_6e251_count_pop_ready),
		.fifo_count_pop_data(fifo_memuser_6e251_count_pop_data),
		.fifo_count_pop_valid(fifo_memuser_6e251_count_pop_valid),
		.fifo_is_finish_pop_ready(fifo_memuser_6e251_is_finish_pop_ready),
		.fifo_is_finish_pop_data(fifo_memuser_6e251_is_finish_pop_data),
		.fifo_is_finish_pop_valid(fifo_memuser_6e251_is_finish_pop_valid),
		.fifo_rdata_pop_ready(fifo_memuser_6e251_rdata_pop_ready),
		.fifo_rdata_pop_data(fifo_memuser_6e251_rdata_pop_data),
		.fifo_rdata_pop_valid(fifo_memuser_6e251_rdata_pop_valid),
		.array_array_6e275_q(array_array_6e275_q),
		.array_array_6e275_w(array_array_6e275_driver_memuser_6e251_w),
		.array_array_6e275_widx(array_array_6e275_driver_memuser_6e251_widx),
		.array_array_6e275_d(array_array_6e275_driver_memuser_6e251_d),
		.array_array_6e26c_q(array_array_6e26c_q),
		.array_array_6e26c_w(array_array_6e26c_driver_memuser_6e251_w),
		.array_array_6e26c_widx(array_array_6e26c_driver_memuser_6e251_widx),
		.array_array_6e26c_d(array_array_6e26c_driver_memuser_6e251_d),
		.array_array_6e25a_q(array_array_6e25a_q),
		.counter_delta_ready(memuser_6e251_counter_delta_ready),
		.counter_pop_ready(memuser_6e251_counter_pop_ready),
		.counter_pop_valid(memuser_6e251_counter_pop_valid),
		.expose_executed(memuser_6e251_executed)
	);
	wire [13:0] logic_var_149;
	wire [0:0] logic_var_149_valid;
	wire [0:0] driver_executed;
	driver driver_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_6e323_q(array_array_6e323_q),
		.array_array_6e323_w(array_array_6e323_driver_driver_w),
		.array_array_6e323_widx(array_array_6e323_driver_driver_widx),
		.array_array_6e323_d(array_array_6e323_driver_driver_d),
		.array_array_6e317_q(array_array_6e317_q),
		.array_array_6e317_w(array_array_6e317_driver_driver_w),
		.array_array_6e317_widx(array_array_6e317_driver_driver_widx),
		.array_array_6e317_d(array_array_6e317_driver_driver_d),
		.array_array_6e329_q(array_array_6e329_q),
		.array_array_6e329_w(array_array_6e329_driver_driver_w),
		.array_array_6e329_widx(array_array_6e329_driver_driver_widx),
		.array_array_6e329_d(array_array_6e329_driver_driver_d),
		.fifo_memuser_6e251_is_finish_push_valid(fifo_memuser_6e251_is_finish_driver_driver_push_valid),
		.fifo_memuser_6e251_is_finish_push_data(fifo_memuser_6e251_is_finish_driver_driver_push_data),
		.fifo_memuser_6e251_is_finish_push_ready(fifo_memuser_6e251_is_finish_driver_driver_push_ready),
		.array_array_6e335_q(array_array_6e335_q),
		.array_array_6e335_w(array_array_6e335_driver_driver_w),
		.array_array_6e335_widx(array_array_6e335_driver_driver_widx),
		.array_array_6e335_d(array_array_6e335_driver_driver_d),
		.fifo_memuser_6e251_count_push_valid(fifo_memuser_6e251_count_driver_driver_push_valid),
		.fifo_memuser_6e251_count_push_data(fifo_memuser_6e251_count_driver_driver_push_data),
		.fifo_memuser_6e251_count_push_ready(fifo_memuser_6e251_count_driver_driver_push_ready),
		.array_array_6e32f_q(array_array_6e32f_q),
		.array_array_6e32f_w(array_array_6e32f_driver_driver_w),
		.array_array_6e32f_widx(array_array_6e32f_driver_driver_widx),
		.array_array_6e32f_d(array_array_6e32f_driver_driver_d),
		.memuser_6e251_counter_delta_ready(memuser_6e251_driver_driver_counter_delta_ready),
		.memuser_6e251_counter_delta(memuser_6e251_driver_driver_counter_delta),
		.expose_var_149(logic_var_149),
		.expose_var_149_valid(logic_var_149_valid),
		.counter_delta_ready(driver_counter_delta_ready),
		.counter_pop_ready(driver_counter_pop_ready),
		.counter_pop_valid(driver_counter_pop_valid),
		.expose_executed(driver_executed)
	);
	wire [0:0] SRAM_6e3f2_executed;
	SRAM_6e3f2 SRAM_6e3f2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_memuser_6e251_rdata_push_valid(fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid),
		.fifo_memuser_6e251_rdata_push_data(fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_data),
		.fifo_memuser_6e251_rdata_push_ready(fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_ready),
		.driver_executed(driver_executed),
		.var_149(logic_var_149),
		.var_149_valid(logic_var_149_valid),
		.expose_executed(SRAM_6e3f2_executed)
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
	wire [31:0] array_array_6e275_exposed_o;
	wire [31:0] array_array_6e275_exposed_i;
	wire array_array_6e275_exposed_i_valid;
	assign array_array_6e275_exposed_i_valid = 1'd0;
	assign array_array_6e275_exposed_i = 32'd0;
	initial begin
		clk = 1'b1;
		rst_n = 1'b0;
		#(150)
			;
		rst_n = 1'b1;
		#(7372900)
			;
	end
	always #(50) clk <= !clk;
	top top_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_6e275_exposed_o(array_array_6e275_exposed_o),
		.array_array_6e275_exposed_i(array_array_6e275_exposed_i),
		.array_array_6e275_exposed_i_valid(array_array_6e275_exposed_i_valid)
	);
endmodule