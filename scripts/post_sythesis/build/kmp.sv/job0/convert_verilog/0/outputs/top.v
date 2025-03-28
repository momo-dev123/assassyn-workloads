module SRAM_d6221 (
	clk,
	rst_n,
	fifo_kmp_rdata_push_valid,
	fifo_kmp_rdata_push_data,
	fifo_kmp_rdata_push_ready,
	driver_executed,
	var_85,
	var_85_valid,
	var_116,
	var_116_valid,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] fifo_kmp_rdata_push_valid;
	output wire [31:0] fifo_kmp_rdata_push_data;
	input wire [0:0] fifo_kmp_rdata_push_ready;
	input wire [0:0] driver_executed;
	input wire [12:0] var_85;
	input wire [0:0] var_85_valid;
	input wire [0:0] var_116;
	input wire [0:0] var_116_valid;
	output wire expose_executed;
	wire executed;
	wire [31:0] dataout;
	wire [31:0] var_160;
	assign var_160 = dataout;
	assign fifo_kmp_rdata_push_valid = executed && var_116;
	assign fifo_kmp_rdata_push_data = {32 {var_116}} & var_160;
	wire array_array_d6227_w;
	wire [31:0] array_array_d6227_d;
	wire [12:0] array_array_d6227_widx;
	assign array_array_d6227_w = executed && 1'd0;
	assign array_array_d6227_d = {32 {1'd0}} & 32'd0;
	assign array_array_d6227_widx = var_85;
	memory_blackbox_array_d6227 #(
		.DATA_WIDTH(32),
		.ADDR_WIDTH(13)
	) memory_blackbox_array_d6227(
		.clk(clk),
		.address(array_array_d6227_widx),
		.wd(array_array_d6227_d),
		.banksel(1'd1),
		.read(1'd1),
		.write(array_array_d6227_w),
		.dataout(dataout),
		.rst_n(rst_n)
	);
	assign executed = driver_executed;
	assign expose_executed = executed;
endmodule
(* blackbox *) module memory_blackbox_array_d6227 (
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
module kmp (
	clk,
	rst_n,
	fifo_rdata_pop_valid,
	fifo_rdata_pop_data,
	fifo_rdata_pop_ready,
	array_array_d6158_q,
	array_array_d6158_w,
	array_array_d6158_widx,
	array_array_d6158_d,
	array_array_d6146_q,
	array_array_d6146_w,
	array_array_d6146_widx,
	array_array_d6146_d,
	array_array_d614f_q,
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
	input wire [31:0] array_array_d6158_q;
	output wire [0:0] array_array_d6158_w;
	output wire [0:0] array_array_d6158_widx;
	output wire [31:0] array_array_d6158_d;
	input wire [31:0] array_array_d6146_q;
	output wire [0:0] array_array_d6146_w;
	output wire [0:0] array_array_d6146_widx;
	output wire [31:0] array_array_d6146_d;
	input wire [31:0] array_array_d614f_q;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [31:0] var_14;
	assign var_14 = fifo_rdata_pop_data;
	assign fifo_rdata_pop_ready = executed;
	wire [31:0] var_17;
	assign var_17 = array_array_d6158_q[31:0];
	wire [63:0] var_20;
	assign var_20 = {var_17, var_14};
	wire [31:0] var_25;
	assign var_25 = var_20[39:8];
	wire [31:0] var_167;
	assign var_167 = array_array_d614f_q[31:0];
	wire [0:0] var_32;
	assign var_32 = var_25 == var_167;
	wire [31:0] var_37;
	assign var_37 = (var_32 ? 32'd0 : 32'd1);
	wire [31:0] var_43;
	assign var_43 = var_20[47:16];
	wire [0:0] var_50;
	assign var_50 = var_43 == var_167;
	wire [31:0] var_53;
	assign var_53 = (var_50 ? 32'd0 : 32'd1);
	wire [31:0] var_57;
	assign var_57 = var_37 + var_53;
	wire [31:0] var_62;
	assign var_62 = var_20[55:24];
	wire [0:0] var_69;
	assign var_69 = var_62 == var_167;
	wire [31:0] var_72;
	assign var_72 = (var_69 ? 32'd0 : 32'd1);
	wire [31:0] var_76;
	assign var_76 = var_57 + var_72;
	wire [31:0] var_81;
	assign var_81 = var_20[63:32];
	wire [0:0] var_88;
	assign var_88 = var_81 == var_167;
	wire [31:0] var_91;
	assign var_91 = (var_88 ? 32'd0 : 32'd1);
	wire [31:0] var_95;
	assign var_95 = var_76 + var_91;
	wire [31:0] var_98;
	assign var_98 = array_array_d6146_q[31:0];
	wire [31:0] var_101;
	assign var_101 = var_98 + var_95;
	assign array_array_d6146_w = executed;
	assign array_array_d6146_d = var_101;
	assign array_array_d6146_widx = 1'd0;
	assign array_array_d6158_w = executed;
	assign array_array_d6158_d = var_14;
	assign array_array_d6158_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module driver (
	clk,
	rst_n,
	array_array_d6239_q,
	array_array_d6239_w,
	array_array_d6239_widx,
	array_array_d6239_d,
	kmp_counter_delta,
	kmp_counter_delta_ready,
	expose_var_85,
	expose_var_85_valid,
	expose_var_116,
	expose_var_116_valid,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [12:0] array_array_d6239_q;
	output wire [0:0] array_array_d6239_w;
	output wire [0:0] array_array_d6239_widx;
	output wire [12:0] array_array_d6239_d;
	output wire [7:0] kmp_counter_delta;
	input wire [0:0] kmp_counter_delta_ready;
	output wire [12:0] expose_var_85;
	output wire [0:0] expose_var_85_valid;
	output wire [0:0] expose_var_116;
	output wire [0:0] expose_var_116_valid;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [12:0] var_85;
	assign var_85 = array_array_d6239_q[12:0];
	assign expose_var_85 = var_85;
	assign expose_var_85_valid = executed && 1;
	wire [0:0] var_116;
	assign var_116 = var_85 < 13'd8191;
	assign expose_var_116 = var_116;
	assign expose_var_116_valid = executed && 1;
	wire [12:0] var_133;
	assign var_133 = var_85 + 13'd1;
	wire [0:0] var_140;
	assign var_140 = ~var_116;
	always @(posedge clk)
		if (executed && var_140)
			$display("%t\t[driver]\t\tfinish", $time);
	assign kmp_counter_delta = (executed ? {7'b0000000, |var_116} : 0);
	assign array_array_d6239_w = executed && var_116;
	assign array_array_d6239_d = {13 {var_116}} & var_133;
	assign array_array_d6239_widx = {var_116} & 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module top (
	array_array_d6146_exposed_o,
	array_array_d6146_exposed_i,
	array_array_d6146_exposed_i_valid,
	array_array_d6239_exposed_o,
	array_array_d6239_exposed_i,
	array_array_d6239_exposed_i_valid,
	clk,
	rst_n
);
	output wire [31:0] array_array_d6146_exposed_o;
	input wire [31:0] array_array_d6146_exposed_i;
	input wire [0:0] array_array_d6146_exposed_i_valid;
	output wire [12:0] array_array_d6239_exposed_o;
	input wire [12:0] array_array_d6239_exposed_i;
	input wire [0:0] array_array_d6239_exposed_i_valid;
	input wire clk;
	input wire rst_n;
	reg [31:0] array_array_d614f_q;
	wire [31:0] array_array_d614f_d;
	wire [0:0] array_array_d614f_widx;
	wire [0:0] array_array_d614f_w;
	assign array_array_d614f_d = 1'sbx;
	assign array_array_d614f_widx = 1'sbx;
	assign array_array_d614f_w = 1'sbx;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_d614f_q <= 32'd0;
		else if (array_array_d614f_w)
			case (array_array_d614f_widx)
				0: array_array_d614f_q[31:0] <= array_array_d614f_d;
				default:
					;
			endcase
	reg [31:0] array_array_d6146_q;
	wire [31:0] array_array_d6146_driver_kmp_d;
	wire [0:0] array_array_d6146_driver_kmp_w;
	wire [0:0] array_array_d6146_driver_kmp_widx;
	assign array_array_d6146_exposed_o = array_array_d6146_q;
	wire [31:0] array_array_d6146_temp;
	wire [31:0] array_array_d6146_d;
	assign array_array_d6146_temp = (array_array_d6146_exposed_i_valid ? array_array_d6146_exposed_i : array_array_d6146_d);
	wire [0:0] array_array_d6146_widx;
	wire [0:0] array_array_d6146_w;
	assign array_array_d6146_d = {32 {array_array_d6146_driver_kmp_w}} & array_array_d6146_driver_kmp_d;
	assign array_array_d6146_widx = {array_array_d6146_driver_kmp_w} & array_array_d6146_driver_kmp_widx;
	assign array_array_d6146_w = array_array_d6146_driver_kmp_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_d6146_q <= 32'd0;
		else if (array_array_d6146_w)
			case (array_array_d6146_widx)
				0: array_array_d6146_q[31:0] <= array_array_d6146_temp;
				default:
					;
			endcase
	reg [12:0] array_array_d6239_q;
	wire [12:0] array_array_d6239_driver_driver_d;
	wire [0:0] array_array_d6239_driver_driver_w;
	wire [0:0] array_array_d6239_driver_driver_widx;
	assign array_array_d6239_exposed_o = array_array_d6239_q;
	wire [12:0] array_array_d6239_temp;
	wire [12:0] array_array_d6239_d;
	assign array_array_d6239_temp = (array_array_d6239_exposed_i_valid ? array_array_d6239_exposed_i : array_array_d6239_d);
	wire [0:0] array_array_d6239_widx;
	wire [0:0] array_array_d6239_w;
	assign array_array_d6239_d = {13 {array_array_d6239_driver_driver_w}} & array_array_d6239_driver_driver_d;
	assign array_array_d6239_widx = {array_array_d6239_driver_driver_w} & array_array_d6239_driver_driver_widx;
	assign array_array_d6239_w = array_array_d6239_driver_driver_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_d6239_q <= 13'd0;
		else if (array_array_d6239_w)
			case (array_array_d6239_widx)
				0: array_array_d6239_q[12:0] <= array_array_d6239_temp;
				default:
					;
			endcase
	reg [31:0] array_array_d6158_q;
	wire [31:0] array_array_d6158_driver_kmp_d;
	wire [0:0] array_array_d6158_driver_kmp_w;
	wire [0:0] array_array_d6158_driver_kmp_widx;
	wire [31:0] array_array_d6158_d;
	wire [0:0] array_array_d6158_widx;
	wire [0:0] array_array_d6158_w;
	assign array_array_d6158_d = {32 {array_array_d6158_driver_kmp_w}} & array_array_d6158_driver_kmp_d;
	assign array_array_d6158_widx = {array_array_d6158_driver_kmp_w} & array_array_d6158_driver_kmp_widx;
	assign array_array_d6158_w = array_array_d6158_driver_kmp_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_d6158_q[31:0] <= 32'd0;
		else if (array_array_d6158_w)
			case (array_array_d6158_widx)
				0: array_array_d6158_q[31:0] <= array_array_d6158_d;
				default:
					;
			endcase
	wire [31:0] array_array_d6227_q;
	wire [31:0] array_array_d6227_driver_SRAM_d6221_d;
	wire [0:0] array_array_d6227_driver_SRAM_d6221_w;
	wire [12:0] array_array_d6227_driver_SRAM_d6221_widx;
	wire [31:0] fifo_kmp_rdata_pop_data;
	wire [0:0] fifo_kmp_rdata_pop_valid;
	wire [0:0] fifo_kmp_rdata_pop_ready;
	wire [31:0] fifo_kmp_rdata_driver_SRAM_d6221_push_data;
	wire [0:0] fifo_kmp_rdata_driver_SRAM_d6221_push_valid;
	wire [0:0] fifo_kmp_rdata_driver_SRAM_d6221_push_ready;
	wire fifo_kmp_rdata_push_ready;
	assign fifo_kmp_rdata_driver_SRAM_d6221_push_ready = fifo_kmp_rdata_push_ready;
	wire [0:0] fifo_kmp_rdata_push_valid;
	assign fifo_kmp_rdata_push_valid = fifo_kmp_rdata_driver_SRAM_d6221_push_valid;
	wire [31:0] fifo_kmp_rdata_push_data;
	assign fifo_kmp_rdata_push_data = {32 {fifo_kmp_rdata_driver_SRAM_d6221_push_valid}} & fifo_kmp_rdata_driver_SRAM_d6221_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(2)
	) fifo_kmp_rdata_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_kmp_rdata_push_valid),
		.push_data(fifo_kmp_rdata_push_data),
		.push_ready(fifo_kmp_rdata_push_ready),
		.pop_valid(fifo_kmp_rdata_pop_valid),
		.pop_data(fifo_kmp_rdata_pop_data),
		.pop_ready(fifo_kmp_rdata_pop_ready)
	);
	wire [7:0] kmp_driver_driver_counter_delta;
	wire [0:0] kmp_driver_driver_counter_delta_ready;
	wire [0:0] kmp_counter_delta_ready;
	wire [7:0] kmp_counter_delta;
	assign kmp_counter_delta = kmp_driver_driver_counter_delta;
	wire [0:0] kmp_counter_pop_ready;
	assign kmp_driver_driver_counter_delta_ready = kmp_counter_pop_ready;
	wire [0:0] kmp_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) kmp_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(kmp_counter_delta),
		.delta_ready(kmp_counter_delta_ready),
		.pop_valid(kmp_counter_pop_valid),
		.pop_ready(kmp_counter_pop_ready)
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
	wire [0:0] kmp_executed;
	kmp kmp_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_rdata_pop_ready(fifo_kmp_rdata_pop_ready),
		.fifo_rdata_pop_data(fifo_kmp_rdata_pop_data),
		.fifo_rdata_pop_valid(fifo_kmp_rdata_pop_valid),
		.array_array_d6158_q(array_array_d6158_q),
		.array_array_d6158_w(array_array_d6158_driver_kmp_w),
		.array_array_d6158_widx(array_array_d6158_driver_kmp_widx),
		.array_array_d6158_d(array_array_d6158_driver_kmp_d),
		.array_array_d6146_q(array_array_d6146_q),
		.array_array_d6146_w(array_array_d6146_driver_kmp_w),
		.array_array_d6146_widx(array_array_d6146_driver_kmp_widx),
		.array_array_d6146_d(array_array_d6146_driver_kmp_d),
		.array_array_d614f_q(array_array_d614f_q),
		.counter_delta_ready(kmp_counter_delta_ready),
		.counter_pop_ready(kmp_counter_pop_ready),
		.counter_pop_valid(kmp_counter_pop_valid),
		.expose_executed(kmp_executed)
	);
	wire [12:0] logic_var_85;
	wire [0:0] logic_var_85_valid;
	wire [0:0] logic_var_116;
	wire [0:0] logic_var_116_valid;
	wire [0:0] driver_executed;
	driver driver_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_d6239_q(array_array_d6239_q),
		.array_array_d6239_w(array_array_d6239_driver_driver_w),
		.array_array_d6239_widx(array_array_d6239_driver_driver_widx),
		.array_array_d6239_d(array_array_d6239_driver_driver_d),
		.kmp_counter_delta_ready(kmp_driver_driver_counter_delta_ready),
		.kmp_counter_delta(kmp_driver_driver_counter_delta),
		.expose_var_85(logic_var_85),
		.expose_var_85_valid(logic_var_85_valid),
		.expose_var_116(logic_var_116),
		.expose_var_116_valid(logic_var_116_valid),
		.counter_delta_ready(driver_counter_delta_ready),
		.counter_pop_ready(driver_counter_pop_ready),
		.counter_pop_valid(driver_counter_pop_valid),
		.expose_executed(driver_executed)
	);
	wire [0:0] SRAM_d6221_executed;
	SRAM_d6221 SRAM_d6221_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_kmp_rdata_push_valid(fifo_kmp_rdata_driver_SRAM_d6221_push_valid),
		.fifo_kmp_rdata_push_data(fifo_kmp_rdata_driver_SRAM_d6221_push_data),
		.fifo_kmp_rdata_push_ready(fifo_kmp_rdata_driver_SRAM_d6221_push_ready),
		.driver_executed(driver_executed),
		.var_85(logic_var_85),
		.var_85_valid(logic_var_85_valid),
		.var_116(logic_var_116),
		.var_116_valid(logic_var_116_valid),
		.expose_executed(SRAM_d6221_executed)
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
	wire [31:0] array_array_d6146_exposed_o;
	wire [31:0] array_array_d6146_exposed_i;
	wire array_array_d6146_exposed_i_valid;
	assign array_array_d6146_exposed_i_valid = 1'd0;
	assign array_array_d6146_exposed_i = 32'd0;
	wire [12:0] array_array_d6239_exposed_o;
	wire [12:0] array_array_d6239_exposed_i;
	wire array_array_d6239_exposed_i_valid;
	assign array_array_d6239_exposed_i_valid = 1'd0;
	assign array_array_d6239_exposed_i = 13'd0;
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
		.array_array_d6146_exposed_o(array_array_d6146_exposed_o),
		.array_array_d6146_exposed_i(array_array_d6146_exposed_i),
		.array_array_d6146_exposed_i_valid(array_array_d6146_exposed_i_valid),
		.array_array_d6239_exposed_o(array_array_d6239_exposed_o),
		.array_array_d6239_exposed_i(array_array_d6239_exposed_i),
		.array_array_d6239_exposed_i_valid(array_array_d6239_exposed_i_valid)
	);
endmodule