////////////////////////////////////////////////////////////////
// Start of: /home/ubuntu/conv_sum.sv


module memuser_6e251 (
  input logic clk,
  input logic rst_n,
  // Port FIFO count
  input logic [0:0] fifo_count_pop_valid,
  input logic [31:0] fifo_count_pop_data,
  output logic [0:0] fifo_count_pop_ready,
  // Port FIFO is_finish
  input logic [0:0] fifo_is_finish_pop_valid,
  input logic [0:0] fifo_is_finish_pop_data,
  output logic [0:0] fifo_is_finish_pop_ready,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_6e275[1 x i32] */
  input logic [31:0] array_array_6e275_q,
  output logic [0:0] array_array_6e275_w,
  output logic [0:0] array_array_6e275_widx,
  output logic [31:0] array_array_6e275_d,

  /* Array: array_6e26c[1 x u32] */
  input logic [31:0] array_array_6e26c_q,
  output logic [0:0] array_array_6e26c_w,
  output logic [0:0] array_array_6e26c_widx,
  output logic [31:0] array_array_6e26c_d,

  /* Array: array_6e25a[9 x i32] */
  input logic [287:0] array_array_6e25a_q,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_29;
  assign var_29 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [31:0] var_31;
  assign var_31 = fifo_count_pop_data;


  assign fifo_count_pop_ready = executed;
  logic [0:0] var_33;
  assign var_33 = fifo_is_finish_pop_data;


  assign fifo_is_finish_pop_ready = executed;
  logic [31:0] var_35;
  assign var_35 = var_29;


  logic [31:0] var_37;
  assign var_37 = 8 == var_31 ? array_array_6e25a_q[287:256] : (7 == var_31 ? array_array_6e25a_q[255:224] : (6 == var_31 ? array_array_6e25a_q[223:192] : (5 == var_31 ? array_array_6e25a_q[191:160] : (4 == var_31 ? array_array_6e25a_q[159:128] : (3 == var_31 ? array_array_6e25a_q[127:96] : (2 == var_31 ? array_array_6e25a_q[95:64] : (1 == var_31 ? array_array_6e25a_q[63:32] : (0 == var_31 ? array_array_6e25a_q[31:0] : ('x)))))))));


  logic [63:0] var_40;
  assign var_40 = $signed(var_35) * $signed(var_37);


  logic [31:0] var_45;
  assign var_45 = var_40[31:0];


  logic [31:0] var_49;
  assign var_49 = var_45;


  logic [31:0] var_51;
  assign var_51 = array_array_6e275_q[31:0];


  logic [31:0] var_54;
  assign var_54 = $signed(var_51) + $signed(var_49);


  logic [0:0] var_58;
  assign var_58 = var_31 < 32'd8;


  logic [0:0] var_68;
  assign var_68 = var_31 == 32'd8;


  logic [31:0] var_74;
  assign var_74 = array_array_6e26c_q[31:0];


  logic [31:0] var_78;
  assign var_78 = var_74 + 32'd1;


  always_ff @(posedge clk) if (executed && (var_68))$display("%t\t[memuser_6e251]\t\tStep: %d	Conv_sum: %d",



  $time

, var_78, var_54);

  always_ff @(posedge clk) if (executed && (var_68 && var_33))$display("%t\t[memuser_6e251]\t\tfinish",



  $time

);





  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_6e26c_w = (executed) && (((var_68)));
    assign array_array_6e26c_d = ({ 32 { (var_68) } } & var_78);
    assign array_array_6e26c_widx = ({ 1 { (var_68) } } & 1'd0);

    assign array_array_6e275_w = (executed) && (((var_58)) || ((var_68)));
    assign array_array_6e275_d = ({ 32 { (var_58) } } & var_54) | ({ 32 { (var_68) } } & 32'd0);
    assign array_array_6e275_widx = ({ 1 { (var_58) } } & 1'd0) | ({ 1 { (var_68) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // memuser_6e251


module driver (
  input logic clk,
  input logic rst_n,
  /* Array: array_6e323[1 x u32] */
  input logic [31:0] array_array_6e323_q,
  output logic [0:0] array_array_6e323_w,
  output logic [0:0] array_array_6e323_widx,
  output logic [31:0] array_array_6e323_d,

  /* Array: array_6e317[1 x u32] */
  input logic [31:0] array_array_6e317_q,
  output logic [0:0] array_array_6e317_w,
  output logic [0:0] array_array_6e317_widx,
  output logic [31:0] array_array_6e317_d,

  /* Array: array_6e329[1 x u32] */
  input logic [31:0] array_array_6e329_q,
  output logic [0:0] array_array_6e329_w,
  output logic [0:0] array_array_6e329_widx,
  output logic [31:0] array_array_6e329_d,

  // External FIFO memuser_6e251.is_finish
  output logic [0:0] fifo_memuser_6e251_is_finish_push_valid,
  output logic [0:0] fifo_memuser_6e251_is_finish_push_data,
  input logic [0:0] fifo_memuser_6e251_is_finish_push_ready,

  /* Array: array_6e335[1 x u32] */
  input logic [31:0] array_array_6e335_q,
  output logic [0:0] array_array_6e335_w,
  output logic [0:0] array_array_6e335_widx,
  output logic [31:0] array_array_6e335_d,

  // External FIFO memuser_6e251.count
  output logic [0:0] fifo_memuser_6e251_count_push_valid,
  output logic [31:0] fifo_memuser_6e251_count_push_data,
  input logic [0:0] fifo_memuser_6e251_count_push_ready,

  /* Array: array_6e32f[1 x u32] */
  input logic [31:0] array_array_6e32f_q,
  output logic [0:0] array_array_6e32f_w,
  output logic [0:0] array_array_6e32f_widx,
  output logic [31:0] array_array_6e32f_d,

  // Module memuser_6e251
  output logic [7:0] memuser_6e251_counter_delta,
  input logic [0:0] memuser_6e251_counter_delta_ready,


  output logic [13:0] expose_var_149,
  output logic [0:0] expose_var_149_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_101;
  assign var_101 = array_array_6e317_q[31:0];


  logic [31:0] var_104;
  assign var_104 = array_array_6e323_q[31:0];


  logic [31:0] var_107;
  assign var_107 = array_array_6e329_q[31:0];


  logic [31:0] var_110;
  assign var_110 = array_array_6e32f_q[31:0];


  logic [31:0] var_113;
  assign var_113 = array_array_6e335_q[31:0];


  logic [63:0] var_117;
  assign var_117 = var_101 * 32'd128;


  logic [31:0] var_120;
  assign var_120 = var_117[31:0];


  logic [31:0] var_124;
  assign var_124 = var_120;


  logic [31:0] var_126;
  assign var_126 = var_124 + var_104;


  logic [63:0] var_129;
  assign var_129 = var_107 * 32'd128;


  logic [31:0] var_132;
  assign var_132 = var_129[31:0];


  logic [31:0] var_136;
  assign var_136 = var_132;


  logic [31:0] var_138;
  assign var_138 = var_136 + var_110;


  logic [31:0] var_141;
  assign var_141 = var_126 + var_138;


  logic [13:0] var_145;
  assign var_145 = var_141[13:0];


  logic [13:0] var_149;
  assign var_149 = var_145;
  assign expose_var_149 = var_149;
  assign expose_var_149_valid = executed && 1;


  logic [0:0] var_152;
  assign var_152 = var_101 == 32'd61;


  logic [0:0] var_156;
  assign var_156 = var_152 ? 1'd1 : 1'd0;


  logic [0:0] var_242;
  assign var_242 = var_104 == 32'd125;


  logic [0:0] var_164;
  assign var_164 = var_242 ? var_156 : 1'd0;


  logic [0:0] var_224;
  assign var_224 = var_110 == 32'd2;


  logic [31:0] var_182;
  assign var_182 = var_107 + 32'd1;


  logic [31:0] var_185;
  assign var_185 = var_224 ? var_182 : var_107;


  logic [0:0] var_190;
  assign var_190 = var_185 == 32'd3;


  logic [31:0] var_194;
  assign var_194 = var_190 ? 32'd0 : var_185;


  logic [31:0] var_201;
  assign var_201 = var_110 + 32'd1;


  logic [31:0] var_204;
  assign var_204 = var_224 ? 32'd0 : var_201;


  logic [0:0] var_282;
  assign var_282 = var_113 == 32'd8;


  logic [31:0] var_217;
  assign var_217 = var_101 + 32'd1;


  logic [31:0] var_220;
  assign var_220 = var_242 ? var_217 : var_101;


  logic [31:0] var_227;
  assign var_227 = var_104 + 32'd1;


  logic [31:0] var_230;
  assign var_230 = var_242 ? 32'd0 : var_227;


  logic [31:0] var_245;
  assign var_245 = var_113 + 32'd1;


  logic [31:0] var_248;
  assign var_248 = var_282 ? 32'd0 : var_245;


  assign memuser_6e251_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_memuser_6e251_count_push_valid = executed;
  assign fifo_memuser_6e251_count_push_data = var_113;

  assign fifo_memuser_6e251_is_finish_push_valid = executed;
  assign fifo_memuser_6e251_is_finish_push_data = var_164;

  // Gather Array writes
  assign array_array_6e317_w = (executed) && (((var_282)));
    assign array_array_6e317_d = ({ 32 { (var_282) } } & var_220);
    assign array_array_6e317_widx = ({ 1 { (var_282) } } & 1'd0);

    assign array_array_6e323_w = (executed) && (((var_282)));
    assign array_array_6e323_d = ({ 32 { (var_282) } } & var_230);
    assign array_array_6e323_widx = ({ 1 { (var_282) } } & 1'd0);

    assign array_array_6e335_w = executed;
    assign array_array_6e335_d = var_248;
    assign array_array_6e335_widx = 1'd0;

    assign array_array_6e329_w = executed;
    assign array_array_6e329_d = var_194;
    assign array_array_6e329_widx = 1'd0;

    assign array_array_6e32f_w = executed;
    assign array_array_6e32f_d = var_204;
    assign array_array_6e32f_widx = 1'd0;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver


module SRAM_6e3f2 (
  input logic clk,
  input logic rst_n,
  /* Array: array_77af3[16384 x b32] */
  /* /tmp/conv_sum/inputfile.hex */


  // External FIFO memuser_6e251.rdata
  output logic [0:0] fifo_memuser_6e251_rdata_push_valid,
  output logic [31:0] fifo_memuser_6e251_rdata_push_data,
  input logic [0:0] fifo_memuser_6e251_rdata_push_ready,

  // Declare upstream executed signals
  input logic [0:0] driver_executed,
  input logic [13:0] var_149,
  input logic [0:0] var_149_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_275;
  assign var_275 = dataout;
  // Gather FIFO pushes
  assign fifo_memuser_6e251_rdata_push_valid = (executed) && (((1'd1)));
  assign fifo_memuser_6e251_rdata_push_data = ({ 32 { (1'd1) } } & var_275);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_77af3_w;
  logic [31:0] array_array_77af3_d;
  logic [13:0] array_array_77af3_widx;
  assign array_array_77af3_w = (executed) && (((1'd0)));
  assign array_array_77af3_d = ({ 32 { (1'd0) } } & 32'd0);
  assign array_array_77af3_widx = var_149;


  memory_blackbox_array_77af3 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(14)     
    ) memory_blackbox_array_77af3(
    .clk     (clk), 
    .address (array_array_77af3_widx), 
    .wd      (array_array_77af3_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_77af3_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = driver_executed;
  assign expose_executed = executed;
endmodule // SRAM_6e3f2




(* blackbox *)

module memory_blackbox_array_77af3 #(
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
              module top(
  output logic [31:0] array_array_6e275_exposed_o,
  input logic [31:0] array_array_6e275_exposed_i,
  input logic [0:0] array_array_6e275_exposed_i_valid,

  input logic clk,
  input logic rst_n
);

//Array: array_77af3, Init File Path: /tmp/conv_sum/inputfile.hex
  /* Array: array_6e275[1 x i32] */
  logic [31:0] array_array_6e275_q;
  logic [31:0] array_array_6e275_driver_memuser_6e251_d;
  logic [0:0] array_array_6e275_driver_memuser_6e251_w;
  logic [0:0] array_array_6e275_driver_memuser_6e251_widx;
  assign array_array_6e275_exposed_o = array_array_6e275_q;
  logic [31:0] array_array_6e275_temp;
  assign array_array_6e275_temp = array_array_6e275_exposed_i_valid?array_array_6e275_exposed_i:array_array_6e275_d;
  logic [31:0] array_array_6e275_d;
  logic [0:0] array_array_6e275_widx;
  logic [0:0] array_array_6e275_w;
  assign array_array_6e275_d = ({ 32 { array_array_6e275_driver_memuser_6e251_w } } & array_array_6e275_driver_memuser_6e251_d);
  assign array_array_6e275_widx = ({ 1 { array_array_6e275_driver_memuser_6e251_w } } & array_array_6e275_driver_memuser_6e251_widx);
  assign array_array_6e275_w = array_array_6e275_driver_memuser_6e251_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_6e275_q <= 32'd0;
    else if (array_array_6e275_w) begin

      case (array_array_6e275_widx)
        0 : array_array_6e275_q[31:0] <= array_array_6e275_temp;
        default: ;
      endcase
    end
  /* Array: array_6e25a[9 x i32] */
  logic [287:0] array_array_6e25a_q;
  logic [31:0] array_array_6e25a_d;
  logic [3:0] array_array_6e25a_widx;
  logic [0:0] array_array_6e25a_w;
  assign array_array_6e25a_d = 'x;
  assign array_array_6e25a_widx = 'x;
  assign array_array_6e25a_w = 'x;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_6e25a_q[31:0] <= 32'd0;
      array_array_6e25a_q[63:32] <= 32'd1;
      array_array_6e25a_q[95:64] <= 32'd2;
      array_array_6e25a_q[127:96] <= 32'd3;
      array_array_6e25a_q[159:128] <= 32'd4;
      array_array_6e25a_q[191:160] <= 32'd5;
      array_array_6e25a_q[223:192] <= 32'd6;
      array_array_6e25a_q[255:224] <= 32'd7;
      array_array_6e25a_q[287:256] <= 32'd8;
    end
    else if (array_array_6e25a_w) begin

      case (array_array_6e25a_widx)
        0 : array_array_6e25a_q[31:0] <= array_array_6e25a_d;
        1 : array_array_6e25a_q[63:32] <= array_array_6e25a_d;
        2 : array_array_6e25a_q[95:64] <= array_array_6e25a_d;
        3 : array_array_6e25a_q[127:96] <= array_array_6e25a_d;
        4 : array_array_6e25a_q[159:128] <= array_array_6e25a_d;
        5 : array_array_6e25a_q[191:160] <= array_array_6e25a_d;
        6 : array_array_6e25a_q[223:192] <= array_array_6e25a_d;
        7 : array_array_6e25a_q[255:224] <= array_array_6e25a_d;
        8 : array_array_6e25a_q[287:256] <= array_array_6e25a_d;
        default: ;
      endcase
    end
  /* Array: array_6e26c[1 x u32] */
  logic [31:0] array_array_6e26c_q;
  logic [31:0] array_array_6e26c_driver_memuser_6e251_d;
  logic [0:0] array_array_6e26c_driver_memuser_6e251_w;
  logic [0:0] array_array_6e26c_driver_memuser_6e251_widx;
  logic [31:0] array_array_6e26c_d;
  logic [0:0] array_array_6e26c_widx;
  logic [0:0] array_array_6e26c_w;
  assign array_array_6e26c_d = ({ 32 { array_array_6e26c_driver_memuser_6e251_w } } & array_array_6e26c_driver_memuser_6e251_d);
  assign array_array_6e26c_widx = ({ 1 { array_array_6e26c_driver_memuser_6e251_w } } & array_array_6e26c_driver_memuser_6e251_widx);
  assign array_array_6e26c_w = array_array_6e26c_driver_memuser_6e251_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_6e26c_q <= 32'd0;
    else if (array_array_6e26c_w) begin

      case (array_array_6e26c_widx)
        0 : array_array_6e26c_q[31:0] <= array_array_6e26c_d;
        default: ;
      endcase
    end
  /* Array: array_6e317[1 x u32] */
  logic [31:0] array_array_6e317_q;
  logic [31:0] array_array_6e317_driver_driver_d;
  logic [0:0] array_array_6e317_driver_driver_w;
  logic [0:0] array_array_6e317_driver_driver_widx;
  logic [31:0] array_array_6e317_d;
  logic [0:0] array_array_6e317_widx;
  logic [0:0] array_array_6e317_w;
  assign array_array_6e317_d = ({ 32 { array_array_6e317_driver_driver_w } } & array_array_6e317_driver_driver_d);
  assign array_array_6e317_widx = ({ 1 { array_array_6e317_driver_driver_w } } & array_array_6e317_driver_driver_widx);
  assign array_array_6e317_w = array_array_6e317_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_6e317_q <= 32'd0;
    else if (array_array_6e317_w) begin

      case (array_array_6e317_widx)
        0 : array_array_6e317_q[31:0] <= array_array_6e317_d;
        default: ;
      endcase
    end
  /* Array: array_6e32f[1 x u32] */
  logic [31:0] array_array_6e32f_q;
  logic [31:0] array_array_6e32f_driver_driver_d;
  logic [0:0] array_array_6e32f_driver_driver_w;
  logic [0:0] array_array_6e32f_driver_driver_widx;
  logic [31:0] array_array_6e32f_d;
  logic [0:0] array_array_6e32f_widx;
  logic [0:0] array_array_6e32f_w;
  assign array_array_6e32f_d = ({ 32 { array_array_6e32f_driver_driver_w } } & array_array_6e32f_driver_driver_d);
  assign array_array_6e32f_widx = ({ 1 { array_array_6e32f_driver_driver_w } } & array_array_6e32f_driver_driver_widx);
  assign array_array_6e32f_w = array_array_6e32f_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_6e32f_q <= 32'd0;
    else if (array_array_6e32f_w) begin

      case (array_array_6e32f_widx)
        0 : array_array_6e32f_q[31:0] <= array_array_6e32f_d;
        default: ;
      endcase
    end
  /* Array: array_6e323[1 x u32] */
  logic [31:0] array_array_6e323_q;
  logic [31:0] array_array_6e323_driver_driver_d;
  logic [0:0] array_array_6e323_driver_driver_w;
  logic [0:0] array_array_6e323_driver_driver_widx;
  logic [31:0] array_array_6e323_d;
  logic [0:0] array_array_6e323_widx;
  logic [0:0] array_array_6e323_w;
  assign array_array_6e323_d = ({ 32 { array_array_6e323_driver_driver_w } } & array_array_6e323_driver_driver_d);
  assign array_array_6e323_widx = ({ 1 { array_array_6e323_driver_driver_w } } & array_array_6e323_driver_driver_widx);
  assign array_array_6e323_w = array_array_6e323_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_6e323_q <= 32'd0;
    else if (array_array_6e323_w) begin

      case (array_array_6e323_widx)
        0 : array_array_6e323_q[31:0] <= array_array_6e323_d;
        default: ;
      endcase
    end
  /* Array: array_6e335[1 x u32] */
  logic [31:0] array_array_6e335_q;
  logic [31:0] array_array_6e335_driver_driver_d;
  logic [0:0] array_array_6e335_driver_driver_w;
  logic [0:0] array_array_6e335_driver_driver_widx;
  logic [31:0] array_array_6e335_d;
  logic [0:0] array_array_6e335_widx;
  logic [0:0] array_array_6e335_w;
  assign array_array_6e335_d = ({ 32 { array_array_6e335_driver_driver_w } } & array_array_6e335_driver_driver_d);
  assign array_array_6e335_widx = ({ 1 { array_array_6e335_driver_driver_w } } & array_array_6e335_driver_driver_widx);
  assign array_array_6e335_w = array_array_6e335_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_6e335_q <= 32'd0;
    else if (array_array_6e335_w) begin

      case (array_array_6e335_widx)
        0 : array_array_6e335_q[31:0] <= array_array_6e335_d;
        default: ;
      endcase
    end
  /* Array: array_6e329[1 x u32] */
  logic [31:0] array_array_6e329_q;
  logic [31:0] array_array_6e329_driver_driver_d;
  logic [0:0] array_array_6e329_driver_driver_w;
  logic [0:0] array_array_6e329_driver_driver_widx;
  logic [31:0] array_array_6e329_d;
  logic [0:0] array_array_6e329_widx;
  logic [0:0] array_array_6e329_w;
  assign array_array_6e329_d = ({ 32 { array_array_6e329_driver_driver_w } } & array_array_6e329_driver_driver_d);
  assign array_array_6e329_widx = ({ 1 { array_array_6e329_driver_driver_w } } & array_array_6e329_driver_driver_widx);
  assign array_array_6e329_w = array_array_6e329_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_6e329_q <= 32'd0;
    else if (array_array_6e329_w) begin

      case (array_array_6e329_widx)
        0 : array_array_6e329_q[31:0] <= array_array_6e329_d;
        default: ;
      endcase
    end
  /* Array: array_77af3[16384 x b32] */
  logic [31:0] array_array_77af3_q;
  logic [31:0] array_array_77af3_driver_SRAM_6e3f2_d;
  logic [0:0] array_array_77af3_driver_SRAM_6e3f2_w;
  logic [13:0] array_array_77af3_driver_SRAM_6e3f2_widx;
  // fifo: count: fifo<u32>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_memuser_6e251_count_pop_data;
  logic [0:0] fifo_memuser_6e251_count_pop_valid;
  logic [0:0] fifo_memuser_6e251_count_pop_ready;
  logic [31:0] fifo_memuser_6e251_count_driver_driver_push_data;
  logic [0:0] fifo_memuser_6e251_count_driver_driver_push_valid;
  logic [0:0] fifo_memuser_6e251_count_driver_driver_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_memuser_6e251_count_push_ready;
  assign fifo_memuser_6e251_count_driver_driver_push_ready = fifo_memuser_6e251_count_push_ready;  // Gather all the push signal
  logic [0:0] fifo_memuser_6e251_count_push_valid;
  assign fifo_memuser_6e251_count_push_valid = fifo_memuser_6e251_count_driver_driver_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_memuser_6e251_count_push_data;
  assign fifo_memuser_6e251_count_push_data = ({ 32 { fifo_memuser_6e251_count_driver_driver_push_valid } } & fifo_memuser_6e251_count_driver_driver_push_data);

  fifo #(32, 2) fifo_memuser_6e251_count_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_memuser_6e251_count_push_valid),
    .push_data(fifo_memuser_6e251_count_push_data),
    .push_ready(fifo_memuser_6e251_count_push_ready),
    .pop_valid(fifo_memuser_6e251_count_pop_valid),
    .pop_data(fifo_memuser_6e251_count_pop_data),
    .pop_ready(fifo_memuser_6e251_count_pop_ready));

  // fifo: is_finish: fifo<u1>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [0:0] fifo_memuser_6e251_is_finish_pop_data;
  logic [0:0] fifo_memuser_6e251_is_finish_pop_valid;
  logic [0:0] fifo_memuser_6e251_is_finish_pop_ready;
  logic [0:0] fifo_memuser_6e251_is_finish_driver_driver_push_data;
  logic [0:0] fifo_memuser_6e251_is_finish_driver_driver_push_valid;
  logic [0:0] fifo_memuser_6e251_is_finish_driver_driver_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_memuser_6e251_is_finish_push_ready;
  assign fifo_memuser_6e251_is_finish_driver_driver_push_ready = fifo_memuser_6e251_is_finish_push_ready;  // Gather all the push signal
  logic [0:0] fifo_memuser_6e251_is_finish_push_valid;
  assign fifo_memuser_6e251_is_finish_push_valid = fifo_memuser_6e251_is_finish_driver_driver_push_valid;
  // 1-hot select the push data
  logic [0:0] fifo_memuser_6e251_is_finish_push_data;
  assign fifo_memuser_6e251_is_finish_push_data = ({ 1 { fifo_memuser_6e251_is_finish_driver_driver_push_valid } } & fifo_memuser_6e251_is_finish_driver_driver_push_data);

  fifo #(1, 2) fifo_memuser_6e251_is_finish_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_memuser_6e251_is_finish_push_valid),
    .push_data(fifo_memuser_6e251_is_finish_push_data),
    .push_ready(fifo_memuser_6e251_is_finish_push_ready),
    .pop_valid(fifo_memuser_6e251_is_finish_pop_valid),
    .pop_data(fifo_memuser_6e251_is_finish_pop_data),
    .pop_ready(fifo_memuser_6e251_is_finish_pop_ready));

  // fifo: rdata: fifo<b32>, depth: 4
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_memuser_6e251_rdata_pop_data;
  logic [0:0] fifo_memuser_6e251_rdata_pop_valid;
  logic [0:0] fifo_memuser_6e251_rdata_pop_ready;
  logic [31:0] fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_data;
  logic [0:0] fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid;
  logic [0:0] fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_memuser_6e251_rdata_push_ready;
  assign fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_ready = fifo_memuser_6e251_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_memuser_6e251_rdata_push_valid;
  assign fifo_memuser_6e251_rdata_push_valid = fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_memuser_6e251_rdata_push_data;
  assign fifo_memuser_6e251_rdata_push_data = ({ 32 { fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid } } & fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_data);

  fifo #(32, 2) fifo_memuser_6e251_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_memuser_6e251_rdata_push_valid),
    .push_data(fifo_memuser_6e251_rdata_push_data),
    .push_ready(fifo_memuser_6e251_rdata_push_ready),
    .pop_valid(fifo_memuser_6e251_rdata_pop_valid),
    .pop_data(fifo_memuser_6e251_rdata_pop_data),
    .pop_ready(fifo_memuser_6e251_rdata_pop_ready));

  // Trigger SM of Module: memuser_6e251
  logic [7:0] memuser_6e251_driver_driver_counter_delta;
  logic [0:0] memuser_6e251_driver_driver_counter_delta_ready;
  logic [0:0] memuser_6e251_counter_delta_ready;
  logic [7:0] memuser_6e251_counter_delta;
  // Gather all the push signal
  assign memuser_6e251_counter_delta = memuser_6e251_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] memuser_6e251_counter_pop_ready;
  assign memuser_6e251_driver_driver_counter_delta_ready = memuser_6e251_counter_pop_ready;
  logic [0:0] memuser_6e251_counter_pop_valid;

  trigger_counter #(8) memuser_6e251_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(memuser_6e251_counter_delta),
    .delta_ready(memuser_6e251_counter_delta_ready),
    .pop_valid(memuser_6e251_counter_pop_valid),
    .pop_ready(memuser_6e251_counter_pop_ready));
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

  logic [0:0] memuser_6e251_executed;

  // memuser_6e251
  memuser_6e251 memuser_6e251_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_count_pop_ready(fifo_memuser_6e251_count_pop_ready),
    .fifo_count_pop_data(fifo_memuser_6e251_count_pop_data),
    .fifo_count_pop_valid(fifo_memuser_6e251_count_pop_valid),
    .fifo_is_finish_pop_ready(fifo_memuser_6e251_is_finish_pop_ready),
    .fifo_is_finish_pop_data(fifo_memuser_6e251_is_finish_pop_data),
    .fifo_is_finish_pop_valid(fifo_memuser_6e251_is_finish_pop_valid),
    .fifo_rdata_pop_ready(fifo_memuser_6e251_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_memuser_6e251_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_memuser_6e251_rdata_pop_valid),
    .array_array_6e275_q(array_array_6e275_q),
    .array_array_6e275_w(array_array_6e275_driver_memuser_6e251_w),
    .array_array_6e275_widx(array_array_6e275_driver_memuser_6e251_widx),
    .array_array_6e275_d(array_array_6e275_driver_memuser_6e251_d),
    .array_array_6e26c_q(array_array_6e26c_q),
    .array_array_6e26c_w(array_array_6e26c_driver_memuser_6e251_w),
    .array_array_6e26c_widx(array_array_6e26c_driver_memuser_6e251_widx),
    .array_array_6e26c_d(array_array_6e26c_driver_memuser_6e251_d),
    .array_array_6e25a_q(array_array_6e25a_q),
    .counter_delta_ready(memuser_6e251_counter_delta_ready),
    .counter_pop_ready(memuser_6e251_counter_pop_ready),
    .counter_pop_valid(memuser_6e251_counter_pop_valid),
    .expose_executed(memuser_6e251_executed));
  logic [13:0] logic_var_149;
  logic [0:0] logic_var_149_valid;
  logic [0:0] driver_executed;

  // driver
  driver driver_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_6e323_q(array_array_6e323_q),
    .array_array_6e323_w(array_array_6e323_driver_driver_w),
    .array_array_6e323_widx(array_array_6e323_driver_driver_widx),
    .array_array_6e323_d(array_array_6e323_driver_driver_d),
    .array_array_6e317_q(array_array_6e317_q),
    .array_array_6e317_w(array_array_6e317_driver_driver_w),
    .array_array_6e317_widx(array_array_6e317_driver_driver_widx),
    .array_array_6e317_d(array_array_6e317_driver_driver_d),
    .array_array_6e329_q(array_array_6e329_q),
    .array_array_6e329_w(array_array_6e329_driver_driver_w),
    .array_array_6e329_widx(array_array_6e329_driver_driver_widx),
    .array_array_6e329_d(array_array_6e329_driver_driver_d),
    .fifo_memuser_6e251_is_finish_push_valid(fifo_memuser_6e251_is_finish_driver_driver_push_valid),
    .fifo_memuser_6e251_is_finish_push_data(fifo_memuser_6e251_is_finish_driver_driver_push_data),
    .fifo_memuser_6e251_is_finish_push_ready(fifo_memuser_6e251_is_finish_driver_driver_push_ready),
    .array_array_6e335_q(array_array_6e335_q),
    .array_array_6e335_w(array_array_6e335_driver_driver_w),
    .array_array_6e335_widx(array_array_6e335_driver_driver_widx),
    .array_array_6e335_d(array_array_6e335_driver_driver_d),
    .fifo_memuser_6e251_count_push_valid(fifo_memuser_6e251_count_driver_driver_push_valid),
    .fifo_memuser_6e251_count_push_data(fifo_memuser_6e251_count_driver_driver_push_data),
    .fifo_memuser_6e251_count_push_ready(fifo_memuser_6e251_count_driver_driver_push_ready),
    .array_array_6e32f_q(array_array_6e32f_q),
    .array_array_6e32f_w(array_array_6e32f_driver_driver_w),
    .array_array_6e32f_widx(array_array_6e32f_driver_driver_widx),
    .array_array_6e32f_d(array_array_6e32f_driver_driver_d),
    .memuser_6e251_counter_delta_ready(memuser_6e251_driver_driver_counter_delta_ready),
    .memuser_6e251_counter_delta(memuser_6e251_driver_driver_counter_delta),
    .expose_var_149(logic_var_149),
    .expose_var_149_valid(logic_var_149_valid),
    .counter_delta_ready(driver_counter_delta_ready),
    .counter_pop_ready(driver_counter_pop_ready),
    .counter_pop_valid(driver_counter_pop_valid),
    .expose_executed(driver_executed));
  logic [0:0] SRAM_6e3f2_executed;

  // SRAM_6e3f2
  SRAM_6e3f2 SRAM_6e3f2_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_memuser_6e251_rdata_push_valid(fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_valid),
    .fifo_memuser_6e251_rdata_push_data(fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_data),
    .fifo_memuser_6e251_rdata_push_ready(fifo_memuser_6e251_rdata_driver_SRAM_6e3f2_push_ready),
    // Upstream executed signals
    .driver_executed(driver_executed),
    .var_149(logic_var_149),
    .var_149_valid(logic_var_149_valid),
    .expose_executed(SRAM_6e3f2_executed));
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
logic [31:0]array_array_6e275_exposed_o;
logic [31:0]array_array_6e275_exposed_i;
logic array_array_6e275_exposed_i_valid;

assign array_array_6e275_exposed_i_valid = 1'd0;
assign array_array_6e275_exposed_i = 32'd0;

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #7372900;
  


end

always #50 clk <= !clk;



top top_i (
  .clk(clk),
  .rst_n(rst_n),
  .array_array_6e275_exposed_o(array_array_6e275_exposed_o),
  .array_array_6e275_exposed_i(array_array_6e275_exposed_i),
  .array_array_6e275_exposed_i_valid(array_array_6e275_exposed_i_valid)
);

endmodule


// End of: /home/ubuntu/conv_sum.sv
////////////////////////////////////////////////////////////////
