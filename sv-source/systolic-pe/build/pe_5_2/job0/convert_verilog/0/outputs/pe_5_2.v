module pe_5_2 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	pe_5_3_counter_delta,
	pe_5_3_counter_delta_ready,
	fifo_pe_5_3_west_push_valid,
	fifo_pe_5_3_west_push_data,
	fifo_pe_5_3_west_push_ready,
	array_array_6632d_q,
	array_array_6632d_w,
	array_array_6632d_widx,
	array_array_6632d_d,
	fifo_pe_6_2_north_push_valid,
	fifo_pe_6_2_north_push_data,
	fifo_pe_6_2_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [7:0] pe_5_3_counter_delta;
	input wire [0:0] pe_5_3_counter_delta_ready;
	output wire [0:0] fifo_pe_5_3_west_push_valid;
	output wire [7:0] fifo_pe_5_3_west_push_data;
	input wire [0:0] fifo_pe_5_3_west_push_ready;
	input wire [31:0] array_array_6632d_q;
	output wire [0:0] array_array_6632d_w;
	output wire [0:0] array_array_6632d_widx;
	output wire [31:0] array_array_6632d_d;
	output wire [0:0] fifo_pe_6_2_north_push_valid;
	output wire [7:0] fifo_pe_6_2_north_push_data;
	input wire [0:0] fifo_pe_6_2_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1995;
	assign var_1995 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1997;
	assign var_1997 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1999;
	assign var_1999 = array_array_6632d_q[31:0];
	wire [15:0] var_2002;
	assign var_2002 = $signed(var_1995) * $signed(var_1997);
	wire [31:0] var_2005;
	assign var_2005 = {16'd0, var_2002};
	wire [31:0] var_2008;
	assign var_2008 = var_2005;
	wire [31:0] var_2010;
	assign var_2010 = $signed(var_1999) + $signed(var_2008);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_2]\t\tMac value: %d * %d + %d = %d", $time, var_1995, var_1997, var_1999, var_2010);
	assign pe_5_3_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_6_2_north_push_valid = executed;
	assign fifo_pe_6_2_north_push_data = var_1997;
	assign fifo_pe_5_3_west_push_valid = executed;
	assign fifo_pe_5_3_west_push_data = var_1995;
	assign array_array_6632d_w = executed;
	assign array_array_6632d_d = var_2010;
	assign array_array_6632d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_6 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	pe_8_7_counter_delta,
	pe_8_7_counter_delta_ready,
	array_array_66c75_q,
	array_array_66c75_w,
	array_array_66c75_widx,
	array_array_66c75_d,
	sink_69d05_counter_delta,
	sink_69d05_counter_delta_ready,
	fifo_sink_69d05_north_push_valid,
	fifo_sink_69d05_north_push_data,
	fifo_sink_69d05_north_push_ready,
	fifo_pe_8_7_west_push_valid,
	fifo_pe_8_7_west_push_data,
	fifo_pe_8_7_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [7:0] pe_8_7_counter_delta;
	input wire [0:0] pe_8_7_counter_delta_ready;
	input wire [31:0] array_array_66c75_q;
	output wire [0:0] array_array_66c75_w;
	output wire [0:0] array_array_66c75_widx;
	output wire [31:0] array_array_66c75_d;
	output wire [7:0] sink_69d05_counter_delta;
	input wire [0:0] sink_69d05_counter_delta_ready;
	output wire [0:0] fifo_sink_69d05_north_push_valid;
	output wire [7:0] fifo_sink_69d05_north_push_data;
	input wire [0:0] fifo_sink_69d05_north_push_ready;
	output wire [0:0] fifo_pe_8_7_west_push_valid;
	output wire [7:0] fifo_pe_8_7_west_push_data;
	input wire [0:0] fifo_pe_8_7_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3175;
	assign var_3175 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_3177;
	assign var_3177 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_3179;
	assign var_3179 = array_array_66c75_q[31:0];
	wire [15:0] var_3182;
	assign var_3182 = $signed(var_3175) * $signed(var_3177);
	wire [31:0] var_3185;
	assign var_3185 = {16'd0, var_3182};
	wire [31:0] var_3188;
	assign var_3188 = var_3185;
	wire [31:0] var_3190;
	assign var_3190 = $signed(var_3179) + $signed(var_3188);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_6]\t\tMac value: %d * %d + %d = %d", $time, var_3175, var_3177, var_3179, var_3190);
	assign sink_69d05_counter_delta = (executed ? 1 : 0);
	assign pe_8_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_8_7_west_push_valid = executed;
	assign fifo_pe_8_7_west_push_data = var_3175;
	assign fifo_sink_69d05_north_push_valid = executed;
	assign fifo_sink_69d05_north_push_data = var_3177;
	assign array_array_66c75_w = executed;
	assign array_array_66c75_d = var_3190;
	assign array_array_66c75_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_7 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_5_7_north_push_valid,
	fifo_pe_5_7_north_push_data,
	fifo_pe_5_7_north_push_ready,
	pe_4_8_counter_delta,
	pe_4_8_counter_delta_ready,
	fifo_pe_4_8_west_push_valid,
	fifo_pe_4_8_west_push_data,
	fifo_pe_4_8_west_push_ready,
	array_array_6629d_q,
	array_array_6629d_w,
	array_array_6629d_widx,
	array_array_6629d_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_5_7_north_push_valid;
	output wire [7:0] fifo_pe_5_7_north_push_data;
	input wire [0:0] fifo_pe_5_7_north_push_ready;
	output wire [7:0] pe_4_8_counter_delta;
	input wire [0:0] pe_4_8_counter_delta_ready;
	output wire [0:0] fifo_pe_4_8_west_push_valid;
	output wire [7:0] fifo_pe_4_8_west_push_data;
	input wire [0:0] fifo_pe_4_8_west_push_ready;
	input wire [31:0] array_array_6629d_q;
	output wire [0:0] array_array_6629d_w;
	output wire [0:0] array_array_6629d_widx;
	output wire [31:0] array_array_6629d_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1868;
	assign var_1868 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1870;
	assign var_1870 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1872;
	assign var_1872 = array_array_6629d_q[31:0];
	wire [15:0] var_1875;
	assign var_1875 = $signed(var_1868) * $signed(var_1870);
	wire [31:0] var_1878;
	assign var_1878 = {16'd0, var_1875};
	wire [31:0] var_1881;
	assign var_1881 = var_1878;
	wire [31:0] var_1883;
	assign var_1883 = $signed(var_1872) + $signed(var_1881);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_7]\t\tMac value: %d * %d + %d = %d", $time, var_1868, var_1870, var_1872, var_1883);
	assign pe_4_8_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_4_8_west_push_valid = executed;
	assign fifo_pe_4_8_west_push_data = var_1868;
	assign fifo_pe_5_7_north_push_valid = executed;
	assign fifo_pe_5_7_north_push_data = var_1870;
	assign array_array_6629d_w = executed;
	assign array_array_6629d_d = var_1883;
	assign array_array_6629d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_6 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_66971_q,
	array_array_66971_w,
	array_array_66971_widx,
	array_array_66971_d,
	fifo_pe_6_7_west_push_valid,
	fifo_pe_6_7_west_push_data,
	fifo_pe_6_7_west_push_ready,
	pe_6_7_counter_delta,
	pe_6_7_counter_delta_ready,
	fifo_pe_7_6_north_push_valid,
	fifo_pe_7_6_north_push_data,
	fifo_pe_7_6_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_66971_q;
	output wire [0:0] array_array_66971_w;
	output wire [0:0] array_array_66971_widx;
	output wire [31:0] array_array_66971_d;
	output wire [0:0] fifo_pe_6_7_west_push_valid;
	output wire [7:0] fifo_pe_6_7_west_push_data;
	input wire [0:0] fifo_pe_6_7_west_push_ready;
	output wire [7:0] pe_6_7_counter_delta;
	input wire [0:0] pe_6_7_counter_delta_ready;
	output wire [0:0] fifo_pe_7_6_north_push_valid;
	output wire [7:0] fifo_pe_7_6_north_push_data;
	input wire [0:0] fifo_pe_7_6_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2491;
	assign var_2491 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2493;
	assign var_2493 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2495;
	assign var_2495 = array_array_66971_q[31:0];
	wire [15:0] var_2498;
	assign var_2498 = $signed(var_2491) * $signed(var_2493);
	wire [31:0] var_2501;
	assign var_2501 = {16'd0, var_2498};
	wire [31:0] var_2504;
	assign var_2504 = var_2501;
	wire [31:0] var_2506;
	assign var_2506 = $signed(var_2495) + $signed(var_2504);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_6]\t\tMac value: %d * %d + %d = %d", $time, var_2491, var_2493, var_2495, var_2506);
	assign pe_6_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_6_north_push_valid = executed;
	assign fifo_pe_7_6_north_push_data = var_2493;
	assign fifo_pe_6_7_west_push_valid = executed;
	assign fifo_pe_6_7_west_push_data = var_2491;
	assign array_array_66971_w = executed;
	assign array_array_66971_d = var_2506;
	assign array_array_66971_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_1 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_66a01_q,
	array_array_66a01_w,
	array_array_66a01_widx,
	array_array_66a01_d,
	pe_8_1_counter_delta,
	pe_8_1_counter_delta_ready,
	fifo_pe_7_2_west_push_valid,
	fifo_pe_7_2_west_push_data,
	fifo_pe_7_2_west_push_ready,
	fifo_pe_8_1_north_push_valid,
	fifo_pe_8_1_north_push_data,
	fifo_pe_8_1_north_push_ready,
	pe_7_2_counter_delta,
	pe_7_2_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_66a01_q;
	output wire [0:0] array_array_66a01_w;
	output wire [0:0] array_array_66a01_widx;
	output wire [31:0] array_array_66a01_d;
	output wire [7:0] pe_8_1_counter_delta;
	input wire [0:0] pe_8_1_counter_delta_ready;
	output wire [0:0] fifo_pe_7_2_west_push_valid;
	output wire [7:0] fifo_pe_7_2_west_push_data;
	input wire [0:0] fifo_pe_7_2_west_push_ready;
	output wire [0:0] fifo_pe_8_1_north_push_valid;
	output wire [7:0] fifo_pe_8_1_north_push_data;
	input wire [0:0] fifo_pe_8_1_north_push_ready;
	output wire [7:0] pe_7_2_counter_delta;
	input wire [0:0] pe_7_2_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2613;
	assign var_2613 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2615;
	assign var_2615 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2617;
	assign var_2617 = array_array_66a01_q[31:0];
	wire [15:0] var_2620;
	assign var_2620 = $signed(var_2613) * $signed(var_2615);
	wire [31:0] var_2623;
	assign var_2623 = {16'd0, var_2620};
	wire [31:0] var_2626;
	assign var_2626 = var_2623;
	wire [31:0] var_2628;
	assign var_2628 = $signed(var_2617) + $signed(var_2626);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_1]\t\tMac value: %d * %d + %d = %d", $time, var_2613, var_2615, var_2617, var_2628);
	assign pe_8_1_counter_delta = (executed ? 1 : 0);
	assign pe_7_2_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_2_west_push_valid = executed;
	assign fifo_pe_7_2_west_push_data = var_2613;
	assign fifo_pe_8_1_north_push_valid = executed;
	assign fifo_pe_8_1_north_push_data = var_2615;
	assign array_array_66a01_w = executed;
	assign array_array_66a01_d = var_2628;
	assign array_array_66a01_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_4 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_6620d_q,
	array_array_6620d_w,
	array_array_6620d_widx,
	array_array_6620d_d,
	pe_4_5_counter_delta,
	pe_4_5_counter_delta_ready,
	fifo_pe_5_4_north_push_valid,
	fifo_pe_5_4_north_push_data,
	fifo_pe_5_4_north_push_ready,
	fifo_pe_4_5_west_push_valid,
	fifo_pe_4_5_west_push_data,
	fifo_pe_4_5_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_6620d_q;
	output wire [0:0] array_array_6620d_w;
	output wire [0:0] array_array_6620d_widx;
	output wire [31:0] array_array_6620d_d;
	output wire [7:0] pe_4_5_counter_delta;
	input wire [0:0] pe_4_5_counter_delta_ready;
	output wire [0:0] fifo_pe_5_4_north_push_valid;
	output wire [7:0] fifo_pe_5_4_north_push_data;
	input wire [0:0] fifo_pe_5_4_north_push_ready;
	output wire [0:0] fifo_pe_4_5_west_push_valid;
	output wire [7:0] fifo_pe_4_5_west_push_data;
	input wire [0:0] fifo_pe_4_5_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1745;
	assign var_1745 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1747;
	assign var_1747 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1749;
	assign var_1749 = array_array_6620d_q[31:0];
	wire [15:0] var_1752;
	assign var_1752 = $signed(var_1745) * $signed(var_1747);
	wire [31:0] var_1755;
	assign var_1755 = {16'd0, var_1752};
	wire [31:0] var_1758;
	assign var_1758 = var_1755;
	wire [31:0] var_1760;
	assign var_1760 = $signed(var_1749) + $signed(var_1758);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_4]\t\tMac value: %d * %d + %d = %d", $time, var_1745, var_1747, var_1749, var_1760);
	assign pe_4_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_4_5_west_push_valid = executed;
	assign fifo_pe_4_5_west_push_data = var_1745;
	assign fifo_pe_5_4_north_push_valid = executed;
	assign fifo_pe_5_4_north_push_data = var_1747;
	assign array_array_6620d_w = executed;
	assign array_array_6620d_d = var_1760;
	assign array_array_6620d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_2_5_north_push_valid,
	fifo_pe_2_5_north_push_data,
	fifo_pe_2_5_north_push_ready,
	fifo_pe_1_6_west_push_valid,
	fifo_pe_1_6_west_push_data,
	fifo_pe_1_6_west_push_ready,
	array_array_65601_q,
	array_array_65601_w,
	array_array_65601_widx,
	array_array_65601_d,
	pe_1_6_counter_delta,
	pe_1_6_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_2_5_north_push_valid;
	output wire [7:0] fifo_pe_2_5_north_push_data;
	input wire [0:0] fifo_pe_2_5_north_push_ready;
	output wire [0:0] fifo_pe_1_6_west_push_valid;
	output wire [7:0] fifo_pe_1_6_west_push_data;
	input wire [0:0] fifo_pe_1_6_west_push_ready;
	input wire [31:0] array_array_65601_q;
	output wire [0:0] array_array_65601_w;
	output wire [0:0] array_array_65601_widx;
	output wire [31:0] array_array_65601_d;
	output wire [7:0] pe_1_6_counter_delta;
	input wire [0:0] pe_1_6_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_793;
	assign var_793 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_795;
	assign var_795 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_797;
	assign var_797 = array_array_65601_q[31:0];
	wire [15:0] var_800;
	assign var_800 = $signed(var_793) * $signed(var_795);
	wire [31:0] var_803;
	assign var_803 = {16'd0, var_800};
	wire [31:0] var_806;
	assign var_806 = var_803;
	wire [31:0] var_808;
	assign var_808 = $signed(var_797) + $signed(var_806);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_5]\t\tMac value: %d * %d + %d = %d", $time, var_793, var_795, var_797, var_808);
	assign pe_1_6_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_5_north_push_valid = executed;
	assign fifo_pe_2_5_north_push_data = var_795;
	assign fifo_pe_1_6_west_push_valid = executed;
	assign fifo_pe_1_6_west_push_data = var_793;
	assign array_array_65601_w = executed;
	assign array_array_65601_d = var_808;
	assign array_array_65601_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_3 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_3_3_north_push_valid,
	fifo_pe_3_3_north_push_data,
	fifo_pe_3_3_north_push_ready,
	pe_2_4_counter_delta,
	pe_2_4_counter_delta_ready,
	fifo_pe_2_4_west_push_valid,
	fifo_pe_2_4_west_push_data,
	fifo_pe_2_4_west_push_ready,
	array_array_65709_q,
	array_array_65709_w,
	array_array_65709_widx,
	array_array_65709_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_3_3_north_push_valid;
	output wire [7:0] fifo_pe_3_3_north_push_data;
	input wire [0:0] fifo_pe_3_3_north_push_ready;
	output wire [7:0] pe_2_4_counter_delta;
	input wire [0:0] pe_2_4_counter_delta_ready;
	output wire [0:0] fifo_pe_2_4_west_push_valid;
	output wire [7:0] fifo_pe_2_4_west_push_data;
	input wire [0:0] fifo_pe_2_4_west_push_ready;
	input wire [31:0] array_array_65709_q;
	output wire [0:0] array_array_65709_w;
	output wire [0:0] array_array_65709_widx;
	output wire [31:0] array_array_65709_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1040;
	assign var_1040 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1042;
	assign var_1042 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1044;
	assign var_1044 = array_array_65709_q[31:0];
	wire [15:0] var_1047;
	assign var_1047 = $signed(var_1040) * $signed(var_1042);
	wire [31:0] var_1050;
	assign var_1050 = {16'd0, var_1047};
	wire [31:0] var_1053;
	assign var_1053 = var_1050;
	wire [31:0] var_1055;
	assign var_1055 = $signed(var_1044) + $signed(var_1053);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_3]\t\tMac value: %d * %d + %d = %d", $time, var_1040, var_1042, var_1044, var_1055);
	assign pe_2_4_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_4_west_push_valid = executed;
	assign fifo_pe_2_4_west_push_data = var_1040;
	assign fifo_pe_3_3_north_push_valid = executed;
	assign fifo_pe_3_3_north_push_data = var_1042;
	assign array_array_65709_w = executed;
	assign array_array_65709_d = var_1055;
	assign array_array_65709_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_69c5d (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3470;
	assign var_3470 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_69c5d]\t\tSink: %d", $time, var_3470);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_2 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_661ad_q,
	array_array_661ad_w,
	array_array_661ad_widx,
	array_array_661ad_d,
	fifo_pe_5_2_north_push_valid,
	fifo_pe_5_2_north_push_data,
	fifo_pe_5_2_north_push_ready,
	pe_4_3_counter_delta,
	pe_4_3_counter_delta_ready,
	fifo_pe_4_3_west_push_valid,
	fifo_pe_4_3_west_push_data,
	fifo_pe_4_3_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_661ad_q;
	output wire [0:0] array_array_661ad_w;
	output wire [0:0] array_array_661ad_widx;
	output wire [31:0] array_array_661ad_d;
	output wire [0:0] fifo_pe_5_2_north_push_valid;
	output wire [7:0] fifo_pe_5_2_north_push_data;
	input wire [0:0] fifo_pe_5_2_north_push_ready;
	output wire [7:0] pe_4_3_counter_delta;
	input wire [0:0] pe_4_3_counter_delta_ready;
	output wire [0:0] fifo_pe_4_3_west_push_valid;
	output wire [7:0] fifo_pe_4_3_west_push_data;
	input wire [0:0] fifo_pe_4_3_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1663;
	assign var_1663 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1665;
	assign var_1665 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1667;
	assign var_1667 = array_array_661ad_q[31:0];
	wire [15:0] var_1670;
	assign var_1670 = $signed(var_1663) * $signed(var_1665);
	wire [31:0] var_1673;
	assign var_1673 = {16'd0, var_1670};
	wire [31:0] var_1676;
	assign var_1676 = var_1673;
	wire [31:0] var_1678;
	assign var_1678 = $signed(var_1667) + $signed(var_1676);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_2]\t\tMac value: %d * %d + %d = %d", $time, var_1663, var_1665, var_1667, var_1678);
	assign pe_4_3_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_2_north_push_valid = executed;
	assign fifo_pe_5_2_north_push_data = var_1665;
	assign fifo_pe_4_3_west_push_valid = executed;
	assign fifo_pe_4_3_west_push_data = var_1663;
	assign array_array_661ad_w = executed;
	assign array_array_661ad_d = var_1678;
	assign array_array_661ad_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_3_5_north_push_valid,
	fifo_pe_3_5_north_push_data,
	fifo_pe_3_5_north_push_ready,
	array_array_65765_q,
	array_array_65765_w,
	array_array_65765_widx,
	array_array_65765_d,
	pe_2_6_counter_delta,
	pe_2_6_counter_delta_ready,
	fifo_pe_2_6_west_push_valid,
	fifo_pe_2_6_west_push_data,
	fifo_pe_2_6_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_3_5_north_push_valid;
	output wire [7:0] fifo_pe_3_5_north_push_data;
	input wire [0:0] fifo_pe_3_5_north_push_ready;
	input wire [31:0] array_array_65765_q;
	output wire [0:0] array_array_65765_w;
	output wire [0:0] array_array_65765_widx;
	output wire [31:0] array_array_65765_d;
	output wire [7:0] pe_2_6_counter_delta;
	input wire [0:0] pe_2_6_counter_delta_ready;
	output wire [0:0] fifo_pe_2_6_west_push_valid;
	output wire [7:0] fifo_pe_2_6_west_push_data;
	input wire [0:0] fifo_pe_2_6_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1122;
	assign var_1122 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1124;
	assign var_1124 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1126;
	assign var_1126 = array_array_65765_q[31:0];
	wire [15:0] var_1129;
	assign var_1129 = $signed(var_1122) * $signed(var_1124);
	wire [31:0] var_1132;
	assign var_1132 = {16'd0, var_1129};
	wire [31:0] var_1135;
	assign var_1135 = var_1132;
	wire [31:0] var_1137;
	assign var_1137 = $signed(var_1126) + $signed(var_1135);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_5]\t\tMac value: %d * %d + %d = %d", $time, var_1122, var_1124, var_1126, var_1137);
	assign pe_2_6_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_5_north_push_valid = executed;
	assign fifo_pe_3_5_north_push_data = var_1124;
	assign fifo_pe_2_6_west_push_valid = executed;
	assign fifo_pe_2_6_west_push_data = var_1122;
	assign array_array_65765_w = executed;
	assign array_array_65765_d = var_1137;
	assign array_array_65765_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_68649 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3400;
	assign var_3400 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_68649]\t\tSink: %d", $time, var_3400);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_8 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_657e9_q,
	array_array_657e9_w,
	array_array_657e9_widx,
	array_array_657e9_d,
	sink_68561_counter_delta,
	sink_68561_counter_delta_ready,
	fifo_sink_68561_west_push_valid,
	fifo_sink_68561_west_push_data,
	fifo_sink_68561_west_push_ready,
	fifo_pe_3_8_north_push_valid,
	fifo_pe_3_8_north_push_data,
	fifo_pe_3_8_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_657e9_q;
	output wire [0:0] array_array_657e9_w;
	output wire [0:0] array_array_657e9_widx;
	output wire [31:0] array_array_657e9_d;
	output wire [7:0] sink_68561_counter_delta;
	input wire [0:0] sink_68561_counter_delta_ready;
	output wire [0:0] fifo_sink_68561_west_push_valid;
	output wire [7:0] fifo_sink_68561_west_push_data;
	input wire [0:0] fifo_sink_68561_west_push_ready;
	output wire [0:0] fifo_pe_3_8_north_push_valid;
	output wire [7:0] fifo_pe_3_8_north_push_data;
	input wire [0:0] fifo_pe_3_8_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1245;
	assign var_1245 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1247;
	assign var_1247 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1249;
	assign var_1249 = array_array_657e9_q[31:0];
	wire [15:0] var_1252;
	assign var_1252 = $signed(var_1245) * $signed(var_1247);
	wire [31:0] var_1255;
	assign var_1255 = {16'd0, var_1252};
	wire [31:0] var_1258;
	assign var_1258 = var_1255;
	wire [31:0] var_1260;
	assign var_1260 = $signed(var_1249) + $signed(var_1258);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_8]\t\tMac value: %d * %d + %d = %d", $time, var_1245, var_1247, var_1249, var_1260);
	assign sink_68561_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_8_north_push_valid = executed;
	assign fifo_pe_3_8_north_push_data = var_1247;
	assign fifo_sink_68561_west_push_valid = executed;
	assign fifo_sink_68561_west_push_data = var_1245;
	assign array_array_657e9_w = executed;
	assign array_array_657e9_d = var_1260;
	assign array_array_657e9_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_1 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	pe_5_1_counter_delta,
	pe_5_1_counter_delta_ready,
	fifo_pe_4_2_west_push_valid,
	fifo_pe_4_2_west_push_data,
	fifo_pe_4_2_west_push_ready,
	array_array_6617d_q,
	array_array_6617d_w,
	array_array_6617d_widx,
	array_array_6617d_d,
	pe_4_2_counter_delta,
	pe_4_2_counter_delta_ready,
	fifo_pe_5_1_north_push_valid,
	fifo_pe_5_1_north_push_data,
	fifo_pe_5_1_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [7:0] pe_5_1_counter_delta;
	input wire [0:0] pe_5_1_counter_delta_ready;
	output wire [0:0] fifo_pe_4_2_west_push_valid;
	output wire [7:0] fifo_pe_4_2_west_push_data;
	input wire [0:0] fifo_pe_4_2_west_push_ready;
	input wire [31:0] array_array_6617d_q;
	output wire [0:0] array_array_6617d_w;
	output wire [0:0] array_array_6617d_widx;
	output wire [31:0] array_array_6617d_d;
	output wire [7:0] pe_4_2_counter_delta;
	input wire [0:0] pe_4_2_counter_delta_ready;
	output wire [0:0] fifo_pe_5_1_north_push_valid;
	output wire [7:0] fifo_pe_5_1_north_push_data;
	input wire [0:0] fifo_pe_5_1_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1617;
	assign var_1617 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1619;
	assign var_1619 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1621;
	assign var_1621 = array_array_6617d_q[31:0];
	wire [15:0] var_1624;
	assign var_1624 = $signed(var_1617) * $signed(var_1619);
	wire [31:0] var_1627;
	assign var_1627 = {16'd0, var_1624};
	wire [31:0] var_1630;
	assign var_1630 = var_1627;
	wire [31:0] var_1632;
	assign var_1632 = $signed(var_1621) + $signed(var_1630);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_1]\t\tMac value: %d * %d + %d = %d", $time, var_1617, var_1619, var_1621, var_1632);
	assign pe_4_2_counter_delta = (executed ? 1 : 0);
	assign pe_5_1_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_4_2_west_push_valid = executed;
	assign fifo_pe_4_2_west_push_data = var_1617;
	assign fifo_pe_5_1_north_push_valid = executed;
	assign fifo_pe_5_1_north_push_data = var_1619;
	assign array_array_6617d_w = executed;
	assign array_array_6617d_d = var_1632;
	assign array_array_6617d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_7 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_66121_q,
	array_array_66121_w,
	array_array_66121_widx,
	array_array_66121_d,
	fifo_pe_3_8_west_push_valid,
	fifo_pe_3_8_west_push_data,
	fifo_pe_3_8_west_push_ready,
	pe_3_8_counter_delta,
	pe_3_8_counter_delta_ready,
	fifo_pe_4_7_north_push_valid,
	fifo_pe_4_7_north_push_data,
	fifo_pe_4_7_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_66121_q;
	output wire [0:0] array_array_66121_w;
	output wire [0:0] array_array_66121_widx;
	output wire [31:0] array_array_66121_d;
	output wire [0:0] fifo_pe_3_8_west_push_valid;
	output wire [7:0] fifo_pe_3_8_west_push_data;
	input wire [0:0] fifo_pe_3_8_west_push_ready;
	output wire [7:0] pe_3_8_counter_delta;
	input wire [0:0] pe_3_8_counter_delta_ready;
	output wire [0:0] fifo_pe_4_7_north_push_valid;
	output wire [7:0] fifo_pe_4_7_north_push_data;
	input wire [0:0] fifo_pe_4_7_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1536;
	assign var_1536 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1538;
	assign var_1538 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1540;
	assign var_1540 = array_array_66121_q[31:0];
	wire [15:0] var_1543;
	assign var_1543 = $signed(var_1536) * $signed(var_1538);
	wire [31:0] var_1546;
	assign var_1546 = {16'd0, var_1543};
	wire [31:0] var_1549;
	assign var_1549 = var_1546;
	wire [31:0] var_1551;
	assign var_1551 = $signed(var_1540) + $signed(var_1549);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_7]\t\tMac value: %d * %d + %d = %d", $time, var_1536, var_1538, var_1540, var_1551);
	assign pe_3_8_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_8_west_push_valid = executed;
	assign fifo_pe_3_8_west_push_data = var_1536;
	assign fifo_pe_4_7_north_push_valid = executed;
	assign fifo_pe_4_7_north_push_data = var_1538;
	assign array_array_66121_w = executed;
	assign array_array_66121_d = var_1551;
	assign array_array_66121_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_3 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	pe_4_4_counter_delta,
	pe_4_4_counter_delta_ready,
	fifo_pe_4_4_west_push_valid,
	fifo_pe_4_4_west_push_data,
	fifo_pe_4_4_west_push_ready,
	array_array_661dd_q,
	array_array_661dd_w,
	array_array_661dd_widx,
	array_array_661dd_d,
	fifo_pe_5_3_north_push_valid,
	fifo_pe_5_3_north_push_data,
	fifo_pe_5_3_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [7:0] pe_4_4_counter_delta;
	input wire [0:0] pe_4_4_counter_delta_ready;
	output wire [0:0] fifo_pe_4_4_west_push_valid;
	output wire [7:0] fifo_pe_4_4_west_push_data;
	input wire [0:0] fifo_pe_4_4_west_push_ready;
	input wire [31:0] array_array_661dd_q;
	output wire [0:0] array_array_661dd_w;
	output wire [0:0] array_array_661dd_widx;
	output wire [31:0] array_array_661dd_d;
	output wire [0:0] fifo_pe_5_3_north_push_valid;
	output wire [7:0] fifo_pe_5_3_north_push_data;
	input wire [0:0] fifo_pe_5_3_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1704;
	assign var_1704 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1706;
	assign var_1706 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1708;
	assign var_1708 = array_array_661dd_q[31:0];
	wire [15:0] var_1711;
	assign var_1711 = $signed(var_1704) * $signed(var_1706);
	wire [31:0] var_1714;
	assign var_1714 = {16'd0, var_1711};
	wire [31:0] var_1717;
	assign var_1717 = var_1714;
	wire [31:0] var_1719;
	assign var_1719 = $signed(var_1708) + $signed(var_1717);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_3]\t\tMac value: %d * %d + %d = %d", $time, var_1704, var_1706, var_1708, var_1719);
	assign pe_4_4_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_3_north_push_valid = executed;
	assign fifo_pe_5_3_north_push_data = var_1706;
	assign fifo_pe_4_4_west_push_valid = executed;
	assign fifo_pe_4_4_west_push_data = var_1704;
	assign array_array_661dd_w = executed;
	assign array_array_661dd_d = var_1719;
	assign array_array_661dd_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_8 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_sink_68731_west_push_valid,
	fifo_sink_68731_west_push_data,
	fifo_sink_68731_west_push_ready,
	array_array_662cd_q,
	array_array_662cd_w,
	array_array_662cd_widx,
	array_array_662cd_d,
	fifo_pe_5_8_north_push_valid,
	fifo_pe_5_8_north_push_data,
	fifo_pe_5_8_north_push_ready,
	sink_68731_counter_delta,
	sink_68731_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_sink_68731_west_push_valid;
	output wire [7:0] fifo_sink_68731_west_push_data;
	input wire [0:0] fifo_sink_68731_west_push_ready;
	input wire [31:0] array_array_662cd_q;
	output wire [0:0] array_array_662cd_w;
	output wire [0:0] array_array_662cd_widx;
	output wire [31:0] array_array_662cd_d;
	output wire [0:0] fifo_pe_5_8_north_push_valid;
	output wire [7:0] fifo_pe_5_8_north_push_data;
	input wire [0:0] fifo_pe_5_8_north_push_ready;
	output wire [7:0] sink_68731_counter_delta;
	input wire [0:0] sink_68731_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1909;
	assign var_1909 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1911;
	assign var_1911 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1913;
	assign var_1913 = array_array_662cd_q[31:0];
	wire [15:0] var_1916;
	assign var_1916 = $signed(var_1909) * $signed(var_1911);
	wire [31:0] var_1919;
	assign var_1919 = {16'd0, var_1916};
	wire [31:0] var_1922;
	assign var_1922 = var_1919;
	wire [31:0] var_1924;
	assign var_1924 = $signed(var_1913) + $signed(var_1922);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_8]\t\tMac value: %d * %d + %d = %d", $time, var_1909, var_1911, var_1913, var_1924);
	assign sink_68731_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_8_north_push_valid = executed;
	assign fifo_pe_5_8_north_push_data = var_1911;
	assign fifo_sink_68731_west_push_valid = executed;
	assign fifo_sink_68731_west_push_data = var_1909;
	assign array_array_662cd_w = executed;
	assign array_array_662cd_d = var_1924;
	assign array_array_662cd_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_4 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_66911_q,
	array_array_66911_w,
	array_array_66911_widx,
	array_array_66911_d,
	fifo_pe_7_4_north_push_valid,
	fifo_pe_7_4_north_push_data,
	fifo_pe_7_4_north_push_ready,
	pe_6_5_counter_delta,
	pe_6_5_counter_delta_ready,
	fifo_pe_6_5_west_push_valid,
	fifo_pe_6_5_west_push_data,
	fifo_pe_6_5_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_66911_q;
	output wire [0:0] array_array_66911_w;
	output wire [0:0] array_array_66911_widx;
	output wire [31:0] array_array_66911_d;
	output wire [0:0] fifo_pe_7_4_north_push_valid;
	output wire [7:0] fifo_pe_7_4_north_push_data;
	input wire [0:0] fifo_pe_7_4_north_push_ready;
	output wire [7:0] pe_6_5_counter_delta;
	input wire [0:0] pe_6_5_counter_delta_ready;
	output wire [0:0] fifo_pe_6_5_west_push_valid;
	output wire [7:0] fifo_pe_6_5_west_push_data;
	input wire [0:0] fifo_pe_6_5_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2409;
	assign var_2409 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2411;
	assign var_2411 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2413;
	assign var_2413 = array_array_66911_q[31:0];
	wire [15:0] var_2416;
	assign var_2416 = $signed(var_2409) * $signed(var_2411);
	wire [31:0] var_2419;
	assign var_2419 = {16'd0, var_2416};
	wire [31:0] var_2422;
	assign var_2422 = var_2419;
	wire [31:0] var_2424;
	assign var_2424 = $signed(var_2413) + $signed(var_2422);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_4]\t\tMac value: %d * %d + %d = %d", $time, var_2409, var_2411, var_2413, var_2424);
	assign pe_6_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_6_5_west_push_valid = executed;
	assign fifo_pe_6_5_west_push_data = var_2409;
	assign fifo_pe_7_4_north_push_valid = executed;
	assign fifo_pe_7_4_north_push_data = var_2411;
	assign array_array_66911_w = executed;
	assign array_array_66911_d = var_2424;
	assign array_array_66911_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_2 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_2_north_push_valid,
	fifo_pe_1_2_north_push_data,
	fifo_pe_1_2_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_2_north_push_valid;
	output wire [7:0] fifo_pe_1_2_north_push_data;
	input wire [0:0] fifo_pe_1_2_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3358;
	assign var_3358 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_2]\t\tcol_Pusher_2 pushes %d", $time, var_3358);
	assign fifo_pe_1_2_north_push_valid = executed;
	assign fifo_pe_1_2_north_push_data = var_3358;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_2 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_2_1_west_push_valid,
	fifo_pe_2_1_west_push_data,
	fifo_pe_2_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_2_1_west_push_valid;
	output wire [7:0] fifo_pe_2_1_west_push_data;
	input wire [0:0] fifo_pe_2_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3348;
	assign var_3348 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_2]\t\trow_Pusher_2 pushes %d", $time, var_3348);
	assign fifo_pe_2_1_west_push_valid = executed;
	assign fifo_pe_2_1_west_push_data = var_3348;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_8 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_66cd5_q,
	array_array_66cd5_w,
	array_array_66cd5_widx,
	array_array_66cd5_d,
	fifo_sink_69e49_west_push_valid,
	fifo_sink_69e49_west_push_data,
	fifo_sink_69e49_west_push_ready,
	fifo_sink_69e91_north_push_valid,
	fifo_sink_69e91_north_push_data,
	fifo_sink_69e91_north_push_ready,
	sink_69e49_counter_delta,
	sink_69e49_counter_delta_ready,
	sink_69e91_counter_delta,
	sink_69e91_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_66cd5_q;
	output wire [0:0] array_array_66cd5_w;
	output wire [0:0] array_array_66cd5_widx;
	output wire [31:0] array_array_66cd5_d;
	output wire [0:0] fifo_sink_69e49_west_push_valid;
	output wire [7:0] fifo_sink_69e49_west_push_data;
	input wire [0:0] fifo_sink_69e49_west_push_ready;
	output wire [0:0] fifo_sink_69e91_north_push_valid;
	output wire [7:0] fifo_sink_69e91_north_push_data;
	input wire [0:0] fifo_sink_69e91_north_push_ready;
	output wire [7:0] sink_69e49_counter_delta;
	input wire [0:0] sink_69e49_counter_delta_ready;
	output wire [7:0] sink_69e91_counter_delta;
	input wire [0:0] sink_69e91_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3267;
	assign var_3267 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_3269;
	assign var_3269 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_3271;
	assign var_3271 = array_array_66cd5_q[31:0];
	wire [15:0] var_3274;
	assign var_3274 = $signed(var_3267) * $signed(var_3269);
	wire [31:0] var_3277;
	assign var_3277 = {16'd0, var_3274};
	wire [31:0] var_3280;
	assign var_3280 = var_3277;
	wire [31:0] var_3282;
	assign var_3282 = $signed(var_3271) + $signed(var_3280);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_8]\t\tMac value: %d * %d + %d = %d", $time, var_3267, var_3269, var_3271, var_3282);
	assign sink_69e91_counter_delta = (executed ? 1 : 0);
	assign sink_69e49_counter_delta = (executed ? 1 : 0);
	assign fifo_sink_69e91_north_push_valid = executed;
	assign fifo_sink_69e91_north_push_data = var_3269;
	assign fifo_sink_69e49_west_push_valid = executed;
	assign fifo_sink_69e49_west_push_data = var_3267;
	assign array_array_66cd5_w = executed;
	assign array_array_66cd5_d = var_3282;
	assign array_array_66cd5_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_686ed (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3496;
	assign var_3496 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_686ed]\t\tSink: %d", $time, var_3496);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_1 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_3_2_west_push_valid,
	fifo_pe_3_2_west_push_data,
	fifo_pe_3_2_west_push_ready,
	pe_3_2_counter_delta,
	pe_3_2_counter_delta_ready,
	pe_4_1_counter_delta,
	pe_4_1_counter_delta_ready,
	fifo_pe_4_1_north_push_valid,
	fifo_pe_4_1_north_push_data,
	fifo_pe_4_1_north_push_ready,
	array_array_66019_q,
	array_array_66019_w,
	array_array_66019_widx,
	array_array_66019_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_3_2_west_push_valid;
	output wire [7:0] fifo_pe_3_2_west_push_data;
	input wire [0:0] fifo_pe_3_2_west_push_ready;
	output wire [7:0] pe_3_2_counter_delta;
	input wire [0:0] pe_3_2_counter_delta_ready;
	output wire [7:0] pe_4_1_counter_delta;
	input wire [0:0] pe_4_1_counter_delta_ready;
	output wire [0:0] fifo_pe_4_1_north_push_valid;
	output wire [7:0] fifo_pe_4_1_north_push_data;
	input wire [0:0] fifo_pe_4_1_north_push_ready;
	input wire [31:0] array_array_66019_q;
	output wire [0:0] array_array_66019_w;
	output wire [0:0] array_array_66019_widx;
	output wire [31:0] array_array_66019_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1285;
	assign var_1285 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1287;
	assign var_1287 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1289;
	assign var_1289 = array_array_66019_q[31:0];
	wire [15:0] var_1292;
	assign var_1292 = $signed(var_1285) * $signed(var_1287);
	wire [31:0] var_1295;
	assign var_1295 = {16'd0, var_1292};
	wire [31:0] var_1298;
	assign var_1298 = var_1295;
	wire [31:0] var_1300;
	assign var_1300 = $signed(var_1289) + $signed(var_1298);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_1]\t\tMac value: %d * %d + %d = %d", $time, var_1285, var_1287, var_1289, var_1300);
	assign pe_3_2_counter_delta = (executed ? 1 : 0);
	assign pe_4_1_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_2_west_push_valid = executed;
	assign fifo_pe_3_2_west_push_data = var_1285;
	assign fifo_pe_4_1_north_push_valid = executed;
	assign fifo_pe_4_1_north_push_data = var_1287;
	assign array_array_66019_w = executed;
	assign array_array_66019_d = var_1300;
	assign array_array_66019_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_2 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_668b1_q,
	array_array_668b1_w,
	array_array_668b1_widx,
	array_array_668b1_d,
	fifo_pe_7_2_north_push_valid,
	fifo_pe_7_2_north_push_data,
	fifo_pe_7_2_north_push_ready,
	pe_6_3_counter_delta,
	pe_6_3_counter_delta_ready,
	fifo_pe_6_3_west_push_valid,
	fifo_pe_6_3_west_push_data,
	fifo_pe_6_3_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_668b1_q;
	output wire [0:0] array_array_668b1_w;
	output wire [0:0] array_array_668b1_widx;
	output wire [31:0] array_array_668b1_d;
	output wire [0:0] fifo_pe_7_2_north_push_valid;
	output wire [7:0] fifo_pe_7_2_north_push_data;
	input wire [0:0] fifo_pe_7_2_north_push_ready;
	output wire [7:0] pe_6_3_counter_delta;
	input wire [0:0] pe_6_3_counter_delta_ready;
	output wire [0:0] fifo_pe_6_3_west_push_valid;
	output wire [7:0] fifo_pe_6_3_west_push_data;
	input wire [0:0] fifo_pe_6_3_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2327;
	assign var_2327 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2329;
	assign var_2329 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2331;
	assign var_2331 = array_array_668b1_q[31:0];
	wire [15:0] var_2334;
	assign var_2334 = $signed(var_2327) * $signed(var_2329);
	wire [31:0] var_2337;
	assign var_2337 = {16'd0, var_2334};
	wire [31:0] var_2340;
	assign var_2340 = var_2337;
	wire [31:0] var_2342;
	assign var_2342 = $signed(var_2331) + $signed(var_2340);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_2]\t\tMac value: %d * %d + %d = %d", $time, var_2327, var_2329, var_2331, var_2342);
	assign pe_6_3_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_6_3_west_push_valid = executed;
	assign fifo_pe_6_3_west_push_data = var_2327;
	assign fifo_pe_7_2_north_push_valid = executed;
	assign fifo_pe_7_2_north_push_data = var_2329;
	assign array_array_668b1_w = executed;
	assign array_array_668b1_d = var_2342;
	assign array_array_668b1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_7 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_7_1_west_push_valid,
	fifo_pe_7_1_west_push_data,
	fifo_pe_7_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_7_1_west_push_valid;
	output wire [7:0] fifo_pe_7_1_west_push_data;
	input wire [0:0] fifo_pe_7_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3508;
	assign var_3508 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_7]\t\trow_Pusher_7 pushes %d", $time, var_3508);
	assign fifo_pe_7_1_west_push_valid = executed;
	assign fifo_pe_7_1_west_push_data = var_3508;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_7 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_1_8_west_push_valid,
	fifo_pe_1_8_west_push_data,
	fifo_pe_1_8_west_push_ready,
	fifo_pe_2_7_north_push_valid,
	fifo_pe_2_7_north_push_data,
	fifo_pe_2_7_north_push_ready,
	array_array_6565d_q,
	array_array_6565d_w,
	array_array_6565d_widx,
	array_array_6565d_d,
	pe_1_8_counter_delta,
	pe_1_8_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_1_8_west_push_valid;
	output wire [7:0] fifo_pe_1_8_west_push_data;
	input wire [0:0] fifo_pe_1_8_west_push_ready;
	output wire [0:0] fifo_pe_2_7_north_push_valid;
	output wire [7:0] fifo_pe_2_7_north_push_data;
	input wire [0:0] fifo_pe_2_7_north_push_ready;
	input wire [31:0] array_array_6565d_q;
	output wire [0:0] array_array_6565d_w;
	output wire [0:0] array_array_6565d_widx;
	output wire [31:0] array_array_6565d_d;
	output wire [7:0] pe_1_8_counter_delta;
	input wire [0:0] pe_1_8_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_873;
	assign var_873 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_875;
	assign var_875 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_877;
	assign var_877 = array_array_6565d_q[31:0];
	wire [15:0] var_880;
	assign var_880 = $signed(var_873) * $signed(var_875);
	wire [31:0] var_883;
	assign var_883 = {16'd0, var_880};
	wire [31:0] var_886;
	assign var_886 = var_883;
	wire [31:0] var_888;
	assign var_888 = $signed(var_877) + $signed(var_886);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_7]\t\tMac value: %d * %d + %d = %d", $time, var_873, var_875, var_877, var_888);
	assign pe_1_8_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_7_north_push_valid = executed;
	assign fifo_pe_2_7_north_push_data = var_875;
	assign fifo_pe_1_8_west_push_valid = executed;
	assign fifo_pe_1_8_west_push_data = var_873;
	assign array_array_6565d_w = executed;
	assign array_array_6565d_d = var_888;
	assign array_array_6565d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_2 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	pe_2_3_counter_delta,
	pe_2_3_counter_delta_ready,
	fifo_pe_2_3_west_push_valid,
	fifo_pe_2_3_west_push_data,
	fifo_pe_2_3_west_push_ready,
	fifo_pe_3_2_north_push_valid,
	fifo_pe_3_2_north_push_data,
	fifo_pe_3_2_north_push_ready,
	array_array_656dd_q,
	array_array_656dd_w,
	array_array_656dd_widx,
	array_array_656dd_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [7:0] pe_2_3_counter_delta;
	input wire [0:0] pe_2_3_counter_delta_ready;
	output wire [0:0] fifo_pe_2_3_west_push_valid;
	output wire [7:0] fifo_pe_2_3_west_push_data;
	input wire [0:0] fifo_pe_2_3_west_push_ready;
	output wire [0:0] fifo_pe_3_2_north_push_valid;
	output wire [7:0] fifo_pe_3_2_north_push_data;
	input wire [0:0] fifo_pe_3_2_north_push_ready;
	input wire [31:0] array_array_656dd_q;
	output wire [0:0] array_array_656dd_w;
	output wire [0:0] array_array_656dd_widx;
	output wire [31:0] array_array_656dd_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_999;
	assign var_999 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1001;
	assign var_1001 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1003;
	assign var_1003 = array_array_656dd_q[31:0];
	wire [15:0] var_1006;
	assign var_1006 = $signed(var_999) * $signed(var_1001);
	wire [31:0] var_1009;
	assign var_1009 = {16'd0, var_1006};
	wire [31:0] var_1012;
	assign var_1012 = var_1009;
	wire [31:0] var_1014;
	assign var_1014 = $signed(var_1003) + $signed(var_1012);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_2]\t\tMac value: %d * %d + %d = %d", $time, var_999, var_1001, var_1003, var_1014);
	assign pe_2_3_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_3_west_push_valid = executed;
	assign fifo_pe_2_3_west_push_data = var_999;
	assign fifo_pe_3_2_north_push_valid = executed;
	assign fifo_pe_3_2_north_push_data = var_1001;
	assign array_array_656dd_w = executed;
	assign array_array_656dd_d = var_1014;
	assign array_array_656dd_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module testbench (
	clk,
	rst_n,
	fifo_col_pusher_3_data_push_valid,
	fifo_col_pusher_3_data_push_data,
	fifo_col_pusher_3_data_push_ready,
	fifo_row_pusher_3_data_push_valid,
	fifo_row_pusher_3_data_push_data,
	fifo_row_pusher_3_data_push_ready,
	row_pusher_3_counter_delta,
	row_pusher_3_counter_delta_ready,
	col_pusher_7_counter_delta,
	col_pusher_7_counter_delta_ready,
	col_pusher_2_counter_delta,
	col_pusher_2_counter_delta_ready,
	fifo_col_pusher_8_data_push_valid,
	fifo_col_pusher_8_data_push_data,
	fifo_col_pusher_8_data_push_ready,
	fifo_row_pusher_1_data_push_valid,
	fifo_row_pusher_1_data_push_data,
	fifo_row_pusher_1_data_push_ready,
	fifo_col_pusher_2_data_push_valid,
	fifo_col_pusher_2_data_push_data,
	fifo_col_pusher_2_data_push_ready,
	fifo_col_pusher_4_data_push_valid,
	fifo_col_pusher_4_data_push_data,
	fifo_col_pusher_4_data_push_ready,
	fifo_row_pusher_8_data_push_valid,
	fifo_row_pusher_8_data_push_data,
	fifo_row_pusher_8_data_push_ready,
	fifo_col_pusher_5_data_push_valid,
	fifo_col_pusher_5_data_push_data,
	fifo_col_pusher_5_data_push_ready,
	row_pusher_5_counter_delta,
	row_pusher_5_counter_delta_ready,
	row_pusher_2_counter_delta,
	row_pusher_2_counter_delta_ready,
	fifo_row_pusher_6_data_push_valid,
	fifo_row_pusher_6_data_push_data,
	fifo_row_pusher_6_data_push_ready,
	col_pusher_1_counter_delta,
	col_pusher_1_counter_delta_ready,
	fifo_col_pusher_7_data_push_valid,
	fifo_col_pusher_7_data_push_data,
	fifo_col_pusher_7_data_push_ready,
	col_pusher_5_counter_delta,
	col_pusher_5_counter_delta_ready,
	row_pusher_6_counter_delta,
	row_pusher_6_counter_delta_ready,
	row_pusher_8_counter_delta,
	row_pusher_8_counter_delta_ready,
	col_pusher_8_counter_delta,
	col_pusher_8_counter_delta_ready,
	row_pusher_1_counter_delta,
	row_pusher_1_counter_delta_ready,
	fifo_row_pusher_4_data_push_valid,
	fifo_row_pusher_4_data_push_data,
	fifo_row_pusher_4_data_push_ready,
	row_pusher_7_counter_delta,
	row_pusher_7_counter_delta_ready,
	fifo_row_pusher_5_data_push_valid,
	fifo_row_pusher_5_data_push_data,
	fifo_row_pusher_5_data_push_ready,
	fifo_col_pusher_6_data_push_valid,
	fifo_col_pusher_6_data_push_data,
	fifo_col_pusher_6_data_push_ready,
	col_pusher_3_counter_delta,
	col_pusher_3_counter_delta_ready,
	fifo_row_pusher_2_data_push_valid,
	fifo_row_pusher_2_data_push_data,
	fifo_row_pusher_2_data_push_ready,
	row_pusher_4_counter_delta,
	row_pusher_4_counter_delta_ready,
	fifo_col_pusher_1_data_push_valid,
	fifo_col_pusher_1_data_push_data,
	fifo_col_pusher_1_data_push_ready,
	fifo_row_pusher_7_data_push_valid,
	fifo_row_pusher_7_data_push_data,
	fifo_row_pusher_7_data_push_ready,
	col_pusher_4_counter_delta,
	col_pusher_4_counter_delta_ready,
	col_pusher_6_counter_delta,
	col_pusher_6_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] fifo_col_pusher_3_data_push_valid;
	output wire [7:0] fifo_col_pusher_3_data_push_data;
	input wire [0:0] fifo_col_pusher_3_data_push_ready;
	output wire [0:0] fifo_row_pusher_3_data_push_valid;
	output wire [7:0] fifo_row_pusher_3_data_push_data;
	input wire [0:0] fifo_row_pusher_3_data_push_ready;
	output wire [7:0] row_pusher_3_counter_delta;
	input wire [0:0] row_pusher_3_counter_delta_ready;
	output wire [7:0] col_pusher_7_counter_delta;
	input wire [0:0] col_pusher_7_counter_delta_ready;
	output wire [7:0] col_pusher_2_counter_delta;
	input wire [0:0] col_pusher_2_counter_delta_ready;
	output wire [0:0] fifo_col_pusher_8_data_push_valid;
	output wire [7:0] fifo_col_pusher_8_data_push_data;
	input wire [0:0] fifo_col_pusher_8_data_push_ready;
	output wire [0:0] fifo_row_pusher_1_data_push_valid;
	output wire [7:0] fifo_row_pusher_1_data_push_data;
	input wire [0:0] fifo_row_pusher_1_data_push_ready;
	output wire [0:0] fifo_col_pusher_2_data_push_valid;
	output wire [7:0] fifo_col_pusher_2_data_push_data;
	input wire [0:0] fifo_col_pusher_2_data_push_ready;
	output wire [0:0] fifo_col_pusher_4_data_push_valid;
	output wire [7:0] fifo_col_pusher_4_data_push_data;
	input wire [0:0] fifo_col_pusher_4_data_push_ready;
	output wire [0:0] fifo_row_pusher_8_data_push_valid;
	output wire [7:0] fifo_row_pusher_8_data_push_data;
	input wire [0:0] fifo_row_pusher_8_data_push_ready;
	output wire [0:0] fifo_col_pusher_5_data_push_valid;
	output wire [7:0] fifo_col_pusher_5_data_push_data;
	input wire [0:0] fifo_col_pusher_5_data_push_ready;
	output wire [7:0] row_pusher_5_counter_delta;
	input wire [0:0] row_pusher_5_counter_delta_ready;
	output wire [7:0] row_pusher_2_counter_delta;
	input wire [0:0] row_pusher_2_counter_delta_ready;
	output wire [0:0] fifo_row_pusher_6_data_push_valid;
	output wire [7:0] fifo_row_pusher_6_data_push_data;
	input wire [0:0] fifo_row_pusher_6_data_push_ready;
	output wire [7:0] col_pusher_1_counter_delta;
	input wire [0:0] col_pusher_1_counter_delta_ready;
	output wire [0:0] fifo_col_pusher_7_data_push_valid;
	output wire [7:0] fifo_col_pusher_7_data_push_data;
	input wire [0:0] fifo_col_pusher_7_data_push_ready;
	output wire [7:0] col_pusher_5_counter_delta;
	input wire [0:0] col_pusher_5_counter_delta_ready;
	output wire [7:0] row_pusher_6_counter_delta;
	input wire [0:0] row_pusher_6_counter_delta_ready;
	output wire [7:0] row_pusher_8_counter_delta;
	input wire [0:0] row_pusher_8_counter_delta_ready;
	output wire [7:0] col_pusher_8_counter_delta;
	input wire [0:0] col_pusher_8_counter_delta_ready;
	output wire [7:0] row_pusher_1_counter_delta;
	input wire [0:0] row_pusher_1_counter_delta_ready;
	output wire [0:0] fifo_row_pusher_4_data_push_valid;
	output wire [7:0] fifo_row_pusher_4_data_push_data;
	input wire [0:0] fifo_row_pusher_4_data_push_ready;
	output wire [7:0] row_pusher_7_counter_delta;
	input wire [0:0] row_pusher_7_counter_delta_ready;
	output wire [0:0] fifo_row_pusher_5_data_push_valid;
	output wire [7:0] fifo_row_pusher_5_data_push_data;
	input wire [0:0] fifo_row_pusher_5_data_push_ready;
	output wire [0:0] fifo_col_pusher_6_data_push_valid;
	output wire [7:0] fifo_col_pusher_6_data_push_data;
	input wire [0:0] fifo_col_pusher_6_data_push_ready;
	output wire [7:0] col_pusher_3_counter_delta;
	input wire [0:0] col_pusher_3_counter_delta_ready;
	output wire [0:0] fifo_row_pusher_2_data_push_valid;
	output wire [7:0] fifo_row_pusher_2_data_push_data;
	input wire [0:0] fifo_row_pusher_2_data_push_ready;
	output wire [7:0] row_pusher_4_counter_delta;
	input wire [0:0] row_pusher_4_counter_delta_ready;
	output wire [0:0] fifo_col_pusher_1_data_push_valid;
	output wire [7:0] fifo_col_pusher_1_data_push_data;
	input wire [0:0] fifo_col_pusher_1_data_push_ready;
	output wire [0:0] fifo_row_pusher_7_data_push_valid;
	output wire [7:0] fifo_row_pusher_7_data_push_data;
	input wire [0:0] fifo_row_pusher_7_data_push_ready;
	output wire [7:0] col_pusher_4_counter_delta;
	input wire [0:0] col_pusher_4_counter_delta_ready;
	output wire [7:0] col_pusher_6_counter_delta;
	input wire [0:0] col_pusher_6_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	reg signed [31:0] cycle_cnt;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			cycle_cnt <= 0;
		else if (executed)
			cycle_cnt <= cycle_cnt + 1;
	assign col_pusher_7_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 7)} + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)}) + {7'b0000000, |(cycle_cnt == 13)}) + {7'b0000000, |(cycle_cnt == 14)} : 0);
	assign row_pusher_7_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 7)} + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)}) + {7'b0000000, |(cycle_cnt == 13)}) + {7'b0000000, |(cycle_cnt == 14)} : 0);
	assign row_pusher_1_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 1)} + {7'b0000000, |(cycle_cnt == 2)}) + {7'b0000000, |(cycle_cnt == 3)}) + {7'b0000000, |(cycle_cnt == 4)}) + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)} : 0);
	assign col_pusher_3_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 3)} + {7'b0000000, |(cycle_cnt == 4)}) + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)} : 0);
	assign row_pusher_5_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 5)} + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)} : 0);
	assign row_pusher_8_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 8)} + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)}) + {7'b0000000, |(cycle_cnt == 13)}) + {7'b0000000, |(cycle_cnt == 14)}) + {7'b0000000, |(cycle_cnt == 15)} : 0);
	assign col_pusher_1_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 1)} + {7'b0000000, |(cycle_cnt == 2)}) + {7'b0000000, |(cycle_cnt == 3)}) + {7'b0000000, |(cycle_cnt == 4)}) + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)} : 0);
	assign row_pusher_4_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 4)} + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)} : 0);
	assign row_pusher_3_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 3)} + {7'b0000000, |(cycle_cnt == 4)}) + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)} : 0);
	assign col_pusher_6_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 6)} + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)}) + {7'b0000000, |(cycle_cnt == 13)} : 0);
	assign col_pusher_4_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 4)} + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)} : 0);
	assign col_pusher_8_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 8)} + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)}) + {7'b0000000, |(cycle_cnt == 13)}) + {7'b0000000, |(cycle_cnt == 14)}) + {7'b0000000, |(cycle_cnt == 15)} : 0);
	assign col_pusher_5_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 5)} + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)} : 0);
	assign col_pusher_2_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 2)} + {7'b0000000, |(cycle_cnt == 3)}) + {7'b0000000, |(cycle_cnt == 4)}) + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)} : 0);
	assign row_pusher_2_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 2)} + {7'b0000000, |(cycle_cnt == 3)}) + {7'b0000000, |(cycle_cnt == 4)}) + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 6)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)} : 0);
	assign row_pusher_6_counter_delta = (executed ? (((((({7'b0000000, |(cycle_cnt == 6)} + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 8)}) + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 10)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 12)}) + {7'b0000000, |(cycle_cnt == 13)} : 0);
	assign fifo_row_pusher_3_data_push_valid = executed && ((((((((cycle_cnt == 3) || (cycle_cnt == 4)) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10));
	assign fifo_row_pusher_3_data_push_data = ((((((({8 {cycle_cnt == 3}} & 16) | ({8 {cycle_cnt == 4}} & 17)) | ({8 {cycle_cnt == 5}} & 18)) | ({8 {cycle_cnt == 6}} & 19)) | ({8 {cycle_cnt == 7}} & 20)) | ({8 {cycle_cnt == 8}} & 21)) | ({8 {cycle_cnt == 9}} & 22)) | ({8 {cycle_cnt == 10}} & 23);
	assign fifo_col_pusher_2_data_push_valid = executed && ((((((((cycle_cnt == 2) || (cycle_cnt == 3)) || (cycle_cnt == 4)) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9));
	assign fifo_col_pusher_2_data_push_data = ((((((({8 {cycle_cnt == 2}} & 8) | ({8 {cycle_cnt == 3}} & 9)) | ({8 {cycle_cnt == 4}} & 10)) | ({8 {cycle_cnt == 5}} & 11)) | ({8 {cycle_cnt == 6}} & 12)) | ({8 {cycle_cnt == 7}} & 13)) | ({8 {cycle_cnt == 8}} & 14)) | ({8 {cycle_cnt == 9}} & 15);
	assign fifo_row_pusher_4_data_push_valid = executed && ((((((((cycle_cnt == 4) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11));
	assign fifo_row_pusher_4_data_push_data = ((((((({8 {cycle_cnt == 4}} & 24) | ({8 {cycle_cnt == 5}} & 25)) | ({8 {cycle_cnt == 6}} & 26)) | ({8 {cycle_cnt == 7}} & 27)) | ({8 {cycle_cnt == 8}} & 28)) | ({8 {cycle_cnt == 9}} & 29)) | ({8 {cycle_cnt == 10}} & 30)) | ({8 {cycle_cnt == 11}} & 31);
	assign fifo_col_pusher_7_data_push_valid = executed && ((((((((cycle_cnt == 7) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12)) || (cycle_cnt == 13)) || (cycle_cnt == 14));
	assign fifo_col_pusher_7_data_push_data = ((((((({8 {cycle_cnt == 7}} & 48) | ({8 {cycle_cnt == 8}} & 49)) | ({8 {cycle_cnt == 9}} & 50)) | ({8 {cycle_cnt == 10}} & 51)) | ({8 {cycle_cnt == 11}} & 52)) | ({8 {cycle_cnt == 12}} & 53)) | ({8 {cycle_cnt == 13}} & 54)) | ({8 {cycle_cnt == 14}} & 55);
	assign fifo_row_pusher_6_data_push_valid = executed && ((((((((cycle_cnt == 6) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12)) || (cycle_cnt == 13));
	assign fifo_row_pusher_6_data_push_data = ((((((({8 {cycle_cnt == 6}} & 40) | ({8 {cycle_cnt == 7}} & 41)) | ({8 {cycle_cnt == 8}} & 42)) | ({8 {cycle_cnt == 9}} & 43)) | ({8 {cycle_cnt == 10}} & 44)) | ({8 {cycle_cnt == 11}} & 45)) | ({8 {cycle_cnt == 12}} & 46)) | ({8 {cycle_cnt == 13}} & 47);
	assign fifo_row_pusher_2_data_push_valid = executed && ((((((((cycle_cnt == 2) || (cycle_cnt == 3)) || (cycle_cnt == 4)) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9));
	assign fifo_row_pusher_2_data_push_data = ((((((({8 {cycle_cnt == 2}} & 8) | ({8 {cycle_cnt == 3}} & 9)) | ({8 {cycle_cnt == 4}} & 10)) | ({8 {cycle_cnt == 5}} & 11)) | ({8 {cycle_cnt == 6}} & 12)) | ({8 {cycle_cnt == 7}} & 13)) | ({8 {cycle_cnt == 8}} & 14)) | ({8 {cycle_cnt == 9}} & 15);
	assign fifo_row_pusher_7_data_push_valid = executed && ((((((((cycle_cnt == 7) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12)) || (cycle_cnt == 13)) || (cycle_cnt == 14));
	assign fifo_row_pusher_7_data_push_data = ((((((({8 {cycle_cnt == 7}} & 48) | ({8 {cycle_cnt == 8}} & 49)) | ({8 {cycle_cnt == 9}} & 50)) | ({8 {cycle_cnt == 10}} & 51)) | ({8 {cycle_cnt == 11}} & 52)) | ({8 {cycle_cnt == 12}} & 53)) | ({8 {cycle_cnt == 13}} & 54)) | ({8 {cycle_cnt == 14}} & 55);
	assign fifo_col_pusher_8_data_push_valid = executed && ((((((((cycle_cnt == 8) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12)) || (cycle_cnt == 13)) || (cycle_cnt == 14)) || (cycle_cnt == 15));
	assign fifo_col_pusher_8_data_push_data = ((((((({8 {cycle_cnt == 8}} & 56) | ({8 {cycle_cnt == 9}} & 57)) | ({8 {cycle_cnt == 10}} & 58)) | ({8 {cycle_cnt == 11}} & 59)) | ({8 {cycle_cnt == 12}} & 60)) | ({8 {cycle_cnt == 13}} & 61)) | ({8 {cycle_cnt == 14}} & 62)) | ({8 {cycle_cnt == 15}} & 63);
	assign fifo_col_pusher_3_data_push_valid = executed && ((((((((cycle_cnt == 3) || (cycle_cnt == 4)) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10));
	assign fifo_col_pusher_3_data_push_data = ((((((({8 {cycle_cnt == 3}} & 16) | ({8 {cycle_cnt == 4}} & 17)) | ({8 {cycle_cnt == 5}} & 18)) | ({8 {cycle_cnt == 6}} & 19)) | ({8 {cycle_cnt == 7}} & 20)) | ({8 {cycle_cnt == 8}} & 21)) | ({8 {cycle_cnt == 9}} & 22)) | ({8 {cycle_cnt == 10}} & 23);
	assign fifo_col_pusher_1_data_push_valid = executed && ((((((((cycle_cnt == 1) || (cycle_cnt == 2)) || (cycle_cnt == 3)) || (cycle_cnt == 4)) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8));
	assign fifo_col_pusher_1_data_push_data = ((((((({8 {cycle_cnt == 1}} & 0) | ({8 {cycle_cnt == 2}} & 1)) | ({8 {cycle_cnt == 3}} & 2)) | ({8 {cycle_cnt == 4}} & 3)) | ({8 {cycle_cnt == 5}} & 4)) | ({8 {cycle_cnt == 6}} & 5)) | ({8 {cycle_cnt == 7}} & 6)) | ({8 {cycle_cnt == 8}} & 7);
	assign fifo_row_pusher_8_data_push_valid = executed && ((((((((cycle_cnt == 8) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12)) || (cycle_cnt == 13)) || (cycle_cnt == 14)) || (cycle_cnt == 15));
	assign fifo_row_pusher_8_data_push_data = ((((((({8 {cycle_cnt == 8}} & 56) | ({8 {cycle_cnt == 9}} & 57)) | ({8 {cycle_cnt == 10}} & 58)) | ({8 {cycle_cnt == 11}} & 59)) | ({8 {cycle_cnt == 12}} & 60)) | ({8 {cycle_cnt == 13}} & 61)) | ({8 {cycle_cnt == 14}} & 62)) | ({8 {cycle_cnt == 15}} & 63);
	assign fifo_row_pusher_5_data_push_valid = executed && ((((((((cycle_cnt == 5) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12));
	assign fifo_row_pusher_5_data_push_data = ((((((({8 {cycle_cnt == 5}} & 32) | ({8 {cycle_cnt == 6}} & 33)) | ({8 {cycle_cnt == 7}} & 34)) | ({8 {cycle_cnt == 8}} & 35)) | ({8 {cycle_cnt == 9}} & 36)) | ({8 {cycle_cnt == 10}} & 37)) | ({8 {cycle_cnt == 11}} & 38)) | ({8 {cycle_cnt == 12}} & 39);
	assign fifo_row_pusher_1_data_push_valid = executed && ((((((((cycle_cnt == 1) || (cycle_cnt == 2)) || (cycle_cnt == 3)) || (cycle_cnt == 4)) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8));
	assign fifo_row_pusher_1_data_push_data = ((((((({8 {cycle_cnt == 1}} & 0) | ({8 {cycle_cnt == 2}} & 1)) | ({8 {cycle_cnt == 3}} & 2)) | ({8 {cycle_cnt == 4}} & 3)) | ({8 {cycle_cnt == 5}} & 4)) | ({8 {cycle_cnt == 6}} & 5)) | ({8 {cycle_cnt == 7}} & 6)) | ({8 {cycle_cnt == 8}} & 7);
	assign fifo_col_pusher_6_data_push_valid = executed && ((((((((cycle_cnt == 6) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12)) || (cycle_cnt == 13));
	assign fifo_col_pusher_6_data_push_data = ((((((({8 {cycle_cnt == 6}} & 40) | ({8 {cycle_cnt == 7}} & 41)) | ({8 {cycle_cnt == 8}} & 42)) | ({8 {cycle_cnt == 9}} & 43)) | ({8 {cycle_cnt == 10}} & 44)) | ({8 {cycle_cnt == 11}} & 45)) | ({8 {cycle_cnt == 12}} & 46)) | ({8 {cycle_cnt == 13}} & 47);
	assign fifo_col_pusher_4_data_push_valid = executed && ((((((((cycle_cnt == 4) || (cycle_cnt == 5)) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11));
	assign fifo_col_pusher_4_data_push_data = ((((((({8 {cycle_cnt == 4}} & 24) | ({8 {cycle_cnt == 5}} & 25)) | ({8 {cycle_cnt == 6}} & 26)) | ({8 {cycle_cnt == 7}} & 27)) | ({8 {cycle_cnt == 8}} & 28)) | ({8 {cycle_cnt == 9}} & 29)) | ({8 {cycle_cnt == 10}} & 30)) | ({8 {cycle_cnt == 11}} & 31);
	assign fifo_col_pusher_5_data_push_valid = executed && ((((((((cycle_cnt == 5) || (cycle_cnt == 6)) || (cycle_cnt == 7)) || (cycle_cnt == 8)) || (cycle_cnt == 9)) || (cycle_cnt == 10)) || (cycle_cnt == 11)) || (cycle_cnt == 12));
	assign fifo_col_pusher_5_data_push_data = ((((((({8 {cycle_cnt == 5}} & 32) | ({8 {cycle_cnt == 6}} & 33)) | ({8 {cycle_cnt == 7}} & 34)) | ({8 {cycle_cnt == 8}} & 35)) | ({8 {cycle_cnt == 9}} & 36)) | ({8 {cycle_cnt == 10}} & 37)) | ({8 {cycle_cnt == 11}} & 38)) | ({8 {cycle_cnt == 12}} & 39);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_5_4 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_6638d_q,
	array_array_6638d_w,
	array_array_6638d_widx,
	array_array_6638d_d,
	fifo_pe_5_5_west_push_valid,
	fifo_pe_5_5_west_push_data,
	fifo_pe_5_5_west_push_ready,
	fifo_pe_6_4_north_push_valid,
	fifo_pe_6_4_north_push_data,
	fifo_pe_6_4_north_push_ready,
	pe_5_5_counter_delta,
	pe_5_5_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_6638d_q;
	output wire [0:0] array_array_6638d_w;
	output wire [0:0] array_array_6638d_widx;
	output wire [31:0] array_array_6638d_d;
	output wire [0:0] fifo_pe_5_5_west_push_valid;
	output wire [7:0] fifo_pe_5_5_west_push_data;
	input wire [0:0] fifo_pe_5_5_west_push_ready;
	output wire [0:0] fifo_pe_6_4_north_push_valid;
	output wire [7:0] fifo_pe_6_4_north_push_data;
	input wire [0:0] fifo_pe_6_4_north_push_ready;
	output wire [7:0] pe_5_5_counter_delta;
	input wire [0:0] pe_5_5_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2077;
	assign var_2077 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2079;
	assign var_2079 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2081;
	assign var_2081 = array_array_6638d_q[31:0];
	wire [15:0] var_2084;
	assign var_2084 = $signed(var_2077) * $signed(var_2079);
	wire [31:0] var_2087;
	assign var_2087 = {16'd0, var_2084};
	wire [31:0] var_2090;
	assign var_2090 = var_2087;
	wire [31:0] var_2092;
	assign var_2092 = $signed(var_2081) + $signed(var_2090);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_4]\t\tMac value: %d * %d + %d = %d", $time, var_2077, var_2079, var_2081, var_2092);
	assign pe_5_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_5_west_push_valid = executed;
	assign fifo_pe_5_5_west_push_data = var_2077;
	assign fifo_pe_6_4_north_push_valid = executed;
	assign fifo_pe_6_4_north_push_data = var_2079;
	assign array_array_6638d_w = executed;
	assign array_array_6638d_d = var_2092;
	assign array_array_6638d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_7 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_7_8_west_push_valid,
	fifo_pe_7_8_west_push_data,
	fifo_pe_7_8_west_push_ready,
	array_array_66b21_q,
	array_array_66b21_w,
	array_array_66b21_widx,
	array_array_66b21_d,
	pe_7_8_counter_delta,
	pe_7_8_counter_delta_ready,
	fifo_pe_8_7_north_push_valid,
	fifo_pe_8_7_north_push_data,
	fifo_pe_8_7_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_7_8_west_push_valid;
	output wire [7:0] fifo_pe_7_8_west_push_data;
	input wire [0:0] fifo_pe_7_8_west_push_ready;
	input wire [31:0] array_array_66b21_q;
	output wire [0:0] array_array_66b21_w;
	output wire [0:0] array_array_66b21_widx;
	output wire [31:0] array_array_66b21_d;
	output wire [7:0] pe_7_8_counter_delta;
	input wire [0:0] pe_7_8_counter_delta_ready;
	output wire [0:0] fifo_pe_8_7_north_push_valid;
	output wire [7:0] fifo_pe_8_7_north_push_data;
	input wire [0:0] fifo_pe_8_7_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2864;
	assign var_2864 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2866;
	assign var_2866 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2868;
	assign var_2868 = array_array_66b21_q[31:0];
	wire [15:0] var_2871;
	assign var_2871 = $signed(var_2864) * $signed(var_2866);
	wire [31:0] var_2874;
	assign var_2874 = {16'd0, var_2871};
	wire [31:0] var_2877;
	assign var_2877 = var_2874;
	wire [31:0] var_2879;
	assign var_2879 = $signed(var_2868) + $signed(var_2877);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_7]\t\tMac value: %d * %d + %d = %d", $time, var_2864, var_2866, var_2868, var_2879);
	assign pe_7_8_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_8_west_push_valid = executed;
	assign fifo_pe_7_8_west_push_data = var_2864;
	assign fifo_pe_8_7_north_push_valid = executed;
	assign fifo_pe_8_7_north_push_data = var_2866;
	assign array_array_66b21_w = executed;
	assign array_array_66b21_d = var_2879;
	assign array_array_66b21_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_68689 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3406;
	assign var_3406 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_68689]\t\tSink: %d", $time, var_3406);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_8 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_sink_68649_west_push_valid,
	fifo_sink_68649_west_push_data,
	fifo_sink_68649_west_push_ready,
	array_array_6614d_q,
	array_array_6614d_w,
	array_array_6614d_widx,
	array_array_6614d_d,
	sink_68649_counter_delta,
	sink_68649_counter_delta_ready,
	fifo_pe_4_8_north_push_valid,
	fifo_pe_4_8_north_push_data,
	fifo_pe_4_8_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_sink_68649_west_push_valid;
	output wire [7:0] fifo_sink_68649_west_push_data;
	input wire [0:0] fifo_sink_68649_west_push_ready;
	input wire [31:0] array_array_6614d_q;
	output wire [0:0] array_array_6614d_w;
	output wire [0:0] array_array_6614d_widx;
	output wire [31:0] array_array_6614d_d;
	output wire [7:0] sink_68649_counter_delta;
	input wire [0:0] sink_68649_counter_delta_ready;
	output wire [0:0] fifo_pe_4_8_north_push_valid;
	output wire [7:0] fifo_pe_4_8_north_push_data;
	input wire [0:0] fifo_pe_4_8_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1577;
	assign var_1577 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1579;
	assign var_1579 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1581;
	assign var_1581 = array_array_6614d_q[31:0];
	wire [15:0] var_1584;
	assign var_1584 = $signed(var_1577) * $signed(var_1579);
	wire [31:0] var_1587;
	assign var_1587 = {16'd0, var_1584};
	wire [31:0] var_1590;
	assign var_1590 = var_1587;
	wire [31:0] var_1592;
	assign var_1592 = $signed(var_1581) + $signed(var_1590);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_8]\t\tMac value: %d * %d + %d = %d", $time, var_1577, var_1579, var_1581, var_1592);
	assign sink_68649_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_4_8_north_push_valid = executed;
	assign fifo_pe_4_8_north_push_data = var_1579;
	assign fifo_sink_68649_west_push_valid = executed;
	assign fifo_sink_68649_west_push_data = var_1577;
	assign array_array_6614d_w = executed;
	assign array_array_6614d_d = var_1592;
	assign array_array_6614d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_1 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_3_1_north_push_valid,
	fifo_pe_3_1_north_push_data,
	fifo_pe_3_1_north_push_ready,
	pe_2_2_counter_delta,
	pe_2_2_counter_delta_ready,
	pe_3_1_counter_delta,
	pe_3_1_counter_delta_ready,
	fifo_pe_2_2_west_push_valid,
	fifo_pe_2_2_west_push_data,
	fifo_pe_2_2_west_push_ready,
	array_array_656b5_q,
	array_array_656b5_w,
	array_array_656b5_widx,
	array_array_656b5_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_3_1_north_push_valid;
	output wire [7:0] fifo_pe_3_1_north_push_data;
	input wire [0:0] fifo_pe_3_1_north_push_ready;
	output wire [7:0] pe_2_2_counter_delta;
	input wire [0:0] pe_2_2_counter_delta_ready;
	output wire [7:0] pe_3_1_counter_delta;
	input wire [0:0] pe_3_1_counter_delta_ready;
	output wire [0:0] fifo_pe_2_2_west_push_valid;
	output wire [7:0] fifo_pe_2_2_west_push_data;
	input wire [0:0] fifo_pe_2_2_west_push_ready;
	input wire [31:0] array_array_656b5_q;
	output wire [0:0] array_array_656b5_w;
	output wire [0:0] array_array_656b5_widx;
	output wire [31:0] array_array_656b5_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_953;
	assign var_953 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_955;
	assign var_955 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_957;
	assign var_957 = array_array_656b5_q[31:0];
	wire [15:0] var_960;
	assign var_960 = $signed(var_953) * $signed(var_955);
	wire [31:0] var_963;
	assign var_963 = {16'd0, var_960};
	wire [31:0] var_966;
	assign var_966 = var_963;
	wire [31:0] var_968;
	assign var_968 = $signed(var_957) + $signed(var_966);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_1]\t\tMac value: %d * %d + %d = %d", $time, var_953, var_955, var_957, var_968);
	assign pe_2_2_counter_delta = (executed ? 1 : 0);
	assign pe_3_1_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_2_west_push_valid = executed;
	assign fifo_pe_2_2_west_push_data = var_953;
	assign fifo_pe_3_1_north_push_valid = executed;
	assign fifo_pe_3_1_north_push_data = var_955;
	assign array_array_656b5_w = executed;
	assign array_array_656b5_d = var_968;
	assign array_array_656b5_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_8 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_8_8_north_push_valid,
	fifo_pe_8_8_north_push_data,
	fifo_pe_8_8_north_push_ready,
	array_array_66b51_q,
	array_array_66b51_w,
	array_array_66b51_widx,
	array_array_66b51_d,
	fifo_sink_69d89_west_push_valid,
	fifo_sink_69d89_west_push_data,
	fifo_sink_69d89_west_push_ready,
	sink_69d89_counter_delta,
	sink_69d89_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_8_8_north_push_valid;
	output wire [7:0] fifo_pe_8_8_north_push_data;
	input wire [0:0] fifo_pe_8_8_north_push_ready;
	input wire [31:0] array_array_66b51_q;
	output wire [0:0] array_array_66b51_w;
	output wire [0:0] array_array_66b51_widx;
	output wire [31:0] array_array_66b51_d;
	output wire [0:0] fifo_sink_69d89_west_push_valid;
	output wire [7:0] fifo_sink_69d89_west_push_data;
	input wire [0:0] fifo_sink_69d89_west_push_ready;
	output wire [7:0] sink_69d89_counter_delta;
	input wire [0:0] sink_69d89_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2905;
	assign var_2905 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2907;
	assign var_2907 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2909;
	assign var_2909 = array_array_66b51_q[31:0];
	wire [15:0] var_2912;
	assign var_2912 = $signed(var_2905) * $signed(var_2907);
	wire [31:0] var_2915;
	assign var_2915 = {16'd0, var_2912};
	wire [31:0] var_2918;
	assign var_2918 = var_2915;
	wire [31:0] var_2920;
	assign var_2920 = $signed(var_2909) + $signed(var_2918);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_8]\t\tMac value: %d * %d + %d = %d", $time, var_2905, var_2907, var_2909, var_2920);
	assign sink_69d89_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_8_8_north_push_valid = executed;
	assign fifo_pe_8_8_north_push_data = var_2907;
	assign fifo_sink_69d89_west_push_valid = executed;
	assign fifo_sink_69d89_west_push_data = var_2905;
	assign array_array_66b51_w = executed;
	assign array_array_66b51_d = var_2920;
	assign array_array_66b51_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_68731 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3432;
	assign var_3432 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_68731]\t\tSink: %d", $time, var_3432);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_7 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_7_north_push_valid,
	fifo_pe_1_7_north_push_data,
	fifo_pe_1_7_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_7_north_push_valid;
	output wire [7:0] fifo_pe_1_7_north_push_data;
	input wire [0:0] fifo_pe_1_7_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3518;
	assign var_3518 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_7]\t\tcol_Pusher_7 pushes %d", $time, var_3518);
	assign fifo_pe_1_7_north_push_valid = executed;
	assign fifo_pe_1_7_north_push_data = var_3518;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_5_8 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_sink_69c1d_west_push_valid,
	fifo_sink_69c1d_west_push_data,
	fifo_sink_69c1d_west_push_ready,
	array_array_66851_q,
	array_array_66851_w,
	array_array_66851_widx,
	array_array_66851_d,
	sink_69c1d_counter_delta,
	sink_69c1d_counter_delta_ready,
	fifo_pe_6_8_north_push_valid,
	fifo_pe_6_8_north_push_data,
	fifo_pe_6_8_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_sink_69c1d_west_push_valid;
	output wire [7:0] fifo_sink_69c1d_west_push_data;
	input wire [0:0] fifo_sink_69c1d_west_push_ready;
	input wire [31:0] array_array_66851_q;
	output wire [0:0] array_array_66851_w;
	output wire [0:0] array_array_66851_widx;
	output wire [31:0] array_array_66851_d;
	output wire [7:0] sink_69c1d_counter_delta;
	input wire [0:0] sink_69c1d_counter_delta_ready;
	output wire [0:0] fifo_pe_6_8_north_push_valid;
	output wire [7:0] fifo_pe_6_8_north_push_data;
	input wire [0:0] fifo_pe_6_8_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2241;
	assign var_2241 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2243;
	assign var_2243 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2245;
	assign var_2245 = array_array_66851_q[31:0];
	wire [15:0] var_2248;
	assign var_2248 = $signed(var_2241) * $signed(var_2243);
	wire [31:0] var_2251;
	assign var_2251 = {16'd0, var_2248};
	wire [31:0] var_2254;
	assign var_2254 = var_2251;
	wire [31:0] var_2256;
	assign var_2256 = $signed(var_2245) + $signed(var_2254);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_8]\t\tMac value: %d * %d + %d = %d", $time, var_2241, var_2243, var_2245, var_2256);
	assign sink_69c1d_counter_delta = (executed ? 1 : 0);
	assign fifo_sink_69c1d_west_push_valid = executed;
	assign fifo_sink_69c1d_west_push_data = var_2241;
	assign fifo_pe_6_8_north_push_valid = executed;
	assign fifo_pe_6_8_north_push_data = var_2243;
	assign array_array_66851_w = executed;
	assign array_array_66851_d = var_2256;
	assign array_array_66851_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_8 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_8_north_push_valid,
	fifo_pe_1_8_north_push_data,
	fifo_pe_1_8_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_8_north_push_valid;
	output wire [7:0] fifo_pe_1_8_north_push_data;
	input wire [0:0] fifo_pe_1_8_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3550;
	assign var_3550 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_8]\t\tcol_Pusher_8 pushes %d", $time, var_3550);
	assign fifo_pe_1_8_north_push_valid = executed;
	assign fifo_pe_1_8_north_push_data = var_3550;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_685a1 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3374;
	assign var_3374 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_685a1]\t\tSink: %d", $time, var_3374);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_1 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_8_2_west_push_valid,
	fifo_pe_8_2_west_push_data,
	fifo_pe_8_2_west_push_ready,
	fifo_sink_684d1_north_push_valid,
	fifo_sink_684d1_north_push_data,
	fifo_sink_684d1_north_push_ready,
	pe_8_2_counter_delta,
	pe_8_2_counter_delta_ready,
	sink_684d1_counter_delta,
	sink_684d1_counter_delta_ready,
	array_array_66b81_q,
	array_array_66b81_w,
	array_array_66b81_widx,
	array_array_66b81_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_8_2_west_push_valid;
	output wire [7:0] fifo_pe_8_2_west_push_data;
	input wire [0:0] fifo_pe_8_2_west_push_ready;
	output wire [0:0] fifo_sink_684d1_north_push_valid;
	output wire [7:0] fifo_sink_684d1_north_push_data;
	input wire [0:0] fifo_sink_684d1_north_push_ready;
	output wire [7:0] pe_8_2_counter_delta;
	input wire [0:0] pe_8_2_counter_delta_ready;
	output wire [7:0] sink_684d1_counter_delta;
	input wire [0:0] sink_684d1_counter_delta_ready;
	input wire [31:0] array_array_66b81_q;
	output wire [0:0] array_array_66b81_w;
	output wire [0:0] array_array_66b81_widx;
	output wire [31:0] array_array_66b81_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2945;
	assign var_2945 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2947;
	assign var_2947 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2949;
	assign var_2949 = array_array_66b81_q[31:0];
	wire [15:0] var_2952;
	assign var_2952 = $signed(var_2945) * $signed(var_2947);
	wire [31:0] var_2955;
	assign var_2955 = {16'd0, var_2952};
	wire [31:0] var_2958;
	assign var_2958 = var_2955;
	wire [31:0] var_2960;
	assign var_2960 = $signed(var_2949) + $signed(var_2958);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_1]\t\tMac value: %d * %d + %d = %d", $time, var_2945, var_2947, var_2949, var_2960);
	assign pe_8_2_counter_delta = (executed ? 1 : 0);
	assign sink_684d1_counter_delta = (executed ? 1 : 0);
	assign fifo_sink_684d1_north_push_valid = executed;
	assign fifo_sink_684d1_north_push_data = var_2947;
	assign fifo_pe_8_2_west_push_valid = executed;
	assign fifo_pe_8_2_west_push_data = var_2945;
	assign array_array_66b81_w = executed;
	assign array_array_66b81_d = var_2960;
	assign array_array_66b81_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_8 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_8_1_west_push_valid,
	fifo_pe_8_1_west_push_data,
	fifo_pe_8_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_8_1_west_push_valid;
	output wire [7:0] fifo_pe_8_1_west_push_data;
	input wire [0:0] fifo_pe_8_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3540;
	assign var_3540 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_8]\t\trow_Pusher_8 pushes %d", $time, var_3540);
	assign fifo_pe_8_1_west_push_valid = executed;
	assign fifo_pe_8_1_west_push_data = var_3540;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_68561 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3368;
	assign var_3368 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_68561]\t\tSink: %d", $time, var_3368);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_3 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_7_4_west_push_valid,
	fifo_pe_7_4_west_push_data,
	fifo_pe_7_4_west_push_ready,
	pe_7_4_counter_delta,
	pe_7_4_counter_delta_ready,
	fifo_pe_8_3_north_push_valid,
	fifo_pe_8_3_north_push_data,
	fifo_pe_8_3_north_push_ready,
	array_array_66a61_q,
	array_array_66a61_w,
	array_array_66a61_widx,
	array_array_66a61_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_7_4_west_push_valid;
	output wire [7:0] fifo_pe_7_4_west_push_data;
	input wire [0:0] fifo_pe_7_4_west_push_ready;
	output wire [7:0] pe_7_4_counter_delta;
	input wire [0:0] pe_7_4_counter_delta_ready;
	output wire [0:0] fifo_pe_8_3_north_push_valid;
	output wire [7:0] fifo_pe_8_3_north_push_data;
	input wire [0:0] fifo_pe_8_3_north_push_ready;
	input wire [31:0] array_array_66a61_q;
	output wire [0:0] array_array_66a61_w;
	output wire [0:0] array_array_66a61_widx;
	output wire [31:0] array_array_66a61_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2700;
	assign var_2700 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2702;
	assign var_2702 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2704;
	assign var_2704 = array_array_66a61_q[31:0];
	wire [15:0] var_2707;
	assign var_2707 = $signed(var_2700) * $signed(var_2702);
	wire [31:0] var_2710;
	assign var_2710 = {16'd0, var_2707};
	wire [31:0] var_2713;
	assign var_2713 = var_2710;
	wire [31:0] var_2715;
	assign var_2715 = $signed(var_2704) + $signed(var_2713);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_3]\t\tMac value: %d * %d + %d = %d", $time, var_2700, var_2702, var_2704, var_2715);
	assign pe_7_4_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_8_3_north_push_valid = executed;
	assign fifo_pe_8_3_north_push_data = var_2702;
	assign fifo_pe_7_4_west_push_valid = executed;
	assign fifo_pe_7_4_west_push_data = var_2700;
	assign array_array_66a61_w = executed;
	assign array_array_66a61_d = var_2715;
	assign array_array_66a61_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_6 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_4_6_north_push_valid,
	fifo_pe_4_6_north_push_data,
	fifo_pe_4_6_north_push_ready,
	pe_3_7_counter_delta,
	pe_3_7_counter_delta_ready,
	fifo_pe_3_7_west_push_valid,
	fifo_pe_3_7_west_push_data,
	fifo_pe_3_7_west_push_ready,
	array_array_660f5_q,
	array_array_660f5_w,
	array_array_660f5_widx,
	array_array_660f5_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_4_6_north_push_valid;
	output wire [7:0] fifo_pe_4_6_north_push_data;
	input wire [0:0] fifo_pe_4_6_north_push_ready;
	output wire [7:0] pe_3_7_counter_delta;
	input wire [0:0] pe_3_7_counter_delta_ready;
	output wire [0:0] fifo_pe_3_7_west_push_valid;
	output wire [7:0] fifo_pe_3_7_west_push_data;
	input wire [0:0] fifo_pe_3_7_west_push_ready;
	input wire [31:0] array_array_660f5_q;
	output wire [0:0] array_array_660f5_w;
	output wire [0:0] array_array_660f5_widx;
	output wire [31:0] array_array_660f5_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1495;
	assign var_1495 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1497;
	assign var_1497 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1499;
	assign var_1499 = array_array_660f5_q[31:0];
	wire [15:0] var_1502;
	assign var_1502 = $signed(var_1495) * $signed(var_1497);
	wire [31:0] var_1505;
	assign var_1505 = {16'd0, var_1502};
	wire [31:0] var_1508;
	assign var_1508 = var_1505;
	wire [31:0] var_1510;
	assign var_1510 = $signed(var_1499) + $signed(var_1508);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_6]\t\tMac value: %d * %d + %d = %d", $time, var_1495, var_1497, var_1499, var_1510);
	assign pe_3_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_7_west_push_valid = executed;
	assign fifo_pe_3_7_west_push_data = var_1495;
	assign fifo_pe_4_6_north_push_valid = executed;
	assign fifo_pe_4_6_north_push_data = var_1497;
	assign array_array_660f5_w = executed;
	assign array_array_660f5_d = var_1510;
	assign array_array_660f5_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_3 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_3_north_push_valid,
	fifo_pe_1_3_north_push_data,
	fifo_pe_1_3_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_3_north_push_valid;
	output wire [7:0] fifo_pe_1_3_north_push_data;
	input wire [0:0] fifo_pe_1_3_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3390;
	assign var_3390 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_3]\t\tcol_Pusher_3 pushes %d", $time, var_3390);
	assign fifo_pe_1_3_north_push_valid = executed;
	assign fifo_pe_1_3_north_push_data = var_3390;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_5 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_5_north_push_valid,
	fifo_pe_1_5_north_push_data,
	fifo_pe_1_5_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_5_north_push_valid;
	output wire [7:0] fifo_pe_1_5_north_push_data;
	input wire [0:0] fifo_pe_1_5_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3454;
	assign var_3454 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_5]\t\tcol_Pusher_5 pushes %d", $time, var_3454);
	assign fifo_pe_1_5_north_push_valid = executed;
	assign fifo_pe_1_5_north_push_data = var_3454;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_68445 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3336;
	assign var_3336 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_68445]\t\tSink: %d", $time, var_3336);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_4 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	pe_1_5_counter_delta,
	pe_1_5_counter_delta_ready,
	array_array_655d1_q,
	array_array_655d1_w,
	array_array_655d1_widx,
	array_array_655d1_d,
	fifo_pe_1_5_west_push_valid,
	fifo_pe_1_5_west_push_data,
	fifo_pe_1_5_west_push_ready,
	fifo_pe_2_4_north_push_valid,
	fifo_pe_2_4_north_push_data,
	fifo_pe_2_4_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [7:0] pe_1_5_counter_delta;
	input wire [0:0] pe_1_5_counter_delta_ready;
	input wire [31:0] array_array_655d1_q;
	output wire [0:0] array_array_655d1_w;
	output wire [0:0] array_array_655d1_widx;
	output wire [31:0] array_array_655d1_d;
	output wire [0:0] fifo_pe_1_5_west_push_valid;
	output wire [7:0] fifo_pe_1_5_west_push_data;
	input wire [0:0] fifo_pe_1_5_west_push_ready;
	output wire [0:0] fifo_pe_2_4_north_push_valid;
	output wire [7:0] fifo_pe_2_4_north_push_data;
	input wire [0:0] fifo_pe_2_4_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_753;
	assign var_753 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_755;
	assign var_755 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_757;
	assign var_757 = array_array_655d1_q[31:0];
	wire [15:0] var_760;
	assign var_760 = $signed(var_753) * $signed(var_755);
	wire [31:0] var_763;
	assign var_763 = {16'd0, var_760};
	wire [31:0] var_766;
	assign var_766 = var_763;
	wire [31:0] var_768;
	assign var_768 = $signed(var_757) + $signed(var_766);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_4]\t\tMac value: %d * %d + %d = %d", $time, var_753, var_755, var_757, var_768);
	assign pe_1_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_4_north_push_valid = executed;
	assign fifo_pe_2_4_north_push_data = var_755;
	assign fifo_pe_1_5_west_push_valid = executed;
	assign fifo_pe_1_5_west_push_data = var_753;
	assign array_array_655d1_w = executed;
	assign array_array_655d1_d = var_768;
	assign array_array_655d1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_69e91 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3566;
	assign var_3566 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_69e91]\t\tSink: %d", $time, var_3566);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_6 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	pe_2_7_counter_delta,
	pe_2_7_counter_delta_ready,
	fifo_pe_2_7_west_push_valid,
	fifo_pe_2_7_west_push_data,
	fifo_pe_2_7_west_push_ready,
	array_array_65791_q,
	array_array_65791_w,
	array_array_65791_widx,
	array_array_65791_d,
	fifo_pe_3_6_north_push_valid,
	fifo_pe_3_6_north_push_data,
	fifo_pe_3_6_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [7:0] pe_2_7_counter_delta;
	input wire [0:0] pe_2_7_counter_delta_ready;
	output wire [0:0] fifo_pe_2_7_west_push_valid;
	output wire [7:0] fifo_pe_2_7_west_push_data;
	input wire [0:0] fifo_pe_2_7_west_push_ready;
	input wire [31:0] array_array_65791_q;
	output wire [0:0] array_array_65791_w;
	output wire [0:0] array_array_65791_widx;
	output wire [31:0] array_array_65791_d;
	output wire [0:0] fifo_pe_3_6_north_push_valid;
	output wire [7:0] fifo_pe_3_6_north_push_data;
	input wire [0:0] fifo_pe_3_6_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1163;
	assign var_1163 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1165;
	assign var_1165 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1167;
	assign var_1167 = array_array_65791_q[31:0];
	wire [15:0] var_1170;
	assign var_1170 = $signed(var_1163) * $signed(var_1165);
	wire [31:0] var_1173;
	assign var_1173 = {16'd0, var_1170};
	wire [31:0] var_1176;
	assign var_1176 = var_1173;
	wire [31:0] var_1178;
	assign var_1178 = $signed(var_1167) + $signed(var_1176);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_6]\t\tMac value: %d * %d + %d = %d", $time, var_1163, var_1165, var_1167, var_1178);
	assign pe_2_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_7_west_push_valid = executed;
	assign fifo_pe_2_7_west_push_data = var_1163;
	assign fifo_pe_3_6_north_push_valid = executed;
	assign fifo_pe_3_6_north_push_data = var_1165;
	assign array_array_65791_w = executed;
	assign array_array_65791_d = var_1178;
	assign array_array_65791_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_2 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_2_2_north_push_valid,
	fifo_pe_2_2_north_push_data,
	fifo_pe_2_2_north_push_ready,
	fifo_pe_1_3_west_push_valid,
	fifo_pe_1_3_west_push_data,
	fifo_pe_1_3_west_push_ready,
	pe_1_3_counter_delta,
	pe_1_3_counter_delta_ready,
	array_array_65579_q,
	array_array_65579_w,
	array_array_65579_widx,
	array_array_65579_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_2_2_north_push_valid;
	output wire [7:0] fifo_pe_2_2_north_push_data;
	input wire [0:0] fifo_pe_2_2_north_push_ready;
	output wire [0:0] fifo_pe_1_3_west_push_valid;
	output wire [7:0] fifo_pe_1_3_west_push_data;
	input wire [0:0] fifo_pe_1_3_west_push_ready;
	output wire [7:0] pe_1_3_counter_delta;
	input wire [0:0] pe_1_3_counter_delta_ready;
	input wire [31:0] array_array_65579_q;
	output wire [0:0] array_array_65579_w;
	output wire [0:0] array_array_65579_widx;
	output wire [31:0] array_array_65579_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_673;
	assign var_673 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_675;
	assign var_675 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_677;
	assign var_677 = array_array_65579_q[31:0];
	wire [15:0] var_680;
	assign var_680 = $signed(var_673) * $signed(var_675);
	wire [31:0] var_683;
	assign var_683 = {16'd0, var_680};
	wire [31:0] var_686;
	assign var_686 = var_683;
	wire [31:0] var_688;
	assign var_688 = $signed(var_677) + $signed(var_686);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_2]\t\tMac value: %d * %d + %d = %d", $time, var_673, var_675, var_677, var_688);
	assign pe_1_3_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_1_3_west_push_valid = executed;
	assign fifo_pe_1_3_west_push_data = var_673;
	assign fifo_pe_2_2_north_push_valid = executed;
	assign fifo_pe_2_2_north_push_data = var_675;
	assign array_array_65579_w = executed;
	assign array_array_65579_d = var_688;
	assign array_array_65579_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_6 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	pe_4_7_counter_delta,
	pe_4_7_counter_delta_ready,
	fifo_pe_5_6_north_push_valid,
	fifo_pe_5_6_north_push_data,
	fifo_pe_5_6_north_push_ready,
	fifo_pe_4_7_west_push_valid,
	fifo_pe_4_7_west_push_data,
	fifo_pe_4_7_west_push_ready,
	array_array_6626d_q,
	array_array_6626d_w,
	array_array_6626d_widx,
	array_array_6626d_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [7:0] pe_4_7_counter_delta;
	input wire [0:0] pe_4_7_counter_delta_ready;
	output wire [0:0] fifo_pe_5_6_north_push_valid;
	output wire [7:0] fifo_pe_5_6_north_push_data;
	input wire [0:0] fifo_pe_5_6_north_push_ready;
	output wire [0:0] fifo_pe_4_7_west_push_valid;
	output wire [7:0] fifo_pe_4_7_west_push_data;
	input wire [0:0] fifo_pe_4_7_west_push_ready;
	input wire [31:0] array_array_6626d_q;
	output wire [0:0] array_array_6626d_w;
	output wire [0:0] array_array_6626d_widx;
	output wire [31:0] array_array_6626d_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1827;
	assign var_1827 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1829;
	assign var_1829 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1831;
	assign var_1831 = array_array_6626d_q[31:0];
	wire [15:0] var_1834;
	assign var_1834 = $signed(var_1827) * $signed(var_1829);
	wire [31:0] var_1837;
	assign var_1837 = {16'd0, var_1834};
	wire [31:0] var_1840;
	assign var_1840 = var_1837;
	wire [31:0] var_1842;
	assign var_1842 = $signed(var_1831) + $signed(var_1840);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_6]\t\tMac value: %d * %d + %d = %d", $time, var_1827, var_1829, var_1831, var_1842);
	assign pe_4_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_6_north_push_valid = executed;
	assign fifo_pe_5_6_north_push_data = var_1829;
	assign fifo_pe_4_7_west_push_valid = executed;
	assign fifo_pe_4_7_west_push_data = var_1827;
	assign array_array_6626d_w = executed;
	assign array_array_6626d_d = var_1842;
	assign array_array_6626d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_4 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_66a91_q,
	array_array_66a91_w,
	array_array_66a91_widx,
	array_array_66a91_d,
	pe_7_5_counter_delta,
	pe_7_5_counter_delta_ready,
	fifo_pe_7_5_west_push_valid,
	fifo_pe_7_5_west_push_data,
	fifo_pe_7_5_west_push_ready,
	fifo_pe_8_4_north_push_valid,
	fifo_pe_8_4_north_push_data,
	fifo_pe_8_4_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_66a91_q;
	output wire [0:0] array_array_66a91_w;
	output wire [0:0] array_array_66a91_widx;
	output wire [31:0] array_array_66a91_d;
	output wire [7:0] pe_7_5_counter_delta;
	input wire [0:0] pe_7_5_counter_delta_ready;
	output wire [0:0] fifo_pe_7_5_west_push_valid;
	output wire [7:0] fifo_pe_7_5_west_push_data;
	input wire [0:0] fifo_pe_7_5_west_push_ready;
	output wire [0:0] fifo_pe_8_4_north_push_valid;
	output wire [7:0] fifo_pe_8_4_north_push_data;
	input wire [0:0] fifo_pe_8_4_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2741;
	assign var_2741 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2743;
	assign var_2743 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2745;
	assign var_2745 = array_array_66a91_q[31:0];
	wire [15:0] var_2748;
	assign var_2748 = $signed(var_2741) * $signed(var_2743);
	wire [31:0] var_2751;
	assign var_2751 = {16'd0, var_2748};
	wire [31:0] var_2754;
	assign var_2754 = var_2751;
	wire [31:0] var_2756;
	assign var_2756 = $signed(var_2745) + $signed(var_2754);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_4]\t\tMac value: %d * %d + %d = %d", $time, var_2741, var_2743, var_2745, var_2756);
	assign pe_7_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_8_4_north_push_valid = executed;
	assign fifo_pe_8_4_north_push_data = var_2743;
	assign fifo_pe_7_5_west_push_valid = executed;
	assign fifo_pe_7_5_west_push_data = var_2741;
	assign array_array_66a91_w = executed;
	assign array_array_66a91_d = var_2756;
	assign array_array_66a91_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_8 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_669d1_q,
	array_array_669d1_w,
	array_array_669d1_widx,
	array_array_669d1_d,
	fifo_pe_7_8_north_push_valid,
	fifo_pe_7_8_north_push_data,
	fifo_pe_7_8_north_push_ready,
	sink_686ed_counter_delta,
	sink_686ed_counter_delta_ready,
	fifo_sink_686ed_west_push_valid,
	fifo_sink_686ed_west_push_data,
	fifo_sink_686ed_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_669d1_q;
	output wire [0:0] array_array_669d1_w;
	output wire [0:0] array_array_669d1_widx;
	output wire [31:0] array_array_669d1_d;
	output wire [0:0] fifo_pe_7_8_north_push_valid;
	output wire [7:0] fifo_pe_7_8_north_push_data;
	input wire [0:0] fifo_pe_7_8_north_push_ready;
	output wire [7:0] sink_686ed_counter_delta;
	input wire [0:0] sink_686ed_counter_delta_ready;
	output wire [0:0] fifo_sink_686ed_west_push_valid;
	output wire [7:0] fifo_sink_686ed_west_push_data;
	input wire [0:0] fifo_sink_686ed_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2573;
	assign var_2573 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2575;
	assign var_2575 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2577;
	assign var_2577 = array_array_669d1_q[31:0];
	wire [15:0] var_2580;
	assign var_2580 = $signed(var_2573) * $signed(var_2575);
	wire [31:0] var_2583;
	assign var_2583 = {16'd0, var_2580};
	wire [31:0] var_2586;
	assign var_2586 = var_2583;
	wire [31:0] var_2588;
	assign var_2588 = $signed(var_2577) + $signed(var_2586);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_8]\t\tMac value: %d * %d + %d = %d", $time, var_2573, var_2575, var_2577, var_2588);
	assign sink_686ed_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_8_north_push_valid = executed;
	assign fifo_pe_7_8_north_push_data = var_2575;
	assign fifo_sink_686ed_west_push_valid = executed;
	assign fifo_sink_686ed_west_push_data = var_2573;
	assign array_array_669d1_w = executed;
	assign array_array_669d1_d = var_2588;
	assign array_array_669d1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_69d89 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3528;
	assign var_3528 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_69d89]\t\tSink: %d", $time, var_3528);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_4_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_6623d_q,
	array_array_6623d_w,
	array_array_6623d_widx,
	array_array_6623d_d,
	fifo_pe_5_5_north_push_valid,
	fifo_pe_5_5_north_push_data,
	fifo_pe_5_5_north_push_ready,
	fifo_pe_4_6_west_push_valid,
	fifo_pe_4_6_west_push_data,
	fifo_pe_4_6_west_push_ready,
	pe_4_6_counter_delta,
	pe_4_6_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_6623d_q;
	output wire [0:0] array_array_6623d_w;
	output wire [0:0] array_array_6623d_widx;
	output wire [31:0] array_array_6623d_d;
	output wire [0:0] fifo_pe_5_5_north_push_valid;
	output wire [7:0] fifo_pe_5_5_north_push_data;
	input wire [0:0] fifo_pe_5_5_north_push_ready;
	output wire [0:0] fifo_pe_4_6_west_push_valid;
	output wire [7:0] fifo_pe_4_6_west_push_data;
	input wire [0:0] fifo_pe_4_6_west_push_ready;
	output wire [7:0] pe_4_6_counter_delta;
	input wire [0:0] pe_4_6_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1786;
	assign var_1786 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1788;
	assign var_1788 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1790;
	assign var_1790 = array_array_6623d_q[31:0];
	wire [15:0] var_1793;
	assign var_1793 = $signed(var_1786) * $signed(var_1788);
	wire [31:0] var_1796;
	assign var_1796 = {16'd0, var_1793};
	wire [31:0] var_1799;
	assign var_1799 = var_1796;
	wire [31:0] var_1801;
	assign var_1801 = $signed(var_1790) + $signed(var_1799);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_4_5]\t\tMac value: %d * %d + %d = %d", $time, var_1786, var_1788, var_1790, var_1801);
	assign pe_4_6_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_4_6_west_push_valid = executed;
	assign fifo_pe_4_6_west_push_data = var_1786;
	assign fifo_pe_5_5_north_push_valid = executed;
	assign fifo_pe_5_5_north_push_data = var_1788;
	assign array_array_6623d_w = executed;
	assign array_array_6623d_d = var_1801;
	assign array_array_6623d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_3 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_668e1_q,
	array_array_668e1_w,
	array_array_668e1_widx,
	array_array_668e1_d,
	fifo_pe_6_4_west_push_valid,
	fifo_pe_6_4_west_push_data,
	fifo_pe_6_4_west_push_ready,
	fifo_pe_7_3_north_push_valid,
	fifo_pe_7_3_north_push_data,
	fifo_pe_7_3_north_push_ready,
	pe_6_4_counter_delta,
	pe_6_4_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_668e1_q;
	output wire [0:0] array_array_668e1_w;
	output wire [0:0] array_array_668e1_widx;
	output wire [31:0] array_array_668e1_d;
	output wire [0:0] fifo_pe_6_4_west_push_valid;
	output wire [7:0] fifo_pe_6_4_west_push_data;
	input wire [0:0] fifo_pe_6_4_west_push_ready;
	output wire [0:0] fifo_pe_7_3_north_push_valid;
	output wire [7:0] fifo_pe_7_3_north_push_data;
	input wire [0:0] fifo_pe_7_3_north_push_ready;
	output wire [7:0] pe_6_4_counter_delta;
	input wire [0:0] pe_6_4_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2368;
	assign var_2368 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2370;
	assign var_2370 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2372;
	assign var_2372 = array_array_668e1_q[31:0];
	wire [15:0] var_2375;
	assign var_2375 = $signed(var_2368) * $signed(var_2370);
	wire [31:0] var_2378;
	assign var_2378 = {16'd0, var_2375};
	wire [31:0] var_2381;
	assign var_2381 = var_2378;
	wire [31:0] var_2383;
	assign var_2383 = $signed(var_2372) + $signed(var_2381);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_3]\t\tMac value: %d * %d + %d = %d", $time, var_2368, var_2370, var_2372, var_2383);
	assign pe_6_4_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_6_4_west_push_valid = executed;
	assign fifo_pe_6_4_west_push_data = var_2368;
	assign fifo_pe_7_3_north_push_valid = executed;
	assign fifo_pe_7_3_north_push_data = var_2370;
	assign array_array_668e1_w = executed;
	assign array_array_668e1_d = var_2383;
	assign array_array_668e1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_6 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_6_north_push_valid,
	fifo_pe_1_6_north_push_data,
	fifo_pe_1_6_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_6_north_push_valid;
	output wire [7:0] fifo_pe_1_6_north_push_data;
	input wire [0:0] fifo_pe_1_6_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3486;
	assign var_3486 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_6]\t\tcol_Pusher_6 pushes %d", $time, var_3486);
	assign fifo_pe_1_6_north_push_valid = executed;
	assign fifo_pe_1_6_north_push_data = var_3486;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_3 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	pe_1_4_counter_delta,
	pe_1_4_counter_delta_ready,
	fifo_pe_1_4_west_push_valid,
	fifo_pe_1_4_west_push_data,
	fifo_pe_1_4_west_push_ready,
	fifo_pe_2_3_north_push_valid,
	fifo_pe_2_3_north_push_data,
	fifo_pe_2_3_north_push_ready,
	array_array_655a5_q,
	array_array_655a5_w,
	array_array_655a5_widx,
	array_array_655a5_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [7:0] pe_1_4_counter_delta;
	input wire [0:0] pe_1_4_counter_delta_ready;
	output wire [0:0] fifo_pe_1_4_west_push_valid;
	output wire [7:0] fifo_pe_1_4_west_push_data;
	input wire [0:0] fifo_pe_1_4_west_push_ready;
	output wire [0:0] fifo_pe_2_3_north_push_valid;
	output wire [7:0] fifo_pe_2_3_north_push_data;
	input wire [0:0] fifo_pe_2_3_north_push_ready;
	input wire [31:0] array_array_655a5_q;
	output wire [0:0] array_array_655a5_w;
	output wire [0:0] array_array_655a5_widx;
	output wire [31:0] array_array_655a5_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_713;
	assign var_713 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_715;
	assign var_715 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_717;
	assign var_717 = array_array_655a5_q[31:0];
	wire [15:0] var_720;
	assign var_720 = $signed(var_713) * $signed(var_715);
	wire [31:0] var_723;
	assign var_723 = {16'd0, var_720};
	wire [31:0] var_726;
	assign var_726 = var_723;
	wire [31:0] var_728;
	assign var_728 = $signed(var_717) + $signed(var_726);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_3]\t\tMac value: %d * %d + %d = %d", $time, var_713, var_715, var_717, var_728);
	assign pe_1_4_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_3_north_push_valid = executed;
	assign fifo_pe_2_3_north_push_data = var_715;
	assign fifo_pe_1_4_west_push_valid = executed;
	assign fifo_pe_1_4_west_push_data = var_713;
	assign array_array_655a5_w = executed;
	assign array_array_655a5_d = var_728;
	assign array_array_655a5_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_3 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_3_1_west_push_valid,
	fifo_pe_3_1_west_push_data,
	fifo_pe_3_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_3_1_west_push_valid;
	output wire [7:0] fifo_pe_3_1_west_push_data;
	input wire [0:0] fifo_pe_3_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3380;
	assign var_3380 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_3]\t\trow_Pusher_3 pushes %d", $time, var_3380);
	assign fifo_pe_3_1_west_push_valid = executed;
	assign fifo_pe_3_1_west_push_data = var_3380;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_5_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_663bd_q,
	array_array_663bd_w,
	array_array_663bd_widx,
	array_array_663bd_d,
	fifo_pe_6_5_north_push_valid,
	fifo_pe_6_5_north_push_data,
	fifo_pe_6_5_north_push_ready,
	fifo_pe_5_6_west_push_valid,
	fifo_pe_5_6_west_push_data,
	fifo_pe_5_6_west_push_ready,
	pe_5_6_counter_delta,
	pe_5_6_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_663bd_q;
	output wire [0:0] array_array_663bd_w;
	output wire [0:0] array_array_663bd_widx;
	output wire [31:0] array_array_663bd_d;
	output wire [0:0] fifo_pe_6_5_north_push_valid;
	output wire [7:0] fifo_pe_6_5_north_push_data;
	input wire [0:0] fifo_pe_6_5_north_push_ready;
	output wire [0:0] fifo_pe_5_6_west_push_valid;
	output wire [7:0] fifo_pe_5_6_west_push_data;
	input wire [0:0] fifo_pe_5_6_west_push_ready;
	output wire [7:0] pe_5_6_counter_delta;
	input wire [0:0] pe_5_6_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2118;
	assign var_2118 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2120;
	assign var_2120 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2122;
	assign var_2122 = array_array_663bd_q[31:0];
	wire [15:0] var_2125;
	assign var_2125 = $signed(var_2118) * $signed(var_2120);
	wire [31:0] var_2128;
	assign var_2128 = {16'd0, var_2125};
	wire [31:0] var_2131;
	assign var_2131 = var_2128;
	wire [31:0] var_2133;
	assign var_2133 = $signed(var_2122) + $signed(var_2131);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_5]\t\tMac value: %d * %d + %d = %d", $time, var_2118, var_2120, var_2122, var_2133);
	assign pe_5_6_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_6_west_push_valid = executed;
	assign fifo_pe_5_6_west_push_data = var_2118;
	assign fifo_pe_6_5_north_push_valid = executed;
	assign fifo_pe_6_5_north_push_data = var_2120;
	assign array_array_663bd_w = executed;
	assign array_array_663bd_d = var_2133;
	assign array_array_663bd_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_7 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_7_7_north_push_valid,
	fifo_pe_7_7_north_push_data,
	fifo_pe_7_7_north_push_ready,
	pe_6_8_counter_delta,
	pe_6_8_counter_delta_ready,
	array_array_669a1_q,
	array_array_669a1_w,
	array_array_669a1_widx,
	array_array_669a1_d,
	fifo_pe_6_8_west_push_valid,
	fifo_pe_6_8_west_push_data,
	fifo_pe_6_8_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_7_7_north_push_valid;
	output wire [7:0] fifo_pe_7_7_north_push_data;
	input wire [0:0] fifo_pe_7_7_north_push_ready;
	output wire [7:0] pe_6_8_counter_delta;
	input wire [0:0] pe_6_8_counter_delta_ready;
	input wire [31:0] array_array_669a1_q;
	output wire [0:0] array_array_669a1_w;
	output wire [0:0] array_array_669a1_widx;
	output wire [31:0] array_array_669a1_d;
	output wire [0:0] fifo_pe_6_8_west_push_valid;
	output wire [7:0] fifo_pe_6_8_west_push_data;
	input wire [0:0] fifo_pe_6_8_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2532;
	assign var_2532 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2534;
	assign var_2534 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2536;
	assign var_2536 = array_array_669a1_q[31:0];
	wire [15:0] var_2539;
	assign var_2539 = $signed(var_2532) * $signed(var_2534);
	wire [31:0] var_2542;
	assign var_2542 = {16'd0, var_2539};
	wire [31:0] var_2545;
	assign var_2545 = var_2542;
	wire [31:0] var_2547;
	assign var_2547 = $signed(var_2536) + $signed(var_2545);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_7]\t\tMac value: %d * %d + %d = %d", $time, var_2532, var_2534, var_2536, var_2547);
	assign pe_6_8_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_7_north_push_valid = executed;
	assign fifo_pe_7_7_north_push_data = var_2534;
	assign fifo_pe_6_8_west_push_valid = executed;
	assign fifo_pe_6_8_west_push_data = var_2532;
	assign array_array_669a1_w = executed;
	assign array_array_669a1_d = var_2547;
	assign array_array_669a1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_68771 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3438;
	assign var_3438 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_68771]\t\tSink: %d", $time, var_3438);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_6 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_6_1_west_push_valid,
	fifo_pe_6_1_west_push_data,
	fifo_pe_6_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_6_1_west_push_valid;
	output wire [7:0] fifo_pe_6_1_west_push_data;
	input wire [0:0] fifo_pe_6_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3476;
	assign var_3476 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_6]\t\trow_Pusher_6 pushes %d", $time, var_3476);
	assign fifo_pe_6_1_west_push_valid = executed;
	assign fifo_pe_6_1_west_push_data = var_3476;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_66ac1_q,
	array_array_66ac1_w,
	array_array_66ac1_widx,
	array_array_66ac1_d,
	fifo_pe_7_6_west_push_valid,
	fifo_pe_7_6_west_push_data,
	fifo_pe_7_6_west_push_ready,
	fifo_pe_8_5_north_push_valid,
	fifo_pe_8_5_north_push_data,
	fifo_pe_8_5_north_push_ready,
	pe_7_6_counter_delta,
	pe_7_6_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_66ac1_q;
	output wire [0:0] array_array_66ac1_w;
	output wire [0:0] array_array_66ac1_widx;
	output wire [31:0] array_array_66ac1_d;
	output wire [0:0] fifo_pe_7_6_west_push_valid;
	output wire [7:0] fifo_pe_7_6_west_push_data;
	input wire [0:0] fifo_pe_7_6_west_push_ready;
	output wire [0:0] fifo_pe_8_5_north_push_valid;
	output wire [7:0] fifo_pe_8_5_north_push_data;
	input wire [0:0] fifo_pe_8_5_north_push_ready;
	output wire [7:0] pe_7_6_counter_delta;
	input wire [0:0] pe_7_6_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2782;
	assign var_2782 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2784;
	assign var_2784 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2786;
	assign var_2786 = array_array_66ac1_q[31:0];
	wire [15:0] var_2789;
	assign var_2789 = $signed(var_2782) * $signed(var_2784);
	wire [31:0] var_2792;
	assign var_2792 = {16'd0, var_2789};
	wire [31:0] var_2795;
	assign var_2795 = var_2792;
	wire [31:0] var_2797;
	assign var_2797 = $signed(var_2786) + $signed(var_2795);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_5]\t\tMac value: %d * %d + %d = %d", $time, var_2782, var_2784, var_2786, var_2797);
	assign pe_7_6_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_6_west_push_valid = executed;
	assign fifo_pe_7_6_west_push_data = var_2782;
	assign fifo_pe_8_5_north_push_valid = executed;
	assign fifo_pe_8_5_north_push_data = var_2784;
	assign array_array_66ac1_w = executed;
	assign array_array_66ac1_d = var_2797;
	assign array_array_66ac1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_3 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	pe_8_4_counter_delta,
	pe_8_4_counter_delta_ready,
	sink_68689_counter_delta,
	sink_68689_counter_delta_ready,
	fifo_sink_68689_north_push_valid,
	fifo_sink_68689_north_push_data,
	fifo_sink_68689_north_push_ready,
	array_array_66be1_q,
	array_array_66be1_w,
	array_array_66be1_widx,
	array_array_66be1_d,
	fifo_pe_8_4_west_push_valid,
	fifo_pe_8_4_west_push_data,
	fifo_pe_8_4_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [7:0] pe_8_4_counter_delta;
	input wire [0:0] pe_8_4_counter_delta_ready;
	output wire [7:0] sink_68689_counter_delta;
	input wire [0:0] sink_68689_counter_delta_ready;
	output wire [0:0] fifo_sink_68689_north_push_valid;
	output wire [7:0] fifo_sink_68689_north_push_data;
	input wire [0:0] fifo_sink_68689_north_push_ready;
	input wire [31:0] array_array_66be1_q;
	output wire [0:0] array_array_66be1_w;
	output wire [0:0] array_array_66be1_widx;
	output wire [31:0] array_array_66be1_d;
	output wire [0:0] fifo_pe_8_4_west_push_valid;
	output wire [7:0] fifo_pe_8_4_west_push_data;
	input wire [0:0] fifo_pe_8_4_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3037;
	assign var_3037 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_3039;
	assign var_3039 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_3041;
	assign var_3041 = array_array_66be1_q[31:0];
	wire [15:0] var_3044;
	assign var_3044 = $signed(var_3037) * $signed(var_3039);
	wire [31:0] var_3047;
	assign var_3047 = {16'd0, var_3044};
	wire [31:0] var_3050;
	assign var_3050 = var_3047;
	wire [31:0] var_3052;
	assign var_3052 = $signed(var_3041) + $signed(var_3050);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_3]\t\tMac value: %d * %d + %d = %d", $time, var_3037, var_3039, var_3041, var_3052);
	assign sink_68689_counter_delta = (executed ? 1 : 0);
	assign pe_8_4_counter_delta = (executed ? 1 : 0);
	assign fifo_sink_68689_north_push_valid = executed;
	assign fifo_sink_68689_north_push_data = var_3039;
	assign fifo_pe_8_4_west_push_valid = executed;
	assign fifo_pe_8_4_west_push_data = var_3037;
	assign array_array_66be1_w = executed;
	assign array_array_66be1_d = var_3052;
	assign array_array_66be1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_2 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_66045_q,
	array_array_66045_w,
	array_array_66045_widx,
	array_array_66045_d,
	fifo_pe_4_2_north_push_valid,
	fifo_pe_4_2_north_push_data,
	fifo_pe_4_2_north_push_ready,
	fifo_pe_3_3_west_push_valid,
	fifo_pe_3_3_west_push_data,
	fifo_pe_3_3_west_push_ready,
	pe_3_3_counter_delta,
	pe_3_3_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_66045_q;
	output wire [0:0] array_array_66045_w;
	output wire [0:0] array_array_66045_widx;
	output wire [31:0] array_array_66045_d;
	output wire [0:0] fifo_pe_4_2_north_push_valid;
	output wire [7:0] fifo_pe_4_2_north_push_data;
	input wire [0:0] fifo_pe_4_2_north_push_ready;
	output wire [0:0] fifo_pe_3_3_west_push_valid;
	output wire [7:0] fifo_pe_3_3_west_push_data;
	input wire [0:0] fifo_pe_3_3_west_push_ready;
	output wire [7:0] pe_3_3_counter_delta;
	input wire [0:0] pe_3_3_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1331;
	assign var_1331 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1333;
	assign var_1333 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1335;
	assign var_1335 = array_array_66045_q[31:0];
	wire [15:0] var_1338;
	assign var_1338 = $signed(var_1331) * $signed(var_1333);
	wire [31:0] var_1341;
	assign var_1341 = {16'd0, var_1338};
	wire [31:0] var_1344;
	assign var_1344 = var_1341;
	wire [31:0] var_1346;
	assign var_1346 = $signed(var_1335) + $signed(var_1344);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_2]\t\tMac value: %d * %d + %d = %d", $time, var_1331, var_1333, var_1335, var_1346);
	assign pe_3_3_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_4_2_north_push_valid = executed;
	assign fifo_pe_4_2_north_push_data = var_1333;
	assign fifo_pe_3_3_west_push_valid = executed;
	assign fifo_pe_3_3_west_push_data = var_1331;
	assign array_array_66045_w = executed;
	assign array_array_66045_d = var_1346;
	assign array_array_66045_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_5 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_5_1_west_push_valid,
	fifo_pe_5_1_west_push_data,
	fifo_pe_5_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_5_1_west_push_valid;
	output wire [7:0] fifo_pe_5_1_west_push_data;
	input wire [0:0] fifo_pe_5_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3444;
	assign var_3444 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_5]\t\trow_Pusher_5 pushes %d", $time, var_3444);
	assign fifo_pe_5_1_west_push_valid = executed;
	assign fifo_pe_5_1_west_push_data = var_3444;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_1 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_2_1_north_push_valid,
	fifo_pe_2_1_north_push_data,
	fifo_pe_2_1_north_push_ready,
	pe_1_2_counter_delta,
	pe_1_2_counter_delta_ready,
	array_array_6554d_q,
	array_array_6554d_w,
	array_array_6554d_widx,
	array_array_6554d_d,
	fifo_pe_1_2_west_push_valid,
	fifo_pe_1_2_west_push_data,
	fifo_pe_1_2_west_push_ready,
	pe_2_1_counter_delta,
	pe_2_1_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_2_1_north_push_valid;
	output wire [7:0] fifo_pe_2_1_north_push_data;
	input wire [0:0] fifo_pe_2_1_north_push_ready;
	output wire [7:0] pe_1_2_counter_delta;
	input wire [0:0] pe_1_2_counter_delta_ready;
	input wire [31:0] array_array_6554d_q;
	output wire [0:0] array_array_6554d_w;
	output wire [0:0] array_array_6554d_widx;
	output wire [31:0] array_array_6554d_d;
	output wire [0:0] fifo_pe_1_2_west_push_valid;
	output wire [7:0] fifo_pe_1_2_west_push_data;
	input wire [0:0] fifo_pe_1_2_west_push_ready;
	output wire [7:0] pe_2_1_counter_delta;
	input wire [0:0] pe_2_1_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_626;
	assign var_626 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_628;
	assign var_628 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_631;
	assign var_631 = array_array_6554d_q[31:0];
	wire [15:0] var_634;
	assign var_634 = $signed(var_626) * $signed(var_628);
	wire [31:0] var_638;
	assign var_638 = {16'd0, var_634};
	wire [31:0] var_641;
	assign var_641 = var_638;
	wire [31:0] var_643;
	assign var_643 = $signed(var_631) + $signed(var_641);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_1]\t\tMac value: %d * %d + %d = %d", $time, var_626, var_628, var_631, var_643);
	assign pe_1_2_counter_delta = (executed ? 1 : 0);
	assign pe_2_1_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_1_2_west_push_valid = executed;
	assign fifo_pe_1_2_west_push_data = var_626;
	assign fifo_pe_2_1_north_push_valid = executed;
	assign fifo_pe_2_1_north_push_data = var_628;
	assign array_array_6554d_w = executed;
	assign array_array_6554d_d = var_643;
	assign array_array_6554d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_1 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_1_west_push_valid,
	fifo_pe_1_1_west_push_data,
	fifo_pe_1_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_1_west_push_valid;
	output wire [7:0] fifo_pe_1_1_west_push_data;
	input wire [0:0] fifo_pe_1_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3312;
	assign var_3312 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_1]\t\trow_Pusher_1 pushes %d", $time, var_3312);
	assign fifo_pe_1_1_west_push_valid = executed;
	assign fifo_pe_1_1_west_push_data = var_3312;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_3 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	pe_3_4_counter_delta,
	pe_3_4_counter_delta_ready,
	fifo_pe_3_4_west_push_valid,
	fifo_pe_3_4_west_push_data,
	fifo_pe_3_4_west_push_ready,
	array_array_66071_q,
	array_array_66071_w,
	array_array_66071_widx,
	array_array_66071_d,
	fifo_pe_4_3_north_push_valid,
	fifo_pe_4_3_north_push_data,
	fifo_pe_4_3_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [7:0] pe_3_4_counter_delta;
	input wire [0:0] pe_3_4_counter_delta_ready;
	output wire [0:0] fifo_pe_3_4_west_push_valid;
	output wire [7:0] fifo_pe_3_4_west_push_data;
	input wire [0:0] fifo_pe_3_4_west_push_ready;
	input wire [31:0] array_array_66071_q;
	output wire [0:0] array_array_66071_w;
	output wire [0:0] array_array_66071_widx;
	output wire [31:0] array_array_66071_d;
	output wire [0:0] fifo_pe_4_3_north_push_valid;
	output wire [7:0] fifo_pe_4_3_north_push_data;
	input wire [0:0] fifo_pe_4_3_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1372;
	assign var_1372 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1374;
	assign var_1374 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1376;
	assign var_1376 = array_array_66071_q[31:0];
	wire [15:0] var_1379;
	assign var_1379 = $signed(var_1372) * $signed(var_1374);
	wire [31:0] var_1382;
	assign var_1382 = {16'd0, var_1379};
	wire [31:0] var_1385;
	assign var_1385 = var_1382;
	wire [31:0] var_1387;
	assign var_1387 = $signed(var_1376) + $signed(var_1385);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_3]\t\tMac value: %d * %d + %d = %d", $time, var_1372, var_1374, var_1376, var_1387);
	assign pe_3_4_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_4_west_push_valid = executed;
	assign fifo_pe_3_4_west_push_data = var_1372;
	assign fifo_pe_4_3_north_push_valid = executed;
	assign fifo_pe_4_3_north_push_data = var_1374;
	assign array_array_66071_w = executed;
	assign array_array_66071_d = var_1387;
	assign array_array_66071_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_sink_69c5d_north_push_valid,
	fifo_sink_69c5d_north_push_data,
	fifo_sink_69c5d_north_push_ready,
	sink_69c5d_counter_delta,
	sink_69c5d_counter_delta_ready,
	array_array_66c45_q,
	array_array_66c45_w,
	array_array_66c45_widx,
	array_array_66c45_d,
	fifo_pe_8_6_west_push_valid,
	fifo_pe_8_6_west_push_data,
	fifo_pe_8_6_west_push_ready,
	pe_8_6_counter_delta,
	pe_8_6_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_sink_69c5d_north_push_valid;
	output wire [7:0] fifo_sink_69c5d_north_push_data;
	input wire [0:0] fifo_sink_69c5d_north_push_ready;
	output wire [7:0] sink_69c5d_counter_delta;
	input wire [0:0] sink_69c5d_counter_delta_ready;
	input wire [31:0] array_array_66c45_q;
	output wire [0:0] array_array_66c45_w;
	output wire [0:0] array_array_66c45_widx;
	output wire [31:0] array_array_66c45_d;
	output wire [0:0] fifo_pe_8_6_west_push_valid;
	output wire [7:0] fifo_pe_8_6_west_push_data;
	input wire [0:0] fifo_pe_8_6_west_push_ready;
	output wire [7:0] pe_8_6_counter_delta;
	input wire [0:0] pe_8_6_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3129;
	assign var_3129 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_3131;
	assign var_3131 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_3133;
	assign var_3133 = array_array_66c45_q[31:0];
	wire [15:0] var_3136;
	assign var_3136 = $signed(var_3129) * $signed(var_3131);
	wire [31:0] var_3139;
	assign var_3139 = {16'd0, var_3136};
	wire [31:0] var_3142;
	assign var_3142 = var_3139;
	wire [31:0] var_3144;
	assign var_3144 = $signed(var_3133) + $signed(var_3142);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_5]\t\tMac value: %d * %d + %d = %d", $time, var_3129, var_3131, var_3133, var_3144);
	assign pe_8_6_counter_delta = (executed ? 1 : 0);
	assign sink_69c5d_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_8_6_west_push_valid = executed;
	assign fifo_pe_8_6_west_push_data = var_3129;
	assign fifo_sink_69c5d_north_push_valid = executed;
	assign fifo_sink_69c5d_north_push_data = var_3131;
	assign array_array_66c45_w = executed;
	assign array_array_66c45_d = var_3144;
	assign array_array_66c45_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_7 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_8_8_west_push_valid,
	fifo_pe_8_8_west_push_data,
	fifo_pe_8_8_west_push_ready,
	fifo_sink_69dd1_north_push_valid,
	fifo_sink_69dd1_north_push_data,
	fifo_sink_69dd1_north_push_ready,
	array_array_66ca5_q,
	array_array_66ca5_w,
	array_array_66ca5_widx,
	array_array_66ca5_d,
	pe_8_8_counter_delta,
	pe_8_8_counter_delta_ready,
	sink_69dd1_counter_delta,
	sink_69dd1_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_8_8_west_push_valid;
	output wire [7:0] fifo_pe_8_8_west_push_data;
	input wire [0:0] fifo_pe_8_8_west_push_ready;
	output wire [0:0] fifo_sink_69dd1_north_push_valid;
	output wire [7:0] fifo_sink_69dd1_north_push_data;
	input wire [0:0] fifo_sink_69dd1_north_push_ready;
	input wire [31:0] array_array_66ca5_q;
	output wire [0:0] array_array_66ca5_w;
	output wire [0:0] array_array_66ca5_widx;
	output wire [31:0] array_array_66ca5_d;
	output wire [7:0] pe_8_8_counter_delta;
	input wire [0:0] pe_8_8_counter_delta_ready;
	output wire [7:0] sink_69dd1_counter_delta;
	input wire [0:0] sink_69dd1_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3221;
	assign var_3221 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_3223;
	assign var_3223 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_3225;
	assign var_3225 = array_array_66ca5_q[31:0];
	wire [15:0] var_3228;
	assign var_3228 = $signed(var_3221) * $signed(var_3223);
	wire [31:0] var_3231;
	assign var_3231 = {16'd0, var_3228};
	wire [31:0] var_3234;
	assign var_3234 = var_3231;
	wire [31:0] var_3236;
	assign var_3236 = $signed(var_3225) + $signed(var_3234);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_7]\t\tMac value: %d * %d + %d = %d", $time, var_3221, var_3223, var_3225, var_3236);
	assign pe_8_8_counter_delta = (executed ? 1 : 0);
	assign sink_69dd1_counter_delta = (executed ? 1 : 0);
	assign fifo_sink_69dd1_north_push_valid = executed;
	assign fifo_sink_69dd1_north_push_data = var_3223;
	assign fifo_pe_8_8_west_push_valid = executed;
	assign fifo_pe_8_8_west_push_data = var_3221;
	assign array_array_66ca5_w = executed;
	assign array_array_66ca5_d = var_3236;
	assign array_array_66ca5_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_2 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	sink_685a1_counter_delta,
	sink_685a1_counter_delta_ready,
	fifo_sink_685a1_north_push_valid,
	fifo_sink_685a1_north_push_data,
	fifo_sink_685a1_north_push_ready,
	array_array_66bb1_q,
	array_array_66bb1_w,
	array_array_66bb1_widx,
	array_array_66bb1_d,
	fifo_pe_8_3_west_push_valid,
	fifo_pe_8_3_west_push_data,
	fifo_pe_8_3_west_push_ready,
	pe_8_3_counter_delta,
	pe_8_3_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [7:0] sink_685a1_counter_delta;
	input wire [0:0] sink_685a1_counter_delta_ready;
	output wire [0:0] fifo_sink_685a1_north_push_valid;
	output wire [7:0] fifo_sink_685a1_north_push_data;
	input wire [0:0] fifo_sink_685a1_north_push_ready;
	input wire [31:0] array_array_66bb1_q;
	output wire [0:0] array_array_66bb1_w;
	output wire [0:0] array_array_66bb1_widx;
	output wire [31:0] array_array_66bb1_d;
	output wire [0:0] fifo_pe_8_3_west_push_valid;
	output wire [7:0] fifo_pe_8_3_west_push_data;
	input wire [0:0] fifo_pe_8_3_west_push_ready;
	output wire [7:0] pe_8_3_counter_delta;
	input wire [0:0] pe_8_3_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2991;
	assign var_2991 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2993;
	assign var_2993 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2995;
	assign var_2995 = array_array_66bb1_q[31:0];
	wire [15:0] var_2998;
	assign var_2998 = $signed(var_2991) * $signed(var_2993);
	wire [31:0] var_3001;
	assign var_3001 = {16'd0, var_2998};
	wire [31:0] var_3004;
	assign var_3004 = var_3001;
	wire [31:0] var_3006;
	assign var_3006 = $signed(var_2995) + $signed(var_3004);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_2]\t\tMac value: %d * %d + %d = %d", $time, var_2991, var_2993, var_2995, var_3006);
	assign pe_8_3_counter_delta = (executed ? 1 : 0);
	assign sink_685a1_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_8_3_west_push_valid = executed;
	assign fifo_pe_8_3_west_push_data = var_2991;
	assign fifo_sink_685a1_north_push_valid = executed;
	assign fifo_sink_685a1_north_push_data = var_2993;
	assign array_array_66bb1_w = executed;
	assign array_array_66bb1_d = var_3006;
	assign array_array_66bb1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_8_4 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_8_5_west_push_valid,
	fifo_pe_8_5_west_push_data,
	fifo_pe_8_5_west_push_ready,
	sink_68771_counter_delta,
	sink_68771_counter_delta_ready,
	array_array_66c15_q,
	array_array_66c15_w,
	array_array_66c15_widx,
	array_array_66c15_d,
	fifo_sink_68771_north_push_valid,
	fifo_sink_68771_north_push_data,
	fifo_sink_68771_north_push_ready,
	pe_8_5_counter_delta,
	pe_8_5_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_8_5_west_push_valid;
	output wire [7:0] fifo_pe_8_5_west_push_data;
	input wire [0:0] fifo_pe_8_5_west_push_ready;
	output wire [7:0] sink_68771_counter_delta;
	input wire [0:0] sink_68771_counter_delta_ready;
	input wire [31:0] array_array_66c15_q;
	output wire [0:0] array_array_66c15_w;
	output wire [0:0] array_array_66c15_widx;
	output wire [31:0] array_array_66c15_d;
	output wire [0:0] fifo_sink_68771_north_push_valid;
	output wire [7:0] fifo_sink_68771_north_push_data;
	input wire [0:0] fifo_sink_68771_north_push_ready;
	output wire [7:0] pe_8_5_counter_delta;
	input wire [0:0] pe_8_5_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3083;
	assign var_3083 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_3085;
	assign var_3085 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_3087;
	assign var_3087 = array_array_66c15_q[31:0];
	wire [15:0] var_3090;
	assign var_3090 = $signed(var_3083) * $signed(var_3085);
	wire [31:0] var_3093;
	assign var_3093 = {16'd0, var_3090};
	wire [31:0] var_3096;
	assign var_3096 = var_3093;
	wire [31:0] var_3098;
	assign var_3098 = $signed(var_3087) + $signed(var_3096);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_8_4]\t\tMac value: %d * %d + %d = %d", $time, var_3083, var_3085, var_3087, var_3098);
	assign sink_68771_counter_delta = (executed ? 1 : 0);
	assign pe_8_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_8_5_west_push_valid = executed;
	assign fifo_pe_8_5_west_push_data = var_3083;
	assign fifo_sink_68771_north_push_valid = executed;
	assign fifo_sink_68771_north_push_data = var_3085;
	assign array_array_66c15_w = executed;
	assign array_array_66c15_d = var_3098;
	assign array_array_66c15_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_4 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_65739_q,
	array_array_65739_w,
	array_array_65739_widx,
	array_array_65739_d,
	fifo_pe_3_4_north_push_valid,
	fifo_pe_3_4_north_push_data,
	fifo_pe_3_4_north_push_ready,
	fifo_pe_2_5_west_push_valid,
	fifo_pe_2_5_west_push_data,
	fifo_pe_2_5_west_push_ready,
	pe_2_5_counter_delta,
	pe_2_5_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_65739_q;
	output wire [0:0] array_array_65739_w;
	output wire [0:0] array_array_65739_widx;
	output wire [31:0] array_array_65739_d;
	output wire [0:0] fifo_pe_3_4_north_push_valid;
	output wire [7:0] fifo_pe_3_4_north_push_data;
	input wire [0:0] fifo_pe_3_4_north_push_ready;
	output wire [0:0] fifo_pe_2_5_west_push_valid;
	output wire [7:0] fifo_pe_2_5_west_push_data;
	input wire [0:0] fifo_pe_2_5_west_push_ready;
	output wire [7:0] pe_2_5_counter_delta;
	input wire [0:0] pe_2_5_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1081;
	assign var_1081 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1083;
	assign var_1083 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1085;
	assign var_1085 = array_array_65739_q[31:0];
	wire [15:0] var_1088;
	assign var_1088 = $signed(var_1081) * $signed(var_1083);
	wire [31:0] var_1091;
	assign var_1091 = {16'd0, var_1088};
	wire [31:0] var_1094;
	assign var_1094 = var_1091;
	wire [31:0] var_1096;
	assign var_1096 = $signed(var_1085) + $signed(var_1094);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_4]\t\tMac value: %d * %d + %d = %d", $time, var_1081, var_1083, var_1085, var_1096);
	assign pe_2_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_5_west_push_valid = executed;
	assign fifo_pe_2_5_west_push_data = var_1081;
	assign fifo_pe_3_4_north_push_valid = executed;
	assign fifo_pe_3_4_north_push_data = var_1083;
	assign array_array_65739_w = executed;
	assign array_array_65739_d = var_1096;
	assign array_array_65739_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_1 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_7_1_north_push_valid,
	fifo_pe_7_1_north_push_data,
	fifo_pe_7_1_north_push_ready,
	pe_7_1_counter_delta,
	pe_7_1_counter_delta_ready,
	fifo_pe_6_2_west_push_valid,
	fifo_pe_6_2_west_push_data,
	fifo_pe_6_2_west_push_ready,
	array_array_66881_q,
	array_array_66881_w,
	array_array_66881_widx,
	array_array_66881_d,
	pe_6_2_counter_delta,
	pe_6_2_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_7_1_north_push_valid;
	output wire [7:0] fifo_pe_7_1_north_push_data;
	input wire [0:0] fifo_pe_7_1_north_push_ready;
	output wire [7:0] pe_7_1_counter_delta;
	input wire [0:0] pe_7_1_counter_delta_ready;
	output wire [0:0] fifo_pe_6_2_west_push_valid;
	output wire [7:0] fifo_pe_6_2_west_push_data;
	input wire [0:0] fifo_pe_6_2_west_push_ready;
	input wire [31:0] array_array_66881_q;
	output wire [0:0] array_array_66881_w;
	output wire [0:0] array_array_66881_widx;
	output wire [31:0] array_array_66881_d;
	output wire [7:0] pe_6_2_counter_delta;
	input wire [0:0] pe_6_2_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2281;
	assign var_2281 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2283;
	assign var_2283 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2285;
	assign var_2285 = array_array_66881_q[31:0];
	wire [15:0] var_2288;
	assign var_2288 = $signed(var_2281) * $signed(var_2283);
	wire [31:0] var_2291;
	assign var_2291 = {16'd0, var_2288};
	wire [31:0] var_2294;
	assign var_2294 = var_2291;
	wire [31:0] var_2296;
	assign var_2296 = $signed(var_2285) + $signed(var_2294);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_1]\t\tMac value: %d * %d + %d = %d", $time, var_2281, var_2283, var_2285, var_2296);
	assign pe_7_1_counter_delta = (executed ? 1 : 0);
	assign pe_6_2_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_1_north_push_valid = executed;
	assign fifo_pe_7_1_north_push_data = var_2283;
	assign fifo_pe_6_2_west_push_valid = executed;
	assign fifo_pe_6_2_west_push_data = var_2281;
	assign array_array_66881_w = executed;
	assign array_array_66881_d = var_2296;
	assign array_array_66881_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_2 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_7_3_west_push_valid,
	fifo_pe_7_3_west_push_data,
	fifo_pe_7_3_west_push_ready,
	pe_7_3_counter_delta,
	pe_7_3_counter_delta_ready,
	array_array_66a31_q,
	array_array_66a31_w,
	array_array_66a31_widx,
	array_array_66a31_d,
	fifo_pe_8_2_north_push_valid,
	fifo_pe_8_2_north_push_data,
	fifo_pe_8_2_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_7_3_west_push_valid;
	output wire [7:0] fifo_pe_7_3_west_push_data;
	input wire [0:0] fifo_pe_7_3_west_push_ready;
	output wire [7:0] pe_7_3_counter_delta;
	input wire [0:0] pe_7_3_counter_delta_ready;
	input wire [31:0] array_array_66a31_q;
	output wire [0:0] array_array_66a31_w;
	output wire [0:0] array_array_66a31_widx;
	output wire [31:0] array_array_66a31_d;
	output wire [0:0] fifo_pe_8_2_north_push_valid;
	output wire [7:0] fifo_pe_8_2_north_push_data;
	input wire [0:0] fifo_pe_8_2_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2659;
	assign var_2659 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2661;
	assign var_2661 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2663;
	assign var_2663 = array_array_66a31_q[31:0];
	wire [15:0] var_2666;
	assign var_2666 = $signed(var_2659) * $signed(var_2661);
	wire [31:0] var_2669;
	assign var_2669 = {16'd0, var_2666};
	wire [31:0] var_2672;
	assign var_2672 = var_2669;
	wire [31:0] var_2674;
	assign var_2674 = $signed(var_2663) + $signed(var_2672);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_2]\t\tMac value: %d * %d + %d = %d", $time, var_2659, var_2661, var_2663, var_2674);
	assign pe_7_3_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_3_west_push_valid = executed;
	assign fifo_pe_7_3_west_push_data = var_2659;
	assign fifo_pe_8_2_north_push_valid = executed;
	assign fifo_pe_8_2_north_push_data = var_2661;
	assign array_array_66a31_w = executed;
	assign array_array_66a31_d = var_2674;
	assign array_array_66a31_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_2_7 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	array_array_657bd_q,
	array_array_657bd_w,
	array_array_657bd_widx,
	array_array_657bd_d,
	pe_2_8_counter_delta,
	pe_2_8_counter_delta_ready,
	fifo_pe_2_8_west_push_valid,
	fifo_pe_2_8_west_push_data,
	fifo_pe_2_8_west_push_ready,
	fifo_pe_3_7_north_push_valid,
	fifo_pe_3_7_north_push_data,
	fifo_pe_3_7_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [31:0] array_array_657bd_q;
	output wire [0:0] array_array_657bd_w;
	output wire [0:0] array_array_657bd_widx;
	output wire [31:0] array_array_657bd_d;
	output wire [7:0] pe_2_8_counter_delta;
	input wire [0:0] pe_2_8_counter_delta_ready;
	output wire [0:0] fifo_pe_2_8_west_push_valid;
	output wire [7:0] fifo_pe_2_8_west_push_data;
	input wire [0:0] fifo_pe_2_8_west_push_ready;
	output wire [0:0] fifo_pe_3_7_north_push_valid;
	output wire [7:0] fifo_pe_3_7_north_push_data;
	input wire [0:0] fifo_pe_3_7_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1204;
	assign var_1204 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1206;
	assign var_1206 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1208;
	assign var_1208 = array_array_657bd_q[31:0];
	wire [15:0] var_1211;
	assign var_1211 = $signed(var_1204) * $signed(var_1206);
	wire [31:0] var_1214;
	assign var_1214 = {16'd0, var_1211};
	wire [31:0] var_1217;
	assign var_1217 = var_1214;
	wire [31:0] var_1219;
	assign var_1219 = $signed(var_1208) + $signed(var_1217);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_2_7]\t\tMac value: %d * %d + %d = %d", $time, var_1204, var_1206, var_1208, var_1219);
	assign pe_2_8_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_7_north_push_valid = executed;
	assign fifo_pe_3_7_north_push_data = var_1206;
	assign fifo_pe_2_8_west_push_valid = executed;
	assign fifo_pe_2_8_west_push_data = var_1204;
	assign array_array_657bd_w = executed;
	assign array_array_657bd_d = var_1219;
	assign array_array_657bd_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_6 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_2_6_north_push_valid,
	fifo_pe_2_6_north_push_data,
	fifo_pe_2_6_north_push_ready,
	fifo_pe_1_7_west_push_valid,
	fifo_pe_1_7_west_push_data,
	fifo_pe_1_7_west_push_ready,
	array_array_65631_q,
	array_array_65631_w,
	array_array_65631_widx,
	array_array_65631_d,
	pe_1_7_counter_delta,
	pe_1_7_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_2_6_north_push_valid;
	output wire [7:0] fifo_pe_2_6_north_push_data;
	input wire [0:0] fifo_pe_2_6_north_push_ready;
	output wire [0:0] fifo_pe_1_7_west_push_valid;
	output wire [7:0] fifo_pe_1_7_west_push_data;
	input wire [0:0] fifo_pe_1_7_west_push_ready;
	input wire [31:0] array_array_65631_q;
	output wire [0:0] array_array_65631_w;
	output wire [0:0] array_array_65631_widx;
	output wire [31:0] array_array_65631_d;
	output wire [7:0] pe_1_7_counter_delta;
	input wire [0:0] pe_1_7_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_833;
	assign var_833 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_835;
	assign var_835 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_837;
	assign var_837 = array_array_65631_q[31:0];
	wire [15:0] var_840;
	assign var_840 = $signed(var_833) * $signed(var_835);
	wire [31:0] var_843;
	assign var_843 = {16'd0, var_840};
	wire [31:0] var_846;
	assign var_846 = var_843;
	wire [31:0] var_848;
	assign var_848 = $signed(var_837) + $signed(var_846);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_6]\t\tMac value: %d * %d + %d = %d", $time, var_833, var_835, var_837, var_848);
	assign pe_1_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_1_7_west_push_valid = executed;
	assign fifo_pe_1_7_west_push_data = var_833;
	assign fifo_pe_2_6_north_push_valid = executed;
	assign fifo_pe_2_6_north_push_data = var_835;
	assign array_array_65631_w = executed;
	assign array_array_65631_d = var_848;
	assign array_array_65631_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_1_8 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_6568d_q,
	array_array_6568d_w,
	array_array_6568d_widx,
	array_array_6568d_d,
	fifo_pe_2_8_north_push_valid,
	fifo_pe_2_8_north_push_data,
	fifo_pe_2_8_north_push_ready,
	fifo_sink_68445_west_push_valid,
	fifo_sink_68445_west_push_data,
	fifo_sink_68445_west_push_ready,
	sink_68445_counter_delta,
	sink_68445_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_6568d_q;
	output wire [0:0] array_array_6568d_w;
	output wire [0:0] array_array_6568d_widx;
	output wire [31:0] array_array_6568d_d;
	output wire [0:0] fifo_pe_2_8_north_push_valid;
	output wire [7:0] fifo_pe_2_8_north_push_data;
	input wire [0:0] fifo_pe_2_8_north_push_ready;
	output wire [0:0] fifo_sink_68445_west_push_valid;
	output wire [7:0] fifo_sink_68445_west_push_data;
	input wire [0:0] fifo_sink_68445_west_push_ready;
	output wire [7:0] sink_68445_counter_delta;
	input wire [0:0] sink_68445_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_913;
	assign var_913 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_915;
	assign var_915 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_917;
	assign var_917 = array_array_6568d_q[31:0];
	wire [15:0] var_920;
	assign var_920 = $signed(var_913) * $signed(var_915);
	wire [31:0] var_923;
	assign var_923 = {16'd0, var_920};
	wire [31:0] var_926;
	assign var_926 = var_923;
	wire [31:0] var_928;
	assign var_928 = $signed(var_917) + $signed(var_926);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_1_8]\t\tMac value: %d * %d + %d = %d", $time, var_913, var_915, var_917, var_928);
	assign sink_68445_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_2_8_north_push_valid = executed;
	assign fifo_pe_2_8_north_push_data = var_915;
	assign fifo_sink_68445_west_push_valid = executed;
	assign fifo_sink_68445_west_push_data = var_913;
	assign array_array_6568d_w = executed;
	assign array_array_6568d_d = var_928;
	assign array_array_6568d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_1 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	pe_1_1_counter_delta,
	pe_1_1_counter_delta_ready,
	fifo_pe_1_1_north_push_valid,
	fifo_pe_1_1_north_push_data,
	fifo_pe_1_1_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [7:0] pe_1_1_counter_delta;
	input wire [0:0] pe_1_1_counter_delta_ready;
	output wire [0:0] fifo_pe_1_1_north_push_valid;
	output wire [7:0] fifo_pe_1_1_north_push_data;
	input wire [0:0] fifo_pe_1_1_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3321;
	assign var_3321 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_1]\t\tcol_Pusher_1 pushes %d", $time, var_3321);
	assign pe_1_1_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_1_1_north_push_valid = executed;
	assign fifo_pe_1_1_north_push_data = var_3321;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module col_pusher_4 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_1_4_north_push_valid,
	fifo_pe_1_4_north_push_data,
	fifo_pe_1_4_north_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_1_4_north_push_valid;
	output wire [7:0] fifo_pe_1_4_north_push_data;
	input wire [0:0] fifo_pe_1_4_north_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3422;
	assign var_3422 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[col_pusher_4]\t\tcol_Pusher_4 pushes %d", $time, var_3422);
	assign fifo_pe_1_4_north_push_valid = executed;
	assign fifo_pe_1_4_north_push_data = var_3422;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_69dd1 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3534;
	assign var_3534 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_69dd1]\t\tSink: %d", $time, var_3534);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_5_7 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_6_7_north_push_valid,
	fifo_pe_6_7_north_push_data,
	fifo_pe_6_7_north_push_ready,
	fifo_pe_5_8_west_push_valid,
	fifo_pe_5_8_west_push_data,
	fifo_pe_5_8_west_push_ready,
	array_array_66821_q,
	array_array_66821_w,
	array_array_66821_widx,
	array_array_66821_d,
	pe_5_8_counter_delta,
	pe_5_8_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_6_7_north_push_valid;
	output wire [7:0] fifo_pe_6_7_north_push_data;
	input wire [0:0] fifo_pe_6_7_north_push_ready;
	output wire [0:0] fifo_pe_5_8_west_push_valid;
	output wire [7:0] fifo_pe_5_8_west_push_data;
	input wire [0:0] fifo_pe_5_8_west_push_ready;
	input wire [31:0] array_array_66821_q;
	output wire [0:0] array_array_66821_w;
	output wire [0:0] array_array_66821_widx;
	output wire [31:0] array_array_66821_d;
	output wire [7:0] pe_5_8_counter_delta;
	input wire [0:0] pe_5_8_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2200;
	assign var_2200 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2202;
	assign var_2202 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2204;
	assign var_2204 = array_array_66821_q[31:0];
	wire [15:0] var_2207;
	assign var_2207 = $signed(var_2200) * $signed(var_2202);
	wire [31:0] var_2210;
	assign var_2210 = {16'd0, var_2207};
	wire [31:0] var_2213;
	assign var_2213 = var_2210;
	wire [31:0] var_2215;
	assign var_2215 = $signed(var_2204) + $signed(var_2213);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_7]\t\tMac value: %d * %d + %d = %d", $time, var_2200, var_2202, var_2204, var_2215);
	assign pe_5_8_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_8_west_push_valid = executed;
	assign fifo_pe_5_8_west_push_data = var_2200;
	assign fifo_pe_6_7_north_push_valid = executed;
	assign fifo_pe_6_7_north_push_data = var_2202;
	assign array_array_66821_w = executed;
	assign array_array_66821_d = var_2215;
	assign array_array_66821_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_7_6 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_8_6_north_push_valid,
	fifo_pe_8_6_north_push_data,
	fifo_pe_8_6_north_push_ready,
	array_array_66af1_q,
	array_array_66af1_w,
	array_array_66af1_widx,
	array_array_66af1_d,
	fifo_pe_7_7_west_push_valid,
	fifo_pe_7_7_west_push_data,
	fifo_pe_7_7_west_push_ready,
	pe_7_7_counter_delta,
	pe_7_7_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_8_6_north_push_valid;
	output wire [7:0] fifo_pe_8_6_north_push_data;
	input wire [0:0] fifo_pe_8_6_north_push_ready;
	input wire [31:0] array_array_66af1_q;
	output wire [0:0] array_array_66af1_w;
	output wire [0:0] array_array_66af1_widx;
	output wire [31:0] array_array_66af1_d;
	output wire [0:0] fifo_pe_7_7_west_push_valid;
	output wire [7:0] fifo_pe_7_7_west_push_data;
	input wire [0:0] fifo_pe_7_7_west_push_ready;
	output wire [7:0] pe_7_7_counter_delta;
	input wire [0:0] pe_7_7_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2823;
	assign var_2823 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2825;
	assign var_2825 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2827;
	assign var_2827 = array_array_66af1_q[31:0];
	wire [15:0] var_2830;
	assign var_2830 = $signed(var_2823) * $signed(var_2825);
	wire [31:0] var_2833;
	assign var_2833 = {16'd0, var_2830};
	wire [31:0] var_2836;
	assign var_2836 = var_2833;
	wire [31:0] var_2838;
	assign var_2838 = $signed(var_2827) + $signed(var_2836);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_7_6]\t\tMac value: %d * %d + %d = %d", $time, var_2823, var_2825, var_2827, var_2838);
	assign pe_7_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_7_7_west_push_valid = executed;
	assign fifo_pe_7_7_west_push_data = var_2823;
	assign fifo_pe_8_6_north_push_valid = executed;
	assign fifo_pe_8_6_north_push_data = var_2825;
	assign array_array_66af1_w = executed;
	assign array_array_66af1_d = var_2838;
	assign array_array_66af1_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_684d1 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3342;
	assign var_3342 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_684d1]\t\tSink: %d", $time, var_3342);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_6_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	pe_6_6_counter_delta,
	pe_6_6_counter_delta_ready,
	fifo_pe_7_5_north_push_valid,
	fifo_pe_7_5_north_push_data,
	fifo_pe_7_5_north_push_ready,
	array_array_66941_q,
	array_array_66941_w,
	array_array_66941_widx,
	array_array_66941_d,
	fifo_pe_6_6_west_push_valid,
	fifo_pe_6_6_west_push_data,
	fifo_pe_6_6_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [7:0] pe_6_6_counter_delta;
	input wire [0:0] pe_6_6_counter_delta_ready;
	output wire [0:0] fifo_pe_7_5_north_push_valid;
	output wire [7:0] fifo_pe_7_5_north_push_data;
	input wire [0:0] fifo_pe_7_5_north_push_ready;
	input wire [31:0] array_array_66941_q;
	output wire [0:0] array_array_66941_w;
	output wire [0:0] array_array_66941_widx;
	output wire [31:0] array_array_66941_d;
	output wire [0:0] fifo_pe_6_6_west_push_valid;
	output wire [7:0] fifo_pe_6_6_west_push_data;
	input wire [0:0] fifo_pe_6_6_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2450;
	assign var_2450 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2452;
	assign var_2452 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2454;
	assign var_2454 = array_array_66941_q[31:0];
	wire [15:0] var_2457;
	assign var_2457 = $signed(var_2450) * $signed(var_2452);
	wire [31:0] var_2460;
	assign var_2460 = {16'd0, var_2457};
	wire [31:0] var_2463;
	assign var_2463 = var_2460;
	wire [31:0] var_2465;
	assign var_2465 = $signed(var_2454) + $signed(var_2463);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_6_5]\t\tMac value: %d * %d + %d = %d", $time, var_2450, var_2452, var_2454, var_2465);
	assign pe_6_6_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_6_6_west_push_valid = executed;
	assign fifo_pe_6_6_west_push_data = var_2450;
	assign fifo_pe_7_5_north_push_valid = executed;
	assign fifo_pe_7_5_north_push_data = var_2452;
	assign array_array_66941_w = executed;
	assign array_array_66941_d = var_2465;
	assign array_array_66941_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_5_6 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_6_6_north_push_valid,
	fifo_pe_6_6_north_push_data,
	fifo_pe_6_6_north_push_ready,
	pe_5_7_counter_delta,
	pe_5_7_counter_delta_ready,
	fifo_pe_5_7_west_push_valid,
	fifo_pe_5_7_west_push_data,
	fifo_pe_5_7_west_push_ready,
	array_array_663ed_q,
	array_array_663ed_w,
	array_array_663ed_widx,
	array_array_663ed_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_6_6_north_push_valid;
	output wire [7:0] fifo_pe_6_6_north_push_data;
	input wire [0:0] fifo_pe_6_6_north_push_ready;
	output wire [7:0] pe_5_7_counter_delta;
	input wire [0:0] pe_5_7_counter_delta_ready;
	output wire [0:0] fifo_pe_5_7_west_push_valid;
	output wire [7:0] fifo_pe_5_7_west_push_data;
	input wire [0:0] fifo_pe_5_7_west_push_ready;
	input wire [31:0] array_array_663ed_q;
	output wire [0:0] array_array_663ed_w;
	output wire [0:0] array_array_663ed_widx;
	output wire [31:0] array_array_663ed_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2159;
	assign var_2159 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2161;
	assign var_2161 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2163;
	assign var_2163 = array_array_663ed_q[31:0];
	wire [15:0] var_2166;
	assign var_2166 = $signed(var_2159) * $signed(var_2161);
	wire [31:0] var_2169;
	assign var_2169 = {16'd0, var_2166};
	wire [31:0] var_2172;
	assign var_2172 = var_2169;
	wire [31:0] var_2174;
	assign var_2174 = $signed(var_2163) + $signed(var_2172);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_6]\t\tMac value: %d * %d + %d = %d", $time, var_2159, var_2161, var_2163, var_2174);
	assign pe_5_7_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_7_west_push_valid = executed;
	assign fifo_pe_5_7_west_push_data = var_2159;
	assign fifo_pe_6_6_north_push_valid = executed;
	assign fifo_pe_6_6_north_push_data = var_2161;
	assign array_array_663ed_w = executed;
	assign array_array_663ed_d = var_2174;
	assign array_array_663ed_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_69d05 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3502;
	assign var_3502 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_69d05]\t\tSink: %d", $time, var_3502);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_69e49 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3560;
	assign var_3560 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_69e49]\t\tSink: %d", $time, var_3560);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_5_3 (
	clk,
	rst_n,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_pe_5_4_west_push_valid,
	fifo_pe_5_4_west_push_data,
	fifo_pe_5_4_west_push_ready,
	fifo_pe_6_3_north_push_valid,
	fifo_pe_6_3_north_push_data,
	fifo_pe_6_3_north_push_ready,
	array_array_6635d_q,
	array_array_6635d_w,
	array_array_6635d_widx,
	array_array_6635d_d,
	pe_5_4_counter_delta,
	pe_5_4_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	output wire [0:0] fifo_pe_5_4_west_push_valid;
	output wire [7:0] fifo_pe_5_4_west_push_data;
	input wire [0:0] fifo_pe_5_4_west_push_ready;
	output wire [0:0] fifo_pe_6_3_north_push_valid;
	output wire [7:0] fifo_pe_6_3_north_push_data;
	input wire [0:0] fifo_pe_6_3_north_push_ready;
	input wire [31:0] array_array_6635d_q;
	output wire [0:0] array_array_6635d_w;
	output wire [0:0] array_array_6635d_widx;
	output wire [31:0] array_array_6635d_d;
	output wire [7:0] pe_5_4_counter_delta;
	input wire [0:0] pe_5_4_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_2036;
	assign var_2036 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_2038;
	assign var_2038 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_2040;
	assign var_2040 = array_array_6635d_q[31:0];
	wire [15:0] var_2043;
	assign var_2043 = $signed(var_2036) * $signed(var_2038);
	wire [31:0] var_2046;
	assign var_2046 = {16'd0, var_2043};
	wire [31:0] var_2049;
	assign var_2049 = var_2046;
	wire [31:0] var_2051;
	assign var_2051 = $signed(var_2040) + $signed(var_2049);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_3]\t\tMac value: %d * %d + %d = %d", $time, var_2036, var_2038, var_2040, var_2051);
	assign pe_5_4_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_4_west_push_valid = executed;
	assign fifo_pe_5_4_west_push_data = var_2036;
	assign fifo_pe_6_3_north_push_valid = executed;
	assign fifo_pe_6_3_north_push_data = var_2038;
	assign array_array_6635d_w = executed;
	assign array_array_6635d_d = var_2051;
	assign array_array_6635d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_5 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	fifo_pe_4_5_north_push_valid,
	fifo_pe_4_5_north_push_data,
	fifo_pe_4_5_north_push_ready,
	fifo_pe_3_6_west_push_valid,
	fifo_pe_3_6_west_push_data,
	fifo_pe_3_6_west_push_ready,
	array_array_660c9_q,
	array_array_660c9_w,
	array_array_660c9_widx,
	array_array_660c9_d,
	pe_3_6_counter_delta,
	pe_3_6_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [0:0] fifo_pe_4_5_north_push_valid;
	output wire [7:0] fifo_pe_4_5_north_push_data;
	input wire [0:0] fifo_pe_4_5_north_push_ready;
	output wire [0:0] fifo_pe_3_6_west_push_valid;
	output wire [7:0] fifo_pe_3_6_west_push_data;
	input wire [0:0] fifo_pe_3_6_west_push_ready;
	input wire [31:0] array_array_660c9_q;
	output wire [0:0] array_array_660c9_w;
	output wire [0:0] array_array_660c9_widx;
	output wire [31:0] array_array_660c9_d;
	output wire [7:0] pe_3_6_counter_delta;
	input wire [0:0] pe_3_6_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1454;
	assign var_1454 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1456;
	assign var_1456 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1458;
	assign var_1458 = array_array_660c9_q[31:0];
	wire [15:0] var_1461;
	assign var_1461 = $signed(var_1454) * $signed(var_1456);
	wire [31:0] var_1464;
	assign var_1464 = {16'd0, var_1461};
	wire [31:0] var_1467;
	assign var_1467 = var_1464;
	wire [31:0] var_1469;
	assign var_1469 = $signed(var_1458) + $signed(var_1467);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_5]\t\tMac value: %d * %d + %d = %d", $time, var_1454, var_1456, var_1458, var_1469);
	assign pe_3_6_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_3_6_west_push_valid = executed;
	assign fifo_pe_3_6_west_push_data = var_1454;
	assign fifo_pe_4_5_north_push_valid = executed;
	assign fifo_pe_4_5_north_push_data = var_1456;
	assign array_array_660c9_w = executed;
	assign array_array_660c9_d = var_1469;
	assign array_array_660c9_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module sink_69c1d (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3464;
	assign var_3464 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[sink_69c1d]\t\tSink: %d", $time, var_3464);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module row_pusher_4 (
	clk,
	rst_n,
	fifo_data_pop_valid,
	fifo_data_pop_data,
	fifo_data_pop_ready,
	fifo_pe_4_1_west_push_valid,
	fifo_pe_4_1_west_push_data,
	fifo_pe_4_1_west_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_data_pop_valid;
	input wire [7:0] fifo_data_pop_data;
	output wire [0:0] fifo_data_pop_ready;
	output wire [0:0] fifo_pe_4_1_west_push_valid;
	output wire [7:0] fifo_pe_4_1_west_push_data;
	input wire [0:0] fifo_pe_4_1_west_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_3412;
	assign var_3412 = fifo_data_pop_data;
	assign fifo_data_pop_ready = executed;
	always @(posedge clk)
		if (executed)
			$display("%t\t[row_pusher_4]\t\trow_Pusher_4 pushes %d", $time, var_3412);
	assign fifo_pe_4_1_west_push_valid = executed;
	assign fifo_pe_4_1_west_push_data = var_3412;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_5_1 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	array_array_662fd_q,
	array_array_662fd_w,
	array_array_662fd_widx,
	array_array_662fd_d,
	fifo_pe_5_2_west_push_valid,
	fifo_pe_5_2_west_push_data,
	fifo_pe_5_2_west_push_ready,
	fifo_pe_6_1_north_push_valid,
	fifo_pe_6_1_north_push_data,
	fifo_pe_6_1_north_push_ready,
	pe_5_2_counter_delta,
	pe_5_2_counter_delta_ready,
	pe_6_1_counter_delta,
	pe_6_1_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	input wire [31:0] array_array_662fd_q;
	output wire [0:0] array_array_662fd_w;
	output wire [0:0] array_array_662fd_widx;
	output wire [31:0] array_array_662fd_d;
	output wire [0:0] fifo_pe_5_2_west_push_valid;
	output wire [7:0] fifo_pe_5_2_west_push_data;
	input wire [0:0] fifo_pe_5_2_west_push_ready;
	output wire [0:0] fifo_pe_6_1_north_push_valid;
	output wire [7:0] fifo_pe_6_1_north_push_data;
	input wire [0:0] fifo_pe_6_1_north_push_ready;
	output wire [7:0] pe_5_2_counter_delta;
	input wire [0:0] pe_5_2_counter_delta_ready;
	output wire [7:0] pe_6_1_counter_delta;
	input wire [0:0] pe_6_1_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1949;
	assign var_1949 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1951;
	assign var_1951 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1953;
	assign var_1953 = array_array_662fd_q[31:0];
	wire [15:0] var_1956;
	assign var_1956 = $signed(var_1949) * $signed(var_1951);
	wire [31:0] var_1959;
	assign var_1959 = {16'd0, var_1956};
	wire [31:0] var_1962;
	assign var_1962 = var_1959;
	wire [31:0] var_1964;
	assign var_1964 = $signed(var_1953) + $signed(var_1962);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_5_1]\t\tMac value: %d * %d + %d = %d", $time, var_1949, var_1951, var_1953, var_1964);
	assign pe_6_1_counter_delta = (executed ? 1 : 0);
	assign pe_5_2_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_5_2_west_push_valid = executed;
	assign fifo_pe_5_2_west_push_data = var_1949;
	assign fifo_pe_6_1_north_push_valid = executed;
	assign fifo_pe_6_1_north_push_data = var_1951;
	assign array_array_662fd_w = executed;
	assign array_array_662fd_d = var_1964;
	assign array_array_662fd_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module pe_3_4 (
	clk,
	rst_n,
	fifo_west_pop_valid,
	fifo_west_pop_data,
	fifo_west_pop_ready,
	fifo_north_pop_valid,
	fifo_north_pop_data,
	fifo_north_pop_ready,
	pe_3_5_counter_delta,
	pe_3_5_counter_delta_ready,
	fifo_pe_4_4_north_push_valid,
	fifo_pe_4_4_north_push_data,
	fifo_pe_4_4_north_push_ready,
	fifo_pe_3_5_west_push_valid,
	fifo_pe_3_5_west_push_data,
	fifo_pe_3_5_west_push_ready,
	array_array_6609d_q,
	array_array_6609d_w,
	array_array_6609d_widx,
	array_array_6609d_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_west_pop_valid;
	input wire [7:0] fifo_west_pop_data;
	output wire [0:0] fifo_west_pop_ready;
	input wire [0:0] fifo_north_pop_valid;
	input wire [7:0] fifo_north_pop_data;
	output wire [0:0] fifo_north_pop_ready;
	output wire [7:0] pe_3_5_counter_delta;
	input wire [0:0] pe_3_5_counter_delta_ready;
	output wire [0:0] fifo_pe_4_4_north_push_valid;
	output wire [7:0] fifo_pe_4_4_north_push_data;
	input wire [0:0] fifo_pe_4_4_north_push_ready;
	output wire [0:0] fifo_pe_3_5_west_push_valid;
	output wire [7:0] fifo_pe_3_5_west_push_data;
	input wire [0:0] fifo_pe_3_5_west_push_ready;
	input wire [31:0] array_array_6609d_q;
	output wire [0:0] array_array_6609d_w;
	output wire [0:0] array_array_6609d_widx;
	output wire [31:0] array_array_6609d_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	wire [7:0] var_1413;
	assign var_1413 = fifo_west_pop_data;
	assign fifo_west_pop_ready = executed;
	wire [7:0] var_1415;
	assign var_1415 = fifo_north_pop_data;
	assign fifo_north_pop_ready = executed;
	wire [31:0] var_1417;
	assign var_1417 = array_array_6609d_q[31:0];
	wire [15:0] var_1420;
	assign var_1420 = $signed(var_1413) * $signed(var_1415);
	wire [31:0] var_1423;
	assign var_1423 = {16'd0, var_1420};
	wire [31:0] var_1426;
	assign var_1426 = var_1423;
	wire [31:0] var_1428;
	assign var_1428 = $signed(var_1417) + $signed(var_1426);
	always @(posedge clk)
		if (executed)
			$display("%t\t[pe_3_4]\t\tMac value: %d * %d + %d = %d", $time, var_1413, var_1415, var_1417, var_1428);
	assign pe_3_5_counter_delta = (executed ? 1 : 0);
	assign fifo_pe_4_4_north_push_valid = executed;
	assign fifo_pe_4_4_north_push_data = var_1415;
	assign fifo_pe_3_5_west_push_valid = executed;
	assign fifo_pe_3_5_west_push_data = var_1413;
	assign array_array_6609d_w = executed;
	assign array_array_6609d_d = var_1428;
	assign array_array_6609d_widx = 1'd0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module top (
	array_array_65631_exposed_o,
	array_array_65631_exposed_i,
	array_array_65631_exposed_i_valid,
	array_array_657e9_exposed_o,
	array_array_657e9_exposed_i,
	array_array_657e9_exposed_i_valid,
	array_array_6617d_exposed_o,
	array_array_6617d_exposed_i,
	array_array_6617d_exposed_i_valid,
	array_array_6623d_exposed_o,
	array_array_6623d_exposed_i,
	array_array_6623d_exposed_i_valid,
	array_array_6635d_exposed_o,
	array_array_6635d_exposed_i,
	array_array_6635d_exposed_i_valid,
	array_array_66a01_exposed_o,
	array_array_66a01_exposed_i,
	array_array_66a01_exposed_i_valid,
	array_array_66a31_exposed_o,
	array_array_66a31_exposed_i,
	array_array_66a31_exposed_i_valid,
	array_array_66045_exposed_o,
	array_array_66045_exposed_i,
	array_array_66045_exposed_i_valid,
	array_array_65601_exposed_o,
	array_array_65601_exposed_i,
	array_array_65601_exposed_i_valid,
	array_array_6638d_exposed_o,
	array_array_6638d_exposed_i,
	array_array_6638d_exposed_i_valid,
	array_array_66971_exposed_o,
	array_array_66971_exposed_i,
	array_array_66971_exposed_i_valid,
	array_array_66c75_exposed_o,
	array_array_66c75_exposed_i,
	array_array_66c75_exposed_i_valid,
	array_array_657bd_exposed_o,
	array_array_657bd_exposed_i,
	array_array_657bd_exposed_i_valid,
	array_array_66c15_exposed_o,
	array_array_66c15_exposed_i,
	array_array_66c15_exposed_i_valid,
	array_array_66911_exposed_o,
	array_array_66911_exposed_i,
	array_array_66911_exposed_i_valid,
	array_array_656dd_exposed_o,
	array_array_656dd_exposed_i,
	array_array_656dd_exposed_i_valid,
	array_array_6554d_exposed_o,
	array_array_6554d_exposed_i,
	array_array_6554d_exposed_i_valid,
	array_array_65579_exposed_o,
	array_array_65579_exposed_i,
	array_array_65579_exposed_i_valid,
	array_array_66b21_exposed_o,
	array_array_66b21_exposed_i,
	array_array_66b21_exposed_i_valid,
	array_array_669a1_exposed_o,
	array_array_669a1_exposed_i,
	array_array_669a1_exposed_i_valid,
	array_array_66b81_exposed_o,
	array_array_66b81_exposed_i,
	array_array_66b81_exposed_i_valid,
	array_array_669d1_exposed_o,
	array_array_669d1_exposed_i,
	array_array_669d1_exposed_i_valid,
	array_array_66851_exposed_o,
	array_array_66851_exposed_i,
	array_array_66851_exposed_i_valid,
	array_array_66821_exposed_o,
	array_array_66821_exposed_i,
	array_array_66821_exposed_i_valid,
	array_array_66ca5_exposed_o,
	array_array_66ca5_exposed_i,
	array_array_66ca5_exposed_i_valid,
	array_array_65765_exposed_o,
	array_array_65765_exposed_i,
	array_array_65765_exposed_i_valid,
	array_array_6626d_exposed_o,
	array_array_6626d_exposed_i,
	array_array_6626d_exposed_i_valid,
	array_array_6629d_exposed_o,
	array_array_6629d_exposed_i,
	array_array_6629d_exposed_i_valid,
	array_array_6614d_exposed_o,
	array_array_6614d_exposed_i,
	array_array_6614d_exposed_i_valid,
	array_array_66be1_exposed_o,
	array_array_66be1_exposed_i,
	array_array_66be1_exposed_i_valid,
	array_array_655d1_exposed_o,
	array_array_655d1_exposed_i,
	array_array_655d1_exposed_i_valid,
	array_array_662cd_exposed_o,
	array_array_662cd_exposed_i,
	array_array_662cd_exposed_i_valid,
	array_array_66af1_exposed_o,
	array_array_66af1_exposed_i,
	array_array_66af1_exposed_i_valid,
	array_array_661ad_exposed_o,
	array_array_661ad_exposed_i,
	array_array_661ad_exposed_i_valid,
	array_array_668e1_exposed_o,
	array_array_668e1_exposed_i,
	array_array_668e1_exposed_i_valid,
	array_array_656b5_exposed_o,
	array_array_656b5_exposed_i,
	array_array_656b5_exposed_i_valid,
	array_array_66121_exposed_o,
	array_array_66121_exposed_i,
	array_array_66121_exposed_i_valid,
	array_array_663bd_exposed_o,
	array_array_663bd_exposed_i,
	array_array_663bd_exposed_i_valid,
	array_array_6609d_exposed_o,
	array_array_6609d_exposed_i,
	array_array_6609d_exposed_i_valid,
	array_array_66c45_exposed_o,
	array_array_66c45_exposed_i,
	array_array_66c45_exposed_i_valid,
	array_array_66b51_exposed_o,
	array_array_66b51_exposed_i,
	array_array_66b51_exposed_i_valid,
	array_array_66cd5_exposed_o,
	array_array_66cd5_exposed_i,
	array_array_66cd5_exposed_i_valid,
	array_array_66ac1_exposed_o,
	array_array_66ac1_exposed_i,
	array_array_66ac1_exposed_i_valid,
	array_array_668b1_exposed_o,
	array_array_668b1_exposed_i,
	array_array_668b1_exposed_i_valid,
	array_array_6565d_exposed_o,
	array_array_6565d_exposed_i,
	array_array_6565d_exposed_i_valid,
	array_array_660f5_exposed_o,
	array_array_660f5_exposed_i,
	array_array_660f5_exposed_i_valid,
	array_array_6568d_exposed_o,
	array_array_6568d_exposed_i,
	array_array_6568d_exposed_i_valid,
	array_array_655a5_exposed_o,
	array_array_655a5_exposed_i,
	array_array_655a5_exposed_i_valid,
	array_array_66941_exposed_o,
	array_array_66941_exposed_i,
	array_array_66941_exposed_i_valid,
	array_array_65739_exposed_o,
	array_array_65739_exposed_i,
	array_array_65739_exposed_i_valid,
	array_array_6620d_exposed_o,
	array_array_6620d_exposed_i,
	array_array_6620d_exposed_i_valid,
	array_array_66a61_exposed_o,
	array_array_66a61_exposed_i,
	array_array_66a61_exposed_i_valid,
	array_array_663ed_exposed_o,
	array_array_663ed_exposed_i,
	array_array_663ed_exposed_i_valid,
	array_array_65791_exposed_o,
	array_array_65791_exposed_i,
	array_array_65791_exposed_i_valid,
	array_array_662fd_exposed_o,
	array_array_662fd_exposed_i,
	array_array_662fd_exposed_i_valid,
	array_array_661dd_exposed_o,
	array_array_661dd_exposed_i,
	array_array_661dd_exposed_i_valid,
	array_array_66071_exposed_o,
	array_array_66071_exposed_i,
	array_array_66071_exposed_i_valid,
	array_array_6632d_exposed_o,
	array_array_6632d_exposed_i,
	array_array_6632d_exposed_i_valid,
	array_array_66a91_exposed_o,
	array_array_66a91_exposed_i,
	array_array_66a91_exposed_i_valid,
	array_array_66019_exposed_o,
	array_array_66019_exposed_i,
	array_array_66019_exposed_i_valid,
	array_array_66881_exposed_o,
	array_array_66881_exposed_i,
	array_array_66881_exposed_i_valid,
	array_array_65709_exposed_o,
	array_array_65709_exposed_i,
	array_array_65709_exposed_i_valid,
	array_array_660c9_exposed_o,
	array_array_660c9_exposed_i,
	array_array_660c9_exposed_i_valid,
	array_array_66bb1_exposed_o,
	array_array_66bb1_exposed_i,
	array_array_66bb1_exposed_i_valid,
	clk,
	rst_n
);
	output wire [31:0] array_array_65631_exposed_o;
	input wire [31:0] array_array_65631_exposed_i;
	input wire [0:0] array_array_65631_exposed_i_valid;
	output wire [31:0] array_array_657e9_exposed_o;
	input wire [31:0] array_array_657e9_exposed_i;
	input wire [0:0] array_array_657e9_exposed_i_valid;
	output wire [31:0] array_array_6617d_exposed_o;
	input wire [31:0] array_array_6617d_exposed_i;
	input wire [0:0] array_array_6617d_exposed_i_valid;
	output wire [31:0] array_array_6623d_exposed_o;
	input wire [31:0] array_array_6623d_exposed_i;
	input wire [0:0] array_array_6623d_exposed_i_valid;
	output wire [31:0] array_array_6635d_exposed_o;
	input wire [31:0] array_array_6635d_exposed_i;
	input wire [0:0] array_array_6635d_exposed_i_valid;
	output wire [31:0] array_array_66a01_exposed_o;
	input wire [31:0] array_array_66a01_exposed_i;
	input wire [0:0] array_array_66a01_exposed_i_valid;
	output wire [31:0] array_array_66a31_exposed_o;
	input wire [31:0] array_array_66a31_exposed_i;
	input wire [0:0] array_array_66a31_exposed_i_valid;
	output wire [31:0] array_array_66045_exposed_o;
	input wire [31:0] array_array_66045_exposed_i;
	input wire [0:0] array_array_66045_exposed_i_valid;
	output wire [31:0] array_array_65601_exposed_o;
	input wire [31:0] array_array_65601_exposed_i;
	input wire [0:0] array_array_65601_exposed_i_valid;
	output wire [31:0] array_array_6638d_exposed_o;
	input wire [31:0] array_array_6638d_exposed_i;
	input wire [0:0] array_array_6638d_exposed_i_valid;
	output wire [31:0] array_array_66971_exposed_o;
	input wire [31:0] array_array_66971_exposed_i;
	input wire [0:0] array_array_66971_exposed_i_valid;
	output wire [31:0] array_array_66c75_exposed_o;
	input wire [31:0] array_array_66c75_exposed_i;
	input wire [0:0] array_array_66c75_exposed_i_valid;
	output wire [31:0] array_array_657bd_exposed_o;
	input wire [31:0] array_array_657bd_exposed_i;
	input wire [0:0] array_array_657bd_exposed_i_valid;
	output wire [31:0] array_array_66c15_exposed_o;
	input wire [31:0] array_array_66c15_exposed_i;
	input wire [0:0] array_array_66c15_exposed_i_valid;
	output wire [31:0] array_array_66911_exposed_o;
	input wire [31:0] array_array_66911_exposed_i;
	input wire [0:0] array_array_66911_exposed_i_valid;
	output wire [31:0] array_array_656dd_exposed_o;
	input wire [31:0] array_array_656dd_exposed_i;
	input wire [0:0] array_array_656dd_exposed_i_valid;
	output wire [31:0] array_array_6554d_exposed_o;
	input wire [31:0] array_array_6554d_exposed_i;
	input wire [0:0] array_array_6554d_exposed_i_valid;
	output wire [31:0] array_array_65579_exposed_o;
	input wire [31:0] array_array_65579_exposed_i;
	input wire [0:0] array_array_65579_exposed_i_valid;
	output wire [31:0] array_array_66b21_exposed_o;
	input wire [31:0] array_array_66b21_exposed_i;
	input wire [0:0] array_array_66b21_exposed_i_valid;
	output wire [31:0] array_array_669a1_exposed_o;
	input wire [31:0] array_array_669a1_exposed_i;
	input wire [0:0] array_array_669a1_exposed_i_valid;
	output wire [31:0] array_array_66b81_exposed_o;
	input wire [31:0] array_array_66b81_exposed_i;
	input wire [0:0] array_array_66b81_exposed_i_valid;
	output wire [31:0] array_array_669d1_exposed_o;
	input wire [31:0] array_array_669d1_exposed_i;
	input wire [0:0] array_array_669d1_exposed_i_valid;
	output wire [31:0] array_array_66851_exposed_o;
	input wire [31:0] array_array_66851_exposed_i;
	input wire [0:0] array_array_66851_exposed_i_valid;
	output wire [31:0] array_array_66821_exposed_o;
	input wire [31:0] array_array_66821_exposed_i;
	input wire [0:0] array_array_66821_exposed_i_valid;
	output wire [31:0] array_array_66ca5_exposed_o;
	input wire [31:0] array_array_66ca5_exposed_i;
	input wire [0:0] array_array_66ca5_exposed_i_valid;
	output wire [31:0] array_array_65765_exposed_o;
	input wire [31:0] array_array_65765_exposed_i;
	input wire [0:0] array_array_65765_exposed_i_valid;
	output wire [31:0] array_array_6626d_exposed_o;
	input wire [31:0] array_array_6626d_exposed_i;
	input wire [0:0] array_array_6626d_exposed_i_valid;
	output wire [31:0] array_array_6629d_exposed_o;
	input wire [31:0] array_array_6629d_exposed_i;
	input wire [0:0] array_array_6629d_exposed_i_valid;
	output wire [31:0] array_array_6614d_exposed_o;
	input wire [31:0] array_array_6614d_exposed_i;
	input wire [0:0] array_array_6614d_exposed_i_valid;
	output wire [31:0] array_array_66be1_exposed_o;
	input wire [31:0] array_array_66be1_exposed_i;
	input wire [0:0] array_array_66be1_exposed_i_valid;
	output wire [31:0] array_array_655d1_exposed_o;
	input wire [31:0] array_array_655d1_exposed_i;
	input wire [0:0] array_array_655d1_exposed_i_valid;
	output wire [31:0] array_array_662cd_exposed_o;
	input wire [31:0] array_array_662cd_exposed_i;
	input wire [0:0] array_array_662cd_exposed_i_valid;
	output wire [31:0] array_array_66af1_exposed_o;
	input wire [31:0] array_array_66af1_exposed_i;
	input wire [0:0] array_array_66af1_exposed_i_valid;
	output wire [31:0] array_array_661ad_exposed_o;
	input wire [31:0] array_array_661ad_exposed_i;
	input wire [0:0] array_array_661ad_exposed_i_valid;
	output wire [31:0] array_array_668e1_exposed_o;
	input wire [31:0] array_array_668e1_exposed_i;
	input wire [0:0] array_array_668e1_exposed_i_valid;
	output wire [31:0] array_array_656b5_exposed_o;
	input wire [31:0] array_array_656b5_exposed_i;
	input wire [0:0] array_array_656b5_exposed_i_valid;
	output wire [31:0] array_array_66121_exposed_o;
	input wire [31:0] array_array_66121_exposed_i;
	input wire [0:0] array_array_66121_exposed_i_valid;
	output wire [31:0] array_array_663bd_exposed_o;
	input wire [31:0] array_array_663bd_exposed_i;
	input wire [0:0] array_array_663bd_exposed_i_valid;
	output wire [31:0] array_array_6609d_exposed_o;
	input wire [31:0] array_array_6609d_exposed_i;
	input wire [0:0] array_array_6609d_exposed_i_valid;
	output wire [31:0] array_array_66c45_exposed_o;
	input wire [31:0] array_array_66c45_exposed_i;
	input wire [0:0] array_array_66c45_exposed_i_valid;
	output wire [31:0] array_array_66b51_exposed_o;
	input wire [31:0] array_array_66b51_exposed_i;
	input wire [0:0] array_array_66b51_exposed_i_valid;
	output wire [31:0] array_array_66cd5_exposed_o;
	input wire [31:0] array_array_66cd5_exposed_i;
	input wire [0:0] array_array_66cd5_exposed_i_valid;
	output wire [31:0] array_array_66ac1_exposed_o;
	input wire [31:0] array_array_66ac1_exposed_i;
	input wire [0:0] array_array_66ac1_exposed_i_valid;
	output wire [31:0] array_array_668b1_exposed_o;
	input wire [31:0] array_array_668b1_exposed_i;
	input wire [0:0] array_array_668b1_exposed_i_valid;
	output wire [31:0] array_array_6565d_exposed_o;
	input wire [31:0] array_array_6565d_exposed_i;
	input wire [0:0] array_array_6565d_exposed_i_valid;
	output wire [31:0] array_array_660f5_exposed_o;
	input wire [31:0] array_array_660f5_exposed_i;
	input wire [0:0] array_array_660f5_exposed_i_valid;
	output wire [31:0] array_array_6568d_exposed_o;
	input wire [31:0] array_array_6568d_exposed_i;
	input wire [0:0] array_array_6568d_exposed_i_valid;
	output wire [31:0] array_array_655a5_exposed_o;
	input wire [31:0] array_array_655a5_exposed_i;
	input wire [0:0] array_array_655a5_exposed_i_valid;
	output wire [31:0] array_array_66941_exposed_o;
	input wire [31:0] array_array_66941_exposed_i;
	input wire [0:0] array_array_66941_exposed_i_valid;
	output wire [31:0] array_array_65739_exposed_o;
	input wire [31:0] array_array_65739_exposed_i;
	input wire [0:0] array_array_65739_exposed_i_valid;
	output wire [31:0] array_array_6620d_exposed_o;
	input wire [31:0] array_array_6620d_exposed_i;
	input wire [0:0] array_array_6620d_exposed_i_valid;
	output wire [31:0] array_array_66a61_exposed_o;
	input wire [31:0] array_array_66a61_exposed_i;
	input wire [0:0] array_array_66a61_exposed_i_valid;
	output wire [31:0] array_array_663ed_exposed_o;
	input wire [31:0] array_array_663ed_exposed_i;
	input wire [0:0] array_array_663ed_exposed_i_valid;
	output wire [31:0] array_array_65791_exposed_o;
	input wire [31:0] array_array_65791_exposed_i;
	input wire [0:0] array_array_65791_exposed_i_valid;
	output wire [31:0] array_array_662fd_exposed_o;
	input wire [31:0] array_array_662fd_exposed_i;
	input wire [0:0] array_array_662fd_exposed_i_valid;
	output wire [31:0] array_array_661dd_exposed_o;
	input wire [31:0] array_array_661dd_exposed_i;
	input wire [0:0] array_array_661dd_exposed_i_valid;
	output wire [31:0] array_array_66071_exposed_o;
	input wire [31:0] array_array_66071_exposed_i;
	input wire [0:0] array_array_66071_exposed_i_valid;
	output wire [31:0] array_array_6632d_exposed_o;
	input wire [31:0] array_array_6632d_exposed_i;
	input wire [0:0] array_array_6632d_exposed_i_valid;
	output wire [31:0] array_array_66a91_exposed_o;
	input wire [31:0] array_array_66a91_exposed_i;
	input wire [0:0] array_array_66a91_exposed_i_valid;
	output wire [31:0] array_array_66019_exposed_o;
	input wire [31:0] array_array_66019_exposed_i;
	input wire [0:0] array_array_66019_exposed_i_valid;
	output wire [31:0] array_array_66881_exposed_o;
	input wire [31:0] array_array_66881_exposed_i;
	input wire [0:0] array_array_66881_exposed_i_valid;
	output wire [31:0] array_array_65709_exposed_o;
	input wire [31:0] array_array_65709_exposed_i;
	input wire [0:0] array_array_65709_exposed_i_valid;
	output wire [31:0] array_array_660c9_exposed_o;
	input wire [31:0] array_array_660c9_exposed_i;
	input wire [0:0] array_array_660c9_exposed_i_valid;
	output wire [31:0] array_array_66bb1_exposed_o;
	input wire [31:0] array_array_66bb1_exposed_i;
	input wire [0:0] array_array_66bb1_exposed_i_valid;
	input wire clk;
	input wire rst_n;
	reg [31:0] array_array_661ad_q;
	wire [31:0] array_array_661ad_driver_pe_4_2_d;
	wire [0:0] array_array_661ad_driver_pe_4_2_w;
	wire [0:0] array_array_661ad_driver_pe_4_2_widx;
	assign array_array_661ad_exposed_o = array_array_661ad_q;
	wire [31:0] array_array_661ad_temp;
	wire [31:0] array_array_661ad_d;
	assign array_array_661ad_temp = (array_array_661ad_exposed_i_valid ? array_array_661ad_exposed_i : array_array_661ad_d);
	wire [0:0] array_array_661ad_widx;
	wire [0:0] array_array_661ad_w;
	assign array_array_661ad_d = {32 {array_array_661ad_driver_pe_4_2_w}} & array_array_661ad_driver_pe_4_2_d;
	assign array_array_661ad_widx = {array_array_661ad_driver_pe_4_2_w} & array_array_661ad_driver_pe_4_2_widx;
	assign array_array_661ad_w = array_array_661ad_driver_pe_4_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_661ad_q <= 32'd0;
		else if (array_array_661ad_w)
			case (array_array_661ad_widx)
				0: array_array_661ad_q[31:0] <= array_array_661ad_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66cd5_q;
	wire [31:0] array_array_66cd5_driver_pe_8_8_d;
	wire [0:0] array_array_66cd5_driver_pe_8_8_w;
	wire [0:0] array_array_66cd5_driver_pe_8_8_widx;
	assign array_array_66cd5_exposed_o = array_array_66cd5_q;
	wire [31:0] array_array_66cd5_temp;
	wire [31:0] array_array_66cd5_d;
	assign array_array_66cd5_temp = (array_array_66cd5_exposed_i_valid ? array_array_66cd5_exposed_i : array_array_66cd5_d);
	wire [0:0] array_array_66cd5_widx;
	wire [0:0] array_array_66cd5_w;
	assign array_array_66cd5_d = {32 {array_array_66cd5_driver_pe_8_8_w}} & array_array_66cd5_driver_pe_8_8_d;
	assign array_array_66cd5_widx = {array_array_66cd5_driver_pe_8_8_w} & array_array_66cd5_driver_pe_8_8_widx;
	assign array_array_66cd5_w = array_array_66cd5_driver_pe_8_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66cd5_q <= 32'd0;
		else if (array_array_66cd5_w)
			case (array_array_66cd5_widx)
				0: array_array_66cd5_q[31:0] <= array_array_66cd5_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66ca5_q;
	wire [31:0] array_array_66ca5_driver_pe_8_7_d;
	wire [0:0] array_array_66ca5_driver_pe_8_7_w;
	wire [0:0] array_array_66ca5_driver_pe_8_7_widx;
	assign array_array_66ca5_exposed_o = array_array_66ca5_q;
	wire [31:0] array_array_66ca5_temp;
	wire [31:0] array_array_66ca5_d;
	assign array_array_66ca5_temp = (array_array_66ca5_exposed_i_valid ? array_array_66ca5_exposed_i : array_array_66ca5_d);
	wire [0:0] array_array_66ca5_widx;
	wire [0:0] array_array_66ca5_w;
	assign array_array_66ca5_d = {32 {array_array_66ca5_driver_pe_8_7_w}} & array_array_66ca5_driver_pe_8_7_d;
	assign array_array_66ca5_widx = {array_array_66ca5_driver_pe_8_7_w} & array_array_66ca5_driver_pe_8_7_widx;
	assign array_array_66ca5_w = array_array_66ca5_driver_pe_8_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66ca5_q <= 32'd0;
		else if (array_array_66ca5_w)
			case (array_array_66ca5_widx)
				0: array_array_66ca5_q[31:0] <= array_array_66ca5_temp;
				default:
					;
			endcase
	reg [31:0] array_array_663ed_q;
	wire [31:0] array_array_663ed_driver_pe_5_6_d;
	wire [0:0] array_array_663ed_driver_pe_5_6_w;
	wire [0:0] array_array_663ed_driver_pe_5_6_widx;
	assign array_array_663ed_exposed_o = array_array_663ed_q;
	wire [31:0] array_array_663ed_temp;
	wire [31:0] array_array_663ed_d;
	assign array_array_663ed_temp = (array_array_663ed_exposed_i_valid ? array_array_663ed_exposed_i : array_array_663ed_d);
	wire [0:0] array_array_663ed_widx;
	wire [0:0] array_array_663ed_w;
	assign array_array_663ed_d = {32 {array_array_663ed_driver_pe_5_6_w}} & array_array_663ed_driver_pe_5_6_d;
	assign array_array_663ed_widx = {array_array_663ed_driver_pe_5_6_w} & array_array_663ed_driver_pe_5_6_widx;
	assign array_array_663ed_w = array_array_663ed_driver_pe_5_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_663ed_q <= 32'd0;
		else if (array_array_663ed_w)
			case (array_array_663ed_widx)
				0: array_array_663ed_q[31:0] <= array_array_663ed_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66c45_q;
	wire [31:0] array_array_66c45_driver_pe_8_5_d;
	wire [0:0] array_array_66c45_driver_pe_8_5_w;
	wire [0:0] array_array_66c45_driver_pe_8_5_widx;
	assign array_array_66c45_exposed_o = array_array_66c45_q;
	wire [31:0] array_array_66c45_temp;
	wire [31:0] array_array_66c45_d;
	assign array_array_66c45_temp = (array_array_66c45_exposed_i_valid ? array_array_66c45_exposed_i : array_array_66c45_d);
	wire [0:0] array_array_66c45_widx;
	wire [0:0] array_array_66c45_w;
	assign array_array_66c45_d = {32 {array_array_66c45_driver_pe_8_5_w}} & array_array_66c45_driver_pe_8_5_d;
	assign array_array_66c45_widx = {array_array_66c45_driver_pe_8_5_w} & array_array_66c45_driver_pe_8_5_widx;
	assign array_array_66c45_w = array_array_66c45_driver_pe_8_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66c45_q <= 32'd0;
		else if (array_array_66c45_w)
			case (array_array_66c45_widx)
				0: array_array_66c45_q[31:0] <= array_array_66c45_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66971_q;
	wire [31:0] array_array_66971_driver_pe_6_6_d;
	wire [0:0] array_array_66971_driver_pe_6_6_w;
	wire [0:0] array_array_66971_driver_pe_6_6_widx;
	assign array_array_66971_exposed_o = array_array_66971_q;
	wire [31:0] array_array_66971_temp;
	wire [31:0] array_array_66971_d;
	assign array_array_66971_temp = (array_array_66971_exposed_i_valid ? array_array_66971_exposed_i : array_array_66971_d);
	wire [0:0] array_array_66971_widx;
	wire [0:0] array_array_66971_w;
	assign array_array_66971_d = {32 {array_array_66971_driver_pe_6_6_w}} & array_array_66971_driver_pe_6_6_d;
	assign array_array_66971_widx = {array_array_66971_driver_pe_6_6_w} & array_array_66971_driver_pe_6_6_widx;
	assign array_array_66971_w = array_array_66971_driver_pe_6_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66971_q <= 32'd0;
		else if (array_array_66971_w)
			case (array_array_66971_widx)
				0: array_array_66971_q[31:0] <= array_array_66971_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6568d_q;
	wire [31:0] array_array_6568d_driver_pe_1_8_d;
	wire [0:0] array_array_6568d_driver_pe_1_8_w;
	wire [0:0] array_array_6568d_driver_pe_1_8_widx;
	assign array_array_6568d_exposed_o = array_array_6568d_q;
	wire [31:0] array_array_6568d_temp;
	wire [31:0] array_array_6568d_d;
	assign array_array_6568d_temp = (array_array_6568d_exposed_i_valid ? array_array_6568d_exposed_i : array_array_6568d_d);
	wire [0:0] array_array_6568d_widx;
	wire [0:0] array_array_6568d_w;
	assign array_array_6568d_d = {32 {array_array_6568d_driver_pe_1_8_w}} & array_array_6568d_driver_pe_1_8_d;
	assign array_array_6568d_widx = {array_array_6568d_driver_pe_1_8_w} & array_array_6568d_driver_pe_1_8_widx;
	assign array_array_6568d_w = array_array_6568d_driver_pe_1_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6568d_q <= 32'd0;
		else if (array_array_6568d_w)
			case (array_array_6568d_widx)
				0: array_array_6568d_q[31:0] <= array_array_6568d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_660f5_q;
	wire [31:0] array_array_660f5_driver_pe_3_6_d;
	wire [0:0] array_array_660f5_driver_pe_3_6_w;
	wire [0:0] array_array_660f5_driver_pe_3_6_widx;
	assign array_array_660f5_exposed_o = array_array_660f5_q;
	wire [31:0] array_array_660f5_temp;
	wire [31:0] array_array_660f5_d;
	assign array_array_660f5_temp = (array_array_660f5_exposed_i_valid ? array_array_660f5_exposed_i : array_array_660f5_d);
	wire [0:0] array_array_660f5_widx;
	wire [0:0] array_array_660f5_w;
	assign array_array_660f5_d = {32 {array_array_660f5_driver_pe_3_6_w}} & array_array_660f5_driver_pe_3_6_d;
	assign array_array_660f5_widx = {array_array_660f5_driver_pe_3_6_w} & array_array_660f5_driver_pe_3_6_widx;
	assign array_array_660f5_w = array_array_660f5_driver_pe_3_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_660f5_q <= 32'd0;
		else if (array_array_660f5_w)
			case (array_array_660f5_widx)
				0: array_array_660f5_q[31:0] <= array_array_660f5_temp;
				default:
					;
			endcase
	reg [31:0] array_array_663bd_q;
	wire [31:0] array_array_663bd_driver_pe_5_5_d;
	wire [0:0] array_array_663bd_driver_pe_5_5_w;
	wire [0:0] array_array_663bd_driver_pe_5_5_widx;
	assign array_array_663bd_exposed_o = array_array_663bd_q;
	wire [31:0] array_array_663bd_temp;
	wire [31:0] array_array_663bd_d;
	assign array_array_663bd_temp = (array_array_663bd_exposed_i_valid ? array_array_663bd_exposed_i : array_array_663bd_d);
	wire [0:0] array_array_663bd_widx;
	wire [0:0] array_array_663bd_w;
	assign array_array_663bd_d = {32 {array_array_663bd_driver_pe_5_5_w}} & array_array_663bd_driver_pe_5_5_d;
	assign array_array_663bd_widx = {array_array_663bd_driver_pe_5_5_w} & array_array_663bd_driver_pe_5_5_widx;
	assign array_array_663bd_w = array_array_663bd_driver_pe_5_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_663bd_q <= 32'd0;
		else if (array_array_663bd_w)
			case (array_array_663bd_widx)
				0: array_array_663bd_q[31:0] <= array_array_663bd_temp;
				default:
					;
			endcase
	reg [31:0] array_array_669a1_q;
	wire [31:0] array_array_669a1_driver_pe_6_7_d;
	wire [0:0] array_array_669a1_driver_pe_6_7_w;
	wire [0:0] array_array_669a1_driver_pe_6_7_widx;
	assign array_array_669a1_exposed_o = array_array_669a1_q;
	wire [31:0] array_array_669a1_temp;
	wire [31:0] array_array_669a1_d;
	assign array_array_669a1_temp = (array_array_669a1_exposed_i_valid ? array_array_669a1_exposed_i : array_array_669a1_d);
	wire [0:0] array_array_669a1_widx;
	wire [0:0] array_array_669a1_w;
	assign array_array_669a1_d = {32 {array_array_669a1_driver_pe_6_7_w}} & array_array_669a1_driver_pe_6_7_d;
	assign array_array_669a1_widx = {array_array_669a1_driver_pe_6_7_w} & array_array_669a1_driver_pe_6_7_widx;
	assign array_array_669a1_w = array_array_669a1_driver_pe_6_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_669a1_q <= 32'd0;
		else if (array_array_669a1_w)
			case (array_array_669a1_widx)
				0: array_array_669a1_q[31:0] <= array_array_669a1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66a01_q;
	wire [31:0] array_array_66a01_driver_pe_7_1_d;
	wire [0:0] array_array_66a01_driver_pe_7_1_w;
	wire [0:0] array_array_66a01_driver_pe_7_1_widx;
	assign array_array_66a01_exposed_o = array_array_66a01_q;
	wire [31:0] array_array_66a01_temp;
	wire [31:0] array_array_66a01_d;
	assign array_array_66a01_temp = (array_array_66a01_exposed_i_valid ? array_array_66a01_exposed_i : array_array_66a01_d);
	wire [0:0] array_array_66a01_widx;
	wire [0:0] array_array_66a01_w;
	assign array_array_66a01_d = {32 {array_array_66a01_driver_pe_7_1_w}} & array_array_66a01_driver_pe_7_1_d;
	assign array_array_66a01_widx = {array_array_66a01_driver_pe_7_1_w} & array_array_66a01_driver_pe_7_1_widx;
	assign array_array_66a01_w = array_array_66a01_driver_pe_7_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66a01_q <= 32'd0;
		else if (array_array_66a01_w)
			case (array_array_66a01_widx)
				0: array_array_66a01_q[31:0] <= array_array_66a01_temp;
				default:
					;
			endcase
	reg [31:0] array_array_660c9_q;
	wire [31:0] array_array_660c9_driver_pe_3_5_d;
	wire [0:0] array_array_660c9_driver_pe_3_5_w;
	wire [0:0] array_array_660c9_driver_pe_3_5_widx;
	assign array_array_660c9_exposed_o = array_array_660c9_q;
	wire [31:0] array_array_660c9_temp;
	wire [31:0] array_array_660c9_d;
	assign array_array_660c9_temp = (array_array_660c9_exposed_i_valid ? array_array_660c9_exposed_i : array_array_660c9_d);
	wire [0:0] array_array_660c9_widx;
	wire [0:0] array_array_660c9_w;
	assign array_array_660c9_d = {32 {array_array_660c9_driver_pe_3_5_w}} & array_array_660c9_driver_pe_3_5_d;
	assign array_array_660c9_widx = {array_array_660c9_driver_pe_3_5_w} & array_array_660c9_driver_pe_3_5_widx;
	assign array_array_660c9_w = array_array_660c9_driver_pe_3_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_660c9_q <= 32'd0;
		else if (array_array_660c9_w)
			case (array_array_660c9_widx)
				0: array_array_660c9_q[31:0] <= array_array_660c9_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66881_q;
	wire [31:0] array_array_66881_driver_pe_6_1_d;
	wire [0:0] array_array_66881_driver_pe_6_1_w;
	wire [0:0] array_array_66881_driver_pe_6_1_widx;
	assign array_array_66881_exposed_o = array_array_66881_q;
	wire [31:0] array_array_66881_temp;
	wire [31:0] array_array_66881_d;
	assign array_array_66881_temp = (array_array_66881_exposed_i_valid ? array_array_66881_exposed_i : array_array_66881_d);
	wire [0:0] array_array_66881_widx;
	wire [0:0] array_array_66881_w;
	assign array_array_66881_d = {32 {array_array_66881_driver_pe_6_1_w}} & array_array_66881_driver_pe_6_1_d;
	assign array_array_66881_widx = {array_array_66881_driver_pe_6_1_w} & array_array_66881_driver_pe_6_1_widx;
	assign array_array_66881_w = array_array_66881_driver_pe_6_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66881_q <= 32'd0;
		else if (array_array_66881_w)
			case (array_array_66881_widx)
				0: array_array_66881_q[31:0] <= array_array_66881_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6617d_q;
	wire [31:0] array_array_6617d_driver_pe_4_1_d;
	wire [0:0] array_array_6617d_driver_pe_4_1_w;
	wire [0:0] array_array_6617d_driver_pe_4_1_widx;
	assign array_array_6617d_exposed_o = array_array_6617d_q;
	wire [31:0] array_array_6617d_temp;
	wire [31:0] array_array_6617d_d;
	assign array_array_6617d_temp = (array_array_6617d_exposed_i_valid ? array_array_6617d_exposed_i : array_array_6617d_d);
	wire [0:0] array_array_6617d_widx;
	wire [0:0] array_array_6617d_w;
	assign array_array_6617d_d = {32 {array_array_6617d_driver_pe_4_1_w}} & array_array_6617d_driver_pe_4_1_d;
	assign array_array_6617d_widx = {array_array_6617d_driver_pe_4_1_w} & array_array_6617d_driver_pe_4_1_widx;
	assign array_array_6617d_w = array_array_6617d_driver_pe_4_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6617d_q <= 32'd0;
		else if (array_array_6617d_w)
			case (array_array_6617d_widx)
				0: array_array_6617d_q[31:0] <= array_array_6617d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6638d_q;
	wire [31:0] array_array_6638d_driver_pe_5_4_d;
	wire [0:0] array_array_6638d_driver_pe_5_4_w;
	wire [0:0] array_array_6638d_driver_pe_5_4_widx;
	assign array_array_6638d_exposed_o = array_array_6638d_q;
	wire [31:0] array_array_6638d_temp;
	wire [31:0] array_array_6638d_d;
	assign array_array_6638d_temp = (array_array_6638d_exposed_i_valid ? array_array_6638d_exposed_i : array_array_6638d_d);
	wire [0:0] array_array_6638d_widx;
	wire [0:0] array_array_6638d_w;
	assign array_array_6638d_d = {32 {array_array_6638d_driver_pe_5_4_w}} & array_array_6638d_driver_pe_5_4_d;
	assign array_array_6638d_widx = {array_array_6638d_driver_pe_5_4_w} & array_array_6638d_driver_pe_5_4_widx;
	assign array_array_6638d_w = array_array_6638d_driver_pe_5_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6638d_q <= 32'd0;
		else if (array_array_6638d_w)
			case (array_array_6638d_widx)
				0: array_array_6638d_q[31:0] <= array_array_6638d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_65739_q;
	wire [31:0] array_array_65739_driver_pe_2_4_d;
	wire [0:0] array_array_65739_driver_pe_2_4_w;
	wire [0:0] array_array_65739_driver_pe_2_4_widx;
	assign array_array_65739_exposed_o = array_array_65739_q;
	wire [31:0] array_array_65739_temp;
	wire [31:0] array_array_65739_d;
	assign array_array_65739_temp = (array_array_65739_exposed_i_valid ? array_array_65739_exposed_i : array_array_65739_d);
	wire [0:0] array_array_65739_widx;
	wire [0:0] array_array_65739_w;
	assign array_array_65739_d = {32 {array_array_65739_driver_pe_2_4_w}} & array_array_65739_driver_pe_2_4_d;
	assign array_array_65739_widx = {array_array_65739_driver_pe_2_4_w} & array_array_65739_driver_pe_2_4_widx;
	assign array_array_65739_w = array_array_65739_driver_pe_2_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_65739_q <= 32'd0;
		else if (array_array_65739_w)
			case (array_array_65739_widx)
				0: array_array_65739_q[31:0] <= array_array_65739_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66a91_q;
	wire [31:0] array_array_66a91_driver_pe_7_4_d;
	wire [0:0] array_array_66a91_driver_pe_7_4_w;
	wire [0:0] array_array_66a91_driver_pe_7_4_widx;
	assign array_array_66a91_exposed_o = array_array_66a91_q;
	wire [31:0] array_array_66a91_temp;
	wire [31:0] array_array_66a91_d;
	assign array_array_66a91_temp = (array_array_66a91_exposed_i_valid ? array_array_66a91_exposed_i : array_array_66a91_d);
	wire [0:0] array_array_66a91_widx;
	wire [0:0] array_array_66a91_w;
	assign array_array_66a91_d = {32 {array_array_66a91_driver_pe_7_4_w}} & array_array_66a91_driver_pe_7_4_d;
	assign array_array_66a91_widx = {array_array_66a91_driver_pe_7_4_w} & array_array_66a91_driver_pe_7_4_widx;
	assign array_array_66a91_w = array_array_66a91_driver_pe_7_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66a91_q <= 32'd0;
		else if (array_array_66a91_w)
			case (array_array_66a91_widx)
				0: array_array_66a91_q[31:0] <= array_array_66a91_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66a61_q;
	wire [31:0] array_array_66a61_driver_pe_7_3_d;
	wire [0:0] array_array_66a61_driver_pe_7_3_w;
	wire [0:0] array_array_66a61_driver_pe_7_3_widx;
	assign array_array_66a61_exposed_o = array_array_66a61_q;
	wire [31:0] array_array_66a61_temp;
	wire [31:0] array_array_66a61_d;
	assign array_array_66a61_temp = (array_array_66a61_exposed_i_valid ? array_array_66a61_exposed_i : array_array_66a61_d);
	wire [0:0] array_array_66a61_widx;
	wire [0:0] array_array_66a61_w;
	assign array_array_66a61_d = {32 {array_array_66a61_driver_pe_7_3_w}} & array_array_66a61_driver_pe_7_3_d;
	assign array_array_66a61_widx = {array_array_66a61_driver_pe_7_3_w} & array_array_66a61_driver_pe_7_3_widx;
	assign array_array_66a61_w = array_array_66a61_driver_pe_7_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66a61_q <= 32'd0;
		else if (array_array_66a61_w)
			case (array_array_66a61_widx)
				0: array_array_66a61_q[31:0] <= array_array_66a61_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66ac1_q;
	wire [31:0] array_array_66ac1_driver_pe_7_5_d;
	wire [0:0] array_array_66ac1_driver_pe_7_5_w;
	wire [0:0] array_array_66ac1_driver_pe_7_5_widx;
	assign array_array_66ac1_exposed_o = array_array_66ac1_q;
	wire [31:0] array_array_66ac1_temp;
	wire [31:0] array_array_66ac1_d;
	assign array_array_66ac1_temp = (array_array_66ac1_exposed_i_valid ? array_array_66ac1_exposed_i : array_array_66ac1_d);
	wire [0:0] array_array_66ac1_widx;
	wire [0:0] array_array_66ac1_w;
	assign array_array_66ac1_d = {32 {array_array_66ac1_driver_pe_7_5_w}} & array_array_66ac1_driver_pe_7_5_d;
	assign array_array_66ac1_widx = {array_array_66ac1_driver_pe_7_5_w} & array_array_66ac1_driver_pe_7_5_widx;
	assign array_array_66ac1_w = array_array_66ac1_driver_pe_7_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66ac1_q <= 32'd0;
		else if (array_array_66ac1_w)
			case (array_array_66ac1_widx)
				0: array_array_66ac1_q[31:0] <= array_array_66ac1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_655a5_q;
	wire [31:0] array_array_655a5_driver_pe_1_3_d;
	wire [0:0] array_array_655a5_driver_pe_1_3_w;
	wire [0:0] array_array_655a5_driver_pe_1_3_widx;
	assign array_array_655a5_exposed_o = array_array_655a5_q;
	wire [31:0] array_array_655a5_temp;
	wire [31:0] array_array_655a5_d;
	assign array_array_655a5_temp = (array_array_655a5_exposed_i_valid ? array_array_655a5_exposed_i : array_array_655a5_d);
	wire [0:0] array_array_655a5_widx;
	wire [0:0] array_array_655a5_w;
	assign array_array_655a5_d = {32 {array_array_655a5_driver_pe_1_3_w}} & array_array_655a5_driver_pe_1_3_d;
	assign array_array_655a5_widx = {array_array_655a5_driver_pe_1_3_w} & array_array_655a5_driver_pe_1_3_widx;
	assign array_array_655a5_w = array_array_655a5_driver_pe_1_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_655a5_q <= 32'd0;
		else if (array_array_655a5_w)
			case (array_array_655a5_widx)
				0: array_array_655a5_q[31:0] <= array_array_655a5_temp;
				default:
					;
			endcase
	reg [31:0] array_array_657bd_q;
	wire [31:0] array_array_657bd_driver_pe_2_7_d;
	wire [0:0] array_array_657bd_driver_pe_2_7_w;
	wire [0:0] array_array_657bd_driver_pe_2_7_widx;
	assign array_array_657bd_exposed_o = array_array_657bd_q;
	wire [31:0] array_array_657bd_temp;
	wire [31:0] array_array_657bd_d;
	assign array_array_657bd_temp = (array_array_657bd_exposed_i_valid ? array_array_657bd_exposed_i : array_array_657bd_d);
	wire [0:0] array_array_657bd_widx;
	wire [0:0] array_array_657bd_w;
	assign array_array_657bd_d = {32 {array_array_657bd_driver_pe_2_7_w}} & array_array_657bd_driver_pe_2_7_d;
	assign array_array_657bd_widx = {array_array_657bd_driver_pe_2_7_w} & array_array_657bd_driver_pe_2_7_widx;
	assign array_array_657bd_w = array_array_657bd_driver_pe_2_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_657bd_q <= 32'd0;
		else if (array_array_657bd_w)
			case (array_array_657bd_widx)
				0: array_array_657bd_q[31:0] <= array_array_657bd_temp;
				default:
					;
			endcase
	reg [31:0] array_array_65765_q;
	wire [31:0] array_array_65765_driver_pe_2_5_d;
	wire [0:0] array_array_65765_driver_pe_2_5_w;
	wire [0:0] array_array_65765_driver_pe_2_5_widx;
	assign array_array_65765_exposed_o = array_array_65765_q;
	wire [31:0] array_array_65765_temp;
	wire [31:0] array_array_65765_d;
	assign array_array_65765_temp = (array_array_65765_exposed_i_valid ? array_array_65765_exposed_i : array_array_65765_d);
	wire [0:0] array_array_65765_widx;
	wire [0:0] array_array_65765_w;
	assign array_array_65765_d = {32 {array_array_65765_driver_pe_2_5_w}} & array_array_65765_driver_pe_2_5_d;
	assign array_array_65765_widx = {array_array_65765_driver_pe_2_5_w} & array_array_65765_driver_pe_2_5_widx;
	assign array_array_65765_w = array_array_65765_driver_pe_2_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_65765_q <= 32'd0;
		else if (array_array_65765_w)
			case (array_array_65765_widx)
				0: array_array_65765_q[31:0] <= array_array_65765_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66b51_q;
	wire [31:0] array_array_66b51_driver_pe_7_8_d;
	wire [0:0] array_array_66b51_driver_pe_7_8_w;
	wire [0:0] array_array_66b51_driver_pe_7_8_widx;
	assign array_array_66b51_exposed_o = array_array_66b51_q;
	wire [31:0] array_array_66b51_temp;
	wire [31:0] array_array_66b51_d;
	assign array_array_66b51_temp = (array_array_66b51_exposed_i_valid ? array_array_66b51_exposed_i : array_array_66b51_d);
	wire [0:0] array_array_66b51_widx;
	wire [0:0] array_array_66b51_w;
	assign array_array_66b51_d = {32 {array_array_66b51_driver_pe_7_8_w}} & array_array_66b51_driver_pe_7_8_d;
	assign array_array_66b51_widx = {array_array_66b51_driver_pe_7_8_w} & array_array_66b51_driver_pe_7_8_widx;
	assign array_array_66b51_w = array_array_66b51_driver_pe_7_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66b51_q <= 32'd0;
		else if (array_array_66b51_w)
			case (array_array_66b51_widx)
				0: array_array_66b51_q[31:0] <= array_array_66b51_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66c15_q;
	wire [31:0] array_array_66c15_driver_pe_8_4_d;
	wire [0:0] array_array_66c15_driver_pe_8_4_w;
	wire [0:0] array_array_66c15_driver_pe_8_4_widx;
	assign array_array_66c15_exposed_o = array_array_66c15_q;
	wire [31:0] array_array_66c15_temp;
	wire [31:0] array_array_66c15_d;
	assign array_array_66c15_temp = (array_array_66c15_exposed_i_valid ? array_array_66c15_exposed_i : array_array_66c15_d);
	wire [0:0] array_array_66c15_widx;
	wire [0:0] array_array_66c15_w;
	assign array_array_66c15_d = {32 {array_array_66c15_driver_pe_8_4_w}} & array_array_66c15_driver_pe_8_4_d;
	assign array_array_66c15_widx = {array_array_66c15_driver_pe_8_4_w} & array_array_66c15_driver_pe_8_4_widx;
	assign array_array_66c15_w = array_array_66c15_driver_pe_8_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66c15_q <= 32'd0;
		else if (array_array_66c15_w)
			case (array_array_66c15_widx)
				0: array_array_66c15_q[31:0] <= array_array_66c15_temp;
				default:
					;
			endcase
	reg [31:0] array_array_657e9_q;
	wire [31:0] array_array_657e9_driver_pe_2_8_d;
	wire [0:0] array_array_657e9_driver_pe_2_8_w;
	wire [0:0] array_array_657e9_driver_pe_2_8_widx;
	assign array_array_657e9_exposed_o = array_array_657e9_q;
	wire [31:0] array_array_657e9_temp;
	wire [31:0] array_array_657e9_d;
	assign array_array_657e9_temp = (array_array_657e9_exposed_i_valid ? array_array_657e9_exposed_i : array_array_657e9_d);
	wire [0:0] array_array_657e9_widx;
	wire [0:0] array_array_657e9_w;
	assign array_array_657e9_d = {32 {array_array_657e9_driver_pe_2_8_w}} & array_array_657e9_driver_pe_2_8_d;
	assign array_array_657e9_widx = {array_array_657e9_driver_pe_2_8_w} & array_array_657e9_driver_pe_2_8_widx;
	assign array_array_657e9_w = array_array_657e9_driver_pe_2_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_657e9_q <= 32'd0;
		else if (array_array_657e9_w)
			case (array_array_657e9_widx)
				0: array_array_657e9_q[31:0] <= array_array_657e9_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66045_q;
	wire [31:0] array_array_66045_driver_pe_3_2_d;
	wire [0:0] array_array_66045_driver_pe_3_2_w;
	wire [0:0] array_array_66045_driver_pe_3_2_widx;
	assign array_array_66045_exposed_o = array_array_66045_q;
	wire [31:0] array_array_66045_temp;
	wire [31:0] array_array_66045_d;
	assign array_array_66045_temp = (array_array_66045_exposed_i_valid ? array_array_66045_exposed_i : array_array_66045_d);
	wire [0:0] array_array_66045_widx;
	wire [0:0] array_array_66045_w;
	assign array_array_66045_d = {32 {array_array_66045_driver_pe_3_2_w}} & array_array_66045_driver_pe_3_2_d;
	assign array_array_66045_widx = {array_array_66045_driver_pe_3_2_w} & array_array_66045_driver_pe_3_2_widx;
	assign array_array_66045_w = array_array_66045_driver_pe_3_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66045_q <= 32'd0;
		else if (array_array_66045_w)
			case (array_array_66045_widx)
				0: array_array_66045_q[31:0] <= array_array_66045_temp;
				default:
					;
			endcase
	reg [31:0] array_array_65631_q;
	wire [31:0] array_array_65631_driver_pe_1_6_d;
	wire [0:0] array_array_65631_driver_pe_1_6_w;
	wire [0:0] array_array_65631_driver_pe_1_6_widx;
	assign array_array_65631_exposed_o = array_array_65631_q;
	wire [31:0] array_array_65631_temp;
	wire [31:0] array_array_65631_d;
	assign array_array_65631_temp = (array_array_65631_exposed_i_valid ? array_array_65631_exposed_i : array_array_65631_d);
	wire [0:0] array_array_65631_widx;
	wire [0:0] array_array_65631_w;
	assign array_array_65631_d = {32 {array_array_65631_driver_pe_1_6_w}} & array_array_65631_driver_pe_1_6_d;
	assign array_array_65631_widx = {array_array_65631_driver_pe_1_6_w} & array_array_65631_driver_pe_1_6_widx;
	assign array_array_65631_w = array_array_65631_driver_pe_1_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_65631_q <= 32'd0;
		else if (array_array_65631_w)
			case (array_array_65631_widx)
				0: array_array_65631_q[31:0] <= array_array_65631_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66af1_q;
	wire [31:0] array_array_66af1_driver_pe_7_6_d;
	wire [0:0] array_array_66af1_driver_pe_7_6_w;
	wire [0:0] array_array_66af1_driver_pe_7_6_widx;
	assign array_array_66af1_exposed_o = array_array_66af1_q;
	wire [31:0] array_array_66af1_temp;
	wire [31:0] array_array_66af1_d;
	assign array_array_66af1_temp = (array_array_66af1_exposed_i_valid ? array_array_66af1_exposed_i : array_array_66af1_d);
	wire [0:0] array_array_66af1_widx;
	wire [0:0] array_array_66af1_w;
	assign array_array_66af1_d = {32 {array_array_66af1_driver_pe_7_6_w}} & array_array_66af1_driver_pe_7_6_d;
	assign array_array_66af1_widx = {array_array_66af1_driver_pe_7_6_w} & array_array_66af1_driver_pe_7_6_widx;
	assign array_array_66af1_w = array_array_66af1_driver_pe_7_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66af1_q <= 32'd0;
		else if (array_array_66af1_w)
			case (array_array_66af1_widx)
				0: array_array_66af1_q[31:0] <= array_array_66af1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66b21_q;
	wire [31:0] array_array_66b21_driver_pe_7_7_d;
	wire [0:0] array_array_66b21_driver_pe_7_7_w;
	wire [0:0] array_array_66b21_driver_pe_7_7_widx;
	assign array_array_66b21_exposed_o = array_array_66b21_q;
	wire [31:0] array_array_66b21_temp;
	wire [31:0] array_array_66b21_d;
	assign array_array_66b21_temp = (array_array_66b21_exposed_i_valid ? array_array_66b21_exposed_i : array_array_66b21_d);
	wire [0:0] array_array_66b21_widx;
	wire [0:0] array_array_66b21_w;
	assign array_array_66b21_d = {32 {array_array_66b21_driver_pe_7_7_w}} & array_array_66b21_driver_pe_7_7_d;
	assign array_array_66b21_widx = {array_array_66b21_driver_pe_7_7_w} & array_array_66b21_driver_pe_7_7_widx;
	assign array_array_66b21_w = array_array_66b21_driver_pe_7_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66b21_q <= 32'd0;
		else if (array_array_66b21_w)
			case (array_array_66b21_widx)
				0: array_array_66b21_q[31:0] <= array_array_66b21_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66019_q;
	wire [31:0] array_array_66019_driver_pe_3_1_d;
	wire [0:0] array_array_66019_driver_pe_3_1_w;
	wire [0:0] array_array_66019_driver_pe_3_1_widx;
	assign array_array_66019_exposed_o = array_array_66019_q;
	wire [31:0] array_array_66019_temp;
	wire [31:0] array_array_66019_d;
	assign array_array_66019_temp = (array_array_66019_exposed_i_valid ? array_array_66019_exposed_i : array_array_66019_d);
	wire [0:0] array_array_66019_widx;
	wire [0:0] array_array_66019_w;
	assign array_array_66019_d = {32 {array_array_66019_driver_pe_3_1_w}} & array_array_66019_driver_pe_3_1_d;
	assign array_array_66019_widx = {array_array_66019_driver_pe_3_1_w} & array_array_66019_driver_pe_3_1_widx;
	assign array_array_66019_w = array_array_66019_driver_pe_3_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66019_q <= 32'd0;
		else if (array_array_66019_w)
			case (array_array_66019_widx)
				0: array_array_66019_q[31:0] <= array_array_66019_temp;
				default:
					;
			endcase
	reg [31:0] array_array_662cd_q;
	wire [31:0] array_array_662cd_driver_pe_4_8_d;
	wire [0:0] array_array_662cd_driver_pe_4_8_w;
	wire [0:0] array_array_662cd_driver_pe_4_8_widx;
	assign array_array_662cd_exposed_o = array_array_662cd_q;
	wire [31:0] array_array_662cd_temp;
	wire [31:0] array_array_662cd_d;
	assign array_array_662cd_temp = (array_array_662cd_exposed_i_valid ? array_array_662cd_exposed_i : array_array_662cd_d);
	wire [0:0] array_array_662cd_widx;
	wire [0:0] array_array_662cd_w;
	assign array_array_662cd_d = {32 {array_array_662cd_driver_pe_4_8_w}} & array_array_662cd_driver_pe_4_8_d;
	assign array_array_662cd_widx = {array_array_662cd_driver_pe_4_8_w} & array_array_662cd_driver_pe_4_8_widx;
	assign array_array_662cd_w = array_array_662cd_driver_pe_4_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_662cd_q <= 32'd0;
		else if (array_array_662cd_w)
			case (array_array_662cd_widx)
				0: array_array_662cd_q[31:0] <= array_array_662cd_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6635d_q;
	wire [31:0] array_array_6635d_driver_pe_5_3_d;
	wire [0:0] array_array_6635d_driver_pe_5_3_w;
	wire [0:0] array_array_6635d_driver_pe_5_3_widx;
	assign array_array_6635d_exposed_o = array_array_6635d_q;
	wire [31:0] array_array_6635d_temp;
	wire [31:0] array_array_6635d_d;
	assign array_array_6635d_temp = (array_array_6635d_exposed_i_valid ? array_array_6635d_exposed_i : array_array_6635d_d);
	wire [0:0] array_array_6635d_widx;
	wire [0:0] array_array_6635d_w;
	assign array_array_6635d_d = {32 {array_array_6635d_driver_pe_5_3_w}} & array_array_6635d_driver_pe_5_3_d;
	assign array_array_6635d_widx = {array_array_6635d_driver_pe_5_3_w} & array_array_6635d_driver_pe_5_3_widx;
	assign array_array_6635d_w = array_array_6635d_driver_pe_5_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6635d_q <= 32'd0;
		else if (array_array_6635d_w)
			case (array_array_6635d_widx)
				0: array_array_6635d_q[31:0] <= array_array_6635d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_65791_q;
	wire [31:0] array_array_65791_driver_pe_2_6_d;
	wire [0:0] array_array_65791_driver_pe_2_6_w;
	wire [0:0] array_array_65791_driver_pe_2_6_widx;
	assign array_array_65791_exposed_o = array_array_65791_q;
	wire [31:0] array_array_65791_temp;
	wire [31:0] array_array_65791_d;
	assign array_array_65791_temp = (array_array_65791_exposed_i_valid ? array_array_65791_exposed_i : array_array_65791_d);
	wire [0:0] array_array_65791_widx;
	wire [0:0] array_array_65791_w;
	assign array_array_65791_d = {32 {array_array_65791_driver_pe_2_6_w}} & array_array_65791_driver_pe_2_6_d;
	assign array_array_65791_widx = {array_array_65791_driver_pe_2_6_w} & array_array_65791_driver_pe_2_6_widx;
	assign array_array_65791_w = array_array_65791_driver_pe_2_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_65791_q <= 32'd0;
		else if (array_array_65791_w)
			case (array_array_65791_widx)
				0: array_array_65791_q[31:0] <= array_array_65791_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6565d_q;
	wire [31:0] array_array_6565d_driver_pe_1_7_d;
	wire [0:0] array_array_6565d_driver_pe_1_7_w;
	wire [0:0] array_array_6565d_driver_pe_1_7_widx;
	assign array_array_6565d_exposed_o = array_array_6565d_q;
	wire [31:0] array_array_6565d_temp;
	wire [31:0] array_array_6565d_d;
	assign array_array_6565d_temp = (array_array_6565d_exposed_i_valid ? array_array_6565d_exposed_i : array_array_6565d_d);
	wire [0:0] array_array_6565d_widx;
	wire [0:0] array_array_6565d_w;
	assign array_array_6565d_d = {32 {array_array_6565d_driver_pe_1_7_w}} & array_array_6565d_driver_pe_1_7_d;
	assign array_array_6565d_widx = {array_array_6565d_driver_pe_1_7_w} & array_array_6565d_driver_pe_1_7_widx;
	assign array_array_6565d_w = array_array_6565d_driver_pe_1_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6565d_q <= 32'd0;
		else if (array_array_6565d_w)
			case (array_array_6565d_widx)
				0: array_array_6565d_q[31:0] <= array_array_6565d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6609d_q;
	wire [31:0] array_array_6609d_driver_pe_3_4_d;
	wire [0:0] array_array_6609d_driver_pe_3_4_w;
	wire [0:0] array_array_6609d_driver_pe_3_4_widx;
	assign array_array_6609d_exposed_o = array_array_6609d_q;
	wire [31:0] array_array_6609d_temp;
	wire [31:0] array_array_6609d_d;
	assign array_array_6609d_temp = (array_array_6609d_exposed_i_valid ? array_array_6609d_exposed_i : array_array_6609d_d);
	wire [0:0] array_array_6609d_widx;
	wire [0:0] array_array_6609d_w;
	assign array_array_6609d_d = {32 {array_array_6609d_driver_pe_3_4_w}} & array_array_6609d_driver_pe_3_4_d;
	assign array_array_6609d_widx = {array_array_6609d_driver_pe_3_4_w} & array_array_6609d_driver_pe_3_4_widx;
	assign array_array_6609d_w = array_array_6609d_driver_pe_3_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6609d_q <= 32'd0;
		else if (array_array_6609d_w)
			case (array_array_6609d_widx)
				0: array_array_6609d_q[31:0] <= array_array_6609d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6614d_q;
	wire [31:0] array_array_6614d_driver_pe_3_8_d;
	wire [0:0] array_array_6614d_driver_pe_3_8_w;
	wire [0:0] array_array_6614d_driver_pe_3_8_widx;
	assign array_array_6614d_exposed_o = array_array_6614d_q;
	wire [31:0] array_array_6614d_temp;
	wire [31:0] array_array_6614d_d;
	assign array_array_6614d_temp = (array_array_6614d_exposed_i_valid ? array_array_6614d_exposed_i : array_array_6614d_d);
	wire [0:0] array_array_6614d_widx;
	wire [0:0] array_array_6614d_w;
	assign array_array_6614d_d = {32 {array_array_6614d_driver_pe_3_8_w}} & array_array_6614d_driver_pe_3_8_d;
	assign array_array_6614d_widx = {array_array_6614d_driver_pe_3_8_w} & array_array_6614d_driver_pe_3_8_widx;
	assign array_array_6614d_w = array_array_6614d_driver_pe_3_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6614d_q <= 32'd0;
		else if (array_array_6614d_w)
			case (array_array_6614d_widx)
				0: array_array_6614d_q[31:0] <= array_array_6614d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66c75_q;
	wire [31:0] array_array_66c75_driver_pe_8_6_d;
	wire [0:0] array_array_66c75_driver_pe_8_6_w;
	wire [0:0] array_array_66c75_driver_pe_8_6_widx;
	assign array_array_66c75_exposed_o = array_array_66c75_q;
	wire [31:0] array_array_66c75_temp;
	wire [31:0] array_array_66c75_d;
	assign array_array_66c75_temp = (array_array_66c75_exposed_i_valid ? array_array_66c75_exposed_i : array_array_66c75_d);
	wire [0:0] array_array_66c75_widx;
	wire [0:0] array_array_66c75_w;
	assign array_array_66c75_d = {32 {array_array_66c75_driver_pe_8_6_w}} & array_array_66c75_driver_pe_8_6_d;
	assign array_array_66c75_widx = {array_array_66c75_driver_pe_8_6_w} & array_array_66c75_driver_pe_8_6_widx;
	assign array_array_66c75_w = array_array_66c75_driver_pe_8_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66c75_q <= 32'd0;
		else if (array_array_66c75_w)
			case (array_array_66c75_widx)
				0: array_array_66c75_q[31:0] <= array_array_66c75_temp;
				default:
					;
			endcase
	reg [31:0] array_array_655d1_q;
	wire [31:0] array_array_655d1_driver_pe_1_4_d;
	wire [0:0] array_array_655d1_driver_pe_1_4_w;
	wire [0:0] array_array_655d1_driver_pe_1_4_widx;
	assign array_array_655d1_exposed_o = array_array_655d1_q;
	wire [31:0] array_array_655d1_temp;
	wire [31:0] array_array_655d1_d;
	assign array_array_655d1_temp = (array_array_655d1_exposed_i_valid ? array_array_655d1_exposed_i : array_array_655d1_d);
	wire [0:0] array_array_655d1_widx;
	wire [0:0] array_array_655d1_w;
	assign array_array_655d1_d = {32 {array_array_655d1_driver_pe_1_4_w}} & array_array_655d1_driver_pe_1_4_d;
	assign array_array_655d1_widx = {array_array_655d1_driver_pe_1_4_w} & array_array_655d1_driver_pe_1_4_widx;
	assign array_array_655d1_w = array_array_655d1_driver_pe_1_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_655d1_q <= 32'd0;
		else if (array_array_655d1_w)
			case (array_array_655d1_widx)
				0: array_array_655d1_q[31:0] <= array_array_655d1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_668e1_q;
	wire [31:0] array_array_668e1_driver_pe_6_3_d;
	wire [0:0] array_array_668e1_driver_pe_6_3_w;
	wire [0:0] array_array_668e1_driver_pe_6_3_widx;
	assign array_array_668e1_exposed_o = array_array_668e1_q;
	wire [31:0] array_array_668e1_temp;
	wire [31:0] array_array_668e1_d;
	assign array_array_668e1_temp = (array_array_668e1_exposed_i_valid ? array_array_668e1_exposed_i : array_array_668e1_d);
	wire [0:0] array_array_668e1_widx;
	wire [0:0] array_array_668e1_w;
	assign array_array_668e1_d = {32 {array_array_668e1_driver_pe_6_3_w}} & array_array_668e1_driver_pe_6_3_d;
	assign array_array_668e1_widx = {array_array_668e1_driver_pe_6_3_w} & array_array_668e1_driver_pe_6_3_widx;
	assign array_array_668e1_w = array_array_668e1_driver_pe_6_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_668e1_q <= 32'd0;
		else if (array_array_668e1_w)
			case (array_array_668e1_widx)
				0: array_array_668e1_q[31:0] <= array_array_668e1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66941_q;
	wire [31:0] array_array_66941_driver_pe_6_5_d;
	wire [0:0] array_array_66941_driver_pe_6_5_w;
	wire [0:0] array_array_66941_driver_pe_6_5_widx;
	assign array_array_66941_exposed_o = array_array_66941_q;
	wire [31:0] array_array_66941_temp;
	wire [31:0] array_array_66941_d;
	assign array_array_66941_temp = (array_array_66941_exposed_i_valid ? array_array_66941_exposed_i : array_array_66941_d);
	wire [0:0] array_array_66941_widx;
	wire [0:0] array_array_66941_w;
	assign array_array_66941_d = {32 {array_array_66941_driver_pe_6_5_w}} & array_array_66941_driver_pe_6_5_d;
	assign array_array_66941_widx = {array_array_66941_driver_pe_6_5_w} & array_array_66941_driver_pe_6_5_widx;
	assign array_array_66941_w = array_array_66941_driver_pe_6_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66941_q <= 32'd0;
		else if (array_array_66941_w)
			case (array_array_66941_widx)
				0: array_array_66941_q[31:0] <= array_array_66941_temp;
				default:
					;
			endcase
	reg [31:0] array_array_65579_q;
	wire [31:0] array_array_65579_driver_pe_1_2_d;
	wire [0:0] array_array_65579_driver_pe_1_2_w;
	wire [0:0] array_array_65579_driver_pe_1_2_widx;
	assign array_array_65579_exposed_o = array_array_65579_q;
	wire [31:0] array_array_65579_temp;
	wire [31:0] array_array_65579_d;
	assign array_array_65579_temp = (array_array_65579_exposed_i_valid ? array_array_65579_exposed_i : array_array_65579_d);
	wire [0:0] array_array_65579_widx;
	wire [0:0] array_array_65579_w;
	assign array_array_65579_d = {32 {array_array_65579_driver_pe_1_2_w}} & array_array_65579_driver_pe_1_2_d;
	assign array_array_65579_widx = {array_array_65579_driver_pe_1_2_w} & array_array_65579_driver_pe_1_2_widx;
	assign array_array_65579_w = array_array_65579_driver_pe_1_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_65579_q <= 32'd0;
		else if (array_array_65579_w)
			case (array_array_65579_widx)
				0: array_array_65579_q[31:0] <= array_array_65579_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6623d_q;
	wire [31:0] array_array_6623d_driver_pe_4_5_d;
	wire [0:0] array_array_6623d_driver_pe_4_5_w;
	wire [0:0] array_array_6623d_driver_pe_4_5_widx;
	assign array_array_6623d_exposed_o = array_array_6623d_q;
	wire [31:0] array_array_6623d_temp;
	wire [31:0] array_array_6623d_d;
	assign array_array_6623d_temp = (array_array_6623d_exposed_i_valid ? array_array_6623d_exposed_i : array_array_6623d_d);
	wire [0:0] array_array_6623d_widx;
	wire [0:0] array_array_6623d_w;
	assign array_array_6623d_d = {32 {array_array_6623d_driver_pe_4_5_w}} & array_array_6623d_driver_pe_4_5_d;
	assign array_array_6623d_widx = {array_array_6623d_driver_pe_4_5_w} & array_array_6623d_driver_pe_4_5_widx;
	assign array_array_6623d_w = array_array_6623d_driver_pe_4_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6623d_q <= 32'd0;
		else if (array_array_6623d_w)
			case (array_array_6623d_widx)
				0: array_array_6623d_q[31:0] <= array_array_6623d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_65601_q;
	wire [31:0] array_array_65601_driver_pe_1_5_d;
	wire [0:0] array_array_65601_driver_pe_1_5_w;
	wire [0:0] array_array_65601_driver_pe_1_5_widx;
	assign array_array_65601_exposed_o = array_array_65601_q;
	wire [31:0] array_array_65601_temp;
	wire [31:0] array_array_65601_d;
	assign array_array_65601_temp = (array_array_65601_exposed_i_valid ? array_array_65601_exposed_i : array_array_65601_d);
	wire [0:0] array_array_65601_widx;
	wire [0:0] array_array_65601_w;
	assign array_array_65601_d = {32 {array_array_65601_driver_pe_1_5_w}} & array_array_65601_driver_pe_1_5_d;
	assign array_array_65601_widx = {array_array_65601_driver_pe_1_5_w} & array_array_65601_driver_pe_1_5_widx;
	assign array_array_65601_w = array_array_65601_driver_pe_1_5_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_65601_q <= 32'd0;
		else if (array_array_65601_w)
			case (array_array_65601_widx)
				0: array_array_65601_q[31:0] <= array_array_65601_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66821_q;
	wire [31:0] array_array_66821_driver_pe_5_7_d;
	wire [0:0] array_array_66821_driver_pe_5_7_w;
	wire [0:0] array_array_66821_driver_pe_5_7_widx;
	assign array_array_66821_exposed_o = array_array_66821_q;
	wire [31:0] array_array_66821_temp;
	wire [31:0] array_array_66821_d;
	assign array_array_66821_temp = (array_array_66821_exposed_i_valid ? array_array_66821_exposed_i : array_array_66821_d);
	wire [0:0] array_array_66821_widx;
	wire [0:0] array_array_66821_w;
	assign array_array_66821_d = {32 {array_array_66821_driver_pe_5_7_w}} & array_array_66821_driver_pe_5_7_d;
	assign array_array_66821_widx = {array_array_66821_driver_pe_5_7_w} & array_array_66821_driver_pe_5_7_widx;
	assign array_array_66821_w = array_array_66821_driver_pe_5_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66821_q <= 32'd0;
		else if (array_array_66821_w)
			case (array_array_66821_widx)
				0: array_array_66821_q[31:0] <= array_array_66821_temp;
				default:
					;
			endcase
	reg [31:0] array_array_656b5_q;
	wire [31:0] array_array_656b5_driver_pe_2_1_d;
	wire [0:0] array_array_656b5_driver_pe_2_1_w;
	wire [0:0] array_array_656b5_driver_pe_2_1_widx;
	assign array_array_656b5_exposed_o = array_array_656b5_q;
	wire [31:0] array_array_656b5_temp;
	wire [31:0] array_array_656b5_d;
	assign array_array_656b5_temp = (array_array_656b5_exposed_i_valid ? array_array_656b5_exposed_i : array_array_656b5_d);
	wire [0:0] array_array_656b5_widx;
	wire [0:0] array_array_656b5_w;
	assign array_array_656b5_d = {32 {array_array_656b5_driver_pe_2_1_w}} & array_array_656b5_driver_pe_2_1_d;
	assign array_array_656b5_widx = {array_array_656b5_driver_pe_2_1_w} & array_array_656b5_driver_pe_2_1_widx;
	assign array_array_656b5_w = array_array_656b5_driver_pe_2_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_656b5_q <= 32'd0;
		else if (array_array_656b5_w)
			case (array_array_656b5_widx)
				0: array_array_656b5_q[31:0] <= array_array_656b5_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6554d_q;
	wire [31:0] array_array_6554d_driver_pe_1_1_d;
	wire [0:0] array_array_6554d_driver_pe_1_1_w;
	wire [0:0] array_array_6554d_driver_pe_1_1_widx;
	assign array_array_6554d_exposed_o = array_array_6554d_q;
	wire [31:0] array_array_6554d_temp;
	wire [31:0] array_array_6554d_d;
	assign array_array_6554d_temp = (array_array_6554d_exposed_i_valid ? array_array_6554d_exposed_i : array_array_6554d_d);
	wire [0:0] array_array_6554d_widx;
	wire [0:0] array_array_6554d_w;
	assign array_array_6554d_d = {32 {array_array_6554d_driver_pe_1_1_w}} & array_array_6554d_driver_pe_1_1_d;
	assign array_array_6554d_widx = {array_array_6554d_driver_pe_1_1_w} & array_array_6554d_driver_pe_1_1_widx;
	assign array_array_6554d_w = array_array_6554d_driver_pe_1_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6554d_q <= 32'd0;
		else if (array_array_6554d_w)
			case (array_array_6554d_widx)
				0: array_array_6554d_q[31:0] <= array_array_6554d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6629d_q;
	wire [31:0] array_array_6629d_driver_pe_4_7_d;
	wire [0:0] array_array_6629d_driver_pe_4_7_w;
	wire [0:0] array_array_6629d_driver_pe_4_7_widx;
	assign array_array_6629d_exposed_o = array_array_6629d_q;
	wire [31:0] array_array_6629d_temp;
	wire [31:0] array_array_6629d_d;
	assign array_array_6629d_temp = (array_array_6629d_exposed_i_valid ? array_array_6629d_exposed_i : array_array_6629d_d);
	wire [0:0] array_array_6629d_widx;
	wire [0:0] array_array_6629d_w;
	assign array_array_6629d_d = {32 {array_array_6629d_driver_pe_4_7_w}} & array_array_6629d_driver_pe_4_7_d;
	assign array_array_6629d_widx = {array_array_6629d_driver_pe_4_7_w} & array_array_6629d_driver_pe_4_7_widx;
	assign array_array_6629d_w = array_array_6629d_driver_pe_4_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6629d_q <= 32'd0;
		else if (array_array_6629d_w)
			case (array_array_6629d_widx)
				0: array_array_6629d_q[31:0] <= array_array_6629d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66a31_q;
	wire [31:0] array_array_66a31_driver_pe_7_2_d;
	wire [0:0] array_array_66a31_driver_pe_7_2_w;
	wire [0:0] array_array_66a31_driver_pe_7_2_widx;
	assign array_array_66a31_exposed_o = array_array_66a31_q;
	wire [31:0] array_array_66a31_temp;
	wire [31:0] array_array_66a31_d;
	assign array_array_66a31_temp = (array_array_66a31_exposed_i_valid ? array_array_66a31_exposed_i : array_array_66a31_d);
	wire [0:0] array_array_66a31_widx;
	wire [0:0] array_array_66a31_w;
	assign array_array_66a31_d = {32 {array_array_66a31_driver_pe_7_2_w}} & array_array_66a31_driver_pe_7_2_d;
	assign array_array_66a31_widx = {array_array_66a31_driver_pe_7_2_w} & array_array_66a31_driver_pe_7_2_widx;
	assign array_array_66a31_w = array_array_66a31_driver_pe_7_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66a31_q <= 32'd0;
		else if (array_array_66a31_w)
			case (array_array_66a31_widx)
				0: array_array_66a31_q[31:0] <= array_array_66a31_temp;
				default:
					;
			endcase
	reg [31:0] array_array_669d1_q;
	wire [31:0] array_array_669d1_driver_pe_6_8_d;
	wire [0:0] array_array_669d1_driver_pe_6_8_w;
	wire [0:0] array_array_669d1_driver_pe_6_8_widx;
	assign array_array_669d1_exposed_o = array_array_669d1_q;
	wire [31:0] array_array_669d1_temp;
	wire [31:0] array_array_669d1_d;
	assign array_array_669d1_temp = (array_array_669d1_exposed_i_valid ? array_array_669d1_exposed_i : array_array_669d1_d);
	wire [0:0] array_array_669d1_widx;
	wire [0:0] array_array_669d1_w;
	assign array_array_669d1_d = {32 {array_array_669d1_driver_pe_6_8_w}} & array_array_669d1_driver_pe_6_8_d;
	assign array_array_669d1_widx = {array_array_669d1_driver_pe_6_8_w} & array_array_669d1_driver_pe_6_8_widx;
	assign array_array_669d1_w = array_array_669d1_driver_pe_6_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_669d1_q <= 32'd0;
		else if (array_array_669d1_w)
			case (array_array_669d1_widx)
				0: array_array_669d1_q[31:0] <= array_array_669d1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6620d_q;
	wire [31:0] array_array_6620d_driver_pe_4_4_d;
	wire [0:0] array_array_6620d_driver_pe_4_4_w;
	wire [0:0] array_array_6620d_driver_pe_4_4_widx;
	assign array_array_6620d_exposed_o = array_array_6620d_q;
	wire [31:0] array_array_6620d_temp;
	wire [31:0] array_array_6620d_d;
	assign array_array_6620d_temp = (array_array_6620d_exposed_i_valid ? array_array_6620d_exposed_i : array_array_6620d_d);
	wire [0:0] array_array_6620d_widx;
	wire [0:0] array_array_6620d_w;
	assign array_array_6620d_d = {32 {array_array_6620d_driver_pe_4_4_w}} & array_array_6620d_driver_pe_4_4_d;
	assign array_array_6620d_widx = {array_array_6620d_driver_pe_4_4_w} & array_array_6620d_driver_pe_4_4_widx;
	assign array_array_6620d_w = array_array_6620d_driver_pe_4_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6620d_q <= 32'd0;
		else if (array_array_6620d_w)
			case (array_array_6620d_widx)
				0: array_array_6620d_q[31:0] <= array_array_6620d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_661dd_q;
	wire [31:0] array_array_661dd_driver_pe_4_3_d;
	wire [0:0] array_array_661dd_driver_pe_4_3_w;
	wire [0:0] array_array_661dd_driver_pe_4_3_widx;
	assign array_array_661dd_exposed_o = array_array_661dd_q;
	wire [31:0] array_array_661dd_temp;
	wire [31:0] array_array_661dd_d;
	assign array_array_661dd_temp = (array_array_661dd_exposed_i_valid ? array_array_661dd_exposed_i : array_array_661dd_d);
	wire [0:0] array_array_661dd_widx;
	wire [0:0] array_array_661dd_w;
	assign array_array_661dd_d = {32 {array_array_661dd_driver_pe_4_3_w}} & array_array_661dd_driver_pe_4_3_d;
	assign array_array_661dd_widx = {array_array_661dd_driver_pe_4_3_w} & array_array_661dd_driver_pe_4_3_widx;
	assign array_array_661dd_w = array_array_661dd_driver_pe_4_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_661dd_q <= 32'd0;
		else if (array_array_661dd_w)
			case (array_array_661dd_widx)
				0: array_array_661dd_q[31:0] <= array_array_661dd_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66bb1_q;
	wire [31:0] array_array_66bb1_driver_pe_8_2_d;
	wire [0:0] array_array_66bb1_driver_pe_8_2_w;
	wire [0:0] array_array_66bb1_driver_pe_8_2_widx;
	assign array_array_66bb1_exposed_o = array_array_66bb1_q;
	wire [31:0] array_array_66bb1_temp;
	wire [31:0] array_array_66bb1_d;
	assign array_array_66bb1_temp = (array_array_66bb1_exposed_i_valid ? array_array_66bb1_exposed_i : array_array_66bb1_d);
	wire [0:0] array_array_66bb1_widx;
	wire [0:0] array_array_66bb1_w;
	assign array_array_66bb1_d = {32 {array_array_66bb1_driver_pe_8_2_w}} & array_array_66bb1_driver_pe_8_2_d;
	assign array_array_66bb1_widx = {array_array_66bb1_driver_pe_8_2_w} & array_array_66bb1_driver_pe_8_2_widx;
	assign array_array_66bb1_w = array_array_66bb1_driver_pe_8_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66bb1_q <= 32'd0;
		else if (array_array_66bb1_w)
			case (array_array_66bb1_widx)
				0: array_array_66bb1_q[31:0] <= array_array_66bb1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_662fd_q;
	wire [31:0] array_array_662fd_driver_pe_5_1_d;
	wire [0:0] array_array_662fd_driver_pe_5_1_w;
	wire [0:0] array_array_662fd_driver_pe_5_1_widx;
	assign array_array_662fd_exposed_o = array_array_662fd_q;
	wire [31:0] array_array_662fd_temp;
	wire [31:0] array_array_662fd_d;
	assign array_array_662fd_temp = (array_array_662fd_exposed_i_valid ? array_array_662fd_exposed_i : array_array_662fd_d);
	wire [0:0] array_array_662fd_widx;
	wire [0:0] array_array_662fd_w;
	assign array_array_662fd_d = {32 {array_array_662fd_driver_pe_5_1_w}} & array_array_662fd_driver_pe_5_1_d;
	assign array_array_662fd_widx = {array_array_662fd_driver_pe_5_1_w} & array_array_662fd_driver_pe_5_1_widx;
	assign array_array_662fd_w = array_array_662fd_driver_pe_5_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_662fd_q <= 32'd0;
		else if (array_array_662fd_w)
			case (array_array_662fd_widx)
				0: array_array_662fd_q[31:0] <= array_array_662fd_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66851_q;
	wire [31:0] array_array_66851_driver_pe_5_8_d;
	wire [0:0] array_array_66851_driver_pe_5_8_w;
	wire [0:0] array_array_66851_driver_pe_5_8_widx;
	assign array_array_66851_exposed_o = array_array_66851_q;
	wire [31:0] array_array_66851_temp;
	wire [31:0] array_array_66851_d;
	assign array_array_66851_temp = (array_array_66851_exposed_i_valid ? array_array_66851_exposed_i : array_array_66851_d);
	wire [0:0] array_array_66851_widx;
	wire [0:0] array_array_66851_w;
	assign array_array_66851_d = {32 {array_array_66851_driver_pe_5_8_w}} & array_array_66851_driver_pe_5_8_d;
	assign array_array_66851_widx = {array_array_66851_driver_pe_5_8_w} & array_array_66851_driver_pe_5_8_widx;
	assign array_array_66851_w = array_array_66851_driver_pe_5_8_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66851_q <= 32'd0;
		else if (array_array_66851_w)
			case (array_array_66851_widx)
				0: array_array_66851_q[31:0] <= array_array_66851_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66121_q;
	wire [31:0] array_array_66121_driver_pe_3_7_d;
	wire [0:0] array_array_66121_driver_pe_3_7_w;
	wire [0:0] array_array_66121_driver_pe_3_7_widx;
	assign array_array_66121_exposed_o = array_array_66121_q;
	wire [31:0] array_array_66121_temp;
	wire [31:0] array_array_66121_d;
	assign array_array_66121_temp = (array_array_66121_exposed_i_valid ? array_array_66121_exposed_i : array_array_66121_d);
	wire [0:0] array_array_66121_widx;
	wire [0:0] array_array_66121_w;
	assign array_array_66121_d = {32 {array_array_66121_driver_pe_3_7_w}} & array_array_66121_driver_pe_3_7_d;
	assign array_array_66121_widx = {array_array_66121_driver_pe_3_7_w} & array_array_66121_driver_pe_3_7_widx;
	assign array_array_66121_w = array_array_66121_driver_pe_3_7_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66121_q <= 32'd0;
		else if (array_array_66121_w)
			case (array_array_66121_widx)
				0: array_array_66121_q[31:0] <= array_array_66121_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6632d_q;
	wire [31:0] array_array_6632d_driver_pe_5_2_d;
	wire [0:0] array_array_6632d_driver_pe_5_2_w;
	wire [0:0] array_array_6632d_driver_pe_5_2_widx;
	assign array_array_6632d_exposed_o = array_array_6632d_q;
	wire [31:0] array_array_6632d_temp;
	wire [31:0] array_array_6632d_d;
	assign array_array_6632d_temp = (array_array_6632d_exposed_i_valid ? array_array_6632d_exposed_i : array_array_6632d_d);
	wire [0:0] array_array_6632d_widx;
	wire [0:0] array_array_6632d_w;
	assign array_array_6632d_d = {32 {array_array_6632d_driver_pe_5_2_w}} & array_array_6632d_driver_pe_5_2_d;
	assign array_array_6632d_widx = {array_array_6632d_driver_pe_5_2_w} & array_array_6632d_driver_pe_5_2_widx;
	assign array_array_6632d_w = array_array_6632d_driver_pe_5_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6632d_q <= 32'd0;
		else if (array_array_6632d_w)
			case (array_array_6632d_widx)
				0: array_array_6632d_q[31:0] <= array_array_6632d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66071_q;
	wire [31:0] array_array_66071_driver_pe_3_3_d;
	wire [0:0] array_array_66071_driver_pe_3_3_w;
	wire [0:0] array_array_66071_driver_pe_3_3_widx;
	assign array_array_66071_exposed_o = array_array_66071_q;
	wire [31:0] array_array_66071_temp;
	wire [31:0] array_array_66071_d;
	assign array_array_66071_temp = (array_array_66071_exposed_i_valid ? array_array_66071_exposed_i : array_array_66071_d);
	wire [0:0] array_array_66071_widx;
	wire [0:0] array_array_66071_w;
	assign array_array_66071_d = {32 {array_array_66071_driver_pe_3_3_w}} & array_array_66071_driver_pe_3_3_d;
	assign array_array_66071_widx = {array_array_66071_driver_pe_3_3_w} & array_array_66071_driver_pe_3_3_widx;
	assign array_array_66071_w = array_array_66071_driver_pe_3_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66071_q <= 32'd0;
		else if (array_array_66071_w)
			case (array_array_66071_widx)
				0: array_array_66071_q[31:0] <= array_array_66071_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66911_q;
	wire [31:0] array_array_66911_driver_pe_6_4_d;
	wire [0:0] array_array_66911_driver_pe_6_4_w;
	wire [0:0] array_array_66911_driver_pe_6_4_widx;
	assign array_array_66911_exposed_o = array_array_66911_q;
	wire [31:0] array_array_66911_temp;
	wire [31:0] array_array_66911_d;
	assign array_array_66911_temp = (array_array_66911_exposed_i_valid ? array_array_66911_exposed_i : array_array_66911_d);
	wire [0:0] array_array_66911_widx;
	wire [0:0] array_array_66911_w;
	assign array_array_66911_d = {32 {array_array_66911_driver_pe_6_4_w}} & array_array_66911_driver_pe_6_4_d;
	assign array_array_66911_widx = {array_array_66911_driver_pe_6_4_w} & array_array_66911_driver_pe_6_4_widx;
	assign array_array_66911_w = array_array_66911_driver_pe_6_4_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66911_q <= 32'd0;
		else if (array_array_66911_w)
			case (array_array_66911_widx)
				0: array_array_66911_q[31:0] <= array_array_66911_temp;
				default:
					;
			endcase
	reg [31:0] array_array_668b1_q;
	wire [31:0] array_array_668b1_driver_pe_6_2_d;
	wire [0:0] array_array_668b1_driver_pe_6_2_w;
	wire [0:0] array_array_668b1_driver_pe_6_2_widx;
	assign array_array_668b1_exposed_o = array_array_668b1_q;
	wire [31:0] array_array_668b1_temp;
	wire [31:0] array_array_668b1_d;
	assign array_array_668b1_temp = (array_array_668b1_exposed_i_valid ? array_array_668b1_exposed_i : array_array_668b1_d);
	wire [0:0] array_array_668b1_widx;
	wire [0:0] array_array_668b1_w;
	assign array_array_668b1_d = {32 {array_array_668b1_driver_pe_6_2_w}} & array_array_668b1_driver_pe_6_2_d;
	assign array_array_668b1_widx = {array_array_668b1_driver_pe_6_2_w} & array_array_668b1_driver_pe_6_2_widx;
	assign array_array_668b1_w = array_array_668b1_driver_pe_6_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_668b1_q <= 32'd0;
		else if (array_array_668b1_w)
			case (array_array_668b1_widx)
				0: array_array_668b1_q[31:0] <= array_array_668b1_temp;
				default:
					;
			endcase
	reg [31:0] array_array_656dd_q;
	wire [31:0] array_array_656dd_driver_pe_2_2_d;
	wire [0:0] array_array_656dd_driver_pe_2_2_w;
	wire [0:0] array_array_656dd_driver_pe_2_2_widx;
	assign array_array_656dd_exposed_o = array_array_656dd_q;
	wire [31:0] array_array_656dd_temp;
	wire [31:0] array_array_656dd_d;
	assign array_array_656dd_temp = (array_array_656dd_exposed_i_valid ? array_array_656dd_exposed_i : array_array_656dd_d);
	wire [0:0] array_array_656dd_widx;
	wire [0:0] array_array_656dd_w;
	assign array_array_656dd_d = {32 {array_array_656dd_driver_pe_2_2_w}} & array_array_656dd_driver_pe_2_2_d;
	assign array_array_656dd_widx = {array_array_656dd_driver_pe_2_2_w} & array_array_656dd_driver_pe_2_2_widx;
	assign array_array_656dd_w = array_array_656dd_driver_pe_2_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_656dd_q <= 32'd0;
		else if (array_array_656dd_w)
			case (array_array_656dd_widx)
				0: array_array_656dd_q[31:0] <= array_array_656dd_temp;
				default:
					;
			endcase
	reg [31:0] array_array_6626d_q;
	wire [31:0] array_array_6626d_driver_pe_4_6_d;
	wire [0:0] array_array_6626d_driver_pe_4_6_w;
	wire [0:0] array_array_6626d_driver_pe_4_6_widx;
	assign array_array_6626d_exposed_o = array_array_6626d_q;
	wire [31:0] array_array_6626d_temp;
	wire [31:0] array_array_6626d_d;
	assign array_array_6626d_temp = (array_array_6626d_exposed_i_valid ? array_array_6626d_exposed_i : array_array_6626d_d);
	wire [0:0] array_array_6626d_widx;
	wire [0:0] array_array_6626d_w;
	assign array_array_6626d_d = {32 {array_array_6626d_driver_pe_4_6_w}} & array_array_6626d_driver_pe_4_6_d;
	assign array_array_6626d_widx = {array_array_6626d_driver_pe_4_6_w} & array_array_6626d_driver_pe_4_6_widx;
	assign array_array_6626d_w = array_array_6626d_driver_pe_4_6_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_6626d_q <= 32'd0;
		else if (array_array_6626d_w)
			case (array_array_6626d_widx)
				0: array_array_6626d_q[31:0] <= array_array_6626d_temp;
				default:
					;
			endcase
	reg [31:0] array_array_65709_q;
	wire [31:0] array_array_65709_driver_pe_2_3_d;
	wire [0:0] array_array_65709_driver_pe_2_3_w;
	wire [0:0] array_array_65709_driver_pe_2_3_widx;
	assign array_array_65709_exposed_o = array_array_65709_q;
	wire [31:0] array_array_65709_temp;
	wire [31:0] array_array_65709_d;
	assign array_array_65709_temp = (array_array_65709_exposed_i_valid ? array_array_65709_exposed_i : array_array_65709_d);
	wire [0:0] array_array_65709_widx;
	wire [0:0] array_array_65709_w;
	assign array_array_65709_d = {32 {array_array_65709_driver_pe_2_3_w}} & array_array_65709_driver_pe_2_3_d;
	assign array_array_65709_widx = {array_array_65709_driver_pe_2_3_w} & array_array_65709_driver_pe_2_3_widx;
	assign array_array_65709_w = array_array_65709_driver_pe_2_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_65709_q <= 32'd0;
		else if (array_array_65709_w)
			case (array_array_65709_widx)
				0: array_array_65709_q[31:0] <= array_array_65709_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66b81_q;
	wire [31:0] array_array_66b81_driver_pe_8_1_d;
	wire [0:0] array_array_66b81_driver_pe_8_1_w;
	wire [0:0] array_array_66b81_driver_pe_8_1_widx;
	assign array_array_66b81_exposed_o = array_array_66b81_q;
	wire [31:0] array_array_66b81_temp;
	wire [31:0] array_array_66b81_d;
	assign array_array_66b81_temp = (array_array_66b81_exposed_i_valid ? array_array_66b81_exposed_i : array_array_66b81_d);
	wire [0:0] array_array_66b81_widx;
	wire [0:0] array_array_66b81_w;
	assign array_array_66b81_d = {32 {array_array_66b81_driver_pe_8_1_w}} & array_array_66b81_driver_pe_8_1_d;
	assign array_array_66b81_widx = {array_array_66b81_driver_pe_8_1_w} & array_array_66b81_driver_pe_8_1_widx;
	assign array_array_66b81_w = array_array_66b81_driver_pe_8_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66b81_q <= 32'd0;
		else if (array_array_66b81_w)
			case (array_array_66b81_widx)
				0: array_array_66b81_q[31:0] <= array_array_66b81_temp;
				default:
					;
			endcase
	reg [31:0] array_array_66be1_q;
	wire [31:0] array_array_66be1_driver_pe_8_3_d;
	wire [0:0] array_array_66be1_driver_pe_8_3_w;
	wire [0:0] array_array_66be1_driver_pe_8_3_widx;
	assign array_array_66be1_exposed_o = array_array_66be1_q;
	wire [31:0] array_array_66be1_temp;
	wire [31:0] array_array_66be1_d;
	assign array_array_66be1_temp = (array_array_66be1_exposed_i_valid ? array_array_66be1_exposed_i : array_array_66be1_d);
	wire [0:0] array_array_66be1_widx;
	wire [0:0] array_array_66be1_w;
	assign array_array_66be1_d = {32 {array_array_66be1_driver_pe_8_3_w}} & array_array_66be1_driver_pe_8_3_d;
	assign array_array_66be1_widx = {array_array_66be1_driver_pe_8_3_w} & array_array_66be1_driver_pe_8_3_widx;
	assign array_array_66be1_w = array_array_66be1_driver_pe_8_3_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_66be1_q <= 32'd0;
		else if (array_array_66be1_w)
			case (array_array_66be1_widx)
				0: array_array_66be1_q[31:0] <= array_array_66be1_temp;
				default:
					;
			endcase
	wire [7:0] fifo_pe_5_2_west_pop_data;
	wire [0:0] fifo_pe_5_2_west_pop_valid;
	wire [0:0] fifo_pe_5_2_west_pop_ready;
	wire [7:0] fifo_pe_5_2_west_driver_pe_5_1_push_data;
	wire [0:0] fifo_pe_5_2_west_driver_pe_5_1_push_valid;
	wire [0:0] fifo_pe_5_2_west_driver_pe_5_1_push_ready;
	wire fifo_pe_5_2_west_push_ready;
	assign fifo_pe_5_2_west_driver_pe_5_1_push_ready = fifo_pe_5_2_west_push_ready;
	wire [0:0] fifo_pe_5_2_west_push_valid;
	assign fifo_pe_5_2_west_push_valid = fifo_pe_5_2_west_driver_pe_5_1_push_valid;
	wire [7:0] fifo_pe_5_2_west_push_data;
	assign fifo_pe_5_2_west_push_data = {8 {fifo_pe_5_2_west_driver_pe_5_1_push_valid}} & fifo_pe_5_2_west_driver_pe_5_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_2_west_push_valid),
		.push_data(fifo_pe_5_2_west_push_data),
		.push_ready(fifo_pe_5_2_west_push_ready),
		.pop_valid(fifo_pe_5_2_west_pop_valid),
		.pop_data(fifo_pe_5_2_west_pop_data),
		.pop_ready(fifo_pe_5_2_west_pop_ready)
	);
	wire [7:0] fifo_pe_5_2_north_pop_data;
	wire [0:0] fifo_pe_5_2_north_pop_valid;
	wire [0:0] fifo_pe_5_2_north_pop_ready;
	wire [7:0] fifo_pe_5_2_north_driver_pe_4_2_push_data;
	wire [0:0] fifo_pe_5_2_north_driver_pe_4_2_push_valid;
	wire [0:0] fifo_pe_5_2_north_driver_pe_4_2_push_ready;
	wire fifo_pe_5_2_north_push_ready;
	assign fifo_pe_5_2_north_driver_pe_4_2_push_ready = fifo_pe_5_2_north_push_ready;
	wire [0:0] fifo_pe_5_2_north_push_valid;
	assign fifo_pe_5_2_north_push_valid = fifo_pe_5_2_north_driver_pe_4_2_push_valid;
	wire [7:0] fifo_pe_5_2_north_push_data;
	assign fifo_pe_5_2_north_push_data = {8 {fifo_pe_5_2_north_driver_pe_4_2_push_valid}} & fifo_pe_5_2_north_driver_pe_4_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_2_north_push_valid),
		.push_data(fifo_pe_5_2_north_push_data),
		.push_ready(fifo_pe_5_2_north_push_ready),
		.pop_valid(fifo_pe_5_2_north_pop_valid),
		.pop_data(fifo_pe_5_2_north_pop_data),
		.pop_ready(fifo_pe_5_2_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_6_north_pop_data;
	wire [0:0] fifo_pe_8_6_north_pop_valid;
	wire [0:0] fifo_pe_8_6_north_pop_ready;
	wire [7:0] fifo_pe_8_6_north_driver_pe_7_6_push_data;
	wire [0:0] fifo_pe_8_6_north_driver_pe_7_6_push_valid;
	wire [0:0] fifo_pe_8_6_north_driver_pe_7_6_push_ready;
	wire fifo_pe_8_6_north_push_ready;
	assign fifo_pe_8_6_north_driver_pe_7_6_push_ready = fifo_pe_8_6_north_push_ready;
	wire [0:0] fifo_pe_8_6_north_push_valid;
	assign fifo_pe_8_6_north_push_valid = fifo_pe_8_6_north_driver_pe_7_6_push_valid;
	wire [7:0] fifo_pe_8_6_north_push_data;
	assign fifo_pe_8_6_north_push_data = {8 {fifo_pe_8_6_north_driver_pe_7_6_push_valid}} & fifo_pe_8_6_north_driver_pe_7_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_6_north_push_valid),
		.push_data(fifo_pe_8_6_north_push_data),
		.push_ready(fifo_pe_8_6_north_push_ready),
		.pop_valid(fifo_pe_8_6_north_pop_valid),
		.pop_data(fifo_pe_8_6_north_pop_data),
		.pop_ready(fifo_pe_8_6_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_6_west_pop_data;
	wire [0:0] fifo_pe_8_6_west_pop_valid;
	wire [0:0] fifo_pe_8_6_west_pop_ready;
	wire [7:0] fifo_pe_8_6_west_driver_pe_8_5_push_data;
	wire [0:0] fifo_pe_8_6_west_driver_pe_8_5_push_valid;
	wire [0:0] fifo_pe_8_6_west_driver_pe_8_5_push_ready;
	wire fifo_pe_8_6_west_push_ready;
	assign fifo_pe_8_6_west_driver_pe_8_5_push_ready = fifo_pe_8_6_west_push_ready;
	wire [0:0] fifo_pe_8_6_west_push_valid;
	assign fifo_pe_8_6_west_push_valid = fifo_pe_8_6_west_driver_pe_8_5_push_valid;
	wire [7:0] fifo_pe_8_6_west_push_data;
	assign fifo_pe_8_6_west_push_data = {8 {fifo_pe_8_6_west_driver_pe_8_5_push_valid}} & fifo_pe_8_6_west_driver_pe_8_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_6_west_push_valid),
		.push_data(fifo_pe_8_6_west_push_data),
		.push_ready(fifo_pe_8_6_west_push_ready),
		.pop_valid(fifo_pe_8_6_west_pop_valid),
		.pop_data(fifo_pe_8_6_west_pop_data),
		.pop_ready(fifo_pe_8_6_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_7_north_pop_data;
	wire [0:0] fifo_pe_4_7_north_pop_valid;
	wire [0:0] fifo_pe_4_7_north_pop_ready;
	wire [7:0] fifo_pe_4_7_north_driver_pe_3_7_push_data;
	wire [0:0] fifo_pe_4_7_north_driver_pe_3_7_push_valid;
	wire [0:0] fifo_pe_4_7_north_driver_pe_3_7_push_ready;
	wire fifo_pe_4_7_north_push_ready;
	assign fifo_pe_4_7_north_driver_pe_3_7_push_ready = fifo_pe_4_7_north_push_ready;
	wire [0:0] fifo_pe_4_7_north_push_valid;
	assign fifo_pe_4_7_north_push_valid = fifo_pe_4_7_north_driver_pe_3_7_push_valid;
	wire [7:0] fifo_pe_4_7_north_push_data;
	assign fifo_pe_4_7_north_push_data = {8 {fifo_pe_4_7_north_driver_pe_3_7_push_valid}} & fifo_pe_4_7_north_driver_pe_3_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_7_north_push_valid),
		.push_data(fifo_pe_4_7_north_push_data),
		.push_ready(fifo_pe_4_7_north_push_ready),
		.pop_valid(fifo_pe_4_7_north_pop_valid),
		.pop_data(fifo_pe_4_7_north_pop_data),
		.pop_ready(fifo_pe_4_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_4_7_west_pop_data;
	wire [0:0] fifo_pe_4_7_west_pop_valid;
	wire [0:0] fifo_pe_4_7_west_pop_ready;
	wire [7:0] fifo_pe_4_7_west_driver_pe_4_6_push_data;
	wire [0:0] fifo_pe_4_7_west_driver_pe_4_6_push_valid;
	wire [0:0] fifo_pe_4_7_west_driver_pe_4_6_push_ready;
	wire fifo_pe_4_7_west_push_ready;
	assign fifo_pe_4_7_west_driver_pe_4_6_push_ready = fifo_pe_4_7_west_push_ready;
	wire [0:0] fifo_pe_4_7_west_push_valid;
	assign fifo_pe_4_7_west_push_valid = fifo_pe_4_7_west_driver_pe_4_6_push_valid;
	wire [7:0] fifo_pe_4_7_west_push_data;
	assign fifo_pe_4_7_west_push_data = {8 {fifo_pe_4_7_west_driver_pe_4_6_push_valid}} & fifo_pe_4_7_west_driver_pe_4_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_7_west_push_valid),
		.push_data(fifo_pe_4_7_west_push_data),
		.push_ready(fifo_pe_4_7_west_push_ready),
		.pop_valid(fifo_pe_4_7_west_pop_valid),
		.pop_data(fifo_pe_4_7_west_pop_data),
		.pop_ready(fifo_pe_4_7_west_pop_ready)
	);
	wire [7:0] fifo_pe_6_6_north_pop_data;
	wire [0:0] fifo_pe_6_6_north_pop_valid;
	wire [0:0] fifo_pe_6_6_north_pop_ready;
	wire [7:0] fifo_pe_6_6_north_driver_pe_5_6_push_data;
	wire [0:0] fifo_pe_6_6_north_driver_pe_5_6_push_valid;
	wire [0:0] fifo_pe_6_6_north_driver_pe_5_6_push_ready;
	wire fifo_pe_6_6_north_push_ready;
	assign fifo_pe_6_6_north_driver_pe_5_6_push_ready = fifo_pe_6_6_north_push_ready;
	wire [0:0] fifo_pe_6_6_north_push_valid;
	assign fifo_pe_6_6_north_push_valid = fifo_pe_6_6_north_driver_pe_5_6_push_valid;
	wire [7:0] fifo_pe_6_6_north_push_data;
	assign fifo_pe_6_6_north_push_data = {8 {fifo_pe_6_6_north_driver_pe_5_6_push_valid}} & fifo_pe_6_6_north_driver_pe_5_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_6_north_push_valid),
		.push_data(fifo_pe_6_6_north_push_data),
		.push_ready(fifo_pe_6_6_north_push_ready),
		.pop_valid(fifo_pe_6_6_north_pop_valid),
		.pop_data(fifo_pe_6_6_north_pop_data),
		.pop_ready(fifo_pe_6_6_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_6_west_pop_data;
	wire [0:0] fifo_pe_6_6_west_pop_valid;
	wire [0:0] fifo_pe_6_6_west_pop_ready;
	wire [7:0] fifo_pe_6_6_west_driver_pe_6_5_push_data;
	wire [0:0] fifo_pe_6_6_west_driver_pe_6_5_push_valid;
	wire [0:0] fifo_pe_6_6_west_driver_pe_6_5_push_ready;
	wire fifo_pe_6_6_west_push_ready;
	assign fifo_pe_6_6_west_driver_pe_6_5_push_ready = fifo_pe_6_6_west_push_ready;
	wire [0:0] fifo_pe_6_6_west_push_valid;
	assign fifo_pe_6_6_west_push_valid = fifo_pe_6_6_west_driver_pe_6_5_push_valid;
	wire [7:0] fifo_pe_6_6_west_push_data;
	assign fifo_pe_6_6_west_push_data = {8 {fifo_pe_6_6_west_driver_pe_6_5_push_valid}} & fifo_pe_6_6_west_driver_pe_6_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_6_west_push_valid),
		.push_data(fifo_pe_6_6_west_push_data),
		.push_ready(fifo_pe_6_6_west_push_ready),
		.pop_valid(fifo_pe_6_6_west_pop_valid),
		.pop_data(fifo_pe_6_6_west_pop_data),
		.pop_ready(fifo_pe_6_6_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_1_west_pop_data;
	wire [0:0] fifo_pe_7_1_west_pop_valid;
	wire [0:0] fifo_pe_7_1_west_pop_ready;
	wire [7:0] fifo_pe_7_1_west_driver_row_pusher_7_push_data;
	wire [0:0] fifo_pe_7_1_west_driver_row_pusher_7_push_valid;
	wire [0:0] fifo_pe_7_1_west_driver_row_pusher_7_push_ready;
	wire fifo_pe_7_1_west_push_ready;
	assign fifo_pe_7_1_west_driver_row_pusher_7_push_ready = fifo_pe_7_1_west_push_ready;
	wire [0:0] fifo_pe_7_1_west_push_valid;
	assign fifo_pe_7_1_west_push_valid = fifo_pe_7_1_west_driver_row_pusher_7_push_valid;
	wire [7:0] fifo_pe_7_1_west_push_data;
	assign fifo_pe_7_1_west_push_data = {8 {fifo_pe_7_1_west_driver_row_pusher_7_push_valid}} & fifo_pe_7_1_west_driver_row_pusher_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_1_west_push_valid),
		.push_data(fifo_pe_7_1_west_push_data),
		.push_ready(fifo_pe_7_1_west_push_ready),
		.pop_valid(fifo_pe_7_1_west_pop_valid),
		.pop_data(fifo_pe_7_1_west_pop_data),
		.pop_ready(fifo_pe_7_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_1_north_pop_data;
	wire [0:0] fifo_pe_7_1_north_pop_valid;
	wire [0:0] fifo_pe_7_1_north_pop_ready;
	wire [7:0] fifo_pe_7_1_north_driver_pe_6_1_push_data;
	wire [0:0] fifo_pe_7_1_north_driver_pe_6_1_push_valid;
	wire [0:0] fifo_pe_7_1_north_driver_pe_6_1_push_ready;
	wire fifo_pe_7_1_north_push_ready;
	assign fifo_pe_7_1_north_driver_pe_6_1_push_ready = fifo_pe_7_1_north_push_ready;
	wire [0:0] fifo_pe_7_1_north_push_valid;
	assign fifo_pe_7_1_north_push_valid = fifo_pe_7_1_north_driver_pe_6_1_push_valid;
	wire [7:0] fifo_pe_7_1_north_push_data;
	assign fifo_pe_7_1_north_push_data = {8 {fifo_pe_7_1_north_driver_pe_6_1_push_valid}} & fifo_pe_7_1_north_driver_pe_6_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_1_north_push_valid),
		.push_data(fifo_pe_7_1_north_push_data),
		.push_ready(fifo_pe_7_1_north_push_ready),
		.pop_valid(fifo_pe_7_1_north_pop_valid),
		.pop_data(fifo_pe_7_1_north_pop_data),
		.pop_ready(fifo_pe_7_1_north_pop_ready)
	);
	wire [7:0] fifo_pe_4_4_north_pop_data;
	wire [0:0] fifo_pe_4_4_north_pop_valid;
	wire [0:0] fifo_pe_4_4_north_pop_ready;
	wire [7:0] fifo_pe_4_4_north_driver_pe_3_4_push_data;
	wire [0:0] fifo_pe_4_4_north_driver_pe_3_4_push_valid;
	wire [0:0] fifo_pe_4_4_north_driver_pe_3_4_push_ready;
	wire fifo_pe_4_4_north_push_ready;
	assign fifo_pe_4_4_north_driver_pe_3_4_push_ready = fifo_pe_4_4_north_push_ready;
	wire [0:0] fifo_pe_4_4_north_push_valid;
	assign fifo_pe_4_4_north_push_valid = fifo_pe_4_4_north_driver_pe_3_4_push_valid;
	wire [7:0] fifo_pe_4_4_north_push_data;
	assign fifo_pe_4_4_north_push_data = {8 {fifo_pe_4_4_north_driver_pe_3_4_push_valid}} & fifo_pe_4_4_north_driver_pe_3_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_4_north_push_valid),
		.push_data(fifo_pe_4_4_north_push_data),
		.push_ready(fifo_pe_4_4_north_push_ready),
		.pop_valid(fifo_pe_4_4_north_pop_valid),
		.pop_data(fifo_pe_4_4_north_pop_data),
		.pop_ready(fifo_pe_4_4_north_pop_ready)
	);
	wire [7:0] fifo_pe_4_4_west_pop_data;
	wire [0:0] fifo_pe_4_4_west_pop_valid;
	wire [0:0] fifo_pe_4_4_west_pop_ready;
	wire [7:0] fifo_pe_4_4_west_driver_pe_4_3_push_data;
	wire [0:0] fifo_pe_4_4_west_driver_pe_4_3_push_valid;
	wire [0:0] fifo_pe_4_4_west_driver_pe_4_3_push_ready;
	wire fifo_pe_4_4_west_push_ready;
	assign fifo_pe_4_4_west_driver_pe_4_3_push_ready = fifo_pe_4_4_west_push_ready;
	wire [0:0] fifo_pe_4_4_west_push_valid;
	assign fifo_pe_4_4_west_push_valid = fifo_pe_4_4_west_driver_pe_4_3_push_valid;
	wire [7:0] fifo_pe_4_4_west_push_data;
	assign fifo_pe_4_4_west_push_data = {8 {fifo_pe_4_4_west_driver_pe_4_3_push_valid}} & fifo_pe_4_4_west_driver_pe_4_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_4_west_push_valid),
		.push_data(fifo_pe_4_4_west_push_data),
		.push_ready(fifo_pe_4_4_west_push_ready),
		.pop_valid(fifo_pe_4_4_west_pop_valid),
		.pop_data(fifo_pe_4_4_west_pop_data),
		.pop_ready(fifo_pe_4_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_5_west_pop_data;
	wire [0:0] fifo_pe_1_5_west_pop_valid;
	wire [0:0] fifo_pe_1_5_west_pop_ready;
	wire [7:0] fifo_pe_1_5_west_driver_pe_1_4_push_data;
	wire [0:0] fifo_pe_1_5_west_driver_pe_1_4_push_valid;
	wire [0:0] fifo_pe_1_5_west_driver_pe_1_4_push_ready;
	wire fifo_pe_1_5_west_push_ready;
	assign fifo_pe_1_5_west_driver_pe_1_4_push_ready = fifo_pe_1_5_west_push_ready;
	wire [0:0] fifo_pe_1_5_west_push_valid;
	assign fifo_pe_1_5_west_push_valid = fifo_pe_1_5_west_driver_pe_1_4_push_valid;
	wire [7:0] fifo_pe_1_5_west_push_data;
	assign fifo_pe_1_5_west_push_data = {8 {fifo_pe_1_5_west_driver_pe_1_4_push_valid}} & fifo_pe_1_5_west_driver_pe_1_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_5_west_push_valid),
		.push_data(fifo_pe_1_5_west_push_data),
		.push_ready(fifo_pe_1_5_west_push_ready),
		.pop_valid(fifo_pe_1_5_west_pop_valid),
		.pop_data(fifo_pe_1_5_west_pop_data),
		.pop_ready(fifo_pe_1_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_5_north_pop_data;
	wire [0:0] fifo_pe_1_5_north_pop_valid;
	wire [0:0] fifo_pe_1_5_north_pop_ready;
	wire [7:0] fifo_pe_1_5_north_driver_col_pusher_5_push_data;
	wire [0:0] fifo_pe_1_5_north_driver_col_pusher_5_push_valid;
	wire [0:0] fifo_pe_1_5_north_driver_col_pusher_5_push_ready;
	wire fifo_pe_1_5_north_push_ready;
	assign fifo_pe_1_5_north_driver_col_pusher_5_push_ready = fifo_pe_1_5_north_push_ready;
	wire [0:0] fifo_pe_1_5_north_push_valid;
	assign fifo_pe_1_5_north_push_valid = fifo_pe_1_5_north_driver_col_pusher_5_push_valid;
	wire [7:0] fifo_pe_1_5_north_push_data;
	assign fifo_pe_1_5_north_push_data = {8 {fifo_pe_1_5_north_driver_col_pusher_5_push_valid}} & fifo_pe_1_5_north_driver_col_pusher_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_5_north_push_valid),
		.push_data(fifo_pe_1_5_north_push_data),
		.push_ready(fifo_pe_1_5_north_push_ready),
		.pop_valid(fifo_pe_1_5_north_pop_valid),
		.pop_data(fifo_pe_1_5_north_pop_data),
		.pop_ready(fifo_pe_1_5_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_3_west_pop_data;
	wire [0:0] fifo_pe_2_3_west_pop_valid;
	wire [0:0] fifo_pe_2_3_west_pop_ready;
	wire [7:0] fifo_pe_2_3_west_driver_pe_2_2_push_data;
	wire [0:0] fifo_pe_2_3_west_driver_pe_2_2_push_valid;
	wire [0:0] fifo_pe_2_3_west_driver_pe_2_2_push_ready;
	wire fifo_pe_2_3_west_push_ready;
	assign fifo_pe_2_3_west_driver_pe_2_2_push_ready = fifo_pe_2_3_west_push_ready;
	wire [0:0] fifo_pe_2_3_west_push_valid;
	assign fifo_pe_2_3_west_push_valid = fifo_pe_2_3_west_driver_pe_2_2_push_valid;
	wire [7:0] fifo_pe_2_3_west_push_data;
	assign fifo_pe_2_3_west_push_data = {8 {fifo_pe_2_3_west_driver_pe_2_2_push_valid}} & fifo_pe_2_3_west_driver_pe_2_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_3_west_push_valid),
		.push_data(fifo_pe_2_3_west_push_data),
		.push_ready(fifo_pe_2_3_west_push_ready),
		.pop_valid(fifo_pe_2_3_west_pop_valid),
		.pop_data(fifo_pe_2_3_west_pop_data),
		.pop_ready(fifo_pe_2_3_west_pop_ready)
	);
	wire [7:0] fifo_pe_2_3_north_pop_data;
	wire [0:0] fifo_pe_2_3_north_pop_valid;
	wire [0:0] fifo_pe_2_3_north_pop_ready;
	wire [7:0] fifo_pe_2_3_north_driver_pe_1_3_push_data;
	wire [0:0] fifo_pe_2_3_north_driver_pe_1_3_push_valid;
	wire [0:0] fifo_pe_2_3_north_driver_pe_1_3_push_ready;
	wire fifo_pe_2_3_north_push_ready;
	assign fifo_pe_2_3_north_driver_pe_1_3_push_ready = fifo_pe_2_3_north_push_ready;
	wire [0:0] fifo_pe_2_3_north_push_valid;
	assign fifo_pe_2_3_north_push_valid = fifo_pe_2_3_north_driver_pe_1_3_push_valid;
	wire [7:0] fifo_pe_2_3_north_push_data;
	assign fifo_pe_2_3_north_push_data = {8 {fifo_pe_2_3_north_driver_pe_1_3_push_valid}} & fifo_pe_2_3_north_driver_pe_1_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_3_north_push_valid),
		.push_data(fifo_pe_2_3_north_push_data),
		.push_ready(fifo_pe_2_3_north_push_ready),
		.pop_valid(fifo_pe_2_3_north_pop_valid),
		.pop_data(fifo_pe_2_3_north_pop_data),
		.pop_ready(fifo_pe_2_3_north_pop_ready)
	);
	wire [7:0] fifo_sink_69c5d_north_pop_data;
	wire [0:0] fifo_sink_69c5d_north_pop_valid;
	wire [0:0] fifo_sink_69c5d_north_pop_ready;
	wire [7:0] fifo_sink_69c5d_north_driver_pe_8_5_push_data;
	wire [0:0] fifo_sink_69c5d_north_driver_pe_8_5_push_valid;
	wire [0:0] fifo_sink_69c5d_north_driver_pe_8_5_push_ready;
	wire fifo_sink_69c5d_north_push_ready;
	assign fifo_sink_69c5d_north_driver_pe_8_5_push_ready = fifo_sink_69c5d_north_push_ready;
	wire [0:0] fifo_sink_69c5d_north_push_valid;
	assign fifo_sink_69c5d_north_push_valid = fifo_sink_69c5d_north_driver_pe_8_5_push_valid;
	wire [7:0] fifo_sink_69c5d_north_push_data;
	assign fifo_sink_69c5d_north_push_data = {8 {fifo_sink_69c5d_north_driver_pe_8_5_push_valid}} & fifo_sink_69c5d_north_driver_pe_8_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_69c5d_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_69c5d_north_push_valid),
		.push_data(fifo_sink_69c5d_north_push_data),
		.push_ready(fifo_sink_69c5d_north_push_ready),
		.pop_valid(fifo_sink_69c5d_north_pop_valid),
		.pop_data(fifo_sink_69c5d_north_pop_data),
		.pop_ready(fifo_sink_69c5d_north_pop_ready)
	);
	wire [7:0] fifo_pe_4_2_west_pop_data;
	wire [0:0] fifo_pe_4_2_west_pop_valid;
	wire [0:0] fifo_pe_4_2_west_pop_ready;
	wire [7:0] fifo_pe_4_2_west_driver_pe_4_1_push_data;
	wire [0:0] fifo_pe_4_2_west_driver_pe_4_1_push_valid;
	wire [0:0] fifo_pe_4_2_west_driver_pe_4_1_push_ready;
	wire fifo_pe_4_2_west_push_ready;
	assign fifo_pe_4_2_west_driver_pe_4_1_push_ready = fifo_pe_4_2_west_push_ready;
	wire [0:0] fifo_pe_4_2_west_push_valid;
	assign fifo_pe_4_2_west_push_valid = fifo_pe_4_2_west_driver_pe_4_1_push_valid;
	wire [7:0] fifo_pe_4_2_west_push_data;
	assign fifo_pe_4_2_west_push_data = {8 {fifo_pe_4_2_west_driver_pe_4_1_push_valid}} & fifo_pe_4_2_west_driver_pe_4_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_2_west_push_valid),
		.push_data(fifo_pe_4_2_west_push_data),
		.push_ready(fifo_pe_4_2_west_push_ready),
		.pop_valid(fifo_pe_4_2_west_pop_valid),
		.pop_data(fifo_pe_4_2_west_pop_data),
		.pop_ready(fifo_pe_4_2_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_2_north_pop_data;
	wire [0:0] fifo_pe_4_2_north_pop_valid;
	wire [0:0] fifo_pe_4_2_north_pop_ready;
	wire [7:0] fifo_pe_4_2_north_driver_pe_3_2_push_data;
	wire [0:0] fifo_pe_4_2_north_driver_pe_3_2_push_valid;
	wire [0:0] fifo_pe_4_2_north_driver_pe_3_2_push_ready;
	wire fifo_pe_4_2_north_push_ready;
	assign fifo_pe_4_2_north_driver_pe_3_2_push_ready = fifo_pe_4_2_north_push_ready;
	wire [0:0] fifo_pe_4_2_north_push_valid;
	assign fifo_pe_4_2_north_push_valid = fifo_pe_4_2_north_driver_pe_3_2_push_valid;
	wire [7:0] fifo_pe_4_2_north_push_data;
	assign fifo_pe_4_2_north_push_data = {8 {fifo_pe_4_2_north_driver_pe_3_2_push_valid}} & fifo_pe_4_2_north_driver_pe_3_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_2_north_push_valid),
		.push_data(fifo_pe_4_2_north_push_data),
		.push_ready(fifo_pe_4_2_north_push_ready),
		.pop_valid(fifo_pe_4_2_north_pop_valid),
		.pop_data(fifo_pe_4_2_north_pop_data),
		.pop_ready(fifo_pe_4_2_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_5_west_pop_data;
	wire [0:0] fifo_pe_2_5_west_pop_valid;
	wire [0:0] fifo_pe_2_5_west_pop_ready;
	wire [7:0] fifo_pe_2_5_west_driver_pe_2_4_push_data;
	wire [0:0] fifo_pe_2_5_west_driver_pe_2_4_push_valid;
	wire [0:0] fifo_pe_2_5_west_driver_pe_2_4_push_ready;
	wire fifo_pe_2_5_west_push_ready;
	assign fifo_pe_2_5_west_driver_pe_2_4_push_ready = fifo_pe_2_5_west_push_ready;
	wire [0:0] fifo_pe_2_5_west_push_valid;
	assign fifo_pe_2_5_west_push_valid = fifo_pe_2_5_west_driver_pe_2_4_push_valid;
	wire [7:0] fifo_pe_2_5_west_push_data;
	assign fifo_pe_2_5_west_push_data = {8 {fifo_pe_2_5_west_driver_pe_2_4_push_valid}} & fifo_pe_2_5_west_driver_pe_2_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_5_west_push_valid),
		.push_data(fifo_pe_2_5_west_push_data),
		.push_ready(fifo_pe_2_5_west_push_ready),
		.pop_valid(fifo_pe_2_5_west_pop_valid),
		.pop_data(fifo_pe_2_5_west_pop_data),
		.pop_ready(fifo_pe_2_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_2_5_north_pop_data;
	wire [0:0] fifo_pe_2_5_north_pop_valid;
	wire [0:0] fifo_pe_2_5_north_pop_ready;
	wire [7:0] fifo_pe_2_5_north_driver_pe_1_5_push_data;
	wire [0:0] fifo_pe_2_5_north_driver_pe_1_5_push_valid;
	wire [0:0] fifo_pe_2_5_north_driver_pe_1_5_push_ready;
	wire fifo_pe_2_5_north_push_ready;
	assign fifo_pe_2_5_north_driver_pe_1_5_push_ready = fifo_pe_2_5_north_push_ready;
	wire [0:0] fifo_pe_2_5_north_push_valid;
	assign fifo_pe_2_5_north_push_valid = fifo_pe_2_5_north_driver_pe_1_5_push_valid;
	wire [7:0] fifo_pe_2_5_north_push_data;
	assign fifo_pe_2_5_north_push_data = {8 {fifo_pe_2_5_north_driver_pe_1_5_push_valid}} & fifo_pe_2_5_north_driver_pe_1_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_5_north_push_valid),
		.push_data(fifo_pe_2_5_north_push_data),
		.push_ready(fifo_pe_2_5_north_push_ready),
		.pop_valid(fifo_pe_2_5_north_pop_valid),
		.pop_data(fifo_pe_2_5_north_pop_data),
		.pop_ready(fifo_pe_2_5_north_pop_ready)
	);
	wire [7:0] fifo_sink_68649_west_pop_data;
	wire [0:0] fifo_sink_68649_west_pop_valid;
	wire [0:0] fifo_sink_68649_west_pop_ready;
	wire [7:0] fifo_sink_68649_west_driver_pe_3_8_push_data;
	wire [0:0] fifo_sink_68649_west_driver_pe_3_8_push_valid;
	wire [0:0] fifo_sink_68649_west_driver_pe_3_8_push_ready;
	wire fifo_sink_68649_west_push_ready;
	assign fifo_sink_68649_west_driver_pe_3_8_push_ready = fifo_sink_68649_west_push_ready;
	wire [0:0] fifo_sink_68649_west_push_valid;
	assign fifo_sink_68649_west_push_valid = fifo_sink_68649_west_driver_pe_3_8_push_valid;
	wire [7:0] fifo_sink_68649_west_push_data;
	assign fifo_sink_68649_west_push_data = {8 {fifo_sink_68649_west_driver_pe_3_8_push_valid}} & fifo_sink_68649_west_driver_pe_3_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_68649_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_68649_west_push_valid),
		.push_data(fifo_sink_68649_west_push_data),
		.push_ready(fifo_sink_68649_west_push_ready),
		.pop_valid(fifo_sink_68649_west_pop_valid),
		.pop_data(fifo_sink_68649_west_pop_data),
		.pop_ready(fifo_sink_68649_west_pop_ready)
	);
	wire [7:0] fifo_pe_2_8_north_pop_data;
	wire [0:0] fifo_pe_2_8_north_pop_valid;
	wire [0:0] fifo_pe_2_8_north_pop_ready;
	wire [7:0] fifo_pe_2_8_north_driver_pe_1_8_push_data;
	wire [0:0] fifo_pe_2_8_north_driver_pe_1_8_push_valid;
	wire [0:0] fifo_pe_2_8_north_driver_pe_1_8_push_ready;
	wire fifo_pe_2_8_north_push_ready;
	assign fifo_pe_2_8_north_driver_pe_1_8_push_ready = fifo_pe_2_8_north_push_ready;
	wire [0:0] fifo_pe_2_8_north_push_valid;
	assign fifo_pe_2_8_north_push_valid = fifo_pe_2_8_north_driver_pe_1_8_push_valid;
	wire [7:0] fifo_pe_2_8_north_push_data;
	assign fifo_pe_2_8_north_push_data = {8 {fifo_pe_2_8_north_driver_pe_1_8_push_valid}} & fifo_pe_2_8_north_driver_pe_1_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_8_north_push_valid),
		.push_data(fifo_pe_2_8_north_push_data),
		.push_ready(fifo_pe_2_8_north_push_ready),
		.pop_valid(fifo_pe_2_8_north_pop_valid),
		.pop_data(fifo_pe_2_8_north_pop_data),
		.pop_ready(fifo_pe_2_8_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_8_west_pop_data;
	wire [0:0] fifo_pe_2_8_west_pop_valid;
	wire [0:0] fifo_pe_2_8_west_pop_ready;
	wire [7:0] fifo_pe_2_8_west_driver_pe_2_7_push_data;
	wire [0:0] fifo_pe_2_8_west_driver_pe_2_7_push_valid;
	wire [0:0] fifo_pe_2_8_west_driver_pe_2_7_push_ready;
	wire fifo_pe_2_8_west_push_ready;
	assign fifo_pe_2_8_west_driver_pe_2_7_push_ready = fifo_pe_2_8_west_push_ready;
	wire [0:0] fifo_pe_2_8_west_push_valid;
	assign fifo_pe_2_8_west_push_valid = fifo_pe_2_8_west_driver_pe_2_7_push_valid;
	wire [7:0] fifo_pe_2_8_west_push_data;
	assign fifo_pe_2_8_west_push_data = {8 {fifo_pe_2_8_west_driver_pe_2_7_push_valid}} & fifo_pe_2_8_west_driver_pe_2_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_8_west_push_valid),
		.push_data(fifo_pe_2_8_west_push_data),
		.push_ready(fifo_pe_2_8_west_push_ready),
		.pop_valid(fifo_pe_2_8_west_pop_valid),
		.pop_data(fifo_pe_2_8_west_pop_data),
		.pop_ready(fifo_pe_2_8_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_1_north_pop_data;
	wire [0:0] fifo_pe_4_1_north_pop_valid;
	wire [0:0] fifo_pe_4_1_north_pop_ready;
	wire [7:0] fifo_pe_4_1_north_driver_pe_3_1_push_data;
	wire [0:0] fifo_pe_4_1_north_driver_pe_3_1_push_valid;
	wire [0:0] fifo_pe_4_1_north_driver_pe_3_1_push_ready;
	wire fifo_pe_4_1_north_push_ready;
	assign fifo_pe_4_1_north_driver_pe_3_1_push_ready = fifo_pe_4_1_north_push_ready;
	wire [0:0] fifo_pe_4_1_north_push_valid;
	assign fifo_pe_4_1_north_push_valid = fifo_pe_4_1_north_driver_pe_3_1_push_valid;
	wire [7:0] fifo_pe_4_1_north_push_data;
	assign fifo_pe_4_1_north_push_data = {8 {fifo_pe_4_1_north_driver_pe_3_1_push_valid}} & fifo_pe_4_1_north_driver_pe_3_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_1_north_push_valid),
		.push_data(fifo_pe_4_1_north_push_data),
		.push_ready(fifo_pe_4_1_north_push_ready),
		.pop_valid(fifo_pe_4_1_north_pop_valid),
		.pop_data(fifo_pe_4_1_north_pop_data),
		.pop_ready(fifo_pe_4_1_north_pop_ready)
	);
	wire [7:0] fifo_pe_4_1_west_pop_data;
	wire [0:0] fifo_pe_4_1_west_pop_valid;
	wire [0:0] fifo_pe_4_1_west_pop_ready;
	wire [7:0] fifo_pe_4_1_west_driver_row_pusher_4_push_data;
	wire [0:0] fifo_pe_4_1_west_driver_row_pusher_4_push_valid;
	wire [0:0] fifo_pe_4_1_west_driver_row_pusher_4_push_ready;
	wire fifo_pe_4_1_west_push_ready;
	assign fifo_pe_4_1_west_driver_row_pusher_4_push_ready = fifo_pe_4_1_west_push_ready;
	wire [0:0] fifo_pe_4_1_west_push_valid;
	assign fifo_pe_4_1_west_push_valid = fifo_pe_4_1_west_driver_row_pusher_4_push_valid;
	wire [7:0] fifo_pe_4_1_west_push_data;
	assign fifo_pe_4_1_west_push_data = {8 {fifo_pe_4_1_west_driver_row_pusher_4_push_valid}} & fifo_pe_4_1_west_driver_row_pusher_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_1_west_push_valid),
		.push_data(fifo_pe_4_1_west_push_data),
		.push_ready(fifo_pe_4_1_west_push_ready),
		.pop_valid(fifo_pe_4_1_west_pop_valid),
		.pop_data(fifo_pe_4_1_west_pop_data),
		.pop_ready(fifo_pe_4_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_3_7_north_pop_data;
	wire [0:0] fifo_pe_3_7_north_pop_valid;
	wire [0:0] fifo_pe_3_7_north_pop_ready;
	wire [7:0] fifo_pe_3_7_north_driver_pe_2_7_push_data;
	wire [0:0] fifo_pe_3_7_north_driver_pe_2_7_push_valid;
	wire [0:0] fifo_pe_3_7_north_driver_pe_2_7_push_ready;
	wire fifo_pe_3_7_north_push_ready;
	assign fifo_pe_3_7_north_driver_pe_2_7_push_ready = fifo_pe_3_7_north_push_ready;
	wire [0:0] fifo_pe_3_7_north_push_valid;
	assign fifo_pe_3_7_north_push_valid = fifo_pe_3_7_north_driver_pe_2_7_push_valid;
	wire [7:0] fifo_pe_3_7_north_push_data;
	assign fifo_pe_3_7_north_push_data = {8 {fifo_pe_3_7_north_driver_pe_2_7_push_valid}} & fifo_pe_3_7_north_driver_pe_2_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_7_north_push_valid),
		.push_data(fifo_pe_3_7_north_push_data),
		.push_ready(fifo_pe_3_7_north_push_ready),
		.pop_valid(fifo_pe_3_7_north_pop_valid),
		.pop_data(fifo_pe_3_7_north_pop_data),
		.pop_ready(fifo_pe_3_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_7_west_pop_data;
	wire [0:0] fifo_pe_3_7_west_pop_valid;
	wire [0:0] fifo_pe_3_7_west_pop_ready;
	wire [7:0] fifo_pe_3_7_west_driver_pe_3_6_push_data;
	wire [0:0] fifo_pe_3_7_west_driver_pe_3_6_push_valid;
	wire [0:0] fifo_pe_3_7_west_driver_pe_3_6_push_ready;
	wire fifo_pe_3_7_west_push_ready;
	assign fifo_pe_3_7_west_driver_pe_3_6_push_ready = fifo_pe_3_7_west_push_ready;
	wire [0:0] fifo_pe_3_7_west_push_valid;
	assign fifo_pe_3_7_west_push_valid = fifo_pe_3_7_west_driver_pe_3_6_push_valid;
	wire [7:0] fifo_pe_3_7_west_push_data;
	assign fifo_pe_3_7_west_push_data = {8 {fifo_pe_3_7_west_driver_pe_3_6_push_valid}} & fifo_pe_3_7_west_driver_pe_3_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_7_west_push_valid),
		.push_data(fifo_pe_3_7_west_push_data),
		.push_ready(fifo_pe_3_7_west_push_ready),
		.pop_valid(fifo_pe_3_7_west_pop_valid),
		.pop_data(fifo_pe_3_7_west_pop_data),
		.pop_ready(fifo_pe_3_7_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_3_north_pop_data;
	wire [0:0] fifo_pe_4_3_north_pop_valid;
	wire [0:0] fifo_pe_4_3_north_pop_ready;
	wire [7:0] fifo_pe_4_3_north_driver_pe_3_3_push_data;
	wire [0:0] fifo_pe_4_3_north_driver_pe_3_3_push_valid;
	wire [0:0] fifo_pe_4_3_north_driver_pe_3_3_push_ready;
	wire fifo_pe_4_3_north_push_ready;
	assign fifo_pe_4_3_north_driver_pe_3_3_push_ready = fifo_pe_4_3_north_push_ready;
	wire [0:0] fifo_pe_4_3_north_push_valid;
	assign fifo_pe_4_3_north_push_valid = fifo_pe_4_3_north_driver_pe_3_3_push_valid;
	wire [7:0] fifo_pe_4_3_north_push_data;
	assign fifo_pe_4_3_north_push_data = {8 {fifo_pe_4_3_north_driver_pe_3_3_push_valid}} & fifo_pe_4_3_north_driver_pe_3_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_3_north_push_valid),
		.push_data(fifo_pe_4_3_north_push_data),
		.push_ready(fifo_pe_4_3_north_push_ready),
		.pop_valid(fifo_pe_4_3_north_pop_valid),
		.pop_data(fifo_pe_4_3_north_pop_data),
		.pop_ready(fifo_pe_4_3_north_pop_ready)
	);
	wire [7:0] fifo_pe_4_3_west_pop_data;
	wire [0:0] fifo_pe_4_3_west_pop_valid;
	wire [0:0] fifo_pe_4_3_west_pop_ready;
	wire [7:0] fifo_pe_4_3_west_driver_pe_4_2_push_data;
	wire [0:0] fifo_pe_4_3_west_driver_pe_4_2_push_valid;
	wire [0:0] fifo_pe_4_3_west_driver_pe_4_2_push_ready;
	wire fifo_pe_4_3_west_push_ready;
	assign fifo_pe_4_3_west_driver_pe_4_2_push_ready = fifo_pe_4_3_west_push_ready;
	wire [0:0] fifo_pe_4_3_west_push_valid;
	assign fifo_pe_4_3_west_push_valid = fifo_pe_4_3_west_driver_pe_4_2_push_valid;
	wire [7:0] fifo_pe_4_3_west_push_data;
	assign fifo_pe_4_3_west_push_data = {8 {fifo_pe_4_3_west_driver_pe_4_2_push_valid}} & fifo_pe_4_3_west_driver_pe_4_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_3_west_push_valid),
		.push_data(fifo_pe_4_3_west_push_data),
		.push_ready(fifo_pe_4_3_west_push_ready),
		.pop_valid(fifo_pe_4_3_west_pop_valid),
		.pop_data(fifo_pe_4_3_west_pop_data),
		.pop_ready(fifo_pe_4_3_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_8_west_pop_data;
	wire [0:0] fifo_pe_4_8_west_pop_valid;
	wire [0:0] fifo_pe_4_8_west_pop_ready;
	wire [7:0] fifo_pe_4_8_west_driver_pe_4_7_push_data;
	wire [0:0] fifo_pe_4_8_west_driver_pe_4_7_push_valid;
	wire [0:0] fifo_pe_4_8_west_driver_pe_4_7_push_ready;
	wire fifo_pe_4_8_west_push_ready;
	assign fifo_pe_4_8_west_driver_pe_4_7_push_ready = fifo_pe_4_8_west_push_ready;
	wire [0:0] fifo_pe_4_8_west_push_valid;
	assign fifo_pe_4_8_west_push_valid = fifo_pe_4_8_west_driver_pe_4_7_push_valid;
	wire [7:0] fifo_pe_4_8_west_push_data;
	assign fifo_pe_4_8_west_push_data = {8 {fifo_pe_4_8_west_driver_pe_4_7_push_valid}} & fifo_pe_4_8_west_driver_pe_4_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_8_west_push_valid),
		.push_data(fifo_pe_4_8_west_push_data),
		.push_ready(fifo_pe_4_8_west_push_ready),
		.pop_valid(fifo_pe_4_8_west_pop_valid),
		.pop_data(fifo_pe_4_8_west_pop_data),
		.pop_ready(fifo_pe_4_8_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_8_north_pop_data;
	wire [0:0] fifo_pe_4_8_north_pop_valid;
	wire [0:0] fifo_pe_4_8_north_pop_ready;
	wire [7:0] fifo_pe_4_8_north_driver_pe_3_8_push_data;
	wire [0:0] fifo_pe_4_8_north_driver_pe_3_8_push_valid;
	wire [0:0] fifo_pe_4_8_north_driver_pe_3_8_push_ready;
	wire fifo_pe_4_8_north_push_ready;
	assign fifo_pe_4_8_north_driver_pe_3_8_push_ready = fifo_pe_4_8_north_push_ready;
	wire [0:0] fifo_pe_4_8_north_push_valid;
	assign fifo_pe_4_8_north_push_valid = fifo_pe_4_8_north_driver_pe_3_8_push_valid;
	wire [7:0] fifo_pe_4_8_north_push_data;
	assign fifo_pe_4_8_north_push_data = {8 {fifo_pe_4_8_north_driver_pe_3_8_push_valid}} & fifo_pe_4_8_north_driver_pe_3_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_8_north_push_valid),
		.push_data(fifo_pe_4_8_north_push_data),
		.push_ready(fifo_pe_4_8_north_push_ready),
		.pop_valid(fifo_pe_4_8_north_pop_valid),
		.pop_data(fifo_pe_4_8_north_pop_data),
		.pop_ready(fifo_pe_4_8_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_4_west_pop_data;
	wire [0:0] fifo_pe_6_4_west_pop_valid;
	wire [0:0] fifo_pe_6_4_west_pop_ready;
	wire [7:0] fifo_pe_6_4_west_driver_pe_6_3_push_data;
	wire [0:0] fifo_pe_6_4_west_driver_pe_6_3_push_valid;
	wire [0:0] fifo_pe_6_4_west_driver_pe_6_3_push_ready;
	wire fifo_pe_6_4_west_push_ready;
	assign fifo_pe_6_4_west_driver_pe_6_3_push_ready = fifo_pe_6_4_west_push_ready;
	wire [0:0] fifo_pe_6_4_west_push_valid;
	assign fifo_pe_6_4_west_push_valid = fifo_pe_6_4_west_driver_pe_6_3_push_valid;
	wire [7:0] fifo_pe_6_4_west_push_data;
	assign fifo_pe_6_4_west_push_data = {8 {fifo_pe_6_4_west_driver_pe_6_3_push_valid}} & fifo_pe_6_4_west_driver_pe_6_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_4_west_push_valid),
		.push_data(fifo_pe_6_4_west_push_data),
		.push_ready(fifo_pe_6_4_west_push_ready),
		.pop_valid(fifo_pe_6_4_west_pop_valid),
		.pop_data(fifo_pe_6_4_west_pop_data),
		.pop_ready(fifo_pe_6_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_6_4_north_pop_data;
	wire [0:0] fifo_pe_6_4_north_pop_valid;
	wire [0:0] fifo_pe_6_4_north_pop_ready;
	wire [7:0] fifo_pe_6_4_north_driver_pe_5_4_push_data;
	wire [0:0] fifo_pe_6_4_north_driver_pe_5_4_push_valid;
	wire [0:0] fifo_pe_6_4_north_driver_pe_5_4_push_ready;
	wire fifo_pe_6_4_north_push_ready;
	assign fifo_pe_6_4_north_driver_pe_5_4_push_ready = fifo_pe_6_4_north_push_ready;
	wire [0:0] fifo_pe_6_4_north_push_valid;
	assign fifo_pe_6_4_north_push_valid = fifo_pe_6_4_north_driver_pe_5_4_push_valid;
	wire [7:0] fifo_pe_6_4_north_push_data;
	assign fifo_pe_6_4_north_push_data = {8 {fifo_pe_6_4_north_driver_pe_5_4_push_valid}} & fifo_pe_6_4_north_driver_pe_5_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_4_north_push_valid),
		.push_data(fifo_pe_6_4_north_push_data),
		.push_ready(fifo_pe_6_4_north_push_ready),
		.pop_valid(fifo_pe_6_4_north_pop_valid),
		.pop_data(fifo_pe_6_4_north_pop_data),
		.pop_ready(fifo_pe_6_4_north_pop_ready)
	);
	wire [7:0] fifo_col_pusher_2_data_pop_data;
	wire [0:0] fifo_col_pusher_2_data_pop_valid;
	wire [0:0] fifo_col_pusher_2_data_pop_ready;
	wire [7:0] fifo_col_pusher_2_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_2_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_2_data_driver_testbench_push_ready;
	wire fifo_col_pusher_2_data_push_ready;
	assign fifo_col_pusher_2_data_driver_testbench_push_ready = fifo_col_pusher_2_data_push_ready;
	wire [0:0] fifo_col_pusher_2_data_push_valid;
	assign fifo_col_pusher_2_data_push_valid = fifo_col_pusher_2_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_2_data_push_data;
	assign fifo_col_pusher_2_data_push_data = {8 {fifo_col_pusher_2_data_driver_testbench_push_valid}} & fifo_col_pusher_2_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_2_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_2_data_push_valid),
		.push_data(fifo_col_pusher_2_data_push_data),
		.push_ready(fifo_col_pusher_2_data_push_ready),
		.pop_valid(fifo_col_pusher_2_data_pop_valid),
		.pop_data(fifo_col_pusher_2_data_pop_data),
		.pop_ready(fifo_col_pusher_2_data_pop_ready)
	);
	wire [7:0] fifo_row_pusher_2_data_pop_data;
	wire [0:0] fifo_row_pusher_2_data_pop_valid;
	wire [0:0] fifo_row_pusher_2_data_pop_ready;
	wire [7:0] fifo_row_pusher_2_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_2_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_2_data_driver_testbench_push_ready;
	wire fifo_row_pusher_2_data_push_ready;
	assign fifo_row_pusher_2_data_driver_testbench_push_ready = fifo_row_pusher_2_data_push_ready;
	wire [0:0] fifo_row_pusher_2_data_push_valid;
	assign fifo_row_pusher_2_data_push_valid = fifo_row_pusher_2_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_2_data_push_data;
	assign fifo_row_pusher_2_data_push_data = {8 {fifo_row_pusher_2_data_driver_testbench_push_valid}} & fifo_row_pusher_2_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_2_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_2_data_push_valid),
		.push_data(fifo_row_pusher_2_data_push_data),
		.push_ready(fifo_row_pusher_2_data_push_ready),
		.pop_valid(fifo_row_pusher_2_data_pop_valid),
		.pop_data(fifo_row_pusher_2_data_pop_data),
		.pop_ready(fifo_row_pusher_2_data_pop_ready)
	);
	wire [7:0] fifo_pe_8_8_north_pop_data;
	wire [0:0] fifo_pe_8_8_north_pop_valid;
	wire [0:0] fifo_pe_8_8_north_pop_ready;
	wire [7:0] fifo_pe_8_8_north_driver_pe_7_8_push_data;
	wire [0:0] fifo_pe_8_8_north_driver_pe_7_8_push_valid;
	wire [0:0] fifo_pe_8_8_north_driver_pe_7_8_push_ready;
	wire fifo_pe_8_8_north_push_ready;
	assign fifo_pe_8_8_north_driver_pe_7_8_push_ready = fifo_pe_8_8_north_push_ready;
	wire [0:0] fifo_pe_8_8_north_push_valid;
	assign fifo_pe_8_8_north_push_valid = fifo_pe_8_8_north_driver_pe_7_8_push_valid;
	wire [7:0] fifo_pe_8_8_north_push_data;
	assign fifo_pe_8_8_north_push_data = {8 {fifo_pe_8_8_north_driver_pe_7_8_push_valid}} & fifo_pe_8_8_north_driver_pe_7_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_8_north_push_valid),
		.push_data(fifo_pe_8_8_north_push_data),
		.push_ready(fifo_pe_8_8_north_push_ready),
		.pop_valid(fifo_pe_8_8_north_pop_valid),
		.pop_data(fifo_pe_8_8_north_pop_data),
		.pop_ready(fifo_pe_8_8_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_8_west_pop_data;
	wire [0:0] fifo_pe_8_8_west_pop_valid;
	wire [0:0] fifo_pe_8_8_west_pop_ready;
	wire [7:0] fifo_pe_8_8_west_driver_pe_8_7_push_data;
	wire [0:0] fifo_pe_8_8_west_driver_pe_8_7_push_valid;
	wire [0:0] fifo_pe_8_8_west_driver_pe_8_7_push_ready;
	wire fifo_pe_8_8_west_push_ready;
	assign fifo_pe_8_8_west_driver_pe_8_7_push_ready = fifo_pe_8_8_west_push_ready;
	wire [0:0] fifo_pe_8_8_west_push_valid;
	assign fifo_pe_8_8_west_push_valid = fifo_pe_8_8_west_driver_pe_8_7_push_valid;
	wire [7:0] fifo_pe_8_8_west_push_data;
	assign fifo_pe_8_8_west_push_data = {8 {fifo_pe_8_8_west_driver_pe_8_7_push_valid}} & fifo_pe_8_8_west_driver_pe_8_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_8_west_push_valid),
		.push_data(fifo_pe_8_8_west_push_data),
		.push_ready(fifo_pe_8_8_west_push_ready),
		.pop_valid(fifo_pe_8_8_west_pop_valid),
		.pop_data(fifo_pe_8_8_west_pop_data),
		.pop_ready(fifo_pe_8_8_west_pop_ready)
	);
	wire [7:0] fifo_sink_686ed_west_pop_data;
	wire [0:0] fifo_sink_686ed_west_pop_valid;
	wire [0:0] fifo_sink_686ed_west_pop_ready;
	wire [7:0] fifo_sink_686ed_west_driver_pe_6_8_push_data;
	wire [0:0] fifo_sink_686ed_west_driver_pe_6_8_push_valid;
	wire [0:0] fifo_sink_686ed_west_driver_pe_6_8_push_ready;
	wire fifo_sink_686ed_west_push_ready;
	assign fifo_sink_686ed_west_driver_pe_6_8_push_ready = fifo_sink_686ed_west_push_ready;
	wire [0:0] fifo_sink_686ed_west_push_valid;
	assign fifo_sink_686ed_west_push_valid = fifo_sink_686ed_west_driver_pe_6_8_push_valid;
	wire [7:0] fifo_sink_686ed_west_push_data;
	assign fifo_sink_686ed_west_push_data = {8 {fifo_sink_686ed_west_driver_pe_6_8_push_valid}} & fifo_sink_686ed_west_driver_pe_6_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_686ed_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_686ed_west_push_valid),
		.push_data(fifo_sink_686ed_west_push_data),
		.push_ready(fifo_sink_686ed_west_push_ready),
		.pop_valid(fifo_sink_686ed_west_pop_valid),
		.pop_data(fifo_sink_686ed_west_pop_data),
		.pop_ready(fifo_sink_686ed_west_pop_ready)
	);
	wire [7:0] fifo_pe_3_1_west_pop_data;
	wire [0:0] fifo_pe_3_1_west_pop_valid;
	wire [0:0] fifo_pe_3_1_west_pop_ready;
	wire [7:0] fifo_pe_3_1_west_driver_row_pusher_3_push_data;
	wire [0:0] fifo_pe_3_1_west_driver_row_pusher_3_push_valid;
	wire [0:0] fifo_pe_3_1_west_driver_row_pusher_3_push_ready;
	wire fifo_pe_3_1_west_push_ready;
	assign fifo_pe_3_1_west_driver_row_pusher_3_push_ready = fifo_pe_3_1_west_push_ready;
	wire [0:0] fifo_pe_3_1_west_push_valid;
	assign fifo_pe_3_1_west_push_valid = fifo_pe_3_1_west_driver_row_pusher_3_push_valid;
	wire [7:0] fifo_pe_3_1_west_push_data;
	assign fifo_pe_3_1_west_push_data = {8 {fifo_pe_3_1_west_driver_row_pusher_3_push_valid}} & fifo_pe_3_1_west_driver_row_pusher_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_1_west_push_valid),
		.push_data(fifo_pe_3_1_west_push_data),
		.push_ready(fifo_pe_3_1_west_push_ready),
		.pop_valid(fifo_pe_3_1_west_pop_valid),
		.pop_data(fifo_pe_3_1_west_pop_data),
		.pop_ready(fifo_pe_3_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_3_1_north_pop_data;
	wire [0:0] fifo_pe_3_1_north_pop_valid;
	wire [0:0] fifo_pe_3_1_north_pop_ready;
	wire [7:0] fifo_pe_3_1_north_driver_pe_2_1_push_data;
	wire [0:0] fifo_pe_3_1_north_driver_pe_2_1_push_valid;
	wire [0:0] fifo_pe_3_1_north_driver_pe_2_1_push_ready;
	wire fifo_pe_3_1_north_push_ready;
	assign fifo_pe_3_1_north_driver_pe_2_1_push_ready = fifo_pe_3_1_north_push_ready;
	wire [0:0] fifo_pe_3_1_north_push_valid;
	assign fifo_pe_3_1_north_push_valid = fifo_pe_3_1_north_driver_pe_2_1_push_valid;
	wire [7:0] fifo_pe_3_1_north_push_data;
	assign fifo_pe_3_1_north_push_data = {8 {fifo_pe_3_1_north_driver_pe_2_1_push_valid}} & fifo_pe_3_1_north_driver_pe_2_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_1_north_push_valid),
		.push_data(fifo_pe_3_1_north_push_data),
		.push_ready(fifo_pe_3_1_north_push_ready),
		.pop_valid(fifo_pe_3_1_north_pop_valid),
		.pop_data(fifo_pe_3_1_north_pop_data),
		.pop_ready(fifo_pe_3_1_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_2_west_pop_data;
	wire [0:0] fifo_pe_6_2_west_pop_valid;
	wire [0:0] fifo_pe_6_2_west_pop_ready;
	wire [7:0] fifo_pe_6_2_west_driver_pe_6_1_push_data;
	wire [0:0] fifo_pe_6_2_west_driver_pe_6_1_push_valid;
	wire [0:0] fifo_pe_6_2_west_driver_pe_6_1_push_ready;
	wire fifo_pe_6_2_west_push_ready;
	assign fifo_pe_6_2_west_driver_pe_6_1_push_ready = fifo_pe_6_2_west_push_ready;
	wire [0:0] fifo_pe_6_2_west_push_valid;
	assign fifo_pe_6_2_west_push_valid = fifo_pe_6_2_west_driver_pe_6_1_push_valid;
	wire [7:0] fifo_pe_6_2_west_push_data;
	assign fifo_pe_6_2_west_push_data = {8 {fifo_pe_6_2_west_driver_pe_6_1_push_valid}} & fifo_pe_6_2_west_driver_pe_6_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_2_west_push_valid),
		.push_data(fifo_pe_6_2_west_push_data),
		.push_ready(fifo_pe_6_2_west_push_ready),
		.pop_valid(fifo_pe_6_2_west_pop_valid),
		.pop_data(fifo_pe_6_2_west_pop_data),
		.pop_ready(fifo_pe_6_2_west_pop_ready)
	);
	wire [7:0] fifo_pe_6_2_north_pop_data;
	wire [0:0] fifo_pe_6_2_north_pop_valid;
	wire [0:0] fifo_pe_6_2_north_pop_ready;
	wire [7:0] fifo_pe_6_2_north_driver_pe_5_2_push_data;
	wire [0:0] fifo_pe_6_2_north_driver_pe_5_2_push_valid;
	wire [0:0] fifo_pe_6_2_north_driver_pe_5_2_push_ready;
	wire fifo_pe_6_2_north_push_ready;
	assign fifo_pe_6_2_north_driver_pe_5_2_push_ready = fifo_pe_6_2_north_push_ready;
	wire [0:0] fifo_pe_6_2_north_push_valid;
	assign fifo_pe_6_2_north_push_valid = fifo_pe_6_2_north_driver_pe_5_2_push_valid;
	wire [7:0] fifo_pe_6_2_north_push_data;
	assign fifo_pe_6_2_north_push_data = {8 {fifo_pe_6_2_north_driver_pe_5_2_push_valid}} & fifo_pe_6_2_north_driver_pe_5_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_2_north_push_valid),
		.push_data(fifo_pe_6_2_north_push_data),
		.push_ready(fifo_pe_6_2_north_push_ready),
		.pop_valid(fifo_pe_6_2_north_pop_valid),
		.pop_data(fifo_pe_6_2_north_pop_data),
		.pop_ready(fifo_pe_6_2_north_pop_ready)
	);
	wire [7:0] fifo_row_pusher_7_data_pop_data;
	wire [0:0] fifo_row_pusher_7_data_pop_valid;
	wire [0:0] fifo_row_pusher_7_data_pop_ready;
	wire [7:0] fifo_row_pusher_7_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_7_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_7_data_driver_testbench_push_ready;
	wire fifo_row_pusher_7_data_push_ready;
	assign fifo_row_pusher_7_data_driver_testbench_push_ready = fifo_row_pusher_7_data_push_ready;
	wire [0:0] fifo_row_pusher_7_data_push_valid;
	assign fifo_row_pusher_7_data_push_valid = fifo_row_pusher_7_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_7_data_push_data;
	assign fifo_row_pusher_7_data_push_data = {8 {fifo_row_pusher_7_data_driver_testbench_push_valid}} & fifo_row_pusher_7_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_7_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_7_data_push_valid),
		.push_data(fifo_row_pusher_7_data_push_data),
		.push_ready(fifo_row_pusher_7_data_push_ready),
		.pop_valid(fifo_row_pusher_7_data_pop_valid),
		.pop_data(fifo_row_pusher_7_data_pop_data),
		.pop_ready(fifo_row_pusher_7_data_pop_ready)
	);
	wire [7:0] fifo_pe_1_7_west_pop_data;
	wire [0:0] fifo_pe_1_7_west_pop_valid;
	wire [0:0] fifo_pe_1_7_west_pop_ready;
	wire [7:0] fifo_pe_1_7_west_driver_pe_1_6_push_data;
	wire [0:0] fifo_pe_1_7_west_driver_pe_1_6_push_valid;
	wire [0:0] fifo_pe_1_7_west_driver_pe_1_6_push_ready;
	wire fifo_pe_1_7_west_push_ready;
	assign fifo_pe_1_7_west_driver_pe_1_6_push_ready = fifo_pe_1_7_west_push_ready;
	wire [0:0] fifo_pe_1_7_west_push_valid;
	assign fifo_pe_1_7_west_push_valid = fifo_pe_1_7_west_driver_pe_1_6_push_valid;
	wire [7:0] fifo_pe_1_7_west_push_data;
	assign fifo_pe_1_7_west_push_data = {8 {fifo_pe_1_7_west_driver_pe_1_6_push_valid}} & fifo_pe_1_7_west_driver_pe_1_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_7_west_push_valid),
		.push_data(fifo_pe_1_7_west_push_data),
		.push_ready(fifo_pe_1_7_west_push_ready),
		.pop_valid(fifo_pe_1_7_west_pop_valid),
		.pop_data(fifo_pe_1_7_west_pop_data),
		.pop_ready(fifo_pe_1_7_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_7_north_pop_data;
	wire [0:0] fifo_pe_1_7_north_pop_valid;
	wire [0:0] fifo_pe_1_7_north_pop_ready;
	wire [7:0] fifo_pe_1_7_north_driver_col_pusher_7_push_data;
	wire [0:0] fifo_pe_1_7_north_driver_col_pusher_7_push_valid;
	wire [0:0] fifo_pe_1_7_north_driver_col_pusher_7_push_ready;
	wire fifo_pe_1_7_north_push_ready;
	assign fifo_pe_1_7_north_driver_col_pusher_7_push_ready = fifo_pe_1_7_north_push_ready;
	wire [0:0] fifo_pe_1_7_north_push_valid;
	assign fifo_pe_1_7_north_push_valid = fifo_pe_1_7_north_driver_col_pusher_7_push_valid;
	wire [7:0] fifo_pe_1_7_north_push_data;
	assign fifo_pe_1_7_north_push_data = {8 {fifo_pe_1_7_north_driver_col_pusher_7_push_valid}} & fifo_pe_1_7_north_driver_col_pusher_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_7_north_push_valid),
		.push_data(fifo_pe_1_7_north_push_data),
		.push_ready(fifo_pe_1_7_north_push_ready),
		.pop_valid(fifo_pe_1_7_north_pop_valid),
		.pop_data(fifo_pe_1_7_north_pop_data),
		.pop_ready(fifo_pe_1_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_2_north_pop_data;
	wire [0:0] fifo_pe_2_2_north_pop_valid;
	wire [0:0] fifo_pe_2_2_north_pop_ready;
	wire [7:0] fifo_pe_2_2_north_driver_pe_1_2_push_data;
	wire [0:0] fifo_pe_2_2_north_driver_pe_1_2_push_valid;
	wire [0:0] fifo_pe_2_2_north_driver_pe_1_2_push_ready;
	wire fifo_pe_2_2_north_push_ready;
	assign fifo_pe_2_2_north_driver_pe_1_2_push_ready = fifo_pe_2_2_north_push_ready;
	wire [0:0] fifo_pe_2_2_north_push_valid;
	assign fifo_pe_2_2_north_push_valid = fifo_pe_2_2_north_driver_pe_1_2_push_valid;
	wire [7:0] fifo_pe_2_2_north_push_data;
	assign fifo_pe_2_2_north_push_data = {8 {fifo_pe_2_2_north_driver_pe_1_2_push_valid}} & fifo_pe_2_2_north_driver_pe_1_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_2_north_push_valid),
		.push_data(fifo_pe_2_2_north_push_data),
		.push_ready(fifo_pe_2_2_north_push_ready),
		.pop_valid(fifo_pe_2_2_north_pop_valid),
		.pop_data(fifo_pe_2_2_north_pop_data),
		.pop_ready(fifo_pe_2_2_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_2_west_pop_data;
	wire [0:0] fifo_pe_2_2_west_pop_valid;
	wire [0:0] fifo_pe_2_2_west_pop_ready;
	wire [7:0] fifo_pe_2_2_west_driver_pe_2_1_push_data;
	wire [0:0] fifo_pe_2_2_west_driver_pe_2_1_push_valid;
	wire [0:0] fifo_pe_2_2_west_driver_pe_2_1_push_ready;
	wire fifo_pe_2_2_west_push_ready;
	assign fifo_pe_2_2_west_driver_pe_2_1_push_ready = fifo_pe_2_2_west_push_ready;
	wire [0:0] fifo_pe_2_2_west_push_valid;
	assign fifo_pe_2_2_west_push_valid = fifo_pe_2_2_west_driver_pe_2_1_push_valid;
	wire [7:0] fifo_pe_2_2_west_push_data;
	assign fifo_pe_2_2_west_push_data = {8 {fifo_pe_2_2_west_driver_pe_2_1_push_valid}} & fifo_pe_2_2_west_driver_pe_2_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_2_west_push_valid),
		.push_data(fifo_pe_2_2_west_push_data),
		.push_ready(fifo_pe_2_2_west_push_ready),
		.pop_valid(fifo_pe_2_2_west_pop_valid),
		.pop_data(fifo_pe_2_2_west_pop_data),
		.pop_ready(fifo_pe_2_2_west_pop_ready)
	);
	wire [7:0] fifo_pe_5_4_north_pop_data;
	wire [0:0] fifo_pe_5_4_north_pop_valid;
	wire [0:0] fifo_pe_5_4_north_pop_ready;
	wire [7:0] fifo_pe_5_4_north_driver_pe_4_4_push_data;
	wire [0:0] fifo_pe_5_4_north_driver_pe_4_4_push_valid;
	wire [0:0] fifo_pe_5_4_north_driver_pe_4_4_push_ready;
	wire fifo_pe_5_4_north_push_ready;
	assign fifo_pe_5_4_north_driver_pe_4_4_push_ready = fifo_pe_5_4_north_push_ready;
	wire [0:0] fifo_pe_5_4_north_push_valid;
	assign fifo_pe_5_4_north_push_valid = fifo_pe_5_4_north_driver_pe_4_4_push_valid;
	wire [7:0] fifo_pe_5_4_north_push_data;
	assign fifo_pe_5_4_north_push_data = {8 {fifo_pe_5_4_north_driver_pe_4_4_push_valid}} & fifo_pe_5_4_north_driver_pe_4_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_4_north_push_valid),
		.push_data(fifo_pe_5_4_north_push_data),
		.push_ready(fifo_pe_5_4_north_push_ready),
		.pop_valid(fifo_pe_5_4_north_pop_valid),
		.pop_data(fifo_pe_5_4_north_pop_data),
		.pop_ready(fifo_pe_5_4_north_pop_ready)
	);
	wire [7:0] fifo_pe_5_4_west_pop_data;
	wire [0:0] fifo_pe_5_4_west_pop_valid;
	wire [0:0] fifo_pe_5_4_west_pop_ready;
	wire [7:0] fifo_pe_5_4_west_driver_pe_5_3_push_data;
	wire [0:0] fifo_pe_5_4_west_driver_pe_5_3_push_valid;
	wire [0:0] fifo_pe_5_4_west_driver_pe_5_3_push_ready;
	wire fifo_pe_5_4_west_push_ready;
	assign fifo_pe_5_4_west_driver_pe_5_3_push_ready = fifo_pe_5_4_west_push_ready;
	wire [0:0] fifo_pe_5_4_west_push_valid;
	assign fifo_pe_5_4_west_push_valid = fifo_pe_5_4_west_driver_pe_5_3_push_valid;
	wire [7:0] fifo_pe_5_4_west_push_data;
	assign fifo_pe_5_4_west_push_data = {8 {fifo_pe_5_4_west_driver_pe_5_3_push_valid}} & fifo_pe_5_4_west_driver_pe_5_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_4_west_push_valid),
		.push_data(fifo_pe_5_4_west_push_data),
		.push_ready(fifo_pe_5_4_west_push_ready),
		.pop_valid(fifo_pe_5_4_west_pop_valid),
		.pop_data(fifo_pe_5_4_west_pop_data),
		.pop_ready(fifo_pe_5_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_7_north_pop_data;
	wire [0:0] fifo_pe_7_7_north_pop_valid;
	wire [0:0] fifo_pe_7_7_north_pop_ready;
	wire [7:0] fifo_pe_7_7_north_driver_pe_6_7_push_data;
	wire [0:0] fifo_pe_7_7_north_driver_pe_6_7_push_valid;
	wire [0:0] fifo_pe_7_7_north_driver_pe_6_7_push_ready;
	wire fifo_pe_7_7_north_push_ready;
	assign fifo_pe_7_7_north_driver_pe_6_7_push_ready = fifo_pe_7_7_north_push_ready;
	wire [0:0] fifo_pe_7_7_north_push_valid;
	assign fifo_pe_7_7_north_push_valid = fifo_pe_7_7_north_driver_pe_6_7_push_valid;
	wire [7:0] fifo_pe_7_7_north_push_data;
	assign fifo_pe_7_7_north_push_data = {8 {fifo_pe_7_7_north_driver_pe_6_7_push_valid}} & fifo_pe_7_7_north_driver_pe_6_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_7_north_push_valid),
		.push_data(fifo_pe_7_7_north_push_data),
		.push_ready(fifo_pe_7_7_north_push_ready),
		.pop_valid(fifo_pe_7_7_north_pop_valid),
		.pop_data(fifo_pe_7_7_north_pop_data),
		.pop_ready(fifo_pe_7_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_7_7_west_pop_data;
	wire [0:0] fifo_pe_7_7_west_pop_valid;
	wire [0:0] fifo_pe_7_7_west_pop_ready;
	wire [7:0] fifo_pe_7_7_west_driver_pe_7_6_push_data;
	wire [0:0] fifo_pe_7_7_west_driver_pe_7_6_push_valid;
	wire [0:0] fifo_pe_7_7_west_driver_pe_7_6_push_ready;
	wire fifo_pe_7_7_west_push_ready;
	assign fifo_pe_7_7_west_driver_pe_7_6_push_ready = fifo_pe_7_7_west_push_ready;
	wire [0:0] fifo_pe_7_7_west_push_valid;
	assign fifo_pe_7_7_west_push_valid = fifo_pe_7_7_west_driver_pe_7_6_push_valid;
	wire [7:0] fifo_pe_7_7_west_push_data;
	assign fifo_pe_7_7_west_push_data = {8 {fifo_pe_7_7_west_driver_pe_7_6_push_valid}} & fifo_pe_7_7_west_driver_pe_7_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_7_west_push_valid),
		.push_data(fifo_pe_7_7_west_push_data),
		.push_ready(fifo_pe_7_7_west_push_ready),
		.pop_valid(fifo_pe_7_7_west_pop_valid),
		.pop_data(fifo_pe_7_7_west_pop_data),
		.pop_ready(fifo_pe_7_7_west_pop_ready)
	);
	wire [7:0] fifo_sink_68689_north_pop_data;
	wire [0:0] fifo_sink_68689_north_pop_valid;
	wire [0:0] fifo_sink_68689_north_pop_ready;
	wire [7:0] fifo_sink_68689_north_driver_pe_8_3_push_data;
	wire [0:0] fifo_sink_68689_north_driver_pe_8_3_push_valid;
	wire [0:0] fifo_sink_68689_north_driver_pe_8_3_push_ready;
	wire fifo_sink_68689_north_push_ready;
	assign fifo_sink_68689_north_driver_pe_8_3_push_ready = fifo_sink_68689_north_push_ready;
	wire [0:0] fifo_sink_68689_north_push_valid;
	assign fifo_sink_68689_north_push_valid = fifo_sink_68689_north_driver_pe_8_3_push_valid;
	wire [7:0] fifo_sink_68689_north_push_data;
	assign fifo_sink_68689_north_push_data = {8 {fifo_sink_68689_north_driver_pe_8_3_push_valid}} & fifo_sink_68689_north_driver_pe_8_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_68689_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_68689_north_push_valid),
		.push_data(fifo_sink_68689_north_push_data),
		.push_ready(fifo_sink_68689_north_push_ready),
		.pop_valid(fifo_sink_68689_north_pop_valid),
		.pop_data(fifo_sink_68689_north_pop_data),
		.pop_ready(fifo_sink_68689_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_8_north_pop_data;
	wire [0:0] fifo_pe_3_8_north_pop_valid;
	wire [0:0] fifo_pe_3_8_north_pop_ready;
	wire [7:0] fifo_pe_3_8_north_driver_pe_2_8_push_data;
	wire [0:0] fifo_pe_3_8_north_driver_pe_2_8_push_valid;
	wire [0:0] fifo_pe_3_8_north_driver_pe_2_8_push_ready;
	wire fifo_pe_3_8_north_push_ready;
	assign fifo_pe_3_8_north_driver_pe_2_8_push_ready = fifo_pe_3_8_north_push_ready;
	wire [0:0] fifo_pe_3_8_north_push_valid;
	assign fifo_pe_3_8_north_push_valid = fifo_pe_3_8_north_driver_pe_2_8_push_valid;
	wire [7:0] fifo_pe_3_8_north_push_data;
	assign fifo_pe_3_8_north_push_data = {8 {fifo_pe_3_8_north_driver_pe_2_8_push_valid}} & fifo_pe_3_8_north_driver_pe_2_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_8_north_push_valid),
		.push_data(fifo_pe_3_8_north_push_data),
		.push_ready(fifo_pe_3_8_north_push_ready),
		.pop_valid(fifo_pe_3_8_north_pop_valid),
		.pop_data(fifo_pe_3_8_north_pop_data),
		.pop_ready(fifo_pe_3_8_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_8_west_pop_data;
	wire [0:0] fifo_pe_3_8_west_pop_valid;
	wire [0:0] fifo_pe_3_8_west_pop_ready;
	wire [7:0] fifo_pe_3_8_west_driver_pe_3_7_push_data;
	wire [0:0] fifo_pe_3_8_west_driver_pe_3_7_push_valid;
	wire [0:0] fifo_pe_3_8_west_driver_pe_3_7_push_ready;
	wire fifo_pe_3_8_west_push_ready;
	assign fifo_pe_3_8_west_driver_pe_3_7_push_ready = fifo_pe_3_8_west_push_ready;
	wire [0:0] fifo_pe_3_8_west_push_valid;
	assign fifo_pe_3_8_west_push_valid = fifo_pe_3_8_west_driver_pe_3_7_push_valid;
	wire [7:0] fifo_pe_3_8_west_push_data;
	assign fifo_pe_3_8_west_push_data = {8 {fifo_pe_3_8_west_driver_pe_3_7_push_valid}} & fifo_pe_3_8_west_driver_pe_3_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_8_west_push_valid),
		.push_data(fifo_pe_3_8_west_push_data),
		.push_ready(fifo_pe_3_8_west_push_ready),
		.pop_valid(fifo_pe_3_8_west_pop_valid),
		.pop_data(fifo_pe_3_8_west_pop_data),
		.pop_ready(fifo_pe_3_8_west_pop_ready)
	);
	wire [7:0] fifo_pe_2_1_north_pop_data;
	wire [0:0] fifo_pe_2_1_north_pop_valid;
	wire [0:0] fifo_pe_2_1_north_pop_ready;
	wire [7:0] fifo_pe_2_1_north_driver_pe_1_1_push_data;
	wire [0:0] fifo_pe_2_1_north_driver_pe_1_1_push_valid;
	wire [0:0] fifo_pe_2_1_north_driver_pe_1_1_push_ready;
	wire fifo_pe_2_1_north_push_ready;
	assign fifo_pe_2_1_north_driver_pe_1_1_push_ready = fifo_pe_2_1_north_push_ready;
	wire [0:0] fifo_pe_2_1_north_push_valid;
	assign fifo_pe_2_1_north_push_valid = fifo_pe_2_1_north_driver_pe_1_1_push_valid;
	wire [7:0] fifo_pe_2_1_north_push_data;
	assign fifo_pe_2_1_north_push_data = {8 {fifo_pe_2_1_north_driver_pe_1_1_push_valid}} & fifo_pe_2_1_north_driver_pe_1_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_1_north_push_valid),
		.push_data(fifo_pe_2_1_north_push_data),
		.push_ready(fifo_pe_2_1_north_push_ready),
		.pop_valid(fifo_pe_2_1_north_pop_valid),
		.pop_data(fifo_pe_2_1_north_pop_data),
		.pop_ready(fifo_pe_2_1_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_1_west_pop_data;
	wire [0:0] fifo_pe_2_1_west_pop_valid;
	wire [0:0] fifo_pe_2_1_west_pop_ready;
	wire [7:0] fifo_pe_2_1_west_driver_row_pusher_2_push_data;
	wire [0:0] fifo_pe_2_1_west_driver_row_pusher_2_push_valid;
	wire [0:0] fifo_pe_2_1_west_driver_row_pusher_2_push_ready;
	wire fifo_pe_2_1_west_push_ready;
	assign fifo_pe_2_1_west_driver_row_pusher_2_push_ready = fifo_pe_2_1_west_push_ready;
	wire [0:0] fifo_pe_2_1_west_push_valid;
	assign fifo_pe_2_1_west_push_valid = fifo_pe_2_1_west_driver_row_pusher_2_push_valid;
	wire [7:0] fifo_pe_2_1_west_push_data;
	assign fifo_pe_2_1_west_push_data = {8 {fifo_pe_2_1_west_driver_row_pusher_2_push_valid}} & fifo_pe_2_1_west_driver_row_pusher_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_1_west_push_valid),
		.push_data(fifo_pe_2_1_west_push_data),
		.push_ready(fifo_pe_2_1_west_push_ready),
		.pop_valid(fifo_pe_2_1_west_pop_valid),
		.pop_data(fifo_pe_2_1_west_pop_data),
		.pop_ready(fifo_pe_2_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_8_north_pop_data;
	wire [0:0] fifo_pe_7_8_north_pop_valid;
	wire [0:0] fifo_pe_7_8_north_pop_ready;
	wire [7:0] fifo_pe_7_8_north_driver_pe_6_8_push_data;
	wire [0:0] fifo_pe_7_8_north_driver_pe_6_8_push_valid;
	wire [0:0] fifo_pe_7_8_north_driver_pe_6_8_push_ready;
	wire fifo_pe_7_8_north_push_ready;
	assign fifo_pe_7_8_north_driver_pe_6_8_push_ready = fifo_pe_7_8_north_push_ready;
	wire [0:0] fifo_pe_7_8_north_push_valid;
	assign fifo_pe_7_8_north_push_valid = fifo_pe_7_8_north_driver_pe_6_8_push_valid;
	wire [7:0] fifo_pe_7_8_north_push_data;
	assign fifo_pe_7_8_north_push_data = {8 {fifo_pe_7_8_north_driver_pe_6_8_push_valid}} & fifo_pe_7_8_north_driver_pe_6_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_8_north_push_valid),
		.push_data(fifo_pe_7_8_north_push_data),
		.push_ready(fifo_pe_7_8_north_push_ready),
		.pop_valid(fifo_pe_7_8_north_pop_valid),
		.pop_data(fifo_pe_7_8_north_pop_data),
		.pop_ready(fifo_pe_7_8_north_pop_ready)
	);
	wire [7:0] fifo_pe_7_8_west_pop_data;
	wire [0:0] fifo_pe_7_8_west_pop_valid;
	wire [0:0] fifo_pe_7_8_west_pop_ready;
	wire [7:0] fifo_pe_7_8_west_driver_pe_7_7_push_data;
	wire [0:0] fifo_pe_7_8_west_driver_pe_7_7_push_valid;
	wire [0:0] fifo_pe_7_8_west_driver_pe_7_7_push_ready;
	wire fifo_pe_7_8_west_push_ready;
	assign fifo_pe_7_8_west_driver_pe_7_7_push_ready = fifo_pe_7_8_west_push_ready;
	wire [0:0] fifo_pe_7_8_west_push_valid;
	assign fifo_pe_7_8_west_push_valid = fifo_pe_7_8_west_driver_pe_7_7_push_valid;
	wire [7:0] fifo_pe_7_8_west_push_data;
	assign fifo_pe_7_8_west_push_data = {8 {fifo_pe_7_8_west_driver_pe_7_7_push_valid}} & fifo_pe_7_8_west_driver_pe_7_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_8_west_push_valid),
		.push_data(fifo_pe_7_8_west_push_data),
		.push_ready(fifo_pe_7_8_west_push_ready),
		.pop_valid(fifo_pe_7_8_west_pop_valid),
		.pop_data(fifo_pe_7_8_west_pop_data),
		.pop_ready(fifo_pe_7_8_west_pop_ready)
	);
	wire [7:0] fifo_sink_68731_west_pop_data;
	wire [0:0] fifo_sink_68731_west_pop_valid;
	wire [0:0] fifo_sink_68731_west_pop_ready;
	wire [7:0] fifo_sink_68731_west_driver_pe_4_8_push_data;
	wire [0:0] fifo_sink_68731_west_driver_pe_4_8_push_valid;
	wire [0:0] fifo_sink_68731_west_driver_pe_4_8_push_ready;
	wire fifo_sink_68731_west_push_ready;
	assign fifo_sink_68731_west_driver_pe_4_8_push_ready = fifo_sink_68731_west_push_ready;
	wire [0:0] fifo_sink_68731_west_push_valid;
	assign fifo_sink_68731_west_push_valid = fifo_sink_68731_west_driver_pe_4_8_push_valid;
	wire [7:0] fifo_sink_68731_west_push_data;
	assign fifo_sink_68731_west_push_data = {8 {fifo_sink_68731_west_driver_pe_4_8_push_valid}} & fifo_sink_68731_west_driver_pe_4_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_68731_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_68731_west_push_valid),
		.push_data(fifo_sink_68731_west_push_data),
		.push_ready(fifo_sink_68731_west_push_ready),
		.pop_valid(fifo_sink_68731_west_pop_valid),
		.pop_data(fifo_sink_68731_west_pop_data),
		.pop_ready(fifo_sink_68731_west_pop_ready)
	);
	wire [7:0] fifo_col_pusher_7_data_pop_data;
	wire [0:0] fifo_col_pusher_7_data_pop_valid;
	wire [0:0] fifo_col_pusher_7_data_pop_ready;
	wire [7:0] fifo_col_pusher_7_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_7_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_7_data_driver_testbench_push_ready;
	wire fifo_col_pusher_7_data_push_ready;
	assign fifo_col_pusher_7_data_driver_testbench_push_ready = fifo_col_pusher_7_data_push_ready;
	wire [0:0] fifo_col_pusher_7_data_push_valid;
	assign fifo_col_pusher_7_data_push_valid = fifo_col_pusher_7_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_7_data_push_data;
	assign fifo_col_pusher_7_data_push_data = {8 {fifo_col_pusher_7_data_driver_testbench_push_valid}} & fifo_col_pusher_7_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_7_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_7_data_push_valid),
		.push_data(fifo_col_pusher_7_data_push_data),
		.push_ready(fifo_col_pusher_7_data_push_ready),
		.pop_valid(fifo_col_pusher_7_data_pop_valid),
		.pop_data(fifo_col_pusher_7_data_pop_data),
		.pop_ready(fifo_col_pusher_7_data_pop_ready)
	);
	wire [7:0] fifo_pe_5_8_west_pop_data;
	wire [0:0] fifo_pe_5_8_west_pop_valid;
	wire [0:0] fifo_pe_5_8_west_pop_ready;
	wire [7:0] fifo_pe_5_8_west_driver_pe_5_7_push_data;
	wire [0:0] fifo_pe_5_8_west_driver_pe_5_7_push_valid;
	wire [0:0] fifo_pe_5_8_west_driver_pe_5_7_push_ready;
	wire fifo_pe_5_8_west_push_ready;
	assign fifo_pe_5_8_west_driver_pe_5_7_push_ready = fifo_pe_5_8_west_push_ready;
	wire [0:0] fifo_pe_5_8_west_push_valid;
	assign fifo_pe_5_8_west_push_valid = fifo_pe_5_8_west_driver_pe_5_7_push_valid;
	wire [7:0] fifo_pe_5_8_west_push_data;
	assign fifo_pe_5_8_west_push_data = {8 {fifo_pe_5_8_west_driver_pe_5_7_push_valid}} & fifo_pe_5_8_west_driver_pe_5_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_8_west_push_valid),
		.push_data(fifo_pe_5_8_west_push_data),
		.push_ready(fifo_pe_5_8_west_push_ready),
		.pop_valid(fifo_pe_5_8_west_pop_valid),
		.pop_data(fifo_pe_5_8_west_pop_data),
		.pop_ready(fifo_pe_5_8_west_pop_ready)
	);
	wire [7:0] fifo_pe_5_8_north_pop_data;
	wire [0:0] fifo_pe_5_8_north_pop_valid;
	wire [0:0] fifo_pe_5_8_north_pop_ready;
	wire [7:0] fifo_pe_5_8_north_driver_pe_4_8_push_data;
	wire [0:0] fifo_pe_5_8_north_driver_pe_4_8_push_valid;
	wire [0:0] fifo_pe_5_8_north_driver_pe_4_8_push_ready;
	wire fifo_pe_5_8_north_push_ready;
	assign fifo_pe_5_8_north_driver_pe_4_8_push_ready = fifo_pe_5_8_north_push_ready;
	wire [0:0] fifo_pe_5_8_north_push_valid;
	assign fifo_pe_5_8_north_push_valid = fifo_pe_5_8_north_driver_pe_4_8_push_valid;
	wire [7:0] fifo_pe_5_8_north_push_data;
	assign fifo_pe_5_8_north_push_data = {8 {fifo_pe_5_8_north_driver_pe_4_8_push_valid}} & fifo_pe_5_8_north_driver_pe_4_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_8_north_push_valid),
		.push_data(fifo_pe_5_8_north_push_data),
		.push_ready(fifo_pe_5_8_north_push_ready),
		.pop_valid(fifo_pe_5_8_north_pop_valid),
		.pop_data(fifo_pe_5_8_north_pop_data),
		.pop_ready(fifo_pe_5_8_north_pop_ready)
	);
	wire [7:0] fifo_col_pusher_8_data_pop_data;
	wire [0:0] fifo_col_pusher_8_data_pop_valid;
	wire [0:0] fifo_col_pusher_8_data_pop_ready;
	wire [7:0] fifo_col_pusher_8_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_8_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_8_data_driver_testbench_push_ready;
	wire fifo_col_pusher_8_data_push_ready;
	assign fifo_col_pusher_8_data_driver_testbench_push_ready = fifo_col_pusher_8_data_push_ready;
	wire [0:0] fifo_col_pusher_8_data_push_valid;
	assign fifo_col_pusher_8_data_push_valid = fifo_col_pusher_8_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_8_data_push_data;
	assign fifo_col_pusher_8_data_push_data = {8 {fifo_col_pusher_8_data_driver_testbench_push_valid}} & fifo_col_pusher_8_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_8_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_8_data_push_valid),
		.push_data(fifo_col_pusher_8_data_push_data),
		.push_ready(fifo_col_pusher_8_data_push_ready),
		.pop_valid(fifo_col_pusher_8_data_pop_valid),
		.pop_data(fifo_col_pusher_8_data_pop_data),
		.pop_ready(fifo_col_pusher_8_data_pop_ready)
	);
	wire [7:0] fifo_sink_685a1_north_pop_data;
	wire [0:0] fifo_sink_685a1_north_pop_valid;
	wire [0:0] fifo_sink_685a1_north_pop_ready;
	wire [7:0] fifo_sink_685a1_north_driver_pe_8_2_push_data;
	wire [0:0] fifo_sink_685a1_north_driver_pe_8_2_push_valid;
	wire [0:0] fifo_sink_685a1_north_driver_pe_8_2_push_ready;
	wire fifo_sink_685a1_north_push_ready;
	assign fifo_sink_685a1_north_driver_pe_8_2_push_ready = fifo_sink_685a1_north_push_ready;
	wire [0:0] fifo_sink_685a1_north_push_valid;
	assign fifo_sink_685a1_north_push_valid = fifo_sink_685a1_north_driver_pe_8_2_push_valid;
	wire [7:0] fifo_sink_685a1_north_push_data;
	assign fifo_sink_685a1_north_push_data = {8 {fifo_sink_685a1_north_driver_pe_8_2_push_valid}} & fifo_sink_685a1_north_driver_pe_8_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_685a1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_685a1_north_push_valid),
		.push_data(fifo_sink_685a1_north_push_data),
		.push_ready(fifo_sink_685a1_north_push_ready),
		.pop_valid(fifo_sink_685a1_north_pop_valid),
		.pop_data(fifo_sink_685a1_north_pop_data),
		.pop_ready(fifo_sink_685a1_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_1_west_pop_data;
	wire [0:0] fifo_pe_8_1_west_pop_valid;
	wire [0:0] fifo_pe_8_1_west_pop_ready;
	wire [7:0] fifo_pe_8_1_west_driver_row_pusher_8_push_data;
	wire [0:0] fifo_pe_8_1_west_driver_row_pusher_8_push_valid;
	wire [0:0] fifo_pe_8_1_west_driver_row_pusher_8_push_ready;
	wire fifo_pe_8_1_west_push_ready;
	assign fifo_pe_8_1_west_driver_row_pusher_8_push_ready = fifo_pe_8_1_west_push_ready;
	wire [0:0] fifo_pe_8_1_west_push_valid;
	assign fifo_pe_8_1_west_push_valid = fifo_pe_8_1_west_driver_row_pusher_8_push_valid;
	wire [7:0] fifo_pe_8_1_west_push_data;
	assign fifo_pe_8_1_west_push_data = {8 {fifo_pe_8_1_west_driver_row_pusher_8_push_valid}} & fifo_pe_8_1_west_driver_row_pusher_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_1_west_push_valid),
		.push_data(fifo_pe_8_1_west_push_data),
		.push_ready(fifo_pe_8_1_west_push_ready),
		.pop_valid(fifo_pe_8_1_west_pop_valid),
		.pop_data(fifo_pe_8_1_west_pop_data),
		.pop_ready(fifo_pe_8_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_8_1_north_pop_data;
	wire [0:0] fifo_pe_8_1_north_pop_valid;
	wire [0:0] fifo_pe_8_1_north_pop_ready;
	wire [7:0] fifo_pe_8_1_north_driver_pe_7_1_push_data;
	wire [0:0] fifo_pe_8_1_north_driver_pe_7_1_push_valid;
	wire [0:0] fifo_pe_8_1_north_driver_pe_7_1_push_ready;
	wire fifo_pe_8_1_north_push_ready;
	assign fifo_pe_8_1_north_driver_pe_7_1_push_ready = fifo_pe_8_1_north_push_ready;
	wire [0:0] fifo_pe_8_1_north_push_valid;
	assign fifo_pe_8_1_north_push_valid = fifo_pe_8_1_north_driver_pe_7_1_push_valid;
	wire [7:0] fifo_pe_8_1_north_push_data;
	assign fifo_pe_8_1_north_push_data = {8 {fifo_pe_8_1_north_driver_pe_7_1_push_valid}} & fifo_pe_8_1_north_driver_pe_7_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_1_north_push_valid),
		.push_data(fifo_pe_8_1_north_push_data),
		.push_ready(fifo_pe_8_1_north_push_ready),
		.pop_valid(fifo_pe_8_1_north_pop_valid),
		.pop_data(fifo_pe_8_1_north_pop_data),
		.pop_ready(fifo_pe_8_1_north_pop_ready)
	);
	wire [7:0] fifo_row_pusher_8_data_pop_data;
	wire [0:0] fifo_row_pusher_8_data_pop_valid;
	wire [0:0] fifo_row_pusher_8_data_pop_ready;
	wire [7:0] fifo_row_pusher_8_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_8_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_8_data_driver_testbench_push_ready;
	wire fifo_row_pusher_8_data_push_ready;
	assign fifo_row_pusher_8_data_driver_testbench_push_ready = fifo_row_pusher_8_data_push_ready;
	wire [0:0] fifo_row_pusher_8_data_push_valid;
	assign fifo_row_pusher_8_data_push_valid = fifo_row_pusher_8_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_8_data_push_data;
	assign fifo_row_pusher_8_data_push_data = {8 {fifo_row_pusher_8_data_driver_testbench_push_valid}} & fifo_row_pusher_8_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_8_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_8_data_push_valid),
		.push_data(fifo_row_pusher_8_data_push_data),
		.push_ready(fifo_row_pusher_8_data_push_ready),
		.pop_valid(fifo_row_pusher_8_data_pop_valid),
		.pop_data(fifo_row_pusher_8_data_pop_data),
		.pop_ready(fifo_row_pusher_8_data_pop_ready)
	);
	wire [7:0] fifo_sink_68561_west_pop_data;
	wire [0:0] fifo_sink_68561_west_pop_valid;
	wire [0:0] fifo_sink_68561_west_pop_ready;
	wire [7:0] fifo_sink_68561_west_driver_pe_2_8_push_data;
	wire [0:0] fifo_sink_68561_west_driver_pe_2_8_push_valid;
	wire [0:0] fifo_sink_68561_west_driver_pe_2_8_push_ready;
	wire fifo_sink_68561_west_push_ready;
	assign fifo_sink_68561_west_driver_pe_2_8_push_ready = fifo_sink_68561_west_push_ready;
	wire [0:0] fifo_sink_68561_west_push_valid;
	assign fifo_sink_68561_west_push_valid = fifo_sink_68561_west_driver_pe_2_8_push_valid;
	wire [7:0] fifo_sink_68561_west_push_data;
	assign fifo_sink_68561_west_push_data = {8 {fifo_sink_68561_west_driver_pe_2_8_push_valid}} & fifo_sink_68561_west_driver_pe_2_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_68561_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_68561_west_push_valid),
		.push_data(fifo_sink_68561_west_push_data),
		.push_ready(fifo_sink_68561_west_push_ready),
		.pop_valid(fifo_sink_68561_west_pop_valid),
		.pop_data(fifo_sink_68561_west_pop_data),
		.pop_ready(fifo_sink_68561_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_3_west_pop_data;
	wire [0:0] fifo_pe_7_3_west_pop_valid;
	wire [0:0] fifo_pe_7_3_west_pop_ready;
	wire [7:0] fifo_pe_7_3_west_driver_pe_7_2_push_data;
	wire [0:0] fifo_pe_7_3_west_driver_pe_7_2_push_valid;
	wire [0:0] fifo_pe_7_3_west_driver_pe_7_2_push_ready;
	wire fifo_pe_7_3_west_push_ready;
	assign fifo_pe_7_3_west_driver_pe_7_2_push_ready = fifo_pe_7_3_west_push_ready;
	wire [0:0] fifo_pe_7_3_west_push_valid;
	assign fifo_pe_7_3_west_push_valid = fifo_pe_7_3_west_driver_pe_7_2_push_valid;
	wire [7:0] fifo_pe_7_3_west_push_data;
	assign fifo_pe_7_3_west_push_data = {8 {fifo_pe_7_3_west_driver_pe_7_2_push_valid}} & fifo_pe_7_3_west_driver_pe_7_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_3_west_push_valid),
		.push_data(fifo_pe_7_3_west_push_data),
		.push_ready(fifo_pe_7_3_west_push_ready),
		.pop_valid(fifo_pe_7_3_west_pop_valid),
		.pop_data(fifo_pe_7_3_west_pop_data),
		.pop_ready(fifo_pe_7_3_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_3_north_pop_data;
	wire [0:0] fifo_pe_7_3_north_pop_valid;
	wire [0:0] fifo_pe_7_3_north_pop_ready;
	wire [7:0] fifo_pe_7_3_north_driver_pe_6_3_push_data;
	wire [0:0] fifo_pe_7_3_north_driver_pe_6_3_push_valid;
	wire [0:0] fifo_pe_7_3_north_driver_pe_6_3_push_ready;
	wire fifo_pe_7_3_north_push_ready;
	assign fifo_pe_7_3_north_driver_pe_6_3_push_ready = fifo_pe_7_3_north_push_ready;
	wire [0:0] fifo_pe_7_3_north_push_valid;
	assign fifo_pe_7_3_north_push_valid = fifo_pe_7_3_north_driver_pe_6_3_push_valid;
	wire [7:0] fifo_pe_7_3_north_push_data;
	assign fifo_pe_7_3_north_push_data = {8 {fifo_pe_7_3_north_driver_pe_6_3_push_valid}} & fifo_pe_7_3_north_driver_pe_6_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_3_north_push_valid),
		.push_data(fifo_pe_7_3_north_push_data),
		.push_ready(fifo_pe_7_3_north_push_ready),
		.pop_valid(fifo_pe_7_3_north_pop_valid),
		.pop_data(fifo_pe_7_3_north_pop_data),
		.pop_ready(fifo_pe_7_3_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_6_north_pop_data;
	wire [0:0] fifo_pe_3_6_north_pop_valid;
	wire [0:0] fifo_pe_3_6_north_pop_ready;
	wire [7:0] fifo_pe_3_6_north_driver_pe_2_6_push_data;
	wire [0:0] fifo_pe_3_6_north_driver_pe_2_6_push_valid;
	wire [0:0] fifo_pe_3_6_north_driver_pe_2_6_push_ready;
	wire fifo_pe_3_6_north_push_ready;
	assign fifo_pe_3_6_north_driver_pe_2_6_push_ready = fifo_pe_3_6_north_push_ready;
	wire [0:0] fifo_pe_3_6_north_push_valid;
	assign fifo_pe_3_6_north_push_valid = fifo_pe_3_6_north_driver_pe_2_6_push_valid;
	wire [7:0] fifo_pe_3_6_north_push_data;
	assign fifo_pe_3_6_north_push_data = {8 {fifo_pe_3_6_north_driver_pe_2_6_push_valid}} & fifo_pe_3_6_north_driver_pe_2_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_6_north_push_valid),
		.push_data(fifo_pe_3_6_north_push_data),
		.push_ready(fifo_pe_3_6_north_push_ready),
		.pop_valid(fifo_pe_3_6_north_pop_valid),
		.pop_data(fifo_pe_3_6_north_pop_data),
		.pop_ready(fifo_pe_3_6_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_6_west_pop_data;
	wire [0:0] fifo_pe_3_6_west_pop_valid;
	wire [0:0] fifo_pe_3_6_west_pop_ready;
	wire [7:0] fifo_pe_3_6_west_driver_pe_3_5_push_data;
	wire [0:0] fifo_pe_3_6_west_driver_pe_3_5_push_valid;
	wire [0:0] fifo_pe_3_6_west_driver_pe_3_5_push_ready;
	wire fifo_pe_3_6_west_push_ready;
	assign fifo_pe_3_6_west_driver_pe_3_5_push_ready = fifo_pe_3_6_west_push_ready;
	wire [0:0] fifo_pe_3_6_west_push_valid;
	assign fifo_pe_3_6_west_push_valid = fifo_pe_3_6_west_driver_pe_3_5_push_valid;
	wire [7:0] fifo_pe_3_6_west_push_data;
	assign fifo_pe_3_6_west_push_data = {8 {fifo_pe_3_6_west_driver_pe_3_5_push_valid}} & fifo_pe_3_6_west_driver_pe_3_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_6_west_push_valid),
		.push_data(fifo_pe_3_6_west_push_data),
		.push_ready(fifo_pe_3_6_west_push_ready),
		.pop_valid(fifo_pe_3_6_west_pop_valid),
		.pop_data(fifo_pe_3_6_west_pop_data),
		.pop_ready(fifo_pe_3_6_west_pop_ready)
	);
	wire [7:0] fifo_col_pusher_3_data_pop_data;
	wire [0:0] fifo_col_pusher_3_data_pop_valid;
	wire [0:0] fifo_col_pusher_3_data_pop_ready;
	wire [7:0] fifo_col_pusher_3_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_3_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_3_data_driver_testbench_push_ready;
	wire fifo_col_pusher_3_data_push_ready;
	assign fifo_col_pusher_3_data_driver_testbench_push_ready = fifo_col_pusher_3_data_push_ready;
	wire [0:0] fifo_col_pusher_3_data_push_valid;
	assign fifo_col_pusher_3_data_push_valid = fifo_col_pusher_3_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_3_data_push_data;
	assign fifo_col_pusher_3_data_push_data = {8 {fifo_col_pusher_3_data_driver_testbench_push_valid}} & fifo_col_pusher_3_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_3_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_3_data_push_valid),
		.push_data(fifo_col_pusher_3_data_push_data),
		.push_ready(fifo_col_pusher_3_data_push_ready),
		.pop_valid(fifo_col_pusher_3_data_pop_valid),
		.pop_data(fifo_col_pusher_3_data_pop_data),
		.pop_ready(fifo_col_pusher_3_data_pop_ready)
	);
	wire [7:0] fifo_col_pusher_5_data_pop_data;
	wire [0:0] fifo_col_pusher_5_data_pop_valid;
	wire [0:0] fifo_col_pusher_5_data_pop_ready;
	wire [7:0] fifo_col_pusher_5_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_5_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_5_data_driver_testbench_push_ready;
	wire fifo_col_pusher_5_data_push_ready;
	assign fifo_col_pusher_5_data_driver_testbench_push_ready = fifo_col_pusher_5_data_push_ready;
	wire [0:0] fifo_col_pusher_5_data_push_valid;
	assign fifo_col_pusher_5_data_push_valid = fifo_col_pusher_5_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_5_data_push_data;
	assign fifo_col_pusher_5_data_push_data = {8 {fifo_col_pusher_5_data_driver_testbench_push_valid}} & fifo_col_pusher_5_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_5_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_5_data_push_valid),
		.push_data(fifo_col_pusher_5_data_push_data),
		.push_ready(fifo_col_pusher_5_data_push_ready),
		.pop_valid(fifo_col_pusher_5_data_pop_valid),
		.pop_data(fifo_col_pusher_5_data_pop_data),
		.pop_ready(fifo_col_pusher_5_data_pop_ready)
	);
	wire [7:0] fifo_sink_68445_west_pop_data;
	wire [0:0] fifo_sink_68445_west_pop_valid;
	wire [0:0] fifo_sink_68445_west_pop_ready;
	wire [7:0] fifo_sink_68445_west_driver_pe_1_8_push_data;
	wire [0:0] fifo_sink_68445_west_driver_pe_1_8_push_valid;
	wire [0:0] fifo_sink_68445_west_driver_pe_1_8_push_ready;
	wire fifo_sink_68445_west_push_ready;
	assign fifo_sink_68445_west_driver_pe_1_8_push_ready = fifo_sink_68445_west_push_ready;
	wire [0:0] fifo_sink_68445_west_push_valid;
	assign fifo_sink_68445_west_push_valid = fifo_sink_68445_west_driver_pe_1_8_push_valid;
	wire [7:0] fifo_sink_68445_west_push_data;
	assign fifo_sink_68445_west_push_data = {8 {fifo_sink_68445_west_driver_pe_1_8_push_valid}} & fifo_sink_68445_west_driver_pe_1_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_68445_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_68445_west_push_valid),
		.push_data(fifo_sink_68445_west_push_data),
		.push_ready(fifo_sink_68445_west_push_ready),
		.pop_valid(fifo_sink_68445_west_pop_valid),
		.pop_data(fifo_sink_68445_west_pop_data),
		.pop_ready(fifo_sink_68445_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_4_west_pop_data;
	wire [0:0] fifo_pe_1_4_west_pop_valid;
	wire [0:0] fifo_pe_1_4_west_pop_ready;
	wire [7:0] fifo_pe_1_4_west_driver_pe_1_3_push_data;
	wire [0:0] fifo_pe_1_4_west_driver_pe_1_3_push_valid;
	wire [0:0] fifo_pe_1_4_west_driver_pe_1_3_push_ready;
	wire fifo_pe_1_4_west_push_ready;
	assign fifo_pe_1_4_west_driver_pe_1_3_push_ready = fifo_pe_1_4_west_push_ready;
	wire [0:0] fifo_pe_1_4_west_push_valid;
	assign fifo_pe_1_4_west_push_valid = fifo_pe_1_4_west_driver_pe_1_3_push_valid;
	wire [7:0] fifo_pe_1_4_west_push_data;
	assign fifo_pe_1_4_west_push_data = {8 {fifo_pe_1_4_west_driver_pe_1_3_push_valid}} & fifo_pe_1_4_west_driver_pe_1_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_4_west_push_valid),
		.push_data(fifo_pe_1_4_west_push_data),
		.push_ready(fifo_pe_1_4_west_push_ready),
		.pop_valid(fifo_pe_1_4_west_pop_valid),
		.pop_data(fifo_pe_1_4_west_pop_data),
		.pop_ready(fifo_pe_1_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_4_north_pop_data;
	wire [0:0] fifo_pe_1_4_north_pop_valid;
	wire [0:0] fifo_pe_1_4_north_pop_ready;
	wire [7:0] fifo_pe_1_4_north_driver_col_pusher_4_push_data;
	wire [0:0] fifo_pe_1_4_north_driver_col_pusher_4_push_valid;
	wire [0:0] fifo_pe_1_4_north_driver_col_pusher_4_push_ready;
	wire fifo_pe_1_4_north_push_ready;
	assign fifo_pe_1_4_north_driver_col_pusher_4_push_ready = fifo_pe_1_4_north_push_ready;
	wire [0:0] fifo_pe_1_4_north_push_valid;
	assign fifo_pe_1_4_north_push_valid = fifo_pe_1_4_north_driver_col_pusher_4_push_valid;
	wire [7:0] fifo_pe_1_4_north_push_data;
	assign fifo_pe_1_4_north_push_data = {8 {fifo_pe_1_4_north_driver_col_pusher_4_push_valid}} & fifo_pe_1_4_north_driver_col_pusher_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_4_north_push_valid),
		.push_data(fifo_pe_1_4_north_push_data),
		.push_ready(fifo_pe_1_4_north_push_ready),
		.pop_valid(fifo_pe_1_4_north_pop_valid),
		.pop_data(fifo_pe_1_4_north_pop_data),
		.pop_ready(fifo_pe_1_4_north_pop_ready)
	);
	wire [7:0] fifo_sink_69e91_north_pop_data;
	wire [0:0] fifo_sink_69e91_north_pop_valid;
	wire [0:0] fifo_sink_69e91_north_pop_ready;
	wire [7:0] fifo_sink_69e91_north_driver_pe_8_8_push_data;
	wire [0:0] fifo_sink_69e91_north_driver_pe_8_8_push_valid;
	wire [0:0] fifo_sink_69e91_north_driver_pe_8_8_push_ready;
	wire fifo_sink_69e91_north_push_ready;
	assign fifo_sink_69e91_north_driver_pe_8_8_push_ready = fifo_sink_69e91_north_push_ready;
	wire [0:0] fifo_sink_69e91_north_push_valid;
	assign fifo_sink_69e91_north_push_valid = fifo_sink_69e91_north_driver_pe_8_8_push_valid;
	wire [7:0] fifo_sink_69e91_north_push_data;
	assign fifo_sink_69e91_north_push_data = {8 {fifo_sink_69e91_north_driver_pe_8_8_push_valid}} & fifo_sink_69e91_north_driver_pe_8_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_69e91_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_69e91_north_push_valid),
		.push_data(fifo_sink_69e91_north_push_data),
		.push_ready(fifo_sink_69e91_north_push_ready),
		.pop_valid(fifo_sink_69e91_north_pop_valid),
		.pop_data(fifo_sink_69e91_north_pop_data),
		.pop_ready(fifo_sink_69e91_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_6_west_pop_data;
	wire [0:0] fifo_pe_2_6_west_pop_valid;
	wire [0:0] fifo_pe_2_6_west_pop_ready;
	wire [7:0] fifo_pe_2_6_west_driver_pe_2_5_push_data;
	wire [0:0] fifo_pe_2_6_west_driver_pe_2_5_push_valid;
	wire [0:0] fifo_pe_2_6_west_driver_pe_2_5_push_ready;
	wire fifo_pe_2_6_west_push_ready;
	assign fifo_pe_2_6_west_driver_pe_2_5_push_ready = fifo_pe_2_6_west_push_ready;
	wire [0:0] fifo_pe_2_6_west_push_valid;
	assign fifo_pe_2_6_west_push_valid = fifo_pe_2_6_west_driver_pe_2_5_push_valid;
	wire [7:0] fifo_pe_2_6_west_push_data;
	assign fifo_pe_2_6_west_push_data = {8 {fifo_pe_2_6_west_driver_pe_2_5_push_valid}} & fifo_pe_2_6_west_driver_pe_2_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_6_west_push_valid),
		.push_data(fifo_pe_2_6_west_push_data),
		.push_ready(fifo_pe_2_6_west_push_ready),
		.pop_valid(fifo_pe_2_6_west_pop_valid),
		.pop_data(fifo_pe_2_6_west_pop_data),
		.pop_ready(fifo_pe_2_6_west_pop_ready)
	);
	wire [7:0] fifo_pe_2_6_north_pop_data;
	wire [0:0] fifo_pe_2_6_north_pop_valid;
	wire [0:0] fifo_pe_2_6_north_pop_ready;
	wire [7:0] fifo_pe_2_6_north_driver_pe_1_6_push_data;
	wire [0:0] fifo_pe_2_6_north_driver_pe_1_6_push_valid;
	wire [0:0] fifo_pe_2_6_north_driver_pe_1_6_push_ready;
	wire fifo_pe_2_6_north_push_ready;
	assign fifo_pe_2_6_north_driver_pe_1_6_push_ready = fifo_pe_2_6_north_push_ready;
	wire [0:0] fifo_pe_2_6_north_push_valid;
	assign fifo_pe_2_6_north_push_valid = fifo_pe_2_6_north_driver_pe_1_6_push_valid;
	wire [7:0] fifo_pe_2_6_north_push_data;
	assign fifo_pe_2_6_north_push_data = {8 {fifo_pe_2_6_north_driver_pe_1_6_push_valid}} & fifo_pe_2_6_north_driver_pe_1_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_6_north_push_valid),
		.push_data(fifo_pe_2_6_north_push_data),
		.push_ready(fifo_pe_2_6_north_push_ready),
		.pop_valid(fifo_pe_2_6_north_pop_valid),
		.pop_data(fifo_pe_2_6_north_pop_data),
		.pop_ready(fifo_pe_2_6_north_pop_ready)
	);
	wire [7:0] fifo_pe_1_2_north_pop_data;
	wire [0:0] fifo_pe_1_2_north_pop_valid;
	wire [0:0] fifo_pe_1_2_north_pop_ready;
	wire [7:0] fifo_pe_1_2_north_driver_col_pusher_2_push_data;
	wire [0:0] fifo_pe_1_2_north_driver_col_pusher_2_push_valid;
	wire [0:0] fifo_pe_1_2_north_driver_col_pusher_2_push_ready;
	wire fifo_pe_1_2_north_push_ready;
	assign fifo_pe_1_2_north_driver_col_pusher_2_push_ready = fifo_pe_1_2_north_push_ready;
	wire [0:0] fifo_pe_1_2_north_push_valid;
	assign fifo_pe_1_2_north_push_valid = fifo_pe_1_2_north_driver_col_pusher_2_push_valid;
	wire [7:0] fifo_pe_1_2_north_push_data;
	assign fifo_pe_1_2_north_push_data = {8 {fifo_pe_1_2_north_driver_col_pusher_2_push_valid}} & fifo_pe_1_2_north_driver_col_pusher_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_2_north_push_valid),
		.push_data(fifo_pe_1_2_north_push_data),
		.push_ready(fifo_pe_1_2_north_push_ready),
		.pop_valid(fifo_pe_1_2_north_pop_valid),
		.pop_data(fifo_pe_1_2_north_pop_data),
		.pop_ready(fifo_pe_1_2_north_pop_ready)
	);
	wire [7:0] fifo_pe_1_2_west_pop_data;
	wire [0:0] fifo_pe_1_2_west_pop_valid;
	wire [0:0] fifo_pe_1_2_west_pop_ready;
	wire [7:0] fifo_pe_1_2_west_driver_pe_1_1_push_data;
	wire [0:0] fifo_pe_1_2_west_driver_pe_1_1_push_valid;
	wire [0:0] fifo_pe_1_2_west_driver_pe_1_1_push_ready;
	wire fifo_pe_1_2_west_push_ready;
	assign fifo_pe_1_2_west_driver_pe_1_1_push_ready = fifo_pe_1_2_west_push_ready;
	wire [0:0] fifo_pe_1_2_west_push_valid;
	assign fifo_pe_1_2_west_push_valid = fifo_pe_1_2_west_driver_pe_1_1_push_valid;
	wire [7:0] fifo_pe_1_2_west_push_data;
	assign fifo_pe_1_2_west_push_data = {8 {fifo_pe_1_2_west_driver_pe_1_1_push_valid}} & fifo_pe_1_2_west_driver_pe_1_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_2_west_push_valid),
		.push_data(fifo_pe_1_2_west_push_data),
		.push_ready(fifo_pe_1_2_west_push_ready),
		.pop_valid(fifo_pe_1_2_west_pop_valid),
		.pop_data(fifo_pe_1_2_west_pop_data),
		.pop_ready(fifo_pe_1_2_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_6_north_pop_data;
	wire [0:0] fifo_pe_4_6_north_pop_valid;
	wire [0:0] fifo_pe_4_6_north_pop_ready;
	wire [7:0] fifo_pe_4_6_north_driver_pe_3_6_push_data;
	wire [0:0] fifo_pe_4_6_north_driver_pe_3_6_push_valid;
	wire [0:0] fifo_pe_4_6_north_driver_pe_3_6_push_ready;
	wire fifo_pe_4_6_north_push_ready;
	assign fifo_pe_4_6_north_driver_pe_3_6_push_ready = fifo_pe_4_6_north_push_ready;
	wire [0:0] fifo_pe_4_6_north_push_valid;
	assign fifo_pe_4_6_north_push_valid = fifo_pe_4_6_north_driver_pe_3_6_push_valid;
	wire [7:0] fifo_pe_4_6_north_push_data;
	assign fifo_pe_4_6_north_push_data = {8 {fifo_pe_4_6_north_driver_pe_3_6_push_valid}} & fifo_pe_4_6_north_driver_pe_3_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_6_north_push_valid),
		.push_data(fifo_pe_4_6_north_push_data),
		.push_ready(fifo_pe_4_6_north_push_ready),
		.pop_valid(fifo_pe_4_6_north_pop_valid),
		.pop_data(fifo_pe_4_6_north_pop_data),
		.pop_ready(fifo_pe_4_6_north_pop_ready)
	);
	wire [7:0] fifo_pe_4_6_west_pop_data;
	wire [0:0] fifo_pe_4_6_west_pop_valid;
	wire [0:0] fifo_pe_4_6_west_pop_ready;
	wire [7:0] fifo_pe_4_6_west_driver_pe_4_5_push_data;
	wire [0:0] fifo_pe_4_6_west_driver_pe_4_5_push_valid;
	wire [0:0] fifo_pe_4_6_west_driver_pe_4_5_push_ready;
	wire fifo_pe_4_6_west_push_ready;
	assign fifo_pe_4_6_west_driver_pe_4_5_push_ready = fifo_pe_4_6_west_push_ready;
	wire [0:0] fifo_pe_4_6_west_push_valid;
	assign fifo_pe_4_6_west_push_valid = fifo_pe_4_6_west_driver_pe_4_5_push_valid;
	wire [7:0] fifo_pe_4_6_west_push_data;
	assign fifo_pe_4_6_west_push_data = {8 {fifo_pe_4_6_west_driver_pe_4_5_push_valid}} & fifo_pe_4_6_west_driver_pe_4_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_6_west_push_valid),
		.push_data(fifo_pe_4_6_west_push_data),
		.push_ready(fifo_pe_4_6_west_push_ready),
		.pop_valid(fifo_pe_4_6_west_pop_valid),
		.pop_data(fifo_pe_4_6_west_pop_data),
		.pop_ready(fifo_pe_4_6_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_4_west_pop_data;
	wire [0:0] fifo_pe_7_4_west_pop_valid;
	wire [0:0] fifo_pe_7_4_west_pop_ready;
	wire [7:0] fifo_pe_7_4_west_driver_pe_7_3_push_data;
	wire [0:0] fifo_pe_7_4_west_driver_pe_7_3_push_valid;
	wire [0:0] fifo_pe_7_4_west_driver_pe_7_3_push_ready;
	wire fifo_pe_7_4_west_push_ready;
	assign fifo_pe_7_4_west_driver_pe_7_3_push_ready = fifo_pe_7_4_west_push_ready;
	wire [0:0] fifo_pe_7_4_west_push_valid;
	assign fifo_pe_7_4_west_push_valid = fifo_pe_7_4_west_driver_pe_7_3_push_valid;
	wire [7:0] fifo_pe_7_4_west_push_data;
	assign fifo_pe_7_4_west_push_data = {8 {fifo_pe_7_4_west_driver_pe_7_3_push_valid}} & fifo_pe_7_4_west_driver_pe_7_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_4_west_push_valid),
		.push_data(fifo_pe_7_4_west_push_data),
		.push_ready(fifo_pe_7_4_west_push_ready),
		.pop_valid(fifo_pe_7_4_west_pop_valid),
		.pop_data(fifo_pe_7_4_west_pop_data),
		.pop_ready(fifo_pe_7_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_4_north_pop_data;
	wire [0:0] fifo_pe_7_4_north_pop_valid;
	wire [0:0] fifo_pe_7_4_north_pop_ready;
	wire [7:0] fifo_pe_7_4_north_driver_pe_6_4_push_data;
	wire [0:0] fifo_pe_7_4_north_driver_pe_6_4_push_valid;
	wire [0:0] fifo_pe_7_4_north_driver_pe_6_4_push_ready;
	wire fifo_pe_7_4_north_push_ready;
	assign fifo_pe_7_4_north_driver_pe_6_4_push_ready = fifo_pe_7_4_north_push_ready;
	wire [0:0] fifo_pe_7_4_north_push_valid;
	assign fifo_pe_7_4_north_push_valid = fifo_pe_7_4_north_driver_pe_6_4_push_valid;
	wire [7:0] fifo_pe_7_4_north_push_data;
	assign fifo_pe_7_4_north_push_data = {8 {fifo_pe_7_4_north_driver_pe_6_4_push_valid}} & fifo_pe_7_4_north_driver_pe_6_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_4_north_push_valid),
		.push_data(fifo_pe_7_4_north_push_data),
		.push_ready(fifo_pe_7_4_north_push_ready),
		.pop_valid(fifo_pe_7_4_north_pop_valid),
		.pop_data(fifo_pe_7_4_north_pop_data),
		.pop_ready(fifo_pe_7_4_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_8_west_pop_data;
	wire [0:0] fifo_pe_6_8_west_pop_valid;
	wire [0:0] fifo_pe_6_8_west_pop_ready;
	wire [7:0] fifo_pe_6_8_west_driver_pe_6_7_push_data;
	wire [0:0] fifo_pe_6_8_west_driver_pe_6_7_push_valid;
	wire [0:0] fifo_pe_6_8_west_driver_pe_6_7_push_ready;
	wire fifo_pe_6_8_west_push_ready;
	assign fifo_pe_6_8_west_driver_pe_6_7_push_ready = fifo_pe_6_8_west_push_ready;
	wire [0:0] fifo_pe_6_8_west_push_valid;
	assign fifo_pe_6_8_west_push_valid = fifo_pe_6_8_west_driver_pe_6_7_push_valid;
	wire [7:0] fifo_pe_6_8_west_push_data;
	assign fifo_pe_6_8_west_push_data = {8 {fifo_pe_6_8_west_driver_pe_6_7_push_valid}} & fifo_pe_6_8_west_driver_pe_6_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_8_west_push_valid),
		.push_data(fifo_pe_6_8_west_push_data),
		.push_ready(fifo_pe_6_8_west_push_ready),
		.pop_valid(fifo_pe_6_8_west_pop_valid),
		.pop_data(fifo_pe_6_8_west_pop_data),
		.pop_ready(fifo_pe_6_8_west_pop_ready)
	);
	wire [7:0] fifo_pe_6_8_north_pop_data;
	wire [0:0] fifo_pe_6_8_north_pop_valid;
	wire [0:0] fifo_pe_6_8_north_pop_ready;
	wire [7:0] fifo_pe_6_8_north_driver_pe_5_8_push_data;
	wire [0:0] fifo_pe_6_8_north_driver_pe_5_8_push_valid;
	wire [0:0] fifo_pe_6_8_north_driver_pe_5_8_push_ready;
	wire fifo_pe_6_8_north_push_ready;
	assign fifo_pe_6_8_north_driver_pe_5_8_push_ready = fifo_pe_6_8_north_push_ready;
	wire [0:0] fifo_pe_6_8_north_push_valid;
	assign fifo_pe_6_8_north_push_valid = fifo_pe_6_8_north_driver_pe_5_8_push_valid;
	wire [7:0] fifo_pe_6_8_north_push_data;
	assign fifo_pe_6_8_north_push_data = {8 {fifo_pe_6_8_north_driver_pe_5_8_push_valid}} & fifo_pe_6_8_north_driver_pe_5_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_8_north_push_valid),
		.push_data(fifo_pe_6_8_north_push_data),
		.push_ready(fifo_pe_6_8_north_push_ready),
		.pop_valid(fifo_pe_6_8_north_pop_valid),
		.pop_data(fifo_pe_6_8_north_pop_data),
		.pop_ready(fifo_pe_6_8_north_pop_ready)
	);
	wire [7:0] fifo_sink_69d89_west_pop_data;
	wire [0:0] fifo_sink_69d89_west_pop_valid;
	wire [0:0] fifo_sink_69d89_west_pop_ready;
	wire [7:0] fifo_sink_69d89_west_driver_pe_7_8_push_data;
	wire [0:0] fifo_sink_69d89_west_driver_pe_7_8_push_valid;
	wire [0:0] fifo_sink_69d89_west_driver_pe_7_8_push_ready;
	wire fifo_sink_69d89_west_push_ready;
	assign fifo_sink_69d89_west_driver_pe_7_8_push_ready = fifo_sink_69d89_west_push_ready;
	wire [0:0] fifo_sink_69d89_west_push_valid;
	assign fifo_sink_69d89_west_push_valid = fifo_sink_69d89_west_driver_pe_7_8_push_valid;
	wire [7:0] fifo_sink_69d89_west_push_data;
	assign fifo_sink_69d89_west_push_data = {8 {fifo_sink_69d89_west_driver_pe_7_8_push_valid}} & fifo_sink_69d89_west_driver_pe_7_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_69d89_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_69d89_west_push_valid),
		.push_data(fifo_sink_69d89_west_push_data),
		.push_ready(fifo_sink_69d89_west_push_ready),
		.pop_valid(fifo_sink_69d89_west_pop_valid),
		.pop_data(fifo_sink_69d89_west_pop_data),
		.pop_ready(fifo_sink_69d89_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_5_west_pop_data;
	wire [0:0] fifo_pe_4_5_west_pop_valid;
	wire [0:0] fifo_pe_4_5_west_pop_ready;
	wire [7:0] fifo_pe_4_5_west_driver_pe_4_4_push_data;
	wire [0:0] fifo_pe_4_5_west_driver_pe_4_4_push_valid;
	wire [0:0] fifo_pe_4_5_west_driver_pe_4_4_push_ready;
	wire fifo_pe_4_5_west_push_ready;
	assign fifo_pe_4_5_west_driver_pe_4_4_push_ready = fifo_pe_4_5_west_push_ready;
	wire [0:0] fifo_pe_4_5_west_push_valid;
	assign fifo_pe_4_5_west_push_valid = fifo_pe_4_5_west_driver_pe_4_4_push_valid;
	wire [7:0] fifo_pe_4_5_west_push_data;
	assign fifo_pe_4_5_west_push_data = {8 {fifo_pe_4_5_west_driver_pe_4_4_push_valid}} & fifo_pe_4_5_west_driver_pe_4_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_5_west_push_valid),
		.push_data(fifo_pe_4_5_west_push_data),
		.push_ready(fifo_pe_4_5_west_push_ready),
		.pop_valid(fifo_pe_4_5_west_pop_valid),
		.pop_data(fifo_pe_4_5_west_pop_data),
		.pop_ready(fifo_pe_4_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_4_5_north_pop_data;
	wire [0:0] fifo_pe_4_5_north_pop_valid;
	wire [0:0] fifo_pe_4_5_north_pop_ready;
	wire [7:0] fifo_pe_4_5_north_driver_pe_3_5_push_data;
	wire [0:0] fifo_pe_4_5_north_driver_pe_3_5_push_valid;
	wire [0:0] fifo_pe_4_5_north_driver_pe_3_5_push_ready;
	wire fifo_pe_4_5_north_push_ready;
	assign fifo_pe_4_5_north_driver_pe_3_5_push_ready = fifo_pe_4_5_north_push_ready;
	wire [0:0] fifo_pe_4_5_north_push_valid;
	assign fifo_pe_4_5_north_push_valid = fifo_pe_4_5_north_driver_pe_3_5_push_valid;
	wire [7:0] fifo_pe_4_5_north_push_data;
	assign fifo_pe_4_5_north_push_data = {8 {fifo_pe_4_5_north_driver_pe_3_5_push_valid}} & fifo_pe_4_5_north_driver_pe_3_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_4_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_4_5_north_push_valid),
		.push_data(fifo_pe_4_5_north_push_data),
		.push_ready(fifo_pe_4_5_north_push_ready),
		.pop_valid(fifo_pe_4_5_north_pop_valid),
		.pop_data(fifo_pe_4_5_north_pop_data),
		.pop_ready(fifo_pe_4_5_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_3_north_pop_data;
	wire [0:0] fifo_pe_6_3_north_pop_valid;
	wire [0:0] fifo_pe_6_3_north_pop_ready;
	wire [7:0] fifo_pe_6_3_north_driver_pe_5_3_push_data;
	wire [0:0] fifo_pe_6_3_north_driver_pe_5_3_push_valid;
	wire [0:0] fifo_pe_6_3_north_driver_pe_5_3_push_ready;
	wire fifo_pe_6_3_north_push_ready;
	assign fifo_pe_6_3_north_driver_pe_5_3_push_ready = fifo_pe_6_3_north_push_ready;
	wire [0:0] fifo_pe_6_3_north_push_valid;
	assign fifo_pe_6_3_north_push_valid = fifo_pe_6_3_north_driver_pe_5_3_push_valid;
	wire [7:0] fifo_pe_6_3_north_push_data;
	assign fifo_pe_6_3_north_push_data = {8 {fifo_pe_6_3_north_driver_pe_5_3_push_valid}} & fifo_pe_6_3_north_driver_pe_5_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_3_north_push_valid),
		.push_data(fifo_pe_6_3_north_push_data),
		.push_ready(fifo_pe_6_3_north_push_ready),
		.pop_valid(fifo_pe_6_3_north_pop_valid),
		.pop_data(fifo_pe_6_3_north_pop_data),
		.pop_ready(fifo_pe_6_3_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_3_west_pop_data;
	wire [0:0] fifo_pe_6_3_west_pop_valid;
	wire [0:0] fifo_pe_6_3_west_pop_ready;
	wire [7:0] fifo_pe_6_3_west_driver_pe_6_2_push_data;
	wire [0:0] fifo_pe_6_3_west_driver_pe_6_2_push_valid;
	wire [0:0] fifo_pe_6_3_west_driver_pe_6_2_push_ready;
	wire fifo_pe_6_3_west_push_ready;
	assign fifo_pe_6_3_west_driver_pe_6_2_push_ready = fifo_pe_6_3_west_push_ready;
	wire [0:0] fifo_pe_6_3_west_push_valid;
	assign fifo_pe_6_3_west_push_valid = fifo_pe_6_3_west_driver_pe_6_2_push_valid;
	wire [7:0] fifo_pe_6_3_west_push_data;
	assign fifo_pe_6_3_west_push_data = {8 {fifo_pe_6_3_west_driver_pe_6_2_push_valid}} & fifo_pe_6_3_west_driver_pe_6_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_3_west_push_valid),
		.push_data(fifo_pe_6_3_west_push_data),
		.push_ready(fifo_pe_6_3_west_push_ready),
		.pop_valid(fifo_pe_6_3_west_pop_valid),
		.pop_data(fifo_pe_6_3_west_pop_data),
		.pop_ready(fifo_pe_6_3_west_pop_ready)
	);
	wire [7:0] fifo_col_pusher_6_data_pop_data;
	wire [0:0] fifo_col_pusher_6_data_pop_valid;
	wire [0:0] fifo_col_pusher_6_data_pop_ready;
	wire [7:0] fifo_col_pusher_6_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_6_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_6_data_driver_testbench_push_ready;
	wire fifo_col_pusher_6_data_push_ready;
	assign fifo_col_pusher_6_data_driver_testbench_push_ready = fifo_col_pusher_6_data_push_ready;
	wire [0:0] fifo_col_pusher_6_data_push_valid;
	assign fifo_col_pusher_6_data_push_valid = fifo_col_pusher_6_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_6_data_push_data;
	assign fifo_col_pusher_6_data_push_data = {8 {fifo_col_pusher_6_data_driver_testbench_push_valid}} & fifo_col_pusher_6_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_6_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_6_data_push_valid),
		.push_data(fifo_col_pusher_6_data_push_data),
		.push_ready(fifo_col_pusher_6_data_push_ready),
		.pop_valid(fifo_col_pusher_6_data_pop_valid),
		.pop_data(fifo_col_pusher_6_data_pop_data),
		.pop_ready(fifo_col_pusher_6_data_pop_ready)
	);
	wire [7:0] fifo_pe_1_3_west_pop_data;
	wire [0:0] fifo_pe_1_3_west_pop_valid;
	wire [0:0] fifo_pe_1_3_west_pop_ready;
	wire [7:0] fifo_pe_1_3_west_driver_pe_1_2_push_data;
	wire [0:0] fifo_pe_1_3_west_driver_pe_1_2_push_valid;
	wire [0:0] fifo_pe_1_3_west_driver_pe_1_2_push_ready;
	wire fifo_pe_1_3_west_push_ready;
	assign fifo_pe_1_3_west_driver_pe_1_2_push_ready = fifo_pe_1_3_west_push_ready;
	wire [0:0] fifo_pe_1_3_west_push_valid;
	assign fifo_pe_1_3_west_push_valid = fifo_pe_1_3_west_driver_pe_1_2_push_valid;
	wire [7:0] fifo_pe_1_3_west_push_data;
	assign fifo_pe_1_3_west_push_data = {8 {fifo_pe_1_3_west_driver_pe_1_2_push_valid}} & fifo_pe_1_3_west_driver_pe_1_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_3_west_push_valid),
		.push_data(fifo_pe_1_3_west_push_data),
		.push_ready(fifo_pe_1_3_west_push_ready),
		.pop_valid(fifo_pe_1_3_west_pop_valid),
		.pop_data(fifo_pe_1_3_west_pop_data),
		.pop_ready(fifo_pe_1_3_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_3_north_pop_data;
	wire [0:0] fifo_pe_1_3_north_pop_valid;
	wire [0:0] fifo_pe_1_3_north_pop_ready;
	wire [7:0] fifo_pe_1_3_north_driver_col_pusher_3_push_data;
	wire [0:0] fifo_pe_1_3_north_driver_col_pusher_3_push_valid;
	wire [0:0] fifo_pe_1_3_north_driver_col_pusher_3_push_ready;
	wire fifo_pe_1_3_north_push_ready;
	assign fifo_pe_1_3_north_driver_col_pusher_3_push_ready = fifo_pe_1_3_north_push_ready;
	wire [0:0] fifo_pe_1_3_north_push_valid;
	assign fifo_pe_1_3_north_push_valid = fifo_pe_1_3_north_driver_col_pusher_3_push_valid;
	wire [7:0] fifo_pe_1_3_north_push_data;
	assign fifo_pe_1_3_north_push_data = {8 {fifo_pe_1_3_north_driver_col_pusher_3_push_valid}} & fifo_pe_1_3_north_driver_col_pusher_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_3_north_push_valid),
		.push_data(fifo_pe_1_3_north_push_data),
		.push_ready(fifo_pe_1_3_north_push_ready),
		.pop_valid(fifo_pe_1_3_north_pop_valid),
		.pop_data(fifo_pe_1_3_north_pop_data),
		.pop_ready(fifo_pe_1_3_north_pop_ready)
	);
	wire [7:0] fifo_row_pusher_3_data_pop_data;
	wire [0:0] fifo_row_pusher_3_data_pop_valid;
	wire [0:0] fifo_row_pusher_3_data_pop_ready;
	wire [7:0] fifo_row_pusher_3_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_3_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_3_data_driver_testbench_push_ready;
	wire fifo_row_pusher_3_data_push_ready;
	assign fifo_row_pusher_3_data_driver_testbench_push_ready = fifo_row_pusher_3_data_push_ready;
	wire [0:0] fifo_row_pusher_3_data_push_valid;
	assign fifo_row_pusher_3_data_push_valid = fifo_row_pusher_3_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_3_data_push_data;
	assign fifo_row_pusher_3_data_push_data = {8 {fifo_row_pusher_3_data_driver_testbench_push_valid}} & fifo_row_pusher_3_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_3_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_3_data_push_valid),
		.push_data(fifo_row_pusher_3_data_push_data),
		.push_ready(fifo_row_pusher_3_data_push_ready),
		.pop_valid(fifo_row_pusher_3_data_pop_valid),
		.pop_data(fifo_row_pusher_3_data_pop_data),
		.pop_ready(fifo_row_pusher_3_data_pop_ready)
	);
	wire [7:0] fifo_pe_5_5_west_pop_data;
	wire [0:0] fifo_pe_5_5_west_pop_valid;
	wire [0:0] fifo_pe_5_5_west_pop_ready;
	wire [7:0] fifo_pe_5_5_west_driver_pe_5_4_push_data;
	wire [0:0] fifo_pe_5_5_west_driver_pe_5_4_push_valid;
	wire [0:0] fifo_pe_5_5_west_driver_pe_5_4_push_ready;
	wire fifo_pe_5_5_west_push_ready;
	assign fifo_pe_5_5_west_driver_pe_5_4_push_ready = fifo_pe_5_5_west_push_ready;
	wire [0:0] fifo_pe_5_5_west_push_valid;
	assign fifo_pe_5_5_west_push_valid = fifo_pe_5_5_west_driver_pe_5_4_push_valid;
	wire [7:0] fifo_pe_5_5_west_push_data;
	assign fifo_pe_5_5_west_push_data = {8 {fifo_pe_5_5_west_driver_pe_5_4_push_valid}} & fifo_pe_5_5_west_driver_pe_5_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_5_west_push_valid),
		.push_data(fifo_pe_5_5_west_push_data),
		.push_ready(fifo_pe_5_5_west_push_ready),
		.pop_valid(fifo_pe_5_5_west_pop_valid),
		.pop_data(fifo_pe_5_5_west_pop_data),
		.pop_ready(fifo_pe_5_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_5_5_north_pop_data;
	wire [0:0] fifo_pe_5_5_north_pop_valid;
	wire [0:0] fifo_pe_5_5_north_pop_ready;
	wire [7:0] fifo_pe_5_5_north_driver_pe_4_5_push_data;
	wire [0:0] fifo_pe_5_5_north_driver_pe_4_5_push_valid;
	wire [0:0] fifo_pe_5_5_north_driver_pe_4_5_push_ready;
	wire fifo_pe_5_5_north_push_ready;
	assign fifo_pe_5_5_north_driver_pe_4_5_push_ready = fifo_pe_5_5_north_push_ready;
	wire [0:0] fifo_pe_5_5_north_push_valid;
	assign fifo_pe_5_5_north_push_valid = fifo_pe_5_5_north_driver_pe_4_5_push_valid;
	wire [7:0] fifo_pe_5_5_north_push_data;
	assign fifo_pe_5_5_north_push_data = {8 {fifo_pe_5_5_north_driver_pe_4_5_push_valid}} & fifo_pe_5_5_north_driver_pe_4_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_5_north_push_valid),
		.push_data(fifo_pe_5_5_north_push_data),
		.push_ready(fifo_pe_5_5_north_push_ready),
		.pop_valid(fifo_pe_5_5_north_pop_valid),
		.pop_data(fifo_pe_5_5_north_pop_data),
		.pop_ready(fifo_pe_5_5_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_7_north_pop_data;
	wire [0:0] fifo_pe_6_7_north_pop_valid;
	wire [0:0] fifo_pe_6_7_north_pop_ready;
	wire [7:0] fifo_pe_6_7_north_driver_pe_5_7_push_data;
	wire [0:0] fifo_pe_6_7_north_driver_pe_5_7_push_valid;
	wire [0:0] fifo_pe_6_7_north_driver_pe_5_7_push_ready;
	wire fifo_pe_6_7_north_push_ready;
	assign fifo_pe_6_7_north_driver_pe_5_7_push_ready = fifo_pe_6_7_north_push_ready;
	wire [0:0] fifo_pe_6_7_north_push_valid;
	assign fifo_pe_6_7_north_push_valid = fifo_pe_6_7_north_driver_pe_5_7_push_valid;
	wire [7:0] fifo_pe_6_7_north_push_data;
	assign fifo_pe_6_7_north_push_data = {8 {fifo_pe_6_7_north_driver_pe_5_7_push_valid}} & fifo_pe_6_7_north_driver_pe_5_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_7_north_push_valid),
		.push_data(fifo_pe_6_7_north_push_data),
		.push_ready(fifo_pe_6_7_north_push_ready),
		.pop_valid(fifo_pe_6_7_north_pop_valid),
		.pop_data(fifo_pe_6_7_north_pop_data),
		.pop_ready(fifo_pe_6_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_7_west_pop_data;
	wire [0:0] fifo_pe_6_7_west_pop_valid;
	wire [0:0] fifo_pe_6_7_west_pop_ready;
	wire [7:0] fifo_pe_6_7_west_driver_pe_6_6_push_data;
	wire [0:0] fifo_pe_6_7_west_driver_pe_6_6_push_valid;
	wire [0:0] fifo_pe_6_7_west_driver_pe_6_6_push_ready;
	wire fifo_pe_6_7_west_push_ready;
	assign fifo_pe_6_7_west_driver_pe_6_6_push_ready = fifo_pe_6_7_west_push_ready;
	wire [0:0] fifo_pe_6_7_west_push_valid;
	assign fifo_pe_6_7_west_push_valid = fifo_pe_6_7_west_driver_pe_6_6_push_valid;
	wire [7:0] fifo_pe_6_7_west_push_data;
	assign fifo_pe_6_7_west_push_data = {8 {fifo_pe_6_7_west_driver_pe_6_6_push_valid}} & fifo_pe_6_7_west_driver_pe_6_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_7_west_push_valid),
		.push_data(fifo_pe_6_7_west_push_data),
		.push_ready(fifo_pe_6_7_west_push_ready),
		.pop_valid(fifo_pe_6_7_west_pop_valid),
		.pop_data(fifo_pe_6_7_west_pop_data),
		.pop_ready(fifo_pe_6_7_west_pop_ready)
	);
	wire [7:0] fifo_sink_68771_north_pop_data;
	wire [0:0] fifo_sink_68771_north_pop_valid;
	wire [0:0] fifo_sink_68771_north_pop_ready;
	wire [7:0] fifo_sink_68771_north_driver_pe_8_4_push_data;
	wire [0:0] fifo_sink_68771_north_driver_pe_8_4_push_valid;
	wire [0:0] fifo_sink_68771_north_driver_pe_8_4_push_ready;
	wire fifo_sink_68771_north_push_ready;
	assign fifo_sink_68771_north_driver_pe_8_4_push_ready = fifo_sink_68771_north_push_ready;
	wire [0:0] fifo_sink_68771_north_push_valid;
	assign fifo_sink_68771_north_push_valid = fifo_sink_68771_north_driver_pe_8_4_push_valid;
	wire [7:0] fifo_sink_68771_north_push_data;
	assign fifo_sink_68771_north_push_data = {8 {fifo_sink_68771_north_driver_pe_8_4_push_valid}} & fifo_sink_68771_north_driver_pe_8_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_68771_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_68771_north_push_valid),
		.push_data(fifo_sink_68771_north_push_data),
		.push_ready(fifo_sink_68771_north_push_ready),
		.pop_valid(fifo_sink_68771_north_pop_valid),
		.pop_data(fifo_sink_68771_north_pop_data),
		.pop_ready(fifo_sink_68771_north_pop_ready)
	);
	wire [7:0] fifo_row_pusher_6_data_pop_data;
	wire [0:0] fifo_row_pusher_6_data_pop_valid;
	wire [0:0] fifo_row_pusher_6_data_pop_ready;
	wire [7:0] fifo_row_pusher_6_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_6_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_6_data_driver_testbench_push_ready;
	wire fifo_row_pusher_6_data_push_ready;
	assign fifo_row_pusher_6_data_driver_testbench_push_ready = fifo_row_pusher_6_data_push_ready;
	wire [0:0] fifo_row_pusher_6_data_push_valid;
	assign fifo_row_pusher_6_data_push_valid = fifo_row_pusher_6_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_6_data_push_data;
	assign fifo_row_pusher_6_data_push_data = {8 {fifo_row_pusher_6_data_driver_testbench_push_valid}} & fifo_row_pusher_6_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_6_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_6_data_push_valid),
		.push_data(fifo_row_pusher_6_data_push_data),
		.push_ready(fifo_row_pusher_6_data_push_ready),
		.pop_valid(fifo_row_pusher_6_data_pop_valid),
		.pop_data(fifo_row_pusher_6_data_pop_data),
		.pop_ready(fifo_row_pusher_6_data_pop_ready)
	);
	wire [7:0] fifo_pe_7_5_west_pop_data;
	wire [0:0] fifo_pe_7_5_west_pop_valid;
	wire [0:0] fifo_pe_7_5_west_pop_ready;
	wire [7:0] fifo_pe_7_5_west_driver_pe_7_4_push_data;
	wire [0:0] fifo_pe_7_5_west_driver_pe_7_4_push_valid;
	wire [0:0] fifo_pe_7_5_west_driver_pe_7_4_push_ready;
	wire fifo_pe_7_5_west_push_ready;
	assign fifo_pe_7_5_west_driver_pe_7_4_push_ready = fifo_pe_7_5_west_push_ready;
	wire [0:0] fifo_pe_7_5_west_push_valid;
	assign fifo_pe_7_5_west_push_valid = fifo_pe_7_5_west_driver_pe_7_4_push_valid;
	wire [7:0] fifo_pe_7_5_west_push_data;
	assign fifo_pe_7_5_west_push_data = {8 {fifo_pe_7_5_west_driver_pe_7_4_push_valid}} & fifo_pe_7_5_west_driver_pe_7_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_5_west_push_valid),
		.push_data(fifo_pe_7_5_west_push_data),
		.push_ready(fifo_pe_7_5_west_push_ready),
		.pop_valid(fifo_pe_7_5_west_pop_valid),
		.pop_data(fifo_pe_7_5_west_pop_data),
		.pop_ready(fifo_pe_7_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_5_north_pop_data;
	wire [0:0] fifo_pe_7_5_north_pop_valid;
	wire [0:0] fifo_pe_7_5_north_pop_ready;
	wire [7:0] fifo_pe_7_5_north_driver_pe_6_5_push_data;
	wire [0:0] fifo_pe_7_5_north_driver_pe_6_5_push_valid;
	wire [0:0] fifo_pe_7_5_north_driver_pe_6_5_push_ready;
	wire fifo_pe_7_5_north_push_ready;
	assign fifo_pe_7_5_north_driver_pe_6_5_push_ready = fifo_pe_7_5_north_push_ready;
	wire [0:0] fifo_pe_7_5_north_push_valid;
	assign fifo_pe_7_5_north_push_valid = fifo_pe_7_5_north_driver_pe_6_5_push_valid;
	wire [7:0] fifo_pe_7_5_north_push_data;
	assign fifo_pe_7_5_north_push_data = {8 {fifo_pe_7_5_north_driver_pe_6_5_push_valid}} & fifo_pe_7_5_north_driver_pe_6_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_5_north_push_valid),
		.push_data(fifo_pe_7_5_north_push_data),
		.push_ready(fifo_pe_7_5_north_push_ready),
		.pop_valid(fifo_pe_7_5_north_pop_valid),
		.pop_data(fifo_pe_7_5_north_pop_data),
		.pop_ready(fifo_pe_7_5_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_3_north_pop_data;
	wire [0:0] fifo_pe_8_3_north_pop_valid;
	wire [0:0] fifo_pe_8_3_north_pop_ready;
	wire [7:0] fifo_pe_8_3_north_driver_pe_7_3_push_data;
	wire [0:0] fifo_pe_8_3_north_driver_pe_7_3_push_valid;
	wire [0:0] fifo_pe_8_3_north_driver_pe_7_3_push_ready;
	wire fifo_pe_8_3_north_push_ready;
	assign fifo_pe_8_3_north_driver_pe_7_3_push_ready = fifo_pe_8_3_north_push_ready;
	wire [0:0] fifo_pe_8_3_north_push_valid;
	assign fifo_pe_8_3_north_push_valid = fifo_pe_8_3_north_driver_pe_7_3_push_valid;
	wire [7:0] fifo_pe_8_3_north_push_data;
	assign fifo_pe_8_3_north_push_data = {8 {fifo_pe_8_3_north_driver_pe_7_3_push_valid}} & fifo_pe_8_3_north_driver_pe_7_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_3_north_push_valid),
		.push_data(fifo_pe_8_3_north_push_data),
		.push_ready(fifo_pe_8_3_north_push_ready),
		.pop_valid(fifo_pe_8_3_north_pop_valid),
		.pop_data(fifo_pe_8_3_north_pop_data),
		.pop_ready(fifo_pe_8_3_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_3_west_pop_data;
	wire [0:0] fifo_pe_8_3_west_pop_valid;
	wire [0:0] fifo_pe_8_3_west_pop_ready;
	wire [7:0] fifo_pe_8_3_west_driver_pe_8_2_push_data;
	wire [0:0] fifo_pe_8_3_west_driver_pe_8_2_push_valid;
	wire [0:0] fifo_pe_8_3_west_driver_pe_8_2_push_ready;
	wire fifo_pe_8_3_west_push_ready;
	assign fifo_pe_8_3_west_driver_pe_8_2_push_ready = fifo_pe_8_3_west_push_ready;
	wire [0:0] fifo_pe_8_3_west_push_valid;
	assign fifo_pe_8_3_west_push_valid = fifo_pe_8_3_west_driver_pe_8_2_push_valid;
	wire [7:0] fifo_pe_8_3_west_push_data;
	assign fifo_pe_8_3_west_push_data = {8 {fifo_pe_8_3_west_driver_pe_8_2_push_valid}} & fifo_pe_8_3_west_driver_pe_8_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_3_west_push_valid),
		.push_data(fifo_pe_8_3_west_push_data),
		.push_ready(fifo_pe_8_3_west_push_ready),
		.pop_valid(fifo_pe_8_3_west_pop_valid),
		.pop_data(fifo_pe_8_3_west_pop_data),
		.pop_ready(fifo_pe_8_3_west_pop_ready)
	);
	wire [7:0] fifo_pe_3_2_north_pop_data;
	wire [0:0] fifo_pe_3_2_north_pop_valid;
	wire [0:0] fifo_pe_3_2_north_pop_ready;
	wire [7:0] fifo_pe_3_2_north_driver_pe_2_2_push_data;
	wire [0:0] fifo_pe_3_2_north_driver_pe_2_2_push_valid;
	wire [0:0] fifo_pe_3_2_north_driver_pe_2_2_push_ready;
	wire fifo_pe_3_2_north_push_ready;
	assign fifo_pe_3_2_north_driver_pe_2_2_push_ready = fifo_pe_3_2_north_push_ready;
	wire [0:0] fifo_pe_3_2_north_push_valid;
	assign fifo_pe_3_2_north_push_valid = fifo_pe_3_2_north_driver_pe_2_2_push_valid;
	wire [7:0] fifo_pe_3_2_north_push_data;
	assign fifo_pe_3_2_north_push_data = {8 {fifo_pe_3_2_north_driver_pe_2_2_push_valid}} & fifo_pe_3_2_north_driver_pe_2_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_2_north_push_valid),
		.push_data(fifo_pe_3_2_north_push_data),
		.push_ready(fifo_pe_3_2_north_push_ready),
		.pop_valid(fifo_pe_3_2_north_pop_valid),
		.pop_data(fifo_pe_3_2_north_pop_data),
		.pop_ready(fifo_pe_3_2_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_2_west_pop_data;
	wire [0:0] fifo_pe_3_2_west_pop_valid;
	wire [0:0] fifo_pe_3_2_west_pop_ready;
	wire [7:0] fifo_pe_3_2_west_driver_pe_3_1_push_data;
	wire [0:0] fifo_pe_3_2_west_driver_pe_3_1_push_valid;
	wire [0:0] fifo_pe_3_2_west_driver_pe_3_1_push_ready;
	wire fifo_pe_3_2_west_push_ready;
	assign fifo_pe_3_2_west_driver_pe_3_1_push_ready = fifo_pe_3_2_west_push_ready;
	wire [0:0] fifo_pe_3_2_west_push_valid;
	assign fifo_pe_3_2_west_push_valid = fifo_pe_3_2_west_driver_pe_3_1_push_valid;
	wire [7:0] fifo_pe_3_2_west_push_data;
	assign fifo_pe_3_2_west_push_data = {8 {fifo_pe_3_2_west_driver_pe_3_1_push_valid}} & fifo_pe_3_2_west_driver_pe_3_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_2_west_push_valid),
		.push_data(fifo_pe_3_2_west_push_data),
		.push_ready(fifo_pe_3_2_west_push_ready),
		.pop_valid(fifo_pe_3_2_west_pop_valid),
		.pop_data(fifo_pe_3_2_west_pop_data),
		.pop_ready(fifo_pe_3_2_west_pop_ready)
	);
	wire [7:0] fifo_row_pusher_5_data_pop_data;
	wire [0:0] fifo_row_pusher_5_data_pop_valid;
	wire [0:0] fifo_row_pusher_5_data_pop_ready;
	wire [7:0] fifo_row_pusher_5_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_5_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_5_data_driver_testbench_push_ready;
	wire fifo_row_pusher_5_data_push_ready;
	assign fifo_row_pusher_5_data_driver_testbench_push_ready = fifo_row_pusher_5_data_push_ready;
	wire [0:0] fifo_row_pusher_5_data_push_valid;
	assign fifo_row_pusher_5_data_push_valid = fifo_row_pusher_5_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_5_data_push_data;
	assign fifo_row_pusher_5_data_push_data = {8 {fifo_row_pusher_5_data_driver_testbench_push_valid}} & fifo_row_pusher_5_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_5_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_5_data_push_valid),
		.push_data(fifo_row_pusher_5_data_push_data),
		.push_ready(fifo_row_pusher_5_data_push_ready),
		.pop_valid(fifo_row_pusher_5_data_pop_valid),
		.pop_data(fifo_row_pusher_5_data_pop_data),
		.pop_ready(fifo_row_pusher_5_data_pop_ready)
	);
	wire [7:0] fifo_pe_1_1_west_pop_data;
	wire [0:0] fifo_pe_1_1_west_pop_valid;
	wire [0:0] fifo_pe_1_1_west_pop_ready;
	wire [7:0] fifo_pe_1_1_west_driver_row_pusher_1_push_data;
	wire [0:0] fifo_pe_1_1_west_driver_row_pusher_1_push_valid;
	wire [0:0] fifo_pe_1_1_west_driver_row_pusher_1_push_ready;
	wire fifo_pe_1_1_west_push_ready;
	assign fifo_pe_1_1_west_driver_row_pusher_1_push_ready = fifo_pe_1_1_west_push_ready;
	wire [0:0] fifo_pe_1_1_west_push_valid;
	assign fifo_pe_1_1_west_push_valid = fifo_pe_1_1_west_driver_row_pusher_1_push_valid;
	wire [7:0] fifo_pe_1_1_west_push_data;
	assign fifo_pe_1_1_west_push_data = {8 {fifo_pe_1_1_west_driver_row_pusher_1_push_valid}} & fifo_pe_1_1_west_driver_row_pusher_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_1_west_push_valid),
		.push_data(fifo_pe_1_1_west_push_data),
		.push_ready(fifo_pe_1_1_west_push_ready),
		.pop_valid(fifo_pe_1_1_west_pop_valid),
		.pop_data(fifo_pe_1_1_west_pop_data),
		.pop_ready(fifo_pe_1_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_1_north_pop_data;
	wire [0:0] fifo_pe_1_1_north_pop_valid;
	wire [0:0] fifo_pe_1_1_north_pop_ready;
	wire [7:0] fifo_pe_1_1_north_driver_col_pusher_1_push_data;
	wire [0:0] fifo_pe_1_1_north_driver_col_pusher_1_push_valid;
	wire [0:0] fifo_pe_1_1_north_driver_col_pusher_1_push_ready;
	wire fifo_pe_1_1_north_push_ready;
	assign fifo_pe_1_1_north_driver_col_pusher_1_push_ready = fifo_pe_1_1_north_push_ready;
	wire [0:0] fifo_pe_1_1_north_push_valid;
	assign fifo_pe_1_1_north_push_valid = fifo_pe_1_1_north_driver_col_pusher_1_push_valid;
	wire [7:0] fifo_pe_1_1_north_push_data;
	assign fifo_pe_1_1_north_push_data = {8 {fifo_pe_1_1_north_driver_col_pusher_1_push_valid}} & fifo_pe_1_1_north_driver_col_pusher_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_1_north_push_valid),
		.push_data(fifo_pe_1_1_north_push_data),
		.push_ready(fifo_pe_1_1_north_push_ready),
		.pop_valid(fifo_pe_1_1_north_pop_valid),
		.pop_data(fifo_pe_1_1_north_pop_data),
		.pop_ready(fifo_pe_1_1_north_pop_ready)
	);
	wire [7:0] fifo_row_pusher_1_data_pop_data;
	wire [0:0] fifo_row_pusher_1_data_pop_valid;
	wire [0:0] fifo_row_pusher_1_data_pop_ready;
	wire [7:0] fifo_row_pusher_1_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_1_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_1_data_driver_testbench_push_ready;
	wire fifo_row_pusher_1_data_push_ready;
	assign fifo_row_pusher_1_data_driver_testbench_push_ready = fifo_row_pusher_1_data_push_ready;
	wire [0:0] fifo_row_pusher_1_data_push_valid;
	assign fifo_row_pusher_1_data_push_valid = fifo_row_pusher_1_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_1_data_push_data;
	assign fifo_row_pusher_1_data_push_data = {8 {fifo_row_pusher_1_data_driver_testbench_push_valid}} & fifo_row_pusher_1_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_1_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_1_data_push_valid),
		.push_data(fifo_row_pusher_1_data_push_data),
		.push_ready(fifo_row_pusher_1_data_push_ready),
		.pop_valid(fifo_row_pusher_1_data_pop_valid),
		.pop_data(fifo_row_pusher_1_data_pop_data),
		.pop_ready(fifo_row_pusher_1_data_pop_ready)
	);
	wire [7:0] fifo_pe_3_3_north_pop_data;
	wire [0:0] fifo_pe_3_3_north_pop_valid;
	wire [0:0] fifo_pe_3_3_north_pop_ready;
	wire [7:0] fifo_pe_3_3_north_driver_pe_2_3_push_data;
	wire [0:0] fifo_pe_3_3_north_driver_pe_2_3_push_valid;
	wire [0:0] fifo_pe_3_3_north_driver_pe_2_3_push_ready;
	wire fifo_pe_3_3_north_push_ready;
	assign fifo_pe_3_3_north_driver_pe_2_3_push_ready = fifo_pe_3_3_north_push_ready;
	wire [0:0] fifo_pe_3_3_north_push_valid;
	assign fifo_pe_3_3_north_push_valid = fifo_pe_3_3_north_driver_pe_2_3_push_valid;
	wire [7:0] fifo_pe_3_3_north_push_data;
	assign fifo_pe_3_3_north_push_data = {8 {fifo_pe_3_3_north_driver_pe_2_3_push_valid}} & fifo_pe_3_3_north_driver_pe_2_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_3_north_push_valid),
		.push_data(fifo_pe_3_3_north_push_data),
		.push_ready(fifo_pe_3_3_north_push_ready),
		.pop_valid(fifo_pe_3_3_north_pop_valid),
		.pop_data(fifo_pe_3_3_north_pop_data),
		.pop_ready(fifo_pe_3_3_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_3_west_pop_data;
	wire [0:0] fifo_pe_3_3_west_pop_valid;
	wire [0:0] fifo_pe_3_3_west_pop_ready;
	wire [7:0] fifo_pe_3_3_west_driver_pe_3_2_push_data;
	wire [0:0] fifo_pe_3_3_west_driver_pe_3_2_push_valid;
	wire [0:0] fifo_pe_3_3_west_driver_pe_3_2_push_ready;
	wire fifo_pe_3_3_west_push_ready;
	assign fifo_pe_3_3_west_driver_pe_3_2_push_ready = fifo_pe_3_3_west_push_ready;
	wire [0:0] fifo_pe_3_3_west_push_valid;
	assign fifo_pe_3_3_west_push_valid = fifo_pe_3_3_west_driver_pe_3_2_push_valid;
	wire [7:0] fifo_pe_3_3_west_push_data;
	assign fifo_pe_3_3_west_push_data = {8 {fifo_pe_3_3_west_driver_pe_3_2_push_valid}} & fifo_pe_3_3_west_driver_pe_3_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_3_west_push_valid),
		.push_data(fifo_pe_3_3_west_push_data),
		.push_ready(fifo_pe_3_3_west_push_ready),
		.pop_valid(fifo_pe_3_3_west_pop_valid),
		.pop_data(fifo_pe_3_3_west_pop_data),
		.pop_ready(fifo_pe_3_3_west_pop_ready)
	);
	wire [7:0] fifo_pe_8_5_west_pop_data;
	wire [0:0] fifo_pe_8_5_west_pop_valid;
	wire [0:0] fifo_pe_8_5_west_pop_ready;
	wire [7:0] fifo_pe_8_5_west_driver_pe_8_4_push_data;
	wire [0:0] fifo_pe_8_5_west_driver_pe_8_4_push_valid;
	wire [0:0] fifo_pe_8_5_west_driver_pe_8_4_push_ready;
	wire fifo_pe_8_5_west_push_ready;
	assign fifo_pe_8_5_west_driver_pe_8_4_push_ready = fifo_pe_8_5_west_push_ready;
	wire [0:0] fifo_pe_8_5_west_push_valid;
	assign fifo_pe_8_5_west_push_valid = fifo_pe_8_5_west_driver_pe_8_4_push_valid;
	wire [7:0] fifo_pe_8_5_west_push_data;
	assign fifo_pe_8_5_west_push_data = {8 {fifo_pe_8_5_west_driver_pe_8_4_push_valid}} & fifo_pe_8_5_west_driver_pe_8_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_5_west_push_valid),
		.push_data(fifo_pe_8_5_west_push_data),
		.push_ready(fifo_pe_8_5_west_push_ready),
		.pop_valid(fifo_pe_8_5_west_pop_valid),
		.pop_data(fifo_pe_8_5_west_pop_data),
		.pop_ready(fifo_pe_8_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_8_5_north_pop_data;
	wire [0:0] fifo_pe_8_5_north_pop_valid;
	wire [0:0] fifo_pe_8_5_north_pop_ready;
	wire [7:0] fifo_pe_8_5_north_driver_pe_7_5_push_data;
	wire [0:0] fifo_pe_8_5_north_driver_pe_7_5_push_valid;
	wire [0:0] fifo_pe_8_5_north_driver_pe_7_5_push_ready;
	wire fifo_pe_8_5_north_push_ready;
	assign fifo_pe_8_5_north_driver_pe_7_5_push_ready = fifo_pe_8_5_north_push_ready;
	wire [0:0] fifo_pe_8_5_north_push_valid;
	assign fifo_pe_8_5_north_push_valid = fifo_pe_8_5_north_driver_pe_7_5_push_valid;
	wire [7:0] fifo_pe_8_5_north_push_data;
	assign fifo_pe_8_5_north_push_data = {8 {fifo_pe_8_5_north_driver_pe_7_5_push_valid}} & fifo_pe_8_5_north_driver_pe_7_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_5_north_push_valid),
		.push_data(fifo_pe_8_5_north_push_data),
		.push_ready(fifo_pe_8_5_north_push_ready),
		.pop_valid(fifo_pe_8_5_north_pop_valid),
		.pop_data(fifo_pe_8_5_north_pop_data),
		.pop_ready(fifo_pe_8_5_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_7_west_pop_data;
	wire [0:0] fifo_pe_8_7_west_pop_valid;
	wire [0:0] fifo_pe_8_7_west_pop_ready;
	wire [7:0] fifo_pe_8_7_west_driver_pe_8_6_push_data;
	wire [0:0] fifo_pe_8_7_west_driver_pe_8_6_push_valid;
	wire [0:0] fifo_pe_8_7_west_driver_pe_8_6_push_ready;
	wire fifo_pe_8_7_west_push_ready;
	assign fifo_pe_8_7_west_driver_pe_8_6_push_ready = fifo_pe_8_7_west_push_ready;
	wire [0:0] fifo_pe_8_7_west_push_valid;
	assign fifo_pe_8_7_west_push_valid = fifo_pe_8_7_west_driver_pe_8_6_push_valid;
	wire [7:0] fifo_pe_8_7_west_push_data;
	assign fifo_pe_8_7_west_push_data = {8 {fifo_pe_8_7_west_driver_pe_8_6_push_valid}} & fifo_pe_8_7_west_driver_pe_8_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_7_west_push_valid),
		.push_data(fifo_pe_8_7_west_push_data),
		.push_ready(fifo_pe_8_7_west_push_ready),
		.pop_valid(fifo_pe_8_7_west_pop_valid),
		.pop_data(fifo_pe_8_7_west_pop_data),
		.pop_ready(fifo_pe_8_7_west_pop_ready)
	);
	wire [7:0] fifo_pe_8_7_north_pop_data;
	wire [0:0] fifo_pe_8_7_north_pop_valid;
	wire [0:0] fifo_pe_8_7_north_pop_ready;
	wire [7:0] fifo_pe_8_7_north_driver_pe_7_7_push_data;
	wire [0:0] fifo_pe_8_7_north_driver_pe_7_7_push_valid;
	wire [0:0] fifo_pe_8_7_north_driver_pe_7_7_push_ready;
	wire fifo_pe_8_7_north_push_ready;
	assign fifo_pe_8_7_north_driver_pe_7_7_push_ready = fifo_pe_8_7_north_push_ready;
	wire [0:0] fifo_pe_8_7_north_push_valid;
	assign fifo_pe_8_7_north_push_valid = fifo_pe_8_7_north_driver_pe_7_7_push_valid;
	wire [7:0] fifo_pe_8_7_north_push_data;
	assign fifo_pe_8_7_north_push_data = {8 {fifo_pe_8_7_north_driver_pe_7_7_push_valid}} & fifo_pe_8_7_north_driver_pe_7_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_7_north_push_valid),
		.push_data(fifo_pe_8_7_north_push_data),
		.push_ready(fifo_pe_8_7_north_push_ready),
		.pop_valid(fifo_pe_8_7_north_pop_valid),
		.pop_data(fifo_pe_8_7_north_pop_data),
		.pop_ready(fifo_pe_8_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_2_west_pop_data;
	wire [0:0] fifo_pe_8_2_west_pop_valid;
	wire [0:0] fifo_pe_8_2_west_pop_ready;
	wire [7:0] fifo_pe_8_2_west_driver_pe_8_1_push_data;
	wire [0:0] fifo_pe_8_2_west_driver_pe_8_1_push_valid;
	wire [0:0] fifo_pe_8_2_west_driver_pe_8_1_push_ready;
	wire fifo_pe_8_2_west_push_ready;
	assign fifo_pe_8_2_west_driver_pe_8_1_push_ready = fifo_pe_8_2_west_push_ready;
	wire [0:0] fifo_pe_8_2_west_push_valid;
	assign fifo_pe_8_2_west_push_valid = fifo_pe_8_2_west_driver_pe_8_1_push_valid;
	wire [7:0] fifo_pe_8_2_west_push_data;
	assign fifo_pe_8_2_west_push_data = {8 {fifo_pe_8_2_west_driver_pe_8_1_push_valid}} & fifo_pe_8_2_west_driver_pe_8_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_2_west_push_valid),
		.push_data(fifo_pe_8_2_west_push_data),
		.push_ready(fifo_pe_8_2_west_push_ready),
		.pop_valid(fifo_pe_8_2_west_pop_valid),
		.pop_data(fifo_pe_8_2_west_pop_data),
		.pop_ready(fifo_pe_8_2_west_pop_ready)
	);
	wire [7:0] fifo_pe_8_2_north_pop_data;
	wire [0:0] fifo_pe_8_2_north_pop_valid;
	wire [0:0] fifo_pe_8_2_north_pop_ready;
	wire [7:0] fifo_pe_8_2_north_driver_pe_7_2_push_data;
	wire [0:0] fifo_pe_8_2_north_driver_pe_7_2_push_valid;
	wire [0:0] fifo_pe_8_2_north_driver_pe_7_2_push_ready;
	wire fifo_pe_8_2_north_push_ready;
	assign fifo_pe_8_2_north_driver_pe_7_2_push_ready = fifo_pe_8_2_north_push_ready;
	wire [0:0] fifo_pe_8_2_north_push_valid;
	assign fifo_pe_8_2_north_push_valid = fifo_pe_8_2_north_driver_pe_7_2_push_valid;
	wire [7:0] fifo_pe_8_2_north_push_data;
	assign fifo_pe_8_2_north_push_data = {8 {fifo_pe_8_2_north_driver_pe_7_2_push_valid}} & fifo_pe_8_2_north_driver_pe_7_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_2_north_push_valid),
		.push_data(fifo_pe_8_2_north_push_data),
		.push_ready(fifo_pe_8_2_north_push_ready),
		.pop_valid(fifo_pe_8_2_north_pop_valid),
		.pop_data(fifo_pe_8_2_north_pop_data),
		.pop_ready(fifo_pe_8_2_north_pop_ready)
	);
	wire [7:0] fifo_pe_8_4_west_pop_data;
	wire [0:0] fifo_pe_8_4_west_pop_valid;
	wire [0:0] fifo_pe_8_4_west_pop_ready;
	wire [7:0] fifo_pe_8_4_west_driver_pe_8_3_push_data;
	wire [0:0] fifo_pe_8_4_west_driver_pe_8_3_push_valid;
	wire [0:0] fifo_pe_8_4_west_driver_pe_8_3_push_ready;
	wire fifo_pe_8_4_west_push_ready;
	assign fifo_pe_8_4_west_driver_pe_8_3_push_ready = fifo_pe_8_4_west_push_ready;
	wire [0:0] fifo_pe_8_4_west_push_valid;
	assign fifo_pe_8_4_west_push_valid = fifo_pe_8_4_west_driver_pe_8_3_push_valid;
	wire [7:0] fifo_pe_8_4_west_push_data;
	assign fifo_pe_8_4_west_push_data = {8 {fifo_pe_8_4_west_driver_pe_8_3_push_valid}} & fifo_pe_8_4_west_driver_pe_8_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_4_west_push_valid),
		.push_data(fifo_pe_8_4_west_push_data),
		.push_ready(fifo_pe_8_4_west_push_ready),
		.pop_valid(fifo_pe_8_4_west_pop_valid),
		.pop_data(fifo_pe_8_4_west_pop_data),
		.pop_ready(fifo_pe_8_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_8_4_north_pop_data;
	wire [0:0] fifo_pe_8_4_north_pop_valid;
	wire [0:0] fifo_pe_8_4_north_pop_ready;
	wire [7:0] fifo_pe_8_4_north_driver_pe_7_4_push_data;
	wire [0:0] fifo_pe_8_4_north_driver_pe_7_4_push_valid;
	wire [0:0] fifo_pe_8_4_north_driver_pe_7_4_push_ready;
	wire fifo_pe_8_4_north_push_ready;
	assign fifo_pe_8_4_north_driver_pe_7_4_push_ready = fifo_pe_8_4_north_push_ready;
	wire [0:0] fifo_pe_8_4_north_push_valid;
	assign fifo_pe_8_4_north_push_valid = fifo_pe_8_4_north_driver_pe_7_4_push_valid;
	wire [7:0] fifo_pe_8_4_north_push_data;
	assign fifo_pe_8_4_north_push_data = {8 {fifo_pe_8_4_north_driver_pe_7_4_push_valid}} & fifo_pe_8_4_north_driver_pe_7_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_8_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_8_4_north_push_valid),
		.push_data(fifo_pe_8_4_north_push_data),
		.push_ready(fifo_pe_8_4_north_push_ready),
		.pop_valid(fifo_pe_8_4_north_pop_valid),
		.pop_data(fifo_pe_8_4_north_pop_data),
		.pop_ready(fifo_pe_8_4_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_4_north_pop_data;
	wire [0:0] fifo_pe_2_4_north_pop_valid;
	wire [0:0] fifo_pe_2_4_north_pop_ready;
	wire [7:0] fifo_pe_2_4_north_driver_pe_1_4_push_data;
	wire [0:0] fifo_pe_2_4_north_driver_pe_1_4_push_valid;
	wire [0:0] fifo_pe_2_4_north_driver_pe_1_4_push_ready;
	wire fifo_pe_2_4_north_push_ready;
	assign fifo_pe_2_4_north_driver_pe_1_4_push_ready = fifo_pe_2_4_north_push_ready;
	wire [0:0] fifo_pe_2_4_north_push_valid;
	assign fifo_pe_2_4_north_push_valid = fifo_pe_2_4_north_driver_pe_1_4_push_valid;
	wire [7:0] fifo_pe_2_4_north_push_data;
	assign fifo_pe_2_4_north_push_data = {8 {fifo_pe_2_4_north_driver_pe_1_4_push_valid}} & fifo_pe_2_4_north_driver_pe_1_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_4_north_push_valid),
		.push_data(fifo_pe_2_4_north_push_data),
		.push_ready(fifo_pe_2_4_north_push_ready),
		.pop_valid(fifo_pe_2_4_north_pop_valid),
		.pop_data(fifo_pe_2_4_north_pop_data),
		.pop_ready(fifo_pe_2_4_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_4_west_pop_data;
	wire [0:0] fifo_pe_2_4_west_pop_valid;
	wire [0:0] fifo_pe_2_4_west_pop_ready;
	wire [7:0] fifo_pe_2_4_west_driver_pe_2_3_push_data;
	wire [0:0] fifo_pe_2_4_west_driver_pe_2_3_push_valid;
	wire [0:0] fifo_pe_2_4_west_driver_pe_2_3_push_ready;
	wire fifo_pe_2_4_west_push_ready;
	assign fifo_pe_2_4_west_driver_pe_2_3_push_ready = fifo_pe_2_4_west_push_ready;
	wire [0:0] fifo_pe_2_4_west_push_valid;
	assign fifo_pe_2_4_west_push_valid = fifo_pe_2_4_west_driver_pe_2_3_push_valid;
	wire [7:0] fifo_pe_2_4_west_push_data;
	assign fifo_pe_2_4_west_push_data = {8 {fifo_pe_2_4_west_driver_pe_2_3_push_valid}} & fifo_pe_2_4_west_driver_pe_2_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_4_west_push_valid),
		.push_data(fifo_pe_2_4_west_push_data),
		.push_ready(fifo_pe_2_4_west_push_ready),
		.pop_valid(fifo_pe_2_4_west_pop_valid),
		.pop_data(fifo_pe_2_4_west_pop_data),
		.pop_ready(fifo_pe_2_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_6_1_west_pop_data;
	wire [0:0] fifo_pe_6_1_west_pop_valid;
	wire [0:0] fifo_pe_6_1_west_pop_ready;
	wire [7:0] fifo_pe_6_1_west_driver_row_pusher_6_push_data;
	wire [0:0] fifo_pe_6_1_west_driver_row_pusher_6_push_valid;
	wire [0:0] fifo_pe_6_1_west_driver_row_pusher_6_push_ready;
	wire fifo_pe_6_1_west_push_ready;
	assign fifo_pe_6_1_west_driver_row_pusher_6_push_ready = fifo_pe_6_1_west_push_ready;
	wire [0:0] fifo_pe_6_1_west_push_valid;
	assign fifo_pe_6_1_west_push_valid = fifo_pe_6_1_west_driver_row_pusher_6_push_valid;
	wire [7:0] fifo_pe_6_1_west_push_data;
	assign fifo_pe_6_1_west_push_data = {8 {fifo_pe_6_1_west_driver_row_pusher_6_push_valid}} & fifo_pe_6_1_west_driver_row_pusher_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_1_west_push_valid),
		.push_data(fifo_pe_6_1_west_push_data),
		.push_ready(fifo_pe_6_1_west_push_ready),
		.pop_valid(fifo_pe_6_1_west_pop_valid),
		.pop_data(fifo_pe_6_1_west_pop_data),
		.pop_ready(fifo_pe_6_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_6_1_north_pop_data;
	wire [0:0] fifo_pe_6_1_north_pop_valid;
	wire [0:0] fifo_pe_6_1_north_pop_ready;
	wire [7:0] fifo_pe_6_1_north_driver_pe_5_1_push_data;
	wire [0:0] fifo_pe_6_1_north_driver_pe_5_1_push_valid;
	wire [0:0] fifo_pe_6_1_north_driver_pe_5_1_push_ready;
	wire fifo_pe_6_1_north_push_ready;
	assign fifo_pe_6_1_north_driver_pe_5_1_push_ready = fifo_pe_6_1_north_push_ready;
	wire [0:0] fifo_pe_6_1_north_push_valid;
	assign fifo_pe_6_1_north_push_valid = fifo_pe_6_1_north_driver_pe_5_1_push_valid;
	wire [7:0] fifo_pe_6_1_north_push_data;
	assign fifo_pe_6_1_north_push_data = {8 {fifo_pe_6_1_north_driver_pe_5_1_push_valid}} & fifo_pe_6_1_north_driver_pe_5_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_1_north_push_valid),
		.push_data(fifo_pe_6_1_north_push_data),
		.push_ready(fifo_pe_6_1_north_push_ready),
		.pop_valid(fifo_pe_6_1_north_pop_valid),
		.pop_data(fifo_pe_6_1_north_pop_data),
		.pop_ready(fifo_pe_6_1_north_pop_ready)
	);
	wire [7:0] fifo_pe_7_2_north_pop_data;
	wire [0:0] fifo_pe_7_2_north_pop_valid;
	wire [0:0] fifo_pe_7_2_north_pop_ready;
	wire [7:0] fifo_pe_7_2_north_driver_pe_6_2_push_data;
	wire [0:0] fifo_pe_7_2_north_driver_pe_6_2_push_valid;
	wire [0:0] fifo_pe_7_2_north_driver_pe_6_2_push_ready;
	wire fifo_pe_7_2_north_push_ready;
	assign fifo_pe_7_2_north_driver_pe_6_2_push_ready = fifo_pe_7_2_north_push_ready;
	wire [0:0] fifo_pe_7_2_north_push_valid;
	assign fifo_pe_7_2_north_push_valid = fifo_pe_7_2_north_driver_pe_6_2_push_valid;
	wire [7:0] fifo_pe_7_2_north_push_data;
	assign fifo_pe_7_2_north_push_data = {8 {fifo_pe_7_2_north_driver_pe_6_2_push_valid}} & fifo_pe_7_2_north_driver_pe_6_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_2_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_2_north_push_valid),
		.push_data(fifo_pe_7_2_north_push_data),
		.push_ready(fifo_pe_7_2_north_push_ready),
		.pop_valid(fifo_pe_7_2_north_pop_valid),
		.pop_data(fifo_pe_7_2_north_pop_data),
		.pop_ready(fifo_pe_7_2_north_pop_ready)
	);
	wire [7:0] fifo_pe_7_2_west_pop_data;
	wire [0:0] fifo_pe_7_2_west_pop_valid;
	wire [0:0] fifo_pe_7_2_west_pop_ready;
	wire [7:0] fifo_pe_7_2_west_driver_pe_7_1_push_data;
	wire [0:0] fifo_pe_7_2_west_driver_pe_7_1_push_valid;
	wire [0:0] fifo_pe_7_2_west_driver_pe_7_1_push_ready;
	wire fifo_pe_7_2_west_push_ready;
	assign fifo_pe_7_2_west_driver_pe_7_1_push_ready = fifo_pe_7_2_west_push_ready;
	wire [0:0] fifo_pe_7_2_west_push_valid;
	assign fifo_pe_7_2_west_push_valid = fifo_pe_7_2_west_driver_pe_7_1_push_valid;
	wire [7:0] fifo_pe_7_2_west_push_data;
	assign fifo_pe_7_2_west_push_data = {8 {fifo_pe_7_2_west_driver_pe_7_1_push_valid}} & fifo_pe_7_2_west_driver_pe_7_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_2_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_2_west_push_valid),
		.push_data(fifo_pe_7_2_west_push_data),
		.push_ready(fifo_pe_7_2_west_push_ready),
		.pop_valid(fifo_pe_7_2_west_pop_valid),
		.pop_data(fifo_pe_7_2_west_pop_data),
		.pop_ready(fifo_pe_7_2_west_pop_ready)
	);
	wire [7:0] fifo_pe_2_7_north_pop_data;
	wire [0:0] fifo_pe_2_7_north_pop_valid;
	wire [0:0] fifo_pe_2_7_north_pop_ready;
	wire [7:0] fifo_pe_2_7_north_driver_pe_1_7_push_data;
	wire [0:0] fifo_pe_2_7_north_driver_pe_1_7_push_valid;
	wire [0:0] fifo_pe_2_7_north_driver_pe_1_7_push_ready;
	wire fifo_pe_2_7_north_push_ready;
	assign fifo_pe_2_7_north_driver_pe_1_7_push_ready = fifo_pe_2_7_north_push_ready;
	wire [0:0] fifo_pe_2_7_north_push_valid;
	assign fifo_pe_2_7_north_push_valid = fifo_pe_2_7_north_driver_pe_1_7_push_valid;
	wire [7:0] fifo_pe_2_7_north_push_data;
	assign fifo_pe_2_7_north_push_data = {8 {fifo_pe_2_7_north_driver_pe_1_7_push_valid}} & fifo_pe_2_7_north_driver_pe_1_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_7_north_push_valid),
		.push_data(fifo_pe_2_7_north_push_data),
		.push_ready(fifo_pe_2_7_north_push_ready),
		.pop_valid(fifo_pe_2_7_north_pop_valid),
		.pop_data(fifo_pe_2_7_north_pop_data),
		.pop_ready(fifo_pe_2_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_2_7_west_pop_data;
	wire [0:0] fifo_pe_2_7_west_pop_valid;
	wire [0:0] fifo_pe_2_7_west_pop_ready;
	wire [7:0] fifo_pe_2_7_west_driver_pe_2_6_push_data;
	wire [0:0] fifo_pe_2_7_west_driver_pe_2_6_push_valid;
	wire [0:0] fifo_pe_2_7_west_driver_pe_2_6_push_ready;
	wire fifo_pe_2_7_west_push_ready;
	assign fifo_pe_2_7_west_driver_pe_2_6_push_ready = fifo_pe_2_7_west_push_ready;
	wire [0:0] fifo_pe_2_7_west_push_valid;
	assign fifo_pe_2_7_west_push_valid = fifo_pe_2_7_west_driver_pe_2_6_push_valid;
	wire [7:0] fifo_pe_2_7_west_push_data;
	assign fifo_pe_2_7_west_push_data = {8 {fifo_pe_2_7_west_driver_pe_2_6_push_valid}} & fifo_pe_2_7_west_driver_pe_2_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_2_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_2_7_west_push_valid),
		.push_data(fifo_pe_2_7_west_push_data),
		.push_ready(fifo_pe_2_7_west_push_ready),
		.pop_valid(fifo_pe_2_7_west_pop_valid),
		.pop_data(fifo_pe_2_7_west_pop_data),
		.pop_ready(fifo_pe_2_7_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_6_west_pop_data;
	wire [0:0] fifo_pe_1_6_west_pop_valid;
	wire [0:0] fifo_pe_1_6_west_pop_ready;
	wire [7:0] fifo_pe_1_6_west_driver_pe_1_5_push_data;
	wire [0:0] fifo_pe_1_6_west_driver_pe_1_5_push_valid;
	wire [0:0] fifo_pe_1_6_west_driver_pe_1_5_push_ready;
	wire fifo_pe_1_6_west_push_ready;
	assign fifo_pe_1_6_west_driver_pe_1_5_push_ready = fifo_pe_1_6_west_push_ready;
	wire [0:0] fifo_pe_1_6_west_push_valid;
	assign fifo_pe_1_6_west_push_valid = fifo_pe_1_6_west_driver_pe_1_5_push_valid;
	wire [7:0] fifo_pe_1_6_west_push_data;
	assign fifo_pe_1_6_west_push_data = {8 {fifo_pe_1_6_west_driver_pe_1_5_push_valid}} & fifo_pe_1_6_west_driver_pe_1_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_6_west_push_valid),
		.push_data(fifo_pe_1_6_west_push_data),
		.push_ready(fifo_pe_1_6_west_push_ready),
		.pop_valid(fifo_pe_1_6_west_pop_valid),
		.pop_data(fifo_pe_1_6_west_pop_data),
		.pop_ready(fifo_pe_1_6_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_6_north_pop_data;
	wire [0:0] fifo_pe_1_6_north_pop_valid;
	wire [0:0] fifo_pe_1_6_north_pop_ready;
	wire [7:0] fifo_pe_1_6_north_driver_col_pusher_6_push_data;
	wire [0:0] fifo_pe_1_6_north_driver_col_pusher_6_push_valid;
	wire [0:0] fifo_pe_1_6_north_driver_col_pusher_6_push_ready;
	wire fifo_pe_1_6_north_push_ready;
	assign fifo_pe_1_6_north_driver_col_pusher_6_push_ready = fifo_pe_1_6_north_push_ready;
	wire [0:0] fifo_pe_1_6_north_push_valid;
	assign fifo_pe_1_6_north_push_valid = fifo_pe_1_6_north_driver_col_pusher_6_push_valid;
	wire [7:0] fifo_pe_1_6_north_push_data;
	assign fifo_pe_1_6_north_push_data = {8 {fifo_pe_1_6_north_driver_col_pusher_6_push_valid}} & fifo_pe_1_6_north_driver_col_pusher_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_6_north_push_valid),
		.push_data(fifo_pe_1_6_north_push_data),
		.push_ready(fifo_pe_1_6_north_push_ready),
		.pop_valid(fifo_pe_1_6_north_pop_valid),
		.pop_data(fifo_pe_1_6_north_pop_data),
		.pop_ready(fifo_pe_1_6_north_pop_ready)
	);
	wire [7:0] fifo_pe_1_8_west_pop_data;
	wire [0:0] fifo_pe_1_8_west_pop_valid;
	wire [0:0] fifo_pe_1_8_west_pop_ready;
	wire [7:0] fifo_pe_1_8_west_driver_pe_1_7_push_data;
	wire [0:0] fifo_pe_1_8_west_driver_pe_1_7_push_valid;
	wire [0:0] fifo_pe_1_8_west_driver_pe_1_7_push_ready;
	wire fifo_pe_1_8_west_push_ready;
	assign fifo_pe_1_8_west_driver_pe_1_7_push_ready = fifo_pe_1_8_west_push_ready;
	wire [0:0] fifo_pe_1_8_west_push_valid;
	assign fifo_pe_1_8_west_push_valid = fifo_pe_1_8_west_driver_pe_1_7_push_valid;
	wire [7:0] fifo_pe_1_8_west_push_data;
	assign fifo_pe_1_8_west_push_data = {8 {fifo_pe_1_8_west_driver_pe_1_7_push_valid}} & fifo_pe_1_8_west_driver_pe_1_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_8_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_8_west_push_valid),
		.push_data(fifo_pe_1_8_west_push_data),
		.push_ready(fifo_pe_1_8_west_push_ready),
		.pop_valid(fifo_pe_1_8_west_pop_valid),
		.pop_data(fifo_pe_1_8_west_pop_data),
		.pop_ready(fifo_pe_1_8_west_pop_ready)
	);
	wire [7:0] fifo_pe_1_8_north_pop_data;
	wire [0:0] fifo_pe_1_8_north_pop_valid;
	wire [0:0] fifo_pe_1_8_north_pop_ready;
	wire [7:0] fifo_pe_1_8_north_driver_col_pusher_8_push_data;
	wire [0:0] fifo_pe_1_8_north_driver_col_pusher_8_push_valid;
	wire [0:0] fifo_pe_1_8_north_driver_col_pusher_8_push_ready;
	wire fifo_pe_1_8_north_push_ready;
	assign fifo_pe_1_8_north_driver_col_pusher_8_push_ready = fifo_pe_1_8_north_push_ready;
	wire [0:0] fifo_pe_1_8_north_push_valid;
	assign fifo_pe_1_8_north_push_valid = fifo_pe_1_8_north_driver_col_pusher_8_push_valid;
	wire [7:0] fifo_pe_1_8_north_push_data;
	assign fifo_pe_1_8_north_push_data = {8 {fifo_pe_1_8_north_driver_col_pusher_8_push_valid}} & fifo_pe_1_8_north_driver_col_pusher_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_1_8_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_1_8_north_push_valid),
		.push_data(fifo_pe_1_8_north_push_data),
		.push_ready(fifo_pe_1_8_north_push_ready),
		.pop_valid(fifo_pe_1_8_north_pop_valid),
		.pop_data(fifo_pe_1_8_north_pop_data),
		.pop_ready(fifo_pe_1_8_north_pop_ready)
	);
	wire [7:0] fifo_col_pusher_1_data_pop_data;
	wire [0:0] fifo_col_pusher_1_data_pop_valid;
	wire [0:0] fifo_col_pusher_1_data_pop_ready;
	wire [7:0] fifo_col_pusher_1_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_1_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_1_data_driver_testbench_push_ready;
	wire fifo_col_pusher_1_data_push_ready;
	assign fifo_col_pusher_1_data_driver_testbench_push_ready = fifo_col_pusher_1_data_push_ready;
	wire [0:0] fifo_col_pusher_1_data_push_valid;
	assign fifo_col_pusher_1_data_push_valid = fifo_col_pusher_1_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_1_data_push_data;
	assign fifo_col_pusher_1_data_push_data = {8 {fifo_col_pusher_1_data_driver_testbench_push_valid}} & fifo_col_pusher_1_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_1_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_1_data_push_valid),
		.push_data(fifo_col_pusher_1_data_push_data),
		.push_ready(fifo_col_pusher_1_data_push_ready),
		.pop_valid(fifo_col_pusher_1_data_pop_valid),
		.pop_data(fifo_col_pusher_1_data_pop_data),
		.pop_ready(fifo_col_pusher_1_data_pop_ready)
	);
	wire [7:0] fifo_col_pusher_4_data_pop_data;
	wire [0:0] fifo_col_pusher_4_data_pop_valid;
	wire [0:0] fifo_col_pusher_4_data_pop_ready;
	wire [7:0] fifo_col_pusher_4_data_driver_testbench_push_data;
	wire [0:0] fifo_col_pusher_4_data_driver_testbench_push_valid;
	wire [0:0] fifo_col_pusher_4_data_driver_testbench_push_ready;
	wire fifo_col_pusher_4_data_push_ready;
	assign fifo_col_pusher_4_data_driver_testbench_push_ready = fifo_col_pusher_4_data_push_ready;
	wire [0:0] fifo_col_pusher_4_data_push_valid;
	assign fifo_col_pusher_4_data_push_valid = fifo_col_pusher_4_data_driver_testbench_push_valid;
	wire [7:0] fifo_col_pusher_4_data_push_data;
	assign fifo_col_pusher_4_data_push_data = {8 {fifo_col_pusher_4_data_driver_testbench_push_valid}} & fifo_col_pusher_4_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_col_pusher_4_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_col_pusher_4_data_push_valid),
		.push_data(fifo_col_pusher_4_data_push_data),
		.push_ready(fifo_col_pusher_4_data_push_ready),
		.pop_valid(fifo_col_pusher_4_data_pop_valid),
		.pop_data(fifo_col_pusher_4_data_pop_data),
		.pop_ready(fifo_col_pusher_4_data_pop_ready)
	);
	wire [7:0] fifo_sink_69dd1_north_pop_data;
	wire [0:0] fifo_sink_69dd1_north_pop_valid;
	wire [0:0] fifo_sink_69dd1_north_pop_ready;
	wire [7:0] fifo_sink_69dd1_north_driver_pe_8_7_push_data;
	wire [0:0] fifo_sink_69dd1_north_driver_pe_8_7_push_valid;
	wire [0:0] fifo_sink_69dd1_north_driver_pe_8_7_push_ready;
	wire fifo_sink_69dd1_north_push_ready;
	assign fifo_sink_69dd1_north_driver_pe_8_7_push_ready = fifo_sink_69dd1_north_push_ready;
	wire [0:0] fifo_sink_69dd1_north_push_valid;
	assign fifo_sink_69dd1_north_push_valid = fifo_sink_69dd1_north_driver_pe_8_7_push_valid;
	wire [7:0] fifo_sink_69dd1_north_push_data;
	assign fifo_sink_69dd1_north_push_data = {8 {fifo_sink_69dd1_north_driver_pe_8_7_push_valid}} & fifo_sink_69dd1_north_driver_pe_8_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_69dd1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_69dd1_north_push_valid),
		.push_data(fifo_sink_69dd1_north_push_data),
		.push_ready(fifo_sink_69dd1_north_push_ready),
		.pop_valid(fifo_sink_69dd1_north_pop_valid),
		.pop_data(fifo_sink_69dd1_north_pop_data),
		.pop_ready(fifo_sink_69dd1_north_pop_ready)
	);
	wire [7:0] fifo_pe_5_7_north_pop_data;
	wire [0:0] fifo_pe_5_7_north_pop_valid;
	wire [0:0] fifo_pe_5_7_north_pop_ready;
	wire [7:0] fifo_pe_5_7_north_driver_pe_4_7_push_data;
	wire [0:0] fifo_pe_5_7_north_driver_pe_4_7_push_valid;
	wire [0:0] fifo_pe_5_7_north_driver_pe_4_7_push_ready;
	wire fifo_pe_5_7_north_push_ready;
	assign fifo_pe_5_7_north_driver_pe_4_7_push_ready = fifo_pe_5_7_north_push_ready;
	wire [0:0] fifo_pe_5_7_north_push_valid;
	assign fifo_pe_5_7_north_push_valid = fifo_pe_5_7_north_driver_pe_4_7_push_valid;
	wire [7:0] fifo_pe_5_7_north_push_data;
	assign fifo_pe_5_7_north_push_data = {8 {fifo_pe_5_7_north_driver_pe_4_7_push_valid}} & fifo_pe_5_7_north_driver_pe_4_7_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_7_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_7_north_push_valid),
		.push_data(fifo_pe_5_7_north_push_data),
		.push_ready(fifo_pe_5_7_north_push_ready),
		.pop_valid(fifo_pe_5_7_north_pop_valid),
		.pop_data(fifo_pe_5_7_north_pop_data),
		.pop_ready(fifo_pe_5_7_north_pop_ready)
	);
	wire [7:0] fifo_pe_5_7_west_pop_data;
	wire [0:0] fifo_pe_5_7_west_pop_valid;
	wire [0:0] fifo_pe_5_7_west_pop_ready;
	wire [7:0] fifo_pe_5_7_west_driver_pe_5_6_push_data;
	wire [0:0] fifo_pe_5_7_west_driver_pe_5_6_push_valid;
	wire [0:0] fifo_pe_5_7_west_driver_pe_5_6_push_ready;
	wire fifo_pe_5_7_west_push_ready;
	assign fifo_pe_5_7_west_driver_pe_5_6_push_ready = fifo_pe_5_7_west_push_ready;
	wire [0:0] fifo_pe_5_7_west_push_valid;
	assign fifo_pe_5_7_west_push_valid = fifo_pe_5_7_west_driver_pe_5_6_push_valid;
	wire [7:0] fifo_pe_5_7_west_push_data;
	assign fifo_pe_5_7_west_push_data = {8 {fifo_pe_5_7_west_driver_pe_5_6_push_valid}} & fifo_pe_5_7_west_driver_pe_5_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_7_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_7_west_push_valid),
		.push_data(fifo_pe_5_7_west_push_data),
		.push_ready(fifo_pe_5_7_west_push_ready),
		.pop_valid(fifo_pe_5_7_west_pop_valid),
		.pop_data(fifo_pe_5_7_west_pop_data),
		.pop_ready(fifo_pe_5_7_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_6_west_pop_data;
	wire [0:0] fifo_pe_7_6_west_pop_valid;
	wire [0:0] fifo_pe_7_6_west_pop_ready;
	wire [7:0] fifo_pe_7_6_west_driver_pe_7_5_push_data;
	wire [0:0] fifo_pe_7_6_west_driver_pe_7_5_push_valid;
	wire [0:0] fifo_pe_7_6_west_driver_pe_7_5_push_ready;
	wire fifo_pe_7_6_west_push_ready;
	assign fifo_pe_7_6_west_driver_pe_7_5_push_ready = fifo_pe_7_6_west_push_ready;
	wire [0:0] fifo_pe_7_6_west_push_valid;
	assign fifo_pe_7_6_west_push_valid = fifo_pe_7_6_west_driver_pe_7_5_push_valid;
	wire [7:0] fifo_pe_7_6_west_push_data;
	assign fifo_pe_7_6_west_push_data = {8 {fifo_pe_7_6_west_driver_pe_7_5_push_valid}} & fifo_pe_7_6_west_driver_pe_7_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_6_west_push_valid),
		.push_data(fifo_pe_7_6_west_push_data),
		.push_ready(fifo_pe_7_6_west_push_ready),
		.pop_valid(fifo_pe_7_6_west_pop_valid),
		.pop_data(fifo_pe_7_6_west_pop_data),
		.pop_ready(fifo_pe_7_6_west_pop_ready)
	);
	wire [7:0] fifo_pe_7_6_north_pop_data;
	wire [0:0] fifo_pe_7_6_north_pop_valid;
	wire [0:0] fifo_pe_7_6_north_pop_ready;
	wire [7:0] fifo_pe_7_6_north_driver_pe_6_6_push_data;
	wire [0:0] fifo_pe_7_6_north_driver_pe_6_6_push_valid;
	wire [0:0] fifo_pe_7_6_north_driver_pe_6_6_push_ready;
	wire fifo_pe_7_6_north_push_ready;
	assign fifo_pe_7_6_north_driver_pe_6_6_push_ready = fifo_pe_7_6_north_push_ready;
	wire [0:0] fifo_pe_7_6_north_push_valid;
	assign fifo_pe_7_6_north_push_valid = fifo_pe_7_6_north_driver_pe_6_6_push_valid;
	wire [7:0] fifo_pe_7_6_north_push_data;
	assign fifo_pe_7_6_north_push_data = {8 {fifo_pe_7_6_north_driver_pe_6_6_push_valid}} & fifo_pe_7_6_north_driver_pe_6_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_7_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_7_6_north_push_valid),
		.push_data(fifo_pe_7_6_north_push_data),
		.push_ready(fifo_pe_7_6_north_push_ready),
		.pop_valid(fifo_pe_7_6_north_pop_valid),
		.pop_data(fifo_pe_7_6_north_pop_data),
		.pop_ready(fifo_pe_7_6_north_pop_ready)
	);
	wire [7:0] fifo_sink_684d1_north_pop_data;
	wire [0:0] fifo_sink_684d1_north_pop_valid;
	wire [0:0] fifo_sink_684d1_north_pop_ready;
	wire [7:0] fifo_sink_684d1_north_driver_pe_8_1_push_data;
	wire [0:0] fifo_sink_684d1_north_driver_pe_8_1_push_valid;
	wire [0:0] fifo_sink_684d1_north_driver_pe_8_1_push_ready;
	wire fifo_sink_684d1_north_push_ready;
	assign fifo_sink_684d1_north_driver_pe_8_1_push_ready = fifo_sink_684d1_north_push_ready;
	wire [0:0] fifo_sink_684d1_north_push_valid;
	assign fifo_sink_684d1_north_push_valid = fifo_sink_684d1_north_driver_pe_8_1_push_valid;
	wire [7:0] fifo_sink_684d1_north_push_data;
	assign fifo_sink_684d1_north_push_data = {8 {fifo_sink_684d1_north_driver_pe_8_1_push_valid}} & fifo_sink_684d1_north_driver_pe_8_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_684d1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_684d1_north_push_valid),
		.push_data(fifo_sink_684d1_north_push_data),
		.push_ready(fifo_sink_684d1_north_push_ready),
		.pop_valid(fifo_sink_684d1_north_pop_valid),
		.pop_data(fifo_sink_684d1_north_pop_data),
		.pop_ready(fifo_sink_684d1_north_pop_ready)
	);
	wire [7:0] fifo_pe_6_5_west_pop_data;
	wire [0:0] fifo_pe_6_5_west_pop_valid;
	wire [0:0] fifo_pe_6_5_west_pop_ready;
	wire [7:0] fifo_pe_6_5_west_driver_pe_6_4_push_data;
	wire [0:0] fifo_pe_6_5_west_driver_pe_6_4_push_valid;
	wire [0:0] fifo_pe_6_5_west_driver_pe_6_4_push_ready;
	wire fifo_pe_6_5_west_push_ready;
	assign fifo_pe_6_5_west_driver_pe_6_4_push_ready = fifo_pe_6_5_west_push_ready;
	wire [0:0] fifo_pe_6_5_west_push_valid;
	assign fifo_pe_6_5_west_push_valid = fifo_pe_6_5_west_driver_pe_6_4_push_valid;
	wire [7:0] fifo_pe_6_5_west_push_data;
	assign fifo_pe_6_5_west_push_data = {8 {fifo_pe_6_5_west_driver_pe_6_4_push_valid}} & fifo_pe_6_5_west_driver_pe_6_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_5_west_push_valid),
		.push_data(fifo_pe_6_5_west_push_data),
		.push_ready(fifo_pe_6_5_west_push_ready),
		.pop_valid(fifo_pe_6_5_west_pop_valid),
		.pop_data(fifo_pe_6_5_west_pop_data),
		.pop_ready(fifo_pe_6_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_6_5_north_pop_data;
	wire [0:0] fifo_pe_6_5_north_pop_valid;
	wire [0:0] fifo_pe_6_5_north_pop_ready;
	wire [7:0] fifo_pe_6_5_north_driver_pe_5_5_push_data;
	wire [0:0] fifo_pe_6_5_north_driver_pe_5_5_push_valid;
	wire [0:0] fifo_pe_6_5_north_driver_pe_5_5_push_ready;
	wire fifo_pe_6_5_north_push_ready;
	assign fifo_pe_6_5_north_driver_pe_5_5_push_ready = fifo_pe_6_5_north_push_ready;
	wire [0:0] fifo_pe_6_5_north_push_valid;
	assign fifo_pe_6_5_north_push_valid = fifo_pe_6_5_north_driver_pe_5_5_push_valid;
	wire [7:0] fifo_pe_6_5_north_push_data;
	assign fifo_pe_6_5_north_push_data = {8 {fifo_pe_6_5_north_driver_pe_5_5_push_valid}} & fifo_pe_6_5_north_driver_pe_5_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_6_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_6_5_north_push_valid),
		.push_data(fifo_pe_6_5_north_push_data),
		.push_ready(fifo_pe_6_5_north_push_ready),
		.pop_valid(fifo_pe_6_5_north_pop_valid),
		.pop_data(fifo_pe_6_5_north_pop_data),
		.pop_ready(fifo_pe_6_5_north_pop_ready)
	);
	wire [7:0] fifo_pe_5_6_west_pop_data;
	wire [0:0] fifo_pe_5_6_west_pop_valid;
	wire [0:0] fifo_pe_5_6_west_pop_ready;
	wire [7:0] fifo_pe_5_6_west_driver_pe_5_5_push_data;
	wire [0:0] fifo_pe_5_6_west_driver_pe_5_5_push_valid;
	wire [0:0] fifo_pe_5_6_west_driver_pe_5_5_push_ready;
	wire fifo_pe_5_6_west_push_ready;
	assign fifo_pe_5_6_west_driver_pe_5_5_push_ready = fifo_pe_5_6_west_push_ready;
	wire [0:0] fifo_pe_5_6_west_push_valid;
	assign fifo_pe_5_6_west_push_valid = fifo_pe_5_6_west_driver_pe_5_5_push_valid;
	wire [7:0] fifo_pe_5_6_west_push_data;
	assign fifo_pe_5_6_west_push_data = {8 {fifo_pe_5_6_west_driver_pe_5_5_push_valid}} & fifo_pe_5_6_west_driver_pe_5_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_6_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_6_west_push_valid),
		.push_data(fifo_pe_5_6_west_push_data),
		.push_ready(fifo_pe_5_6_west_push_ready),
		.pop_valid(fifo_pe_5_6_west_pop_valid),
		.pop_data(fifo_pe_5_6_west_pop_data),
		.pop_ready(fifo_pe_5_6_west_pop_ready)
	);
	wire [7:0] fifo_pe_5_6_north_pop_data;
	wire [0:0] fifo_pe_5_6_north_pop_valid;
	wire [0:0] fifo_pe_5_6_north_pop_ready;
	wire [7:0] fifo_pe_5_6_north_driver_pe_4_6_push_data;
	wire [0:0] fifo_pe_5_6_north_driver_pe_4_6_push_valid;
	wire [0:0] fifo_pe_5_6_north_driver_pe_4_6_push_ready;
	wire fifo_pe_5_6_north_push_ready;
	assign fifo_pe_5_6_north_driver_pe_4_6_push_ready = fifo_pe_5_6_north_push_ready;
	wire [0:0] fifo_pe_5_6_north_push_valid;
	assign fifo_pe_5_6_north_push_valid = fifo_pe_5_6_north_driver_pe_4_6_push_valid;
	wire [7:0] fifo_pe_5_6_north_push_data;
	assign fifo_pe_5_6_north_push_data = {8 {fifo_pe_5_6_north_driver_pe_4_6_push_valid}} & fifo_pe_5_6_north_driver_pe_4_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_6_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_6_north_push_valid),
		.push_data(fifo_pe_5_6_north_push_data),
		.push_ready(fifo_pe_5_6_north_push_ready),
		.pop_valid(fifo_pe_5_6_north_pop_valid),
		.pop_data(fifo_pe_5_6_north_pop_data),
		.pop_ready(fifo_pe_5_6_north_pop_ready)
	);
	wire [7:0] fifo_sink_69d05_north_pop_data;
	wire [0:0] fifo_sink_69d05_north_pop_valid;
	wire [0:0] fifo_sink_69d05_north_pop_ready;
	wire [7:0] fifo_sink_69d05_north_driver_pe_8_6_push_data;
	wire [0:0] fifo_sink_69d05_north_driver_pe_8_6_push_valid;
	wire [0:0] fifo_sink_69d05_north_driver_pe_8_6_push_ready;
	wire fifo_sink_69d05_north_push_ready;
	assign fifo_sink_69d05_north_driver_pe_8_6_push_ready = fifo_sink_69d05_north_push_ready;
	wire [0:0] fifo_sink_69d05_north_push_valid;
	assign fifo_sink_69d05_north_push_valid = fifo_sink_69d05_north_driver_pe_8_6_push_valid;
	wire [7:0] fifo_sink_69d05_north_push_data;
	assign fifo_sink_69d05_north_push_data = {8 {fifo_sink_69d05_north_driver_pe_8_6_push_valid}} & fifo_sink_69d05_north_driver_pe_8_6_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_69d05_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_69d05_north_push_valid),
		.push_data(fifo_sink_69d05_north_push_data),
		.push_ready(fifo_sink_69d05_north_push_ready),
		.pop_valid(fifo_sink_69d05_north_pop_valid),
		.pop_data(fifo_sink_69d05_north_pop_data),
		.pop_ready(fifo_sink_69d05_north_pop_ready)
	);
	wire [7:0] fifo_sink_69e49_west_pop_data;
	wire [0:0] fifo_sink_69e49_west_pop_valid;
	wire [0:0] fifo_sink_69e49_west_pop_ready;
	wire [7:0] fifo_sink_69e49_west_driver_pe_8_8_push_data;
	wire [0:0] fifo_sink_69e49_west_driver_pe_8_8_push_valid;
	wire [0:0] fifo_sink_69e49_west_driver_pe_8_8_push_ready;
	wire fifo_sink_69e49_west_push_ready;
	assign fifo_sink_69e49_west_driver_pe_8_8_push_ready = fifo_sink_69e49_west_push_ready;
	wire [0:0] fifo_sink_69e49_west_push_valid;
	assign fifo_sink_69e49_west_push_valid = fifo_sink_69e49_west_driver_pe_8_8_push_valid;
	wire [7:0] fifo_sink_69e49_west_push_data;
	assign fifo_sink_69e49_west_push_data = {8 {fifo_sink_69e49_west_driver_pe_8_8_push_valid}} & fifo_sink_69e49_west_driver_pe_8_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_69e49_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_69e49_west_push_valid),
		.push_data(fifo_sink_69e49_west_push_data),
		.push_ready(fifo_sink_69e49_west_push_ready),
		.pop_valid(fifo_sink_69e49_west_pop_valid),
		.pop_data(fifo_sink_69e49_west_pop_data),
		.pop_ready(fifo_sink_69e49_west_pop_ready)
	);
	wire [7:0] fifo_pe_5_3_north_pop_data;
	wire [0:0] fifo_pe_5_3_north_pop_valid;
	wire [0:0] fifo_pe_5_3_north_pop_ready;
	wire [7:0] fifo_pe_5_3_north_driver_pe_4_3_push_data;
	wire [0:0] fifo_pe_5_3_north_driver_pe_4_3_push_valid;
	wire [0:0] fifo_pe_5_3_north_driver_pe_4_3_push_ready;
	wire fifo_pe_5_3_north_push_ready;
	assign fifo_pe_5_3_north_driver_pe_4_3_push_ready = fifo_pe_5_3_north_push_ready;
	wire [0:0] fifo_pe_5_3_north_push_valid;
	assign fifo_pe_5_3_north_push_valid = fifo_pe_5_3_north_driver_pe_4_3_push_valid;
	wire [7:0] fifo_pe_5_3_north_push_data;
	assign fifo_pe_5_3_north_push_data = {8 {fifo_pe_5_3_north_driver_pe_4_3_push_valid}} & fifo_pe_5_3_north_driver_pe_4_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_3_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_3_north_push_valid),
		.push_data(fifo_pe_5_3_north_push_data),
		.push_ready(fifo_pe_5_3_north_push_ready),
		.pop_valid(fifo_pe_5_3_north_pop_valid),
		.pop_data(fifo_pe_5_3_north_pop_data),
		.pop_ready(fifo_pe_5_3_north_pop_ready)
	);
	wire [7:0] fifo_pe_5_3_west_pop_data;
	wire [0:0] fifo_pe_5_3_west_pop_valid;
	wire [0:0] fifo_pe_5_3_west_pop_ready;
	wire [7:0] fifo_pe_5_3_west_driver_pe_5_2_push_data;
	wire [0:0] fifo_pe_5_3_west_driver_pe_5_2_push_valid;
	wire [0:0] fifo_pe_5_3_west_driver_pe_5_2_push_ready;
	wire fifo_pe_5_3_west_push_ready;
	assign fifo_pe_5_3_west_driver_pe_5_2_push_ready = fifo_pe_5_3_west_push_ready;
	wire [0:0] fifo_pe_5_3_west_push_valid;
	assign fifo_pe_5_3_west_push_valid = fifo_pe_5_3_west_driver_pe_5_2_push_valid;
	wire [7:0] fifo_pe_5_3_west_push_data;
	assign fifo_pe_5_3_west_push_data = {8 {fifo_pe_5_3_west_driver_pe_5_2_push_valid}} & fifo_pe_5_3_west_driver_pe_5_2_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_3_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_3_west_push_valid),
		.push_data(fifo_pe_5_3_west_push_data),
		.push_ready(fifo_pe_5_3_west_push_ready),
		.pop_valid(fifo_pe_5_3_west_pop_valid),
		.pop_data(fifo_pe_5_3_west_pop_data),
		.pop_ready(fifo_pe_5_3_west_pop_ready)
	);
	wire [7:0] fifo_pe_3_5_west_pop_data;
	wire [0:0] fifo_pe_3_5_west_pop_valid;
	wire [0:0] fifo_pe_3_5_west_pop_ready;
	wire [7:0] fifo_pe_3_5_west_driver_pe_3_4_push_data;
	wire [0:0] fifo_pe_3_5_west_driver_pe_3_4_push_valid;
	wire [0:0] fifo_pe_3_5_west_driver_pe_3_4_push_ready;
	wire fifo_pe_3_5_west_push_ready;
	assign fifo_pe_3_5_west_driver_pe_3_4_push_ready = fifo_pe_3_5_west_push_ready;
	wire [0:0] fifo_pe_3_5_west_push_valid;
	assign fifo_pe_3_5_west_push_valid = fifo_pe_3_5_west_driver_pe_3_4_push_valid;
	wire [7:0] fifo_pe_3_5_west_push_data;
	assign fifo_pe_3_5_west_push_data = {8 {fifo_pe_3_5_west_driver_pe_3_4_push_valid}} & fifo_pe_3_5_west_driver_pe_3_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_5_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_5_west_push_valid),
		.push_data(fifo_pe_3_5_west_push_data),
		.push_ready(fifo_pe_3_5_west_push_ready),
		.pop_valid(fifo_pe_3_5_west_pop_valid),
		.pop_data(fifo_pe_3_5_west_pop_data),
		.pop_ready(fifo_pe_3_5_west_pop_ready)
	);
	wire [7:0] fifo_pe_3_5_north_pop_data;
	wire [0:0] fifo_pe_3_5_north_pop_valid;
	wire [0:0] fifo_pe_3_5_north_pop_ready;
	wire [7:0] fifo_pe_3_5_north_driver_pe_2_5_push_data;
	wire [0:0] fifo_pe_3_5_north_driver_pe_2_5_push_valid;
	wire [0:0] fifo_pe_3_5_north_driver_pe_2_5_push_ready;
	wire fifo_pe_3_5_north_push_ready;
	assign fifo_pe_3_5_north_driver_pe_2_5_push_ready = fifo_pe_3_5_north_push_ready;
	wire [0:0] fifo_pe_3_5_north_push_valid;
	assign fifo_pe_3_5_north_push_valid = fifo_pe_3_5_north_driver_pe_2_5_push_valid;
	wire [7:0] fifo_pe_3_5_north_push_data;
	assign fifo_pe_3_5_north_push_data = {8 {fifo_pe_3_5_north_driver_pe_2_5_push_valid}} & fifo_pe_3_5_north_driver_pe_2_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_5_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_5_north_push_valid),
		.push_data(fifo_pe_3_5_north_push_data),
		.push_ready(fifo_pe_3_5_north_push_ready),
		.pop_valid(fifo_pe_3_5_north_pop_valid),
		.pop_data(fifo_pe_3_5_north_pop_data),
		.pop_ready(fifo_pe_3_5_north_pop_ready)
	);
	wire [7:0] fifo_sink_69c1d_west_pop_data;
	wire [0:0] fifo_sink_69c1d_west_pop_valid;
	wire [0:0] fifo_sink_69c1d_west_pop_ready;
	wire [7:0] fifo_sink_69c1d_west_driver_pe_5_8_push_data;
	wire [0:0] fifo_sink_69c1d_west_driver_pe_5_8_push_valid;
	wire [0:0] fifo_sink_69c1d_west_driver_pe_5_8_push_ready;
	wire fifo_sink_69c1d_west_push_ready;
	assign fifo_sink_69c1d_west_driver_pe_5_8_push_ready = fifo_sink_69c1d_west_push_ready;
	wire [0:0] fifo_sink_69c1d_west_push_valid;
	assign fifo_sink_69c1d_west_push_valid = fifo_sink_69c1d_west_driver_pe_5_8_push_valid;
	wire [7:0] fifo_sink_69c1d_west_push_data;
	assign fifo_sink_69c1d_west_push_data = {8 {fifo_sink_69c1d_west_driver_pe_5_8_push_valid}} & fifo_sink_69c1d_west_driver_pe_5_8_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_sink_69c1d_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_sink_69c1d_west_push_valid),
		.push_data(fifo_sink_69c1d_west_push_data),
		.push_ready(fifo_sink_69c1d_west_push_ready),
		.pop_valid(fifo_sink_69c1d_west_pop_valid),
		.pop_data(fifo_sink_69c1d_west_pop_data),
		.pop_ready(fifo_sink_69c1d_west_pop_ready)
	);
	wire [7:0] fifo_row_pusher_4_data_pop_data;
	wire [0:0] fifo_row_pusher_4_data_pop_valid;
	wire [0:0] fifo_row_pusher_4_data_pop_ready;
	wire [7:0] fifo_row_pusher_4_data_driver_testbench_push_data;
	wire [0:0] fifo_row_pusher_4_data_driver_testbench_push_valid;
	wire [0:0] fifo_row_pusher_4_data_driver_testbench_push_ready;
	wire fifo_row_pusher_4_data_push_ready;
	assign fifo_row_pusher_4_data_driver_testbench_push_ready = fifo_row_pusher_4_data_push_ready;
	wire [0:0] fifo_row_pusher_4_data_push_valid;
	assign fifo_row_pusher_4_data_push_valid = fifo_row_pusher_4_data_driver_testbench_push_valid;
	wire [7:0] fifo_row_pusher_4_data_push_data;
	assign fifo_row_pusher_4_data_push_data = {8 {fifo_row_pusher_4_data_driver_testbench_push_valid}} & fifo_row_pusher_4_data_driver_testbench_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(2)
	) fifo_row_pusher_4_data_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_row_pusher_4_data_push_valid),
		.push_data(fifo_row_pusher_4_data_push_data),
		.push_ready(fifo_row_pusher_4_data_push_ready),
		.pop_valid(fifo_row_pusher_4_data_pop_valid),
		.pop_data(fifo_row_pusher_4_data_pop_data),
		.pop_ready(fifo_row_pusher_4_data_pop_ready)
	);
	wire [7:0] fifo_pe_5_1_west_pop_data;
	wire [0:0] fifo_pe_5_1_west_pop_valid;
	wire [0:0] fifo_pe_5_1_west_pop_ready;
	wire [7:0] fifo_pe_5_1_west_driver_row_pusher_5_push_data;
	wire [0:0] fifo_pe_5_1_west_driver_row_pusher_5_push_valid;
	wire [0:0] fifo_pe_5_1_west_driver_row_pusher_5_push_ready;
	wire fifo_pe_5_1_west_push_ready;
	assign fifo_pe_5_1_west_driver_row_pusher_5_push_ready = fifo_pe_5_1_west_push_ready;
	wire [0:0] fifo_pe_5_1_west_push_valid;
	assign fifo_pe_5_1_west_push_valid = fifo_pe_5_1_west_driver_row_pusher_5_push_valid;
	wire [7:0] fifo_pe_5_1_west_push_data;
	assign fifo_pe_5_1_west_push_data = {8 {fifo_pe_5_1_west_driver_row_pusher_5_push_valid}} & fifo_pe_5_1_west_driver_row_pusher_5_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_1_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_1_west_push_valid),
		.push_data(fifo_pe_5_1_west_push_data),
		.push_ready(fifo_pe_5_1_west_push_ready),
		.pop_valid(fifo_pe_5_1_west_pop_valid),
		.pop_data(fifo_pe_5_1_west_pop_data),
		.pop_ready(fifo_pe_5_1_west_pop_ready)
	);
	wire [7:0] fifo_pe_5_1_north_pop_data;
	wire [0:0] fifo_pe_5_1_north_pop_valid;
	wire [0:0] fifo_pe_5_1_north_pop_ready;
	wire [7:0] fifo_pe_5_1_north_driver_pe_4_1_push_data;
	wire [0:0] fifo_pe_5_1_north_driver_pe_4_1_push_valid;
	wire [0:0] fifo_pe_5_1_north_driver_pe_4_1_push_ready;
	wire fifo_pe_5_1_north_push_ready;
	assign fifo_pe_5_1_north_driver_pe_4_1_push_ready = fifo_pe_5_1_north_push_ready;
	wire [0:0] fifo_pe_5_1_north_push_valid;
	assign fifo_pe_5_1_north_push_valid = fifo_pe_5_1_north_driver_pe_4_1_push_valid;
	wire [7:0] fifo_pe_5_1_north_push_data;
	assign fifo_pe_5_1_north_push_data = {8 {fifo_pe_5_1_north_driver_pe_4_1_push_valid}} & fifo_pe_5_1_north_driver_pe_4_1_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_5_1_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_5_1_north_push_valid),
		.push_data(fifo_pe_5_1_north_push_data),
		.push_ready(fifo_pe_5_1_north_push_ready),
		.pop_valid(fifo_pe_5_1_north_pop_valid),
		.pop_data(fifo_pe_5_1_north_pop_data),
		.pop_ready(fifo_pe_5_1_north_pop_ready)
	);
	wire [7:0] fifo_pe_3_4_west_pop_data;
	wire [0:0] fifo_pe_3_4_west_pop_valid;
	wire [0:0] fifo_pe_3_4_west_pop_ready;
	wire [7:0] fifo_pe_3_4_west_driver_pe_3_3_push_data;
	wire [0:0] fifo_pe_3_4_west_driver_pe_3_3_push_valid;
	wire [0:0] fifo_pe_3_4_west_driver_pe_3_3_push_ready;
	wire fifo_pe_3_4_west_push_ready;
	assign fifo_pe_3_4_west_driver_pe_3_3_push_ready = fifo_pe_3_4_west_push_ready;
	wire [0:0] fifo_pe_3_4_west_push_valid;
	assign fifo_pe_3_4_west_push_valid = fifo_pe_3_4_west_driver_pe_3_3_push_valid;
	wire [7:0] fifo_pe_3_4_west_push_data;
	assign fifo_pe_3_4_west_push_data = {8 {fifo_pe_3_4_west_driver_pe_3_3_push_valid}} & fifo_pe_3_4_west_driver_pe_3_3_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_4_west_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_4_west_push_valid),
		.push_data(fifo_pe_3_4_west_push_data),
		.push_ready(fifo_pe_3_4_west_push_ready),
		.pop_valid(fifo_pe_3_4_west_pop_valid),
		.pop_data(fifo_pe_3_4_west_pop_data),
		.pop_ready(fifo_pe_3_4_west_pop_ready)
	);
	wire [7:0] fifo_pe_3_4_north_pop_data;
	wire [0:0] fifo_pe_3_4_north_pop_valid;
	wire [0:0] fifo_pe_3_4_north_pop_ready;
	wire [7:0] fifo_pe_3_4_north_driver_pe_2_4_push_data;
	wire [0:0] fifo_pe_3_4_north_driver_pe_2_4_push_valid;
	wire [0:0] fifo_pe_3_4_north_driver_pe_2_4_push_ready;
	wire fifo_pe_3_4_north_push_ready;
	assign fifo_pe_3_4_north_driver_pe_2_4_push_ready = fifo_pe_3_4_north_push_ready;
	wire [0:0] fifo_pe_3_4_north_push_valid;
	assign fifo_pe_3_4_north_push_valid = fifo_pe_3_4_north_driver_pe_2_4_push_valid;
	wire [7:0] fifo_pe_3_4_north_push_data;
	assign fifo_pe_3_4_north_push_data = {8 {fifo_pe_3_4_north_driver_pe_2_4_push_valid}} & fifo_pe_3_4_north_driver_pe_2_4_push_data;
	fifo #(
		.WIDTH(8),
		.DEPTH_LOG2(0)
	) fifo_pe_3_4_north_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_pe_3_4_north_push_valid),
		.push_data(fifo_pe_3_4_north_push_data),
		.push_ready(fifo_pe_3_4_north_push_ready),
		.pop_valid(fifo_pe_3_4_north_pop_valid),
		.pop_data(fifo_pe_3_4_north_pop_data),
		.pop_ready(fifo_pe_3_4_north_pop_ready)
	);
	wire [7:0] pe_5_2_driver_pe_5_1_counter_delta;
	wire [0:0] pe_5_2_driver_pe_5_1_counter_delta_ready;
	wire [0:0] pe_5_2_counter_delta_ready;
	wire [7:0] pe_5_2_counter_delta;
	assign pe_5_2_counter_delta = pe_5_2_driver_pe_5_1_counter_delta;
	wire [0:0] pe_5_2_counter_pop_ready;
	assign pe_5_2_driver_pe_5_1_counter_delta_ready = pe_5_2_counter_pop_ready;
	wire [0:0] pe_5_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_2_counter_delta),
		.delta_ready(pe_5_2_counter_delta_ready),
		.pop_valid(pe_5_2_counter_pop_valid),
		.pop_ready(pe_5_2_counter_pop_ready)
	);
	wire [7:0] pe_8_6_driver_pe_8_5_counter_delta;
	wire [0:0] pe_8_6_driver_pe_8_5_counter_delta_ready;
	wire [0:0] pe_8_6_counter_delta_ready;
	wire [7:0] pe_8_6_counter_delta;
	assign pe_8_6_counter_delta = pe_8_6_driver_pe_8_5_counter_delta;
	wire [0:0] pe_8_6_counter_pop_ready;
	assign pe_8_6_driver_pe_8_5_counter_delta_ready = pe_8_6_counter_pop_ready;
	wire [0:0] pe_8_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_6_counter_delta),
		.delta_ready(pe_8_6_counter_delta_ready),
		.pop_valid(pe_8_6_counter_pop_valid),
		.pop_ready(pe_8_6_counter_pop_ready)
	);
	wire [7:0] pe_4_7_driver_pe_4_6_counter_delta;
	wire [0:0] pe_4_7_driver_pe_4_6_counter_delta_ready;
	wire [0:0] pe_4_7_counter_delta_ready;
	wire [7:0] pe_4_7_counter_delta;
	assign pe_4_7_counter_delta = pe_4_7_driver_pe_4_6_counter_delta;
	wire [0:0] pe_4_7_counter_pop_ready;
	assign pe_4_7_driver_pe_4_6_counter_delta_ready = pe_4_7_counter_pop_ready;
	wire [0:0] pe_4_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_7_counter_delta),
		.delta_ready(pe_4_7_counter_delta_ready),
		.pop_valid(pe_4_7_counter_pop_valid),
		.pop_ready(pe_4_7_counter_pop_ready)
	);
	wire [7:0] pe_6_6_driver_pe_6_5_counter_delta;
	wire [0:0] pe_6_6_driver_pe_6_5_counter_delta_ready;
	wire [0:0] pe_6_6_counter_delta_ready;
	wire [7:0] pe_6_6_counter_delta;
	assign pe_6_6_counter_delta = pe_6_6_driver_pe_6_5_counter_delta;
	wire [0:0] pe_6_6_counter_pop_ready;
	assign pe_6_6_driver_pe_6_5_counter_delta_ready = pe_6_6_counter_pop_ready;
	wire [0:0] pe_6_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_6_counter_delta),
		.delta_ready(pe_6_6_counter_delta_ready),
		.pop_valid(pe_6_6_counter_pop_valid),
		.pop_ready(pe_6_6_counter_pop_ready)
	);
	wire [7:0] pe_7_1_driver_pe_6_1_counter_delta;
	wire [0:0] pe_7_1_driver_pe_6_1_counter_delta_ready;
	wire [0:0] pe_7_1_counter_delta_ready;
	wire [7:0] pe_7_1_counter_delta;
	assign pe_7_1_counter_delta = pe_7_1_driver_pe_6_1_counter_delta;
	wire [0:0] pe_7_1_counter_pop_ready;
	assign pe_7_1_driver_pe_6_1_counter_delta_ready = pe_7_1_counter_pop_ready;
	wire [0:0] pe_7_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_1_counter_delta),
		.delta_ready(pe_7_1_counter_delta_ready),
		.pop_valid(pe_7_1_counter_pop_valid),
		.pop_ready(pe_7_1_counter_pop_ready)
	);
	wire [7:0] pe_4_4_driver_pe_4_3_counter_delta;
	wire [0:0] pe_4_4_driver_pe_4_3_counter_delta_ready;
	wire [0:0] pe_4_4_counter_delta_ready;
	wire [7:0] pe_4_4_counter_delta;
	assign pe_4_4_counter_delta = pe_4_4_driver_pe_4_3_counter_delta;
	wire [0:0] pe_4_4_counter_pop_ready;
	assign pe_4_4_driver_pe_4_3_counter_delta_ready = pe_4_4_counter_pop_ready;
	wire [0:0] pe_4_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_4_counter_delta),
		.delta_ready(pe_4_4_counter_delta_ready),
		.pop_valid(pe_4_4_counter_pop_valid),
		.pop_ready(pe_4_4_counter_pop_ready)
	);
	wire [7:0] pe_1_5_driver_pe_1_4_counter_delta;
	wire [0:0] pe_1_5_driver_pe_1_4_counter_delta_ready;
	wire [0:0] pe_1_5_counter_delta_ready;
	wire [7:0] pe_1_5_counter_delta;
	assign pe_1_5_counter_delta = pe_1_5_driver_pe_1_4_counter_delta;
	wire [0:0] pe_1_5_counter_pop_ready;
	assign pe_1_5_driver_pe_1_4_counter_delta_ready = pe_1_5_counter_pop_ready;
	wire [0:0] pe_1_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_5_counter_delta),
		.delta_ready(pe_1_5_counter_delta_ready),
		.pop_valid(pe_1_5_counter_pop_valid),
		.pop_ready(pe_1_5_counter_pop_ready)
	);
	wire [7:0] pe_2_3_driver_pe_2_2_counter_delta;
	wire [0:0] pe_2_3_driver_pe_2_2_counter_delta_ready;
	wire [0:0] pe_2_3_counter_delta_ready;
	wire [7:0] pe_2_3_counter_delta;
	assign pe_2_3_counter_delta = pe_2_3_driver_pe_2_2_counter_delta;
	wire [0:0] pe_2_3_counter_pop_ready;
	assign pe_2_3_driver_pe_2_2_counter_delta_ready = pe_2_3_counter_pop_ready;
	wire [0:0] pe_2_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_3_counter_delta),
		.delta_ready(pe_2_3_counter_delta_ready),
		.pop_valid(pe_2_3_counter_pop_valid),
		.pop_ready(pe_2_3_counter_pop_ready)
	);
	wire [7:0] sink_69c5d_driver_pe_8_5_counter_delta;
	wire [0:0] sink_69c5d_driver_pe_8_5_counter_delta_ready;
	wire [0:0] sink_69c5d_counter_delta_ready;
	wire [7:0] sink_69c5d_counter_delta;
	assign sink_69c5d_counter_delta = sink_69c5d_driver_pe_8_5_counter_delta;
	wire [0:0] sink_69c5d_counter_pop_ready;
	assign sink_69c5d_driver_pe_8_5_counter_delta_ready = sink_69c5d_counter_pop_ready;
	wire [0:0] sink_69c5d_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_69c5d_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_69c5d_counter_delta),
		.delta_ready(sink_69c5d_counter_delta_ready),
		.pop_valid(sink_69c5d_counter_pop_valid),
		.pop_ready(sink_69c5d_counter_pop_ready)
	);
	wire [7:0] pe_4_2_driver_pe_4_1_counter_delta;
	wire [0:0] pe_4_2_driver_pe_4_1_counter_delta_ready;
	wire [0:0] pe_4_2_counter_delta_ready;
	wire [7:0] pe_4_2_counter_delta;
	assign pe_4_2_counter_delta = pe_4_2_driver_pe_4_1_counter_delta;
	wire [0:0] pe_4_2_counter_pop_ready;
	assign pe_4_2_driver_pe_4_1_counter_delta_ready = pe_4_2_counter_pop_ready;
	wire [0:0] pe_4_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_2_counter_delta),
		.delta_ready(pe_4_2_counter_delta_ready),
		.pop_valid(pe_4_2_counter_pop_valid),
		.pop_ready(pe_4_2_counter_pop_ready)
	);
	wire [7:0] pe_2_5_driver_pe_2_4_counter_delta;
	wire [0:0] pe_2_5_driver_pe_2_4_counter_delta_ready;
	wire [0:0] pe_2_5_counter_delta_ready;
	wire [7:0] pe_2_5_counter_delta;
	assign pe_2_5_counter_delta = pe_2_5_driver_pe_2_4_counter_delta;
	wire [0:0] pe_2_5_counter_pop_ready;
	assign pe_2_5_driver_pe_2_4_counter_delta_ready = pe_2_5_counter_pop_ready;
	wire [0:0] pe_2_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_5_counter_delta),
		.delta_ready(pe_2_5_counter_delta_ready),
		.pop_valid(pe_2_5_counter_pop_valid),
		.pop_ready(pe_2_5_counter_pop_ready)
	);
	wire [7:0] sink_68649_driver_pe_3_8_counter_delta;
	wire [0:0] sink_68649_driver_pe_3_8_counter_delta_ready;
	wire [0:0] sink_68649_counter_delta_ready;
	wire [7:0] sink_68649_counter_delta;
	assign sink_68649_counter_delta = sink_68649_driver_pe_3_8_counter_delta;
	wire [0:0] sink_68649_counter_pop_ready;
	assign sink_68649_driver_pe_3_8_counter_delta_ready = sink_68649_counter_pop_ready;
	wire [0:0] sink_68649_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_68649_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_68649_counter_delta),
		.delta_ready(sink_68649_counter_delta_ready),
		.pop_valid(sink_68649_counter_pop_valid),
		.pop_ready(sink_68649_counter_pop_ready)
	);
	wire [7:0] pe_2_8_driver_pe_2_7_counter_delta;
	wire [0:0] pe_2_8_driver_pe_2_7_counter_delta_ready;
	wire [0:0] pe_2_8_counter_delta_ready;
	wire [7:0] pe_2_8_counter_delta;
	assign pe_2_8_counter_delta = pe_2_8_driver_pe_2_7_counter_delta;
	wire [0:0] pe_2_8_counter_pop_ready;
	assign pe_2_8_driver_pe_2_7_counter_delta_ready = pe_2_8_counter_pop_ready;
	wire [0:0] pe_2_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_8_counter_delta),
		.delta_ready(pe_2_8_counter_delta_ready),
		.pop_valid(pe_2_8_counter_pop_valid),
		.pop_ready(pe_2_8_counter_pop_ready)
	);
	wire [7:0] pe_4_1_driver_pe_3_1_counter_delta;
	wire [0:0] pe_4_1_driver_pe_3_1_counter_delta_ready;
	wire [0:0] pe_4_1_counter_delta_ready;
	wire [7:0] pe_4_1_counter_delta;
	assign pe_4_1_counter_delta = pe_4_1_driver_pe_3_1_counter_delta;
	wire [0:0] pe_4_1_counter_pop_ready;
	assign pe_4_1_driver_pe_3_1_counter_delta_ready = pe_4_1_counter_pop_ready;
	wire [0:0] pe_4_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_1_counter_delta),
		.delta_ready(pe_4_1_counter_delta_ready),
		.pop_valid(pe_4_1_counter_pop_valid),
		.pop_ready(pe_4_1_counter_pop_ready)
	);
	wire [7:0] pe_3_7_driver_pe_3_6_counter_delta;
	wire [0:0] pe_3_7_driver_pe_3_6_counter_delta_ready;
	wire [0:0] pe_3_7_counter_delta_ready;
	wire [7:0] pe_3_7_counter_delta;
	assign pe_3_7_counter_delta = pe_3_7_driver_pe_3_6_counter_delta;
	wire [0:0] pe_3_7_counter_pop_ready;
	assign pe_3_7_driver_pe_3_6_counter_delta_ready = pe_3_7_counter_pop_ready;
	wire [0:0] pe_3_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_7_counter_delta),
		.delta_ready(pe_3_7_counter_delta_ready),
		.pop_valid(pe_3_7_counter_pop_valid),
		.pop_ready(pe_3_7_counter_pop_ready)
	);
	wire [7:0] pe_4_3_driver_pe_4_2_counter_delta;
	wire [0:0] pe_4_3_driver_pe_4_2_counter_delta_ready;
	wire [0:0] pe_4_3_counter_delta_ready;
	wire [7:0] pe_4_3_counter_delta;
	assign pe_4_3_counter_delta = pe_4_3_driver_pe_4_2_counter_delta;
	wire [0:0] pe_4_3_counter_pop_ready;
	assign pe_4_3_driver_pe_4_2_counter_delta_ready = pe_4_3_counter_pop_ready;
	wire [0:0] pe_4_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_3_counter_delta),
		.delta_ready(pe_4_3_counter_delta_ready),
		.pop_valid(pe_4_3_counter_pop_valid),
		.pop_ready(pe_4_3_counter_pop_ready)
	);
	wire [7:0] pe_4_8_driver_pe_4_7_counter_delta;
	wire [0:0] pe_4_8_driver_pe_4_7_counter_delta_ready;
	wire [0:0] pe_4_8_counter_delta_ready;
	wire [7:0] pe_4_8_counter_delta;
	assign pe_4_8_counter_delta = pe_4_8_driver_pe_4_7_counter_delta;
	wire [0:0] pe_4_8_counter_pop_ready;
	assign pe_4_8_driver_pe_4_7_counter_delta_ready = pe_4_8_counter_pop_ready;
	wire [0:0] pe_4_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_8_counter_delta),
		.delta_ready(pe_4_8_counter_delta_ready),
		.pop_valid(pe_4_8_counter_pop_valid),
		.pop_ready(pe_4_8_counter_pop_ready)
	);
	wire [7:0] pe_6_4_driver_pe_6_3_counter_delta;
	wire [0:0] pe_6_4_driver_pe_6_3_counter_delta_ready;
	wire [0:0] pe_6_4_counter_delta_ready;
	wire [7:0] pe_6_4_counter_delta;
	assign pe_6_4_counter_delta = pe_6_4_driver_pe_6_3_counter_delta;
	wire [0:0] pe_6_4_counter_pop_ready;
	assign pe_6_4_driver_pe_6_3_counter_delta_ready = pe_6_4_counter_pop_ready;
	wire [0:0] pe_6_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_4_counter_delta),
		.delta_ready(pe_6_4_counter_delta_ready),
		.pop_valid(pe_6_4_counter_pop_valid),
		.pop_ready(pe_6_4_counter_pop_ready)
	);
	wire [7:0] col_pusher_2_driver_testbench_counter_delta;
	wire [0:0] col_pusher_2_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_2_counter_delta_ready;
	wire [7:0] col_pusher_2_counter_delta;
	assign col_pusher_2_counter_delta = col_pusher_2_driver_testbench_counter_delta;
	wire [0:0] col_pusher_2_counter_pop_ready;
	assign col_pusher_2_driver_testbench_counter_delta_ready = col_pusher_2_counter_pop_ready;
	wire [0:0] col_pusher_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_2_counter_delta),
		.delta_ready(col_pusher_2_counter_delta_ready),
		.pop_valid(col_pusher_2_counter_pop_valid),
		.pop_ready(col_pusher_2_counter_pop_ready)
	);
	wire [7:0] row_pusher_2_driver_testbench_counter_delta;
	wire [0:0] row_pusher_2_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_2_counter_delta_ready;
	wire [7:0] row_pusher_2_counter_delta;
	assign row_pusher_2_counter_delta = row_pusher_2_driver_testbench_counter_delta;
	wire [0:0] row_pusher_2_counter_pop_ready;
	assign row_pusher_2_driver_testbench_counter_delta_ready = row_pusher_2_counter_pop_ready;
	wire [0:0] row_pusher_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_2_counter_delta),
		.delta_ready(row_pusher_2_counter_delta_ready),
		.pop_valid(row_pusher_2_counter_pop_valid),
		.pop_ready(row_pusher_2_counter_pop_ready)
	);
	wire [7:0] pe_8_8_driver_pe_8_7_counter_delta;
	wire [0:0] pe_8_8_driver_pe_8_7_counter_delta_ready;
	wire [0:0] pe_8_8_counter_delta_ready;
	wire [7:0] pe_8_8_counter_delta;
	assign pe_8_8_counter_delta = pe_8_8_driver_pe_8_7_counter_delta;
	wire [0:0] pe_8_8_counter_pop_ready;
	assign pe_8_8_driver_pe_8_7_counter_delta_ready = pe_8_8_counter_pop_ready;
	wire [0:0] pe_8_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_8_counter_delta),
		.delta_ready(pe_8_8_counter_delta_ready),
		.pop_valid(pe_8_8_counter_pop_valid),
		.pop_ready(pe_8_8_counter_pop_ready)
	);
	wire [7:0] sink_686ed_driver_pe_6_8_counter_delta;
	wire [0:0] sink_686ed_driver_pe_6_8_counter_delta_ready;
	wire [0:0] sink_686ed_counter_delta_ready;
	wire [7:0] sink_686ed_counter_delta;
	assign sink_686ed_counter_delta = sink_686ed_driver_pe_6_8_counter_delta;
	wire [0:0] sink_686ed_counter_pop_ready;
	assign sink_686ed_driver_pe_6_8_counter_delta_ready = sink_686ed_counter_pop_ready;
	wire [0:0] sink_686ed_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_686ed_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_686ed_counter_delta),
		.delta_ready(sink_686ed_counter_delta_ready),
		.pop_valid(sink_686ed_counter_pop_valid),
		.pop_ready(sink_686ed_counter_pop_ready)
	);
	wire [7:0] pe_3_1_driver_pe_2_1_counter_delta;
	wire [0:0] pe_3_1_driver_pe_2_1_counter_delta_ready;
	wire [0:0] pe_3_1_counter_delta_ready;
	wire [7:0] pe_3_1_counter_delta;
	assign pe_3_1_counter_delta = pe_3_1_driver_pe_2_1_counter_delta;
	wire [0:0] pe_3_1_counter_pop_ready;
	assign pe_3_1_driver_pe_2_1_counter_delta_ready = pe_3_1_counter_pop_ready;
	wire [0:0] pe_3_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_1_counter_delta),
		.delta_ready(pe_3_1_counter_delta_ready),
		.pop_valid(pe_3_1_counter_pop_valid),
		.pop_ready(pe_3_1_counter_pop_ready)
	);
	wire [7:0] pe_6_2_driver_pe_6_1_counter_delta;
	wire [0:0] pe_6_2_driver_pe_6_1_counter_delta_ready;
	wire [0:0] pe_6_2_counter_delta_ready;
	wire [7:0] pe_6_2_counter_delta;
	assign pe_6_2_counter_delta = pe_6_2_driver_pe_6_1_counter_delta;
	wire [0:0] pe_6_2_counter_pop_ready;
	assign pe_6_2_driver_pe_6_1_counter_delta_ready = pe_6_2_counter_pop_ready;
	wire [0:0] pe_6_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_2_counter_delta),
		.delta_ready(pe_6_2_counter_delta_ready),
		.pop_valid(pe_6_2_counter_pop_valid),
		.pop_ready(pe_6_2_counter_pop_ready)
	);
	wire [7:0] row_pusher_7_driver_testbench_counter_delta;
	wire [0:0] row_pusher_7_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_7_counter_delta_ready;
	wire [7:0] row_pusher_7_counter_delta;
	assign row_pusher_7_counter_delta = row_pusher_7_driver_testbench_counter_delta;
	wire [0:0] row_pusher_7_counter_pop_ready;
	assign row_pusher_7_driver_testbench_counter_delta_ready = row_pusher_7_counter_pop_ready;
	wire [0:0] row_pusher_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_7_counter_delta),
		.delta_ready(row_pusher_7_counter_delta_ready),
		.pop_valid(row_pusher_7_counter_pop_valid),
		.pop_ready(row_pusher_7_counter_pop_ready)
	);
	wire [7:0] pe_1_7_driver_pe_1_6_counter_delta;
	wire [0:0] pe_1_7_driver_pe_1_6_counter_delta_ready;
	wire [0:0] pe_1_7_counter_delta_ready;
	wire [7:0] pe_1_7_counter_delta;
	assign pe_1_7_counter_delta = pe_1_7_driver_pe_1_6_counter_delta;
	wire [0:0] pe_1_7_counter_pop_ready;
	assign pe_1_7_driver_pe_1_6_counter_delta_ready = pe_1_7_counter_pop_ready;
	wire [0:0] pe_1_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_7_counter_delta),
		.delta_ready(pe_1_7_counter_delta_ready),
		.pop_valid(pe_1_7_counter_pop_valid),
		.pop_ready(pe_1_7_counter_pop_ready)
	);
	wire [7:0] pe_2_2_driver_pe_2_1_counter_delta;
	wire [0:0] pe_2_2_driver_pe_2_1_counter_delta_ready;
	wire [0:0] pe_2_2_counter_delta_ready;
	wire [7:0] pe_2_2_counter_delta;
	assign pe_2_2_counter_delta = pe_2_2_driver_pe_2_1_counter_delta;
	wire [0:0] pe_2_2_counter_pop_ready;
	assign pe_2_2_driver_pe_2_1_counter_delta_ready = pe_2_2_counter_pop_ready;
	wire [0:0] pe_2_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_2_counter_delta),
		.delta_ready(pe_2_2_counter_delta_ready),
		.pop_valid(pe_2_2_counter_pop_valid),
		.pop_ready(pe_2_2_counter_pop_ready)
	);
	wire [0:0] testbench_counter_delta_ready;
	wire [7:0] testbench_counter_delta;
	wire [0:0] testbench_counter_pop_ready;
	wire [0:0] testbench_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) testbench_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(testbench_counter_delta),
		.delta_ready(testbench_counter_delta_ready),
		.pop_valid(testbench_counter_pop_valid),
		.pop_ready(testbench_counter_pop_ready)
	);
	wire [7:0] pe_5_4_driver_pe_5_3_counter_delta;
	wire [0:0] pe_5_4_driver_pe_5_3_counter_delta_ready;
	wire [0:0] pe_5_4_counter_delta_ready;
	wire [7:0] pe_5_4_counter_delta;
	assign pe_5_4_counter_delta = pe_5_4_driver_pe_5_3_counter_delta;
	wire [0:0] pe_5_4_counter_pop_ready;
	assign pe_5_4_driver_pe_5_3_counter_delta_ready = pe_5_4_counter_pop_ready;
	wire [0:0] pe_5_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_4_counter_delta),
		.delta_ready(pe_5_4_counter_delta_ready),
		.pop_valid(pe_5_4_counter_pop_valid),
		.pop_ready(pe_5_4_counter_pop_ready)
	);
	wire [7:0] pe_7_7_driver_pe_7_6_counter_delta;
	wire [0:0] pe_7_7_driver_pe_7_6_counter_delta_ready;
	wire [0:0] pe_7_7_counter_delta_ready;
	wire [7:0] pe_7_7_counter_delta;
	assign pe_7_7_counter_delta = pe_7_7_driver_pe_7_6_counter_delta;
	wire [0:0] pe_7_7_counter_pop_ready;
	assign pe_7_7_driver_pe_7_6_counter_delta_ready = pe_7_7_counter_pop_ready;
	wire [0:0] pe_7_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_7_counter_delta),
		.delta_ready(pe_7_7_counter_delta_ready),
		.pop_valid(pe_7_7_counter_pop_valid),
		.pop_ready(pe_7_7_counter_pop_ready)
	);
	wire [7:0] sink_68689_driver_pe_8_3_counter_delta;
	wire [0:0] sink_68689_driver_pe_8_3_counter_delta_ready;
	wire [0:0] sink_68689_counter_delta_ready;
	wire [7:0] sink_68689_counter_delta;
	assign sink_68689_counter_delta = sink_68689_driver_pe_8_3_counter_delta;
	wire [0:0] sink_68689_counter_pop_ready;
	assign sink_68689_driver_pe_8_3_counter_delta_ready = sink_68689_counter_pop_ready;
	wire [0:0] sink_68689_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_68689_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_68689_counter_delta),
		.delta_ready(sink_68689_counter_delta_ready),
		.pop_valid(sink_68689_counter_pop_valid),
		.pop_ready(sink_68689_counter_pop_ready)
	);
	wire [7:0] pe_3_8_driver_pe_3_7_counter_delta;
	wire [0:0] pe_3_8_driver_pe_3_7_counter_delta_ready;
	wire [0:0] pe_3_8_counter_delta_ready;
	wire [7:0] pe_3_8_counter_delta;
	assign pe_3_8_counter_delta = pe_3_8_driver_pe_3_7_counter_delta;
	wire [0:0] pe_3_8_counter_pop_ready;
	assign pe_3_8_driver_pe_3_7_counter_delta_ready = pe_3_8_counter_pop_ready;
	wire [0:0] pe_3_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_8_counter_delta),
		.delta_ready(pe_3_8_counter_delta_ready),
		.pop_valid(pe_3_8_counter_pop_valid),
		.pop_ready(pe_3_8_counter_pop_ready)
	);
	wire [7:0] pe_2_1_driver_pe_1_1_counter_delta;
	wire [0:0] pe_2_1_driver_pe_1_1_counter_delta_ready;
	wire [0:0] pe_2_1_counter_delta_ready;
	wire [7:0] pe_2_1_counter_delta;
	assign pe_2_1_counter_delta = pe_2_1_driver_pe_1_1_counter_delta;
	wire [0:0] pe_2_1_counter_pop_ready;
	assign pe_2_1_driver_pe_1_1_counter_delta_ready = pe_2_1_counter_pop_ready;
	wire [0:0] pe_2_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_1_counter_delta),
		.delta_ready(pe_2_1_counter_delta_ready),
		.pop_valid(pe_2_1_counter_pop_valid),
		.pop_ready(pe_2_1_counter_pop_ready)
	);
	wire [7:0] pe_7_8_driver_pe_7_7_counter_delta;
	wire [0:0] pe_7_8_driver_pe_7_7_counter_delta_ready;
	wire [0:0] pe_7_8_counter_delta_ready;
	wire [7:0] pe_7_8_counter_delta;
	assign pe_7_8_counter_delta = pe_7_8_driver_pe_7_7_counter_delta;
	wire [0:0] pe_7_8_counter_pop_ready;
	assign pe_7_8_driver_pe_7_7_counter_delta_ready = pe_7_8_counter_pop_ready;
	wire [0:0] pe_7_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_8_counter_delta),
		.delta_ready(pe_7_8_counter_delta_ready),
		.pop_valid(pe_7_8_counter_pop_valid),
		.pop_ready(pe_7_8_counter_pop_ready)
	);
	wire [7:0] sink_68731_driver_pe_4_8_counter_delta;
	wire [0:0] sink_68731_driver_pe_4_8_counter_delta_ready;
	wire [0:0] sink_68731_counter_delta_ready;
	wire [7:0] sink_68731_counter_delta;
	assign sink_68731_counter_delta = sink_68731_driver_pe_4_8_counter_delta;
	wire [0:0] sink_68731_counter_pop_ready;
	assign sink_68731_driver_pe_4_8_counter_delta_ready = sink_68731_counter_pop_ready;
	wire [0:0] sink_68731_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_68731_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_68731_counter_delta),
		.delta_ready(sink_68731_counter_delta_ready),
		.pop_valid(sink_68731_counter_pop_valid),
		.pop_ready(sink_68731_counter_pop_ready)
	);
	wire [7:0] col_pusher_7_driver_testbench_counter_delta;
	wire [0:0] col_pusher_7_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_7_counter_delta_ready;
	wire [7:0] col_pusher_7_counter_delta;
	assign col_pusher_7_counter_delta = col_pusher_7_driver_testbench_counter_delta;
	wire [0:0] col_pusher_7_counter_pop_ready;
	assign col_pusher_7_driver_testbench_counter_delta_ready = col_pusher_7_counter_pop_ready;
	wire [0:0] col_pusher_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_7_counter_delta),
		.delta_ready(col_pusher_7_counter_delta_ready),
		.pop_valid(col_pusher_7_counter_pop_valid),
		.pop_ready(col_pusher_7_counter_pop_ready)
	);
	wire [7:0] pe_5_8_driver_pe_5_7_counter_delta;
	wire [0:0] pe_5_8_driver_pe_5_7_counter_delta_ready;
	wire [0:0] pe_5_8_counter_delta_ready;
	wire [7:0] pe_5_8_counter_delta;
	assign pe_5_8_counter_delta = pe_5_8_driver_pe_5_7_counter_delta;
	wire [0:0] pe_5_8_counter_pop_ready;
	assign pe_5_8_driver_pe_5_7_counter_delta_ready = pe_5_8_counter_pop_ready;
	wire [0:0] pe_5_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_8_counter_delta),
		.delta_ready(pe_5_8_counter_delta_ready),
		.pop_valid(pe_5_8_counter_pop_valid),
		.pop_ready(pe_5_8_counter_pop_ready)
	);
	wire [7:0] col_pusher_8_driver_testbench_counter_delta;
	wire [0:0] col_pusher_8_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_8_counter_delta_ready;
	wire [7:0] col_pusher_8_counter_delta;
	assign col_pusher_8_counter_delta = col_pusher_8_driver_testbench_counter_delta;
	wire [0:0] col_pusher_8_counter_pop_ready;
	assign col_pusher_8_driver_testbench_counter_delta_ready = col_pusher_8_counter_pop_ready;
	wire [0:0] col_pusher_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_8_counter_delta),
		.delta_ready(col_pusher_8_counter_delta_ready),
		.pop_valid(col_pusher_8_counter_pop_valid),
		.pop_ready(col_pusher_8_counter_pop_ready)
	);
	wire [7:0] sink_685a1_driver_pe_8_2_counter_delta;
	wire [0:0] sink_685a1_driver_pe_8_2_counter_delta_ready;
	wire [0:0] sink_685a1_counter_delta_ready;
	wire [7:0] sink_685a1_counter_delta;
	assign sink_685a1_counter_delta = sink_685a1_driver_pe_8_2_counter_delta;
	wire [0:0] sink_685a1_counter_pop_ready;
	assign sink_685a1_driver_pe_8_2_counter_delta_ready = sink_685a1_counter_pop_ready;
	wire [0:0] sink_685a1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_685a1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_685a1_counter_delta),
		.delta_ready(sink_685a1_counter_delta_ready),
		.pop_valid(sink_685a1_counter_pop_valid),
		.pop_ready(sink_685a1_counter_pop_ready)
	);
	wire [7:0] pe_8_1_driver_pe_7_1_counter_delta;
	wire [0:0] pe_8_1_driver_pe_7_1_counter_delta_ready;
	wire [0:0] pe_8_1_counter_delta_ready;
	wire [7:0] pe_8_1_counter_delta;
	assign pe_8_1_counter_delta = pe_8_1_driver_pe_7_1_counter_delta;
	wire [0:0] pe_8_1_counter_pop_ready;
	assign pe_8_1_driver_pe_7_1_counter_delta_ready = pe_8_1_counter_pop_ready;
	wire [0:0] pe_8_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_1_counter_delta),
		.delta_ready(pe_8_1_counter_delta_ready),
		.pop_valid(pe_8_1_counter_pop_valid),
		.pop_ready(pe_8_1_counter_pop_ready)
	);
	wire [7:0] row_pusher_8_driver_testbench_counter_delta;
	wire [0:0] row_pusher_8_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_8_counter_delta_ready;
	wire [7:0] row_pusher_8_counter_delta;
	assign row_pusher_8_counter_delta = row_pusher_8_driver_testbench_counter_delta;
	wire [0:0] row_pusher_8_counter_pop_ready;
	assign row_pusher_8_driver_testbench_counter_delta_ready = row_pusher_8_counter_pop_ready;
	wire [0:0] row_pusher_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_8_counter_delta),
		.delta_ready(row_pusher_8_counter_delta_ready),
		.pop_valid(row_pusher_8_counter_pop_valid),
		.pop_ready(row_pusher_8_counter_pop_ready)
	);
	wire [7:0] sink_68561_driver_pe_2_8_counter_delta;
	wire [0:0] sink_68561_driver_pe_2_8_counter_delta_ready;
	wire [0:0] sink_68561_counter_delta_ready;
	wire [7:0] sink_68561_counter_delta;
	assign sink_68561_counter_delta = sink_68561_driver_pe_2_8_counter_delta;
	wire [0:0] sink_68561_counter_pop_ready;
	assign sink_68561_driver_pe_2_8_counter_delta_ready = sink_68561_counter_pop_ready;
	wire [0:0] sink_68561_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_68561_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_68561_counter_delta),
		.delta_ready(sink_68561_counter_delta_ready),
		.pop_valid(sink_68561_counter_pop_valid),
		.pop_ready(sink_68561_counter_pop_ready)
	);
	wire [7:0] pe_7_3_driver_pe_7_2_counter_delta;
	wire [0:0] pe_7_3_driver_pe_7_2_counter_delta_ready;
	wire [0:0] pe_7_3_counter_delta_ready;
	wire [7:0] pe_7_3_counter_delta;
	assign pe_7_3_counter_delta = pe_7_3_driver_pe_7_2_counter_delta;
	wire [0:0] pe_7_3_counter_pop_ready;
	assign pe_7_3_driver_pe_7_2_counter_delta_ready = pe_7_3_counter_pop_ready;
	wire [0:0] pe_7_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_3_counter_delta),
		.delta_ready(pe_7_3_counter_delta_ready),
		.pop_valid(pe_7_3_counter_pop_valid),
		.pop_ready(pe_7_3_counter_pop_ready)
	);
	wire [7:0] pe_3_6_driver_pe_3_5_counter_delta;
	wire [0:0] pe_3_6_driver_pe_3_5_counter_delta_ready;
	wire [0:0] pe_3_6_counter_delta_ready;
	wire [7:0] pe_3_6_counter_delta;
	assign pe_3_6_counter_delta = pe_3_6_driver_pe_3_5_counter_delta;
	wire [0:0] pe_3_6_counter_pop_ready;
	assign pe_3_6_driver_pe_3_5_counter_delta_ready = pe_3_6_counter_pop_ready;
	wire [0:0] pe_3_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_6_counter_delta),
		.delta_ready(pe_3_6_counter_delta_ready),
		.pop_valid(pe_3_6_counter_pop_valid),
		.pop_ready(pe_3_6_counter_pop_ready)
	);
	wire [7:0] col_pusher_3_driver_testbench_counter_delta;
	wire [0:0] col_pusher_3_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_3_counter_delta_ready;
	wire [7:0] col_pusher_3_counter_delta;
	assign col_pusher_3_counter_delta = col_pusher_3_driver_testbench_counter_delta;
	wire [0:0] col_pusher_3_counter_pop_ready;
	assign col_pusher_3_driver_testbench_counter_delta_ready = col_pusher_3_counter_pop_ready;
	wire [0:0] col_pusher_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_3_counter_delta),
		.delta_ready(col_pusher_3_counter_delta_ready),
		.pop_valid(col_pusher_3_counter_pop_valid),
		.pop_ready(col_pusher_3_counter_pop_ready)
	);
	wire [7:0] col_pusher_5_driver_testbench_counter_delta;
	wire [0:0] col_pusher_5_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_5_counter_delta_ready;
	wire [7:0] col_pusher_5_counter_delta;
	assign col_pusher_5_counter_delta = col_pusher_5_driver_testbench_counter_delta;
	wire [0:0] col_pusher_5_counter_pop_ready;
	assign col_pusher_5_driver_testbench_counter_delta_ready = col_pusher_5_counter_pop_ready;
	wire [0:0] col_pusher_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_5_counter_delta),
		.delta_ready(col_pusher_5_counter_delta_ready),
		.pop_valid(col_pusher_5_counter_pop_valid),
		.pop_ready(col_pusher_5_counter_pop_ready)
	);
	wire [7:0] sink_68445_driver_pe_1_8_counter_delta;
	wire [0:0] sink_68445_driver_pe_1_8_counter_delta_ready;
	wire [0:0] sink_68445_counter_delta_ready;
	wire [7:0] sink_68445_counter_delta;
	assign sink_68445_counter_delta = sink_68445_driver_pe_1_8_counter_delta;
	wire [0:0] sink_68445_counter_pop_ready;
	assign sink_68445_driver_pe_1_8_counter_delta_ready = sink_68445_counter_pop_ready;
	wire [0:0] sink_68445_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_68445_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_68445_counter_delta),
		.delta_ready(sink_68445_counter_delta_ready),
		.pop_valid(sink_68445_counter_pop_valid),
		.pop_ready(sink_68445_counter_pop_ready)
	);
	wire [7:0] pe_1_4_driver_pe_1_3_counter_delta;
	wire [0:0] pe_1_4_driver_pe_1_3_counter_delta_ready;
	wire [0:0] pe_1_4_counter_delta_ready;
	wire [7:0] pe_1_4_counter_delta;
	assign pe_1_4_counter_delta = pe_1_4_driver_pe_1_3_counter_delta;
	wire [0:0] pe_1_4_counter_pop_ready;
	assign pe_1_4_driver_pe_1_3_counter_delta_ready = pe_1_4_counter_pop_ready;
	wire [0:0] pe_1_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_4_counter_delta),
		.delta_ready(pe_1_4_counter_delta_ready),
		.pop_valid(pe_1_4_counter_pop_valid),
		.pop_ready(pe_1_4_counter_pop_ready)
	);
	wire [7:0] sink_69e91_driver_pe_8_8_counter_delta;
	wire [0:0] sink_69e91_driver_pe_8_8_counter_delta_ready;
	wire [0:0] sink_69e91_counter_delta_ready;
	wire [7:0] sink_69e91_counter_delta;
	assign sink_69e91_counter_delta = sink_69e91_driver_pe_8_8_counter_delta;
	wire [0:0] sink_69e91_counter_pop_ready;
	assign sink_69e91_driver_pe_8_8_counter_delta_ready = sink_69e91_counter_pop_ready;
	wire [0:0] sink_69e91_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_69e91_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_69e91_counter_delta),
		.delta_ready(sink_69e91_counter_delta_ready),
		.pop_valid(sink_69e91_counter_pop_valid),
		.pop_ready(sink_69e91_counter_pop_ready)
	);
	wire [7:0] pe_2_6_driver_pe_2_5_counter_delta;
	wire [0:0] pe_2_6_driver_pe_2_5_counter_delta_ready;
	wire [0:0] pe_2_6_counter_delta_ready;
	wire [7:0] pe_2_6_counter_delta;
	assign pe_2_6_counter_delta = pe_2_6_driver_pe_2_5_counter_delta;
	wire [0:0] pe_2_6_counter_pop_ready;
	assign pe_2_6_driver_pe_2_5_counter_delta_ready = pe_2_6_counter_pop_ready;
	wire [0:0] pe_2_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_6_counter_delta),
		.delta_ready(pe_2_6_counter_delta_ready),
		.pop_valid(pe_2_6_counter_pop_valid),
		.pop_ready(pe_2_6_counter_pop_ready)
	);
	wire [7:0] pe_1_2_driver_pe_1_1_counter_delta;
	wire [0:0] pe_1_2_driver_pe_1_1_counter_delta_ready;
	wire [0:0] pe_1_2_counter_delta_ready;
	wire [7:0] pe_1_2_counter_delta;
	assign pe_1_2_counter_delta = pe_1_2_driver_pe_1_1_counter_delta;
	wire [0:0] pe_1_2_counter_pop_ready;
	assign pe_1_2_driver_pe_1_1_counter_delta_ready = pe_1_2_counter_pop_ready;
	wire [0:0] pe_1_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_2_counter_delta),
		.delta_ready(pe_1_2_counter_delta_ready),
		.pop_valid(pe_1_2_counter_pop_valid),
		.pop_ready(pe_1_2_counter_pop_ready)
	);
	wire [7:0] pe_4_6_driver_pe_4_5_counter_delta;
	wire [0:0] pe_4_6_driver_pe_4_5_counter_delta_ready;
	wire [0:0] pe_4_6_counter_delta_ready;
	wire [7:0] pe_4_6_counter_delta;
	assign pe_4_6_counter_delta = pe_4_6_driver_pe_4_5_counter_delta;
	wire [0:0] pe_4_6_counter_pop_ready;
	assign pe_4_6_driver_pe_4_5_counter_delta_ready = pe_4_6_counter_pop_ready;
	wire [0:0] pe_4_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_6_counter_delta),
		.delta_ready(pe_4_6_counter_delta_ready),
		.pop_valid(pe_4_6_counter_pop_valid),
		.pop_ready(pe_4_6_counter_pop_ready)
	);
	wire [7:0] pe_7_4_driver_pe_7_3_counter_delta;
	wire [0:0] pe_7_4_driver_pe_7_3_counter_delta_ready;
	wire [0:0] pe_7_4_counter_delta_ready;
	wire [7:0] pe_7_4_counter_delta;
	assign pe_7_4_counter_delta = pe_7_4_driver_pe_7_3_counter_delta;
	wire [0:0] pe_7_4_counter_pop_ready;
	assign pe_7_4_driver_pe_7_3_counter_delta_ready = pe_7_4_counter_pop_ready;
	wire [0:0] pe_7_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_4_counter_delta),
		.delta_ready(pe_7_4_counter_delta_ready),
		.pop_valid(pe_7_4_counter_pop_valid),
		.pop_ready(pe_7_4_counter_pop_ready)
	);
	wire [7:0] pe_6_8_driver_pe_6_7_counter_delta;
	wire [0:0] pe_6_8_driver_pe_6_7_counter_delta_ready;
	wire [0:0] pe_6_8_counter_delta_ready;
	wire [7:0] pe_6_8_counter_delta;
	assign pe_6_8_counter_delta = pe_6_8_driver_pe_6_7_counter_delta;
	wire [0:0] pe_6_8_counter_pop_ready;
	assign pe_6_8_driver_pe_6_7_counter_delta_ready = pe_6_8_counter_pop_ready;
	wire [0:0] pe_6_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_8_counter_delta),
		.delta_ready(pe_6_8_counter_delta_ready),
		.pop_valid(pe_6_8_counter_pop_valid),
		.pop_ready(pe_6_8_counter_pop_ready)
	);
	wire [7:0] sink_69d89_driver_pe_7_8_counter_delta;
	wire [0:0] sink_69d89_driver_pe_7_8_counter_delta_ready;
	wire [0:0] sink_69d89_counter_delta_ready;
	wire [7:0] sink_69d89_counter_delta;
	assign sink_69d89_counter_delta = sink_69d89_driver_pe_7_8_counter_delta;
	wire [0:0] sink_69d89_counter_pop_ready;
	assign sink_69d89_driver_pe_7_8_counter_delta_ready = sink_69d89_counter_pop_ready;
	wire [0:0] sink_69d89_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_69d89_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_69d89_counter_delta),
		.delta_ready(sink_69d89_counter_delta_ready),
		.pop_valid(sink_69d89_counter_pop_valid),
		.pop_ready(sink_69d89_counter_pop_ready)
	);
	wire [7:0] pe_4_5_driver_pe_4_4_counter_delta;
	wire [0:0] pe_4_5_driver_pe_4_4_counter_delta_ready;
	wire [0:0] pe_4_5_counter_delta_ready;
	wire [7:0] pe_4_5_counter_delta;
	assign pe_4_5_counter_delta = pe_4_5_driver_pe_4_4_counter_delta;
	wire [0:0] pe_4_5_counter_pop_ready;
	assign pe_4_5_driver_pe_4_4_counter_delta_ready = pe_4_5_counter_pop_ready;
	wire [0:0] pe_4_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_4_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_4_5_counter_delta),
		.delta_ready(pe_4_5_counter_delta_ready),
		.pop_valid(pe_4_5_counter_pop_valid),
		.pop_ready(pe_4_5_counter_pop_ready)
	);
	wire [7:0] pe_6_3_driver_pe_6_2_counter_delta;
	wire [0:0] pe_6_3_driver_pe_6_2_counter_delta_ready;
	wire [0:0] pe_6_3_counter_delta_ready;
	wire [7:0] pe_6_3_counter_delta;
	assign pe_6_3_counter_delta = pe_6_3_driver_pe_6_2_counter_delta;
	wire [0:0] pe_6_3_counter_pop_ready;
	assign pe_6_3_driver_pe_6_2_counter_delta_ready = pe_6_3_counter_pop_ready;
	wire [0:0] pe_6_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_3_counter_delta),
		.delta_ready(pe_6_3_counter_delta_ready),
		.pop_valid(pe_6_3_counter_pop_valid),
		.pop_ready(pe_6_3_counter_pop_ready)
	);
	wire [7:0] col_pusher_6_driver_testbench_counter_delta;
	wire [0:0] col_pusher_6_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_6_counter_delta_ready;
	wire [7:0] col_pusher_6_counter_delta;
	assign col_pusher_6_counter_delta = col_pusher_6_driver_testbench_counter_delta;
	wire [0:0] col_pusher_6_counter_pop_ready;
	assign col_pusher_6_driver_testbench_counter_delta_ready = col_pusher_6_counter_pop_ready;
	wire [0:0] col_pusher_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_6_counter_delta),
		.delta_ready(col_pusher_6_counter_delta_ready),
		.pop_valid(col_pusher_6_counter_pop_valid),
		.pop_ready(col_pusher_6_counter_pop_ready)
	);
	wire [7:0] pe_1_3_driver_pe_1_2_counter_delta;
	wire [0:0] pe_1_3_driver_pe_1_2_counter_delta_ready;
	wire [0:0] pe_1_3_counter_delta_ready;
	wire [7:0] pe_1_3_counter_delta;
	assign pe_1_3_counter_delta = pe_1_3_driver_pe_1_2_counter_delta;
	wire [0:0] pe_1_3_counter_pop_ready;
	assign pe_1_3_driver_pe_1_2_counter_delta_ready = pe_1_3_counter_pop_ready;
	wire [0:0] pe_1_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_3_counter_delta),
		.delta_ready(pe_1_3_counter_delta_ready),
		.pop_valid(pe_1_3_counter_pop_valid),
		.pop_ready(pe_1_3_counter_pop_ready)
	);
	wire [7:0] row_pusher_3_driver_testbench_counter_delta;
	wire [0:0] row_pusher_3_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_3_counter_delta_ready;
	wire [7:0] row_pusher_3_counter_delta;
	assign row_pusher_3_counter_delta = row_pusher_3_driver_testbench_counter_delta;
	wire [0:0] row_pusher_3_counter_pop_ready;
	assign row_pusher_3_driver_testbench_counter_delta_ready = row_pusher_3_counter_pop_ready;
	wire [0:0] row_pusher_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_3_counter_delta),
		.delta_ready(row_pusher_3_counter_delta_ready),
		.pop_valid(row_pusher_3_counter_pop_valid),
		.pop_ready(row_pusher_3_counter_pop_ready)
	);
	wire [7:0] pe_5_5_driver_pe_5_4_counter_delta;
	wire [0:0] pe_5_5_driver_pe_5_4_counter_delta_ready;
	wire [0:0] pe_5_5_counter_delta_ready;
	wire [7:0] pe_5_5_counter_delta;
	assign pe_5_5_counter_delta = pe_5_5_driver_pe_5_4_counter_delta;
	wire [0:0] pe_5_5_counter_pop_ready;
	assign pe_5_5_driver_pe_5_4_counter_delta_ready = pe_5_5_counter_pop_ready;
	wire [0:0] pe_5_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_5_counter_delta),
		.delta_ready(pe_5_5_counter_delta_ready),
		.pop_valid(pe_5_5_counter_pop_valid),
		.pop_ready(pe_5_5_counter_pop_ready)
	);
	wire [7:0] pe_6_7_driver_pe_6_6_counter_delta;
	wire [0:0] pe_6_7_driver_pe_6_6_counter_delta_ready;
	wire [0:0] pe_6_7_counter_delta_ready;
	wire [7:0] pe_6_7_counter_delta;
	assign pe_6_7_counter_delta = pe_6_7_driver_pe_6_6_counter_delta;
	wire [0:0] pe_6_7_counter_pop_ready;
	assign pe_6_7_driver_pe_6_6_counter_delta_ready = pe_6_7_counter_pop_ready;
	wire [0:0] pe_6_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_7_counter_delta),
		.delta_ready(pe_6_7_counter_delta_ready),
		.pop_valid(pe_6_7_counter_pop_valid),
		.pop_ready(pe_6_7_counter_pop_ready)
	);
	wire [7:0] sink_68771_driver_pe_8_4_counter_delta;
	wire [0:0] sink_68771_driver_pe_8_4_counter_delta_ready;
	wire [0:0] sink_68771_counter_delta_ready;
	wire [7:0] sink_68771_counter_delta;
	assign sink_68771_counter_delta = sink_68771_driver_pe_8_4_counter_delta;
	wire [0:0] sink_68771_counter_pop_ready;
	assign sink_68771_driver_pe_8_4_counter_delta_ready = sink_68771_counter_pop_ready;
	wire [0:0] sink_68771_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_68771_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_68771_counter_delta),
		.delta_ready(sink_68771_counter_delta_ready),
		.pop_valid(sink_68771_counter_pop_valid),
		.pop_ready(sink_68771_counter_pop_ready)
	);
	wire [7:0] row_pusher_6_driver_testbench_counter_delta;
	wire [0:0] row_pusher_6_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_6_counter_delta_ready;
	wire [7:0] row_pusher_6_counter_delta;
	assign row_pusher_6_counter_delta = row_pusher_6_driver_testbench_counter_delta;
	wire [0:0] row_pusher_6_counter_pop_ready;
	assign row_pusher_6_driver_testbench_counter_delta_ready = row_pusher_6_counter_pop_ready;
	wire [0:0] row_pusher_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_6_counter_delta),
		.delta_ready(row_pusher_6_counter_delta_ready),
		.pop_valid(row_pusher_6_counter_pop_valid),
		.pop_ready(row_pusher_6_counter_pop_ready)
	);
	wire [7:0] pe_7_5_driver_pe_7_4_counter_delta;
	wire [0:0] pe_7_5_driver_pe_7_4_counter_delta_ready;
	wire [0:0] pe_7_5_counter_delta_ready;
	wire [7:0] pe_7_5_counter_delta;
	assign pe_7_5_counter_delta = pe_7_5_driver_pe_7_4_counter_delta;
	wire [0:0] pe_7_5_counter_pop_ready;
	assign pe_7_5_driver_pe_7_4_counter_delta_ready = pe_7_5_counter_pop_ready;
	wire [0:0] pe_7_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_5_counter_delta),
		.delta_ready(pe_7_5_counter_delta_ready),
		.pop_valid(pe_7_5_counter_pop_valid),
		.pop_ready(pe_7_5_counter_pop_ready)
	);
	wire [7:0] pe_8_3_driver_pe_8_2_counter_delta;
	wire [0:0] pe_8_3_driver_pe_8_2_counter_delta_ready;
	wire [0:0] pe_8_3_counter_delta_ready;
	wire [7:0] pe_8_3_counter_delta;
	assign pe_8_3_counter_delta = pe_8_3_driver_pe_8_2_counter_delta;
	wire [0:0] pe_8_3_counter_pop_ready;
	assign pe_8_3_driver_pe_8_2_counter_delta_ready = pe_8_3_counter_pop_ready;
	wire [0:0] pe_8_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_3_counter_delta),
		.delta_ready(pe_8_3_counter_delta_ready),
		.pop_valid(pe_8_3_counter_pop_valid),
		.pop_ready(pe_8_3_counter_pop_ready)
	);
	wire [7:0] pe_3_2_driver_pe_3_1_counter_delta;
	wire [0:0] pe_3_2_driver_pe_3_1_counter_delta_ready;
	wire [0:0] pe_3_2_counter_delta_ready;
	wire [7:0] pe_3_2_counter_delta;
	assign pe_3_2_counter_delta = pe_3_2_driver_pe_3_1_counter_delta;
	wire [0:0] pe_3_2_counter_pop_ready;
	assign pe_3_2_driver_pe_3_1_counter_delta_ready = pe_3_2_counter_pop_ready;
	wire [0:0] pe_3_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_2_counter_delta),
		.delta_ready(pe_3_2_counter_delta_ready),
		.pop_valid(pe_3_2_counter_pop_valid),
		.pop_ready(pe_3_2_counter_pop_ready)
	);
	wire [7:0] row_pusher_5_driver_testbench_counter_delta;
	wire [0:0] row_pusher_5_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_5_counter_delta_ready;
	wire [7:0] row_pusher_5_counter_delta;
	assign row_pusher_5_counter_delta = row_pusher_5_driver_testbench_counter_delta;
	wire [0:0] row_pusher_5_counter_pop_ready;
	assign row_pusher_5_driver_testbench_counter_delta_ready = row_pusher_5_counter_pop_ready;
	wire [0:0] row_pusher_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_5_counter_delta),
		.delta_ready(row_pusher_5_counter_delta_ready),
		.pop_valid(row_pusher_5_counter_pop_valid),
		.pop_ready(row_pusher_5_counter_pop_ready)
	);
	wire [7:0] pe_1_1_driver_col_pusher_1_counter_delta;
	wire [0:0] pe_1_1_driver_col_pusher_1_counter_delta_ready;
	wire [0:0] pe_1_1_counter_delta_ready;
	wire [7:0] pe_1_1_counter_delta;
	assign pe_1_1_counter_delta = pe_1_1_driver_col_pusher_1_counter_delta;
	wire [0:0] pe_1_1_counter_pop_ready;
	assign pe_1_1_driver_col_pusher_1_counter_delta_ready = pe_1_1_counter_pop_ready;
	wire [0:0] pe_1_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_1_counter_delta),
		.delta_ready(pe_1_1_counter_delta_ready),
		.pop_valid(pe_1_1_counter_pop_valid),
		.pop_ready(pe_1_1_counter_pop_ready)
	);
	wire [7:0] row_pusher_1_driver_testbench_counter_delta;
	wire [0:0] row_pusher_1_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_1_counter_delta_ready;
	wire [7:0] row_pusher_1_counter_delta;
	assign row_pusher_1_counter_delta = row_pusher_1_driver_testbench_counter_delta;
	wire [0:0] row_pusher_1_counter_pop_ready;
	assign row_pusher_1_driver_testbench_counter_delta_ready = row_pusher_1_counter_pop_ready;
	wire [0:0] row_pusher_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_1_counter_delta),
		.delta_ready(row_pusher_1_counter_delta_ready),
		.pop_valid(row_pusher_1_counter_pop_valid),
		.pop_ready(row_pusher_1_counter_pop_ready)
	);
	wire [7:0] pe_3_3_driver_pe_3_2_counter_delta;
	wire [0:0] pe_3_3_driver_pe_3_2_counter_delta_ready;
	wire [0:0] pe_3_3_counter_delta_ready;
	wire [7:0] pe_3_3_counter_delta;
	assign pe_3_3_counter_delta = pe_3_3_driver_pe_3_2_counter_delta;
	wire [0:0] pe_3_3_counter_pop_ready;
	assign pe_3_3_driver_pe_3_2_counter_delta_ready = pe_3_3_counter_pop_ready;
	wire [0:0] pe_3_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_3_counter_delta),
		.delta_ready(pe_3_3_counter_delta_ready),
		.pop_valid(pe_3_3_counter_pop_valid),
		.pop_ready(pe_3_3_counter_pop_ready)
	);
	wire [7:0] pe_8_5_driver_pe_8_4_counter_delta;
	wire [0:0] pe_8_5_driver_pe_8_4_counter_delta_ready;
	wire [0:0] pe_8_5_counter_delta_ready;
	wire [7:0] pe_8_5_counter_delta;
	assign pe_8_5_counter_delta = pe_8_5_driver_pe_8_4_counter_delta;
	wire [0:0] pe_8_5_counter_pop_ready;
	assign pe_8_5_driver_pe_8_4_counter_delta_ready = pe_8_5_counter_pop_ready;
	wire [0:0] pe_8_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_5_counter_delta),
		.delta_ready(pe_8_5_counter_delta_ready),
		.pop_valid(pe_8_5_counter_pop_valid),
		.pop_ready(pe_8_5_counter_pop_ready)
	);
	wire [7:0] pe_8_7_driver_pe_8_6_counter_delta;
	wire [0:0] pe_8_7_driver_pe_8_6_counter_delta_ready;
	wire [0:0] pe_8_7_counter_delta_ready;
	wire [7:0] pe_8_7_counter_delta;
	assign pe_8_7_counter_delta = pe_8_7_driver_pe_8_6_counter_delta;
	wire [0:0] pe_8_7_counter_pop_ready;
	assign pe_8_7_driver_pe_8_6_counter_delta_ready = pe_8_7_counter_pop_ready;
	wire [0:0] pe_8_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_7_counter_delta),
		.delta_ready(pe_8_7_counter_delta_ready),
		.pop_valid(pe_8_7_counter_pop_valid),
		.pop_ready(pe_8_7_counter_pop_ready)
	);
	wire [7:0] pe_8_2_driver_pe_8_1_counter_delta;
	wire [0:0] pe_8_2_driver_pe_8_1_counter_delta_ready;
	wire [0:0] pe_8_2_counter_delta_ready;
	wire [7:0] pe_8_2_counter_delta;
	assign pe_8_2_counter_delta = pe_8_2_driver_pe_8_1_counter_delta;
	wire [0:0] pe_8_2_counter_pop_ready;
	assign pe_8_2_driver_pe_8_1_counter_delta_ready = pe_8_2_counter_pop_ready;
	wire [0:0] pe_8_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_2_counter_delta),
		.delta_ready(pe_8_2_counter_delta_ready),
		.pop_valid(pe_8_2_counter_pop_valid),
		.pop_ready(pe_8_2_counter_pop_ready)
	);
	wire [7:0] pe_8_4_driver_pe_8_3_counter_delta;
	wire [0:0] pe_8_4_driver_pe_8_3_counter_delta_ready;
	wire [0:0] pe_8_4_counter_delta_ready;
	wire [7:0] pe_8_4_counter_delta;
	assign pe_8_4_counter_delta = pe_8_4_driver_pe_8_3_counter_delta;
	wire [0:0] pe_8_4_counter_pop_ready;
	assign pe_8_4_driver_pe_8_3_counter_delta_ready = pe_8_4_counter_pop_ready;
	wire [0:0] pe_8_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_8_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_8_4_counter_delta),
		.delta_ready(pe_8_4_counter_delta_ready),
		.pop_valid(pe_8_4_counter_pop_valid),
		.pop_ready(pe_8_4_counter_pop_ready)
	);
	wire [7:0] pe_2_4_driver_pe_2_3_counter_delta;
	wire [0:0] pe_2_4_driver_pe_2_3_counter_delta_ready;
	wire [0:0] pe_2_4_counter_delta_ready;
	wire [7:0] pe_2_4_counter_delta;
	assign pe_2_4_counter_delta = pe_2_4_driver_pe_2_3_counter_delta;
	wire [0:0] pe_2_4_counter_pop_ready;
	assign pe_2_4_driver_pe_2_3_counter_delta_ready = pe_2_4_counter_pop_ready;
	wire [0:0] pe_2_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_4_counter_delta),
		.delta_ready(pe_2_4_counter_delta_ready),
		.pop_valid(pe_2_4_counter_pop_valid),
		.pop_ready(pe_2_4_counter_pop_ready)
	);
	wire [7:0] pe_6_1_driver_pe_5_1_counter_delta;
	wire [0:0] pe_6_1_driver_pe_5_1_counter_delta_ready;
	wire [0:0] pe_6_1_counter_delta_ready;
	wire [7:0] pe_6_1_counter_delta;
	assign pe_6_1_counter_delta = pe_6_1_driver_pe_5_1_counter_delta;
	wire [0:0] pe_6_1_counter_pop_ready;
	assign pe_6_1_driver_pe_5_1_counter_delta_ready = pe_6_1_counter_pop_ready;
	wire [0:0] pe_6_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_1_counter_delta),
		.delta_ready(pe_6_1_counter_delta_ready),
		.pop_valid(pe_6_1_counter_pop_valid),
		.pop_ready(pe_6_1_counter_pop_ready)
	);
	wire [7:0] pe_7_2_driver_pe_7_1_counter_delta;
	wire [0:0] pe_7_2_driver_pe_7_1_counter_delta_ready;
	wire [0:0] pe_7_2_counter_delta_ready;
	wire [7:0] pe_7_2_counter_delta;
	assign pe_7_2_counter_delta = pe_7_2_driver_pe_7_1_counter_delta;
	wire [0:0] pe_7_2_counter_pop_ready;
	assign pe_7_2_driver_pe_7_1_counter_delta_ready = pe_7_2_counter_pop_ready;
	wire [0:0] pe_7_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_2_counter_delta),
		.delta_ready(pe_7_2_counter_delta_ready),
		.pop_valid(pe_7_2_counter_pop_valid),
		.pop_ready(pe_7_2_counter_pop_ready)
	);
	wire [7:0] pe_2_7_driver_pe_2_6_counter_delta;
	wire [0:0] pe_2_7_driver_pe_2_6_counter_delta_ready;
	wire [0:0] pe_2_7_counter_delta_ready;
	wire [7:0] pe_2_7_counter_delta;
	assign pe_2_7_counter_delta = pe_2_7_driver_pe_2_6_counter_delta;
	wire [0:0] pe_2_7_counter_pop_ready;
	assign pe_2_7_driver_pe_2_6_counter_delta_ready = pe_2_7_counter_pop_ready;
	wire [0:0] pe_2_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_2_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_2_7_counter_delta),
		.delta_ready(pe_2_7_counter_delta_ready),
		.pop_valid(pe_2_7_counter_pop_valid),
		.pop_ready(pe_2_7_counter_pop_ready)
	);
	wire [7:0] pe_1_6_driver_pe_1_5_counter_delta;
	wire [0:0] pe_1_6_driver_pe_1_5_counter_delta_ready;
	wire [0:0] pe_1_6_counter_delta_ready;
	wire [7:0] pe_1_6_counter_delta;
	assign pe_1_6_counter_delta = pe_1_6_driver_pe_1_5_counter_delta;
	wire [0:0] pe_1_6_counter_pop_ready;
	assign pe_1_6_driver_pe_1_5_counter_delta_ready = pe_1_6_counter_pop_ready;
	wire [0:0] pe_1_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_6_counter_delta),
		.delta_ready(pe_1_6_counter_delta_ready),
		.pop_valid(pe_1_6_counter_pop_valid),
		.pop_ready(pe_1_6_counter_pop_ready)
	);
	wire [7:0] pe_1_8_driver_pe_1_7_counter_delta;
	wire [0:0] pe_1_8_driver_pe_1_7_counter_delta_ready;
	wire [0:0] pe_1_8_counter_delta_ready;
	wire [7:0] pe_1_8_counter_delta;
	assign pe_1_8_counter_delta = pe_1_8_driver_pe_1_7_counter_delta;
	wire [0:0] pe_1_8_counter_pop_ready;
	assign pe_1_8_driver_pe_1_7_counter_delta_ready = pe_1_8_counter_pop_ready;
	wire [0:0] pe_1_8_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_1_8_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_1_8_counter_delta),
		.delta_ready(pe_1_8_counter_delta_ready),
		.pop_valid(pe_1_8_counter_pop_valid),
		.pop_ready(pe_1_8_counter_pop_ready)
	);
	wire [7:0] col_pusher_1_driver_testbench_counter_delta;
	wire [0:0] col_pusher_1_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_1_counter_delta_ready;
	wire [7:0] col_pusher_1_counter_delta;
	assign col_pusher_1_counter_delta = col_pusher_1_driver_testbench_counter_delta;
	wire [0:0] col_pusher_1_counter_pop_ready;
	assign col_pusher_1_driver_testbench_counter_delta_ready = col_pusher_1_counter_pop_ready;
	wire [0:0] col_pusher_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_1_counter_delta),
		.delta_ready(col_pusher_1_counter_delta_ready),
		.pop_valid(col_pusher_1_counter_pop_valid),
		.pop_ready(col_pusher_1_counter_pop_ready)
	);
	wire [7:0] col_pusher_4_driver_testbench_counter_delta;
	wire [0:0] col_pusher_4_driver_testbench_counter_delta_ready;
	wire [0:0] col_pusher_4_counter_delta_ready;
	wire [7:0] col_pusher_4_counter_delta;
	assign col_pusher_4_counter_delta = col_pusher_4_driver_testbench_counter_delta;
	wire [0:0] col_pusher_4_counter_pop_ready;
	assign col_pusher_4_driver_testbench_counter_delta_ready = col_pusher_4_counter_pop_ready;
	wire [0:0] col_pusher_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) col_pusher_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(col_pusher_4_counter_delta),
		.delta_ready(col_pusher_4_counter_delta_ready),
		.pop_valid(col_pusher_4_counter_pop_valid),
		.pop_ready(col_pusher_4_counter_pop_ready)
	);
	wire [7:0] sink_69dd1_driver_pe_8_7_counter_delta;
	wire [0:0] sink_69dd1_driver_pe_8_7_counter_delta_ready;
	wire [0:0] sink_69dd1_counter_delta_ready;
	wire [7:0] sink_69dd1_counter_delta;
	assign sink_69dd1_counter_delta = sink_69dd1_driver_pe_8_7_counter_delta;
	wire [0:0] sink_69dd1_counter_pop_ready;
	assign sink_69dd1_driver_pe_8_7_counter_delta_ready = sink_69dd1_counter_pop_ready;
	wire [0:0] sink_69dd1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_69dd1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_69dd1_counter_delta),
		.delta_ready(sink_69dd1_counter_delta_ready),
		.pop_valid(sink_69dd1_counter_pop_valid),
		.pop_ready(sink_69dd1_counter_pop_ready)
	);
	wire [7:0] pe_5_7_driver_pe_5_6_counter_delta;
	wire [0:0] pe_5_7_driver_pe_5_6_counter_delta_ready;
	wire [0:0] pe_5_7_counter_delta_ready;
	wire [7:0] pe_5_7_counter_delta;
	assign pe_5_7_counter_delta = pe_5_7_driver_pe_5_6_counter_delta;
	wire [0:0] pe_5_7_counter_pop_ready;
	assign pe_5_7_driver_pe_5_6_counter_delta_ready = pe_5_7_counter_pop_ready;
	wire [0:0] pe_5_7_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_7_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_7_counter_delta),
		.delta_ready(pe_5_7_counter_delta_ready),
		.pop_valid(pe_5_7_counter_pop_valid),
		.pop_ready(pe_5_7_counter_pop_ready)
	);
	wire [7:0] pe_7_6_driver_pe_7_5_counter_delta;
	wire [0:0] pe_7_6_driver_pe_7_5_counter_delta_ready;
	wire [0:0] pe_7_6_counter_delta_ready;
	wire [7:0] pe_7_6_counter_delta;
	assign pe_7_6_counter_delta = pe_7_6_driver_pe_7_5_counter_delta;
	wire [0:0] pe_7_6_counter_pop_ready;
	assign pe_7_6_driver_pe_7_5_counter_delta_ready = pe_7_6_counter_pop_ready;
	wire [0:0] pe_7_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_7_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_7_6_counter_delta),
		.delta_ready(pe_7_6_counter_delta_ready),
		.pop_valid(pe_7_6_counter_pop_valid),
		.pop_ready(pe_7_6_counter_pop_ready)
	);
	wire [7:0] sink_684d1_driver_pe_8_1_counter_delta;
	wire [0:0] sink_684d1_driver_pe_8_1_counter_delta_ready;
	wire [0:0] sink_684d1_counter_delta_ready;
	wire [7:0] sink_684d1_counter_delta;
	assign sink_684d1_counter_delta = sink_684d1_driver_pe_8_1_counter_delta;
	wire [0:0] sink_684d1_counter_pop_ready;
	assign sink_684d1_driver_pe_8_1_counter_delta_ready = sink_684d1_counter_pop_ready;
	wire [0:0] sink_684d1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_684d1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_684d1_counter_delta),
		.delta_ready(sink_684d1_counter_delta_ready),
		.pop_valid(sink_684d1_counter_pop_valid),
		.pop_ready(sink_684d1_counter_pop_ready)
	);
	wire [7:0] pe_6_5_driver_pe_6_4_counter_delta;
	wire [0:0] pe_6_5_driver_pe_6_4_counter_delta_ready;
	wire [0:0] pe_6_5_counter_delta_ready;
	wire [7:0] pe_6_5_counter_delta;
	assign pe_6_5_counter_delta = pe_6_5_driver_pe_6_4_counter_delta;
	wire [0:0] pe_6_5_counter_pop_ready;
	assign pe_6_5_driver_pe_6_4_counter_delta_ready = pe_6_5_counter_pop_ready;
	wire [0:0] pe_6_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_6_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_6_5_counter_delta),
		.delta_ready(pe_6_5_counter_delta_ready),
		.pop_valid(pe_6_5_counter_pop_valid),
		.pop_ready(pe_6_5_counter_pop_ready)
	);
	wire [7:0] pe_5_6_driver_pe_5_5_counter_delta;
	wire [0:0] pe_5_6_driver_pe_5_5_counter_delta_ready;
	wire [0:0] pe_5_6_counter_delta_ready;
	wire [7:0] pe_5_6_counter_delta;
	assign pe_5_6_counter_delta = pe_5_6_driver_pe_5_5_counter_delta;
	wire [0:0] pe_5_6_counter_pop_ready;
	assign pe_5_6_driver_pe_5_5_counter_delta_ready = pe_5_6_counter_pop_ready;
	wire [0:0] pe_5_6_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_6_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_6_counter_delta),
		.delta_ready(pe_5_6_counter_delta_ready),
		.pop_valid(pe_5_6_counter_pop_valid),
		.pop_ready(pe_5_6_counter_pop_ready)
	);
	wire [7:0] sink_69d05_driver_pe_8_6_counter_delta;
	wire [0:0] sink_69d05_driver_pe_8_6_counter_delta_ready;
	wire [0:0] sink_69d05_counter_delta_ready;
	wire [7:0] sink_69d05_counter_delta;
	assign sink_69d05_counter_delta = sink_69d05_driver_pe_8_6_counter_delta;
	wire [0:0] sink_69d05_counter_pop_ready;
	assign sink_69d05_driver_pe_8_6_counter_delta_ready = sink_69d05_counter_pop_ready;
	wire [0:0] sink_69d05_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_69d05_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_69d05_counter_delta),
		.delta_ready(sink_69d05_counter_delta_ready),
		.pop_valid(sink_69d05_counter_pop_valid),
		.pop_ready(sink_69d05_counter_pop_ready)
	);
	wire [7:0] sink_69e49_driver_pe_8_8_counter_delta;
	wire [0:0] sink_69e49_driver_pe_8_8_counter_delta_ready;
	wire [0:0] sink_69e49_counter_delta_ready;
	wire [7:0] sink_69e49_counter_delta;
	assign sink_69e49_counter_delta = sink_69e49_driver_pe_8_8_counter_delta;
	wire [0:0] sink_69e49_counter_pop_ready;
	assign sink_69e49_driver_pe_8_8_counter_delta_ready = sink_69e49_counter_pop_ready;
	wire [0:0] sink_69e49_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_69e49_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_69e49_counter_delta),
		.delta_ready(sink_69e49_counter_delta_ready),
		.pop_valid(sink_69e49_counter_pop_valid),
		.pop_ready(sink_69e49_counter_pop_ready)
	);
	wire [7:0] pe_5_3_driver_pe_5_2_counter_delta;
	wire [0:0] pe_5_3_driver_pe_5_2_counter_delta_ready;
	wire [0:0] pe_5_3_counter_delta_ready;
	wire [7:0] pe_5_3_counter_delta;
	assign pe_5_3_counter_delta = pe_5_3_driver_pe_5_2_counter_delta;
	wire [0:0] pe_5_3_counter_pop_ready;
	assign pe_5_3_driver_pe_5_2_counter_delta_ready = pe_5_3_counter_pop_ready;
	wire [0:0] pe_5_3_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_3_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_3_counter_delta),
		.delta_ready(pe_5_3_counter_delta_ready),
		.pop_valid(pe_5_3_counter_pop_valid),
		.pop_ready(pe_5_3_counter_pop_ready)
	);
	wire [7:0] pe_3_5_driver_pe_3_4_counter_delta;
	wire [0:0] pe_3_5_driver_pe_3_4_counter_delta_ready;
	wire [0:0] pe_3_5_counter_delta_ready;
	wire [7:0] pe_3_5_counter_delta;
	assign pe_3_5_counter_delta = pe_3_5_driver_pe_3_4_counter_delta;
	wire [0:0] pe_3_5_counter_pop_ready;
	assign pe_3_5_driver_pe_3_4_counter_delta_ready = pe_3_5_counter_pop_ready;
	wire [0:0] pe_3_5_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_5_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_5_counter_delta),
		.delta_ready(pe_3_5_counter_delta_ready),
		.pop_valid(pe_3_5_counter_pop_valid),
		.pop_ready(pe_3_5_counter_pop_ready)
	);
	wire [7:0] sink_69c1d_driver_pe_5_8_counter_delta;
	wire [0:0] sink_69c1d_driver_pe_5_8_counter_delta_ready;
	wire [0:0] sink_69c1d_counter_delta_ready;
	wire [7:0] sink_69c1d_counter_delta;
	assign sink_69c1d_counter_delta = sink_69c1d_driver_pe_5_8_counter_delta;
	wire [0:0] sink_69c1d_counter_pop_ready;
	assign sink_69c1d_driver_pe_5_8_counter_delta_ready = sink_69c1d_counter_pop_ready;
	wire [0:0] sink_69c1d_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) sink_69c1d_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(sink_69c1d_counter_delta),
		.delta_ready(sink_69c1d_counter_delta_ready),
		.pop_valid(sink_69c1d_counter_pop_valid),
		.pop_ready(sink_69c1d_counter_pop_ready)
	);
	wire [7:0] row_pusher_4_driver_testbench_counter_delta;
	wire [0:0] row_pusher_4_driver_testbench_counter_delta_ready;
	wire [0:0] row_pusher_4_counter_delta_ready;
	wire [7:0] row_pusher_4_counter_delta;
	assign row_pusher_4_counter_delta = row_pusher_4_driver_testbench_counter_delta;
	wire [0:0] row_pusher_4_counter_pop_ready;
	assign row_pusher_4_driver_testbench_counter_delta_ready = row_pusher_4_counter_pop_ready;
	wire [0:0] row_pusher_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) row_pusher_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(row_pusher_4_counter_delta),
		.delta_ready(row_pusher_4_counter_delta_ready),
		.pop_valid(row_pusher_4_counter_pop_valid),
		.pop_ready(row_pusher_4_counter_pop_ready)
	);
	wire [7:0] pe_5_1_driver_pe_4_1_counter_delta;
	wire [0:0] pe_5_1_driver_pe_4_1_counter_delta_ready;
	wire [0:0] pe_5_1_counter_delta_ready;
	wire [7:0] pe_5_1_counter_delta;
	assign pe_5_1_counter_delta = pe_5_1_driver_pe_4_1_counter_delta;
	wire [0:0] pe_5_1_counter_pop_ready;
	assign pe_5_1_driver_pe_4_1_counter_delta_ready = pe_5_1_counter_pop_ready;
	wire [0:0] pe_5_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_5_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_5_1_counter_delta),
		.delta_ready(pe_5_1_counter_delta_ready),
		.pop_valid(pe_5_1_counter_pop_valid),
		.pop_ready(pe_5_1_counter_pop_ready)
	);
	wire [7:0] pe_3_4_driver_pe_3_3_counter_delta;
	wire [0:0] pe_3_4_driver_pe_3_3_counter_delta_ready;
	wire [0:0] pe_3_4_counter_delta_ready;
	wire [7:0] pe_3_4_counter_delta;
	assign pe_3_4_counter_delta = pe_3_4_driver_pe_3_3_counter_delta;
	wire [0:0] pe_3_4_counter_pop_ready;
	assign pe_3_4_driver_pe_3_3_counter_delta_ready = pe_3_4_counter_pop_ready;
	wire [0:0] pe_3_4_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) pe_3_4_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(pe_3_4_counter_delta),
		.delta_ready(pe_3_4_counter_delta_ready),
		.pop_valid(pe_3_4_counter_pop_valid),
		.pop_ready(pe_3_4_counter_pop_ready)
	);
	assign testbench_counter_delta = 8'b00000001;
	wire [0:0] pe_5_2_executed;
	pe_5_2 pe_5_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_5_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_2_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_5_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_2_north_pop_valid),
		.pe_5_3_counter_delta_ready(pe_5_3_driver_pe_5_2_counter_delta_ready),
		.pe_5_3_counter_delta(pe_5_3_driver_pe_5_2_counter_delta),
		.fifo_pe_5_3_west_push_valid(fifo_pe_5_3_west_driver_pe_5_2_push_valid),
		.fifo_pe_5_3_west_push_data(fifo_pe_5_3_west_driver_pe_5_2_push_data),
		.fifo_pe_5_3_west_push_ready(fifo_pe_5_3_west_driver_pe_5_2_push_ready),
		.array_array_6632d_q(array_array_6632d_q),
		.array_array_6632d_w(array_array_6632d_driver_pe_5_2_w),
		.array_array_6632d_widx(array_array_6632d_driver_pe_5_2_widx),
		.array_array_6632d_d(array_array_6632d_driver_pe_5_2_d),
		.fifo_pe_6_2_north_push_valid(fifo_pe_6_2_north_driver_pe_5_2_push_valid),
		.fifo_pe_6_2_north_push_data(fifo_pe_6_2_north_driver_pe_5_2_push_data),
		.fifo_pe_6_2_north_push_ready(fifo_pe_6_2_north_driver_pe_5_2_push_ready),
		.counter_delta_ready(pe_5_2_counter_delta_ready),
		.counter_pop_ready(pe_5_2_counter_pop_ready),
		.counter_pop_valid(pe_5_2_counter_pop_valid),
		.expose_executed(pe_5_2_executed)
	);
	wire [0:0] pe_8_6_executed;
	pe_8_6 pe_8_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_8_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_6_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_8_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_6_west_pop_valid),
		.pe_8_7_counter_delta_ready(pe_8_7_driver_pe_8_6_counter_delta_ready),
		.pe_8_7_counter_delta(pe_8_7_driver_pe_8_6_counter_delta),
		.array_array_66c75_q(array_array_66c75_q),
		.array_array_66c75_w(array_array_66c75_driver_pe_8_6_w),
		.array_array_66c75_widx(array_array_66c75_driver_pe_8_6_widx),
		.array_array_66c75_d(array_array_66c75_driver_pe_8_6_d),
		.sink_69d05_counter_delta_ready(sink_69d05_driver_pe_8_6_counter_delta_ready),
		.sink_69d05_counter_delta(sink_69d05_driver_pe_8_6_counter_delta),
		.fifo_sink_69d05_north_push_valid(fifo_sink_69d05_north_driver_pe_8_6_push_valid),
		.fifo_sink_69d05_north_push_data(fifo_sink_69d05_north_driver_pe_8_6_push_data),
		.fifo_sink_69d05_north_push_ready(fifo_sink_69d05_north_driver_pe_8_6_push_ready),
		.fifo_pe_8_7_west_push_valid(fifo_pe_8_7_west_driver_pe_8_6_push_valid),
		.fifo_pe_8_7_west_push_data(fifo_pe_8_7_west_driver_pe_8_6_push_data),
		.fifo_pe_8_7_west_push_ready(fifo_pe_8_7_west_driver_pe_8_6_push_ready),
		.counter_delta_ready(pe_8_6_counter_delta_ready),
		.counter_pop_ready(pe_8_6_counter_pop_ready),
		.counter_pop_valid(pe_8_6_counter_pop_valid),
		.expose_executed(pe_8_6_executed)
	);
	wire [0:0] pe_4_7_executed;
	pe_4_7 pe_4_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_4_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_7_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_4_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_7_west_pop_valid),
		.fifo_pe_5_7_north_push_valid(fifo_pe_5_7_north_driver_pe_4_7_push_valid),
		.fifo_pe_5_7_north_push_data(fifo_pe_5_7_north_driver_pe_4_7_push_data),
		.fifo_pe_5_7_north_push_ready(fifo_pe_5_7_north_driver_pe_4_7_push_ready),
		.pe_4_8_counter_delta_ready(pe_4_8_driver_pe_4_7_counter_delta_ready),
		.pe_4_8_counter_delta(pe_4_8_driver_pe_4_7_counter_delta),
		.fifo_pe_4_8_west_push_valid(fifo_pe_4_8_west_driver_pe_4_7_push_valid),
		.fifo_pe_4_8_west_push_data(fifo_pe_4_8_west_driver_pe_4_7_push_data),
		.fifo_pe_4_8_west_push_ready(fifo_pe_4_8_west_driver_pe_4_7_push_ready),
		.array_array_6629d_q(array_array_6629d_q),
		.array_array_6629d_w(array_array_6629d_driver_pe_4_7_w),
		.array_array_6629d_widx(array_array_6629d_driver_pe_4_7_widx),
		.array_array_6629d_d(array_array_6629d_driver_pe_4_7_d),
		.counter_delta_ready(pe_4_7_counter_delta_ready),
		.counter_pop_ready(pe_4_7_counter_pop_ready),
		.counter_pop_valid(pe_4_7_counter_pop_valid),
		.expose_executed(pe_4_7_executed)
	);
	wire [0:0] pe_6_6_executed;
	pe_6_6 pe_6_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_6_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_6_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_6_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_6_west_pop_valid),
		.array_array_66971_q(array_array_66971_q),
		.array_array_66971_w(array_array_66971_driver_pe_6_6_w),
		.array_array_66971_widx(array_array_66971_driver_pe_6_6_widx),
		.array_array_66971_d(array_array_66971_driver_pe_6_6_d),
		.fifo_pe_6_7_west_push_valid(fifo_pe_6_7_west_driver_pe_6_6_push_valid),
		.fifo_pe_6_7_west_push_data(fifo_pe_6_7_west_driver_pe_6_6_push_data),
		.fifo_pe_6_7_west_push_ready(fifo_pe_6_7_west_driver_pe_6_6_push_ready),
		.pe_6_7_counter_delta_ready(pe_6_7_driver_pe_6_6_counter_delta_ready),
		.pe_6_7_counter_delta(pe_6_7_driver_pe_6_6_counter_delta),
		.fifo_pe_7_6_north_push_valid(fifo_pe_7_6_north_driver_pe_6_6_push_valid),
		.fifo_pe_7_6_north_push_data(fifo_pe_7_6_north_driver_pe_6_6_push_data),
		.fifo_pe_7_6_north_push_ready(fifo_pe_7_6_north_driver_pe_6_6_push_ready),
		.counter_delta_ready(pe_6_6_counter_delta_ready),
		.counter_pop_ready(pe_6_6_counter_pop_ready),
		.counter_pop_valid(pe_6_6_counter_pop_valid),
		.expose_executed(pe_6_6_executed)
	);
	wire [0:0] pe_7_1_executed;
	pe_7_1 pe_7_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_7_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_1_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_7_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_1_north_pop_valid),
		.array_array_66a01_q(array_array_66a01_q),
		.array_array_66a01_w(array_array_66a01_driver_pe_7_1_w),
		.array_array_66a01_widx(array_array_66a01_driver_pe_7_1_widx),
		.array_array_66a01_d(array_array_66a01_driver_pe_7_1_d),
		.pe_8_1_counter_delta_ready(pe_8_1_driver_pe_7_1_counter_delta_ready),
		.pe_8_1_counter_delta(pe_8_1_driver_pe_7_1_counter_delta),
		.fifo_pe_7_2_west_push_valid(fifo_pe_7_2_west_driver_pe_7_1_push_valid),
		.fifo_pe_7_2_west_push_data(fifo_pe_7_2_west_driver_pe_7_1_push_data),
		.fifo_pe_7_2_west_push_ready(fifo_pe_7_2_west_driver_pe_7_1_push_ready),
		.fifo_pe_8_1_north_push_valid(fifo_pe_8_1_north_driver_pe_7_1_push_valid),
		.fifo_pe_8_1_north_push_data(fifo_pe_8_1_north_driver_pe_7_1_push_data),
		.fifo_pe_8_1_north_push_ready(fifo_pe_8_1_north_driver_pe_7_1_push_ready),
		.pe_7_2_counter_delta_ready(pe_7_2_driver_pe_7_1_counter_delta_ready),
		.pe_7_2_counter_delta(pe_7_2_driver_pe_7_1_counter_delta),
		.counter_delta_ready(pe_7_1_counter_delta_ready),
		.counter_pop_ready(pe_7_1_counter_pop_ready),
		.counter_pop_valid(pe_7_1_counter_pop_valid),
		.expose_executed(pe_7_1_executed)
	);
	wire [0:0] pe_4_4_executed;
	pe_4_4 pe_4_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_4_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_4_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_4_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_4_west_pop_valid),
		.array_array_6620d_q(array_array_6620d_q),
		.array_array_6620d_w(array_array_6620d_driver_pe_4_4_w),
		.array_array_6620d_widx(array_array_6620d_driver_pe_4_4_widx),
		.array_array_6620d_d(array_array_6620d_driver_pe_4_4_d),
		.pe_4_5_counter_delta_ready(pe_4_5_driver_pe_4_4_counter_delta_ready),
		.pe_4_5_counter_delta(pe_4_5_driver_pe_4_4_counter_delta),
		.fifo_pe_5_4_north_push_valid(fifo_pe_5_4_north_driver_pe_4_4_push_valid),
		.fifo_pe_5_4_north_push_data(fifo_pe_5_4_north_driver_pe_4_4_push_data),
		.fifo_pe_5_4_north_push_ready(fifo_pe_5_4_north_driver_pe_4_4_push_ready),
		.fifo_pe_4_5_west_push_valid(fifo_pe_4_5_west_driver_pe_4_4_push_valid),
		.fifo_pe_4_5_west_push_data(fifo_pe_4_5_west_driver_pe_4_4_push_data),
		.fifo_pe_4_5_west_push_ready(fifo_pe_4_5_west_driver_pe_4_4_push_ready),
		.counter_delta_ready(pe_4_4_counter_delta_ready),
		.counter_pop_ready(pe_4_4_counter_pop_ready),
		.counter_pop_valid(pe_4_4_counter_pop_valid),
		.expose_executed(pe_4_4_executed)
	);
	wire [0:0] pe_1_5_executed;
	pe_1_5 pe_1_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_1_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_1_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_5_north_pop_valid),
		.fifo_pe_2_5_north_push_valid(fifo_pe_2_5_north_driver_pe_1_5_push_valid),
		.fifo_pe_2_5_north_push_data(fifo_pe_2_5_north_driver_pe_1_5_push_data),
		.fifo_pe_2_5_north_push_ready(fifo_pe_2_5_north_driver_pe_1_5_push_ready),
		.fifo_pe_1_6_west_push_valid(fifo_pe_1_6_west_driver_pe_1_5_push_valid),
		.fifo_pe_1_6_west_push_data(fifo_pe_1_6_west_driver_pe_1_5_push_data),
		.fifo_pe_1_6_west_push_ready(fifo_pe_1_6_west_driver_pe_1_5_push_ready),
		.array_array_65601_q(array_array_65601_q),
		.array_array_65601_w(array_array_65601_driver_pe_1_5_w),
		.array_array_65601_widx(array_array_65601_driver_pe_1_5_widx),
		.array_array_65601_d(array_array_65601_driver_pe_1_5_d),
		.pe_1_6_counter_delta_ready(pe_1_6_driver_pe_1_5_counter_delta_ready),
		.pe_1_6_counter_delta(pe_1_6_driver_pe_1_5_counter_delta),
		.counter_delta_ready(pe_1_5_counter_delta_ready),
		.counter_pop_ready(pe_1_5_counter_pop_ready),
		.counter_pop_valid(pe_1_5_counter_pop_valid),
		.expose_executed(pe_1_5_executed)
	);
	wire [0:0] pe_2_3_executed;
	pe_2_3 pe_2_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_2_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_3_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_2_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_3_north_pop_valid),
		.fifo_pe_3_3_north_push_valid(fifo_pe_3_3_north_driver_pe_2_3_push_valid),
		.fifo_pe_3_3_north_push_data(fifo_pe_3_3_north_driver_pe_2_3_push_data),
		.fifo_pe_3_3_north_push_ready(fifo_pe_3_3_north_driver_pe_2_3_push_ready),
		.pe_2_4_counter_delta_ready(pe_2_4_driver_pe_2_3_counter_delta_ready),
		.pe_2_4_counter_delta(pe_2_4_driver_pe_2_3_counter_delta),
		.fifo_pe_2_4_west_push_valid(fifo_pe_2_4_west_driver_pe_2_3_push_valid),
		.fifo_pe_2_4_west_push_data(fifo_pe_2_4_west_driver_pe_2_3_push_data),
		.fifo_pe_2_4_west_push_ready(fifo_pe_2_4_west_driver_pe_2_3_push_ready),
		.array_array_65709_q(array_array_65709_q),
		.array_array_65709_w(array_array_65709_driver_pe_2_3_w),
		.array_array_65709_widx(array_array_65709_driver_pe_2_3_widx),
		.array_array_65709_d(array_array_65709_driver_pe_2_3_d),
		.counter_delta_ready(pe_2_3_counter_delta_ready),
		.counter_pop_ready(pe_2_3_counter_pop_ready),
		.counter_pop_valid(pe_2_3_counter_pop_valid),
		.expose_executed(pe_2_3_executed)
	);
	wire [0:0] sink_69c5d_executed;
	sink_69c5d sink_69c5d_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_69c5d_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_69c5d_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_69c5d_north_pop_valid),
		.counter_delta_ready(sink_69c5d_counter_delta_ready),
		.counter_pop_ready(sink_69c5d_counter_pop_ready),
		.counter_pop_valid(sink_69c5d_counter_pop_valid),
		.expose_executed(sink_69c5d_executed)
	);
	wire [0:0] pe_4_2_executed;
	pe_4_2 pe_4_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_4_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_2_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_4_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_2_north_pop_valid),
		.array_array_661ad_q(array_array_661ad_q),
		.array_array_661ad_w(array_array_661ad_driver_pe_4_2_w),
		.array_array_661ad_widx(array_array_661ad_driver_pe_4_2_widx),
		.array_array_661ad_d(array_array_661ad_driver_pe_4_2_d),
		.fifo_pe_5_2_north_push_valid(fifo_pe_5_2_north_driver_pe_4_2_push_valid),
		.fifo_pe_5_2_north_push_data(fifo_pe_5_2_north_driver_pe_4_2_push_data),
		.fifo_pe_5_2_north_push_ready(fifo_pe_5_2_north_driver_pe_4_2_push_ready),
		.pe_4_3_counter_delta_ready(pe_4_3_driver_pe_4_2_counter_delta_ready),
		.pe_4_3_counter_delta(pe_4_3_driver_pe_4_2_counter_delta),
		.fifo_pe_4_3_west_push_valid(fifo_pe_4_3_west_driver_pe_4_2_push_valid),
		.fifo_pe_4_3_west_push_data(fifo_pe_4_3_west_driver_pe_4_2_push_data),
		.fifo_pe_4_3_west_push_ready(fifo_pe_4_3_west_driver_pe_4_2_push_ready),
		.counter_delta_ready(pe_4_2_counter_delta_ready),
		.counter_pop_ready(pe_4_2_counter_pop_ready),
		.counter_pop_valid(pe_4_2_counter_pop_valid),
		.expose_executed(pe_4_2_executed)
	);
	wire [0:0] pe_2_5_executed;
	pe_2_5 pe_2_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_2_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_2_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_5_north_pop_valid),
		.fifo_pe_3_5_north_push_valid(fifo_pe_3_5_north_driver_pe_2_5_push_valid),
		.fifo_pe_3_5_north_push_data(fifo_pe_3_5_north_driver_pe_2_5_push_data),
		.fifo_pe_3_5_north_push_ready(fifo_pe_3_5_north_driver_pe_2_5_push_ready),
		.array_array_65765_q(array_array_65765_q),
		.array_array_65765_w(array_array_65765_driver_pe_2_5_w),
		.array_array_65765_widx(array_array_65765_driver_pe_2_5_widx),
		.array_array_65765_d(array_array_65765_driver_pe_2_5_d),
		.pe_2_6_counter_delta_ready(pe_2_6_driver_pe_2_5_counter_delta_ready),
		.pe_2_6_counter_delta(pe_2_6_driver_pe_2_5_counter_delta),
		.fifo_pe_2_6_west_push_valid(fifo_pe_2_6_west_driver_pe_2_5_push_valid),
		.fifo_pe_2_6_west_push_data(fifo_pe_2_6_west_driver_pe_2_5_push_data),
		.fifo_pe_2_6_west_push_ready(fifo_pe_2_6_west_driver_pe_2_5_push_ready),
		.counter_delta_ready(pe_2_5_counter_delta_ready),
		.counter_pop_ready(pe_2_5_counter_pop_ready),
		.counter_pop_valid(pe_2_5_counter_pop_valid),
		.expose_executed(pe_2_5_executed)
	);
	wire [0:0] sink_68649_executed;
	sink_68649 sink_68649_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_68649_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_68649_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_68649_west_pop_valid),
		.counter_delta_ready(sink_68649_counter_delta_ready),
		.counter_pop_ready(sink_68649_counter_pop_ready),
		.counter_pop_valid(sink_68649_counter_pop_valid),
		.expose_executed(sink_68649_executed)
	);
	wire [0:0] pe_2_8_executed;
	pe_2_8 pe_2_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_2_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_8_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_2_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_8_west_pop_valid),
		.array_array_657e9_q(array_array_657e9_q),
		.array_array_657e9_w(array_array_657e9_driver_pe_2_8_w),
		.array_array_657e9_widx(array_array_657e9_driver_pe_2_8_widx),
		.array_array_657e9_d(array_array_657e9_driver_pe_2_8_d),
		.sink_68561_counter_delta_ready(sink_68561_driver_pe_2_8_counter_delta_ready),
		.sink_68561_counter_delta(sink_68561_driver_pe_2_8_counter_delta),
		.fifo_sink_68561_west_push_valid(fifo_sink_68561_west_driver_pe_2_8_push_valid),
		.fifo_sink_68561_west_push_data(fifo_sink_68561_west_driver_pe_2_8_push_data),
		.fifo_sink_68561_west_push_ready(fifo_sink_68561_west_driver_pe_2_8_push_ready),
		.fifo_pe_3_8_north_push_valid(fifo_pe_3_8_north_driver_pe_2_8_push_valid),
		.fifo_pe_3_8_north_push_data(fifo_pe_3_8_north_driver_pe_2_8_push_data),
		.fifo_pe_3_8_north_push_ready(fifo_pe_3_8_north_driver_pe_2_8_push_ready),
		.counter_delta_ready(pe_2_8_counter_delta_ready),
		.counter_pop_ready(pe_2_8_counter_pop_ready),
		.counter_pop_valid(pe_2_8_counter_pop_valid),
		.expose_executed(pe_2_8_executed)
	);
	wire [0:0] pe_4_1_executed;
	pe_4_1 pe_4_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_4_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_1_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_4_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_1_west_pop_valid),
		.pe_5_1_counter_delta_ready(pe_5_1_driver_pe_4_1_counter_delta_ready),
		.pe_5_1_counter_delta(pe_5_1_driver_pe_4_1_counter_delta),
		.fifo_pe_4_2_west_push_valid(fifo_pe_4_2_west_driver_pe_4_1_push_valid),
		.fifo_pe_4_2_west_push_data(fifo_pe_4_2_west_driver_pe_4_1_push_data),
		.fifo_pe_4_2_west_push_ready(fifo_pe_4_2_west_driver_pe_4_1_push_ready),
		.array_array_6617d_q(array_array_6617d_q),
		.array_array_6617d_w(array_array_6617d_driver_pe_4_1_w),
		.array_array_6617d_widx(array_array_6617d_driver_pe_4_1_widx),
		.array_array_6617d_d(array_array_6617d_driver_pe_4_1_d),
		.pe_4_2_counter_delta_ready(pe_4_2_driver_pe_4_1_counter_delta_ready),
		.pe_4_2_counter_delta(pe_4_2_driver_pe_4_1_counter_delta),
		.fifo_pe_5_1_north_push_valid(fifo_pe_5_1_north_driver_pe_4_1_push_valid),
		.fifo_pe_5_1_north_push_data(fifo_pe_5_1_north_driver_pe_4_1_push_data),
		.fifo_pe_5_1_north_push_ready(fifo_pe_5_1_north_driver_pe_4_1_push_ready),
		.counter_delta_ready(pe_4_1_counter_delta_ready),
		.counter_pop_ready(pe_4_1_counter_pop_ready),
		.counter_pop_valid(pe_4_1_counter_pop_valid),
		.expose_executed(pe_4_1_executed)
	);
	wire [0:0] pe_3_7_executed;
	pe_3_7 pe_3_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_3_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_7_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_3_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_7_west_pop_valid),
		.array_array_66121_q(array_array_66121_q),
		.array_array_66121_w(array_array_66121_driver_pe_3_7_w),
		.array_array_66121_widx(array_array_66121_driver_pe_3_7_widx),
		.array_array_66121_d(array_array_66121_driver_pe_3_7_d),
		.fifo_pe_3_8_west_push_valid(fifo_pe_3_8_west_driver_pe_3_7_push_valid),
		.fifo_pe_3_8_west_push_data(fifo_pe_3_8_west_driver_pe_3_7_push_data),
		.fifo_pe_3_8_west_push_ready(fifo_pe_3_8_west_driver_pe_3_7_push_ready),
		.pe_3_8_counter_delta_ready(pe_3_8_driver_pe_3_7_counter_delta_ready),
		.pe_3_8_counter_delta(pe_3_8_driver_pe_3_7_counter_delta),
		.fifo_pe_4_7_north_push_valid(fifo_pe_4_7_north_driver_pe_3_7_push_valid),
		.fifo_pe_4_7_north_push_data(fifo_pe_4_7_north_driver_pe_3_7_push_data),
		.fifo_pe_4_7_north_push_ready(fifo_pe_4_7_north_driver_pe_3_7_push_ready),
		.counter_delta_ready(pe_3_7_counter_delta_ready),
		.counter_pop_ready(pe_3_7_counter_pop_ready),
		.counter_pop_valid(pe_3_7_counter_pop_valid),
		.expose_executed(pe_3_7_executed)
	);
	wire [0:0] pe_4_3_executed;
	pe_4_3 pe_4_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_4_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_3_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_4_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_3_west_pop_valid),
		.pe_4_4_counter_delta_ready(pe_4_4_driver_pe_4_3_counter_delta_ready),
		.pe_4_4_counter_delta(pe_4_4_driver_pe_4_3_counter_delta),
		.fifo_pe_4_4_west_push_valid(fifo_pe_4_4_west_driver_pe_4_3_push_valid),
		.fifo_pe_4_4_west_push_data(fifo_pe_4_4_west_driver_pe_4_3_push_data),
		.fifo_pe_4_4_west_push_ready(fifo_pe_4_4_west_driver_pe_4_3_push_ready),
		.array_array_661dd_q(array_array_661dd_q),
		.array_array_661dd_w(array_array_661dd_driver_pe_4_3_w),
		.array_array_661dd_widx(array_array_661dd_driver_pe_4_3_widx),
		.array_array_661dd_d(array_array_661dd_driver_pe_4_3_d),
		.fifo_pe_5_3_north_push_valid(fifo_pe_5_3_north_driver_pe_4_3_push_valid),
		.fifo_pe_5_3_north_push_data(fifo_pe_5_3_north_driver_pe_4_3_push_data),
		.fifo_pe_5_3_north_push_ready(fifo_pe_5_3_north_driver_pe_4_3_push_ready),
		.counter_delta_ready(pe_4_3_counter_delta_ready),
		.counter_pop_ready(pe_4_3_counter_pop_ready),
		.counter_pop_valid(pe_4_3_counter_pop_valid),
		.expose_executed(pe_4_3_executed)
	);
	wire [0:0] pe_4_8_executed;
	pe_4_8 pe_4_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_4_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_8_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_4_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_8_north_pop_valid),
		.fifo_sink_68731_west_push_valid(fifo_sink_68731_west_driver_pe_4_8_push_valid),
		.fifo_sink_68731_west_push_data(fifo_sink_68731_west_driver_pe_4_8_push_data),
		.fifo_sink_68731_west_push_ready(fifo_sink_68731_west_driver_pe_4_8_push_ready),
		.array_array_662cd_q(array_array_662cd_q),
		.array_array_662cd_w(array_array_662cd_driver_pe_4_8_w),
		.array_array_662cd_widx(array_array_662cd_driver_pe_4_8_widx),
		.array_array_662cd_d(array_array_662cd_driver_pe_4_8_d),
		.fifo_pe_5_8_north_push_valid(fifo_pe_5_8_north_driver_pe_4_8_push_valid),
		.fifo_pe_5_8_north_push_data(fifo_pe_5_8_north_driver_pe_4_8_push_data),
		.fifo_pe_5_8_north_push_ready(fifo_pe_5_8_north_driver_pe_4_8_push_ready),
		.sink_68731_counter_delta_ready(sink_68731_driver_pe_4_8_counter_delta_ready),
		.sink_68731_counter_delta(sink_68731_driver_pe_4_8_counter_delta),
		.counter_delta_ready(pe_4_8_counter_delta_ready),
		.counter_pop_ready(pe_4_8_counter_pop_ready),
		.counter_pop_valid(pe_4_8_counter_pop_valid),
		.expose_executed(pe_4_8_executed)
	);
	wire [0:0] pe_6_4_executed;
	pe_6_4 pe_6_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_6_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_4_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_6_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_4_north_pop_valid),
		.array_array_66911_q(array_array_66911_q),
		.array_array_66911_w(array_array_66911_driver_pe_6_4_w),
		.array_array_66911_widx(array_array_66911_driver_pe_6_4_widx),
		.array_array_66911_d(array_array_66911_driver_pe_6_4_d),
		.fifo_pe_7_4_north_push_valid(fifo_pe_7_4_north_driver_pe_6_4_push_valid),
		.fifo_pe_7_4_north_push_data(fifo_pe_7_4_north_driver_pe_6_4_push_data),
		.fifo_pe_7_4_north_push_ready(fifo_pe_7_4_north_driver_pe_6_4_push_ready),
		.pe_6_5_counter_delta_ready(pe_6_5_driver_pe_6_4_counter_delta_ready),
		.pe_6_5_counter_delta(pe_6_5_driver_pe_6_4_counter_delta),
		.fifo_pe_6_5_west_push_valid(fifo_pe_6_5_west_driver_pe_6_4_push_valid),
		.fifo_pe_6_5_west_push_data(fifo_pe_6_5_west_driver_pe_6_4_push_data),
		.fifo_pe_6_5_west_push_ready(fifo_pe_6_5_west_driver_pe_6_4_push_ready),
		.counter_delta_ready(pe_6_4_counter_delta_ready),
		.counter_pop_ready(pe_6_4_counter_pop_ready),
		.counter_pop_valid(pe_6_4_counter_pop_valid),
		.expose_executed(pe_6_4_executed)
	);
	wire [0:0] col_pusher_2_executed;
	col_pusher_2 col_pusher_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_2_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_2_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_2_data_pop_valid),
		.fifo_pe_1_2_north_push_valid(fifo_pe_1_2_north_driver_col_pusher_2_push_valid),
		.fifo_pe_1_2_north_push_data(fifo_pe_1_2_north_driver_col_pusher_2_push_data),
		.fifo_pe_1_2_north_push_ready(fifo_pe_1_2_north_driver_col_pusher_2_push_ready),
		.counter_delta_ready(col_pusher_2_counter_delta_ready),
		.counter_pop_ready(col_pusher_2_counter_pop_ready),
		.counter_pop_valid(col_pusher_2_counter_pop_valid),
		.expose_executed(col_pusher_2_executed)
	);
	wire [0:0] row_pusher_2_executed;
	row_pusher_2 row_pusher_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_2_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_2_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_2_data_pop_valid),
		.fifo_pe_2_1_west_push_valid(fifo_pe_2_1_west_driver_row_pusher_2_push_valid),
		.fifo_pe_2_1_west_push_data(fifo_pe_2_1_west_driver_row_pusher_2_push_data),
		.fifo_pe_2_1_west_push_ready(fifo_pe_2_1_west_driver_row_pusher_2_push_ready),
		.counter_delta_ready(row_pusher_2_counter_delta_ready),
		.counter_pop_ready(row_pusher_2_counter_pop_ready),
		.counter_pop_valid(row_pusher_2_counter_pop_valid),
		.expose_executed(row_pusher_2_executed)
	);
	wire [0:0] pe_8_8_executed;
	pe_8_8 pe_8_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_8_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_8_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_8_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_8_west_pop_valid),
		.array_array_66cd5_q(array_array_66cd5_q),
		.array_array_66cd5_w(array_array_66cd5_driver_pe_8_8_w),
		.array_array_66cd5_widx(array_array_66cd5_driver_pe_8_8_widx),
		.array_array_66cd5_d(array_array_66cd5_driver_pe_8_8_d),
		.fifo_sink_69e49_west_push_valid(fifo_sink_69e49_west_driver_pe_8_8_push_valid),
		.fifo_sink_69e49_west_push_data(fifo_sink_69e49_west_driver_pe_8_8_push_data),
		.fifo_sink_69e49_west_push_ready(fifo_sink_69e49_west_driver_pe_8_8_push_ready),
		.fifo_sink_69e91_north_push_valid(fifo_sink_69e91_north_driver_pe_8_8_push_valid),
		.fifo_sink_69e91_north_push_data(fifo_sink_69e91_north_driver_pe_8_8_push_data),
		.fifo_sink_69e91_north_push_ready(fifo_sink_69e91_north_driver_pe_8_8_push_ready),
		.sink_69e49_counter_delta_ready(sink_69e49_driver_pe_8_8_counter_delta_ready),
		.sink_69e49_counter_delta(sink_69e49_driver_pe_8_8_counter_delta),
		.sink_69e91_counter_delta_ready(sink_69e91_driver_pe_8_8_counter_delta_ready),
		.sink_69e91_counter_delta(sink_69e91_driver_pe_8_8_counter_delta),
		.counter_delta_ready(pe_8_8_counter_delta_ready),
		.counter_pop_ready(pe_8_8_counter_pop_ready),
		.counter_pop_valid(pe_8_8_counter_pop_valid),
		.expose_executed(pe_8_8_executed)
	);
	wire [0:0] sink_686ed_executed;
	sink_686ed sink_686ed_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_686ed_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_686ed_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_686ed_west_pop_valid),
		.counter_delta_ready(sink_686ed_counter_delta_ready),
		.counter_pop_ready(sink_686ed_counter_pop_ready),
		.counter_pop_valid(sink_686ed_counter_pop_valid),
		.expose_executed(sink_686ed_executed)
	);
	wire [0:0] pe_3_1_executed;
	pe_3_1 pe_3_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_3_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_1_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_3_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_1_north_pop_valid),
		.fifo_pe_3_2_west_push_valid(fifo_pe_3_2_west_driver_pe_3_1_push_valid),
		.fifo_pe_3_2_west_push_data(fifo_pe_3_2_west_driver_pe_3_1_push_data),
		.fifo_pe_3_2_west_push_ready(fifo_pe_3_2_west_driver_pe_3_1_push_ready),
		.pe_3_2_counter_delta_ready(pe_3_2_driver_pe_3_1_counter_delta_ready),
		.pe_3_2_counter_delta(pe_3_2_driver_pe_3_1_counter_delta),
		.pe_4_1_counter_delta_ready(pe_4_1_driver_pe_3_1_counter_delta_ready),
		.pe_4_1_counter_delta(pe_4_1_driver_pe_3_1_counter_delta),
		.fifo_pe_4_1_north_push_valid(fifo_pe_4_1_north_driver_pe_3_1_push_valid),
		.fifo_pe_4_1_north_push_data(fifo_pe_4_1_north_driver_pe_3_1_push_data),
		.fifo_pe_4_1_north_push_ready(fifo_pe_4_1_north_driver_pe_3_1_push_ready),
		.array_array_66019_q(array_array_66019_q),
		.array_array_66019_w(array_array_66019_driver_pe_3_1_w),
		.array_array_66019_widx(array_array_66019_driver_pe_3_1_widx),
		.array_array_66019_d(array_array_66019_driver_pe_3_1_d),
		.counter_delta_ready(pe_3_1_counter_delta_ready),
		.counter_pop_ready(pe_3_1_counter_pop_ready),
		.counter_pop_valid(pe_3_1_counter_pop_valid),
		.expose_executed(pe_3_1_executed)
	);
	wire [0:0] pe_6_2_executed;
	pe_6_2 pe_6_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_6_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_2_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_6_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_2_north_pop_valid),
		.array_array_668b1_q(array_array_668b1_q),
		.array_array_668b1_w(array_array_668b1_driver_pe_6_2_w),
		.array_array_668b1_widx(array_array_668b1_driver_pe_6_2_widx),
		.array_array_668b1_d(array_array_668b1_driver_pe_6_2_d),
		.fifo_pe_7_2_north_push_valid(fifo_pe_7_2_north_driver_pe_6_2_push_valid),
		.fifo_pe_7_2_north_push_data(fifo_pe_7_2_north_driver_pe_6_2_push_data),
		.fifo_pe_7_2_north_push_ready(fifo_pe_7_2_north_driver_pe_6_2_push_ready),
		.pe_6_3_counter_delta_ready(pe_6_3_driver_pe_6_2_counter_delta_ready),
		.pe_6_3_counter_delta(pe_6_3_driver_pe_6_2_counter_delta),
		.fifo_pe_6_3_west_push_valid(fifo_pe_6_3_west_driver_pe_6_2_push_valid),
		.fifo_pe_6_3_west_push_data(fifo_pe_6_3_west_driver_pe_6_2_push_data),
		.fifo_pe_6_3_west_push_ready(fifo_pe_6_3_west_driver_pe_6_2_push_ready),
		.counter_delta_ready(pe_6_2_counter_delta_ready),
		.counter_pop_ready(pe_6_2_counter_pop_ready),
		.counter_pop_valid(pe_6_2_counter_pop_valid),
		.expose_executed(pe_6_2_executed)
	);
	wire [0:0] row_pusher_7_executed;
	row_pusher_7 row_pusher_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_7_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_7_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_7_data_pop_valid),
		.fifo_pe_7_1_west_push_valid(fifo_pe_7_1_west_driver_row_pusher_7_push_valid),
		.fifo_pe_7_1_west_push_data(fifo_pe_7_1_west_driver_row_pusher_7_push_data),
		.fifo_pe_7_1_west_push_ready(fifo_pe_7_1_west_driver_row_pusher_7_push_ready),
		.counter_delta_ready(row_pusher_7_counter_delta_ready),
		.counter_pop_ready(row_pusher_7_counter_pop_ready),
		.counter_pop_valid(row_pusher_7_counter_pop_valid),
		.expose_executed(row_pusher_7_executed)
	);
	wire [0:0] pe_1_7_executed;
	pe_1_7 pe_1_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_1_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_7_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_1_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_7_north_pop_valid),
		.fifo_pe_1_8_west_push_valid(fifo_pe_1_8_west_driver_pe_1_7_push_valid),
		.fifo_pe_1_8_west_push_data(fifo_pe_1_8_west_driver_pe_1_7_push_data),
		.fifo_pe_1_8_west_push_ready(fifo_pe_1_8_west_driver_pe_1_7_push_ready),
		.fifo_pe_2_7_north_push_valid(fifo_pe_2_7_north_driver_pe_1_7_push_valid),
		.fifo_pe_2_7_north_push_data(fifo_pe_2_7_north_driver_pe_1_7_push_data),
		.fifo_pe_2_7_north_push_ready(fifo_pe_2_7_north_driver_pe_1_7_push_ready),
		.array_array_6565d_q(array_array_6565d_q),
		.array_array_6565d_w(array_array_6565d_driver_pe_1_7_w),
		.array_array_6565d_widx(array_array_6565d_driver_pe_1_7_widx),
		.array_array_6565d_d(array_array_6565d_driver_pe_1_7_d),
		.pe_1_8_counter_delta_ready(pe_1_8_driver_pe_1_7_counter_delta_ready),
		.pe_1_8_counter_delta(pe_1_8_driver_pe_1_7_counter_delta),
		.counter_delta_ready(pe_1_7_counter_delta_ready),
		.counter_pop_ready(pe_1_7_counter_pop_ready),
		.counter_pop_valid(pe_1_7_counter_pop_valid),
		.expose_executed(pe_1_7_executed)
	);
	wire [0:0] pe_2_2_executed;
	pe_2_2 pe_2_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_2_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_2_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_2_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_2_west_pop_valid),
		.pe_2_3_counter_delta_ready(pe_2_3_driver_pe_2_2_counter_delta_ready),
		.pe_2_3_counter_delta(pe_2_3_driver_pe_2_2_counter_delta),
		.fifo_pe_2_3_west_push_valid(fifo_pe_2_3_west_driver_pe_2_2_push_valid),
		.fifo_pe_2_3_west_push_data(fifo_pe_2_3_west_driver_pe_2_2_push_data),
		.fifo_pe_2_3_west_push_ready(fifo_pe_2_3_west_driver_pe_2_2_push_ready),
		.fifo_pe_3_2_north_push_valid(fifo_pe_3_2_north_driver_pe_2_2_push_valid),
		.fifo_pe_3_2_north_push_data(fifo_pe_3_2_north_driver_pe_2_2_push_data),
		.fifo_pe_3_2_north_push_ready(fifo_pe_3_2_north_driver_pe_2_2_push_ready),
		.array_array_656dd_q(array_array_656dd_q),
		.array_array_656dd_w(array_array_656dd_driver_pe_2_2_w),
		.array_array_656dd_widx(array_array_656dd_driver_pe_2_2_widx),
		.array_array_656dd_d(array_array_656dd_driver_pe_2_2_d),
		.counter_delta_ready(pe_2_2_counter_delta_ready),
		.counter_pop_ready(pe_2_2_counter_pop_ready),
		.counter_pop_valid(pe_2_2_counter_pop_valid),
		.expose_executed(pe_2_2_executed)
	);
	wire [0:0] testbench_executed;
	testbench testbench_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_col_pusher_3_data_push_valid(fifo_col_pusher_3_data_driver_testbench_push_valid),
		.fifo_col_pusher_3_data_push_data(fifo_col_pusher_3_data_driver_testbench_push_data),
		.fifo_col_pusher_3_data_push_ready(fifo_col_pusher_3_data_driver_testbench_push_ready),
		.fifo_row_pusher_3_data_push_valid(fifo_row_pusher_3_data_driver_testbench_push_valid),
		.fifo_row_pusher_3_data_push_data(fifo_row_pusher_3_data_driver_testbench_push_data),
		.fifo_row_pusher_3_data_push_ready(fifo_row_pusher_3_data_driver_testbench_push_ready),
		.row_pusher_3_counter_delta_ready(row_pusher_3_driver_testbench_counter_delta_ready),
		.row_pusher_3_counter_delta(row_pusher_3_driver_testbench_counter_delta),
		.col_pusher_7_counter_delta_ready(col_pusher_7_driver_testbench_counter_delta_ready),
		.col_pusher_7_counter_delta(col_pusher_7_driver_testbench_counter_delta),
		.col_pusher_2_counter_delta_ready(col_pusher_2_driver_testbench_counter_delta_ready),
		.col_pusher_2_counter_delta(col_pusher_2_driver_testbench_counter_delta),
		.fifo_col_pusher_8_data_push_valid(fifo_col_pusher_8_data_driver_testbench_push_valid),
		.fifo_col_pusher_8_data_push_data(fifo_col_pusher_8_data_driver_testbench_push_data),
		.fifo_col_pusher_8_data_push_ready(fifo_col_pusher_8_data_driver_testbench_push_ready),
		.fifo_row_pusher_1_data_push_valid(fifo_row_pusher_1_data_driver_testbench_push_valid),
		.fifo_row_pusher_1_data_push_data(fifo_row_pusher_1_data_driver_testbench_push_data),
		.fifo_row_pusher_1_data_push_ready(fifo_row_pusher_1_data_driver_testbench_push_ready),
		.fifo_col_pusher_2_data_push_valid(fifo_col_pusher_2_data_driver_testbench_push_valid),
		.fifo_col_pusher_2_data_push_data(fifo_col_pusher_2_data_driver_testbench_push_data),
		.fifo_col_pusher_2_data_push_ready(fifo_col_pusher_2_data_driver_testbench_push_ready),
		.fifo_col_pusher_4_data_push_valid(fifo_col_pusher_4_data_driver_testbench_push_valid),
		.fifo_col_pusher_4_data_push_data(fifo_col_pusher_4_data_driver_testbench_push_data),
		.fifo_col_pusher_4_data_push_ready(fifo_col_pusher_4_data_driver_testbench_push_ready),
		.fifo_row_pusher_8_data_push_valid(fifo_row_pusher_8_data_driver_testbench_push_valid),
		.fifo_row_pusher_8_data_push_data(fifo_row_pusher_8_data_driver_testbench_push_data),
		.fifo_row_pusher_8_data_push_ready(fifo_row_pusher_8_data_driver_testbench_push_ready),
		.fifo_col_pusher_5_data_push_valid(fifo_col_pusher_5_data_driver_testbench_push_valid),
		.fifo_col_pusher_5_data_push_data(fifo_col_pusher_5_data_driver_testbench_push_data),
		.fifo_col_pusher_5_data_push_ready(fifo_col_pusher_5_data_driver_testbench_push_ready),
		.row_pusher_5_counter_delta_ready(row_pusher_5_driver_testbench_counter_delta_ready),
		.row_pusher_5_counter_delta(row_pusher_5_driver_testbench_counter_delta),
		.row_pusher_2_counter_delta_ready(row_pusher_2_driver_testbench_counter_delta_ready),
		.row_pusher_2_counter_delta(row_pusher_2_driver_testbench_counter_delta),
		.fifo_row_pusher_6_data_push_valid(fifo_row_pusher_6_data_driver_testbench_push_valid),
		.fifo_row_pusher_6_data_push_data(fifo_row_pusher_6_data_driver_testbench_push_data),
		.fifo_row_pusher_6_data_push_ready(fifo_row_pusher_6_data_driver_testbench_push_ready),
		.col_pusher_1_counter_delta_ready(col_pusher_1_driver_testbench_counter_delta_ready),
		.col_pusher_1_counter_delta(col_pusher_1_driver_testbench_counter_delta),
		.fifo_col_pusher_7_data_push_valid(fifo_col_pusher_7_data_driver_testbench_push_valid),
		.fifo_col_pusher_7_data_push_data(fifo_col_pusher_7_data_driver_testbench_push_data),
		.fifo_col_pusher_7_data_push_ready(fifo_col_pusher_7_data_driver_testbench_push_ready),
		.col_pusher_5_counter_delta_ready(col_pusher_5_driver_testbench_counter_delta_ready),
		.col_pusher_5_counter_delta(col_pusher_5_driver_testbench_counter_delta),
		.row_pusher_6_counter_delta_ready(row_pusher_6_driver_testbench_counter_delta_ready),
		.row_pusher_6_counter_delta(row_pusher_6_driver_testbench_counter_delta),
		.row_pusher_8_counter_delta_ready(row_pusher_8_driver_testbench_counter_delta_ready),
		.row_pusher_8_counter_delta(row_pusher_8_driver_testbench_counter_delta),
		.col_pusher_8_counter_delta_ready(col_pusher_8_driver_testbench_counter_delta_ready),
		.col_pusher_8_counter_delta(col_pusher_8_driver_testbench_counter_delta),
		.row_pusher_1_counter_delta_ready(row_pusher_1_driver_testbench_counter_delta_ready),
		.row_pusher_1_counter_delta(row_pusher_1_driver_testbench_counter_delta),
		.fifo_row_pusher_4_data_push_valid(fifo_row_pusher_4_data_driver_testbench_push_valid),
		.fifo_row_pusher_4_data_push_data(fifo_row_pusher_4_data_driver_testbench_push_data),
		.fifo_row_pusher_4_data_push_ready(fifo_row_pusher_4_data_driver_testbench_push_ready),
		.row_pusher_7_counter_delta_ready(row_pusher_7_driver_testbench_counter_delta_ready),
		.row_pusher_7_counter_delta(row_pusher_7_driver_testbench_counter_delta),
		.fifo_row_pusher_5_data_push_valid(fifo_row_pusher_5_data_driver_testbench_push_valid),
		.fifo_row_pusher_5_data_push_data(fifo_row_pusher_5_data_driver_testbench_push_data),
		.fifo_row_pusher_5_data_push_ready(fifo_row_pusher_5_data_driver_testbench_push_ready),
		.fifo_col_pusher_6_data_push_valid(fifo_col_pusher_6_data_driver_testbench_push_valid),
		.fifo_col_pusher_6_data_push_data(fifo_col_pusher_6_data_driver_testbench_push_data),
		.fifo_col_pusher_6_data_push_ready(fifo_col_pusher_6_data_driver_testbench_push_ready),
		.col_pusher_3_counter_delta_ready(col_pusher_3_driver_testbench_counter_delta_ready),
		.col_pusher_3_counter_delta(col_pusher_3_driver_testbench_counter_delta),
		.fifo_row_pusher_2_data_push_valid(fifo_row_pusher_2_data_driver_testbench_push_valid),
		.fifo_row_pusher_2_data_push_data(fifo_row_pusher_2_data_driver_testbench_push_data),
		.fifo_row_pusher_2_data_push_ready(fifo_row_pusher_2_data_driver_testbench_push_ready),
		.row_pusher_4_counter_delta_ready(row_pusher_4_driver_testbench_counter_delta_ready),
		.row_pusher_4_counter_delta(row_pusher_4_driver_testbench_counter_delta),
		.fifo_col_pusher_1_data_push_valid(fifo_col_pusher_1_data_driver_testbench_push_valid),
		.fifo_col_pusher_1_data_push_data(fifo_col_pusher_1_data_driver_testbench_push_data),
		.fifo_col_pusher_1_data_push_ready(fifo_col_pusher_1_data_driver_testbench_push_ready),
		.fifo_row_pusher_7_data_push_valid(fifo_row_pusher_7_data_driver_testbench_push_valid),
		.fifo_row_pusher_7_data_push_data(fifo_row_pusher_7_data_driver_testbench_push_data),
		.fifo_row_pusher_7_data_push_ready(fifo_row_pusher_7_data_driver_testbench_push_ready),
		.col_pusher_4_counter_delta_ready(col_pusher_4_driver_testbench_counter_delta_ready),
		.col_pusher_4_counter_delta(col_pusher_4_driver_testbench_counter_delta),
		.col_pusher_6_counter_delta_ready(col_pusher_6_driver_testbench_counter_delta_ready),
		.col_pusher_6_counter_delta(col_pusher_6_driver_testbench_counter_delta),
		.counter_delta_ready(testbench_counter_delta_ready),
		.counter_pop_ready(testbench_counter_pop_ready),
		.counter_pop_valid(testbench_counter_pop_valid),
		.expose_executed(testbench_executed)
	);
	wire [0:0] pe_5_4_executed;
	pe_5_4 pe_5_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_5_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_4_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_5_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_4_west_pop_valid),
		.array_array_6638d_q(array_array_6638d_q),
		.array_array_6638d_w(array_array_6638d_driver_pe_5_4_w),
		.array_array_6638d_widx(array_array_6638d_driver_pe_5_4_widx),
		.array_array_6638d_d(array_array_6638d_driver_pe_5_4_d),
		.fifo_pe_5_5_west_push_valid(fifo_pe_5_5_west_driver_pe_5_4_push_valid),
		.fifo_pe_5_5_west_push_data(fifo_pe_5_5_west_driver_pe_5_4_push_data),
		.fifo_pe_5_5_west_push_ready(fifo_pe_5_5_west_driver_pe_5_4_push_ready),
		.fifo_pe_6_4_north_push_valid(fifo_pe_6_4_north_driver_pe_5_4_push_valid),
		.fifo_pe_6_4_north_push_data(fifo_pe_6_4_north_driver_pe_5_4_push_data),
		.fifo_pe_6_4_north_push_ready(fifo_pe_6_4_north_driver_pe_5_4_push_ready),
		.pe_5_5_counter_delta_ready(pe_5_5_driver_pe_5_4_counter_delta_ready),
		.pe_5_5_counter_delta(pe_5_5_driver_pe_5_4_counter_delta),
		.counter_delta_ready(pe_5_4_counter_delta_ready),
		.counter_pop_ready(pe_5_4_counter_pop_ready),
		.counter_pop_valid(pe_5_4_counter_pop_valid),
		.expose_executed(pe_5_4_executed)
	);
	wire [0:0] pe_7_7_executed;
	pe_7_7 pe_7_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_7_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_7_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_7_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_7_west_pop_valid),
		.fifo_pe_7_8_west_push_valid(fifo_pe_7_8_west_driver_pe_7_7_push_valid),
		.fifo_pe_7_8_west_push_data(fifo_pe_7_8_west_driver_pe_7_7_push_data),
		.fifo_pe_7_8_west_push_ready(fifo_pe_7_8_west_driver_pe_7_7_push_ready),
		.array_array_66b21_q(array_array_66b21_q),
		.array_array_66b21_w(array_array_66b21_driver_pe_7_7_w),
		.array_array_66b21_widx(array_array_66b21_driver_pe_7_7_widx),
		.array_array_66b21_d(array_array_66b21_driver_pe_7_7_d),
		.pe_7_8_counter_delta_ready(pe_7_8_driver_pe_7_7_counter_delta_ready),
		.pe_7_8_counter_delta(pe_7_8_driver_pe_7_7_counter_delta),
		.fifo_pe_8_7_north_push_valid(fifo_pe_8_7_north_driver_pe_7_7_push_valid),
		.fifo_pe_8_7_north_push_data(fifo_pe_8_7_north_driver_pe_7_7_push_data),
		.fifo_pe_8_7_north_push_ready(fifo_pe_8_7_north_driver_pe_7_7_push_ready),
		.counter_delta_ready(pe_7_7_counter_delta_ready),
		.counter_pop_ready(pe_7_7_counter_pop_ready),
		.counter_pop_valid(pe_7_7_counter_pop_valid),
		.expose_executed(pe_7_7_executed)
	);
	wire [0:0] sink_68689_executed;
	sink_68689 sink_68689_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_68689_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_68689_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_68689_north_pop_valid),
		.counter_delta_ready(sink_68689_counter_delta_ready),
		.counter_pop_ready(sink_68689_counter_pop_ready),
		.counter_pop_valid(sink_68689_counter_pop_valid),
		.expose_executed(sink_68689_executed)
	);
	wire [0:0] pe_3_8_executed;
	pe_3_8 pe_3_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_3_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_8_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_3_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_8_west_pop_valid),
		.fifo_sink_68649_west_push_valid(fifo_sink_68649_west_driver_pe_3_8_push_valid),
		.fifo_sink_68649_west_push_data(fifo_sink_68649_west_driver_pe_3_8_push_data),
		.fifo_sink_68649_west_push_ready(fifo_sink_68649_west_driver_pe_3_8_push_ready),
		.array_array_6614d_q(array_array_6614d_q),
		.array_array_6614d_w(array_array_6614d_driver_pe_3_8_w),
		.array_array_6614d_widx(array_array_6614d_driver_pe_3_8_widx),
		.array_array_6614d_d(array_array_6614d_driver_pe_3_8_d),
		.sink_68649_counter_delta_ready(sink_68649_driver_pe_3_8_counter_delta_ready),
		.sink_68649_counter_delta(sink_68649_driver_pe_3_8_counter_delta),
		.fifo_pe_4_8_north_push_valid(fifo_pe_4_8_north_driver_pe_3_8_push_valid),
		.fifo_pe_4_8_north_push_data(fifo_pe_4_8_north_driver_pe_3_8_push_data),
		.fifo_pe_4_8_north_push_ready(fifo_pe_4_8_north_driver_pe_3_8_push_ready),
		.counter_delta_ready(pe_3_8_counter_delta_ready),
		.counter_pop_ready(pe_3_8_counter_pop_ready),
		.counter_pop_valid(pe_3_8_counter_pop_valid),
		.expose_executed(pe_3_8_executed)
	);
	wire [0:0] pe_2_1_executed;
	pe_2_1 pe_2_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_2_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_1_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_2_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_1_west_pop_valid),
		.fifo_pe_3_1_north_push_valid(fifo_pe_3_1_north_driver_pe_2_1_push_valid),
		.fifo_pe_3_1_north_push_data(fifo_pe_3_1_north_driver_pe_2_1_push_data),
		.fifo_pe_3_1_north_push_ready(fifo_pe_3_1_north_driver_pe_2_1_push_ready),
		.pe_2_2_counter_delta_ready(pe_2_2_driver_pe_2_1_counter_delta_ready),
		.pe_2_2_counter_delta(pe_2_2_driver_pe_2_1_counter_delta),
		.pe_3_1_counter_delta_ready(pe_3_1_driver_pe_2_1_counter_delta_ready),
		.pe_3_1_counter_delta(pe_3_1_driver_pe_2_1_counter_delta),
		.fifo_pe_2_2_west_push_valid(fifo_pe_2_2_west_driver_pe_2_1_push_valid),
		.fifo_pe_2_2_west_push_data(fifo_pe_2_2_west_driver_pe_2_1_push_data),
		.fifo_pe_2_2_west_push_ready(fifo_pe_2_2_west_driver_pe_2_1_push_ready),
		.array_array_656b5_q(array_array_656b5_q),
		.array_array_656b5_w(array_array_656b5_driver_pe_2_1_w),
		.array_array_656b5_widx(array_array_656b5_driver_pe_2_1_widx),
		.array_array_656b5_d(array_array_656b5_driver_pe_2_1_d),
		.counter_delta_ready(pe_2_1_counter_delta_ready),
		.counter_pop_ready(pe_2_1_counter_pop_ready),
		.counter_pop_valid(pe_2_1_counter_pop_valid),
		.expose_executed(pe_2_1_executed)
	);
	wire [0:0] pe_7_8_executed;
	pe_7_8 pe_7_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_7_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_8_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_7_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_8_west_pop_valid),
		.fifo_pe_8_8_north_push_valid(fifo_pe_8_8_north_driver_pe_7_8_push_valid),
		.fifo_pe_8_8_north_push_data(fifo_pe_8_8_north_driver_pe_7_8_push_data),
		.fifo_pe_8_8_north_push_ready(fifo_pe_8_8_north_driver_pe_7_8_push_ready),
		.array_array_66b51_q(array_array_66b51_q),
		.array_array_66b51_w(array_array_66b51_driver_pe_7_8_w),
		.array_array_66b51_widx(array_array_66b51_driver_pe_7_8_widx),
		.array_array_66b51_d(array_array_66b51_driver_pe_7_8_d),
		.fifo_sink_69d89_west_push_valid(fifo_sink_69d89_west_driver_pe_7_8_push_valid),
		.fifo_sink_69d89_west_push_data(fifo_sink_69d89_west_driver_pe_7_8_push_data),
		.fifo_sink_69d89_west_push_ready(fifo_sink_69d89_west_driver_pe_7_8_push_ready),
		.sink_69d89_counter_delta_ready(sink_69d89_driver_pe_7_8_counter_delta_ready),
		.sink_69d89_counter_delta(sink_69d89_driver_pe_7_8_counter_delta),
		.counter_delta_ready(pe_7_8_counter_delta_ready),
		.counter_pop_ready(pe_7_8_counter_pop_ready),
		.counter_pop_valid(pe_7_8_counter_pop_valid),
		.expose_executed(pe_7_8_executed)
	);
	wire [0:0] sink_68731_executed;
	sink_68731 sink_68731_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_68731_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_68731_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_68731_west_pop_valid),
		.counter_delta_ready(sink_68731_counter_delta_ready),
		.counter_pop_ready(sink_68731_counter_pop_ready),
		.counter_pop_valid(sink_68731_counter_pop_valid),
		.expose_executed(sink_68731_executed)
	);
	wire [0:0] col_pusher_7_executed;
	col_pusher_7 col_pusher_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_7_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_7_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_7_data_pop_valid),
		.fifo_pe_1_7_north_push_valid(fifo_pe_1_7_north_driver_col_pusher_7_push_valid),
		.fifo_pe_1_7_north_push_data(fifo_pe_1_7_north_driver_col_pusher_7_push_data),
		.fifo_pe_1_7_north_push_ready(fifo_pe_1_7_north_driver_col_pusher_7_push_ready),
		.counter_delta_ready(col_pusher_7_counter_delta_ready),
		.counter_pop_ready(col_pusher_7_counter_pop_ready),
		.counter_pop_valid(col_pusher_7_counter_pop_valid),
		.expose_executed(col_pusher_7_executed)
	);
	wire [0:0] pe_5_8_executed;
	pe_5_8 pe_5_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_5_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_8_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_5_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_8_north_pop_valid),
		.fifo_sink_69c1d_west_push_valid(fifo_sink_69c1d_west_driver_pe_5_8_push_valid),
		.fifo_sink_69c1d_west_push_data(fifo_sink_69c1d_west_driver_pe_5_8_push_data),
		.fifo_sink_69c1d_west_push_ready(fifo_sink_69c1d_west_driver_pe_5_8_push_ready),
		.array_array_66851_q(array_array_66851_q),
		.array_array_66851_w(array_array_66851_driver_pe_5_8_w),
		.array_array_66851_widx(array_array_66851_driver_pe_5_8_widx),
		.array_array_66851_d(array_array_66851_driver_pe_5_8_d),
		.sink_69c1d_counter_delta_ready(sink_69c1d_driver_pe_5_8_counter_delta_ready),
		.sink_69c1d_counter_delta(sink_69c1d_driver_pe_5_8_counter_delta),
		.fifo_pe_6_8_north_push_valid(fifo_pe_6_8_north_driver_pe_5_8_push_valid),
		.fifo_pe_6_8_north_push_data(fifo_pe_6_8_north_driver_pe_5_8_push_data),
		.fifo_pe_6_8_north_push_ready(fifo_pe_6_8_north_driver_pe_5_8_push_ready),
		.counter_delta_ready(pe_5_8_counter_delta_ready),
		.counter_pop_ready(pe_5_8_counter_pop_ready),
		.counter_pop_valid(pe_5_8_counter_pop_valid),
		.expose_executed(pe_5_8_executed)
	);
	wire [0:0] col_pusher_8_executed;
	col_pusher_8 col_pusher_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_8_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_8_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_8_data_pop_valid),
		.fifo_pe_1_8_north_push_valid(fifo_pe_1_8_north_driver_col_pusher_8_push_valid),
		.fifo_pe_1_8_north_push_data(fifo_pe_1_8_north_driver_col_pusher_8_push_data),
		.fifo_pe_1_8_north_push_ready(fifo_pe_1_8_north_driver_col_pusher_8_push_ready),
		.counter_delta_ready(col_pusher_8_counter_delta_ready),
		.counter_pop_ready(col_pusher_8_counter_pop_ready),
		.counter_pop_valid(col_pusher_8_counter_pop_valid),
		.expose_executed(col_pusher_8_executed)
	);
	wire [0:0] sink_685a1_executed;
	sink_685a1 sink_685a1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_685a1_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_685a1_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_685a1_north_pop_valid),
		.counter_delta_ready(sink_685a1_counter_delta_ready),
		.counter_pop_ready(sink_685a1_counter_pop_ready),
		.counter_pop_valid(sink_685a1_counter_pop_valid),
		.expose_executed(sink_685a1_executed)
	);
	wire [0:0] pe_8_1_executed;
	pe_8_1 pe_8_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_8_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_1_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_8_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_1_north_pop_valid),
		.fifo_pe_8_2_west_push_valid(fifo_pe_8_2_west_driver_pe_8_1_push_valid),
		.fifo_pe_8_2_west_push_data(fifo_pe_8_2_west_driver_pe_8_1_push_data),
		.fifo_pe_8_2_west_push_ready(fifo_pe_8_2_west_driver_pe_8_1_push_ready),
		.fifo_sink_684d1_north_push_valid(fifo_sink_684d1_north_driver_pe_8_1_push_valid),
		.fifo_sink_684d1_north_push_data(fifo_sink_684d1_north_driver_pe_8_1_push_data),
		.fifo_sink_684d1_north_push_ready(fifo_sink_684d1_north_driver_pe_8_1_push_ready),
		.pe_8_2_counter_delta_ready(pe_8_2_driver_pe_8_1_counter_delta_ready),
		.pe_8_2_counter_delta(pe_8_2_driver_pe_8_1_counter_delta),
		.sink_684d1_counter_delta_ready(sink_684d1_driver_pe_8_1_counter_delta_ready),
		.sink_684d1_counter_delta(sink_684d1_driver_pe_8_1_counter_delta),
		.array_array_66b81_q(array_array_66b81_q),
		.array_array_66b81_w(array_array_66b81_driver_pe_8_1_w),
		.array_array_66b81_widx(array_array_66b81_driver_pe_8_1_widx),
		.array_array_66b81_d(array_array_66b81_driver_pe_8_1_d),
		.counter_delta_ready(pe_8_1_counter_delta_ready),
		.counter_pop_ready(pe_8_1_counter_pop_ready),
		.counter_pop_valid(pe_8_1_counter_pop_valid),
		.expose_executed(pe_8_1_executed)
	);
	wire [0:0] row_pusher_8_executed;
	row_pusher_8 row_pusher_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_8_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_8_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_8_data_pop_valid),
		.fifo_pe_8_1_west_push_valid(fifo_pe_8_1_west_driver_row_pusher_8_push_valid),
		.fifo_pe_8_1_west_push_data(fifo_pe_8_1_west_driver_row_pusher_8_push_data),
		.fifo_pe_8_1_west_push_ready(fifo_pe_8_1_west_driver_row_pusher_8_push_ready),
		.counter_delta_ready(row_pusher_8_counter_delta_ready),
		.counter_pop_ready(row_pusher_8_counter_pop_ready),
		.counter_pop_valid(row_pusher_8_counter_pop_valid),
		.expose_executed(row_pusher_8_executed)
	);
	wire [0:0] sink_68561_executed;
	sink_68561 sink_68561_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_68561_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_68561_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_68561_west_pop_valid),
		.counter_delta_ready(sink_68561_counter_delta_ready),
		.counter_pop_ready(sink_68561_counter_pop_ready),
		.counter_pop_valid(sink_68561_counter_pop_valid),
		.expose_executed(sink_68561_executed)
	);
	wire [0:0] pe_7_3_executed;
	pe_7_3 pe_7_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_7_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_3_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_7_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_3_north_pop_valid),
		.fifo_pe_7_4_west_push_valid(fifo_pe_7_4_west_driver_pe_7_3_push_valid),
		.fifo_pe_7_4_west_push_data(fifo_pe_7_4_west_driver_pe_7_3_push_data),
		.fifo_pe_7_4_west_push_ready(fifo_pe_7_4_west_driver_pe_7_3_push_ready),
		.pe_7_4_counter_delta_ready(pe_7_4_driver_pe_7_3_counter_delta_ready),
		.pe_7_4_counter_delta(pe_7_4_driver_pe_7_3_counter_delta),
		.fifo_pe_8_3_north_push_valid(fifo_pe_8_3_north_driver_pe_7_3_push_valid),
		.fifo_pe_8_3_north_push_data(fifo_pe_8_3_north_driver_pe_7_3_push_data),
		.fifo_pe_8_3_north_push_ready(fifo_pe_8_3_north_driver_pe_7_3_push_ready),
		.array_array_66a61_q(array_array_66a61_q),
		.array_array_66a61_w(array_array_66a61_driver_pe_7_3_w),
		.array_array_66a61_widx(array_array_66a61_driver_pe_7_3_widx),
		.array_array_66a61_d(array_array_66a61_driver_pe_7_3_d),
		.counter_delta_ready(pe_7_3_counter_delta_ready),
		.counter_pop_ready(pe_7_3_counter_pop_ready),
		.counter_pop_valid(pe_7_3_counter_pop_valid),
		.expose_executed(pe_7_3_executed)
	);
	wire [0:0] pe_3_6_executed;
	pe_3_6 pe_3_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_3_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_6_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_3_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_6_west_pop_valid),
		.fifo_pe_4_6_north_push_valid(fifo_pe_4_6_north_driver_pe_3_6_push_valid),
		.fifo_pe_4_6_north_push_data(fifo_pe_4_6_north_driver_pe_3_6_push_data),
		.fifo_pe_4_6_north_push_ready(fifo_pe_4_6_north_driver_pe_3_6_push_ready),
		.pe_3_7_counter_delta_ready(pe_3_7_driver_pe_3_6_counter_delta_ready),
		.pe_3_7_counter_delta(pe_3_7_driver_pe_3_6_counter_delta),
		.fifo_pe_3_7_west_push_valid(fifo_pe_3_7_west_driver_pe_3_6_push_valid),
		.fifo_pe_3_7_west_push_data(fifo_pe_3_7_west_driver_pe_3_6_push_data),
		.fifo_pe_3_7_west_push_ready(fifo_pe_3_7_west_driver_pe_3_6_push_ready),
		.array_array_660f5_q(array_array_660f5_q),
		.array_array_660f5_w(array_array_660f5_driver_pe_3_6_w),
		.array_array_660f5_widx(array_array_660f5_driver_pe_3_6_widx),
		.array_array_660f5_d(array_array_660f5_driver_pe_3_6_d),
		.counter_delta_ready(pe_3_6_counter_delta_ready),
		.counter_pop_ready(pe_3_6_counter_pop_ready),
		.counter_pop_valid(pe_3_6_counter_pop_valid),
		.expose_executed(pe_3_6_executed)
	);
	wire [0:0] col_pusher_3_executed;
	col_pusher_3 col_pusher_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_3_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_3_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_3_data_pop_valid),
		.fifo_pe_1_3_north_push_valid(fifo_pe_1_3_north_driver_col_pusher_3_push_valid),
		.fifo_pe_1_3_north_push_data(fifo_pe_1_3_north_driver_col_pusher_3_push_data),
		.fifo_pe_1_3_north_push_ready(fifo_pe_1_3_north_driver_col_pusher_3_push_ready),
		.counter_delta_ready(col_pusher_3_counter_delta_ready),
		.counter_pop_ready(col_pusher_3_counter_pop_ready),
		.counter_pop_valid(col_pusher_3_counter_pop_valid),
		.expose_executed(col_pusher_3_executed)
	);
	wire [0:0] col_pusher_5_executed;
	col_pusher_5 col_pusher_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_5_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_5_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_5_data_pop_valid),
		.fifo_pe_1_5_north_push_valid(fifo_pe_1_5_north_driver_col_pusher_5_push_valid),
		.fifo_pe_1_5_north_push_data(fifo_pe_1_5_north_driver_col_pusher_5_push_data),
		.fifo_pe_1_5_north_push_ready(fifo_pe_1_5_north_driver_col_pusher_5_push_ready),
		.counter_delta_ready(col_pusher_5_counter_delta_ready),
		.counter_pop_ready(col_pusher_5_counter_pop_ready),
		.counter_pop_valid(col_pusher_5_counter_pop_valid),
		.expose_executed(col_pusher_5_executed)
	);
	wire [0:0] sink_68445_executed;
	sink_68445 sink_68445_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_68445_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_68445_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_68445_west_pop_valid),
		.counter_delta_ready(sink_68445_counter_delta_ready),
		.counter_pop_ready(sink_68445_counter_pop_ready),
		.counter_pop_valid(sink_68445_counter_pop_valid),
		.expose_executed(sink_68445_executed)
	);
	wire [0:0] pe_1_4_executed;
	pe_1_4 pe_1_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_1_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_4_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_1_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_4_north_pop_valid),
		.pe_1_5_counter_delta_ready(pe_1_5_driver_pe_1_4_counter_delta_ready),
		.pe_1_5_counter_delta(pe_1_5_driver_pe_1_4_counter_delta),
		.array_array_655d1_q(array_array_655d1_q),
		.array_array_655d1_w(array_array_655d1_driver_pe_1_4_w),
		.array_array_655d1_widx(array_array_655d1_driver_pe_1_4_widx),
		.array_array_655d1_d(array_array_655d1_driver_pe_1_4_d),
		.fifo_pe_1_5_west_push_valid(fifo_pe_1_5_west_driver_pe_1_4_push_valid),
		.fifo_pe_1_5_west_push_data(fifo_pe_1_5_west_driver_pe_1_4_push_data),
		.fifo_pe_1_5_west_push_ready(fifo_pe_1_5_west_driver_pe_1_4_push_ready),
		.fifo_pe_2_4_north_push_valid(fifo_pe_2_4_north_driver_pe_1_4_push_valid),
		.fifo_pe_2_4_north_push_data(fifo_pe_2_4_north_driver_pe_1_4_push_data),
		.fifo_pe_2_4_north_push_ready(fifo_pe_2_4_north_driver_pe_1_4_push_ready),
		.counter_delta_ready(pe_1_4_counter_delta_ready),
		.counter_pop_ready(pe_1_4_counter_pop_ready),
		.counter_pop_valid(pe_1_4_counter_pop_valid),
		.expose_executed(pe_1_4_executed)
	);
	wire [0:0] sink_69e91_executed;
	sink_69e91 sink_69e91_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_69e91_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_69e91_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_69e91_north_pop_valid),
		.counter_delta_ready(sink_69e91_counter_delta_ready),
		.counter_pop_ready(sink_69e91_counter_pop_ready),
		.counter_pop_valid(sink_69e91_counter_pop_valid),
		.expose_executed(sink_69e91_executed)
	);
	wire [0:0] pe_2_6_executed;
	pe_2_6 pe_2_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_2_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_6_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_2_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_6_north_pop_valid),
		.pe_2_7_counter_delta_ready(pe_2_7_driver_pe_2_6_counter_delta_ready),
		.pe_2_7_counter_delta(pe_2_7_driver_pe_2_6_counter_delta),
		.fifo_pe_2_7_west_push_valid(fifo_pe_2_7_west_driver_pe_2_6_push_valid),
		.fifo_pe_2_7_west_push_data(fifo_pe_2_7_west_driver_pe_2_6_push_data),
		.fifo_pe_2_7_west_push_ready(fifo_pe_2_7_west_driver_pe_2_6_push_ready),
		.array_array_65791_q(array_array_65791_q),
		.array_array_65791_w(array_array_65791_driver_pe_2_6_w),
		.array_array_65791_widx(array_array_65791_driver_pe_2_6_widx),
		.array_array_65791_d(array_array_65791_driver_pe_2_6_d),
		.fifo_pe_3_6_north_push_valid(fifo_pe_3_6_north_driver_pe_2_6_push_valid),
		.fifo_pe_3_6_north_push_data(fifo_pe_3_6_north_driver_pe_2_6_push_data),
		.fifo_pe_3_6_north_push_ready(fifo_pe_3_6_north_driver_pe_2_6_push_ready),
		.counter_delta_ready(pe_2_6_counter_delta_ready),
		.counter_pop_ready(pe_2_6_counter_pop_ready),
		.counter_pop_valid(pe_2_6_counter_pop_valid),
		.expose_executed(pe_2_6_executed)
	);
	wire [0:0] pe_1_2_executed;
	pe_1_2 pe_1_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_1_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_2_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_1_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_2_west_pop_valid),
		.fifo_pe_2_2_north_push_valid(fifo_pe_2_2_north_driver_pe_1_2_push_valid),
		.fifo_pe_2_2_north_push_data(fifo_pe_2_2_north_driver_pe_1_2_push_data),
		.fifo_pe_2_2_north_push_ready(fifo_pe_2_2_north_driver_pe_1_2_push_ready),
		.fifo_pe_1_3_west_push_valid(fifo_pe_1_3_west_driver_pe_1_2_push_valid),
		.fifo_pe_1_3_west_push_data(fifo_pe_1_3_west_driver_pe_1_2_push_data),
		.fifo_pe_1_3_west_push_ready(fifo_pe_1_3_west_driver_pe_1_2_push_ready),
		.pe_1_3_counter_delta_ready(pe_1_3_driver_pe_1_2_counter_delta_ready),
		.pe_1_3_counter_delta(pe_1_3_driver_pe_1_2_counter_delta),
		.array_array_65579_q(array_array_65579_q),
		.array_array_65579_w(array_array_65579_driver_pe_1_2_w),
		.array_array_65579_widx(array_array_65579_driver_pe_1_2_widx),
		.array_array_65579_d(array_array_65579_driver_pe_1_2_d),
		.counter_delta_ready(pe_1_2_counter_delta_ready),
		.counter_pop_ready(pe_1_2_counter_pop_ready),
		.counter_pop_valid(pe_1_2_counter_pop_valid),
		.expose_executed(pe_1_2_executed)
	);
	wire [0:0] pe_4_6_executed;
	pe_4_6 pe_4_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_4_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_6_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_4_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_6_west_pop_valid),
		.pe_4_7_counter_delta_ready(pe_4_7_driver_pe_4_6_counter_delta_ready),
		.pe_4_7_counter_delta(pe_4_7_driver_pe_4_6_counter_delta),
		.fifo_pe_5_6_north_push_valid(fifo_pe_5_6_north_driver_pe_4_6_push_valid),
		.fifo_pe_5_6_north_push_data(fifo_pe_5_6_north_driver_pe_4_6_push_data),
		.fifo_pe_5_6_north_push_ready(fifo_pe_5_6_north_driver_pe_4_6_push_ready),
		.fifo_pe_4_7_west_push_valid(fifo_pe_4_7_west_driver_pe_4_6_push_valid),
		.fifo_pe_4_7_west_push_data(fifo_pe_4_7_west_driver_pe_4_6_push_data),
		.fifo_pe_4_7_west_push_ready(fifo_pe_4_7_west_driver_pe_4_6_push_ready),
		.array_array_6626d_q(array_array_6626d_q),
		.array_array_6626d_w(array_array_6626d_driver_pe_4_6_w),
		.array_array_6626d_widx(array_array_6626d_driver_pe_4_6_widx),
		.array_array_6626d_d(array_array_6626d_driver_pe_4_6_d),
		.counter_delta_ready(pe_4_6_counter_delta_ready),
		.counter_pop_ready(pe_4_6_counter_pop_ready),
		.counter_pop_valid(pe_4_6_counter_pop_valid),
		.expose_executed(pe_4_6_executed)
	);
	wire [0:0] pe_7_4_executed;
	pe_7_4 pe_7_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_7_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_4_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_7_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_4_north_pop_valid),
		.array_array_66a91_q(array_array_66a91_q),
		.array_array_66a91_w(array_array_66a91_driver_pe_7_4_w),
		.array_array_66a91_widx(array_array_66a91_driver_pe_7_4_widx),
		.array_array_66a91_d(array_array_66a91_driver_pe_7_4_d),
		.pe_7_5_counter_delta_ready(pe_7_5_driver_pe_7_4_counter_delta_ready),
		.pe_7_5_counter_delta(pe_7_5_driver_pe_7_4_counter_delta),
		.fifo_pe_7_5_west_push_valid(fifo_pe_7_5_west_driver_pe_7_4_push_valid),
		.fifo_pe_7_5_west_push_data(fifo_pe_7_5_west_driver_pe_7_4_push_data),
		.fifo_pe_7_5_west_push_ready(fifo_pe_7_5_west_driver_pe_7_4_push_ready),
		.fifo_pe_8_4_north_push_valid(fifo_pe_8_4_north_driver_pe_7_4_push_valid),
		.fifo_pe_8_4_north_push_data(fifo_pe_8_4_north_driver_pe_7_4_push_data),
		.fifo_pe_8_4_north_push_ready(fifo_pe_8_4_north_driver_pe_7_4_push_ready),
		.counter_delta_ready(pe_7_4_counter_delta_ready),
		.counter_pop_ready(pe_7_4_counter_pop_ready),
		.counter_pop_valid(pe_7_4_counter_pop_valid),
		.expose_executed(pe_7_4_executed)
	);
	wire [0:0] pe_6_8_executed;
	pe_6_8 pe_6_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_6_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_8_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_6_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_8_north_pop_valid),
		.array_array_669d1_q(array_array_669d1_q),
		.array_array_669d1_w(array_array_669d1_driver_pe_6_8_w),
		.array_array_669d1_widx(array_array_669d1_driver_pe_6_8_widx),
		.array_array_669d1_d(array_array_669d1_driver_pe_6_8_d),
		.fifo_pe_7_8_north_push_valid(fifo_pe_7_8_north_driver_pe_6_8_push_valid),
		.fifo_pe_7_8_north_push_data(fifo_pe_7_8_north_driver_pe_6_8_push_data),
		.fifo_pe_7_8_north_push_ready(fifo_pe_7_8_north_driver_pe_6_8_push_ready),
		.sink_686ed_counter_delta_ready(sink_686ed_driver_pe_6_8_counter_delta_ready),
		.sink_686ed_counter_delta(sink_686ed_driver_pe_6_8_counter_delta),
		.fifo_sink_686ed_west_push_valid(fifo_sink_686ed_west_driver_pe_6_8_push_valid),
		.fifo_sink_686ed_west_push_data(fifo_sink_686ed_west_driver_pe_6_8_push_data),
		.fifo_sink_686ed_west_push_ready(fifo_sink_686ed_west_driver_pe_6_8_push_ready),
		.counter_delta_ready(pe_6_8_counter_delta_ready),
		.counter_pop_ready(pe_6_8_counter_pop_ready),
		.counter_pop_valid(pe_6_8_counter_pop_valid),
		.expose_executed(pe_6_8_executed)
	);
	wire [0:0] sink_69d89_executed;
	sink_69d89 sink_69d89_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_69d89_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_69d89_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_69d89_west_pop_valid),
		.counter_delta_ready(sink_69d89_counter_delta_ready),
		.counter_pop_ready(sink_69d89_counter_pop_ready),
		.counter_pop_valid(sink_69d89_counter_pop_valid),
		.expose_executed(sink_69d89_executed)
	);
	wire [0:0] pe_4_5_executed;
	pe_4_5 pe_4_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_4_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_4_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_4_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_4_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_4_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_4_5_north_pop_valid),
		.array_array_6623d_q(array_array_6623d_q),
		.array_array_6623d_w(array_array_6623d_driver_pe_4_5_w),
		.array_array_6623d_widx(array_array_6623d_driver_pe_4_5_widx),
		.array_array_6623d_d(array_array_6623d_driver_pe_4_5_d),
		.fifo_pe_5_5_north_push_valid(fifo_pe_5_5_north_driver_pe_4_5_push_valid),
		.fifo_pe_5_5_north_push_data(fifo_pe_5_5_north_driver_pe_4_5_push_data),
		.fifo_pe_5_5_north_push_ready(fifo_pe_5_5_north_driver_pe_4_5_push_ready),
		.fifo_pe_4_6_west_push_valid(fifo_pe_4_6_west_driver_pe_4_5_push_valid),
		.fifo_pe_4_6_west_push_data(fifo_pe_4_6_west_driver_pe_4_5_push_data),
		.fifo_pe_4_6_west_push_ready(fifo_pe_4_6_west_driver_pe_4_5_push_ready),
		.pe_4_6_counter_delta_ready(pe_4_6_driver_pe_4_5_counter_delta_ready),
		.pe_4_6_counter_delta(pe_4_6_driver_pe_4_5_counter_delta),
		.counter_delta_ready(pe_4_5_counter_delta_ready),
		.counter_pop_ready(pe_4_5_counter_pop_ready),
		.counter_pop_valid(pe_4_5_counter_pop_valid),
		.expose_executed(pe_4_5_executed)
	);
	wire [0:0] pe_6_3_executed;
	pe_6_3 pe_6_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_6_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_3_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_6_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_3_west_pop_valid),
		.array_array_668e1_q(array_array_668e1_q),
		.array_array_668e1_w(array_array_668e1_driver_pe_6_3_w),
		.array_array_668e1_widx(array_array_668e1_driver_pe_6_3_widx),
		.array_array_668e1_d(array_array_668e1_driver_pe_6_3_d),
		.fifo_pe_6_4_west_push_valid(fifo_pe_6_4_west_driver_pe_6_3_push_valid),
		.fifo_pe_6_4_west_push_data(fifo_pe_6_4_west_driver_pe_6_3_push_data),
		.fifo_pe_6_4_west_push_ready(fifo_pe_6_4_west_driver_pe_6_3_push_ready),
		.fifo_pe_7_3_north_push_valid(fifo_pe_7_3_north_driver_pe_6_3_push_valid),
		.fifo_pe_7_3_north_push_data(fifo_pe_7_3_north_driver_pe_6_3_push_data),
		.fifo_pe_7_3_north_push_ready(fifo_pe_7_3_north_driver_pe_6_3_push_ready),
		.pe_6_4_counter_delta_ready(pe_6_4_driver_pe_6_3_counter_delta_ready),
		.pe_6_4_counter_delta(pe_6_4_driver_pe_6_3_counter_delta),
		.counter_delta_ready(pe_6_3_counter_delta_ready),
		.counter_pop_ready(pe_6_3_counter_pop_ready),
		.counter_pop_valid(pe_6_3_counter_pop_valid),
		.expose_executed(pe_6_3_executed)
	);
	wire [0:0] col_pusher_6_executed;
	col_pusher_6 col_pusher_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_6_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_6_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_6_data_pop_valid),
		.fifo_pe_1_6_north_push_valid(fifo_pe_1_6_north_driver_col_pusher_6_push_valid),
		.fifo_pe_1_6_north_push_data(fifo_pe_1_6_north_driver_col_pusher_6_push_data),
		.fifo_pe_1_6_north_push_ready(fifo_pe_1_6_north_driver_col_pusher_6_push_ready),
		.counter_delta_ready(col_pusher_6_counter_delta_ready),
		.counter_pop_ready(col_pusher_6_counter_pop_ready),
		.counter_pop_valid(col_pusher_6_counter_pop_valid),
		.expose_executed(col_pusher_6_executed)
	);
	wire [0:0] pe_1_3_executed;
	pe_1_3 pe_1_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_1_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_3_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_1_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_3_north_pop_valid),
		.pe_1_4_counter_delta_ready(pe_1_4_driver_pe_1_3_counter_delta_ready),
		.pe_1_4_counter_delta(pe_1_4_driver_pe_1_3_counter_delta),
		.fifo_pe_1_4_west_push_valid(fifo_pe_1_4_west_driver_pe_1_3_push_valid),
		.fifo_pe_1_4_west_push_data(fifo_pe_1_4_west_driver_pe_1_3_push_data),
		.fifo_pe_1_4_west_push_ready(fifo_pe_1_4_west_driver_pe_1_3_push_ready),
		.fifo_pe_2_3_north_push_valid(fifo_pe_2_3_north_driver_pe_1_3_push_valid),
		.fifo_pe_2_3_north_push_data(fifo_pe_2_3_north_driver_pe_1_3_push_data),
		.fifo_pe_2_3_north_push_ready(fifo_pe_2_3_north_driver_pe_1_3_push_ready),
		.array_array_655a5_q(array_array_655a5_q),
		.array_array_655a5_w(array_array_655a5_driver_pe_1_3_w),
		.array_array_655a5_widx(array_array_655a5_driver_pe_1_3_widx),
		.array_array_655a5_d(array_array_655a5_driver_pe_1_3_d),
		.counter_delta_ready(pe_1_3_counter_delta_ready),
		.counter_pop_ready(pe_1_3_counter_pop_ready),
		.counter_pop_valid(pe_1_3_counter_pop_valid),
		.expose_executed(pe_1_3_executed)
	);
	wire [0:0] row_pusher_3_executed;
	row_pusher_3 row_pusher_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_3_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_3_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_3_data_pop_valid),
		.fifo_pe_3_1_west_push_valid(fifo_pe_3_1_west_driver_row_pusher_3_push_valid),
		.fifo_pe_3_1_west_push_data(fifo_pe_3_1_west_driver_row_pusher_3_push_data),
		.fifo_pe_3_1_west_push_ready(fifo_pe_3_1_west_driver_row_pusher_3_push_ready),
		.counter_delta_ready(row_pusher_3_counter_delta_ready),
		.counter_pop_ready(row_pusher_3_counter_pop_ready),
		.counter_pop_valid(row_pusher_3_counter_pop_valid),
		.expose_executed(row_pusher_3_executed)
	);
	wire [0:0] pe_5_5_executed;
	pe_5_5 pe_5_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_5_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_5_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_5_north_pop_valid),
		.array_array_663bd_q(array_array_663bd_q),
		.array_array_663bd_w(array_array_663bd_driver_pe_5_5_w),
		.array_array_663bd_widx(array_array_663bd_driver_pe_5_5_widx),
		.array_array_663bd_d(array_array_663bd_driver_pe_5_5_d),
		.fifo_pe_6_5_north_push_valid(fifo_pe_6_5_north_driver_pe_5_5_push_valid),
		.fifo_pe_6_5_north_push_data(fifo_pe_6_5_north_driver_pe_5_5_push_data),
		.fifo_pe_6_5_north_push_ready(fifo_pe_6_5_north_driver_pe_5_5_push_ready),
		.fifo_pe_5_6_west_push_valid(fifo_pe_5_6_west_driver_pe_5_5_push_valid),
		.fifo_pe_5_6_west_push_data(fifo_pe_5_6_west_driver_pe_5_5_push_data),
		.fifo_pe_5_6_west_push_ready(fifo_pe_5_6_west_driver_pe_5_5_push_ready),
		.pe_5_6_counter_delta_ready(pe_5_6_driver_pe_5_5_counter_delta_ready),
		.pe_5_6_counter_delta(pe_5_6_driver_pe_5_5_counter_delta),
		.counter_delta_ready(pe_5_5_counter_delta_ready),
		.counter_pop_ready(pe_5_5_counter_pop_ready),
		.counter_pop_valid(pe_5_5_counter_pop_valid),
		.expose_executed(pe_5_5_executed)
	);
	wire [0:0] pe_6_7_executed;
	pe_6_7 pe_6_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_6_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_7_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_6_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_7_west_pop_valid),
		.fifo_pe_7_7_north_push_valid(fifo_pe_7_7_north_driver_pe_6_7_push_valid),
		.fifo_pe_7_7_north_push_data(fifo_pe_7_7_north_driver_pe_6_7_push_data),
		.fifo_pe_7_7_north_push_ready(fifo_pe_7_7_north_driver_pe_6_7_push_ready),
		.pe_6_8_counter_delta_ready(pe_6_8_driver_pe_6_7_counter_delta_ready),
		.pe_6_8_counter_delta(pe_6_8_driver_pe_6_7_counter_delta),
		.array_array_669a1_q(array_array_669a1_q),
		.array_array_669a1_w(array_array_669a1_driver_pe_6_7_w),
		.array_array_669a1_widx(array_array_669a1_driver_pe_6_7_widx),
		.array_array_669a1_d(array_array_669a1_driver_pe_6_7_d),
		.fifo_pe_6_8_west_push_valid(fifo_pe_6_8_west_driver_pe_6_7_push_valid),
		.fifo_pe_6_8_west_push_data(fifo_pe_6_8_west_driver_pe_6_7_push_data),
		.fifo_pe_6_8_west_push_ready(fifo_pe_6_8_west_driver_pe_6_7_push_ready),
		.counter_delta_ready(pe_6_7_counter_delta_ready),
		.counter_pop_ready(pe_6_7_counter_pop_ready),
		.counter_pop_valid(pe_6_7_counter_pop_valid),
		.expose_executed(pe_6_7_executed)
	);
	wire [0:0] sink_68771_executed;
	sink_68771 sink_68771_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_68771_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_68771_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_68771_north_pop_valid),
		.counter_delta_ready(sink_68771_counter_delta_ready),
		.counter_pop_ready(sink_68771_counter_pop_ready),
		.counter_pop_valid(sink_68771_counter_pop_valid),
		.expose_executed(sink_68771_executed)
	);
	wire [0:0] row_pusher_6_executed;
	row_pusher_6 row_pusher_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_6_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_6_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_6_data_pop_valid),
		.fifo_pe_6_1_west_push_valid(fifo_pe_6_1_west_driver_row_pusher_6_push_valid),
		.fifo_pe_6_1_west_push_data(fifo_pe_6_1_west_driver_row_pusher_6_push_data),
		.fifo_pe_6_1_west_push_ready(fifo_pe_6_1_west_driver_row_pusher_6_push_ready),
		.counter_delta_ready(row_pusher_6_counter_delta_ready),
		.counter_pop_ready(row_pusher_6_counter_pop_ready),
		.counter_pop_valid(row_pusher_6_counter_pop_valid),
		.expose_executed(row_pusher_6_executed)
	);
	wire [0:0] pe_7_5_executed;
	pe_7_5 pe_7_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_7_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_7_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_5_north_pop_valid),
		.array_array_66ac1_q(array_array_66ac1_q),
		.array_array_66ac1_w(array_array_66ac1_driver_pe_7_5_w),
		.array_array_66ac1_widx(array_array_66ac1_driver_pe_7_5_widx),
		.array_array_66ac1_d(array_array_66ac1_driver_pe_7_5_d),
		.fifo_pe_7_6_west_push_valid(fifo_pe_7_6_west_driver_pe_7_5_push_valid),
		.fifo_pe_7_6_west_push_data(fifo_pe_7_6_west_driver_pe_7_5_push_data),
		.fifo_pe_7_6_west_push_ready(fifo_pe_7_6_west_driver_pe_7_5_push_ready),
		.fifo_pe_8_5_north_push_valid(fifo_pe_8_5_north_driver_pe_7_5_push_valid),
		.fifo_pe_8_5_north_push_data(fifo_pe_8_5_north_driver_pe_7_5_push_data),
		.fifo_pe_8_5_north_push_ready(fifo_pe_8_5_north_driver_pe_7_5_push_ready),
		.pe_7_6_counter_delta_ready(pe_7_6_driver_pe_7_5_counter_delta_ready),
		.pe_7_6_counter_delta(pe_7_6_driver_pe_7_5_counter_delta),
		.counter_delta_ready(pe_7_5_counter_delta_ready),
		.counter_pop_ready(pe_7_5_counter_pop_ready),
		.counter_pop_valid(pe_7_5_counter_pop_valid),
		.expose_executed(pe_7_5_executed)
	);
	wire [0:0] pe_8_3_executed;
	pe_8_3 pe_8_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_8_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_3_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_8_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_3_west_pop_valid),
		.pe_8_4_counter_delta_ready(pe_8_4_driver_pe_8_3_counter_delta_ready),
		.pe_8_4_counter_delta(pe_8_4_driver_pe_8_3_counter_delta),
		.sink_68689_counter_delta_ready(sink_68689_driver_pe_8_3_counter_delta_ready),
		.sink_68689_counter_delta(sink_68689_driver_pe_8_3_counter_delta),
		.fifo_sink_68689_north_push_valid(fifo_sink_68689_north_driver_pe_8_3_push_valid),
		.fifo_sink_68689_north_push_data(fifo_sink_68689_north_driver_pe_8_3_push_data),
		.fifo_sink_68689_north_push_ready(fifo_sink_68689_north_driver_pe_8_3_push_ready),
		.array_array_66be1_q(array_array_66be1_q),
		.array_array_66be1_w(array_array_66be1_driver_pe_8_3_w),
		.array_array_66be1_widx(array_array_66be1_driver_pe_8_3_widx),
		.array_array_66be1_d(array_array_66be1_driver_pe_8_3_d),
		.fifo_pe_8_4_west_push_valid(fifo_pe_8_4_west_driver_pe_8_3_push_valid),
		.fifo_pe_8_4_west_push_data(fifo_pe_8_4_west_driver_pe_8_3_push_data),
		.fifo_pe_8_4_west_push_ready(fifo_pe_8_4_west_driver_pe_8_3_push_ready),
		.counter_delta_ready(pe_8_3_counter_delta_ready),
		.counter_pop_ready(pe_8_3_counter_pop_ready),
		.counter_pop_valid(pe_8_3_counter_pop_valid),
		.expose_executed(pe_8_3_executed)
	);
	wire [0:0] pe_3_2_executed;
	pe_3_2 pe_3_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_3_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_2_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_3_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_2_west_pop_valid),
		.array_array_66045_q(array_array_66045_q),
		.array_array_66045_w(array_array_66045_driver_pe_3_2_w),
		.array_array_66045_widx(array_array_66045_driver_pe_3_2_widx),
		.array_array_66045_d(array_array_66045_driver_pe_3_2_d),
		.fifo_pe_4_2_north_push_valid(fifo_pe_4_2_north_driver_pe_3_2_push_valid),
		.fifo_pe_4_2_north_push_data(fifo_pe_4_2_north_driver_pe_3_2_push_data),
		.fifo_pe_4_2_north_push_ready(fifo_pe_4_2_north_driver_pe_3_2_push_ready),
		.fifo_pe_3_3_west_push_valid(fifo_pe_3_3_west_driver_pe_3_2_push_valid),
		.fifo_pe_3_3_west_push_data(fifo_pe_3_3_west_driver_pe_3_2_push_data),
		.fifo_pe_3_3_west_push_ready(fifo_pe_3_3_west_driver_pe_3_2_push_ready),
		.pe_3_3_counter_delta_ready(pe_3_3_driver_pe_3_2_counter_delta_ready),
		.pe_3_3_counter_delta(pe_3_3_driver_pe_3_2_counter_delta),
		.counter_delta_ready(pe_3_2_counter_delta_ready),
		.counter_pop_ready(pe_3_2_counter_pop_ready),
		.counter_pop_valid(pe_3_2_counter_pop_valid),
		.expose_executed(pe_3_2_executed)
	);
	wire [0:0] row_pusher_5_executed;
	row_pusher_5 row_pusher_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_5_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_5_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_5_data_pop_valid),
		.fifo_pe_5_1_west_push_valid(fifo_pe_5_1_west_driver_row_pusher_5_push_valid),
		.fifo_pe_5_1_west_push_data(fifo_pe_5_1_west_driver_row_pusher_5_push_data),
		.fifo_pe_5_1_west_push_ready(fifo_pe_5_1_west_driver_row_pusher_5_push_ready),
		.counter_delta_ready(row_pusher_5_counter_delta_ready),
		.counter_pop_ready(row_pusher_5_counter_pop_ready),
		.counter_pop_valid(row_pusher_5_counter_pop_valid),
		.expose_executed(row_pusher_5_executed)
	);
	wire [0:0] pe_1_1_executed;
	pe_1_1 pe_1_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_1_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_1_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_1_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_1_north_pop_valid),
		.fifo_pe_2_1_north_push_valid(fifo_pe_2_1_north_driver_pe_1_1_push_valid),
		.fifo_pe_2_1_north_push_data(fifo_pe_2_1_north_driver_pe_1_1_push_data),
		.fifo_pe_2_1_north_push_ready(fifo_pe_2_1_north_driver_pe_1_1_push_ready),
		.pe_1_2_counter_delta_ready(pe_1_2_driver_pe_1_1_counter_delta_ready),
		.pe_1_2_counter_delta(pe_1_2_driver_pe_1_1_counter_delta),
		.array_array_6554d_q(array_array_6554d_q),
		.array_array_6554d_w(array_array_6554d_driver_pe_1_1_w),
		.array_array_6554d_widx(array_array_6554d_driver_pe_1_1_widx),
		.array_array_6554d_d(array_array_6554d_driver_pe_1_1_d),
		.fifo_pe_1_2_west_push_valid(fifo_pe_1_2_west_driver_pe_1_1_push_valid),
		.fifo_pe_1_2_west_push_data(fifo_pe_1_2_west_driver_pe_1_1_push_data),
		.fifo_pe_1_2_west_push_ready(fifo_pe_1_2_west_driver_pe_1_1_push_ready),
		.pe_2_1_counter_delta_ready(pe_2_1_driver_pe_1_1_counter_delta_ready),
		.pe_2_1_counter_delta(pe_2_1_driver_pe_1_1_counter_delta),
		.counter_delta_ready(pe_1_1_counter_delta_ready),
		.counter_pop_ready(pe_1_1_counter_pop_ready),
		.counter_pop_valid(pe_1_1_counter_pop_valid),
		.expose_executed(pe_1_1_executed)
	);
	wire [0:0] row_pusher_1_executed;
	row_pusher_1 row_pusher_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_1_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_1_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_1_data_pop_valid),
		.fifo_pe_1_1_west_push_valid(fifo_pe_1_1_west_driver_row_pusher_1_push_valid),
		.fifo_pe_1_1_west_push_data(fifo_pe_1_1_west_driver_row_pusher_1_push_data),
		.fifo_pe_1_1_west_push_ready(fifo_pe_1_1_west_driver_row_pusher_1_push_ready),
		.counter_delta_ready(row_pusher_1_counter_delta_ready),
		.counter_pop_ready(row_pusher_1_counter_pop_ready),
		.counter_pop_valid(row_pusher_1_counter_pop_valid),
		.expose_executed(row_pusher_1_executed)
	);
	wire [0:0] pe_3_3_executed;
	pe_3_3 pe_3_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_3_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_3_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_3_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_3_west_pop_valid),
		.pe_3_4_counter_delta_ready(pe_3_4_driver_pe_3_3_counter_delta_ready),
		.pe_3_4_counter_delta(pe_3_4_driver_pe_3_3_counter_delta),
		.fifo_pe_3_4_west_push_valid(fifo_pe_3_4_west_driver_pe_3_3_push_valid),
		.fifo_pe_3_4_west_push_data(fifo_pe_3_4_west_driver_pe_3_3_push_data),
		.fifo_pe_3_4_west_push_ready(fifo_pe_3_4_west_driver_pe_3_3_push_ready),
		.array_array_66071_q(array_array_66071_q),
		.array_array_66071_w(array_array_66071_driver_pe_3_3_w),
		.array_array_66071_widx(array_array_66071_driver_pe_3_3_widx),
		.array_array_66071_d(array_array_66071_driver_pe_3_3_d),
		.fifo_pe_4_3_north_push_valid(fifo_pe_4_3_north_driver_pe_3_3_push_valid),
		.fifo_pe_4_3_north_push_data(fifo_pe_4_3_north_driver_pe_3_3_push_data),
		.fifo_pe_4_3_north_push_ready(fifo_pe_4_3_north_driver_pe_3_3_push_ready),
		.counter_delta_ready(pe_3_3_counter_delta_ready),
		.counter_pop_ready(pe_3_3_counter_pop_ready),
		.counter_pop_valid(pe_3_3_counter_pop_valid),
		.expose_executed(pe_3_3_executed)
	);
	wire [0:0] pe_8_5_executed;
	pe_8_5 pe_8_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_8_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_8_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_5_north_pop_valid),
		.fifo_sink_69c5d_north_push_valid(fifo_sink_69c5d_north_driver_pe_8_5_push_valid),
		.fifo_sink_69c5d_north_push_data(fifo_sink_69c5d_north_driver_pe_8_5_push_data),
		.fifo_sink_69c5d_north_push_ready(fifo_sink_69c5d_north_driver_pe_8_5_push_ready),
		.sink_69c5d_counter_delta_ready(sink_69c5d_driver_pe_8_5_counter_delta_ready),
		.sink_69c5d_counter_delta(sink_69c5d_driver_pe_8_5_counter_delta),
		.array_array_66c45_q(array_array_66c45_q),
		.array_array_66c45_w(array_array_66c45_driver_pe_8_5_w),
		.array_array_66c45_widx(array_array_66c45_driver_pe_8_5_widx),
		.array_array_66c45_d(array_array_66c45_driver_pe_8_5_d),
		.fifo_pe_8_6_west_push_valid(fifo_pe_8_6_west_driver_pe_8_5_push_valid),
		.fifo_pe_8_6_west_push_data(fifo_pe_8_6_west_driver_pe_8_5_push_data),
		.fifo_pe_8_6_west_push_ready(fifo_pe_8_6_west_driver_pe_8_5_push_ready),
		.pe_8_6_counter_delta_ready(pe_8_6_driver_pe_8_5_counter_delta_ready),
		.pe_8_6_counter_delta(pe_8_6_driver_pe_8_5_counter_delta),
		.counter_delta_ready(pe_8_5_counter_delta_ready),
		.counter_pop_ready(pe_8_5_counter_pop_ready),
		.counter_pop_valid(pe_8_5_counter_pop_valid),
		.expose_executed(pe_8_5_executed)
	);
	wire [0:0] pe_8_7_executed;
	pe_8_7 pe_8_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_8_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_7_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_8_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_7_north_pop_valid),
		.fifo_pe_8_8_west_push_valid(fifo_pe_8_8_west_driver_pe_8_7_push_valid),
		.fifo_pe_8_8_west_push_data(fifo_pe_8_8_west_driver_pe_8_7_push_data),
		.fifo_pe_8_8_west_push_ready(fifo_pe_8_8_west_driver_pe_8_7_push_ready),
		.fifo_sink_69dd1_north_push_valid(fifo_sink_69dd1_north_driver_pe_8_7_push_valid),
		.fifo_sink_69dd1_north_push_data(fifo_sink_69dd1_north_driver_pe_8_7_push_data),
		.fifo_sink_69dd1_north_push_ready(fifo_sink_69dd1_north_driver_pe_8_7_push_ready),
		.array_array_66ca5_q(array_array_66ca5_q),
		.array_array_66ca5_w(array_array_66ca5_driver_pe_8_7_w),
		.array_array_66ca5_widx(array_array_66ca5_driver_pe_8_7_widx),
		.array_array_66ca5_d(array_array_66ca5_driver_pe_8_7_d),
		.pe_8_8_counter_delta_ready(pe_8_8_driver_pe_8_7_counter_delta_ready),
		.pe_8_8_counter_delta(pe_8_8_driver_pe_8_7_counter_delta),
		.sink_69dd1_counter_delta_ready(sink_69dd1_driver_pe_8_7_counter_delta_ready),
		.sink_69dd1_counter_delta(sink_69dd1_driver_pe_8_7_counter_delta),
		.counter_delta_ready(pe_8_7_counter_delta_ready),
		.counter_pop_ready(pe_8_7_counter_pop_ready),
		.counter_pop_valid(pe_8_7_counter_pop_valid),
		.expose_executed(pe_8_7_executed)
	);
	wire [0:0] pe_8_2_executed;
	pe_8_2 pe_8_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_8_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_2_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_8_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_2_north_pop_valid),
		.sink_685a1_counter_delta_ready(sink_685a1_driver_pe_8_2_counter_delta_ready),
		.sink_685a1_counter_delta(sink_685a1_driver_pe_8_2_counter_delta),
		.fifo_sink_685a1_north_push_valid(fifo_sink_685a1_north_driver_pe_8_2_push_valid),
		.fifo_sink_685a1_north_push_data(fifo_sink_685a1_north_driver_pe_8_2_push_data),
		.fifo_sink_685a1_north_push_ready(fifo_sink_685a1_north_driver_pe_8_2_push_ready),
		.array_array_66bb1_q(array_array_66bb1_q),
		.array_array_66bb1_w(array_array_66bb1_driver_pe_8_2_w),
		.array_array_66bb1_widx(array_array_66bb1_driver_pe_8_2_widx),
		.array_array_66bb1_d(array_array_66bb1_driver_pe_8_2_d),
		.fifo_pe_8_3_west_push_valid(fifo_pe_8_3_west_driver_pe_8_2_push_valid),
		.fifo_pe_8_3_west_push_data(fifo_pe_8_3_west_driver_pe_8_2_push_data),
		.fifo_pe_8_3_west_push_ready(fifo_pe_8_3_west_driver_pe_8_2_push_ready),
		.pe_8_3_counter_delta_ready(pe_8_3_driver_pe_8_2_counter_delta_ready),
		.pe_8_3_counter_delta(pe_8_3_driver_pe_8_2_counter_delta),
		.counter_delta_ready(pe_8_2_counter_delta_ready),
		.counter_pop_ready(pe_8_2_counter_pop_ready),
		.counter_pop_valid(pe_8_2_counter_pop_valid),
		.expose_executed(pe_8_2_executed)
	);
	wire [0:0] pe_8_4_executed;
	pe_8_4 pe_8_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_8_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_8_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_8_4_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_8_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_8_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_8_4_north_pop_valid),
		.fifo_pe_8_5_west_push_valid(fifo_pe_8_5_west_driver_pe_8_4_push_valid),
		.fifo_pe_8_5_west_push_data(fifo_pe_8_5_west_driver_pe_8_4_push_data),
		.fifo_pe_8_5_west_push_ready(fifo_pe_8_5_west_driver_pe_8_4_push_ready),
		.sink_68771_counter_delta_ready(sink_68771_driver_pe_8_4_counter_delta_ready),
		.sink_68771_counter_delta(sink_68771_driver_pe_8_4_counter_delta),
		.array_array_66c15_q(array_array_66c15_q),
		.array_array_66c15_w(array_array_66c15_driver_pe_8_4_w),
		.array_array_66c15_widx(array_array_66c15_driver_pe_8_4_widx),
		.array_array_66c15_d(array_array_66c15_driver_pe_8_4_d),
		.fifo_sink_68771_north_push_valid(fifo_sink_68771_north_driver_pe_8_4_push_valid),
		.fifo_sink_68771_north_push_data(fifo_sink_68771_north_driver_pe_8_4_push_data),
		.fifo_sink_68771_north_push_ready(fifo_sink_68771_north_driver_pe_8_4_push_ready),
		.pe_8_5_counter_delta_ready(pe_8_5_driver_pe_8_4_counter_delta_ready),
		.pe_8_5_counter_delta(pe_8_5_driver_pe_8_4_counter_delta),
		.counter_delta_ready(pe_8_4_counter_delta_ready),
		.counter_pop_ready(pe_8_4_counter_pop_ready),
		.counter_pop_valid(pe_8_4_counter_pop_valid),
		.expose_executed(pe_8_4_executed)
	);
	wire [0:0] pe_2_4_executed;
	pe_2_4 pe_2_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_2_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_4_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_2_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_4_west_pop_valid),
		.array_array_65739_q(array_array_65739_q),
		.array_array_65739_w(array_array_65739_driver_pe_2_4_w),
		.array_array_65739_widx(array_array_65739_driver_pe_2_4_widx),
		.array_array_65739_d(array_array_65739_driver_pe_2_4_d),
		.fifo_pe_3_4_north_push_valid(fifo_pe_3_4_north_driver_pe_2_4_push_valid),
		.fifo_pe_3_4_north_push_data(fifo_pe_3_4_north_driver_pe_2_4_push_data),
		.fifo_pe_3_4_north_push_ready(fifo_pe_3_4_north_driver_pe_2_4_push_ready),
		.fifo_pe_2_5_west_push_valid(fifo_pe_2_5_west_driver_pe_2_4_push_valid),
		.fifo_pe_2_5_west_push_data(fifo_pe_2_5_west_driver_pe_2_4_push_data),
		.fifo_pe_2_5_west_push_ready(fifo_pe_2_5_west_driver_pe_2_4_push_ready),
		.pe_2_5_counter_delta_ready(pe_2_5_driver_pe_2_4_counter_delta_ready),
		.pe_2_5_counter_delta(pe_2_5_driver_pe_2_4_counter_delta),
		.counter_delta_ready(pe_2_4_counter_delta_ready),
		.counter_pop_ready(pe_2_4_counter_pop_ready),
		.counter_pop_valid(pe_2_4_counter_pop_valid),
		.expose_executed(pe_2_4_executed)
	);
	wire [0:0] pe_6_1_executed;
	pe_6_1 pe_6_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_6_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_1_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_6_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_1_north_pop_valid),
		.fifo_pe_7_1_north_push_valid(fifo_pe_7_1_north_driver_pe_6_1_push_valid),
		.fifo_pe_7_1_north_push_data(fifo_pe_7_1_north_driver_pe_6_1_push_data),
		.fifo_pe_7_1_north_push_ready(fifo_pe_7_1_north_driver_pe_6_1_push_ready),
		.pe_7_1_counter_delta_ready(pe_7_1_driver_pe_6_1_counter_delta_ready),
		.pe_7_1_counter_delta(pe_7_1_driver_pe_6_1_counter_delta),
		.fifo_pe_6_2_west_push_valid(fifo_pe_6_2_west_driver_pe_6_1_push_valid),
		.fifo_pe_6_2_west_push_data(fifo_pe_6_2_west_driver_pe_6_1_push_data),
		.fifo_pe_6_2_west_push_ready(fifo_pe_6_2_west_driver_pe_6_1_push_ready),
		.array_array_66881_q(array_array_66881_q),
		.array_array_66881_w(array_array_66881_driver_pe_6_1_w),
		.array_array_66881_widx(array_array_66881_driver_pe_6_1_widx),
		.array_array_66881_d(array_array_66881_driver_pe_6_1_d),
		.pe_6_2_counter_delta_ready(pe_6_2_driver_pe_6_1_counter_delta_ready),
		.pe_6_2_counter_delta(pe_6_2_driver_pe_6_1_counter_delta),
		.counter_delta_ready(pe_6_1_counter_delta_ready),
		.counter_pop_ready(pe_6_1_counter_pop_ready),
		.counter_pop_valid(pe_6_1_counter_pop_valid),
		.expose_executed(pe_6_1_executed)
	);
	wire [0:0] pe_7_2_executed;
	pe_7_2 pe_7_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_7_2_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_2_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_2_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_7_2_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_2_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_2_west_pop_valid),
		.fifo_pe_7_3_west_push_valid(fifo_pe_7_3_west_driver_pe_7_2_push_valid),
		.fifo_pe_7_3_west_push_data(fifo_pe_7_3_west_driver_pe_7_2_push_data),
		.fifo_pe_7_3_west_push_ready(fifo_pe_7_3_west_driver_pe_7_2_push_ready),
		.pe_7_3_counter_delta_ready(pe_7_3_driver_pe_7_2_counter_delta_ready),
		.pe_7_3_counter_delta(pe_7_3_driver_pe_7_2_counter_delta),
		.array_array_66a31_q(array_array_66a31_q),
		.array_array_66a31_w(array_array_66a31_driver_pe_7_2_w),
		.array_array_66a31_widx(array_array_66a31_driver_pe_7_2_widx),
		.array_array_66a31_d(array_array_66a31_driver_pe_7_2_d),
		.fifo_pe_8_2_north_push_valid(fifo_pe_8_2_north_driver_pe_7_2_push_valid),
		.fifo_pe_8_2_north_push_data(fifo_pe_8_2_north_driver_pe_7_2_push_data),
		.fifo_pe_8_2_north_push_ready(fifo_pe_8_2_north_driver_pe_7_2_push_ready),
		.counter_delta_ready(pe_7_2_counter_delta_ready),
		.counter_pop_ready(pe_7_2_counter_pop_ready),
		.counter_pop_valid(pe_7_2_counter_pop_valid),
		.expose_executed(pe_7_2_executed)
	);
	wire [0:0] pe_2_7_executed;
	pe_2_7 pe_2_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_2_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_2_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_2_7_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_2_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_2_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_2_7_west_pop_valid),
		.array_array_657bd_q(array_array_657bd_q),
		.array_array_657bd_w(array_array_657bd_driver_pe_2_7_w),
		.array_array_657bd_widx(array_array_657bd_driver_pe_2_7_widx),
		.array_array_657bd_d(array_array_657bd_driver_pe_2_7_d),
		.pe_2_8_counter_delta_ready(pe_2_8_driver_pe_2_7_counter_delta_ready),
		.pe_2_8_counter_delta(pe_2_8_driver_pe_2_7_counter_delta),
		.fifo_pe_2_8_west_push_valid(fifo_pe_2_8_west_driver_pe_2_7_push_valid),
		.fifo_pe_2_8_west_push_data(fifo_pe_2_8_west_driver_pe_2_7_push_data),
		.fifo_pe_2_8_west_push_ready(fifo_pe_2_8_west_driver_pe_2_7_push_ready),
		.fifo_pe_3_7_north_push_valid(fifo_pe_3_7_north_driver_pe_2_7_push_valid),
		.fifo_pe_3_7_north_push_data(fifo_pe_3_7_north_driver_pe_2_7_push_data),
		.fifo_pe_3_7_north_push_ready(fifo_pe_3_7_north_driver_pe_2_7_push_ready),
		.counter_delta_ready(pe_2_7_counter_delta_ready),
		.counter_pop_ready(pe_2_7_counter_pop_ready),
		.counter_pop_valid(pe_2_7_counter_pop_valid),
		.expose_executed(pe_2_7_executed)
	);
	wire [0:0] pe_1_6_executed;
	pe_1_6 pe_1_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_1_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_6_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_1_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_6_north_pop_valid),
		.fifo_pe_2_6_north_push_valid(fifo_pe_2_6_north_driver_pe_1_6_push_valid),
		.fifo_pe_2_6_north_push_data(fifo_pe_2_6_north_driver_pe_1_6_push_data),
		.fifo_pe_2_6_north_push_ready(fifo_pe_2_6_north_driver_pe_1_6_push_ready),
		.fifo_pe_1_7_west_push_valid(fifo_pe_1_7_west_driver_pe_1_6_push_valid),
		.fifo_pe_1_7_west_push_data(fifo_pe_1_7_west_driver_pe_1_6_push_data),
		.fifo_pe_1_7_west_push_ready(fifo_pe_1_7_west_driver_pe_1_6_push_ready),
		.array_array_65631_q(array_array_65631_q),
		.array_array_65631_w(array_array_65631_driver_pe_1_6_w),
		.array_array_65631_widx(array_array_65631_driver_pe_1_6_widx),
		.array_array_65631_d(array_array_65631_driver_pe_1_6_d),
		.pe_1_7_counter_delta_ready(pe_1_7_driver_pe_1_6_counter_delta_ready),
		.pe_1_7_counter_delta(pe_1_7_driver_pe_1_6_counter_delta),
		.counter_delta_ready(pe_1_6_counter_delta_ready),
		.counter_pop_ready(pe_1_6_counter_pop_ready),
		.counter_pop_valid(pe_1_6_counter_pop_valid),
		.expose_executed(pe_1_6_executed)
	);
	wire [0:0] pe_1_8_executed;
	pe_1_8 pe_1_8_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_1_8_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_1_8_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_1_8_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_1_8_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_1_8_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_1_8_north_pop_valid),
		.array_array_6568d_q(array_array_6568d_q),
		.array_array_6568d_w(array_array_6568d_driver_pe_1_8_w),
		.array_array_6568d_widx(array_array_6568d_driver_pe_1_8_widx),
		.array_array_6568d_d(array_array_6568d_driver_pe_1_8_d),
		.fifo_pe_2_8_north_push_valid(fifo_pe_2_8_north_driver_pe_1_8_push_valid),
		.fifo_pe_2_8_north_push_data(fifo_pe_2_8_north_driver_pe_1_8_push_data),
		.fifo_pe_2_8_north_push_ready(fifo_pe_2_8_north_driver_pe_1_8_push_ready),
		.fifo_sink_68445_west_push_valid(fifo_sink_68445_west_driver_pe_1_8_push_valid),
		.fifo_sink_68445_west_push_data(fifo_sink_68445_west_driver_pe_1_8_push_data),
		.fifo_sink_68445_west_push_ready(fifo_sink_68445_west_driver_pe_1_8_push_ready),
		.sink_68445_counter_delta_ready(sink_68445_driver_pe_1_8_counter_delta_ready),
		.sink_68445_counter_delta(sink_68445_driver_pe_1_8_counter_delta),
		.counter_delta_ready(pe_1_8_counter_delta_ready),
		.counter_pop_ready(pe_1_8_counter_pop_ready),
		.counter_pop_valid(pe_1_8_counter_pop_valid),
		.expose_executed(pe_1_8_executed)
	);
	wire [0:0] col_pusher_1_executed;
	col_pusher_1 col_pusher_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_1_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_1_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_1_data_pop_valid),
		.pe_1_1_counter_delta_ready(pe_1_1_driver_col_pusher_1_counter_delta_ready),
		.pe_1_1_counter_delta(pe_1_1_driver_col_pusher_1_counter_delta),
		.fifo_pe_1_1_north_push_valid(fifo_pe_1_1_north_driver_col_pusher_1_push_valid),
		.fifo_pe_1_1_north_push_data(fifo_pe_1_1_north_driver_col_pusher_1_push_data),
		.fifo_pe_1_1_north_push_ready(fifo_pe_1_1_north_driver_col_pusher_1_push_ready),
		.counter_delta_ready(col_pusher_1_counter_delta_ready),
		.counter_pop_ready(col_pusher_1_counter_pop_ready),
		.counter_pop_valid(col_pusher_1_counter_pop_valid),
		.expose_executed(col_pusher_1_executed)
	);
	wire [0:0] col_pusher_4_executed;
	col_pusher_4 col_pusher_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_col_pusher_4_data_pop_ready),
		.fifo_data_pop_data(fifo_col_pusher_4_data_pop_data),
		.fifo_data_pop_valid(fifo_col_pusher_4_data_pop_valid),
		.fifo_pe_1_4_north_push_valid(fifo_pe_1_4_north_driver_col_pusher_4_push_valid),
		.fifo_pe_1_4_north_push_data(fifo_pe_1_4_north_driver_col_pusher_4_push_data),
		.fifo_pe_1_4_north_push_ready(fifo_pe_1_4_north_driver_col_pusher_4_push_ready),
		.counter_delta_ready(col_pusher_4_counter_delta_ready),
		.counter_pop_ready(col_pusher_4_counter_pop_ready),
		.counter_pop_valid(col_pusher_4_counter_pop_valid),
		.expose_executed(col_pusher_4_executed)
	);
	wire [0:0] sink_69dd1_executed;
	sink_69dd1 sink_69dd1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_69dd1_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_69dd1_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_69dd1_north_pop_valid),
		.counter_delta_ready(sink_69dd1_counter_delta_ready),
		.counter_pop_ready(sink_69dd1_counter_pop_ready),
		.counter_pop_valid(sink_69dd1_counter_pop_valid),
		.expose_executed(sink_69dd1_executed)
	);
	wire [0:0] pe_5_7_executed;
	pe_5_7 pe_5_7_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_5_7_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_7_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_7_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_5_7_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_7_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_7_west_pop_valid),
		.fifo_pe_6_7_north_push_valid(fifo_pe_6_7_north_driver_pe_5_7_push_valid),
		.fifo_pe_6_7_north_push_data(fifo_pe_6_7_north_driver_pe_5_7_push_data),
		.fifo_pe_6_7_north_push_ready(fifo_pe_6_7_north_driver_pe_5_7_push_ready),
		.fifo_pe_5_8_west_push_valid(fifo_pe_5_8_west_driver_pe_5_7_push_valid),
		.fifo_pe_5_8_west_push_data(fifo_pe_5_8_west_driver_pe_5_7_push_data),
		.fifo_pe_5_8_west_push_ready(fifo_pe_5_8_west_driver_pe_5_7_push_ready),
		.array_array_66821_q(array_array_66821_q),
		.array_array_66821_w(array_array_66821_driver_pe_5_7_w),
		.array_array_66821_widx(array_array_66821_driver_pe_5_7_widx),
		.array_array_66821_d(array_array_66821_driver_pe_5_7_d),
		.pe_5_8_counter_delta_ready(pe_5_8_driver_pe_5_7_counter_delta_ready),
		.pe_5_8_counter_delta(pe_5_8_driver_pe_5_7_counter_delta),
		.counter_delta_ready(pe_5_7_counter_delta_ready),
		.counter_pop_ready(pe_5_7_counter_pop_ready),
		.counter_pop_valid(pe_5_7_counter_pop_valid),
		.expose_executed(pe_5_7_executed)
	);
	wire [0:0] pe_7_6_executed;
	pe_7_6 pe_7_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_7_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_7_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_7_6_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_7_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_7_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_7_6_north_pop_valid),
		.fifo_pe_8_6_north_push_valid(fifo_pe_8_6_north_driver_pe_7_6_push_valid),
		.fifo_pe_8_6_north_push_data(fifo_pe_8_6_north_driver_pe_7_6_push_data),
		.fifo_pe_8_6_north_push_ready(fifo_pe_8_6_north_driver_pe_7_6_push_ready),
		.array_array_66af1_q(array_array_66af1_q),
		.array_array_66af1_w(array_array_66af1_driver_pe_7_6_w),
		.array_array_66af1_widx(array_array_66af1_driver_pe_7_6_widx),
		.array_array_66af1_d(array_array_66af1_driver_pe_7_6_d),
		.fifo_pe_7_7_west_push_valid(fifo_pe_7_7_west_driver_pe_7_6_push_valid),
		.fifo_pe_7_7_west_push_data(fifo_pe_7_7_west_driver_pe_7_6_push_data),
		.fifo_pe_7_7_west_push_ready(fifo_pe_7_7_west_driver_pe_7_6_push_ready),
		.pe_7_7_counter_delta_ready(pe_7_7_driver_pe_7_6_counter_delta_ready),
		.pe_7_7_counter_delta(pe_7_7_driver_pe_7_6_counter_delta),
		.counter_delta_ready(pe_7_6_counter_delta_ready),
		.counter_pop_ready(pe_7_6_counter_pop_ready),
		.counter_pop_valid(pe_7_6_counter_pop_valid),
		.expose_executed(pe_7_6_executed)
	);
	wire [0:0] sink_684d1_executed;
	sink_684d1 sink_684d1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_684d1_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_684d1_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_684d1_north_pop_valid),
		.counter_delta_ready(sink_684d1_counter_delta_ready),
		.counter_pop_ready(sink_684d1_counter_pop_ready),
		.counter_pop_valid(sink_684d1_counter_pop_valid),
		.expose_executed(sink_684d1_executed)
	);
	wire [0:0] pe_6_5_executed;
	pe_6_5 pe_6_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_6_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_6_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_6_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_6_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_6_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_6_5_north_pop_valid),
		.pe_6_6_counter_delta_ready(pe_6_6_driver_pe_6_5_counter_delta_ready),
		.pe_6_6_counter_delta(pe_6_6_driver_pe_6_5_counter_delta),
		.fifo_pe_7_5_north_push_valid(fifo_pe_7_5_north_driver_pe_6_5_push_valid),
		.fifo_pe_7_5_north_push_data(fifo_pe_7_5_north_driver_pe_6_5_push_data),
		.fifo_pe_7_5_north_push_ready(fifo_pe_7_5_north_driver_pe_6_5_push_ready),
		.array_array_66941_q(array_array_66941_q),
		.array_array_66941_w(array_array_66941_driver_pe_6_5_w),
		.array_array_66941_widx(array_array_66941_driver_pe_6_5_widx),
		.array_array_66941_d(array_array_66941_driver_pe_6_5_d),
		.fifo_pe_6_6_west_push_valid(fifo_pe_6_6_west_driver_pe_6_5_push_valid),
		.fifo_pe_6_6_west_push_data(fifo_pe_6_6_west_driver_pe_6_5_push_data),
		.fifo_pe_6_6_west_push_ready(fifo_pe_6_6_west_driver_pe_6_5_push_ready),
		.counter_delta_ready(pe_6_5_counter_delta_ready),
		.counter_pop_ready(pe_6_5_counter_pop_ready),
		.counter_pop_valid(pe_6_5_counter_pop_valid),
		.expose_executed(pe_6_5_executed)
	);
	wire [0:0] pe_5_6_executed;
	pe_5_6 pe_5_6_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_5_6_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_6_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_6_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_5_6_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_6_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_6_north_pop_valid),
		.fifo_pe_6_6_north_push_valid(fifo_pe_6_6_north_driver_pe_5_6_push_valid),
		.fifo_pe_6_6_north_push_data(fifo_pe_6_6_north_driver_pe_5_6_push_data),
		.fifo_pe_6_6_north_push_ready(fifo_pe_6_6_north_driver_pe_5_6_push_ready),
		.pe_5_7_counter_delta_ready(pe_5_7_driver_pe_5_6_counter_delta_ready),
		.pe_5_7_counter_delta(pe_5_7_driver_pe_5_6_counter_delta),
		.fifo_pe_5_7_west_push_valid(fifo_pe_5_7_west_driver_pe_5_6_push_valid),
		.fifo_pe_5_7_west_push_data(fifo_pe_5_7_west_driver_pe_5_6_push_data),
		.fifo_pe_5_7_west_push_ready(fifo_pe_5_7_west_driver_pe_5_6_push_ready),
		.array_array_663ed_q(array_array_663ed_q),
		.array_array_663ed_w(array_array_663ed_driver_pe_5_6_w),
		.array_array_663ed_widx(array_array_663ed_driver_pe_5_6_widx),
		.array_array_663ed_d(array_array_663ed_driver_pe_5_6_d),
		.counter_delta_ready(pe_5_6_counter_delta_ready),
		.counter_pop_ready(pe_5_6_counter_pop_ready),
		.counter_pop_valid(pe_5_6_counter_pop_valid),
		.expose_executed(pe_5_6_executed)
	);
	wire [0:0] sink_69d05_executed;
	sink_69d05 sink_69d05_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_sink_69d05_north_pop_ready),
		.fifo_north_pop_data(fifo_sink_69d05_north_pop_data),
		.fifo_north_pop_valid(fifo_sink_69d05_north_pop_valid),
		.counter_delta_ready(sink_69d05_counter_delta_ready),
		.counter_pop_ready(sink_69d05_counter_pop_ready),
		.counter_pop_valid(sink_69d05_counter_pop_valid),
		.expose_executed(sink_69d05_executed)
	);
	wire [0:0] sink_69e49_executed;
	sink_69e49 sink_69e49_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_69e49_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_69e49_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_69e49_west_pop_valid),
		.counter_delta_ready(sink_69e49_counter_delta_ready),
		.counter_pop_ready(sink_69e49_counter_pop_ready),
		.counter_pop_valid(sink_69e49_counter_pop_valid),
		.expose_executed(sink_69e49_executed)
	);
	wire [0:0] pe_5_3_executed;
	pe_5_3 pe_5_3_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_north_pop_ready(fifo_pe_5_3_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_3_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_3_north_pop_valid),
		.fifo_west_pop_ready(fifo_pe_5_3_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_3_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_3_west_pop_valid),
		.fifo_pe_5_4_west_push_valid(fifo_pe_5_4_west_driver_pe_5_3_push_valid),
		.fifo_pe_5_4_west_push_data(fifo_pe_5_4_west_driver_pe_5_3_push_data),
		.fifo_pe_5_4_west_push_ready(fifo_pe_5_4_west_driver_pe_5_3_push_ready),
		.fifo_pe_6_3_north_push_valid(fifo_pe_6_3_north_driver_pe_5_3_push_valid),
		.fifo_pe_6_3_north_push_data(fifo_pe_6_3_north_driver_pe_5_3_push_data),
		.fifo_pe_6_3_north_push_ready(fifo_pe_6_3_north_driver_pe_5_3_push_ready),
		.array_array_6635d_q(array_array_6635d_q),
		.array_array_6635d_w(array_array_6635d_driver_pe_5_3_w),
		.array_array_6635d_widx(array_array_6635d_driver_pe_5_3_widx),
		.array_array_6635d_d(array_array_6635d_driver_pe_5_3_d),
		.pe_5_4_counter_delta_ready(pe_5_4_driver_pe_5_3_counter_delta_ready),
		.pe_5_4_counter_delta(pe_5_4_driver_pe_5_3_counter_delta),
		.counter_delta_ready(pe_5_3_counter_delta_ready),
		.counter_pop_ready(pe_5_3_counter_pop_ready),
		.counter_pop_valid(pe_5_3_counter_pop_valid),
		.expose_executed(pe_5_3_executed)
	);
	wire [0:0] pe_3_5_executed;
	pe_3_5 pe_3_5_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_3_5_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_5_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_5_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_3_5_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_5_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_5_north_pop_valid),
		.fifo_pe_4_5_north_push_valid(fifo_pe_4_5_north_driver_pe_3_5_push_valid),
		.fifo_pe_4_5_north_push_data(fifo_pe_4_5_north_driver_pe_3_5_push_data),
		.fifo_pe_4_5_north_push_ready(fifo_pe_4_5_north_driver_pe_3_5_push_ready),
		.fifo_pe_3_6_west_push_valid(fifo_pe_3_6_west_driver_pe_3_5_push_valid),
		.fifo_pe_3_6_west_push_data(fifo_pe_3_6_west_driver_pe_3_5_push_data),
		.fifo_pe_3_6_west_push_ready(fifo_pe_3_6_west_driver_pe_3_5_push_ready),
		.array_array_660c9_q(array_array_660c9_q),
		.array_array_660c9_w(array_array_660c9_driver_pe_3_5_w),
		.array_array_660c9_widx(array_array_660c9_driver_pe_3_5_widx),
		.array_array_660c9_d(array_array_660c9_driver_pe_3_5_d),
		.pe_3_6_counter_delta_ready(pe_3_6_driver_pe_3_5_counter_delta_ready),
		.pe_3_6_counter_delta(pe_3_6_driver_pe_3_5_counter_delta),
		.counter_delta_ready(pe_3_5_counter_delta_ready),
		.counter_pop_ready(pe_3_5_counter_pop_ready),
		.counter_pop_valid(pe_3_5_counter_pop_valid),
		.expose_executed(pe_3_5_executed)
	);
	wire [0:0] sink_69c1d_executed;
	sink_69c1d sink_69c1d_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_sink_69c1d_west_pop_ready),
		.fifo_west_pop_data(fifo_sink_69c1d_west_pop_data),
		.fifo_west_pop_valid(fifo_sink_69c1d_west_pop_valid),
		.counter_delta_ready(sink_69c1d_counter_delta_ready),
		.counter_pop_ready(sink_69c1d_counter_pop_ready),
		.counter_pop_valid(sink_69c1d_counter_pop_valid),
		.expose_executed(sink_69c1d_executed)
	);
	wire [0:0] row_pusher_4_executed;
	row_pusher_4 row_pusher_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_data_pop_ready(fifo_row_pusher_4_data_pop_ready),
		.fifo_data_pop_data(fifo_row_pusher_4_data_pop_data),
		.fifo_data_pop_valid(fifo_row_pusher_4_data_pop_valid),
		.fifo_pe_4_1_west_push_valid(fifo_pe_4_1_west_driver_row_pusher_4_push_valid),
		.fifo_pe_4_1_west_push_data(fifo_pe_4_1_west_driver_row_pusher_4_push_data),
		.fifo_pe_4_1_west_push_ready(fifo_pe_4_1_west_driver_row_pusher_4_push_ready),
		.counter_delta_ready(row_pusher_4_counter_delta_ready),
		.counter_pop_ready(row_pusher_4_counter_pop_ready),
		.counter_pop_valid(row_pusher_4_counter_pop_valid),
		.expose_executed(row_pusher_4_executed)
	);
	wire [0:0] pe_5_1_executed;
	pe_5_1 pe_5_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_5_1_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_5_1_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_5_1_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_5_1_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_5_1_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_5_1_north_pop_valid),
		.array_array_662fd_q(array_array_662fd_q),
		.array_array_662fd_w(array_array_662fd_driver_pe_5_1_w),
		.array_array_662fd_widx(array_array_662fd_driver_pe_5_1_widx),
		.array_array_662fd_d(array_array_662fd_driver_pe_5_1_d),
		.fifo_pe_5_2_west_push_valid(fifo_pe_5_2_west_driver_pe_5_1_push_valid),
		.fifo_pe_5_2_west_push_data(fifo_pe_5_2_west_driver_pe_5_1_push_data),
		.fifo_pe_5_2_west_push_ready(fifo_pe_5_2_west_driver_pe_5_1_push_ready),
		.fifo_pe_6_1_north_push_valid(fifo_pe_6_1_north_driver_pe_5_1_push_valid),
		.fifo_pe_6_1_north_push_data(fifo_pe_6_1_north_driver_pe_5_1_push_data),
		.fifo_pe_6_1_north_push_ready(fifo_pe_6_1_north_driver_pe_5_1_push_ready),
		.pe_5_2_counter_delta_ready(pe_5_2_driver_pe_5_1_counter_delta_ready),
		.pe_5_2_counter_delta(pe_5_2_driver_pe_5_1_counter_delta),
		.pe_6_1_counter_delta_ready(pe_6_1_driver_pe_5_1_counter_delta_ready),
		.pe_6_1_counter_delta(pe_6_1_driver_pe_5_1_counter_delta),
		.counter_delta_ready(pe_5_1_counter_delta_ready),
		.counter_pop_ready(pe_5_1_counter_pop_ready),
		.counter_pop_valid(pe_5_1_counter_pop_valid),
		.expose_executed(pe_5_1_executed)
	);
	wire [0:0] pe_3_4_executed;
	pe_3_4 pe_3_4_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_west_pop_ready(fifo_pe_3_4_west_pop_ready),
		.fifo_west_pop_data(fifo_pe_3_4_west_pop_data),
		.fifo_west_pop_valid(fifo_pe_3_4_west_pop_valid),
		.fifo_north_pop_ready(fifo_pe_3_4_north_pop_ready),
		.fifo_north_pop_data(fifo_pe_3_4_north_pop_data),
		.fifo_north_pop_valid(fifo_pe_3_4_north_pop_valid),
		.pe_3_5_counter_delta_ready(pe_3_5_driver_pe_3_4_counter_delta_ready),
		.pe_3_5_counter_delta(pe_3_5_driver_pe_3_4_counter_delta),
		.fifo_pe_4_4_north_push_valid(fifo_pe_4_4_north_driver_pe_3_4_push_valid),
		.fifo_pe_4_4_north_push_data(fifo_pe_4_4_north_driver_pe_3_4_push_data),
		.fifo_pe_4_4_north_push_ready(fifo_pe_4_4_north_driver_pe_3_4_push_ready),
		.fifo_pe_3_5_west_push_valid(fifo_pe_3_5_west_driver_pe_3_4_push_valid),
		.fifo_pe_3_5_west_push_data(fifo_pe_3_5_west_driver_pe_3_4_push_data),
		.fifo_pe_3_5_west_push_ready(fifo_pe_3_5_west_driver_pe_3_4_push_ready),
		.array_array_6609d_q(array_array_6609d_q),
		.array_array_6609d_w(array_array_6609d_driver_pe_3_4_w),
		.array_array_6609d_widx(array_array_6609d_driver_pe_3_4_widx),
		.array_array_6609d_d(array_array_6609d_driver_pe_3_4_d),
		.counter_delta_ready(pe_3_4_counter_delta_ready),
		.counter_pop_ready(pe_3_4_counter_pop_ready),
		.counter_pop_valid(pe_3_4_counter_pop_valid),
		.expose_executed(pe_3_4_executed)
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
	wire [31:0] array_array_65631_exposed_o;
	wire [31:0] array_array_65631_exposed_i;
	wire array_array_65631_exposed_i_valid;
	assign array_array_65631_exposed_i_valid = 1'd0;
	assign array_array_65631_exposed_i = 32'd0;
	wire [31:0] array_array_657e9_exposed_o;
	wire [31:0] array_array_657e9_exposed_i;
	wire array_array_657e9_exposed_i_valid;
	assign array_array_657e9_exposed_i_valid = 1'd0;
	assign array_array_657e9_exposed_i = 32'd0;
	wire [31:0] array_array_6617d_exposed_o;
	wire [31:0] array_array_6617d_exposed_i;
	wire array_array_6617d_exposed_i_valid;
	assign array_array_6617d_exposed_i_valid = 1'd0;
	assign array_array_6617d_exposed_i = 32'd0;
	wire [31:0] array_array_6623d_exposed_o;
	wire [31:0] array_array_6623d_exposed_i;
	wire array_array_6623d_exposed_i_valid;
	assign array_array_6623d_exposed_i_valid = 1'd0;
	assign array_array_6623d_exposed_i = 32'd0;
	wire [31:0] array_array_6635d_exposed_o;
	wire [31:0] array_array_6635d_exposed_i;
	wire array_array_6635d_exposed_i_valid;
	assign array_array_6635d_exposed_i_valid = 1'd0;
	assign array_array_6635d_exposed_i = 32'd0;
	wire [31:0] array_array_66a01_exposed_o;
	wire [31:0] array_array_66a01_exposed_i;
	wire array_array_66a01_exposed_i_valid;
	assign array_array_66a01_exposed_i_valid = 1'd0;
	assign array_array_66a01_exposed_i = 32'd0;
	wire [31:0] array_array_66a31_exposed_o;
	wire [31:0] array_array_66a31_exposed_i;
	wire array_array_66a31_exposed_i_valid;
	assign array_array_66a31_exposed_i_valid = 1'd0;
	assign array_array_66a31_exposed_i = 32'd0;
	wire [31:0] array_array_66045_exposed_o;
	wire [31:0] array_array_66045_exposed_i;
	wire array_array_66045_exposed_i_valid;
	assign array_array_66045_exposed_i_valid = 1'd0;
	assign array_array_66045_exposed_i = 32'd0;
	wire [31:0] array_array_65601_exposed_o;
	wire [31:0] array_array_65601_exposed_i;
	wire array_array_65601_exposed_i_valid;
	assign array_array_65601_exposed_i_valid = 1'd0;
	assign array_array_65601_exposed_i = 32'd0;
	wire [31:0] array_array_6638d_exposed_o;
	wire [31:0] array_array_6638d_exposed_i;
	wire array_array_6638d_exposed_i_valid;
	assign array_array_6638d_exposed_i_valid = 1'd0;
	assign array_array_6638d_exposed_i = 32'd0;
	wire [31:0] array_array_66971_exposed_o;
	wire [31:0] array_array_66971_exposed_i;
	wire array_array_66971_exposed_i_valid;
	assign array_array_66971_exposed_i_valid = 1'd0;
	assign array_array_66971_exposed_i = 32'd0;
	wire [31:0] array_array_66c75_exposed_o;
	wire [31:0] array_array_66c75_exposed_i;
	wire array_array_66c75_exposed_i_valid;
	assign array_array_66c75_exposed_i_valid = 1'd0;
	assign array_array_66c75_exposed_i = 32'd0;
	wire [31:0] array_array_657bd_exposed_o;
	wire [31:0] array_array_657bd_exposed_i;
	wire array_array_657bd_exposed_i_valid;
	assign array_array_657bd_exposed_i_valid = 1'd0;
	assign array_array_657bd_exposed_i = 32'd0;
	wire [31:0] array_array_66c15_exposed_o;
	wire [31:0] array_array_66c15_exposed_i;
	wire array_array_66c15_exposed_i_valid;
	assign array_array_66c15_exposed_i_valid = 1'd0;
	assign array_array_66c15_exposed_i = 32'd0;
	wire [31:0] array_array_66911_exposed_o;
	wire [31:0] array_array_66911_exposed_i;
	wire array_array_66911_exposed_i_valid;
	assign array_array_66911_exposed_i_valid = 1'd0;
	assign array_array_66911_exposed_i = 32'd0;
	wire [31:0] array_array_656dd_exposed_o;
	wire [31:0] array_array_656dd_exposed_i;
	wire array_array_656dd_exposed_i_valid;
	assign array_array_656dd_exposed_i_valid = 1'd0;
	assign array_array_656dd_exposed_i = 32'd0;
	wire [31:0] array_array_6554d_exposed_o;
	wire [31:0] array_array_6554d_exposed_i;
	wire array_array_6554d_exposed_i_valid;
	assign array_array_6554d_exposed_i_valid = 1'd0;
	assign array_array_6554d_exposed_i = 32'd0;
	wire [31:0] array_array_65579_exposed_o;
	wire [31:0] array_array_65579_exposed_i;
	wire array_array_65579_exposed_i_valid;
	assign array_array_65579_exposed_i_valid = 1'd0;
	assign array_array_65579_exposed_i = 32'd0;
	wire [31:0] array_array_66b21_exposed_o;
	wire [31:0] array_array_66b21_exposed_i;
	wire array_array_66b21_exposed_i_valid;
	assign array_array_66b21_exposed_i_valid = 1'd0;
	assign array_array_66b21_exposed_i = 32'd0;
	wire [31:0] array_array_669a1_exposed_o;
	wire [31:0] array_array_669a1_exposed_i;
	wire array_array_669a1_exposed_i_valid;
	assign array_array_669a1_exposed_i_valid = 1'd0;
	assign array_array_669a1_exposed_i = 32'd0;
	wire [31:0] array_array_66b81_exposed_o;
	wire [31:0] array_array_66b81_exposed_i;
	wire array_array_66b81_exposed_i_valid;
	assign array_array_66b81_exposed_i_valid = 1'd0;
	assign array_array_66b81_exposed_i = 32'd0;
	wire [31:0] array_array_669d1_exposed_o;
	wire [31:0] array_array_669d1_exposed_i;
	wire array_array_669d1_exposed_i_valid;
	assign array_array_669d1_exposed_i_valid = 1'd0;
	assign array_array_669d1_exposed_i = 32'd0;
	wire [31:0] array_array_66851_exposed_o;
	wire [31:0] array_array_66851_exposed_i;
	wire array_array_66851_exposed_i_valid;
	assign array_array_66851_exposed_i_valid = 1'd0;
	assign array_array_66851_exposed_i = 32'd0;
	wire [31:0] array_array_66821_exposed_o;
	wire [31:0] array_array_66821_exposed_i;
	wire array_array_66821_exposed_i_valid;
	assign array_array_66821_exposed_i_valid = 1'd0;
	assign array_array_66821_exposed_i = 32'd0;
	wire [31:0] array_array_66ca5_exposed_o;
	wire [31:0] array_array_66ca5_exposed_i;
	wire array_array_66ca5_exposed_i_valid;
	assign array_array_66ca5_exposed_i_valid = 1'd0;
	assign array_array_66ca5_exposed_i = 32'd0;
	wire [31:0] array_array_65765_exposed_o;
	wire [31:0] array_array_65765_exposed_i;
	wire array_array_65765_exposed_i_valid;
	assign array_array_65765_exposed_i_valid = 1'd0;
	assign array_array_65765_exposed_i = 32'd0;
	wire [31:0] array_array_6626d_exposed_o;
	wire [31:0] array_array_6626d_exposed_i;
	wire array_array_6626d_exposed_i_valid;
	assign array_array_6626d_exposed_i_valid = 1'd0;
	assign array_array_6626d_exposed_i = 32'd0;
	wire [31:0] array_array_6629d_exposed_o;
	wire [31:0] array_array_6629d_exposed_i;
	wire array_array_6629d_exposed_i_valid;
	assign array_array_6629d_exposed_i_valid = 1'd0;
	assign array_array_6629d_exposed_i = 32'd0;
	wire [31:0] array_array_6614d_exposed_o;
	wire [31:0] array_array_6614d_exposed_i;
	wire array_array_6614d_exposed_i_valid;
	assign array_array_6614d_exposed_i_valid = 1'd0;
	assign array_array_6614d_exposed_i = 32'd0;
	wire [31:0] array_array_66be1_exposed_o;
	wire [31:0] array_array_66be1_exposed_i;
	wire array_array_66be1_exposed_i_valid;
	assign array_array_66be1_exposed_i_valid = 1'd0;
	assign array_array_66be1_exposed_i = 32'd0;
	wire [31:0] array_array_655d1_exposed_o;
	wire [31:0] array_array_655d1_exposed_i;
	wire array_array_655d1_exposed_i_valid;
	assign array_array_655d1_exposed_i_valid = 1'd0;
	assign array_array_655d1_exposed_i = 32'd0;
	wire [31:0] array_array_662cd_exposed_o;
	wire [31:0] array_array_662cd_exposed_i;
	wire array_array_662cd_exposed_i_valid;
	assign array_array_662cd_exposed_i_valid = 1'd0;
	assign array_array_662cd_exposed_i = 32'd0;
	wire [31:0] array_array_66af1_exposed_o;
	wire [31:0] array_array_66af1_exposed_i;
	wire array_array_66af1_exposed_i_valid;
	assign array_array_66af1_exposed_i_valid = 1'd0;
	assign array_array_66af1_exposed_i = 32'd0;
	wire [31:0] array_array_661ad_exposed_o;
	wire [31:0] array_array_661ad_exposed_i;
	wire array_array_661ad_exposed_i_valid;
	assign array_array_661ad_exposed_i_valid = 1'd0;
	assign array_array_661ad_exposed_i = 32'd0;
	wire [31:0] array_array_668e1_exposed_o;
	wire [31:0] array_array_668e1_exposed_i;
	wire array_array_668e1_exposed_i_valid;
	assign array_array_668e1_exposed_i_valid = 1'd0;
	assign array_array_668e1_exposed_i = 32'd0;
	wire [31:0] array_array_656b5_exposed_o;
	wire [31:0] array_array_656b5_exposed_i;
	wire array_array_656b5_exposed_i_valid;
	assign array_array_656b5_exposed_i_valid = 1'd0;
	assign array_array_656b5_exposed_i = 32'd0;
	wire [31:0] array_array_66121_exposed_o;
	wire [31:0] array_array_66121_exposed_i;
	wire array_array_66121_exposed_i_valid;
	assign array_array_66121_exposed_i_valid = 1'd0;
	assign array_array_66121_exposed_i = 32'd0;
	wire [31:0] array_array_663bd_exposed_o;
	wire [31:0] array_array_663bd_exposed_i;
	wire array_array_663bd_exposed_i_valid;
	assign array_array_663bd_exposed_i_valid = 1'd0;
	assign array_array_663bd_exposed_i = 32'd0;
	wire [31:0] array_array_6609d_exposed_o;
	wire [31:0] array_array_6609d_exposed_i;
	wire array_array_6609d_exposed_i_valid;
	assign array_array_6609d_exposed_i_valid = 1'd0;
	assign array_array_6609d_exposed_i = 32'd0;
	wire [31:0] array_array_66c45_exposed_o;
	wire [31:0] array_array_66c45_exposed_i;
	wire array_array_66c45_exposed_i_valid;
	assign array_array_66c45_exposed_i_valid = 1'd0;
	assign array_array_66c45_exposed_i = 32'd0;
	wire [31:0] array_array_66b51_exposed_o;
	wire [31:0] array_array_66b51_exposed_i;
	wire array_array_66b51_exposed_i_valid;
	assign array_array_66b51_exposed_i_valid = 1'd0;
	assign array_array_66b51_exposed_i = 32'd0;
	wire [31:0] array_array_66cd5_exposed_o;
	wire [31:0] array_array_66cd5_exposed_i;
	wire array_array_66cd5_exposed_i_valid;
	assign array_array_66cd5_exposed_i_valid = 1'd0;
	assign array_array_66cd5_exposed_i = 32'd0;
	wire [31:0] array_array_66ac1_exposed_o;
	wire [31:0] array_array_66ac1_exposed_i;
	wire array_array_66ac1_exposed_i_valid;
	assign array_array_66ac1_exposed_i_valid = 1'd0;
	assign array_array_66ac1_exposed_i = 32'd0;
	wire [31:0] array_array_668b1_exposed_o;
	wire [31:0] array_array_668b1_exposed_i;
	wire array_array_668b1_exposed_i_valid;
	assign array_array_668b1_exposed_i_valid = 1'd0;
	assign array_array_668b1_exposed_i = 32'd0;
	wire [31:0] array_array_6565d_exposed_o;
	wire [31:0] array_array_6565d_exposed_i;
	wire array_array_6565d_exposed_i_valid;
	assign array_array_6565d_exposed_i_valid = 1'd0;
	assign array_array_6565d_exposed_i = 32'd0;
	wire [31:0] array_array_660f5_exposed_o;
	wire [31:0] array_array_660f5_exposed_i;
	wire array_array_660f5_exposed_i_valid;
	assign array_array_660f5_exposed_i_valid = 1'd0;
	assign array_array_660f5_exposed_i = 32'd0;
	wire [31:0] array_array_6568d_exposed_o;
	wire [31:0] array_array_6568d_exposed_i;
	wire array_array_6568d_exposed_i_valid;
	assign array_array_6568d_exposed_i_valid = 1'd0;
	assign array_array_6568d_exposed_i = 32'd0;
	wire [31:0] array_array_655a5_exposed_o;
	wire [31:0] array_array_655a5_exposed_i;
	wire array_array_655a5_exposed_i_valid;
	assign array_array_655a5_exposed_i_valid = 1'd0;
	assign array_array_655a5_exposed_i = 32'd0;
	wire [31:0] array_array_66941_exposed_o;
	wire [31:0] array_array_66941_exposed_i;
	wire array_array_66941_exposed_i_valid;
	assign array_array_66941_exposed_i_valid = 1'd0;
	assign array_array_66941_exposed_i = 32'd0;
	wire [31:0] array_array_65739_exposed_o;
	wire [31:0] array_array_65739_exposed_i;
	wire array_array_65739_exposed_i_valid;
	assign array_array_65739_exposed_i_valid = 1'd0;
	assign array_array_65739_exposed_i = 32'd0;
	wire [31:0] array_array_6620d_exposed_o;
	wire [31:0] array_array_6620d_exposed_i;
	wire array_array_6620d_exposed_i_valid;
	assign array_array_6620d_exposed_i_valid = 1'd0;
	assign array_array_6620d_exposed_i = 32'd0;
	wire [31:0] array_array_66a61_exposed_o;
	wire [31:0] array_array_66a61_exposed_i;
	wire array_array_66a61_exposed_i_valid;
	assign array_array_66a61_exposed_i_valid = 1'd0;
	assign array_array_66a61_exposed_i = 32'd0;
	wire [31:0] array_array_663ed_exposed_o;
	wire [31:0] array_array_663ed_exposed_i;
	wire array_array_663ed_exposed_i_valid;
	assign array_array_663ed_exposed_i_valid = 1'd0;
	assign array_array_663ed_exposed_i = 32'd0;
	wire [31:0] array_array_65791_exposed_o;
	wire [31:0] array_array_65791_exposed_i;
	wire array_array_65791_exposed_i_valid;
	assign array_array_65791_exposed_i_valid = 1'd0;
	assign array_array_65791_exposed_i = 32'd0;
	wire [31:0] array_array_662fd_exposed_o;
	wire [31:0] array_array_662fd_exposed_i;
	wire array_array_662fd_exposed_i_valid;
	assign array_array_662fd_exposed_i_valid = 1'd0;
	assign array_array_662fd_exposed_i = 32'd0;
	wire [31:0] array_array_661dd_exposed_o;
	wire [31:0] array_array_661dd_exposed_i;
	wire array_array_661dd_exposed_i_valid;
	assign array_array_661dd_exposed_i_valid = 1'd0;
	assign array_array_661dd_exposed_i = 32'd0;
	wire [31:0] array_array_66071_exposed_o;
	wire [31:0] array_array_66071_exposed_i;
	wire array_array_66071_exposed_i_valid;
	assign array_array_66071_exposed_i_valid = 1'd0;
	assign array_array_66071_exposed_i = 32'd0;
	wire [31:0] array_array_6632d_exposed_o;
	wire [31:0] array_array_6632d_exposed_i;
	wire array_array_6632d_exposed_i_valid;
	assign array_array_6632d_exposed_i_valid = 1'd0;
	assign array_array_6632d_exposed_i = 32'd0;
	wire [31:0] array_array_66a91_exposed_o;
	wire [31:0] array_array_66a91_exposed_i;
	wire array_array_66a91_exposed_i_valid;
	assign array_array_66a91_exposed_i_valid = 1'd0;
	assign array_array_66a91_exposed_i = 32'd0;
	wire [31:0] array_array_66019_exposed_o;
	wire [31:0] array_array_66019_exposed_i;
	wire array_array_66019_exposed_i_valid;
	assign array_array_66019_exposed_i_valid = 1'd0;
	assign array_array_66019_exposed_i = 32'd0;
	wire [31:0] array_array_66881_exposed_o;
	wire [31:0] array_array_66881_exposed_i;
	wire array_array_66881_exposed_i_valid;
	assign array_array_66881_exposed_i_valid = 1'd0;
	assign array_array_66881_exposed_i = 32'd0;
	wire [31:0] array_array_65709_exposed_o;
	wire [31:0] array_array_65709_exposed_i;
	wire array_array_65709_exposed_i_valid;
	assign array_array_65709_exposed_i_valid = 1'd0;
	assign array_array_65709_exposed_i = 32'd0;
	wire [31:0] array_array_660c9_exposed_o;
	wire [31:0] array_array_660c9_exposed_i;
	wire array_array_660c9_exposed_i_valid;
	assign array_array_660c9_exposed_i_valid = 1'd0;
	assign array_array_660c9_exposed_i = 32'd0;
	wire [31:0] array_array_66bb1_exposed_o;
	wire [31:0] array_array_66bb1_exposed_i;
	wire array_array_66bb1_exposed_i_valid;
	assign array_array_66bb1_exposed_i_valid = 1'd0;
	assign array_array_66bb1_exposed_i = 32'd0;
	initial begin
		clk = 1'b1;
		rst_n = 1'b0;
		#(150)
			;
		rst_n = 1'b1;
		#(10100)
			;
	end
	always #(50) clk <= !clk;
	top top_i(
		.clk(clk),
		.rst_n(rst_n),
		.array_array_65631_exposed_o(array_array_65631_exposed_o),
		.array_array_65631_exposed_i(array_array_65631_exposed_i),
		.array_array_65631_exposed_i_valid(array_array_65631_exposed_i_valid),
		.array_array_657e9_exposed_o(array_array_657e9_exposed_o),
		.array_array_657e9_exposed_i(array_array_657e9_exposed_i),
		.array_array_657e9_exposed_i_valid(array_array_657e9_exposed_i_valid),
		.array_array_6617d_exposed_o(array_array_6617d_exposed_o),
		.array_array_6617d_exposed_i(array_array_6617d_exposed_i),
		.array_array_6617d_exposed_i_valid(array_array_6617d_exposed_i_valid),
		.array_array_6623d_exposed_o(array_array_6623d_exposed_o),
		.array_array_6623d_exposed_i(array_array_6623d_exposed_i),
		.array_array_6623d_exposed_i_valid(array_array_6623d_exposed_i_valid),
		.array_array_6635d_exposed_o(array_array_6635d_exposed_o),
		.array_array_6635d_exposed_i(array_array_6635d_exposed_i),
		.array_array_6635d_exposed_i_valid(array_array_6635d_exposed_i_valid),
		.array_array_66a01_exposed_o(array_array_66a01_exposed_o),
		.array_array_66a01_exposed_i(array_array_66a01_exposed_i),
		.array_array_66a01_exposed_i_valid(array_array_66a01_exposed_i_valid),
		.array_array_66a31_exposed_o(array_array_66a31_exposed_o),
		.array_array_66a31_exposed_i(array_array_66a31_exposed_i),
		.array_array_66a31_exposed_i_valid(array_array_66a31_exposed_i_valid),
		.array_array_66045_exposed_o(array_array_66045_exposed_o),
		.array_array_66045_exposed_i(array_array_66045_exposed_i),
		.array_array_66045_exposed_i_valid(array_array_66045_exposed_i_valid),
		.array_array_65601_exposed_o(array_array_65601_exposed_o),
		.array_array_65601_exposed_i(array_array_65601_exposed_i),
		.array_array_65601_exposed_i_valid(array_array_65601_exposed_i_valid),
		.array_array_6638d_exposed_o(array_array_6638d_exposed_o),
		.array_array_6638d_exposed_i(array_array_6638d_exposed_i),
		.array_array_6638d_exposed_i_valid(array_array_6638d_exposed_i_valid),
		.array_array_66971_exposed_o(array_array_66971_exposed_o),
		.array_array_66971_exposed_i(array_array_66971_exposed_i),
		.array_array_66971_exposed_i_valid(array_array_66971_exposed_i_valid),
		.array_array_66c75_exposed_o(array_array_66c75_exposed_o),
		.array_array_66c75_exposed_i(array_array_66c75_exposed_i),
		.array_array_66c75_exposed_i_valid(array_array_66c75_exposed_i_valid),
		.array_array_657bd_exposed_o(array_array_657bd_exposed_o),
		.array_array_657bd_exposed_i(array_array_657bd_exposed_i),
		.array_array_657bd_exposed_i_valid(array_array_657bd_exposed_i_valid),
		.array_array_66c15_exposed_o(array_array_66c15_exposed_o),
		.array_array_66c15_exposed_i(array_array_66c15_exposed_i),
		.array_array_66c15_exposed_i_valid(array_array_66c15_exposed_i_valid),
		.array_array_66911_exposed_o(array_array_66911_exposed_o),
		.array_array_66911_exposed_i(array_array_66911_exposed_i),
		.array_array_66911_exposed_i_valid(array_array_66911_exposed_i_valid),
		.array_array_656dd_exposed_o(array_array_656dd_exposed_o),
		.array_array_656dd_exposed_i(array_array_656dd_exposed_i),
		.array_array_656dd_exposed_i_valid(array_array_656dd_exposed_i_valid),
		.array_array_6554d_exposed_o(array_array_6554d_exposed_o),
		.array_array_6554d_exposed_i(array_array_6554d_exposed_i),
		.array_array_6554d_exposed_i_valid(array_array_6554d_exposed_i_valid),
		.array_array_65579_exposed_o(array_array_65579_exposed_o),
		.array_array_65579_exposed_i(array_array_65579_exposed_i),
		.array_array_65579_exposed_i_valid(array_array_65579_exposed_i_valid),
		.array_array_66b21_exposed_o(array_array_66b21_exposed_o),
		.array_array_66b21_exposed_i(array_array_66b21_exposed_i),
		.array_array_66b21_exposed_i_valid(array_array_66b21_exposed_i_valid),
		.array_array_669a1_exposed_o(array_array_669a1_exposed_o),
		.array_array_669a1_exposed_i(array_array_669a1_exposed_i),
		.array_array_669a1_exposed_i_valid(array_array_669a1_exposed_i_valid),
		.array_array_66b81_exposed_o(array_array_66b81_exposed_o),
		.array_array_66b81_exposed_i(array_array_66b81_exposed_i),
		.array_array_66b81_exposed_i_valid(array_array_66b81_exposed_i_valid),
		.array_array_669d1_exposed_o(array_array_669d1_exposed_o),
		.array_array_669d1_exposed_i(array_array_669d1_exposed_i),
		.array_array_669d1_exposed_i_valid(array_array_669d1_exposed_i_valid),
		.array_array_66851_exposed_o(array_array_66851_exposed_o),
		.array_array_66851_exposed_i(array_array_66851_exposed_i),
		.array_array_66851_exposed_i_valid(array_array_66851_exposed_i_valid),
		.array_array_66821_exposed_o(array_array_66821_exposed_o),
		.array_array_66821_exposed_i(array_array_66821_exposed_i),
		.array_array_66821_exposed_i_valid(array_array_66821_exposed_i_valid),
		.array_array_66ca5_exposed_o(array_array_66ca5_exposed_o),
		.array_array_66ca5_exposed_i(array_array_66ca5_exposed_i),
		.array_array_66ca5_exposed_i_valid(array_array_66ca5_exposed_i_valid),
		.array_array_65765_exposed_o(array_array_65765_exposed_o),
		.array_array_65765_exposed_i(array_array_65765_exposed_i),
		.array_array_65765_exposed_i_valid(array_array_65765_exposed_i_valid),
		.array_array_6626d_exposed_o(array_array_6626d_exposed_o),
		.array_array_6626d_exposed_i(array_array_6626d_exposed_i),
		.array_array_6626d_exposed_i_valid(array_array_6626d_exposed_i_valid),
		.array_array_6629d_exposed_o(array_array_6629d_exposed_o),
		.array_array_6629d_exposed_i(array_array_6629d_exposed_i),
		.array_array_6629d_exposed_i_valid(array_array_6629d_exposed_i_valid),
		.array_array_6614d_exposed_o(array_array_6614d_exposed_o),
		.array_array_6614d_exposed_i(array_array_6614d_exposed_i),
		.array_array_6614d_exposed_i_valid(array_array_6614d_exposed_i_valid),
		.array_array_66be1_exposed_o(array_array_66be1_exposed_o),
		.array_array_66be1_exposed_i(array_array_66be1_exposed_i),
		.array_array_66be1_exposed_i_valid(array_array_66be1_exposed_i_valid),
		.array_array_655d1_exposed_o(array_array_655d1_exposed_o),
		.array_array_655d1_exposed_i(array_array_655d1_exposed_i),
		.array_array_655d1_exposed_i_valid(array_array_655d1_exposed_i_valid),
		.array_array_662cd_exposed_o(array_array_662cd_exposed_o),
		.array_array_662cd_exposed_i(array_array_662cd_exposed_i),
		.array_array_662cd_exposed_i_valid(array_array_662cd_exposed_i_valid),
		.array_array_66af1_exposed_o(array_array_66af1_exposed_o),
		.array_array_66af1_exposed_i(array_array_66af1_exposed_i),
		.array_array_66af1_exposed_i_valid(array_array_66af1_exposed_i_valid),
		.array_array_661ad_exposed_o(array_array_661ad_exposed_o),
		.array_array_661ad_exposed_i(array_array_661ad_exposed_i),
		.array_array_661ad_exposed_i_valid(array_array_661ad_exposed_i_valid),
		.array_array_668e1_exposed_o(array_array_668e1_exposed_o),
		.array_array_668e1_exposed_i(array_array_668e1_exposed_i),
		.array_array_668e1_exposed_i_valid(array_array_668e1_exposed_i_valid),
		.array_array_656b5_exposed_o(array_array_656b5_exposed_o),
		.array_array_656b5_exposed_i(array_array_656b5_exposed_i),
		.array_array_656b5_exposed_i_valid(array_array_656b5_exposed_i_valid),
		.array_array_66121_exposed_o(array_array_66121_exposed_o),
		.array_array_66121_exposed_i(array_array_66121_exposed_i),
		.array_array_66121_exposed_i_valid(array_array_66121_exposed_i_valid),
		.array_array_663bd_exposed_o(array_array_663bd_exposed_o),
		.array_array_663bd_exposed_i(array_array_663bd_exposed_i),
		.array_array_663bd_exposed_i_valid(array_array_663bd_exposed_i_valid),
		.array_array_6609d_exposed_o(array_array_6609d_exposed_o),
		.array_array_6609d_exposed_i(array_array_6609d_exposed_i),
		.array_array_6609d_exposed_i_valid(array_array_6609d_exposed_i_valid),
		.array_array_66c45_exposed_o(array_array_66c45_exposed_o),
		.array_array_66c45_exposed_i(array_array_66c45_exposed_i),
		.array_array_66c45_exposed_i_valid(array_array_66c45_exposed_i_valid),
		.array_array_66b51_exposed_o(array_array_66b51_exposed_o),
		.array_array_66b51_exposed_i(array_array_66b51_exposed_i),
		.array_array_66b51_exposed_i_valid(array_array_66b51_exposed_i_valid),
		.array_array_66cd5_exposed_o(array_array_66cd5_exposed_o),
		.array_array_66cd5_exposed_i(array_array_66cd5_exposed_i),
		.array_array_66cd5_exposed_i_valid(array_array_66cd5_exposed_i_valid),
		.array_array_66ac1_exposed_o(array_array_66ac1_exposed_o),
		.array_array_66ac1_exposed_i(array_array_66ac1_exposed_i),
		.array_array_66ac1_exposed_i_valid(array_array_66ac1_exposed_i_valid),
		.array_array_668b1_exposed_o(array_array_668b1_exposed_o),
		.array_array_668b1_exposed_i(array_array_668b1_exposed_i),
		.array_array_668b1_exposed_i_valid(array_array_668b1_exposed_i_valid),
		.array_array_6565d_exposed_o(array_array_6565d_exposed_o),
		.array_array_6565d_exposed_i(array_array_6565d_exposed_i),
		.array_array_6565d_exposed_i_valid(array_array_6565d_exposed_i_valid),
		.array_array_660f5_exposed_o(array_array_660f5_exposed_o),
		.array_array_660f5_exposed_i(array_array_660f5_exposed_i),
		.array_array_660f5_exposed_i_valid(array_array_660f5_exposed_i_valid),
		.array_array_6568d_exposed_o(array_array_6568d_exposed_o),
		.array_array_6568d_exposed_i(array_array_6568d_exposed_i),
		.array_array_6568d_exposed_i_valid(array_array_6568d_exposed_i_valid),
		.array_array_655a5_exposed_o(array_array_655a5_exposed_o),
		.array_array_655a5_exposed_i(array_array_655a5_exposed_i),
		.array_array_655a5_exposed_i_valid(array_array_655a5_exposed_i_valid),
		.array_array_66941_exposed_o(array_array_66941_exposed_o),
		.array_array_66941_exposed_i(array_array_66941_exposed_i),
		.array_array_66941_exposed_i_valid(array_array_66941_exposed_i_valid),
		.array_array_65739_exposed_o(array_array_65739_exposed_o),
		.array_array_65739_exposed_i(array_array_65739_exposed_i),
		.array_array_65739_exposed_i_valid(array_array_65739_exposed_i_valid),
		.array_array_6620d_exposed_o(array_array_6620d_exposed_o),
		.array_array_6620d_exposed_i(array_array_6620d_exposed_i),
		.array_array_6620d_exposed_i_valid(array_array_6620d_exposed_i_valid),
		.array_array_66a61_exposed_o(array_array_66a61_exposed_o),
		.array_array_66a61_exposed_i(array_array_66a61_exposed_i),
		.array_array_66a61_exposed_i_valid(array_array_66a61_exposed_i_valid),
		.array_array_663ed_exposed_o(array_array_663ed_exposed_o),
		.array_array_663ed_exposed_i(array_array_663ed_exposed_i),
		.array_array_663ed_exposed_i_valid(array_array_663ed_exposed_i_valid),
		.array_array_65791_exposed_o(array_array_65791_exposed_o),
		.array_array_65791_exposed_i(array_array_65791_exposed_i),
		.array_array_65791_exposed_i_valid(array_array_65791_exposed_i_valid),
		.array_array_662fd_exposed_o(array_array_662fd_exposed_o),
		.array_array_662fd_exposed_i(array_array_662fd_exposed_i),
		.array_array_662fd_exposed_i_valid(array_array_662fd_exposed_i_valid),
		.array_array_661dd_exposed_o(array_array_661dd_exposed_o),
		.array_array_661dd_exposed_i(array_array_661dd_exposed_i),
		.array_array_661dd_exposed_i_valid(array_array_661dd_exposed_i_valid),
		.array_array_66071_exposed_o(array_array_66071_exposed_o),
		.array_array_66071_exposed_i(array_array_66071_exposed_i),
		.array_array_66071_exposed_i_valid(array_array_66071_exposed_i_valid),
		.array_array_6632d_exposed_o(array_array_6632d_exposed_o),
		.array_array_6632d_exposed_i(array_array_6632d_exposed_i),
		.array_array_6632d_exposed_i_valid(array_array_6632d_exposed_i_valid),
		.array_array_66a91_exposed_o(array_array_66a91_exposed_o),
		.array_array_66a91_exposed_i(array_array_66a91_exposed_i),
		.array_array_66a91_exposed_i_valid(array_array_66a91_exposed_i_valid),
		.array_array_66019_exposed_o(array_array_66019_exposed_o),
		.array_array_66019_exposed_i(array_array_66019_exposed_i),
		.array_array_66019_exposed_i_valid(array_array_66019_exposed_i_valid),
		.array_array_66881_exposed_o(array_array_66881_exposed_o),
		.array_array_66881_exposed_i(array_array_66881_exposed_i),
		.array_array_66881_exposed_i_valid(array_array_66881_exposed_i_valid),
		.array_array_65709_exposed_o(array_array_65709_exposed_o),
		.array_array_65709_exposed_i(array_array_65709_exposed_i),
		.array_array_65709_exposed_i_valid(array_array_65709_exposed_i_valid),
		.array_array_660c9_exposed_o(array_array_660c9_exposed_o),
		.array_array_660c9_exposed_i(array_array_660c9_exposed_i),
		.array_array_660c9_exposed_i_valid(array_array_660c9_exposed_i_valid),
		.array_array_66bb1_exposed_o(array_array_66bb1_exposed_o),
		.array_array_66bb1_exposed_i(array_array_66bb1_exposed_i),
		.array_array_66bb1_exposed_i_valid(array_array_66bb1_exposed_i_valid)
	);
endmodule