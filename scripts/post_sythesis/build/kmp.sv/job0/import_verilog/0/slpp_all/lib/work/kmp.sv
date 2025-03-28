
module SRAM_d6221 (
  input logic clk,
  input logic rst_n,
  /* Array: array_d6227[8192 x b32] */
  /* /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/kmp/input/init.hex */

  // External FIFO kmp.rdata
  output logic [0:0] fifo_kmp_rdata_push_valid,
  output logic [31:0] fifo_kmp_rdata_push_data,
  input logic [0:0] fifo_kmp_rdata_push_ready,



  // Declare upstream executed signals
  input logic [0:0] driver_executed,
  input logic [12:0] var_85,
  input logic [0:0] var_85_valid,
  input logic [0:0] var_116,
  input logic [0:0] var_116_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_160;
  assign var_160 = dataout;
  // Gather FIFO pushes
  assign fifo_kmp_rdata_push_valid = (executed) && (((var_116)));
  assign fifo_kmp_rdata_push_data = ({ 32 { (var_116) } } & var_160);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_d6227_w;
  logic [31:0] array_array_d6227_d;
  logic [12:0] array_array_d6227_widx;
  assign array_array_d6227_w = (executed) && (((1'd0)));
  assign array_array_d6227_d = ({ 32 { (1'd0) } } & 32'd0);
  assign array_array_d6227_widx = var_85;


  memory_blackbox_array_d6227 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(13)     
    ) memory_blackbox_array_d6227(
    .clk     (clk), 
    .address (array_array_d6227_widx), 
    .wd      (array_array_d6227_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_d6227_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = driver_executed;
  assign expose_executed = executed;
endmodule // SRAM_d6221




(* blackbox *)

module memory_blackbox_array_d6227 #(
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
              
module kmp (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_d6158[1 x b32] */
  input logic [31:0] array_array_d6158_q,
  output logic [0:0] array_array_d6158_w,
  output logic [0:0] array_array_d6158_widx,
  output logic [31:0] array_array_d6158_d,

  /* Array: array_d6146[1 x u32] */
  input logic [31:0] array_array_d6146_q,
  output logic [0:0] array_array_d6146_w,
  output logic [0:0] array_array_d6146_widx,
  output logic [31:0] array_array_d6146_d,

  /* Array: array_d614f[1 x b32] */
  input logic [31:0] array_array_d614f_q,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_14;
  assign var_14 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [31:0] var_17;
  assign var_17 = array_array_d6158_q[31:0];


  logic [63:0] var_20;
  assign var_20 = {var_17, var_14};


  logic [31:0] var_25;
  assign var_25 = var_20[39:8];


  logic [31:0] var_167;
  assign var_167 = array_array_d614f_q[31:0];


  logic [0:0] var_32;
  assign var_32 = var_25 == var_167;


  logic [31:0] var_37;
  assign var_37 = var_32 ? 32'd0 : 32'd1;


  logic [31:0] var_43;
  assign var_43 = var_20[47:16];


  logic [0:0] var_50;
  assign var_50 = var_43 == var_167;


  logic [31:0] var_53;
  assign var_53 = var_50 ? 32'd0 : 32'd1;


  logic [31:0] var_57;
  assign var_57 = var_37 + var_53;


  logic [31:0] var_62;
  assign var_62 = var_20[55:24];


  logic [0:0] var_69;
  assign var_69 = var_62 == var_167;


  logic [31:0] var_72;
  assign var_72 = var_69 ? 32'd0 : 32'd1;


  logic [31:0] var_76;
  assign var_76 = var_57 + var_72;


  logic [31:0] var_81;
  assign var_81 = var_20[63:32];


  logic [0:0] var_88;
  assign var_88 = var_81 == var_167;


  logic [31:0] var_91;
  assign var_91 = var_88 ? 32'd0 : 32'd1;


  logic [31:0] var_95;
  assign var_95 = var_76 + var_91;


  logic [31:0] var_98;
  assign var_98 = array_array_d6146_q[31:0];


  logic [31:0] var_101;
  assign var_101 = var_98 + var_95;


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_d6146_w = executed;
    assign array_array_d6146_d = var_101;
    assign array_array_d6146_widx = 1'd0;

    assign array_array_d6158_w = executed;
    assign array_array_d6158_d = var_14;
    assign array_array_d6158_widx = 1'd0;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // kmp


module driver (
  input logic clk,
  input logic rst_n,

  /* Array: array_d6239[1 x u13] */
  input logic [12:0] array_array_d6239_q,
  output logic [0:0] array_array_d6239_w,
  output logic [0:0] array_array_d6239_widx,
  output logic [12:0] array_array_d6239_d,

  // Module kmp
  output logic [7:0] kmp_counter_delta,
  input logic [0:0] kmp_counter_delta_ready,

  output logic [12:0] expose_var_85,
  output logic [0:0] expose_var_85_valid,
  output logic [0:0] expose_var_116,
  output logic [0:0] expose_var_116_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [12:0] var_85;
  assign var_85 = array_array_d6239_q[12:0];
  assign expose_var_85 = var_85;
  assign expose_var_85_valid = executed && 1;


  logic [0:0] var_116;
  assign var_116 = var_85 < 13'd8191;
  assign expose_var_116 = var_116;
  assign expose_var_116_valid = executed && 1;


  logic [12:0] var_133;
  assign var_133 = var_85 + 13'd1;


  logic [0:0] var_140;
  assign var_140 = ~var_116;


  always_ff @(posedge clk) if (executed && (var_140))$display("%t\t[driver]\t\tfinish",



  $time

);





  assign kmp_counter_delta = executed ? { 7'b0, |(var_116) } : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_d6239_w = (executed) && (((var_116)));
    assign array_array_d6239_d = ({ 13 { (var_116) } } & var_133);
    assign array_array_d6239_widx = ({ 1 { (var_116) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver

module top(
  output logic [31:0] array_array_d6146_exposed_o,
  input logic [31:0] array_array_d6146_exposed_i,
  input logic [0:0] array_array_d6146_exposed_i_valid,
  output logic [12:0] array_array_d6239_exposed_o,
  input logic [12:0] array_array_d6239_exposed_i,
  input logic [0:0] array_array_d6239_exposed_i_valid,

  input logic clk,
  input logic rst_n
);

//Array: array_d6227, Init File Path: /home/gaod/derui_work/assassyn-workloads/assassyn-public/examples/kmp/input/init.hex
  /* Array: array_d614f[1 x b32] */
  logic [31:0] array_array_d614f_q;
  logic [31:0] array_array_d614f_d;
  logic [0:0] array_array_d614f_widx;
  logic [0:0] array_array_d614f_w;
  assign array_array_d614f_d = 'x;
  assign array_array_d614f_widx = 'x;
  assign array_array_d614f_w = 'x;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_d614f_q <= 32'd0;
    else if (array_array_d614f_w) begin

      case (array_array_d614f_widx)
        0 : array_array_d614f_q[31:0] <= array_array_d614f_d;
        default: ;
      endcase
    end
  /* Array: array_d6146[1 x u32] */
  logic [31:0] array_array_d6146_q;
  logic [31:0] array_array_d6146_driver_kmp_d;
  logic [0:0] array_array_d6146_driver_kmp_w;
  logic [0:0] array_array_d6146_driver_kmp_widx;
  assign array_array_d6146_exposed_o = array_array_d6146_q;
  logic [31:0] array_array_d6146_temp;
  assign array_array_d6146_temp = array_array_d6146_exposed_i_valid?array_array_d6146_exposed_i:array_array_d6146_d;
  logic [31:0] array_array_d6146_d;
  logic [0:0] array_array_d6146_widx;
  logic [0:0] array_array_d6146_w;
  assign array_array_d6146_d = ({ 32 { array_array_d6146_driver_kmp_w } } & array_array_d6146_driver_kmp_d);
  assign array_array_d6146_widx = ({ 1 { array_array_d6146_driver_kmp_w } } & array_array_d6146_driver_kmp_widx);
  assign array_array_d6146_w = array_array_d6146_driver_kmp_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_d6146_q <= 32'd0;
    else if (array_array_d6146_w) begin

      case (array_array_d6146_widx)
        0 : array_array_d6146_q[31:0] <= array_array_d6146_temp;
        default: ;
      endcase
    end
  /* Array: array_d6239[1 x u13] */
  logic [12:0] array_array_d6239_q;
  logic [12:0] array_array_d6239_driver_driver_d;
  logic [0:0] array_array_d6239_driver_driver_w;
  logic [0:0] array_array_d6239_driver_driver_widx;
  assign array_array_d6239_exposed_o = array_array_d6239_q;
  logic [12:0] array_array_d6239_temp;
  assign array_array_d6239_temp = array_array_d6239_exposed_i_valid?array_array_d6239_exposed_i:array_array_d6239_d;
  logic [12:0] array_array_d6239_d;
  logic [0:0] array_array_d6239_widx;
  logic [0:0] array_array_d6239_w;
  assign array_array_d6239_d = ({ 13 { array_array_d6239_driver_driver_w } } & array_array_d6239_driver_driver_d);
  assign array_array_d6239_widx = ({ 1 { array_array_d6239_driver_driver_w } } & array_array_d6239_driver_driver_widx);
  assign array_array_d6239_w = array_array_d6239_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_d6239_q <= 13'd0;
    else if (array_array_d6239_w) begin

      case (array_array_d6239_widx)
        0 : array_array_d6239_q[12:0] <= array_array_d6239_temp;
        default: ;
      endcase
    end
  /* Array: array_d6158[1 x b32] */
  logic [31:0] array_array_d6158_q;
  logic [31:0] array_array_d6158_driver_kmp_d;
  logic [0:0] array_array_d6158_driver_kmp_w;
  logic [0:0] array_array_d6158_driver_kmp_widx;
  logic [31:0] array_array_d6158_d;
  logic [0:0] array_array_d6158_widx;
  logic [0:0] array_array_d6158_w;
  assign array_array_d6158_d = ({ 32 { array_array_d6158_driver_kmp_w } } & array_array_d6158_driver_kmp_d);
  assign array_array_d6158_widx = ({ 1 { array_array_d6158_driver_kmp_w } } & array_array_d6158_driver_kmp_widx);
  assign array_array_d6158_w = array_array_d6158_driver_kmp_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_d6158_q[31:0] <= 32'd0;
    end
    else if (array_array_d6158_w) begin

      case (array_array_d6158_widx)
        0 : array_array_d6158_q[31:0] <= array_array_d6158_d;
        default: ;
      endcase
    end
  /* Array: array_d6227[8192 x b32] */
  logic [31:0] array_array_d6227_q;
  logic [31:0] array_array_d6227_driver_SRAM_d6221_d;
  logic [0:0] array_array_d6227_driver_SRAM_d6221_w;
  logic [12:0] array_array_d6227_driver_SRAM_d6221_widx;
  // fifo: rdata: fifo<b32>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_kmp_rdata_pop_data;
  logic [0:0] fifo_kmp_rdata_pop_valid;
  logic [0:0] fifo_kmp_rdata_pop_ready;
  logic [31:0] fifo_kmp_rdata_driver_SRAM_d6221_push_data;
  logic [0:0] fifo_kmp_rdata_driver_SRAM_d6221_push_valid;
  logic [0:0] fifo_kmp_rdata_driver_SRAM_d6221_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_kmp_rdata_push_ready;
  assign fifo_kmp_rdata_driver_SRAM_d6221_push_ready = fifo_kmp_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_kmp_rdata_push_valid;
  assign fifo_kmp_rdata_push_valid = fifo_kmp_rdata_driver_SRAM_d6221_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_kmp_rdata_push_data;
  assign fifo_kmp_rdata_push_data = ({ 32 { fifo_kmp_rdata_driver_SRAM_d6221_push_valid } } & fifo_kmp_rdata_driver_SRAM_d6221_push_data);

  fifo #(32, 2) fifo_kmp_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_kmp_rdata_push_valid),
    .push_data(fifo_kmp_rdata_push_data),
    .push_ready(fifo_kmp_rdata_push_ready),
    .pop_valid(fifo_kmp_rdata_pop_valid),
    .pop_data(fifo_kmp_rdata_pop_data),
    .pop_ready(fifo_kmp_rdata_pop_ready));

  // Trigger SM of Module: kmp
  logic [7:0] kmp_driver_driver_counter_delta;
  logic [0:0] kmp_driver_driver_counter_delta_ready;
  logic [0:0] kmp_counter_delta_ready;
  logic [7:0] kmp_counter_delta;
  // Gather all the push signal
  assign kmp_counter_delta = kmp_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] kmp_counter_pop_ready;
  assign kmp_driver_driver_counter_delta_ready = kmp_counter_pop_ready;
  logic [0:0] kmp_counter_pop_valid;

  trigger_counter #(8) kmp_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(kmp_counter_delta),
    .delta_ready(kmp_counter_delta_ready),
    .pop_valid(kmp_counter_pop_valid),
    .pop_ready(kmp_counter_pop_ready));
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
  assign driver_counter_delta = 8'b1;

  logic [0:0] kmp_executed;

  // kmp
  kmp kmp_i (
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
    .expose_executed(kmp_executed));
  logic [12:0] logic_var_85;
  logic [0:0] logic_var_85_valid;
  logic [0:0] logic_var_116;
  logic [0:0] logic_var_116_valid;
  logic [0:0] driver_executed;

  // driver
  driver driver_i (
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
    .expose_executed(driver_executed));
  logic [0:0] SRAM_d6221_executed;

  // SRAM_d6221
  SRAM_d6221 SRAM_d6221_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_kmp_rdata_push_valid(fifo_kmp_rdata_driver_SRAM_d6221_push_valid),
    .fifo_kmp_rdata_push_data(fifo_kmp_rdata_driver_SRAM_d6221_push_data),
    .fifo_kmp_rdata_push_ready(fifo_kmp_rdata_driver_SRAM_d6221_push_ready),
    // Upstream executed signals
    .driver_executed(driver_executed),
    .var_85(logic_var_85),
    .var_85_valid(logic_var_85_valid),
    .var_116(logic_var_116),
    .var_116_valid(logic_var_116_valid),
    .expose_executed(SRAM_d6221_executed));
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
logic [31:0]array_array_d6146_exposed_o;
logic [31:0]array_array_d6146_exposed_i;
logic array_array_d6146_exposed_i_valid;

assign array_array_d6146_exposed_i_valid = 1'd0;
assign array_array_d6146_exposed_i = 32'd0;
logic [12:0]array_array_d6239_exposed_o;
logic [12:0]array_array_d6239_exposed_i;
logic array_array_d6239_exposed_i_valid;

assign array_array_d6239_exposed_i_valid = 1'd0;
assign array_array_d6239_exposed_i = 13'd0;

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
  .array_array_d6146_exposed_o(array_array_d6146_exposed_o),
  .array_array_d6146_exposed_i(array_array_d6146_exposed_i),
  .array_array_d6146_exposed_i_valid(array_array_d6146_exposed_i_valid),
  .array_array_d6239_exposed_o(array_array_d6239_exposed_o),
  .array_array_d6239_exposed_i(array_array_d6239_exposed_i),
  .array_array_d6239_exposed_i_valid(array_array_d6239_exposed_i_valid)
);

endmodule
