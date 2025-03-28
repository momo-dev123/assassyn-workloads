
module testbench (
  input logic clk,
  input logic rst_n,
  // Module heappush_e4194
  output logic [7:0] heappush_e4194_counter_delta,
  input logic [0:0] heappush_e4194_counter_delta_ready,

  // Module heappop_e8579
  output logic [7:0] heappop_e8579_counter_delta,
  input logic [0:0] heappop_e8579_counter_delta_ready,

  // External FIFO heappush_e4194.push_value
  output logic [0:0] fifo_heappush_e4194_push_value_push_valid,
  output logic [31:0] fifo_heappush_e4194_push_value_push_data,
  input logic [0:0] fifo_heappush_e4194_push_value_push_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;

  int cycle_cnt;
  always_ff @(posedge clk or negedge rst_n) if (!rst_n) cycle_cnt <= 0;
  else if (executed) cycle_cnt <= cycle_cnt + 1;
  assign heappush_e4194_counter_delta = executed ? { 7'b0, |((cycle_cnt == 1)) } + { 7'b0, |((cycle_cnt == 5)) } + { 7'b0, |((cycle_cnt == 7)) } + { 7'b0, |((cycle_cnt == 9)) } + { 7'b0, |((cycle_cnt == 11)) } + { 7'b0, |((cycle_cnt == 13)) } + { 7'b0, |((cycle_cnt == 15)) } + { 7'b0, |((cycle_cnt == 19)) } + { 7'b0, |((cycle_cnt == 21)) } + { 7'b0, |((cycle_cnt == 25)) } + { 7'b0, |((cycle_cnt == 29)) } : 0;

  assign heappop_e8579_counter_delta = executed ? { 7'b0, |((cycle_cnt == 3)) } + { 7'b0, |((cycle_cnt == 17)) } + { 7'b0, |((cycle_cnt == 23)) } + { 7'b0, |((cycle_cnt == 27)) } : 0;

  // Gather FIFO pushes
  assign fifo_heappush_e4194_push_value_push_valid = (executed) && ((((cycle_cnt == 1))) || (((cycle_cnt == 5))) || (((cycle_cnt == 7))) || (((cycle_cnt == 9))) || (((cycle_cnt == 11))) || (((cycle_cnt == 13))) || (((cycle_cnt == 15))) || (((cycle_cnt == 19))) || (((cycle_cnt == 21))) || (((cycle_cnt == 25))) || (((cycle_cnt == 29))));
  assign fifo_heappush_e4194_push_value_push_data = ({ 32 { ((cycle_cnt == 1)) } } & 15) | ({ 32 { ((cycle_cnt == 5)) } } & 93) | ({ 32 { ((cycle_cnt == 7)) } } & 93) | ({ 32 { ((cycle_cnt == 9)) } } & 87) | ({ 32 { ((cycle_cnt == 11)) } } & 63) | ({ 32 { ((cycle_cnt == 13)) } } & 79) | ({ 32 { ((cycle_cnt == 15)) } } & 69) | ({ 32 { ((cycle_cnt == 19)) } } & 73) | ({ 32 { ((cycle_cnt == 21)) } } & 46) | ({ 32 { ((cycle_cnt == 25)) } } & 52) | ({ 32 { ((cycle_cnt == 29)) } } & 44);

  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // testbench


module level_0 (
  input logic clk,
  input logic rst_n,
  // Port FIFO index
  input logic [0:0] fifo_index_pop_valid,
  input logic [31:0] fifo_index_pop_data,
  output logic [0:0] fifo_index_pop_ready,
  // Port FIFO value
  input logic [0:0] fifo_value_pop_valid,
  input logic [31:0] fifo_value_pop_data,
  output logic [0:0] fifo_value_pop_ready,
  // Port FIFO action
  input logic [0:0] fifo_action_pop_valid,
  input logic [0:0] fifo_action_pop_data,
  output logic [0:0] fifo_action_pop_ready,
  // External FIFO level_1.value
  output logic [0:0] fifo_level_1_value_push_valid,
  output logic [31:0] fifo_level_1_value_push_data,
  input logic [0:0] fifo_level_1_value_push_ready,

  // Module level_1
  output logic [7:0] level_1_counter_delta,
  input logic [0:0] level_1_counter_delta_ready,

  // External FIFO level_1.action
  output logic [0:0] fifo_level_1_action_push_valid,
  output logic [0:0] fifo_level_1_action_push_data,
  input logic [0:0] fifo_level_1_action_push_ready,

  /* Array: array_e4146[2 x b36] */
  input logic [71:0] array_array_e4146_q,

  /* Array: array_e413a[1 x b37] */
  input logic [36:0] array_array_e413a_q,
  output logic [0:0] array_array_e413a_w,
  output logic [0:0] array_array_e413a_widx,
  output logic [36:0] array_array_e413a_d,

  // External FIFO level_1.index
  output logic [0:0] fifo_level_1_index_push_valid,
  output logic [31:0] fifo_level_1_index_push_data,
  input logic [0:0] fifo_level_1_index_push_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [0:0] var_47;
  assign var_47 = fifo_action_pop_valid;


  logic [0:0] var_49;
  assign var_49 = fifo_index_pop_valid;


  logic [0:0] var_51;
  assign var_51 = $signed(var_47) & $signed(var_49);


  logic [0:0] var_54;
  assign var_54 = fifo_value_pop_valid;


  logic [0:0] var_56;
  assign var_56 = var_51 & $signed(var_54);


  logic executed;
  logic [0:0] var_61;
  assign var_61 = fifo_action_pop_data;


  assign fifo_action_pop_ready = executed;
  logic [31:0] var_63;
  assign var_63 = fifo_index_pop_data;


  assign fifo_index_pop_ready = executed;
  logic [31:0] var_65;
  assign var_65 = fifo_value_pop_data;


  assign fifo_value_pop_ready = executed;
  logic [0:0] var_68;
  assign var_68 = var_63[0:0];


  logic [0:0] var_72;
  assign var_72 = var_68;


  logic [36:0] var_1179;
  assign var_1179 = 0 == var_72 ? array_array_e413a_q[36:0] : ('x);


  logic [31:0] var_81;
  assign var_81 = var_1179[31:0];


  logic [31:0] var_85;
  assign var_85 = var_81;


  logic [0:0] var_91;
  assign var_91 = var_1179[32:32];


  logic [3:0] var_100;
  assign var_100 = var_1179[36:33];


  logic [3:0] var_104;
  assign var_104 = var_100;


  logic [0:0] var_107;
  assign var_107 = 32'd0 == 32'd0;


  logic [0:0] var_245;
  assign var_245 = ~var_61;


  always_ff @(posedge clk) if (executed && (var_107 && var_61))$display("%t\t[level_0]\t\tPush: %d",



  $time

, var_65);

  always_ff @(posedge clk) if (executed && (var_107 && var_245 && var_91))$display("%t\t[level_0]\t\tPop: %d",



  $time

, var_85);

  logic [0:0] var_132;
  assign var_132 = ~var_91;


  always_ff @(posedge clk) if (executed && (var_107 && var_245 && var_132))$display("%t\t[level_0]\t\tPop		Pop failed! The heap is empty.",



  $time

);

  logic [32:0] var_141;
  assign var_141 = $signed(var_72) * 32'd2;


  logic [31:0] var_144;
  assign var_144 = var_141[31:0];


  logic [31:0] var_148;
  assign var_148 = var_144;


  logic [31:0] var_151;
  assign var_151 = $signed(var_148) + 32'd1;


  logic [35:0] var_196;
  assign var_196 = 1 == var_148 ? array_array_e4146_q[71:36] : (0 == var_148 ? array_array_e4146_q[35:0] : ('x));


  logic [31:0] var_157;
  assign var_157 = var_196[31:0];


  logic [31:0] var_161;
  assign var_161 = var_157;


  logic [35:0] var_356;
  assign var_356 = 1 == var_151 ? array_array_e4146_q[71:36] : (0 == var_151 ? array_array_e4146_q[35:0] : ('x));


  logic [31:0] var_166;
  assign var_166 = var_356[31:0];


  logic [31:0] var_170;
  assign var_170 = var_166;


  logic [0:0] var_175;
  assign var_175 = var_196[32:32];


  logic [0:0] var_182;
  assign var_182 = var_356[32:32];


  logic [2:0] var_190;
  assign var_190 = var_196[35:33];


  logic [2:0] var_194;
  assign var_194 = var_190;


  logic [2:0] var_199;
  assign var_199 = var_356[35:33];


  logic [2:0] var_203;
  assign var_203 = var_199;


  logic [32:0] var_205;
  assign var_205 = {var_61, var_65};


  logic [32:0] var_208;
  assign var_208 = {var_175, var_161};


  logic [32:0] var_211;
  assign var_211 = var_61 ? var_205 : var_208;


  logic [32:0] var_216;
  assign var_216 = var_211 ^ 33'd4294967296;


  logic [32:0] var_219;
  assign var_219 = {var_91, var_85};


  logic [32:0] var_222;
  assign var_222 = {var_182, var_170};


  logic [32:0] var_225;
  assign var_225 = var_61 ? var_219 : var_222;


  logic [32:0] var_229;
  assign var_229 = var_225 ^ 33'd4294967296;


  logic [0:0] var_186;
  assign var_186 = var_216 < var_229;


  logic [32:0] var_235;
  assign var_235 = var_186 ? var_216 : var_229;


  logic [31:0] var_239;
  assign var_239 = var_235[31:0];


  logic [31:0] var_243;
  assign var_243 = var_239;


  logic [32:0] var_248;
  assign var_248 = var_186 ? var_229 : var_216;


  logic [31:0] var_252;
  assign var_252 = var_248[31:0];


  logic [31:0] var_256;
  assign var_256 = var_252;


  logic [3:0] var_259;
  assign var_259 = $signed(var_104) - 4'd1;


  logic [3:0] var_262;
  assign var_262 = $signed(var_104) + 4'd1;


  logic [3:0] var_265;
  assign var_265 = var_61 ? var_259 : var_262;


  logic [0:0] var_269;
  assign var_269 = var_61 | var_175;


  logic [0:0] var_272;
  assign var_272 = var_269 | var_182;


  logic [3:0] var_275;
  assign var_275 = var_272 ? var_265 : var_104;


  logic [3:0] var_279;
  assign var_279 = var_91 ? var_275 : var_104;


  logic [0:0] var_284;
  assign var_284 = var_61 ? 1'd1 : 1'd0;


  logic [0:0] var_95;
  assign var_95 = var_175 | var_182;


  logic [0:0] var_293;
  assign var_293 = var_245 & var_95;


  logic [0:0] var_296;
  assign var_296 = var_293 ? 1'd1 : var_284;


  logic [31:0] var_301;
  assign var_301 = {29'd0, var_203};


  logic [31:0] var_304;
  assign var_304 = var_301;


  logic [31:0] var_306;
  assign var_306 = {29'd0, var_194};


  logic [31:0] var_309;
  assign var_309 = var_306;


  logic [31:0] var_311;
  assign var_311 = var_61 ? var_304 : var_161;


  logic [31:0] var_315;
  assign var_315 = var_61 ? var_309 : var_170;


  logic [0:0] var_319;
  assign var_319 = $signed(var_311) < $signed(var_315);


  logic [31:0] var_322;
  assign var_322 = var_319 ? var_148 : var_151;


  logic [0:0] var_326;
  assign var_326 = var_61 ^ var_175;


  logic [31:0] var_329;
  assign var_329 = var_326 ? var_148 : var_151;


  logic [0:0] var_333;
  assign var_333 = var_175 ^ var_182;


  logic [31:0] var_336;
  assign var_336 = var_333 ? var_329 : var_322;


  logic [0:0] var_340;
  assign var_340 = var_61 & var_91;


  logic [0:0] var_344;
  assign var_344 = $signed(var_104) > 4'd0;


  logic [0:0] var_347;
  assign var_347 = var_340 & var_344;


  logic [0:0] var_350;
  assign var_350 = var_347 ? 1'd1 : 1'd0;


  logic [0:0] var_359;
  assign var_359 = var_245 & var_95;


  logic [0:0] var_362;
  assign var_362 = var_359 ? 1'd1 : var_350;


  logic [4:0] var_366;
  assign var_366 = {var_279, var_296};


  logic [36:0] var_369;
  assign var_369 = {var_366, var_243};


  assign level_1_counter_delta = executed ? { 7'b0, |(var_362) } : 0;

  // Gather FIFO pushes
  assign fifo_level_1_value_push_valid = (executed) && (((var_362)));
  assign fifo_level_1_value_push_data = ({ 32 { (var_362) } } & var_256);

  assign fifo_level_1_action_push_valid = (executed) && (((var_362)));
  assign fifo_level_1_action_push_data = ({ 1 { (var_362) } } & var_61);

  assign fifo_level_1_index_push_valid = (executed) && (((var_362)));
  assign fifo_level_1_index_push_data = ({ 32 { (var_362) } } & var_336);

  // Gather Array writes
  assign array_array_e413a_w = executed;
    assign array_array_e413a_d = var_369;
    assign array_array_e413a_widx = var_72;

    assign executed = counter_pop_valid && (var_56);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // level_0


module heappop_e8579 (
  input logic clk,
  input logic rst_n,
  // External FIFO level_0.index
  output logic [0:0] fifo_level_0_index_push_valid,
  output logic [31:0] fifo_level_0_index_push_data,
  input logic [0:0] fifo_level_0_index_push_ready,

  // External FIFO level_0.action
  output logic [0:0] fifo_level_0_action_push_valid,
  output logic [0:0] fifo_level_0_action_push_data,
  input logic [0:0] fifo_level_0_action_push_ready,

  // Module level_0
  output logic [7:0] level_0_counter_delta,
  input logic [0:0] level_0_counter_delta_ready,

  // External FIFO level_0.value
  output logic [0:0] fifo_level_0_value_push_valid,
  output logic [31:0] fifo_level_0_value_push_data,
  input logic [0:0] fifo_level_0_value_push_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  assign level_0_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_level_0_action_push_valid = executed;
  assign fifo_level_0_action_push_data = 0;

  assign fifo_level_0_index_push_valid = executed;
  assign fifo_level_0_index_push_data = 0;

  assign fifo_level_0_value_push_valid = executed;
  assign fifo_level_0_value_push_data = 1;

  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // heappop_e8579


module level_1 (
  input logic clk,
  input logic rst_n,
  // Port FIFO value
  input logic [0:0] fifo_value_pop_valid,
  input logic [31:0] fifo_value_pop_data,
  output logic [0:0] fifo_value_pop_ready,
  // Port FIFO index
  input logic [0:0] fifo_index_pop_valid,
  input logic [31:0] fifo_index_pop_data,
  output logic [0:0] fifo_index_pop_ready,
  // Port FIFO action
  input logic [0:0] fifo_action_pop_valid,
  input logic [0:0] fifo_action_pop_data,
  output logic [0:0] fifo_action_pop_ready,
  /* Array: array_e415b[4 x b35] */
  input logic [139:0] array_array_e415b_q,

  /* Array: array_e4146[2 x b36] */
  input logic [71:0] array_array_e4146_q,
  output logic [0:0] array_array_e4146_w,
  output logic [0:0] array_array_e4146_widx,
  output logic [35:0] array_array_e4146_d,

  // External FIFO level_2.index
  output logic [0:0] fifo_level_2_index_push_valid,
  output logic [31:0] fifo_level_2_index_push_data,
  input logic [0:0] fifo_level_2_index_push_ready,

  // External FIFO level_2.value
  output logic [0:0] fifo_level_2_value_push_valid,
  output logic [31:0] fifo_level_2_value_push_data,
  input logic [0:0] fifo_level_2_value_push_ready,

  // Module level_2
  output logic [7:0] level_2_counter_delta,
  input logic [0:0] level_2_counter_delta_ready,

  // External FIFO level_2.action
  output logic [0:0] fifo_level_2_action_push_valid,
  output logic [0:0] fifo_level_2_action_push_data,
  input logic [0:0] fifo_level_2_action_push_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [0:0] var_395;
  assign var_395 = fifo_action_pop_valid;


  logic [0:0] var_397;
  assign var_397 = fifo_index_pop_valid;


  logic [0:0] var_399;
  assign var_399 = $signed(var_395) & $signed(var_397);


  logic [0:0] var_402;
  assign var_402 = fifo_value_pop_valid;


  logic [0:0] var_404;
  assign var_404 = var_399 & $signed(var_402);


  logic executed;
  logic [0:0] var_409;
  assign var_409 = fifo_action_pop_data;


  assign fifo_action_pop_ready = executed;
  logic [31:0] var_411;
  assign var_411 = fifo_index_pop_data;


  assign fifo_index_pop_ready = executed;
  logic [31:0] var_413;
  assign var_413 = fifo_value_pop_data;


  assign fifo_value_pop_ready = executed;
  logic [0:0] var_415;
  assign var_415 = var_411[0:0];


  logic [0:0] var_419;
  assign var_419 = var_415;


  logic [35:0] var_526;
  assign var_526 = 1 == var_419 ? array_array_e4146_q[71:36] : (0 == var_419 ? array_array_e4146_q[35:0] : ('x));


  logic [31:0] var_427;
  assign var_427 = var_526[31:0];


  logic [31:0] var_431;
  assign var_431 = var_427;


  logic [0:0] var_436;
  assign var_436 = var_526[32:32];


  logic [2:0] var_443;
  assign var_443 = var_526[35:33];


  logic [2:0] var_447;
  assign var_447 = var_443;


  logic [0:0] var_449;
  assign var_449 = 32'd1 == 32'd0;


  logic [0:0] var_440;
  assign var_440 = ~var_409;


  always_ff @(posedge clk) if (executed && (var_449 && var_409))$display("%t\t[level_1]\t\tPush: %d",



  $time

, var_413);

  always_ff @(posedge clk) if (executed && (var_449 && var_440 && var_436))$display("%t\t[level_1]\t\tPop: %d",



  $time

, var_431);

  logic [0:0] var_474;
  assign var_474 = ~var_436;


  always_ff @(posedge clk) if (executed && (var_449 && var_440 && var_474))$display("%t\t[level_1]\t\tPop		Pop failed! The heap is empty.",



  $time

);

  logic [32:0] var_482;
  assign var_482 = $signed(var_419) * 32'd2;


  logic [31:0] var_485;
  assign var_485 = var_482[31:0];


  logic [31:0] var_489;
  assign var_489 = var_485;


  logic [31:0] var_491;
  assign var_491 = $signed(var_489) + 32'd1;


  logic [34:0] var_354;
  assign var_354 = 3 == var_489 ? array_array_e415b_q[139:105] : (2 == var_489 ? array_array_e415b_q[104:70] : (1 == var_489 ? array_array_e415b_q[69:35] : (0 == var_489 ? array_array_e415b_q[34:0] : ('x))));


  logic [31:0] var_497;
  assign var_497 = var_354[31:0];


  logic [31:0] var_501;
  assign var_501 = var_497;


  logic [34:0] var_584;
  assign var_584 = 3 == var_491 ? array_array_e415b_q[139:105] : (2 == var_491 ? array_array_e415b_q[104:70] : (1 == var_491 ? array_array_e415b_q[69:35] : (0 == var_491 ? array_array_e415b_q[34:0] : ('x))));


  logic [31:0] var_506;
  assign var_506 = var_584[31:0];


  logic [31:0] var_510;
  assign var_510 = var_506;


  logic [0:0] var_515;
  assign var_515 = var_354[32:32];


  logic [0:0] var_522;
  assign var_522 = var_584[32:32];


  logic [1:0] var_530;
  assign var_530 = var_354[34:33];


  logic [1:0] var_534;
  assign var_534 = var_530;


  logic [1:0] var_539;
  assign var_539 = var_584[34:33];


  logic [1:0] var_543;
  assign var_543 = var_539;


  logic [32:0] var_545;
  assign var_545 = {var_409, var_413};


  logic [32:0] var_548;
  assign var_548 = {var_515, var_501};


  logic [32:0] var_551;
  assign var_551 = var_409 ? var_545 : var_548;


  logic [32:0] var_555;
  assign var_555 = var_551 ^ 33'd4294967296;


  logic [32:0] var_558;
  assign var_558 = {var_436, var_431};


  logic [32:0] var_561;
  assign var_561 = {var_522, var_510};


  logic [32:0] var_564;
  assign var_564 = var_409 ? var_558 : var_561;


  logic [32:0] var_568;
  assign var_568 = var_564 ^ 33'd4294967296;


  logic [0:0] var_692;
  assign var_692 = var_555 < var_568;


  logic [32:0] var_574;
  assign var_574 = var_692 ? var_555 : var_568;


  logic [31:0] var_578;
  assign var_578 = var_574[31:0];


  logic [31:0] var_582;
  assign var_582 = var_578;


  logic [32:0] var_587;
  assign var_587 = var_692 ? var_568 : var_555;


  logic [31:0] var_591;
  assign var_591 = var_587[31:0];


  logic [31:0] var_595;
  assign var_595 = var_591;


  logic [2:0] var_598;
  assign var_598 = $signed(var_447) - 3'd1;


  logic [2:0] var_601;
  assign var_601 = $signed(var_447) + 3'd1;


  logic [2:0] var_604;
  assign var_604 = var_409 ? var_598 : var_601;


  logic [0:0] var_608;
  assign var_608 = var_409 | var_515;


  logic [0:0] var_611;
  assign var_611 = var_608 | var_522;


  logic [2:0] var_614;
  assign var_614 = var_611 ? var_604 : var_447;


  logic [2:0] var_618;
  assign var_618 = var_436 ? var_614 : var_447;


  logic [0:0] var_622;
  assign var_622 = var_409 ? 1'd1 : 1'd0;


  logic [0:0] var_536;
  assign var_536 = var_515 | var_522;


  logic [0:0] var_631;
  assign var_631 = var_440 & var_536;


  logic [0:0] var_634;
  assign var_634 = var_631 ? 1'd1 : var_622;


  logic [31:0] var_639;
  assign var_639 = {30'd0, var_543};


  logic [31:0] var_642;
  assign var_642 = var_639;


  logic [31:0] var_644;
  assign var_644 = {30'd0, var_534};


  logic [31:0] var_647;
  assign var_647 = var_644;


  logic [31:0] var_649;
  assign var_649 = var_409 ? var_642 : var_501;


  logic [31:0] var_653;
  assign var_653 = var_409 ? var_647 : var_510;


  logic [0:0] var_657;
  assign var_657 = $signed(var_649) < $signed(var_653);


  logic [31:0] var_660;
  assign var_660 = var_657 ? var_489 : var_491;


  logic [0:0] var_664;
  assign var_664 = var_409 ^ var_515;


  logic [31:0] var_667;
  assign var_667 = var_664 ? var_489 : var_491;


  logic [0:0] var_671;
  assign var_671 = var_515 ^ var_522;


  logic [31:0] var_674;
  assign var_674 = var_671 ? var_667 : var_660;


  logic [0:0] var_678;
  assign var_678 = var_409 & var_436;


  logic [0:0] var_682;
  assign var_682 = $signed(var_447) > 3'd0;


  logic [0:0] var_685;
  assign var_685 = var_678 & var_682;


  logic [0:0] var_688;
  assign var_688 = var_685 ? 1'd1 : 1'd0;


  logic [0:0] var_697;
  assign var_697 = var_440 & var_536;


  logic [0:0] var_700;
  assign var_700 = var_697 ? 1'd1 : var_688;


  logic [3:0] var_704;
  assign var_704 = {var_618, var_634};


  logic [35:0] var_707;
  assign var_707 = {var_704, var_582};


  assign level_2_counter_delta = executed ? { 7'b0, |(var_700) } : 0;

  // Gather FIFO pushes
  assign fifo_level_2_action_push_valid = (executed) && (((var_700)));
  assign fifo_level_2_action_push_data = ({ 1 { (var_700) } } & var_409);

  assign fifo_level_2_index_push_valid = (executed) && (((var_700)));
  assign fifo_level_2_index_push_data = ({ 32 { (var_700) } } & var_674);

  assign fifo_level_2_value_push_valid = (executed) && (((var_700)));
  assign fifo_level_2_value_push_data = ({ 32 { (var_700) } } & var_595);

  // Gather Array writes
  assign array_array_e4146_w = executed;
    assign array_array_e4146_d = var_707;
    assign array_array_e4146_widx = var_419;

    assign executed = counter_pop_valid && (var_404);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // level_1


module level_2 (
  input logic clk,
  input logic rst_n,
  // Port FIFO action
  input logic [0:0] fifo_action_pop_valid,
  input logic [0:0] fifo_action_pop_data,
  output logic [0:0] fifo_action_pop_ready,
  // Port FIFO index
  input logic [0:0] fifo_index_pop_valid,
  input logic [31:0] fifo_index_pop_data,
  output logic [0:0] fifo_index_pop_ready,
  // Port FIFO value
  input logic [0:0] fifo_value_pop_valid,
  input logic [31:0] fifo_value_pop_data,
  output logic [0:0] fifo_value_pop_ready,
  /* Array: array_e415b[4 x b35] */
  input logic [139:0] array_array_e415b_q,
  output logic [0:0] array_array_e415b_w,
  output logic [1:0] array_array_e415b_widx,
  output logic [34:0] array_array_e415b_d,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [0:0] var_733;
  assign var_733 = fifo_action_pop_valid;


  logic [0:0] var_735;
  assign var_735 = fifo_index_pop_valid;


  logic [0:0] var_737;
  assign var_737 = $signed(var_733) & $signed(var_735);


  logic [0:0] var_740;
  assign var_740 = fifo_value_pop_valid;


  logic [0:0] var_742;
  assign var_742 = var_737 & $signed(var_740);


  logic executed;
  logic [0:0] var_747;
  assign var_747 = fifo_action_pop_data;


  assign fifo_action_pop_ready = executed;
  logic [31:0] var_749;
  assign var_749 = fifo_index_pop_data;


  assign fifo_index_pop_ready = executed;
  logic [31:0] var_751;
  assign var_751 = fifo_value_pop_data;


  assign fifo_value_pop_ready = executed;
  logic [1:0] var_753;
  assign var_753 = var_749[1:0];


  logic [1:0] var_757;
  assign var_757 = var_753;


  logic [34:0] var_964;
  assign var_964 = 3 == var_757 ? array_array_e415b_q[139:105] : (2 == var_757 ? array_array_e415b_q[104:70] : (1 == var_757 ? array_array_e415b_q[69:35] : (0 == var_757 ? array_array_e415b_q[34:0] : ('x))));


  logic [31:0] var_765;
  assign var_765 = var_964[31:0];


  logic [31:0] var_769;
  assign var_769 = var_765;


  logic [0:0] var_774;
  assign var_774 = var_964[32:32];


  logic [1:0] var_781;
  assign var_781 = var_964[34:33];


  logic [1:0] var_785;
  assign var_785 = var_781;


  logic [0:0] var_787;
  assign var_787 = 32'd2 == 32'd0;


  logic [0:0] var_925;
  assign var_925 = ~var_747;


  always_ff @(posedge clk) if (executed && (var_787 && var_747))$display("%t\t[level_2]\t\tPush: %d",



  $time

, var_751);

  always_ff @(posedge clk) if (executed && (var_787 && var_925 && var_774))$display("%t\t[level_2]\t\tPop: %d",



  $time

, var_769);

  logic [0:0] var_812;
  assign var_812 = ~var_774;


  always_ff @(posedge clk) if (executed && (var_787 && var_925 && var_812))$display("%t\t[level_2]\t\tPop		Pop failed! The heap is empty.",



  $time

);

  logic [33:0] var_820;
  assign var_820 = $signed(var_757) * 32'd2;


  logic [31:0] var_823;
  assign var_823 = var_820[31:0];


  logic [31:0] var_827;
  assign var_827 = var_823;


  logic [31:0] var_829;
  assign var_829 = $signed(var_827) + 32'd1;


  logic [32:0] var_832;
  assign var_832 = {var_747, var_751};


  logic [32:0] var_836;
  assign var_836 = var_747 ? var_832 : 33'd0;


  logic [32:0] var_840;
  assign var_840 = var_836 ^ 33'd4294967296;


  logic [32:0] var_843;
  assign var_843 = {var_774, var_769};


  logic [32:0] var_846;
  assign var_846 = var_747 ? var_843 : 33'd0;


  logic [32:0] var_850;
  assign var_850 = var_846 ^ 33'd4294967296;


  logic [0:0] var_966;
  assign var_966 = var_840 < var_850;


  logic [32:0] var_856;
  assign var_856 = var_966 ? var_840 : var_850;


  logic [31:0] var_860;
  assign var_860 = var_856[31:0];


  logic [31:0] var_864;
  assign var_864 = var_860;


  logic [32:0] var_869;
  assign var_869 = var_966 ? var_850 : var_840;


  logic [31:0] var_873;
  assign var_873 = var_869[31:0];


  logic [31:0] var_877;
  assign var_877 = var_873;


  logic [1:0] var_880;
  assign var_880 = $signed(var_785) - 2'd1;


  logic [1:0] var_883;
  assign var_883 = $signed(var_785) + 2'd1;


  logic [1:0] var_886;
  assign var_886 = var_747 ? var_880 : var_883;


  logic [0:0] var_891;
  assign var_891 = var_747 | 1'd0;


  logic [0:0] var_894;
  assign var_894 = var_891 | 1'd0;


  logic [1:0] var_897;
  assign var_897 = var_894 ? var_886 : var_785;


  logic [1:0] var_901;
  assign var_901 = var_774 ? var_897 : var_785;


  logic [0:0] var_905;
  assign var_905 = var_747 ? 1'd1 : 1'd0;


  logic [0:0] var_778;
  assign var_778 = 1'd0 | 1'd0;


  logic [0:0] var_914;
  assign var_914 = var_925 & var_778;


  logic [0:0] var_917;
  assign var_917 = var_914 ? 1'd1 : var_905;


  logic [31:0] var_694;
  assign var_694 = var_747 ? 32'd0 : 32'd0;


  logic [0:0] var_929;
  assign var_929 = $signed(var_694) < $signed(var_694);


  logic [31:0] var_932;
  assign var_932 = var_929 ? var_827 : var_829;


  logic [0:0] var_936;
  assign var_936 = var_747 ^ 1'd0;


  logic [31:0] var_939;
  assign var_939 = var_936 ? var_827 : var_829;


  logic [0:0] var_943;
  assign var_943 = 1'd0 ^ 1'd0;


  logic [31:0] var_946;
  assign var_946 = var_943 ? var_939 : var_932;


  logic [0:0] var_950;
  assign var_950 = var_747 & var_774;


  logic [0:0] var_954;
  assign var_954 = $signed(var_785) > 2'd0;


  logic [0:0] var_957;
  assign var_957 = var_950 & var_954;


  logic [0:0] var_960;
  assign var_960 = var_957 ? 1'd1 : 1'd0;


  logic [0:0] var_969;
  assign var_969 = var_925 & var_778;


  logic [0:0] var_972;
  assign var_972 = var_969 ? 1'd1 : var_960;


  logic [2:0] var_976;
  assign var_976 = {var_901, var_917};


  logic [34:0] var_979;
  assign var_979 = {var_976, var_864};


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_e415b_w = executed;
    assign array_array_e415b_d = var_979;
    assign array_array_e415b_widx = var_757;

    assign executed = counter_pop_valid && (var_742);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // level_2


module heappush_e4194 (
  input logic clk,
  input logic rst_n,
  // Port FIFO push_value
  input logic [0:0] fifo_push_value_pop_valid,
  input logic [31:0] fifo_push_value_pop_data,
  output logic [0:0] fifo_push_value_pop_ready,
  // External FIFO level_0.value
  output logic [0:0] fifo_level_0_value_push_valid,
  output logic [31:0] fifo_level_0_value_push_data,
  input logic [0:0] fifo_level_0_value_push_ready,

  // External FIFO level_0.index
  output logic [0:0] fifo_level_0_index_push_valid,
  output logic [31:0] fifo_level_0_index_push_data,
  input logic [0:0] fifo_level_0_index_push_ready,

  // External FIFO level_0.action
  output logic [0:0] fifo_level_0_action_push_valid,
  output logic [0:0] fifo_level_0_action_push_data,
  input logic [0:0] fifo_level_0_action_push_ready,

  // Module level_0
  output logic [7:0] level_0_counter_delta,
  input logic [0:0] level_0_counter_delta_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [0:0] var_986;
  assign var_986 = fifo_push_value_pop_valid;


  logic executed;
  logic [31:0] var_990;
  assign var_990 = fifo_push_value_pop_data;


  assign fifo_push_value_pop_ready = executed;
  assign level_0_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_level_0_action_push_valid = executed;
  assign fifo_level_0_action_push_data = 1;

  assign fifo_level_0_index_push_valid = executed;
  assign fifo_level_0_index_push_data = 0;

  assign fifo_level_0_value_push_valid = executed;
  assign fifo_level_0_value_push_data = var_990;

  // Gather Array writes
  assign executed = counter_pop_valid && (var_986);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // heappush_e4194

module top(

  input logic clk,
  input logic rst_n
);

  /* Array: array_e413a[1 x b37] */
  logic [36:0] array_array_e413a_q;
  logic [36:0] array_array_e413a_driver_level_0_d;
  logic [0:0] array_array_e413a_driver_level_0_w;
  logic [0:0] array_array_e413a_driver_level_0_widx;
  logic [36:0] array_array_e413a_d;
  logic [0:0] array_array_e413a_widx;
  logic [0:0] array_array_e413a_w;
  assign array_array_e413a_d = ({ 37 { array_array_e413a_driver_level_0_w } } & array_array_e413a_driver_level_0_d);
  assign array_array_e413a_widx = ({ 1 { array_array_e413a_driver_level_0_w } } & array_array_e413a_driver_level_0_widx);
  assign array_array_e413a_w = array_array_e413a_driver_level_0_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_e413a_q[36:0] <= 37'd51539607552;
    end
    else if (array_array_e413a_w) begin

      case (array_array_e413a_widx)
        0 : array_array_e413a_q[36:0] <= array_array_e413a_d;
        default: ;
      endcase
    end
  /* Array: array_e4146[2 x b36] */
  logic [71:0] array_array_e4146_q;
  logic [35:0] array_array_e4146_driver_level_1_d;
  logic [0:0] array_array_e4146_driver_level_1_w;
  logic [0:0] array_array_e4146_driver_level_1_widx;
  logic [35:0] array_array_e4146_d;
  logic [0:0] array_array_e4146_widx;
  logic [0:0] array_array_e4146_w;
  assign array_array_e4146_d = ({ 36 { array_array_e4146_driver_level_1_w } } & array_array_e4146_driver_level_1_d);
  assign array_array_e4146_widx = ({ 1 { array_array_e4146_driver_level_1_w } } & array_array_e4146_driver_level_1_widx);
  assign array_array_e4146_w = array_array_e4146_driver_level_1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_e4146_q[35:0] <= 36'd17179869184;
      array_array_e4146_q[71:36] <= 36'd17179869184;
    end
    else if (array_array_e4146_w) begin

      case (array_array_e4146_widx)
        0 : array_array_e4146_q[35:0] <= array_array_e4146_d;
        1 : array_array_e4146_q[71:36] <= array_array_e4146_d;
        default: ;
      endcase
    end
  /* Array: array_e415b[4 x b35] */
  logic [139:0] array_array_e415b_q;
  logic [34:0] array_array_e415b_driver_level_2_d;
  logic [0:0] array_array_e415b_driver_level_2_w;
  logic [1:0] array_array_e415b_driver_level_2_widx;
  logic [34:0] array_array_e415b_d;
  logic [1:0] array_array_e415b_widx;
  logic [0:0] array_array_e415b_w;
  assign array_array_e415b_d = ({ 35 { array_array_e415b_driver_level_2_w } } & array_array_e415b_driver_level_2_d);
  assign array_array_e415b_widx = ({ 2 { array_array_e415b_driver_level_2_w } } & array_array_e415b_driver_level_2_widx);
  assign array_array_e415b_w = array_array_e415b_driver_level_2_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_e415b_q[34:0] <= 35'd0;
      array_array_e415b_q[69:35] <= 35'd0;
      array_array_e415b_q[104:70] <= 35'd0;
      array_array_e415b_q[139:105] <= 35'd0;
    end
    else if (array_array_e415b_w) begin

      case (array_array_e415b_widx)
        0 : array_array_e415b_q[34:0] <= array_array_e415b_d;
        1 : array_array_e415b_q[69:35] <= array_array_e415b_d;
        2 : array_array_e415b_q[104:70] <= array_array_e415b_d;
        3 : array_array_e415b_q[139:105] <= array_array_e415b_d;
        default: ;
      endcase
    end
  // fifo: index: fifo<i32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_level_0_index_pop_data;
  logic [0:0] fifo_level_0_index_pop_valid;
  logic [0:0] fifo_level_0_index_pop_ready;
  logic [31:0] fifo_level_0_index_driver_heappush_e4194_push_data;
  logic [0:0] fifo_level_0_index_driver_heappush_e4194_push_valid;
  logic [0:0] fifo_level_0_index_driver_heappush_e4194_push_ready;
  logic [31:0] fifo_level_0_index_driver_heappop_e8579_push_data;
  logic [0:0] fifo_level_0_index_driver_heappop_e8579_push_valid;
  logic [0:0] fifo_level_0_index_driver_heappop_e8579_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_0_index_push_ready;
  assign fifo_level_0_index_driver_heappush_e4194_push_ready = fifo_level_0_index_push_ready;  assign fifo_level_0_index_driver_heappop_e8579_push_ready = fifo_level_0_index_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_0_index_push_valid;
  assign fifo_level_0_index_push_valid = fifo_level_0_index_driver_heappush_e4194_push_valid | fifo_level_0_index_driver_heappop_e8579_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_level_0_index_push_data;
  assign fifo_level_0_index_push_data = ({ 32 { fifo_level_0_index_driver_heappush_e4194_push_valid } } & fifo_level_0_index_driver_heappush_e4194_push_data) | ({ 32 { fifo_level_0_index_driver_heappop_e8579_push_valid } } & fifo_level_0_index_driver_heappop_e8579_push_data);

  fifo #(32, 0) fifo_level_0_index_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_0_index_push_valid),
    .push_data(fifo_level_0_index_push_data),
    .push_ready(fifo_level_0_index_push_ready),
    .pop_valid(fifo_level_0_index_pop_valid),
    .pop_data(fifo_level_0_index_pop_data),
    .pop_ready(fifo_level_0_index_pop_ready));

  // fifo: value: fifo<i32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_level_0_value_pop_data;
  logic [0:0] fifo_level_0_value_pop_valid;
  logic [0:0] fifo_level_0_value_pop_ready;
  logic [31:0] fifo_level_0_value_driver_heappop_e8579_push_data;
  logic [0:0] fifo_level_0_value_driver_heappop_e8579_push_valid;
  logic [0:0] fifo_level_0_value_driver_heappop_e8579_push_ready;
  logic [31:0] fifo_level_0_value_driver_heappush_e4194_push_data;
  logic [0:0] fifo_level_0_value_driver_heappush_e4194_push_valid;
  logic [0:0] fifo_level_0_value_driver_heappush_e4194_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_0_value_push_ready;
  assign fifo_level_0_value_driver_heappop_e8579_push_ready = fifo_level_0_value_push_ready;  assign fifo_level_0_value_driver_heappush_e4194_push_ready = fifo_level_0_value_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_0_value_push_valid;
  assign fifo_level_0_value_push_valid = fifo_level_0_value_driver_heappop_e8579_push_valid | fifo_level_0_value_driver_heappush_e4194_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_level_0_value_push_data;
  assign fifo_level_0_value_push_data = ({ 32 { fifo_level_0_value_driver_heappop_e8579_push_valid } } & fifo_level_0_value_driver_heappop_e8579_push_data) | ({ 32 { fifo_level_0_value_driver_heappush_e4194_push_valid } } & fifo_level_0_value_driver_heappush_e4194_push_data);

  fifo #(32, 0) fifo_level_0_value_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_0_value_push_valid),
    .push_data(fifo_level_0_value_push_data),
    .push_ready(fifo_level_0_value_push_ready),
    .pop_valid(fifo_level_0_value_pop_valid),
    .pop_data(fifo_level_0_value_pop_data),
    .pop_ready(fifo_level_0_value_pop_ready));

  // fifo: action: fifo<u1>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [0:0] fifo_level_0_action_pop_data;
  logic [0:0] fifo_level_0_action_pop_valid;
  logic [0:0] fifo_level_0_action_pop_ready;
  logic [0:0] fifo_level_0_action_driver_heappush_e4194_push_data;
  logic [0:0] fifo_level_0_action_driver_heappush_e4194_push_valid;
  logic [0:0] fifo_level_0_action_driver_heappush_e4194_push_ready;
  logic [0:0] fifo_level_0_action_driver_heappop_e8579_push_data;
  logic [0:0] fifo_level_0_action_driver_heappop_e8579_push_valid;
  logic [0:0] fifo_level_0_action_driver_heappop_e8579_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_0_action_push_ready;
  assign fifo_level_0_action_driver_heappush_e4194_push_ready = fifo_level_0_action_push_ready;  assign fifo_level_0_action_driver_heappop_e8579_push_ready = fifo_level_0_action_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_0_action_push_valid;
  assign fifo_level_0_action_push_valid = fifo_level_0_action_driver_heappush_e4194_push_valid | fifo_level_0_action_driver_heappop_e8579_push_valid;
  // 1-hot select the push data
  logic [0:0] fifo_level_0_action_push_data;
  assign fifo_level_0_action_push_data = ({ 1 { fifo_level_0_action_driver_heappush_e4194_push_valid } } & fifo_level_0_action_driver_heappush_e4194_push_data) | ({ 1 { fifo_level_0_action_driver_heappop_e8579_push_valid } } & fifo_level_0_action_driver_heappop_e8579_push_data);

  fifo #(1, 0) fifo_level_0_action_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_0_action_push_valid),
    .push_data(fifo_level_0_action_push_data),
    .push_ready(fifo_level_0_action_push_ready),
    .pop_valid(fifo_level_0_action_pop_valid),
    .pop_data(fifo_level_0_action_pop_data),
    .pop_ready(fifo_level_0_action_pop_ready));

  // fifo: value: fifo<i32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_level_1_value_pop_data;
  logic [0:0] fifo_level_1_value_pop_valid;
  logic [0:0] fifo_level_1_value_pop_ready;
  logic [31:0] fifo_level_1_value_driver_level_0_push_data;
  logic [0:0] fifo_level_1_value_driver_level_0_push_valid;
  logic [0:0] fifo_level_1_value_driver_level_0_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_1_value_push_ready;
  assign fifo_level_1_value_driver_level_0_push_ready = fifo_level_1_value_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_1_value_push_valid;
  assign fifo_level_1_value_push_valid = fifo_level_1_value_driver_level_0_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_level_1_value_push_data;
  assign fifo_level_1_value_push_data = ({ 32 { fifo_level_1_value_driver_level_0_push_valid } } & fifo_level_1_value_driver_level_0_push_data);

  fifo #(32, 0) fifo_level_1_value_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_1_value_push_valid),
    .push_data(fifo_level_1_value_push_data),
    .push_ready(fifo_level_1_value_push_ready),
    .pop_valid(fifo_level_1_value_pop_valid),
    .pop_data(fifo_level_1_value_pop_data),
    .pop_ready(fifo_level_1_value_pop_ready));

  // fifo: index: fifo<i32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_level_1_index_pop_data;
  logic [0:0] fifo_level_1_index_pop_valid;
  logic [0:0] fifo_level_1_index_pop_ready;
  logic [31:0] fifo_level_1_index_driver_level_0_push_data;
  logic [0:0] fifo_level_1_index_driver_level_0_push_valid;
  logic [0:0] fifo_level_1_index_driver_level_0_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_1_index_push_ready;
  assign fifo_level_1_index_driver_level_0_push_ready = fifo_level_1_index_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_1_index_push_valid;
  assign fifo_level_1_index_push_valid = fifo_level_1_index_driver_level_0_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_level_1_index_push_data;
  assign fifo_level_1_index_push_data = ({ 32 { fifo_level_1_index_driver_level_0_push_valid } } & fifo_level_1_index_driver_level_0_push_data);

  fifo #(32, 0) fifo_level_1_index_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_1_index_push_valid),
    .push_data(fifo_level_1_index_push_data),
    .push_ready(fifo_level_1_index_push_ready),
    .pop_valid(fifo_level_1_index_pop_valid),
    .pop_data(fifo_level_1_index_pop_data),
    .pop_ready(fifo_level_1_index_pop_ready));

  // fifo: action: fifo<u1>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [0:0] fifo_level_1_action_pop_data;
  logic [0:0] fifo_level_1_action_pop_valid;
  logic [0:0] fifo_level_1_action_pop_ready;
  logic [0:0] fifo_level_1_action_driver_level_0_push_data;
  logic [0:0] fifo_level_1_action_driver_level_0_push_valid;
  logic [0:0] fifo_level_1_action_driver_level_0_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_1_action_push_ready;
  assign fifo_level_1_action_driver_level_0_push_ready = fifo_level_1_action_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_1_action_push_valid;
  assign fifo_level_1_action_push_valid = fifo_level_1_action_driver_level_0_push_valid;
  // 1-hot select the push data
  logic [0:0] fifo_level_1_action_push_data;
  assign fifo_level_1_action_push_data = ({ 1 { fifo_level_1_action_driver_level_0_push_valid } } & fifo_level_1_action_driver_level_0_push_data);

  fifo #(1, 0) fifo_level_1_action_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_1_action_push_valid),
    .push_data(fifo_level_1_action_push_data),
    .push_ready(fifo_level_1_action_push_ready),
    .pop_valid(fifo_level_1_action_pop_valid),
    .pop_data(fifo_level_1_action_pop_data),
    .pop_ready(fifo_level_1_action_pop_ready));

  // fifo: action: fifo<u1>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [0:0] fifo_level_2_action_pop_data;
  logic [0:0] fifo_level_2_action_pop_valid;
  logic [0:0] fifo_level_2_action_pop_ready;
  logic [0:0] fifo_level_2_action_driver_level_1_push_data;
  logic [0:0] fifo_level_2_action_driver_level_1_push_valid;
  logic [0:0] fifo_level_2_action_driver_level_1_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_2_action_push_ready;
  assign fifo_level_2_action_driver_level_1_push_ready = fifo_level_2_action_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_2_action_push_valid;
  assign fifo_level_2_action_push_valid = fifo_level_2_action_driver_level_1_push_valid;
  // 1-hot select the push data
  logic [0:0] fifo_level_2_action_push_data;
  assign fifo_level_2_action_push_data = ({ 1 { fifo_level_2_action_driver_level_1_push_valid } } & fifo_level_2_action_driver_level_1_push_data);

  fifo #(1, 0) fifo_level_2_action_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_2_action_push_valid),
    .push_data(fifo_level_2_action_push_data),
    .push_ready(fifo_level_2_action_push_ready),
    .pop_valid(fifo_level_2_action_pop_valid),
    .pop_data(fifo_level_2_action_pop_data),
    .pop_ready(fifo_level_2_action_pop_ready));

  // fifo: index: fifo<i32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_level_2_index_pop_data;
  logic [0:0] fifo_level_2_index_pop_valid;
  logic [0:0] fifo_level_2_index_pop_ready;
  logic [31:0] fifo_level_2_index_driver_level_1_push_data;
  logic [0:0] fifo_level_2_index_driver_level_1_push_valid;
  logic [0:0] fifo_level_2_index_driver_level_1_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_2_index_push_ready;
  assign fifo_level_2_index_driver_level_1_push_ready = fifo_level_2_index_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_2_index_push_valid;
  assign fifo_level_2_index_push_valid = fifo_level_2_index_driver_level_1_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_level_2_index_push_data;
  assign fifo_level_2_index_push_data = ({ 32 { fifo_level_2_index_driver_level_1_push_valid } } & fifo_level_2_index_driver_level_1_push_data);

  fifo #(32, 0) fifo_level_2_index_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_2_index_push_valid),
    .push_data(fifo_level_2_index_push_data),
    .push_ready(fifo_level_2_index_push_ready),
    .pop_valid(fifo_level_2_index_pop_valid),
    .pop_data(fifo_level_2_index_pop_data),
    .pop_ready(fifo_level_2_index_pop_ready));

  // fifo: value: fifo<i32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_level_2_value_pop_data;
  logic [0:0] fifo_level_2_value_pop_valid;
  logic [0:0] fifo_level_2_value_pop_ready;
  logic [31:0] fifo_level_2_value_driver_level_1_push_data;
  logic [0:0] fifo_level_2_value_driver_level_1_push_valid;
  logic [0:0] fifo_level_2_value_driver_level_1_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_level_2_value_push_ready;
  assign fifo_level_2_value_driver_level_1_push_ready = fifo_level_2_value_push_ready;  // Gather all the push signal
  logic [0:0] fifo_level_2_value_push_valid;
  assign fifo_level_2_value_push_valid = fifo_level_2_value_driver_level_1_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_level_2_value_push_data;
  assign fifo_level_2_value_push_data = ({ 32 { fifo_level_2_value_driver_level_1_push_valid } } & fifo_level_2_value_driver_level_1_push_data);

  fifo #(32, 0) fifo_level_2_value_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_level_2_value_push_valid),
    .push_data(fifo_level_2_value_push_data),
    .push_ready(fifo_level_2_value_push_ready),
    .pop_valid(fifo_level_2_value_pop_valid),
    .pop_data(fifo_level_2_value_pop_data),
    .pop_ready(fifo_level_2_value_pop_ready));

  // fifo: push_value: fifo<i32>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_heappush_e4194_push_value_pop_data;
  logic [0:0] fifo_heappush_e4194_push_value_pop_valid;
  logic [0:0] fifo_heappush_e4194_push_value_pop_ready;
  logic [31:0] fifo_heappush_e4194_push_value_driver_testbench_push_data;
  logic [0:0] fifo_heappush_e4194_push_value_driver_testbench_push_valid;
  logic [0:0] fifo_heappush_e4194_push_value_driver_testbench_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_heappush_e4194_push_value_push_ready;
  assign fifo_heappush_e4194_push_value_driver_testbench_push_ready = fifo_heappush_e4194_push_value_push_ready;  // Gather all the push signal
  logic [0:0] fifo_heappush_e4194_push_value_push_valid;
  assign fifo_heappush_e4194_push_value_push_valid = fifo_heappush_e4194_push_value_driver_testbench_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_heappush_e4194_push_value_push_data;
  assign fifo_heappush_e4194_push_value_push_data = ({ 32 { fifo_heappush_e4194_push_value_driver_testbench_push_valid } } & fifo_heappush_e4194_push_value_driver_testbench_push_data);

  fifo #(32, 2) fifo_heappush_e4194_push_value_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_heappush_e4194_push_value_push_valid),
    .push_data(fifo_heappush_e4194_push_value_push_data),
    .push_ready(fifo_heappush_e4194_push_value_push_ready),
    .pop_valid(fifo_heappush_e4194_push_value_pop_valid),
    .pop_data(fifo_heappush_e4194_push_value_pop_data),
    .pop_ready(fifo_heappush_e4194_push_value_pop_ready));

  // Trigger SM of Module: testbench
  logic [0:0] testbench_counter_delta_ready;
  logic [7:0] testbench_counter_delta;
  // Gather all the push signal
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] testbench_counter_pop_ready;
  logic [0:0] testbench_counter_pop_valid;

  trigger_counter #(8) testbench_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(testbench_counter_delta),
    .delta_ready(testbench_counter_delta_ready),
    .pop_valid(testbench_counter_pop_valid),
    .pop_ready(testbench_counter_pop_ready));
  // Trigger SM of Module: level_0
  logic [7:0] level_0_driver_heappush_e4194_counter_delta;
  logic [0:0] level_0_driver_heappush_e4194_counter_delta_ready;
  logic [7:0] level_0_driver_heappop_e8579_counter_delta;
  logic [0:0] level_0_driver_heappop_e8579_counter_delta_ready;
  logic [0:0] level_0_counter_delta_ready;
  logic [7:0] level_0_counter_delta;
  // Gather all the push signal
  assign level_0_counter_delta = level_0_driver_heappush_e4194_counter_delta + level_0_driver_heappop_e8579_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] level_0_counter_pop_ready;
  assign level_0_driver_heappush_e4194_counter_delta_ready = level_0_counter_pop_ready;
  assign level_0_driver_heappop_e8579_counter_delta_ready = level_0_counter_pop_ready;
  logic [0:0] level_0_counter_pop_valid;

  trigger_counter #(8) level_0_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(level_0_counter_delta),
    .delta_ready(level_0_counter_delta_ready),
    .pop_valid(level_0_counter_pop_valid),
    .pop_ready(level_0_counter_pop_ready));
  // Trigger SM of Module: heappop_e8579
  logic [7:0] heappop_e8579_driver_testbench_counter_delta;
  logic [0:0] heappop_e8579_driver_testbench_counter_delta_ready;
  logic [0:0] heappop_e8579_counter_delta_ready;
  logic [7:0] heappop_e8579_counter_delta;
  // Gather all the push signal
  assign heappop_e8579_counter_delta = heappop_e8579_driver_testbench_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] heappop_e8579_counter_pop_ready;
  assign heappop_e8579_driver_testbench_counter_delta_ready = heappop_e8579_counter_pop_ready;
  logic [0:0] heappop_e8579_counter_pop_valid;

  trigger_counter #(8) heappop_e8579_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(heappop_e8579_counter_delta),
    .delta_ready(heappop_e8579_counter_delta_ready),
    .pop_valid(heappop_e8579_counter_pop_valid),
    .pop_ready(heappop_e8579_counter_pop_ready));
  // Trigger SM of Module: level_1
  logic [7:0] level_1_driver_level_0_counter_delta;
  logic [0:0] level_1_driver_level_0_counter_delta_ready;
  logic [0:0] level_1_counter_delta_ready;
  logic [7:0] level_1_counter_delta;
  // Gather all the push signal
  assign level_1_counter_delta = level_1_driver_level_0_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] level_1_counter_pop_ready;
  assign level_1_driver_level_0_counter_delta_ready = level_1_counter_pop_ready;
  logic [0:0] level_1_counter_pop_valid;

  trigger_counter #(8) level_1_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(level_1_counter_delta),
    .delta_ready(level_1_counter_delta_ready),
    .pop_valid(level_1_counter_pop_valid),
    .pop_ready(level_1_counter_pop_ready));
  // Trigger SM of Module: level_2
  logic [7:0] level_2_driver_level_1_counter_delta;
  logic [0:0] level_2_driver_level_1_counter_delta_ready;
  logic [0:0] level_2_counter_delta_ready;
  logic [7:0] level_2_counter_delta;
  // Gather all the push signal
  assign level_2_counter_delta = level_2_driver_level_1_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] level_2_counter_pop_ready;
  assign level_2_driver_level_1_counter_delta_ready = level_2_counter_pop_ready;
  logic [0:0] level_2_counter_pop_valid;

  trigger_counter #(8) level_2_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(level_2_counter_delta),
    .delta_ready(level_2_counter_delta_ready),
    .pop_valid(level_2_counter_pop_valid),
    .pop_ready(level_2_counter_pop_ready));
  // Trigger SM of Module: heappush_e4194
  logic [7:0] heappush_e4194_driver_testbench_counter_delta;
  logic [0:0] heappush_e4194_driver_testbench_counter_delta_ready;
  logic [0:0] heappush_e4194_counter_delta_ready;
  logic [7:0] heappush_e4194_counter_delta;
  // Gather all the push signal
  assign heappush_e4194_counter_delta = heappush_e4194_driver_testbench_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] heappush_e4194_counter_pop_ready;
  assign heappush_e4194_driver_testbench_counter_delta_ready = heappush_e4194_counter_pop_ready;
  logic [0:0] heappush_e4194_counter_pop_valid;

  trigger_counter #(8) heappush_e4194_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(heappush_e4194_counter_delta),
    .delta_ready(heappush_e4194_counter_delta_ready),
    .pop_valid(heappush_e4194_counter_pop_valid),
    .pop_ready(heappush_e4194_counter_pop_ready));
  assign testbench_counter_delta = 8'b1;

  logic [0:0] testbench_executed;

  // testbench
  testbench testbench_i (
    .clk(clk),
    .rst_n(rst_n),
    .heappush_e4194_counter_delta_ready(heappush_e4194_driver_testbench_counter_delta_ready),
    .heappush_e4194_counter_delta(heappush_e4194_driver_testbench_counter_delta),
    .heappop_e8579_counter_delta_ready(heappop_e8579_driver_testbench_counter_delta_ready),
    .heappop_e8579_counter_delta(heappop_e8579_driver_testbench_counter_delta),
    .fifo_heappush_e4194_push_value_push_valid(fifo_heappush_e4194_push_value_driver_testbench_push_valid),
    .fifo_heappush_e4194_push_value_push_data(fifo_heappush_e4194_push_value_driver_testbench_push_data),
    .fifo_heappush_e4194_push_value_push_ready(fifo_heappush_e4194_push_value_driver_testbench_push_ready),
    .counter_delta_ready(testbench_counter_delta_ready),
    .counter_pop_ready(testbench_counter_pop_ready),
    .counter_pop_valid(testbench_counter_pop_valid),
    .expose_executed(testbench_executed));
  logic [0:0] level_0_executed;

  // level_0
  level_0 level_0_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_index_pop_ready(fifo_level_0_index_pop_ready),
    .fifo_index_pop_data(fifo_level_0_index_pop_data),
    .fifo_index_pop_valid(fifo_level_0_index_pop_valid),
    .fifo_value_pop_ready(fifo_level_0_value_pop_ready),
    .fifo_value_pop_data(fifo_level_0_value_pop_data),
    .fifo_value_pop_valid(fifo_level_0_value_pop_valid),
    .fifo_action_pop_ready(fifo_level_0_action_pop_ready),
    .fifo_action_pop_data(fifo_level_0_action_pop_data),
    .fifo_action_pop_valid(fifo_level_0_action_pop_valid),
    .fifo_level_1_value_push_valid(fifo_level_1_value_driver_level_0_push_valid),
    .fifo_level_1_value_push_data(fifo_level_1_value_driver_level_0_push_data),
    .fifo_level_1_value_push_ready(fifo_level_1_value_driver_level_0_push_ready),
    .level_1_counter_delta_ready(level_1_driver_level_0_counter_delta_ready),
    .level_1_counter_delta(level_1_driver_level_0_counter_delta),
    .fifo_level_1_action_push_valid(fifo_level_1_action_driver_level_0_push_valid),
    .fifo_level_1_action_push_data(fifo_level_1_action_driver_level_0_push_data),
    .fifo_level_1_action_push_ready(fifo_level_1_action_driver_level_0_push_ready),
    .array_array_e4146_q(array_array_e4146_q),
    .array_array_e413a_q(array_array_e413a_q),
    .array_array_e413a_w(array_array_e413a_driver_level_0_w),
    .array_array_e413a_widx(array_array_e413a_driver_level_0_widx),
    .array_array_e413a_d(array_array_e413a_driver_level_0_d),
    .fifo_level_1_index_push_valid(fifo_level_1_index_driver_level_0_push_valid),
    .fifo_level_1_index_push_data(fifo_level_1_index_driver_level_0_push_data),
    .fifo_level_1_index_push_ready(fifo_level_1_index_driver_level_0_push_ready),
    .counter_delta_ready(level_0_counter_delta_ready),
    .counter_pop_ready(level_0_counter_pop_ready),
    .counter_pop_valid(level_0_counter_pop_valid),
    .expose_executed(level_0_executed));
  logic [0:0] heappop_e8579_executed;

  // heappop_e8579
  heappop_e8579 heappop_e8579_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_level_0_index_push_valid(fifo_level_0_index_driver_heappop_e8579_push_valid),
    .fifo_level_0_index_push_data(fifo_level_0_index_driver_heappop_e8579_push_data),
    .fifo_level_0_index_push_ready(fifo_level_0_index_driver_heappop_e8579_push_ready),
    .fifo_level_0_action_push_valid(fifo_level_0_action_driver_heappop_e8579_push_valid),
    .fifo_level_0_action_push_data(fifo_level_0_action_driver_heappop_e8579_push_data),
    .fifo_level_0_action_push_ready(fifo_level_0_action_driver_heappop_e8579_push_ready),
    .level_0_counter_delta_ready(level_0_driver_heappop_e8579_counter_delta_ready),
    .level_0_counter_delta(level_0_driver_heappop_e8579_counter_delta),
    .fifo_level_0_value_push_valid(fifo_level_0_value_driver_heappop_e8579_push_valid),
    .fifo_level_0_value_push_data(fifo_level_0_value_driver_heappop_e8579_push_data),
    .fifo_level_0_value_push_ready(fifo_level_0_value_driver_heappop_e8579_push_ready),
    .counter_delta_ready(heappop_e8579_counter_delta_ready),
    .counter_pop_ready(heappop_e8579_counter_pop_ready),
    .counter_pop_valid(heappop_e8579_counter_pop_valid),
    .expose_executed(heappop_e8579_executed));
  logic [0:0] level_1_executed;

  // level_1
  level_1 level_1_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_value_pop_ready(fifo_level_1_value_pop_ready),
    .fifo_value_pop_data(fifo_level_1_value_pop_data),
    .fifo_value_pop_valid(fifo_level_1_value_pop_valid),
    .fifo_index_pop_ready(fifo_level_1_index_pop_ready),
    .fifo_index_pop_data(fifo_level_1_index_pop_data),
    .fifo_index_pop_valid(fifo_level_1_index_pop_valid),
    .fifo_action_pop_ready(fifo_level_1_action_pop_ready),
    .fifo_action_pop_data(fifo_level_1_action_pop_data),
    .fifo_action_pop_valid(fifo_level_1_action_pop_valid),
    .array_array_e415b_q(array_array_e415b_q),
    .array_array_e4146_q(array_array_e4146_q),
    .array_array_e4146_w(array_array_e4146_driver_level_1_w),
    .array_array_e4146_widx(array_array_e4146_driver_level_1_widx),
    .array_array_e4146_d(array_array_e4146_driver_level_1_d),
    .fifo_level_2_index_push_valid(fifo_level_2_index_driver_level_1_push_valid),
    .fifo_level_2_index_push_data(fifo_level_2_index_driver_level_1_push_data),
    .fifo_level_2_index_push_ready(fifo_level_2_index_driver_level_1_push_ready),
    .fifo_level_2_value_push_valid(fifo_level_2_value_driver_level_1_push_valid),
    .fifo_level_2_value_push_data(fifo_level_2_value_driver_level_1_push_data),
    .fifo_level_2_value_push_ready(fifo_level_2_value_driver_level_1_push_ready),
    .level_2_counter_delta_ready(level_2_driver_level_1_counter_delta_ready),
    .level_2_counter_delta(level_2_driver_level_1_counter_delta),
    .fifo_level_2_action_push_valid(fifo_level_2_action_driver_level_1_push_valid),
    .fifo_level_2_action_push_data(fifo_level_2_action_driver_level_1_push_data),
    .fifo_level_2_action_push_ready(fifo_level_2_action_driver_level_1_push_ready),
    .counter_delta_ready(level_1_counter_delta_ready),
    .counter_pop_ready(level_1_counter_pop_ready),
    .counter_pop_valid(level_1_counter_pop_valid),
    .expose_executed(level_1_executed));
  logic [0:0] level_2_executed;

  // level_2
  level_2 level_2_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_action_pop_ready(fifo_level_2_action_pop_ready),
    .fifo_action_pop_data(fifo_level_2_action_pop_data),
    .fifo_action_pop_valid(fifo_level_2_action_pop_valid),
    .fifo_index_pop_ready(fifo_level_2_index_pop_ready),
    .fifo_index_pop_data(fifo_level_2_index_pop_data),
    .fifo_index_pop_valid(fifo_level_2_index_pop_valid),
    .fifo_value_pop_ready(fifo_level_2_value_pop_ready),
    .fifo_value_pop_data(fifo_level_2_value_pop_data),
    .fifo_value_pop_valid(fifo_level_2_value_pop_valid),
    .array_array_e415b_q(array_array_e415b_q),
    .array_array_e415b_w(array_array_e415b_driver_level_2_w),
    .array_array_e415b_widx(array_array_e415b_driver_level_2_widx),
    .array_array_e415b_d(array_array_e415b_driver_level_2_d),
    .counter_delta_ready(level_2_counter_delta_ready),
    .counter_pop_ready(level_2_counter_pop_ready),
    .counter_pop_valid(level_2_counter_pop_valid),
    .expose_executed(level_2_executed));
  logic [0:0] heappush_e4194_executed;

  // heappush_e4194
  heappush_e4194 heappush_e4194_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_push_value_pop_ready(fifo_heappush_e4194_push_value_pop_ready),
    .fifo_push_value_pop_data(fifo_heappush_e4194_push_value_pop_data),
    .fifo_push_value_pop_valid(fifo_heappush_e4194_push_value_pop_valid),
    .fifo_level_0_value_push_valid(fifo_level_0_value_driver_heappush_e4194_push_valid),
    .fifo_level_0_value_push_data(fifo_level_0_value_driver_heappush_e4194_push_data),
    .fifo_level_0_value_push_ready(fifo_level_0_value_driver_heappush_e4194_push_ready),
    .fifo_level_0_index_push_valid(fifo_level_0_index_driver_heappush_e4194_push_valid),
    .fifo_level_0_index_push_data(fifo_level_0_index_driver_heappush_e4194_push_data),
    .fifo_level_0_index_push_ready(fifo_level_0_index_driver_heappush_e4194_push_ready),
    .fifo_level_0_action_push_valid(fifo_level_0_action_driver_heappush_e4194_push_valid),
    .fifo_level_0_action_push_data(fifo_level_0_action_driver_heappush_e4194_push_data),
    .fifo_level_0_action_push_ready(fifo_level_0_action_driver_heappush_e4194_push_ready),
    .level_0_counter_delta_ready(level_0_driver_heappush_e4194_counter_delta_ready),
    .level_0_counter_delta(level_0_driver_heappush_e4194_counter_delta),
    .counter_delta_ready(heappush_e4194_counter_delta_ready),
    .counter_pop_ready(heappush_e4194_counter_pop_ready),
    .counter_pop_valid(heappush_e4194_counter_pop_valid),
    .expose_executed(heappush_e4194_executed));
endmodule // top

module fifo #(
    parameter WIDTH = 8,
    parameter DEPTH_LOG2 = 2 // Special case when DEPTH_LOG2 = 0, single element FIFO
    // parameter NAME = "fifo" // TODO(@were): Open this later
) (
    input  logic               clk,
    input  logic               rst_n,

    input  logic               push_valid,
    input  logic [WIDTH - 1:0] push_data,
    output logic               push_ready,

    output logic               pop_valid,
    output logic [WIDTH - 1:0] pop_data,
    input  logic               pop_ready
);

generate
    if (DEPTH_LOG2 == 0) begin : single_element_fifo
        // Single element FIFO for DEPTH_LOG2 = 0

        logic fifo_full; 

        assign push_ready = ~fifo_full || (fifo_full && pop_ready); 
        assign pop_valid  = fifo_full;                              

        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                fifo_full <= 1'b0;
                pop_data <= 'x;
            end else begin
                
                if (push_valid && pop_ready) begin
                    pop_data <= push_data; 
                    fifo_full <= 1'b1;     
                end
                
                else if (push_valid && ~fifo_full) begin
                    pop_data <= push_data; 
                    fifo_full <= 1'b1;     
                end
                
                else if (pop_ready && fifo_full) begin
                    fifo_full <= 1'b0;     
                    pop_data <= 'x;        
                end
            end
        end

    end else begin : multi_element_fifo
        // Multi-element FIFO for DEPTH_LOG2 > 0

        
        
        

        logic [(DEPTH_LOG2 != 0 ? DEPTH_LOG2 - 1 : 0):0] front;
        logic [(DEPTH_LOG2 != 0 ? DEPTH_LOG2 - 1 : 0):0] back;
        logic [(DEPTH_LOG2 + 1):0] count;
        logic [WIDTH - 1:0] q[0:(1 << DEPTH_LOG2)-1];

        logic [(DEPTH_LOG2 + 1):0] new_count;
        logic [(DEPTH_LOG2 != 0 ? DEPTH_LOG2 - 1 : 0):0] new_front;
        logic temp_pop_valid;

        // The number of elements in the queue after this cycle.
        assign new_count = count + (push_valid ? 1 : 0) - (pop_ready ? 1 : 0);

        // The new front of the queue after this cycle.
        assign new_front = front + (pop_ready && count != 0 ? 1 : 0);

        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                front <= 0;
                back <= 0;
                pop_valid <= 1'b0;
                pop_data <= 'x;
                count <= 0;
                push_ready <= 1'b1;
            end else begin

                if (push_valid && new_count <= (1 << DEPTH_LOG2)) begin
                    q[back] <= push_data;
                    back <= (back + 1);
                end

                front <= new_front;
                count <= new_count;

                push_ready <= new_count < (1 << DEPTH_LOG2);

                temp_pop_valid = new_count != 0 || push_valid;
                pop_valid <= temp_pop_valid;
    // This is the most tricky part of the code:
    // If new_count is 0, we have noting to pop, so we just give pop_valid a 0,
    // and pop_data a 'x. Otherwise, we have to pop something real from the FIFO.
    // Because the array write uses a non-blocking "<=" operator, the result
    // of array write will not be visible until the next cycle. However, we
    // need this result when new_front == back. This indicates the newly
    // pushed data is also the front of the FIFO. Instead of reading it from
    // the array buffer, we directly forward the push_data to pop_data.
                pop_data <= temp_pop_valid ? (new_front == back && push_valid ? push_data : q[new_front]) : 'x;

            end
        end

        
        
        
    end
endgenerate

endmodule


// The purpose of a FIFO is different from the purpose of a counter.
// A FIFO can only be pushed or popped once per cycle, while a counter
// can increase multiple event counters in a single cycle.
//
// This is tyically useful for an arbiter, where an arbiter can have multiple
// instances pushed to it in a single same cycle, but it can only pop one
// instance per cycle.
module trigger_counter #(
    parameter WIDTH = 8
    // parameter NAME = "fifo" // TODO(@were): Open this later
) (
  input logic clk,
  input logic rst_n,

  input  logic [WIDTH-1:0] delta,
  output logic             delta_ready,

  input  logic             pop_ready,
  output logic             pop_valid
);

logic [WIDTH-1:0] count;
logic [WIDTH-1:0] temp;
logic [WIDTH-1:0] new_count;

// If pop_ready is high, counter -= 1
assign temp = count + delta;
// To avoid overflow minus
assign new_count = temp >= (pop_ready ? 1 : 0) ? temp - (pop_ready ? 1 : 0) : 0;

always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    count <= '0;
  end else begin
    // If the counter is gonna overflow, this counter cannot accept any new
    // deltas.
    delta_ready <= new_count != {WIDTH{1'b1}};
    // Assign the new counter value.
    count <= new_count;
    pop_valid <= (new_count != 0 || delta != 0);
  end
end

endmodule

module tb;

logic clk;
logic rst_n;

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #10100;
  


end

always #50 clk <= !clk;



top top_i (
  .clk(clk),
  .rst_n(rst_n)
);

endmodule
