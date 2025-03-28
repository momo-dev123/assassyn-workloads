////////////////////////////////////////////////////////////////
// Start of: /home/ubuntu/fft.sv


module calculate_loop_92b65 (
  input logic clk,
  input logic rst_n,
  // Port FIFO In_full_flag
  input logic [0:0] fifo_In_full_flag_pop_valid,
  input logic [0:0] fifo_In_full_flag_pop_data,
  output logic [0:0] fifo_In_full_flag_pop_ready,
  /* Array: array_92b5c[1 x b4] */
  input logic [3:0] array_array_92b5c_q,
  output logic [0:0] array_array_92b5c_w,
  output logic [0:0] array_array_92b5c_widx,
  output logic [3:0] array_array_92b5c_d,

  /* Array: array_92b62[1 x u32] */
  input logic [31:0] array_array_92b62_q,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [0:0] var_37;
  assign var_37 = fifo_In_full_flag_pop_valid;


  logic executed;
  logic [0:0] var_41;
  assign var_41 = fifo_In_full_flag_pop_data;


  assign fifo_In_full_flag_pop_ready = executed;
  logic [3:0] var_901;
  assign var_901 = array_array_92b5c_q[3:0];


  logic [0:0] var_48;
  assign var_48 = var_901 < 4'd10;


  logic [3:0] var_54;
  assign var_54 = var_901;


  logic [3:0] var_57;
  assign var_57 = var_54 + 4'd1;


  logic [3:0] var_60;
  assign var_60 = var_57;


  logic [3:0] var_62;
  assign var_62 = var_48 ? var_60 : 4'd0;


  logic [0:0] var_70;
  assign var_70 = var_901 == 4'd8;


  logic [31:0] var_73;
  assign var_73 = array_array_92b62_q[31:0];


  logic [31:0] var_76;
  assign var_76 = var_73;


  logic [0:0] var_78;
  assign var_78 = var_76 == 32'd0;


  logic [0:0] var_81;
  assign var_81 = var_70 & var_78;


  logic [3:0] var_84;
  assign var_84 = var_81 ? 4'd10 : var_62;


  logic [3:0] var_88;
  assign var_88 = var_84;


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_92b5c_w = executed;
    assign array_array_92b5c_d = var_88;
    assign array_array_92b5c_widx = 1'd0;

    assign executed = counter_pop_valid && (var_37);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // calculate_loop_92b65


module SRAM_683b0 (
  input logic clk,
  input logic rst_n,


  /* Array: array_683e6[4096 x b64] */
  /* /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/fft/data/fft_data.data */


  // External FIFO memuser_92bfe.rdata
  output logic [0:0] fifo_memuser_92bfe_rdata_push_valid,
  output logic [63:0] fifo_memuser_92bfe_rdata_push_data,
  input logic [0:0] fifo_memuser_92bfe_rdata_push_ready,


  // Declare upstream executed signals
  input logic [0:0] external_loop_66c6b_executed,
  input logic [0:0] var_227,
  input logic [0:0] var_227_valid,
  input logic [63:0] var_801,
  input logic [0:0] var_801_valid,
  input logic [0:0] var_201,
  input logic [0:0] var_201_valid,
  input logic [11:0] var_748,
  input logic [0:0] var_748_valid,
  output logic expose_executed);

  logic executed;
  logic [63:0] dataout;
  logic [63:0] var_894;
  assign var_894 = dataout;
  // Gather FIFO pushes
  assign fifo_memuser_92bfe_rdata_push_valid = (executed) && (((var_201)));
  assign fifo_memuser_92bfe_rdata_push_data = ({ 64 { (var_201) } } & var_894);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_683e6_w;
  logic [63:0] array_array_683e6_d;
  logic [11:0] array_array_683e6_widx;
  assign array_array_683e6_w = (executed) && (((var_227)));
  assign array_array_683e6_d = ({ 64 { (var_227) } } & var_801);
  assign array_array_683e6_widx = var_748;


  memory_blackbox_array_683e6 #(
        .DATA_WIDTH(64),   
        .ADDR_WIDTH(12)     
    ) memory_blackbox_array_683e6(
    .clk     (clk), 
    .address (array_array_683e6_widx), 
    .wd      (array_array_683e6_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_683e6_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = external_loop_66c6b_executed;
  assign expose_executed = executed;
endmodule // SRAM_683b0




(* blackbox *)

module memory_blackbox_array_683e6 #(
    parameter DATA_WIDTH = 64,   
    parameter ADDR_WIDTH = 12 
)(
    input clk,
    input [ADDR_WIDTH-1:0] address,        
    input [DATA_WIDTH-1:0] wd,             
    input banksel,                         
    input read,                            
    input write,                           
    output reg [DATA_WIDTH-1:0] dataout,   
    input rst_n                            
);

    localparam DEPTH = 1 << ADDR_WIDTH;
    reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];

    initial begin

      end
        always @ (posedge clk) begin
            if (write & banksel) begin
                mem[address] <= wd;
            end
        end
    
        assign dataout = (read & banksel) ? mem[address] : {DATA_WIDTH{1'b0}};
    
    endmodule
              
module memuser_92bfe (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [63:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_92b50[1 x b64] */
  input logic [63:0] array_array_92b50_q,
  output logic [0:0] array_array_92b50_w,
  output logic [0:0] array_array_92b50_widx,
  output logic [63:0] array_array_92b50_d,

  /* Array: array_92b56[1 x b64] */
  input logic [63:0] array_array_92b56_q,
  output logic [0:0] array_array_92b56_w,
  output logic [0:0] array_array_92b56_widx,
  output logic [63:0] array_array_92b56_d,

  /* Array: array_92b5c[1 x b4] */
  input logic [3:0] array_array_92b5c_q,

  /* Array: array_92b47[1 x b64] */
  input logic [63:0] array_array_92b47_q,
  output logic [0:0] array_array_92b47_w,
  output logic [0:0] array_array_92b47_widx,
  output logic [63:0] array_array_92b47_d,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [0:0] var_94;
  assign var_94 = fifo_rdata_pop_valid;


  logic executed;
  logic [63:0] var_98;
  assign var_98 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [3:0] var_163;
  assign var_163 = array_array_92b5c_q[3:0];


  logic [0:0] var_104;
  assign var_104 = var_163 == 4'd2;


  logic [63:0] var_169;
  assign var_169 = var_98;


  logic [63:0] var_66;
  assign var_66 = array_array_92b47_q[63:0];


  logic [63:0] var_112;
  assign var_112 = var_104 ? var_169 : var_66;


  logic [0:0] var_124;
  assign var_124 = var_163 == 4'd3;


  logic [63:0] var_160;
  assign var_160 = array_array_92b50_q[63:0];


  logic [63:0] var_132;
  assign var_132 = var_124 ? var_169 : var_160;


  logic [0:0] var_144;
  assign var_144 = var_163 == 4'd9;


  logic [63:0] var_166;
  assign var_166 = array_array_92b56_q[63:0];


  logic [63:0] var_152;
  assign var_152 = var_144 ? var_169 : var_166;


  always_ff @(posedge clk) if (executed)$display("%t\t[memuser_92bfe]\t\t        state: %d | even_reg: %d | odd_reg: %d | twid_reg: %d",



  $time

, var_163, var_66, var_160, var_166);

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_92b47_w = executed;
    assign array_array_92b47_d = var_112;
    assign array_array_92b47_widx = 1'd0;

    assign array_array_92b50_w = executed;
    assign array_array_92b50_d = var_132;
    assign array_array_92b50_widx = 1'd0;

    assign array_array_92b56_w = executed;
    assign array_array_92b56_d = var_152;
    assign array_array_92b56_widx = 1'd0;

    assign executed = counter_pop_valid && (var_94);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // memuser_92bfe


module loop_user_68877 (
  input logic clk,
  input logic rst_n,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  // Gather FIFO pushes
  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // loop_user_68877


module driver (
  input logic clk,
  input logic rst_n,
  // Module external_loop_66c6b
  output logic [7:0] external_loop_66c6b_counter_delta,
  input logic [0:0] external_loop_66c6b_counter_delta_ready,

  // Module loop_user_68877
  output logic [7:0] loop_user_68877_counter_delta,
  input logic [0:0] loop_user_68877_counter_delta_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  assign loop_user_68877_counter_delta = executed ? 1 : 0;

  assign external_loop_66c6b_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver


module external_loop_66c6b (
  input logic clk,
  input logic rst_n,
  /* Array: array_66ce9[1 x b64] */
  input logic [63:0] array_array_66ce9_q,
  output logic [0:0] array_array_66ce9_w,
  output logic [0:0] array_array_66ce9_widx,
  output logic [63:0] array_array_66ce9_d,

  // Module memuser_92bfe
  output logic [7:0] memuser_92bfe_counter_delta,
  input logic [0:0] memuser_92bfe_counter_delta_ready,

  // External FIFO calculate_loop_92b65.In_full_flag
  output logic [0:0] fifo_calculate_loop_92b65_In_full_flag_push_valid,
  output logic [0:0] fifo_calculate_loop_92b65_In_full_flag_push_data,
  input logic [0:0] fifo_calculate_loop_92b65_In_full_flag_push_ready,

  /* Array: array_66cd1[1 x u32] */
  input logic [31:0] array_array_66cd1_q,
  output logic [0:0] array_array_66cd1_w,
  output logic [0:0] array_array_66cd1_widx,
  output logic [31:0] array_array_66cd1_d,

  /* Array: array_66cc8[1 x u32] */
  input logic [31:0] array_array_66cc8_q,
  output logic [0:0] array_array_66cc8_w,
  output logic [0:0] array_array_66cc8_widx,
  output logic [31:0] array_array_66cc8_d,

  /* Array: array_92b5c[1 x b4] */
  input logic [3:0] array_array_92b5c_q,

  /* Array: array_92bf5[1 x b64] */
  input logic [63:0] array_array_92bf5_q,
  output logic [0:0] array_array_92bf5_w,
  output logic [0:0] array_array_92bf5_widx,
  output logic [63:0] array_array_92bf5_d,

  /* Array: array_92b47[1 x b64] */
  input logic [63:0] array_array_92b47_q,

  /* Array: array_66cd7[1 x u32] */
  input logic [31:0] array_array_66cd7_q,
  output logic [0:0] array_array_66cd7_w,
  output logic [0:0] array_array_66cd7_widx,
  output logic [31:0] array_array_66cd7_d,

  /* Array: array_92b50[1 x b64] */
  input logic [63:0] array_array_92b50_q,

  // Module calculate_loop_92b65
  output logic [7:0] calculate_loop_92b65_counter_delta,
  input logic [0:0] calculate_loop_92b65_counter_delta_ready,


  /* Array: array_66cbf[1 x u32] */
  input logic [31:0] array_array_66cbf_q,
  output logic [0:0] array_array_66cbf_w,
  output logic [0:0] array_array_66cbf_widx,
  output logic [31:0] array_array_66cbf_d,

  /* Array: array_92b56[1 x b64] */
  input logic [63:0] array_array_92b56_q,

  /* Array: array_92b62[1 x u32] */
  input logic [31:0] array_array_92b62_q,
  output logic [0:0] array_array_92b62_w,
  output logic [0:0] array_array_92b62_widx,
  output logic [31:0] array_array_92b62_d,

  /* Array: array_66ce3[1 x b64] */
  input logic [63:0] array_array_66ce3_q,
  output logic [0:0] array_array_66ce3_w,
  output logic [0:0] array_array_66ce3_widx,
  output logic [63:0] array_array_66ce3_d,

  /* Array: array_66cdd[1 x b64] */
  input logic [63:0] array_array_66cdd_q,
  output logic [0:0] array_array_66cdd_w,
  output logic [0:0] array_array_66cdd_widx,
  output logic [63:0] array_array_66cdd_d,

  output logic [0:0] expose_var_201,
  output logic [0:0] expose_var_201_valid,
  output logic [11:0] expose_var_748,
  output logic [0:0] expose_var_748_valid,
  output logic [63:0] expose_var_801,
  output logic [0:0] expose_var_801_valid,
  output logic [0:0] expose_var_227,
  output logic [0:0] expose_var_227_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [3:0] var_836;
  assign var_836 = array_array_92b5c_q[3:0];


  logic [0:0] var_183;
  assign var_183 = var_836 == 4'd1;


  logic [0:0] var_189;
  assign var_189 = var_836 == 4'd2;


  logic [0:0] var_192;
  assign var_192 = var_183 | var_189;


  logic [0:0] var_198;
  assign var_198 = var_836 == 4'd8;


  logic [0:0] var_201;
  assign var_201 = var_192 | var_198;
  assign expose_var_201 = var_201;
  assign expose_var_201_valid = executed && 1;


  logic [0:0] var_208;
  assign var_208 = var_836 == 4'd5;


  logic [0:0] var_215;
  assign var_215 = var_836 == 4'd6;


  logic [0:0] var_218;
  assign var_218 = var_208 | var_215;


  logic [0:0] var_224;
  assign var_224 = var_836 == 4'd10;


  logic [0:0] var_227;
  assign var_227 = var_218 | var_224;
  assign expose_var_227 = var_227;
  assign expose_var_227_valid = executed && 1;


  logic [0:0] var_233;
  assign var_233 = var_836 == 4'd0;


  logic [31:0] var_519;
  assign var_519 = array_array_66cbf_q[31:0];


  logic [31:0] var_823;
  assign var_823 = array_array_66cc8_q[31:0];


  logic [31:0] var_242;
  assign var_242 = var_823;


  logic [31:0] var_247;
  assign var_247 = var_519;


  logic [31:0] var_249;
  assign var_249 = var_242 | var_247;


  logic [31:0] var_252;
  assign var_252 = var_249;


  logic [31:0] var_258;
  assign var_258 = var_252;


  logic [31:0] var_263;
  assign var_263 = var_519;


  logic [31:0] var_265;
  assign var_265 = var_258 ^ var_263;


  logic [31:0] var_268;
  assign var_268 = var_265;


  logic [0:0] var_278;
  assign var_278 = var_836 == 4'd4;


  logic [63:0] var_147;
  assign var_147 = array_array_92b47_q[63:0];


  logic [63:0] var_856;
  assign var_856 = array_array_92b50_q[63:0];


  logic [31:0] var_289;
  assign var_289 = var_147[63:32];


  logic [31:0] var_293;
  assign var_293 = var_289;


  logic [31:0] var_298;
  assign var_298 = var_856[63:32];


  logic [31:0] var_302;
  assign var_302 = var_298;


  logic [31:0] var_304;
  assign var_304 = $signed(var_293) + $signed(var_302);


  logic [31:0] var_307;
  assign var_307 = var_304;


  logic [31:0] var_312;
  assign var_312 = var_147[63:32];


  logic [31:0] var_316;
  assign var_316 = var_312;


  logic [31:0] var_321;
  assign var_321 = var_856[63:32];


  logic [31:0] var_325;
  assign var_325 = var_321;


  logic [31:0] var_327;
  assign var_327 = $signed(var_316) - $signed(var_325);


  logic [31:0] var_330;
  assign var_330 = var_327;


  logic [31:0] var_336;
  assign var_336 = var_147[31:0];


  logic [31:0] var_340;
  assign var_340 = var_336;


  logic [31:0] var_345;
  assign var_345 = var_856[31:0];


  logic [31:0] var_349;
  assign var_349 = var_345;


  logic [31:0] var_351;
  assign var_351 = $signed(var_340) + $signed(var_349);


  logic [31:0] var_354;
  assign var_354 = var_351;


  logic [31:0] var_359;
  assign var_359 = var_147[31:0];


  logic [31:0] var_363;
  assign var_363 = var_359;


  logic [31:0] var_368;
  assign var_368 = var_856[31:0];


  logic [31:0] var_372;
  assign var_372 = var_368;


  logic [31:0] var_374;
  assign var_374 = $signed(var_363) - $signed(var_372);


  logic [31:0] var_377;
  assign var_377 = var_374;


  logic [31:0] var_379;
  assign var_379 = var_307;


  logic [31:0] var_381;
  assign var_381 = var_354;


  logic [63:0] var_383;
  assign var_383 = {var_379, var_381};


  logic [63:0] var_386;
  assign var_386 = var_383;


  logic [31:0] var_392;
  assign var_392 = var_330;


  logic [31:0] var_394;
  assign var_394 = var_377;


  logic [63:0] var_396;
  assign var_396 = {var_392, var_394};


  logic [63:0] var_399;
  assign var_399 = var_396;


  logic [0:0] var_409;
  assign var_409 = var_836 == 4'd7;


  logic [31:0] var_845;
  assign var_845 = array_array_66cd7_q[31:0];


  logic [31:0] var_814;
  assign var_814 = array_array_66cd1_q[31:0];


  logic [31:0] var_418;
  assign var_418 = var_845;


  logic [31:0] var_423;
  assign var_423 = var_814;


  logic [31:0] var_425;
  assign var_425 = var_418 << var_423;


  logic [31:0] var_429;
  assign var_429 = var_425 & 32'd1023;


  logic [31:0] var_432;
  assign var_432 = var_429;


  logic [0:0] var_441;
  assign var_441 = var_836 == 4'd9;


  logic [63:0] var_820;
  assign var_820 = array_array_92b56_q[63:0];


  logic [31:0] var_450;
  assign var_450 = var_820[63:32];


  logic [31:0] var_454;
  assign var_454 = var_450;


  logic [31:0] var_459;
  assign var_459 = var_856[63:32];


  logic [31:0] var_463;
  assign var_463 = var_459;


  logic [63:0] var_465;
  assign var_465 = $signed(var_454) * $signed(var_463);


  logic [31:0] var_471;
  assign var_471 = var_820[31:0];


  logic [31:0] var_475;
  assign var_475 = var_471;


  logic [31:0] var_480;
  assign var_480 = var_856[31:0];


  logic [31:0] var_484;
  assign var_484 = var_480;


  logic [63:0] var_486;
  assign var_486 = $signed(var_475) * $signed(var_484);


  logic [63:0] var_489;
  assign var_489 = $signed(var_465) - $signed(var_486);


  logic [31:0] var_492;
  assign var_492 = var_489[31:0];


  logic [31:0] var_496;
  assign var_496 = var_492;


  logic [31:0] var_501;
  assign var_501 = var_820[63:32];


  logic [31:0] var_505;
  assign var_505 = var_501;


  logic [31:0] var_510;
  assign var_510 = var_856[31:0];


  logic [31:0] var_514;
  assign var_514 = var_510;


  logic [63:0] var_516;
  assign var_516 = $signed(var_505) * $signed(var_514);


  logic [31:0] var_522;
  assign var_522 = var_820[31:0];


  logic [31:0] var_526;
  assign var_526 = var_522;


  logic [31:0] var_531;
  assign var_531 = var_856[63:32];


  logic [31:0] var_535;
  assign var_535 = var_531;


  logic [63:0] var_537;
  assign var_537 = $signed(var_526) * $signed(var_535);


  logic [63:0] var_540;
  assign var_540 = $signed(var_516) - $signed(var_537);


  logic [31:0] var_543;
  assign var_543 = var_540[31:0];


  logic [31:0] var_547;
  assign var_547 = var_543;


  logic [31:0] var_549;
  assign var_549 = var_496;


  logic [31:0] var_551;
  assign var_551 = var_547;


  logic [63:0] var_553;
  assign var_553 = {var_549, var_551};


  logic [63:0] var_556;
  assign var_556 = var_553;


  logic [0:0] var_565;
  assign var_565 = var_836 == 4'd10;


  logic [0:0] var_574;
  assign var_574 = var_519 == 32'd0;


  always_ff @(posedge clk) if (executed && (var_565 && var_574))$display("%t\t[external_loop_66c6b]\t\tfinish",



  $time

);





  logic [0:0] var_587;
  assign var_587 = var_823 == 32'd1023;


  logic [31:0] var_593;
  assign var_593 = var_823;


  logic [31:0] var_596;
  assign var_596 = var_593 + 32'd1;


  logic [31:0] var_599;
  assign var_599 = var_587 ? 32'd0 : var_596;


  logic [31:0] var_610;
  assign var_610 = var_519;


  logic [31:0] var_612;
  assign var_612 = var_610 >> 32'd1;


  logic [31:0] var_618;
  assign var_618 = var_587 ? var_612 : var_519;


  logic [31:0] var_629;
  assign var_629 = var_814;


  logic [31:0] var_631;
  assign var_631 = var_629 + 32'd1;


  logic [31:0] var_637;
  assign var_637 = var_587 ? var_631 : var_814;


  logic [11:0] var_652;
  assign var_652 = var_845[11:0];


  logic [11:0] var_656;
  assign var_656 = var_652;


  logic [11:0] var_661;
  assign var_661 = var_823[11:0];


  logic [11:0] var_665;
  assign var_665 = var_661;


  logic [11:0] var_670;
  assign var_670 = var_845[11:0];


  logic [11:0] var_674;
  assign var_674 = var_670;


  logic [11:0] var_679;
  assign var_679 = var_823[11:0];


  logic [11:0] var_683;
  assign var_683 = var_679;


  logic [31:0] var_685;
  assign var_685 = array_array_92b62_q[31:0];


  logic [11:0] var_688;
  assign var_688 = var_685[11:0];


  logic [11:0] var_692;
  assign var_692 = var_688;


  logic [11:0] var_695;
  assign var_695 = var_692 + 12'd1024;


  logic [11:0] var_698;
  assign var_698 = var_695;


  logic [11:0] var_703;
  assign var_703 = var_823[11:0];


  logic [11:0] var_707;
  assign var_707 = var_703;


  logic [0:0] var_709;
  assign var_709 = var_836 == 4'd1;


  logic [11:0] var_713;
  assign var_713 = var_709 ? var_656 : 12'd0;


  logic [0:0] var_717;
  assign var_717 = var_836 == 4'd2;


  logic [11:0] var_720;
  assign var_720 = var_717 ? var_665 : var_713;


  logic [0:0] var_724;
  assign var_724 = var_836 == 4'd5;


  logic [11:0] var_727;
  assign var_727 = var_724 ? var_674 : var_720;


  logic [0:0] var_731;
  assign var_731 = var_836 == 4'd6;


  logic [11:0] var_734;
  assign var_734 = var_731 ? var_683 : var_727;


  logic [0:0] var_738;
  assign var_738 = var_836 == 4'd8;


  logic [11:0] var_741;
  assign var_741 = var_738 ? var_698 : var_734;


  logic [0:0] var_745;
  assign var_745 = var_836 == 4'd10;


  logic [11:0] var_748;
  assign var_748 = var_745 ? var_707 : var_741;
  assign expose_var_748 = var_748;
  assign expose_var_748_valid = executed && 1;


  logic [63:0] var_755;
  assign var_755 = array_array_66cdd_q[63:0];


  logic [63:0] var_758;
  assign var_758 = var_755;


  logic [63:0] var_760;
  assign var_760 = array_array_66ce3_q[63:0];


  logic [63:0] var_763;
  assign var_763 = var_760;


  logic [63:0] var_765;
  assign var_765 = array_array_66ce9_q[63:0];


  logic [63:0] var_768;
  assign var_768 = var_765;


  logic [63:0] var_833;
  assign var_833 = array_array_92bf5_q[63:0];


  logic [0:0] var_773;
  assign var_773 = var_836 == 4'd5;


  logic [63:0] var_776;
  assign var_776 = var_773 ? var_758 : var_833;


  logic [0:0] var_780;
  assign var_780 = var_836 == 4'd6;


  logic [63:0] var_783;
  assign var_783 = var_780 ? var_763 : var_776;


  logic [0:0] var_787;
  assign var_787 = var_836 == 4'd10;


  logic [63:0] var_790;
  assign var_790 = var_787 ? var_768 : var_783;


  logic [63:0] var_801;
  assign var_801 = var_833;
  assign expose_var_801 = var_801;
  assign expose_var_801_valid = executed && 1;


  always_ff @(posedge clk) if (executed)$display("%t\t[external_loop_66c6b]\t\tstate: %d",



  $time

, var_836);

  always_ff @(posedge clk) if (executed)$display("%t\t[external_loop_66c6b]\t\tspan: %d odd: %d | even: %d | log0: %d",



  $time

, var_519, var_823, var_845, var_814);

  always_ff @(posedge clk) if (executed)$display("%t\t[external_loop_66c6b]\t\taddress_wire: %d     even_reg: %d | odd_reg: %d",



  $time

, var_748, var_147, var_856);

  logic [63:0] var_848;
  assign var_848 = var_833;


  always_ff @(posedge clk) if (executed)$display("%t\t[external_loop_66c6b]\t\twe: %d | re: %d | out: %d",



  $time

, var_227, var_201, var_848);

  logic [31:0] var_860;
  assign var_860 = 32'd1024 - 32'd1;


  logic [0:0] var_863;
  assign var_863 = var_823 == var_860;


  logic [0:0] var_866;
  assign var_866 = var_863;


  assign calculate_loop_92b65_counter_delta = executed ? 1 : 0;

  assign memuser_92bfe_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_calculate_loop_92b65_In_full_flag_push_valid = executed;
  assign fifo_calculate_loop_92b65_In_full_flag_push_data = var_866;

  // Gather Array writes
  assign array_array_66cc8_w = (executed) && (((var_233)) || ((var_565)));
    assign array_array_66cc8_d = ({ 32 { (var_233) } } & var_252) | ({ 32 { (var_565) } } & var_599);
    assign array_array_66cc8_widx = ({ 1 { (var_233) } } & 1'd0) | ({ 1 { (var_565) } } & 1'd0);

    assign array_array_66ce3_w = (executed) && (((var_278)));
    assign array_array_66ce3_d = ({ 64 { (var_278) } } & var_399);
    assign array_array_66ce3_widx = ({ 1 { (var_278) } } & 1'd0);

    assign array_array_66cbf_w = (executed) && (((var_565)));
    assign array_array_66cbf_d = ({ 32 { (var_565) } } & var_618);
    assign array_array_66cbf_widx = ({ 1 { (var_565) } } & 1'd0);

    assign array_array_66cd1_w = (executed) && (((var_565)));
    assign array_array_66cd1_d = ({ 32 { (var_565) } } & var_637);
    assign array_array_66cd1_widx = ({ 1 { (var_565) } } & 1'd0);

    assign array_array_66ce9_w = (executed) && (((var_441)));
    assign array_array_66ce9_d = ({ 64 { (var_441) } } & var_556);
    assign array_array_66ce9_widx = ({ 1 { (var_441) } } & 1'd0);

    assign array_array_66cd7_w = (executed) && (((var_233)));
    assign array_array_66cd7_d = ({ 32 { (var_233) } } & var_268);
    assign array_array_66cd7_widx = ({ 1 { (var_233) } } & 1'd0);

    assign array_array_92bf5_w = executed;
    assign array_array_92bf5_d = var_790;
    assign array_array_92bf5_widx = 1'd0;

    assign array_array_66cdd_w = (executed) && (((var_278)));
    assign array_array_66cdd_d = ({ 64 { (var_278) } } & var_386);
    assign array_array_66cdd_widx = ({ 1 { (var_278) } } & 1'd0);

    assign array_array_92b62_w = (executed) && (((var_409)));
    assign array_array_92b62_d = ({ 32 { (var_409) } } & var_432);
    assign array_array_92b62_widx = ({ 1 { (var_409) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // external_loop_66c6b

module top(
  output logic [63:0] array_array_66cdd_exposed_o,
  input logic [63:0] array_array_66cdd_exposed_i,
  input logic [0:0] array_array_66cdd_exposed_i_valid,
  output logic [63:0] array_array_66ce9_exposed_o,
  input logic [63:0] array_array_66ce9_exposed_i,
  input logic [0:0] array_array_66ce9_exposed_i_valid,
  output logic [63:0] array_array_66ce3_exposed_o,
  input logic [63:0] array_array_66ce3_exposed_i,
  input logic [0:0] array_array_66ce3_exposed_i_valid,
  output logic [31:0] array_array_66cbf_exposed_o,
  input logic [31:0] array_array_66cbf_exposed_i,
  input logic [0:0] array_array_66cbf_exposed_i_valid,
  output logic [31:0] array_array_66cd1_exposed_o,
  input logic [31:0] array_array_66cd1_exposed_i,
  input logic [0:0] array_array_66cd1_exposed_i_valid,
  output logic [31:0] array_array_66cc8_exposed_o,
  input logic [31:0] array_array_66cc8_exposed_i,
  input logic [0:0] array_array_66cc8_exposed_i_valid,
  output logic [31:0] array_array_66cd7_exposed_o,
  input logic [31:0] array_array_66cd7_exposed_i,
  input logic [0:0] array_array_66cd7_exposed_i_valid,

  input logic clk,
  input logic rst_n
);

//Array: array_683e6, Init File Path: /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/fft/data/fft_data.data
  /* Array: array_66ce3[1 x b64] */
  logic [63:0] array_array_66ce3_q;
  logic [63:0] array_array_66ce3_driver_external_loop_66c6b_d;
  logic [0:0] array_array_66ce3_driver_external_loop_66c6b_w;
  logic [0:0] array_array_66ce3_driver_external_loop_66c6b_widx;
  assign array_array_66ce3_exposed_o = array_array_66ce3_q;
  logic [63:0] array_array_66ce3_temp;
  assign array_array_66ce3_temp = array_array_66ce3_exposed_i_valid?array_array_66ce3_exposed_i:array_array_66ce3_d;
  logic [63:0] array_array_66ce3_d;
  logic [0:0] array_array_66ce3_widx;
  logic [0:0] array_array_66ce3_w;
  assign array_array_66ce3_d = ({ 64 { array_array_66ce3_driver_external_loop_66c6b_w } } & array_array_66ce3_driver_external_loop_66c6b_d);
  assign array_array_66ce3_widx = ({ 1 { array_array_66ce3_driver_external_loop_66c6b_w } } & array_array_66ce3_driver_external_loop_66c6b_widx);
  assign array_array_66ce3_w = array_array_66ce3_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_66ce3_q[63:0] <= 64'd0;
    end
    else if (array_array_66ce3_w) begin

      case (array_array_66ce3_widx)
        0 : array_array_66ce3_q[63:0] <= array_array_66ce3_temp;
        default: ;
      endcase
    end
  /* Array: array_66cd1[1 x u32] */
  logic [31:0] array_array_66cd1_q;
  logic [31:0] array_array_66cd1_driver_external_loop_66c6b_d;
  logic [0:0] array_array_66cd1_driver_external_loop_66c6b_w;
  logic [0:0] array_array_66cd1_driver_external_loop_66c6b_widx;
  assign array_array_66cd1_exposed_o = array_array_66cd1_q;
  logic [31:0] array_array_66cd1_temp;
  assign array_array_66cd1_temp = array_array_66cd1_exposed_i_valid?array_array_66cd1_exposed_i:array_array_66cd1_d;
  logic [31:0] array_array_66cd1_d;
  logic [0:0] array_array_66cd1_widx;
  logic [0:0] array_array_66cd1_w;
  assign array_array_66cd1_d = ({ 32 { array_array_66cd1_driver_external_loop_66c6b_w } } & array_array_66cd1_driver_external_loop_66c6b_d);
  assign array_array_66cd1_widx = ({ 1 { array_array_66cd1_driver_external_loop_66c6b_w } } & array_array_66cd1_driver_external_loop_66c6b_widx);
  assign array_array_66cd1_w = array_array_66cd1_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_66cd1_q[31:0] <= 32'd0;
    end
    else if (array_array_66cd1_w) begin

      case (array_array_66cd1_widx)
        0 : array_array_66cd1_q[31:0] <= array_array_66cd1_temp;
        default: ;
      endcase
    end
  /* Array: array_683e6[4096 x b64] */
  logic [63:0] array_array_683e6_q;
  logic [63:0] array_array_683e6_driver_SRAM_683b0_d;
  logic [0:0] array_array_683e6_driver_SRAM_683b0_w;
  logic [11:0] array_array_683e6_driver_SRAM_683b0_widx;
  /* Array: array_92bf5[1 x b64] */
  logic [63:0] array_array_92bf5_q;
  logic [63:0] array_array_92bf5_driver_external_loop_66c6b_d;
  logic [0:0] array_array_92bf5_driver_external_loop_66c6b_w;
  logic [0:0] array_array_92bf5_driver_external_loop_66c6b_widx;
  logic [63:0] array_array_92bf5_d;
  logic [0:0] array_array_92bf5_widx;
  logic [0:0] array_array_92bf5_w;
  assign array_array_92bf5_d = ({ 64 { array_array_92bf5_driver_external_loop_66c6b_w } } & array_array_92bf5_driver_external_loop_66c6b_d);
  assign array_array_92bf5_widx = ({ 1 { array_array_92bf5_driver_external_loop_66c6b_w } } & array_array_92bf5_driver_external_loop_66c6b_widx);
  assign array_array_92bf5_w = array_array_92bf5_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_92bf5_q <= 64'd0;
    else if (array_array_92bf5_w) begin

      case (array_array_92bf5_widx)
        0 : array_array_92bf5_q[63:0] <= array_array_92bf5_d;
        default: ;
      endcase
    end
  /* Array: array_66ce9[1 x b64] */
  logic [63:0] array_array_66ce9_q;
  logic [63:0] array_array_66ce9_driver_external_loop_66c6b_d;
  logic [0:0] array_array_66ce9_driver_external_loop_66c6b_w;
  logic [0:0] array_array_66ce9_driver_external_loop_66c6b_widx;
  assign array_array_66ce9_exposed_o = array_array_66ce9_q;
  logic [63:0] array_array_66ce9_temp;
  assign array_array_66ce9_temp = array_array_66ce9_exposed_i_valid?array_array_66ce9_exposed_i:array_array_66ce9_d;
  logic [63:0] array_array_66ce9_d;
  logic [0:0] array_array_66ce9_widx;
  logic [0:0] array_array_66ce9_w;
  assign array_array_66ce9_d = ({ 64 { array_array_66ce9_driver_external_loop_66c6b_w } } & array_array_66ce9_driver_external_loop_66c6b_d);
  assign array_array_66ce9_widx = ({ 1 { array_array_66ce9_driver_external_loop_66c6b_w } } & array_array_66ce9_driver_external_loop_66c6b_widx);
  assign array_array_66ce9_w = array_array_66ce9_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_66ce9_q[63:0] <= 64'd0;
    end
    else if (array_array_66ce9_w) begin

      case (array_array_66ce9_widx)
        0 : array_array_66ce9_q[63:0] <= array_array_66ce9_temp;
        default: ;
      endcase
    end
  /* Array: array_66cd7[1 x u32] */
  logic [31:0] array_array_66cd7_q;
  logic [31:0] array_array_66cd7_driver_external_loop_66c6b_d;
  logic [0:0] array_array_66cd7_driver_external_loop_66c6b_w;
  logic [0:0] array_array_66cd7_driver_external_loop_66c6b_widx;
  assign array_array_66cd7_exposed_o = array_array_66cd7_q;
  logic [31:0] array_array_66cd7_temp;
  assign array_array_66cd7_temp = array_array_66cd7_exposed_i_valid?array_array_66cd7_exposed_i:array_array_66cd7_d;
  logic [31:0] array_array_66cd7_d;
  logic [0:0] array_array_66cd7_widx;
  logic [0:0] array_array_66cd7_w;
  assign array_array_66cd7_d = ({ 32 { array_array_66cd7_driver_external_loop_66c6b_w } } & array_array_66cd7_driver_external_loop_66c6b_d);
  assign array_array_66cd7_widx = ({ 1 { array_array_66cd7_driver_external_loop_66c6b_w } } & array_array_66cd7_driver_external_loop_66c6b_widx);
  assign array_array_66cd7_w = array_array_66cd7_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_66cd7_q[31:0] <= 32'd0;
    end
    else if (array_array_66cd7_w) begin

      case (array_array_66cd7_widx)
        0 : array_array_66cd7_q[31:0] <= array_array_66cd7_temp;
        default: ;
      endcase
    end
  /* Array: array_92b47[1 x b64] */
  logic [63:0] array_array_92b47_q;
  logic [63:0] array_array_92b47_driver_memuser_92bfe_d;
  logic [0:0] array_array_92b47_driver_memuser_92bfe_w;
  logic [0:0] array_array_92b47_driver_memuser_92bfe_widx;
  logic [63:0] array_array_92b47_d;
  logic [0:0] array_array_92b47_widx;
  logic [0:0] array_array_92b47_w;
  assign array_array_92b47_d = ({ 64 { array_array_92b47_driver_memuser_92bfe_w } } & array_array_92b47_driver_memuser_92bfe_d);
  assign array_array_92b47_widx = ({ 1 { array_array_92b47_driver_memuser_92bfe_w } } & array_array_92b47_driver_memuser_92bfe_widx);
  assign array_array_92b47_w = array_array_92b47_driver_memuser_92bfe_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_92b47_q <= 64'd0;
    else if (array_array_92b47_w) begin

      case (array_array_92b47_widx)
        0 : array_array_92b47_q[63:0] <= array_array_92b47_d;
        default: ;
      endcase
    end
  /* Array: array_92b62[1 x u32] */
  logic [31:0] array_array_92b62_q;
  logic [31:0] array_array_92b62_driver_external_loop_66c6b_d;
  logic [0:0] array_array_92b62_driver_external_loop_66c6b_w;
  logic [0:0] array_array_92b62_driver_external_loop_66c6b_widx;
  logic [31:0] array_array_92b62_d;
  logic [0:0] array_array_92b62_widx;
  logic [0:0] array_array_92b62_w;
  assign array_array_92b62_d = ({ 32 { array_array_92b62_driver_external_loop_66c6b_w } } & array_array_92b62_driver_external_loop_66c6b_d);
  assign array_array_92b62_widx = ({ 1 { array_array_92b62_driver_external_loop_66c6b_w } } & array_array_92b62_driver_external_loop_66c6b_widx);
  assign array_array_92b62_w = array_array_92b62_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_92b62_q[31:0] <= 32'd0;
    end
    else if (array_array_92b62_w) begin

      case (array_array_92b62_widx)
        0 : array_array_92b62_q[31:0] <= array_array_92b62_d;
        default: ;
      endcase
    end
  /* Array: array_66cbf[1 x u32] */
  logic [31:0] array_array_66cbf_q;
  logic [31:0] array_array_66cbf_driver_external_loop_66c6b_d;
  logic [0:0] array_array_66cbf_driver_external_loop_66c6b_w;
  logic [0:0] array_array_66cbf_driver_external_loop_66c6b_widx;
  assign array_array_66cbf_exposed_o = array_array_66cbf_q;
  logic [31:0] array_array_66cbf_temp;
  assign array_array_66cbf_temp = array_array_66cbf_exposed_i_valid?array_array_66cbf_exposed_i:array_array_66cbf_d;
  logic [31:0] array_array_66cbf_d;
  logic [0:0] array_array_66cbf_widx;
  logic [0:0] array_array_66cbf_w;
  assign array_array_66cbf_d = ({ 32 { array_array_66cbf_driver_external_loop_66c6b_w } } & array_array_66cbf_driver_external_loop_66c6b_d);
  assign array_array_66cbf_widx = ({ 1 { array_array_66cbf_driver_external_loop_66c6b_w } } & array_array_66cbf_driver_external_loop_66c6b_widx);
  assign array_array_66cbf_w = array_array_66cbf_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_66cbf_q[31:0] <= 32'd512;
    end
    else if (array_array_66cbf_w) begin

      case (array_array_66cbf_widx)
        0 : array_array_66cbf_q[31:0] <= array_array_66cbf_temp;
        default: ;
      endcase
    end
  /* Array: array_92b56[1 x b64] */
  logic [63:0] array_array_92b56_q;
  logic [63:0] array_array_92b56_driver_memuser_92bfe_d;
  logic [0:0] array_array_92b56_driver_memuser_92bfe_w;
  logic [0:0] array_array_92b56_driver_memuser_92bfe_widx;
  logic [63:0] array_array_92b56_d;
  logic [0:0] array_array_92b56_widx;
  logic [0:0] array_array_92b56_w;
  assign array_array_92b56_d = ({ 64 { array_array_92b56_driver_memuser_92bfe_w } } & array_array_92b56_driver_memuser_92bfe_d);
  assign array_array_92b56_widx = ({ 1 { array_array_92b56_driver_memuser_92bfe_w } } & array_array_92b56_driver_memuser_92bfe_widx);
  assign array_array_92b56_w = array_array_92b56_driver_memuser_92bfe_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_92b56_q <= 64'd0;
    else if (array_array_92b56_w) begin

      case (array_array_92b56_widx)
        0 : array_array_92b56_q[63:0] <= array_array_92b56_d;
        default: ;
      endcase
    end
  /* Array: array_92b50[1 x b64] */
  logic [63:0] array_array_92b50_q;
  logic [63:0] array_array_92b50_driver_memuser_92bfe_d;
  logic [0:0] array_array_92b50_driver_memuser_92bfe_w;
  logic [0:0] array_array_92b50_driver_memuser_92bfe_widx;
  logic [63:0] array_array_92b50_d;
  logic [0:0] array_array_92b50_widx;
  logic [0:0] array_array_92b50_w;
  assign array_array_92b50_d = ({ 64 { array_array_92b50_driver_memuser_92bfe_w } } & array_array_92b50_driver_memuser_92bfe_d);
  assign array_array_92b50_widx = ({ 1 { array_array_92b50_driver_memuser_92bfe_w } } & array_array_92b50_driver_memuser_92bfe_widx);
  assign array_array_92b50_w = array_array_92b50_driver_memuser_92bfe_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_92b50_q <= 64'd0;
    else if (array_array_92b50_w) begin

      case (array_array_92b50_widx)
        0 : array_array_92b50_q[63:0] <= array_array_92b50_d;
        default: ;
      endcase
    end
  /* Array: array_92b5c[1 x b4] */
  logic [3:0] array_array_92b5c_q;
  logic [3:0] array_array_92b5c_driver_calculate_loop_92b65_d;
  logic [0:0] array_array_92b5c_driver_calculate_loop_92b65_w;
  logic [0:0] array_array_92b5c_driver_calculate_loop_92b65_widx;
  logic [3:0] array_array_92b5c_d;
  logic [0:0] array_array_92b5c_widx;
  logic [0:0] array_array_92b5c_w;
  assign array_array_92b5c_d = ({ 4 { array_array_92b5c_driver_calculate_loop_92b65_w } } & array_array_92b5c_driver_calculate_loop_92b65_d);
  assign array_array_92b5c_widx = ({ 1 { array_array_92b5c_driver_calculate_loop_92b65_w } } & array_array_92b5c_driver_calculate_loop_92b65_widx);
  assign array_array_92b5c_w = array_array_92b5c_driver_calculate_loop_92b65_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_92b5c_q[3:0] <= 4'd0;
    end
    else if (array_array_92b5c_w) begin

      case (array_array_92b5c_widx)
        0 : array_array_92b5c_q[3:0] <= array_array_92b5c_d;
        default: ;
      endcase
    end
  /* Array: array_66cdd[1 x b64] */
  logic [63:0] array_array_66cdd_q;
  logic [63:0] array_array_66cdd_driver_external_loop_66c6b_d;
  logic [0:0] array_array_66cdd_driver_external_loop_66c6b_w;
  logic [0:0] array_array_66cdd_driver_external_loop_66c6b_widx;
  assign array_array_66cdd_exposed_o = array_array_66cdd_q;
  logic [63:0] array_array_66cdd_temp;
  assign array_array_66cdd_temp = array_array_66cdd_exposed_i_valid?array_array_66cdd_exposed_i:array_array_66cdd_d;
  logic [63:0] array_array_66cdd_d;
  logic [0:0] array_array_66cdd_widx;
  logic [0:0] array_array_66cdd_w;
  assign array_array_66cdd_d = ({ 64 { array_array_66cdd_driver_external_loop_66c6b_w } } & array_array_66cdd_driver_external_loop_66c6b_d);
  assign array_array_66cdd_widx = ({ 1 { array_array_66cdd_driver_external_loop_66c6b_w } } & array_array_66cdd_driver_external_loop_66c6b_widx);
  assign array_array_66cdd_w = array_array_66cdd_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_66cdd_q[63:0] <= 64'd0;
    end
    else if (array_array_66cdd_w) begin

      case (array_array_66cdd_widx)
        0 : array_array_66cdd_q[63:0] <= array_array_66cdd_temp;
        default: ;
      endcase
    end
  /* Array: array_688b3[1 x i32] */
  logic [31:0] array_array_688b3_q;
  logic [31:0] array_array_688b3_d;
  logic [0:0] array_array_688b3_widx;
  logic [0:0] array_array_688b3_w;
  assign array_array_688b3_d = 'x;
  assign array_array_688b3_widx = 'x;
  assign array_array_688b3_w = 'x;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_688b3_q <= 32'd0;
    else if (array_array_688b3_w) begin

      case (array_array_688b3_widx)
        0 : array_array_688b3_q[31:0] <= array_array_688b3_d;
        default: ;
      endcase
    end
  /* Array: array_66cc8[1 x u32] */
  logic [31:0] array_array_66cc8_q;
  logic [31:0] array_array_66cc8_driver_external_loop_66c6b_d;
  logic [0:0] array_array_66cc8_driver_external_loop_66c6b_w;
  logic [0:0] array_array_66cc8_driver_external_loop_66c6b_widx;
  assign array_array_66cc8_exposed_o = array_array_66cc8_q;
  logic [31:0] array_array_66cc8_temp;
  assign array_array_66cc8_temp = array_array_66cc8_exposed_i_valid?array_array_66cc8_exposed_i:array_array_66cc8_d;
  logic [31:0] array_array_66cc8_d;
  logic [0:0] array_array_66cc8_widx;
  logic [0:0] array_array_66cc8_w;
  assign array_array_66cc8_d = ({ 32 { array_array_66cc8_driver_external_loop_66c6b_w } } & array_array_66cc8_driver_external_loop_66c6b_d);
  assign array_array_66cc8_widx = ({ 1 { array_array_66cc8_driver_external_loop_66c6b_w } } & array_array_66cc8_driver_external_loop_66c6b_widx);
  assign array_array_66cc8_w = array_array_66cc8_driver_external_loop_66c6b_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_66cc8_q[31:0] <= 32'd0;
    end
    else if (array_array_66cc8_w) begin

      case (array_array_66cc8_widx)
        0 : array_array_66cc8_q[31:0] <= array_array_66cc8_temp;
        default: ;
      endcase
    end
  // fifo: In_full_flag: fifo<b1>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_pop_data;
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_pop_valid;
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_pop_ready;
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_data;
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_valid;
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_calculate_loop_92b65_In_full_flag_push_ready;
  assign fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_ready = fifo_calculate_loop_92b65_In_full_flag_push_ready;  // Gather all the push signal
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_push_valid;
  assign fifo_calculate_loop_92b65_In_full_flag_push_valid = fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_valid;
  // 1-hot select the push data
  logic [0:0] fifo_calculate_loop_92b65_In_full_flag_push_data;
  assign fifo_calculate_loop_92b65_In_full_flag_push_data = ({ 1 { fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_valid } } & fifo_calculate_loop_92b65_In_full_flag_driver_external_loop_66c6b_push_data);

  fifo #(1, 2) fifo_calculate_loop_92b65_In_full_flag_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_calculate_loop_92b65_In_full_flag_push_valid),
    .push_data(fifo_calculate_loop_92b65_In_full_flag_push_data),
    .push_ready(fifo_calculate_loop_92b65_In_full_flag_push_ready),
    .pop_valid(fifo_calculate_loop_92b65_In_full_flag_pop_valid),
    .pop_data(fifo_calculate_loop_92b65_In_full_flag_pop_data),
    .pop_ready(fifo_calculate_loop_92b65_In_full_flag_pop_ready));

  // fifo: rdata: fifo<b64>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [63:0] fifo_memuser_92bfe_rdata_pop_data;
  logic [0:0] fifo_memuser_92bfe_rdata_pop_valid;
  logic [0:0] fifo_memuser_92bfe_rdata_pop_ready;
  logic [63:0] fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_data;
  logic [0:0] fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid;
  logic [0:0] fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_memuser_92bfe_rdata_push_ready;
  assign fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_ready = fifo_memuser_92bfe_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_memuser_92bfe_rdata_push_valid;
  assign fifo_memuser_92bfe_rdata_push_valid = fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid;
  // 1-hot select the push data
  logic [63:0] fifo_memuser_92bfe_rdata_push_data;
  assign fifo_memuser_92bfe_rdata_push_data = ({ 64 { fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid } } & fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_data);

  fifo #(64, 2) fifo_memuser_92bfe_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_memuser_92bfe_rdata_push_valid),
    .push_data(fifo_memuser_92bfe_rdata_push_data),
    .push_ready(fifo_memuser_92bfe_rdata_push_ready),
    .pop_valid(fifo_memuser_92bfe_rdata_pop_valid),
    .pop_data(fifo_memuser_92bfe_rdata_pop_data),
    .pop_ready(fifo_memuser_92bfe_rdata_pop_ready));

  // Trigger SM of Module: calculate_loop_92b65
  logic [7:0] calculate_loop_92b65_driver_external_loop_66c6b_counter_delta;
  logic [0:0] calculate_loop_92b65_driver_external_loop_66c6b_counter_delta_ready;
  logic [0:0] calculate_loop_92b65_counter_delta_ready;
  logic [7:0] calculate_loop_92b65_counter_delta;
  // Gather all the push signal
  assign calculate_loop_92b65_counter_delta = calculate_loop_92b65_driver_external_loop_66c6b_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] calculate_loop_92b65_counter_pop_ready;
  assign calculate_loop_92b65_driver_external_loop_66c6b_counter_delta_ready = calculate_loop_92b65_counter_pop_ready;
  logic [0:0] calculate_loop_92b65_counter_pop_valid;

  trigger_counter #(8) calculate_loop_92b65_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(calculate_loop_92b65_counter_delta),
    .delta_ready(calculate_loop_92b65_counter_delta_ready),
    .pop_valid(calculate_loop_92b65_counter_pop_valid),
    .pop_ready(calculate_loop_92b65_counter_pop_ready));
  // Trigger SM of Module: memuser_92bfe
  logic [7:0] memuser_92bfe_driver_external_loop_66c6b_counter_delta;
  logic [0:0] memuser_92bfe_driver_external_loop_66c6b_counter_delta_ready;
  logic [0:0] memuser_92bfe_counter_delta_ready;
  logic [7:0] memuser_92bfe_counter_delta;
  // Gather all the push signal
  assign memuser_92bfe_counter_delta = memuser_92bfe_driver_external_loop_66c6b_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] memuser_92bfe_counter_pop_ready;
  assign memuser_92bfe_driver_external_loop_66c6b_counter_delta_ready = memuser_92bfe_counter_pop_ready;
  logic [0:0] memuser_92bfe_counter_pop_valid;

  trigger_counter #(8) memuser_92bfe_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(memuser_92bfe_counter_delta),
    .delta_ready(memuser_92bfe_counter_delta_ready),
    .pop_valid(memuser_92bfe_counter_pop_valid),
    .pop_ready(memuser_92bfe_counter_pop_ready));
  // Trigger SM of Module: loop_user_68877
  logic [7:0] loop_user_68877_driver_driver_counter_delta;
  logic [0:0] loop_user_68877_driver_driver_counter_delta_ready;
  logic [0:0] loop_user_68877_counter_delta_ready;
  logic [7:0] loop_user_68877_counter_delta;
  // Gather all the push signal
  assign loop_user_68877_counter_delta = loop_user_68877_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] loop_user_68877_counter_pop_ready;
  assign loop_user_68877_driver_driver_counter_delta_ready = loop_user_68877_counter_pop_ready;
  logic [0:0] loop_user_68877_counter_pop_valid;

  trigger_counter #(8) loop_user_68877_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(loop_user_68877_counter_delta),
    .delta_ready(loop_user_68877_counter_delta_ready),
    .pop_valid(loop_user_68877_counter_pop_valid),
    .pop_ready(loop_user_68877_counter_pop_ready));
  // Trigger SM of Module: driver
  logic [0:0] driver_counter_delta_ready;
  logic [7:0] driver_counter_delta;
  // Gather all the push signal
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] driver_counter_pop_ready;
  logic [0:0] driver_counter_pop_valid;

  trigger_counter #(8) driver_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(driver_counter_delta),
    .delta_ready(driver_counter_delta_ready),
    .pop_valid(driver_counter_pop_valid),
    .pop_ready(driver_counter_pop_ready));
  // Trigger SM of Module: external_loop_66c6b
  logic [7:0] external_loop_66c6b_driver_driver_counter_delta;
  logic [0:0] external_loop_66c6b_driver_driver_counter_delta_ready;
  logic [0:0] external_loop_66c6b_counter_delta_ready;
  logic [7:0] external_loop_66c6b_counter_delta;
  // Gather all the push signal
  assign external_loop_66c6b_counter_delta = external_loop_66c6b_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] external_loop_66c6b_counter_pop_ready;
  assign external_loop_66c6b_driver_driver_counter_delta_ready = external_loop_66c6b_counter_pop_ready;
  logic [0:0] external_loop_66c6b_counter_pop_valid;

  trigger_counter #(8) external_loop_66c6b_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(external_loop_66c6b_counter_delta),
    .delta_ready(external_loop_66c6b_counter_delta_ready),
    .pop_valid(external_loop_66c6b_counter_pop_valid),
    .pop_ready(external_loop_66c6b_counter_pop_ready));
  assign driver_counter_delta = 8'b1;

  logic [0:0] calculate_loop_92b65_executed;

  // calculate_loop_92b65
  calculate_loop_92b65 calculate_loop_92b65_i (
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
    .expose_executed(calculate_loop_92b65_executed));
  logic [0:0] memuser_92bfe_executed;

  // memuser_92bfe
  memuser_92bfe memuser_92bfe_i (
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
    .expose_executed(memuser_92bfe_executed));
  logic [0:0] loop_user_68877_executed;

  // loop_user_68877
  loop_user_68877 loop_user_68877_i (
    .clk(clk),
    .rst_n(rst_n),
    .counter_delta_ready(loop_user_68877_counter_delta_ready),
    .counter_pop_ready(loop_user_68877_counter_pop_ready),
    .counter_pop_valid(loop_user_68877_counter_pop_valid),
    .expose_executed(loop_user_68877_executed));
  logic [0:0] driver_executed;

  // driver
  driver driver_i (
    .clk(clk),
    .rst_n(rst_n),
    .external_loop_66c6b_counter_delta_ready(external_loop_66c6b_driver_driver_counter_delta_ready),
    .external_loop_66c6b_counter_delta(external_loop_66c6b_driver_driver_counter_delta),
    .loop_user_68877_counter_delta_ready(loop_user_68877_driver_driver_counter_delta_ready),
    .loop_user_68877_counter_delta(loop_user_68877_driver_driver_counter_delta),
    .counter_delta_ready(driver_counter_delta_ready),
    .counter_pop_ready(driver_counter_pop_ready),
    .counter_pop_valid(driver_counter_pop_valid),
    .expose_executed(driver_executed));
  logic [0:0] logic_var_201;
  logic [0:0] logic_var_201_valid;
  logic [11:0] logic_var_748;
  logic [0:0] logic_var_748_valid;
  logic [63:0] logic_var_801;
  logic [0:0] logic_var_801_valid;
  logic [0:0] logic_var_227;
  logic [0:0] logic_var_227_valid;
  logic [0:0] external_loop_66c6b_executed;

  // external_loop_66c6b
  external_loop_66c6b external_loop_66c6b_i (
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
    .expose_executed(external_loop_66c6b_executed));
  logic [0:0] SRAM_683b0_executed;

  // SRAM_683b0
  SRAM_683b0 SRAM_683b0_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_memuser_92bfe_rdata_push_valid(fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_valid),
    .fifo_memuser_92bfe_rdata_push_data(fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_data),
    .fifo_memuser_92bfe_rdata_push_ready(fifo_memuser_92bfe_rdata_driver_SRAM_683b0_push_ready),
    // Upstream executed signals
    .external_loop_66c6b_executed(external_loop_66c6b_executed),
    .var_227(logic_var_227),
    .var_227_valid(logic_var_227_valid),
    .var_801(logic_var_801),
    .var_801_valid(logic_var_801_valid),
    .var_201(logic_var_201),
    .var_201_valid(logic_var_201_valid),
    .var_748(logic_var_748),
    .var_748_valid(logic_var_748_valid),
    .expose_executed(SRAM_683b0_executed));
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
logic [63:0]array_array_66cdd_exposed_o;
logic [63:0]array_array_66cdd_exposed_i;
logic array_array_66cdd_exposed_i_valid;

assign array_array_66cdd_exposed_i_valid = 1'd0;
assign array_array_66cdd_exposed_i = 64'd0;
logic [63:0]array_array_66ce9_exposed_o;
logic [63:0]array_array_66ce9_exposed_i;
logic array_array_66ce9_exposed_i_valid;

assign array_array_66ce9_exposed_i_valid = 1'd0;
assign array_array_66ce9_exposed_i = 64'd0;
logic [63:0]array_array_66ce3_exposed_o;
logic [63:0]array_array_66ce3_exposed_i;
logic array_array_66ce3_exposed_i_valid;

assign array_array_66ce3_exposed_i_valid = 1'd0;
assign array_array_66ce3_exposed_i = 64'd0;
logic [31:0]array_array_66cbf_exposed_o;
logic [31:0]array_array_66cbf_exposed_i;
logic array_array_66cbf_exposed_i_valid;

assign array_array_66cbf_exposed_i_valid = 1'd0;
assign array_array_66cbf_exposed_i = 32'd0;
logic [31:0]array_array_66cd1_exposed_o;
logic [31:0]array_array_66cd1_exposed_i;
logic array_array_66cd1_exposed_i_valid;

assign array_array_66cd1_exposed_i_valid = 1'd0;
assign array_array_66cd1_exposed_i = 32'd0;
logic [31:0]array_array_66cc8_exposed_o;
logic [31:0]array_array_66cc8_exposed_i;
logic array_array_66cc8_exposed_i_valid;

assign array_array_66cc8_exposed_i_valid = 1'd0;
assign array_array_66cc8_exposed_i = 32'd0;
logic [31:0]array_array_66cd7_exposed_o;
logic [31:0]array_array_66cd7_exposed_i;
logic array_array_66cd7_exposed_i_valid;

assign array_array_66cd7_exposed_i_valid = 1'd0;
assign array_array_66cd7_exposed_i = 32'd0;

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #10000100;
  


end

always #50 clk <= !clk;



top top_i (
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


// End of: /home/ubuntu/fft.sv
////////////////////////////////////////////////////////////////
