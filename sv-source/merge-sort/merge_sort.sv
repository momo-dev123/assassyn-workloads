
module driver (
  input logic clk,
  input logic rst_n,
  // Module sort
  output logic [7:0] sort_counter_delta,
  input logic [0:0] sort_counter_delta_ready,

  /* Array: array_317cd[1 x u13] */
  input logic [12:0] array_array_317cd_q,
  output logic [0:0] array_array_317cd_w,
  output logic [0:0] array_array_317cd_widx,
  output logic [12:0] array_array_317cd_d,

  /* Array: array_317b5[1 x u13] */
  input logic [12:0] array_array_317b5_q,
  output logic [0:0] array_array_317b5_w,
  output logic [0:0] array_array_317b5_widx,
  output logic [12:0] array_array_317b5_d,

  /* Array: array_317c1[1 x u13] */
  input logic [12:0] array_array_317c1_q,
  output logic [0:0] array_array_317c1_w,
  output logic [0:0] array_array_317c1_widx,
  output logic [12:0] array_array_317c1_d,

  /* Array: array_317d9[1 x u13] */
  input logic [12:0] array_array_317d9_q,
  output logic [0:0] array_array_317d9_w,
  output logic [0:0] array_array_317d9_widx,
  output logic [12:0] array_array_317d9_d,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [12:0] var_41;
  assign var_41 = array_array_317c1_q[12:0];


  logic [0:0] var_44;
  assign var_44 = var_41 == 13'd2048;


  logic [12:0] var_588;
  assign var_588 = array_array_317b5_q[12:0];


  logic [0:0] var_53;
  assign var_53 = var_588 == 13'd2048;


  always_ff @(posedge clk) if (executed && (var_44 && var_53))$display("%t\t[driver]\t\tfinish",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
);


`ifndef SYNTHESIS
  always_ff @(posedge clk) if (executed && (var_44 && var_53)) $finish();
`endif
  logic [12:0] var_67;
  assign var_67 = var_588 << 13'd1;


  logic [12:0] var_78;
  assign var_78 = array_array_317d9_q[12:0];


  logic [12:0] var_85;
  assign var_85 = array_array_317cd_q[12:0];


  always_ff @(posedge clk) if (executed && (var_44))$display("%t\t[driver]\t\t[loop.2x  ] block.size, reset block.start, swap from/to",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
);

  assign sort_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_317cd_w = (executed) && (((var_44)));
    assign array_array_317cd_d = ({ 13 { (var_44) } } & var_78);
    assign array_array_317cd_widx = ({ 1 { (var_44) } } & 1'd0);

    assign array_array_317c1_w = (executed) && (((var_44)));
    assign array_array_317c1_d = ({ 13 { (var_44) } } & 13'd0);
    assign array_array_317c1_widx = ({ 1 { (var_44) } } & 1'd0);

    assign array_array_317d9_w = (executed) && (((var_44)));
    assign array_array_317d9_d = ({ 13 { (var_44) } } & var_85);
    assign array_array_317d9_widx = ({ 1 { (var_44) } } & 1'd0);

    assign array_array_317b5_w = (executed) && (((var_44)));
    assign array_array_317b5_d = ({ 13 { (var_44) } } & var_67);
    assign array_array_317b5_widx = ({ 1 { (var_44) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver


module SRAM_5298d (
  input logic clk,
  input logic rst_n,
  /* Array: array_52999[4096 x b32] */
  /* /Users/were/repos/assassyn-dev/examples/merge-sort/input/init.hex */



  // External FIFO reg_writer.rdata
  output logic [0:0] fifo_reg_writer_rdata_push_valid,
  output logic [31:0] fifo_reg_writer_rdata_push_data,
  input logic [0:0] fifo_reg_writer_rdata_push_ready,



  // Declare upstream executed signals
  input logic [0:0] SortImpl_32b41_executed,
  input logic [0:0] var_405,
  input logic [0:0] var_405_valid,
  input logic [31:0] var_551,
  input logic [0:0] var_551_valid,
  input logic [12:0] var_513,
  input logic [0:0] var_513_valid,
  input logic [0:0] var_510,
  input logic [0:0] var_510_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_581;
  assign var_581 = dataout;
  // Gather FIFO pushes
  assign fifo_reg_writer_rdata_push_valid = (executed) && (((var_405)));
  assign fifo_reg_writer_rdata_push_data = ({ 32 { (var_405) } } & var_581);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_52999_w;
  logic [31:0] array_array_52999_d;
  logic [12:0] array_array_52999_widx;
  assign array_array_52999_w = (executed) && (((var_510)));
  assign array_array_52999_d = ({ 32 { (var_510) } } & var_551);
  assign array_array_52999_widx = var_513;


  memory_blackbox_array_52999 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(13)     
    ) memory_blackbox_array_52999(
    .clk     (clk), 
    .address (array_array_52999_widx), 
    .wd      (array_array_52999_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_52999_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = SortImpl_32b41_executed;
  assign expose_executed = executed;
endmodule // SRAM_5298d



`ifdef SYNTHESIS
(* blackbox *)
`endif
module memory_blackbox_array_52999 #(
    parameter DATA_WIDTH = 32,   
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
          $readmemh("/Users/were/repos/assassyn-dev/examples/merge-sort/input/init.hex", mem);
      end
        always @ (posedge clk) begin
            if (write & banksel) begin
                mem[address] <= wd;
            end
        end
    
        assign dataout = (read & banksel) ? mem[address] : {DATA_WIDTH{1'b0}};
    
    endmodule
              
module SortImpl_32b41 (
  input logic clk,
  input logic rst_n,

  /* Array: array_317d9[1 x u13] */
  input logic [12:0] array_array_317d9_q,


  /* Array: array_317b5[1 x u13] */
  input logic [12:0] array_array_317b5_q,

  /* Array: array_32b49[1 x u8] */
  output logic [0:0] array_array_32b49_w,
  output logic [0:0] array_array_32b49_widx,
  output logic [7:0] array_array_32b49_d,

  /* Array: array_32b1d[2 x b32] */
  input logic [63:0] array_array_32b1d_q,
  output logic [0:0] array_array_32b1d_w,
  output logic [0:0] array_array_32b1d_widx,
  output logic [31:0] array_array_32b1d_d,

  // Module reg_writer
  output logic [7:0] reg_writer_counter_delta,
  input logic [0:0] reg_writer_counter_delta_ready,


  /* Array: array_317e9[1 x u1] */
  input logic [0:0] array_array_317e9_q,
  output logic [0:0] array_array_317e9_w,
  output logic [0:0] array_array_317e9_widx,
  output logic [0:0] array_array_317e9_d,

  /* Array: array_317c1[1 x u13] */
  input logic [12:0] array_array_317c1_q,
  output logic [0:0] array_array_317c1_w,
  output logic [0:0] array_array_317c1_widx,
  output logic [12:0] array_array_317c1_d,

  /* Array: array_317f9[1 x u13] */
  input logic [12:0] array_array_317f9_q,
  output logic [0:0] array_array_317f9_w,
  output logic [0:0] array_array_317f9_widx,
  output logic [12:0] array_array_317f9_d,

  /* Array: array_32b61[2 x u13] */
  input logic [25:0] array_array_32b61_q,
  output logic [0:0] array_array_32b61_w,
  output logic [0:0] array_array_32b61_widx,
  output logic [12:0] array_array_32b61_d,

  /* Array: array_317cd[1 x u13] */
  input logic [12:0] array_array_317cd_q,

  // Declare upstream executed signals
  input logic [0:0] reg_writer_executed,
  input logic [0:0] sort_executed,
  output logic [12:0] expose_var_513,
  output logic [0:0] expose_var_513_valid,
  output logic [31:0] expose_var_551,
  output logic [0:0] expose_var_551_valid,
  output logic [0:0] expose_var_405,
  output logic [0:0] expose_var_405_valid,
  output logic [0:0] expose_var_510,
  output logic [0:0] expose_var_510_valid,
  input logic [31:0] var_29,
  input logic [0:0] var_29_valid,
  input logic [7:0] var_38,
  input logic [0:0] var_38_valid,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_532;
  assign var_532 = var_38 == 8'd1;


  logic [12:0] var_496;
  assign var_496 = array_array_317c1_q[12:0];


  logic [12:0] var_517;
  assign var_517 = array_array_317b5_q[12:0];


  always_ff @(posedge clk) if (executed && (var_532))$display("%t\t[SortImpl_32b41]\t\t[sort.init] for block.size: %d, block.start: %d, and 1st element",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_517, var_496);

  logic [0:0] var_489;
  assign var_489 = var_38 == 8'd2;


  always_ff @(posedge clk) if (executed && (var_489))$display("%t\t[SortImpl_32b41]\t\t[sort.init] 2nd element",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
);

  logic [0:0] var_156;
  assign var_156 = var_29_valid;


  logic [31:0] var_159;
  assign var_159 = var_156 ? var_29 : 32'd2147483647;


  logic [0:0] var_63;
  assign var_63 = array_array_317e9_q[0:0];


  logic [0:0] var_166;
  assign var_166 = var_63 == 1'd0;


  logic [31:0] var_170;
  assign var_170 = array_array_32b1d_q[31:0];


  logic [31:0] var_173;
  assign var_173 = var_166 ? var_159 : var_170;


  logic [0:0] var_180;
  assign var_180 = var_63 == 1'd1;


  logic [31:0] var_184;
  assign var_184 = array_array_32b1d_q[63:32];


  logic [31:0] var_187;
  assign var_187 = var_180 ? var_159 : var_184;


  always_ff @(posedge clk) if (executed)$display("%t\t[SortImpl_32b41]\t\t%d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_159);

  logic [0:0] var_195;
  assign var_195 = var_173 > var_187;


  logic [0:0] var_510;
  assign var_510 = var_38 == 8'd3;
  assign expose_var_510 = var_510;
  assign expose_var_510_valid = executed && 1;


  logic [12:0] var_452;
  assign var_452 = array_array_317f9_q[12:0];


  logic [12:0] var_216;
  assign var_216 = var_452 + 13'd1;


  always_ff @(posedge clk) if (executed && (var_510))$display("%t\t[SortImpl_32b41]\t\t[loop.k++ ] %d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_452);

  always_ff @(posedge clk) if (executed && (var_510))$display("%t\t[SortImpl_32b41]\t\tnew_value: %d | a: %d | b: %d | cmp: %d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_159, var_173, var_187, var_195);

  logic [12:0] var_240;
  assign var_240 = var_517 >> 13'd1;


  logic [12:0] var_246;
  assign var_246 = 1 == var_63 ? array_array_32b61_q[25:13] : (0 == var_63 ? array_array_32b61_q[12:0] : ('x));


  logic [12:0] var_249;
  assign var_249 = var_246 + 13'd1;


  logic [0:0] var_252;
  assign var_252 = var_249 < var_240;


  logic [0:0] var_526;
  assign var_526 = var_38 == 8'd4;


  logic [12:0] var_503;
  assign var_503 = array_array_317d9_q[12:0];


  logic [12:0] var_529;
  assign var_529 = array_array_317cd_q[12:0];


  always_ff @(posedge clk) if (executed && (var_526))$display("%t\t[SortImpl_32b41]\t\t[sort.fill] refill the popped element",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
);

  always_ff @(posedge clk) if (executed && (var_526))$display("%t\t[SortImpl_32b41]\t\tk: %d | block.size: %d | block.start: %d | from: %d | to: %d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_452, var_517, var_496, var_529, var_503);

  logic [0:0] var_293;
  assign var_293 = var_452 < var_517;


  logic [0:0] var_309;
  assign var_309 = var_452 == var_517;


  logic [12:0] var_321;
  assign var_321 = var_496 + var_517;


  always_ff @(posedge clk) if (executed && (var_526 && var_309))$display("%t\t[SortImpl_32b41]\t\t[loop.next] block.start: %d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_321);

  logic [0:0] var_336;
  assign var_336 = ~var_252;


  logic [12:0] var_351;
  assign var_351 = 1 == var_63 ? array_array_32b61_q[25:13] : (0 == var_63 ? array_array_32b61_q[12:0] : ('x));


  logic [12:0] var_354;
  assign var_354 = var_351 + 13'd1;


  logic [12:0] var_370;
  assign var_370 = 1 == var_63 ? array_array_32b61_q[25:13] : (0 == var_63 ? array_array_32b61_q[12:0] : ('x));


  always_ff @(posedge clk) if (executed && (var_526))$display("%t\t[SortImpl_32b41]\t\t[loop.idx] idx[%d]: %d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_63, var_370);

  logic [0:0] var_384;
  assign var_384 = var_532 ? 1'd1 : 1'd0;


  logic [0:0] var_391;
  assign var_391 = var_489 ? 1'd1 : var_384;


  logic [0:0] var_398;
  assign var_398 = var_510 ? 1'd0 : var_391;


  logic [0:0] var_405;
  assign var_405 = var_526 ? var_252 : var_398;
  assign expose_var_405 = var_405;
  assign expose_var_405_valid = executed && 1;


  logic [0:0] var_412;
  assign var_412 = var_496 == 13'd2048;


  logic [12:0] var_424;
  assign var_424 = var_496 + var_529;


  logic [12:0] var_427;
  assign var_427 = var_412 ? var_503 : var_424;


  logic [12:0] var_434;
  assign var_434 = var_496 + var_240;


  logic [12:0] var_440;
  assign var_440 = var_434 + var_529;


  logic [12:0] var_449;
  assign var_449 = var_496 + var_452;


  logic [12:0] var_455;
  assign var_455 = var_449 + var_503;


  logic [12:0] var_464;
  assign var_464 = 1 == var_63 ? array_array_32b61_q[25:13] : (0 == var_63 ? array_array_32b61_q[12:0] : ('x));


  logic [12:0] var_467;
  assign var_467 = var_496 + var_464;


  logic [12:0] var_470;
  assign var_470 = var_467 + 13'd1;


  logic [12:0] var_476;
  assign var_476 = var_63 ? var_240 : 13'd0;


  logic [12:0] var_480;
  assign var_480 = var_470 + var_476;


  logic [12:0] var_486;
  assign var_486 = var_480 + var_529;


  logic [12:0] var_492;
  assign var_492 = var_532 ? var_427 : 13'd0;


  logic [12:0] var_499;
  assign var_499 = var_489 ? var_440 : var_492;


  logic [12:0] var_506;
  assign var_506 = var_510 ? var_455 : var_499;


  logic [12:0] var_513;
  assign var_513 = var_526 ? var_486 : var_506;
  assign expose_var_513 = var_513;
  assign expose_var_513_valid = executed && 1;


  logic [12:0] var_523;
  assign var_523 = 1 == var_63 ? array_array_32b61_q[25:13] : (0 == var_63 ? array_array_32b61_q[12:0] : ('x));


  always_ff @(posedge clk) if (executed)$display("%t\t[SortImpl_32b41]\t\tblock.start: %d | idx: %d | reg_idx: %d | k: %d | from: %d ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_496, var_523, var_63, var_452, var_529);

  always_ff @(posedge clk) if (executed)$display("%t\t[SortImpl_32b41]\t\t[loop.sram] addr: %d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_513);

  logic [31:0] var_547;
  assign var_547 = var_195 ? var_187 : var_173;


  logic [31:0] var_551;
  assign var_551 = var_510 ? var_547 : 32'd0;
  assign expose_var_551 = var_551;
  assign expose_var_551_valid = executed && 1;


  always_ff @(posedge clk) if (executed && (var_510))$display("%t\t[SortImpl_32b41]\t\t[loop.sram] wdata: %d | a: %d | b: %d ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_551, var_173, var_187);

  assign reg_writer_counter_delta = executed ? { 7'b0, |(var_405) } : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_317c1_w = (executed) && (((var_526 && var_309)));
    assign array_array_317c1_d = ({ 13 { (var_526 && var_309) } } & var_321);
    assign array_array_317c1_widx = ({ 1 { (var_526 && var_309) } } & 1'd0);

    assign array_array_317f9_w = (executed) && (((var_532)) || ((var_510)));
    assign array_array_317f9_d = ({ 13 { (var_532) } } & 13'd0) | ({ 13 { (var_510) } } & var_216);
    assign array_array_317f9_widx = ({ 1 { (var_532) } } & 1'd0) | ({ 1 { (var_510) } } & 1'd0);

    assign array_array_32b61_w = (executed) && (((var_532)) || ((var_489)) || ((var_526)));
    assign array_array_32b61_d = ({ 13 { (var_532) } } & 13'd0) | ({ 13 { (var_489) } } & 13'd0) | ({ 13 { (var_526) } } & var_354);
    assign array_array_32b61_widx = ({ 1 { (var_532) } } & 1'd0) | ({ 1 { (var_489) } } & 1'd1) | ({ 1 { (var_526) } } & var_63);

    assign array_array_32b1d_w = (executed) && (((var_526 && var_336)));
    assign array_array_32b1d_d = ({ 32 { (var_526 && var_336) } } & 32'd2147483647);
    assign array_array_32b1d_widx = ({ 1 { (var_526 && var_336) } } & var_63);

    assign array_array_317e9_w = (executed) && (((var_532)) || ((var_489)) || ((var_510)));
    assign array_array_317e9_d = ({ 1 { (var_532) } } & 1'd0) | ({ 1 { (var_489) } } & 1'd1) | ({ 1 { (var_510) } } & var_195);
    assign array_array_317e9_widx = ({ 1 { (var_532) } } & 1'd0) | ({ 1 { (var_489) } } & 1'd0) | ({ 1 { (var_510) } } & 1'd0);

    assign array_array_32b49_w = (executed) && (((var_532)) || ((var_489)) || ((var_510)) || ((var_526 && var_293)) || ((var_526 && var_309)));
    assign array_array_32b49_d = ({ 8 { (var_532) } } & 8'd2) | ({ 8 { (var_489) } } & 8'd3) | ({ 8 { (var_510) } } & 8'd4) | ({ 8 { (var_526 && var_293) } } & 8'd3) | ({ 8 { (var_526 && var_309) } } & 8'd1);
    assign array_array_32b49_widx = ({ 1 { (var_532) } } & 1'd0) | ({ 1 { (var_489) } } & 1'd0) | ({ 1 { (var_510) } } & 1'd0) | ({ 1 { (var_526 && var_293) } } & 1'd0) | ({ 1 { (var_526 && var_309) } } & 1'd0);

    assign executed = sort_executed || reg_writer_executed;
  assign expose_executed = executed;
endmodule // SortImpl_32b41


module sort (
  input logic clk,
  input logic rst_n,
  /* Array: array_32b49[1 x u8] */
  input logic [7:0] array_array_32b49_q,

  output logic [7:0] expose_var_38,
  output logic [0:0] expose_var_38_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [7:0] var_38;
  assign var_38 = array_array_32b49_q[7:0];
  assign expose_var_38 = var_38;
  assign expose_var_38_valid = executed && 1;


  // Gather FIFO pushes
  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // sort


module reg_writer (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_317e9[1 x u1] */
  input logic [0:0] array_array_317e9_q,

  /* Array: array_32b1d[2 x b32] */
  output logic [0:0] array_array_32b1d_w,
  output logic [0:0] array_array_32b1d_widx,
  output logic [31:0] array_array_32b1d_d,

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
  assign var_31 = array_array_317e9_q[0:0];


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_32b1d_w = executed;
    assign array_array_32b1d_d = var_29;
    assign array_array_32b1d_widx = var_31;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // reg_writer

module top(
  output logic [12:0] array_array_317cd_exposed_o,
  input logic [12:0] array_array_317cd_exposed_i,
  input logic [0:0] array_array_317cd_exposed_i_valid,
  output logic [63:0] array_array_32b1d_exposed_o,
  input logic [31:0] array_array_32b1d_exposed_i,
  input logic [0:0] array_array_32b1d_exposed_i_valid,
  output logic [12:0] array_array_317b5_exposed_o,
  input logic [12:0] array_array_317b5_exposed_i,
  input logic [0:0] array_array_317b5_exposed_i_valid,
  output logic [12:0] array_array_317c1_exposed_o,
  input logic [12:0] array_array_317c1_exposed_i,
  input logic [0:0] array_array_317c1_exposed_i_valid,
  output logic [12:0] array_array_317d9_exposed_o,
  input logic [12:0] array_array_317d9_exposed_i,
  input logic [0:0] array_array_317d9_exposed_i_valid,
  output logic [0:0] array_array_317e9_exposed_o,
  input logic [0:0] array_array_317e9_exposed_i,
  input logic [0:0] array_array_317e9_exposed_i_valid,

  input logic clk,
  input logic rst_n
);

//Array: array_52999, Init File Path: /Users/were/repos/assassyn-dev/examples/merge-sort/input/init.hex
  /* Array: array_317cd[1 x u13] */
  logic [12:0] array_array_317cd_q;
  logic [12:0] array_array_317cd_driver_driver_d;
  logic [0:0] array_array_317cd_driver_driver_w;
  logic [0:0] array_array_317cd_driver_driver_widx;
  assign array_array_317cd_exposed_o = array_array_317cd_q;
  logic [12:0] array_array_317cd_temp;
  assign array_array_317cd_temp = array_array_317cd_exposed_i_valid?array_array_317cd_exposed_i:array_array_317cd_d;
  logic [12:0] array_array_317cd_d;
  logic [0:0] array_array_317cd_widx;
  logic [0:0] array_array_317cd_w;
  assign array_array_317cd_d = ({ 13 { array_array_317cd_driver_driver_w } } & array_array_317cd_driver_driver_d);
  assign array_array_317cd_widx = ({ 1 { array_array_317cd_driver_driver_w } } & array_array_317cd_driver_driver_widx);
  assign array_array_317cd_w = array_array_317cd_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_317cd_q[12:0] <= 13'd0;
    end
    else if (array_array_317cd_w) begin

      case (array_array_317cd_widx)
        0 : array_array_317cd_q[12:0] <= array_array_317cd_temp;
        default: ;
      endcase
    end
  /* Array: array_317b5[1 x u13] */
  logic [12:0] array_array_317b5_q;
  logic [12:0] array_array_317b5_driver_driver_d;
  logic [0:0] array_array_317b5_driver_driver_w;
  logic [0:0] array_array_317b5_driver_driver_widx;
  assign array_array_317b5_exposed_o = array_array_317b5_q;
  logic [12:0] array_array_317b5_temp;
  assign array_array_317b5_temp = array_array_317b5_exposed_i_valid?array_array_317b5_exposed_i:array_array_317b5_d;
  logic [12:0] array_array_317b5_d;
  logic [0:0] array_array_317b5_widx;
  logic [0:0] array_array_317b5_w;
  assign array_array_317b5_d = ({ 13 { array_array_317b5_driver_driver_w } } & array_array_317b5_driver_driver_d);
  assign array_array_317b5_widx = ({ 1 { array_array_317b5_driver_driver_w } } & array_array_317b5_driver_driver_widx);
  assign array_array_317b5_w = array_array_317b5_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_317b5_q[12:0] <= 13'd2;
    end
    else if (array_array_317b5_w) begin

      case (array_array_317b5_widx)
        0 : array_array_317b5_q[12:0] <= array_array_317b5_temp;
        default: ;
      endcase
    end
  /* Array: array_317d9[1 x u13] */
  logic [12:0] array_array_317d9_q;
  logic [12:0] array_array_317d9_driver_driver_d;
  logic [0:0] array_array_317d9_driver_driver_w;
  logic [0:0] array_array_317d9_driver_driver_widx;
  assign array_array_317d9_exposed_o = array_array_317d9_q;
  logic [12:0] array_array_317d9_temp;
  assign array_array_317d9_temp = array_array_317d9_exposed_i_valid?array_array_317d9_exposed_i:array_array_317d9_d;
  logic [12:0] array_array_317d9_d;
  logic [0:0] array_array_317d9_widx;
  logic [0:0] array_array_317d9_w;
  assign array_array_317d9_d = ({ 13 { array_array_317d9_driver_driver_w } } & array_array_317d9_driver_driver_d);
  assign array_array_317d9_widx = ({ 1 { array_array_317d9_driver_driver_w } } & array_array_317d9_driver_driver_widx);
  assign array_array_317d9_w = array_array_317d9_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_317d9_q[12:0] <= 13'd2048;
    end
    else if (array_array_317d9_w) begin

      case (array_array_317d9_widx)
        0 : array_array_317d9_q[12:0] <= array_array_317d9_temp;
        default: ;
      endcase
    end
  /* Array: array_52999[4096 x b32] */
  logic [31:0] array_array_52999_q;
  logic [31:0] array_array_52999_driver_SRAM_5298d_d;
  logic [0:0] array_array_52999_driver_SRAM_5298d_w;
  logic [11:0] array_array_52999_driver_SRAM_5298d_widx;
  /* Array: array_32b61[2 x u13] */
  logic [25:0] array_array_32b61_q;
  logic [12:0] array_array_32b61_driver_SortImpl_32b41_d;
  logic [0:0] array_array_32b61_driver_SortImpl_32b41_w;
  logic [0:0] array_array_32b61_driver_SortImpl_32b41_widx;
  logic [12:0] array_array_32b61_d;
  logic [0:0] array_array_32b61_widx;
  logic [0:0] array_array_32b61_w;
  assign array_array_32b61_d = ({ 13 { array_array_32b61_driver_SortImpl_32b41_w } } & array_array_32b61_driver_SortImpl_32b41_d);
  assign array_array_32b61_widx = ({ 1 { array_array_32b61_driver_SortImpl_32b41_w } } & array_array_32b61_driver_SortImpl_32b41_widx);
  assign array_array_32b61_w = array_array_32b61_driver_SortImpl_32b41_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_32b61_q[12:0] <= 13'd0;
      array_array_32b61_q[25:13] <= 13'd0;
    end
    else if (array_array_32b61_w) begin

      case (array_array_32b61_widx)
        0 : array_array_32b61_q[12:0] <= array_array_32b61_d;
        1 : array_array_32b61_q[25:13] <= array_array_32b61_d;
        default: ;
      endcase
    end
  /* Array: array_317c1[1 x u13] */
  logic [12:0] array_array_317c1_q;
  logic [12:0] array_array_317c1_driver_SortImpl_32b41_d;
  logic [0:0] array_array_317c1_driver_SortImpl_32b41_w;
  logic [0:0] array_array_317c1_driver_SortImpl_32b41_widx;
  logic [12:0] array_array_317c1_driver_driver_d;
  logic [0:0] array_array_317c1_driver_driver_w;
  logic [0:0] array_array_317c1_driver_driver_widx;
  assign array_array_317c1_exposed_o = array_array_317c1_q;
  logic [12:0] array_array_317c1_temp;
  assign array_array_317c1_temp = array_array_317c1_exposed_i_valid?array_array_317c1_exposed_i:array_array_317c1_d;
  logic [12:0] array_array_317c1_d;
  logic [0:0] array_array_317c1_widx;
  logic [0:0] array_array_317c1_w;
  assign array_array_317c1_d = ({ 13 { array_array_317c1_driver_SortImpl_32b41_w } } & array_array_317c1_driver_SortImpl_32b41_d) | ({ 13 { array_array_317c1_driver_driver_w } } & array_array_317c1_driver_driver_d);
  assign array_array_317c1_widx = ({ 1 { array_array_317c1_driver_SortImpl_32b41_w } } & array_array_317c1_driver_SortImpl_32b41_widx) | ({ 1 { array_array_317c1_driver_driver_w } } & array_array_317c1_driver_driver_widx);
  assign array_array_317c1_w = array_array_317c1_driver_SortImpl_32b41_w | array_array_317c1_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_317c1_q[12:0] <= 13'd0;
    end
    else if (array_array_317c1_w) begin

      case (array_array_317c1_widx)
        0 : array_array_317c1_q[12:0] <= array_array_317c1_temp;
        default: ;
      endcase
    end
  /* Array: array_32b49[1 x u8] */
  logic [7:0] array_array_32b49_q;
  logic [7:0] array_array_32b49_driver_SortImpl_32b41_d;
  logic [0:0] array_array_32b49_driver_SortImpl_32b41_w;
  logic [0:0] array_array_32b49_driver_SortImpl_32b41_widx;
  logic [7:0] array_array_32b49_d;
  logic [0:0] array_array_32b49_widx;
  logic [0:0] array_array_32b49_w;
  assign array_array_32b49_d = ({ 8 { array_array_32b49_driver_SortImpl_32b41_w } } & array_array_32b49_driver_SortImpl_32b41_d);
  assign array_array_32b49_widx = ({ 1 { array_array_32b49_driver_SortImpl_32b41_w } } & array_array_32b49_driver_SortImpl_32b41_widx);
  assign array_array_32b49_w = array_array_32b49_driver_SortImpl_32b41_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_32b49_q[7:0] <= 8'd1;
    end
    else if (array_array_32b49_w) begin

      case (array_array_32b49_widx)
        0 : array_array_32b49_q[7:0] <= array_array_32b49_d;
        default: ;
      endcase
    end
  /* Array: array_317e9[1 x u1] */
  logic [0:0] array_array_317e9_q;
  logic [0:0] array_array_317e9_driver_SortImpl_32b41_d;
  logic [0:0] array_array_317e9_driver_SortImpl_32b41_w;
  logic [0:0] array_array_317e9_driver_SortImpl_32b41_widx;
  assign array_array_317e9_exposed_o = array_array_317e9_q;
  logic [0:0] array_array_317e9_temp;
  assign array_array_317e9_temp = array_array_317e9_exposed_i_valid?array_array_317e9_exposed_i:array_array_317e9_d;
  logic [0:0] array_array_317e9_d;
  logic [0:0] array_array_317e9_widx;
  logic [0:0] array_array_317e9_w;
  assign array_array_317e9_d = ({ 1 { array_array_317e9_driver_SortImpl_32b41_w } } & array_array_317e9_driver_SortImpl_32b41_d);
  assign array_array_317e9_widx = ({ 1 { array_array_317e9_driver_SortImpl_32b41_w } } & array_array_317e9_driver_SortImpl_32b41_widx);
  assign array_array_317e9_w = array_array_317e9_driver_SortImpl_32b41_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_317e9_q[0:0] <= 1'd0;
    end
    else if (array_array_317e9_w) begin

      case (array_array_317e9_widx)
        0 : array_array_317e9_q[0:0] <= array_array_317e9_temp;
        default: ;
      endcase
    end
  /* Array: array_317f9[1 x u13] */
  logic [12:0] array_array_317f9_q;
  logic [12:0] array_array_317f9_driver_SortImpl_32b41_d;
  logic [0:0] array_array_317f9_driver_SortImpl_32b41_w;
  logic [0:0] array_array_317f9_driver_SortImpl_32b41_widx;
  logic [12:0] array_array_317f9_d;
  logic [0:0] array_array_317f9_widx;
  logic [0:0] array_array_317f9_w;
  assign array_array_317f9_d = ({ 13 { array_array_317f9_driver_SortImpl_32b41_w } } & array_array_317f9_driver_SortImpl_32b41_d);
  assign array_array_317f9_widx = ({ 1 { array_array_317f9_driver_SortImpl_32b41_w } } & array_array_317f9_driver_SortImpl_32b41_widx);
  assign array_array_317f9_w = array_array_317f9_driver_SortImpl_32b41_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_317f9_q[12:0] <= 13'd0;
    end
    else if (array_array_317f9_w) begin

      case (array_array_317f9_widx)
        0 : array_array_317f9_q[12:0] <= array_array_317f9_d;
        default: ;
      endcase
    end
  /* Array: array_32b1d[2 x b32] */
  logic [63:0] array_array_32b1d_q;
  logic [31:0] array_array_32b1d_driver_reg_writer_d;
  logic [0:0] array_array_32b1d_driver_reg_writer_w;
  logic [0:0] array_array_32b1d_driver_reg_writer_widx;
  logic [31:0] array_array_32b1d_driver_SortImpl_32b41_d;
  logic [0:0] array_array_32b1d_driver_SortImpl_32b41_w;
  logic [0:0] array_array_32b1d_driver_SortImpl_32b41_widx;
  assign array_array_32b1d_exposed_o = array_array_32b1d_q;
  logic [31:0] array_array_32b1d_temp;
  assign array_array_32b1d_temp = array_array_32b1d_exposed_i_valid?array_array_32b1d_exposed_i:array_array_32b1d_d;
  logic [31:0] array_array_32b1d_d;
  logic [0:0] array_array_32b1d_widx;
  logic [0:0] array_array_32b1d_w;
  assign array_array_32b1d_d = ({ 32 { array_array_32b1d_driver_reg_writer_w } } & array_array_32b1d_driver_reg_writer_d) | ({ 32 { array_array_32b1d_driver_SortImpl_32b41_w } } & array_array_32b1d_driver_SortImpl_32b41_d);
  assign array_array_32b1d_widx = ({ 1 { array_array_32b1d_driver_reg_writer_w } } & array_array_32b1d_driver_reg_writer_widx) | ({ 1 { array_array_32b1d_driver_SortImpl_32b41_w } } & array_array_32b1d_driver_SortImpl_32b41_widx);
  assign array_array_32b1d_w = array_array_32b1d_driver_reg_writer_w | array_array_32b1d_driver_SortImpl_32b41_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_32b1d_q[31:0] <= 32'd0;
      array_array_32b1d_q[63:32] <= 32'd0;
    end
    else if (array_array_32b1d_w) begin

      case (array_array_32b1d_widx)
        0 : array_array_32b1d_q[31:0] <= array_array_32b1d_temp;
        1 : array_array_32b1d_q[63:32] <= array_array_32b1d_temp;
        default: ;
      endcase
    end
  // fifo: rdata: fifo<b32>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_reg_writer_rdata_pop_data;
  logic [0:0] fifo_reg_writer_rdata_pop_valid;
  logic [0:0] fifo_reg_writer_rdata_pop_ready;
  logic [31:0] fifo_reg_writer_rdata_driver_SRAM_5298d_push_data;
  logic [0:0] fifo_reg_writer_rdata_driver_SRAM_5298d_push_valid;
  logic [0:0] fifo_reg_writer_rdata_driver_SRAM_5298d_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_reg_writer_rdata_push_ready;
  assign fifo_reg_writer_rdata_driver_SRAM_5298d_push_ready = fifo_reg_writer_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_reg_writer_rdata_push_valid;
  assign fifo_reg_writer_rdata_push_valid = fifo_reg_writer_rdata_driver_SRAM_5298d_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_reg_writer_rdata_push_data;
  assign fifo_reg_writer_rdata_push_data = ({ 32 { fifo_reg_writer_rdata_driver_SRAM_5298d_push_valid } } & fifo_reg_writer_rdata_driver_SRAM_5298d_push_data);

  fifo #(32, 2) fifo_reg_writer_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_reg_writer_rdata_push_valid),
    .push_data(fifo_reg_writer_rdata_push_data),
    .push_ready(fifo_reg_writer_rdata_push_ready),
    .pop_valid(fifo_reg_writer_rdata_pop_valid),
    .pop_data(fifo_reg_writer_rdata_pop_data),
    .pop_ready(fifo_reg_writer_rdata_pop_ready));

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
  // Trigger SM of Module: reg_writer
  logic [7:0] reg_writer_driver_SortImpl_32b41_counter_delta;
  logic [0:0] reg_writer_driver_SortImpl_32b41_counter_delta_ready;
  logic [0:0] reg_writer_counter_delta_ready;
  logic [7:0] reg_writer_counter_delta;
  // Gather all the push signal
  assign reg_writer_counter_delta = reg_writer_driver_SortImpl_32b41_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] reg_writer_counter_pop_ready;
  assign reg_writer_driver_SortImpl_32b41_counter_delta_ready = reg_writer_counter_pop_ready;
  logic [0:0] reg_writer_counter_pop_valid;

  trigger_counter #(8) reg_writer_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(reg_writer_counter_delta),
    .delta_ready(reg_writer_counter_delta_ready),
    .pop_valid(reg_writer_counter_pop_valid),
    .pop_ready(reg_writer_counter_pop_ready));
  assign driver_counter_delta = 8'b1;

  logic [0:0] driver_executed;

  // driver
  driver driver_i (
    .clk(clk),
    .rst_n(rst_n),
    .sort_counter_delta_ready(sort_driver_driver_counter_delta_ready),
    .sort_counter_delta(sort_driver_driver_counter_delta),
    .array_array_317cd_q(array_array_317cd_q),
    .array_array_317cd_w(array_array_317cd_driver_driver_w),
    .array_array_317cd_widx(array_array_317cd_driver_driver_widx),
    .array_array_317cd_d(array_array_317cd_driver_driver_d),
    .array_array_317b5_q(array_array_317b5_q),
    .array_array_317b5_w(array_array_317b5_driver_driver_w),
    .array_array_317b5_widx(array_array_317b5_driver_driver_widx),
    .array_array_317b5_d(array_array_317b5_driver_driver_d),
    .array_array_317c1_q(array_array_317c1_q),
    .array_array_317c1_w(array_array_317c1_driver_driver_w),
    .array_array_317c1_widx(array_array_317c1_driver_driver_widx),
    .array_array_317c1_d(array_array_317c1_driver_driver_d),
    .array_array_317d9_q(array_array_317d9_q),
    .array_array_317d9_w(array_array_317d9_driver_driver_w),
    .array_array_317d9_widx(array_array_317d9_driver_driver_widx),
    .array_array_317d9_d(array_array_317d9_driver_driver_d),
    .counter_delta_ready(driver_counter_delta_ready),
    .counter_pop_ready(driver_counter_pop_ready),
    .counter_pop_valid(driver_counter_pop_valid),
    .expose_executed(driver_executed));
  logic [7:0] logic_var_38;
  logic [0:0] logic_var_38_valid;
  logic [0:0] sort_executed;

  // sort
  sort sort_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_32b49_q(array_array_32b49_q),
    .expose_var_38(logic_var_38),
    .expose_var_38_valid(logic_var_38_valid),
    .counter_delta_ready(sort_counter_delta_ready),
    .counter_pop_ready(sort_counter_pop_ready),
    .counter_pop_valid(sort_counter_pop_valid),
    .expose_executed(sort_executed));
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
    .array_array_317e9_q(array_array_317e9_q),
    .array_array_32b1d_w(array_array_32b1d_driver_reg_writer_w),
    .array_array_32b1d_widx(array_array_32b1d_driver_reg_writer_widx),
    .array_array_32b1d_d(array_array_32b1d_driver_reg_writer_d),
    .expose_var_29(logic_var_29),
    .expose_var_29_valid(logic_var_29_valid),
    .counter_delta_ready(reg_writer_counter_delta_ready),
    .counter_pop_ready(reg_writer_counter_pop_ready),
    .counter_pop_valid(reg_writer_counter_pop_valid),
    .expose_executed(reg_writer_executed));
  logic [0:0] SRAM_5298d_executed;

  // SRAM_5298d
  SRAM_5298d SRAM_5298d_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_reg_writer_rdata_push_valid(fifo_reg_writer_rdata_driver_SRAM_5298d_push_valid),
    .fifo_reg_writer_rdata_push_data(fifo_reg_writer_rdata_driver_SRAM_5298d_push_data),
    .fifo_reg_writer_rdata_push_ready(fifo_reg_writer_rdata_driver_SRAM_5298d_push_ready),
    // Upstream executed signals
    .SortImpl_32b41_executed(SortImpl_32b41_executed),
    .var_405(logic_var_405),
    .var_405_valid(logic_var_405_valid),
    .var_551(logic_var_551),
    .var_551_valid(logic_var_551_valid),
    .var_513(logic_var_513),
    .var_513_valid(logic_var_513_valid),
    .var_510(logic_var_510),
    .var_510_valid(logic_var_510_valid),
    .expose_executed(SRAM_5298d_executed));
  logic [12:0] logic_var_513;
  logic [0:0] logic_var_513_valid;
  logic [31:0] logic_var_551;
  logic [0:0] logic_var_551_valid;
  logic [0:0] logic_var_405;
  logic [0:0] logic_var_405_valid;
  logic [0:0] logic_var_510;
  logic [0:0] logic_var_510_valid;
  logic [0:0] SortImpl_32b41_executed;

  // SortImpl_32b41
  SortImpl_32b41 SortImpl_32b41_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_317d9_q(array_array_317d9_q),
    .array_array_317b5_q(array_array_317b5_q),
    .array_array_32b49_w(array_array_32b49_driver_SortImpl_32b41_w),
    .array_array_32b49_widx(array_array_32b49_driver_SortImpl_32b41_widx),
    .array_array_32b49_d(array_array_32b49_driver_SortImpl_32b41_d),
    .array_array_32b1d_q(array_array_32b1d_q),
    .array_array_32b1d_w(array_array_32b1d_driver_SortImpl_32b41_w),
    .array_array_32b1d_widx(array_array_32b1d_driver_SortImpl_32b41_widx),
    .array_array_32b1d_d(array_array_32b1d_driver_SortImpl_32b41_d),
    .reg_writer_counter_delta_ready(reg_writer_driver_SortImpl_32b41_counter_delta_ready),
    .reg_writer_counter_delta(reg_writer_driver_SortImpl_32b41_counter_delta),
    .array_array_317e9_q(array_array_317e9_q),
    .array_array_317e9_w(array_array_317e9_driver_SortImpl_32b41_w),
    .array_array_317e9_widx(array_array_317e9_driver_SortImpl_32b41_widx),
    .array_array_317e9_d(array_array_317e9_driver_SortImpl_32b41_d),
    .array_array_317c1_q(array_array_317c1_q),
    .array_array_317c1_w(array_array_317c1_driver_SortImpl_32b41_w),
    .array_array_317c1_widx(array_array_317c1_driver_SortImpl_32b41_widx),
    .array_array_317c1_d(array_array_317c1_driver_SortImpl_32b41_d),
    .array_array_317f9_q(array_array_317f9_q),
    .array_array_317f9_w(array_array_317f9_driver_SortImpl_32b41_w),
    .array_array_317f9_widx(array_array_317f9_driver_SortImpl_32b41_widx),
    .array_array_317f9_d(array_array_317f9_driver_SortImpl_32b41_d),
    .array_array_32b61_q(array_array_32b61_q),
    .array_array_32b61_w(array_array_32b61_driver_SortImpl_32b41_w),
    .array_array_32b61_widx(array_array_32b61_driver_SortImpl_32b41_widx),
    .array_array_32b61_d(array_array_32b61_driver_SortImpl_32b41_d),
    .array_array_317cd_q(array_array_317cd_q),
    // Upstream executed signals
    .sort_executed(sort_executed),
    .reg_writer_executed(reg_writer_executed),
    .expose_var_513(logic_var_513),
    .expose_var_513_valid(logic_var_513_valid),
    .expose_var_551(logic_var_551),
    .expose_var_551_valid(logic_var_551_valid),
    .expose_var_405(logic_var_405),
    .expose_var_405_valid(logic_var_405_valid),
    .expose_var_510(logic_var_510),
    .expose_var_510_valid(logic_var_510_valid),
    .var_29(logic_var_29),
    .var_29_valid(logic_var_29_valid),
    .var_38(logic_var_38),
    .var_38_valid(logic_var_38_valid),
    .expose_executed(SortImpl_32b41_executed));
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

        `define IDX_DECL (DEPTH_LOG2 != 0 ? DEPTH_LOG2 - 1 : 0)
        `define CNT_DECL (DEPTH_LOG2 + 1)
        `define FIFO_SIZE (1 << DEPTH_LOG2)

        logic [`IDX_DECL:0] front;
        logic [`IDX_DECL:0] back;
        logic [`CNT_DECL:0] count;
        logic [WIDTH - 1:0] q[0:`FIFO_SIZE-1];

        logic [`CNT_DECL:0] new_count;
        logic [`IDX_DECL:0] new_front;
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

                if (push_valid && new_count <= `FIFO_SIZE) begin
                    q[back] <= push_data;
                    back <= (back + 1);
                end

                front <= new_front;
                count <= new_count;

                push_ready <= new_count < `FIFO_SIZE;

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

        `undef FIFO_SIZE
        `undef IDX_DECL
        `undef CNT_DECL
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
logic [12:0]array_array_317cd_exposed_o;
logic [12:0]array_array_317cd_exposed_i;
logic array_array_317cd_exposed_i_valid;

assign array_array_317cd_exposed_i_valid = 1'd0;
assign array_array_317cd_exposed_i = 13'd0;
logic [63:0]array_array_32b1d_exposed_o;
logic [31:0]array_array_32b1d_exposed_i;
logic array_array_32b1d_exposed_i_valid;

assign array_array_32b1d_exposed_i_valid = 1'd0;
assign array_array_32b1d_exposed_i = 32'd0;
logic [12:0]array_array_317b5_exposed_o;
logic [12:0]array_array_317b5_exposed_i;
logic array_array_317b5_exposed_i_valid;

assign array_array_317b5_exposed_i_valid = 1'd0;
assign array_array_317b5_exposed_i = 13'd0;
logic [12:0]array_array_317c1_exposed_o;
logic [12:0]array_array_317c1_exposed_i;
logic array_array_317c1_exposed_i_valid;

assign array_array_317c1_exposed_i_valid = 1'd0;
assign array_array_317c1_exposed_i = 13'd0;
logic [12:0]array_array_317d9_exposed_o;
logic [12:0]array_array_317d9_exposed_i;
logic array_array_317d9_exposed_i_valid;

assign array_array_317d9_exposed_i_valid = 1'd0;
assign array_array_317d9_exposed_i = 13'd0;
logic [0:0]array_array_317e9_exposed_o;
logic [0:0]array_array_317e9_exposed_i;
logic array_array_317e9_exposed_i_valid;

assign array_array_317e9_exposed_i_valid = 1'd0;
assign array_array_317e9_exposed_i = 1'd0;

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #10000100;
  `ifndef SYNTHESIS
  $finish();
  `endif
end

always #50 clk <= !clk;



top top_i (
  .clk(clk),
  .rst_n(rst_n),
  .array_array_317cd_exposed_o(array_array_317cd_exposed_o),
  .array_array_317cd_exposed_i(array_array_317cd_exposed_i),
  .array_array_317cd_exposed_i_valid(array_array_317cd_exposed_i_valid),
  .array_array_32b1d_exposed_o(array_array_32b1d_exposed_o),
  .array_array_32b1d_exposed_i(array_array_32b1d_exposed_i),
  .array_array_32b1d_exposed_i_valid(array_array_32b1d_exposed_i_valid),
  .array_array_317b5_exposed_o(array_array_317b5_exposed_o),
  .array_array_317b5_exposed_i(array_array_317b5_exposed_i),
  .array_array_317b5_exposed_i_valid(array_array_317b5_exposed_i_valid),
  .array_array_317c1_exposed_o(array_array_317c1_exposed_o),
  .array_array_317c1_exposed_i(array_array_317c1_exposed_i),
  .array_array_317c1_exposed_i_valid(array_array_317c1_exposed_i_valid),
  .array_array_317d9_exposed_o(array_array_317d9_exposed_o),
  .array_array_317d9_exposed_i(array_array_317d9_exposed_i),
  .array_array_317d9_exposed_i_valid(array_array_317d9_exposed_i_valid),
  .array_array_317e9_exposed_o(array_array_317e9_exposed_o),
  .array_array_317e9_exposed_i(array_array_317e9_exposed_i),
  .array_array_317e9_exposed_i_valid(array_array_317e9_exposed_i_valid)
);

endmodule
