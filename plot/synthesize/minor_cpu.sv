
module memuser_87e91 (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  /* Array: array_88e15[1 x b32] */
  output logic [0:0] array_array_88e15_w,
  output logic [0:0] array_array_88e15_widx,
  output logic [31:0] array_array_88e15_d,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_57;
  assign var_57 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [31:0] var_59;
  assign var_59 = var_57;


  logic [31:0] var_61;
  assign var_61 = var_59;


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_88e15_w = executed;
    assign array_array_88e15_d = var_61;
    assign array_array_88e15_widx = 1'd0;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // memuser_87e91


module m (
  input logic clk,
  input logic rst_n,
  // Port FIFO rdata
  input logic [0:0] fifo_rdata_pop_valid,
  input logic [31:0] fifo_rdata_pop_data,
  output logic [0:0] fifo_rdata_pop_ready,
  // Port FIFO rd
  input logic [0:0] fifo_rd_pop_valid,
  input logic [4:0] fifo_rd_pop_data,
  output logic [0:0] fifo_rd_pop_ready,
  // Port FIFO result
  input logic [0:0] fifo_result_pop_valid,
  input logic [31:0] fifo_result_pop_data,
  output logic [0:0] fifo_result_pop_ready,
  // Port FIFO mem_ext
  input logic [0:0] fifo_mem_ext_pop_valid,
  input logic [1:0] fifo_mem_ext_pop_data,
  output logic [0:0] fifo_mem_ext_pop_ready,
  /* Array: array_88e69[1 x b32] */
  output logic [0:0] array_array_88e69_w,
  output logic [0:0] array_array_88e69_widx,
  output logic [31:0] array_array_88e69_d,

  // Module w
  output logic [7:0] w_counter_delta,
  input logic [0:0] w_counter_delta_ready,

  /* Array: array_88e65[1 x b5] */
  output logic [0:0] array_array_88e65_w,
  output logic [0:0] array_array_88e65_widx,
  output logic [4:0] array_array_88e65_d,

  // External FIFO w.rd
  output logic [0:0] fifo_w_rd_push_valid,
  output logic [4:0] fifo_w_rd_push_data,
  input logic [0:0] fifo_w_rd_push_ready,

  // External FIFO w.mdata
  output logic [0:0] fifo_w_mdata_push_valid,
  output logic [31:0] fifo_w_mdata_push_data,
  input logic [0:0] fifo_w_mdata_push_ready,

  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [1:0] var_91;
  assign var_91 = fifo_mem_ext_pop_data;


  assign fifo_mem_ext_pop_ready = executed;
  logic [31:0] var_93;
  assign var_93 = fifo_result_pop_data;


  assign fifo_result_pop_ready = executed;
  logic [4:0] var_95;
  assign var_95 = fifo_rd_pop_data;


  assign fifo_rd_pop_ready = executed;
  logic [0:0] var_170;
  assign var_170 = fifo_rdata_pop_valid;


  logic [31:0] var_102;
  assign var_102 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed && (var_170);
  always_ff @(posedge clk) if (executed && (var_170))$display("%t\t[m]\t\tmem.rdata        | 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_102);

  logic [0:0] var_112;
  assign var_112 = var_95 != 5'd0;


  always_ff @(posedge clk) if (executed && (var_170 && var_112))$display("%t\t[m]\t\tmem.bypass       | x%02d = 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_95, var_102);

  logic [0:0] var_129;
  assign var_129 = ~$signed(var_170);


  logic [31:0] var_140;
  assign var_140 = fifo_rdata_pop_data;


  logic [31:0] var_143;
  assign var_143 = var_170 ? var_140 : 32'd0;


  logic [0:0] var_148;
  assign var_148 = var_143[7:7];


  logic [23:0] var_154;
  assign var_154 = var_148 ? 24'd16777215 : 24'd0;


  logic [0:0] var_159;
  assign var_159 = var_91[1:1];


  logic [7:0] var_4606;
  assign var_4606 = var_143[7:0];


  logic [31:0] var_167;
  assign var_167 = {24'd0, var_4606};


  logic [31:0] var_174;
  assign var_174 = {var_154, var_4606};


  logic [31:0] var_177;
  assign var_177 = var_159 ? var_167 : var_174;


  logic [31:0] var_183;
  assign var_183 = var_170 ? var_143 : var_93;


  logic [0:0] var_187;
  assign var_187 = var_91[0:0];


  logic [31:0] var_191;
  assign var_191 = var_187 ? var_177 : var_183;


  assign w_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_w_rd_push_valid = executed;
  assign fifo_w_rd_push_data = var_95;

  assign fifo_w_mdata_push_valid = executed;
  assign fifo_w_mdata_push_data = var_191;

  // Gather Array writes
  assign array_array_88e65_w = (executed) && (((var_170)) || ((var_129)));
    assign array_array_88e65_d = ({ 5 { (var_170) } } & var_95) | ({ 5 { (var_129) } } & 5'd0);
    assign array_array_88e65_widx = ({ 1 { (var_170) } } & 1'd0) | ({ 1 { (var_129) } } & 1'd0);

    assign array_array_88e69_w = (executed) && (((var_170 && var_112)));
    assign array_array_88e69_d = ({ 32 { (var_170 && var_112) } } & var_102);
    assign array_array_88e69_widx = ({ 1 { (var_170 && var_112) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // m


module driver (
  input logic clk,
  input logic rst_n,
  // Module f
  output logic [7:0] f_counter_delta,
  input logic [0:0] f_counter_delta_ready,

  /* Array: array_94f45[1 x i1] */
  input logic [0:0] array_array_94f45_q,
  output logic [0:0] array_array_94f45_w,
  output logic [0:0] array_array_94f45_widx,
  output logic [0:0] array_array_94f45_d,


  // Module memuser_87e91
  output logic [7:0] memuser_87e91_counter_delta,
  input logic [0:0] memuser_87e91_counter_delta_ready,

  output logic [0:0] expose_var_4365,
  output logic [0:0] expose_var_4365_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_181;
  assign var_181 = array_array_94f45_q[0:0];


  logic [0:0] var_4365;
  assign var_4365 = var_181;
  assign expose_var_4365 = var_4365;
  assign expose_var_4365_valid = executed && 1;


  logic [0:0] var_4370;
  assign var_4370 = $signed(var_181) == 1'd1;


  logic [0:0] var_4388;
  assign var_4388 = $signed(var_181) == 1'd0;


  assign f_counter_delta = executed ? { 7'b0, |(var_4388) } : 0;

  assign memuser_87e91_counter_delta = executed ? { 7'b0, |(var_4370) } : 0;

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_94f45_w = (executed) && (((var_4370)));
    assign array_array_94f45_d = ({ 1 { (var_4370) } } & 1'd0);
    assign array_array_94f45_widx = ({ 1 { (var_4370) } } & 1'd0);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // driver


module icache (
  input logic clk,
  input logic rst_n,

  /* Array: array_8dcd9[65536 x b32] */
  /* /home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.exe */

  // External FIFO d.rdata
  output logic [0:0] fifo_d_rdata_push_valid,
  output logic [31:0] fifo_d_rdata_push_data,
  input logic [0:0] fifo_d_rdata_push_ready,


  // Declare upstream executed signals
  input logic [0:0] F1_executed,
  input logic [0:0] var_4444,
  input logic [0:0] var_4444_valid,
  input logic [15:0] var_4451,
  input logic [0:0] var_4451_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_4532;
  assign var_4532 = dataout;
  // Gather FIFO pushes
  assign fifo_d_rdata_push_valid = (executed) && (((var_4444)));
  assign fifo_d_rdata_push_data = ({ 32 { (var_4444) } } & var_4532);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_8dcd9_w;
  logic [31:0] array_array_8dcd9_d;
  logic [15:0] array_array_8dcd9_widx;
  assign array_array_8dcd9_w = (executed) && (((1'd0)));
  assign array_array_8dcd9_d = ({ 32 { (1'd0) } } & 32'd0);
  assign array_array_8dcd9_widx = var_4451;


  memory_blackbox_array_8dcd9 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(16)     
    ) memory_blackbox_array_8dcd9(
    .clk     (clk), 
    .address (array_array_8dcd9_widx), 
    .wd      (array_array_8dcd9_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_8dcd9_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = F1_executed;
  assign expose_executed = executed;
endmodule // icache



`ifdef SYNTHESIS
(* blackbox *)
`endif
module memory_blackbox_array_8dcd9 #(
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
          $readmemh("/home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.exe", mem);
      end
        always @ (posedge clk) begin
            if (write & banksel) begin
                mem[address] <= wd;
            end
        end
    
        assign dataout = (read & banksel) ? mem[address] : {DATA_WIDTH{1'b0}};
    
    endmodule
              
module W1 (
  input logic clk,
  input logic rst_n,

  /* Array: array_88e51[1 x b32] */
  input logic [31:0] array_array_88e51_q,
  output logic [0:0] array_array_88e51_w,
  output logic [0:0] array_array_88e51_widx,
  output logic [31:0] array_array_88e51_d,


  // Declare upstream executed signals
  input logic [0:0] w_executed,
  input logic [0:0] e_executed,
  input logic [4:0] var_370,
  input logic [0:0] var_370_valid,
  input logic [4:0] var_71,
  input logic [0:0] var_71_valid,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_4539;
  assign var_4539 = var_370_valid;


  logic [4:0] var_4541;
  assign var_4541 = var_4539 ? var_370 : 5'd0;


  logic [0:0] var_4545;
  assign var_4545 = var_71_valid;


  logic [4:0] var_4547;
  assign var_4547 = var_4545 ? var_71 : 5'd0;


  logic [0:0] var_4551;
  assign var_4551 = var_4541 != 5'd0;


  logic [31:0] var_4554;
  assign var_4554 = 32'd1 << var_4541;


  logic [31:0] var_4557;
  assign var_4557 = var_4551 ? var_4554 : 32'd0;


  logic [0:0] var_4561;
  assign var_4561 = var_4547 != 5'd0;


  logic [31:0] var_4564;
  assign var_4564 = 32'd1 << var_4547;


  logic [31:0] var_4567;
  assign var_4567 = var_4561 ? var_4564 : 32'd0;


  always_ff @(posedge clk) if (executed)$display("%t\t[W1]\t\townning: %02d      | releasing: %02d|",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4541, var_4547);

  logic [31:0] var_4576;
  assign var_4576 = array_array_88e51_q[31:0];


  logic [31:0] var_4579;
  assign var_4579 = var_4576 ^ var_4557;


  logic [31:0] var_4582;
  assign var_4582 = var_4579 ^ var_4567;


  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_88e51_w = executed;
    assign array_array_88e51_d = var_4582;
    assign array_array_88e51_widx = 1'd0;

    assign executed = e_executed || w_executed;
  assign expose_executed = executed;
endmodule // W1


module f (
  input logic clk,
  input logic rst_n,
  /* Array: array_88e41[1 x b32] */
  input logic [31:0] array_array_88e41_q,

  output logic [31:0] expose_var_68,
  output logic [0:0] expose_var_68_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_68;
  assign var_68 = array_array_88e41_q[31:0];
  assign expose_var_68 = var_68;
  assign expose_var_68_valid = executed && 1;


  // Gather FIFO pushes
  // Gather Array writes
  assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // f


module dcache (
  input logic clk,
  input logic rst_n,
  /* Array: array_8d8e9[65536 x b32] */
  /* /home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.data */


  // External FIFO m.rdata
  output logic [0:0] fifo_m_rdata_push_valid,
  output logic [31:0] fifo_m_rdata_push_data,
  input logic [0:0] fifo_m_rdata_push_ready,




  // Declare upstream executed signals
  input logic [0:0] e_executed,
  input logic [15:0] var_891,
  input logic [0:0] var_891_valid,
  input logic [0:0] var_796,
  input logic [0:0] var_796_valid,
  input logic [31:0] var_558,
  input logic [0:0] var_558_valid,
  input logic [0:0] var_788,
  input logic [0:0] var_788_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_4515;
  assign var_4515 = dataout;
  // Gather FIFO pushes
  assign fifo_m_rdata_push_valid = (executed) && (((var_788)));
  assign fifo_m_rdata_push_data = ({ 32 { (var_788) } } & var_4515);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_8d8e9_w;
  logic [31:0] array_array_8d8e9_d;
  logic [15:0] array_array_8d8e9_widx;
  assign array_array_8d8e9_w = (executed) && (((var_796)));
  assign array_array_8d8e9_d = ({ 32 { (var_796) } } & var_558);
  assign array_array_8d8e9_widx = var_891;


  memory_blackbox_array_8d8e9 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(16)     
    ) memory_blackbox_array_8d8e9(
    .clk     (clk), 
    .address (array_array_8d8e9_widx), 
    .wd      (array_array_8d8e9_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_8d8e9_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = e_executed;
  assign expose_executed = executed;
endmodule // dcache



`ifdef SYNTHESIS
(* blackbox *)
`endif
module memory_blackbox_array_8d8e9 #(
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
          $readmemh("/home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.data", mem);
      end
        always @ (posedge clk) begin
            if (write & banksel) begin
                mem[address] <= wd;
            end
        end
    
        assign dataout = (read & banksel) ? mem[address] : {DATA_WIDTH{1'b0}};
    
    endmodule
              
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

  // External FIFO m.result
  output logic [0:0] fifo_m_result_push_valid,
  output logic [31:0] fifo_m_result_push_data,
  input logic [0:0] fifo_m_result_push_ready,

  // Module m
  output logic [7:0] m_counter_delta,
  input logic [0:0] m_counter_delta_ready,

  /* Array: array_88e61[1 x b32] */
  input logic [31:0] array_array_88e61_q,
  output logic [0:0] array_array_88e61_w,
  output logic [0:0] array_array_88e61_widx,
  output logic [31:0] array_array_88e61_d,

  // External FIFO m.mem_ext
  output logic [0:0] fifo_m_mem_ext_push_valid,
  output logic [1:0] fifo_m_mem_ext_push_data,
  input logic [0:0] fifo_m_mem_ext_push_ready,

  /* Array: array_88e55[32 x b32] */
  input logic [1023:0] array_array_88e55_q,

  /* Array: array_88e51[1 x b32] */
  input logic [31:0] array_array_88e51_q,

  /* Array: array_88e65[1 x b5] */
  input logic [4:0] array_array_88e65_q,

  /* Array: array_88e15[1 x b32] */
  input logic [31:0] array_array_88e15_q,

  // External FIFO m.rd
  output logic [0:0] fifo_m_rd_push_valid,
  output logic [4:0] fifo_m_rd_push_data,
  input logic [0:0] fifo_m_rd_push_ready,

  /* Array: array_8d829[1 x b1] */
  output logic [0:0] array_array_8d829_w,
  output logic [0:0] array_array_8d829_widx,
  output logic [0:0] array_array_8d829_d,

  /* Array: array_88e69[1 x b32] */
  input logic [31:0] array_array_88e69_q,

  /* Array: array_88e59[1 x b5] */
  input logic [4:0] array_array_88e59_q,
  output logic [0:0] array_array_88e59_w,
  output logic [0:0] array_array_88e59_widx,
  output logic [4:0] array_array_88e59_d,

  output logic [31:0] expose_var_558,
  output logic [0:0] expose_var_558_valid,
  output logic [0:0] expose_var_788,
  output logic [0:0] expose_var_788_valid,
  output logic [4:0] expose_var_370,
  output logic [0:0] expose_var_370_valid,
  output logic [0:0] expose_var_796,
  output logic [0:0] expose_var_796_valid,
  output logic [0:0] expose_var_344,
  output logic [0:0] expose_var_344_valid,
  output logic [31:0] expose_var_843,
  output logic [0:0] expose_var_843_valid,
  output logic [15:0] expose_var_891,
  output logic [0:0] expose_var_891_valid,
  output logic [0:0] var_344_exposed_o,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic [96:0] var_207;
  assign var_207 = fifo_signals_pop_data;


  logic [4:0] var_211;
  assign var_211 = var_207[96:92];


  logic [4:0] var_217;
  assign var_217 = var_207[90:86];


  logic [4:0] var_223;
  assign var_223 = var_207[84:80];


  logic [31:0] var_227;
  assign var_227 = array_array_88e51_q[31:0];


  logic [31:0] var_230;
  assign var_230 = var_227 >> var_211;


  logic [31:0] var_233;
  assign var_233 = ~var_230;


  logic [0:0] var_235;
  assign var_235 = var_233[0:0];


  logic [4:0] var_730;
  assign var_730 = array_array_88e59_q[4:0];


  logic [0:0] var_242;
  assign var_242 = var_730 == var_211;


  logic [0:0] var_245;
  assign var_245 = var_235 | var_242;


  logic [4:0] var_661;
  assign var_661 = array_array_88e65_q[4:0];


  logic [0:0] var_251;
  assign var_251 = var_661 == var_211;


  logic [0:0] var_254;
  assign var_254 = var_245 | var_251;


  logic [0:0] var_258;
  assign var_258 = var_207[91:91];


  logic [0:0] var_262;
  assign var_262 = ~var_258;


  logic [0:0] var_264;
  assign var_264 = var_254 | var_262;


  logic [31:0] var_267;
  assign var_267 = var_227 >> var_217;


  logic [31:0] var_270;
  assign var_270 = ~var_267;


  logic [0:0] var_272;
  assign var_272 = var_270[0:0];


  logic [0:0] var_279;
  assign var_279 = var_730 == var_217;


  logic [0:0] var_282;
  assign var_282 = var_272 | var_279;


  logic [0:0] var_288;
  assign var_288 = var_661 == var_217;


  logic [0:0] var_291;
  assign var_291 = var_282 | var_288;


  logic [0:0] var_295;
  assign var_295 = var_207[85:85];


  logic [0:0] var_299;
  assign var_299 = ~var_295;


  logic [0:0] var_301;
  assign var_301 = var_291 | var_299;


  logic [31:0] var_304;
  assign var_304 = var_227 >> var_223;


  logic [31:0] var_307;
  assign var_307 = ~var_304;


  logic [0:0] var_309;
  assign var_309 = var_307[0:0];


  logic [0:0] var_316;
  assign var_316 = var_730 == var_223;


  logic [0:0] var_319;
  assign var_319 = var_309 | var_316;


  logic [0:0] var_325;
  assign var_325 = var_661 == var_223;


  logic [0:0] var_328;
  assign var_328 = var_319 | var_325;


  logic [0:0] var_332;
  assign var_332 = var_207[79:79];


  logic [0:0] var_336;
  assign var_336 = ~var_332;


  logic [0:0] var_338;
  assign var_338 = var_328 | var_336;


  logic [0:0] var_341;
  assign var_341 = var_264 & var_301;


  logic [0:0] var_344;
  assign var_344 = var_341 & var_338;
  assign expose_var_344 = var_344;
  assign expose_var_344_valid = executed && 1;

  assign var_344_exposed_o = var_344;

  logic [0:0] var_347;
  assign var_347 = ~var_344;


  logic [31:0] var_352;
  assign var_352 = fifo_fetch_addr_pop_data;


  always_ff @(posedge clk) if (1'b1 && (var_347))$display("%t\t[e]\t\tpc: 0x%08x   | rs1-x%02d: %d       | rs2-x%02d: %d   | rd-x%02d: %d | backlogged",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_352, var_211, var_264, var_217, var_301, var_223, var_338);

  logic executed;
  logic [96:0] var_366;
  assign var_366 = fifo_signals_pop_data;


  assign fifo_signals_pop_ready = executed;
  logic [31:0] var_368;
  assign var_368 = fifo_fetch_addr_pop_data;


  assign fifo_fetch_addr_pop_ready = executed;
  logic [4:0] var_370;
  assign var_370 = var_366[84:80];
  assign expose_var_370 = var_370;
  assign expose_var_370_valid = executed && 1;


  logic [0:0] var_374;
  assign var_374 = var_366[91:91];


  logic [0:0] var_720;
  assign var_720 = var_366[40:40];


  logic [0:0] var_383;
  assign var_383 = var_374 & var_720;


  logic [31:0] var_847;
  assign var_847 = var_366[72:41];


  logic [0:0] var_393;
  assign var_393 = var_847 == 32'd1;


  logic [0:0] var_400;
  assign var_400 = var_847 == 32'd0;


  logic [0:0] var_403;
  assign var_403 = var_393 | var_400;


  logic [0:0] var_406;
  assign var_406 = var_383 & var_403;


  logic [15:0] var_600;
  assign var_600 = var_366[37:22];


  logic [0:0] var_416;
  assign var_416 = var_600 == 16'd0;


  logic [0:0] var_419;
  assign var_419 = var_406 & var_416;


  always_ff @(posedge clk) if (executed && (var_419))$display("%t\t[e]\t\tebreak | halt | ecall",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
);


`ifndef SYNTHESIS
  always_ff @(posedge clk) if (executed && (var_419)) $finish();
`endif
  logic [0:0] var_687;
  assign var_687 = var_366[4:4];


  logic [0:0] var_832;
  assign var_832 = var_366[3:3];


  logic [0:0] var_439;
  assign var_439 = var_687 & var_832;


  logic [0:0] var_446;
  assign var_446 = var_439 & var_720;


  logic [0:0] var_453;
  assign var_453 = var_847 == 32'd0;


  logic [0:0] var_456;
  assign var_456 = var_446 & var_453;


  logic [15:0] var_562;
  assign var_562 = var_366[21:6];


  logic [0:0] var_466;
  assign var_466 = var_562 == 16'd2048;


  logic [0:0] var_469;
  assign var_469 = var_456 & var_466;


  logic [0:0] var_477;
  assign var_477 = var_600 == 16'd1;


  logic [0:0] var_480;
  assign var_480 = var_469 & var_477;


  always_ff @(posedge clk) if (executed && (var_480))$display("%t\t[e]\t\ttrap",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
);


`ifndef SYNTHESIS
  always_ff @(posedge clk) if (executed && (var_480)) $finish();
`endif
  logic [31:0] var_490;
  assign var_490 = 31 == var_211 ? array_array_88e55_q[1023:992] : (30 == var_211 ? array_array_88e55_q[991:960] : (29 == var_211 ? array_array_88e55_q[959:928] : (28 == var_211 ? array_array_88e55_q[927:896] : (27 == var_211 ? array_array_88e55_q[895:864] : (26 == var_211 ? array_array_88e55_q[863:832] : (25 == var_211 ? array_array_88e55_q[831:800] : (24 == var_211 ? array_array_88e55_q[799:768] : (23 == var_211 ? array_array_88e55_q[767:736] : (22 == var_211 ? array_array_88e55_q[735:704] : (21 == var_211 ? array_array_88e55_q[703:672] : (20 == var_211 ? array_array_88e55_q[671:640] : (19 == var_211 ? array_array_88e55_q[639:608] : (18 == var_211 ? array_array_88e55_q[607:576] : (17 == var_211 ? array_array_88e55_q[575:544] : (16 == var_211 ? array_array_88e55_q[543:512] : (15 == var_211 ? array_array_88e55_q[511:480] : (14 == var_211 ? array_array_88e55_q[479:448] : (13 == var_211 ? array_array_88e55_q[447:416] : (12 == var_211 ? array_array_88e55_q[415:384] : (11 == var_211 ? array_array_88e55_q[383:352] : (10 == var_211 ? array_array_88e55_q[351:320] : (9 == var_211 ? array_array_88e55_q[319:288] : (8 == var_211 ? array_array_88e55_q[287:256] : (7 == var_211 ? array_array_88e55_q[255:224] : (6 == var_211 ? array_array_88e55_q[223:192] : (5 == var_211 ? array_array_88e55_q[191:160] : (4 == var_211 ? array_array_88e55_q[159:128] : (3 == var_211 ? array_array_88e55_q[127:96] : (2 == var_211 ? array_array_88e55_q[95:64] : (1 == var_211 ? array_array_88e55_q[63:32] : (0 == var_211 ? array_array_88e55_q[31:0] : ('x))))))))))))))))))))))))))))))));


  logic [0:0] var_496;
  assign var_496 = var_661 == var_211;


  logic [31:0] var_694;
  assign var_694 = array_array_88e69_q[31:0];


  logic [31:0] var_502;
  assign var_502 = var_496 ? var_694 : var_490;


  logic [0:0] var_509;
  assign var_509 = var_730 == var_211;


  logic [31:0] var_941;
  assign var_941 = array_array_88e61_q[31:0];


  logic [31:0] var_515;
  assign var_515 = var_509 ? var_941 : var_502;


  logic [0:0] var_519;
  assign var_519 = var_211 == 5'd0;


  logic [31:0] var_522;
  assign var_522 = var_519 ? 32'd0 : var_515;


  logic [31:0] var_526;
  assign var_526 = 31 == var_217 ? array_array_88e55_q[1023:992] : (30 == var_217 ? array_array_88e55_q[991:960] : (29 == var_217 ? array_array_88e55_q[959:928] : (28 == var_217 ? array_array_88e55_q[927:896] : (27 == var_217 ? array_array_88e55_q[895:864] : (26 == var_217 ? array_array_88e55_q[863:832] : (25 == var_217 ? array_array_88e55_q[831:800] : (24 == var_217 ? array_array_88e55_q[799:768] : (23 == var_217 ? array_array_88e55_q[767:736] : (22 == var_217 ? array_array_88e55_q[735:704] : (21 == var_217 ? array_array_88e55_q[703:672] : (20 == var_217 ? array_array_88e55_q[671:640] : (19 == var_217 ? array_array_88e55_q[639:608] : (18 == var_217 ? array_array_88e55_q[607:576] : (17 == var_217 ? array_array_88e55_q[575:544] : (16 == var_217 ? array_array_88e55_q[543:512] : (15 == var_217 ? array_array_88e55_q[511:480] : (14 == var_217 ? array_array_88e55_q[479:448] : (13 == var_217 ? array_array_88e55_q[447:416] : (12 == var_217 ? array_array_88e55_q[415:384] : (11 == var_217 ? array_array_88e55_q[383:352] : (10 == var_217 ? array_array_88e55_q[351:320] : (9 == var_217 ? array_array_88e55_q[319:288] : (8 == var_217 ? array_array_88e55_q[287:256] : (7 == var_217 ? array_array_88e55_q[255:224] : (6 == var_217 ? array_array_88e55_q[223:192] : (5 == var_217 ? array_array_88e55_q[191:160] : (4 == var_217 ? array_array_88e55_q[159:128] : (3 == var_217 ? array_array_88e55_q[127:96] : (2 == var_217 ? array_array_88e55_q[95:64] : (1 == var_217 ? array_array_88e55_q[63:32] : (0 == var_217 ? array_array_88e55_q[31:0] : ('x))))))))))))))))))))))))))))))));


  logic [0:0] var_532;
  assign var_532 = var_661 == var_217;


  logic [31:0] var_538;
  assign var_538 = var_532 ? var_694 : var_526;


  logic [0:0] var_545;
  assign var_545 = var_730 == var_217;


  logic [31:0] var_551;
  assign var_551 = var_545 ? var_941 : var_538;


  logic [0:0] var_555;
  assign var_555 = var_217 == 5'd0;


  logic [31:0] var_558;
  assign var_558 = var_555 ? 32'd0 : var_551;
  assign expose_var_558 = var_558;
  assign expose_var_558_valid = executed && 1;


  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\tmem_bypass.reg: x%02d | .data: %08x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_661, var_694);

  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\texe_bypass.reg: x%02d | .data: %08x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_730, var_941);

  logic [0:0] var_573;
  assign var_573 = var_366[73:73];


  logic [0:0] var_593;
  assign var_593 = var_832 | var_573;


  logic [31:0] var_596;
  assign var_596 = var_593 ? var_368 : var_522;


  logic [31:0] var_608;
  assign var_608 = var_720 ? var_847 : var_558;


  logic [31:0] var_612;
  assign var_612 = var_596;


  logic [31:0] var_614;
  assign var_614 = var_608;


  logic [31:0] var_616;
  assign var_616 = $signed(var_612) + $signed(var_614);


  logic [31:0] var_619;
  assign var_619 = var_616;


  logic [31:0] var_716;
  assign var_716 = var_522;


  logic [31:0] var_659;
  assign var_659 = var_558;


  logic [0:0] var_625;
  assign var_625 = $signed(var_716) < $signed(var_659);


  logic [31:0] var_628;
  assign var_628 = var_625 ? 32'd1 : 32'd0;


  logic [0:0] var_632;
  assign var_632 = var_522 == var_558;


  logic [31:0] var_635;
  assign var_635 = var_632 ? 32'd1 : 32'd0;


  logic [0:0] var_639;
  assign var_639 = var_522 < var_558;


  logic [31:0] var_642;
  assign var_642 = var_639 ? 32'd1 : 32'd0;


  logic [4:0] var_576;
  assign var_576 = var_608[4:0];


  logic [4:0] var_652;
  assign var_652 = var_576;


  logic [31:0] var_654;
  assign var_654 = $signed(var_716) >>> $signed(var_652);


  logic [31:0] var_657;
  assign var_657 = var_654;


  logic [31:0] var_663;
  assign var_663 = $signed(var_716) - $signed(var_659);


  logic [31:0] var_666;
  assign var_666 = var_663;


  logic [31:0] var_668;
  assign var_668 = var_522 ^ var_608;


  logic [31:0] var_671;
  assign var_671 = var_522 | var_558;


  logic [31:0] var_674;
  assign var_674 = var_522 | var_608;


  logic [31:0] var_677;
  assign var_677 = var_522 & var_608;


  logic [31:0] var_684;
  assign var_684 = var_522 << var_576;


  logic [31:0] var_691;
  assign var_691 = var_522 >> var_576;


  logic [31:0] var_698;
  assign var_698 = ({32{var_600[0] == 1'b1}} & var_619) | ({32{var_600[1] == 1'b1}} & var_666) | ({32{var_600[2] == 1'b1}} & var_668) | ({32{var_600[3] == 1'b1}} & var_671) | ({32{var_600[4] == 1'b1}} & var_677) | ({32{var_600[5] == 1'b1}} & var_684) | ({32{var_600[6] == 1'b1}} & 0) | ({32{var_600[7] == 1'b1}} & var_657) | ({32{var_600[8] == 1'b1}} & var_635) | ({32{var_600[9] == 1'b1}} & var_628) | ({32{var_600[10] == 1'b1}} & var_642) | ({32{var_600[11] == 1'b1}} & 1) | ({32{var_600[12] == 1'b1}} & var_691) | ({32{var_600[13] == 1'b1}} & var_674) | ({32{var_600[14] == 1'b1}} & 0) | ({32{var_600[15] == 1'b1}} & 0);


  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\tpc: 0x%08x   |is_offset_br: %d| is_pc_calc: %d|",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_368, var_832, var_573);

  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\t0x%08x       | a: %08x  | b: %08x   | imm: %08x | result: %08x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_600, var_522, var_558, var_847, var_698);

  always_ff @(posedge clk) if (executed)$display("%t\t[e]\t\t0x%08x       |a.a:%08x  |a.b:%08x   | res: %08x |",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_600, var_596, var_608, var_698);

  logic [31:0] var_753;
  assign var_753 = ({32{var_562[0] == 1'b1}} & var_619) | ({32{var_562[1] == 1'b1}} & var_666) | ({32{var_562[2] == 1'b1}} & var_668) | ({32{var_562[3] == 1'b1}} & var_671) | ({32{var_562[4] == 1'b1}} & var_677) | ({32{var_562[5] == 1'b1}} & var_684) | ({32{var_562[6] == 1'b1}} & 0) | ({32{var_562[7] == 1'b1}} & var_657) | ({32{var_562[8] == 1'b1}} & var_635) | ({32{var_562[9] == 1'b1}} & var_628) | ({32{var_562[10] == 1'b1}} & var_642) | ({32{var_562[11] == 1'b1}} & 1) | ({32{var_562[12] == 1'b1}} & var_691) | ({32{var_562[13] == 1'b1}} & var_674) | ({32{var_562[14] == 1'b1}} & 0) | ({32{var_562[15] == 1'b1}} & 0);


  logic [0:0] var_772;
  assign var_772 = var_366[5:5];


  logic [31:0] var_776;
  assign var_776 = ~var_753;


  logic [31:0] var_778;
  assign var_778 = var_772 ? var_776 : var_753;


  logic [1:0] var_749;
  assign var_749 = var_366[39:38];


  logic [0:0] var_788;
  assign var_788 = var_749[0:0];
  assign expose_var_788 = var_788;
  assign expose_var_788_valid = executed && 1;


  logic [0:0] var_796;
  assign var_796 = var_749[1:1];
  assign expose_var_796 = var_796;
  assign expose_var_796_valid = executed && 1;


  logic [0:0] var_800;
  assign var_800 = ~var_788;


  logic [0:0] var_4385;
  assign var_4385 = var_370 != 5'd0;


  logic [0:0] var_805;
  assign var_805 = var_800 & var_4385;


  logic [4:0] var_808;
  assign var_808 = var_805 ? var_370 : 5'd0;


  logic [31:0] var_816;
  assign var_816 = var_805 ? var_698 : 32'd0;


  logic [31:0] var_824;
  assign var_824 = var_368;


  logic [31:0] var_827;
  assign var_827 = $signed(var_824) + 32'd4;


  logic [31:0] var_830;
  assign var_830 = var_827;


  logic [0:0] var_792;
  assign var_792 = var_778[0:0];


  logic [31:0] var_843;
  assign var_843 = var_792 ? var_698 : var_830;
  assign expose_var_843 = var_843;
  assign expose_var_843_valid = executed && (var_687);


  always_ff @(posedge clk) if (executed && (var_687))$display("%t\t[e]\t\tcondition: %d.a.b | a: %08x  | b: %08x   |",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_792, var_698, var_830);

  logic [0:0] var_862;
  assign var_862 = var_788 | var_796;


  logic [31:0] var_865;
  assign var_865 = var_698;


  logic [31:0] var_867;
  assign var_867 = array_array_88e15_q[31:0];


  logic [31:0] var_870;
  assign var_870 = var_867;


  logic [31:0] var_873;
  assign var_873 = var_862 ? var_870 : 32'd0;


  logic [31:0] var_877;
  assign var_877 = var_865 - var_873;


  logic [31:0] var_880;
  assign var_880 = var_877;


  logic [15:0] var_884;
  assign var_884 = var_880[17:2];


  logic [15:0] var_888;
  assign var_888 = var_884;


  logic [15:0] var_891;
  assign var_891 = var_862 ? var_888 : 16'd0;
  assign expose_var_891 = var_891;
  assign expose_var_891_valid = executed && 1;


  always_ff @(posedge clk) if (executed && (var_788))$display("%t\t[e]\t\tmem-read         | addr: 0x%05x| line: 0x%05x |",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_698, var_891);

  always_ff @(posedge clk) if (executed && (var_796))$display("%t\t[e]\t\tmem-write        | addr: 0x%05x| line: 0x%05x | value: 0x%08x | wdada: 0x%08x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_698, var_891, var_522, var_558);

  logic [0:0] var_913;
  assign var_913 = var_366[2:2];


  logic [31:0] var_917;
  assign var_917 = var_913 ? var_830 : var_698;


  logic [1:0] var_921;
  assign var_921 = var_366[1:0];


  always_ff @(posedge clk) if (executed && (var_4385))$display("%t\t[e]\t\town x%02d          |",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_370);

  assign m_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_m_rd_push_valid = executed;
  assign fifo_m_rd_push_data = var_370;

  assign fifo_m_result_push_valid = executed;
  assign fifo_m_result_push_data = var_917;

  assign fifo_m_mem_ext_push_valid = executed;
  assign fifo_m_mem_ext_push_data = var_921;

  // Gather Array writes
  assign array_array_88e59_w = executed;
    assign array_array_88e59_d = var_808;
    assign array_array_88e59_widx = 1'd0;

    assign array_array_88e61_w = executed;
    assign array_array_88e61_d = var_816;
    assign array_array_88e61_widx = 1'd0;

    assign array_array_8d829_w = (executed) && (((var_687)));
    assign array_array_8d829_d = ({ 1 { (var_687) } } & 1'd0);
    assign array_array_8d829_widx = ({ 1 { (var_687) } } & 1'd0);

    assign executed = counter_pop_valid && (var_344);
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // e


module init_cache (
  input logic clk,
  input logic rst_n,
  // External FIFO memuser_87e91.rdata
  output logic [0:0] fifo_memuser_87e91_rdata_push_valid,
  output logic [31:0] fifo_memuser_87e91_rdata_push_data,
  input logic [0:0] fifo_memuser_87e91_rdata_push_ready,

  /* Array: array_94f55[32 x b32] */
  /* /home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.init */


  // Declare upstream executed signals
  input logic [0:0] driver_executed,
  input logic [0:0] var_4365,
  input logic [0:0] var_4365_valid,
  output logic expose_executed);

  logic executed;
  logic [31:0] dataout;
  logic [31:0] var_4599;
  assign var_4599 = dataout;
  // Gather FIFO pushes
  assign fifo_memuser_87e91_rdata_push_valid = (executed) && (((var_4365)));
  assign fifo_memuser_87e91_rdata_push_data = ({ 32 { (var_4365) } } & var_4599);

  // Gather Array writes
  // this is Mem Array 
  logic array_array_94f55_w;
  logic [31:0] array_array_94f55_d;
  logic [4:0] array_array_94f55_widx;
  assign array_array_94f55_w = (executed) && (((1'd0)));
  assign array_array_94f55_d = ({ 32 { (1'd0) } } & 32'd0);
  assign array_array_94f55_widx = 5'd0;


  memory_blackbox_array_94f55 #(
        .DATA_WIDTH(32),   
        .ADDR_WIDTH(5)     
    ) memory_blackbox_array_94f55(
    .clk     (clk), 
    .address (array_array_94f55_widx), 
    .wd      (array_array_94f55_d), 
    .banksel (1'd1),    
    .read    (1'd1), 
    .write   (array_array_94f55_w), 
    .dataout (dataout), 
    .rst_n   (rst_n)
    );  
          
  assign executed = driver_executed;
  assign expose_executed = executed;
endmodule // init_cache



`ifdef SYNTHESIS
(* blackbox *)
`endif
module memory_blackbox_array_94f55 #(
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
          $readmemh("/home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.init", mem);
      end
        always @ (posedge clk) begin
            if (write & banksel) begin
                mem[address] <= wd;
            end
        end
    
        assign dataout = (read & banksel) ? mem[address] : {DATA_WIDTH{1'b0}};
    
    endmodule
              
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
  /* Array: array_88e55[32 x b32] */
  output logic [0:0] array_array_88e55_w,
  output logic [4:0] array_array_88e55_widx,
  output logic [31:0] array_array_88e55_d,

  output logic [4:0] expose_var_71,
  output logic [0:0] expose_var_71_valid,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [4:0] var_71;
  assign var_71 = fifo_rd_pop_data;
  assign expose_var_71 = var_71;
  assign expose_var_71_valid = executed && 1;


  assign fifo_rd_pop_ready = executed;
  logic [31:0] var_73;
  assign var_73 = fifo_mdata_pop_data;


  assign fifo_mdata_pop_ready = executed;
  logic [0:0] var_76;
  assign var_76 = var_71 != 5'd0;


  always_ff @(posedge clk) if (executed && (var_76))$display("%t\t[w]\t\twriteback        | x%02d          | 0x%08x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_71, var_73);

  // Gather FIFO pushes
  // Gather Array writes
  assign array_array_88e55_w = (executed) && (((var_76)));
    assign array_array_88e55_d = ({ 32 { (var_76) } } & var_73);
    assign array_array_88e55_widx = ({ 5 { (var_76) } } & var_71);

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // w


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
  // External FIFO e.signals
  output logic [0:0] fifo_e_signals_push_valid,
  output logic [96:0] fifo_e_signals_push_data,
  input logic [0:0] fifo_e_signals_push_ready,

  // Module e
  output logic [7:0] e_counter_delta,
  input logic [0:0] e_counter_delta_ready,

  /* Array: array_8d829[1 x b1] */
  output logic [0:0] array_array_8d829_w,
  output logic [0:0] array_array_8d829_widx,
  output logic [0:0] array_array_8d829_d,

  // External FIFO e.fetch_addr
  output logic [0:0] fifo_e_fetch_addr_push_valid,
  output logic [31:0] fifo_e_fetch_addr_push_data,
  input logic [0:0] fifo_e_fetch_addr_push_ready,

  output logic [0:0] expose_var_4164,
  output logic [0:0] expose_var_4164_valid,
  output logic [0:0] var_4358_exposed_o,
  // self.event_q
  input logic counter_pop_valid,
  input logic counter_delta_ready,
  output logic counter_pop_ready,
  output logic expose_executed);

  logic executed;
  logic [31:0] var_951;
  assign var_951 = fifo_rdata_pop_data;


  assign fifo_rdata_pop_ready = executed;
  logic [31:0] var_953;
  assign var_953 = fifo_fetch_addr_pop_data;


  assign fifo_fetch_addr_pop_ready = executed;
  always_ff @(posedge clk) if (executed)$display("%t\t[d]\t\traw: 0x%08x  | addr: 0x%05x |",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_951, var_953);

  logic [6:0] var_4234;
  assign var_4234 = var_951[6:0];


  logic [0:0] var_965;
  assign var_965 = var_4234 == 7'd111;


  logic [0:0] var_1065;
  assign var_1065 = 1'd0 | var_965;


  logic [15:0] var_974;
  assign var_974 = var_965 ? 16'd1 : 16'd0;


  logic [15:0] var_978;
  assign var_978 = 16'd0 | var_974;


  logic [15:0] var_981;
  assign var_981 = var_965 ? 16'd2048 : 16'd0;


  logic [15:0] var_985;
  assign var_985 = 16'd0 | var_981;


  logic [0:0] var_988;
  assign var_988 = var_965 ? 1'd0 : 1'd0;


  logic [0:0] var_992;
  assign var_992 = 1'd0 | var_988;


  logic [4:0] var_4047;
  assign var_4047 = var_951[11:7];


  logic [0:0] var_4358;
  assign var_4358 = var_951[31:31];

  assign var_4358_exposed_o = var_4358;

  logic [7:0] var_4100;
  assign var_4100 = var_951[19:12];


  logic [0:0] var_1147;
  assign var_1147 = var_951[20:20];


  logic [9:0] var_4156;
  assign var_4156 = var_951[30:21];


  logic [8:0] var_1024;
  assign var_1024 = {var_4358, var_4100};


  logic [9:0] var_1027;
  assign var_1027 = {var_1024, var_1147};


  logic [19:0] var_1030;
  assign var_1030 = {var_1027, var_4156};


  logic [20:0] var_1033;
  assign var_1033 = {var_1030, 1'd0};


  always_ff @(posedge clk) if (executed && (var_965))$display("%t\t[d]\t\tj.jal.1101111    | rd: x%02d      |               |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1033);

  logic [0:0] var_1049;
  assign var_1049 = var_4234 == 7'd55;


  logic [0:0] var_1052;
  assign var_1052 = 1'd0 | var_1049;


  logic [0:0] var_1055;
  assign var_1055 = var_1065 | var_1049;


  logic [15:0] var_3460;
  assign var_3460 = var_1049 ? 16'd1 : 16'd0;


  logic [15:0] var_1062;
  assign var_1062 = var_978 | var_3460;


  logic [15:0] var_1069;
  assign var_1069 = var_985 | var_3460;


  logic [0:0] var_1072;
  assign var_1072 = var_1049 ? 1'd0 : 1'd0;


  logic [0:0] var_1076;
  assign var_1076 = var_992 | var_1072;


  logic [0:0] var_1083;
  assign var_1083 = var_1065 | var_1049;


  logic [19:0] var_4201;
  assign var_4201 = var_951[31:12];


  always_ff @(posedge clk) if (executed && (var_1049))$display("%t\t[d]\t\tu.lui.0110111    | rd: x%02d      |               |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_4201);

  logic [0:0] var_1103;
  assign var_1103 = var_4234 == 7'd51;


  logic [2:0] var_4108;
  assign var_4108 = var_951[14:12];


  logic [0:0] var_1112;
  assign var_1112 = var_4108 == 3'd0;


  logic [6:0] var_2749;
  assign var_2749 = var_951[31:25];


  logic [0:0] var_1121;
  assign var_1121 = var_2749 == 7'd0;


  logic [0:0] var_1124;
  assign var_1124 = var_1103 & var_1112;


  logic [0:0] var_1127;
  assign var_1127 = var_1124 & var_1121;


  logic [0:0] var_1131;
  assign var_1131 = var_1127 & 1'd1;


  logic [0:0] var_1721;
  assign var_1721 = 1'd0 | var_1131;


  logic [0:0] var_1137;
  assign var_1137 = var_1055 | var_1131;


  logic [15:0] var_4261;
  assign var_4261 = var_1131 ? 16'd1 : 16'd0;


  logic [15:0] var_1144;
  assign var_1144 = var_1062 | var_4261;


  logic [15:0] var_1151;
  assign var_1151 = var_1069 | var_4261;


  logic [0:0] var_1154;
  assign var_1154 = var_1131 ? 1'd0 : 1'd0;


  logic [0:0] var_1158;
  assign var_1158 = var_1076 | var_1154;


  logic [0:0] var_1165;
  assign var_1165 = var_1083 | var_1131;


  logic [4:0] var_1181;
  assign var_1181 = var_951[19:15];


  logic [4:0] var_4104;
  assign var_4104 = var_951[24:20];


  always_ff @(posedge clk) if (executed && (var_1131))$display("%t\t[d]\t\tr.add.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_1197;
  assign var_1197 = var_4234 == 7'd51;


  logic [0:0] var_1204;
  assign var_1204 = var_4108 == 3'd0;


  logic [0:0] var_1212;
  assign var_1212 = var_2749 == 7'd32;


  logic [0:0] var_1215;
  assign var_1215 = var_1197 & var_1204;


  logic [0:0] var_1218;
  assign var_1218 = var_1215 & var_1212;


  logic [0:0] var_1221;
  assign var_1221 = var_1218 & 1'd1;


  logic [0:0] var_1224;
  assign var_1224 = var_1721 | var_1221;


  logic [0:0] var_1227;
  assign var_1227 = var_1137 | var_1221;


  logic [15:0] var_1231;
  assign var_1231 = var_1221 ? 16'd2 : 16'd0;


  logic [15:0] var_1235;
  assign var_1235 = var_1144 | var_1231;


  logic [15:0] var_1238;
  assign var_1238 = var_1221 ? 16'd1 : 16'd0;


  logic [15:0] var_1242;
  assign var_1242 = var_1151 | var_1238;


  logic [0:0] var_1245;
  assign var_1245 = var_1221 ? 1'd0 : 1'd0;


  logic [0:0] var_1249;
  assign var_1249 = var_1158 | var_1245;


  logic [0:0] var_1256;
  assign var_1256 = var_1165 | var_1221;


  logic [0:0] var_1263;
  assign var_1263 = var_1721 | var_1221;


  logic [0:0] var_1270;
  assign var_1270 = var_1721 | var_1221;


  always_ff @(posedge clk) if (executed && (var_1221))$display("%t\t[d]\t\tr.sub.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_1286;
  assign var_1286 = var_4234 == 7'd51;


  logic [0:0] var_1294;
  assign var_1294 = var_4108 == 3'd6;


  logic [0:0] var_1301;
  assign var_1301 = var_2749 == 7'd0;


  logic [0:0] var_1304;
  assign var_1304 = var_1286 & var_1294;


  logic [0:0] var_1307;
  assign var_1307 = var_1304 & var_1301;


  logic [0:0] var_1310;
  assign var_1310 = var_1307 & 1'd1;


  logic [0:0] var_1313;
  assign var_1313 = var_1224 | var_1310;


  logic [0:0] var_1316;
  assign var_1316 = var_1227 | var_1310;


  logic [15:0] var_1320;
  assign var_1320 = var_1310 ? 16'd8 : 16'd0;


  logic [15:0] var_1324;
  assign var_1324 = var_1235 | var_1320;


  logic [15:0] var_1327;
  assign var_1327 = var_1310 ? 16'd1 : 16'd0;


  logic [15:0] var_1331;
  assign var_1331 = var_1242 | var_1327;


  logic [0:0] var_1334;
  assign var_1334 = var_1310 ? 1'd0 : 1'd0;


  logic [0:0] var_1338;
  assign var_1338 = var_1249 | var_1334;


  logic [0:0] var_1345;
  assign var_1345 = var_1256 | var_1310;


  logic [0:0] var_1352;
  assign var_1352 = var_1263 | var_1310;


  logic [0:0] var_1359;
  assign var_1359 = var_1270 | var_1310;


  always_ff @(posedge clk) if (executed && (var_1310))$display("%t\t[d]\t\tr.or.0110011     | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_1376;
  assign var_1376 = var_4234 == 7'd103;


  logic [0:0] var_1383;
  assign var_1383 = var_4108 == 3'd0;


  logic [0:0] var_1386;
  assign var_1386 = var_1376 & var_1383;


  logic [0:0] var_1389;
  assign var_1389 = var_1386 & 1'd1;


  logic [0:0] var_1392;
  assign var_1392 = var_1389 & 1'd1;


  logic [0:0] var_1395;
  assign var_1395 = 1'd0 | var_1392;


  logic [0:0] var_1398;
  assign var_1398 = var_1316 | var_1392;


  logic [15:0] var_1401;
  assign var_1401 = var_1392 ? 16'd1 : 16'd0;


  logic [15:0] var_1405;
  assign var_1405 = var_1324 | var_1401;


  logic [15:0] var_1408;
  assign var_1408 = var_1392 ? 16'd2048 : 16'd0;


  logic [15:0] var_1412;
  assign var_1412 = var_1331 | var_1408;


  logic [0:0] var_1415;
  assign var_1415 = var_1392 ? 1'd0 : 1'd0;


  logic [0:0] var_1419;
  assign var_1419 = var_1338 | var_1415;


  logic [0:0] var_1426;
  assign var_1426 = var_1345 | var_1392;


  logic [0:0] var_1433;
  assign var_1433 = var_1352 | var_1392;


  logic [11:0] var_2603;
  assign var_2603 = var_951[31:20];


  always_ff @(posedge clk) if (executed && (var_1392))$display("%t\t[d]\t\ti.jalr.1100111   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_1454;
  assign var_1454 = var_4234 == 7'd19;


  logic [0:0] var_1461;
  assign var_1461 = var_4108 == 3'd0;


  logic [0:0] var_1464;
  assign var_1464 = var_1454 & var_1461;


  logic [0:0] var_1467;
  assign var_1467 = var_1464 & 1'd1;


  logic [0:0] var_1470;
  assign var_1470 = var_1467 & 1'd1;


  logic [0:0] var_1473;
  assign var_1473 = var_1395 | var_1470;


  logic [0:0] var_1476;
  assign var_1476 = var_1398 | var_1470;


  logic [15:0] var_4197;
  assign var_4197 = var_1470 ? 16'd1 : 16'd0;


  logic [15:0] var_1483;
  assign var_1483 = var_1405 | var_4197;


  logic [15:0] var_1490;
  assign var_1490 = var_1412 | var_4197;


  logic [0:0] var_1493;
  assign var_1493 = var_1470 ? 1'd0 : 1'd0;


  logic [0:0] var_1497;
  assign var_1497 = var_1419 | var_1493;


  logic [0:0] var_1504;
  assign var_1504 = var_1426 | var_1470;


  logic [0:0] var_1511;
  assign var_1511 = var_1433 | var_1470;


  always_ff @(posedge clk) if (executed && (var_1470))$display("%t\t[d]\t\ti.addi.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_1531;
  assign var_1531 = var_4234 == 7'd19;


  logic [0:0] var_1539;
  assign var_1539 = var_4108 == 3'd4;


  logic [0:0] var_1542;
  assign var_1542 = var_1531 & var_1539;


  logic [0:0] var_1545;
  assign var_1545 = var_1542 & 1'd1;


  logic [0:0] var_1548;
  assign var_1548 = var_1545 & 1'd1;


  logic [0:0] var_1551;
  assign var_1551 = var_1473 | var_1548;


  logic [0:0] var_1554;
  assign var_1554 = var_1476 | var_1548;


  logic [15:0] var_1558;
  assign var_1558 = var_1548 ? 16'd4 : 16'd0;


  logic [15:0] var_1562;
  assign var_1562 = var_1483 | var_1558;


  logic [15:0] var_1565;
  assign var_1565 = var_1548 ? 16'd1 : 16'd0;


  logic [15:0] var_1569;
  assign var_1569 = var_1490 | var_1565;


  logic [0:0] var_1572;
  assign var_1572 = var_1548 ? 1'd0 : 1'd0;


  logic [0:0] var_1576;
  assign var_1576 = var_1497 | var_1572;


  logic [0:0] var_1583;
  assign var_1583 = var_1504 | var_1548;


  logic [0:0] var_1590;
  assign var_1590 = var_1511 | var_1548;


  always_ff @(posedge clk) if (executed && (var_1548))$display("%t\t[d]\t\ti.xori.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_1611;
  assign var_1611 = var_4234 == 7'd3;


  logic [0:0] var_1619;
  assign var_1619 = var_4108 == 3'd2;


  logic [0:0] var_1622;
  assign var_1622 = var_1611 & var_1619;


  logic [0:0] var_1625;
  assign var_1625 = var_1622 & 1'd1;


  logic [0:0] var_1628;
  assign var_1628 = var_1625 & 1'd1;


  logic [0:0] var_1631;
  assign var_1631 = var_1551 | var_1628;


  logic [0:0] var_1634;
  assign var_1634 = var_1554 | var_1628;


  logic [15:0] var_4160;
  assign var_4160 = var_1628 ? 16'd1 : 16'd0;


  logic [15:0] var_1641;
  assign var_1641 = var_1562 | var_4160;


  logic [15:0] var_1648;
  assign var_1648 = var_1569 | var_4160;


  logic [0:0] var_1651;
  assign var_1651 = var_1628 ? 1'd0 : 1'd0;


  logic [0:0] var_1655;
  assign var_1655 = var_1576 | var_1651;


  logic [0:0] var_1662;
  assign var_1662 = var_1583 | var_1628;


  logic [0:0] var_1669;
  assign var_1669 = var_1590 | var_1628;


  always_ff @(posedge clk) if (executed && (var_1628))$display("%t\t[d]\t\ti.lw.0000011     | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_1689;
  assign var_1689 = var_4234 == 7'd3;


  logic [0:0] var_1696;
  assign var_1696 = var_4108 == 3'd4;


  logic [0:0] var_1699;
  assign var_1699 = var_1689 & var_1696;


  logic [0:0] var_1702;
  assign var_1702 = var_1699 & 1'd1;


  logic [0:0] var_1705;
  assign var_1705 = var_1702 & 1'd1;


  logic [0:0] var_1708;
  assign var_1708 = var_1631 | var_1705;


  logic [0:0] var_1711;
  assign var_1711 = var_1634 | var_1705;


  logic [15:0] var_1486;
  assign var_1486 = var_1705 ? 16'd1 : 16'd0;


  logic [15:0] var_1718;
  assign var_1718 = var_1641 | var_1486;


  logic [15:0] var_1725;
  assign var_1725 = var_1648 | var_1486;


  logic [0:0] var_1728;
  assign var_1728 = var_1705 ? 1'd0 : 1'd0;


  logic [0:0] var_1732;
  assign var_1732 = var_1655 | var_1728;


  logic [0:0] var_1739;
  assign var_1739 = var_1662 | var_1705;


  logic [0:0] var_1746;
  assign var_1746 = var_1669 | var_1705;


  always_ff @(posedge clk) if (executed && (var_1705))$display("%t\t[d]\t\ti.lbu.0000011    | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_1767;
  assign var_1767 = var_4234 == 7'd115;


  logic [0:0] var_1774;
  assign var_1774 = var_4108 == 3'd0;


  logic [0:0] var_1782;
  assign var_1782 = var_2603 == 12'd1;


  logic [0:0] var_1785;
  assign var_1785 = var_1767 & var_1774;


  logic [0:0] var_1788;
  assign var_1788 = var_1785 & var_1782;


  logic [0:0] var_1791;
  assign var_1791 = var_1788 & 1'd1;


  logic [0:0] var_1794;
  assign var_1794 = var_1708 | var_1791;


  logic [0:0] var_1797;
  assign var_1797 = var_1711 | var_1791;


  logic [15:0] var_1800;
  assign var_1800 = var_1791 ? 16'd0 : 16'd0;


  logic [15:0] var_1804;
  assign var_1804 = var_1718 | var_1800;


  logic [15:0] var_1807;
  assign var_1807 = var_1791 ? 16'd1 : 16'd0;


  logic [15:0] var_1811;
  assign var_1811 = var_1725 | var_1807;


  logic [0:0] var_1814;
  assign var_1814 = var_1791 ? 1'd0 : 1'd0;


  logic [0:0] var_1818;
  assign var_1818 = var_1732 | var_1814;


  logic [0:0] var_1825;
  assign var_1825 = var_1739 | var_1791;


  logic [0:0] var_1832;
  assign var_1832 = var_1746 | var_1791;


  always_ff @(posedge clk) if (executed && (var_1791))$display("%t\t[d]\t\ti.ebreak.1110011 | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_1853;
  assign var_1853 = var_4234 == 7'd35;


  logic [0:0] var_1860;
  assign var_1860 = var_4108 == 3'd2;


  logic [0:0] var_1863;
  assign var_1863 = var_1853 & var_1860;


  logic [0:0] var_1866;
  assign var_1866 = 1'd0 | var_1863;


  logic [0:0] var_1869;
  assign var_1869 = var_1797 | var_1863;


  logic [15:0] var_1644;
  assign var_1644 = var_1863 ? 16'd1 : 16'd0;


  logic [15:0] var_1876;
  assign var_1876 = var_1804 | var_1644;


  logic [15:0] var_1883;
  assign var_1883 = var_1811 | var_1644;


  logic [0:0] var_1886;
  assign var_1886 = var_1863 ? 1'd0 : 1'd0;


  logic [0:0] var_1890;
  assign var_1890 = var_1818 | var_1886;


  logic [0:0] var_1897;
  assign var_1897 = var_1832 | var_1863;


  logic [0:0] var_1904;
  assign var_1904 = var_1359 | var_1863;


  logic [11:0] var_1915;
  assign var_1915 = {var_2749, var_4047};


  always_ff @(posedge clk) if (executed && (var_1863))$display("%t\t[d]\t\ts.sw.0100011     |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_1181, var_4104, var_1915);

  logic [0:0] var_1932;
  assign var_1932 = var_4234 == 7'd99;


  logic [0:0] var_1939;
  assign var_1939 = var_4108 == 3'd0;


  logic [0:0] var_1942;
  assign var_1942 = var_1932 & var_1939;


  logic [0:0] var_1945;
  assign var_1945 = 1'd0 | var_1942;


  logic [0:0] var_1948;
  assign var_1948 = var_1869 | var_1942;


  logic [15:0] var_1951;
  assign var_1951 = var_1942 ? 16'd1 : 16'd0;


  logic [15:0] var_1955;
  assign var_1955 = var_1876 | var_1951;


  logic [15:0] var_1959;
  assign var_1959 = var_1942 ? 16'd256 : 16'd0;


  logic [15:0] var_1963;
  assign var_1963 = var_1883 | var_1959;


  logic [0:0] var_1966;
  assign var_1966 = var_1942 ? 1'd0 : 1'd0;


  logic [0:0] var_1970;
  assign var_1970 = var_1890 | var_1966;


  logic [0:0] var_1977;
  assign var_1977 = var_1897 | var_1942;


  logic [0:0] var_1984;
  assign var_1984 = var_1904 | var_1942;


  logic [0:0] var_565;
  assign var_565 = var_951[7:7];


  logic [5:0] var_4257;
  assign var_4257 = var_951[30:25];


  logic [3:0] var_4055;
  assign var_4055 = var_951[11:8];


  logic [1:0] var_2004;
  assign var_2004 = {var_4358, var_565};


  logic [7:0] var_2007;
  assign var_2007 = {var_2004, var_4257};


  logic [11:0] var_2010;
  assign var_2010 = {var_2007, var_4055};


  logic [12:0] var_2013;
  assign var_2013 = {var_2010, 1'd0};


  always_ff @(posedge clk) if (executed && (var_1942))$display("%t\t[d]\t\tb.beq.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_1181, var_4104, var_2013);

  logic [0:0] var_2029;
  assign var_2029 = var_4234 == 7'd99;


  logic [0:0] var_2037;
  assign var_2037 = var_4108 == 3'd1;


  logic [0:0] var_2040;
  assign var_2040 = var_2029 & var_2037;


  logic [0:0] var_2043;
  assign var_2043 = var_1945 | var_2040;


  logic [0:0] var_2046;
  assign var_2046 = var_1948 | var_2040;


  logic [15:0] var_2049;
  assign var_2049 = var_2040 ? 16'd1 : 16'd0;


  logic [15:0] var_2053;
  assign var_2053 = var_1955 | var_2049;


  logic [15:0] var_2056;
  assign var_2056 = var_2040 ? 16'd256 : 16'd0;


  logic [15:0] var_2060;
  assign var_2060 = var_1963 | var_2056;


  logic [0:0] var_2063;
  assign var_2063 = var_2040 ? 1'd1 : 1'd0;


  logic [0:0] var_2067;
  assign var_2067 = var_1970 | var_2063;


  logic [0:0] var_2074;
  assign var_2074 = var_1977 | var_2040;


  logic [0:0] var_2081;
  assign var_2081 = var_1984 | var_2040;


  logic [1:0] var_2100;
  assign var_2100 = {var_4358, var_565};


  logic [7:0] var_2103;
  assign var_2103 = {var_2100, var_4257};


  logic [11:0] var_2106;
  assign var_2106 = {var_2103, var_4055};


  logic [12:0] var_2109;
  assign var_2109 = {var_2106, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2040))$display("%t\t[d]\t\tb.bne.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_1181, var_4104, var_2109);

  logic [0:0] var_2125;
  assign var_2125 = var_4234 == 7'd99;


  logic [0:0] var_2132;
  assign var_2132 = var_4108 == 3'd4;


  logic [0:0] var_2135;
  assign var_2135 = var_2125 & var_2132;


  logic [0:0] var_2138;
  assign var_2138 = var_2043 | var_2135;


  logic [0:0] var_2141;
  assign var_2141 = var_2046 | var_2135;


  logic [15:0] var_2144;
  assign var_2144 = var_2135 ? 16'd1 : 16'd0;


  logic [15:0] var_2148;
  assign var_2148 = var_2053 | var_2144;


  logic [15:0] var_2152;
  assign var_2152 = var_2135 ? 16'd512 : 16'd0;


  logic [15:0] var_2156;
  assign var_2156 = var_2060 | var_2152;


  logic [0:0] var_2159;
  assign var_2159 = var_2135 ? 1'd0 : 1'd0;


  logic [0:0] var_2163;
  assign var_2163 = var_2067 | var_2159;


  logic [0:0] var_2170;
  assign var_2170 = var_2074 | var_2135;


  logic [0:0] var_2177;
  assign var_2177 = var_2081 | var_2135;


  logic [1:0] var_2196;
  assign var_2196 = {var_4358, var_565};


  logic [7:0] var_2199;
  assign var_2199 = {var_2196, var_4257};


  logic [11:0] var_2202;
  assign var_2202 = {var_2199, var_4055};


  logic [12:0] var_2205;
  assign var_2205 = {var_2202, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2135))$display("%t\t[d]\t\tb.blt.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_1181, var_4104, var_2205);

  logic [0:0] var_2221;
  assign var_2221 = var_4234 == 7'd99;


  logic [0:0] var_2229;
  assign var_2229 = var_4108 == 3'd5;


  logic [0:0] var_2232;
  assign var_2232 = var_2221 & var_2229;


  logic [0:0] var_2235;
  assign var_2235 = var_2138 | var_2232;


  logic [0:0] var_2238;
  assign var_2238 = var_2141 | var_2232;


  logic [15:0] var_2241;
  assign var_2241 = var_2232 ? 16'd1 : 16'd0;


  logic [15:0] var_2245;
  assign var_2245 = var_2148 | var_2241;


  logic [15:0] var_2248;
  assign var_2248 = var_2232 ? 16'd512 : 16'd0;


  logic [15:0] var_2252;
  assign var_2252 = var_2156 | var_2248;


  logic [0:0] var_2255;
  assign var_2255 = var_2232 ? 1'd1 : 1'd0;


  logic [0:0] var_2259;
  assign var_2259 = var_2163 | var_2255;


  logic [0:0] var_2266;
  assign var_2266 = var_2170 | var_2232;


  logic [0:0] var_2273;
  assign var_2273 = var_2177 | var_2232;


  logic [1:0] var_2292;
  assign var_2292 = {var_4358, var_565};


  logic [7:0] var_2295;
  assign var_2295 = {var_2292, var_4257};


  logic [11:0] var_2298;
  assign var_2298 = {var_2295, var_4055};


  logic [12:0] var_2301;
  assign var_2301 = {var_2298, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2232))$display("%t\t[d]\t\tb.bge.1100011    |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_1181, var_4104, var_2301);

  logic [0:0] var_2317;
  assign var_2317 = var_4234 == 7'd99;


  logic [0:0] var_2325;
  assign var_2325 = var_4108 == 3'd7;


  logic [0:0] var_2328;
  assign var_2328 = var_2317 & var_2325;


  logic [0:0] var_2331;
  assign var_2331 = var_2235 | var_2328;


  logic [0:0] var_2334;
  assign var_2334 = var_2238 | var_2328;


  logic [15:0] var_2337;
  assign var_2337 = var_2328 ? 16'd1 : 16'd0;


  logic [15:0] var_2341;
  assign var_2341 = var_2245 | var_2337;


  logic [15:0] var_2345;
  assign var_2345 = var_2328 ? 16'd1024 : 16'd0;


  logic [15:0] var_2349;
  assign var_2349 = var_2252 | var_2345;


  logic [0:0] var_2352;
  assign var_2352 = var_2328 ? 1'd1 : 1'd0;


  logic [0:0] var_2356;
  assign var_2356 = var_2259 | var_2352;


  logic [0:0] var_2363;
  assign var_2363 = var_2266 | var_2328;


  logic [0:0] var_2370;
  assign var_2370 = var_2273 | var_2328;


  logic [1:0] var_2389;
  assign var_2389 = {var_4358, var_565};


  logic [7:0] var_2392;
  assign var_2392 = {var_2389, var_4257};


  logic [11:0] var_2395;
  assign var_2395 = {var_2392, var_4055};


  logic [12:0] var_2398;
  assign var_2398 = {var_2395, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2328))$display("%t\t[d]\t\tb.bgeu.1100011   |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_1181, var_4104, var_2398);

  logic [0:0] var_2414;
  assign var_2414 = var_4234 == 7'd99;


  logic [0:0] var_2421;
  assign var_2421 = var_4108 == 3'd6;


  logic [0:0] var_2424;
  assign var_2424 = var_2414 & var_2421;


  logic [0:0] var_2427;
  assign var_2427 = var_2331 | var_2424;


  logic [0:0] var_2430;
  assign var_2430 = var_2334 | var_2424;


  logic [15:0] var_2433;
  assign var_2433 = var_2424 ? 16'd1 : 16'd0;


  logic [15:0] var_2437;
  assign var_2437 = var_2341 | var_2433;


  logic [15:0] var_2440;
  assign var_2440 = var_2424 ? 16'd1024 : 16'd0;


  logic [15:0] var_2444;
  assign var_2444 = var_2349 | var_2440;


  logic [0:0] var_2447;
  assign var_2447 = var_2424 ? 1'd0 : 1'd0;


  logic [0:0] var_2451;
  assign var_2451 = var_2356 | var_2447;


  logic [0:0] var_2458;
  assign var_2458 = var_2363 | var_2424;


  logic [0:0] var_2465;
  assign var_2465 = var_2370 | var_2424;


  logic [1:0] var_2484;
  assign var_2484 = {var_4358, var_565};


  logic [7:0] var_2487;
  assign var_2487 = {var_2484, var_4257};


  logic [11:0] var_2490;
  assign var_2490 = {var_2487, var_4055};


  logic [12:0] var_2493;
  assign var_2493 = {var_2490, 1'd0};


  always_ff @(posedge clk) if (executed && (var_2424))$display("%t\t[d]\t\tb.bltu.1100011   |              | rs1: x%02d      | rs2: x%02d      |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_1181, var_4104, var_2493);

  logic [0:0] var_2509;
  assign var_2509 = var_4234 == 7'd115;


  logic [0:0] var_2516;
  assign var_2516 = var_4108 == 3'd2;


  logic [0:0] var_2519;
  assign var_2519 = var_2509 & var_2516;


  logic [0:0] var_2522;
  assign var_2522 = var_2519 & 1'd1;


  logic [0:0] var_2525;
  assign var_2525 = var_2522 & 1'd1;


  logic [0:0] var_2528;
  assign var_2528 = var_1794 | var_2525;


  logic [0:0] var_2531;
  assign var_2531 = var_2430 | var_2525;


  logic [15:0] var_2534;
  assign var_2534 = var_2525 ? 16'd8 : 16'd0;


  logic [15:0] var_2538;
  assign var_2538 = var_2437 | var_2534;


  logic [15:0] var_2541;
  assign var_2541 = var_2525 ? 16'd1 : 16'd0;


  logic [15:0] var_2545;
  assign var_2545 = var_2444 | var_2541;


  logic [0:0] var_2548;
  assign var_2548 = var_2525 ? 1'd0 : 1'd0;


  logic [0:0] var_2552;
  assign var_2552 = var_2451 | var_2548;


  logic [0:0] var_2559;
  assign var_2559 = var_1825 | var_2525;


  logic [0:0] var_2566;
  assign var_2566 = var_2458 | var_2525;


  always_ff @(posedge clk) if (executed && (var_2525))$display("%t\t[d]\t\ti.csrrs.1110011  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_2587;
  assign var_2587 = var_4234 == 7'd23;


  logic [0:0] var_2590;
  assign var_2590 = var_1052 | var_2587;


  logic [0:0] var_2593;
  assign var_2593 = var_2531 | var_2587;


  logic [15:0] var_1879;
  assign var_1879 = var_2587 ? 16'd1 : 16'd0;


  logic [15:0] var_2600;
  assign var_2600 = var_2538 | var_1879;


  logic [15:0] var_2607;
  assign var_2607 = var_2545 | var_1879;


  logic [0:0] var_2610;
  assign var_2610 = var_2587 ? 1'd0 : 1'd0;


  logic [0:0] var_2614;
  assign var_2614 = var_2552 | var_2610;


  logic [0:0] var_2621;
  assign var_2621 = var_2559 | var_2587;


  always_ff @(posedge clk) if (executed && (var_2587))$display("%t\t[d]\t\tu.auipc.0010111  | rd: x%02d      |               |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_4201);

  logic [0:0] var_2640;
  assign var_2640 = var_4234 == 7'd115;


  logic [0:0] var_2647;
  assign var_2647 = var_4108 == 3'd1;


  logic [0:0] var_2650;
  assign var_2650 = var_2640 & var_2647;


  logic [0:0] var_2653;
  assign var_2653 = var_2650 & 1'd1;


  logic [0:0] var_2656;
  assign var_2656 = var_2653 & 1'd1;


  logic [0:0] var_2659;
  assign var_2659 = var_2528 | var_2656;


  logic [0:0] var_2662;
  assign var_2662 = var_2593 | var_2656;


  logic [15:0] var_4152;
  assign var_4152 = var_2656 ? 16'd1 : 16'd0;


  logic [15:0] var_2669;
  assign var_2669 = var_2600 | var_4152;


  logic [15:0] var_2676;
  assign var_2676 = var_2607 | var_4152;


  logic [0:0] var_2679;
  assign var_2679 = var_2656 ? 1'd0 : 1'd0;


  logic [0:0] var_2683;
  assign var_2683 = var_2614 | var_2679;


  logic [0:0] var_2690;
  assign var_2690 = var_2621 | var_2656;


  logic [0:0] var_2697;
  assign var_2697 = var_2566 | var_2656;


  always_ff @(posedge clk) if (executed && (var_2656))$display("%t\t[d]\t\ti.csrrw.1110011  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_2717;
  assign var_2717 = var_4234 == 7'd115;


  logic [0:0] var_2724;
  assign var_2724 = var_4108 == 3'd5;


  logic [0:0] var_2727;
  assign var_2727 = var_2717 & var_2724;


  logic [0:0] var_2730;
  assign var_2730 = var_2727 & 1'd1;


  logic [0:0] var_2733;
  assign var_2733 = var_2730 & 1'd1;


  logic [0:0] var_2736;
  assign var_2736 = var_2659 | var_2733;


  logic [0:0] var_2739;
  assign var_2739 = var_2662 | var_2733;


  logic [15:0] var_1000;
  assign var_1000 = var_2733 ? 16'd1 : 16'd0;


  logic [15:0] var_2746;
  assign var_2746 = var_2669 | var_1000;


  logic [15:0] var_2753;
  assign var_2753 = var_2676 | var_1000;


  logic [0:0] var_2756;
  assign var_2756 = var_2733 ? 1'd0 : 1'd0;


  logic [0:0] var_2760;
  assign var_2760 = var_2683 | var_2756;


  logic [0:0] var_2767;
  assign var_2767 = var_2690 | var_2733;


  logic [0:0] var_2774;
  assign var_2774 = var_2697 | var_2733;


  always_ff @(posedge clk) if (executed && (var_2733))$display("%t\t[d]\t\ti.csrrwi.1110011 | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_2794;
  assign var_2794 = var_4234 == 7'd19;


  logic [0:0] var_2801;
  assign var_2801 = var_4108 == 3'd1;


  logic [5:0] var_2808;
  assign var_2808 = var_2603[11:6];


  logic [0:0] var_2813;
  assign var_2813 = var_2808 == 6'd0;


  logic [0:0] var_2816;
  assign var_2816 = var_2794 & var_2801;


  logic [0:0] var_2819;
  assign var_2819 = var_2816 & 1'd1;


  logic [0:0] var_2822;
  assign var_2822 = var_2819 & var_2813;


  logic [0:0] var_2825;
  assign var_2825 = var_2736 | var_2822;


  logic [0:0] var_2828;
  assign var_2828 = var_2739 | var_2822;


  logic [15:0] var_2832;
  assign var_2832 = var_2822 ? 16'd32 : 16'd0;


  logic [15:0] var_2836;
  assign var_2836 = var_2746 | var_2832;


  logic [15:0] var_2839;
  assign var_2839 = var_2822 ? 16'd1 : 16'd0;


  logic [15:0] var_2843;
  assign var_2843 = var_2753 | var_2839;


  logic [0:0] var_2846;
  assign var_2846 = var_2822 ? 1'd0 : 1'd0;


  logic [0:0] var_2850;
  assign var_2850 = var_2760 | var_2846;


  logic [0:0] var_2857;
  assign var_2857 = var_2767 | var_2822;


  logic [0:0] var_2864;
  assign var_2864 = var_2774 | var_2822;


  always_ff @(posedge clk) if (executed && (var_2822))$display("%t\t[d]\t\ti.slli.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_2884;
  assign var_2884 = var_4234 == 7'd51;


  logic [0:0] var_2891;
  assign var_2891 = var_4108 == 3'd1;


  logic [0:0] var_2898;
  assign var_2898 = var_2749 == 7'd0;


  logic [0:0] var_2901;
  assign var_2901 = var_2884 & var_2891;


  logic [0:0] var_2904;
  assign var_2904 = var_2901 & var_2898;


  logic [0:0] var_2907;
  assign var_2907 = var_2904 & 1'd1;


  logic [0:0] var_2910;
  assign var_2910 = var_1313 | var_2907;


  logic [0:0] var_2913;
  assign var_2913 = var_2828 | var_2907;


  logic [15:0] var_2916;
  assign var_2916 = var_2907 ? 16'd32 : 16'd0;


  logic [15:0] var_2920;
  assign var_2920 = var_2836 | var_2916;


  logic [15:0] var_2923;
  assign var_2923 = var_2907 ? 16'd1 : 16'd0;


  logic [15:0] var_2927;
  assign var_2927 = var_2843 | var_2923;


  logic [0:0] var_2930;
  assign var_2930 = var_2907 ? 1'd0 : 1'd0;


  logic [0:0] var_2934;
  assign var_2934 = var_2850 | var_2930;


  logic [0:0] var_2941;
  assign var_2941 = var_2857 | var_2907;


  logic [0:0] var_2948;
  assign var_2948 = var_2864 | var_2907;


  logic [0:0] var_2955;
  assign var_2955 = var_2465 | var_2907;


  always_ff @(posedge clk) if (executed && (var_2907))$display("%t\t[d]\t\tr.sll.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_2971;
  assign var_2971 = var_4234 == 7'd19;


  logic [0:0] var_2978;
  assign var_2978 = var_4108 == 3'd5;


  logic [5:0] var_2985;
  assign var_2985 = var_2603[11:6];


  logic [0:0] var_2990;
  assign var_2990 = var_2985 == 6'd16;


  logic [0:0] var_2993;
  assign var_2993 = var_2971 & var_2978;


  logic [0:0] var_2996;
  assign var_2996 = var_2993 & 1'd1;


  logic [0:0] var_2999;
  assign var_2999 = var_2996 & var_2990;


  logic [0:0] var_3002;
  assign var_3002 = var_2825 | var_2999;


  logic [0:0] var_3005;
  assign var_3005 = var_2913 | var_2999;


  logic [15:0] var_3009;
  assign var_3009 = var_2999 ? 16'd128 : 16'd0;


  logic [15:0] var_3013;
  assign var_3013 = var_2920 | var_3009;


  logic [15:0] var_3016;
  assign var_3016 = var_2999 ? 16'd1 : 16'd0;


  logic [15:0] var_3020;
  assign var_3020 = var_2927 | var_3016;


  logic [0:0] var_3023;
  assign var_3023 = var_2999 ? 1'd0 : 1'd0;


  logic [0:0] var_3027;
  assign var_3027 = var_2934 | var_3023;


  logic [0:0] var_3034;
  assign var_3034 = var_2941 | var_2999;


  logic [0:0] var_3041;
  assign var_3041 = var_2948 | var_2999;


  always_ff @(posedge clk) if (executed && (var_2999))$display("%t\t[d]\t\ti.srai.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_3061;
  assign var_3061 = var_4234 == 7'd19;


  logic [0:0] var_3068;
  assign var_3068 = var_4108 == 3'd5;


  logic [5:0] var_3075;
  assign var_3075 = var_2603[11:6];


  logic [0:0] var_3079;
  assign var_3079 = var_3075 == 6'd0;


  logic [0:0] var_3082;
  assign var_3082 = var_3061 & var_3068;


  logic [0:0] var_3085;
  assign var_3085 = var_3082 & 1'd1;


  logic [0:0] var_3088;
  assign var_3088 = var_3085 & var_3079;


  logic [0:0] var_3091;
  assign var_3091 = var_3002 | var_3088;


  logic [0:0] var_3094;
  assign var_3094 = var_3005 | var_3088;


  logic [15:0] var_3098;
  assign var_3098 = var_3088 ? 16'd4096 : 16'd0;


  logic [15:0] var_3102;
  assign var_3102 = var_3013 | var_3098;


  logic [15:0] var_3105;
  assign var_3105 = var_3088 ? 16'd1 : 16'd0;


  logic [15:0] var_3109;
  assign var_3109 = var_3020 | var_3105;


  logic [0:0] var_3112;
  assign var_3112 = var_3088 ? 1'd0 : 1'd0;


  logic [0:0] var_3116;
  assign var_3116 = var_3027 | var_3112;


  logic [0:0] var_3123;
  assign var_3123 = var_3034 | var_3088;


  logic [0:0] var_3130;
  assign var_3130 = var_3041 | var_3088;


  always_ff @(posedge clk) if (executed && (var_3088))$display("%t\t[d]\t\ti.srli.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_3150;
  assign var_3150 = var_4234 == 7'd51;


  logic [0:0] var_3158;
  assign var_3158 = var_4108 == 3'd3;


  logic [0:0] var_3165;
  assign var_3165 = var_2749 == 7'd0;


  logic [0:0] var_3168;
  assign var_3168 = var_3150 & var_3158;


  logic [0:0] var_3171;
  assign var_3171 = var_3168 & var_3165;


  logic [0:0] var_3174;
  assign var_3174 = var_3171 & 1'd1;


  logic [0:0] var_3177;
  assign var_3177 = var_2910 | var_3174;


  logic [0:0] var_3180;
  assign var_3180 = var_3094 | var_3174;


  logic [15:0] var_3183;
  assign var_3183 = var_3174 ? 16'd1024 : 16'd0;


  logic [15:0] var_3187;
  assign var_3187 = var_3102 | var_3183;


  logic [15:0] var_3190;
  assign var_3190 = var_3174 ? 16'd1 : 16'd0;


  logic [15:0] var_3194;
  assign var_3194 = var_3109 | var_3190;


  logic [0:0] var_3197;
  assign var_3197 = var_3174 ? 1'd0 : 1'd0;


  logic [0:0] var_3201;
  assign var_3201 = var_3116 | var_3197;


  logic [0:0] var_3208;
  assign var_3208 = var_3123 | var_3174;


  logic [0:0] var_3215;
  assign var_3215 = var_3130 | var_3174;


  logic [0:0] var_3222;
  assign var_3222 = var_2955 | var_3174;


  always_ff @(posedge clk) if (executed && (var_3174))$display("%t\t[d]\t\tr.sltu.0110011   | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_3238;
  assign var_3238 = var_4234 == 7'd51;


  logic [0:0] var_3245;
  assign var_3245 = var_4108 == 3'd5;


  logic [0:0] var_3252;
  assign var_3252 = var_2749 == 7'd0;


  logic [0:0] var_3255;
  assign var_3255 = var_3238 & var_3245;


  logic [0:0] var_3258;
  assign var_3258 = var_3255 & var_3252;


  logic [0:0] var_3261;
  assign var_3261 = var_3258 & 1'd1;


  logic [0:0] var_3264;
  assign var_3264 = var_3177 | var_3261;


  logic [0:0] var_3267;
  assign var_3267 = var_3180 | var_3261;


  logic [15:0] var_3270;
  assign var_3270 = var_3261 ? 16'd4096 : 16'd0;


  logic [15:0] var_3274;
  assign var_3274 = var_3187 | var_3270;


  logic [15:0] var_3277;
  assign var_3277 = var_3261 ? 16'd1 : 16'd0;


  logic [15:0] var_3281;
  assign var_3281 = var_3194 | var_3277;


  logic [0:0] var_3284;
  assign var_3284 = var_3261 ? 1'd0 : 1'd0;


  logic [0:0] var_3288;
  assign var_3288 = var_3201 | var_3284;


  logic [0:0] var_3295;
  assign var_3295 = var_3208 | var_3261;


  logic [0:0] var_3302;
  assign var_3302 = var_3215 | var_3261;


  logic [0:0] var_3309;
  assign var_3309 = var_3222 | var_3261;


  always_ff @(posedge clk) if (executed && (var_3261))$display("%t\t[d]\t\tr.srl.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_3325;
  assign var_3325 = var_4234 == 7'd51;


  logic [0:0] var_3332;
  assign var_3332 = var_4108 == 3'd5;


  logic [0:0] var_3339;
  assign var_3339 = var_2749 == 7'd32;


  logic [0:0] var_3342;
  assign var_3342 = var_3325 & var_3332;


  logic [0:0] var_3345;
  assign var_3345 = var_3342 & var_3339;


  logic [0:0] var_3348;
  assign var_3348 = var_3345 & 1'd1;


  logic [0:0] var_3351;
  assign var_3351 = var_3264 | var_3348;


  logic [0:0] var_3354;
  assign var_3354 = var_3267 | var_3348;


  logic [15:0] var_3357;
  assign var_3357 = var_3348 ? 16'd128 : 16'd0;


  logic [15:0] var_3361;
  assign var_3361 = var_3274 | var_3357;


  logic [15:0] var_3364;
  assign var_3364 = var_3348 ? 16'd1 : 16'd0;


  logic [15:0] var_3368;
  assign var_3368 = var_3281 | var_3364;


  logic [0:0] var_3371;
  assign var_3371 = var_3348 ? 1'd0 : 1'd0;


  logic [0:0] var_3375;
  assign var_3375 = var_3288 | var_3371;


  logic [0:0] var_3382;
  assign var_3382 = var_3295 | var_3348;


  logic [0:0] var_3389;
  assign var_3389 = var_3302 | var_3348;


  logic [0:0] var_3396;
  assign var_3396 = var_3309 | var_3348;


  always_ff @(posedge clk) if (executed && (var_3348))$display("%t\t[d]\t\tr.sra.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_3412;
  assign var_3412 = var_4234 == 7'd115;


  logic [0:0] var_3419;
  assign var_3419 = var_4108 == 3'd0;


  logic [0:0] var_3427;
  assign var_3427 = var_2749 == 7'd24;


  logic [0:0] var_3435;
  assign var_3435 = var_4104 == 5'd2;


  logic [0:0] var_3438;
  assign var_3438 = var_3412 & var_3419;


  logic [0:0] var_3441;
  assign var_3441 = var_3438 & var_3427;


  logic [0:0] var_3444;
  assign var_3444 = var_3441 & var_3435;


  logic [0:0] var_3447;
  assign var_3447 = var_3351 | var_3444;


  logic [0:0] var_3450;
  assign var_3450 = var_3354 | var_3444;


  logic [15:0] var_2672;
  assign var_2672 = var_3444 ? 16'd1 : 16'd0;


  logic [15:0] var_3457;
  assign var_3457 = var_3361 | var_2672;


  logic [15:0] var_3464;
  assign var_3464 = var_3368 | var_2672;


  logic [0:0] var_3467;
  assign var_3467 = var_3444 ? 1'd0 : 1'd0;


  logic [0:0] var_3471;
  assign var_3471 = var_3375 | var_3467;


  logic [0:0] var_3478;
  assign var_3478 = var_3382 | var_3444;


  logic [0:0] var_3485;
  assign var_3485 = var_3389 | var_3444;


  logic [0:0] var_3492;
  assign var_3492 = var_3396 | var_3444;


  always_ff @(posedge clk) if (executed && (var_3444))$display("%t\t[d]\t\tr.mret.1110011   | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_3509;
  assign var_3509 = var_4234 == 7'd15;


  logic [0:0] var_3516;
  assign var_3516 = var_4108 == 3'd0;


  logic [0:0] var_3519;
  assign var_3519 = var_3509 & var_3516;


  logic [0:0] var_3522;
  assign var_3522 = var_3519 & 1'd1;


  logic [0:0] var_3525;
  assign var_3525 = var_3522 & 1'd1;


  logic [0:0] var_3528;
  assign var_3528 = var_3091 | var_3525;


  logic [0:0] var_3531;
  assign var_3531 = var_3450 | var_3525;


  logic [15:0] var_4265;
  assign var_4265 = var_3525 ? 16'd1 : 16'd0;


  logic [15:0] var_3538;
  assign var_3538 = var_3457 | var_4265;


  logic [15:0] var_3545;
  assign var_3545 = var_3464 | var_4265;


  logic [0:0] var_3548;
  assign var_3548 = var_3525 ? 1'd0 : 1'd0;


  logic [0:0] var_3552;
  assign var_3552 = var_3471 | var_3548;


  logic [0:0] var_3559;
  assign var_3559 = var_3478 | var_3525;


  logic [0:0] var_3566;
  assign var_3566 = var_3485 | var_3525;


  always_ff @(posedge clk) if (executed && (var_3525))$display("%t\t[d]\t\ti.fence.0001111  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_3586;
  assign var_3586 = var_4234 == 7'd115;


  logic [0:0] var_3593;
  assign var_3593 = var_4108 == 3'd0;


  logic [0:0] var_3601;
  assign var_3601 = var_2603 == 12'd0;


  logic [0:0] var_3604;
  assign var_3604 = var_3586 & var_3593;


  logic [0:0] var_3607;
  assign var_3607 = var_3604 & var_3601;


  logic [0:0] var_3610;
  assign var_3610 = var_3607 & 1'd1;


  logic [0:0] var_3613;
  assign var_3613 = var_3528 | var_3610;


  logic [0:0] var_3616;
  assign var_3616 = var_3531 | var_3610;


  logic [15:0] var_3619;
  assign var_3619 = var_3610 ? 16'd0 : 16'd0;


  logic [15:0] var_3623;
  assign var_3623 = var_3538 | var_3619;


  logic [15:0] var_3626;
  assign var_3626 = var_3610 ? 16'd1 : 16'd0;


  logic [15:0] var_3630;
  assign var_3630 = var_3545 | var_3626;


  logic [0:0] var_3633;
  assign var_3633 = var_3610 ? 1'd0 : 1'd0;


  logic [0:0] var_3637;
  assign var_3637 = var_3552 | var_3633;


  logic [0:0] var_3644;
  assign var_3644 = var_3559 | var_3610;


  logic [0:0] var_3651;
  assign var_3651 = var_3566 | var_3610;


  always_ff @(posedge clk) if (executed && (var_3610))$display("%t\t[d]\t\ti.ecall.1110011  | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_3671;
  assign var_3671 = var_4234 == 7'd51;


  logic [0:0] var_3678;
  assign var_3678 = var_4108 == 3'd7;


  logic [0:0] var_3685;
  assign var_3685 = var_2749 == 7'd0;


  logic [0:0] var_3688;
  assign var_3688 = var_3671 & var_3678;


  logic [0:0] var_3691;
  assign var_3691 = var_3688 & var_3685;


  logic [0:0] var_3694;
  assign var_3694 = var_3691 & 1'd1;


  logic [0:0] var_3697;
  assign var_3697 = var_3447 | var_3694;


  logic [0:0] var_3700;
  assign var_3700 = var_3616 | var_3694;


  logic [15:0] var_3704;
  assign var_3704 = var_3694 ? 16'd16 : 16'd0;


  logic [15:0] var_3708;
  assign var_3708 = var_3623 | var_3704;


  logic [15:0] var_3711;
  assign var_3711 = var_3694 ? 16'd1 : 16'd0;


  logic [15:0] var_3715;
  assign var_3715 = var_3630 | var_3711;


  logic [0:0] var_3718;
  assign var_3718 = var_3694 ? 1'd0 : 1'd0;


  logic [0:0] var_3722;
  assign var_3722 = var_3637 | var_3718;


  logic [0:0] var_3729;
  assign var_3729 = var_3644 | var_3694;


  logic [0:0] var_3736;
  assign var_3736 = var_3651 | var_3694;


  logic [0:0] var_3743;
  assign var_3743 = var_3492 | var_3694;


  always_ff @(posedge clk) if (executed && (var_3694))$display("%t\t[d]\t\tr.and.0110011    | rd: x%02d      | rs1: x%02d      | rs2: x%02d      ",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_4104);

  logic [0:0] var_3759;
  assign var_3759 = var_4234 == 7'd19;


  logic [0:0] var_3766;
  assign var_3766 = var_4108 == 3'd7;


  logic [0:0] var_3769;
  assign var_3769 = var_3759 & var_3766;


  logic [0:0] var_3772;
  assign var_3772 = var_3769 & 1'd1;


  logic [0:0] var_3775;
  assign var_3775 = var_3772 & 1'd1;


  logic [0:0] var_3778;
  assign var_3778 = var_3613 | var_3775;


  logic [0:0] var_3781;
  assign var_3781 = var_3700 | var_3775;


  logic [15:0] var_3784;
  assign var_3784 = var_3775 ? 16'd16 : 16'd0;


  logic [15:0] var_3788;
  assign var_3788 = var_3708 | var_3784;


  logic [15:0] var_3791;
  assign var_3791 = var_3775 ? 16'd1 : 16'd0;


  logic [15:0] var_3795;
  assign var_3795 = var_3715 | var_3791;


  logic [0:0] var_3798;
  assign var_3798 = var_3775 ? 1'd0 : 1'd0;


  logic [0:0] var_3802;
  assign var_3802 = var_3722 | var_3798;


  logic [0:0] var_3809;
  assign var_3809 = var_3729 | var_3775;


  logic [0:0] var_3816;
  assign var_3816 = var_3736 | var_3775;


  always_ff @(posedge clk) if (executed && (var_3775))$display("%t\t[d]\t\ti.andi.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_3836;
  assign var_3836 = var_4234 == 7'd19;


  logic [0:0] var_3843;
  assign var_3843 = var_4108 == 3'd6;


  logic [0:0] var_3846;
  assign var_3846 = var_3836 & var_3843;


  logic [0:0] var_3849;
  assign var_3849 = var_3846 & 1'd1;


  logic [0:0] var_3852;
  assign var_3852 = var_3849 & 1'd1;


  logic [0:0] var_3855;
  assign var_3855 = var_3778 | var_3852;


  logic [0:0] var_3858;
  assign var_3858 = var_3781 | var_3852;


  logic [15:0] var_3862;
  assign var_3862 = var_3852 ? 16'd8192 : 16'd0;


  logic [15:0] var_3866;
  assign var_3866 = var_3788 | var_3862;


  logic [15:0] var_3869;
  assign var_3869 = var_3852 ? 16'd1 : 16'd0;


  logic [15:0] var_3873;
  assign var_3873 = var_3795 | var_3869;


  logic [0:0] var_3876;
  assign var_3876 = var_3852 ? 1'd0 : 1'd0;


  logic [0:0] var_3880;
  assign var_3880 = var_3802 | var_3876;


  logic [0:0] var_3887;
  assign var_3887 = var_3809 | var_3852;


  logic [0:0] var_3894;
  assign var_3894 = var_3816 | var_3852;


  always_ff @(posedge clk) if (executed && (var_3852))$display("%t\t[d]\t\ti.ori.0010011    | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_3914;
  assign var_3914 = var_4234 == 7'd19;


  logic [0:0] var_3921;
  assign var_3921 = var_4108 == 3'd4;


  logic [0:0] var_3924;
  assign var_3924 = var_3914 & var_3921;


  logic [0:0] var_3927;
  assign var_3927 = var_3924 & 1'd1;


  logic [0:0] var_3930;
  assign var_3930 = var_3927 & 1'd1;


  logic [0:0] var_3933;
  assign var_3933 = var_3855 | var_3930;


  logic [0:0] var_3936;
  assign var_3936 = var_3858 | var_3930;


  logic [15:0] var_3939;
  assign var_3939 = var_3930 ? 16'd4 : 16'd0;


  logic [15:0] var_3943;
  assign var_3943 = var_3866 | var_3939;


  logic [15:0] var_3946;
  assign var_3946 = var_3930 ? 16'd1 : 16'd0;


  logic [15:0] var_3950;
  assign var_3950 = var_3873 | var_3946;


  logic [0:0] var_3953;
  assign var_3953 = var_3930 ? 1'd0 : 1'd0;


  logic [0:0] var_3957;
  assign var_3957 = var_3880 | var_3953;


  logic [0:0] var_3964;
  assign var_3964 = var_3887 | var_3930;


  logic [0:0] var_3971;
  assign var_3971 = var_3894 | var_3930;


  always_ff @(posedge clk) if (executed && (var_3930))$display("%t\t[d]\t\ti.xori.0010011   | rd: x%02d      | rs1: x%02d      |               |imm: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4047, var_1181, var_2603);

  logic [0:0] var_3987;
  assign var_3987 = ~var_3936;


  always_ff @(posedge clk) if (executed && (var_3987))$display("%t\t[d]\t\tUnsupported instruction: opcode = 0x%x funct3: 0x%x funct7: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4234, var_4108, var_2749);

  always_ff @(posedge clk) if (executed && (var_3987)) assert(0);
  logic [0:0] var_4012;
  assign var_4012 = var_1628 | var_1705;


  logic [1:0] var_4015;
  assign var_4015 = {var_1863, var_4012};


  logic [1:0] var_4018;
  assign var_4018 = {var_1705, var_1705};


  logic [0:0] var_4021;
  assign var_4021 = var_2427 | var_1065;


  logic [0:0] var_4024;
  assign var_4024 = var_4021 | var_1791;


  logic [0:0] var_4027;
  assign var_4027 = var_4024 | var_1392;


  logic [0:0] var_4030;
  assign var_4030 = var_4027 | var_3444;


  logic [0:0] var_4033;
  assign var_4033 = var_2427 | var_965;


  logic [0:0] var_4036;
  assign var_4036 = var_1392 | var_965;


  logic [4:0] var_4043;
  assign var_4043 = var_3964 ? var_4047 : 5'd0;


  logic [4:0] var_4051;
  assign var_4051 = var_3971 ? var_1181 : 5'd0;


  logic [4:0] var_4059;
  assign var_4059 = var_3743 ? var_4104 : 5'd0;


  logic [0:0] var_4063;
  assign var_4063 = var_3933 | var_2590;


  logic [0:0] var_4066;
  assign var_4066 = var_4063 | var_2427;


  logic [0:0] var_4069;
  assign var_4069 = var_4066 | var_1065;


  logic [0:0] var_4072;
  assign var_4072 = var_4069 | var_1866;


  logic [0:0] var_4079;
  assign var_4079 = var_2603[11:11];


  logic [19:0] var_4085;
  assign var_4085 = var_4079 ? 20'd1048575 : 20'd0;


  logic [31:0] var_4089;
  assign var_4089 = {var_4085, var_2603};


  logic [31:0] var_4092;
  assign var_4092 = var_3933 ? var_4089 : 32'd0;


  logic [1:0] var_4112;
  assign var_4112 = {var_4358, var_565};


  logic [7:0] var_4115;
  assign var_4115 = {var_4112, var_4257};


  logic [11:0] var_4118;
  assign var_4118 = {var_4115, var_4055};


  logic [12:0] var_4121;
  assign var_4121 = {var_4118, 1'd0};


  logic [0:0] var_4124;
  assign var_4124 = var_4121[12:12];


  logic [18:0] var_4130;
  assign var_4130 = var_4124 ? 19'd524287 : 19'd0;


  logic [31:0] var_4134;
  assign var_4134 = {var_4130, var_4121};


  logic [31:0] var_4137;
  assign var_4137 = var_2427 ? var_4134 : var_4092;


  logic [31:0] var_4145;
  assign var_4145 = {12'd0, var_4201};


  logic [31:0] var_4148;
  assign var_4148 = var_2590 ? var_4145 : var_4137;


  logic [8:0] var_4168;
  assign var_4168 = {var_4358, var_4100};


  logic [9:0] var_4171;
  assign var_4171 = {var_4168, var_1147};


  logic [19:0] var_4174;
  assign var_4174 = {var_4171, var_4156};


  logic [20:0] var_4177;
  assign var_4177 = {var_4174, 1'd0};


  logic [0:0] var_4180;
  assign var_4180 = var_4177[20:20];


  logic [10:0] var_4186;
  assign var_4186 = var_4180 ? 11'd2047 : 11'd0;


  logic [31:0] var_4190;
  assign var_4190 = {var_4186, var_4177};


  logic [31:0] var_4193;
  assign var_4193 = var_1065 ? var_4190 : var_4148;


  logic [11:0] var_4205;
  assign var_4205 = {var_2749, var_4047};


  logic [0:0] var_4208;
  assign var_4208 = var_4205[11:11];


  logic [19:0] var_4212;
  assign var_4212 = var_4208 ? 20'd1048575 : 20'd0;


  logic [31:0] var_4216;
  assign var_4216 = {var_4212, var_4205};


  logic [31:0] var_4219;
  assign var_4219 = var_1866 ? var_4216 : var_4193;


  logic [31:0] var_4227;
  assign var_4227 = {var_4201, 12'd0};


  logic [31:0] var_4230;
  assign var_4230 = var_1049 ? var_4227 : var_4219;


  logic [31:0] var_4238;
  assign var_4238 = {var_4201, 12'd0};


  logic [31:0] var_4241;
  assign var_4241 = var_2587 ? var_4238 : var_4230;


  logic [0:0] var_4245;
  assign var_4245 = var_2525 | var_3444;


  logic [0:0] var_4248;
  assign var_4248 = var_2656 | var_2733;


  logic [0:0] var_4251;
  assign var_4251 = var_4245 | var_4248;


  always_ff @(posedge clk) if (executed && (var_4251))$display("%t\t[d]\t\tCSR instruction: opcode = 0x%x funct3: 0x%x csr_addr: 0x%x",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4234, var_4108, var_2603);

  logic [5:0] var_4275;
  assign var_4275 = {var_4051, var_3971};


  logic [10:0] var_4278;
  assign var_4278 = {var_4275, var_4059};


  logic [11:0] var_4281;
  assign var_4281 = {var_4278, var_3743};


  logic [16:0] var_4284;
  assign var_4284 = {var_4281, var_4043};


  logic [17:0] var_4287;
  assign var_4287 = {var_4284, var_3964};


  logic [18:0] var_4290;
  assign var_4290 = {var_4287, var_4245};


  logic [19:0] var_4293;
  assign var_4293 = {var_4290, var_4248};


  logic [20:0] var_4296;
  assign var_4296 = {var_4293, var_2525};


  logic [21:0] var_4299;
  assign var_4299 = {var_4296, var_2733};


  logic [22:0] var_4302;
  assign var_4302 = {var_4299, var_3444};


  logic [23:0] var_4305;
  assign var_4305 = {var_4302, var_2587};


  logic [55:0] var_4308;
  assign var_4308 = {var_4305, var_4241};


  logic [56:0] var_4311;
  assign var_4311 = {var_4308, var_4072};


  logic [58:0] var_4314;
  assign var_4314 = {var_4311, var_4015};


  logic [74:0] var_4317;
  assign var_4317 = {var_4314, var_3943};


  logic [90:0] var_4320;
  assign var_4320 = {var_4317, var_3950};


  logic [91:0] var_4323;
  assign var_4323 = {var_4320, var_3957};


  logic [92:0] var_4326;
  assign var_4326 = {var_4323, var_4030};


  logic [93:0] var_4329;
  assign var_4329 = {var_4326, var_4033};


  logic [94:0] var_4332;
  assign var_4332 = {var_4329, var_4036};


  logic [96:0] var_4335;
  assign var_4335 = {var_4332, var_4018};


  logic [0:0] var_4164;
  assign var_4164 = var_4335[4:4];
  assign expose_var_4164 = var_4164;
  assign expose_var_4164_valid = executed && 1;


  assign e_counter_delta = executed ? 1 : 0;

  // Gather FIFO pushes
  assign fifo_e_signals_push_valid = executed;
  assign fifo_e_signals_push_data = var_4335;

  assign fifo_e_fetch_addr_push_valid = executed;
  assign fifo_e_fetch_addr_push_data = var_953;

  // Gather Array writes
  assign array_array_8d829_w = executed;
    assign array_array_8d829_d = var_4164;
    assign array_array_8d829_widx = 1'd0;

    assign executed = counter_pop_valid;
  assign counter_pop_ready = executed;
  assign expose_executed = executed;
endmodule // d


module F1 (
  input logic clk,
  input logic rst_n,
  /* Array: array_8db41[1 x i8] */
  input logic [7:0] array_array_8db41_q,
  output logic [0:0] array_array_8db41_w,
  output logic [0:0] array_array_8db41_widx,
  output logic [7:0] array_array_8db41_d,


  // Module d
  output logic [7:0] d_counter_delta,
  input logic [0:0] d_counter_delta_ready,

  /* Array: array_88e41[1 x b32] */
  output logic [0:0] array_array_88e41_w,
  output logic [0:0] array_array_88e41_widx,
  output logic [31:0] array_array_88e41_d,

  /* Array: array_8d829[1 x b1] */
  input logic [0:0] array_array_8d829_q,





  // External FIFO d.fetch_addr
  output logic [0:0] fifo_d_fetch_addr_push_valid,
  output logic [31:0] fifo_d_fetch_addr_push_data,
  input logic [0:0] fifo_d_fetch_addr_push_ready,

  // Declare upstream executed signals
  input logic [0:0] f_executed,
  input logic [0:0] d_executed,
  input logic [0:0] e_executed,
  output logic [0:0] expose_var_4444,
  output logic [0:0] expose_var_4444_valid,
  output logic [15:0] expose_var_4451,
  output logic [0:0] expose_var_4451_valid,
  input logic [0:0] var_344,
  input logic [0:0] var_344_valid,
  input logic [31:0] var_68,
  input logic [0:0] var_68_valid,
  input logic [0:0] var_4164,
  input logic [0:0] var_4164_valid,
  input logic [31:0] var_843,
  input logic [0:0] var_843_valid,
  output logic expose_executed);

  logic executed;
  logic [0:0] var_4398;
  assign var_4398 = var_4164_valid;


  logic [0:0] var_4400;
  assign var_4400 = var_4398 ? var_4164 : 1'd0;


  logic [0:0] var_4404;
  assign var_4404 = array_array_8d829_q[0:0];


  logic [0:0] var_4407;
  assign var_4407 = var_4400 | var_4404;


  logic [0:0] var_4410;
  assign var_4410 = ~var_4407;


  logic [0:0] var_3541;
  assign var_3541 = var_843_valid;


  logic [0:0] var_4414;
  assign var_4414 = var_4410 | var_3541;


  logic [31:0] var_4419;
  assign var_4419 = var_3541 ? var_843 : var_68;


  logic [7:0] var_4423;
  assign var_4423 = array_array_8db41_q[7:0];


  logic [0:0] var_4426;
  assign var_4426 = var_344_valid;


  logic [0:0] var_4428;
  assign var_4428 = var_4426 ? var_344 : 1'd0;


  logic [7:0] var_4433;
  assign var_4433 = var_4428 ? 8'd1 : 8'd0;


  logic [7:0] var_4437;
  assign var_4437 = $signed(var_4423) - $signed(var_4433);


  logic [0:0] var_4441;
  assign var_4441 = $signed(var_4437) < 8'd2;


  logic [0:0] var_4444;
  assign var_4444 = var_4414 & var_4441;
  assign expose_var_4444 = var_4444;
  assign expose_var_4444_valid = executed && 1;


  logic [15:0] var_4447;
  assign var_4447 = var_4419[17:2];


  logic [15:0] var_4451;
  assign var_4451 = var_4447;
  assign expose_var_4451 = var_4451;
  assign expose_var_4451_valid = executed && 1;


  always_ff @(posedge clk) if (executed)$display("%t\t[F1]\t\ton_br: %d         | ex_by: %d     | fetch: %d      | addr: 0x%05x | ongoing: %d",
`ifndef SYNTHESIS
  $time - 200
`else
  $time
`endif
, var_4407, var_3541, var_4444, var_4419, var_4437);

  logic [31:0] var_4474;
  assign var_4474 = var_4419;


  logic [31:0] var_4476;
  assign var_4476 = $signed(var_4474) + 32'd4;


  logic [31:0] var_4479;
  assign var_4479 = var_4476;


  logic [7:0] var_4485;
  assign var_4485 = $signed(var_4437) + 8'd1;


  logic [0:0] var_4492;
  assign var_4492 = ~var_4444;


  assign d_counter_delta = executed ? { 7'b0, |(var_4444) } : 0;

  // Gather FIFO pushes
  assign fifo_d_fetch_addr_push_valid = (executed) && (((var_4444)));
  assign fifo_d_fetch_addr_push_data = ({ 32 { (var_4444) } } & var_4419);

  // Gather Array writes
  assign array_array_88e41_w = (executed) && (((var_4444)) || ((var_4492)));
    assign array_array_88e41_d = ({ 32 { (var_4444) } } & var_4479) | ({ 32 { (var_4492) } } & var_4419);
    assign array_array_88e41_widx = ({ 1 { (var_4444) } } & 1'd0) | ({ 1 { (var_4492) } } & 1'd0);

    assign array_array_8db41_w = (executed) && (((var_4444)) || ((var_4492)));
    assign array_array_8db41_d = ({ 8 { (var_4444) } } & var_4485) | ({ 8 { (var_4492) } } & var_4437);
    assign array_array_8db41_widx = ({ 1 { (var_4444) } } & 1'd0) | ({ 1 { (var_4492) } } & 1'd0);

    assign executed = e_executed || f_executed || d_executed;
  assign expose_executed = executed;
endmodule // F1

module top(
  output logic [31:0] array_array_88e51_exposed_o,
  output logic [0:0] array_array_8d829_exposed_o,
  output logic [31:0] array_array_88e41_exposed_o,
  output logic [0:0] var_4358_exposed_o,
  output logic [1023:0] array_array_88e55_exposed_o,
  output logic [31:0] array_array_88e15_exposed_o,
  input logic [31:0] array_array_88e15_exposed_i,
  input logic [0:0] array_array_88e15_exposed_i_valid,
  output logic [0:0] var_344_exposed_o,

  input logic clk,
  input logic rst_n
);

//Array: array_94f55, Init File Path: /home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.init
//Array: array_8d8e9, Init File Path: /home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.data
//Array: array_8dcd9, Init File Path: /home/wengj/assassyn/examples/minor-cpu/src/.workspace//workload.exe
  /* Array: array_88e55[32 x b32] */
  logic [1023:0] array_array_88e55_q;
  logic [31:0] array_array_88e55_driver_w_d;
  logic [0:0] array_array_88e55_driver_w_w;
  logic [4:0] array_array_88e55_driver_w_widx;
  assign array_array_88e55_exposed_o = array_array_88e55_q;
  logic [31:0] array_array_88e55_d;
  logic [4:0] array_array_88e55_widx;
  logic [0:0] array_array_88e55_w;
  assign array_array_88e55_d = ({ 32 { array_array_88e55_driver_w_w } } & array_array_88e55_driver_w_d);
  assign array_array_88e55_widx = ({ 5 { array_array_88e55_driver_w_w } } & array_array_88e55_driver_w_widx);
  assign array_array_88e55_w = array_array_88e55_driver_w_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e55_q <= 1024'd0;
    else if (array_array_88e55_w) begin

      case (array_array_88e55_widx)
        0 : array_array_88e55_q[31:0] <= array_array_88e55_d;
        1 : array_array_88e55_q[63:32] <= array_array_88e55_d;
        2 : array_array_88e55_q[95:64] <= array_array_88e55_d;
        3 : array_array_88e55_q[127:96] <= array_array_88e55_d;
        4 : array_array_88e55_q[159:128] <= array_array_88e55_d;
        5 : array_array_88e55_q[191:160] <= array_array_88e55_d;
        6 : array_array_88e55_q[223:192] <= array_array_88e55_d;
        7 : array_array_88e55_q[255:224] <= array_array_88e55_d;
        8 : array_array_88e55_q[287:256] <= array_array_88e55_d;
        9 : array_array_88e55_q[319:288] <= array_array_88e55_d;
        10 : array_array_88e55_q[351:320] <= array_array_88e55_d;
        11 : array_array_88e55_q[383:352] <= array_array_88e55_d;
        12 : array_array_88e55_q[415:384] <= array_array_88e55_d;
        13 : array_array_88e55_q[447:416] <= array_array_88e55_d;
        14 : array_array_88e55_q[479:448] <= array_array_88e55_d;
        15 : array_array_88e55_q[511:480] <= array_array_88e55_d;
        16 : array_array_88e55_q[543:512] <= array_array_88e55_d;
        17 : array_array_88e55_q[575:544] <= array_array_88e55_d;
        18 : array_array_88e55_q[607:576] <= array_array_88e55_d;
        19 : array_array_88e55_q[639:608] <= array_array_88e55_d;
        20 : array_array_88e55_q[671:640] <= array_array_88e55_d;
        21 : array_array_88e55_q[703:672] <= array_array_88e55_d;
        22 : array_array_88e55_q[735:704] <= array_array_88e55_d;
        23 : array_array_88e55_q[767:736] <= array_array_88e55_d;
        24 : array_array_88e55_q[799:768] <= array_array_88e55_d;
        25 : array_array_88e55_q[831:800] <= array_array_88e55_d;
        26 : array_array_88e55_q[863:832] <= array_array_88e55_d;
        27 : array_array_88e55_q[895:864] <= array_array_88e55_d;
        28 : array_array_88e55_q[927:896] <= array_array_88e55_d;
        29 : array_array_88e55_q[959:928] <= array_array_88e55_d;
        30 : array_array_88e55_q[991:960] <= array_array_88e55_d;
        31 : array_array_88e55_q[1023:992] <= array_array_88e55_d;
        default: ;
      endcase
    end
  /* Array: array_8db41[1 x i8] */
  logic [7:0] array_array_8db41_q;
  logic [7:0] array_array_8db41_driver_F1_d;
  logic [0:0] array_array_8db41_driver_F1_w;
  logic [0:0] array_array_8db41_driver_F1_widx;
  logic [7:0] array_array_8db41_d;
  logic [0:0] array_array_8db41_widx;
  logic [0:0] array_array_8db41_w;
  assign array_array_8db41_d = ({ 8 { array_array_8db41_driver_F1_w } } & array_array_8db41_driver_F1_d);
  assign array_array_8db41_widx = ({ 1 { array_array_8db41_driver_F1_w } } & array_array_8db41_driver_F1_widx);
  assign array_array_8db41_w = array_array_8db41_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_8db41_q[7:0] <= 8'd0;
    end
    else if (array_array_8db41_w) begin

      case (array_array_8db41_widx)
        0 : array_array_8db41_q[7:0] <= array_array_8db41_d;
        default: ;
      endcase
    end
  /* Array: array_8d829[1 x b1] */
  logic [0:0] array_array_8d829_q;
  logic [0:0] array_array_8d829_driver_e_d;
  logic [0:0] array_array_8d829_driver_e_w;
  logic [0:0] array_array_8d829_driver_e_widx;
  logic [0:0] array_array_8d829_driver_d_d;
  logic [0:0] array_array_8d829_driver_d_w;
  logic [0:0] array_array_8d829_driver_d_widx;
  assign array_array_8d829_exposed_o = array_array_8d829_q;
  logic [0:0] array_array_8d829_d;
  logic [0:0] array_array_8d829_widx;
  logic [0:0] array_array_8d829_w;
  assign array_array_8d829_d = ({ 1 { array_array_8d829_driver_e_w } } & array_array_8d829_driver_e_d) | ({ 1 { array_array_8d829_driver_d_w } } & array_array_8d829_driver_d_d);
  assign array_array_8d829_widx = ({ 1 { array_array_8d829_driver_e_w } } & array_array_8d829_driver_e_widx) | ({ 1 { array_array_8d829_driver_d_w } } & array_array_8d829_driver_d_widx);
  assign array_array_8d829_w = array_array_8d829_driver_e_w | array_array_8d829_driver_d_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_8d829_q <= 1'd0;
    else if (array_array_8d829_w) begin

      case (array_array_8d829_widx)
        0 : array_array_8d829_q[0:0] <= array_array_8d829_d;
        default: ;
      endcase
    end
  /* Array: array_94f45[1 x i1] */
  logic [0:0] array_array_94f45_q;
  logic [0:0] array_array_94f45_driver_driver_d;
  logic [0:0] array_array_94f45_driver_driver_w;
  logic [0:0] array_array_94f45_driver_driver_widx;
  logic [0:0] array_array_94f45_d;
  logic [0:0] array_array_94f45_widx;
  logic [0:0] array_array_94f45_w;
  assign array_array_94f45_d = ({ 1 { array_array_94f45_driver_driver_w } } & array_array_94f45_driver_driver_d);
  assign array_array_94f45_widx = ({ 1 { array_array_94f45_driver_driver_w } } & array_array_94f45_driver_driver_widx);
  assign array_array_94f45_w = array_array_94f45_driver_driver_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
    begin
      array_array_94f45_q[0:0] <= 1'd1;
    end
    else if (array_array_94f45_w) begin

      case (array_array_94f45_widx)
        0 : array_array_94f45_q[0:0] <= array_array_94f45_d;
        default: ;
      endcase
    end
  /* Array: array_8d8e9[65536 x b32] */
  logic [31:0] array_array_8d8e9_q;
  logic [31:0] array_array_8d8e9_driver_dcache_d;
  logic [0:0] array_array_8d8e9_driver_dcache_w;
  logic [15:0] array_array_8d8e9_driver_dcache_widx;
  /* Array: array_88e59[1 x b5] */
  logic [4:0] array_array_88e59_q;
  logic [4:0] array_array_88e59_driver_e_d;
  logic [0:0] array_array_88e59_driver_e_w;
  logic [0:0] array_array_88e59_driver_e_widx;
  logic [4:0] array_array_88e59_d;
  logic [0:0] array_array_88e59_widx;
  logic [0:0] array_array_88e59_w;
  assign array_array_88e59_d = ({ 5 { array_array_88e59_driver_e_w } } & array_array_88e59_driver_e_d);
  assign array_array_88e59_widx = ({ 1 { array_array_88e59_driver_e_w } } & array_array_88e59_driver_e_widx);
  assign array_array_88e59_w = array_array_88e59_driver_e_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e59_q <= 5'd0;
    else if (array_array_88e59_w) begin

      case (array_array_88e59_widx)
        0 : array_array_88e59_q[4:0] <= array_array_88e59_d;
        default: ;
      endcase
    end
  /* Array: array_88e51[1 x b32] */
  logic [31:0] array_array_88e51_q;
  logic [31:0] array_array_88e51_driver_W1_d;
  logic [0:0] array_array_88e51_driver_W1_w;
  logic [0:0] array_array_88e51_driver_W1_widx;
  assign array_array_88e51_exposed_o = array_array_88e51_q;
  logic [31:0] array_array_88e51_d;
  logic [0:0] array_array_88e51_widx;
  logic [0:0] array_array_88e51_w;
  assign array_array_88e51_d = ({ 32 { array_array_88e51_driver_W1_w } } & array_array_88e51_driver_W1_d);
  assign array_array_88e51_widx = ({ 1 { array_array_88e51_driver_W1_w } } & array_array_88e51_driver_W1_widx);
  assign array_array_88e51_w = array_array_88e51_driver_W1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e51_q <= 32'd0;
    else if (array_array_88e51_w) begin

      case (array_array_88e51_widx)
        0 : array_array_88e51_q[31:0] <= array_array_88e51_d;
        default: ;
      endcase
    end
  /* Array: array_88e61[1 x b32] */
  logic [31:0] array_array_88e61_q;
  logic [31:0] array_array_88e61_driver_e_d;
  logic [0:0] array_array_88e61_driver_e_w;
  logic [0:0] array_array_88e61_driver_e_widx;
  logic [31:0] array_array_88e61_d;
  logic [0:0] array_array_88e61_widx;
  logic [0:0] array_array_88e61_w;
  assign array_array_88e61_d = ({ 32 { array_array_88e61_driver_e_w } } & array_array_88e61_driver_e_d);
  assign array_array_88e61_widx = ({ 1 { array_array_88e61_driver_e_w } } & array_array_88e61_driver_e_widx);
  assign array_array_88e61_w = array_array_88e61_driver_e_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e61_q <= 32'd0;
    else if (array_array_88e61_w) begin

      case (array_array_88e61_widx)
        0 : array_array_88e61_q[31:0] <= array_array_88e61_d;
        default: ;
      endcase
    end
  /* Array: array_88e15[1 x b32] */
  logic [31:0] array_array_88e15_q;
  logic [31:0] array_array_88e15_driver_memuser_87e91_d;
  logic [0:0] array_array_88e15_driver_memuser_87e91_w;
  logic [0:0] array_array_88e15_driver_memuser_87e91_widx;
  assign array_array_88e15_exposed_o = array_array_88e15_q;
  logic [31:0] array_array_88e15_temp;
  assign array_array_88e15_temp = array_array_88e15_exposed_i_valid?array_array_88e15_exposed_i:array_array_88e15_d;
  logic [31:0] array_array_88e15_d;
  logic [0:0] array_array_88e15_widx;
  logic [0:0] array_array_88e15_w;
  assign array_array_88e15_d = ({ 32 { array_array_88e15_driver_memuser_87e91_w } } & array_array_88e15_driver_memuser_87e91_d);
  assign array_array_88e15_widx = ({ 1 { array_array_88e15_driver_memuser_87e91_w } } & array_array_88e15_driver_memuser_87e91_widx);
  assign array_array_88e15_w = array_array_88e15_driver_memuser_87e91_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e15_q <= 32'd0;
    else if (array_array_88e15_w) begin

      case (array_array_88e15_widx)
        0 : array_array_88e15_q[31:0] <= array_array_88e15_temp;
        default: ;
      endcase
    end
  /* Array: array_88e69[1 x b32] */
  logic [31:0] array_array_88e69_q;
  logic [31:0] array_array_88e69_driver_m_d;
  logic [0:0] array_array_88e69_driver_m_w;
  logic [0:0] array_array_88e69_driver_m_widx;
  logic [31:0] array_array_88e69_d;
  logic [0:0] array_array_88e69_widx;
  logic [0:0] array_array_88e69_w;
  assign array_array_88e69_d = ({ 32 { array_array_88e69_driver_m_w } } & array_array_88e69_driver_m_d);
  assign array_array_88e69_widx = ({ 1 { array_array_88e69_driver_m_w } } & array_array_88e69_driver_m_widx);
  assign array_array_88e69_w = array_array_88e69_driver_m_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e69_q <= 32'd0;
    else if (array_array_88e69_w) begin

      case (array_array_88e69_widx)
        0 : array_array_88e69_q[31:0] <= array_array_88e69_d;
        default: ;
      endcase
    end
  /* Array: array_8dcd9[65536 x b32] */
  logic [31:0] array_array_8dcd9_q;
  logic [31:0] array_array_8dcd9_driver_icache_d;
  logic [0:0] array_array_8dcd9_driver_icache_w;
  logic [15:0] array_array_8dcd9_driver_icache_widx;
  /* Array: array_94f55[32 x b32] */
  logic [31:0] array_array_94f55_q;
  logic [31:0] array_array_94f55_driver_init_cache_d;
  logic [0:0] array_array_94f55_driver_init_cache_w;
  logic [4:0] array_array_94f55_driver_init_cache_widx;
  /* Array: array_88e41[1 x b32] */
  logic [31:0] array_array_88e41_q;
  logic [31:0] array_array_88e41_driver_F1_d;
  logic [0:0] array_array_88e41_driver_F1_w;
  logic [0:0] array_array_88e41_driver_F1_widx;
  assign array_array_88e41_exposed_o = array_array_88e41_q;
  logic [31:0] array_array_88e41_d;
  logic [0:0] array_array_88e41_widx;
  logic [0:0] array_array_88e41_w;
  assign array_array_88e41_d = ({ 32 { array_array_88e41_driver_F1_w } } & array_array_88e41_driver_F1_d);
  assign array_array_88e41_widx = ({ 1 { array_array_88e41_driver_F1_w } } & array_array_88e41_driver_F1_widx);
  assign array_array_88e41_w = array_array_88e41_driver_F1_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e41_q <= 32'd0;
    else if (array_array_88e41_w) begin

      case (array_array_88e41_widx)
        0 : array_array_88e41_q[31:0] <= array_array_88e41_d;
        default: ;
      endcase
    end
  /* Array: array_88e65[1 x b5] */
  logic [4:0] array_array_88e65_q;
  logic [4:0] array_array_88e65_driver_m_d;
  logic [0:0] array_array_88e65_driver_m_w;
  logic [0:0] array_array_88e65_driver_m_widx;
  logic [4:0] array_array_88e65_d;
  logic [0:0] array_array_88e65_widx;
  logic [0:0] array_array_88e65_w;
  assign array_array_88e65_d = ({ 5 { array_array_88e65_driver_m_w } } & array_array_88e65_driver_m_d);
  assign array_array_88e65_widx = ({ 1 { array_array_88e65_driver_m_w } } & array_array_88e65_driver_m_widx);
  assign array_array_88e65_w = array_array_88e65_driver_m_w;
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
      array_array_88e65_q <= 5'd0;
    else if (array_array_88e65_w) begin

      case (array_array_88e65_widx)
        0 : array_array_88e65_q[4:0] <= array_array_88e65_d;
        default: ;
      endcase
    end
  // fifo: rdata: fifo<b32>, depth: 1
  // Declare the pop.{data/valid/ready}
  logic [31:0] fifo_memuser_87e91_rdata_pop_data;
  logic [0:0] fifo_memuser_87e91_rdata_pop_valid;
  logic [0:0] fifo_memuser_87e91_rdata_pop_ready;
  logic [31:0] fifo_memuser_87e91_rdata_driver_init_cache_push_data;
  logic [0:0] fifo_memuser_87e91_rdata_driver_init_cache_push_valid;
  logic [0:0] fifo_memuser_87e91_rdata_driver_init_cache_push_ready;
  // Broadcast the push_ready signal to all the pushers
  logic fifo_memuser_87e91_rdata_push_ready;
  assign fifo_memuser_87e91_rdata_driver_init_cache_push_ready = fifo_memuser_87e91_rdata_push_ready;  // Gather all the push signal
  logic [0:0] fifo_memuser_87e91_rdata_push_valid;
  assign fifo_memuser_87e91_rdata_push_valid = fifo_memuser_87e91_rdata_driver_init_cache_push_valid;
  // 1-hot select the push data
  logic [31:0] fifo_memuser_87e91_rdata_push_data;
  assign fifo_memuser_87e91_rdata_push_data = ({ 32 { fifo_memuser_87e91_rdata_driver_init_cache_push_valid } } & fifo_memuser_87e91_rdata_driver_init_cache_push_data);

  fifo #(32, 0) fifo_memuser_87e91_rdata_i (
    .clk(clk),
    .rst_n(rst_n),
    .push_valid(fifo_memuser_87e91_rdata_push_valid),
    .push_data(fifo_memuser_87e91_rdata_push_data),
    .push_ready(fifo_memuser_87e91_rdata_push_ready),
    .pop_valid(fifo_memuser_87e91_rdata_pop_valid),
    .pop_data(fifo_memuser_87e91_rdata_pop_data),
    .pop_ready(fifo_memuser_87e91_rdata_pop_ready));

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

  // Trigger SM of Module: memuser_87e91
  logic [7:0] memuser_87e91_driver_driver_counter_delta;
  logic [0:0] memuser_87e91_driver_driver_counter_delta_ready;
  logic [0:0] memuser_87e91_counter_delta_ready;
  logic [7:0] memuser_87e91_counter_delta;
  // Gather all the push signal
  assign memuser_87e91_counter_delta = memuser_87e91_driver_driver_counter_delta;
  // Broadcast the push_ready signal to all the pushers
  logic [0:0] memuser_87e91_counter_pop_ready;
  assign memuser_87e91_driver_driver_counter_delta_ready = memuser_87e91_counter_pop_ready;
  logic [0:0] memuser_87e91_counter_pop_valid;

  trigger_counter #(8) memuser_87e91_trigger_i (
    .clk(clk),
    .rst_n(rst_n),
    .delta(memuser_87e91_counter_delta),
    .delta_ready(memuser_87e91_counter_delta_ready),
    .pop_valid(memuser_87e91_counter_pop_valid),
    .pop_ready(memuser_87e91_counter_pop_ready));
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

  logic [0:0] memuser_87e91_executed;

  // memuser_87e91
  memuser_87e91 memuser_87e91_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_rdata_pop_ready(fifo_memuser_87e91_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_memuser_87e91_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_memuser_87e91_rdata_pop_valid),
    .array_array_88e15_w(array_array_88e15_driver_memuser_87e91_w),
    .array_array_88e15_widx(array_array_88e15_driver_memuser_87e91_widx),
    .array_array_88e15_d(array_array_88e15_driver_memuser_87e91_d),
    .counter_delta_ready(memuser_87e91_counter_delta_ready),
    .counter_pop_ready(memuser_87e91_counter_pop_ready),
    .counter_pop_valid(memuser_87e91_counter_pop_valid),
    .expose_executed(memuser_87e91_executed));
  logic [0:0] m_executed;

  // m
  m m_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_rdata_pop_ready(fifo_m_rdata_pop_ready),
    .fifo_rdata_pop_data(fifo_m_rdata_pop_data),
    .fifo_rdata_pop_valid(fifo_m_rdata_pop_valid),
    .fifo_rd_pop_ready(fifo_m_rd_pop_ready),
    .fifo_rd_pop_data(fifo_m_rd_pop_data),
    .fifo_rd_pop_valid(fifo_m_rd_pop_valid),
    .fifo_result_pop_ready(fifo_m_result_pop_ready),
    .fifo_result_pop_data(fifo_m_result_pop_data),
    .fifo_result_pop_valid(fifo_m_result_pop_valid),
    .fifo_mem_ext_pop_ready(fifo_m_mem_ext_pop_ready),
    .fifo_mem_ext_pop_data(fifo_m_mem_ext_pop_data),
    .fifo_mem_ext_pop_valid(fifo_m_mem_ext_pop_valid),
    .array_array_88e69_w(array_array_88e69_driver_m_w),
    .array_array_88e69_widx(array_array_88e69_driver_m_widx),
    .array_array_88e69_d(array_array_88e69_driver_m_d),
    .w_counter_delta_ready(w_driver_m_counter_delta_ready),
    .w_counter_delta(w_driver_m_counter_delta),
    .array_array_88e65_w(array_array_88e65_driver_m_w),
    .array_array_88e65_widx(array_array_88e65_driver_m_widx),
    .array_array_88e65_d(array_array_88e65_driver_m_d),
    .fifo_w_rd_push_valid(fifo_w_rd_driver_m_push_valid),
    .fifo_w_rd_push_data(fifo_w_rd_driver_m_push_data),
    .fifo_w_rd_push_ready(fifo_w_rd_driver_m_push_ready),
    .fifo_w_mdata_push_valid(fifo_w_mdata_driver_m_push_valid),
    .fifo_w_mdata_push_data(fifo_w_mdata_driver_m_push_data),
    .fifo_w_mdata_push_ready(fifo_w_mdata_driver_m_push_ready),
    .counter_delta_ready(m_counter_delta_ready),
    .counter_pop_ready(m_counter_pop_ready),
    .counter_pop_valid(m_counter_pop_valid),
    .expose_executed(m_executed));
  logic [0:0] logic_var_4365;
  logic [0:0] logic_var_4365_valid;
  logic [0:0] driver_executed;

  // driver
  driver driver_i (
    .clk(clk),
    .rst_n(rst_n),
    .f_counter_delta_ready(f_driver_driver_counter_delta_ready),
    .f_counter_delta(f_driver_driver_counter_delta),
    .array_array_94f45_q(array_array_94f45_q),
    .array_array_94f45_w(array_array_94f45_driver_driver_w),
    .array_array_94f45_widx(array_array_94f45_driver_driver_widx),
    .array_array_94f45_d(array_array_94f45_driver_driver_d),
    .memuser_87e91_counter_delta_ready(memuser_87e91_driver_driver_counter_delta_ready),
    .memuser_87e91_counter_delta(memuser_87e91_driver_driver_counter_delta),
    .expose_var_4365(logic_var_4365),
    .expose_var_4365_valid(logic_var_4365_valid),
    .counter_delta_ready(driver_counter_delta_ready),
    .counter_pop_ready(driver_counter_pop_ready),
    .counter_pop_valid(driver_counter_pop_valid),
    .expose_executed(driver_executed));
  logic [31:0] logic_var_68;
  logic [0:0] logic_var_68_valid;
  logic [0:0] f_executed;

  // f
  f f_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_88e41_q(array_array_88e41_q),
    .expose_var_68(logic_var_68),
    .expose_var_68_valid(logic_var_68_valid),
    .counter_delta_ready(f_counter_delta_ready),
    .counter_pop_ready(f_counter_pop_ready),
    .counter_pop_valid(f_counter_pop_valid),
    .expose_executed(f_executed));
  logic [31:0] logic_var_558;
  logic [0:0] logic_var_558_valid;
  logic [0:0] logic_var_788;
  logic [0:0] logic_var_788_valid;
  logic [4:0] logic_var_370;
  logic [0:0] logic_var_370_valid;
  logic [0:0] logic_var_796;
  logic [0:0] logic_var_796_valid;
  logic [0:0] logic_var_344;
  logic [0:0] logic_var_344_valid;
  logic [31:0] logic_var_843;
  logic [0:0] logic_var_843_valid;
  logic [15:0] logic_var_891;
  logic [0:0] logic_var_891_valid;
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
    .fifo_m_result_push_valid(fifo_m_result_driver_e_push_valid),
    .fifo_m_result_push_data(fifo_m_result_driver_e_push_data),
    .fifo_m_result_push_ready(fifo_m_result_driver_e_push_ready),
    .m_counter_delta_ready(m_driver_e_counter_delta_ready),
    .m_counter_delta(m_driver_e_counter_delta),
    .array_array_88e61_q(array_array_88e61_q),
    .array_array_88e61_w(array_array_88e61_driver_e_w),
    .array_array_88e61_widx(array_array_88e61_driver_e_widx),
    .array_array_88e61_d(array_array_88e61_driver_e_d),
    .fifo_m_mem_ext_push_valid(fifo_m_mem_ext_driver_e_push_valid),
    .fifo_m_mem_ext_push_data(fifo_m_mem_ext_driver_e_push_data),
    .fifo_m_mem_ext_push_ready(fifo_m_mem_ext_driver_e_push_ready),
    .array_array_88e55_q(array_array_88e55_q),
    .array_array_88e51_q(array_array_88e51_q),
    .array_array_88e65_q(array_array_88e65_q),
    .array_array_88e15_q(array_array_88e15_q),
    .fifo_m_rd_push_valid(fifo_m_rd_driver_e_push_valid),
    .fifo_m_rd_push_data(fifo_m_rd_driver_e_push_data),
    .fifo_m_rd_push_ready(fifo_m_rd_driver_e_push_ready),
    .array_array_8d829_w(array_array_8d829_driver_e_w),
    .array_array_8d829_widx(array_array_8d829_driver_e_widx),
    .array_array_8d829_d(array_array_8d829_driver_e_d),
    .array_array_88e69_q(array_array_88e69_q),
    .array_array_88e59_q(array_array_88e59_q),
    .array_array_88e59_w(array_array_88e59_driver_e_w),
    .array_array_88e59_widx(array_array_88e59_driver_e_widx),
    .array_array_88e59_d(array_array_88e59_driver_e_d),
    .expose_var_558(logic_var_558),
    .expose_var_558_valid(logic_var_558_valid),
    .expose_var_788(logic_var_788),
    .expose_var_788_valid(logic_var_788_valid),
    .expose_var_370(logic_var_370),
    .expose_var_370_valid(logic_var_370_valid),
    .expose_var_796(logic_var_796),
    .expose_var_796_valid(logic_var_796_valid),
    .expose_var_344(logic_var_344),
    .expose_var_344_valid(logic_var_344_valid),
    .expose_var_843(logic_var_843),
    .expose_var_843_valid(logic_var_843_valid),
    .expose_var_891(logic_var_891),
    .expose_var_891_valid(logic_var_891_valid),
    .var_344_exposed_o(var_344_exposed_o),
    .counter_delta_ready(e_counter_delta_ready),
    .counter_pop_ready(e_counter_pop_ready),
    .counter_pop_valid(e_counter_pop_valid),
    .expose_executed(e_executed));
  logic [4:0] logic_var_71;
  logic [0:0] logic_var_71_valid;
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
    .array_array_88e55_w(array_array_88e55_driver_w_w),
    .array_array_88e55_widx(array_array_88e55_driver_w_widx),
    .array_array_88e55_d(array_array_88e55_driver_w_d),
    .expose_var_71(logic_var_71),
    .expose_var_71_valid(logic_var_71_valid),
    .counter_delta_ready(w_counter_delta_ready),
    .counter_pop_ready(w_counter_pop_ready),
    .counter_pop_valid(w_counter_pop_valid),
    .expose_executed(w_executed));
  logic [0:0] logic_var_4164;
  logic [0:0] logic_var_4164_valid;
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
    .fifo_e_signals_push_valid(fifo_e_signals_driver_d_push_valid),
    .fifo_e_signals_push_data(fifo_e_signals_driver_d_push_data),
    .fifo_e_signals_push_ready(fifo_e_signals_driver_d_push_ready),
    .e_counter_delta_ready(e_driver_d_counter_delta_ready),
    .e_counter_delta(e_driver_d_counter_delta),
    .array_array_8d829_w(array_array_8d829_driver_d_w),
    .array_array_8d829_widx(array_array_8d829_driver_d_widx),
    .array_array_8d829_d(array_array_8d829_driver_d_d),
    .fifo_e_fetch_addr_push_valid(fifo_e_fetch_addr_driver_d_push_valid),
    .fifo_e_fetch_addr_push_data(fifo_e_fetch_addr_driver_d_push_data),
    .fifo_e_fetch_addr_push_ready(fifo_e_fetch_addr_driver_d_push_ready),
    .expose_var_4164(logic_var_4164),
    .expose_var_4164_valid(logic_var_4164_valid),
    .var_4358_exposed_o(var_4358_exposed_o),
    .counter_delta_ready(d_counter_delta_ready),
    .counter_pop_ready(d_counter_pop_ready),
    .counter_pop_valid(d_counter_pop_valid),
    .expose_executed(d_executed));
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
    .var_4444(logic_var_4444),
    .var_4444_valid(logic_var_4444_valid),
    .var_4451(logic_var_4451),
    .var_4451_valid(logic_var_4451_valid),
    .expose_executed(icache_executed));
  logic [0:0] W1_executed;

  // W1
  W1 W1_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_88e51_q(array_array_88e51_q),
    .array_array_88e51_w(array_array_88e51_driver_W1_w),
    .array_array_88e51_widx(array_array_88e51_driver_W1_widx),
    .array_array_88e51_d(array_array_88e51_driver_W1_d),
    // Upstream executed signals
    .w_executed(w_executed),
    .e_executed(e_executed),
    .var_370(logic_var_370),
    .var_370_valid(logic_var_370_valid),
    .var_71(logic_var_71),
    .var_71_valid(logic_var_71_valid),
    .expose_executed(W1_executed));
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
    .var_891(logic_var_891),
    .var_891_valid(logic_var_891_valid),
    .var_796(logic_var_796),
    .var_796_valid(logic_var_796_valid),
    .var_558(logic_var_558),
    .var_558_valid(logic_var_558_valid),
    .var_788(logic_var_788),
    .var_788_valid(logic_var_788_valid),
    .expose_executed(dcache_executed));
  logic [0:0] init_cache_executed;

  // init_cache
  init_cache init_cache_i (
    .clk(clk),
    .rst_n(rst_n),
    .fifo_memuser_87e91_rdata_push_valid(fifo_memuser_87e91_rdata_driver_init_cache_push_valid),
    .fifo_memuser_87e91_rdata_push_data(fifo_memuser_87e91_rdata_driver_init_cache_push_data),
    .fifo_memuser_87e91_rdata_push_ready(fifo_memuser_87e91_rdata_driver_init_cache_push_ready),
    // Upstream executed signals
    .driver_executed(driver_executed),
    .var_4365(logic_var_4365),
    .var_4365_valid(logic_var_4365_valid),
    .expose_executed(init_cache_executed));
  logic [0:0] logic_var_4444;
  logic [0:0] logic_var_4444_valid;
  logic [15:0] logic_var_4451;
  logic [0:0] logic_var_4451_valid;
  logic [0:0] F1_executed;

  // F1
  F1 F1_i (
    .clk(clk),
    .rst_n(rst_n),
    .array_array_8db41_q(array_array_8db41_q),
    .array_array_8db41_w(array_array_8db41_driver_F1_w),
    .array_array_8db41_widx(array_array_8db41_driver_F1_widx),
    .array_array_8db41_d(array_array_8db41_driver_F1_d),
    .d_counter_delta_ready(d_driver_F1_counter_delta_ready),
    .d_counter_delta(d_driver_F1_counter_delta),
    .array_array_88e41_w(array_array_88e41_driver_F1_w),
    .array_array_88e41_widx(array_array_88e41_driver_F1_widx),
    .array_array_88e41_d(array_array_88e41_driver_F1_d),
    .array_array_8d829_q(array_array_8d829_q),
    .fifo_d_fetch_addr_push_valid(fifo_d_fetch_addr_driver_F1_push_valid),
    .fifo_d_fetch_addr_push_data(fifo_d_fetch_addr_driver_F1_push_data),
    .fifo_d_fetch_addr_push_ready(fifo_d_fetch_addr_driver_F1_push_ready),
    // Upstream executed signals
    .f_executed(f_executed),
    .e_executed(e_executed),
    .d_executed(d_executed),
    .expose_var_4444(logic_var_4444),
    .expose_var_4444_valid(logic_var_4444_valid),
    .expose_var_4451(logic_var_4451),
    .expose_var_4451_valid(logic_var_4451_valid),
    .var_344(logic_var_344),
    .var_344_valid(logic_var_344_valid),
    .var_68(logic_var_68),
    .var_68_valid(logic_var_68_valid),
    .var_4164(logic_var_4164),
    .var_4164_valid(logic_var_4164_valid),
    .var_843(logic_var_843),
    .var_843_valid(logic_var_843_valid),
    .expose_executed(F1_executed));
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
logic [31:0]array_array_88e51_exposed_o;
logic [0:0]array_array_8d829_exposed_o;
logic [31:0]array_array_88e41_exposed_o;
logic [0:0] var_4358_exposed_o;
logic [1023:0]array_array_88e55_exposed_o;
logic [31:0]array_array_88e15_exposed_o;
logic [31:0]array_array_88e15_exposed_i;
logic array_array_88e15_exposed_i_valid;

assign array_array_88e15_exposed_i_valid = 1'd0;
assign array_array_88e15_exposed_i = 32'd0;
logic [0:0] var_344_exposed_o;

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #150;
  rst_n = 1'b1;
  #60000100;
  `ifndef SYNTHESIS
  $finish();
  `endif
end

always #50 clk <= !clk;



top top_i (
  .clk(clk),
  .rst_n(rst_n),
  .array_array_88e51_exposed_o(array_array_88e51_exposed_o),
  .array_array_8d829_exposed_o(array_array_8d829_exposed_o),
  .array_array_88e41_exposed_o(array_array_88e41_exposed_o),
  .var_4358_exposed_o(var_4358_exposed_o),
  .array_array_88e55_exposed_o(array_array_88e55_exposed_o),
  .array_array_88e15_exposed_o(array_array_88e15_exposed_o),
  .array_array_88e15_exposed_i(array_array_88e15_exposed_i),
  .array_array_88e15_exposed_i_valid(array_array_88e15_exposed_i_valid),
  .var_344_exposed_o(var_344_exposed_o)
);

endmodule
