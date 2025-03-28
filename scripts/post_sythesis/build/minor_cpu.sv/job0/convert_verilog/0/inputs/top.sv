////////////////////////////////////////////////////////////////
// Start of: /home/ubuntu/minor_cpu.sv


module memuser_30344 (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_4dc17[1 x b32] */
  output logic [0:0] array_array_4dc17_w,
  output logic [0:0] array_array_4dc17_widx,
  output logic [31:0] array_array_4dc17_d,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_66;
  assign var_66 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [31:0] var_68;
  assign var_68 = var_66;


  logic [31:0] var_70;
  assign var_70 = var_68;


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_4dc17_w = executed;
    assign array_array_4dc17_d = var_70;
    assign array_array_4dc17_widx = 1'd0;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // memuser_30344


module dcache (
  input logic clk,
  input logic rst_n,

  /* Array: array_36c8f[65536 x b32] */
  /* /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/minor-cpu/src/.workspace//workload.data */




  // External FIFO m.rdata
  output logic [0:0] fifo_m_rdata_push_valid,
  output logic [31:0] fifo_m_rdata_push_data,
  input logic [0:0] fifo_m_rdata_push_ready,

  // Declare upstream executed signals
  input logic [0:0] e_executed,
  input logic [0:0] var_1294,
  input logic [0:0] var_1294_valid,
  input logic [15:0] var_1409,
  input logic [0:0] var_1409_valid,
  input logic [31:0] var_1064,
  input logic [0:0] var_1064_valid,
  input logic [0:0] var_1302,
  input logic [0:0] var_1302_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_5050;
  assign var_5050 = dataout;
  // Gather FIFO pushes
  assign fifo_m_rdata_push_valid = (executed) && (((var_1294)));
  assign fifo_m_rdata_push_data = ({ 32 { (var_1294) } } & var_5050);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_36c8f_w;
  logic [31:0] array_array_36c8f_d;
  logic [15:0] array_array_36c8f_widx;
  assign array_array_36c8f_w = (executed) && (((var_1302)));
  assign array_array_36c8f_d = ({ 32 { (var_1302) } } & var_1064);
  assign array_array_36c8f_widx = var_1409;


  memory_blackbox_array_36c8f #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(16)     
    ) memory_blackbox_array_36c8f(
    .clk     (clk), 
    .address (array_array_36c8f_widx), 
    .wd      (array_array_36c8f_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_36c8f_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = e_executed;
  assign expose_executed = executed;
endmodule // dcache




(* blackbox *)

module memory_blackbox_array_36c8f #(
    parameter DATA_WIDTH = 32,   
    parameter ADDR_WIDTH = 16 
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
              
module m (
  input logic clk,
  input logic rst_n,
  // Port FIFO mem_ext
  input logic [0:0] fifo_mem_ext_pop_valid,
  input logic [1:0] fifo_mem_ext_pop_data,
  output logic [0:0] fifo_mem_ext_pop_ready,
  // Port FIFO result
  input logic [0:0] fifo_result_pop_valid,
  input logic [31:0] fifo_result_pop_data,
  output logic [0:0] fifo_result_pop_ready,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  // Port FIFO rd
  input logic [0:0] fifo_rd_pop_valid,
  input logic [4:0] fifo_rd_pop_data,
  output logic [0:0] fifo_rd_pop_ready,
  // External FIFO w.rd
  output logic [0:0] fifo_w_rd_push_valid,
  output logic [4:0] fifo_w_rd_push_data,
  input logic [0:0] fifo_w_rd_push_ready,

  /* Array: array_303c2[1 x b32] */
  output logic [0:0] array_array_303c2_w,
  output logic [0:0] array_array_303c2_widx,
  output logic [31:0] array_array_303c2_d,

  // External FIFO w.mdata
  output logic [0:0] fifo_w_mdata_push_valid,
  output logic [31:0] fifo_w_mdata_push_data,
  input logic [0:0] fifo_w_mdata_push_ready,

  /* Array: array_303b6[1 x b5] */
  output logic [0:0] array_array_303b6_w,
  output logic [0:0] array_array_303b6_widx,
  output logic [4:0] array_array_303b6_d,

  /* Array: array_303b3[1 x b5] */
  output logic [0:0] array_array_303b3_w,
  output logic [0:0] array_array_303b3_widx,
  output logic [4:0] array_array_303b3_d,

  /* Array: array_3039b[1 x b32] */
  output logic [0:0] array_array_3039b_w,
  output logic [0:0] array_array_3039b_widx,
  output logic [31:0] array_array_3039b_d,

  // Module w
  output logic [7:0] w_counter_delta,
  input logic [0:0] w_counter_delta_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [1:0] var_100;
  assign var_100 = fifo_mem_ext_pop_data;


  assign fifo_mem_ext_pop_ready = executed;
  logic [31:0] var_102;
  assign var_102 = fifo_result_pop_data;


  assign fifo_result_pop_ready = executed;
  logic [4:0] var_104;
  assign var_104 = fifo_rd_pop_data;


  assign fifo_rd_pop_ready = executed;
  logic [0:0] var_5145;
  assign var_5145 = fifo_rdata_pop_valid;


  logic [31:0] var_111;
  assign var_111 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed && (var_5145);
  always_ff @(posedge clk) if (executed && (var_5145))$display("%t\t[m]\t\tmem.rdata        | 0x%x",



  $time

, var_111);

  logic [0:0] var_121;
  assign var_121 = var_104 != 5'd0;


  always_ff @(posedge clk) if (executed && (var_5145 && var_121))$display("%t\t[m]\t\tmem.bypass       | x%02d = 0x%x",



  $time

, var_104, var_111);

  logic [0:0] var_138;
  assign var_138 = ~$signed(var_5145);


  logic [31:0] var_149;
  assign var_149 = fifo_rdata_pop_data;


  logic [31:0] var_151;
  assign var_151 = var_5145 ? var_149 : 32'd0;


  logic [0:0] var_156;
  assign var_156 = var_151[7:7];


  logic [23:0] var_162;
  assign var_162 = var_156 ? 24'd16777215 : 24'd0;


  logic [0:0] var_166;
  assign var_166 = var_100[1:1];


  logic [7:0] var_188;
  assign var_188 = var_151[7:0];


  logic [31:0] var_174;
  assign var_174 = {24'd0, var_188};


  logic [31:0] var_181;
  assign var_181 = {var_162, var_188};


  logic [31:0] var_184;
  assign var_184 = var_166 ? var_174 : var_181;


  logic [31:0] var_190;
  assign var_190 = var_5145 ? var_151 : var_102;


  logic [0:0] var_194;
  assign var_194 = var_100[0:0];


  logic [31:0] var_198;
  assign var_198 = var_194 ? var_184 : var_190;


  assign w_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_w_rd_push_valid = executed;
  assign fifo_w_rd_push_data = var_104;

  assign fifo_w_mdata_push_valid = executed;
  assign fifo_w_mdata_push_data = var_198;

  // Gather Array writes
  assign array_array_303b6_w = executed;
    assign array_array_303b6_d = var_104;
    assign array_array_303b6_widx = 1'd0;

    assign array_array_303b3_w = (executed) && (((var_5145)) || ((var_138)));
    assign array_array_303b3_d = ({ 5 { (var_5145) } } & var_104) | ({ 5 { (var_138) } } & 5'd0);
    assign array_array_303b3_widx = ({ 1 { (var_5145) } } & 1'd0) | ({ 1 { (var_138) } } & 1'd0);

    assign array_array_3039b_w = (executed) && (((var_5145 && var_121)));
    assign array_array_3039b_d = ({ 32 { (var_5145 && var_121) } } & var_111);
    assign array_array_3039b_widx = ({ 1 { (var_5145 && var_121) } } & 1'd0);

    assign array_array_303c2_w = executed;
    assign array_array_303c2_d = var_198;
    assign array_array_303c2_widx = 1'd0;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // m


module W1 (
  input logic clk,
  input logic rst_n,
  /* Array: array_303ce[1 x b32] */
  input logic [31:0] array_array_303ce_q,
  output logic [0:0] array_array_303ce_w,
  output logic [0:0] array_array_303ce_widx,
  output logic [31:0] array_array_303ce_d,



  // Declare upstream executed signals
  input logic [0:0] e_executed,
  input logic [0:0] w_executed,
  input logic [4:0] var_80,
  input logic [0:0] var_80_valid,
  input logic [4:0] var_845,
  input logic [0:0] var_845_valid,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_5074;
  assign var_5074 = var_845_valid;


  logic [4:0] var_5076;
  assign var_5076 = var_5074 ? var_845 : 5'd0;


  logic [0:0] var_5080;
  assign var_5080 = var_80_valid;


  logic [4:0] var_5082;
  assign var_5082 = var_5080 ? var_80 : 5'd0;


  logic [0:0] var_5086;
  assign var_5086 = var_5076 != 5'd0;


  logic [31:0] var_5089;
  assign var_5089 = 32'd1 << var_5076;


  logic [31:0] var_5092;
  assign var_5092 = var_5086 ? var_5089 : 32'd0;


  logic [0:0] var_5096;
  assign var_5096 = var_5082 != 5'd0;


  logic [31:0] var_5099;
  assign var_5099 = 32'd1 << var_5082;


  logic [31:0] var_5102;
  assign var_5102 = var_5096 ? var_5099 : 32'd0;


  logic [31:0] var_177;
  assign var_177 = array_array_303ce_q[31:0];


  logic [31:0] var_5109;
  assign var_5109 = var_177 ^ var_5092;


  logic [31:0] var_5112;
  assign var_5112 = var_5109 ^ var_5102;


  always_ff @(posedge clk) if (executed)$display("%t\t[W1]\t\townning: %02d      | releasing: %02d| reg_onwrite[0]: %08x",



  $time

, var_5076, var_5082, var_177);

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_303ce_w = executed;
    assign array_array_303ce_d = var_5112;
    assign array_array_303ce_widx = 1'd0;

    assign executed = e_executed || w_executed;
  assign expose_executed = executed;
endmodule // W1


module e (
  input logic clk,
  input logic rst_n,
  // Port FIFO fetch_addr
  input logic [0:0] fifo_fetch_addr_pop_valid,
  input logic [31:0] fifo_fetch_addr_pop_data,
  output logic [0:0] fifo_fetch_addr_pop_ready,
  // Port FIFO signals
  input logic [0:0] fifo_signals_pop_valid,
  input logic [96:0] fifo_signals_pop_data,
  output logic [0:0] fifo_signals_pop_ready,
  // Module m
  output logic [7:0] m_counter_delta,
  input logic [0:0] m_counter_delta_ready,

  /* Array: array_303a4[1 x b32] */
  input logic [31:0] array_array_303a4_q,
  output logic [0:0] array_array_303a4_w,
  output logic [0:0] array_array_303a4_widx,
  output logic [31:0] array_array_303a4_d,

  /* Array: array_303b3[1 x b5] */
  input logic [4:0] array_array_303b3_q,

  // External FIFO m.rd
  output logic [0:0] fifo_m_rd_push_valid,
  output logic [4:0] fifo_m_rd_push_data,
  input logic [0:0] fifo_m_rd_push_ready,

  /* Array: array_4dc17[1 x b32] */
  input logic [31:0] array_array_4dc17_q,

  /* Array: array_303b0[16 x b32] */
  input logic [511:0] array_array_303b0_q,
  output logic [0:0] array_array_303b0_w,
  output logic [3:0] array_array_303b0_widx,
  output logic [31:0] array_array_303b0_d,

  /* Array: array_303ce[1 x b32] */
  input logic [31:0] array_array_303ce_q,

  /* Array: array_303aa[32 x b32] */
  input logic [1023:0] array_array_303aa_q,

  // External FIFO m.result
  output logic [0:0] fifo_m_result_push_valid,
  output logic [31:0] fifo_m_result_push_data,
  input logic [0:0] fifo_m_result_push_ready,

  /* Array: array_303d4[1 x b32] */
  output logic [0:0] array_array_303d4_w,
  output logic [0:0] array_array_303d4_widx,
  output logic [31:0] array_array_303d4_d,

  /* Array: array_303a7[1 x b5] */
  input logic [4:0] array_array_303a7_q,
  output logic [0:0] array_array_303a7_w,
  output logic [0:0] array_array_303a7_widx,
  output logic [4:0] array_array_303a7_d,

  /* Array: array_303b6[1 x b5] */
  input logic [4:0] array_array_303b6_q,

  /* Array: array_303c2[1 x b32] */
  input logic [31:0] array_array_303c2_q,

  // External FIFO m.mem_ext
  output logic [0:0] fifo_m_mem_ext_push_valid,
  output logic [1:0] fifo_m_mem_ext_push_data,
  input logic [0:0] fifo_m_mem_ext_push_ready,


  /* Array: array_3039b[1 x b32] */
  input logic [31:0] array_array_3039b_q,

  output logic [31:0] expose_var_1064,
  output logic [0:0] expose_var_1064_valid,
  output logic [0:0] expose_var_1302,
  output logic [0:0] expose_var_1302_valid,
  output logic [15:0] expose_var_1409,
  output logic [0:0] expose_var_1409_valid,
  output logic [0:0] expose_var_1376,
  output logic [0:0] expose_var_1376_valid,
  output logic [0:0] expose_var_1294,
  output logic [0:0] expose_var_1294_valid,
  output logic [4:0] expose_var_845,
  output logic [0:0] expose_var_845_valid,
  output logic [0:0] expose_var_494,
  output logic [0:0] expose_var_494_valid,
  output logic [0:0] var_494_exposed_o,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [96:0] var_222;
  assign var_222 = fifo_signals_pop_data;


  logic [4:0] var_226;
  assign var_226 = var_222[96:92];


  logic [4:0] var_232;
  assign var_232 = var_222[90:86];


  logic [4:0] var_238;
  assign var_238 = var_222[84:80];


  logic [31:0] var_242;
  assign var_242 = array_array_303ce_q[31:0];


  logic [4:0] var_469;
  assign var_469 = array_array_303a7_q[4:0];


  logic [0:0] var_248;
  assign var_248 = var_469 == var_226;


  logic [4:0] var_1470;
  assign var_1470 = array_array_303b3_q[4:0];


  logic [0:0] var_254;
  assign var_254 = var_1470 == var_226;


  logic [0:0] var_257;
  assign var_257 = var_248 | var_254;


  logic [0:0] var_1082;
  assign var_1082 = var_222[91:91];


  logic [0:0] var_265;
  assign var_265 = ~var_1082;


  logic [0:0] var_267;
  assign var_267 = var_257 | var_265;


  logic [31:0] var_1236;
  assign var_1236 = var_242 >> var_226;


  logic [31:0] var_273;
  assign var_273 = ~var_1236;


  logic [0:0] var_275;
  assign var_275 = var_273[0:0];


  logic [0:0] var_279;
  assign var_279 = var_267 | var_275;


  logic [4:0] var_1167;
  assign var_1167 = array_array_303b6_q[4:0];


  logic [0:0] var_285;
  assign var_285 = var_1167 == var_226;


  logic [0:0] var_288;
  assign var_288 = var_285;


  logic [0:0] var_290;
  assign var_290 = var_279 ? 1'd1 : var_288;


  logic [0:0] var_393;
  assign var_393 = ~var_279;


  logic [0:0] var_309;
  assign var_309 = ~var_1082;


  logic [31:0] var_314;
  assign var_314 = ~var_1236;


  logic [0:0] var_316;
  assign var_316 = var_314[0:0];


  always_ff @(posedge clk) if (1'b1 && (var_393))$display("%t\t[e]\t\texec_bypass_reg: x%02d | mem_bypass_reg: x%02d | ~signals.rs1_valid: %d | (~(on_write >> rs1))[0:0]: %d |",



  $time

, var_469, var_1470, var_309, var_316);

  logic [0:0] var_330;
  assign var_330 = var_469 == var_232;


  logic [0:0] var_336;
  assign var_336 = var_1470 == var_232;


  logic [0:0] var_339;
  assign var_339 = var_330 | var_336;


  logic [0:0] var_446;
  assign var_446 = var_222[85:85];


  logic [0:0] var_347;
  assign var_347 = ~var_446;


  logic [0:0] var_349;
  assign var_349 = var_339 | var_347;


  logic [31:0] var_1298;
  assign var_1298 = var_242 >> var_232;


  logic [31:0] var_355;
  assign var_355 = ~var_1298;


  logic [0:0] var_357;
  assign var_357 = var_355[0:0];


  logic [0:0] var_361;
  assign var_361 = var_349 | var_357;


  logic [0:0] var_367;
  assign var_367 = var_1167 == var_232;


  logic [0:0] var_370;
  assign var_370 = var_367;


  logic [0:0] var_372;
  assign var_372 = var_361 ? 1'd1 : var_370;


  logic [0:0] var_305;
  assign var_305 = ~var_361;


  logic [0:0] var_391;
  assign var_391 = ~var_446;


  logic [31:0] var_396;
  assign var_396 = ~var_1298;


  logic [0:0] var_398;
  assign var_398 = var_396[0:0];


  always_ff @(posedge clk) if (1'b1 && (var_305))$display("%t\t[e]\t\texec_bypass_reg: x%02d | mem_bypass_reg: x%02d | ~signals.rs2_valid: %d | (~(on_write >> rs2))[0:0]: %d |",



  $time

, var_469, var_1470, var_391, var_398);

  logic [0:0] var_412;
  assign var_412 = var_469 == var_238;


  logic [0:0] var_418;
  assign var_418 = var_1470 == var_238;


  logic [0:0] var_421;
  assign var_421 = var_412 | var_418;


  logic [0:0] var_1226;
  assign var_1226 = var_222[79:79];


  logic [0:0] var_429;
  assign var_429 = ~var_1226;


  logic [0:0] var_431;
  assign var_431 = var_421 | var_429;


  logic [31:0] var_1255;
  assign var_1255 = var_242 >> var_238;


  logic [31:0] var_437;
  assign var_437 = ~var_1255;


  logic [0:0] var_439;
  assign var_439 = var_437[0:0];


  logic [0:0] var_443;
  assign var_443 = var_431 | var_439;


  logic [0:0] var_449;
  assign var_449 = var_1167 == var_238;


  logic [0:0] var_452;
  assign var_452 = var_449;


  logic [0:0] var_454;
  assign var_454 = var_443 ? 1'd1 : var_452;


  logic [0:0] var_458;
  assign var_458 = ~var_443;


  logic [0:0] var_473;
  assign var_473 = ~var_1226;


  logic [31:0] var_478;
  assign var_478 = ~var_1255;


  logic [0:0] var_480;
  assign var_480 = var_478[0:0];


  always_ff @(posedge clk) if (1'b1 && (var_458))$display("%t\t[e]\t\texec_bypass_reg: x%02d | mem_bypass_reg: x%02d | ~signals.rd_valid: %d | (~(on_write >> rd))[0:0]: %d |",



  $time

, var_469, var_1470, var_473, var_480);

  logic [0:0] var_491;
  assign var_491 = var_290 & var_372;


  logic [0:0] var_494;
  assign var_494 = var_491 & var_454;
  assign expose_var_494 = var_494;
  assign expose_var_494_valid = executed && 1;

  assign var_494_exposed_o = var_494;

  logic [0:0] var_497;
  assign var_497 = ~var_494;


  logic [31:0] var_502;
  assign var_502 = fifo_fetch_addr_pop_data;


  always_ff @(posedge clk) if (1'b1 && (var_497))$display("%t\t[e]\t\tpc: 0x%08x   | rs1-x%02d: %d       | rs2-x%02d: %d   | rd-x%02d: %d | backlogged",



  $time

, var_502, var_226, var_279, var_232, var_361, var_238, var_443);

  logic executed;
  logic [31:0] var_1079;
  assign var_1079 = var_222[72:41];


  logic [11:0] var_523;
  assign var_523 = var_1079[11:0];


  logic [0:0] var_528;
  assign var_528 = var_523 == 12'd773;


  logic [3:0] var_533;
  assign var_533 = var_528 ? 4'd1 : 4'd0;


  logic [0:0] var_809;
  assign var_809 = var_222[74:74];


  logic [3:0] var_543;
  assign var_543 = var_809 ? 4'd2 : var_533;


  logic [11:0] var_551;
  assign var_551 = var_1079[11:0];


  logic [0:0] var_556;
  assign var_556 = var_551 == 12'd833;


  logic [3:0] var_559;
  assign var_559 = var_556 ? 4'd2 : var_543;


  logic [3:0] var_567;
  assign var_567 = var_809 ? 4'd2 : var_559;


  logic [11:0] var_575;
  assign var_575 = var_1079[11:0];


  logic [0:0] var_580;
  assign var_580 = var_575 == 12'd772;


  logic [3:0] var_584;
  assign var_584 = var_580 ? 4'd4 : var_567;


  logic [3:0] var_592;
  assign var_592 = var_809 ? 4'd2 : var_584;


  logic [11:0] var_600;
  assign var_600 = var_1079[11:0];


  logic [0:0] var_605;
  assign var_605 = var_600 == 12'd768;


  logic [3:0] var_609;
  assign var_609 = var_605 ? 4'd8 : var_592;


  logic [3:0] var_617;
  assign var_617 = var_809 ? 4'd2 : var_609;


  logic [11:0] var_625;
  assign var_625 = var_1079[11:0];


  logic [0:0] var_630;
  assign var_630 = var_625 == 12'd3860;


  logic [3:0] var_634;
  assign var_634 = var_630 ? 4'd9 : var_617;


  logic [3:0] var_642;
  assign var_642 = var_809 ? 4'd2 : var_634;


  logic [11:0] var_650;
  assign var_650 = var_1079[11:0];


  logic [0:0] var_655;
  assign var_655 = var_650 == 12'd384;


  logic [3:0] var_659;
  assign var_659 = var_655 ? 4'd10 : var_642;


  logic [3:0] var_667;
  assign var_667 = var_809 ? 4'd2 : var_659;


  logic [11:0] var_675;
  assign var_675 = var_1079[11:0];


  logic [0:0] var_680;
  assign var_680 = var_675 == 12'd944;


  logic [3:0] var_684;
  assign var_684 = var_680 ? 4'd11 : var_667;


  logic [3:0] var_692;
  assign var_692 = var_809 ? 4'd2 : var_684;


  logic [11:0] var_700;
  assign var_700 = var_1079[11:0];


  logic [0:0] var_705;
  assign var_705 = var_700 == 12'd928;


  logic [3:0] var_709;
  assign var_709 = var_705 ? 4'd12 : var_692;


  logic [3:0] var_717;
  assign var_717 = var_809 ? 4'd2 : var_709;


  logic [11:0] var_725;
  assign var_725 = var_1079[11:0];


  logic [0:0] var_730;
  assign var_730 = var_725 == 12'd770;


  logic [3:0] var_734;
  assign var_734 = var_730 ? 4'd13 : var_717;


  logic [3:0] var_742;
  assign var_742 = var_809 ? 4'd2 : var_734;


  logic [11:0] var_750;
  assign var_750 = var_1079[11:0];


  logic [0:0] var_755;
  assign var_755 = var_750 == 12'd771;


  logic [3:0] var_759;
  assign var_759 = var_755 ? 4'd14 : var_742;


  logic [3:0] var_767;
  assign var_767 = var_809 ? 4'd2 : var_759;


  logic [11:0] var_775;
  assign var_775 = var_1079[11:0];


  logic [0:0] var_780;
  assign var_780 = var_775 == 12'd1860;


  logic [3:0] var_784;
  assign var_784 = var_780 ? 4'd15 : var_767;


  logic [3:0] var_792;
  assign var_792 = var_809 ? 4'd2 : var_784;


  logic [0:0] var_797;
  assign var_797 = var_222[78:78];


  logic [0:0] var_1068;
  assign var_1068 = var_222[77:77];


  logic [0:0] var_806;
  assign var_806 = var_797 | var_1068;


  logic [31:0] var_1106;
  assign var_1106 = 31 == var_226 ? array_array_303aa_q[1023:992] : (30 == var_226 ? array_array_303aa_q[991:960] : (29 == var_226 ? array_array_303aa_q[959:928] : (28 == var_226 ? array_array_303aa_q[927:896] : (27 == var_226 ? array_array_303aa_q[895:864] : (26 == var_226 ? array_array_303aa_q[863:832] : (25 == var_226 ? array_array_303aa_q[831:800] : (24 == var_226 ? array_array_303aa_q[799:768] : (23 == var_226 ? array_array_303aa_q[767:736] : (22 == var_226 ? array_array_303aa_q[735:704] : (21 == var_226 ? array_array_303aa_q[703:672] : (20 == var_226 ? array_array_303aa_q[671:640] : (19 == var_226 ? array_array_303aa_q[639:608] : (18 == var_226 ? array_array_303aa_q[607:576] : (17 == var_226 ? array_array_303aa_q[575:544] : (16 == var_226 ? array_array_303aa_q[543:512] : (15 == var_226 ? array_array_303aa_q[511:480] : (14 == var_226 ? array_array_303aa_q[479:448] : (13 == var_226 ? array_array_303aa_q[447:416] : (12 == var_226 ? array_array_303aa_q[415:384] : (11 == var_226 ? array_array_303aa_q[383:352] : (10 == var_226 ? array_array_303aa_q[351:320] : (9 == var_226 ? array_array_303aa_q[319:288] : (8 == var_226 ? array_array_303aa_q[287:256] : (7 == var_226 ? array_array_303aa_q[255:224] : (6 == var_226 ? array_array_303aa_q[223:192] : (5 == var_226 ? array_array_303aa_q[191:160] : (4 == var_226 ? array_array_303aa_q[159:128] : (3 == var_226 ? array_array_303aa_q[127:96] : (2 == var_226 ? array_array_303aa_q[95:64] : (1 == var_226 ? array_array_303aa_q[63:32] : (0 == var_226 ? array_array_303aa_q[31:0] : ('x))))))))))))))))))))))))))))))));


  logic [31:0] var_816;
  assign var_816 = var_1068 ? var_1106 : 32'd0;


  logic [0:0] var_821;
  assign var_821 = var_222[75:75];


  logic [31:0] var_826;
  assign var_826 = {27'd0, var_226};


  logic [31:0] var_829;
  assign var_829 = var_821 ? var_826 : var_816;


  always_ff @(posedge clk) if (executed && (var_806))$display("%t\t[e]\t\tcsr_id: %d | new: %08x |",



  $time

, var_792, var_829);

  logic [96:0] var_841;
  assign var_841 = fifo_signals_pop_data;


  assign fifo_signals_pop_ready = executed;
  logic [31:0] var_843;
  assign var_843 = fifo_fetch_addr_pop_data;


  assign fifo_fetch_addr_pop_ready = executed;
  logic [4:0] var_845;
  assign var_845 = var_841[84:80];
  assign expose_var_845 = var_845;
  assign expose_var_845_valid = executed && 1;


  logic [0:0] var_849;
  assign var_849 = var_841[91:91];


  logic [0:0] var_5119;
  assign var_5119 = var_841[40:40];


  logic [0:0] var_858;
  assign var_858 = var_849 & var_5119;


  logic [31:0] var_1371;
  assign var_1371 = var_841[72:41];


  logic [0:0] var_866;
  assign var_866 = var_1371 == 32'd1;


  logic [0:0] var_873;
  assign var_873 = var_1371 == 32'd0;


  logic [0:0] var_876;
  assign var_876 = var_866 | var_873;


  logic [0:0] var_879;
  assign var_879 = var_858 & var_876;


  logic [15:0] var_963;
  assign var_963 = var_841[37:22];


  logic [0:0] var_889;
  assign var_889 = var_963 == 16'd32768;


  logic [0:0] var_892;
  assign var_892 = var_879 & var_889;


  always_ff @(posedge clk) if (executed && (var_892))$display("%t\t[e]\t\tebreak | halt | ecall",



  $time

);





  logic [0:0] var_387;
  assign var_387 = var_841[4:4];


  logic [0:0] var_1367;
  assign var_1367 = var_841[3:3];


  logic [0:0] var_912;
  assign var_912 = var_387 & var_1367;


  logic [0:0] var_919;
  assign var_919 = var_912 & var_5119;


  logic [0:0] var_926;
  assign var_926 = var_1371 == 32'd0;


  logic [0:0] var_929;
  assign var_929 = var_919 & var_926;


  logic [15:0] var_311;
  assign var_311 = var_841[21:6];


  logic [0:0] var_939;
  assign var_939 = var_311 == 16'd2048;


  logic [0:0] var_942;
  assign var_942 = var_929 & var_939;


  logic [0:0] var_950;
  assign var_950 = var_963 == 16'd1;


  logic [0:0] var_953;
  assign var_953 = var_942 & var_950;


  always_ff @(posedge clk) if (executed && (var_953))$display("%t\t[e]\t\ttrap",



  $time

);





  logic [0:0] var_969;
  assign var_969 = var_1470 == var_226;


  logic [31:0] var_771;
  assign var_771 = array_array_3039b_q[31:0];


  logic [31:0] var_975;
  assign var_975 = var_969 ? var_771 : var_1106;


  logic [0:0] var_982;
  assign var_982 = var_469 == var_226;


  logic [31:0] var_788;
  assign var_788 = array_array_303a4_q[31:0];


  logic [31:0] var_988;
  assign var_988 = var_982 ? var_788 : var_975;


  logic [0:0] var_992;
  assign var_992 = var_226 == 5'd0;


  logic [31:0] var_995;
  assign var_995 = var_992 ? 32'd0 : var_988;


  logic [0:0] var_1059;
  assign var_1059 = var_841[77:77];


  logic [31:0] var_1003;
  assign var_1003 = var_1059 ? 32'd0 : var_995;


  logic [31:0] var_475;
  assign var_475 = array_array_303c2_q[31:0];


  logic [31:0] var_1012;
  assign var_1012 = var_393 ? var_475 : var_1003;


  logic [31:0] var_1016;
  assign var_1016 = 31 == var_232 ? array_array_303aa_q[1023:992] : (30 == var_232 ? array_array_303aa_q[991:960] : (29 == var_232 ? array_array_303aa_q[959:928] : (28 == var_232 ? array_array_303aa_q[927:896] : (27 == var_232 ? array_array_303aa_q[895:864] : (26 == var_232 ? array_array_303aa_q[863:832] : (25 == var_232 ? array_array_303aa_q[831:800] : (24 == var_232 ? array_array_303aa_q[799:768] : (23 == var_232 ? array_array_303aa_q[767:736] : (22 == var_232 ? array_array_303aa_q[735:704] : (21 == var_232 ? array_array_303aa_q[703:672] : (20 == var_232 ? array_array_303aa_q[671:640] : (19 == var_232 ? array_array_303aa_q[639:608] : (18 == var_232 ? array_array_303aa_q[607:576] : (17 == var_232 ? array_array_303aa_q[575:544] : (16 == var_232 ? array_array_303aa_q[543:512] : (15 == var_232 ? array_array_303aa_q[511:480] : (14 == var_232 ? array_array_303aa_q[479:448] : (13 == var_232 ? array_array_303aa_q[447:416] : (12 == var_232 ? array_array_303aa_q[415:384] : (11 == var_232 ? array_array_303aa_q[383:352] : (10 == var_232 ? array_array_303aa_q[351:320] : (9 == var_232 ? array_array_303aa_q[319:288] : (8 == var_232 ? array_array_303aa_q[287:256] : (7 == var_232 ? array_array_303aa_q[255:224] : (6 == var_232 ? array_array_303aa_q[223:192] : (5 == var_232 ? array_array_303aa_q[191:160] : (4 == var_232 ? array_array_303aa_q[159:128] : (3 == var_232 ? array_array_303aa_q[127:96] : (2 == var_232 ? array_array_303aa_q[95:64] : (1 == var_232 ? array_array_303aa_q[63:32] : (0 == var_232 ? array_array_303aa_q[31:0] : ('x))))))))))))))))))))))))))))))));


  logic [0:0] var_1022;
  assign var_1022 = var_1470 == var_232;


  logic [31:0] var_1028;
  assign var_1028 = var_1022 ? var_771 : var_1016;


  logic [0:0] var_1035;
  assign var_1035 = var_469 == var_232;


  logic [31:0] var_1041;
  assign var_1041 = var_1035 ? var_788 : var_1028;


  logic [0:0] var_1045;
  assign var_1045 = var_232 == 5'd0;


  logic [31:0] var_1048;
  assign var_1048 = var_1045 ? 32'd0 : var_1041;


  logic [31:0] var_1052;
  assign var_1052 = 15 == var_792 ? array_array_303b0_q[511:480] : (14 == var_792 ? array_array_303b0_q[479:448] : (13 == var_792 ? array_array_303b0_q[447:416] : (12 == var_792 ? array_array_303b0_q[415:384] : (11 == var_792 ? array_array_303b0_q[383:352] : (10 == var_792 ? array_array_303b0_q[351:320] : (9 == var_792 ? array_array_303b0_q[319:288] : (8 == var_792 ? array_array_303b0_q[287:256] : (7 == var_792 ? array_array_303b0_q[255:224] : (6 == var_792 ? array_array_303b0_q[223:192] : (5 == var_792 ? array_array_303b0_q[191:160] : (4 == var_792 ? array_array_303b0_q[159:128] : (3 == var_792 ? array_array_303b0_q[127:96] : (2 == var_792 ? array_array_303b0_q[95:64] : (1 == var_792 ? array_array_303b0_q[63:32] : (0 == var_792 ? array_array_303b0_q[31:0] : ('x))))))))))))))));


  logic [31:0] var_1055;
  assign var_1055 = var_806 ? var_1052 : var_1048;


  logic [31:0] var_1064;
  assign var_1064 = var_305 ? var_475 : var_1055;
  assign expose_var_1064 = var_1064;
  assign expose_var_1064_valid = executed && 1;


  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\tmem_bypass.reg: x%02d | .data: %08x",



  $time

, var_1470, var_771);

  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\texe_bypass.reg: x%02d | .data: %08x",



  $time

, var_469, var_788);

  logic [0:0] var_1200;
  assign var_1200 = var_841[73:73];


  logic [0:0] var_1099;
  assign var_1099 = var_1367 | var_1200;


  logic [31:0] var_1102;
  assign var_1102 = var_1099 ? var_843 : var_1012;


  logic [31:0] var_1114;
  assign var_1114 = var_5119 ? var_1371 : var_1064;


  logic [31:0] var_1118;
  assign var_1118 = var_1102;


  logic [31:0] var_1120;
  assign var_1120 = var_1114;


  logic [31:0] var_1122;
  assign var_1122 = $signed(var_1118) + $signed(var_1120);


  logic [31:0] var_1125;
  assign var_1125 = var_1122;


  logic [31:0] var_1222;
  assign var_1222 = var_1012;


  logic [31:0] var_1071;
  assign var_1071 = var_1064;


  logic [0:0] var_1131;
  assign var_1131 = $signed(var_1222) < $signed(var_1071);


  logic [31:0] var_1134;
  assign var_1134 = var_1131 ? 32'd1 : 32'd0;


  logic [0:0] var_1138;
  assign var_1138 = var_1012 == var_1064;


  logic [31:0] var_1141;
  assign var_1141 = var_1138 ? 32'd1 : 32'd0;


  logic [0:0] var_1145;
  assign var_1145 = var_1012 < var_1064;


  logic [31:0] var_1148;
  assign var_1148 = var_1145 ? 32'd1 : 32'd0;


  logic [4:0] var_1007;
  assign var_1007 = var_1114[4:0];


  logic [4:0] var_1158;
  assign var_1158 = var_1007;


  logic [31:0] var_1160;
  assign var_1160 = $signed(var_1222) >>> $signed(var_1158);


  logic [31:0] var_1163;
  assign var_1163 = var_1160;


  logic [31:0] var_1169;
  assign var_1169 = $signed(var_1222) - $signed(var_1071);


  logic [31:0] var_1172;
  assign var_1172 = var_1169;


  logic [31:0] var_1174;
  assign var_1174 = var_1012 ^ var_1114;


  logic [31:0] var_1177;
  assign var_1177 = var_1012 | var_1064;


  logic [31:0] var_1180;
  assign var_1180 = var_1012 | var_1114;


  logic [31:0] var_1183;
  assign var_1183 = var_1012 & var_1114;


  logic [31:0] var_1190;
  assign var_1190 = var_1012 << var_1007;


  logic [31:0] var_1197;
  assign var_1197 = var_1012 >> var_1007;


  logic [31:0] var_1204;
  assign var_1204 = ({32{var_963[0] == 1'b1}} & var_1125) | ({32{var_963[1] == 1'b1}} & var_1172) | ({32{var_963[2] == 1'b1}} & var_1174) | ({32{var_963[3] == 1'b1}} & var_1177) | ({32{var_963[4] == 1'b1}} & var_1183) | ({32{var_963[5] == 1'b1}} & var_1190) | ({32{var_963[6] == 1'b1}} & 0) | ({32{var_963[7] == 1'b1}} & var_1163) | ({32{var_963[8] == 1'b1}} & var_1141) | ({32{var_963[9] == 1'b1}} & var_1134) | ({32{var_963[10] == 1'b1}} & var_1148) | ({32{var_963[11] == 1'b1}} & 1) | ({32{var_963[12] == 1'b1}} & var_1197) | ({32{var_963[13] == 1'b1}} & var_1180) | ({32{var_963[14] == 1'b1}} & 0) | ({32{var_963[15] == 1'b1}} & 0);


  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\tpc: 0x%08x   |is_offset_br: %d| is_pc_calc: %d|",



  $time

, var_843, var_1367, var_1200);

  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\t0x%08x       | a: %08x  | b: %08x   | imm: %08x | result: %08x",



  $time

, var_963, var_1012, var_1064, var_1371, var_1204);

  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\t0x%08x       |a.a:%08x  |a.b:%08x   | res: %08x |",



  $time

, var_963, var_1102, var_1114, var_1204);

  logic [31:0] var_1259;
  assign var_1259 = ({32{var_311[0] == 1'b1}} & var_1125) | ({32{var_311[1] == 1'b1}} & var_1172) | ({32{var_311[2] == 1'b1}} & var_1174) | ({32{var_311[3] == 1'b1}} & var_1177) | ({32{var_311[4] == 1'b1}} & var_1183) | ({32{var_311[5] == 1'b1}} & var_1190) | ({32{var_311[6] == 1'b1}} & 0) | ({32{var_311[7] == 1'b1}} & var_1163) | ({32{var_311[8] == 1'b1}} & var_1141) | ({32{var_311[9] == 1'b1}} & var_1134) | ({32{var_311[10] == 1'b1}} & var_1148) | ({32{var_311[11] == 1'b1}} & 1) | ({32{var_311[12] == 1'b1}} & var_1197) | ({32{var_311[13] == 1'b1}} & var_1180) | ({32{var_311[14] == 1'b1}} & 0) | ({32{var_311[15] == 1'b1}} & 0);


  logic [0:0] var_1278;
  assign var_1278 = var_841[5:5];


  logic [31:0] var_1282;
  assign var_1282 = ~var_1259;


  logic [31:0] var_1284;
  assign var_1284 = var_1278 ? var_1282 : var_1259;


  logic [1:0] var_1165;
  assign var_1165 = var_841[39:38];


  logic [0:0] var_1294;
  assign var_1294 = var_1165[0:0];
  assign expose_var_1294 = var_1294;
  assign expose_var_1294_valid = executed && 1;


  logic [0:0] var_1302;
  assign var_1302 = var_1165[1:1];
  assign expose_var_1302 = var_1302;
  assign expose_var_1302_valid = executed && 1;


  logic [0:0] var_1306;
  assign var_1306 = ~var_1294;


  logic [0:0] var_1193;
  assign var_1193 = var_845 != 5'd0;


  logic [0:0] var_1311;
  assign var_1311 = var_1306 & var_1193;


  logic [4:0] var_1314;
  assign var_1314 = var_1311 ? var_845 : 5'd0;


  logic [31:0] var_1322;
  assign var_1322 = var_1311 ? var_1204 : 32'd0;


  logic [31:0] var_1330;
  assign var_1330 = var_843;


  logic [31:0] var_1333;
  assign var_1333 = $signed(var_1330) + 32'd4;


  logic [31:0] var_1336;
  assign var_1336 = var_1333;


  logic [0:0] var_1459;
  assign var_1459 = var_1284[0:0];


  logic [31:0] var_1349;
  assign var_1349 = var_1459 ? var_1204 : var_1336;


  always_ff @(posedge clk) if (executed && (var_387))$display("%t\t[e]\t\tcondition: %d.a.b | a: %08x  | b: %08x   |",



  $time

, var_1459, var_1204, var_1336);

  logic [0:0] var_1376;
  assign var_1376 = var_387 ? var_1459 : 1'd0;
  assign expose_var_1376 = var_1376;
  assign expose_var_1376_valid = executed && 1;


  logic [0:0] var_1380;
  assign var_1380 = var_1294 | var_1302;


  logic [31:0] var_1383;
  assign var_1383 = var_1204;


  logic [31:0] var_1385;
  assign var_1385 = array_array_4dc17_q[31:0];


  logic [31:0] var_1388;
  assign var_1388 = var_1385;


  logic [31:0] var_1391;
  assign var_1391 = var_1380 ? var_1388 : 32'd0;


  logic [31:0] var_1395;
  assign var_1395 = var_1383 - var_1391;


  logic [31:0] var_1398;
  assign var_1398 = var_1395;


  logic [15:0] var_1402;
  assign var_1402 = var_1398[17:2];


  logic [15:0] var_1406;
  assign var_1406 = var_1402;


  logic [15:0] var_1409;
  assign var_1409 = var_1380 ? var_1406 : 16'd0;
  assign expose_var_1409 = var_1409;
  assign expose_var_1409_valid = executed && 1;


  always_ff @(posedge clk) if (executed && (var_1294))$display("%t\t[e]\t\tmem-read         | addr: 0x%05x| line: 0x%05x |",



  $time

, var_1204, var_1409);

  always_ff @(posedge clk) if (executed && (var_1302))$display("%t\t[e]\t\tmem-write        | addr: 0x%05x| line: 0x%05x | value: 0x%08x | wdada: 0x%08x",



  $time

, var_1204, var_1409, var_1012, var_1064);

  logic [0:0] var_1431;
  assign var_1431 = var_841[2:2];


  logic [31:0] var_1435;
  assign var_1435 = var_1431 ? var_1336 : var_1204;


  logic [1:0] var_1439;
  assign var_1439 = var_841[1:0];


  always_ff @(posedge clk) if (executed && (var_1193))$display("%t\t[e]\t\town x%02d          |",



  $time

, var_845);

  assign m_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_m_mem_ext_push_valid = executed;
  assign fifo_m_mem_ext_push_data = var_1439;

  assign fifo_m_rd_push_valid = executed;
  assign fifo_m_rd_push_data = var_845;

  assign fifo_m_result_push_valid = executed;
  assign fifo_m_result_push_data = var_1435;

  // Gather Array writes
  assign array_array_303b0_w = (executed) && (((var_1059)));
    assign array_array_303b0_d = ({ 32 { (var_1059) } } & var_829);
    assign array_array_303b0_widx = ({ 4 { (var_1059) } } & var_792);

    assign array_array_303a7_w = executed;
    assign array_array_303a7_d = var_1314;
    assign array_array_303a7_widx = 1'd0;

    assign array_array_303d4_w = (executed) && (((var_387)));
    assign array_array_303d4_d = ({ 32 { (var_387) } } & var_1349);
    assign array_array_303d4_widx = ({ 1 { (var_387) } } & 1'd0);

    assign array_array_303a4_w = executed;
    assign array_array_303a4_d = var_1322;
    assign array_array_303a4_widx = 1'd0;

    assign executed = counter_pop_valid && (var_494);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // e


module w (
  input logic clk,
  input logic rst_n,
  // Port FIFO rd
  input logic [0:0] fifo_rd_pop_valid,
  input logic [4:0] fifo_rd_pop_data,
  output logic [0:0] fifo_rd_pop_ready,
  // Port FIFO mdata
  input logic [0:0] fifo_mdata_pop_valid,
  input logic [31:0] fifo_mdata_pop_data,
  output logic [0:0] fifo_mdata_pop_ready,
  /* Array: array_303aa[32 x b32] */
  output logic [0:0] array_array_303aa_w,
  output logic [4:0] array_array_303aa_widx,
  output logic [31:0] array_array_303aa_d,

  output logic [4:0] expose_var_80,
  output logic [0:0] expose_var_80_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [4:0] var_80;
  assign var_80 = fifo_rd_pop_data;
  assign expose_var_80 = var_80;
  assign expose_var_80_valid = executed && 1;


  assign fifo_rd_pop_ready = executed;
  logic [31:0] var_82;
  assign var_82 = fifo_mdata_pop_data;


  assign fifo_mdata_pop_ready = executed;
  logic [0:0] var_85;
  assign var_85 = var_80 != 5'd0;


  always_ff @(posedge clk) if (executed && (var_85))$display("%t\t[w]\t\twriteback        | x%02d          | 0x%08x",



  $time

, var_80, var_82);

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_303aa_w = (executed) && (((var_85)));
    assign array_array_303aa_d = ({ 32 { (var_85) } } & var_82);
    assign array_array_303aa_widx = ({ 5 { (var_85) } } & var_80);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // w


module f (
  input logic clk,
  input logic rst_n,
  /* Array: array_30398[1 x b32] */
  input logic [31:0] array_array_30398_q,

  output logic [31:0] expose_var_77,
  output logic [0:0] expose_var_77_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_77;
  assign var_77 = array_array_30398_q[31:0];
  assign expose_var_77 = var_77;
  assign expose_var_77_valid = executed && 1;


  // Gather FIFO pushes
  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // f


module icache (
  input logic clk,
  input logic rst_n,
  /* Array: array_3e6a8[65536 x b32] */
  /* /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/minor-cpu/src/.workspace//workload.exe */



  // External FIFO d.rdata
  output logic [0:0] fifo_d_rdata_push_valid,
  output logic [31:0] fifo_d_rdata_push_data,
  input logic [0:0] fifo_d_rdata_push_ready,

  // Declare upstream executed signals
  input logic [0:0] F1_executed,
  input logic [0:0] var_4953,
  input logic [0:0] var_4953_valid,
  input logic [15:0] var_4982,
  input logic [0:0] var_4982_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_5067;
  assign var_5067 = dataout;
  // Gather FIFO pushes
  assign fifo_d_rdata_push_valid = (executed) && (((var_4953)));
  assign fifo_d_rdata_push_data = ({ 32 { (var_4953) } } & var_5067);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_3e6a8_w;
  logic [31:0] array_array_3e6a8_d;
  logic [15:0] array_array_3e6a8_widx;
  assign array_array_3e6a8_w = (executed) && (((1'd0)));
  assign array_array_3e6a8_d = ({ 32 { (1'd0) } } & 32'd0);
  assign array_array_3e6a8_widx = var_4982;


  memory_blackbox_array_3e6a8 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(16)     
    ) memory_blackbox_array_3e6a8(
    .clk     (clk), 
    .address (array_array_3e6a8_widx), 
    .wd      (array_array_3e6a8_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_3e6a8_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = F1_executed;
  assign expose_executed = executed;
endmodule // icache




(* blackbox *)

module memory_blackbox_array_3e6a8 #(
    parameter DATA_WIDTH = 32,   
    parameter ADDR_WIDTH = 16 
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
              
module driver (
  input logic clk,
  input logic rst_n,
  // Module memuser_30344
  output logic [7:0] memuser_30344_counter_delta,
  input logic [0:0] memuser_30344_counter_delta_ready,

  // Module f
  output logic [7:0] f_counter_delta,
  input logic [0:0] f_counter_delta_ready,

  /* Array: array_3e7ce[1 x u1] */
  input logic [0:0] array_array_3e7ce_q,
  output logic [0:0] array_array_3e7ce_w,
  output logic [0:0] array_array_3e7ce_widx,
  output logic [0:0] array_array_3e7ce_d,


  output logic [0:0] expose_var_4805,
  output logic [0:0] expose_var_4805_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_1061;
  assign var_1061 = array_array_3e7ce_q[0:0];


  logic [0:0] var_4805;
  assign var_4805 = var_1061;
  assign expose_var_4805 = var_4805;
  assign expose_var_4805_valid = executed && 1;


  logic [0:0] var_4810;
  assign var_4810 = var_1061 == 1'd1;


  logic [0:0] var_4827;
  assign var_4827 = var_1061 == 1'd0;


  assign f_counter_delta = executed ? { 7'b0, |(var_4827) } : 0;

  assign memuser_30344_counter_delta = executed ? { 7'b0, |(var_4810) } : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_3e7ce_w = (executed) && (((var_4810)));
    assign array_array_3e7ce_d = ({ 1 { (var_4810) } } & 1'd0);
    assign array_array_3e7ce_widx = ({ 1 { (var_4810) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver


module F1 (
  input logic clk,
  input logic rst_n,

  /* Array: array_303da[1 x b1] */
  input logic [0:0] array_array_303da_q,
  output logic [0:0] array_array_303da_w,
  output logic [0:0] array_array_303da_widx,
  output logic [0:0] array_array_303da_d,

  /* Array: array_36ebd[1 x i8] */
  input logic [7:0] array_array_36ebd_q,
  output logic [0:0] array_array_36ebd_w,
  output logic [0:0] array_array_36ebd_widx,
  output logic [7:0] array_array_36ebd_d,

  // Module d
  output logic [7:0] d_counter_delta,
  input logic [0:0] d_counter_delta_ready,

  /* Array: array_30398[1 x b32] */
  output logic [0:0] array_array_30398_w,
  output logic [0:0] array_array_30398_widx,
  output logic [31:0] array_array_30398_d,

  /* Array: array_303e0[1 x b1] */
  input logic [0:0] array_array_303e0_q,
  output logic [0:0] array_array_303e0_w,
  output logic [0:0] array_array_303e0_widx,
  output logic [0:0] array_array_303e0_d,


  /* Array: array_303d4[1 x b32] */
  input logic [31:0] array_array_303d4_q,



  // External FIFO d.fetch_addr
  output logic [0:0] fifo_d_fetch_addr_push_valid,
  output logic [31:0] fifo_d_fetch_addr_push_data,
  input logic [0:0] fifo_d_fetch_addr_push_ready,

  /* Array: array_36e75[1 x b1] */
  input logic [0:0] array_array_36e75_q,
  output logic [0:0] array_array_36e75_w,
  output logic [0:0] array_array_36e75_widx,
  output logic [0:0] array_array_36e75_d,

  /* Array: array_303e6[1 x b1] */
  input logic [0:0] array_array_303e6_q,
  output logic [0:0] array_array_303e6_w,
  output logic [0:0] array_array_303e6_widx,
  output logic [0:0] array_array_303e6_d,


  // Declare upstream executed signals
  input logic [0:0] e_executed,
  input logic [0:0] f_executed,
  input logic [0:0] d_executed,
  output logic [15:0] expose_var_4982,
  output logic [0:0] expose_var_4982_valid,
  output logic [0:0] expose_var_4953,
  output logic [0:0] expose_var_4953_valid,
  input logic [31:0] var_77,
  input logic [0:0] var_77_valid,
  input logic [0:0] var_494,
  input logic [0:0] var_494_valid,
  input logic [0:0] var_4798,
  input logic [0:0] var_4798_valid,
  input logic [0:0] var_1376,
  input logic [0:0] var_1376_valid,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_4837;
  assign var_4837 = var_4798_valid;


  logic [0:0] var_4839;
  assign var_4839 = var_4837 ? var_4798 : 1'd0;


  logic [0:0] var_4847;
  assign var_4847 = var_1376_valid;


  logic [0:0] var_4849;
  assign var_4849 = var_4847 ? var_1376 : 1'd0;


  logic [0:0] var_4965;
  assign var_4965 = array_array_303da_q[0:0];


  logic [0:0] var_4860;
  assign var_4860 = ~var_4965;


  logic [0:0] var_4908;
  assign var_4908 = array_array_303e6_q[0:0];


  logic [0:0] var_4956;
  assign var_4956 = var_494_valid;


  logic [0:0] var_4874;
  assign var_4874 = var_4956 ? var_494 : 1'd0;


  logic [0:0] var_4878;
  assign var_4878 = var_4874 ? 1'd1 : 1'd0;


  logic [0:0] var_4959;
  assign var_4959 = array_array_36e75_q[0:0];


  logic [0:0] var_4889;
  assign var_4889 = ~var_4959;


  logic [0:0] var_4898;
  assign var_4898 = ~var_4839;


  logic [0:0] var_4903;
  assign var_4903 = ~var_4908;


  logic [0:0] var_4905;
  assign var_4905 = var_4898 & var_4903;


  logic [0:0] var_4911;
  assign var_4911 = var_4905 & var_4959;


  logic [0:0] var_4917;
  assign var_4917 = array_array_303e0_q[0:0];


  logic [0:0] var_4920;
  assign var_4920 = var_4965 & var_4917;


  logic [7:0] var_4824;
  assign var_4824 = array_array_36ebd_q[7:0];


  logic [0:0] var_4928;
  assign var_4928 = var_4956 ? var_494 : 1'd0;


  logic [7:0] var_4933;
  assign var_4933 = var_4928 ? 8'd1 : 8'd0;


  logic [7:0] var_4937;
  assign var_4937 = $signed(var_4824) - $signed(var_4933);


  logic [31:0] var_4984;
  assign var_4984 = array_array_303d4_q[31:0];


  logic [31:0] var_4943;
  assign var_4943 = var_4984;


  logic [31:0] var_4945;
  assign var_4945 = var_4920 ? var_4943 : var_77;


  logic [0:0] var_4950;
  assign var_4950 = $signed(var_4937) < 8'd3;


  logic [0:0] var_4953;
  assign var_4953 = var_4911 & var_4950;
  assign expose_var_4953 = var_4953;
  assign expose_var_4953_valid = executed && 1;


  always_ff @(posedge clk) if (executed)$display("%t\t[F1]\t\ton_br: %d         | br_sm: %d     | br_jump: %d      | fetch: %d      | ex_bypass: 0x%05x | ongoing: %d | jump_flag: %d",



  $time

, var_4839, var_4908, var_4965, var_4911, var_4984, var_4824, var_4920);

  logic [15:0] var_4978;
  assign var_4978 = var_4945[17:2];


  logic [15:0] var_4982;
  assign var_4982 = var_4978;
  assign expose_var_4982 = var_4982;
  assign expose_var_4982_valid = executed && 1;


  logic [0:0] var_4986;
  assign var_4986 = var_4956 ? var_494 : 1'd0;


  always_ff @(posedge clk) if (executed)$display("%t\t[F1]\t\ton_br: %d         | de_by: %d     | fetch: %d      | addr: 0x%05x | new_cnt: %d",



  $time

, var_4839, var_4986, var_4953, var_4945, var_4937);

  logic [31:0] var_5009;
  assign var_5009 = var_4945;


  logic [31:0] var_5011;
  assign var_5011 = $signed(var_5009) + 32'd4;


  logic [31:0] var_5014;
  assign var_5014 = var_5011;


  logic [7:0] var_5020;
  assign var_5020 = $signed(var_4937) + 8'd1;


  logic [0:0] var_5027;
  assign var_5027 = ~var_4953;


  assign d_counter_delta = executed ? { 7'b0, |(var_4953) } : 0;

  // Gather FIFO pushes
  assign fifo_d_fetch_addr_push_valid = (executed) && (((var_4953)));
  assign fifo_d_fetch_addr_push_data = ({ 32 { (var_4953) } } & var_4945);

  // Gather Array writes
  assign array_array_36e75_w = (executed) && (((var_4908)) || ((var_4889)));
    assign array_array_36e75_d = ({ 1 { (var_4908) } } & var_4878) | ({ 1 { (var_4889) } } & 1'd1);
    assign array_array_36e75_widx = ({ 1 { (var_4908) } } & 1'd0) | ({ 1 { (var_4889) } } & 1'd0);

    assign array_array_36ebd_w = (executed) && (((var_4953)) || ((var_5027)));
    assign array_array_36ebd_d = ({ 8 { (var_4953) } } & var_5020) | ({ 8 { (var_5027) } } & var_4937);
    assign array_array_36ebd_widx = ({ 1 { (var_4953) } } & 1'd0) | ({ 1 { (var_5027) } } & 1'd0);

    assign array_array_303e6_w = executed;
    assign array_array_303e6_d = var_4839;
    assign array_array_303e6_widx = 1'd0;

    assign array_array_30398_w = (executed) && (((var_4953)) || ((var_5027)));
    assign array_array_30398_d = ({ 32 { (var_4953) } } & var_5014) | ({ 32 { (var_5027) } } & var_4945);
    assign array_array_30398_widx = ({ 1 { (var_4953) } } & 1'd0) | ({ 1 { (var_5027) } } & 1'd0);

    assign array_array_303da_w = executed;
    assign array_array_303da_d = var_4849;
    assign array_array_303da_widx = 1'd0;

    assign array_array_303e0_w = executed;
    assign array_array_303e0_d = var_4860;
    assign array_array_303e0_widx = 1'd0;

    assign executed = f_executed || e_executed || d_executed;
  assign expose_executed = executed;
endmodule // F1


module init_cache (
  input logic clk,
  input logic rst_n,

  // External FIFO memuser_30344.rdata
  output logic [0:0] fifo_memuser_30344_rdata_push_valid,
  output logic [31:0] fifo_memuser_30344_rdata_push_data,
  input logic [0:0] fifo_memuser_30344_rdata_push_ready,

  /* Array: array_3e7da[32 x b32] */
  /* /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/minor-cpu/src/.workspace//workload.init */

  // Declare upstream executed signals
  input logic [0:0] driver_executed,
  input logic [0:0] var_4805,
  input logic [0:0] var_4805_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_5138;
  assign var_5138 = dataout;
  // Gather FIFO pushes
  assign fifo_memuser_30344_rdata_push_valid = (executed) && (((var_4805)));
  assign fifo_memuser_30344_rdata_push_data = ({ 32 { (var_4805) } } & var_5138);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_3e7da_w;
  logic [31:0] array_array_3e7da_d;
  logic [4:0] array_array_3e7da_widx;
  assign array_array_3e7da_w = (executed) && (((1'd0)));
  assign array_array_3e7da_d = ({ 32 { (1'd0) } } & 32'd0);
  assign array_array_3e7da_widx = 5'd0;


  memory_blackbox_array_3e7da #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(5)     
    ) memory_blackbox_array_3e7da(
    .clk     (clk), 
    .address (array_array_3e7da_widx), 
    .wd      (array_array_3e7da_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_3e7da_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = driver_executed;
  assign expose_executed = executed;
endmodule // init_cache




(* blackbox *)

module memory_blackbox_array_3e7da #(
    parameter DATA_WIDTH = 32,   
    parameter ADDR_WIDTH = 5 
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
              
module d (
  input logic clk,
  input logic rst_n,
  // Port FIFO fetch_addr
  input logic [0:0] fifo_fetch_addr_pop_valid,
  input logic [31:0] fifo_fetch_addr_pop_data,
  output logic [0:0] fifo_fetch_addr_pop_ready,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  // External FIFO e.fetch_addr
  output logic [0:0] fifo_e_fetch_addr_push_valid,
  output logic [31:0] fifo_e_fetch_addr_push_data,
  input logic [0:0] fifo_e_fetch_addr_push_ready,

  // External FIFO e.signals
  output logic [0:0] fifo_e_signals_push_valid,
  output logic [96:0] fifo_e_signals_push_data,
  input logic [0:0] fifo_e_signals_push_ready,

  // Module e
  output logic [7:0] e_counter_delta,
  input logic [0:0] e_counter_delta_ready,

  output logic [0:0] expose_var_4798,
  output logic [0:0] expose_var_4798_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_1480;
  assign var_1480 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [31:0] var_1482;
  assign var_1482 = fifo_fetch_addr_pop_data;


  assign fifo_fetch_addr_pop_ready = executed;
  always_ff @(posedge clk) if (executed)$display("%t\t[d]\t\traw: 0x%08x  | addr: 0x%05x |",



  $time

, var_1480, var_1482);

  logic [6:0] var_4556;
  assign var_4556 = var_1480[6:0];


  logic [0:0] var_1494;
  assign var_1494 = var_4556 == 7'd111;


  logic [0:0] var_2014;
  assign var_2014 = 1'd0 | var_1494;


  logic [15:0] var_1504;
  assign var_1504 = var_1494 ? 16'd1 : 16'd0;


  logic [15:0] var_1508;
  assign var_1508 = 16'd0 | var_1504;


  logic [15:0] var_1511;
  assign var_1511 = var_1494 ? 16'd2048 : 16'd0;


  logic [15:0] var_1515;
  assign var_1515 = 16'd0 | var_1511;


  logic [0:0] var_1518;
  assign var_1518 = var_1494 ? 1'd0 : 1'd0;


  logic [0:0] var_1522;
  assign var_1522 = 1'd0 | var_1518;


  logic [4:0] var_3991;
  assign var_3991 = var_1480[11:7];


  logic [0:0] var_1675;
  assign var_1675 = var_1480[31:31];


  logic [7:0] var_4495;
  assign var_4495 = var_1480[19:12];


  logic [0:0] var_4604;
  assign var_4604 = var_1480[20:20];


  logic [9:0] var_1529;
  assign var_1529 = var_1480[30:21];


  logic [8:0] var_1553;
  assign var_1553 = {var_1675, var_4495};


  logic [9:0] var_1556;
  assign var_1556 = {var_1553, var_4604};


  logic [19:0] var_1559;
  assign var_1559 = {var_1556, var_1529};


  logic [20:0] var_1562;
  assign var_1562 = {var_1559, 1'd0};


  always_ff @(posedge clk) if (executed && (var_1494))$display("%t\t[d]\t\tj.jal.1101111    | rd: x%02d      |               |               |imm: 0x%x",



  $time

, var_3991, var_1562);

  logic [0:0] var_1578;
  assign var_1578 = var_4556 == 7'd55;


  logic [0:0] var_1581;
  assign var_1581 = 1'd0 | var_1578;


  logic [0:0] var_1584;
  assign var_1584 = var_2014 | var_1578;


  logic [15:0] var_4600;
  assign var_4600 = var_1578 ? 16'd1 : 16'd0;


  logic [15:0] var_1591;
  assign var_1591 = var_1508 | var_4600;


  logic [15:0] var_1598;
  assign var_1598 = var_1515 | var_4600;


  logic [0:0] var_1601;
  assign var_1601 = var_1578 ? 1'd0 : 1'd0;


  logic [0:0] var_1605;
  assign var_1605 = var_1522 | var_1601;


  logic [0:0] var_1612;
  assign var_1612 = var_2014 | var_1578;


  logic [19:0] var_4649;
  assign var_4649 = var_1480[31:12];


  always_ff @(posedge clk) if (executed && (var_1578))$display("%t\t[d]\t\tu.lui.0110111    | rd: x%02d      |               |               |imm: 0x%x",



  $time

, var_3991, var_4649);

  logic [0:0] var_1632;
  assign var_1632 = var_4556 == 7'd51;


  logic [2:0] var_4548;
  assign var_4548 = var_1480[14:12];


  logic [0:0] var_1641;
  assign var_1641 = var_4548 == 3'd0;


  logic [6:0] var_2171;
  assign var_2171 = var_1480[31:25];


  logic [0:0] var_1650;
  assign var_1650 = var_2171 == 7'd0;


  logic [0:0] var_1653;
  assign var_1653 = var_1632 & var_1641;


  logic [0:0] var_1656;
  assign var_1656 = var_1653 & var_1650;


  logic [0:0] var_1659;
  assign var_1659 = var_1656 & 1'd1;


  logic [0:0] var_4962;
  assign var_4962 = 1'd0 | var_1659;


  logic [0:0] var_1665;
  assign var_1665 = var_1584 | var_1659;


  logic [15:0] var_4552;
  assign var_4552 = var_1659 ? 16'd1 : 16'd0;


  logic [15:0] var_1672;
  assign var_1672 = var_1591 | var_4552;


  logic [15:0] var_1679;
  assign var_1679 = var_1598 | var_4552;


  logic [0:0] var_1682;
  assign var_1682 = var_1659 ? 1'd0 : 1'd0;


  logic [0:0] var_1686;
  assign var_1686 = var_1605 | var_1682;


  logic [0:0] var_1693;
  assign var_1693 = var_1612 | var_1659;


  logic [4:0] var_4713;
  assign var_4713 = var_1480[19:15];


  logic [4:0] var_1594;
  assign var_1594 = var_1480[24:20];


  always_ff @(posedge clk) if (executed && (var_1659))$display("%t\t[d]\t\tr.add.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_1725;
  assign var_1725 = var_4556 == 7'd51;


  logic [0:0] var_1732;
  assign var_1732 = var_4548 == 3'd0;


  logic [0:0] var_1740;
  assign var_1740 = var_2171 == 7'd32;


  logic [0:0] var_1743;
  assign var_1743 = var_1725 & var_1732;


  logic [0:0] var_1746;
  assign var_1746 = var_1743 & var_1740;


  logic [0:0] var_1749;
  assign var_1749 = var_1746 & 1'd1;


  logic [0:0] var_1752;
  assign var_1752 = var_4962 | var_1749;


  logic [0:0] var_1755;
  assign var_1755 = var_1665 | var_1749;


  logic [15:0] var_1759;
  assign var_1759 = var_1749 ? 16'd2 : 16'd0;


  logic [15:0] var_1763;
  assign var_1763 = var_1672 | var_1759;


  logic [15:0] var_1766;
  assign var_1766 = var_1749 ? 16'd1 : 16'd0;


  logic [15:0] var_1770;
  assign var_1770 = var_1679 | var_1766;


  logic [0:0] var_1773;
  assign var_1773 = var_1749 ? 1'd0 : 1'd0;


  logic [0:0] var_1777;
  assign var_1777 = var_1686 | var_1773;


  logic [0:0] var_1784;
  assign var_1784 = var_1693 | var_1749;


  logic [0:0] var_1791;
  assign var_1791 = var_4962 | var_1749;


  logic [0:0] var_1798;
  assign var_1798 = var_4962 | var_1749;


  always_ff @(posedge clk) if (executed && (var_1749))$display("%t\t[d]\t\tr.sub.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_1814;
  assign var_1814 = var_4556 == 7'd51;


  logic [0:0] var_1822;
  assign var_1822 = var_4548 == 3'd6;


  logic [0:0] var_1829;
  assign var_1829 = var_2171 == 7'd0;


  logic [0:0] var_1832;
  assign var_1832 = var_1814 & var_1822;


  logic [0:0] var_1835;
  assign var_1835 = var_1832 & var_1829;


  logic [0:0] var_1838;
  assign var_1838 = var_1835 & 1'd1;


  logic [0:0] var_1841;
  assign var_1841 = var_1752 | var_1838;


  logic [0:0] var_1844;
  assign var_1844 = var_1755 | var_1838;


  logic [15:0] var_1848;
  assign var_1848 = var_1838 ? 16'd8 : 16'd0;


  logic [15:0] var_1852;
  assign var_1852 = var_1763 | var_1848;


  logic [15:0] var_1855;
  assign var_1855 = var_1838 ? 16'd1 : 16'd0;


  logic [15:0] var_1859;
  assign var_1859 = var_1770 | var_1855;


  logic [0:0] var_1862;
  assign var_1862 = var_1838 ? 1'd0 : 1'd0;


  logic [0:0] var_1866;
  assign var_1866 = var_1777 | var_1862;


  logic [0:0] var_1873;
  assign var_1873 = var_1784 | var_1838;


  logic [0:0] var_1880;
  assign var_1880 = var_1791 | var_1838;


  logic [0:0] var_1887;
  assign var_1887 = var_1798 | var_1838;


  always_ff @(posedge clk) if (executed && (var_1838))$display("%t\t[d]\t\tr.or.0110011     | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_1904;
  assign var_1904 = var_4556 == 7'd103;


  logic [0:0] var_1911;
  assign var_1911 = var_4548 == 3'd0;


  logic [0:0] var_1914;
  assign var_1914 = var_1904 & var_1911;


  logic [0:0] var_1917;
  assign var_1917 = var_1914 & 1'd1;


  logic [0:0] var_1920;
  assign var_1920 = var_1917 & 1'd1;


  logic [0:0] var_1923;
  assign var_1923 = 1'd0 | var_1920;


  logic [0:0] var_1926;
  assign var_1926 = var_1844 | var_1920;


  logic [15:0] var_1929;
  assign var_1929 = var_1920 ? 16'd1 : 16'd0;


  logic [15:0] var_1933;
  assign var_1933 = var_1852 | var_1929;


  logic [15:0] var_1936;
  assign var_1936 = var_1920 ? 16'd2048 : 16'd0;


  logic [15:0] var_1940;
  assign var_1940 = var_1859 | var_1936;


  logic [0:0] var_1943;
  assign var_1943 = var_1920 ? 1'd0 : 1'd0;


  logic [0:0] var_1947;
  assign var_1947 = var_1866 | var_1943;


  logic [0:0] var_1954;
  assign var_1954 = var_1873 | var_1920;


  logic [0:0] var_1961;
  assign var_1961 = var_1880 | var_1920;


  logic [11:0] var_4705;
  assign var_4705 = var_1480[31:20];


  always_ff @(posedge clk) if (executed && (var_1920))$display("%t\t[d]\t\ti.jalr.1100111   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_1982;
  assign var_1982 = var_4556 == 7'd19;


  logic [0:0] var_1989;
  assign var_1989 = var_4548 == 3'd0;


  logic [0:0] var_1992;
  assign var_1992 = var_1982 & var_1989;


  logic [0:0] var_1995;
  assign var_1995 = var_1992 & 1'd1;


  logic [0:0] var_1998;
  assign var_1998 = var_1995 & 1'd1;


  logic [0:0] var_2001;
  assign var_2001 = var_1923 | var_1998;


  logic [0:0] var_2004;
  assign var_2004 = var_1926 | var_1998;


  logic [15:0] var_4503;
  assign var_4503 = var_1998 ? 16'd1 : 16'd0;


  logic [15:0] var_2011;
  assign var_2011 = var_1933 | var_4503;


  logic [15:0] var_2018;
  assign var_2018 = var_1940 | var_4503;


  logic [0:0] var_2021;
  assign var_2021 = var_1998 ? 1'd0 : 1'd0;


  logic [0:0] var_2025;
  assign var_2025 = var_1947 | var_2021;


  logic [0:0] var_2032;
  assign var_2032 = var_1954 | var_1998;


  logic [0:0] var_2039;
  assign var_2039 = var_1961 | var_1998;


  always_ff @(posedge clk) if (executed && (var_1998))$display("%t\t[d]\t\ti.addi.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_2060;
  assign var_2060 = var_4556 == 7'd3;


  logic [0:0] var_2068;
  assign var_2068 = var_4548 == 3'd2;


  logic [0:0] var_2071;
  assign var_2071 = var_2060 & var_2068;


  logic [0:0] var_2074;
  assign var_2074 = var_2071 & 1'd1;


  logic [0:0] var_2077;
  assign var_2077 = var_2074 & 1'd1;


  logic [0:0] var_2080;
  assign var_2080 = var_2001 | var_2077;


  logic [0:0] var_2083;
  assign var_2083 = var_2004 | var_2077;


  logic [15:0] var_4682;
  assign var_4682 = var_2077 ? 16'd1 : 16'd0;


  logic [15:0] var_2090;
  assign var_2090 = var_2011 | var_4682;


  logic [15:0] var_2097;
  assign var_2097 = var_2018 | var_4682;


  logic [0:0] var_2100;
  assign var_2100 = var_2077 ? 1'd0 : 1'd0;


  logic [0:0] var_2104;
  assign var_2104 = var_2025 | var_2100;


  logic [0:0] var_2111;
  assign var_2111 = var_2032 | var_2077;


  logic [0:0] var_2118;
  assign var_2118 = var_2039 | var_2077;


  always_ff @(posedge clk) if (executed && (var_2077))$display("%t\t[d]\t\ti.lw.0000011     | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_2138;
  assign var_2138 = var_4556 == 7'd3;


  logic [0:0] var_2146;
  assign var_2146 = var_4548 == 3'd4;


  logic [0:0] var_2149;
  assign var_2149 = var_2138 & var_2146;


  logic [0:0] var_2152;
  assign var_2152 = var_2149 & 1'd1;


  logic [0:0] var_2155;
  assign var_2155 = var_2152 & 1'd1;


  logic [0:0] var_2158;
  assign var_2158 = var_2080 | var_2155;


  logic [0:0] var_2161;
  assign var_2161 = var_2083 | var_2155;


  logic [15:0] var_2093;
  assign var_2093 = var_2155 ? 16'd1 : 16'd0;


  logic [15:0] var_2168;
  assign var_2168 = var_2090 | var_2093;


  logic [15:0] var_2175;
  assign var_2175 = var_2097 | var_2093;


  logic [0:0] var_2178;
  assign var_2178 = var_2155 ? 1'd0 : 1'd0;


  logic [0:0] var_2182;
  assign var_2182 = var_2104 | var_2178;


  logic [0:0] var_2189;
  assign var_2189 = var_2111 | var_2155;


  logic [0:0] var_2196;
  assign var_2196 = var_2118 | var_2155;


  always_ff @(posedge clk) if (executed && (var_2155))$display("%t\t[d]\t\ti.lbu.0000011    | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_2217;
  assign var_2217 = var_4556 == 7'd115;


  logic [0:0] var_2224;
  assign var_2224 = var_4548 == 3'd0;


  logic [0:0] var_2232;
  assign var_2232 = var_4705 == 12'd1;


  logic [0:0] var_2235;
  assign var_2235 = var_2217 & var_2224;


  logic [0:0] var_2238;
  assign var_2238 = var_2235 & var_2232;


  logic [0:0] var_2241;
  assign var_2241 = var_2238 & 1'd1;


  logic [0:0] var_2244;
  assign var_2244 = var_2158 | var_2241;


  logic [0:0] var_2247;
  assign var_2247 = var_2161 | var_2241;


  logic [15:0] var_2250;
  assign var_2250 = var_2241 ? 16'd32768 : 16'd0;


  logic [15:0] var_2254;
  assign var_2254 = var_2168 | var_2250;


  logic [15:0] var_2257;
  assign var_2257 = var_2241 ? 16'd1 : 16'd0;


  logic [15:0] var_2261;
  assign var_2261 = var_2175 | var_2257;


  logic [0:0] var_2264;
  assign var_2264 = var_2241 ? 1'd0 : 1'd0;


  logic [0:0] var_2268;
  assign var_2268 = var_2182 | var_2264;


  logic [0:0] var_2275;
  assign var_2275 = var_2189 | var_2241;


  logic [0:0] var_2282;
  assign var_2282 = var_2196 | var_2241;


  always_ff @(posedge clk) if (executed && (var_2241))$display("%t\t[d]\t\ti.ebreak.1110011 | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_2303;
  assign var_2303 = var_4556 == 7'd35;


  logic [0:0] var_2310;
  assign var_2310 = var_4548 == 3'd2;


  logic [0:0] var_2313;
  assign var_2313 = var_2303 & var_2310;


  logic [0:0] var_2316;
  assign var_2316 = 1'd0 | var_2313;


  logic [0:0] var_2319;
  assign var_2319 = var_2247 | var_2313;


  logic [15:0] var_4612;
  assign var_4612 = var_2313 ? 16'd1 : 16'd0;


  logic [15:0] var_2326;
  assign var_2326 = var_2254 | var_4612;


  logic [15:0] var_2333;
  assign var_2333 = var_2261 | var_4612;


  logic [0:0] var_2336;
  assign var_2336 = var_2313 ? 1'd0 : 1'd0;


  logic [0:0] var_2340;
  assign var_2340 = var_2268 | var_2336;


  logic [0:0] var_2347;
  assign var_2347 = var_2282 | var_2313;


  logic [0:0] var_2354;
  assign var_2354 = var_1887 | var_2313;


  logic [11:0] var_2365;
  assign var_2365 = {var_2171, var_3991};


  always_ff @(posedge clk) if (executed && (var_2313))$display("%t\t[d]\t\ts.sw.0100011     |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",



  $time

, var_4713, var_1594, var_2365);

  logic [0:0] var_2382;
  assign var_2382 = var_4556 == 7'd99;


  logic [0:0] var_2389;
  assign var_2389 = var_4548 == 3'd0;


  logic [0:0] var_2392;
  assign var_2392 = var_2382 & var_2389;


  logic [0:0] var_2395;
  assign var_2395 = 1'd0 | var_2392;


  logic [0:0] var_2398;
  assign var_2398 = var_2319 | var_2392;


  logic [15:0] var_2401;
  assign var_2401 = var_2392 ? 16'd1 : 16'd0;


  logic [15:0] var_2405;
  assign var_2405 = var_2326 | var_2401;


  logic [15:0] var_2409;
  assign var_2409 = var_2392 ? 16'd256 : 16'd0;


  logic [15:0] var_2413;
  assign var_2413 = var_2333 | var_2409;


  logic [0:0] var_2416;
  assign var_2416 = var_2392 ? 1'd0 : 1'd0;


  logic [0:0] var_2420;
  assign var_2420 = var_2340 | var_2416;


  logic [0:0] var_2427;
  assign var_2427 = var_2347 | var_2392;


  logic [0:0] var_2434;
  assign var_2434 = var_2354 | var_2392;


  logic [0:0] var_1709;
  assign var_1709 = var_1480[7:7];


  logic [5:0] var_3122;
  assign var_3122 = var_1480[30:25];


  logic [3:0] var_3053;
  assign var_3053 = var_1480[11:8];


  logic [1:0] var_2454;
  assign var_2454 = {var_1675, var_1709};


  logic [7:0] var_2457;
  assign var_2457 = {var_2454, var_3122};


  logic [11:0] var_2460;
  assign var_2460 = {var_2457, var_3053};


  logic [12:0] var_2463;
  assign var_2463 = {var_2460, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2392))$display("%t\t[d]\t\tb.beq.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",



  $time

, var_4713, var_1594, var_2463);

  logic [0:0] var_2479;
  assign var_2479 = var_4556 == 7'd99;


  logic [0:0] var_2487;
  assign var_2487 = var_4548 == 3'd1;


  logic [0:0] var_2490;
  assign var_2490 = var_2479 & var_2487;


  logic [0:0] var_2493;
  assign var_2493 = var_2395 | var_2490;


  logic [0:0] var_2496;
  assign var_2496 = var_2398 | var_2490;


  logic [15:0] var_2499;
  assign var_2499 = var_2490 ? 16'd1 : 16'd0;


  logic [15:0] var_2503;
  assign var_2503 = var_2405 | var_2499;


  logic [15:0] var_2506;
  assign var_2506 = var_2490 ? 16'd256 : 16'd0;


  logic [15:0] var_2510;
  assign var_2510 = var_2413 | var_2506;


  logic [0:0] var_2513;
  assign var_2513 = var_2490 ? 1'd1 : 1'd0;


  logic [0:0] var_2517;
  assign var_2517 = var_2420 | var_2513;


  logic [0:0] var_2524;
  assign var_2524 = var_2427 | var_2490;


  logic [0:0] var_2531;
  assign var_2531 = var_2434 | var_2490;


  logic [1:0] var_2550;
  assign var_2550 = {var_1675, var_1709};


  logic [7:0] var_2553;
  assign var_2553 = {var_2550, var_3122};


  logic [11:0] var_2556;
  assign var_2556 = {var_2553, var_3053};


  logic [12:0] var_2559;
  assign var_2559 = {var_2556, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2490))$display("%t\t[d]\t\tb.bne.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",



  $time

, var_4713, var_1594, var_2559);

  logic [0:0] var_2575;
  assign var_2575 = var_4556 == 7'd99;


  logic [0:0] var_2582;
  assign var_2582 = var_4548 == 3'd4;


  logic [0:0] var_2585;
  assign var_2585 = var_2575 & var_2582;


  logic [0:0] var_2588;
  assign var_2588 = var_2493 | var_2585;


  logic [0:0] var_2591;
  assign var_2591 = var_2496 | var_2585;


  logic [15:0] var_2594;
  assign var_2594 = var_2585 ? 16'd1 : 16'd0;


  logic [15:0] var_2598;
  assign var_2598 = var_2503 | var_2594;


  logic [15:0] var_2602;
  assign var_2602 = var_2585 ? 16'd512 : 16'd0;


  logic [15:0] var_2606;
  assign var_2606 = var_2510 | var_2602;


  logic [0:0] var_2609;
  assign var_2609 = var_2585 ? 1'd0 : 1'd0;


  logic [0:0] var_2613;
  assign var_2613 = var_2517 | var_2609;


  logic [0:0] var_2620;
  assign var_2620 = var_2524 | var_2585;


  logic [0:0] var_2627;
  assign var_2627 = var_2531 | var_2585;


  logic [1:0] var_2646;
  assign var_2646 = {var_1675, var_1709};


  logic [7:0] var_2649;
  assign var_2649 = {var_2646, var_3122};


  logic [11:0] var_2652;
  assign var_2652 = {var_2649, var_3053};


  logic [12:0] var_2655;
  assign var_2655 = {var_2652, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2585))$display("%t\t[d]\t\tb.blt.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",



  $time

, var_4713, var_1594, var_2655);

  logic [0:0] var_2671;
  assign var_2671 = var_4556 == 7'd99;


  logic [0:0] var_2679;
  assign var_2679 = var_4548 == 3'd5;


  logic [0:0] var_2682;
  assign var_2682 = var_2671 & var_2679;


  logic [0:0] var_2685;
  assign var_2685 = var_2588 | var_2682;


  logic [0:0] var_2688;
  assign var_2688 = var_2591 | var_2682;


  logic [15:0] var_2691;
  assign var_2691 = var_2682 ? 16'd1 : 16'd0;


  logic [15:0] var_2695;
  assign var_2695 = var_2598 | var_2691;


  logic [15:0] var_2698;
  assign var_2698 = var_2682 ? 16'd512 : 16'd0;


  logic [15:0] var_2702;
  assign var_2702 = var_2606 | var_2698;


  logic [0:0] var_2705;
  assign var_2705 = var_2682 ? 1'd1 : 1'd0;


  logic [0:0] var_2709;
  assign var_2709 = var_2613 | var_2705;


  logic [0:0] var_2716;
  assign var_2716 = var_2620 | var_2682;


  logic [0:0] var_2723;
  assign var_2723 = var_2627 | var_2682;


  logic [1:0] var_2742;
  assign var_2742 = {var_1675, var_1709};


  logic [7:0] var_2745;
  assign var_2745 = {var_2742, var_3122};


  logic [11:0] var_2748;
  assign var_2748 = {var_2745, var_3053};


  logic [12:0] var_2751;
  assign var_2751 = {var_2748, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2682))$display("%t\t[d]\t\tb.bge.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",



  $time

, var_4713, var_1594, var_2751);

  logic [0:0] var_2767;
  assign var_2767 = var_4556 == 7'd99;


  logic [0:0] var_2775;
  assign var_2775 = var_4548 == 3'd7;


  logic [0:0] var_2778;
  assign var_2778 = var_2767 & var_2775;


  logic [0:0] var_2781;
  assign var_2781 = var_2685 | var_2778;


  logic [0:0] var_2784;
  assign var_2784 = var_2688 | var_2778;


  logic [15:0] var_2787;
  assign var_2787 = var_2778 ? 16'd1 : 16'd0;


  logic [15:0] var_2791;
  assign var_2791 = var_2695 | var_2787;


  logic [15:0] var_2795;
  assign var_2795 = var_2778 ? 16'd1024 : 16'd0;


  logic [15:0] var_2799;
  assign var_2799 = var_2702 | var_2795;


  logic [0:0] var_2802;
  assign var_2802 = var_2778 ? 1'd1 : 1'd0;


  logic [0:0] var_2806;
  assign var_2806 = var_2709 | var_2802;


  logic [0:0] var_2813;
  assign var_2813 = var_2716 | var_2778;


  logic [0:0] var_2820;
  assign var_2820 = var_2723 | var_2778;


  logic [1:0] var_2839;
  assign var_2839 = {var_1675, var_1709};


  logic [7:0] var_2842;
  assign var_2842 = {var_2839, var_3122};


  logic [11:0] var_2845;
  assign var_2845 = {var_2842, var_3053};


  logic [12:0] var_2848;
  assign var_2848 = {var_2845, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2778))$display("%t\t[d]\t\tb.bgeu.1100011   |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",



  $time

, var_4713, var_1594, var_2848);

  logic [0:0] var_2864;
  assign var_2864 = var_4556 == 7'd99;


  logic [0:0] var_2871;
  assign var_2871 = var_4548 == 3'd6;


  logic [0:0] var_2874;
  assign var_2874 = var_2864 & var_2871;


  logic [0:0] var_2877;
  assign var_2877 = var_2781 | var_2874;


  logic [0:0] var_2880;
  assign var_2880 = var_2784 | var_2874;


  logic [15:0] var_2883;
  assign var_2883 = var_2874 ? 16'd1 : 16'd0;


  logic [15:0] var_2887;
  assign var_2887 = var_2791 | var_2883;


  logic [15:0] var_2890;
  assign var_2890 = var_2874 ? 16'd1024 : 16'd0;


  logic [15:0] var_2894;
  assign var_2894 = var_2799 | var_2890;


  logic [0:0] var_2897;
  assign var_2897 = var_2874 ? 1'd0 : 1'd0;


  logic [0:0] var_2901;
  assign var_2901 = var_2806 | var_2897;


  logic [0:0] var_2908;
  assign var_2908 = var_2813 | var_2874;


  logic [0:0] var_2915;
  assign var_2915 = var_2820 | var_2874;


  logic [1:0] var_2934;
  assign var_2934 = {var_1675, var_1709};


  logic [7:0] var_2937;
  assign var_2937 = {var_2934, var_3122};


  logic [11:0] var_2940;
  assign var_2940 = {var_2937, var_3053};


  logic [12:0] var_2943;
  assign var_2943 = {var_2940, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2874))$display("%t\t[d]\t\tb.bltu.1100011   |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",



  $time

, var_4713, var_1594, var_2943);

  logic [0:0] var_2959;
  assign var_2959 = var_4556 == 7'd115;


  logic [0:0] var_2966;
  assign var_2966 = var_4548 == 3'd2;


  logic [0:0] var_2969;
  assign var_2969 = var_2959 & var_2966;


  logic [0:0] var_2972;
  assign var_2972 = var_2969 & 1'd1;


  logic [0:0] var_2975;
  assign var_2975 = var_2972 & 1'd1;


  logic [0:0] var_2978;
  assign var_2978 = var_2244 | var_2975;


  logic [0:0] var_2981;
  assign var_2981 = var_2880 | var_2975;


  logic [15:0] var_2984;
  assign var_2984 = var_2975 ? 16'd8 : 16'd0;


  logic [15:0] var_2988;
  assign var_2988 = var_2887 | var_2984;


  logic [15:0] var_2991;
  assign var_2991 = var_2975 ? 16'd1 : 16'd0;


  logic [15:0] var_2995;
  assign var_2995 = var_2894 | var_2991;


  logic [0:0] var_2998;
  assign var_2998 = var_2975 ? 1'd0 : 1'd0;


  logic [0:0] var_3002;
  assign var_3002 = var_2901 | var_2998;


  logic [0:0] var_3009;
  assign var_3009 = var_2275 | var_2975;


  logic [0:0] var_3016;
  assign var_3016 = var_2908 | var_2975;


  always_ff @(posedge clk) if (executed && (var_2975))$display("%t\t[d]\t\ti.csrrs.1110011  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_3037;
  assign var_3037 = var_4556 == 7'd23;


  logic [0:0] var_3040;
  assign var_3040 = var_1581 | var_3037;


  logic [0:0] var_3043;
  assign var_3043 = var_2981 | var_3037;


  logic [15:0] var_2329;
  assign var_2329 = var_3037 ? 16'd1 : 16'd0;


  logic [15:0] var_3050;
  assign var_3050 = var_2988 | var_2329;


  logic [15:0] var_3057;
  assign var_3057 = var_2995 | var_2329;


  logic [0:0] var_3060;
  assign var_3060 = var_3037 ? 1'd0 : 1'd0;


  logic [0:0] var_3064;
  assign var_3064 = var_3002 | var_3060;


  logic [0:0] var_3071;
  assign var_3071 = var_3009 | var_3037;


  always_ff @(posedge clk) if (executed && (var_3037))$display("%t\t[d]\t\tu.auipc.0010111  | rd: x%02d      |               |               |imm: 0x%x",



  $time

, var_3991, var_4649);

  logic [0:0] var_3090;
  assign var_3090 = var_4556 == 7'd115;


  logic [0:0] var_3097;
  assign var_3097 = var_4548 == 3'd1;


  logic [0:0] var_3100;
  assign var_3100 = var_3090 & var_3097;


  logic [0:0] var_3103;
  assign var_3103 = var_3100 & 1'd1;


  logic [0:0] var_3106;
  assign var_3106 = var_3103 & 1'd1;


  logic [0:0] var_3109;
  assign var_3109 = var_2978 | var_3106;


  logic [0:0] var_3112;
  assign var_3112 = var_3043 | var_3106;


  logic [15:0] var_3910;
  assign var_3910 = var_3106 ? 16'd1 : 16'd0;


  logic [15:0] var_3119;
  assign var_3119 = var_3050 | var_3910;


  logic [15:0] var_3126;
  assign var_3126 = var_3057 | var_3910;


  logic [0:0] var_3129;
  assign var_3129 = var_3106 ? 1'd0 : 1'd0;


  logic [0:0] var_3133;
  assign var_3133 = var_3064 | var_3129;


  logic [0:0] var_3140;
  assign var_3140 = var_3071 | var_3106;


  logic [0:0] var_3147;
  assign var_3147 = var_3016 | var_3106;


  always_ff @(posedge clk) if (executed && (var_3106))$display("%t\t[d]\t\ti.csrrw.1110011  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_3167;
  assign var_3167 = var_4556 == 7'd115;


  logic [0:0] var_3174;
  assign var_3174 = var_4548 == 3'd5;


  logic [0:0] var_3177;
  assign var_3177 = var_3167 & var_3174;


  logic [0:0] var_3180;
  assign var_3180 = var_3177 & 1'd1;


  logic [0:0] var_3183;
  assign var_3183 = var_3180 & 1'd1;


  logic [0:0] var_3186;
  assign var_3186 = var_3109 | var_3183;


  logic [0:0] var_3189;
  assign var_3189 = var_3112 | var_3183;


  logic [15:0] var_4645;
  assign var_4645 = var_3183 ? 16'd1 : 16'd0;


  logic [15:0] var_3196;
  assign var_3196 = var_3119 | var_4645;


  logic [15:0] var_3203;
  assign var_3203 = var_3126 | var_4645;


  logic [0:0] var_3206;
  assign var_3206 = var_3183 ? 1'd0 : 1'd0;


  logic [0:0] var_3210;
  assign var_3210 = var_3133 | var_3206;


  logic [0:0] var_3217;
  assign var_3217 = var_3140 | var_3183;


  logic [0:0] var_3224;
  assign var_3224 = var_3147 | var_3183;


  always_ff @(posedge clk) if (executed && (var_3183))$display("%t\t[d]\t\ti.csrrwi.1110011 | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_3244;
  assign var_3244 = var_4556 == 7'd19;


  logic [0:0] var_3251;
  assign var_3251 = var_4548 == 3'd1;


  logic [5:0] var_3258;
  assign var_3258 = var_4705[11:6];


  logic [0:0] var_3263;
  assign var_3263 = var_3258 == 6'd0;


  logic [0:0] var_3266;
  assign var_3266 = var_3244 & var_3251;


  logic [0:0] var_3269;
  assign var_3269 = var_3266 & 1'd1;


  logic [0:0] var_3272;
  assign var_3272 = var_3269 & var_3263;


  logic [0:0] var_3275;
  assign var_3275 = var_3186 | var_3272;


  logic [0:0] var_3278;
  assign var_3278 = var_3189 | var_3272;


  logic [15:0] var_3282;
  assign var_3282 = var_3272 ? 16'd32 : 16'd0;


  logic [15:0] var_3286;
  assign var_3286 = var_3196 | var_3282;


  logic [15:0] var_3289;
  assign var_3289 = var_3272 ? 16'd1 : 16'd0;


  logic [15:0] var_3293;
  assign var_3293 = var_3203 | var_3289;


  logic [0:0] var_3296;
  assign var_3296 = var_3272 ? 1'd0 : 1'd0;


  logic [0:0] var_3300;
  assign var_3300 = var_3210 | var_3296;


  logic [0:0] var_3307;
  assign var_3307 = var_3217 | var_3272;


  logic [0:0] var_3314;
  assign var_3314 = var_3224 | var_3272;


  always_ff @(posedge clk) if (executed && (var_3272))$display("%t\t[d]\t\ti.slli.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_3334;
  assign var_3334 = var_4556 == 7'd51;


  logic [0:0] var_3341;
  assign var_3341 = var_4548 == 3'd1;


  logic [0:0] var_3348;
  assign var_3348 = var_2171 == 7'd0;


  logic [0:0] var_3351;
  assign var_3351 = var_3334 & var_3341;


  logic [0:0] var_3354;
  assign var_3354 = var_3351 & var_3348;


  logic [0:0] var_3357;
  assign var_3357 = var_3354 & 1'd1;


  logic [0:0] var_3360;
  assign var_3360 = var_1841 | var_3357;


  logic [0:0] var_3363;
  assign var_3363 = var_3278 | var_3357;


  logic [15:0] var_3366;
  assign var_3366 = var_3357 ? 16'd32 : 16'd0;


  logic [15:0] var_3370;
  assign var_3370 = var_3286 | var_3366;


  logic [15:0] var_3373;
  assign var_3373 = var_3357 ? 16'd1 : 16'd0;


  logic [15:0] var_3377;
  assign var_3377 = var_3293 | var_3373;


  logic [0:0] var_3380;
  assign var_3380 = var_3357 ? 1'd0 : 1'd0;


  logic [0:0] var_3384;
  assign var_3384 = var_3300 | var_3380;


  logic [0:0] var_3391;
  assign var_3391 = var_3307 | var_3357;


  logic [0:0] var_3398;
  assign var_3398 = var_3314 | var_3357;


  logic [0:0] var_3405;
  assign var_3405 = var_2915 | var_3357;


  always_ff @(posedge clk) if (executed && (var_3357))$display("%t\t[d]\t\tr.sll.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_3421;
  assign var_3421 = var_4556 == 7'd19;


  logic [0:0] var_3428;
  assign var_3428 = var_4548 == 3'd5;


  logic [5:0] var_3435;
  assign var_3435 = var_4705[11:6];


  logic [0:0] var_3440;
  assign var_3440 = var_3435 == 6'd16;


  logic [0:0] var_3443;
  assign var_3443 = var_3421 & var_3428;


  logic [0:0] var_3446;
  assign var_3446 = var_3443 & 1'd1;


  logic [0:0] var_3449;
  assign var_3449 = var_3446 & var_3440;


  logic [0:0] var_3452;
  assign var_3452 = var_3275 | var_3449;


  logic [0:0] var_3455;
  assign var_3455 = var_3363 | var_3449;


  logic [15:0] var_3459;
  assign var_3459 = var_3449 ? 16'd128 : 16'd0;


  logic [15:0] var_3463;
  assign var_3463 = var_3370 | var_3459;


  logic [15:0] var_3466;
  assign var_3466 = var_3449 ? 16'd1 : 16'd0;


  logic [15:0] var_3470;
  assign var_3470 = var_3377 | var_3466;


  logic [0:0] var_3473;
  assign var_3473 = var_3449 ? 1'd0 : 1'd0;


  logic [0:0] var_3477;
  assign var_3477 = var_3384 | var_3473;


  logic [0:0] var_3484;
  assign var_3484 = var_3391 | var_3449;


  logic [0:0] var_3491;
  assign var_3491 = var_3398 | var_3449;


  always_ff @(posedge clk) if (executed && (var_3449))$display("%t\t[d]\t\ti.srai.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_3511;
  assign var_3511 = var_4556 == 7'd19;


  logic [0:0] var_3518;
  assign var_3518 = var_4548 == 3'd5;


  logic [5:0] var_3525;
  assign var_3525 = var_4705[11:6];


  logic [0:0] var_3529;
  assign var_3529 = var_3525 == 6'd0;


  logic [0:0] var_3532;
  assign var_3532 = var_3511 & var_3518;


  logic [0:0] var_3535;
  assign var_3535 = var_3532 & 1'd1;


  logic [0:0] var_3538;
  assign var_3538 = var_3535 & var_3529;


  logic [0:0] var_3541;
  assign var_3541 = var_3452 | var_3538;


  logic [0:0] var_3544;
  assign var_3544 = var_3455 | var_3538;


  logic [15:0] var_3548;
  assign var_3548 = var_3538 ? 16'd4096 : 16'd0;


  logic [15:0] var_3552;
  assign var_3552 = var_3463 | var_3548;


  logic [15:0] var_3555;
  assign var_3555 = var_3538 ? 16'd1 : 16'd0;


  logic [15:0] var_3559;
  assign var_3559 = var_3470 | var_3555;


  logic [0:0] var_3562;
  assign var_3562 = var_3538 ? 1'd0 : 1'd0;


  logic [0:0] var_3566;
  assign var_3566 = var_3477 | var_3562;


  logic [0:0] var_3573;
  assign var_3573 = var_3484 | var_3538;


  logic [0:0] var_3580;
  assign var_3580 = var_3491 | var_3538;


  always_ff @(posedge clk) if (executed && (var_3538))$display("%t\t[d]\t\ti.srli.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_3600;
  assign var_3600 = var_4556 == 7'd51;


  logic [0:0] var_3608;
  assign var_3608 = var_4548 == 3'd3;


  logic [0:0] var_3615;
  assign var_3615 = var_2171 == 7'd0;


  logic [0:0] var_3618;
  assign var_3618 = var_3600 & var_3608;


  logic [0:0] var_3621;
  assign var_3621 = var_3618 & var_3615;


  logic [0:0] var_3624;
  assign var_3624 = var_3621 & 1'd1;


  logic [0:0] var_3627;
  assign var_3627 = var_3360 | var_3624;


  logic [0:0] var_3630;
  assign var_3630 = var_3544 | var_3624;


  logic [15:0] var_3633;
  assign var_3633 = var_3624 ? 16'd1024 : 16'd0;


  logic [15:0] var_3637;
  assign var_3637 = var_3552 | var_3633;


  logic [15:0] var_3640;
  assign var_3640 = var_3624 ? 16'd1 : 16'd0;


  logic [15:0] var_3644;
  assign var_3644 = var_3559 | var_3640;


  logic [0:0] var_3647;
  assign var_3647 = var_3624 ? 1'd0 : 1'd0;


  logic [0:0] var_3651;
  assign var_3651 = var_3566 | var_3647;


  logic [0:0] var_3658;
  assign var_3658 = var_3573 | var_3624;


  logic [0:0] var_3665;
  assign var_3665 = var_3580 | var_3624;


  logic [0:0] var_3672;
  assign var_3672 = var_3405 | var_3624;


  always_ff @(posedge clk) if (executed && (var_3624))$display("%t\t[d]\t\tr.sltu.0110011   | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_3688;
  assign var_3688 = var_4556 == 7'd51;


  logic [0:0] var_3695;
  assign var_3695 = var_4548 == 3'd5;


  logic [0:0] var_3702;
  assign var_3702 = var_2171 == 7'd0;


  logic [0:0] var_3705;
  assign var_3705 = var_3688 & var_3695;


  logic [0:0] var_3708;
  assign var_3708 = var_3705 & var_3702;


  logic [0:0] var_3711;
  assign var_3711 = var_3708 & 1'd1;


  logic [0:0] var_3714;
  assign var_3714 = var_3627 | var_3711;


  logic [0:0] var_3717;
  assign var_3717 = var_3630 | var_3711;


  logic [15:0] var_3720;
  assign var_3720 = var_3711 ? 16'd4096 : 16'd0;


  logic [15:0] var_3724;
  assign var_3724 = var_3637 | var_3720;


  logic [15:0] var_3727;
  assign var_3727 = var_3711 ? 16'd1 : 16'd0;


  logic [15:0] var_3731;
  assign var_3731 = var_3644 | var_3727;


  logic [0:0] var_3734;
  assign var_3734 = var_3711 ? 1'd0 : 1'd0;


  logic [0:0] var_3738;
  assign var_3738 = var_3651 | var_3734;


  logic [0:0] var_3745;
  assign var_3745 = var_3658 | var_3711;


  logic [0:0] var_3752;
  assign var_3752 = var_3665 | var_3711;


  logic [0:0] var_3759;
  assign var_3759 = var_3672 | var_3711;


  always_ff @(posedge clk) if (executed && (var_3711))$display("%t\t[d]\t\tr.srl.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_3775;
  assign var_3775 = var_4556 == 7'd51;


  logic [0:0] var_3782;
  assign var_3782 = var_4548 == 3'd5;


  logic [0:0] var_3789;
  assign var_3789 = var_2171 == 7'd32;


  logic [0:0] var_3792;
  assign var_3792 = var_3775 & var_3782;


  logic [0:0] var_3795;
  assign var_3795 = var_3792 & var_3789;


  logic [0:0] var_3798;
  assign var_3798 = var_3795 & 1'd1;


  logic [0:0] var_3801;
  assign var_3801 = var_3714 | var_3798;


  logic [0:0] var_3804;
  assign var_3804 = var_3717 | var_3798;


  logic [15:0] var_3807;
  assign var_3807 = var_3798 ? 16'd128 : 16'd0;


  logic [15:0] var_3811;
  assign var_3811 = var_3724 | var_3807;


  logic [15:0] var_3814;
  assign var_3814 = var_3798 ? 16'd1 : 16'd0;


  logic [15:0] var_3818;
  assign var_3818 = var_3731 | var_3814;


  logic [0:0] var_3821;
  assign var_3821 = var_3798 ? 1'd0 : 1'd0;


  logic [0:0] var_3825;
  assign var_3825 = var_3738 | var_3821;


  logic [0:0] var_3832;
  assign var_3832 = var_3745 | var_3798;


  logic [0:0] var_3839;
  assign var_3839 = var_3752 | var_3798;


  logic [0:0] var_3846;
  assign var_3846 = var_3759 | var_3798;


  always_ff @(posedge clk) if (executed && (var_3798))$display("%t\t[d]\t\tr.sra.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_3862;
  assign var_3862 = var_4556 == 7'd115;


  logic [0:0] var_3869;
  assign var_3869 = var_4548 == 3'd0;


  logic [0:0] var_3877;
  assign var_3877 = var_2171 == 7'd24;


  logic [0:0] var_3885;
  assign var_3885 = var_1594 == 5'd2;


  logic [0:0] var_3888;
  assign var_3888 = var_3862 & var_3869;


  logic [0:0] var_3891;
  assign var_3891 = var_3888 & var_3877;


  logic [0:0] var_3894;
  assign var_3894 = var_3891 & var_3885;


  logic [0:0] var_3897;
  assign var_3897 = var_3801 | var_3894;


  logic [0:0] var_3900;
  assign var_3900 = var_3804 | var_3894;


  logic [15:0] var_4709;
  assign var_4709 = var_3894 ? 16'd1 : 16'd0;


  logic [15:0] var_3907;
  assign var_3907 = var_3811 | var_4709;


  logic [15:0] var_3914;
  assign var_3914 = var_3818 | var_4709;


  logic [0:0] var_3917;
  assign var_3917 = var_3894 ? 1'd0 : 1'd0;


  logic [0:0] var_3921;
  assign var_3921 = var_3825 | var_3917;


  logic [0:0] var_3928;
  assign var_3928 = var_3832 | var_3894;


  logic [0:0] var_3935;
  assign var_3935 = var_3839 | var_3894;


  logic [0:0] var_3942;
  assign var_3942 = var_3846 | var_3894;


  always_ff @(posedge clk) if (executed && (var_3894))$display("%t\t[d]\t\tr.mret.1110011   | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_3959;
  assign var_3959 = var_4556 == 7'd15;


  logic [0:0] var_3966;
  assign var_3966 = var_4548 == 3'd0;


  logic [0:0] var_3969;
  assign var_3969 = var_3959 & var_3966;


  logic [0:0] var_3972;
  assign var_3972 = var_3969 & 1'd1;


  logic [0:0] var_3975;
  assign var_3975 = var_3972 & 1'd1;


  logic [0:0] var_3978;
  assign var_3978 = var_3541 | var_3975;


  logic [0:0] var_3981;
  assign var_3981 = var_3900 | var_3975;


  logic [15:0] var_4608;
  assign var_4608 = var_3975 ? 16'd1 : 16'd0;


  logic [15:0] var_3988;
  assign var_3988 = var_3907 | var_4608;


  logic [15:0] var_3995;
  assign var_3995 = var_3914 | var_4608;


  logic [0:0] var_3998;
  assign var_3998 = var_3975 ? 1'd0 : 1'd0;


  logic [0:0] var_4002;
  assign var_4002 = var_3921 | var_3998;


  logic [0:0] var_4009;
  assign var_4009 = var_3928 | var_3975;


  logic [0:0] var_4016;
  assign var_4016 = var_3935 | var_3975;


  always_ff @(posedge clk) if (executed && (var_3975))$display("%t\t[d]\t\ti.fence.0001111  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_4036;
  assign var_4036 = var_4556 == 7'd115;


  logic [0:0] var_4043;
  assign var_4043 = var_4548 == 3'd0;


  logic [0:0] var_4051;
  assign var_4051 = var_4705 == 12'd0;


  logic [0:0] var_4054;
  assign var_4054 = var_4036 & var_4043;


  logic [0:0] var_4057;
  assign var_4057 = var_4054 & var_4051;


  logic [0:0] var_4060;
  assign var_4060 = var_4057 & 1'd1;


  logic [0:0] var_4063;
  assign var_4063 = var_3978 | var_4060;


  logic [0:0] var_4066;
  assign var_4066 = var_3981 | var_4060;


  logic [15:0] var_4069;
  assign var_4069 = var_4060 ? 16'd32768 : 16'd0;


  logic [15:0] var_4073;
  assign var_4073 = var_3988 | var_4069;


  logic [15:0] var_4076;
  assign var_4076 = var_4060 ? 16'd1 : 16'd0;


  logic [15:0] var_4080;
  assign var_4080 = var_3995 | var_4076;


  logic [0:0] var_4083;
  assign var_4083 = var_4060 ? 1'd0 : 1'd0;


  logic [0:0] var_4087;
  assign var_4087 = var_4002 | var_4083;


  logic [0:0] var_4094;
  assign var_4094 = var_4009 | var_4060;


  logic [0:0] var_4101;
  assign var_4101 = var_4016 | var_4060;


  always_ff @(posedge clk) if (executed && (var_4060))$display("%t\t[d]\t\ti.ecall.1110011  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_4121;
  assign var_4121 = var_4556 == 7'd51;


  logic [0:0] var_4128;
  assign var_4128 = var_4548 == 3'd7;


  logic [0:0] var_4135;
  assign var_4135 = var_2171 == 7'd0;


  logic [0:0] var_4138;
  assign var_4138 = var_4121 & var_4128;


  logic [0:0] var_4141;
  assign var_4141 = var_4138 & var_4135;


  logic [0:0] var_4144;
  assign var_4144 = var_4141 & 1'd1;


  logic [0:0] var_4147;
  assign var_4147 = var_3897 | var_4144;


  logic [0:0] var_4150;
  assign var_4150 = var_4066 | var_4144;


  logic [15:0] var_4154;
  assign var_4154 = var_4144 ? 16'd16 : 16'd0;


  logic [15:0] var_4158;
  assign var_4158 = var_4073 | var_4154;


  logic [15:0] var_4161;
  assign var_4161 = var_4144 ? 16'd1 : 16'd0;


  logic [15:0] var_4165;
  assign var_4165 = var_4080 | var_4161;


  logic [0:0] var_4168;
  assign var_4168 = var_4144 ? 1'd0 : 1'd0;


  logic [0:0] var_4172;
  assign var_4172 = var_4087 | var_4168;


  logic [0:0] var_4179;
  assign var_4179 = var_4094 | var_4144;


  logic [0:0] var_4186;
  assign var_4186 = var_4101 | var_4144;


  logic [0:0] var_4193;
  assign var_4193 = var_3942 | var_4144;


  always_ff @(posedge clk) if (executed && (var_4144))$display("%t\t[d]\t\tr.and.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",



  $time

, var_3991, var_4713, var_1594);

  logic [0:0] var_4209;
  assign var_4209 = var_4556 == 7'd19;


  logic [0:0] var_4216;
  assign var_4216 = var_4548 == 3'd7;


  logic [0:0] var_4219;
  assign var_4219 = var_4209 & var_4216;


  logic [0:0] var_4222;
  assign var_4222 = var_4219 & 1'd1;


  logic [0:0] var_4225;
  assign var_4225 = var_4222 & 1'd1;


  logic [0:0] var_4228;
  assign var_4228 = var_4063 | var_4225;


  logic [0:0] var_4231;
  assign var_4231 = var_4150 | var_4225;


  logic [15:0] var_4234;
  assign var_4234 = var_4225 ? 16'd16 : 16'd0;


  logic [15:0] var_4238;
  assign var_4238 = var_4158 | var_4234;


  logic [15:0] var_4241;
  assign var_4241 = var_4225 ? 16'd1 : 16'd0;


  logic [15:0] var_4245;
  assign var_4245 = var_4165 | var_4241;


  logic [0:0] var_4248;
  assign var_4248 = var_4225 ? 1'd0 : 1'd0;


  logic [0:0] var_4252;
  assign var_4252 = var_4172 | var_4248;


  logic [0:0] var_4259;
  assign var_4259 = var_4179 | var_4225;


  logic [0:0] var_4266;
  assign var_4266 = var_4186 | var_4225;


  always_ff @(posedge clk) if (executed && (var_4225))$display("%t\t[d]\t\ti.andi.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_4286;
  assign var_4286 = var_4556 == 7'd19;


  logic [0:0] var_4293;
  assign var_4293 = var_4548 == 3'd6;


  logic [0:0] var_4296;
  assign var_4296 = var_4286 & var_4293;


  logic [0:0] var_4299;
  assign var_4299 = var_4296 & 1'd1;


  logic [0:0] var_4302;
  assign var_4302 = var_4299 & 1'd1;


  logic [0:0] var_4305;
  assign var_4305 = var_4228 | var_4302;


  logic [0:0] var_4308;
  assign var_4308 = var_4231 | var_4302;


  logic [15:0] var_4312;
  assign var_4312 = var_4302 ? 16'd8192 : 16'd0;


  logic [15:0] var_4316;
  assign var_4316 = var_4238 | var_4312;


  logic [15:0] var_4319;
  assign var_4319 = var_4302 ? 16'd1 : 16'd0;


  logic [15:0] var_4323;
  assign var_4323 = var_4245 | var_4319;


  logic [0:0] var_4326;
  assign var_4326 = var_4302 ? 1'd0 : 1'd0;


  logic [0:0] var_4330;
  assign var_4330 = var_4252 | var_4326;


  logic [0:0] var_4337;
  assign var_4337 = var_4259 | var_4302;


  logic [0:0] var_4344;
  assign var_4344 = var_4266 | var_4302;


  always_ff @(posedge clk) if (executed && (var_4302))$display("%t\t[d]\t\ti.ori.0010011    | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_4364;
  assign var_4364 = var_4556 == 7'd19;


  logic [0:0] var_4371;
  assign var_4371 = var_4548 == 3'd4;


  logic [0:0] var_4374;
  assign var_4374 = var_4364 & var_4371;


  logic [0:0] var_4377;
  assign var_4377 = var_4374 & 1'd1;


  logic [0:0] var_4380;
  assign var_4380 = var_4377 & 1'd1;


  logic [0:0] var_4383;
  assign var_4383 = var_4305 | var_4380;


  logic [0:0] var_4386;
  assign var_4386 = var_4308 | var_4380;


  logic [15:0] var_4390;
  assign var_4390 = var_4380 ? 16'd4 : 16'd0;


  logic [15:0] var_4394;
  assign var_4394 = var_4316 | var_4390;


  logic [15:0] var_4397;
  assign var_4397 = var_4380 ? 16'd1 : 16'd0;


  logic [15:0] var_4401;
  assign var_4401 = var_4323 | var_4397;


  logic [0:0] var_4404;
  assign var_4404 = var_4380 ? 1'd0 : 1'd0;


  logic [0:0] var_4408;
  assign var_4408 = var_4330 | var_4404;


  logic [0:0] var_4415;
  assign var_4415 = var_4337 | var_4380;


  logic [0:0] var_4422;
  assign var_4422 = var_4344 | var_4380;


  always_ff @(posedge clk) if (executed && (var_4380))$display("%t\t[d]\t\ti.xori.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",



  $time

, var_3991, var_4713, var_4705);

  logic [0:0] var_4438;
  assign var_4438 = ~var_4386;


  always_ff @(posedge clk) if (executed && (var_4438))$display("%t\t[d]\t\tUnsupported instruction: opcode = 0x%x funct3: 0x%x funct7: 0x%x",



  $time

, var_4556, var_4548, var_2171);

  always_ff @(posedge clk) if (executed && (var_4438)) assert(0);
  logic [0:0] var_4463;
  assign var_4463 = var_2077 | var_2155;


  logic [1:0] var_4466;
  assign var_4466 = {var_2313, var_4463};


  logic [1:0] var_4469;
  assign var_4469 = {var_2155, var_2155};


  logic [0:0] var_4472;
  assign var_4472 = var_2877 | var_2014;


  logic [0:0] var_4475;
  assign var_4475 = var_4472 | var_1920;


  logic [0:0] var_4478;
  assign var_4478 = var_4475 | var_3894;


  logic [0:0] var_4481;
  assign var_4481 = var_2877 | var_1494;


  logic [0:0] var_4484;
  assign var_4484 = var_1920 | var_1494;


  logic [4:0] var_4491;
  assign var_4491 = var_4415 ? var_3991 : 5'd0;


  logic [4:0] var_4499;
  assign var_4499 = var_4422 ? var_4713 : 5'd0;


  logic [4:0] var_4507;
  assign var_4507 = var_4193 ? var_1594 : 5'd0;


  logic [0:0] var_4511;
  assign var_4511 = var_4383 | var_3040;


  logic [0:0] var_4514;
  assign var_4514 = var_4511 | var_2877;


  logic [0:0] var_4517;
  assign var_4517 = var_4514 | var_2014;


  logic [0:0] var_4520;
  assign var_4520 = var_4517 | var_2316;


  logic [0:0] var_4527;
  assign var_4527 = var_4705[11:11];


  logic [19:0] var_4533;
  assign var_4533 = var_4527 ? 20'd1048575 : 20'd0;


  logic [31:0] var_4537;
  assign var_4537 = {var_4533, var_4705};


  logic [31:0] var_4540;
  assign var_4540 = var_4383 ? var_4537 : 32'd0;


  logic [1:0] var_4560;
  assign var_4560 = {var_1675, var_1709};


  logic [7:0] var_4563;
  assign var_4563 = {var_4560, var_3122};


  logic [11:0] var_4566;
  assign var_4566 = {var_4563, var_3053};


  logic [12:0] var_4569;
  assign var_4569 = {var_4566, 1'd0};


  logic [0:0] var_4572;
  assign var_4572 = var_4569[12:12];


  logic [18:0] var_4578;
  assign var_4578 = var_4572 ? 19'd524287 : 19'd0;


  logic [31:0] var_4582;
  assign var_4582 = {var_4578, var_4569};


  logic [31:0] var_4585;
  assign var_4585 = var_2877 ? var_4582 : var_4540;


  logic [31:0] var_4593;
  assign var_4593 = {12'd0, var_4649};


  logic [31:0] var_4596;
  assign var_4596 = var_3040 ? var_4593 : var_4585;


  logic [8:0] var_4616;
  assign var_4616 = {var_1675, var_4495};


  logic [9:0] var_4619;
  assign var_4619 = {var_4616, var_4604};


  logic [19:0] var_4622;
  assign var_4622 = {var_4619, var_1529};


  logic [20:0] var_4625;
  assign var_4625 = {var_4622, 1'd0};


  logic [0:0] var_4628;
  assign var_4628 = var_4625[20:20];


  logic [10:0] var_4634;
  assign var_4634 = var_4628 ? 11'd2047 : 11'd0;


  logic [31:0] var_4638;
  assign var_4638 = {var_4634, var_4625};


  logic [31:0] var_4641;
  assign var_4641 = var_2014 ? var_4638 : var_4596;


  logic [11:0] var_4653;
  assign var_4653 = {var_2171, var_3991};


  logic [0:0] var_4656;
  assign var_4656 = var_4653[11:11];


  logic [19:0] var_4660;
  assign var_4660 = var_4656 ? 20'd1048575 : 20'd0;


  logic [31:0] var_4664;
  assign var_4664 = {var_4660, var_4653};


  logic [31:0] var_4667;
  assign var_4667 = var_2316 ? var_4664 : var_4641;


  logic [31:0] var_4675;
  assign var_4675 = {var_4649, 12'd0};


  logic [31:0] var_4678;
  assign var_4678 = var_1578 ? var_4675 : var_4667;


  logic [31:0] var_4686;
  assign var_4686 = {var_4649, 12'd0};


  logic [31:0] var_4689;
  assign var_4689 = var_3037 ? var_4686 : var_4678;


  logic [0:0] var_4693;
  assign var_4693 = var_2975 | var_3894;


  logic [0:0] var_4696;
  assign var_4696 = var_3106 | var_3183;


  logic [0:0] var_4699;
  assign var_4699 = var_4693 | var_4696;


  always_ff @(posedge clk) if (executed && (var_4699))$display("%t\t[d]\t\tCSR instruction: opcode = 0x%x funct3: 0x%x csr_addr: 0x%x",



  $time

, var_4556, var_4548, var_4705);

  logic [5:0] var_4723;
  assign var_4723 = {var_4499, var_4422};


  logic [10:0] var_4726;
  assign var_4726 = {var_4723, var_4507};


  logic [11:0] var_4729;
  assign var_4729 = {var_4726, var_4193};


  logic [16:0] var_4732;
  assign var_4732 = {var_4729, var_4491};


  logic [17:0] var_4735;
  assign var_4735 = {var_4732, var_4415};


  logic [18:0] var_4738;
  assign var_4738 = {var_4735, var_4693};


  logic [19:0] var_4741;
  assign var_4741 = {var_4738, var_4696};


  logic [20:0] var_4744;
  assign var_4744 = {var_4741, var_2975};


  logic [21:0] var_4747;
  assign var_4747 = {var_4744, var_3183};


  logic [22:0] var_4750;
  assign var_4750 = {var_4747, var_3894};


  logic [23:0] var_4753;
  assign var_4753 = {var_4750, var_3037};


  logic [55:0] var_4756;
  assign var_4756 = {var_4753, var_4689};


  logic [56:0] var_4759;
  assign var_4759 = {var_4756, var_4520};


  logic [58:0] var_4762;
  assign var_4762 = {var_4759, var_4466};


  logic [74:0] var_4765;
  assign var_4765 = {var_4762, var_4394};


  logic [90:0] var_4768;
  assign var_4768 = {var_4765, var_4401};


  logic [91:0] var_4771;
  assign var_4771 = {var_4768, var_4408};


  logic [92:0] var_4774;
  assign var_4774 = {var_4771, var_4478};


  logic [93:0] var_4777;
  assign var_4777 = {var_4774, var_4481};


  logic [94:0] var_4780;
  assign var_4780 = {var_4777, var_4484};


  logic [96:0] var_4783;
  assign var_4783 = {var_4780, var_4469};


  logic [0:0] var_4798;
  assign var_4798 = var_4783[4:4];
  assign expose_var_4798 = var_4798;
  assign expose_var_4798_valid = executed && 1;


  assign e_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_e_fetch_addr_push_valid = executed;
  assign fifo_e_fetch_addr_push_data = var_1482;

  assign fifo_e_signals_push_valid = executed;
  assign fifo_e_signals_push_data = var_4783;

  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // d

module top(
  output logic [31:0] array_array_30398_exposed_o,
  output logic [31:0] array_array_303ce_exposed_o,
  output logic [31:0] array_array_4dc17_exposed_o,
  input logic [31:0] array_array_4dc17_exposed_i,
  input logic [0:0] array_array_4dc17_exposed_i_valid,
  output logic [1023:0] array_array_303aa_exposed_o,
  output logic [0:0] var_494_exposed_o,
  output logic [511:0] array_array_303b0_exposed_o,
  input logic [31:0] array_array_303b0_exposed_i,
  input logic [0:0] array_array_303b0_exposed_i_valid,

  input logic clk,
  input logic rst_n
);

//Array: array_3e6a8, Init File Path: /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/minor-cpu/src/.workspace//workload.exe
//Array: array_3e7da, Init File Path: /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/minor-cpu/src/.workspace//workload.init
//Array: array_36c8f, Init File Path: /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/minor-cpu/src/.workspace//workload.data
  /* Array: array_3039b[1 x b32] */
  logic [31:0] array_array_3039b_q;
  logic [31:0] array_array_3039b_driver_m_d;
  logic [0:0] array_array_3039b_driver_m_w;
  logic [0:0] array_array_3039b_driver_m_widx;
  logic [31:0] array_array_3039b_d;
  logic [0:0] array_array_3039b_widx;
  logic [0:0] array_array_3039b_w;
  assign array_array_3039b_d = ({ 32 { array_array_3039b_driver_m_w } } & array_array_3039b_driver_m_d);
  assign array_array_3039b_widx = ({ 1 { array_array_3039b_driver_m_w } } & array_array_3039b_driver_m_widx);
  assign array_array_3039b_w = array_array_3039b_driver_m_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_3039b_q <= 32'd0;
    else if (array_array_3039b_w) begin

      case (array_array_3039b_widx)
        0 : array_array_3039b_q[31:0] <= array_array_3039b_d;
        default: ;
      endcase
    end
  /* Array: array_4dc17[1 x b32] */
  logic [31:0] array_array_4dc17_q;
  logic [31:0] array_array_4dc17_driver_memuser_30344_d;
  logic [0:0] array_array_4dc17_driver_memuser_30344_w;
  logic [0:0] array_array_4dc17_driver_memuser_30344_widx;
  assign array_array_4dc17_exposed_o = array_array_4dc17_q;
  logic [31:0] array_array_4dc17_temp;
  assign array_array_4dc17_temp = array_array_4dc17_exposed_i_valid?array_array_4dc17_exposed_i:array_array_4dc17_d;
  logic [31:0] array_array_4dc17_d;
  logic [0:0] array_array_4dc17_widx;
  logic [0:0] array_array_4dc17_w;
  assign array_array_4dc17_d = ({ 32 { array_array_4dc17_driver_memuser_30344_w } } & array_array_4dc17_driver_memuser_30344_d);
  assign array_array_4dc17_widx = ({ 1 { array_array_4dc17_driver_memuser_30344_w } } & array_array_4dc17_driver_memuser_30344_widx);
  assign array_array_4dc17_w = array_array_4dc17_driver_memuser_30344_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_4dc17_q <= 32'd0;
    else if (array_array_4dc17_w) begin

      case (array_array_4dc17_widx)
        0 : array_array_4dc17_q[31:0] <= array_array_4dc17_temp;
        default: ;
      endcase
    end
  /* Array: array_303e0[1 x b1] */
  logic [0:0] array_array_303e0_q;
  logic [0:0] array_array_303e0_driver_F1_d;
  logic [0:0] array_array_303e0_driver_F1_w;
  logic [0:0] array_array_303e0_driver_F1_widx;
  logic [0:0] array_array_303e0_d;
  logic [0:0] array_array_303e0_widx;
  logic [0:0] array_array_303e0_w;
  assign array_array_303e0_d = ({ 1 { array_array_303e0_driver_F1_w } } & array_array_303e0_driver_F1_d);
  assign array_array_303e0_widx = ({ 1 { array_array_303e0_driver_F1_w } } & array_array_303e0_driver_F1_widx);
  assign array_array_303e0_w = array_array_303e0_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303e0_q <= 1'd0;
    else if (array_array_303e0_w) begin

      case (array_array_303e0_widx)
        0 : array_array_303e0_q[0:0] <= array_array_303e0_d;
        default: ;
      endcase
    end
  /* Array: array_303d4[1 x b32] */
  logic [31:0] array_array_303d4_q;
  logic [31:0] array_array_303d4_driver_e_d;
  logic [0:0] array_array_303d4_driver_e_w;
  logic [0:0] array_array_303d4_driver_e_widx;
  logic [31:0] array_array_303d4_d;
  logic [0:0] array_array_303d4_widx;
  logic [0:0] array_array_303d4_w;
  assign array_array_303d4_d = ({ 32 { array_array_303d4_driver_e_w } } & array_array_303d4_driver_e_d);
  assign array_array_303d4_widx = ({ 1 { array_array_303d4_driver_e_w } } & array_array_303d4_driver_e_widx);
  assign array_array_303d4_w = array_array_303d4_driver_e_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303d4_q <= 32'd0;
    else if (array_array_303d4_w) begin

      case (array_array_303d4_widx)
        0 : array_array_303d4_q[31:0] <= array_array_303d4_d;
        default: ;
      endcase
    end
  /* Array: array_303b3[1 x b5] */
  logic [4:0] array_array_303b3_q;
  logic [4:0] array_array_303b3_driver_m_d;
  logic [0:0] array_array_303b3_driver_m_w;
  logic [0:0] array_array_303b3_driver_m_widx;
  logic [4:0] array_array_303b3_d;
  logic [0:0] array_array_303b3_widx;
  logic [0:0] array_array_303b3_w;
  assign array_array_303b3_d = ({ 5 { array_array_303b3_driver_m_w } } & array_array_303b3_driver_m_d);
  assign array_array_303b3_widx = ({ 1 { array_array_303b3_driver_m_w } } & array_array_303b3_driver_m_widx);
  assign array_array_303b3_w = array_array_303b3_driver_m_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303b3_q <= 5'd0;
    else if (array_array_303b3_w) begin

      case (array_array_303b3_widx)
        0 : array_array_303b3_q[4:0] <= array_array_303b3_d;
        default: ;
      endcase
    end
  /* Array: array_3e7ce[1 x u1] */
  logic [0:0] array_array_3e7ce_q;
  logic [0:0] array_array_3e7ce_driver_driver_d;
  logic [0:0] array_array_3e7ce_driver_driver_w;
  logic [0:0] array_array_3e7ce_driver_driver_widx;
  logic [0:0] array_array_3e7ce_d;
  logic [0:0] array_array_3e7ce_widx;
  logic [0:0] array_array_3e7ce_w;
  assign array_array_3e7ce_d = ({ 1 { array_array_3e7ce_driver_driver_w } } & array_array_3e7ce_driver_driver_d);
  assign array_array_3e7ce_widx = ({ 1 { array_array_3e7ce_driver_driver_w } } & array_array_3e7ce_driver_driver_widx);
  assign array_array_3e7ce_w = array_array_3e7ce_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_3e7ce_q[0:0] <= 1'd1;
    end
    else if (array_array_3e7ce_w) begin

      case (array_array_3e7ce_widx)
        0 : array_array_3e7ce_q[0:0] <= array_array_3e7ce_d;
        default: ;
      endcase
    end
  /* Array: array_36e75[1 x b1] */
  logic [0:0] array_array_36e75_q;
  logic [0:0] array_array_36e75_driver_F1_d;
  logic [0:0] array_array_36e75_driver_F1_w;
  logic [0:0] array_array_36e75_driver_F1_widx;
  logic [0:0] array_array_36e75_d;
  logic [0:0] array_array_36e75_widx;
  logic [0:0] array_array_36e75_w;
  assign array_array_36e75_d = ({ 1 { array_array_36e75_driver_F1_w } } & array_array_36e75_driver_F1_d);
  assign array_array_36e75_widx = ({ 1 { array_array_36e75_driver_F1_w } } & array_array_36e75_driver_F1_widx);
  assign array_array_36e75_w = array_array_36e75_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_36e75_q[0:0] <= 1'd1;
    end
    else if (array_array_36e75_w) begin

      case (array_array_36e75_widx)
        0 : array_array_36e75_q[0:0] <= array_array_36e75_d;
        default: ;
      endcase
    end
  /* Array: array_303c2[1 x b32] */
  logic [31:0] array_array_303c2_q;
  logic [31:0] array_array_303c2_driver_m_d;
  logic [0:0] array_array_303c2_driver_m_w;
  logic [0:0] array_array_303c2_driver_m_widx;
  logic [31:0] array_array_303c2_d;
  logic [0:0] array_array_303c2_widx;
  logic [0:0] array_array_303c2_w;
  assign array_array_303c2_d = ({ 32 { array_array_303c2_driver_m_w } } & array_array_303c2_driver_m_d);
  assign array_array_303c2_widx = ({ 1 { array_array_303c2_driver_m_w } } & array_array_303c2_driver_m_widx);
  assign array_array_303c2_w = array_array_303c2_driver_m_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303c2_q <= 32'd0;
    else if (array_array_303c2_w) begin

      case (array_array_303c2_widx)
        0 : array_array_303c2_q[31:0] <= array_array_303c2_d;
        default: ;
      endcase
    end
  /* Array: array_303da[1 x b1] */
  logic [0:0] array_array_303da_q;
  logic [0:0] array_array_303da_driver_F1_d;
  logic [0:0] array_array_303da_driver_F1_w;
  logic [0:0] array_array_303da_driver_F1_widx;
  logic [0:0] array_array_303da_d;
  logic [0:0] array_array_303da_widx;
  logic [0:0] array_array_303da_w;
  assign array_array_303da_d = ({ 1 { array_array_303da_driver_F1_w } } & array_array_303da_driver_F1_d);
  assign array_array_303da_widx = ({ 1 { array_array_303da_driver_F1_w } } & array_array_303da_driver_F1_widx);
  assign array_array_303da_w = array_array_303da_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303da_q <= 1'd0;
    else if (array_array_303da_w) begin

      case (array_array_303da_widx)
        0 : array_array_303da_q[0:0] <= array_array_303da_d;
        default: ;
      endcase
    end
  /* Array: array_303a4[1 x b32] */
  logic [31:0] array_array_303a4_q;
  logic [31:0] array_array_303a4_driver_e_d;
  logic [0:0] array_array_303a4_driver_e_w;
  logic [0:0] array_array_303a4_driver_e_widx;
  logic [31:0] array_array_303a4_d;
  logic [0:0] array_array_303a4_widx;
  logic [0:0] array_array_303a4_w;
  assign array_array_303a4_d = ({ 32 { array_array_303a4_driver_e_w } } & array_array_303a4_driver_e_d);
  assign array_array_303a4_widx = ({ 1 { array_array_303a4_driver_e_w } } & array_array_303a4_driver_e_widx);
  assign array_array_303a4_w = array_array_303a4_driver_e_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303a4_q <= 32'd0;
    else if (array_array_303a4_w) begin

      case (array_array_303a4_widx)
        0 : array_array_303a4_q[31:0] <= array_array_303a4_d;
        default: ;
      endcase
    end
  /* Array: array_303aa[32 x b32] */
  logic [1023:0] array_array_303aa_q;
  logic [31:0] array_array_303aa_driver_w_d;
  logic [0:0] array_array_303aa_driver_w_w;
  logic [4:0] array_array_303aa_driver_w_widx;
  assign array_array_303aa_exposed_o = array_array_303aa_q;
  logic [31:0] array_array_303aa_d;
  logic [4:0] array_array_303aa_widx;
  logic [0:0] array_array_303aa_w;
  assign array_array_303aa_d = ({ 32 { array_array_303aa_driver_w_w } } & array_array_303aa_driver_w_d);
  assign array_array_303aa_widx = ({ 5 { array_array_303aa_driver_w_w } } & array_array_303aa_driver_w_widx);
  assign array_array_303aa_w = array_array_303aa_driver_w_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303aa_q <= 1024'd0;
    else if (array_array_303aa_w) begin

      case (array_array_303aa_widx)
        0 : array_array_303aa_q[31:0] <= array_array_303aa_d;
        1 : array_array_303aa_q[63:32] <= array_array_303aa_d;
        2 : array_array_303aa_q[95:64] <= array_array_303aa_d;
        3 : array_array_303aa_q[127:96] <= array_array_303aa_d;
        4 : array_array_303aa_q[159:128] <= array_array_303aa_d;
        5 : array_array_303aa_q[191:160] <= array_array_303aa_d;
        6 : array_array_303aa_q[223:192] <= array_array_303aa_d;
        7 : array_array_303aa_q[255:224] <= array_array_303aa_d;
        8 : array_array_303aa_q[287:256] <= array_array_303aa_d;
        9 : array_array_303aa_q[319:288] <= array_array_303aa_d;
        10 : array_array_303aa_q[351:320] <= array_array_303aa_d;
        11 : array_array_303aa_q[383:352] <= array_array_303aa_d;
        12 : array_array_303aa_q[415:384] <= array_array_303aa_d;
        13 : array_array_303aa_q[447:416] <= array_array_303aa_d;
        14 : array_array_303aa_q[479:448] <= array_array_303aa_d;
        15 : array_array_303aa_q[511:480] <= array_array_303aa_d;
        16 : array_array_303aa_q[543:512] <= array_array_303aa_d;
        17 : array_array_303aa_q[575:544] <= array_array_303aa_d;
        18 : array_array_303aa_q[607:576] <= array_array_303aa_d;
        19 : array_array_303aa_q[639:608] <= array_array_303aa_d;
        20 : array_array_303aa_q[671:640] <= array_array_303aa_d;
        21 : array_array_303aa_q[703:672] <= array_array_303aa_d;
        22 : array_array_303aa_q[735:704] <= array_array_303aa_d;
        23 : array_array_303aa_q[767:736] <= array_array_303aa_d;
        24 : array_array_303aa_q[799:768] <= array_array_303aa_d;
        25 : array_array_303aa_q[831:800] <= array_array_303aa_d;
        26 : array_array_303aa_q[863:832] <= array_array_303aa_d;
        27 : array_array_303aa_q[895:864] <= array_array_303aa_d;
        28 : array_array_303aa_q[927:896] <= array_array_303aa_d;
        29 : array_array_303aa_q[959:928] <= array_array_303aa_d;
        30 : array_array_303aa_q[991:960] <= array_array_303aa_d;
        31 : array_array_303aa_q[1023:992] <= array_array_303aa_d;
        default: ;
      endcase
    end
  /* Array: array_36ebd[1 x i8] */
  logic [7:0] array_array_36ebd_q;
  logic [7:0] array_array_36ebd_driver_F1_d;
  logic [0:0] array_array_36ebd_driver_F1_w;
  logic [0:0] array_array_36ebd_driver_F1_widx;
  logic [7:0] array_array_36ebd_d;
  logic [0:0] array_array_36ebd_widx;
  logic [0:0] array_array_36ebd_w;
  assign array_array_36ebd_d = ({ 8 { array_array_36ebd_driver_F1_w } } & array_array_36ebd_driver_F1_d);
  assign array_array_36ebd_widx = ({ 1 { array_array_36ebd_driver_F1_w } } & array_array_36ebd_driver_F1_widx);
  assign array_array_36ebd_w = array_array_36ebd_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_36ebd_q[7:0] <= 8'd0;
    end
    else if (array_array_36ebd_w) begin

      case (array_array_36ebd_widx)
        0 : array_array_36ebd_q[7:0] <= array_array_36ebd_d;
        default: ;
      endcase
    end
  /* Array: array_3e7da[32 x b32] */
  logic [31:0] array_array_3e7da_q;
  logic [31:0] array_array_3e7da_driver_init_cache_d;
  logic [0:0] array_array_3e7da_driver_init_cache_w;
  logic [4:0] array_array_3e7da_driver_init_cache_widx;
  /* Array: array_303ce[1 x b32] */
  logic [31:0] array_array_303ce_q;
  logic [31:0] array_array_303ce_driver_W1_d;
  logic [0:0] array_array_303ce_driver_W1_w;
  logic [0:0] array_array_303ce_driver_W1_widx;
  assign array_array_303ce_exposed_o = array_array_303ce_q;
  logic [31:0] array_array_303ce_d;
  logic [0:0] array_array_303ce_widx;
  logic [0:0] array_array_303ce_w;
  assign array_array_303ce_d = ({ 32 { array_array_303ce_driver_W1_w } } & array_array_303ce_driver_W1_d);
  assign array_array_303ce_widx = ({ 1 { array_array_303ce_driver_W1_w } } & array_array_303ce_driver_W1_widx);
  assign array_array_303ce_w = array_array_303ce_driver_W1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303ce_q <= 32'd0;
    else if (array_array_303ce_w) begin

      case (array_array_303ce_widx)
        0 : array_array_303ce_q[31:0] <= array_array_303ce_d;
        default: ;
      endcase
    end
  /* Array: array_303b0[16 x b32] */
  logic [511:0] array_array_303b0_q;
  logic [31:0] array_array_303b0_driver_e_d;
  logic [0:0] array_array_303b0_driver_e_w;
  logic [3:0] array_array_303b0_driver_e_widx;
  assign array_array_303b0_exposed_o = array_array_303b0_q;
  logic [31:0] array_array_303b0_temp;
  assign array_array_303b0_temp = array_array_303b0_exposed_i_valid?array_array_303b0_exposed_i:array_array_303b0_d;
  logic [31:0] array_array_303b0_d;
  logic [3:0] array_array_303b0_widx;
  logic [0:0] array_array_303b0_w;
  assign array_array_303b0_d = ({ 32 { array_array_303b0_driver_e_w } } & array_array_303b0_driver_e_d);
  assign array_array_303b0_widx = ({ 4 { array_array_303b0_driver_e_w } } & array_array_303b0_driver_e_widx);
  assign array_array_303b0_w = array_array_303b0_driver_e_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_303b0_q[31:0] <= 32'd0;
      array_array_303b0_q[63:32] <= 32'd0;
      array_array_303b0_q[95:64] <= 32'd0;
      array_array_303b0_q[127:96] <= 32'd0;
      array_array_303b0_q[159:128] <= 32'd0;
      array_array_303b0_q[191:160] <= 32'd0;
      array_array_303b0_q[223:192] <= 32'd0;
      array_array_303b0_q[255:224] <= 32'd0;
      array_array_303b0_q[287:256] <= 32'd0;
      array_array_303b0_q[319:288] <= 32'd0;
      array_array_303b0_q[351:320] <= 32'd0;
      array_array_303b0_q[383:352] <= 32'd0;
      array_array_303b0_q[415:384] <= 32'd0;
      array_array_303b0_q[447:416] <= 32'd0;
      array_array_303b0_q[479:448] <= 32'd0;
      array_array_303b0_q[511:480] <= 32'd0;
    end
    else if (array_array_303b0_w) begin

      case (array_array_303b0_widx)
        0 : array_array_303b0_q[31:0] <= array_array_303b0_temp;
        1 : array_array_303b0_q[63:32] <= array_array_303b0_temp;
        2 : array_array_303b0_q[95:64] <= array_array_303b0_temp;
        3 : array_array_303b0_q[127:96] <= array_array_303b0_temp;
        4 : array_array_303b0_q[159:128] <= array_array_303b0_temp;
        5 : array_array_303b0_q[191:160] <= array_array_303b0_temp;
        6 : array_array_303b0_q[223:192] <= array_array_303b0_temp;
        7 : array_array_303b0_q[255:224] <= array_array_303b0_temp;
        8 : array_array_303b0_q[287:256] <= array_array_303b0_temp;
        9 : array_array_303b0_q[319:288] <= array_array_303b0_temp;
        10 : array_array_303b0_q[351:320] <= array_array_303b0_temp;
        11 : array_array_303b0_q[383:352] <= array_array_303b0_temp;
        12 : array_array_303b0_q[415:384] <= array_array_303b0_temp;
        13 : array_array_303b0_q[447:416] <= array_array_303b0_temp;
        14 : array_array_303b0_q[479:448] <= array_array_303b0_temp;
        15 : array_array_303b0_q[511:480] <= array_array_303b0_temp;
        default: ;
      endcase
    end
  /* Array: array_303e6[1 x b1] */
  logic [0:0] array_array_303e6_q;
  logic [0:0] array_array_303e6_driver_F1_d;
  logic [0:0] array_array_303e6_driver_F1_w;
  logic [0:0] array_array_303e6_driver_F1_widx;
  logic [0:0] array_array_303e6_d;
  logic [0:0] array_array_303e6_widx;
  logic [0:0] array_array_303e6_w;
  assign array_array_303e6_d = ({ 1 { array_array_303e6_driver_F1_w } } & array_array_303e6_driver_F1_d);
  assign array_array_303e6_widx = ({ 1 { array_array_303e6_driver_F1_w } } & array_array_303e6_driver_F1_widx);
  assign array_array_303e6_w = array_array_303e6_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303e6_q <= 1'd0;
    else if (array_array_303e6_w) begin

      case (array_array_303e6_widx)
        0 : array_array_303e6_q[0:0] <= array_array_303e6_d;
        default: ;
      endcase
    end
  /* Array: array_3e6a8[65536 x b32] */
  logic [31:0] array_array_3e6a8_q;
  logic [31:0] array_array_3e6a8_driver_icache_d;
  logic [0:0] array_array_3e6a8_driver_icache_w;
  logic [15:0] array_array_3e6a8_driver_icache_widx;
  /* Array: array_36c8f[65536 x b32] */
  logic [31:0] array_array_36c8f_q;
  logic [31:0] array_array_36c8f_driver_dcache_d;
  logic [0:0] array_array_36c8f_driver_dcache_w;
  logic [15:0] array_array_36c8f_driver_dcache_widx;
  /* Array: array_303b6[1 x b5] */
  logic [4:0] array_array_303b6_q;
  logic [4:0] array_array_303b6_driver_m_d;
  logic [0:0] array_array_303b6_driver_m_w;
  logic [0:0] array_array_303b6_driver_m_widx;
  logic [4:0] array_array_303b6_d;
  logic [0:0] array_array_303b6_widx;
  logic [0:0] array_array_303b6_w;
  assign array_array_303b6_d = ({ 5 { array_array_303b6_driver_m_w } } & array_array_303b6_driver_m_d);
  assign array_array_303b6_widx = ({ 1 { array_array_303b6_driver_m_w } } & array_array_303b6_driver_m_widx);
  assign array_array_303b6_w = array_array_303b6_driver_m_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303b6_q <= 5'd0;
    else if (array_array_303b6_w) begin

      case (array_array_303b6_widx)
        0 : array_array_303b6_q[4:0] <= array_array_303b6_d;
        default: ;
      endcase
    end
  /* Array: array_303a7[1 x b5] */
  logic [4:0] array_array_303a7_q;
  logic [4:0] array_array_303a7_driver_e_d;
  logic [0:0] array_array_303a7_driver_e_w;
  logic [0:0] array_array_303a7_driver_e_widx;
  logic [4:0] array_array_303a7_d;
  logic [0:0] array_array_303a7_widx;
  logic [0:0] array_array_303a7_w;
  assign array_array_303a7_d = ({ 5 { array_array_303a7_driver_e_w } } & array_array_303a7_driver_e_d);
  assign array_array_303a7_widx = ({ 1 { array_array_303a7_driver_e_w } } & array_array_303a7_driver_e_widx);
  assign array_array_303a7_w = array_array_303a7_driver_e_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_303a7_q <= 5'd0;
    else if (array_array_303a7_w) begin

      case (array_array_303a7_widx)
        0 : array_array_303a7_q[4:0] <= array_array_303a7_d;
        default: ;
      endcase
    end
  /* Array: array_30398[1 x b32] */
  logic [31:0] array_array_30398_q;
  logic [31:0] array_array_30398_driver_F1_d;
  logic [0:0] array_array_30398_driver_F1_w;
  logic [0:0] array_array_30398_driver_F1_widx;
  assign array_array_30398_exposed_o = array_array_30398_q;
  logic [31:0] array_array_30398_d;
  logic [0:0] array_array_30398_widx;
  logic [0:0] array_array_30398_w;
  assign array_array_30398_d = ({ 32 { array_array_30398_driver_F1_w } } & array_array_30398_driver_F1_d);
  assign array_array_30398_widx = ({ 1 { array_array_30398_driver_F1_w } } & array_array_30398_driver_F1_widx);
  assign array_array_30398_w = array_array_30398_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_30398_q <= 32'd0;
    else if (array_array_30398_w) begin

      case (array_array_30398_widx)
        0 : array_array_30398_q[31:0] <= array_array_30398_d;
        default: ;
      endcase
    end
  // fifo: rdata: fifo<b32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_memuser_30344_rdata_pop_data;
  logic [0:0] fifo_memuser_30344_rdata_pop_valid;
  logic [0:0] fifo_memuser_30344_rdata_pop_ready;
  logic [31:0] fifo_memuser_30344_rdata_driver_init_cache_push_data;
  logic [0:0] fifo_memuser_30344_rdata_driver_init_cache_push_valid;
  logic [0:0] fifo_memuser_30344_rdata_driver_init_cache_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_memuser_30344_rdata_push_ready;
  assign fifo_memuser_30344_rdata_driver_init_cache_push_ready = fifo_memuser_30344_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_memuser_30344_rdata_push_valid;
  assign fifo_memuser_30344_rdata_push_valid = fifo_memuser_30344_rdata_driver_init_cache_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_memuser_30344_rdata_push_data;
  assign fifo_memuser_30344_rdata_push_data = ({ 32 { fifo_memuser_30344_rdata_driver_init_cache_push_valid } } & fifo_memuser_30344_rdata_driver_init_cache_push_data);

  fifo #(32, 0) fifo_memuser_30344_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_memuser_30344_rdata_push_valid),
    .push_data(fifo_memuser_30344_rdata_push_data),
    .push_ready(fifo_memuser_30344_rdata_push_ready),
    .pop_valid(fifo_memuser_30344_rdata_pop_valid),
    .pop_data(fifo_memuser_30344_rdata_pop_data),
    .pop_ready(fifo_memuser_30344_rdata_pop_ready));

  // fifo: mem_ext: fifo<b2>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [1:0] fifo_m_mem_ext_pop_data;
  logic [0:0] fifo_m_mem_ext_pop_valid;
  logic [0:0] fifo_m_mem_ext_pop_ready;
  logic [1:0] fifo_m_mem_ext_driver_e_push_data;
  logic [0:0] fifo_m_mem_ext_driver_e_push_valid;
  logic [0:0] fifo_m_mem_ext_driver_e_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_m_mem_ext_push_ready;
  assign fifo_m_mem_ext_driver_e_push_ready = fifo_m_mem_ext_push_ready;  // Gather all the push signal
  logic [0:0] fifo_m_mem_ext_push_valid;
  assign fifo_m_mem_ext_push_valid = fifo_m_mem_ext_driver_e_push_valid;
  // 1-hot select the push data
  logic [1:0] fifo_m_mem_ext_push_data;
  assign fifo_m_mem_ext_push_data = ({ 2 { fifo_m_mem_ext_driver_e_push_valid } } & fifo_m_mem_ext_driver_e_push_data);

  fifo #(2, 0) fifo_m_mem_ext_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_m_mem_ext_push_valid),
    .push_data(fifo_m_mem_ext_push_data),
    .push_ready(fifo_m_mem_ext_push_ready),
    .pop_valid(fifo_m_mem_ext_pop_valid),
    .pop_data(fifo_m_mem_ext_pop_data),
    .pop_ready(fifo_m_mem_ext_pop_ready));

  // fifo: result: fifo<b32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_m_result_pop_data;
  logic [0:0] fifo_m_result_pop_valid;
  logic [0:0] fifo_m_result_pop_ready;
  logic [31:0] fifo_m_result_driver_e_push_data;
  logic [0:0] fifo_m_result_driver_e_push_valid;
  logic [0:0] fifo_m_result_driver_e_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_m_result_push_ready;
  assign fifo_m_result_driver_e_push_ready = fifo_m_result_push_ready;  // Gather all the push signal
  logic [0:0] fifo_m_result_push_valid;
  assign fifo_m_result_push_valid = fifo_m_result_driver_e_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_m_result_push_data;
  assign fifo_m_result_push_data = ({ 32 { fifo_m_result_driver_e_push_valid } } & fifo_m_result_driver_e_push_data);

  fifo #(32, 0) fifo_m_result_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_m_result_push_valid),
    .push_data(fifo_m_result_push_data),
    .push_ready(fifo_m_result_push_ready),
    .pop_valid(fifo_m_result_pop_valid),
    .pop_data(fifo_m_result_pop_data),
    .pop_ready(fifo_m_result_pop_ready));

  // fifo: rdata: fifo<b32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_m_rdata_pop_data;
  logic [0:0] fifo_m_rdata_pop_valid;
  logic [0:0] fifo_m_rdata_pop_ready;
  logic [31:0] fifo_m_rdata_driver_dcache_push_data;
  logic [0:0] fifo_m_rdata_driver_dcache_push_valid;
  logic [0:0] fifo_m_rdata_driver_dcache_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_m_rdata_push_ready;
  assign fifo_m_rdata_driver_dcache_push_ready = fifo_m_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_m_rdata_push_valid;
  assign fifo_m_rdata_push_valid = fifo_m_rdata_driver_dcache_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_m_rdata_push_data;
  assign fifo_m_rdata_push_data = ({ 32 { fifo_m_rdata_driver_dcache_push_valid } } & fifo_m_rdata_driver_dcache_push_data);

  fifo #(32, 0) fifo_m_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_m_rdata_push_valid),
    .push_data(fifo_m_rdata_push_data),
    .push_ready(fifo_m_rdata_push_ready),
    .pop_valid(fifo_m_rdata_pop_valid),
    .pop_data(fifo_m_rdata_pop_data),
    .pop_ready(fifo_m_rdata_pop_ready));

  // fifo: rd: fifo<b5>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [4:0] fifo_m_rd_pop_data;
  logic [0:0] fifo_m_rd_pop_valid;
  logic [0:0] fifo_m_rd_pop_ready;
  logic [4:0] fifo_m_rd_driver_e_push_data;
  logic [0:0] fifo_m_rd_driver_e_push_valid;
  logic [0:0] fifo_m_rd_driver_e_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_m_rd_push_ready;
  assign fifo_m_rd_driver_e_push_ready = fifo_m_rd_push_ready;  // Gather all the push signal
  logic [0:0] fifo_m_rd_push_valid;
  assign fifo_m_rd_push_valid = fifo_m_rd_driver_e_push_valid;
  // 1-hot select the push data
  logic [4:0] fifo_m_rd_push_data;
  assign fifo_m_rd_push_data = ({ 5 { fifo_m_rd_driver_e_push_valid } } & fifo_m_rd_driver_e_push_data);

  fifo #(5, 0) fifo_m_rd_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_m_rd_push_valid),
    .push_data(fifo_m_rd_push_data),
    .push_ready(fifo_m_rd_push_ready),
    .pop_valid(fifo_m_rd_pop_valid),
    .pop_data(fifo_m_rd_pop_data),
    .pop_ready(fifo_m_rd_pop_ready));

  // fifo: fetch_addr: fifo<b32>, depth: 2
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_e_fetch_addr_pop_data;
  logic [0:0] fifo_e_fetch_addr_pop_valid;
  logic [0:0] fifo_e_fetch_addr_pop_ready;
  logic [31:0] fifo_e_fetch_addr_driver_d_push_data;
  logic [0:0] fifo_e_fetch_addr_driver_d_push_valid;
  logic [0:0] fifo_e_fetch_addr_driver_d_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_e_fetch_addr_push_ready;
  assign fifo_e_fetch_addr_driver_d_push_ready = fifo_e_fetch_addr_push_ready;  // Gather all the push signal
  logic [0:0] fifo_e_fetch_addr_push_valid;
  assign fifo_e_fetch_addr_push_valid = fifo_e_fetch_addr_driver_d_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_e_fetch_addr_push_data;
  assign fifo_e_fetch_addr_push_data = ({ 32 { fifo_e_fetch_addr_driver_d_push_valid } } & fifo_e_fetch_addr_driver_d_push_data);

  fifo #(32, 1) fifo_e_fetch_addr_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_e_fetch_addr_push_valid),
    .push_data(fifo_e_fetch_addr_push_data),
    .push_ready(fifo_e_fetch_addr_push_ready),
    .pop_valid(fifo_e_fetch_addr_pop_valid),
    .pop_data(fifo_e_fetch_addr_pop_data),
    .pop_ready(fifo_e_fetch_addr_pop_ready));

  // fifo: signals: fifo<b97>, depth: 2
  // Declare the pop.{data/valid/ready}
  logic [96:0] fifo_e_signals_pop_data;
  logic [0:0] fifo_e_signals_pop_valid;
  logic [0:0] fifo_e_signals_pop_ready;
  logic [96:0] fifo_e_signals_driver_d_push_data;
  logic [0:0] fifo_e_signals_driver_d_push_valid;
  logic [0:0] fifo_e_signals_driver_d_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_e_signals_push_ready;
  assign fifo_e_signals_driver_d_push_ready = fifo_e_signals_push_ready;  // Gather all the push signal
  logic [0:0] fifo_e_signals_push_valid;
  assign fifo_e_signals_push_valid = fifo_e_signals_driver_d_push_valid;
  // 1-hot select the push data
  logic [96:0] fifo_e_signals_push_data;
  assign fifo_e_signals_push_data = ({ 97 { fifo_e_signals_driver_d_push_valid } } & fifo_e_signals_driver_d_push_data);

  fifo #(97, 1) fifo_e_signals_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_e_signals_push_valid),
    .push_data(fifo_e_signals_push_data),
    .push_ready(fifo_e_signals_push_ready),
    .pop_valid(fifo_e_signals_pop_valid),
    .pop_data(fifo_e_signals_pop_data),
    .pop_ready(fifo_e_signals_pop_ready));

  // fifo: rd: fifo<b5>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [4:0] fifo_w_rd_pop_data;
  logic [0:0] fifo_w_rd_pop_valid;
  logic [0:0] fifo_w_rd_pop_ready;
  logic [4:0] fifo_w_rd_driver_m_push_data;
  logic [0:0] fifo_w_rd_driver_m_push_valid;
  logic [0:0] fifo_w_rd_driver_m_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_w_rd_push_ready;
  assign fifo_w_rd_driver_m_push_ready = fifo_w_rd_push_ready;  // Gather all the push signal
  logic [0:0] fifo_w_rd_push_valid;
  assign fifo_w_rd_push_valid = fifo_w_rd_driver_m_push_valid;
  // 1-hot select the push data
  logic [4:0] fifo_w_rd_push_data;
  assign fifo_w_rd_push_data = ({ 5 { fifo_w_rd_driver_m_push_valid } } & fifo_w_rd_driver_m_push_data);

  fifo #(5, 0) fifo_w_rd_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_w_rd_push_valid),
    .push_data(fifo_w_rd_push_data),
    .push_ready(fifo_w_rd_push_ready),
    .pop_valid(fifo_w_rd_pop_valid),
    .pop_data(fifo_w_rd_pop_data),
    .pop_ready(fifo_w_rd_pop_ready));

  // fifo: mdata: fifo<b32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_w_mdata_pop_data;
  logic [0:0] fifo_w_mdata_pop_valid;
  logic [0:0] fifo_w_mdata_pop_ready;
  logic [31:0] fifo_w_mdata_driver_m_push_data;
  logic [0:0] fifo_w_mdata_driver_m_push_valid;
  logic [0:0] fifo_w_mdata_driver_m_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_w_mdata_push_ready;
  assign fifo_w_mdata_driver_m_push_ready = fifo_w_mdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_w_mdata_push_valid;
  assign fifo_w_mdata_push_valid = fifo_w_mdata_driver_m_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_w_mdata_push_data;
  assign fifo_w_mdata_push_data = ({ 32 { fifo_w_mdata_driver_m_push_valid } } & fifo_w_mdata_driver_m_push_data);

  fifo #(32, 0) fifo_w_mdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_w_mdata_push_valid),
    .push_data(fifo_w_mdata_push_data),
    .push_ready(fifo_w_mdata_push_ready),
    .pop_valid(fifo_w_mdata_pop_valid),
    .pop_data(fifo_w_mdata_pop_data),
    .pop_ready(fifo_w_mdata_pop_ready));

  // fifo: fetch_addr: fifo<b32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_d_fetch_addr_pop_data;
  logic [0:0] fifo_d_fetch_addr_pop_valid;
  logic [0:0] fifo_d_fetch_addr_pop_ready;
  logic [31:0] fifo_d_fetch_addr_driver_F1_push_data;
  logic [0:0] fifo_d_fetch_addr_driver_F1_push_valid;
  logic [0:0] fifo_d_fetch_addr_driver_F1_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_d_fetch_addr_push_ready;
  assign fifo_d_fetch_addr_driver_F1_push_ready = fifo_d_fetch_addr_push_ready;  // Gather all the push signal
  logic [0:0] fifo_d_fetch_addr_push_valid;
  assign fifo_d_fetch_addr_push_valid = fifo_d_fetch_addr_driver_F1_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_d_fetch_addr_push_data;
  assign fifo_d_fetch_addr_push_data = ({ 32 { fifo_d_fetch_addr_driver_F1_push_valid } } & fifo_d_fetch_addr_driver_F1_push_data);

  fifo #(32, 0) fifo_d_fetch_addr_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_d_fetch_addr_push_valid),
    .push_data(fifo_d_fetch_addr_push_data),
    .push_ready(fifo_d_fetch_addr_push_ready),
    .pop_valid(fifo_d_fetch_addr_pop_valid),
    .pop_data(fifo_d_fetch_addr_pop_data),
    .pop_ready(fifo_d_fetch_addr_pop_ready));

  // fifo: rdata: fifo<b32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_d_rdata_pop_data;
  logic [0:0] fifo_d_rdata_pop_valid;
  logic [0:0] fifo_d_rdata_pop_ready;
  logic [31:0] fifo_d_rdata_driver_icache_push_data;
  logic [0:0] fifo_d_rdata_driver_icache_push_valid;
  logic [0:0] fifo_d_rdata_driver_icache_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_d_rdata_push_ready;
  assign fifo_d_rdata_driver_icache_push_ready = fifo_d_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_d_rdata_push_valid;
  assign fifo_d_rdata_push_valid = fifo_d_rdata_driver_icache_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_d_rdata_push_data;
  assign fifo_d_rdata_push_data = ({ 32 { fifo_d_rdata_driver_icache_push_valid } } & fifo_d_rdata_driver_icache_push_data);

  fifo #(32, 0) fifo_d_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_d_rdata_push_valid),
    .push_data(fifo_d_rdata_push_data),
    .push_ready(fifo_d_rdata_push_ready),
    .pop_valid(fifo_d_rdata_pop_valid),
    .pop_data(fifo_d_rdata_pop_data),
    .pop_ready(fifo_d_rdata_pop_ready));

  // Trigger SM of Module: memuser_30344
  logic [7:0] memuser_30344_driver_driver_counter_delta;
  logic [0:0] memuser_30344_driver_driver_counter_delta_ready;
  logic [0:0] memuser_30344_counter_delta_ready;
  logic [7:0] memuser_30344_counter_delta;
  // Gather all the push signal
  assign memuser_30344_counter_delta = memuser_30344_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] memuser_30344_counter_pop_ready;
  assign memuser_30344_driver_driver_counter_delta_ready = memuser_30344_counter_pop_ready;
  logic [0:0] memuser_30344_counter_pop_valid;

  trigger_counter #(8) memuser_30344_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(memuser_30344_counter_delta),
    .delta_ready(memuser_30344_counter_delta_ready),
    .pop_valid(memuser_30344_counter_pop_valid),
    .pop_ready(memuser_30344_counter_pop_ready));
  // Trigger SM of Module: m
  logic [7:0] m_driver_e_counter_delta;
  logic [0:0] m_driver_e_counter_delta_ready;
  logic [0:0] m_counter_delta_ready;
  logic [7:0] m_counter_delta;
  // Gather all the push signal
  assign m_counter_delta = m_driver_e_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] m_counter_pop_ready;
  assign m_driver_e_counter_delta_ready = m_counter_pop_ready;
  logic [0:0] m_counter_pop_valid;

  trigger_counter #(8) m_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(m_counter_delta),
    .delta_ready(m_counter_delta_ready),
    .pop_valid(m_counter_pop_valid),
    .pop_ready(m_counter_pop_ready));
  // Trigger SM of Module: e
  logic [7:0] e_driver_d_counter_delta;
  logic [0:0] e_driver_d_counter_delta_ready;
  logic [0:0] e_counter_delta_ready;
  logic [7:0] e_counter_delta;
  // Gather all the push signal
  assign e_counter_delta = e_driver_d_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] e_counter_pop_ready;
  assign e_driver_d_counter_delta_ready = e_counter_pop_ready;
  logic [0:0] e_counter_pop_valid;

  trigger_counter #(8) e_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(e_counter_delta),
    .delta_ready(e_counter_delta_ready),
    .pop_valid(e_counter_pop_valid),
    .pop_ready(e_counter_pop_ready));
  // Trigger SM of Module: w
  logic [7:0] w_driver_m_counter_delta;
  logic [0:0] w_driver_m_counter_delta_ready;
  logic [0:0] w_counter_delta_ready;
  logic [7:0] w_counter_delta;
  // Gather all the push signal
  assign w_counter_delta = w_driver_m_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] w_counter_pop_ready;
  assign w_driver_m_counter_delta_ready = w_counter_pop_ready;
  logic [0:0] w_counter_pop_valid;

  trigger_counter #(8) w_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(w_counter_delta),
    .delta_ready(w_counter_delta_ready),
    .pop_valid(w_counter_pop_valid),
    .pop_ready(w_counter_pop_ready));
  // Trigger SM of Module: f
  logic [7:0] f_driver_driver_counter_delta;
  logic [0:0] f_driver_driver_counter_delta_ready;
  logic [0:0] f_counter_delta_ready;
  logic [7:0] f_counter_delta;
  // Gather all the push signal
  assign f_counter_delta = f_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] f_counter_pop_ready;
  assign f_driver_driver_counter_delta_ready = f_counter_pop_ready;
  logic [0:0] f_counter_pop_valid;

  trigger_counter #(8) f_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(f_counter_delta),
    .delta_ready(f_counter_delta_ready),
    .pop_valid(f_counter_pop_valid),
    .pop_ready(f_counter_pop_ready));
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
  // Trigger SM of Module: d
  logic [7:0] d_driver_F1_counter_delta;
  logic [0:0] d_driver_F1_counter_delta_ready;
  logic [0:0] d_counter_delta_ready;
  logic [7:0] d_counter_delta;
  // Gather all the push signal
  assign d_counter_delta = d_driver_F1_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] d_counter_pop_ready;
  assign d_driver_F1_counter_delta_ready = d_counter_pop_ready;
  logic [0:0] d_counter_pop_valid;

  trigger_counter #(8) d_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(d_counter_delta),
    .delta_ready(d_counter_delta_ready),
    .pop_valid(d_counter_pop_valid),
    .pop_ready(d_counter_pop_ready));
  assign driver_counter_delta = 8'b1;

  logic [0:0] memuser_30344_executed;

  // memuser_30344
  memuser_30344 memuser_30344_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_rdata_pop_ready(fifo_memuser_30344_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_memuser_30344_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_memuser_30344_rdata_pop_valid),
    .array_array_4dc17_w(array_array_4dc17_driver_memuser_30344_w),
    .array_array_4dc17_widx(array_array_4dc17_driver_memuser_30344_widx),
    .array_array_4dc17_d(array_array_4dc17_driver_memuser_30344_d),
    .counter_delta_ready(memuser_30344_counter_delta_ready),
    .counter_pop_ready(memuser_30344_counter_pop_ready),
    .counter_pop_valid(memuser_30344_counter_pop_valid),
    .expose_executed(memuser_30344_executed));
  logic [0:0] m_executed;

  // m
  m m_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_mem_ext_pop_ready(fifo_m_mem_ext_pop_ready),
    .fifo_mem_ext_pop_data(fifo_m_mem_ext_pop_data),
    .fifo_mem_ext_pop_valid(fifo_m_mem_ext_pop_valid),
    .fifo_result_pop_ready(fifo_m_result_pop_ready),
    .fifo_result_pop_data(fifo_m_result_pop_data),
    .fifo_result_pop_valid(fifo_m_result_pop_valid),
    .fifo_rdata_pop_ready(fifo_m_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_m_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_m_rdata_pop_valid),
    .fifo_rd_pop_ready(fifo_m_rd_pop_ready),
    .fifo_rd_pop_data(fifo_m_rd_pop_data),
    .fifo_rd_pop_valid(fifo_m_rd_pop_valid),
    .fifo_w_rd_push_valid(fifo_w_rd_driver_m_push_valid),
    .fifo_w_rd_push_data(fifo_w_rd_driver_m_push_data),
    .fifo_w_rd_push_ready(fifo_w_rd_driver_m_push_ready),
    .array_array_303c2_w(array_array_303c2_driver_m_w),
    .array_array_303c2_widx(array_array_303c2_driver_m_widx),
    .array_array_303c2_d(array_array_303c2_driver_m_d),
    .fifo_w_mdata_push_valid(fifo_w_mdata_driver_m_push_valid),
    .fifo_w_mdata_push_data(fifo_w_mdata_driver_m_push_data),
    .fifo_w_mdata_push_ready(fifo_w_mdata_driver_m_push_ready),
    .array_array_303b6_w(array_array_303b6_driver_m_w),
    .array_array_303b6_widx(array_array_303b6_driver_m_widx),
    .array_array_303b6_d(array_array_303b6_driver_m_d),
    .array_array_303b3_w(array_array_303b3_driver_m_w),
    .array_array_303b3_widx(array_array_303b3_driver_m_widx),
    .array_array_303b3_d(array_array_303b3_driver_m_d),
    .array_array_3039b_w(array_array_3039b_driver_m_w),
    .array_array_3039b_widx(array_array_3039b_driver_m_widx),
    .array_array_3039b_d(array_array_3039b_driver_m_d),
    .w_counter_delta_ready(w_driver_m_counter_delta_ready),
    .w_counter_delta(w_driver_m_counter_delta),
    .counter_delta_ready(m_counter_delta_ready),
    .counter_pop_ready(m_counter_pop_ready),
    .counter_pop_valid(m_counter_pop_valid),
    .expose_executed(m_executed));
  logic [31:0] logic_var_1064;
  logic [0:0] logic_var_1064_valid;
  logic [0:0] logic_var_1302;
  logic [0:0] logic_var_1302_valid;
  logic [15:0] logic_var_1409;
  logic [0:0] logic_var_1409_valid;
  logic [0:0] logic_var_1376;
  logic [0:0] logic_var_1376_valid;
  logic [0:0] logic_var_1294;
  logic [0:0] logic_var_1294_valid;
  logic [4:0] logic_var_845;
  logic [0:0] logic_var_845_valid;
  logic [0:0] logic_var_494;
  logic [0:0] logic_var_494_valid;
  logic [0:0] e_executed;

  // e
  e e_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_fetch_addr_pop_ready(fifo_e_fetch_addr_pop_ready),
    .fifo_fetch_addr_pop_data(fifo_e_fetch_addr_pop_data),
    .fifo_fetch_addr_pop_valid(fifo_e_fetch_addr_pop_valid),
    .fifo_signals_pop_ready(fifo_e_signals_pop_ready),
    .fifo_signals_pop_data(fifo_e_signals_pop_data),
    .fifo_signals_pop_valid(fifo_e_signals_pop_valid),
    .m_counter_delta_ready(m_driver_e_counter_delta_ready),
    .m_counter_delta(m_driver_e_counter_delta),
    .array_array_303a4_q(array_array_303a4_q),
    .array_array_303a4_w(array_array_303a4_driver_e_w),
    .array_array_303a4_widx(array_array_303a4_driver_e_widx),
    .array_array_303a4_d(array_array_303a4_driver_e_d),
    .array_array_303b3_q(array_array_303b3_q),
    .fifo_m_rd_push_valid(fifo_m_rd_driver_e_push_valid),
    .fifo_m_rd_push_data(fifo_m_rd_driver_e_push_data),
    .fifo_m_rd_push_ready(fifo_m_rd_driver_e_push_ready),
    .array_array_4dc17_q(array_array_4dc17_q),
    .array_array_303b0_q(array_array_303b0_q),
    .array_array_303b0_w(array_array_303b0_driver_e_w),
    .array_array_303b0_widx(array_array_303b0_driver_e_widx),
    .array_array_303b0_d(array_array_303b0_driver_e_d),
    .array_array_303ce_q(array_array_303ce_q),
    .array_array_303aa_q(array_array_303aa_q),
    .fifo_m_result_push_valid(fifo_m_result_driver_e_push_valid),
    .fifo_m_result_push_data(fifo_m_result_driver_e_push_data),
    .fifo_m_result_push_ready(fifo_m_result_driver_e_push_ready),
    .array_array_303d4_w(array_array_303d4_driver_e_w),
    .array_array_303d4_widx(array_array_303d4_driver_e_widx),
    .array_array_303d4_d(array_array_303d4_driver_e_d),
    .array_array_303a7_q(array_array_303a7_q),
    .array_array_303a7_w(array_array_303a7_driver_e_w),
    .array_array_303a7_widx(array_array_303a7_driver_e_widx),
    .array_array_303a7_d(array_array_303a7_driver_e_d),
    .array_array_303b6_q(array_array_303b6_q),
    .array_array_303c2_q(array_array_303c2_q),
    .fifo_m_mem_ext_push_valid(fifo_m_mem_ext_driver_e_push_valid),
    .fifo_m_mem_ext_push_data(fifo_m_mem_ext_driver_e_push_data),
    .fifo_m_mem_ext_push_ready(fifo_m_mem_ext_driver_e_push_ready),
    .array_array_3039b_q(array_array_3039b_q),
    .expose_var_1064(logic_var_1064),
    .expose_var_1064_valid(logic_var_1064_valid),
    .expose_var_1302(logic_var_1302),
    .expose_var_1302_valid(logic_var_1302_valid),
    .expose_var_1409(logic_var_1409),
    .expose_var_1409_valid(logic_var_1409_valid),
    .expose_var_1376(logic_var_1376),
    .expose_var_1376_valid(logic_var_1376_valid),
    .expose_var_1294(logic_var_1294),
    .expose_var_1294_valid(logic_var_1294_valid),
    .expose_var_845(logic_var_845),
    .expose_var_845_valid(logic_var_845_valid),
    .expose_var_494(logic_var_494),
    .expose_var_494_valid(logic_var_494_valid),
    .var_494_exposed_o(var_494_exposed_o),
    .counter_delta_ready(e_counter_delta_ready),
    .counter_pop_ready(e_counter_pop_ready),
    .counter_pop_valid(e_counter_pop_valid),
    .expose_executed(e_executed));
  logic [4:0] logic_var_80;
  logic [0:0] logic_var_80_valid;
  logic [0:0] w_executed;

  // w
  w w_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_rd_pop_ready(fifo_w_rd_pop_ready),
    .fifo_rd_pop_data(fifo_w_rd_pop_data),
    .fifo_rd_pop_valid(fifo_w_rd_pop_valid),
    .fifo_mdata_pop_ready(fifo_w_mdata_pop_ready),
    .fifo_mdata_pop_data(fifo_w_mdata_pop_data),
    .fifo_mdata_pop_valid(fifo_w_mdata_pop_valid),
    .array_array_303aa_w(array_array_303aa_driver_w_w),
    .array_array_303aa_widx(array_array_303aa_driver_w_widx),
    .array_array_303aa_d(array_array_303aa_driver_w_d),
    .expose_var_80(logic_var_80),
    .expose_var_80_valid(logic_var_80_valid),
    .counter_delta_ready(w_counter_delta_ready),
    .counter_pop_ready(w_counter_pop_ready),
    .counter_pop_valid(w_counter_pop_valid),
    .expose_executed(w_executed));
  logic [31:0] logic_var_77;
  logic [0:0] logic_var_77_valid;
  logic [0:0] f_executed;

  // f
  f f_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_30398_q(array_array_30398_q),
    .expose_var_77(logic_var_77),
    .expose_var_77_valid(logic_var_77_valid),
    .counter_delta_ready(f_counter_delta_ready),
    .counter_pop_ready(f_counter_pop_ready),
    .counter_pop_valid(f_counter_pop_valid),
    .expose_executed(f_executed));
  logic [0:0] logic_var_4805;
  logic [0:0] logic_var_4805_valid;
  logic [0:0] driver_executed;

  // driver
  driver driver_i (
    .clk(clk),
    .rst_n(rst_n),
    .memuser_30344_counter_delta_ready(memuser_30344_driver_driver_counter_delta_ready),
    .memuser_30344_counter_delta(memuser_30344_driver_driver_counter_delta),
    .f_counter_delta_ready(f_driver_driver_counter_delta_ready),
    .f_counter_delta(f_driver_driver_counter_delta),
    .array_array_3e7ce_q(array_array_3e7ce_q),
    .array_array_3e7ce_w(array_array_3e7ce_driver_driver_w),
    .array_array_3e7ce_widx(array_array_3e7ce_driver_driver_widx),
    .array_array_3e7ce_d(array_array_3e7ce_driver_driver_d),
    .expose_var_4805(logic_var_4805),
    .expose_var_4805_valid(logic_var_4805_valid),
    .counter_delta_ready(driver_counter_delta_ready),
    .counter_pop_ready(driver_counter_pop_ready),
    .counter_pop_valid(driver_counter_pop_valid),
    .expose_executed(driver_executed));
  logic [0:0] logic_var_4798;
  logic [0:0] logic_var_4798_valid;
  logic [0:0] d_executed;

  // d
  d d_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_fetch_addr_pop_ready(fifo_d_fetch_addr_pop_ready),
    .fifo_fetch_addr_pop_data(fifo_d_fetch_addr_pop_data),
    .fifo_fetch_addr_pop_valid(fifo_d_fetch_addr_pop_valid),
    .fifo_rdata_pop_ready(fifo_d_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_d_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_d_rdata_pop_valid),
    .fifo_e_fetch_addr_push_valid(fifo_e_fetch_addr_driver_d_push_valid),
    .fifo_e_fetch_addr_push_data(fifo_e_fetch_addr_driver_d_push_data),
    .fifo_e_fetch_addr_push_ready(fifo_e_fetch_addr_driver_d_push_ready),
    .fifo_e_signals_push_valid(fifo_e_signals_driver_d_push_valid),
    .fifo_e_signals_push_data(fifo_e_signals_driver_d_push_data),
    .fifo_e_signals_push_ready(fifo_e_signals_driver_d_push_ready),
    .e_counter_delta_ready(e_driver_d_counter_delta_ready),
    .e_counter_delta(e_driver_d_counter_delta),
    .expose_var_4798(logic_var_4798),
    .expose_var_4798_valid(logic_var_4798_valid),
    .counter_delta_ready(d_counter_delta_ready),
    .counter_pop_ready(d_counter_pop_ready),
    .counter_pop_valid(d_counter_pop_valid),
    .expose_executed(d_executed));
  logic [0:0] dcache_executed;

  // dcache
  dcache dcache_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_m_rdata_push_valid(fifo_m_rdata_driver_dcache_push_valid),
    .fifo_m_rdata_push_data(fifo_m_rdata_driver_dcache_push_data),
    .fifo_m_rdata_push_ready(fifo_m_rdata_driver_dcache_push_ready),
    // Upstream executed signals
    .e_executed(e_executed),
    .var_1294(logic_var_1294),
    .var_1294_valid(logic_var_1294_valid),
    .var_1409(logic_var_1409),
    .var_1409_valid(logic_var_1409_valid),
    .var_1064(logic_var_1064),
    .var_1064_valid(logic_var_1064_valid),
    .var_1302(logic_var_1302),
    .var_1302_valid(logic_var_1302_valid),
    .expose_executed(dcache_executed));
  logic [0:0] W1_executed;

  // W1
  W1 W1_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_303ce_q(array_array_303ce_q),
    .array_array_303ce_w(array_array_303ce_driver_W1_w),
    .array_array_303ce_widx(array_array_303ce_driver_W1_widx),
    .array_array_303ce_d(array_array_303ce_driver_W1_d),
    // Upstream executed signals
    .w_executed(w_executed),
    .e_executed(e_executed),
    .var_80(logic_var_80),
    .var_80_valid(logic_var_80_valid),
    .var_845(logic_var_845),
    .var_845_valid(logic_var_845_valid),
    .expose_executed(W1_executed));
  logic [0:0] icache_executed;

  // icache
  icache icache_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_d_rdata_push_valid(fifo_d_rdata_driver_icache_push_valid),
    .fifo_d_rdata_push_data(fifo_d_rdata_driver_icache_push_data),
    .fifo_d_rdata_push_ready(fifo_d_rdata_driver_icache_push_ready),
    // Upstream executed signals
    .F1_executed(F1_executed),
    .var_4953(logic_var_4953),
    .var_4953_valid(logic_var_4953_valid),
    .var_4982(logic_var_4982),
    .var_4982_valid(logic_var_4982_valid),
    .expose_executed(icache_executed));
  logic [15:0] logic_var_4982;
  logic [0:0] logic_var_4982_valid;
  logic [0:0] logic_var_4953;
  logic [0:0] logic_var_4953_valid;
  logic [0:0] F1_executed;

  // F1
  F1 F1_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_303da_q(array_array_303da_q),
    .array_array_303da_w(array_array_303da_driver_F1_w),
    .array_array_303da_widx(array_array_303da_driver_F1_widx),
    .array_array_303da_d(array_array_303da_driver_F1_d),
    .array_array_36ebd_q(array_array_36ebd_q),
    .array_array_36ebd_w(array_array_36ebd_driver_F1_w),
    .array_array_36ebd_widx(array_array_36ebd_driver_F1_widx),
    .array_array_36ebd_d(array_array_36ebd_driver_F1_d),
    .d_counter_delta_ready(d_driver_F1_counter_delta_ready),
    .d_counter_delta(d_driver_F1_counter_delta),
    .array_array_30398_w(array_array_30398_driver_F1_w),
    .array_array_30398_widx(array_array_30398_driver_F1_widx),
    .array_array_30398_d(array_array_30398_driver_F1_d),
    .array_array_303e0_q(array_array_303e0_q),
    .array_array_303e0_w(array_array_303e0_driver_F1_w),
    .array_array_303e0_widx(array_array_303e0_driver_F1_widx),
    .array_array_303e0_d(array_array_303e0_driver_F1_d),
    .array_array_303d4_q(array_array_303d4_q),
    .fifo_d_fetch_addr_push_valid(fifo_d_fetch_addr_driver_F1_push_valid),
    .fifo_d_fetch_addr_push_data(fifo_d_fetch_addr_driver_F1_push_data),
    .fifo_d_fetch_addr_push_ready(fifo_d_fetch_addr_driver_F1_push_ready),
    .array_array_36e75_q(array_array_36e75_q),
    .array_array_36e75_w(array_array_36e75_driver_F1_w),
    .array_array_36e75_widx(array_array_36e75_driver_F1_widx),
    .array_array_36e75_d(array_array_36e75_driver_F1_d),
    .array_array_303e6_q(array_array_303e6_q),
    .array_array_303e6_w(array_array_303e6_driver_F1_w),
    .array_array_303e6_widx(array_array_303e6_driver_F1_widx),
    .array_array_303e6_d(array_array_303e6_driver_F1_d),
    // Upstream executed signals
    .e_executed(e_executed),
    .f_executed(f_executed),
    .d_executed(d_executed),
    .expose_var_4982(logic_var_4982),
    .expose_var_4982_valid(logic_var_4982_valid),
    .expose_var_4953(logic_var_4953),
    .expose_var_4953_valid(logic_var_4953_valid),
    .var_77(logic_var_77),
    .var_77_valid(logic_var_77_valid),
    .var_494(logic_var_494),
    .var_494_valid(logic_var_494_valid),
    .var_4798(logic_var_4798),
    .var_4798_valid(logic_var_4798_valid),
    .var_1376(logic_var_1376),
    .var_1376_valid(logic_var_1376_valid),
    .expose_executed(F1_executed));
  logic [0:0] init_cache_executed;

  // init_cache
  init_cache init_cache_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_memuser_30344_rdata_push_valid(fifo_memuser_30344_rdata_driver_init_cache_push_valid),
    .fifo_memuser_30344_rdata_push_data(fifo_memuser_30344_rdata_driver_init_cache_push_data),
    .fifo_memuser_30344_rdata_push_ready(fifo_memuser_30344_rdata_driver_init_cache_push_ready),
    // Upstream executed signals
    .driver_executed(driver_executed),
    .var_4805(logic_var_4805),
    .var_4805_valid(logic_var_4805_valid),
    .expose_executed(init_cache_executed));
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
logic [31:0]array_array_30398_exposed_o;
logic [31:0]array_array_303ce_exposed_o;
logic [31:0]array_array_4dc17_exposed_o;
logic [31:0]array_array_4dc17_exposed_i;
logic array_array_4dc17_exposed_i_valid;

assign array_array_4dc17_exposed_i_valid = 1'd0;
assign array_array_4dc17_exposed_i = 32'd0;
logic [1023:0]array_array_303aa_exposed_o;
logic [0:0] var_494_exposed_o;
logic [511:0]array_array_303b0_exposed_o;
logic [31:0]array_array_303b0_exposed_i;
logic array_array_303b0_exposed_i_valid;

assign array_array_303b0_exposed_i_valid = 1'd0;
assign array_array_303b0_exposed_i = 32'd0;

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #60000100;
  


end

always #50 clk <= !clk;



top top_i (
  .clk(clk),
  .rst_n(rst_n),
  .array_array_30398_exposed_o(array_array_30398_exposed_o),
  .array_array_303ce_exposed_o(array_array_303ce_exposed_o),
  .array_array_4dc17_exposed_o(array_array_4dc17_exposed_o),
  .array_array_4dc17_exposed_i(array_array_4dc17_exposed_i),
  .array_array_4dc17_exposed_i_valid(array_array_4dc17_exposed_i_valid),
  .array_array_303aa_exposed_o(array_array_303aa_exposed_o),
  .var_494_exposed_o(var_494_exposed_o),
  .array_array_303b0_exposed_o(array_array_303b0_exposed_o),
  .array_array_303b0_exposed_i(array_array_303b0_exposed_i),
  .array_array_303b0_exposed_i_valid(array_array_303b0_exposed_i_valid)
);

endmodule


// End of: /home/ubuntu/minor_cpu.sv
////////////////////////////////////////////////////////////////
