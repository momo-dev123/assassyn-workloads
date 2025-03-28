////////////////////////////////////////////////////////////////
// Start of: /home/ubuntu/merge_sort.sv


module SRAM_15559 (
  input logic clk,
  input logic rst_n,
  // External FIFO reg_writer.rdata
  output logic [0:0] fifo_reg_writer_rdata_push_valid,
  output logic [31:0] fifo_reg_writer_rdata_push_data,
  input logic [0:0] fifo_reg_writer_rdata_push_ready,


  /* Array: array_15565[4096 x b32] */
  /* /Users/were/repos/assassyn-dev/examples/merge-sort/input/init.hex */




  // Declare upstream executed signals
  input logic [0:0] SortImpl_07f11_executed,
  input logic [0:0] var_402,
  input logic [0:0] var_402_valid,
  input logic [0:0] var_493,
  input logic [0:0] var_493_valid,
  input logic [31:0] var_548,
  input logic [0:0] var_548_valid,
  input logic [12:0] var_510,
  input logic [0:0] var_510_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_578;
  assign var_578 = dataout;
  // Gather FIFO pushes
  assign fifo_reg_writer_rdata_push_valid = (executed) && (((var_402)));
  assign fifo_reg_writer_rdata_push_data = ({ 32 { (var_402) } } & var_578);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_15565_w;
  logic [31:0] array_array_15565_d;
  logic [12:0] array_array_15565_widx;
  assign array_array_15565_w = (executed) && (((var_493)));
  assign array_array_15565_d = ({ 32 { (var_493) } } & var_548);
  assign array_array_15565_widx = var_510;


  memory_blackbox_array_15565 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(13)     
    ) memory_blackbox_array_15565(
    .clk     (clk), 
    .address (array_array_15565_widx), 
    .wd      (array_array_15565_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_15565_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = SortImpl_07f11_executed;
  assign expose_executed = executed;
endmodule // SRAM_15559




(* blackbox *)

module memory_blackbox_array_15565 #(
    parameter DATA_WIDTH = 32,   
    parameter ADDR_WIDTH = 13 
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
              
module SortImpl_07f11 (
  input logic clk,
  input logic rst_n,
  /* Array: array_06b91[1 x u13] */
  input logic [12:0] array_array_06b91_q,
  output logic [0:0] array_array_06b91_w,
  output logic [0:0] array_array_06b91_widx,
  output logic [12:0] array_array_06b91_d,

  /* Array: array_06bb9[1 x u1] */
  input logic [0:0] array_array_06bb9_q,
  output logic [0:0] array_array_06bb9_w,
  output logic [0:0] array_array_06bb9_widx,
  output logic [0:0] array_array_06bb9_d,



  /* Array: array_06b9d[1 x u13] */
  input logic [12:0] array_array_06b9d_q,

  /* Array: array_06b89[1 x u13] */
  input logic [12:0] array_array_06b89_q,

  /* Array: array_07ec5[2 x b32] */
  input logic [63:0] array_array_07ec5_q,
  output logic [0:0] array_array_07ec5_w,
  output logic [0:0] array_array_07ec5_widx,
  output logic [31:0] array_array_07ec5_d,

  /* Array: array_07f19[1 x u8] */
  output logic [0:0] array_array_07f19_w,
  output logic [0:0] array_array_07f19_widx,
  output logic [7:0] array_array_07f19_d,

  /* Array: array_07f31[2 x u13] */
  input logic [25:0] array_array_07f31_q,
  output logic [0:0] array_array_07f31_w,
  output logic [0:0] array_array_07f31_widx,
  output logic [12:0] array_array_07f31_d,

  /* Array: array_06ba9[1 x u13] */
  input logic [12:0] array_array_06ba9_q,


  // Module reg_writer
  output logic [7:0] reg_writer_counter_delta,
  input logic [0:0] reg_writer_counter_delta_ready,

  /* Array: array_06bc9[1 x u13] */
  input logic [12:0] array_array_06bc9_q,
  output logic [0:0] array_array_06bc9_w,
  output logic [0:0] array_array_06bc9_widx,
  output logic [12:0] array_array_06bc9_d,

  // Declare upstream executed signals
  input logic [0:0] sort_executed,
  input logic [0:0] reg_writer_executed,
  output logic [12:0] expose_var_510,
  output logic [0:0] expose_var_510_valid,
  output logic [0:0] expose_var_402,
  output logic [0:0] expose_var_402_valid,
  output logic [31:0] expose_var_548,
  output logic [0:0] expose_var_548_valid,
  output logic [0:0] expose_var_493,
  output logic [0:0] expose_var_493_valid,
  input logic [31:0] var_29,
  input logic [0:0] var_29_valid,
  input logic [7:0] var_38,
  input logic [0:0] var_38_valid,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_315;
  assign var_315 = var_38 == 8'd1;


  logic [12:0] var_585;
  assign var_585 = array_array_06b91_q[12:0];


  logic [12:0] var_500;
  assign var_500 = array_array_06b89_q[12:0];


  always_ff @(posedge clk) if (executed && (var_315))$display("%t\t[SortImpl_07f11]\t\t[sort.init] for block.size: %d, block.start: %d, and 1st element",



  $time

, var_500, var_585);

  logic [0:0] var_449;
  assign var_449 = var_38 == 8'd2;


  always_ff @(posedge clk) if (executed && (var_449))$display("%t\t[SortImpl_07f11]\t\t[sort.init] 2nd element",



  $time

);

  logic [0:0] var_153;
  assign var_153 = var_29_valid;


  logic [31:0] var_156;
  assign var_156 = var_153 ? var_29 : 32'd2147483647;


  logic [0:0] var_507;
  assign var_507 = array_array_06bb9_q[0:0];


  logic [0:0] var_163;
  assign var_163 = var_507 == 1'd0;


  logic [31:0] var_167;
  assign var_167 = array_array_07ec5_q[31:0];


  logic [31:0] var_170;
  assign var_170 = var_163 ? var_156 : var_167;


  logic [0:0] var_177;
  assign var_177 = var_507 == 1'd1;


  logic [31:0] var_181;
  assign var_181 = array_array_07ec5_q[63:32];


  logic [31:0] var_184;
  assign var_184 = var_177 ? var_156 : var_181;


  always_ff @(posedge clk) if (executed)$display("%t\t[SortImpl_07f11]\t\t%d",



  $time

, var_156);

  logic [0:0] var_192;
  assign var_192 = var_170 > var_184;


  logic [0:0] var_493;
  assign var_493 = var_38 == 8'd3;
  assign expose_var_493 = var_493;
  assign expose_var_493_valid = executed && 1;


  logic [12:0] var_529;
  assign var_529 = array_array_06bc9_q[12:0];


  logic [12:0] var_213;
  assign var_213 = var_529 + 13'd1;


  always_ff @(posedge clk) if (executed && (var_493))$display("%t\t[SortImpl_07f11]\t\t[loop.k++ ] %d",



  $time

, var_529);

  always_ff @(posedge clk) if (executed && (var_493))$display("%t\t[SortImpl_07f11]\t\tnew_value: %d | a: %d | b: %d | cmp: %d",



  $time

, var_156, var_170, var_184, var_192);

  logic [12:0] var_237;
  assign var_237 = var_500 >> 13'd1;


  logic [12:0] var_243;
  assign var_243 = 1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : ('x));


  logic [12:0] var_246;
  assign var_246 = var_243 + 13'd1;


  logic [0:0] var_249;
  assign var_249 = var_246 < var_237;


  logic [0:0] var_486;
  assign var_486 = var_38 == 8'd4;


  logic [12:0] var_514;
  assign var_514 = array_array_06b9d_q[12:0];


  logic [12:0] var_526;
  assign var_526 = array_array_06ba9_q[12:0];


  always_ff @(posedge clk) if (executed && (var_486))$display("%t\t[SortImpl_07f11]\t\t[sort.fill] refill the popped element",



  $time

);

  always_ff @(posedge clk) if (executed && (var_486))$display("%t\t[SortImpl_07f11]\t\tk: %d | block.size: %d | block.start: %d | from: %d | to: %d",



  $time

, var_529, var_500, var_585, var_514, var_526);

  logic [0:0] var_290;
  assign var_290 = var_529 < var_500;


  logic [0:0] var_306;
  assign var_306 = var_529 == var_500;


  logic [12:0] var_318;
  assign var_318 = var_585 + var_500;


  always_ff @(posedge clk) if (executed && (var_486 && var_306))$display("%t\t[SortImpl_07f11]\t\t[loop.next] block.start: %d",



  $time

, var_318);

  logic [0:0] var_333;
  assign var_333 = ~var_249;


  logic [12:0] var_348;
  assign var_348 = 1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : ('x));


  logic [12:0] var_351;
  assign var_351 = var_348 + 13'd1;


  logic [12:0] var_367;
  assign var_367 = 1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : ('x));


  always_ff @(posedge clk) if (executed && (var_486))$display("%t\t[SortImpl_07f11]\t\t[loop.idx] idx[%d]: %d",



  $time

, var_507, var_367);

  logic [0:0] var_381;
  assign var_381 = var_315 ? 1'd1 : 1'd0;


  logic [0:0] var_388;
  assign var_388 = var_449 ? 1'd1 : var_381;


  logic [0:0] var_395;
  assign var_395 = var_493 ? 1'd0 : var_388;


  logic [0:0] var_402;
  assign var_402 = var_486 ? var_249 : var_395;
  assign expose_var_402 = var_402;
  assign expose_var_402_valid = executed && 1;


  logic [0:0] var_409;
  assign var_409 = var_585 == 13'd2048;


  logic [12:0] var_421;
  assign var_421 = var_585 + var_514;


  logic [12:0] var_424;
  assign var_424 = var_409 ? var_526 : var_421;


  logic [12:0] var_431;
  assign var_431 = var_585 + var_237;


  logic [12:0] var_437;
  assign var_437 = var_431 + var_514;


  logic [12:0] var_446;
  assign var_446 = var_585 + var_529;


  logic [12:0] var_452;
  assign var_452 = var_446 + var_526;


  logic [12:0] var_461;
  assign var_461 = 1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : ('x));


  logic [12:0] var_464;
  assign var_464 = var_585 + var_461;


  logic [12:0] var_467;
  assign var_467 = var_464 + 13'd1;


  logic [12:0] var_473;
  assign var_473 = var_507 ? var_237 : 13'd0;


  logic [12:0] var_477;
  assign var_477 = var_467 + var_473;


  logic [12:0] var_483;
  assign var_483 = var_477 + var_514;


  logic [12:0] var_489;
  assign var_489 = var_315 ? var_424 : 13'd0;


  logic [12:0] var_496;
  assign var_496 = var_449 ? var_437 : var_489;


  logic [12:0] var_503;
  assign var_503 = var_493 ? var_452 : var_496;


  logic [12:0] var_510;
  assign var_510 = var_486 ? var_483 : var_503;
  assign expose_var_510 = var_510;
  assign expose_var_510_valid = executed && 1;


  logic [12:0] var_520;
  assign var_520 = 1 == var_507 ? array_array_07f31_q[25:13] : (0 == var_507 ? array_array_07f31_q[12:0] : ('x));


  always_ff @(posedge clk) if (executed)$display("%t\t[SortImpl_07f11]\t\tblock.start: %d | idx: %d | reg_idx: %d | k: %d | from: %d ",



  $time

, var_585, var_520, var_507, var_529, var_514);

  always_ff @(posedge clk) if (executed)$display("%t\t[SortImpl_07f11]\t\t[loop.sram] addr: %d",



  $time

, var_510);

  logic [31:0] var_544;
  assign var_544 = var_192 ? var_184 : var_170;


  logic [31:0] var_548;
  assign var_548 = var_493 ? var_544 : 32'd0;
  assign expose_var_548 = var_548;
  assign expose_var_548_valid = executed && 1;


  always_ff @(posedge clk) if (executed && (var_493))$display("%t\t[SortImpl_07f11]\t\t[loop.sram] wdata: %d | a: %d | b: %d ",



  $time

, var_548, var_170, var_184);

  assign reg_writer_counter_delta = executed ? { 7'b0, |(var_402) } : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_06bc9_w = (executed) && (((var_315)) || ((var_493)));
    assign array_array_06bc9_d = ({ 13 { (var_315) } } & 13'd0) | ({ 13 { (var_493) } } & var_213);
    assign array_array_06bc9_widx = ({ 1 { (var_315) } } & 1'd0) | ({ 1 { (var_493) } } & 1'd0);

    assign array_array_07f19_w = (executed) && (((var_315)) || ((var_449)) || ((var_493)) || ((var_486 && var_290)) || ((var_486 && var_306)));
    assign array_array_07f19_d = ({ 8 { (var_315) } } & 8'd2) | ({ 8 { (var_449) } } & 8'd3) | ({ 8 { (var_493) } } & 8'd4) | ({ 8 { (var_486 && var_290) } } & 8'd3) | ({ 8 { (var_486 && var_306) } } & 8'd1);
    assign array_array_07f19_widx = ({ 1 { (var_315) } } & 1'd0) | ({ 1 { (var_449) } } & 1'd0) | ({ 1 { (var_493) } } & 1'd0) | ({ 1 { (var_486 && var_290) } } & 1'd0) | ({ 1 { (var_486 && var_306) } } & 1'd0);

    assign array_array_06bb9_w = (executed) && (((var_315)) || ((var_449)) || ((var_493)));
    assign array_array_06bb9_d = ({ 1 { (var_315) } } & 1'd0) | ({ 1 { (var_449) } } & 1'd1) | ({ 1 { (var_493) } } & var_192);
    assign array_array_06bb9_widx = ({ 1 { (var_315) } } & 1'd0) | ({ 1 { (var_449) } } & 1'd0) | ({ 1 { (var_493) } } & 1'd0);

    assign array_array_06b91_w = (executed) && (((var_486 && var_306)));
    assign array_array_06b91_d = ({ 13 { (var_486 && var_306) } } & var_318);
    assign array_array_06b91_widx = ({ 1 { (var_486 && var_306) } } & 1'd0);

    assign array_array_07ec5_w = (executed) && (((var_486 && var_333)));
    assign array_array_07ec5_d = ({ 32 { (var_486 && var_333) } } & 32'd2147483647);
    assign array_array_07ec5_widx = ({ 1 { (var_486 && var_333) } } & var_507);

    assign array_array_07f31_w = (executed) && (((var_315)) || ((var_449)) || ((var_486)));
    assign array_array_07f31_d = ({ 13 { (var_315) } } & 13'd0) | ({ 13 { (var_449) } } & 13'd0) | ({ 13 { (var_486) } } & var_351);
    assign array_array_07f31_widx = ({ 1 { (var_315) } } & 1'd0) | ({ 1 { (var_449) } } & 1'd1) | ({ 1 { (var_486) } } & var_507);

    assign executed = sort_executed || reg_writer_executed;
  assign expose_executed = executed;
endmodule // SortImpl_07f11


module sort (
  input logic clk,
  input logic rst_n,
  /* Array: array_07f19[1 x u8] */
  input logic [7:0] array_array_07f19_q,

  output logic [7:0] expose_var_38,
  output logic [0:0] expose_var_38_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [7:0] var_38;
  assign var_38 = array_array_07f19_q[7:0];
  assign expose_var_38 = var_38;
  assign expose_var_38_valid = executed && 1;


  // Gather FIFO pushes
  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // sort


module driver (
  input logic clk,
  input logic rst_n,
  /* Array: array_06b89[1 x u13] */
  input logic [12:0] array_array_06b89_q,
  output logic [0:0] array_array_06b89_w,
  output logic [0:0] array_array_06b89_widx,
  output logic [12:0] array_array_06b89_d,

  /* Array: array_06b9d[1 x u13] */
  input logic [12:0] array_array_06b9d_q,
  output logic [0:0] array_array_06b9d_w,
  output logic [0:0] array_array_06b9d_widx,
  output logic [12:0] array_array_06b9d_d,

  /* Array: array_06ba9[1 x u13] */
  input logic [12:0] array_array_06ba9_q,
  output logic [0:0] array_array_06ba9_w,
  output logic [0:0] array_array_06ba9_widx,
  output logic [12:0] array_array_06ba9_d,

  /* Array: array_06b91[1 x u13] */
  input logic [12:0] array_array_06b91_q,
  output logic [0:0] array_array_06b91_w,
  output logic [0:0] array_array_06b91_widx,
  output logic [12:0] array_array_06b91_d,

  // Module sort
  output logic [7:0] sort_counter_delta,
  input logic [0:0] sort_counter_delta_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [12:0] var_41;
  assign var_41 = array_array_06b91_q[12:0];


  logic [0:0] var_44;
  assign var_44 = var_41 == 13'd2048;


  logic [12:0] var_523;
  assign var_523 = array_array_06b89_q[12:0];


  logic [0:0] var_53;
  assign var_53 = var_523 == 13'd2048;






  logic [12:0] var_64;
  assign var_64 = var_523 << 13'd1;


  logic [12:0] var_75;
  assign var_75 = array_array_06ba9_q[12:0];


  logic [12:0] var_82;
  assign var_82 = array_array_06b9d_q[12:0];


  always_ff @(posedge clk) if (executed && (var_44))$display("%t\t[driver]\t\t[loop.2x  ] block.size, reset block.start, swap from/to",



  $time

);

  assign sort_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_06b89_w = (executed) && (((var_44)));
    assign array_array_06b89_d = ({ 13 { (var_44) } } & var_64);
    assign array_array_06b89_widx = ({ 1 { (var_44) } } & 1'd0);

    assign array_array_06b9d_w = (executed) && (((var_44)));
    assign array_array_06b9d_d = ({ 13 { (var_44) } } & var_75);
    assign array_array_06b9d_widx = ({ 1 { (var_44) } } & 1'd0);

    assign array_array_06b91_w = (executed) && (((var_44)));
    assign array_array_06b91_d = ({ 13 { (var_44) } } & 13'd0);
    assign array_array_06b91_widx = ({ 1 { (var_44) } } & 1'd0);

    assign array_array_06ba9_w = (executed) && (((var_44)));
    assign array_array_06ba9_d = ({ 13 { (var_44) } } & var_82);
    assign array_array_06ba9_widx = ({ 1 { (var_44) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver


module reg_writer (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_06bb9[1 x u1] */
  input logic [0:0] array_array_06bb9_q,

  /* Array: array_07ec5[2 x b32] */
  output logic [0:0] array_array_07ec5_w,
  output logic [0:0] array_array_07ec5_widx,
  output logic [31:0] array_array_07ec5_d,

  output logic [31:0] expose_var_29,
  output logic [0:0] expose_var_29_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_29;
  assign var_29 = fifo_rdata_pop_data;
  assign expose_var_29 = var_29;
  assign expose_var_29_valid = executed && 1;


  assign fifo_rdata_pop_ready = executed;
  logic [0:0] var_31;
  assign var_31 = array_array_06bb9_q[0:0];


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_07ec5_w = executed;
    assign array_array_07ec5_d = var_29;
    assign array_array_07ec5_widx = var_31;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // reg_writer

module top(
  output logic [0:0] array_array_06bb9_exposed_o,
  input logic [0:0] array_array_06bb9_exposed_i,
  input logic [0:0] array_array_06bb9_exposed_i_valid,
  output logic [12:0] array_array_06b9d_exposed_o,
  input logic [12:0] array_array_06b9d_exposed_i,
  input logic [0:0] array_array_06b9d_exposed_i_valid,
  output logic [12:0] array_array_06b89_exposed_o,
  input logic [12:0] array_array_06b89_exposed_i,
  input logic [0:0] array_array_06b89_exposed_i_valid,
  output logic [12:0] array_array_06b91_exposed_o,
  input logic [12:0] array_array_06b91_exposed_i,
  input logic [0:0] array_array_06b91_exposed_i_valid,
  output logic [12:0] array_array_06ba9_exposed_o,
  input logic [12:0] array_array_06ba9_exposed_i,
  input logic [0:0] array_array_06ba9_exposed_i_valid,
  output logic [63:0] array_array_07ec5_exposed_o,
  input logic [31:0] array_array_07ec5_exposed_i,
  input logic [0:0] array_array_07ec5_exposed_i_valid,

  input logic clk,
  input logic rst_n
);

//Array: array_15565, Init File Path: /Users/were/repos/assassyn-dev/examples/merge-sort/input/init.hex
  /* Array: array_07f19[1 x u8] */
  logic [7:0] array_array_07f19_q;
  logic [7:0] array_array_07f19_driver_SortImpl_07f11_d;
  logic [0:0] array_array_07f19_driver_SortImpl_07f11_w;
  logic [0:0] array_array_07f19_driver_SortImpl_07f11_widx;
  logic [7:0] array_array_07f19_d;
  logic [0:0] array_array_07f19_widx;
  logic [0:0] array_array_07f19_w;
  assign array_array_07f19_d = ({ 8 { array_array_07f19_driver_SortImpl_07f11_w } } & array_array_07f19_driver_SortImpl_07f11_d);
  assign array_array_07f19_widx = ({ 1 { array_array_07f19_driver_SortImpl_07f11_w } } & array_array_07f19_driver_SortImpl_07f11_widx);
  assign array_array_07f19_w = array_array_07f19_driver_SortImpl_07f11_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_07f19_q[7:0] <= 8'd1;
    end
    else if (array_array_07f19_w) begin

      case (array_array_07f19_widx)
        0 : array_array_07f19_q[7:0] <= array_array_07f19_d;
        default: ;
      endcase
    end
  /* Array: array_15565[4096 x b32] */
  logic [31:0] array_array_15565_q;
  logic [31:0] array_array_15565_driver_SRAM_15559_d;
  logic [0:0] array_array_15565_driver_SRAM_15559_w;
  logic [11:0] array_array_15565_driver_SRAM_15559_widx;
  /* Array: array_07ec5[2 x b32] */
  logic [63:0] array_array_07ec5_q;
  logic [31:0] array_array_07ec5_driver_SortImpl_07f11_d;
  logic [0:0] array_array_07ec5_driver_SortImpl_07f11_w;
  logic [0:0] array_array_07ec5_driver_SortImpl_07f11_widx;
  logic [31:0] array_array_07ec5_driver_reg_writer_d;
  logic [0:0] array_array_07ec5_driver_reg_writer_w;
  logic [0:0] array_array_07ec5_driver_reg_writer_widx;
  assign array_array_07ec5_exposed_o = array_array_07ec5_q;
  logic [31:0] array_array_07ec5_temp;
  assign array_array_07ec5_temp = array_array_07ec5_exposed_i_valid?array_array_07ec5_exposed_i:array_array_07ec5_d;
  logic [31:0] array_array_07ec5_d;
  logic [0:0] array_array_07ec5_widx;
  logic [0:0] array_array_07ec5_w;
  assign array_array_07ec5_d = ({ 32 { array_array_07ec5_driver_SortImpl_07f11_w } } & array_array_07ec5_driver_SortImpl_07f11_d) | ({ 32 { array_array_07ec5_driver_reg_writer_w } } & array_array_07ec5_driver_reg_writer_d);
  assign array_array_07ec5_widx = ({ 1 { array_array_07ec5_driver_SortImpl_07f11_w } } & array_array_07ec5_driver_SortImpl_07f11_widx) | ({ 1 { array_array_07ec5_driver_reg_writer_w } } & array_array_07ec5_driver_reg_writer_widx);
  assign array_array_07ec5_w = array_array_07ec5_driver_SortImpl_07f11_w | array_array_07ec5_driver_reg_writer_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_07ec5_q[31:0] <= 32'd0;
      array_array_07ec5_q[63:32] <= 32'd0;
    end
    else if (array_array_07ec5_w) begin

      case (array_array_07ec5_widx)
        0 : array_array_07ec5_q[31:0] <= array_array_07ec5_temp;
        1 : array_array_07ec5_q[63:32] <= array_array_07ec5_temp;
        default: ;
      endcase
    end
  /* Array: array_06ba9[1 x u13] */
  logic [12:0] array_array_06ba9_q;
  logic [12:0] array_array_06ba9_driver_driver_d;
  logic [0:0] array_array_06ba9_driver_driver_w;
  logic [0:0] array_array_06ba9_driver_driver_widx;
  assign array_array_06ba9_exposed_o = array_array_06ba9_q;
  logic [12:0] array_array_06ba9_temp;
  assign array_array_06ba9_temp = array_array_06ba9_exposed_i_valid?array_array_06ba9_exposed_i:array_array_06ba9_d;
  logic [12:0] array_array_06ba9_d;
  logic [0:0] array_array_06ba9_widx;
  logic [0:0] array_array_06ba9_w;
  assign array_array_06ba9_d = ({ 13 { array_array_06ba9_driver_driver_w } } & array_array_06ba9_driver_driver_d);
  assign array_array_06ba9_widx = ({ 1 { array_array_06ba9_driver_driver_w } } & array_array_06ba9_driver_driver_widx);
  assign array_array_06ba9_w = array_array_06ba9_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_06ba9_q[12:0] <= 13'd2048;
    end
    else if (array_array_06ba9_w) begin

      case (array_array_06ba9_widx)
        0 : array_array_06ba9_q[12:0] <= array_array_06ba9_temp;
        default: ;
      endcase
    end
  /* Array: array_06b9d[1 x u13] */
  logic [12:0] array_array_06b9d_q;
  logic [12:0] array_array_06b9d_driver_driver_d;
  logic [0:0] array_array_06b9d_driver_driver_w;
  logic [0:0] array_array_06b9d_driver_driver_widx;
  assign array_array_06b9d_exposed_o = array_array_06b9d_q;
  logic [12:0] array_array_06b9d_temp;
  assign array_array_06b9d_temp = array_array_06b9d_exposed_i_valid?array_array_06b9d_exposed_i:array_array_06b9d_d;
  logic [12:0] array_array_06b9d_d;
  logic [0:0] array_array_06b9d_widx;
  logic [0:0] array_array_06b9d_w;
  assign array_array_06b9d_d = ({ 13 { array_array_06b9d_driver_driver_w } } & array_array_06b9d_driver_driver_d);
  assign array_array_06b9d_widx = ({ 1 { array_array_06b9d_driver_driver_w } } & array_array_06b9d_driver_driver_widx);
  assign array_array_06b9d_w = array_array_06b9d_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_06b9d_q[12:0] <= 13'd0;
    end
    else if (array_array_06b9d_w) begin

      case (array_array_06b9d_widx)
        0 : array_array_06b9d_q[12:0] <= array_array_06b9d_temp;
        default: ;
      endcase
    end
  /* Array: array_07f31[2 x u13] */
  logic [25:0] array_array_07f31_q;
  logic [12:0] array_array_07f31_driver_SortImpl_07f11_d;
  logic [0:0] array_array_07f31_driver_SortImpl_07f11_w;
  logic [0:0] array_array_07f31_driver_SortImpl_07f11_widx;
  logic [12:0] array_array_07f31_d;
  logic [0:0] array_array_07f31_widx;
  logic [0:0] array_array_07f31_w;
  assign array_array_07f31_d = ({ 13 { array_array_07f31_driver_SortImpl_07f11_w } } & array_array_07f31_driver_SortImpl_07f11_d);
  assign array_array_07f31_widx = ({ 1 { array_array_07f31_driver_SortImpl_07f11_w } } & array_array_07f31_driver_SortImpl_07f11_widx);
  assign array_array_07f31_w = array_array_07f31_driver_SortImpl_07f11_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_07f31_q[12:0] <= 13'd0;
      array_array_07f31_q[25:13] <= 13'd0;
    end
    else if (array_array_07f31_w) begin

      case (array_array_07f31_widx)
        0 : array_array_07f31_q[12:0] <= array_array_07f31_d;
        1 : array_array_07f31_q[25:13] <= array_array_07f31_d;
        default: ;
      endcase
    end
  /* Array: array_06b91[1 x u13] */
  logic [12:0] array_array_06b91_q;
  logic [12:0] array_array_06b91_driver_driver_d;
  logic [0:0] array_array_06b91_driver_driver_w;
  logic [0:0] array_array_06b91_driver_driver_widx;
  logic [12:0] array_array_06b91_driver_SortImpl_07f11_d;
  logic [0:0] array_array_06b91_driver_SortImpl_07f11_w;
  logic [0:0] array_array_06b91_driver_SortImpl_07f11_widx;
  assign array_array_06b91_exposed_o = array_array_06b91_q;
  logic [12:0] array_array_06b91_temp;
  assign array_array_06b91_temp = array_array_06b91_exposed_i_valid?array_array_06b91_exposed_i:array_array_06b91_d;
  logic [12:0] array_array_06b91_d;
  logic [0:0] array_array_06b91_widx;
  logic [0:0] array_array_06b91_w;
  assign array_array_06b91_d = ({ 13 { array_array_06b91_driver_driver_w } } & array_array_06b91_driver_driver_d) | ({ 13 { array_array_06b91_driver_SortImpl_07f11_w } } & array_array_06b91_driver_SortImpl_07f11_d);
  assign array_array_06b91_widx = ({ 1 { array_array_06b91_driver_driver_w } } & array_array_06b91_driver_driver_widx) | ({ 1 { array_array_06b91_driver_SortImpl_07f11_w } } & array_array_06b91_driver_SortImpl_07f11_widx);
  assign array_array_06b91_w = array_array_06b91_driver_driver_w | array_array_06b91_driver_SortImpl_07f11_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_06b91_q[12:0] <= 13'd0;
    end
    else if (array_array_06b91_w) begin

      case (array_array_06b91_widx)
        0 : array_array_06b91_q[12:0] <= array_array_06b91_temp;
        default: ;
      endcase
    end
  /* Array: array_06bb9[1 x u1] */
  logic [0:0] array_array_06bb9_q;
  logic [0:0] array_array_06bb9_driver_SortImpl_07f11_d;
  logic [0:0] array_array_06bb9_driver_SortImpl_07f11_w;
  logic [0:0] array_array_06bb9_driver_SortImpl_07f11_widx;
  assign array_array_06bb9_exposed_o = array_array_06bb9_q;
  logic [0:0] array_array_06bb9_temp;
  assign array_array_06bb9_temp = array_array_06bb9_exposed_i_valid?array_array_06bb9_exposed_i:array_array_06bb9_d;
  logic [0:0] array_array_06bb9_d;
  logic [0:0] array_array_06bb9_widx;
  logic [0:0] array_array_06bb9_w;
  assign array_array_06bb9_d = ({ 1 { array_array_06bb9_driver_SortImpl_07f11_w } } & array_array_06bb9_driver_SortImpl_07f11_d);
  assign array_array_06bb9_widx = ({ 1 { array_array_06bb9_driver_SortImpl_07f11_w } } & array_array_06bb9_driver_SortImpl_07f11_widx);
  assign array_array_06bb9_w = array_array_06bb9_driver_SortImpl_07f11_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_06bb9_q[0:0] <= 1'd0;
    end
    else if (array_array_06bb9_w) begin

      case (array_array_06bb9_widx)
        0 : array_array_06bb9_q[0:0] <= array_array_06bb9_temp;
        default: ;
      endcase
    end
  /* Array: array_06b89[1 x u13] */
  logic [12:0] array_array_06b89_q;
  logic [12:0] array_array_06b89_driver_driver_d;
  logic [0:0] array_array_06b89_driver_driver_w;
  logic [0:0] array_array_06b89_driver_driver_widx;
  assign array_array_06b89_exposed_o = array_array_06b89_q;
  logic [12:0] array_array_06b89_temp;
  assign array_array_06b89_temp = array_array_06b89_exposed_i_valid?array_array_06b89_exposed_i:array_array_06b89_d;
  logic [12:0] array_array_06b89_d;
  logic [0:0] array_array_06b89_widx;
  logic [0:0] array_array_06b89_w;
  assign array_array_06b89_d = ({ 13 { array_array_06b89_driver_driver_w } } & array_array_06b89_driver_driver_d);
  assign array_array_06b89_widx = ({ 1 { array_array_06b89_driver_driver_w } } & array_array_06b89_driver_driver_widx);
  assign array_array_06b89_w = array_array_06b89_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_06b89_q[12:0] <= 13'd2;
    end
    else if (array_array_06b89_w) begin

      case (array_array_06b89_widx)
        0 : array_array_06b89_q[12:0] <= array_array_06b89_temp;
        default: ;
      endcase
    end
  /* Array: array_06bc9[1 x u13] */
  logic [12:0] array_array_06bc9_q;
  logic [12:0] array_array_06bc9_driver_SortImpl_07f11_d;
  logic [0:0] array_array_06bc9_driver_SortImpl_07f11_w;
  logic [0:0] array_array_06bc9_driver_SortImpl_07f11_widx;
  logic [12:0] array_array_06bc9_d;
  logic [0:0] array_array_06bc9_widx;
  logic [0:0] array_array_06bc9_w;
  assign array_array_06bc9_d = ({ 13 { array_array_06bc9_driver_SortImpl_07f11_w } } & array_array_06bc9_driver_SortImpl_07f11_d);
  assign array_array_06bc9_widx = ({ 1 { array_array_06bc9_driver_SortImpl_07f11_w } } & array_array_06bc9_driver_SortImpl_07f11_widx);
  assign array_array_06bc9_w = array_array_06bc9_driver_SortImpl_07f11_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_06bc9_q[12:0] <= 13'd0;
    end
    else if (array_array_06bc9_w) begin

      case (array_array_06bc9_widx)
        0 : array_array_06bc9_q[12:0] <= array_array_06bc9_d;
        default: ;
      endcase
    end
  // fifo: rdata: fifo<b32>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_reg_writer_rdata_pop_data;
  logic [0:0] fifo_reg_writer_rdata_pop_valid;
  logic [0:0] fifo_reg_writer_rdata_pop_ready;
  logic [31:0] fifo_reg_writer_rdata_driver_SRAM_15559_push_data;
  logic [0:0] fifo_reg_writer_rdata_driver_SRAM_15559_push_valid;
  logic [0:0] fifo_reg_writer_rdata_driver_SRAM_15559_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_reg_writer_rdata_push_ready;
  assign fifo_reg_writer_rdata_driver_SRAM_15559_push_ready = fifo_reg_writer_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_reg_writer_rdata_push_valid;
  assign fifo_reg_writer_rdata_push_valid = fifo_reg_writer_rdata_driver_SRAM_15559_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_reg_writer_rdata_push_data;
  assign fifo_reg_writer_rdata_push_data = ({ 32 { fifo_reg_writer_rdata_driver_SRAM_15559_push_valid } } & fifo_reg_writer_rdata_driver_SRAM_15559_push_data);

  fifo #(32, 2) fifo_reg_writer_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_reg_writer_rdata_push_valid),
    .push_data(fifo_reg_writer_rdata_push_data),
    .push_ready(fifo_reg_writer_rdata_push_ready),
    .pop_valid(fifo_reg_writer_rdata_pop_valid),
    .pop_data(fifo_reg_writer_rdata_pop_data),
    .pop_ready(fifo_reg_writer_rdata_pop_ready));

  // Trigger SM of Module: sort
  logic [7:0] sort_driver_driver_counter_delta;
  logic [0:0] sort_driver_driver_counter_delta_ready;
  logic [0:0] sort_counter_delta_ready;
  logic [7:0] sort_counter_delta;
  // Gather all the push signal
  assign sort_counter_delta = sort_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] sort_counter_pop_ready;
  assign sort_driver_driver_counter_delta_ready = sort_counter_pop_ready;
  logic [0:0] sort_counter_pop_valid;

  trigger_counter #(8) sort_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(sort_counter_delta),
    .delta_ready(sort_counter_delta_ready),
    .pop_valid(sort_counter_pop_valid),
    .pop_ready(sort_counter_pop_ready));
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
  // Trigger SM of Module: reg_writer
  logic [7:0] reg_writer_driver_SortImpl_07f11_counter_delta;
  logic [0:0] reg_writer_driver_SortImpl_07f11_counter_delta_ready;
  logic [0:0] reg_writer_counter_delta_ready;
  logic [7:0] reg_writer_counter_delta;
  // Gather all the push signal
  assign reg_writer_counter_delta = reg_writer_driver_SortImpl_07f11_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] reg_writer_counter_pop_ready;
  assign reg_writer_driver_SortImpl_07f11_counter_delta_ready = reg_writer_counter_pop_ready;
  logic [0:0] reg_writer_counter_pop_valid;

  trigger_counter #(8) reg_writer_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(reg_writer_counter_delta),
    .delta_ready(reg_writer_counter_delta_ready),
    .pop_valid(reg_writer_counter_pop_valid),
    .pop_ready(reg_writer_counter_pop_ready));
  assign driver_counter_delta = 8'b1;

  logic [7:0] logic_var_38;
  logic [0:0] logic_var_38_valid;
  logic [0:0] sort_executed;

  // sort
  sort sort_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_07f19_q(array_array_07f19_q),
    .expose_var_38(logic_var_38),
    .expose_var_38_valid(logic_var_38_valid),
    .counter_delta_ready(sort_counter_delta_ready),
    .counter_pop_ready(sort_counter_pop_ready),
    .counter_pop_valid(sort_counter_pop_valid),
    .expose_executed(sort_executed));
  logic [0:0] driver_executed;

  // driver
  driver driver_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_06b89_q(array_array_06b89_q),
    .array_array_06b89_w(array_array_06b89_driver_driver_w),
    .array_array_06b89_widx(array_array_06b89_driver_driver_widx),
    .array_array_06b89_d(array_array_06b89_driver_driver_d),
    .array_array_06b9d_q(array_array_06b9d_q),
    .array_array_06b9d_w(array_array_06b9d_driver_driver_w),
    .array_array_06b9d_widx(array_array_06b9d_driver_driver_widx),
    .array_array_06b9d_d(array_array_06b9d_driver_driver_d),
    .array_array_06ba9_q(array_array_06ba9_q),
    .array_array_06ba9_w(array_array_06ba9_driver_driver_w),
    .array_array_06ba9_widx(array_array_06ba9_driver_driver_widx),
    .array_array_06ba9_d(array_array_06ba9_driver_driver_d),
    .array_array_06b91_q(array_array_06b91_q),
    .array_array_06b91_w(array_array_06b91_driver_driver_w),
    .array_array_06b91_widx(array_array_06b91_driver_driver_widx),
    .array_array_06b91_d(array_array_06b91_driver_driver_d),
    .sort_counter_delta_ready(sort_driver_driver_counter_delta_ready),
    .sort_counter_delta(sort_driver_driver_counter_delta),
    .counter_delta_ready(driver_counter_delta_ready),
    .counter_pop_ready(driver_counter_pop_ready),
    .counter_pop_valid(driver_counter_pop_valid),
    .expose_executed(driver_executed));
  logic [31:0] logic_var_29;
  logic [0:0] logic_var_29_valid;
  logic [0:0] reg_writer_executed;

  // reg_writer
  reg_writer reg_writer_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_rdata_pop_ready(fifo_reg_writer_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_reg_writer_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_reg_writer_rdata_pop_valid),
    .array_array_06bb9_q(array_array_06bb9_q),
    .array_array_07ec5_w(array_array_07ec5_driver_reg_writer_w),
    .array_array_07ec5_widx(array_array_07ec5_driver_reg_writer_widx),
    .array_array_07ec5_d(array_array_07ec5_driver_reg_writer_d),
    .expose_var_29(logic_var_29),
    .expose_var_29_valid(logic_var_29_valid),
    .counter_delta_ready(reg_writer_counter_delta_ready),
    .counter_pop_ready(reg_writer_counter_pop_ready),
    .counter_pop_valid(reg_writer_counter_pop_valid),
    .expose_executed(reg_writer_executed));
  logic [0:0] SRAM_15559_executed;

  // SRAM_15559
  SRAM_15559 SRAM_15559_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_reg_writer_rdata_push_valid(fifo_reg_writer_rdata_driver_SRAM_15559_push_valid),
    .fifo_reg_writer_rdata_push_data(fifo_reg_writer_rdata_driver_SRAM_15559_push_data),
    .fifo_reg_writer_rdata_push_ready(fifo_reg_writer_rdata_driver_SRAM_15559_push_ready),
    // Upstream executed signals
    .SortImpl_07f11_executed(SortImpl_07f11_executed),
    .var_402(logic_var_402),
    .var_402_valid(logic_var_402_valid),
    .var_493(logic_var_493),
    .var_493_valid(logic_var_493_valid),
    .var_548(logic_var_548),
    .var_548_valid(logic_var_548_valid),
    .var_510(logic_var_510),
    .var_510_valid(logic_var_510_valid),
    .expose_executed(SRAM_15559_executed));
  logic [12:0] logic_var_510;
  logic [0:0] logic_var_510_valid;
  logic [0:0] logic_var_402;
  logic [0:0] logic_var_402_valid;
  logic [31:0] logic_var_548;
  logic [0:0] logic_var_548_valid;
  logic [0:0] logic_var_493;
  logic [0:0] logic_var_493_valid;
  logic [0:0] SortImpl_07f11_executed;

  // SortImpl_07f11
  SortImpl_07f11 SortImpl_07f11_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_06b91_q(array_array_06b91_q),
    .array_array_06b91_w(array_array_06b91_driver_SortImpl_07f11_w),
    .array_array_06b91_widx(array_array_06b91_driver_SortImpl_07f11_widx),
    .array_array_06b91_d(array_array_06b91_driver_SortImpl_07f11_d),
    .array_array_06bb9_q(array_array_06bb9_q),
    .array_array_06bb9_w(array_array_06bb9_driver_SortImpl_07f11_w),
    .array_array_06bb9_widx(array_array_06bb9_driver_SortImpl_07f11_widx),
    .array_array_06bb9_d(array_array_06bb9_driver_SortImpl_07f11_d),
    .array_array_06b9d_q(array_array_06b9d_q),
    .array_array_06b89_q(array_array_06b89_q),
    .array_array_07ec5_q(array_array_07ec5_q),
    .array_array_07ec5_w(array_array_07ec5_driver_SortImpl_07f11_w),
    .array_array_07ec5_widx(array_array_07ec5_driver_SortImpl_07f11_widx),
    .array_array_07ec5_d(array_array_07ec5_driver_SortImpl_07f11_d),
    .array_array_07f19_w(array_array_07f19_driver_SortImpl_07f11_w),
    .array_array_07f19_widx(array_array_07f19_driver_SortImpl_07f11_widx),
    .array_array_07f19_d(array_array_07f19_driver_SortImpl_07f11_d),
    .array_array_07f31_q(array_array_07f31_q),
    .array_array_07f31_w(array_array_07f31_driver_SortImpl_07f11_w),
    .array_array_07f31_widx(array_array_07f31_driver_SortImpl_07f11_widx),
    .array_array_07f31_d(array_array_07f31_driver_SortImpl_07f11_d),
    .array_array_06ba9_q(array_array_06ba9_q),
    .reg_writer_counter_delta_ready(reg_writer_driver_SortImpl_07f11_counter_delta_ready),
    .reg_writer_counter_delta(reg_writer_driver_SortImpl_07f11_counter_delta),
    .array_array_06bc9_q(array_array_06bc9_q),
    .array_array_06bc9_w(array_array_06bc9_driver_SortImpl_07f11_w),
    .array_array_06bc9_widx(array_array_06bc9_driver_SortImpl_07f11_widx),
    .array_array_06bc9_d(array_array_06bc9_driver_SortImpl_07f11_d),
    // Upstream executed signals
    .reg_writer_executed(reg_writer_executed),
    .sort_executed(sort_executed),
    .expose_var_510(logic_var_510),
    .expose_var_510_valid(logic_var_510_valid),
    .expose_var_402(logic_var_402),
    .expose_var_402_valid(logic_var_402_valid),
    .expose_var_548(logic_var_548),
    .expose_var_548_valid(logic_var_548_valid),
    .expose_var_493(logic_var_493),
    .expose_var_493_valid(logic_var_493_valid),
    .var_29(logic_var_29),
    .var_29_valid(logic_var_29_valid),
    .var_38(logic_var_38),
    .var_38_valid(logic_var_38_valid),
    .expose_executed(SortImpl_07f11_executed));
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
logic [0:0]array_array_06bb9_exposed_o;
logic [0:0]array_array_06bb9_exposed_i;
logic array_array_06bb9_exposed_i_valid;

assign array_array_06bb9_exposed_i_valid = 1'd0;
assign array_array_06bb9_exposed_i = 1'd0;
logic [12:0]array_array_06b9d_exposed_o;
logic [12:0]array_array_06b9d_exposed_i;
logic array_array_06b9d_exposed_i_valid;

assign array_array_06b9d_exposed_i_valid = 1'd0;
assign array_array_06b9d_exposed_i = 13'd0;
logic [12:0]array_array_06b89_exposed_o;
logic [12:0]array_array_06b89_exposed_i;
logic array_array_06b89_exposed_i_valid;

assign array_array_06b89_exposed_i_valid = 1'd0;
assign array_array_06b89_exposed_i = 13'd0;
logic [12:0]array_array_06b91_exposed_o;
logic [12:0]array_array_06b91_exposed_i;
logic array_array_06b91_exposed_i_valid;

assign array_array_06b91_exposed_i_valid = 1'd0;
assign array_array_06b91_exposed_i = 13'd0;
logic [12:0]array_array_06ba9_exposed_o;
logic [12:0]array_array_06ba9_exposed_i;
logic array_array_06ba9_exposed_i_valid;

assign array_array_06ba9_exposed_i_valid = 1'd0;
assign array_array_06ba9_exposed_i = 13'd0;
logic [63:0]array_array_07ec5_exposed_o;
logic [31:0]array_array_07ec5_exposed_i;
logic array_array_07ec5_exposed_i_valid;

assign array_array_07ec5_exposed_i_valid = 1'd0;
assign array_array_07ec5_exposed_i = 32'd0;

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
  .array_array_06bb9_exposed_o(array_array_06bb9_exposed_o),
  .array_array_06bb9_exposed_i(array_array_06bb9_exposed_i),
  .array_array_06bb9_exposed_i_valid(array_array_06bb9_exposed_i_valid),
  .array_array_06b9d_exposed_o(array_array_06b9d_exposed_o),
  .array_array_06b9d_exposed_i(array_array_06b9d_exposed_i),
  .array_array_06b9d_exposed_i_valid(array_array_06b9d_exposed_i_valid),
  .array_array_06b89_exposed_o(array_array_06b89_exposed_o),
  .array_array_06b89_exposed_i(array_array_06b89_exposed_i),
  .array_array_06b89_exposed_i_valid(array_array_06b89_exposed_i_valid),
  .array_array_06b91_exposed_o(array_array_06b91_exposed_o),
  .array_array_06b91_exposed_i(array_array_06b91_exposed_i),
  .array_array_06b91_exposed_i_valid(array_array_06b91_exposed_i_valid),
  .array_array_06ba9_exposed_o(array_array_06ba9_exposed_o),
  .array_array_06ba9_exposed_i(array_array_06ba9_exposed_i),
  .array_array_06ba9_exposed_i_valid(array_array_06ba9_exposed_i_valid),
  .array_array_07ec5_exposed_o(array_array_07ec5_exposed_o),
  .array_array_07ec5_exposed_i(array_array_07ec5_exposed_i),
  .array_array_07ec5_exposed_i_valid(array_array_07ec5_exposed_i_valid)
);

endmodule


// End of: /home/ubuntu/merge_sort.sv
////////////////////////////////////////////////////////////////
