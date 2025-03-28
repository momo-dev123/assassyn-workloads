module level_0 (
	clk,
	rst_n,
	fifo_action_pop_valid,
	fifo_action_pop_data,
	fifo_action_pop_ready,
	fifo_index_pop_valid,
	fifo_index_pop_data,
	fifo_index_pop_ready,
	fifo_value_pop_valid,
	fifo_value_pop_data,
	fifo_value_pop_ready,
	array_array_8bd1c_q,
	fifo_level_1_value_push_valid,
	fifo_level_1_value_push_data,
	fifo_level_1_value_push_ready,
	fifo_level_1_action_push_valid,
	fifo_level_1_action_push_data,
	fifo_level_1_action_push_ready,
	fifo_level_1_index_push_valid,
	fifo_level_1_index_push_data,
	fifo_level_1_index_push_ready,
	level_1_counter_delta,
	level_1_counter_delta_ready,
	array_array_8bd0a_q,
	array_array_8bd0a_w,
	array_array_8bd0a_widx,
	array_array_8bd0a_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_action_pop_valid;
	input wire [0:0] fifo_action_pop_data;
	output wire [0:0] fifo_action_pop_ready;
	input wire [0:0] fifo_index_pop_valid;
	input wire [31:0] fifo_index_pop_data;
	output wire [0:0] fifo_index_pop_ready;
	input wire [0:0] fifo_value_pop_valid;
	input wire [31:0] fifo_value_pop_data;
	output wire [0:0] fifo_value_pop_ready;
	input wire [71:0] array_array_8bd1c_q;
	output wire [0:0] fifo_level_1_value_push_valid;
	output wire [31:0] fifo_level_1_value_push_data;
	input wire [0:0] fifo_level_1_value_push_ready;
	output wire [0:0] fifo_level_1_action_push_valid;
	output wire [0:0] fifo_level_1_action_push_data;
	input wire [0:0] fifo_level_1_action_push_ready;
	output wire [0:0] fifo_level_1_index_push_valid;
	output wire [31:0] fifo_level_1_index_push_data;
	input wire [0:0] fifo_level_1_index_push_ready;
	output wire [7:0] level_1_counter_delta;
	input wire [0:0] level_1_counter_delta_ready;
	input wire [36:0] array_array_8bd0a_q;
	output wire [0:0] array_array_8bd0a_w;
	output wire [0:0] array_array_8bd0a_widx;
	output wire [36:0] array_array_8bd0a_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire [0:0] var_47;
	assign var_47 = fifo_action_pop_valid;
	wire [0:0] var_49;
	assign var_49 = fifo_index_pop_valid;
	wire [0:0] var_51;
	assign var_51 = $signed(var_47) & $signed(var_49);
	wire [0:0] var_54;
	assign var_54 = fifo_value_pop_valid;
	wire [0:0] var_56;
	assign var_56 = var_51 & $signed(var_54);
	wire executed;
	wire [0:0] var_61;
	assign var_61 = fifo_action_pop_data;
	assign fifo_action_pop_ready = executed;
	wire [31:0] var_63;
	assign var_63 = fifo_index_pop_data;
	assign fifo_index_pop_ready = executed;
	wire [31:0] var_65;
	assign var_65 = fifo_value_pop_data;
	assign fifo_value_pop_ready = executed;
	wire [0:0] var_68;
	assign var_68 = var_63[0:0];
	wire [0:0] var_72;
	assign var_72 = var_68;
	wire [36:0] var_196;
	assign var_196 = (0 == var_72 ? array_array_8bd0a_q[36:0] : {37 {1'sbx}});
	wire [31:0] var_81;
	assign var_81 = var_196[31:0];
	wire [31:0] var_85;
	assign var_85 = var_81;
	wire [0:0] var_91;
	assign var_91 = var_196[32:32];
	wire [3:0] var_100;
	assign var_100 = var_196[36:33];
	wire [3:0] var_104;
	assign var_104 = var_100;
	wire [0:0] var_107;
	assign var_107 = 1'd1;
	wire [0:0] var_95;
	assign var_95 = ~var_61;
	always @(posedge clk)
		if (executed && (var_107 && var_61))
			$display("%t\t[level_0]\t\tPush: %d", $time, var_65);
	always @(posedge clk)
		if (executed && ((var_107 && var_95) && var_91))
			$display("%t\t[level_0]\t\tPop: %d", $time, var_85);
	wire [0:0] var_132;
	assign var_132 = ~var_91;
	always @(posedge clk)
		if (executed && ((var_107 && var_95) && var_132))
			$display("%t\t[level_0]\t\tPop		Pop failed! The heap is empty.", $time);
	wire [32:0] var_141;
	assign var_141 = $signed(var_72) * 32'd2;
	wire [31:0] var_144;
	assign var_144 = var_141[31:0];
	wire [31:0] var_148;
	assign var_148 = var_144;
	wire [31:0] var_151;
	assign var_151 = $signed(var_148) + 32'd1;
	wire [35:0] var_356;
	assign var_356 = (1 == var_148 ? array_array_8bd1c_q[71:36] : (0 == var_148 ? array_array_8bd1c_q[35:0] : {36 {1'sbx}}));
	wire [31:0] var_157;
	assign var_157 = var_356[31:0];
	wire [31:0] var_161;
	assign var_161 = var_157;
	wire [35:0] var_186;
	assign var_186 = (1 == var_151 ? array_array_8bd1c_q[71:36] : (0 == var_151 ? array_array_8bd1c_q[35:0] : {36 {1'sbx}}));
	wire [31:0] var_166;
	assign var_166 = var_186[31:0];
	wire [31:0] var_170;
	assign var_170 = var_166;
	wire [0:0] var_175;
	assign var_175 = var_356[32:32];
	wire [0:0] var_182;
	assign var_182 = var_186[32:32];
	wire [2:0] var_190;
	assign var_190 = var_356[35:33];
	wire [2:0] var_194;
	assign var_194 = var_190;
	wire [2:0] var_199;
	assign var_199 = var_186[35:33];
	wire [2:0] var_203;
	assign var_203 = var_199;
	wire [32:0] var_205;
	assign var_205 = {var_61, var_65};
	wire [32:0] var_208;
	assign var_208 = {var_175, var_161};
	wire [32:0] var_211;
	assign var_211 = (var_61 ? var_205 : var_208);
	wire [32:0] var_216;
	assign var_216 = var_211 ^ 33'd4294967296;
	wire [32:0] var_219;
	assign var_219 = {var_91, var_85};
	wire [32:0] var_222;
	assign var_222 = {var_182, var_170};
	wire [32:0] var_225;
	assign var_225 = (var_61 ? var_219 : var_222);
	wire [32:0] var_229;
	assign var_229 = var_225 ^ 33'd4294967296;
	wire [0:0] var_354;
	assign var_354 = var_216 < var_229;
	wire [32:0] var_235;
	assign var_235 = (var_354 ? var_216 : var_229);
	wire [31:0] var_239;
	assign var_239 = var_235[31:0];
	wire [31:0] var_243;
	assign var_243 = var_239;
	wire [32:0] var_248;
	assign var_248 = (var_354 ? var_229 : var_216);
	wire [31:0] var_252;
	assign var_252 = var_248[31:0];
	wire [31:0] var_256;
	assign var_256 = var_252;
	wire [3:0] var_259;
	assign var_259 = $signed(var_104) - 4'd1;
	wire [3:0] var_262;
	assign var_262 = $signed(var_104) + 4'd1;
	wire [3:0] var_265;
	assign var_265 = (var_61 ? var_259 : var_262);
	wire [0:0] var_269;
	assign var_269 = var_61 | var_175;
	wire [0:0] var_272;
	assign var_272 = var_269 | var_182;
	wire [3:0] var_275;
	assign var_275 = (var_272 ? var_265 : var_104);
	wire [3:0] var_279;
	assign var_279 = (var_91 ? var_275 : var_104);
	wire [0:0] var_284;
	assign var_284 = (var_61 ? 1'd1 : 1'd0);
	wire [0:0] var_1192;
	assign var_1192 = var_175 | var_182;
	wire [0:0] var_293;
	assign var_293 = var_95 & var_1192;
	wire [0:0] var_296;
	assign var_296 = (var_293 ? 1'd1 : var_284);
	wire [31:0] var_301;
	assign var_301 = {29'd0, var_203};
	wire [31:0] var_304;
	assign var_304 = var_301;
	wire [31:0] var_306;
	assign var_306 = {29'd0, var_194};
	wire [31:0] var_309;
	assign var_309 = var_306;
	wire [31:0] var_311;
	assign var_311 = (var_61 ? var_304 : var_161);
	wire [31:0] var_315;
	assign var_315 = (var_61 ? var_309 : var_170);
	wire [0:0] var_319;
	assign var_319 = $signed(var_311) < $signed(var_315);
	wire [31:0] var_322;
	assign var_322 = (var_319 ? var_148 : var_151);
	wire [0:0] var_326;
	assign var_326 = var_61 ^ var_175;
	wire [31:0] var_329;
	assign var_329 = (var_326 ? var_148 : var_151);
	wire [0:0] var_333;
	assign var_333 = var_175 ^ var_182;
	wire [31:0] var_336;
	assign var_336 = (var_333 ? var_329 : var_322);
	wire [0:0] var_340;
	assign var_340 = var_61 & var_91;
	wire [0:0] var_344;
	assign var_344 = $signed(var_104) > 4'd0;
	wire [0:0] var_347;
	assign var_347 = var_340 & var_344;
	wire [0:0] var_350;
	assign var_350 = (var_347 ? 1'd1 : 1'd0);
	wire [0:0] var_359;
	assign var_359 = var_95 & var_1192;
	wire [0:0] var_362;
	assign var_362 = (var_359 ? 1'd1 : var_350);
	wire [4:0] var_366;
	assign var_366 = {var_279, var_296};
	wire [36:0] var_369;
	assign var_369 = {var_366, var_243};
	assign level_1_counter_delta = (executed ? {7'b0000000, |var_362} : 0);
	assign fifo_level_1_index_push_valid = executed && var_362;
	assign fifo_level_1_index_push_data = {32 {var_362}} & var_336;
	assign fifo_level_1_action_push_valid = executed && var_362;
	assign fifo_level_1_action_push_data = {var_362} & var_61;
	assign fifo_level_1_value_push_valid = executed && var_362;
	assign fifo_level_1_value_push_data = {32 {var_362}} & var_256;
	assign array_array_8bd0a_w = executed;
	assign array_array_8bd0a_d = var_369;
	assign array_array_8bd0a_widx = var_72;
	assign executed = counter_pop_valid && var_56;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module testbench (
	clk,
	rst_n,
	heappush_8bd6a_counter_delta,
	heappush_8bd6a_counter_delta_ready,
	fifo_heappush_8bd6a_push_value_push_valid,
	fifo_heappush_8bd6a_push_value_push_data,
	fifo_heappush_8bd6a_push_value_push_ready,
	heappop_60958_counter_delta,
	heappop_60958_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [7:0] heappush_8bd6a_counter_delta;
	input wire [0:0] heappush_8bd6a_counter_delta_ready;
	output wire [0:0] fifo_heappush_8bd6a_push_value_push_valid;
	output wire [31:0] fifo_heappush_8bd6a_push_value_push_data;
	input wire [0:0] fifo_heappush_8bd6a_push_value_push_ready;
	output wire [7:0] heappop_60958_counter_delta;
	input wire [0:0] heappop_60958_counter_delta_ready;
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
	assign heappop_60958_counter_delta = (executed ? ((({7'b0000000, |(cycle_cnt == 3)} + {7'b0000000, |(cycle_cnt == 9)}) + {7'b0000000, |(cycle_cnt == 19)}) + {7'b0000000, |(cycle_cnt == 21)}) + {7'b0000000, |(cycle_cnt == 29)} : 0);
	assign heappush_8bd6a_counter_delta = (executed ? (((((((({7'b0000000, |(cycle_cnt == 1)} + {7'b0000000, |(cycle_cnt == 5)}) + {7'b0000000, |(cycle_cnt == 7)}) + {7'b0000000, |(cycle_cnt == 11)}) + {7'b0000000, |(cycle_cnt == 13)}) + {7'b0000000, |(cycle_cnt == 15)}) + {7'b0000000, |(cycle_cnt == 17)}) + {7'b0000000, |(cycle_cnt == 23)}) + {7'b0000000, |(cycle_cnt == 25)}) + {7'b0000000, |(cycle_cnt == 27)} : 0);
	assign fifo_heappush_8bd6a_push_value_push_valid = executed && ((((((((((cycle_cnt == 1) || (cycle_cnt == 5)) || (cycle_cnt == 7)) || (cycle_cnt == 11)) || (cycle_cnt == 13)) || (cycle_cnt == 15)) || (cycle_cnt == 17)) || (cycle_cnt == 23)) || (cycle_cnt == 25)) || (cycle_cnt == 27));
	assign fifo_heappush_8bd6a_push_value_push_data = ((((((((({32 {cycle_cnt == 1}} & 65) | ({32 {cycle_cnt == 5}} & 58)) | ({32 {cycle_cnt == 7}} & 9)) | ({32 {cycle_cnt == 11}} & 41)) | ({32 {cycle_cnt == 13}} & 92)) | ({32 {cycle_cnt == 15}} & 10)) | ({32 {cycle_cnt == 17}} & 94)) | ({32 {cycle_cnt == 23}} & 79)) | ({32 {cycle_cnt == 25}} & 86)) | ({32 {cycle_cnt == 27}} & 18);
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module heappop_60958 (
	clk,
	rst_n,
	fifo_level_0_value_push_valid,
	fifo_level_0_value_push_data,
	fifo_level_0_value_push_ready,
	fifo_level_0_action_push_valid,
	fifo_level_0_action_push_data,
	fifo_level_0_action_push_ready,
	level_0_counter_delta,
	level_0_counter_delta_ready,
	fifo_level_0_index_push_valid,
	fifo_level_0_index_push_data,
	fifo_level_0_index_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	output wire [0:0] fifo_level_0_value_push_valid;
	output wire [31:0] fifo_level_0_value_push_data;
	input wire [0:0] fifo_level_0_value_push_ready;
	output wire [0:0] fifo_level_0_action_push_valid;
	output wire [0:0] fifo_level_0_action_push_data;
	input wire [0:0] fifo_level_0_action_push_ready;
	output wire [7:0] level_0_counter_delta;
	input wire [0:0] level_0_counter_delta_ready;
	output wire [0:0] fifo_level_0_index_push_valid;
	output wire [31:0] fifo_level_0_index_push_data;
	input wire [0:0] fifo_level_0_index_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire executed;
	assign level_0_counter_delta = (executed ? 1 : 0);
	assign fifo_level_0_index_push_valid = executed;
	assign fifo_level_0_index_push_data = 0;
	assign fifo_level_0_value_push_valid = executed;
	assign fifo_level_0_value_push_data = 1;
	assign fifo_level_0_action_push_valid = executed;
	assign fifo_level_0_action_push_data = 0;
	assign executed = counter_pop_valid;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module heappush_8bd6a (
	clk,
	rst_n,
	fifo_push_value_pop_valid,
	fifo_push_value_pop_data,
	fifo_push_value_pop_ready,
	fifo_level_0_index_push_valid,
	fifo_level_0_index_push_data,
	fifo_level_0_index_push_ready,
	level_0_counter_delta,
	level_0_counter_delta_ready,
	fifo_level_0_action_push_valid,
	fifo_level_0_action_push_data,
	fifo_level_0_action_push_ready,
	fifo_level_0_value_push_valid,
	fifo_level_0_value_push_data,
	fifo_level_0_value_push_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_push_value_pop_valid;
	input wire [31:0] fifo_push_value_pop_data;
	output wire [0:0] fifo_push_value_pop_ready;
	output wire [0:0] fifo_level_0_index_push_valid;
	output wire [31:0] fifo_level_0_index_push_data;
	input wire [0:0] fifo_level_0_index_push_ready;
	output wire [7:0] level_0_counter_delta;
	input wire [0:0] level_0_counter_delta_ready;
	output wire [0:0] fifo_level_0_action_push_valid;
	output wire [0:0] fifo_level_0_action_push_data;
	input wire [0:0] fifo_level_0_action_push_ready;
	output wire [0:0] fifo_level_0_value_push_valid;
	output wire [31:0] fifo_level_0_value_push_data;
	input wire [0:0] fifo_level_0_value_push_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire [0:0] var_986;
	assign var_986 = fifo_push_value_pop_valid;
	wire executed;
	wire [31:0] var_990;
	assign var_990 = fifo_push_value_pop_data;
	assign fifo_push_value_pop_ready = executed;
	assign level_0_counter_delta = (executed ? 1 : 0);
	assign fifo_level_0_index_push_valid = executed;
	assign fifo_level_0_index_push_data = 0;
	assign fifo_level_0_value_push_valid = executed;
	assign fifo_level_0_value_push_data = var_990;
	assign fifo_level_0_action_push_valid = executed;
	assign fifo_level_0_action_push_data = 1;
	assign executed = counter_pop_valid && var_986;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module level_2 (
	clk,
	rst_n,
	fifo_value_pop_valid,
	fifo_value_pop_data,
	fifo_value_pop_ready,
	fifo_action_pop_valid,
	fifo_action_pop_data,
	fifo_action_pop_ready,
	fifo_index_pop_valid,
	fifo_index_pop_data,
	fifo_index_pop_ready,
	array_array_8bd31_q,
	array_array_8bd31_w,
	array_array_8bd31_widx,
	array_array_8bd31_d,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_value_pop_valid;
	input wire [31:0] fifo_value_pop_data;
	output wire [0:0] fifo_value_pop_ready;
	input wire [0:0] fifo_action_pop_valid;
	input wire [0:0] fifo_action_pop_data;
	output wire [0:0] fifo_action_pop_ready;
	input wire [0:0] fifo_index_pop_valid;
	input wire [31:0] fifo_index_pop_data;
	output wire [0:0] fifo_index_pop_ready;
	input wire [139:0] array_array_8bd31_q;
	output wire [0:0] array_array_8bd31_w;
	output wire [1:0] array_array_8bd31_widx;
	output wire [34:0] array_array_8bd31_d;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire [0:0] var_733;
	assign var_733 = fifo_action_pop_valid;
	wire [0:0] var_735;
	assign var_735 = fifo_index_pop_valid;
	wire [0:0] var_737;
	assign var_737 = $signed(var_733) & $signed(var_735);
	wire [0:0] var_740;
	assign var_740 = fifo_value_pop_valid;
	wire [0:0] var_742;
	assign var_742 = var_737 & $signed(var_740);
	wire executed;
	wire [0:0] var_747;
	assign var_747 = fifo_action_pop_data;
	assign fifo_action_pop_ready = executed;
	wire [31:0] var_749;
	assign var_749 = fifo_index_pop_data;
	assign fifo_index_pop_ready = executed;
	wire [31:0] var_751;
	assign var_751 = fifo_value_pop_data;
	assign fifo_value_pop_ready = executed;
	wire [1:0] var_753;
	assign var_753 = var_749[1:0];
	wire [1:0] var_757;
	assign var_757 = var_753;
	wire [34:0] var_964;
	assign var_964 = (3 == var_757 ? array_array_8bd31_q[139:105] : (2 == var_757 ? array_array_8bd31_q[104:70] : (1 == var_757 ? array_array_8bd31_q[69:35] : (0 == var_757 ? array_array_8bd31_q[34:0] : {35 {1'sbx}}))));
	wire [31:0] var_765;
	assign var_765 = var_964[31:0];
	wire [31:0] var_769;
	assign var_769 = var_765;
	wire [0:0] var_774;
	assign var_774 = var_964[32:32];
	wire [1:0] var_781;
	assign var_781 = var_964[34:33];
	wire [1:0] var_785;
	assign var_785 = var_781;
	wire [0:0] var_787;
	assign var_787 = 1'd0;
	wire [0:0] var_925;
	assign var_925 = ~var_747;
	always @(posedge clk)
		if (executed && (var_787 && var_747))
			$display("%t\t[level_2]\t\tPush: %d", $time, var_751);
	always @(posedge clk)
		if (executed && ((var_787 && var_925) && var_774))
			$display("%t\t[level_2]\t\tPop: %d", $time, var_769);
	wire [0:0] var_812;
	assign var_812 = ~var_774;
	always @(posedge clk)
		if (executed && ((var_787 && var_925) && var_812))
			$display("%t\t[level_2]\t\tPop		Pop failed! The heap is empty.", $time);
	wire [33:0] var_820;
	assign var_820 = $signed(var_757) * 32'd2;
	wire [31:0] var_823;
	assign var_823 = var_820[31:0];
	wire [31:0] var_827;
	assign var_827 = var_823;
	wire [31:0] var_829;
	assign var_829 = $signed(var_827) + 32'd1;
	wire [32:0] var_832;
	assign var_832 = {var_747, var_751};
	wire [32:0] var_836;
	assign var_836 = (var_747 ? var_832 : 33'd0);
	wire [32:0] var_840;
	assign var_840 = var_836 ^ 33'd4294967296;
	wire [32:0] var_843;
	assign var_843 = {var_774, var_769};
	wire [32:0] var_846;
	assign var_846 = (var_747 ? var_843 : 33'd0);
	wire [32:0] var_850;
	assign var_850 = var_846 ^ 33'd4294967296;
	wire [0:0] var_778;
	assign var_778 = var_840 < var_850;
	wire [32:0] var_856;
	assign var_856 = (var_778 ? var_840 : var_850);
	wire [31:0] var_860;
	assign var_860 = var_856[31:0];
	wire [31:0] var_864;
	assign var_864 = var_860;
	wire [32:0] var_869;
	assign var_869 = (var_778 ? var_850 : var_840);
	wire [31:0] var_873;
	assign var_873 = var_869[31:0];
	wire [31:0] var_877;
	assign var_877 = var_873;
	wire [1:0] var_880;
	assign var_880 = $signed(var_785) - 2'd1;
	wire [1:0] var_883;
	assign var_883 = $signed(var_785) + 2'd1;
	wire [1:0] var_886;
	assign var_886 = (var_747 ? var_880 : var_883);
	wire [0:0] var_891;
	assign var_891 = var_747 | 1'd0;
	wire [0:0] var_894;
	assign var_894 = var_891 | 1'd0;
	wire [1:0] var_897;
	assign var_897 = (var_894 ? var_886 : var_785);
	wire [1:0] var_901;
	assign var_901 = (var_774 ? var_897 : var_785);
	wire [0:0] var_905;
	assign var_905 = (var_747 ? 1'd1 : 1'd0);
	wire [0:0] var_1188;
	assign var_1188 = 1'd0 | 1'd0;
	wire [0:0] var_914;
	assign var_914 = var_925 & var_1188;
	wire [0:0] var_917;
	assign var_917 = (var_914 ? 1'd1 : var_905);
	wire [31:0] var_966;
	assign var_966 = (var_747 ? 32'd0 : 32'd0);
	wire [0:0] var_929;
	assign var_929 = $signed(var_966) < $signed(var_966);
	wire [31:0] var_932;
	assign var_932 = (var_929 ? var_827 : var_829);
	wire [0:0] var_936;
	assign var_936 = var_747 ^ 1'd0;
	wire [31:0] var_939;
	assign var_939 = (var_936 ? var_827 : var_829);
	wire [0:0] var_943;
	assign var_943 = 1'd0 ^ 1'd0;
	wire [31:0] var_946;
	assign var_946 = (var_943 ? var_939 : var_932);
	wire [0:0] var_950;
	assign var_950 = var_747 & var_774;
	wire [0:0] var_954;
	assign var_954 = $signed(var_785) > 2'd0;
	wire [0:0] var_957;
	assign var_957 = var_950 & var_954;
	wire [0:0] var_960;
	assign var_960 = (var_957 ? 1'd1 : 1'd0);
	wire [0:0] var_969;
	assign var_969 = var_925 & var_1188;
	wire [0:0] var_972;
	assign var_972 = (var_969 ? 1'd1 : var_960);
	wire [2:0] var_976;
	assign var_976 = {var_901, var_917};
	wire [34:0] var_979;
	assign var_979 = {var_976, var_864};
	assign array_array_8bd31_w = executed;
	assign array_array_8bd31_d = var_979;
	assign array_array_8bd31_widx = var_757;
	assign executed = counter_pop_valid && var_742;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module level_1 (
	clk,
	rst_n,
	fifo_action_pop_valid,
	fifo_action_pop_data,
	fifo_action_pop_ready,
	fifo_value_pop_valid,
	fifo_value_pop_data,
	fifo_value_pop_ready,
	fifo_index_pop_valid,
	fifo_index_pop_data,
	fifo_index_pop_ready,
	array_array_8bd1c_q,
	array_array_8bd1c_w,
	array_array_8bd1c_widx,
	array_array_8bd1c_d,
	fifo_level_2_index_push_valid,
	fifo_level_2_index_push_data,
	fifo_level_2_index_push_ready,
	fifo_level_2_action_push_valid,
	fifo_level_2_action_push_data,
	fifo_level_2_action_push_ready,
	array_array_8bd31_q,
	fifo_level_2_value_push_valid,
	fifo_level_2_value_push_data,
	fifo_level_2_value_push_ready,
	level_2_counter_delta,
	level_2_counter_delta_ready,
	counter_pop_valid,
	counter_delta_ready,
	counter_pop_ready,
	expose_executed
);
	input wire clk;
	input wire rst_n;
	input wire [0:0] fifo_action_pop_valid;
	input wire [0:0] fifo_action_pop_data;
	output wire [0:0] fifo_action_pop_ready;
	input wire [0:0] fifo_value_pop_valid;
	input wire [31:0] fifo_value_pop_data;
	output wire [0:0] fifo_value_pop_ready;
	input wire [0:0] fifo_index_pop_valid;
	input wire [31:0] fifo_index_pop_data;
	output wire [0:0] fifo_index_pop_ready;
	input wire [71:0] array_array_8bd1c_q;
	output wire [0:0] array_array_8bd1c_w;
	output wire [0:0] array_array_8bd1c_widx;
	output wire [35:0] array_array_8bd1c_d;
	output wire [0:0] fifo_level_2_index_push_valid;
	output wire [31:0] fifo_level_2_index_push_data;
	input wire [0:0] fifo_level_2_index_push_ready;
	output wire [0:0] fifo_level_2_action_push_valid;
	output wire [0:0] fifo_level_2_action_push_data;
	input wire [0:0] fifo_level_2_action_push_ready;
	input wire [139:0] array_array_8bd31_q;
	output wire [0:0] fifo_level_2_value_push_valid;
	output wire [31:0] fifo_level_2_value_push_data;
	input wire [0:0] fifo_level_2_value_push_ready;
	output wire [7:0] level_2_counter_delta;
	input wire [0:0] level_2_counter_delta_ready;
	input wire counter_pop_valid;
	input wire counter_delta_ready;
	output wire counter_pop_ready;
	output wire expose_executed;
	wire [0:0] var_395;
	assign var_395 = fifo_action_pop_valid;
	wire [0:0] var_397;
	assign var_397 = fifo_index_pop_valid;
	wire [0:0] var_399;
	assign var_399 = $signed(var_395) & $signed(var_397);
	wire [0:0] var_402;
	assign var_402 = fifo_value_pop_valid;
	wire [0:0] var_404;
	assign var_404 = var_399 & $signed(var_402);
	wire executed;
	wire [0:0] var_409;
	assign var_409 = fifo_action_pop_data;
	assign fifo_action_pop_ready = executed;
	wire [31:0] var_411;
	assign var_411 = fifo_index_pop_data;
	assign fifo_index_pop_ready = executed;
	wire [31:0] var_413;
	assign var_413 = fifo_value_pop_data;
	assign fifo_value_pop_ready = executed;
	wire [0:0] var_415;
	assign var_415 = var_411[0:0];
	wire [0:0] var_419;
	assign var_419 = var_415;
	wire [35:0] var_536;
	assign var_536 = (1 == var_419 ? array_array_8bd1c_q[71:36] : (0 == var_419 ? array_array_8bd1c_q[35:0] : {36 {1'sbx}}));
	wire [31:0] var_427;
	assign var_427 = var_536[31:0];
	wire [31:0] var_431;
	assign var_431 = var_427;
	wire [0:0] var_436;
	assign var_436 = var_536[32:32];
	wire [2:0] var_443;
	assign var_443 = var_536[35:33];
	wire [2:0] var_447;
	assign var_447 = var_443;
	wire [0:0] var_449;
	assign var_449 = 1'd0;
	wire [0:0] var_526;
	assign var_526 = ~var_409;
	always @(posedge clk)
		if (executed && (var_449 && var_409))
			$display("%t\t[level_1]\t\tPush: %d", $time, var_413);
	always @(posedge clk)
		if (executed && ((var_449 && var_526) && var_436))
			$display("%t\t[level_1]\t\tPop: %d", $time, var_431);
	wire [0:0] var_474;
	assign var_474 = ~var_436;
	always @(posedge clk)
		if (executed && ((var_449 && var_526) && var_474))
			$display("%t\t[level_1]\t\tPop		Pop failed! The heap is empty.", $time);
	wire [32:0] var_482;
	assign var_482 = $signed(var_419) * 32'd2;
	wire [31:0] var_485;
	assign var_485 = var_482[31:0];
	wire [31:0] var_489;
	assign var_489 = var_485;
	wire [31:0] var_491;
	assign var_491 = $signed(var_489) + 32'd1;
	wire [34:0] var_866;
	assign var_866 = (3 == var_489 ? array_array_8bd31_q[139:105] : (2 == var_489 ? array_array_8bd31_q[104:70] : (1 == var_489 ? array_array_8bd31_q[69:35] : (0 == var_489 ? array_array_8bd31_q[34:0] : {35 {1'sbx}}))));
	wire [31:0] var_497;
	assign var_497 = var_866[31:0];
	wire [31:0] var_501;
	assign var_501 = var_497;
	wire [34:0] var_692;
	assign var_692 = (3 == var_491 ? array_array_8bd31_q[139:105] : (2 == var_491 ? array_array_8bd31_q[104:70] : (1 == var_491 ? array_array_8bd31_q[69:35] : (0 == var_491 ? array_array_8bd31_q[34:0] : {35 {1'sbx}}))));
	wire [31:0] var_506;
	assign var_506 = var_692[31:0];
	wire [31:0] var_510;
	assign var_510 = var_506;
	wire [0:0] var_515;
	assign var_515 = var_866[32:32];
	wire [0:0] var_522;
	assign var_522 = var_692[32:32];
	wire [1:0] var_530;
	assign var_530 = var_866[34:33];
	wire [1:0] var_534;
	assign var_534 = var_530;
	wire [1:0] var_539;
	assign var_539 = var_692[34:33];
	wire [1:0] var_543;
	assign var_543 = var_539;
	wire [32:0] var_545;
	assign var_545 = {var_409, var_413};
	wire [32:0] var_548;
	assign var_548 = {var_515, var_501};
	wire [32:0] var_551;
	assign var_551 = (var_409 ? var_545 : var_548);
	wire [32:0] var_555;
	assign var_555 = var_551 ^ 33'd4294967296;
	wire [32:0] var_558;
	assign var_558 = {var_436, var_431};
	wire [32:0] var_561;
	assign var_561 = {var_522, var_510};
	wire [32:0] var_564;
	assign var_564 = (var_409 ? var_558 : var_561);
	wire [32:0] var_568;
	assign var_568 = var_564 ^ 33'd4294967296;
	wire [0:0] var_694;
	assign var_694 = var_555 < var_568;
	wire [32:0] var_574;
	assign var_574 = (var_694 ? var_555 : var_568);
	wire [31:0] var_578;
	assign var_578 = var_574[31:0];
	wire [31:0] var_582;
	assign var_582 = var_578;
	wire [32:0] var_587;
	assign var_587 = (var_694 ? var_568 : var_555);
	wire [31:0] var_591;
	assign var_591 = var_587[31:0];
	wire [31:0] var_595;
	assign var_595 = var_591;
	wire [2:0] var_598;
	assign var_598 = $signed(var_447) - 3'd1;
	wire [2:0] var_601;
	assign var_601 = $signed(var_447) + 3'd1;
	wire [2:0] var_604;
	assign var_604 = (var_409 ? var_598 : var_601);
	wire [0:0] var_608;
	assign var_608 = var_409 | var_515;
	wire [0:0] var_611;
	assign var_611 = var_608 | var_522;
	wire [2:0] var_614;
	assign var_614 = (var_611 ? var_604 : var_447);
	wire [2:0] var_618;
	assign var_618 = (var_436 ? var_614 : var_447);
	wire [0:0] var_622;
	assign var_622 = (var_409 ? 1'd1 : 1'd0);
	wire [0:0] var_440;
	assign var_440 = var_515 | var_522;
	wire [0:0] var_631;
	assign var_631 = var_526 & var_440;
	wire [0:0] var_634;
	assign var_634 = (var_631 ? 1'd1 : var_622);
	wire [31:0] var_639;
	assign var_639 = {30'd0, var_543};
	wire [31:0] var_642;
	assign var_642 = var_639;
	wire [31:0] var_644;
	assign var_644 = {30'd0, var_534};
	wire [31:0] var_647;
	assign var_647 = var_644;
	wire [31:0] var_649;
	assign var_649 = (var_409 ? var_642 : var_501);
	wire [31:0] var_653;
	assign var_653 = (var_409 ? var_647 : var_510);
	wire [0:0] var_657;
	assign var_657 = $signed(var_649) < $signed(var_653);
	wire [31:0] var_660;
	assign var_660 = (var_657 ? var_489 : var_491);
	wire [0:0] var_664;
	assign var_664 = var_409 ^ var_515;
	wire [31:0] var_667;
	assign var_667 = (var_664 ? var_489 : var_491);
	wire [0:0] var_671;
	assign var_671 = var_515 ^ var_522;
	wire [31:0] var_674;
	assign var_674 = (var_671 ? var_667 : var_660);
	wire [0:0] var_678;
	assign var_678 = var_409 & var_436;
	wire [0:0] var_682;
	assign var_682 = $signed(var_447) > 3'd0;
	wire [0:0] var_685;
	assign var_685 = var_678 & var_682;
	wire [0:0] var_688;
	assign var_688 = (var_685 ? 1'd1 : 1'd0);
	wire [0:0] var_697;
	assign var_697 = var_526 & var_440;
	wire [0:0] var_700;
	assign var_700 = (var_697 ? 1'd1 : var_688);
	wire [3:0] var_704;
	assign var_704 = {var_618, var_634};
	wire [35:0] var_707;
	assign var_707 = {var_704, var_582};
	assign level_2_counter_delta = (executed ? {7'b0000000, |var_700} : 0);
	assign fifo_level_2_action_push_valid = executed && var_700;
	assign fifo_level_2_action_push_data = {var_700} & var_409;
	assign fifo_level_2_value_push_valid = executed && var_700;
	assign fifo_level_2_value_push_data = {32 {var_700}} & var_595;
	assign fifo_level_2_index_push_valid = executed && var_700;
	assign fifo_level_2_index_push_data = {32 {var_700}} & var_674;
	assign array_array_8bd1c_w = executed;
	assign array_array_8bd1c_d = var_707;
	assign array_array_8bd1c_widx = var_419;
	assign executed = counter_pop_valid && var_404;
	assign counter_pop_ready = executed;
	assign expose_executed = executed;
endmodule
module top (
	clk,
	rst_n
);
	input wire clk;
	input wire rst_n;
	reg [36:0] array_array_8bd0a_q;
	wire [36:0] array_array_8bd0a_driver_level_0_d;
	wire [0:0] array_array_8bd0a_driver_level_0_w;
	wire [0:0] array_array_8bd0a_driver_level_0_widx;
	wire [36:0] array_array_8bd0a_d;
	wire [0:0] array_array_8bd0a_widx;
	wire [0:0] array_array_8bd0a_w;
	assign array_array_8bd0a_d = {37 {array_array_8bd0a_driver_level_0_w}} & array_array_8bd0a_driver_level_0_d;
	assign array_array_8bd0a_widx = {array_array_8bd0a_driver_level_0_w} & array_array_8bd0a_driver_level_0_widx;
	assign array_array_8bd0a_w = array_array_8bd0a_driver_level_0_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n)
			array_array_8bd0a_q[36:0] <= 37'd51539607552;
		else if (array_array_8bd0a_w)
			case (array_array_8bd0a_widx)
				0: array_array_8bd0a_q[36:0] <= array_array_8bd0a_d;
				default:
					;
			endcase
	reg [71:0] array_array_8bd1c_q;
	wire [35:0] array_array_8bd1c_driver_level_1_d;
	wire [0:0] array_array_8bd1c_driver_level_1_w;
	wire [0:0] array_array_8bd1c_driver_level_1_widx;
	wire [35:0] array_array_8bd1c_d;
	wire [0:0] array_array_8bd1c_widx;
	wire [0:0] array_array_8bd1c_w;
	assign array_array_8bd1c_d = {36 {array_array_8bd1c_driver_level_1_w}} & array_array_8bd1c_driver_level_1_d;
	assign array_array_8bd1c_widx = {array_array_8bd1c_driver_level_1_w} & array_array_8bd1c_driver_level_1_widx;
	assign array_array_8bd1c_w = array_array_8bd1c_driver_level_1_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			array_array_8bd1c_q[35:0] <= 36'd17179869184;
			array_array_8bd1c_q[71:36] <= 36'd17179869184;
		end
		else if (array_array_8bd1c_w)
			case (array_array_8bd1c_widx)
				0: array_array_8bd1c_q[35:0] <= array_array_8bd1c_d;
				1: array_array_8bd1c_q[71:36] <= array_array_8bd1c_d;
				default:
					;
			endcase
	reg [139:0] array_array_8bd31_q;
	wire [34:0] array_array_8bd31_driver_level_2_d;
	wire [0:0] array_array_8bd31_driver_level_2_w;
	wire [1:0] array_array_8bd31_driver_level_2_widx;
	wire [34:0] array_array_8bd31_d;
	wire [1:0] array_array_8bd31_widx;
	wire [0:0] array_array_8bd31_w;
	assign array_array_8bd31_d = {35 {array_array_8bd31_driver_level_2_w}} & array_array_8bd31_driver_level_2_d;
	assign array_array_8bd31_widx = {2 {array_array_8bd31_driver_level_2_w}} & array_array_8bd31_driver_level_2_widx;
	assign array_array_8bd31_w = array_array_8bd31_driver_level_2_w;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			array_array_8bd31_q[34:0] <= 35'd0;
			array_array_8bd31_q[69:35] <= 35'd0;
			array_array_8bd31_q[104:70] <= 35'd0;
			array_array_8bd31_q[139:105] <= 35'd0;
		end
		else if (array_array_8bd31_w)
			case (array_array_8bd31_widx)
				0: array_array_8bd31_q[34:0] <= array_array_8bd31_d;
				1: array_array_8bd31_q[69:35] <= array_array_8bd31_d;
				2: array_array_8bd31_q[104:70] <= array_array_8bd31_d;
				3: array_array_8bd31_q[139:105] <= array_array_8bd31_d;
				default:
					;
			endcase
	wire [0:0] fifo_level_0_action_pop_data;
	wire [0:0] fifo_level_0_action_pop_valid;
	wire [0:0] fifo_level_0_action_pop_ready;
	wire [0:0] fifo_level_0_action_driver_heappush_8bd6a_push_data;
	wire [0:0] fifo_level_0_action_driver_heappush_8bd6a_push_valid;
	wire [0:0] fifo_level_0_action_driver_heappush_8bd6a_push_ready;
	wire [0:0] fifo_level_0_action_driver_heappop_60958_push_data;
	wire [0:0] fifo_level_0_action_driver_heappop_60958_push_valid;
	wire [0:0] fifo_level_0_action_driver_heappop_60958_push_ready;
	wire fifo_level_0_action_push_ready;
	assign fifo_level_0_action_driver_heappush_8bd6a_push_ready = fifo_level_0_action_push_ready;
	assign fifo_level_0_action_driver_heappop_60958_push_ready = fifo_level_0_action_push_ready;
	wire [0:0] fifo_level_0_action_push_valid;
	assign fifo_level_0_action_push_valid = fifo_level_0_action_driver_heappush_8bd6a_push_valid | fifo_level_0_action_driver_heappop_60958_push_valid;
	wire [0:0] fifo_level_0_action_push_data;
	assign fifo_level_0_action_push_data = ({fifo_level_0_action_driver_heappush_8bd6a_push_valid} & fifo_level_0_action_driver_heappush_8bd6a_push_data) | ({fifo_level_0_action_driver_heappop_60958_push_valid} & fifo_level_0_action_driver_heappop_60958_push_data);
	fifo #(
		.WIDTH(1),
		.DEPTH_LOG2(0)
	) fifo_level_0_action_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_0_action_push_valid),
		.push_data(fifo_level_0_action_push_data),
		.push_ready(fifo_level_0_action_push_ready),
		.pop_valid(fifo_level_0_action_pop_valid),
		.pop_data(fifo_level_0_action_pop_data),
		.pop_ready(fifo_level_0_action_pop_ready)
	);
	wire [31:0] fifo_level_0_index_pop_data;
	wire [0:0] fifo_level_0_index_pop_valid;
	wire [0:0] fifo_level_0_index_pop_ready;
	wire [31:0] fifo_level_0_index_driver_heappop_60958_push_data;
	wire [0:0] fifo_level_0_index_driver_heappop_60958_push_valid;
	wire [0:0] fifo_level_0_index_driver_heappop_60958_push_ready;
	wire [31:0] fifo_level_0_index_driver_heappush_8bd6a_push_data;
	wire [0:0] fifo_level_0_index_driver_heappush_8bd6a_push_valid;
	wire [0:0] fifo_level_0_index_driver_heappush_8bd6a_push_ready;
	wire fifo_level_0_index_push_ready;
	assign fifo_level_0_index_driver_heappop_60958_push_ready = fifo_level_0_index_push_ready;
	assign fifo_level_0_index_driver_heappush_8bd6a_push_ready = fifo_level_0_index_push_ready;
	wire [0:0] fifo_level_0_index_push_valid;
	assign fifo_level_0_index_push_valid = fifo_level_0_index_driver_heappop_60958_push_valid | fifo_level_0_index_driver_heappush_8bd6a_push_valid;
	wire [31:0] fifo_level_0_index_push_data;
	assign fifo_level_0_index_push_data = ({32 {fifo_level_0_index_driver_heappop_60958_push_valid}} & fifo_level_0_index_driver_heappop_60958_push_data) | ({32 {fifo_level_0_index_driver_heappush_8bd6a_push_valid}} & fifo_level_0_index_driver_heappush_8bd6a_push_data);
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(0)
	) fifo_level_0_index_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_0_index_push_valid),
		.push_data(fifo_level_0_index_push_data),
		.push_ready(fifo_level_0_index_push_ready),
		.pop_valid(fifo_level_0_index_pop_valid),
		.pop_data(fifo_level_0_index_pop_data),
		.pop_ready(fifo_level_0_index_pop_ready)
	);
	wire [31:0] fifo_level_0_value_pop_data;
	wire [0:0] fifo_level_0_value_pop_valid;
	wire [0:0] fifo_level_0_value_pop_ready;
	wire [31:0] fifo_level_0_value_driver_heappop_60958_push_data;
	wire [0:0] fifo_level_0_value_driver_heappop_60958_push_valid;
	wire [0:0] fifo_level_0_value_driver_heappop_60958_push_ready;
	wire [31:0] fifo_level_0_value_driver_heappush_8bd6a_push_data;
	wire [0:0] fifo_level_0_value_driver_heappush_8bd6a_push_valid;
	wire [0:0] fifo_level_0_value_driver_heappush_8bd6a_push_ready;
	wire fifo_level_0_value_push_ready;
	assign fifo_level_0_value_driver_heappop_60958_push_ready = fifo_level_0_value_push_ready;
	assign fifo_level_0_value_driver_heappush_8bd6a_push_ready = fifo_level_0_value_push_ready;
	wire [0:0] fifo_level_0_value_push_valid;
	assign fifo_level_0_value_push_valid = fifo_level_0_value_driver_heappop_60958_push_valid | fifo_level_0_value_driver_heappush_8bd6a_push_valid;
	wire [31:0] fifo_level_0_value_push_data;
	assign fifo_level_0_value_push_data = ({32 {fifo_level_0_value_driver_heappop_60958_push_valid}} & fifo_level_0_value_driver_heappop_60958_push_data) | ({32 {fifo_level_0_value_driver_heappush_8bd6a_push_valid}} & fifo_level_0_value_driver_heappush_8bd6a_push_data);
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(0)
	) fifo_level_0_value_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_0_value_push_valid),
		.push_data(fifo_level_0_value_push_data),
		.push_ready(fifo_level_0_value_push_ready),
		.pop_valid(fifo_level_0_value_pop_valid),
		.pop_data(fifo_level_0_value_pop_data),
		.pop_ready(fifo_level_0_value_pop_ready)
	);
	wire [31:0] fifo_heappush_8bd6a_push_value_pop_data;
	wire [0:0] fifo_heappush_8bd6a_push_value_pop_valid;
	wire [0:0] fifo_heappush_8bd6a_push_value_pop_ready;
	wire [31:0] fifo_heappush_8bd6a_push_value_driver_testbench_push_data;
	wire [0:0] fifo_heappush_8bd6a_push_value_driver_testbench_push_valid;
	wire [0:0] fifo_heappush_8bd6a_push_value_driver_testbench_push_ready;
	wire fifo_heappush_8bd6a_push_value_push_ready;
	assign fifo_heappush_8bd6a_push_value_driver_testbench_push_ready = fifo_heappush_8bd6a_push_value_push_ready;
	wire [0:0] fifo_heappush_8bd6a_push_value_push_valid;
	assign fifo_heappush_8bd6a_push_value_push_valid = fifo_heappush_8bd6a_push_value_driver_testbench_push_valid;
	wire [31:0] fifo_heappush_8bd6a_push_value_push_data;
	assign fifo_heappush_8bd6a_push_value_push_data = {32 {fifo_heappush_8bd6a_push_value_driver_testbench_push_valid}} & fifo_heappush_8bd6a_push_value_driver_testbench_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(2)
	) fifo_heappush_8bd6a_push_value_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_heappush_8bd6a_push_value_push_valid),
		.push_data(fifo_heappush_8bd6a_push_value_push_data),
		.push_ready(fifo_heappush_8bd6a_push_value_push_ready),
		.pop_valid(fifo_heappush_8bd6a_push_value_pop_valid),
		.pop_data(fifo_heappush_8bd6a_push_value_pop_data),
		.pop_ready(fifo_heappush_8bd6a_push_value_pop_ready)
	);
	wire [31:0] fifo_level_2_value_pop_data;
	wire [0:0] fifo_level_2_value_pop_valid;
	wire [0:0] fifo_level_2_value_pop_ready;
	wire [31:0] fifo_level_2_value_driver_level_1_push_data;
	wire [0:0] fifo_level_2_value_driver_level_1_push_valid;
	wire [0:0] fifo_level_2_value_driver_level_1_push_ready;
	wire fifo_level_2_value_push_ready;
	assign fifo_level_2_value_driver_level_1_push_ready = fifo_level_2_value_push_ready;
	wire [0:0] fifo_level_2_value_push_valid;
	assign fifo_level_2_value_push_valid = fifo_level_2_value_driver_level_1_push_valid;
	wire [31:0] fifo_level_2_value_push_data;
	assign fifo_level_2_value_push_data = {32 {fifo_level_2_value_driver_level_1_push_valid}} & fifo_level_2_value_driver_level_1_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(0)
	) fifo_level_2_value_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_2_value_push_valid),
		.push_data(fifo_level_2_value_push_data),
		.push_ready(fifo_level_2_value_push_ready),
		.pop_valid(fifo_level_2_value_pop_valid),
		.pop_data(fifo_level_2_value_pop_data),
		.pop_ready(fifo_level_2_value_pop_ready)
	);
	wire [0:0] fifo_level_2_action_pop_data;
	wire [0:0] fifo_level_2_action_pop_valid;
	wire [0:0] fifo_level_2_action_pop_ready;
	wire [0:0] fifo_level_2_action_driver_level_1_push_data;
	wire [0:0] fifo_level_2_action_driver_level_1_push_valid;
	wire [0:0] fifo_level_2_action_driver_level_1_push_ready;
	wire fifo_level_2_action_push_ready;
	assign fifo_level_2_action_driver_level_1_push_ready = fifo_level_2_action_push_ready;
	wire [0:0] fifo_level_2_action_push_valid;
	assign fifo_level_2_action_push_valid = fifo_level_2_action_driver_level_1_push_valid;
	wire [0:0] fifo_level_2_action_push_data;
	assign fifo_level_2_action_push_data = {fifo_level_2_action_driver_level_1_push_valid} & fifo_level_2_action_driver_level_1_push_data;
	fifo #(
		.WIDTH(1),
		.DEPTH_LOG2(0)
	) fifo_level_2_action_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_2_action_push_valid),
		.push_data(fifo_level_2_action_push_data),
		.push_ready(fifo_level_2_action_push_ready),
		.pop_valid(fifo_level_2_action_pop_valid),
		.pop_data(fifo_level_2_action_pop_data),
		.pop_ready(fifo_level_2_action_pop_ready)
	);
	wire [31:0] fifo_level_2_index_pop_data;
	wire [0:0] fifo_level_2_index_pop_valid;
	wire [0:0] fifo_level_2_index_pop_ready;
	wire [31:0] fifo_level_2_index_driver_level_1_push_data;
	wire [0:0] fifo_level_2_index_driver_level_1_push_valid;
	wire [0:0] fifo_level_2_index_driver_level_1_push_ready;
	wire fifo_level_2_index_push_ready;
	assign fifo_level_2_index_driver_level_1_push_ready = fifo_level_2_index_push_ready;
	wire [0:0] fifo_level_2_index_push_valid;
	assign fifo_level_2_index_push_valid = fifo_level_2_index_driver_level_1_push_valid;
	wire [31:0] fifo_level_2_index_push_data;
	assign fifo_level_2_index_push_data = {32 {fifo_level_2_index_driver_level_1_push_valid}} & fifo_level_2_index_driver_level_1_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(0)
	) fifo_level_2_index_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_2_index_push_valid),
		.push_data(fifo_level_2_index_push_data),
		.push_ready(fifo_level_2_index_push_ready),
		.pop_valid(fifo_level_2_index_pop_valid),
		.pop_data(fifo_level_2_index_pop_data),
		.pop_ready(fifo_level_2_index_pop_ready)
	);
	wire [0:0] fifo_level_1_action_pop_data;
	wire [0:0] fifo_level_1_action_pop_valid;
	wire [0:0] fifo_level_1_action_pop_ready;
	wire [0:0] fifo_level_1_action_driver_level_0_push_data;
	wire [0:0] fifo_level_1_action_driver_level_0_push_valid;
	wire [0:0] fifo_level_1_action_driver_level_0_push_ready;
	wire fifo_level_1_action_push_ready;
	assign fifo_level_1_action_driver_level_0_push_ready = fifo_level_1_action_push_ready;
	wire [0:0] fifo_level_1_action_push_valid;
	assign fifo_level_1_action_push_valid = fifo_level_1_action_driver_level_0_push_valid;
	wire [0:0] fifo_level_1_action_push_data;
	assign fifo_level_1_action_push_data = {fifo_level_1_action_driver_level_0_push_valid} & fifo_level_1_action_driver_level_0_push_data;
	fifo #(
		.WIDTH(1),
		.DEPTH_LOG2(0)
	) fifo_level_1_action_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_1_action_push_valid),
		.push_data(fifo_level_1_action_push_data),
		.push_ready(fifo_level_1_action_push_ready),
		.pop_valid(fifo_level_1_action_pop_valid),
		.pop_data(fifo_level_1_action_pop_data),
		.pop_ready(fifo_level_1_action_pop_ready)
	);
	wire [31:0] fifo_level_1_value_pop_data;
	wire [0:0] fifo_level_1_value_pop_valid;
	wire [0:0] fifo_level_1_value_pop_ready;
	wire [31:0] fifo_level_1_value_driver_level_0_push_data;
	wire [0:0] fifo_level_1_value_driver_level_0_push_valid;
	wire [0:0] fifo_level_1_value_driver_level_0_push_ready;
	wire fifo_level_1_value_push_ready;
	assign fifo_level_1_value_driver_level_0_push_ready = fifo_level_1_value_push_ready;
	wire [0:0] fifo_level_1_value_push_valid;
	assign fifo_level_1_value_push_valid = fifo_level_1_value_driver_level_0_push_valid;
	wire [31:0] fifo_level_1_value_push_data;
	assign fifo_level_1_value_push_data = {32 {fifo_level_1_value_driver_level_0_push_valid}} & fifo_level_1_value_driver_level_0_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(0)
	) fifo_level_1_value_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_1_value_push_valid),
		.push_data(fifo_level_1_value_push_data),
		.push_ready(fifo_level_1_value_push_ready),
		.pop_valid(fifo_level_1_value_pop_valid),
		.pop_data(fifo_level_1_value_pop_data),
		.pop_ready(fifo_level_1_value_pop_ready)
	);
	wire [31:0] fifo_level_1_index_pop_data;
	wire [0:0] fifo_level_1_index_pop_valid;
	wire [0:0] fifo_level_1_index_pop_ready;
	wire [31:0] fifo_level_1_index_driver_level_0_push_data;
	wire [0:0] fifo_level_1_index_driver_level_0_push_valid;
	wire [0:0] fifo_level_1_index_driver_level_0_push_ready;
	wire fifo_level_1_index_push_ready;
	assign fifo_level_1_index_driver_level_0_push_ready = fifo_level_1_index_push_ready;
	wire [0:0] fifo_level_1_index_push_valid;
	assign fifo_level_1_index_push_valid = fifo_level_1_index_driver_level_0_push_valid;
	wire [31:0] fifo_level_1_index_push_data;
	assign fifo_level_1_index_push_data = {32 {fifo_level_1_index_driver_level_0_push_valid}} & fifo_level_1_index_driver_level_0_push_data;
	fifo #(
		.WIDTH(32),
		.DEPTH_LOG2(0)
	) fifo_level_1_index_i(
		.clk(clk),
		.rst_n(rst_n),
		.push_valid(fifo_level_1_index_push_valid),
		.push_data(fifo_level_1_index_push_data),
		.push_ready(fifo_level_1_index_push_ready),
		.pop_valid(fifo_level_1_index_pop_valid),
		.pop_data(fifo_level_1_index_pop_data),
		.pop_ready(fifo_level_1_index_pop_ready)
	);
	wire [7:0] level_0_driver_heappop_60958_counter_delta;
	wire [0:0] level_0_driver_heappop_60958_counter_delta_ready;
	wire [7:0] level_0_driver_heappush_8bd6a_counter_delta;
	wire [0:0] level_0_driver_heappush_8bd6a_counter_delta_ready;
	wire [0:0] level_0_counter_delta_ready;
	wire [7:0] level_0_counter_delta;
	assign level_0_counter_delta = level_0_driver_heappop_60958_counter_delta + level_0_driver_heappush_8bd6a_counter_delta;
	wire [0:0] level_0_counter_pop_ready;
	assign level_0_driver_heappop_60958_counter_delta_ready = level_0_counter_pop_ready;
	assign level_0_driver_heappush_8bd6a_counter_delta_ready = level_0_counter_pop_ready;
	wire [0:0] level_0_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) level_0_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(level_0_counter_delta),
		.delta_ready(level_0_counter_delta_ready),
		.pop_valid(level_0_counter_pop_valid),
		.pop_ready(level_0_counter_pop_ready)
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
	wire [7:0] heappop_60958_driver_testbench_counter_delta;
	wire [0:0] heappop_60958_driver_testbench_counter_delta_ready;
	wire [0:0] heappop_60958_counter_delta_ready;
	wire [7:0] heappop_60958_counter_delta;
	assign heappop_60958_counter_delta = heappop_60958_driver_testbench_counter_delta;
	wire [0:0] heappop_60958_counter_pop_ready;
	assign heappop_60958_driver_testbench_counter_delta_ready = heappop_60958_counter_pop_ready;
	wire [0:0] heappop_60958_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) heappop_60958_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(heappop_60958_counter_delta),
		.delta_ready(heappop_60958_counter_delta_ready),
		.pop_valid(heappop_60958_counter_pop_valid),
		.pop_ready(heappop_60958_counter_pop_ready)
	);
	wire [7:0] heappush_8bd6a_driver_testbench_counter_delta;
	wire [0:0] heappush_8bd6a_driver_testbench_counter_delta_ready;
	wire [0:0] heappush_8bd6a_counter_delta_ready;
	wire [7:0] heappush_8bd6a_counter_delta;
	assign heappush_8bd6a_counter_delta = heappush_8bd6a_driver_testbench_counter_delta;
	wire [0:0] heappush_8bd6a_counter_pop_ready;
	assign heappush_8bd6a_driver_testbench_counter_delta_ready = heappush_8bd6a_counter_pop_ready;
	wire [0:0] heappush_8bd6a_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) heappush_8bd6a_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(heappush_8bd6a_counter_delta),
		.delta_ready(heappush_8bd6a_counter_delta_ready),
		.pop_valid(heappush_8bd6a_counter_pop_valid),
		.pop_ready(heappush_8bd6a_counter_pop_ready)
	);
	wire [7:0] level_2_driver_level_1_counter_delta;
	wire [0:0] level_2_driver_level_1_counter_delta_ready;
	wire [0:0] level_2_counter_delta_ready;
	wire [7:0] level_2_counter_delta;
	assign level_2_counter_delta = level_2_driver_level_1_counter_delta;
	wire [0:0] level_2_counter_pop_ready;
	assign level_2_driver_level_1_counter_delta_ready = level_2_counter_pop_ready;
	wire [0:0] level_2_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) level_2_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(level_2_counter_delta),
		.delta_ready(level_2_counter_delta_ready),
		.pop_valid(level_2_counter_pop_valid),
		.pop_ready(level_2_counter_pop_ready)
	);
	wire [7:0] level_1_driver_level_0_counter_delta;
	wire [0:0] level_1_driver_level_0_counter_delta_ready;
	wire [0:0] level_1_counter_delta_ready;
	wire [7:0] level_1_counter_delta;
	assign level_1_counter_delta = level_1_driver_level_0_counter_delta;
	wire [0:0] level_1_counter_pop_ready;
	assign level_1_driver_level_0_counter_delta_ready = level_1_counter_pop_ready;
	wire [0:0] level_1_counter_pop_valid;
	trigger_counter #(.WIDTH(8)) level_1_trigger_i(
		.clk(clk),
		.rst_n(rst_n),
		.delta(level_1_counter_delta),
		.delta_ready(level_1_counter_delta_ready),
		.pop_valid(level_1_counter_pop_valid),
		.pop_ready(level_1_counter_pop_ready)
	);
	assign testbench_counter_delta = 8'b00000001;
	wire [0:0] level_0_executed;
	level_0 level_0_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_action_pop_ready(fifo_level_0_action_pop_ready),
		.fifo_action_pop_data(fifo_level_0_action_pop_data),
		.fifo_action_pop_valid(fifo_level_0_action_pop_valid),
		.fifo_index_pop_ready(fifo_level_0_index_pop_ready),
		.fifo_index_pop_data(fifo_level_0_index_pop_data),
		.fifo_index_pop_valid(fifo_level_0_index_pop_valid),
		.fifo_value_pop_ready(fifo_level_0_value_pop_ready),
		.fifo_value_pop_data(fifo_level_0_value_pop_data),
		.fifo_value_pop_valid(fifo_level_0_value_pop_valid),
		.array_array_8bd1c_q(array_array_8bd1c_q),
		.fifo_level_1_value_push_valid(fifo_level_1_value_driver_level_0_push_valid),
		.fifo_level_1_value_push_data(fifo_level_1_value_driver_level_0_push_data),
		.fifo_level_1_value_push_ready(fifo_level_1_value_driver_level_0_push_ready),
		.fifo_level_1_action_push_valid(fifo_level_1_action_driver_level_0_push_valid),
		.fifo_level_1_action_push_data(fifo_level_1_action_driver_level_0_push_data),
		.fifo_level_1_action_push_ready(fifo_level_1_action_driver_level_0_push_ready),
		.fifo_level_1_index_push_valid(fifo_level_1_index_driver_level_0_push_valid),
		.fifo_level_1_index_push_data(fifo_level_1_index_driver_level_0_push_data),
		.fifo_level_1_index_push_ready(fifo_level_1_index_driver_level_0_push_ready),
		.level_1_counter_delta_ready(level_1_driver_level_0_counter_delta_ready),
		.level_1_counter_delta(level_1_driver_level_0_counter_delta),
		.array_array_8bd0a_q(array_array_8bd0a_q),
		.array_array_8bd0a_w(array_array_8bd0a_driver_level_0_w),
		.array_array_8bd0a_widx(array_array_8bd0a_driver_level_0_widx),
		.array_array_8bd0a_d(array_array_8bd0a_driver_level_0_d),
		.counter_delta_ready(level_0_counter_delta_ready),
		.counter_pop_ready(level_0_counter_pop_ready),
		.counter_pop_valid(level_0_counter_pop_valid),
		.expose_executed(level_0_executed)
	);
	wire [0:0] testbench_executed;
	testbench testbench_i(
		.clk(clk),
		.rst_n(rst_n),
		.heappush_8bd6a_counter_delta_ready(heappush_8bd6a_driver_testbench_counter_delta_ready),
		.heappush_8bd6a_counter_delta(heappush_8bd6a_driver_testbench_counter_delta),
		.fifo_heappush_8bd6a_push_value_push_valid(fifo_heappush_8bd6a_push_value_driver_testbench_push_valid),
		.fifo_heappush_8bd6a_push_value_push_data(fifo_heappush_8bd6a_push_value_driver_testbench_push_data),
		.fifo_heappush_8bd6a_push_value_push_ready(fifo_heappush_8bd6a_push_value_driver_testbench_push_ready),
		.heappop_60958_counter_delta_ready(heappop_60958_driver_testbench_counter_delta_ready),
		.heappop_60958_counter_delta(heappop_60958_driver_testbench_counter_delta),
		.counter_delta_ready(testbench_counter_delta_ready),
		.counter_pop_ready(testbench_counter_pop_ready),
		.counter_pop_valid(testbench_counter_pop_valid),
		.expose_executed(testbench_executed)
	);
	wire [0:0] heappop_60958_executed;
	heappop_60958 heappop_60958_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_level_0_value_push_valid(fifo_level_0_value_driver_heappop_60958_push_valid),
		.fifo_level_0_value_push_data(fifo_level_0_value_driver_heappop_60958_push_data),
		.fifo_level_0_value_push_ready(fifo_level_0_value_driver_heappop_60958_push_ready),
		.fifo_level_0_action_push_valid(fifo_level_0_action_driver_heappop_60958_push_valid),
		.fifo_level_0_action_push_data(fifo_level_0_action_driver_heappop_60958_push_data),
		.fifo_level_0_action_push_ready(fifo_level_0_action_driver_heappop_60958_push_ready),
		.level_0_counter_delta_ready(level_0_driver_heappop_60958_counter_delta_ready),
		.level_0_counter_delta(level_0_driver_heappop_60958_counter_delta),
		.fifo_level_0_index_push_valid(fifo_level_0_index_driver_heappop_60958_push_valid),
		.fifo_level_0_index_push_data(fifo_level_0_index_driver_heappop_60958_push_data),
		.fifo_level_0_index_push_ready(fifo_level_0_index_driver_heappop_60958_push_ready),
		.counter_delta_ready(heappop_60958_counter_delta_ready),
		.counter_pop_ready(heappop_60958_counter_pop_ready),
		.counter_pop_valid(heappop_60958_counter_pop_valid),
		.expose_executed(heappop_60958_executed)
	);
	wire [0:0] heappush_8bd6a_executed;
	heappush_8bd6a heappush_8bd6a_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_push_value_pop_ready(fifo_heappush_8bd6a_push_value_pop_ready),
		.fifo_push_value_pop_data(fifo_heappush_8bd6a_push_value_pop_data),
		.fifo_push_value_pop_valid(fifo_heappush_8bd6a_push_value_pop_valid),
		.fifo_level_0_index_push_valid(fifo_level_0_index_driver_heappush_8bd6a_push_valid),
		.fifo_level_0_index_push_data(fifo_level_0_index_driver_heappush_8bd6a_push_data),
		.fifo_level_0_index_push_ready(fifo_level_0_index_driver_heappush_8bd6a_push_ready),
		.level_0_counter_delta_ready(level_0_driver_heappush_8bd6a_counter_delta_ready),
		.level_0_counter_delta(level_0_driver_heappush_8bd6a_counter_delta),
		.fifo_level_0_action_push_valid(fifo_level_0_action_driver_heappush_8bd6a_push_valid),
		.fifo_level_0_action_push_data(fifo_level_0_action_driver_heappush_8bd6a_push_data),
		.fifo_level_0_action_push_ready(fifo_level_0_action_driver_heappush_8bd6a_push_ready),
		.fifo_level_0_value_push_valid(fifo_level_0_value_driver_heappush_8bd6a_push_valid),
		.fifo_level_0_value_push_data(fifo_level_0_value_driver_heappush_8bd6a_push_data),
		.fifo_level_0_value_push_ready(fifo_level_0_value_driver_heappush_8bd6a_push_ready),
		.counter_delta_ready(heappush_8bd6a_counter_delta_ready),
		.counter_pop_ready(heappush_8bd6a_counter_pop_ready),
		.counter_pop_valid(heappush_8bd6a_counter_pop_valid),
		.expose_executed(heappush_8bd6a_executed)
	);
	wire [0:0] level_2_executed;
	level_2 level_2_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_value_pop_ready(fifo_level_2_value_pop_ready),
		.fifo_value_pop_data(fifo_level_2_value_pop_data),
		.fifo_value_pop_valid(fifo_level_2_value_pop_valid),
		.fifo_action_pop_ready(fifo_level_2_action_pop_ready),
		.fifo_action_pop_data(fifo_level_2_action_pop_data),
		.fifo_action_pop_valid(fifo_level_2_action_pop_valid),
		.fifo_index_pop_ready(fifo_level_2_index_pop_ready),
		.fifo_index_pop_data(fifo_level_2_index_pop_data),
		.fifo_index_pop_valid(fifo_level_2_index_pop_valid),
		.array_array_8bd31_q(array_array_8bd31_q),
		.array_array_8bd31_w(array_array_8bd31_driver_level_2_w),
		.array_array_8bd31_widx(array_array_8bd31_driver_level_2_widx),
		.array_array_8bd31_d(array_array_8bd31_driver_level_2_d),
		.counter_delta_ready(level_2_counter_delta_ready),
		.counter_pop_ready(level_2_counter_pop_ready),
		.counter_pop_valid(level_2_counter_pop_valid),
		.expose_executed(level_2_executed)
	);
	wire [0:0] level_1_executed;
	level_1 level_1_i(
		.clk(clk),
		.rst_n(rst_n),
		.fifo_action_pop_ready(fifo_level_1_action_pop_ready),
		.fifo_action_pop_data(fifo_level_1_action_pop_data),
		.fifo_action_pop_valid(fifo_level_1_action_pop_valid),
		.fifo_value_pop_ready(fifo_level_1_value_pop_ready),
		.fifo_value_pop_data(fifo_level_1_value_pop_data),
		.fifo_value_pop_valid(fifo_level_1_value_pop_valid),
		.fifo_index_pop_ready(fifo_level_1_index_pop_ready),
		.fifo_index_pop_data(fifo_level_1_index_pop_data),
		.fifo_index_pop_valid(fifo_level_1_index_pop_valid),
		.array_array_8bd1c_q(array_array_8bd1c_q),
		.array_array_8bd1c_w(array_array_8bd1c_driver_level_1_w),
		.array_array_8bd1c_widx(array_array_8bd1c_driver_level_1_widx),
		.array_array_8bd1c_d(array_array_8bd1c_driver_level_1_d),
		.fifo_level_2_index_push_valid(fifo_level_2_index_driver_level_1_push_valid),
		.fifo_level_2_index_push_data(fifo_level_2_index_driver_level_1_push_data),
		.fifo_level_2_index_push_ready(fifo_level_2_index_driver_level_1_push_ready),
		.fifo_level_2_action_push_valid(fifo_level_2_action_driver_level_1_push_valid),
		.fifo_level_2_action_push_data(fifo_level_2_action_driver_level_1_push_data),
		.fifo_level_2_action_push_ready(fifo_level_2_action_driver_level_1_push_ready),
		.array_array_8bd31_q(array_array_8bd31_q),
		.fifo_level_2_value_push_valid(fifo_level_2_value_driver_level_1_push_valid),
		.fifo_level_2_value_push_data(fifo_level_2_value_driver_level_1_push_data),
		.fifo_level_2_value_push_ready(fifo_level_2_value_driver_level_1_push_ready),
		.level_2_counter_delta_ready(level_2_driver_level_1_counter_delta_ready),
		.level_2_counter_delta(level_2_driver_level_1_counter_delta),
		.counter_delta_ready(level_1_counter_delta_ready),
		.counter_pop_ready(level_1_counter_pop_ready),
		.counter_pop_valid(level_1_counter_pop_valid),
		.expose_executed(level_1_executed)
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
		.rst_n(rst_n)
	);
endmodule