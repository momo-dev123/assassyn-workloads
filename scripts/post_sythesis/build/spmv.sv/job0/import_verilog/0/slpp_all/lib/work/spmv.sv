
module memuser_72949 (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_7293a[1 x i32] */
  input logic [31:0] array_array_7293a_q,
  output logic [0:0] array_array_7293a_w,
  output logic [0:0] array_array_7293a_widx,
  output logic [31:0] array_array_7293a_d,

  /* Array: array_72934[1 x i32] */
  input logic [31:0] array_array_72934_q,
  output logic [0:0] array_array_72934_w,
  output logic [0:0] array_array_72934_widx,
  output logic [31:0] array_array_72934_d,

  /* Array: array_72928[1 x b3] */
  input logic [2:0] array_array_72928_q,

  /* Array: array_7292e[1 x i32] */
  input logic [31:0] array_array_7292e_q,
  output logic [0:0] array_array_7292e_w,
  output logic [0:0] array_array_7292e_widx,
  output logic [31:0] array_array_7292e_d,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [0:0] var_31;
  assign var_31 = fifo_rdata_pop_valid;


  logic executed;
  logic [31:0] var_35;
  assign var_35 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [2:0] var_85;
  assign var_85 = array_array_72928_q[2:0];


  logic [0:0] var_42;
  assign var_42 = var_85 == 3'd1;


  logic [31:0] var_808;
  assign var_808 = var_35;


  logic [31:0] var_47;
  assign var_47 = array_array_7292e_q[31:0];


  logic [31:0] var_50;
  assign var_50 = var_42 ? var_808 : var_47;


  logic [0:0] var_62;
  assign var_62 = var_85 == 3'd2;


  logic [31:0] var_67;
  assign var_67 = array_array_72934_q[31:0];


  logic [31:0] var_70;
  assign var_70 = var_62 ? var_808 : var_67;


  logic [0:0] var_82;
  assign var_82 = var_85 == 3'd3;


  logic [31:0] var_87;
  assign var_87 = array_array_7293a_q[31:0];


  logic [31:0] var_90;
  assign var_90 = var_82 ? var_808 : var_87;


  always_ff @(posedge clk) if (executed)$display("%t\t[memuser_72949]\t\t cols_reg_addr: %d | user_state: %d ",



  $time

, 0, var_85);

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_7292e_w = executed;
    assign array_array_7292e_d = var_50;
    assign array_array_7292e_widx = 1'd0;

    assign array_array_72934_w = executed;
    assign array_array_72934_d = var_70;
    assign array_array_72934_widx = 1'd0;

    assign array_array_7293a_w = executed;
    assign array_array_7293a_d = var_90;
    assign array_array_7293a_widx = 1'd0;

    assign executed = counter_pop_valid && (var_31);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // memuser_72949


module driver (
  input logic clk,
  input logic rst_n,
  // Module internal_loop_74fd4
  output logic [7:0] internal_loop_74fd4_counter_delta,
  input logic [0:0] internal_loop_74fd4_counter_delta_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  assign internal_loop_74fd4_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver


module internal_loop_74fd4 (
  input logic clk,
  input logic rst_n,
  /* Array: array_72a15[1 x b1] */
  input logic [0:0] array_array_72a15_q,

  // Module external_loop_74ebd
  output logic [7:0] external_loop_74ebd_counter_delta,
  input logic [0:0] external_loop_74ebd_counter_delta_ready,

  // External FIFO external_loop_74ebd.In_full_flag
  output logic [0:0] fifo_external_loop_74ebd_In_full_flag_push_valid,
  output logic [0:0] fifo_external_loop_74ebd_In_full_flag_push_data,
  input logic [0:0] fifo_external_loop_74ebd_In_full_flag_push_ready,

  /* Array: array_72922[1 x i32] */
  input logic [31:0] array_array_72922_q,
  output logic [0:0] array_array_72922_w,
  output logic [0:0] array_array_72922_widx,
  output logic [31:0] array_array_72922_d,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_98;
  assign var_98 = array_array_72922_q[31:0];


  logic [0:0] var_727;
  assign var_727 = $signed(var_98) == 32'd9;


  logic [0:0] var_770;
  assign var_770 = array_array_72a15_q[0:0];


  logic [0:0] var_733;
  assign var_733 = var_727 & var_770;


  logic [0:0] var_739;
  assign var_739 = var_770 == 1'd1;


  logic [0:0] var_748;
  assign var_748 = $signed(var_98) < 32'd9;


  logic [31:0] var_754;
  assign var_754 = var_98;


  logic [31:0] var_756;
  assign var_756 = $signed(var_754) + 32'd1;


  logic [31:0] var_759;
  assign var_759 = var_748 ? var_756 : 32'd0;


  always_ff @(posedge clk) if (executed)$display("%t\t[internal_loop_74fd4]\t\tinnerloop----------sram_master_flag: %d | j: %d |full_flag: %d",



  $time

, var_770, var_98, var_733);

  assign external_loop_74ebd_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_external_loop_74ebd_In_full_flag_push_valid = executed;
  assign fifo_external_loop_74ebd_In_full_flag_push_data = var_733;

  // Gather Array writes
  assign array_array_72922_w = (executed) && (((var_739)));
    assign array_array_72922_d = ({ 32 { (var_739) } } & var_759);
    assign array_array_72922_widx = ({ 1 { (var_739) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // internal_loop_74fd4


module SRAM_74e21 (
  input logic clk,
  input logic rst_n,




  // External FIFO memuser_72949.rdata
  output logic [0:0] fifo_memuser_72949_rdata_push_valid,
  output logic [31:0] fifo_memuser_72949_rdata_push_data,
  input logic [0:0] fifo_memuser_72949_rdata_push_ready,

  /* Array: array_74e3f[16384 x b32] */
  /* /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/spmv/data/ellpack_data_reformatted.data */

  // Declare upstream executed signals
  input logic [0:0] sram_master_72964_executed,
  input logic [0:0] var_166,
  input logic [0:0] var_166_valid,
  input logic [13:0] var_272,
  input logic [0:0] var_272_valid,
  input logic [31:0] var_552,
  input logic [0:0] var_552_valid,
  input logic [0:0] var_150,
  input logic [0:0] var_150_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_801;
  assign var_801 = dataout;
  // Gather FIFO pushes
  assign fifo_memuser_72949_rdata_push_valid = (executed) && (((var_150)));
  assign fifo_memuser_72949_rdata_push_data = ({ 32 { (var_150) } } & var_801);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_74e3f_w;
  logic [31:0] array_array_74e3f_d;
  logic [13:0] array_array_74e3f_widx;
  assign array_array_74e3f_w = (executed) && (((var_166)));
  assign array_array_74e3f_d = ({ 32 { (var_166) } } & var_552);
  assign array_array_74e3f_widx = var_272;


  memory_blackbox_array_74e3f #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(14)     
    ) memory_blackbox_array_74e3f(
    .clk     (clk), 
    .address (array_array_74e3f_widx), 
    .wd      (array_array_74e3f_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_74e3f_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = sram_master_72964_executed;
  assign expose_executed = executed;
endmodule // SRAM_74e21




(* blackbox *)

module memory_blackbox_array_74e3f #(
    parameter DATA_WIDTH = 32,   
    parameter ADDR_WIDTH = 14 
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
              
module sram_master_72964 (
  input logic clk,
  input logic rst_n,
  // Port FIFO Start
  input logic [0:0] fifo_Start_pop_valid,
  input logic [0:0] fifo_Start_pop_data,
  output logic [0:0] fifo_Start_pop_ready,

  /* Array: array_72922[1 x i32] */
  input logic [31:0] array_array_72922_q,

  /* Array: array_72a15[1 x b1] */
  output logic [0:0] array_array_72a15_w,
  output logic [0:0] array_array_72a15_widx,
  output logic [0:0] array_array_72a15_d,

  /* Array: array_72946[1 x i32] */
  input logic [31:0] array_array_72946_q,
  output logic [0:0] array_array_72946_w,
  output logic [0:0] array_array_72946_widx,
  output logic [31:0] array_array_72946_d,

  /* Array: array_72928[1 x b3] */
  input logic [2:0] array_array_72928_q,
  output logic [0:0] array_array_72928_w,
  output logic [0:0] array_array_72928_widx,
  output logic [2:0] array_array_72928_d,

  /* Array: array_7295b[1 x i32] */
  input logic [31:0] array_array_7295b_q,
  output logic [0:0] array_array_7295b_w,
  output logic [0:0] array_array_7295b_widx,
  output logic [31:0] array_array_7295b_d,

  /* Array: array_72934[1 x i32] */
  input logic [31:0] array_array_72934_q,

  // Module memuser_72949
  output logic [7:0] memuser_72949_counter_delta,
  input logic [0:0] memuser_72949_counter_delta_ready,

  /* Array: array_72919[1 x i32] */
  input logic [31:0] array_array_72919_q,

  /* Array: array_72940[1 x b14] */
  input logic [13:0] array_array_72940_q,

  /* Array: array_7292e[1 x i32] */
  input logic [31:0] array_array_7292e_q,

  /* Array: array_7293a[1 x i32] */
  input logic [31:0] array_array_7293a_q,

  output logic [0:0] expose_var_150,
  output logic [0:0] expose_var_150_valid,
  output logic [0:0] expose_var_166,
  output logic [0:0] expose_var_166_valid,
  output logic [31:0] expose_var_552,
  output logic [0:0] expose_var_552_valid,
  output logic [13:0] expose_var_272,
  output logic [0:0] expose_var_272_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_107;
  assign var_107 = fifo_Start_pop_data;


  assign fifo_Start_pop_ready = executed;
  logic [2:0] var_558;
  assign var_558 = array_array_72928_q[2:0];


  always_ff @(posedge clk) if (executed)$display("%t\t[sram_master_72964]\t\tuser_state: %d ",



  $time

, var_558);

  logic [0:0] var_119;
  assign var_119 = var_558 == 3'd3;


  logic [0:0] var_122;
  assign var_122 = var_119;


  logic [0:0] var_131;
  assign var_131 = var_558 == 3'd1;


  logic [0:0] var_137;
  assign var_137 = var_558 == 3'd2;


  logic [0:0] var_140;
  assign var_140 = var_131 | var_137;


  logic [0:0] var_147;
  assign var_147 = var_558 == 3'd7;


  logic [0:0] var_150;
  assign var_150 = var_140 | var_147;
  assign expose_var_150 = var_150;
  assign expose_var_150_valid = executed && 1;


  logic [0:0] var_156;
  assign var_156 = var_558 == 3'd3;


  logic [31:0] var_609;
  assign var_609 = array_array_72922_q[31:0];


  logic [0:0] var_163;
  assign var_163 = $signed(var_609) == 32'd9;


  logic [0:0] var_166;
  assign var_166 = var_156 & var_163;
  assign expose_var_166 = var_166;
  assign expose_var_166_valid = executed && 1;


  logic [31:0] var_542;
  assign var_542 = array_array_72919_q[31:0];


  logic [15:0] var_173;
  assign var_173 = var_542[15:0];


  logic [15:0] var_177;
  assign var_177 = var_173;


  logic [31:0] var_180;
  assign var_180 = $signed(var_177) * 16'd10;


  logic [31:0] var_183;
  assign var_183 = var_180;


  logic [31:0] var_188;
  assign var_188 = $signed(var_183) + $signed(var_609);


  logic [31:0] var_192;
  assign var_192 = $signed(var_188) + 32'd4940;


  logic [31:0] var_195;
  assign var_195 = $signed(var_188) + 32'd0;


  logic [31:0] var_564;
  assign var_564 = array_array_7292e_q[31:0];


  logic [31:0] var_202;
  assign var_202 = $signed(var_564) + 32'd9880;


  logic [31:0] var_206;
  assign var_206 = $signed(var_188) + 32'd10374;


  logic [0:0] var_212;
  assign var_212 = var_558 == 3'd7;


  logic [13:0] var_216;
  assign var_216 = var_192[13:0];


  logic [13:0] var_220;
  assign var_220 = var_216;


  logic [13:0] var_223;
  assign var_223 = var_212 ? var_220 : 14'd0;


  logic [0:0] var_230;
  assign var_230 = var_558 == 3'd1;


  logic [13:0] var_233;
  assign var_233 = var_195[13:0];


  logic [13:0] var_237;
  assign var_237 = var_233;


  logic [13:0] var_239;
  assign var_239 = var_230 ? var_237 : var_223;


  logic [0:0] var_246;
  assign var_246 = var_558 == 3'd2;


  logic [13:0] var_249;
  assign var_249 = var_202[13:0];


  logic [13:0] var_253;
  assign var_253 = var_249;


  logic [13:0] var_255;
  assign var_255 = var_246 ? var_253 : var_239;


  logic [0:0] var_263;
  assign var_263 = var_558 == 3'd4;


  logic [13:0] var_266;
  assign var_266 = var_206[13:0];


  logic [13:0] var_270;
  assign var_270 = var_266;


  logic [13:0] var_272;
  assign var_272 = var_263 ? var_270 : var_255;
  assign expose_var_272 = var_272;
  assign expose_var_272_valid = executed && 1;


  logic [0:0] var_279;
  assign var_279 = var_558 == 3'd1;


  logic [0:0] var_285;
  assign var_285 = var_558 == 3'd2;


  logic [0:0] var_288;
  assign var_288 = var_279 | var_285;


  logic [0:0] var_294;
  assign var_294 = var_558 == 3'd3;


  logic [0:0] var_297;
  assign var_297 = var_288 | var_294;


  logic [0:0] var_303;
  assign var_303 = var_558 == 3'd7;


  logic [0:0] var_306;
  assign var_306 = var_297 | var_303;


  logic [0:0] var_518;
  assign var_518 = var_107 == 1'd1;


  logic [0:0] var_315;
  assign var_315 = var_558 == 3'd1;


  logic [0:0] var_328;
  assign var_328 = var_558 == 3'd2;


  logic [0:0] var_341;
  assign var_341 = var_558 == 3'd3;


  logic [0:0] var_350;
  assign var_350 = $signed(var_609) == 32'd9;


  logic [2:0] var_354;
  assign var_354 = var_350 ? 3'd4 : 3'd5;


  logic [0:0] var_365;
  assign var_365 = var_558 == 3'd7;


  logic [0:0] var_386;
  assign var_386 = var_558 == 3'd0;


  logic [0:0] var_405;
  assign var_405 = var_558 == 3'd4;


  logic [31:0] var_767;
  assign var_767 = array_array_72934_q[31:0];


  logic [31:0] var_561;
  assign var_561 = array_array_7293a_q[31:0];


  logic [31:0] var_577;
  assign var_577 = array_array_7295b_q[31:0];


  logic [15:0] var_422;
  assign var_422 = var_767[15:0];


  logic [15:0] var_426;
  assign var_426 = var_422;


  logic [15:0] var_431;
  assign var_431 = var_561[15:0];


  logic [15:0] var_435;
  assign var_435 = var_431;


  logic [31:0] var_437;
  assign var_437 = $signed(var_426) * $signed(var_435);


  logic [31:0] var_440;
  assign var_440 = $signed(var_577) + $signed(var_437);


  logic [0:0] var_450;
  assign var_450 = var_558 == 3'd5;


  logic [15:0] var_466;
  assign var_466 = var_767[15:0];


  logic [15:0] var_470;
  assign var_470 = var_466;


  logic [15:0] var_475;
  assign var_475 = var_561[15:0];


  logic [15:0] var_479;
  assign var_479 = var_475;


  logic [31:0] var_481;
  assign var_481 = $signed(var_470) * $signed(var_479);


  logic [31:0] var_484;
  assign var_484 = $signed(var_577) + $signed(var_481);


  logic [15:0] var_497;
  assign var_497 = var_767[15:0];


  logic [15:0] var_501;
  assign var_501 = var_497;


  logic [15:0] var_506;
  assign var_506 = var_561[15:0];


  logic [15:0] var_510;
  assign var_510 = var_506;


  always_ff @(posedge clk) if (executed && (var_450))$display("%t\t[sram_master_72964]\t\tsum: %d = nzval_reg[0] * vec_reg[0] = %d * %d",



  $time

, var_577, var_501, var_510);

  logic [0:0] var_521;
  assign var_521 = var_558 == 3'd6;


  always_ff @(posedge clk) if (executed && (var_521))$display("%t\t[sram_master_72964]\t\tsum-clear: %d = 0",



  $time

, var_577);

  logic [31:0] var_392;
  assign var_392 = array_array_72946_q[31:0];


  logic [31:0] var_552;
  assign var_552 = var_392;
  assign expose_var_552 = var_552;
  assign expose_var_552_valid = executed && 1;


  always_ff @(posedge clk) if (executed)$display("%t\t[sram_master_72964]\t\taddress_wire: %d cols_reg: %d | nzval_reg: %d | vec_reg: %d",



  $time

, var_272, var_564, var_767, var_561);

  logic [13:0] var_574;
  assign var_574 = array_array_72940_q[13:0];


  logic [31:0] var_580;
  assign var_580 = var_392;


  always_ff @(posedge clk) if (executed)$display("%t\t[sram_master_72964]\t\twe: %d | re: %d | addr: %d | out: %d",



  $time

, var_166, var_150, var_574, var_580);

  logic [15:0] var_592;
  assign var_592 = var_542[15:0];


  logic [15:0] var_596;
  assign var_596 = var_592;


  logic [31:0] var_598;
  assign var_598 = $signed(var_596) * 16'd10;


  logic [31:0] var_601;
  assign var_601 = var_598;


  logic [31:0] var_606;
  assign var_606 = $signed(var_601) + $signed(var_609);


  always_ff @(posedge clk) if (executed)$display("%t\t[sram_master_72964]\t\tp: %d = i_%d, j_%d",



  $time

, var_606, var_542, var_609);

  assign memuser_72949_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_7295b_w = (executed) && (((var_405)) || ((var_450)) || ((var_521)));
    assign array_array_7295b_d = ({ 32 { (var_405) } } & var_440) | ({ 32 { (var_450) } } & var_484) | ({ 32 { (var_521) } } & 32'd0);
    assign array_array_7295b_widx = ({ 1 { (var_405) } } & 1'd0) | ({ 1 { (var_450) } } & 1'd0) | ({ 1 { (var_521) } } & 1'd0);

    assign array_array_72a15_w = executed;
    assign array_array_72a15_d = var_122;
    assign array_array_72a15_widx = 1'd0;

    assign array_array_72946_w = (executed) && (((var_521)));
    assign array_array_72946_d = ({ 32 { (var_521) } } & var_577);
    assign array_array_72946_widx = ({ 1 { (var_521) } } & 1'd0);

    assign array_array_72928_w = (executed) && (((var_306 && var_315)) || ((var_306 && var_328)) || ((var_306 && var_341)) || ((var_306 && var_365 && var_518)) || ((var_386 && var_518)) || ((var_405)) || ((var_450)) || ((var_521)));
    assign array_array_72928_d = ({ 3 { (var_306 && var_315) } } & 3'd2) | ({ 3 { (var_306 && var_328) } } & 3'd3) | ({ 3 { (var_306 && var_341) } } & var_354) | ({ 3 { (var_306 && var_365 && var_518) } } & 3'd1) | ({ 3 { (var_386 && var_518) } } & 3'd7) | ({ 3 { (var_405) } } & 3'd6) | ({ 3 { (var_450) } } & 3'd7) | ({ 3 { (var_521) } } & 3'd7);
    assign array_array_72928_widx = ({ 1 { (var_306 && var_315) } } & 1'd0) | ({ 1 { (var_306 && var_328) } } & 1'd0) | ({ 1 { (var_306 && var_341) } } & 1'd0) | ({ 1 { (var_306 && var_365 && var_518) } } & 1'd0) | ({ 1 { (var_386 && var_518) } } & 1'd0) | ({ 1 { (var_405) } } & 1'd0) | ({ 1 { (var_450) } } & 1'd0) | ({ 1 { (var_521) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // sram_master_72964


module external_loop_74ebd (
  input logic clk,
  input logic rst_n,
  // Port FIFO In_full_flag
  input logic [0:0] fifo_In_full_flag_pop_valid,
  input logic [0:0] fifo_In_full_flag_pop_data,
  output logic [0:0] fifo_In_full_flag_pop_ready,
  /* Array: array_74f02[1 x b1] */
  input logic [0:0] array_array_74f02_q,
  output logic [0:0] array_array_74f02_w,
  output logic [0:0] array_array_74f02_widx,
  output logic [0:0] array_array_74f02_d,

  /* Array: array_72919[1 x i32] */
  input logic [31:0] array_array_72919_q,
  output logic [0:0] array_array_72919_w,
  output logic [0:0] array_array_72919_widx,
  output logic [31:0] array_array_72919_d,

  // External FIFO sram_master_72964.Start
  output logic [0:0] fifo_sram_master_72964_Start_push_valid,
  output logic [0:0] fifo_sram_master_72964_Start_push_data,
  input logic [0:0] fifo_sram_master_72964_Start_push_ready,

  // Module sram_master_72964
  output logic [7:0] sram_master_72964_counter_delta,
  input logic [0:0] sram_master_72964_counter_delta_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_621;
  assign var_621 = fifo_In_full_flag_pop_data;


  assign fifo_In_full_flag_pop_ready = executed;
  logic [0:0] var_623;
  assign var_623 = var_621 == 1'd1;


  logic [0:0] var_687;
  assign var_687 = array_array_74f02_q[0:0];


  logic [0:0] var_630;
  assign var_630 = var_687 == 1'd0;


  logic [0:0] var_633;
  assign var_633 = var_623 & var_630;


  logic [31:0] var_612;
  assign var_612 = array_array_72919_q[31:0];


  logic [0:0] var_643;
  assign var_643 = $signed(var_612) < 32'd493;


  logic [0:0] var_649;
  assign var_649 = $signed(var_612) == 32'd493;


  logic [0:0] var_652;
  assign var_652 = var_649;


  logic [31:0] var_661;
  assign var_661 = var_612;


  logic [31:0] var_664;
  assign var_664 = $signed(var_661) + 32'd1;


  logic [31:0] var_667;
  assign var_667 = var_643 ? var_664 : 32'd0;


  always_ff @(posedge clk) if (executed)$display("%t\t[external_loop_74ebd]\t\toutterloop----------In_full_flag: %d | i: %d |Stop-signal: %d",



  $time

, var_621, var_612, var_687);

  logic [0:0] var_690;
  assign var_690 = $signed(var_612) == 32'd493;


  logic [0:0] var_693;
  assign var_693 = var_621 & var_690;


  logic [0:0] var_699;
  assign var_699 = ~var_687;


  logic [0:0] var_701;
  assign var_701 = var_693 & var_699;


  always_ff @(posedge clk) if (executed && (var_701))$display("%t\t[external_loop_74ebd]\t\tfinish",



  $time

);





  logic [0:0] var_714;
  assign var_714 = ~var_687;


  assign sram_master_72964_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_sram_master_72964_Start_push_valid = executed;
  assign fifo_sram_master_72964_Start_push_data = var_714;

  // Gather Array writes
  assign array_array_74f02_w = (executed) && (((var_633)));
    assign array_array_74f02_d = ({ 1 { (var_633) } } & var_652);
    assign array_array_74f02_widx = ({ 1 { (var_633) } } & 1'd0);

    assign array_array_72919_w = (executed) && (((var_633)));
    assign array_array_72919_d = ({ 32 { (var_633) } } & var_667);
    assign array_array_72919_widx = ({ 1 { (var_633) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // external_loop_74ebd

module top(
  output logic [31:0] array_array_72919_exposed_o,
  output logic [31:0] array_array_72946_exposed_o,
  output logic [31:0] array_array_72922_exposed_o,
  output logic [2:0] array_array_72928_exposed_o,

  input logic clk,
  input logic rst_n
);

//Array: array_74e3f, Init File Path: /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/spmv/data/ellpack_data_reformatted.data
  /* Array: array_72940[1 x b14] */
  logic [13:0] array_array_72940_q;
  logic [13:0] array_array_72940_d;
  logic [0:0] array_array_72940_widx;
  logic [0:0] array_array_72940_w;
  assign array_array_72940_d = 'x;
  assign array_array_72940_widx = 'x;
  assign array_array_72940_w = 'x;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_72940_q <= 14'd0;
    else if (array_array_72940_w) begin

      case (array_array_72940_widx)
        0 : array_array_72940_q[13:0] <= array_array_72940_d;
        default: ;
      endcase
    end
  /* Array: array_7293a[1 x i32] */
  logic [31:0] array_array_7293a_q;
  logic [31:0] array_array_7293a_driver_memuser_72949_d;
  logic [0:0] array_array_7293a_driver_memuser_72949_w;
  logic [0:0] array_array_7293a_driver_memuser_72949_widx;
  logic [31:0] array_array_7293a_d;
  logic [0:0] array_array_7293a_widx;
  logic [0:0] array_array_7293a_w;
  assign array_array_7293a_d = ({ 32 { array_array_7293a_driver_memuser_72949_w } } & array_array_7293a_driver_memuser_72949_d);
  assign array_array_7293a_widx = ({ 1 { array_array_7293a_driver_memuser_72949_w } } & array_array_7293a_driver_memuser_72949_widx);
  assign array_array_7293a_w = array_array_7293a_driver_memuser_72949_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_7293a_q <= 32'd0;
    else if (array_array_7293a_w) begin

      case (array_array_7293a_widx)
        0 : array_array_7293a_q[31:0] <= array_array_7293a_d;
        default: ;
      endcase
    end
  /* Array: array_74f02[1 x b1] */
  logic [0:0] array_array_74f02_q;
  logic [0:0] array_array_74f02_driver_external_loop_74ebd_d;
  logic [0:0] array_array_74f02_driver_external_loop_74ebd_w;
  logic [0:0] array_array_74f02_driver_external_loop_74ebd_widx;
  logic [0:0] array_array_74f02_d;
  logic [0:0] array_array_74f02_widx;
  logic [0:0] array_array_74f02_w;
  assign array_array_74f02_d = ({ 1 { array_array_74f02_driver_external_loop_74ebd_w } } & array_array_74f02_driver_external_loop_74ebd_d);
  assign array_array_74f02_widx = ({ 1 { array_array_74f02_driver_external_loop_74ebd_w } } & array_array_74f02_driver_external_loop_74ebd_widx);
  assign array_array_74f02_w = array_array_74f02_driver_external_loop_74ebd_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_74f02_q <= 1'd0;
    else if (array_array_74f02_w) begin

      case (array_array_74f02_widx)
        0 : array_array_74f02_q[0:0] <= array_array_74f02_d;
        default: ;
      endcase
    end
  /* Array: array_72934[1 x i32] */
  logic [31:0] array_array_72934_q;
  logic [31:0] array_array_72934_driver_memuser_72949_d;
  logic [0:0] array_array_72934_driver_memuser_72949_w;
  logic [0:0] array_array_72934_driver_memuser_72949_widx;
  logic [31:0] array_array_72934_d;
  logic [0:0] array_array_72934_widx;
  logic [0:0] array_array_72934_w;
  assign array_array_72934_d = ({ 32 { array_array_72934_driver_memuser_72949_w } } & array_array_72934_driver_memuser_72949_d);
  assign array_array_72934_widx = ({ 1 { array_array_72934_driver_memuser_72949_w } } & array_array_72934_driver_memuser_72949_widx);
  assign array_array_72934_w = array_array_72934_driver_memuser_72949_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_72934_q <= 32'd0;
    else if (array_array_72934_w) begin

      case (array_array_72934_widx)
        0 : array_array_72934_q[31:0] <= array_array_72934_d;
        default: ;
      endcase
    end
  /* Array: array_72946[1 x i32] */
  logic [31:0] array_array_72946_q;
  logic [31:0] array_array_72946_driver_sram_master_72964_d;
  logic [0:0] array_array_72946_driver_sram_master_72964_w;
  logic [0:0] array_array_72946_driver_sram_master_72964_widx;
  assign array_array_72946_exposed_o = array_array_72946_q;
  logic [31:0] array_array_72946_d;
  logic [0:0] array_array_72946_widx;
  logic [0:0] array_array_72946_w;
  assign array_array_72946_d = ({ 32 { array_array_72946_driver_sram_master_72964_w } } & array_array_72946_driver_sram_master_72964_d);
  assign array_array_72946_widx = ({ 1 { array_array_72946_driver_sram_master_72964_w } } & array_array_72946_driver_sram_master_72964_widx);
  assign array_array_72946_w = array_array_72946_driver_sram_master_72964_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_72946_q <= 32'd0;
    else if (array_array_72946_w) begin

      case (array_array_72946_widx)
        0 : array_array_72946_q[31:0] <= array_array_72946_d;
        default: ;
      endcase
    end
  /* Array: array_72928[1 x b3] */
  logic [2:0] array_array_72928_q;
  logic [2:0] array_array_72928_driver_sram_master_72964_d;
  logic [0:0] array_array_72928_driver_sram_master_72964_w;
  logic [0:0] array_array_72928_driver_sram_master_72964_widx;
  assign array_array_72928_exposed_o = array_array_72928_q;
  logic [2:0] array_array_72928_d;
  logic [0:0] array_array_72928_widx;
  logic [0:0] array_array_72928_w;
  assign array_array_72928_d = ({ 3 { array_array_72928_driver_sram_master_72964_w } } & array_array_72928_driver_sram_master_72964_d);
  assign array_array_72928_widx = ({ 1 { array_array_72928_driver_sram_master_72964_w } } & array_array_72928_driver_sram_master_72964_widx);
  assign array_array_72928_w = array_array_72928_driver_sram_master_72964_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_72928_q <= 3'd0;
    else if (array_array_72928_w) begin

      case (array_array_72928_widx)
        0 : array_array_72928_q[2:0] <= array_array_72928_d;
        default: ;
      endcase
    end
  /* Array: array_74e3f[16384 x b32] */
  logic [31:0] array_array_74e3f_q;
  logic [31:0] array_array_74e3f_driver_SRAM_74e21_d;
  logic [0:0] array_array_74e3f_driver_SRAM_74e21_w;
  logic [13:0] array_array_74e3f_driver_SRAM_74e21_widx;
  /* Array: array_72919[1 x i32] */
  logic [31:0] array_array_72919_q;
  logic [31:0] array_array_72919_driver_external_loop_74ebd_d;
  logic [0:0] array_array_72919_driver_external_loop_74ebd_w;
  logic [0:0] array_array_72919_driver_external_loop_74ebd_widx;
  assign array_array_72919_exposed_o = array_array_72919_q;
  logic [31:0] array_array_72919_d;
  logic [0:0] array_array_72919_widx;
  logic [0:0] array_array_72919_w;
  assign array_array_72919_d = ({ 32 { array_array_72919_driver_external_loop_74ebd_w } } & array_array_72919_driver_external_loop_74ebd_d);
  assign array_array_72919_widx = ({ 1 { array_array_72919_driver_external_loop_74ebd_w } } & array_array_72919_driver_external_loop_74ebd_widx);
  assign array_array_72919_w = array_array_72919_driver_external_loop_74ebd_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_72919_q <= 32'd0;
    else if (array_array_72919_w) begin

      case (array_array_72919_widx)
        0 : array_array_72919_q[31:0] <= array_array_72919_d;
        default: ;
      endcase
    end
  /* Array: array_72a15[1 x b1] */
  logic [0:0] array_array_72a15_q;
  logic [0:0] array_array_72a15_driver_sram_master_72964_d;
  logic [0:0] array_array_72a15_driver_sram_master_72964_w;
  logic [0:0] array_array_72a15_driver_sram_master_72964_widx;
  logic [0:0] array_array_72a15_d;
  logic [0:0] array_array_72a15_widx;
  logic [0:0] array_array_72a15_w;
  assign array_array_72a15_d = ({ 1 { array_array_72a15_driver_sram_master_72964_w } } & array_array_72a15_driver_sram_master_72964_d);
  assign array_array_72a15_widx = ({ 1 { array_array_72a15_driver_sram_master_72964_w } } & array_array_72a15_driver_sram_master_72964_widx);
  assign array_array_72a15_w = array_array_72a15_driver_sram_master_72964_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_72a15_q <= 1'd0;
    else if (array_array_72a15_w) begin

      case (array_array_72a15_widx)
        0 : array_array_72a15_q[0:0] <= array_array_72a15_d;
        default: ;
      endcase
    end
  /* Array: array_7295b[1 x i32] */
  logic [31:0] array_array_7295b_q;
  logic [31:0] array_array_7295b_driver_sram_master_72964_d;
  logic [0:0] array_array_7295b_driver_sram_master_72964_w;
  logic [0:0] array_array_7295b_driver_sram_master_72964_widx;
  logic [31:0] array_array_7295b_d;
  logic [0:0] array_array_7295b_widx;
  logic [0:0] array_array_7295b_w;
  assign array_array_7295b_d = ({ 32 { array_array_7295b_driver_sram_master_72964_w } } & array_array_7295b_driver_sram_master_72964_d);
  assign array_array_7295b_widx = ({ 1 { array_array_7295b_driver_sram_master_72964_w } } & array_array_7295b_driver_sram_master_72964_widx);
  assign array_array_7295b_w = array_array_7295b_driver_sram_master_72964_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_7295b_q <= 32'd0;
    else if (array_array_7295b_w) begin

      case (array_array_7295b_widx)
        0 : array_array_7295b_q[31:0] <= array_array_7295b_d;
        default: ;
      endcase
    end
  /* Array: array_72922[1 x i32] */
  logic [31:0] array_array_72922_q;
  logic [31:0] array_array_72922_driver_internal_loop_74fd4_d;
  logic [0:0] array_array_72922_driver_internal_loop_74fd4_w;
  logic [0:0] array_array_72922_driver_internal_loop_74fd4_widx;
  assign array_array_72922_exposed_o = array_array_72922_q;
  logic [31:0] array_array_72922_d;
  logic [0:0] array_array_72922_widx;
  logic [0:0] array_array_72922_w;
  assign array_array_72922_d = ({ 32 { array_array_72922_driver_internal_loop_74fd4_w } } & array_array_72922_driver_internal_loop_74fd4_d);
  assign array_array_72922_widx = ({ 1 { array_array_72922_driver_internal_loop_74fd4_w } } & array_array_72922_driver_internal_loop_74fd4_widx);
  assign array_array_72922_w = array_array_72922_driver_internal_loop_74fd4_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_72922_q <= 32'd0;
    else if (array_array_72922_w) begin

      case (array_array_72922_widx)
        0 : array_array_72922_q[31:0] <= array_array_72922_d;
        default: ;
      endcase
    end
  /* Array: array_7292e[1 x i32] */
  logic [31:0] array_array_7292e_q;
  logic [31:0] array_array_7292e_driver_memuser_72949_d;
  logic [0:0] array_array_7292e_driver_memuser_72949_w;
  logic [0:0] array_array_7292e_driver_memuser_72949_widx;
  logic [31:0] array_array_7292e_d;
  logic [0:0] array_array_7292e_widx;
  logic [0:0] array_array_7292e_w;
  assign array_array_7292e_d = ({ 32 { array_array_7292e_driver_memuser_72949_w } } & array_array_7292e_driver_memuser_72949_d);
  assign array_array_7292e_widx = ({ 1 { array_array_7292e_driver_memuser_72949_w } } & array_array_7292e_driver_memuser_72949_widx);
  assign array_array_7292e_w = array_array_7292e_driver_memuser_72949_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_7292e_q <= 32'd0;
    else if (array_array_7292e_w) begin

      case (array_array_7292e_widx)
        0 : array_array_7292e_q[31:0] <= array_array_7292e_d;
        default: ;
      endcase
    end
  // fifo: rdata: fifo<b32>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_memuser_72949_rdata_pop_data;
  logic [0:0] fifo_memuser_72949_rdata_pop_valid;
  logic [0:0] fifo_memuser_72949_rdata_pop_ready;
  logic [31:0] fifo_memuser_72949_rdata_driver_SRAM_74e21_push_data;
  logic [0:0] fifo_memuser_72949_rdata_driver_SRAM_74e21_push_valid;
  logic [0:0] fifo_memuser_72949_rdata_driver_SRAM_74e21_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_memuser_72949_rdata_push_ready;
  assign fifo_memuser_72949_rdata_driver_SRAM_74e21_push_ready = fifo_memuser_72949_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_memuser_72949_rdata_push_valid;
  assign fifo_memuser_72949_rdata_push_valid = fifo_memuser_72949_rdata_driver_SRAM_74e21_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_memuser_72949_rdata_push_data;
  assign fifo_memuser_72949_rdata_push_data = ({ 32 { fifo_memuser_72949_rdata_driver_SRAM_74e21_push_valid } } & fifo_memuser_72949_rdata_driver_SRAM_74e21_push_data);

  fifo #(32, 2) fifo_memuser_72949_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_memuser_72949_rdata_push_valid),
    .push_data(fifo_memuser_72949_rdata_push_data),
    .push_ready(fifo_memuser_72949_rdata_push_ready),
    .pop_valid(fifo_memuser_72949_rdata_pop_valid),
    .pop_data(fifo_memuser_72949_rdata_pop_data),
    .pop_ready(fifo_memuser_72949_rdata_pop_ready));

  // fifo: Start: fifo<b1>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [0:0] fifo_sram_master_72964_Start_pop_data;
  logic [0:0] fifo_sram_master_72964_Start_pop_valid;
  logic [0:0] fifo_sram_master_72964_Start_pop_ready;
  logic [0:0] fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_data;
  logic [0:0] fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_valid;
  logic [0:0] fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_sram_master_72964_Start_push_ready;
  assign fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_ready = fifo_sram_master_72964_Start_push_ready;  // Gather all the push signal
  logic [0:0] fifo_sram_master_72964_Start_push_valid;
  assign fifo_sram_master_72964_Start_push_valid = fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_valid;
  // 1-hot select the push data
  logic [0:0] fifo_sram_master_72964_Start_push_data;
  assign fifo_sram_master_72964_Start_push_data = ({ 1 { fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_valid } } & fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_data);

  fifo #(1, 2) fifo_sram_master_72964_Start_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_sram_master_72964_Start_push_valid),
    .push_data(fifo_sram_master_72964_Start_push_data),
    .push_ready(fifo_sram_master_72964_Start_push_ready),
    .pop_valid(fifo_sram_master_72964_Start_pop_valid),
    .pop_data(fifo_sram_master_72964_Start_pop_data),
    .pop_ready(fifo_sram_master_72964_Start_pop_ready));

  // fifo: In_full_flag: fifo<b1>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_pop_data;
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_pop_valid;
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_pop_ready;
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_data;
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_valid;
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_external_loop_74ebd_In_full_flag_push_ready;
  assign fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_ready = fifo_external_loop_74ebd_In_full_flag_push_ready;  // Gather all the push signal
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_push_valid;
  assign fifo_external_loop_74ebd_In_full_flag_push_valid = fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_valid;
  // 1-hot select the push data
  logic [0:0] fifo_external_loop_74ebd_In_full_flag_push_data;
  assign fifo_external_loop_74ebd_In_full_flag_push_data = ({ 1 { fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_valid } } & fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_data);

  fifo #(1, 2) fifo_external_loop_74ebd_In_full_flag_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_external_loop_74ebd_In_full_flag_push_valid),
    .push_data(fifo_external_loop_74ebd_In_full_flag_push_data),
    .push_ready(fifo_external_loop_74ebd_In_full_flag_push_ready),
    .pop_valid(fifo_external_loop_74ebd_In_full_flag_pop_valid),
    .pop_data(fifo_external_loop_74ebd_In_full_flag_pop_data),
    .pop_ready(fifo_external_loop_74ebd_In_full_flag_pop_ready));

  // Trigger SM of Module: memuser_72949
  logic [7:0] memuser_72949_driver_sram_master_72964_counter_delta;
  logic [0:0] memuser_72949_driver_sram_master_72964_counter_delta_ready;
  logic [0:0] memuser_72949_counter_delta_ready;
  logic [7:0] memuser_72949_counter_delta;
  // Gather all the push signal
  assign memuser_72949_counter_delta = memuser_72949_driver_sram_master_72964_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] memuser_72949_counter_pop_ready;
  assign memuser_72949_driver_sram_master_72964_counter_delta_ready = memuser_72949_counter_pop_ready;
  logic [0:0] memuser_72949_counter_pop_valid;

  trigger_counter #(8) memuser_72949_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(memuser_72949_counter_delta),
    .delta_ready(memuser_72949_counter_delta_ready),
    .pop_valid(memuser_72949_counter_pop_valid),
    .pop_ready(memuser_72949_counter_pop_ready));
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
  // Trigger SM of Module: internal_loop_74fd4
  logic [7:0] internal_loop_74fd4_driver_driver_counter_delta;
  logic [0:0] internal_loop_74fd4_driver_driver_counter_delta_ready;
  logic [0:0] internal_loop_74fd4_counter_delta_ready;
  logic [7:0] internal_loop_74fd4_counter_delta;
  // Gather all the push signal
  assign internal_loop_74fd4_counter_delta = internal_loop_74fd4_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] internal_loop_74fd4_counter_pop_ready;
  assign internal_loop_74fd4_driver_driver_counter_delta_ready = internal_loop_74fd4_counter_pop_ready;
  logic [0:0] internal_loop_74fd4_counter_pop_valid;

  trigger_counter #(8) internal_loop_74fd4_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(internal_loop_74fd4_counter_delta),
    .delta_ready(internal_loop_74fd4_counter_delta_ready),
    .pop_valid(internal_loop_74fd4_counter_pop_valid),
    .pop_ready(internal_loop_74fd4_counter_pop_ready));
  // Trigger SM of Module: sram_master_72964
  logic [7:0] sram_master_72964_driver_external_loop_74ebd_counter_delta;
  logic [0:0] sram_master_72964_driver_external_loop_74ebd_counter_delta_ready;
  logic [0:0] sram_master_72964_counter_delta_ready;
  logic [7:0] sram_master_72964_counter_delta;
  // Gather all the push signal
  assign sram_master_72964_counter_delta = sram_master_72964_driver_external_loop_74ebd_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] sram_master_72964_counter_pop_ready;
  assign sram_master_72964_driver_external_loop_74ebd_counter_delta_ready = sram_master_72964_counter_pop_ready;
  logic [0:0] sram_master_72964_counter_pop_valid;

  trigger_counter #(8) sram_master_72964_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(sram_master_72964_counter_delta),
    .delta_ready(sram_master_72964_counter_delta_ready),
    .pop_valid(sram_master_72964_counter_pop_valid),
    .pop_ready(sram_master_72964_counter_pop_ready));
  // Trigger SM of Module: external_loop_74ebd
  logic [7:0] external_loop_74ebd_driver_internal_loop_74fd4_counter_delta;
  logic [0:0] external_loop_74ebd_driver_internal_loop_74fd4_counter_delta_ready;
  logic [0:0] external_loop_74ebd_counter_delta_ready;
  logic [7:0] external_loop_74ebd_counter_delta;
  // Gather all the push signal
  assign external_loop_74ebd_counter_delta = external_loop_74ebd_driver_internal_loop_74fd4_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] external_loop_74ebd_counter_pop_ready;
  assign external_loop_74ebd_driver_internal_loop_74fd4_counter_delta_ready = external_loop_74ebd_counter_pop_ready;
  logic [0:0] external_loop_74ebd_counter_pop_valid;

  trigger_counter #(8) external_loop_74ebd_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(external_loop_74ebd_counter_delta),
    .delta_ready(external_loop_74ebd_counter_delta_ready),
    .pop_valid(external_loop_74ebd_counter_pop_valid),
    .pop_ready(external_loop_74ebd_counter_pop_ready));
  assign driver_counter_delta = 8'b1;

  logic [0:0] memuser_72949_executed;

  // memuser_72949
  memuser_72949 memuser_72949_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_rdata_pop_ready(fifo_memuser_72949_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_memuser_72949_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_memuser_72949_rdata_pop_valid),
    .array_array_7293a_q(array_array_7293a_q),
    .array_array_7293a_w(array_array_7293a_driver_memuser_72949_w),
    .array_array_7293a_widx(array_array_7293a_driver_memuser_72949_widx),
    .array_array_7293a_d(array_array_7293a_driver_memuser_72949_d),
    .array_array_72934_q(array_array_72934_q),
    .array_array_72934_w(array_array_72934_driver_memuser_72949_w),
    .array_array_72934_widx(array_array_72934_driver_memuser_72949_widx),
    .array_array_72934_d(array_array_72934_driver_memuser_72949_d),
    .array_array_72928_q(array_array_72928_q),
    .array_array_7292e_q(array_array_7292e_q),
    .array_array_7292e_w(array_array_7292e_driver_memuser_72949_w),
    .array_array_7292e_widx(array_array_7292e_driver_memuser_72949_widx),
    .array_array_7292e_d(array_array_7292e_driver_memuser_72949_d),
    .counter_delta_ready(memuser_72949_counter_delta_ready),
    .counter_pop_ready(memuser_72949_counter_pop_ready),
    .counter_pop_valid(memuser_72949_counter_pop_valid),
    .expose_executed(memuser_72949_executed));
  logic [0:0] driver_executed;

  // driver
  driver driver_i (
    .clk(clk),
    .rst_n(rst_n),
    .internal_loop_74fd4_counter_delta_ready(internal_loop_74fd4_driver_driver_counter_delta_ready),
    .internal_loop_74fd4_counter_delta(internal_loop_74fd4_driver_driver_counter_delta),
    .counter_delta_ready(driver_counter_delta_ready),
    .counter_pop_ready(driver_counter_pop_ready),
    .counter_pop_valid(driver_counter_pop_valid),
    .expose_executed(driver_executed));
  logic [0:0] internal_loop_74fd4_executed;

  // internal_loop_74fd4
  internal_loop_74fd4 internal_loop_74fd4_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_72a15_q(array_array_72a15_q),
    .external_loop_74ebd_counter_delta_ready(external_loop_74ebd_driver_internal_loop_74fd4_counter_delta_ready),
    .external_loop_74ebd_counter_delta(external_loop_74ebd_driver_internal_loop_74fd4_counter_delta),
    .fifo_external_loop_74ebd_In_full_flag_push_valid(fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_valid),
    .fifo_external_loop_74ebd_In_full_flag_push_data(fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_data),
    .fifo_external_loop_74ebd_In_full_flag_push_ready(fifo_external_loop_74ebd_In_full_flag_driver_internal_loop_74fd4_push_ready),
    .array_array_72922_q(array_array_72922_q),
    .array_array_72922_w(array_array_72922_driver_internal_loop_74fd4_w),
    .array_array_72922_widx(array_array_72922_driver_internal_loop_74fd4_widx),
    .array_array_72922_d(array_array_72922_driver_internal_loop_74fd4_d),
    .counter_delta_ready(internal_loop_74fd4_counter_delta_ready),
    .counter_pop_ready(internal_loop_74fd4_counter_pop_ready),
    .counter_pop_valid(internal_loop_74fd4_counter_pop_valid),
    .expose_executed(internal_loop_74fd4_executed));
  logic [0:0] logic_var_150;
  logic [0:0] logic_var_150_valid;
  logic [0:0] logic_var_166;
  logic [0:0] logic_var_166_valid;
  logic [31:0] logic_var_552;
  logic [0:0] logic_var_552_valid;
  logic [13:0] logic_var_272;
  logic [0:0] logic_var_272_valid;
  logic [0:0] sram_master_72964_executed;

  // sram_master_72964
  sram_master_72964 sram_master_72964_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_Start_pop_ready(fifo_sram_master_72964_Start_pop_ready),
    .fifo_Start_pop_data(fifo_sram_master_72964_Start_pop_data),
    .fifo_Start_pop_valid(fifo_sram_master_72964_Start_pop_valid),
    .array_array_72922_q(array_array_72922_q),
    .array_array_72a15_w(array_array_72a15_driver_sram_master_72964_w),
    .array_array_72a15_widx(array_array_72a15_driver_sram_master_72964_widx),
    .array_array_72a15_d(array_array_72a15_driver_sram_master_72964_d),
    .array_array_72946_q(array_array_72946_q),
    .array_array_72946_w(array_array_72946_driver_sram_master_72964_w),
    .array_array_72946_widx(array_array_72946_driver_sram_master_72964_widx),
    .array_array_72946_d(array_array_72946_driver_sram_master_72964_d),
    .array_array_72928_q(array_array_72928_q),
    .array_array_72928_w(array_array_72928_driver_sram_master_72964_w),
    .array_array_72928_widx(array_array_72928_driver_sram_master_72964_widx),
    .array_array_72928_d(array_array_72928_driver_sram_master_72964_d),
    .array_array_7295b_q(array_array_7295b_q),
    .array_array_7295b_w(array_array_7295b_driver_sram_master_72964_w),
    .array_array_7295b_widx(array_array_7295b_driver_sram_master_72964_widx),
    .array_array_7295b_d(array_array_7295b_driver_sram_master_72964_d),
    .array_array_72934_q(array_array_72934_q),
    .memuser_72949_counter_delta_ready(memuser_72949_driver_sram_master_72964_counter_delta_ready),
    .memuser_72949_counter_delta(memuser_72949_driver_sram_master_72964_counter_delta),
    .array_array_72919_q(array_array_72919_q),
    .array_array_72940_q(array_array_72940_q),
    .array_array_7292e_q(array_array_7292e_q),
    .array_array_7293a_q(array_array_7293a_q),
    .expose_var_150(logic_var_150),
    .expose_var_150_valid(logic_var_150_valid),
    .expose_var_166(logic_var_166),
    .expose_var_166_valid(logic_var_166_valid),
    .expose_var_552(logic_var_552),
    .expose_var_552_valid(logic_var_552_valid),
    .expose_var_272(logic_var_272),
    .expose_var_272_valid(logic_var_272_valid),
    .counter_delta_ready(sram_master_72964_counter_delta_ready),
    .counter_pop_ready(sram_master_72964_counter_pop_ready),
    .counter_pop_valid(sram_master_72964_counter_pop_valid),
    .expose_executed(sram_master_72964_executed));
  logic [0:0] external_loop_74ebd_executed;

  // external_loop_74ebd
  external_loop_74ebd external_loop_74ebd_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_In_full_flag_pop_ready(fifo_external_loop_74ebd_In_full_flag_pop_ready),
    .fifo_In_full_flag_pop_data(fifo_external_loop_74ebd_In_full_flag_pop_data),
    .fifo_In_full_flag_pop_valid(fifo_external_loop_74ebd_In_full_flag_pop_valid),
    .array_array_74f02_q(array_array_74f02_q),
    .array_array_74f02_w(array_array_74f02_driver_external_loop_74ebd_w),
    .array_array_74f02_widx(array_array_74f02_driver_external_loop_74ebd_widx),
    .array_array_74f02_d(array_array_74f02_driver_external_loop_74ebd_d),
    .array_array_72919_q(array_array_72919_q),
    .array_array_72919_w(array_array_72919_driver_external_loop_74ebd_w),
    .array_array_72919_widx(array_array_72919_driver_external_loop_74ebd_widx),
    .array_array_72919_d(array_array_72919_driver_external_loop_74ebd_d),
    .fifo_sram_master_72964_Start_push_valid(fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_valid),
    .fifo_sram_master_72964_Start_push_data(fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_data),
    .fifo_sram_master_72964_Start_push_ready(fifo_sram_master_72964_Start_driver_external_loop_74ebd_push_ready),
    .sram_master_72964_counter_delta_ready(sram_master_72964_driver_external_loop_74ebd_counter_delta_ready),
    .sram_master_72964_counter_delta(sram_master_72964_driver_external_loop_74ebd_counter_delta),
    .counter_delta_ready(external_loop_74ebd_counter_delta_ready),
    .counter_pop_ready(external_loop_74ebd_counter_pop_ready),
    .counter_pop_valid(external_loop_74ebd_counter_pop_valid),
    .expose_executed(external_loop_74ebd_executed));
  logic [0:0] SRAM_74e21_executed;

  // SRAM_74e21
  SRAM_74e21 SRAM_74e21_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_memuser_72949_rdata_push_valid(fifo_memuser_72949_rdata_driver_SRAM_74e21_push_valid),
    .fifo_memuser_72949_rdata_push_data(fifo_memuser_72949_rdata_driver_SRAM_74e21_push_data),
    .fifo_memuser_72949_rdata_push_ready(fifo_memuser_72949_rdata_driver_SRAM_74e21_push_ready),
    // Upstream executed signals
    .sram_master_72964_executed(sram_master_72964_executed),
    .var_166(logic_var_166),
    .var_166_valid(logic_var_166_valid),
    .var_272(logic_var_272),
    .var_272_valid(logic_var_272_valid),
    .var_552(logic_var_552),
    .var_552_valid(logic_var_552_valid),
    .var_150(logic_var_150),
    .var_150_valid(logic_var_150_valid),
    .expose_executed(SRAM_74e21_executed));
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
logic [31:0]array_array_72919_exposed_o;
logic [31:0]array_array_72946_exposed_o;
logic [31:0]array_array_72922_exposed_o;
logic [2:0]array_array_72928_exposed_o;

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #3000100;
  


end

always #50 clk <= !clk;



top top_i (
  .clk(clk),
  .rst_n(rst_n),
  .array_array_72919_exposed_o(array_array_72919_exposed_o),
  .array_array_72946_exposed_o(array_array_72946_exposed_o),
  .array_array_72922_exposed_o(array_array_72922_exposed_o),
  .array_array_72928_exposed_o(array_array_72928_exposed_o)
);

endmodule
