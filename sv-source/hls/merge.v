// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2024-11-12T13:43:05
// /tmp/.mount_bambu-cgfWAs/usr/bin/bambu executed with: /tmp/.mount_bambu-cgfWAs/usr/bin/bambu -I../../common --top-fname=main --simulator=VERILATOR --file-input-data=input.data,check.data --simulate -s --top-rtldesign-name=run_benchmark --no-iob --hls-div --benchmark-name=gemm -DBAMBU_PROFILING -DNO_FINAL_MEMCMP_CHECK ./merge.c ../../common/harness.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_DISTRAM_NN_SDS(clock,
  reset,
  in1,
  in2,
  in3,
  in4,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file="/home/wengj/PandA-bambu/examples/MachSuite/sort/merge/array.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    PRIVATE_MEMORY=0,
    READ_ONLY_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    ALIGNMENT=32,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  `ifndef _SIM_HAVE_CLOG2
      function integer log2;
        input integer value;
        integer temp_value;
        begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
        end
      endfunction
  `endif
  parameter n_byte_on_databus = ALIGNMENT/8;
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_elements == 1 ? 1 : $clog2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : $clog2(n_byte_on_databus);
  `else
    parameter nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr-1:0] memory_addr_a_0;
  wire [nbit_read_addr-1:0] memory_addr_a_1;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_reads-1:0] dout_a;
  wire [nbit_addr*max_n_rw-1:0] tmp_addr;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    
  end
  
  generate
  genvar ind2;
  for (ind2=0; ind2<max_n_rw; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*nbit_addr-1:ind2*nbit_addr] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11;
    for (i11=0; i11<max_n_reads; i11=i11+1)
    begin : asynchronous_read
      assign dout_a[data_size*i11+:data_size] = memory[memory_addr_a[nbit_read_addr*i11+:nbit_read_addr]];
    end
  endgenerate
  
  assign memory_addr_a_0 = memory_addr_a[nbit_read_addr*0+:nbit_read_addr];
  assign memory_addr_a_1 = memory_addr_a[nbit_read_addr*1+:nbit_read_addr];
  
  generate if(READ_ONLY_MEMORY==0)
    always @(posedge clock)
    begin
      if(bram_write[0])
        memory[memory_addr_a_0] <= din_value_aggregated[data_size*0+:data_size];
      if(bram_write[1])
        memory[memory_addr_a_1] <= din_value_aggregated[data_size*1+:data_size];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = int_sel_STORE[i21] || proxy_sel_STORE[i21];
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  
  assign Sout_DataRdy = Sin_DataRdy;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ADDRESS_DECODING_LOGIC_NN(clock,
  reset,
  in1,
  in2,
  in3,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1,
  dout_a,
  dout_b,
  memory_addr_a,
  memory_addr_b,
  din_value_aggregated_swapped,
  be_swapped,
  bram_write);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    BRAM_BITSIZE=32,
    PRIVATE_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    HIGH_LATENCY=0,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2,
    BITSIZE_dout_a=1, PORTSIZE_dout_a=2,
    BITSIZE_dout_b=1, PORTSIZE_dout_b=2,
    BITSIZE_memory_addr_a=1, PORTSIZE_memory_addr_a=2,
    BITSIZE_memory_addr_b=1, PORTSIZE_memory_addr_b=2,
    BITSIZE_din_value_aggregated_swapped=1, PORTSIZE_din_value_aggregated_swapped=2,
    BITSIZE_be_swapped=1, PORTSIZE_be_swapped=2,
    BITSIZE_bram_write=1, PORTSIZE_bram_write=2,
    nbit_read_addr=32,
    n_byte_on_databus=4,
    n_mem_elements=4,
    max_n_reads=2,
    max_n_writes=2,
    max_n_rw=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  input [(PORTSIZE_dout_a*BITSIZE_dout_a)+(-1):0] dout_a;
  input [(PORTSIZE_dout_b*BITSIZE_dout_b)+(-1):0] dout_b;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  output [(PORTSIZE_memory_addr_a*BITSIZE_memory_addr_a)+(-1):0] memory_addr_a;
  output [(PORTSIZE_memory_addr_b*BITSIZE_memory_addr_b)+(-1):0] memory_addr_b;
  output [(PORTSIZE_din_value_aggregated_swapped*BITSIZE_din_value_aggregated_swapped)+(-1):0] din_value_aggregated_swapped;
  output [(PORTSIZE_be_swapped*BITSIZE_be_swapped)+(-1):0] be_swapped;
  output [PORTSIZE_bram_write-1:0] bram_write;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_addr = BITSIZE_S_addr_ram/*n_bytes ==  1 ? 1 : $clog2(n_bytes)*/;
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 1 : $clog2(n_byte_on_databus);
    parameter nbits_address_space_rangesize = $clog2(address_space_rangesize);
  `else
    parameter nbit_addr = BITSIZE_S_addr_ram/*n_bytes ==  1 ? 1 : log2(n_bytes)*/;
    parameter nbits_address_space_rangesize = log2(address_space_rangesize);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 1 : log2(n_byte_on_databus);
  `endif
   parameter memory_bitsize = 2*BRAM_BITSIZE;
  
  function [n_byte_on_databus*max_n_writes-1:0] CONV;
    input [n_byte_on_databus*max_n_writes-1:0] po2;
  begin
    case (po2)
      1:CONV=(1<<1)-1;
      2:CONV=(1<<2)-1;
      4:CONV=(1<<4)-1;
      8:CONV=(1<<8)-1;
      16:CONV=(1<<16)-1;
      32:CONV=(1<<32)-1;
      default:CONV=-1;
    endcase
  end
  endfunction
  
  wire [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] tmp_addr;
  wire [n_byte_on_databus*max_n_writes-1:0] conv_in;
  wire [n_byte_on_databus*max_n_writes-1:0] conv_out;
  wire [PORTSIZE_S_addr_ram-1:0] cs;
  wire [PORTSIZE_S_oe_ram-1:0] oe_ram_cs;
  wire [PORTSIZE_S_we_ram-1:0] we_ram_cs;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [memory_bitsize*max_n_writes-1:0] din_value_aggregated;
  wire [memory_bitsize*PORTSIZE_S_Wdata_ram-1:0] S_Wdata_ram_int;
  wire [memory_bitsize*max_n_reads-1:0] out1_shifted;
  wire [memory_bitsize*max_n_reads-1:0] dout;
  wire [nbits_byte_offset*max_n_rw-1:0] byte_offset;
  wire [n_byte_on_databus*max_n_writes-1:0] be;
  
  reg [PORTSIZE_S_we_ram-1:0] we_ram_cs_delayed =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed_registered =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed_registered1 =0;
  reg [max_n_reads-1:0] delayed_swapped_bit =0;
  reg [max_n_reads-1:0] delayed_swapped_bit_registered =0;
  reg [max_n_reads-1:0] delayed_swapped_bit_registered1 =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset_registered =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset_registered1 =0;
  
  generate
  genvar ind2;
  for (ind2=0; ind2<PORTSIZE_in2; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i2;
    for (i2=0;i2<max_n_reads;i2=i2+1)
    begin : L_copy
        assign dout[(memory_bitsize/2)+memory_bitsize*i2-1:memory_bitsize*i2] = delayed_swapped_bit[i2] ? dout_a[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2] : dout_b[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2];
        assign dout[memory_bitsize*(i2+1)-1:memory_bitsize*i2+(memory_bitsize/2)] = delayed_swapped_bit[i2] ? dout_b[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2] : dout_a[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2];
        always @(posedge clock)
        begin
          if(HIGH_LATENCY == 0)
            delayed_swapped_bit[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
          else if(HIGH_LATENCY == 1)
          begin
            delayed_swapped_bit_registered[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
            delayed_swapped_bit[i2] <= delayed_swapped_bit_registered[i2];
          end
          else
          begin
            delayed_swapped_bit_registered1[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
            delayed_swapped_bit_registered[i2] <= delayed_swapped_bit_registered1[i2];
            delayed_swapped_bit[i2] <= delayed_swapped_bit_registered[i2];
          end
        end
    end
  endgenerate
  
  generate
  genvar i3;
    for (i3=0; i3<PORTSIZE_S_addr_ram; i3=i3+1)
    begin : L3
      if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0)
        assign cs[i3] = (S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram] >= (address_space_begin)) && (S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram] < (address_space_begin+address_space_rangesize));
      else if(PRIVATE_MEMORY==0)
        assign cs[i3] = S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram+nbits_address_space_rangesize] == address_space_begin[nbit_addr-1:nbits_address_space_rangesize];
      else
        assign cs[i3] = 1'b0;
    end
  endgenerate
  
  generate
  genvar i4;
    for (i4=0; i4<PORTSIZE_S_oe_ram; i4=i4+1)
    begin : L4
      assign oe_ram_cs[i4] = S_oe_ram[i4] & cs[i4];
    end
  endgenerate
  
  generate
  genvar i5;
    for (i5=0; i5<PORTSIZE_S_we_ram; i5=i5+1)
    begin : L5
      assign we_ram_cs[i5] = S_we_ram[i5] & cs[i5];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0 && i6< PORTSIZE_S_addr_ram)
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = ((i6 < max_n_writes && (sel_STORE[i6]==1'b1 || proxy_sel_STORE[i6]==1'b1)) || (i6 < max_n_reads && (sel_LOAD[i6]==1'b1 || proxy_sel_LOAD[i6]==1'b1))) ? tmp_addr[(i6+1)*BITSIZE_in2-1:i6*BITSIZE_in2]-address_space_begin: S_addr_ram[(i6+1)*BITSIZE_S_addr_ram-1:i6*BITSIZE_S_addr_ram]-address_space_begin;
      else if(PRIVATE_MEMORY==0 && i6< PORTSIZE_S_addr_ram)
        assign relative_addr[(i6)*nbit_addr+nbits_address_space_rangesize-1:i6*nbit_addr] = ((i6 < max_n_writes && (sel_STORE[i6]==1'b1 || proxy_sel_STORE[i6]==1'b1)) || (i6 < max_n_reads && (sel_LOAD[i6]==1'b1 || proxy_sel_LOAD[i6]==1'b1))) ? tmp_addr[(i6)*BITSIZE_in2+nbits_address_space_rangesize-1:i6*BITSIZE_in2] : S_addr_ram[(i6)*BITSIZE_S_addr_ram+nbits_address_space_rangesize-1:i6*BITSIZE_S_addr_ram];
      else if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbits_address_space_rangesize-1:i6*nbit_addr] = tmp_addr[(i6)*BITSIZE_in2+nbits_address_space_rangesize-1:i6*BITSIZE_in2];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*BITSIZE_in2-1:i6*BITSIZE_in2]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_mem_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = !relative_addr[nbits_byte_offset+i7*nbit_addr-1] ? relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr] : (relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr-1]+ 1'b1) >> 1;
    end
  endgenerate
  
  generate
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_B
      if (n_mem_elements==1)
        assign memory_addr_b[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_b[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = !relative_addr[nbits_byte_offset+i7*nbit_addr-1] ? (relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr-1] + 1'b1) >> 1 : relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i8;
    for (i8=0; i8<max_n_rw; i8=i8+1)
    begin : L8
      if (n_byte_on_databus==2)
        assign byte_offset[(i8+1)*nbits_byte_offset-1:i8*nbits_byte_offset] = {nbits_byte_offset{1'b0}};
      else
        assign byte_offset[(i8+1)*nbits_byte_offset-1:i8*nbits_byte_offset] = {1'b0, relative_addr[nbits_byte_offset+i8*nbit_addr-2:i8*nbit_addr]};
    end
  endgenerate
  
  generate
  genvar i9, i10;
    for (i9=0; i9<max_n_writes; i9=i9+1)
    begin : byte_enable
      if(PRIVATE_MEMORY==0 && i9 < PORTSIZE_S_data_ram_size)
      begin
        assign conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = proxy_sel_STORE[i9] ? proxy_in3[BITSIZE_proxy_in3+BITSIZE_proxy_in3*i9-1:3+BITSIZE_proxy_in3*i9] : (sel_STORE[i9] ? in3[BITSIZE_in3+BITSIZE_in3*i9-1:3+BITSIZE_in3*i9] : S_data_ram_size[BITSIZE_S_data_ram_size+BITSIZE_S_data_ram_size*i9-1:3+BITSIZE_S_data_ram_size*i9]);
        assign conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = CONV(conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus]);
        assign be[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] << byte_offset[(i9+1)*nbits_byte_offset-1:i9*nbits_byte_offset];
      end
      else
      begin
        assign conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = proxy_sel_STORE[i9] ? proxy_in3[BITSIZE_proxy_in3+BITSIZE_proxy_in3*i9-1:3+BITSIZE_proxy_in3*i9] : in3[BITSIZE_in3+BITSIZE_in3*i9-1:3+BITSIZE_in3*i9];
        assign conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = CONV(conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus]);
        assign be[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] << byte_offset[(i9+1)*nbits_byte_offset-1:i9*nbits_byte_offset];
      end
    end
  endgenerate
  
  generate
    for (i9=0; i9<max_n_writes; i9=i9+1)
    begin : L9_swapped
      for (i10=0; i10<n_byte_on_databus/2; i10=i10+1)
      begin  : byte_enable_swapped
        assign be_swapped[i10+i9*n_byte_on_databus] = !relative_addr[nbits_byte_offset+i9*nbit_addr-1] ? be[i10+i9*n_byte_on_databus] : be[i10+i9*n_byte_on_databus+n_byte_on_databus/2];
        assign be_swapped[i10+i9*n_byte_on_databus+n_byte_on_databus/2] =  !relative_addr[nbits_byte_offset+i9*nbit_addr-1] ? be[i10+i9*n_byte_on_databus+n_byte_on_databus/2] : be[i10+i9*n_byte_on_databus];
      end
    end
  endgenerate
    
  generate
  genvar i13;
    for (i13=0; i13<PORTSIZE_S_Wdata_ram; i13=i13+1)
    begin : L13
      if (BITSIZE_S_Wdata_ram < memory_bitsize)
        assign S_Wdata_ram_int[memory_bitsize*(i13+1)-1:memory_bitsize*i13] = {{memory_bitsize-BITSIZE_S_Wdata_ram{1'b0}}, S_Wdata_ram[(i13+1)*BITSIZE_S_Wdata_ram-1:BITSIZE_S_Wdata_ram*i13]};
      else
        assign S_Wdata_ram_int[memory_bitsize*(i13+1)-1:memory_bitsize*i13] = S_Wdata_ram[memory_bitsize+BITSIZE_S_Wdata_ram*i13-1:BITSIZE_S_Wdata_ram*i13];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      if(PRIVATE_MEMORY==0 && i14 < PORTSIZE_S_Wdata_ram)
        assign din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : (sel_STORE[i14] ? in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : S_Wdata_ram_int[memory_bitsize*(i14+1)-1:memory_bitsize*i14] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8);
      else
        assign din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8;
    end
  endgenerate
  
  generate
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14_swapped
      assign din_value_aggregated_swapped[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize] = !relative_addr[nbits_byte_offset+i14*nbit_addr-1] ? din_value_aggregated[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize] : din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2];
      assign din_value_aggregated_swapped[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2] = !relative_addr[nbits_byte_offset+i14*nbit_addr-1] ?  din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2] : din_value_aggregated[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize];
    end
  endgenerate
  
  generate
  genvar i15;
    for (i15=0; i15<max_n_reads; i15=i15+1)
    begin : L15
      assign out1_shifted[(i15+1)*memory_bitsize-1:i15*memory_bitsize] = dout[(i15+1)*memory_bitsize-1:i15*memory_bitsize] >> delayed_byte_offset[(i15+1)*nbits_byte_offset-1:i15*nbits_byte_offset]*8;
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = out1_shifted[i20*memory_bitsize+BITSIZE_out1-1:i20*memory_bitsize];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = out1_shifted[i20*memory_bitsize+BITSIZE_proxy_out1-1:i20*memory_bitsize];
    end
  endgenerate
  
  generate
  genvar i16;
    for (i16=0; i16<PORTSIZE_S_oe_ram; i16=i16+1)
    begin : L16
      always @(posedge clock )
      begin
        if(reset == 1'b0)
          begin
            oe_ram_cs_delayed[i16] <= 1'b0;
            if(HIGH_LATENCY != 0) oe_ram_cs_delayed_registered[i16] <= 1'b0;
            if(HIGH_LATENCY == 2) oe_ram_cs_delayed_registered1[i16] <= 1'b0;
          end
        else
          if(HIGH_LATENCY == 0)
          begin
            oe_ram_cs_delayed[i16] <= oe_ram_cs[i16] & (!oe_ram_cs_delayed[i16] | BUS_PIPELINED);
          end
          else if(HIGH_LATENCY == 1)
          begin
            oe_ram_cs_delayed_registered[i16] <= oe_ram_cs[i16] & ((!oe_ram_cs_delayed_registered[i16] & !oe_ram_cs_delayed[i16]) | BUS_PIPELINED);
            oe_ram_cs_delayed[i16] <= oe_ram_cs_delayed_registered[i16];
          end
          else
          begin
            oe_ram_cs_delayed_registered1[i16] <= oe_ram_cs[i16] & ((!oe_ram_cs_delayed_registered1[i16] & !oe_ram_cs_delayed_registered[i16] & !oe_ram_cs_delayed[i16]) | BUS_PIPELINED);
            oe_ram_cs_delayed_registered[i16] <= oe_ram_cs_delayed_registered1[i16];
            oe_ram_cs_delayed[i16] <= oe_ram_cs_delayed_registered[i16];
          end
        end
      end
  endgenerate
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY == 0)
      delayed_byte_offset <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
    else if(HIGH_LATENCY == 1)
    begin
      delayed_byte_offset_registered <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
      delayed_byte_offset <= delayed_byte_offset_registered;
    end
    else
    begin
      delayed_byte_offset_registered1 <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
      delayed_byte_offset_registered <= delayed_byte_offset_registered1;
      delayed_byte_offset <= delayed_byte_offset_registered;
    end
  end
  
  
  generate
  genvar i17;
    for (i17=0; i17<PORTSIZE_S_we_ram; i17=i17+1)
    begin : L17
      always @(posedge clock )
      begin
        if(reset == 1'b0)
          we_ram_cs_delayed[i17] <= 1'b0;
        else
          we_ram_cs_delayed[i17] <= we_ram_cs[i17] & !we_ram_cs_delayed[i17];
      end
    end
  endgenerate
  
  generate
  genvar i18;
    for (i18=0; i18<PORTSIZE_Sout_Rdata_ram; i18=i18+1)
    begin : L18
      if(PRIVATE_MEMORY==1)
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
      else if (BITSIZE_Sout_Rdata_ram <= memory_bitsize)
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = oe_ram_cs_delayed[i18] ? out1_shifted[BITSIZE_Sout_Rdata_ram+i18*memory_bitsize-1:i18*memory_bitsize] : Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
      else
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = oe_ram_cs_delayed[i18] ? {{BITSIZE_S_Wdata_ram-memory_bitsize{1'b0}}, out1_shifted[(i18+1)*memory_bitsize-1:i18*memory_bitsize]} : Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
    end
  endgenerate
  
  generate
  genvar i19;
    for (i19=0; i19<PORTSIZE_Sout_DataRdy; i19=i19+1)
    begin : L19
      if(PRIVATE_MEMORY==0)
        assign Sout_DataRdy[i19] = (i19 < PORTSIZE_S_oe_ram && oe_ram_cs_delayed[i19]) | Sin_DataRdy[i19] | (i19 < PORTSIZE_S_we_ram && we_ram_cs_delayed[i19]);
      else
        assign Sout_DataRdy[i19] = Sin_DataRdy[i19];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<PORTSIZE_bram_write; i21=i21+1)
    begin : L21
      if(i21 < PORTSIZE_S_we_ram)
        assign bram_write[i21] = (sel_STORE[i21] || proxy_sel_STORE[i21] || we_ram_cs[i21]);
      else
        assign bram_write[i21] = (sel_STORE[i21] || proxy_sel_STORE[i21]);
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
(* blackbox *)
module BRAM_MEMORY_CORE_SMALL(clock,
  bram_write0,
  bram_write1,
  memory_addr_a,
  memory_addr_b,
  din_value_aggregated,
  be,
  dout_a,
  dout_b);
  parameter BITSIZE_dout_a=1,
    BITSIZE_dout_b=1,
    BITSIZE_memory_addr_a=1,
    BITSIZE_memory_addr_b=1,
    BITSIZE_din_value_aggregated=1,
    BITSIZE_be=1,
    MEMORY_INIT_file="/home/wengj/PandA-bambu/examples/MachSuite/sort/merge/array.mem",
    n_byte_on_databus=4,
    n_mem_elements=4,
    n_bytes=4,
    HIGH_LATENCY=0;
  // IN
  input clock;
  input bram_write0;
  input bram_write1;
  input [BITSIZE_memory_addr_a-1:0] memory_addr_a;
  input [BITSIZE_memory_addr_b-1:0] memory_addr_b;
  input [BITSIZE_din_value_aggregated-1:0] din_value_aggregated;
  input [BITSIZE_be-1:0] be;
  // OUT
  output [BITSIZE_dout_a-1:0] dout_a;
  output [BITSIZE_dout_b-1:0] dout_b;
  
  reg bram_write01 =0;
  reg bram_write11 =0;
  reg [BITSIZE_memory_addr_a-1:0] memory_addr_a1 =0;
  reg [BITSIZE_memory_addr_b-1:0] memory_addr_b1 =0;
  reg [BITSIZE_be-1:0] be1 =0;
  reg [BITSIZE_din_value_aggregated-1:0] din_value_aggregated1 =0;
  reg [(n_byte_on_databus)*8-1:0] dout_a_tmp =0;
  reg [(n_byte_on_databus)*8-1:0] dout_b_tmp =0;
  reg [(n_byte_on_databus)*8-1:0] dout_a_registered =0;
  reg [(n_byte_on_databus)*8-1:0] dout_b_registered =0;
  reg [(n_byte_on_databus)*8-1:0] memory [0:n_mem_elements-1]/* synthesis syn_ramstyle = "no_rw_check" */ ;
  
  generate
    if(HIGH_LATENCY==2)
    begin
      always @ (posedge clock)
      begin
         memory_addr_a1 <= memory_addr_a;
         memory_addr_b1 <= memory_addr_b;
         bram_write01 <= bram_write0;
         bram_write11 <= bram_write1;
         be1 <= be;
         din_value_aggregated1 <= din_value_aggregated;
      end
    end
  endgenerate
  
  assign dout_a = dout_a_tmp;
  assign dout_b = dout_b_tmp;
  initial
  begin
    
  end
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY == 0||HIGH_LATENCY == 1)
    begin
      if (bram_write0)
      begin : L11_write
        integer i11;
        for (i11=0; i11<n_byte_on_databus; i11=i11+1)
        begin
          if(be[i11])
            memory[memory_addr_a][i11*8+:8] <= din_value_aggregated[i11*8+:8];
        end
      end
    end
    else
    begin
      if (bram_write01)
      begin : L11_write1
        integer i11;
        for (i11=0; i11<n_byte_on_databus; i11=i11+1)
        begin
          if(be1[i11])
            memory[memory_addr_a1][i11*8+:8] <= din_value_aggregated1[i11*8+:8];
        end
      end
    end
    if(HIGH_LATENCY == 0)
      dout_a_tmp <= memory[memory_addr_a];
    else if(HIGH_LATENCY == 1)
    begin
      dout_a_registered <= memory[memory_addr_a];
      dout_a_tmp <= dout_a_registered;
    end
    else
    begin
      dout_a_registered <= memory[memory_addr_a1];
      dout_a_tmp <= dout_a_registered;
    end
    if(HIGH_LATENCY == 0||HIGH_LATENCY == 1)
    begin
      if (bram_write1)
      begin : L22_write
        integer i22;
        for (i22=0; i22<n_byte_on_databus; i22=i22+1)
        begin
          if(be[i22+n_byte_on_databus])
            memory[memory_addr_b][i22*8+:8] <= din_value_aggregated[(i22+n_byte_on_databus)*8+:8];
        end
      end
    end
    else
    begin
      if (bram_write11)
      begin : L22_write1
        integer i22;
        for (i22=0; i22<n_byte_on_databus; i22=i22+1)
        begin
          if(be1[i22+n_byte_on_databus])
            memory[memory_addr_b1][i22*8+:8] <= din_value_aggregated1[(i22+n_byte_on_databus)*8+:8];
        end
      end
    end
    if(HIGH_LATENCY == 0)
      dout_b_tmp <= memory[memory_addr_b];
    else if(HIGH_LATENCY == 1)
    begin
      dout_b_registered <= memory[memory_addr_b];
      dout_b_tmp <= dout_b_registered;
    end
    else
    begin
      dout_b_registered <= memory[memory_addr_b1];
      dout_b_tmp <= dout_b_registered;
    end
  end

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
(* blackbox *)
module TRUE_DUAL_PORT_BYTE_ENABLING_RAM(clock,
  bram_write0,
  bram_write1,
  memory_addr_a,
  memory_addr_b,
  din_value_aggregated,
  be,
  dout_a,
  dout_b);
  parameter BITSIZE_dout_a=1,
    BITSIZE_dout_b=1,
    BITSIZE_memory_addr_a=1,
    BITSIZE_memory_addr_b=1,
    BITSIZE_din_value_aggregated=1,
    BITSIZE_be=1,
    MEMORY_INIT_file="/home/wengj/PandA-bambu/examples/MachSuite/sort/merge/array.mem",
    BRAM_BITSIZE=32,
    n_byte_on_databus=4,
    n_mem_elements=4,
    HIGH_LATENCY=0;
  // IN
  input clock;
  input bram_write0;
  input bram_write1;
  input [BITSIZE_memory_addr_a-1:0] memory_addr_a;
  input [BITSIZE_memory_addr_b-1:0] memory_addr_b;
  input [BITSIZE_din_value_aggregated-1:0] din_value_aggregated;
  input [BITSIZE_be-1:0] be;
  // OUT
  output [BITSIZE_dout_a-1:0] dout_a;
  output [BITSIZE_dout_b-1:0] dout_b;
  
  wire [n_byte_on_databus-1:0] we_a;
  wire [n_byte_on_databus-1:0] we_b;
  reg [n_byte_on_databus-1:0] we_a1 =0;
  reg [n_byte_on_databus-1:0] we_b1 =0;
  reg [BITSIZE_din_value_aggregated-1:0] din_value_aggregated1 =0;
  
  reg [BITSIZE_dout_a-1:0] dout_a =0;
  reg [BITSIZE_dout_a-1:0] dout_a_registered =0;
  reg [BITSIZE_dout_b-1:0] dout_b =0;
  reg [BITSIZE_dout_b-1:0] dout_b_registered =0;
  reg [BITSIZE_memory_addr_a-1:0] memory_addr_a1 =0;
  reg [BITSIZE_memory_addr_b-1:0] memory_addr_b1 =0;
  reg [BRAM_BITSIZE-1:0] memory [0:n_mem_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    
  end
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY==0)
    begin
      dout_a <= memory[memory_addr_a];
    end
    else if(HIGH_LATENCY==1)
    begin
      dout_a_registered <= memory[memory_addr_a];
      dout_a <= dout_a_registered;
    end
    else
    begin
      memory_addr_a1 <= memory_addr_a;
      we_a1 <= we_a;
      din_value_aggregated1 <= din_value_aggregated;
      dout_a_registered <= memory[memory_addr_a1];
      dout_a <= dout_a_registered;
    end
  end
  
  generate
  genvar i11;
    for (i11=0; i11<n_byte_on_databus; i11=i11+1)
    begin : L11_write_a
      always @(posedge clock)
      begin
        if(HIGH_LATENCY==0||HIGH_LATENCY==1)
        begin
          if(we_a[i11])
            memory[memory_addr_a][(i11+1)*8-1:i11*8] <= din_value_aggregated[(i11+1)*8-1:i11*8];
        end
        else
        begin
          if(we_a1[i11])
            memory[memory_addr_a1][(i11+1)*8-1:i11*8] <= din_value_aggregated1[(i11+1)*8-1:i11*8];
        end
      end
    end
  endgenerate
  
    always @(posedge clock)
    begin
      if(HIGH_LATENCY==0)
      begin
        dout_b <= memory[memory_addr_b];
      end
      else if(HIGH_LATENCY==1)
      begin
        dout_b_registered <= memory[memory_addr_b];
        dout_b <= dout_b_registered;
      end
      else
      begin
        memory_addr_b1 <= memory_addr_b;
        we_b1 <= we_b;
        dout_b_registered <= memory[memory_addr_b1];
        dout_b <= dout_b_registered;
      end
    end
    for (i11=0; i11<n_byte_on_databus; i11=i11+1)
    begin : L11_write_b
      always @(posedge clock)
      begin
        if(HIGH_LATENCY==0||HIGH_LATENCY==1)
        begin
          if(we_b[i11])
            memory[memory_addr_b][(i11+1)*8-1:i11*8] <= din_value_aggregated[(i11+1+n_byte_on_databus)*8-1:(i11+n_byte_on_databus)*8];
        end
        else
        begin
          if(we_b1[i11])
            memory[memory_addr_b1][(i11+1)*8-1:i11*8] <= din_value_aggregated1[(i11+1+n_byte_on_databus)*8-1:(i11+n_byte_on_databus)*8];
        end
      end
    end
  
  generate
  genvar i2_a;
    for (i2_a=0; i2_a<n_byte_on_databus; i2_a=i2_a+1)
    begin  : write_enable_a
      assign we_a[i2_a] = (bram_write0) && be[i2_a];
    end
  endgenerate
  
  generate
  genvar i2_b;
    for (i2_b=0; i2_b<n_byte_on_databus; i2_b=i2_b+1)
    begin  : write_enable_b
      assign we_b[i2_b] = (bram_write1) && be[i2_b+n_byte_on_databus];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
(*blackbox*)
module BRAM_MEMORY_NN_CORE(clock,
  bram_write,
  memory_addr_a,
  din_value_aggregated_swapped,
  be_swapped,
  dout_a);
  parameter BITSIZE_bram_write=1, PORTSIZE_bram_write=2,
    BITSIZE_dout_a=1, PORTSIZE_dout_a=2,
    BITSIZE_memory_addr_a=1, PORTSIZE_memory_addr_a=2,
    BITSIZE_din_value_aggregated_swapped=1, PORTSIZE_din_value_aggregated_swapped=2,
    BITSIZE_be_swapped=1, PORTSIZE_be_swapped=2,
    MEMORY_INIT_file="/home/wengj/PandA-bambu/examples/MachSuite/sort/merge/array.mem",
    BRAM_BITSIZE=32,
    n_bytes=32,
    n_byte_on_databus=4,
    n_mem_elements=4,
    max_n_reads=2,
    max_n_writes=2,
    memory_offset=16,
    n_byte_on_databus_offset=2,
    HIGH_LATENCY=0;
  // IN
  input clock;
  input [PORTSIZE_bram_write-1:0] bram_write;
  input [(PORTSIZE_memory_addr_a*BITSIZE_memory_addr_a)+(-1):0] memory_addr_a;
  input [(PORTSIZE_din_value_aggregated_swapped*BITSIZE_din_value_aggregated_swapped)+(-1):0] din_value_aggregated_swapped;
  input [(PORTSIZE_be_swapped*BITSIZE_be_swapped)+(-1):0] be_swapped;
  // OUT
  output [(PORTSIZE_dout_a*BITSIZE_dout_a)+(-1):0] dout_a;
  
  generate
  if(n_mem_elements == 1)
  begin
    BRAM_MEMORY_CORE_SMALL #(.BITSIZE_memory_addr_a(BITSIZE_memory_addr_a), .BITSIZE_memory_addr_b(BITSIZE_memory_addr_a), .BITSIZE_din_value_aggregated((n_byte_on_databus)*8), .BITSIZE_be(n_byte_on_databus), .BITSIZE_dout_a((n_byte_on_databus/2)*8), .BITSIZE_dout_b((n_byte_on_databus/2)*8), .MEMORY_INIT_file(MEMORY_INIT_file), .n_byte_on_databus(n_byte_on_databus/2), .n_mem_elements(n_mem_elements), .n_bytes(n_bytes), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_instance_small (.clock(clock), .bram_write0(bram_write[0]), .bram_write1(bram_write[1]), .memory_addr_a(memory_addr_a[BITSIZE_memory_addr_a-1:0]), .memory_addr_b(memory_addr_a[2*BITSIZE_memory_addr_a-1:BITSIZE_memory_addr_a]), .din_value_aggregated({din_value_aggregated_swapped[2*BRAM_BITSIZE+(n_byte_on_databus/2)*8+memory_offset-1:2*BRAM_BITSIZE+memory_offset],din_value_aggregated_swapped[(n_byte_on_databus/2)*8+memory_offset-1:memory_offset]}), .be({be_swapped[n_byte_on_databus+n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus+n_byte_on_databus_offset],be_swapped[n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus_offset]}), .dout_a(dout_a[BRAM_BITSIZE-1:0]), .dout_b(dout_a[2*BRAM_BITSIZE-1:BRAM_BITSIZE]));
  end
  else
  begin
    TRUE_DUAL_PORT_BYTE_ENABLING_RAM #(.BITSIZE_memory_addr_a(BITSIZE_memory_addr_a), .BITSIZE_memory_addr_b(BITSIZE_memory_addr_a), .BITSIZE_din_value_aggregated((n_byte_on_databus)*8), .BITSIZE_be(n_byte_on_databus), .BITSIZE_dout_a((n_byte_on_databus/2)*8), .BITSIZE_dout_b((n_byte_on_databus/2)*8), .MEMORY_INIT_file(MEMORY_INIT_file), .BRAM_BITSIZE(BRAM_BITSIZE), .n_byte_on_databus(n_byte_on_databus/2), .n_mem_elements(n_mem_elements), .HIGH_LATENCY(HIGH_LATENCY)) TRUE_DUAL_PORT_BYTE_ENABLING_RAM_instance (.clock(clock), .bram_write0(bram_write[0]), .bram_write1(bram_write[1]), .memory_addr_a(memory_addr_a[BITSIZE_memory_addr_a-1:0]), .memory_addr_b(memory_addr_a[2*BITSIZE_memory_addr_a-1:BITSIZE_memory_addr_a]), .din_value_aggregated({din_value_aggregated_swapped[2*BRAM_BITSIZE+(n_byte_on_databus/2)*8+memory_offset-1:2*BRAM_BITSIZE+memory_offset],din_value_aggregated_swapped[(n_byte_on_databus/2)*8+memory_offset-1:memory_offset]}), .be({be_swapped[n_byte_on_databus+n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus+n_byte_on_databus_offset],be_swapped[n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus_offset]}), .dout_a(dout_a[BRAM_BITSIZE-1:0]), .dout_b(dout_a[2*BRAM_BITSIZE-1:BRAM_BITSIZE]));
  end
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
(*blackbox*)
module ARRAY_1D_STD_BRAM_NN_SP(clock,
  reset,
  in1,
  in2,
  in3,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file_a="array_a.mem",
    MEMORY_INIT_file_b="array_b.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    BRAM_BITSIZE=32,
    PRIVATE_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    HIGH_LATENCY=0,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  parameter n_bytes = (n_elements*data_size)/8;
  parameter memory_bitsize = 2*BRAM_BITSIZE;
  parameter n_byte_on_databus = memory_bitsize/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes%(n_byte_on_databus) == 0 ? 0 : 1);
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : $clog2(n_mem_elements);
  `else
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : log2(n_mem_elements);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_S_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_S_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_S_oe_ram ? PORTSIZE_sel_LOAD : PORTSIZE_S_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_b;
  wire [n_byte_on_databus*max_n_writes-1:0] be_swapped;
  
  wire [memory_bitsize*max_n_writes-1:0] din_value_aggregated_swapped;
  wire [(memory_bitsize/2)*max_n_reads-1:0] dout_a;
  wire [(memory_bitsize/2)*max_n_reads-1:0] dout_b;
  
  
  BRAM_MEMORY_NN_CORE #(.PORTSIZE_bram_write(max_n_writes), .BITSIZE_bram_write(1), .BITSIZE_dout_a(memory_bitsize/2), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .MEMORY_INIT_file(MEMORY_INIT_file_a), .BRAM_BITSIZE(BRAM_BITSIZE), .n_bytes(n_bytes), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .memory_offset(0), .n_byte_on_databus_offset(0), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_NN_instance_a(.clock(clock), .bram_write(bram_write), .memory_addr_a(memory_addr_a), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .dout_a(dout_a));
  
  generate
    if (n_bytes > BRAM_BITSIZE/8)
    begin : SECOND_MEMORY
      BRAM_MEMORY_NN_CORE #(.PORTSIZE_bram_write(max_n_writes), .BITSIZE_bram_write(1), .BITSIZE_dout_a((memory_bitsize/2)), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .MEMORY_INIT_file(MEMORY_INIT_file_b), .BRAM_BITSIZE(BRAM_BITSIZE), .n_bytes(n_bytes), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .memory_offset(memory_bitsize/2), .n_byte_on_databus_offset(n_byte_on_databus/2), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_NN_instance_b(.clock(clock), .bram_write(bram_write), .memory_addr_a(memory_addr_b), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .dout_a(dout_b));
    end
  else
    assign dout_b = {(memory_bitsize/2)*max_n_reads{1'b0}};
  endgenerate
  
  ADDRESS_DECODING_LOGIC_NN #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .HIGH_LATENCY(HIGH_LATENCY), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1), .BITSIZE_dout_a(memory_bitsize/2), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_dout_b(memory_bitsize/2), .PORTSIZE_dout_b(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_memory_addr_b(nbit_read_addr), .PORTSIZE_memory_addr_b(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .BITSIZE_bram_write(1), .PORTSIZE_bram_write(max_n_writes), .nbit_read_addr(nbit_read_addr), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .max_n_rw(max_n_rw)) ADDRESS_DECODING_LOGIC_NN_instance (.clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .out1(out1), .sel_LOAD(sel_LOAD), .sel_STORE(sel_STORE), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .Sout_Rdata_ram(Sout_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .Sout_DataRdy(Sout_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE), .proxy_out1(proxy_out1), .dout_a(dout_a), .dout_b(dout_b), .memory_addr_a(memory_addr_a), .memory_addr_b(memory_addr_b), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .bram_write(bram_write));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
(* blackbox *)
module ARRAY_1D_STD_BRAM_NN(clock,
  reset,
  in1,
  in2,
  in3,
  in4,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file_a="array_a.mem",
    MEMORY_INIT_file_b="array_b.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    BRAM_BITSIZE=32,
    PRIVATE_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  ARRAY_1D_STD_BRAM_NN_SP #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .MEMORY_INIT_file_a(MEMORY_INIT_file_a), .MEMORY_INIT_file_b(MEMORY_INIT_file_b), .n_elements(n_elements), .data_size(data_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1), .HIGH_LATENCY(0)) ARRAY_1D_STD_BRAM_NN_instance (.out1(out1), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .proxy_out1(proxy_out1), .clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .sel_LOAD(sel_LOAD & in4), .sel_STORE(sel_STORE & in4), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
    genvar i0;
    for (i0=0; i0<8; i0=i0+1)
    begin : L0
          always @(*)
          begin
             if (in0[i0] == 1'b1)
                cleaned_in0[i0] = 1'b1;
             else
                cleaned_in0[i0] = 1'b0;
          end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
     if(BITSIZE_out1 > 1)
       assign out1[BITSIZE_out1-1:1] = 0;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module multi_read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2015-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module CLOSE(clock,
  reset,
  start_port,
  in1,
  done_port,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input start_port;
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output done_port;
  output signed [BITSIZE_out1-1:0] out1;
  reg done_port;
  // synthesis translate_off
  // verilator lint_off BLKSEQ
  reg signed [BITSIZE_in1-1:0] temp_in1;
  always @(negedge clock)
    if(start_port == 1'b1)
    begin
     temp_in1 = {1'b1,in1[30:0]};
      $fclose(temp_in1);
    end
  assign out1 = 0;
  // verilator lint_on BLKSEQ
  // synthesis translate_on
  always @(posedge clock) done_port <= start_port;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2015-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module OPENN_VECTOR_BOOL32_INT8(clock,
  reset,
  start_port,
  in1,
  in2,
  sel_open,
  sel___builtin_open,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  M_DataRdy,
  done_port,
  out1,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  parameter BITSIZE_out1=1,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_in1=32,
    BITSIZE_in2=8;
  // IN
  input clock;
  input reset;
  input start_port;
  input [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input sel_open;
  input sel___builtin_open;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output done_port;
  output signed [BITSIZE_out1-1:0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
   // verilator lint_off LITENDIAN
  parameter MAX_BUFF_SIZE = 256;
  reg [0:8*MAX_BUFF_SIZE-1] buffer_name;
  
    `ifndef _SIM_HAVE_CLOG2
      function integer log2;
         input integer value;
         integer temp_value;
        begin
          temp_value = value-1;
          for (log2=0; temp_value>0; log2=log2+1)
            temp_value = temp_value>>1;
        end
      endfunction
    `endif
  
    `ifdef _SIM_HAVE_CLOG2
      parameter nbits_buffer = $clog2(MAX_BUFF_SIZE);
    `else
      parameter nbits_buffer = log2(MAX_BUFF_SIZE);
    `endif
    reg [nbits_buffer-1:0] _present_index =0;
    reg [nbits_buffer-1:0] _next_index;
    reg [BITSIZE_Mout_addr_ram-1:0] _present_pointer =0;
    reg [BITSIZE_Mout_addr_ram-1:0] _next_pointer;
    reg done_port;
    reg signed [BITSIZE_out1-1:0] temp_out1;
    reg [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
    reg [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
    reg [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
    reg [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
    reg [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
    
    parameter [1:0] S_0 = 2'd0,
                    S_1 = 2'd1,
                    S_2 = 2'd2,
                    S_3 = 2'd3;
    reg [3:0] _present_state =0;
    reg [3:0] _next_state;
    reg [63:0] data1;
    reg [7:0] data1_size;
    
    always @(posedge clock )
      if (reset == 1'b0)
        begin
          _present_state <= S_0;
          _present_pointer <= {BITSIZE_Mout_addr_ram{1'b0}};
          _present_index <= {nbits_buffer{1'b0}};
        end
      else
        begin
          _present_state <= _next_state;
          _present_pointer <= _next_pointer;
          _present_index <= _next_index;
        end
    
    assign out1 = {1'b0,temp_out1[30:0]};  always @(_present_state or _present_pointer or _present_index or start_port or M_DataRdy[0] or Min_we_ram or Min_oe_ram or Min_Wdata_ram or Min_addr_ram or Min_data_ram_size or in1 or in2 or M_Rdata_ram[7:0])
        begin
          Mout_we_ram = Min_we_ram;
          Mout_Wdata_ram = Min_Wdata_ram;
          Mout_oe_ram=Min_oe_ram;
          Mout_addr_ram=Min_addr_ram;
          Mout_data_ram_size=Min_data_ram_size;
          done_port = 1'b0;
          _next_state = _present_state;
          _next_pointer = _present_pointer;
          _next_index = _present_index;
          case (_present_state)
            S_0:
              if(start_port)
                begin
                  _next_pointer=0;
                  _next_index={nbits_buffer{1'b0}};
                  _next_state=S_1;  
                  buffer_name=0;  
                end
              
           S_1:
             begin
               Mout_addr_ram[BITSIZE_Mout_addr_ram-1:0]=in1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer;
               Mout_data_ram_size[BITSIZE_Mout_data_ram_size-1:0]={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram[0]=1'b1;
               if(M_DataRdy[0])
               begin
                  buffer_name[_present_index*8 +:8] = M_Rdata_ram[7:0];
                  if(M_Rdata_ram[7:0] == 8'd0)
                    _next_state=S_2;
                  else
                    _next_state=S_3;
               end
             end
           S_2:
             begin
  // synthesis translate_off
               temp_out1 = $fopen(buffer_name, (in2 & 2) != 0 && (in2 & 1024) ? "a+b" : ((in2 & 2) != 0 ? "r+b" : ((in2 & 1) != 0 && (in2 & 1024) ? "ab" : (in2 & 1) != 0 ? "wb" : "rb")));
  // synthesis translate_on
               done_port = 1'b1;
               _next_state=S_0;
             end
           S_3:
             begin
               if(!M_DataRdy[0])
               begin
                _next_pointer=_present_pointer+1'd1;
                _next_index=_present_index+1'd1;
                _next_state=S_1;
               end
             end
        endcase
     end
   // verilator lint_on LITENDIAN
  

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2014-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module __builtin_bambu_time_start(clock,
  start_port,
  done_port);
  // IN
  input clock;
  input start_port;
  // OUT
  output done_port;
  reg done_port;
  // synthesis translate_off
  integer res_file;
  always @(posedge clock)
    if(start_port == 1'b1)
    begin
      res_file = $fopen("profiling_results.txt","a");
      /*$display("__builtin_bambu_time_start %d", $time);*/
      $fwrite(res_file, "2\t");
      $fwrite(res_file, "%d\n", $time);
      $fclose(res_file);
    end
  // synthesis translate_on
  always @(posedge clock) done_port <= start_port;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2014-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module __builtin_bambu_time_stop(clock,
  start_port,
  done_port);
  // IN
  input clock;
  input start_port;
  // OUT
  output done_port;
  reg done_port;
  // synthesis translate_off
  integer res_file;
  always @(posedge clock)
    if(start_port == 1'b1)
    begin
      res_file = $fopen("profiling_results.txt","a");
      /*$display("__builtin_bambu_time_stop %d", $time);*/
      $fwrite(res_file, "3\t");
      $fwrite(res_file, "%d\n", $time);
      $fclose(res_file);
    end
  // synthesis translate_on
  always @(posedge clock) done_port <= start_port;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ge_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 >= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module gt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32(clock,
  reset,
  start_port,
  in1,
  in2,
  in3,
  in4,
  in5,
  sel_printf,
  sel___builtin_printf,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  M_DataRdy,
  done_port,
  out1,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  parameter BITSIZE_out1=1,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_in1=32,
    BITSIZE_in2=32,
    BITSIZE_in3=8,
    BITSIZE_in4=32,
    BITSIZE_in5=32;
  // IN
  input clock;
  input reset;
  input start_port;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  input [BITSIZE_in4-1:0] in4;
  input [BITSIZE_in5-1:0] in5;
  input sel_printf;
  input sel___builtin_printf;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output done_port;
  output signed [BITSIZE_out1-1:0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  // synthesis translate_off
  function real bits32_to_real64;
    input [31:0] fin1;
    reg [7:0] exponent1;
    reg is_exp_zero;
    reg is_all_ones;
    reg [10:0] exp_tmp;
    reg [63:0] fout1;
  begin
    exponent1 = fin1[30:23];
    is_exp_zero = exponent1 == 8'd0;
    is_all_ones = exponent1 == {8{1'b1}};
    exp_tmp = {3'd0, exponent1} + 11'd896;
    fout1[63] = fin1[31];
    fout1[62:52] = is_exp_zero ? 11'd0 : (is_all_ones ? {11{1'b1}} : exp_tmp);
    fout1[51:29] = fin1[22:0];
    fout1[28:0] = 29'd0;
    bits32_to_real64 = $bitstoreal(fout1);
  end
  endfunction
  // synthesis translate_on
  reg [BITSIZE_Mout_addr_ram-1:0] _present_pointer =0;
  reg [BITSIZE_Mout_addr_ram-1:0] _next_pointer;
  reg [BITSIZE_Mout_addr_ram-1:0] _present_pointer1 =0;
  reg [BITSIZE_Mout_addr_ram-1:0] _next_pointer1;
  reg done_port;
  reg [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  reg [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  reg [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  reg [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  reg [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  
  parameter [2:0] S_0 = 3'd0,
    S_1 = 3'd1,
    S_2 = 3'd2,
    S_3 = 3'd3,
    S_4 = 3'd4,
    S_5 = 3'd5,
    S_6 = 3'd6,
    S_7 = 3'd7;
  reg [2:0] _present_state =0;
  reg [2:0] _next_state;
  reg [4:0] _present_selector =0;
  reg [4:0] _next_selector;
  reg [63:0] data1;
  reg [7:0] _present_data2 =0;
  reg [7:0] _next_data2;
  reg [7:0] data1_size;
  reg write_done;
  
    always @(posedge clock )
      if (reset == 1'b0)
        begin
          _present_state <= S_0;
          _present_pointer <= {BITSIZE_Mout_addr_ram{1'b0}};
          _present_pointer1 <= {BITSIZE_Mout_addr_ram{1'b0}};
          _present_selector <=5'd0;
          _present_data2 <= 8'b0;
        end
      else
        begin
          _present_state <= _next_state;
          _present_pointer <= _next_pointer;
          _present_pointer1 <= _next_pointer1;
          _present_selector <= _next_selector;
          _present_data2 <= _next_data2;
        end
  
    always @(_present_state or _present_pointer or _present_pointer1 or _present_selector or start_port or M_DataRdy[0] or Min_we_ram or Min_oe_ram or Min_Wdata_ram or Min_addr_ram or Min_data_ram_size or in1 or in2 or in3 or in4 or in5 or _present_data2 or M_Rdata_ram[7:0])
        begin
          Mout_we_ram = Min_we_ram;
          Mout_Wdata_ram = Min_Wdata_ram;
          Mout_oe_ram=Min_oe_ram;
          Mout_addr_ram=Min_addr_ram;
          Mout_data_ram_size=Min_data_ram_size;
          done_port = 1'b0;
          _next_state = _present_state;
          _next_pointer = _present_pointer;
          _next_pointer1 = _present_pointer1;
          _next_selector = _present_selector;
          _next_data2 = _present_data2;
          case (_present_selector)
              5'd1:
               begin
                 data1=in1;
                 data1_size=BITSIZE_in1;
               end
              5'd2:
               begin
                 data1=in2;
                 data1_size=BITSIZE_in2;
               end
              5'd4:
               begin
                 data1=in3;
                 data1_size=BITSIZE_in3;
               end
              5'd8:
               begin
                 data1=in4;
                 data1_size=BITSIZE_in4;
               end
              5'd16:
               begin
                 data1=in5;
                 data1_size=BITSIZE_in5;
               end
              default:
               begin
                 data1 = 64'b0;
                 data1_size = 8'b0;
               end
            endcase
          case (_present_state)
            S_0:
              if(start_port)
                begin
                  _next_pointer=0;
                  _next_pointer1=0;
                  _next_state=S_1;  
                  _next_selector=5'd2;
                 end
              
           S_1:
             begin
               Mout_addr_ram[BITSIZE_Mout_addr_ram-1:0]=in1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer;
               Mout_data_ram_size[BITSIZE_Mout_data_ram_size-1:0]={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram[0]=1'b1;
               if(M_DataRdy[0])
               begin
                  _next_data2 = M_Rdata_ram[7:0];
                  _next_state=S_2;
  // synthesis translate_off
                  write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_2:
             begin
               _next_pointer=_present_pointer+1'd1;
               if((_present_data2!=8'd0)&&(_present_data2!=8'd37))
               begin
  // synthesis translate_off
                 if(!write_done)
                 begin
                   $write("%c",_present_data2);
                 write_done=1'b1;
                 end
  // synthesis translate_on
                 _next_state=S_1;
               end
               else if(_present_data2==8'd37)
                 _next_state=S_3;
               else if(_present_data2==8'd0)
               begin
                 done_port = 1'b1;
                 _next_state=S_0;
               end
             end
           S_3:
             begin
               Mout_addr_ram[BITSIZE_Mout_addr_ram-1:0]=in1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer;
               Mout_data_ram_size[BITSIZE_Mout_data_ram_size-1:0]={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram[0]=1'b1;
               if(M_DataRdy[0])
               begin
                  _next_data2 = M_Rdata_ram[7:0];
                  _next_state=S_5;
  // synthesis translate_off
                  write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_5 :
             begin
               _next_state=S_6;
               _next_pointer=_present_pointer+1'd1;
               case(_present_data2)
                 8'd37: //%%
                 begin
                   _next_state=S_1;
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("%c",8'd37);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd99: //Char
                 begin
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("%c",data1[7:0]);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd100: //Decimal %d
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Decimal precision not supported (d) %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd105: //Decimal %i
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Decimal precision not supported (i) %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd101: //Exponential %e
                 begin
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd69: //Exponential %E
                 begin
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd102: //Float %f
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd70: //Float %F
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd103: //Float %g
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd71: //Float %G
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd111: //Octal
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Octal precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd112: //%p
                   begin
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("0x%0h",data1);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd115: //String
                 begin
                   _next_state=S_7;
                   _next_pointer1=0;
                 end
                 8'd117: //unsigned int %u TO BE FIXED
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Unsigned precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd120: //Hex %x
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd88: //Hex %X
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 default:
                   _next_state=S_3;
               endcase
             end
           S_6:
             begin
               _next_selector=_present_selector<<1;
               _next_state=S_1;
             end
           S_7:
             begin
               Mout_addr_ram[BITSIZE_Mout_addr_ram-1:0]=data1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer1;
               Mout_data_ram_size[BITSIZE_Mout_data_ram_size-1:0]={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram[0]=1'b1;
               if(M_DataRdy[0])
               begin
                 _next_data2 = M_Rdata_ram[7:0];
                 _next_state=S_4;
  // synthesis translate_off
                 write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_4:
             begin
               _next_pointer1=_present_pointer1+1'd1;
               if(_present_data2!=8'd0)
               begin
  // synthesis translate_off
                 if(!write_done)
                 begin
                   $write("%c",_present_data2);
                   write_done=1'b1;
                 end
  // synthesis translate_on
                 _next_state=S_7;
               end
               else
                 _next_state=S_6;
             end
        endcase
     end
  

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module __builtin_abort(clock,
  start_port,
  sel_abort,
  sel___builtin_abort,
  done_port);
  // IN
  input clock;
  input start_port;
  input sel_abort;
  input sel___builtin_abort;
  // OUT
  output done_port;
  
  reg done_port =0;
  // synthesis translate_off
  integer res_file;
  always @(negedge clock)
    if(start_port == 1'b1)
    begin
      res_file = $fopen("results.txt","w");
      $display("Abort called");
      $fwrite(res_file, "0\t");
      $fwrite(res_file, "%d\t", $time);
      $fwrite(res_file, "ns\n");
      $fclose(res_file);
      $finish;
    end
  // synthesis translate_on
  always @(posedge clock) done_port <= start_port;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bus_merger(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  function [BITSIZE_out1-1:0] merge;
    input [BITSIZE_in1*PORTSIZE_in1-1:0] m;
    reg [BITSIZE_out1-1:0] res;
    integer i1;
  begin
    res={BITSIZE_in1{1'b0}};
    for(i1 = 0; i1 < PORTSIZE_in1; i1 = i1 + 1)
    begin
      res = res | m[i1*BITSIZE_in1 +:BITSIZE_in1];
    end
    merge = res;
  end
  endfunction
  
  assign out1 = merge(in1);
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module join_signal(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign out1[(i1+1)*(BITSIZE_out1/PORTSIZE_in1)-1:i1*(BITSIZE_out1/PORTSIZE_in1)] = in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module split_signal(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1, PORTSIZE_out1=2;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for __assert_fail
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___assert_fail(clock,
  reset,
  in_port___assertion,
  in_port___file,
  in_port___line,
  in_port___function,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  selector_IN_UNBOUNDED___assert_fail_74_85,
  selector_IN_UNBOUNDED___assert_fail_74_86,
  selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0,
  fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf,
  fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf,
  fuselector___builtin_abort_5_i0_abort,
  fuselector___builtin_abort_5_i0___builtin_abort,
  wrenable_reg_0,
  OUT_UNBOUNDED___assert_fail_74_85,
  OUT_UNBOUNDED___assert_fail_74_86);
  parameter MEM_var_39494_74=7340032;
  // IN
  input clock;
  input reset;
  input [31:0] in_port___assertion;
  input [31:0] in_port___file;
  input [31:0] in_port___line;
  input [31:0] in_port___function;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [45:0] S_addr_ram;
  input [63:0] S_Wdata_ram;
  input [11:0] S_data_ram_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input selector_IN_UNBOUNDED___assert_fail_74_85;
  input selector_IN_UNBOUNDED___assert_fail_74_86;
  input selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  input fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf;
  input fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf;
  input fuselector___builtin_abort_5_i0_abort;
  input fuselector___builtin_abort_5_i0___builtin_abort;
  input wrenable_reg_0;
  // OUT
  output [63:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_UNBOUNDED___assert_fail_74_85;
  output OUT_UNBOUNDED___assert_fail_74_86;
  // Component and signal declarations
  wire [7:0] null_out_signal_array_39494_0_out1_0;
  wire [7:0] null_out_signal_array_39494_0_out1_1;
  wire [31:0] null_out_signal_array_39494_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39494_0_proxy_out1_1;
  wire [31:0] out_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  wire [22:0] out_addr_expr_FU_3_i0_fu___assert_fail_74_39517;
  wire [22:0] out_const_0;
  wire [7:0] out_conv_in_port___line_32_8;
  wire [31:0] out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39517_23_32;
  wire [31:0] out_conv_out_const_0_23_32;
  wire [31:0] out_conv_out_reg_0_reg_0_23_32;
  wire [22:0] out_reg_0_reg_0;
  wire s_done_fu___assert_fail_74_85;
  wire s_done_fu___assert_fail_74_86;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_0;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_0;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [1:0] sig_out_bus_mergerSout_DataRdy5_;
  wire [63:0] sig_out_bus_mergerSout_Rdata_ram6_;
  
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0 (.out1(out_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0),
    .sel(selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0),
    .in1(out_conv_out_reg_0_reg_0_23_32),
    .in2(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39517_23_32));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39494.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39494.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_39494_74),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39494_0 (.out1({null_out_signal_array_39494_0_out1_1,
      null_out_signal_array_39494_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_0),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_0),
    .proxy_out1({null_out_signal_array_39494_0_proxy_out1_1,
      null_out_signal_array_39494_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerSout_DataRdy5_ (.out1(sig_out_bus_mergerSout_DataRdy5_),
    .in1({sig_in_bus_mergerSout_DataRdy5_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerSout_Rdata_ram6_ (.out1(sig_out_bus_mergerSout_Rdata_ram6_),
    .in1({sig_in_bus_mergerSout_Rdata_ram6_0}));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39494_74)) const_0 (.out1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_in_port___line_32_8 (.out1(out_conv_in_port___line_32_8),
    .in1(in_port___line));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39517_23_32 (.out1(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39517_23_32),
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_39517));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_0_23_32 (.out1(out_conv_out_const_0_23_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_0_reg_0_23_32 (.out1(out_conv_out_reg_0_reg_0_23_32),
    .in1(out_reg_0_reg_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___assert_fail_74_39517 (.out1(out_addr_expr_FU_3_i0_fu___assert_fail_74_39517),
    .in1(out_conv_out_const_0_23_32));
  PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32 #(.BITSIZE_out1(1),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_Min_addr_ram(23),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(23),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_in3(8),
    .BITSIZE_in4(32),
    .BITSIZE_in5(32)) fu___assert_fail_74_85 (.done_port(s_done_fu___assert_fail_74_85),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED___assert_fail_74_85),
    .in1(out_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0),
    .in2(in_port___file),
    .in3(out_conv_in_port___line_32_8),
    .in4(in_port___function),
    .in5(in_port___assertion),
    .sel_printf(fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf),
    .sel___builtin_printf(fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  __builtin_abort fu___assert_fail_74_86 (.done_port(s_done_fu___assert_fail_74_86),
    .clock(clock),
    .start_port(selector_IN_UNBOUNDED___assert_fail_74_86),
    .sel_abort(fuselector___builtin_abort_5_i0_abort),
    .sel___builtin_abort(fuselector___builtin_abort_5_i0___builtin_abort));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_0 (.out1(sig_in_bus_mergerSout_DataRdy5_0),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_0 (.out1(sig_in_bus_mergerSout_Rdata_ram6_0),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_0));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_39517),
    .wenable(wrenable_reg_0));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_DataRdy5_ (.out1(Sout_DataRdy),
    .in1(sig_out_bus_mergerSout_DataRdy5_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_Rdata_ram6_ (.out1(Sout_Rdata_ram),
    .in1(sig_out_bus_mergerSout_Rdata_ram6_));
  // io-signal post fix
  assign OUT_UNBOUNDED___assert_fail_74_85 = s_done_fu___assert_fail_74_85;
  assign OUT_UNBOUNDED___assert_fail_74_86 = s_done_fu___assert_fail_74_86;

endmodule

// FSM based controller description for __assert_fail
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___assert_fail(done_port,
  selector_IN_UNBOUNDED___assert_fail_74_85,
  selector_IN_UNBOUNDED___assert_fail_74_86,
  selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0,
  fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf,
  fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf,
  fuselector___builtin_abort_5_i0_abort,
  fuselector___builtin_abort_5_i0___builtin_abort,
  wrenable_reg_0,
  OUT_UNBOUNDED___assert_fail_74_85,
  OUT_UNBOUNDED___assert_fail_74_86,
  clock,
  reset,
  start_port);
  // IN
  input OUT_UNBOUNDED___assert_fail_74_85;
  input OUT_UNBOUNDED___assert_fail_74_86;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_IN_UNBOUNDED___assert_fail_74_85;
  output selector_IN_UNBOUNDED___assert_fail_74_86;
  output selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  output fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf;
  output fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf;
  output fuselector___builtin_abort_5_i0_abort;
  output fuselector___builtin_abort_5_i0___builtin_abort;
  output wrenable_reg_0;
  parameter [4:0] S_0 = 5'b00001,
    S_1 = 5'b00010,
    S_2 = 5'b00100,
    S_3 = 5'b01000,
    S_4 = 5'b10000;
  reg [4:0] _present_state=S_0, _next_state;
  reg done_port;
  reg selector_IN_UNBOUNDED___assert_fail_74_85;
  reg selector_IN_UNBOUNDED___assert_fail_74_86;
  reg selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  reg fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf;
  reg fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf;
  reg fuselector___builtin_abort_5_i0_abort;
  reg fuselector___builtin_abort_5_i0___builtin_abort;
  reg wrenable_reg_0;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_IN_UNBOUNDED___assert_fail_74_85 = 1'b0;
    selector_IN_UNBOUNDED___assert_fail_74_86 = 1'b0;
    selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0 = 1'b0;
    fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf = 1'b0;
    fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf = 1'b0;
    fuselector___builtin_abort_5_i0_abort = 1'b0;
    fuselector___builtin_abort_5_i0___builtin_abort = 1'b0;
    wrenable_reg_0 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_IN_UNBOUNDED___assert_fail_74_85 = 1'b1;
          fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf = 1'b1;
          wrenable_reg_0 = 1'b1;
          if (OUT_UNBOUNDED___assert_fail_74_85 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_2 :
        begin
          selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0 = 1'b1;
          fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf = 1'b1;
          if (OUT_UNBOUNDED___assert_fail_74_85 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_3 :
        begin
          selector_IN_UNBOUNDED___assert_fail_74_86 = 1'b1;
          fuselector___builtin_abort_5_i0_abort = 1'b1;
          if (OUT_UNBOUNDED___assert_fail_74_86 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_4 :
        begin
          fuselector___builtin_abort_5_i0_abort = 1'b1;
          if (OUT_UNBOUNDED___assert_fail_74_86 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// Top component for __assert_fail
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __assert_fail(clock,
  reset,
  start_port,
  done_port,
  __assertion,
  __file,
  __line,
  __function,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  parameter MEM_var_39494_74=7340032;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] __assertion;
  input [31:0] __file;
  input [31:0] __line;
  input [31:0] __function;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [45:0] S_addr_ram;
  input [63:0] S_Wdata_ram;
  input [11:0] S_data_ram_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [63:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_UNBOUNDED___assert_fail_74_85;
  wire OUT_UNBOUNDED___assert_fail_74_86;
  wire fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf;
  wire fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf;
  wire fuselector___builtin_abort_5_i0___builtin_abort;
  wire fuselector___builtin_abort_5_i0_abort;
  wire [31:0] in_port___assertion_SIGI1;
  wire [31:0] in_port___assertion_SIGI2;
  wire [31:0] in_port___file_SIGI1;
  wire [31:0] in_port___file_SIGI2;
  wire [31:0] in_port___function_SIGI1;
  wire [31:0] in_port___function_SIGI2;
  wire [31:0] in_port___line_SIGI1;
  wire [31:0] in_port___line_SIGI2;
  wire selector_IN_UNBOUNDED___assert_fail_74_85;
  wire selector_IN_UNBOUNDED___assert_fail_74_86;
  wire selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  wire wrenable_reg_0;
  
  controller___assert_fail Controller_i (.done_port(done_port),
    .selector_IN_UNBOUNDED___assert_fail_74_85(selector_IN_UNBOUNDED___assert_fail_74_85),
    .selector_IN_UNBOUNDED___assert_fail_74_86(selector_IN_UNBOUNDED___assert_fail_74_86),
    .selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0(selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0),
    .fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf(fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf),
    .fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf(fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf),
    .fuselector___builtin_abort_5_i0_abort(fuselector___builtin_abort_5_i0_abort),
    .fuselector___builtin_abort_5_i0___builtin_abort(fuselector___builtin_abort_5_i0___builtin_abort),
    .wrenable_reg_0(wrenable_reg_0),
    .OUT_UNBOUNDED___assert_fail_74_85(OUT_UNBOUNDED___assert_fail_74_85),
    .OUT_UNBOUNDED___assert_fail_74_86(OUT_UNBOUNDED___assert_fail_74_86),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___assert_fail #(.MEM_var_39494_74(MEM_var_39494_74)) Datapath_i (.Sout_Rdata_ram(Sout_Rdata_ram),
    .Sout_DataRdy(Sout_DataRdy),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_UNBOUNDED___assert_fail_74_85(OUT_UNBOUNDED___assert_fail_74_85),
    .OUT_UNBOUNDED___assert_fail_74_86(OUT_UNBOUNDED___assert_fail_74_86),
    .clock(clock),
    .reset(reset),
    .in_port___assertion(in_port___assertion_SIGI2),
    .in_port___file(in_port___file_SIGI2),
    .in_port___line(in_port___line_SIGI2),
    .in_port___function(in_port___function_SIGI2),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .Sin_DataRdy(Sin_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .selector_IN_UNBOUNDED___assert_fail_74_85(selector_IN_UNBOUNDED___assert_fail_74_85),
    .selector_IN_UNBOUNDED___assert_fail_74_86(selector_IN_UNBOUNDED___assert_fail_74_86),
    .selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0(selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0),
    .fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf(fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf),
    .fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf(fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf),
    .fuselector___builtin_abort_5_i0_abort(fuselector___builtin_abort_5_i0_abort),
    .fuselector___builtin_abort_5_i0___builtin_abort(fuselector___builtin_abort_5_i0___builtin_abort),
    .wrenable_reg_0(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port___assertion_REG (.out1(in_port___assertion_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port___assertion_SIGI1));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port___file_REG (.out1(in_port___file_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port___file_SIGI1));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port___function_REG (.out1(in_port___function_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port___function_SIGI1));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port___line_REG (.out1(in_port___line_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port___line_SIGI1));
  // io-signal post fix
  assign in_port___assertion_SIGI1 = __assertion;
  assign in_port___file_SIGI1 = __file;
  assign in_port___line_SIGI1 = __line;
  assign in_port___function_SIGI1 = __function;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module DPROXY_CTRLN(in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  output [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  output [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  output [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  output [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  generate
  genvar i0;
  for (i0=0; i0<PORTSIZE_out1; i0=i0+1)
    begin : L0
      assign out1[(i0+1)*BITSIZE_out1-1:i0*BITSIZE_out1] = proxy_out1[(i0+1)*BITSIZE_proxy_out1-1:i0*BITSIZE_proxy_out1];
    end
  endgenerate
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign proxy_in1[(i1+1)*BITSIZE_proxy_in1-1:i1*BITSIZE_proxy_in1] = int_sel_STORE[i1] ? in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1] : 0;
    end
  endgenerate
  generate
  genvar i2;
  for (i2=0; i2<PORTSIZE_in2; i2=i2+1)
    begin : L2
      assign proxy_in2[(i2+1)*BITSIZE_proxy_in2-1:i2*BITSIZE_proxy_in2] = int_sel_LOAD[i2]|int_sel_STORE[i2] ? in2[(i2+1)*BITSIZE_in2-1:i2*BITSIZE_in2] : 0;
    end
  endgenerate
  generate
  genvar i3;
  for (i3=0; i3<PORTSIZE_in3; i3=i3+1)
    begin : L3
      assign proxy_in3[(i3+1)*BITSIZE_proxy_in3-1:i3*BITSIZE_proxy_in3] = int_sel_LOAD[i3]|int_sel_STORE[i3] ? in3[(i3+1)*BITSIZE_in3-1:i3*BITSIZE_in3] : 0;
    end
  endgenerate
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign proxy_sel_LOAD = int_sel_LOAD;
  assign proxy_sel_STORE = int_sel_STORE;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module PROXY_CTRLN(in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  output [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  output [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  output [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  output [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  assign int_sel_STORE = sel_STORE & in4;
  assign int_sel_LOAD = sel_LOAD & in4;
  generate
  genvar i0;
  for (i0=0; i0<PORTSIZE_out1; i0=i0+1)
    begin : L0
      assign out1[(i0+1)*BITSIZE_out1-1:i0*BITSIZE_out1] = proxy_out1[(i0+1)*BITSIZE_proxy_out1-1:i0*BITSIZE_proxy_out1];
    end
  endgenerate
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign proxy_in1[(i1+1)*BITSIZE_proxy_in1-1:i1*BITSIZE_proxy_in1] = int_sel_STORE[i1] ? in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1] : 0;
    end
  endgenerate
  generate
  genvar i2;
  for (i2=0; i2<PORTSIZE_in2; i2=i2+1)
    begin : L2
      assign proxy_in2[(i2+1)*BITSIZE_proxy_in2-1:i2*BITSIZE_proxy_in2] = int_sel_LOAD[i2]|int_sel_STORE[i2] ? in2[(i2+1)*BITSIZE_in2-1:i2*BITSIZE_in2] : 0;
    end
  endgenerate
  generate
  genvar i3;
  for (i3=0; i3<PORTSIZE_in3; i3=i3+1)
    begin : L3
      assign proxy_in3[(i3+1)*BITSIZE_proxy_in3-1:i3*BITSIZE_proxy_in3] = int_sel_LOAD[i3]|int_sel_STORE[i3] ? in3[(i3+1)*BITSIZE_in3-1:i3*BITSIZE_in3] : 0;
    end
  endgenerate
  assign proxy_sel_LOAD = int_sel_LOAD;
  assign proxy_sel_STORE = int_sel_STORE;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRLN(clock,
  in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  Min_oe_ram,
  Mout_oe_ram,
  Min_we_ram,
  Mout_we_ram,
  Min_addr_ram,
  Mout_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Mout_Wdata_ram,
  Min_data_ram_size,
  Mout_data_ram_size,
  M_DataRdy);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2;
  // IN
  input clock;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_Mout_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_Mout_oe_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  wire  [(PORTSIZE_in2*BITSIZE_in2)-1:0] tmp_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign tmp_addr = in2;
  generate
  genvar i;
    for (i=0; i<max_n_rw; i=i+1)
    begin : L0
      assign Mout_addr_ram[(i+1)*BITSIZE_Mout_addr_ram-1:i*BITSIZE_Mout_addr_ram] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (tmp_addr[(i+1)*BITSIZE_in2-1:i*BITSIZE_in2]) : Min_addr_ram[(i+1)*BITSIZE_Min_addr_ram-1:i*BITSIZE_Min_addr_ram];
    end
    endgenerate
  assign Mout_oe_ram = int_sel_LOAD | Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE | Min_we_ram;
  generate
    for (i=0; i<max_n_reads; i=i+1)
    begin : L1
      assign out1[(i+1)*BITSIZE_out1-1:i*BITSIZE_out1] = M_Rdata_ram[i*BITSIZE_M_Rdata_ram+BITSIZE_out1-1:i*BITSIZE_M_Rdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L2
      assign Mout_Wdata_ram[(i+1)*BITSIZE_Mout_Wdata_ram-1:i*BITSIZE_Mout_Wdata_ram] = int_sel_STORE[i] ? in1[(i+1)*BITSIZE_in1-1:i*BITSIZE_in1] : Min_Wdata_ram[(i+1)*BITSIZE_Min_Wdata_ram-1:i*BITSIZE_Min_Wdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L3
      assign Mout_data_ram_size[(i+1)*BITSIZE_Mout_data_ram_size-1:i*BITSIZE_Mout_data_ram_size] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (in3[(i+1)*BITSIZE_in3-1:i*BITSIZE_in3]) : Min_data_ram_size[(i+1)*BITSIZE_Min_data_ram_size-1:i*BITSIZE_Min_data_ram_size];
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_concat_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1,
    OFFSET_PARAMETER=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  parameter nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire [nbit_out-1:0] tmp_in1;
  wire [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){1'b0}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){1'b0}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ge_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 >= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_VECTOR_BOOL_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Datapath RTL description for __internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___internal_free(clock,
  reset,
  in_port_ap,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_41_i0_LOAD,
  fuselector_BMEMORY_CTRLN_41_i0_STORE,
  fuselector_BMEMORY_CTRLN_41_i1_LOAD,
  fuselector_BMEMORY_CTRLN_41_i1_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0,
  selector_MUX_52_reg_0_0_0_0,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0,
  selector_MUX_60_reg_16_0_0_0,
  selector_MUX_66_reg_6_0_0_0,
  selector_MUX_66_reg_6_0_0_1,
  selector_MUX_69_reg_9_0_0_0,
  selector_MUX_69_reg_9_0_0_1,
  selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_free_737_774,
  OUT_CONDITION___internal_free_737_846,
  OUT_CONDITION___internal_free_737_848,
  OUT_CONDITION___internal_free_737_854,
  OUT_CONDITION___internal_free_737_870,
  OUT_CONDITION___internal_free_737_909);
  parameter MEM_var_792_38248=524288;
  // IN
  input clock;
  input reset;
  input [31:0] in_port_ap;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] proxy_out1_792;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_41_i0_STORE;
  input fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_41_i1_STORE;
  input fuselector_DPROXY_CTRLN_0_i0_LOAD;
  input fuselector_DPROXY_CTRLN_0_i0_STORE;
  input selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  input selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  input selector_MUX_52_reg_0_0_0_0;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  input selector_MUX_60_reg_16_0_0_0;
  input selector_MUX_66_reg_6_0_0_0;
  input selector_MUX_66_reg_6_0_0_1;
  input selector_MUX_69_reg_9_0_0_0;
  input selector_MUX_69_reg_9_0_0_1;
  input selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [11:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION___internal_free_737_774;
  output OUT_CONDITION___internal_free_737_846;
  output OUT_CONDITION___internal_free_737_848;
  output OUT_CONDITION___internal_free_737_854;
  output OUT_CONDITION___internal_free_737_870;
  output OUT_CONDITION___internal_free_737_909;
  // Component and signal declarations
  wire [31:0] null_out_signal_DPROXY_CTRLN_0_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0;
  wire [31:0] out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0;
  wire [31:0] out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  wire [31:0] out_MUX_52_reg_0_0_0_0;
  wire [22:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  wire [22:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  wire [22:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  wire [22:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  wire [31:0] out_MUX_60_reg_16_0_0_0;
  wire [31:0] out_MUX_66_reg_6_0_0_0;
  wire [31:0] out_MUX_66_reg_6_0_0_1;
  wire [31:0] out_MUX_69_reg_9_0_0_0;
  wire [31:0] out_MUX_69_reg_9_0_0_1;
  wire [22:0] out_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  wire [22:0] out_UUdata_converter_FU_17_i0_fu___internal_free_737_39574;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_free_737_39567;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_free_737_39546;
  wire [22:0] out_UUdata_converter_FU_20_i0_fu___internal_free_737_39532;
  wire [22:0] out_UUdata_converter_FU_23_i0_fu___internal_free_737_39656;
  wire [22:0] out_UUdata_converter_FU_24_i0_fu___internal_free_737_39635;
  wire [22:0] out_UUdata_converter_FU_25_i0_fu___internal_free_737_39678;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_free_737_39649;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_free_737_39738;
  wire [22:0] out_UUdata_converter_FU_28_i0_fu___internal_free_737_39720;
  wire [22:0] out_UUdata_converter_FU_29_i0_fu___internal_free_737_39770;
  wire [22:0] out_UUdata_converter_FU_30_i0_fu___internal_free_737_39763;
  wire [22:0] out_UUdata_converter_FU_31_i0_fu___internal_free_737_39800;
  wire [22:0] out_UUdata_converter_FU_32_i0_fu___internal_free_737_39793;
  wire [22:0] out_UUdata_converter_FU_4_i0_fu___internal_free_737_39605;
  wire [22:0] out_UUdata_converter_FU_5_i0_fu___internal_free_737_39597;
  wire [22:0] out_UUdata_converter_FU_6_i0_fu___internal_free_737_39667;
  wire [22:0] out_UUdata_converter_FU_7_i0_fu___internal_free_737_39642;
  wire [22:0] out_UUdata_converter_FU_8_i0_fu___internal_free_737_39727;
  wire [22:0] out_UUdata_converter_FU_9_i0_fu___internal_free_737_39713;
  wire [19:0] out_addr_expr_FU_10_i0_fu___internal_free_737_39789;
  wire [19:0] out_addr_expr_FU_3_i0_fu___internal_free_737_39521;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire out_const_2;
  wire [2:0] out_const_3;
  wire [3:0] out_const_4;
  wire [1:0] out_const_5;
  wire [3:0] out_const_6;
  wire [31:0] out_const_7;
  wire [19:0] out_const_8;
  wire [5:0] out_conv_out_const_1_7_6;
  wire [31:0] out_conv_out_const_8_20_32;
  wire [22:0] out_conv_out_reg_1_reg_1_20_23;
  wire [22:0] out_conv_out_reg_5_reg_5_20_23;
  wire out_lut_expr_FU_14_i0_fu___internal_free_737_42301;
  wire out_lut_expr_FU_39_i0_fu___internal_free_737_42303;
  wire out_read_cond_FU_11_i0_fu___internal_free_737_774;
  wire out_read_cond_FU_15_i0_fu___internal_free_737_846;
  wire out_read_cond_FU_21_i0_fu___internal_free_737_848;
  wire out_read_cond_FU_33_i0_fu___internal_free_737_854;
  wire out_read_cond_FU_37_i0_fu___internal_free_737_870;
  wire out_read_cond_FU_40_i0_fu___internal_free_737_909;
  wire [31:0] out_reg_0_reg_0;
  wire [22:0] out_reg_10_reg_10;
  wire [22:0] out_reg_11_reg_11;
  wire [22:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [22:0] out_reg_14_reg_14;
  wire [22:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [19:0] out_reg_1_reg_1;
  wire [22:0] out_reg_2_reg_2;
  wire [22:0] out_reg_3_reg_3;
  wire [22:0] out_reg_4_reg_4;
  wire [19:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [22:0] out_reg_7_reg_7;
  wire [22:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_40550;
  wire out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_40560;
  wire out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_40562;
  wire out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_40552;
  wire out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_40556;
  wire out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_40558;
  wire out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_40564;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868;
  wire out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_40554;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_39601;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39638;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39645;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39723;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39766;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_39618;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39695;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39750;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu___internal_free_737_780;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869;
  wire [31:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0;
  wire [31:0] out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1;
  wire [31:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2;
  wire [31:0] out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3;
  wire [31:0] out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_4;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_in_bus_mergerproxy_in1_7925_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_7926_0;
  wire [11:0] sig_in_bus_mergerproxy_in3_7927_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_7928_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_7929_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_in_vector_bus_mergerproxy_in1_7925_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_7926_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in3_7927_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_7928_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_7929_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [63:0] sig_out_bus_mergerproxy_in1_7925_;
  wire [45:0] sig_out_bus_mergerproxy_in2_7926_;
  wire [11:0] sig_out_bus_mergerproxy_in3_7927_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_7928_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_7929_;
  
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_0 (.out1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0),
    .in1(out_reg_16_reg_16));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_1 (.out1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1),
    .in1(out_reg_9_reg_9));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_2 (.out1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in1(out_reg_17_reg_17));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_3 (.out1(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3),
    .in1(out_reg_0_reg_0));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_4 (.out1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_4),
    .in1(out_reg_6_reg_6));
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(23),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(23),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_41_i0 (.out1({out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0,
      out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({out_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0,
      out_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0}),
    .in2({out_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0,
      out_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0}),
    .in3({out_conv_out_const_1_7_6,
      out_conv_out_const_1_7_6}),
    .in4({out_const_2,
      out_const_2}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_41_i1_LOAD,
      fuselector_BMEMORY_CTRLN_41_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_41_i1_STORE,
      fuselector_BMEMORY_CTRLN_41_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  DPROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) DPROXY_CTRLN_0_i0 (.out1({null_out_signal_DPROXY_CTRLN_0_i0_out1_1,
      out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_7925_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_7926_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_7927_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_7928_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_7929_0),
    .in1({32'b00000000000000000000000000000000,
      out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_4}),
    .in2({23'b00000000000000000000000,
      out_MUX_9_DPROXY_CTRLN_0_i0_1_0_0}),
    .in3({6'b000000,
      out_conv_out_const_1_7_6}),
    .in4({1'b0,
      out_const_2}),
    .sel_LOAD({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_STORE}),
    .proxy_out1(proxy_out1_792));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_41_i0_0_0_0 (.out1(out_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .sel(selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .in1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in2(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_41_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_14_reg_14));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_41_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .in1(out_reg_12_reg_12),
    .in2(out_reg_11_reg_11));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_41_i0_1_0_2 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .in1(out_reg_10_reg_10),
    .in2(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .in2(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_41_i1_0_0_0 (.out1(out_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .in1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0),
    .in2(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_52_reg_0_0_0_0 (.out1(out_MUX_52_reg_0_0_0_0),
    .sel(selector_MUX_52_reg_0_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu___internal_free_737_780));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_BMEMORY_CTRLN_41_i1_1_0_0 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_4_reg_4));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_BMEMORY_CTRLN_41_i1_1_0_1 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_2_reg_2));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_BMEMORY_CTRLN_41_i1_1_0_2 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .in1(out_reg_15_reg_15),
    .in2(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .in1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .in2(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_60_reg_16_0_0_0 (.out1(out_MUX_60_reg_16_0_0_0),
    .sel(selector_MUX_60_reg_16_0_0_0),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .in2(out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_66_reg_6_0_0_0 (.out1(out_MUX_66_reg_6_0_0_0),
    .sel(selector_MUX_66_reg_6_0_0_0),
    .in1(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_66_reg_6_0_0_1 (.out1(out_MUX_66_reg_6_0_0_1),
    .sel(selector_MUX_66_reg_6_0_0_1),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0),
    .in2(out_MUX_66_reg_6_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_69_reg_9_0_0_0 (.out1(out_MUX_69_reg_9_0_0_0),
    .sel(selector_MUX_69_reg_9_0_0_0),
    .in1(out_reg_13_reg_13),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_69_reg_9_0_0_1 (.out1(out_MUX_69_reg_9_0_0_1),
    .sel(selector_MUX_69_reg_9_0_0_1),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .in2(out_MUX_69_reg_9_0_0_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_DPROXY_CTRLN_0_i0_1_0_0 (.out1(out_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .sel(selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .in1(out_conv_out_reg_5_reg_5_20_23),
    .in2(out_conv_out_reg_1_reg_1_20_23));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in1_7925_ (.out1(sig_out_bus_mergerproxy_in1_7925_),
    .in1({sig_in_bus_mergerproxy_in1_7925_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in2_7926_ (.out1(sig_out_bus_mergerproxy_in2_7926_),
    .in1({sig_in_bus_mergerproxy_in2_7926_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in3_7927_ (.out1(sig_out_bus_mergerproxy_in3_7927_),
    .in1({sig_in_bus_mergerproxy_in3_7927_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_7928_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_7928_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_7928_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_7929_ (.out1(sig_out_bus_mergerproxy_sel_STORE_7929_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_7929_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_792_38248)) const_8 (.out1(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_1_7_6 (.out1(out_conv_out_const_1_7_6),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_8_20_32 (.out1(out_conv_out_const_8_20_32),
    .in1(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_1_reg_1_20_23 (.out1(out_conv_out_reg_1_reg_1_20_23),
    .in1(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_5_reg_5_20_23 (.out1(out_conv_out_reg_5_reg_5_20_23),
    .in1(out_reg_5_reg_5));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_free_737_39521 (.out1(out_addr_expr_FU_3_i0_fu___internal_free_737_39521),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39532 (.out1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_39532),
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_39546));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39546 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_39546),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39567 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_39567),
    .in1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_39574));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39574 (.out1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_39574),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39597 (.out1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_39597),
    .in1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_39605));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39601 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_39601),
    .in1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_39597),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39605 (.out1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_39605),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_39618));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39618 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_39618),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39635 (.out1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_39635),
    .in1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39656));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39638 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39638),
    .in1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_39635),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39642 (.out1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39642),
    .in1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39667));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39645 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39645),
    .in1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39642),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39649 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39649),
    .in1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39678));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39656 (.out1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39656),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39667 (.out1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39667),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39695));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39678 (.out1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39678),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39695 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39695),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39713 (.out1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39713),
    .in1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39727));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39720 (.out1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39720),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39738));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39723 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39723),
    .in1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39720),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39727 (.out1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39727),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39750));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39738 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39738),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39750 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39750),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39763 (.out1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39763),
    .in1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39770));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39766 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39766),
    .in1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39763),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39770 (.out1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39770),
    .in1(out_reg_6_reg_6));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_free_737_39789 (.out1(out_addr_expr_FU_10_i0_fu___internal_free_737_39789),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39793 (.out1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39793),
    .in1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39800));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39800 (.out1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39800),
    .in1(out_reg_6_reg_6));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_free_737_40550 (.out1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_40550),
    .in1(in_port_ap),
    .in2(out_const_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_40552 (.out1(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_40552),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_40554 (.out1(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_40554),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_40556 (.out1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_40556),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_40558 (.out1(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_40558),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_40560 (.out1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_40560),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824),
    .in2(out_reg_9_reg_9));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_40562 (.out1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_40562),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_40564 (.out1(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_40564),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_42301 (.out1(out_lut_expr_FU_14_i0_fu___internal_free_737_42301),
    .in1(out_const_4),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_40552),
    .in3(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_40554),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_42303 (.out1(out_lut_expr_FU_39_i0_fu___internal_free_737_42303),
    .in1(out_const_6),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_40558),
    .in3(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_40564),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_774 (.out1(out_read_cond_FU_11_i0_fu___internal_free_737_774),
    .in1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_40550));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_free_737_780 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu___internal_free_737_780),
    .in1(in_port_ap),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___internal_free_737_815 (.out1(out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815),
    .in1(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0),
    .in2(out_reg_13_reg_13));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_free_737_824 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824),
    .in1(out_reg_0_reg_0),
    .in2(out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_free_737_827 (.out1(out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_846 (.out1(out_read_cond_FU_15_i0_fu___internal_free_737_846),
    .in1(out_lut_expr_FU_14_i0_fu___internal_free_737_42301));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_848 (.out1(out_read_cond_FU_21_i0_fu___internal_free_737_848),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_40556));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_854 (.out1(out_read_cond_FU_33_i0_fu___internal_free_737_854),
    .in1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_40560));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_free_737_868 (.out1(out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868),
    .in1(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_free_737_869 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_870 (.out1(out_read_cond_FU_37_i0_fu___internal_free_737_870),
    .in1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_40562));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___internal_free_737_886 (.out1(out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886),
    .in1(out_reg_16_reg_16),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_909 (.out1(out_read_cond_FU_40_i0_fu___internal_free_737_909),
    .in1(out_lut_expr_FU_39_i0_fu___internal_free_737_42303));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in1_7925_0 (.out1(sig_in_bus_mergerproxy_in1_7925_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7925_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in2_7926_0 (.out1(sig_in_bus_mergerproxy_in2_7926_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_7926_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in3_7927_0 (.out1(sig_in_bus_mergerproxy_in3_7927_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_7927_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_7928_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_7928_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_7928_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_7929_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_7929_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_7929_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_52_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_3_i0_fu___internal_free_737_39521),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39723),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39766),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39793),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39638),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39649),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_60_reg_16_0_0_0),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_39601),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39645),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39713),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_10_i0_fu___internal_free_737_39789),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_66_reg_6_0_0_1),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_39567),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_39532),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_69_reg_9_0_0_1),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7925_ (.out1(proxy_in1_792),
    .in1(sig_out_bus_mergerproxy_in1_7925_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_7926_ (.out1(proxy_in2_792),
    .in1(sig_out_bus_mergerproxy_in2_7926_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_7927_ (.out1(proxy_in3_792),
    .in1(sig_out_bus_mergerproxy_in3_7927_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_7928_ (.out1(proxy_sel_LOAD_792),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_7928_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_7929_ (.out1(proxy_sel_STORE_792),
    .in1(sig_out_bus_mergerproxy_sel_STORE_7929_));
  // io-signal post fix
  assign OUT_CONDITION___internal_free_737_774 = out_read_cond_FU_11_i0_fu___internal_free_737_774;
  assign OUT_CONDITION___internal_free_737_846 = out_read_cond_FU_15_i0_fu___internal_free_737_846;
  assign OUT_CONDITION___internal_free_737_848 = out_read_cond_FU_21_i0_fu___internal_free_737_848;
  assign OUT_CONDITION___internal_free_737_854 = out_read_cond_FU_33_i0_fu___internal_free_737_854;
  assign OUT_CONDITION___internal_free_737_870 = out_read_cond_FU_37_i0_fu___internal_free_737_870;
  assign OUT_CONDITION___internal_free_737_909 = out_read_cond_FU_40_i0_fu___internal_free_737_909;

endmodule

// FSM based controller description for __internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___internal_free(done_port,
  fuselector_BMEMORY_CTRLN_41_i0_LOAD,
  fuselector_BMEMORY_CTRLN_41_i0_STORE,
  fuselector_BMEMORY_CTRLN_41_i1_LOAD,
  fuselector_BMEMORY_CTRLN_41_i1_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0,
  selector_MUX_52_reg_0_0_0_0,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0,
  selector_MUX_60_reg_16_0_0_0,
  selector_MUX_66_reg_6_0_0_0,
  selector_MUX_66_reg_6_0_0_1,
  selector_MUX_69_reg_9_0_0_0,
  selector_MUX_69_reg_9_0_0_1,
  selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_free_737_774,
  OUT_CONDITION___internal_free_737_846,
  OUT_CONDITION___internal_free_737_848,
  OUT_CONDITION___internal_free_737_854,
  OUT_CONDITION___internal_free_737_870,
  OUT_CONDITION___internal_free_737_909,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION___internal_free_737_774;
  input OUT_CONDITION___internal_free_737_846;
  input OUT_CONDITION___internal_free_737_848;
  input OUT_CONDITION___internal_free_737_854;
  input OUT_CONDITION___internal_free_737_870;
  input OUT_CONDITION___internal_free_737_909;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_41_i0_STORE;
  output fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_41_i1_STORE;
  output fuselector_DPROXY_CTRLN_0_i0_LOAD;
  output fuselector_DPROXY_CTRLN_0_i0_STORE;
  output selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  output selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  output selector_MUX_52_reg_0_0_0_0;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  output selector_MUX_60_reg_16_0_0_0;
  output selector_MUX_66_reg_6_0_0_0;
  output selector_MUX_66_reg_6_0_0_1;
  output selector_MUX_69_reg_9_0_0_0;
  output selector_MUX_69_reg_9_0_0_1;
  output selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [16:0] S_0 = 17'b00000000000000001,
    S_16 = 17'b10000000000000000,
    S_1 = 17'b00000000000000010,
    S_4 = 17'b00000000000010000,
    S_14 = 17'b00100000000000000,
    S_15 = 17'b01000000000000000,
    S_2 = 17'b00000000000000100,
    S_3 = 17'b00000000000001000,
    S_5 = 17'b00000000000100000,
    S_6 = 17'b00000000001000000,
    S_7 = 17'b00000000010000000,
    S_8 = 17'b00000000100000000,
    S_9 = 17'b00000001000000000,
    S_10 = 17'b00000010000000000,
    S_11 = 17'b00000100000000000,
    S_12 = 17'b00001000000000000,
    S_13 = 17'b00010000000000000;
  reg [16:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_41_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_41_i1_STORE;
  reg fuselector_DPROXY_CTRLN_0_i0_LOAD;
  reg fuselector_DPROXY_CTRLN_0_i0_STORE;
  reg selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  reg selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  reg selector_MUX_52_reg_0_0_0_0;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  reg selector_MUX_60_reg_16_0_0_0;
  reg selector_MUX_66_reg_6_0_0_0;
  reg selector_MUX_66_reg_6_0_0_1;
  reg selector_MUX_69_reg_9_0_0_0;
  reg selector_MUX_69_reg_9_0_0_1;
  reg selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i1_STORE = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0 = 1'b0;
    selector_MUX_52_reg_0_0_0_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 = 1'b0;
    selector_MUX_60_reg_16_0_0_0 = 1'b0;
    selector_MUX_66_reg_6_0_0_0 = 1'b0;
    selector_MUX_66_reg_6_0_0_1 = 1'b0;
    selector_MUX_69_reg_9_0_0_0 = 1'b0;
    selector_MUX_69_reg_9_0_0_1 = 1'b0;
    selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          if (OUT_CONDITION___internal_free_737_774 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_16;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_16 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b1;
          selector_MUX_66_reg_6_0_0_1 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          if (OUT_CONDITION___internal_free_737_848 == 1'b1)
            begin
              _next_state = S_2;
              wrenable_reg_7 = 1'b0;
            end
          else
            begin
              _next_state = S_14;
              wrenable_reg_8 = 1'b0;
            end
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          selector_MUX_69_reg_9_0_0_1 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION___internal_free_737_909 == 1'b1)
            begin
              _next_state = S_5;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
              selector_MUX_69_reg_9_0_0_1 = 1'b0;
              wrenable_reg_9 = 1'b0;
            end
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_MUX_66_reg_6_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION___internal_free_737_846 == 1'b1)
            begin
              _next_state = S_5;
              selector_MUX_66_reg_6_0_0_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
              wrenable_reg_9 = 1'b0;
            end
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          selector_MUX_60_reg_16_0_0_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          if (OUT_CONDITION___internal_free_737_854 == 1'b1)
            begin
              _next_state = S_7;
              selector_MUX_60_reg_16_0_0_0 = 1'b0;
              wrenable_reg_16 = 1'b0;
            end
          else
            begin
              _next_state = S_10;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_7 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          wrenable_reg_13 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_41_i1_STORE = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 = 1'b1;
          selector_MUX_69_reg_9_0_0_0 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_41_i1_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          wrenable_reg_17 = 1'b1;
          if (OUT_CONDITION___internal_free_737_870 == 1'b1)
            begin
              _next_state = S_12;
            end
          else
            begin
              _next_state = S_13;
              done_port = 1'b1;
              wrenable_reg_17 = 1'b0;
            end
        end
      S_12 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 = 1'b1;
          selector_MUX_52_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          _next_state = S_13;
          done_port = 1'b1;
        end
      S_13 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_STORE = 1'b1;
          fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 = 1'b1;
          selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0 = 1'b1;
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for __internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __internal_free(clock,
  reset,
  start_port,
  done_port,
  ap,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  parameter MEM_var_792_38248=524288;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] ap;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] proxy_out1_792;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [63:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [11:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION___internal_free_737_774;
  wire OUT_CONDITION___internal_free_737_846;
  wire OUT_CONDITION___internal_free_737_848;
  wire OUT_CONDITION___internal_free_737_854;
  wire OUT_CONDITION___internal_free_737_870;
  wire OUT_CONDITION___internal_free_737_909;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_41_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_41_i1_STORE;
  wire fuselector_DPROXY_CTRLN_0_i0_LOAD;
  wire fuselector_DPROXY_CTRLN_0_i0_STORE;
  wire selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  wire selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  wire selector_MUX_52_reg_0_0_0_0;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  wire selector_MUX_60_reg_16_0_0_0;
  wire selector_MUX_66_reg_6_0_0_0;
  wire selector_MUX_66_reg_6_0_0_1;
  wire selector_MUX_69_reg_9_0_0_0;
  wire selector_MUX_69_reg_9_0_0_1;
  wire selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___internal_free Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_41_i0_LOAD(fuselector_BMEMORY_CTRLN_41_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i0_STORE(fuselector_BMEMORY_CTRLN_41_i0_STORE),
    .fuselector_BMEMORY_CTRLN_41_i1_LOAD(fuselector_BMEMORY_CTRLN_41_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i1_STORE(fuselector_BMEMORY_CTRLN_41_i1_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0(selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .selector_MUX_52_reg_0_0_0_0(selector_MUX_52_reg_0_0_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .selector_MUX_60_reg_16_0_0_0(selector_MUX_60_reg_16_0_0_0),
    .selector_MUX_66_reg_6_0_0_0(selector_MUX_66_reg_6_0_0_0),
    .selector_MUX_66_reg_6_0_0_1(selector_MUX_66_reg_6_0_0_1),
    .selector_MUX_69_reg_9_0_0_0(selector_MUX_69_reg_9_0_0_0),
    .selector_MUX_69_reg_9_0_0_1(selector_MUX_69_reg_9_0_0_1),
    .selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION___internal_free_737_774(OUT_CONDITION___internal_free_737_774),
    .OUT_CONDITION___internal_free_737_846(OUT_CONDITION___internal_free_737_846),
    .OUT_CONDITION___internal_free_737_848(OUT_CONDITION___internal_free_737_848),
    .OUT_CONDITION___internal_free_737_854(OUT_CONDITION___internal_free_737_854),
    .OUT_CONDITION___internal_free_737_870(OUT_CONDITION___internal_free_737_870),
    .OUT_CONDITION___internal_free_737_909(OUT_CONDITION___internal_free_737_909),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___internal_free #(.MEM_var_792_38248(MEM_var_792_38248)) Datapath_i (.proxy_in1_792(proxy_in1_792),
    .proxy_in2_792(proxy_in2_792),
    .proxy_in3_792(proxy_in3_792),
    .proxy_sel_LOAD_792(proxy_sel_LOAD_792),
    .proxy_sel_STORE_792(proxy_sel_STORE_792),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION___internal_free_737_774(OUT_CONDITION___internal_free_737_774),
    .OUT_CONDITION___internal_free_737_846(OUT_CONDITION___internal_free_737_846),
    .OUT_CONDITION___internal_free_737_848(OUT_CONDITION___internal_free_737_848),
    .OUT_CONDITION___internal_free_737_854(OUT_CONDITION___internal_free_737_854),
    .OUT_CONDITION___internal_free_737_870(OUT_CONDITION___internal_free_737_870),
    .OUT_CONDITION___internal_free_737_909(OUT_CONDITION___internal_free_737_909),
    .clock(clock),
    .reset(reset),
    .in_port_ap(ap),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_41_i0_LOAD(fuselector_BMEMORY_CTRLN_41_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i0_STORE(fuselector_BMEMORY_CTRLN_41_i0_STORE),
    .fuselector_BMEMORY_CTRLN_41_i1_LOAD(fuselector_BMEMORY_CTRLN_41_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i1_STORE(fuselector_BMEMORY_CTRLN_41_i1_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0(selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .selector_MUX_52_reg_0_0_0_0(selector_MUX_52_reg_0_0_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .selector_MUX_60_reg_16_0_0_0(selector_MUX_60_reg_16_0_0_0),
    .selector_MUX_66_reg_6_0_0_0(selector_MUX_66_reg_6_0_0_0),
    .selector_MUX_66_reg_6_0_0_1(selector_MUX_66_reg_6_0_0_1),
    .selector_MUX_69_reg_9_0_0_0(selector_MUX_69_reg_9_0_0_0),
    .selector_MUX_69_reg_9_0_0_1(selector_MUX_69_reg_9_0_0_1),
    .selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_UNSIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Datapath RTL description for __internal_malloc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___internal_malloc(clock,
  reset,
  return_port,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  proxy_out1_796,
  proxy_in1_796,
  proxy_in2_796,
  proxy_in3_796,
  proxy_sel_LOAD_796,
  proxy_sel_STORE_796,
  proxy_out1_992,
  proxy_in1_992,
  proxy_in2_992,
  proxy_in3_992,
  proxy_sel_LOAD_992,
  proxy_sel_STORE_992,
  proxy_out1_1020,
  proxy_in1_1020,
  proxy_in2_1020,
  proxy_in3_1020,
  proxy_sel_LOAD_1020,
  proxy_sel_STORE_1020,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_93_i0_LOAD,
  fuselector_BMEMORY_CTRLN_93_i0_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  fuselector_DPROXY_CTRLN_2_i0_LOAD,
  fuselector_DPROXY_CTRLN_2_i0_STORE,
  selector_IN_UNBOUNDED___internal_malloc_738_1067,
  selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0,
  selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1,
  selector_MUX_100_reg_9_0_0_0,
  selector_MUX_100_reg_9_0_0_1,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0,
  selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1,
  selector_MUX_65_gimple_return_FU_50_i0_0_0_0,
  selector_MUX_72_reg_0_0_0_0,
  selector_MUX_79_reg_15_0_0_0,
  selector_MUX_86_reg_21_0_0_0,
  selector_MUX_99_reg_8_0_0_0,
  selector_MUX_99_reg_8_0_0_1,
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0,
  fuselector_PROXY_CTRLN_1_i0_LOAD,
  fuselector_PROXY_CTRLN_1_i0_STORE,
  fuselector_PROXY_CTRLN_1_i1_LOAD,
  fuselector_PROXY_CTRLN_1_i1_STORE,
  fuselector_PROXY_CTRLN_3_i0_LOAD,
  fuselector_PROXY_CTRLN_3_i0_STORE,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_malloc_738_1150,
  OUT_CONDITION___internal_malloc_738_1152,
  OUT_CONDITION___internal_malloc_738_1155,
  OUT_CONDITION___internal_malloc_738_921,
  OUT_CONDITION___internal_malloc_738_951,
  OUT_CONDITION___internal_malloc_738_975,
  OUT_UNBOUNDED___internal_malloc_738_1067);
  parameter MEM_var_1020_38248=1048576,
    MEM_var_792_38248=524288,
    MEM_var_796_38248=524288,
    MEM_var_992_38248=524288;
  // IN
  input clock;
  input reset;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] proxy_out1_792;
  input [63:0] proxy_out1_796;
  input [63:0] proxy_out1_992;
  input [63:0] proxy_out1_1020;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_93_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_93_i0_STORE;
  input fuselector_DPROXY_CTRLN_0_i0_LOAD;
  input fuselector_DPROXY_CTRLN_0_i0_STORE;
  input fuselector_DPROXY_CTRLN_2_i0_LOAD;
  input fuselector_DPROXY_CTRLN_2_i0_STORE;
  input selector_IN_UNBOUNDED___internal_malloc_738_1067;
  input selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0;
  input selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1;
  input selector_MUX_100_reg_9_0_0_0;
  input selector_MUX_100_reg_9_0_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2;
  input selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3;
  input selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0;
  input selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1;
  input selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0;
  input selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  input selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  input selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  input selector_MUX_65_gimple_return_FU_50_i0_0_0_0;
  input selector_MUX_72_reg_0_0_0_0;
  input selector_MUX_79_reg_15_0_0_0;
  input selector_MUX_86_reg_21_0_0_0;
  input selector_MUX_99_reg_8_0_0_0;
  input selector_MUX_99_reg_8_0_0_1;
  input selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  input fuselector_PROXY_CTRLN_1_i0_LOAD;
  input fuselector_PROXY_CTRLN_1_i0_STORE;
  input fuselector_PROXY_CTRLN_1_i1_LOAD;
  input fuselector_PROXY_CTRLN_1_i1_STORE;
  input fuselector_PROXY_CTRLN_3_i0_LOAD;
  input fuselector_PROXY_CTRLN_3_i0_STORE;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [31:0] return_port;
  output [63:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [11:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [63:0] proxy_in1_796;
  output [45:0] proxy_in2_796;
  output [11:0] proxy_in3_796;
  output [1:0] proxy_sel_LOAD_796;
  output [1:0] proxy_sel_STORE_796;
  output [63:0] proxy_in1_992;
  output [45:0] proxy_in2_992;
  output [11:0] proxy_in3_992;
  output [1:0] proxy_sel_LOAD_992;
  output [1:0] proxy_sel_STORE_992;
  output [63:0] proxy_in1_1020;
  output [45:0] proxy_in2_1020;
  output [11:0] proxy_in3_1020;
  output [1:0] proxy_sel_LOAD_1020;
  output [1:0] proxy_sel_STORE_1020;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION___internal_malloc_738_1150;
  output OUT_CONDITION___internal_malloc_738_1152;
  output OUT_CONDITION___internal_malloc_738_1155;
  output OUT_CONDITION___internal_malloc_738_921;
  output OUT_CONDITION___internal_malloc_738_951;
  output OUT_CONDITION___internal_malloc_738_975;
  output OUT_UNBOUNDED___internal_malloc_738_1067;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_93_i0_out1_1;
  wire [31:0] null_out_signal_DPROXY_CTRLN_0_i0_out1_1;
  wire [31:0] null_out_signal_DPROXY_CTRLN_2_i0_out1_1;
  wire [31:0] null_out_signal_PROXY_CTRLN_1_i0_out1_0;
  wire [31:0] null_out_signal_PROXY_CTRLN_1_i0_out1_1;
  wire [7:0] null_out_signal_PROXY_CTRLN_3_i0_out1_0;
  wire [7:0] null_out_signal_PROXY_CTRLN_3_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0;
  wire [31:0] out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0;
  wire [31:0] out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1;
  wire [31:0] out_MUX_100_reg_9_0_0_0;
  wire [31:0] out_MUX_100_reg_9_0_0_1;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0;
  wire [31:0] out_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  wire [22:0] out_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  wire [22:0] out_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  wire [31:0] out_MUX_65_gimple_return_FU_50_i0_0_0_0;
  wire [31:0] out_MUX_72_reg_0_0_0_0;
  wire [31:0] out_MUX_79_reg_15_0_0_0;
  wire [31:0] out_MUX_86_reg_21_0_0_0;
  wire [31:0] out_MUX_99_reg_8_0_0_0;
  wire [31:0] out_MUX_99_reg_8_0_0_1;
  wire [22:0] out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  wire [19:0] out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39907;
  wire [19:0] out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39891;
  wire [19:0] out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39918;
  wire [19:0] out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39900;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39847;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39833;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39858;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39840;
  wire [22:0] out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_40012;
  wire [22:0] out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39998;
  wire [22:0] out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39959;
  wire [22:0] out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39945;
  wire [22:0] out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39970;
  wire [22:0] out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39952;
  wire [22:0] out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_40023;
  wire [22:0] out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_40005;
  wire [22:0] out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_40111;
  wire [22:0] out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_40097;
  wire [20:0] out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_40074;
  wire [20:0] out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_40067;
  wire [22:0] out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_40122;
  wire [22:0] out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_40104;
  wire [22:0] out_addr_expr_FU_12_i0_fu___internal_malloc_738_39897;
  wire [19:0] out_addr_expr_FU_13_i0_fu___internal_malloc_738_39933;
  wire [22:0] out_addr_expr_FU_16_i0_fu___internal_malloc_738_39815;
  wire [22:0] out_addr_expr_FU_17_i0_fu___internal_malloc_738_39818;
  wire [19:0] out_addr_expr_FU_20_i0_fu___internal_malloc_738_40051;
  wire [22:0] out_addr_expr_FU_21_i0_fu___internal_malloc_738_40056;
  wire [19:0] out_addr_expr_FU_22_i0_fu___internal_malloc_738_40063;
  wire [19:0] out_addr_expr_FU_23_i0_fu___internal_malloc_738_40042;
  wire [19:0] out_addr_expr_FU_6_i0_fu___internal_malloc_738_39821;
  wire [19:0] out_addr_expr_FU_7_i0_fu___internal_malloc_738_39877;
  wire [22:0] out_addr_expr_FU_8_i0_fu___internal_malloc_738_39888;
  wire [19:0] out_addr_expr_FU_9_i0_fu___internal_malloc_738_39929;
  wire out_const_0;
  wire [31:0] out_const_1;
  wire [18:0] out_const_10;
  wire [2:0] out_const_11;
  wire [19:0] out_const_12;
  wire [22:0] out_const_13;
  wire [19:0] out_const_14;
  wire [31:0] out_const_2;
  wire [6:0] out_const_3;
  wire out_const_4;
  wire [2:0] out_const_5;
  wire [3:0] out_const_6;
  wire [11:0] out_const_7;
  wire [22:0] out_const_8;
  wire [1:0] out_const_9;
  wire [31:0] out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39815_23_32;
  wire [31:0] out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39818_23_32;
  wire [22:0] out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39821_20_23;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [31:0] out_conv_out_const_12_20_32;
  wire [31:0] out_conv_out_const_13_23_32;
  wire [31:0] out_conv_out_const_14_20_32;
  wire [5:0] out_conv_out_const_3_7_6;
  wire [31:0] out_conv_out_const_8_23_32;
  wire [22:0] out_conv_out_reg_10_reg_10_20_23;
  wire [31:0] out_conv_out_reg_11_reg_11_23_32;
  wire [22:0] out_conv_out_reg_12_reg_12_20_23;
  wire [31:0] out_conv_out_reg_13_reg_13_23_32;
  wire [22:0] out_conv_out_reg_14_reg_14_20_23;
  wire [22:0] out_conv_out_reg_19_reg_19_21_23;
  wire [22:0] out_conv_out_reg_2_reg_2_20_23;
  wire [22:0] out_conv_out_reg_3_reg_3_20_23;
  wire [22:0] out_conv_out_reg_5_reg_5_20_23;
  wire [22:0] out_conv_out_reg_8_reg_8_32_23;
  wire [22:0] out_conv_out_reg_9_reg_9_32_23;
  wire [31:0] out_conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_23_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_23_32;
  wire out_read_cond_FU_25_i0_fu___internal_malloc_738_921;
  wire out_read_cond_FU_28_i0_fu___internal_malloc_738_951;
  wire out_read_cond_FU_48_i0_fu___internal_malloc_738_975;
  wire out_read_cond_FU_73_i0_fu___internal_malloc_738_1150;
  wire out_read_cond_FU_77_i0_fu___internal_malloc_738_1152;
  wire out_read_cond_FU_92_i0_fu___internal_malloc_738_1155;
  wire [31:0] out_reg_0_reg_0;
  wire [19:0] out_reg_10_reg_10;
  wire [22:0] out_reg_11_reg_11;
  wire [19:0] out_reg_12_reg_12;
  wire [22:0] out_reg_13_reg_13;
  wire [19:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [22:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire [20:0] out_reg_19_reg_19;
  wire [22:0] out_reg_1_reg_1;
  wire [22:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [22:0] out_reg_25_reg_25;
  wire [22:0] out_reg_26_reg_26;
  wire [22:0] out_reg_27_reg_27;
  wire [22:0] out_reg_28_reg_28;
  wire [19:0] out_reg_2_reg_2;
  wire [19:0] out_reg_3_reg_3;
  wire [22:0] out_reg_4_reg_4;
  wire [19:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [22:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire [22:0] out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0;
  wire [22:0] out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_40807;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063;
  wire out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_40570;
  wire out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_40566;
  wire out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_40574;
  wire out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_40568;
  wire out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_40578;
  wire out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_40576;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_101_i0_fu___internal_malloc_738_1129;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_40803;
  wire [31:0] out_ui_minus_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_1121;
  wire [28:0] out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_40800;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_1079;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_1139;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39843;
  wire [19:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39903;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_40001;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_40008;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_40070;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_40107;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_40796;
  wire [31:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2;
  wire [31:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_3;
  wire [31:0] out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4;
  wire [31:0] out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_5;
  wire [31:0] out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_6;
  wire [31:0] out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7;
  wire [31:0] out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_8;
  wire [31:0] out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_9;
  wire s_done_fu___internal_malloc_738_1067;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_1;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_1;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_1;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_1;
  wire [63:0] sig_in_bus_mergerproxy_in1_10205_0;
  wire [63:0] sig_in_bus_mergerproxy_in1_7926_0;
  wire [63:0] sig_in_bus_mergerproxy_in1_7926_1;
  wire [63:0] sig_in_bus_mergerproxy_in1_7967_0;
  wire [63:0] sig_in_bus_mergerproxy_in1_9928_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_10209_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_79210_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_79210_1;
  wire [45:0] sig_in_bus_mergerproxy_in2_79611_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_99212_0;
  wire [11:0] sig_in_bus_mergerproxy_in3_102013_0;
  wire [11:0] sig_in_bus_mergerproxy_in3_79214_0;
  wire [11:0] sig_in_bus_mergerproxy_in3_79214_1;
  wire [11:0] sig_in_bus_mergerproxy_in3_79615_0;
  wire [11:0] sig_in_bus_mergerproxy_in3_99216_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_102017_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_79218_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_79218_1;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_79619_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_99220_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_102021_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_79222_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_79222_1;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_79623_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_99224_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_1;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_1;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_1;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_1;
  wire [63:0] sig_in_vector_bus_mergerproxy_in1_10205_0;
  wire [63:0] sig_in_vector_bus_mergerproxy_in1_7926_0;
  wire [63:0] sig_in_vector_bus_mergerproxy_in1_7926_1;
  wire [63:0] sig_in_vector_bus_mergerproxy_in1_7967_0;
  wire [63:0] sig_in_vector_bus_mergerproxy_in1_9928_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_10209_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_79210_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_79210_1;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_79611_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_99212_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in3_102013_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in3_79214_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in3_79214_1;
  wire [11:0] sig_in_vector_bus_mergerproxy_in3_79615_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in3_99216_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_102017_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_79218_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_79218_1;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_79619_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_99220_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_102021_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_79222_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_79222_1;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_79623_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_99224_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [63:0] sig_out_bus_mergerproxy_in1_10205_;
  wire [63:0] sig_out_bus_mergerproxy_in1_7926_;
  wire [63:0] sig_out_bus_mergerproxy_in1_7967_;
  wire [63:0] sig_out_bus_mergerproxy_in1_9928_;
  wire [45:0] sig_out_bus_mergerproxy_in2_10209_;
  wire [45:0] sig_out_bus_mergerproxy_in2_79210_;
  wire [45:0] sig_out_bus_mergerproxy_in2_79611_;
  wire [45:0] sig_out_bus_mergerproxy_in2_99212_;
  wire [11:0] sig_out_bus_mergerproxy_in3_102013_;
  wire [11:0] sig_out_bus_mergerproxy_in3_79214_;
  wire [11:0] sig_out_bus_mergerproxy_in3_79615_;
  wire [11:0] sig_out_bus_mergerproxy_in3_99216_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_102017_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_79218_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_79619_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_99220_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_102021_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_79222_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_79623_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_99224_;
  
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) ASSIGN_UNSIGNED_FU_u_assign_0 (.out1(out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0),
    .in1(out_conv_out_reg_8_reg_8_32_23));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) ASSIGN_UNSIGNED_FU_u_assign_1 (.out1(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1),
    .in1(out_conv_out_reg_9_reg_9_32_23));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_2 (.out1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in1(out_conv_out_reg_11_reg_11_23_32));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_3 (.out1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_3),
    .in1(out_conv_out_reg_13_reg_13_23_32));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_4 (.out1(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4),
    .in1(out_const_1));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_5 (.out1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_5),
    .in1(out_reg_23_reg_23));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_6 (.out1(out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_6),
    .in1(out_reg_6_reg_6));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_7 (.out1(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7),
    .in1(out_const_2));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_8 (.out1(out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_8),
    .in1(out_reg_0_reg_0));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_9 (.out1(out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_9),
    .in1(out_reg_17_reg_17));
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(23),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(23),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_93_i0 (.out1({null_out_signal_BMEMORY_CTRLN_93_i0_out1_1,
      out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1}),
    .in2({23'b00000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0}),
    .in3({6'b000000,
      out_conv_out_const_3_7_6}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_93_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_93_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  DPROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) DPROXY_CTRLN_0_i0 (.out1({null_out_signal_DPROXY_CTRLN_0_i0_out1_1,
      out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_7926_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_79210_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_79214_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_79218_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_79222_0),
    .in1({32'b00000000000000000000000000000000,
      out_MUX_4_DPROXY_CTRLN_0_i0_0_0_0}),
    .in2({23'b00000000000000000000000,
      out_MUX_5_DPROXY_CTRLN_0_i0_1_0_1}),
    .in3({6'b000000,
      out_conv_out_const_3_7_6}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_STORE}),
    .proxy_out1(proxy_out1_792));
  DPROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) DPROXY_CTRLN_2_i0 (.out1({null_out_signal_DPROXY_CTRLN_2_i0_out1_1,
      out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_9928_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_99212_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_99216_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_99220_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_99224_0),
    .in1({32'b00000000000000000000000000000000,
      out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_9}),
    .in2({23'b00000000000000000000000,
      out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0}),
    .in3({6'b000000,
      out_conv_out_const_3_7_6}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_DPROXY_CTRLN_2_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_DPROXY_CTRLN_2_i0_STORE}),
    .proxy_out1(proxy_out1_992));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_93_i0_0_0_0 (.out1(out_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0),
    .sel(selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0),
    .in1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_5),
    .in2(out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_6));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_93_i0_0_0_1 (.out1(out_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1),
    .sel(selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1),
    .in1(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7),
    .in2(out_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_100_reg_9_0_0_0 (.out1(out_MUX_100_reg_9_0_0_0),
    .sel(selector_MUX_100_reg_9_0_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39818_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_100_reg_9_0_0_1 (.out1(out_MUX_100_reg_9_0_0_1),
    .sel(selector_MUX_100_reg_9_0_0_1),
    .in1(out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_23_32),
    .in2(out_MUX_100_reg_9_0_0_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_93_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_28_reg_28));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_93_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1),
    .in1(out_reg_27_reg_27),
    .in2(out_reg_26_reg_26));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_93_i0_1_0_2 (.out1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2),
    .in1(out_reg_25_reg_25),
    .in2(out_reg_20_reg_20));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_93_i0_1_0_3 (.out1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3),
    .sel(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3),
    .in1(out_reg_16_reg_16),
    .in2(out_reg_1_reg_1));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_93_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_93_i0_1_1_1 (.out1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1),
    .in1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2),
    .in2(out_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_93_i0_1_2_0 (.out1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_DPROXY_CTRLN_0_i0_0_0_0 (.out1(out_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .sel(selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .in1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in2(out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_8));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_DPROXY_CTRLN_0_i0_1_0_0 (.out1(out_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .sel(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .in1(out_conv_out_reg_2_reg_2_20_23),
    .in2(out_conv_out_reg_10_reg_10_20_23));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_DPROXY_CTRLN_0_i0_1_0_1 (.out1(out_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .sel(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .in1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39821_20_23),
    .in2(out_MUX_5_DPROXY_CTRLN_0_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_65_gimple_return_FU_50_i0_0_0_0 (.out1(out_MUX_65_gimple_return_FU_50_i0_0_0_0),
    .sel(selector_MUX_65_gimple_return_FU_50_i0_0_0_0),
    .in1(out_conv_out_const_0_1_32),
    .in2(out_ui_pointer_plus_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_1139));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_72_reg_0_0_0_0 (.out1(out_MUX_72_reg_0_0_0_0),
    .sel(selector_MUX_72_reg_0_0_0_0),
    .in1(out_reg_15_reg_15),
    .in2(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_79_reg_15_0_0_0 (.out1(out_MUX_79_reg_15_0_0_0),
    .sel(selector_MUX_79_reg_15_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_6_reg_6));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_86_reg_21_0_0_0 (.out1(out_MUX_86_reg_21_0_0_0),
    .sel(selector_MUX_86_reg_21_0_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_24_reg_24));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_99_reg_8_0_0_0 (.out1(out_MUX_99_reg_8_0_0_0),
    .sel(selector_MUX_99_reg_8_0_0_0),
    .in1(out_reg_0_reg_0),
    .in2(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39815_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_99_reg_8_0_0_1 (.out1(out_MUX_99_reg_8_0_0_1),
    .sel(selector_MUX_99_reg_8_0_0_1),
    .in1(out_conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_23_32),
    .in2(out_MUX_99_reg_8_0_0_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_DPROXY_CTRLN_2_i0_1_0_0 (.out1(out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .sel(selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .in1(out_conv_out_reg_5_reg_5_20_23),
    .in2(out_conv_out_reg_3_reg_3_20_23));
  PROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) PROXY_CTRLN_1_i0 (.out1({null_out_signal_PROXY_CTRLN_1_i0_out1_1,
      null_out_signal_PROXY_CTRLN_1_i0_out1_0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_7967_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_79611_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_79615_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_79619_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_79623_0),
    .in1({out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4,
      out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_3}),
    .in2({out_conv_out_reg_14_reg_14_20_23,
      out_conv_out_reg_12_reg_12_20_23}),
    .in3({out_conv_out_const_3_7_6,
      out_conv_out_const_3_7_6}),
    .in4({out_const_4,
      out_const_4}),
    .sel_LOAD({fuselector_PROXY_CTRLN_1_i1_LOAD,
      fuselector_PROXY_CTRLN_1_i0_LOAD}),
    .sel_STORE({fuselector_PROXY_CTRLN_1_i1_STORE,
      fuselector_PROXY_CTRLN_1_i0_STORE}),
    .proxy_out1(proxy_out1_796));
  PROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) PROXY_CTRLN_3_i0 (.out1({null_out_signal_PROXY_CTRLN_3_i0_out1_1,
      null_out_signal_PROXY_CTRLN_3_i0_out1_0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_10205_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_10209_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_102013_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_102017_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_102021_0),
    .in1({32'b00000000000000000000000000000000,
      out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7}),
    .in2({23'b00000000000000000000000,
      out_conv_out_reg_19_reg_19_21_23}),
    .in3({6'b000000,
      out_conv_out_const_3_7_6}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_PROXY_CTRLN_3_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_PROXY_CTRLN_3_i0_STORE}),
    .proxy_out1(proxy_out1_1020));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_1,
      sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_1,
      sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_1,
      sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_1,
      sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_1,
      sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in1_10205_ (.out1(sig_out_bus_mergerproxy_in1_10205_),
    .in1({sig_in_bus_mergerproxy_in1_10205_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) bus_mergerproxy_in1_7926_ (.out1(sig_out_bus_mergerproxy_in1_7926_),
    .in1({sig_in_bus_mergerproxy_in1_7926_1,
      sig_in_bus_mergerproxy_in1_7926_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in1_7967_ (.out1(sig_out_bus_mergerproxy_in1_7967_),
    .in1({sig_in_bus_mergerproxy_in1_7967_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in1_9928_ (.out1(sig_out_bus_mergerproxy_in1_9928_),
    .in1({sig_in_bus_mergerproxy_in1_9928_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in2_10209_ (.out1(sig_out_bus_mergerproxy_in2_10209_),
    .in1({sig_in_bus_mergerproxy_in2_10209_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) bus_mergerproxy_in2_79210_ (.out1(sig_out_bus_mergerproxy_in2_79210_),
    .in1({sig_in_bus_mergerproxy_in2_79210_1,
      sig_in_bus_mergerproxy_in2_79210_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in2_79611_ (.out1(sig_out_bus_mergerproxy_in2_79611_),
    .in1({sig_in_bus_mergerproxy_in2_79611_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in2_99212_ (.out1(sig_out_bus_mergerproxy_in2_99212_),
    .in1({sig_in_bus_mergerproxy_in2_99212_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in3_102013_ (.out1(sig_out_bus_mergerproxy_in3_102013_),
    .in1({sig_in_bus_mergerproxy_in3_102013_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) bus_mergerproxy_in3_79214_ (.out1(sig_out_bus_mergerproxy_in3_79214_),
    .in1({sig_in_bus_mergerproxy_in3_79214_1,
      sig_in_bus_mergerproxy_in3_79214_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in3_79615_ (.out1(sig_out_bus_mergerproxy_in3_79615_),
    .in1({sig_in_bus_mergerproxy_in3_79615_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in3_99216_ (.out1(sig_out_bus_mergerproxy_in3_99216_),
    .in1({sig_in_bus_mergerproxy_in3_99216_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_102017_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_102017_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_102017_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_79218_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_79218_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_79218_1,
      sig_in_bus_mergerproxy_sel_LOAD_79218_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_79619_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_79619_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_79619_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_99220_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_99220_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_99220_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_102021_ (.out1(sig_out_bus_mergerproxy_sel_STORE_102021_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_102021_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_79222_ (.out1(sig_out_bus_mergerproxy_sel_STORE_79222_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_79222_1,
      sig_in_bus_mergerproxy_sel_STORE_79222_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_79623_ (.out1(sig_out_bus_mergerproxy_sel_STORE_79623_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_79623_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_99224_ (.out1(sig_out_bus_mergerproxy_sel_STORE_99224_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_99224_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b00000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(19),
    .value(19'b1100000000000000000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_792_38248)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_796_38248)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_992_38248)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b00000000000000000000100000000001)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(12),
    .value(12'b100000000001)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_1020_38248)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39815_23_32 (.out1(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39815_23_32),
    .in1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39815));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39818_23_32 (.out1(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39818_23_32),
    .in1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39818));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39821_20_23 (.out1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39821_20_23),
    .in1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39821));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_12_20_32 (.out1(out_conv_out_const_12_20_32),
    .in1(out_const_12));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_13_23_32 (.out1(out_conv_out_const_13_23_32),
    .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_14_20_32 (.out1(out_conv_out_const_14_20_32),
    .in1(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_3_7_6 (.out1(out_conv_out_const_3_7_6),
    .in1(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_8_23_32 (.out1(out_conv_out_const_8_23_32),
    .in1(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_10_reg_10_20_23 (.out1(out_conv_out_reg_10_reg_10_20_23),
    .in1(out_reg_10_reg_10));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_11_reg_11_23_32 (.out1(out_conv_out_reg_11_reg_11_23_32),
    .in1(out_reg_11_reg_11));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_12_reg_12_20_23 (.out1(out_conv_out_reg_12_reg_12_20_23),
    .in1(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_13_reg_13_23_32 (.out1(out_conv_out_reg_13_reg_13_23_32),
    .in1(out_reg_13_reg_13));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_14_reg_14_20_23 (.out1(out_conv_out_reg_14_reg_14_20_23),
    .in1(out_reg_14_reg_14));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(23)) conv_out_reg_19_reg_19_21_23 (.out1(out_conv_out_reg_19_reg_19_21_23),
    .in1(out_reg_19_reg_19));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_2_reg_2_20_23 (.out1(out_conv_out_reg_2_reg_2_20_23),
    .in1(out_reg_2_reg_2));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_3_reg_3_20_23 (.out1(out_conv_out_reg_3_reg_3_20_23),
    .in1(out_reg_3_reg_3));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_reg_5_reg_5_20_23 (.out1(out_conv_out_reg_5_reg_5_20_23),
    .in1(out_reg_5_reg_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) conv_out_reg_8_reg_8_32_23 (.out1(out_conv_out_reg_8_reg_8_32_23),
    .in1(out_reg_8_reg_8));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) conv_out_reg_9_reg_9_32_23 (.out1(out_conv_out_reg_9_reg_9_32_23),
    .in1(out_reg_9_reg_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_23_32 (.out1(out_conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_23_32),
    .in1(out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_23_32 (.out1(out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_23_32),
    .in1(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu___internal_malloc_738_1063 (.out1(out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063),
    .in1(out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_40803),
    .in2(out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_40807),
    .in3(out_const_9));
  __internal_free #(.MEM_var_792_38248(MEM_var_792_38248)) fu___internal_malloc_738_1067 (.done_port(s_done_fu___internal_malloc_738_1067),
    .proxy_in1_792(sig_in_vector_bus_mergerproxy_in1_7926_1),
    .proxy_in2_792(sig_in_vector_bus_mergerproxy_in2_79210_1),
    .proxy_in3_792(sig_in_vector_bus_mergerproxy_in3_79214_1),
    .proxy_sel_LOAD_792(sig_in_vector_bus_mergerproxy_sel_LOAD_79218_1),
    .proxy_sel_STORE_792(sig_in_vector_bus_mergerproxy_sel_STORE_79222_1),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_1),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_1),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_1),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_1),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_1),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED___internal_malloc_738_1067),
    .ap(out_reg_18_reg_18),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1076 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076),
    .in1(out_reg_4_reg_4),
    .in2(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1079 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_1079),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076),
    .in2(out_const_6));
  ui_minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(12),
    .BITSIZE_out1(32)) fu___internal_malloc_738_1121 (.out1(out_ui_minus_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_1121),
    .in1(out_reg_22_reg_22),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1126 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126),
    .in1(out_reg_21_reg_21),
    .in2(out_ui_lshift_expr_FU_32_0_32_101_i0_fu___internal_malloc_738_1129));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_1129 (.out1(out_ui_lshift_expr_FU_32_0_32_101_i0_fu___internal_malloc_738_1129),
    .in1(out_ui_minus_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_1121),
    .in2(out_const_9));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1139 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_1139),
    .in1(out_reg_21_reg_21),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1150 (.out1(out_read_cond_FU_73_i0_fu___internal_malloc_738_1150),
    .in1(out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_40574));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1152 (.out1(out_read_cond_FU_77_i0_fu___internal_malloc_738_1152),
    .in1(out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_40576));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1155 (.out1(out_read_cond_FU_92_i0_fu___internal_malloc_738_1155),
    .in1(out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_40578));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39815 (.out1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39815),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39818 (.out1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39818),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39821 (.out1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39821),
    .in1(out_conv_out_const_12_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39833 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39833),
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39847));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39840 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39840),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39858));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39843 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39843),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39840),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39847 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39847),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39858 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39858),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39877 (.out1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39877),
    .in1(out_conv_out_const_12_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39888 (.out1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39888),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39891 (.out1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39891),
    .in1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39907));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39897 (.out1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39897),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39900 (.out1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39900),
    .in1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39918));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(3),
    .BITSIZE_out1(20),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39903 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39903),
    .in1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39900),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39907 (.out1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39907),
    .in1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39929));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39918 (.out1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39918),
    .in1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39933));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39929 (.out1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39929),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39933 (.out1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39933),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39945 (.out1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39945),
    .in1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39959));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39952 (.out1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39952),
    .in1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39970));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39959 (.out1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39959),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39970 (.out1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39970),
    .in1(out_reg_0_reg_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39998 (.out1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39998),
    .in1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_40012));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_40001 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_40001),
    .in1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39998),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40005 (.out1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_40005),
    .in1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_40023));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_40008 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_40008),
    .in1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_40005),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40012 (.out1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_40012),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40023 (.out1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_40023),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_40042 (.out1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_40042),
    .in1(out_conv_out_const_12_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_40051 (.out1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_40051),
    .in1(out_conv_out_const_14_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40056 (.out1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_40056),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_40063 (.out1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_40063),
    .in1(out_conv_out_const_14_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_40067 (.out1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_40067),
    .in1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_40074));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_40070 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_40070),
    .in1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_40067),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_40074 (.out1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_40074),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40097 (.out1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_40097),
    .in1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_40111));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40104 (.out1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_40104),
    .in1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_40122));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_40107 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_40107),
    .in1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_40104),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40111 (.out1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_40111),
    .in1(out_reg_15_reg_15));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_40122 (.out1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_40122),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40566 (.out1(out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_40566),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40568 (.out1(out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_40568),
    .in1(out_const_7),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40570 (.out1(out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_40570),
    .in1(out_const_7),
    .in2(out_reg_22_reg_22));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40574 (.out1(out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_40574),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_15_reg_15));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(19),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40576 (.out1(out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_40576),
    .in1(out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063),
    .in2(out_const_10));
  ui_le_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40578 (.out1(out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_40578),
    .in1(out_const_7),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu___internal_malloc_738_40796 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_40796),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu___internal_malloc_738_40800 (.out1(out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_40800),
    .in1(out_const_7),
    .in2(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_40796));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_40803 (.out1(out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_40803),
    .in1(out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_40800),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___internal_malloc_738_40807 (.out1(out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_40807),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_11));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_921 (.out1(out_read_cond_FU_25_i0_fu___internal_malloc_738_921),
    .in1(out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_40566));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_951 (.out1(out_read_cond_FU_28_i0_fu___internal_malloc_738_951),
    .in1(out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_40568));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_975 (.out1(out_read_cond_FU_48_i0_fu___internal_malloc_738_975),
    .in1(out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_40570));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_1 (.out1(sig_in_bus_mergerMout_Wdata_ram0_1),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_1));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_1 (.out1(sig_in_bus_mergerMout_addr_ram1_1),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_1));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_1 (.out1(sig_in_bus_mergerMout_data_ram_size2_1),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_1 (.out1(sig_in_bus_mergerMout_oe_ram3_1),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_1 (.out1(sig_in_bus_mergerMout_we_ram4_1),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_1));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in1_10205_0 (.out1(sig_in_bus_mergerproxy_in1_10205_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_10205_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in1_7926_0 (.out1(sig_in_bus_mergerproxy_in1_7926_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7926_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in1_7926_1 (.out1(sig_in_bus_mergerproxy_in1_7926_1),
    .in1(sig_in_vector_bus_mergerproxy_in1_7926_1));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in1_7967_0 (.out1(sig_in_bus_mergerproxy_in1_7967_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7967_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in1_9928_0 (.out1(sig_in_bus_mergerproxy_in1_9928_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_9928_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in2_10209_0 (.out1(sig_in_bus_mergerproxy_in2_10209_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_10209_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in2_79210_0 (.out1(sig_in_bus_mergerproxy_in2_79210_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_79210_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in2_79210_1 (.out1(sig_in_bus_mergerproxy_in2_79210_1),
    .in1(sig_in_vector_bus_mergerproxy_in2_79210_1));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in2_79611_0 (.out1(sig_in_bus_mergerproxy_in2_79611_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_79611_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in2_99212_0 (.out1(sig_in_bus_mergerproxy_in2_99212_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_99212_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in3_102013_0 (.out1(sig_in_bus_mergerproxy_in3_102013_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_102013_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in3_79214_0 (.out1(sig_in_bus_mergerproxy_in3_79214_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_79214_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in3_79214_1 (.out1(sig_in_bus_mergerproxy_in3_79214_1),
    .in1(sig_in_vector_bus_mergerproxy_in3_79214_1));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in3_79615_0 (.out1(sig_in_bus_mergerproxy_in3_79615_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_79615_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in3_99216_0 (.out1(sig_in_bus_mergerproxy_in3_99216_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_99216_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_102017_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_102017_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_102017_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_79218_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_79218_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_79218_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_79218_1 (.out1(sig_in_bus_mergerproxy_sel_LOAD_79218_1),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_79218_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_79619_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_79619_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_79619_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_99220_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_99220_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_99220_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_102021_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_102021_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_102021_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_79222_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_79222_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_79222_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_79222_1 (.out1(sig_in_bus_mergerproxy_sel_STORE_79222_1),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_79222_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_79623_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_79623_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_79623_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_99224_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_99224_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_99224_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_72_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39833),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39877),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39888),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39891),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39897),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39903),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_79_reg_15_0_0_0),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_40097),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_1079),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_40070),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_40042),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_40107),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_86_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_minus_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_1121),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_40001),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_40008),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39945),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39952),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_40051),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_40056),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_40063),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39843),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_99_reg_8_0_0_1),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_100_reg_9_0_0_1),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_10205_ (.out1(proxy_in1_1020),
    .in1(sig_out_bus_mergerproxy_in1_10205_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7926_ (.out1(proxy_in1_792),
    .in1(sig_out_bus_mergerproxy_in1_7926_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7967_ (.out1(proxy_in1_796),
    .in1(sig_out_bus_mergerproxy_in1_7967_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_9928_ (.out1(proxy_in1_992),
    .in1(sig_out_bus_mergerproxy_in1_9928_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_10209_ (.out1(proxy_in2_1020),
    .in1(sig_out_bus_mergerproxy_in2_10209_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_79210_ (.out1(proxy_in2_792),
    .in1(sig_out_bus_mergerproxy_in2_79210_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_79611_ (.out1(proxy_in2_796),
    .in1(sig_out_bus_mergerproxy_in2_79611_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_99212_ (.out1(proxy_in2_992),
    .in1(sig_out_bus_mergerproxy_in2_99212_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_102013_ (.out1(proxy_in3_1020),
    .in1(sig_out_bus_mergerproxy_in3_102013_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_79214_ (.out1(proxy_in3_792),
    .in1(sig_out_bus_mergerproxy_in3_79214_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_79615_ (.out1(proxy_in3_796),
    .in1(sig_out_bus_mergerproxy_in3_79615_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_99216_ (.out1(proxy_in3_992),
    .in1(sig_out_bus_mergerproxy_in3_99216_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_102017_ (.out1(proxy_sel_LOAD_1020),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_102017_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_79218_ (.out1(proxy_sel_LOAD_792),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_79218_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_79619_ (.out1(proxy_sel_LOAD_796),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_79619_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_99220_ (.out1(proxy_sel_LOAD_992),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_99220_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_102021_ (.out1(proxy_sel_STORE_1020),
    .in1(sig_out_bus_mergerproxy_sel_STORE_102021_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_79222_ (.out1(proxy_sel_STORE_792),
    .in1(sig_out_bus_mergerproxy_sel_STORE_79222_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_79623_ (.out1(proxy_sel_STORE_796),
    .in1(sig_out_bus_mergerproxy_sel_STORE_79623_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_99224_ (.out1(proxy_sel_STORE_992),
    .in1(sig_out_bus_mergerproxy_sel_STORE_99224_));
  // io-signal post fix
  assign return_port = out_MUX_65_gimple_return_FU_50_i0_0_0_0;
  assign OUT_CONDITION___internal_malloc_738_1150 = out_read_cond_FU_73_i0_fu___internal_malloc_738_1150;
  assign OUT_CONDITION___internal_malloc_738_1152 = out_read_cond_FU_77_i0_fu___internal_malloc_738_1152;
  assign OUT_CONDITION___internal_malloc_738_1155 = out_read_cond_FU_92_i0_fu___internal_malloc_738_1155;
  assign OUT_CONDITION___internal_malloc_738_921 = out_read_cond_FU_25_i0_fu___internal_malloc_738_921;
  assign OUT_CONDITION___internal_malloc_738_951 = out_read_cond_FU_28_i0_fu___internal_malloc_738_951;
  assign OUT_CONDITION___internal_malloc_738_975 = out_read_cond_FU_48_i0_fu___internal_malloc_738_975;
  assign OUT_UNBOUNDED___internal_malloc_738_1067 = s_done_fu___internal_malloc_738_1067;

endmodule

// FSM based controller description for __internal_malloc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___internal_malloc(done_port,
  fuselector_BMEMORY_CTRLN_93_i0_LOAD,
  fuselector_BMEMORY_CTRLN_93_i0_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  fuselector_DPROXY_CTRLN_2_i0_LOAD,
  fuselector_DPROXY_CTRLN_2_i0_STORE,
  selector_IN_UNBOUNDED___internal_malloc_738_1067,
  selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0,
  selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1,
  selector_MUX_100_reg_9_0_0_0,
  selector_MUX_100_reg_9_0_0_1,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0,
  selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1,
  selector_MUX_65_gimple_return_FU_50_i0_0_0_0,
  selector_MUX_72_reg_0_0_0_0,
  selector_MUX_79_reg_15_0_0_0,
  selector_MUX_86_reg_21_0_0_0,
  selector_MUX_99_reg_8_0_0_0,
  selector_MUX_99_reg_8_0_0_1,
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0,
  fuselector_PROXY_CTRLN_1_i0_LOAD,
  fuselector_PROXY_CTRLN_1_i0_STORE,
  fuselector_PROXY_CTRLN_1_i1_LOAD,
  fuselector_PROXY_CTRLN_1_i1_STORE,
  fuselector_PROXY_CTRLN_3_i0_LOAD,
  fuselector_PROXY_CTRLN_3_i0_STORE,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_malloc_738_1150,
  OUT_CONDITION___internal_malloc_738_1152,
  OUT_CONDITION___internal_malloc_738_1155,
  OUT_CONDITION___internal_malloc_738_921,
  OUT_CONDITION___internal_malloc_738_951,
  OUT_CONDITION___internal_malloc_738_975,
  OUT_UNBOUNDED___internal_malloc_738_1067,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION___internal_malloc_738_1150;
  input OUT_CONDITION___internal_malloc_738_1152;
  input OUT_CONDITION___internal_malloc_738_1155;
  input OUT_CONDITION___internal_malloc_738_921;
  input OUT_CONDITION___internal_malloc_738_951;
  input OUT_CONDITION___internal_malloc_738_975;
  input OUT_UNBOUNDED___internal_malloc_738_1067;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_93_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_93_i0_STORE;
  output fuselector_DPROXY_CTRLN_0_i0_LOAD;
  output fuselector_DPROXY_CTRLN_0_i0_STORE;
  output fuselector_DPROXY_CTRLN_2_i0_LOAD;
  output fuselector_DPROXY_CTRLN_2_i0_STORE;
  output selector_IN_UNBOUNDED___internal_malloc_738_1067;
  output selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0;
  output selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1;
  output selector_MUX_100_reg_9_0_0_0;
  output selector_MUX_100_reg_9_0_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2;
  output selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3;
  output selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0;
  output selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1;
  output selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0;
  output selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  output selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  output selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  output selector_MUX_65_gimple_return_FU_50_i0_0_0_0;
  output selector_MUX_72_reg_0_0_0_0;
  output selector_MUX_79_reg_15_0_0_0;
  output selector_MUX_86_reg_21_0_0_0;
  output selector_MUX_99_reg_8_0_0_0;
  output selector_MUX_99_reg_8_0_0_1;
  output selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  output fuselector_PROXY_CTRLN_1_i0_LOAD;
  output fuselector_PROXY_CTRLN_1_i0_STORE;
  output fuselector_PROXY_CTRLN_1_i1_LOAD;
  output fuselector_PROXY_CTRLN_1_i1_STORE;
  output fuselector_PROXY_CTRLN_3_i0_LOAD;
  output fuselector_PROXY_CTRLN_3_i0_STORE;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [25:0] S_0 = 26'b00000000000000000000000001,
    S_1 = 26'b00000000000000000000000010,
    S_2 = 26'b00000000000000000000000100,
    S_3 = 26'b00000000000000000000001000,
    S_4 = 26'b00000000000000000000010000,
    S_5 = 26'b00000000000000000000100000,
    S_6 = 26'b00000000000000000001000000,
    S_14 = 26'b00000000000100000000000000,
    S_15 = 26'b00000000001000000000000000,
    S_16 = 26'b00000000010000000000000000,
    S_25 = 26'b10000000000000000000000000,
    S_17 = 26'b00000000100000000000000000,
    S_18 = 26'b00000001000000000000000000,
    S_19 = 26'b00000010000000000000000000,
    S_20 = 26'b00000100000000000000000000,
    S_21 = 26'b00001000000000000000000000,
    S_22 = 26'b00010000000000000000000000,
    S_23 = 26'b00100000000000000000000000,
    S_24 = 26'b01000000000000000000000000,
    S_7 = 26'b00000000000000000010000000,
    S_11 = 26'b00000000000000100000000000,
    S_12 = 26'b00000000000001000000000000,
    S_8 = 26'b00000000000000000100000000,
    S_9 = 26'b00000000000000001000000000,
    S_10 = 26'b00000000000000010000000000,
    S_13 = 26'b00000000000010000000000000;
  reg [25:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_93_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_93_i0_STORE;
  reg fuselector_DPROXY_CTRLN_0_i0_LOAD;
  reg fuselector_DPROXY_CTRLN_0_i0_STORE;
  reg fuselector_DPROXY_CTRLN_2_i0_LOAD;
  reg fuselector_DPROXY_CTRLN_2_i0_STORE;
  reg selector_IN_UNBOUNDED___internal_malloc_738_1067;
  reg selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0;
  reg selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1;
  reg selector_MUX_100_reg_9_0_0_0;
  reg selector_MUX_100_reg_9_0_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2;
  reg selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3;
  reg selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0;
  reg selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1;
  reg selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0;
  reg selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  reg selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  reg selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  reg selector_MUX_65_gimple_return_FU_50_i0_0_0_0;
  reg selector_MUX_72_reg_0_0_0_0;
  reg selector_MUX_79_reg_15_0_0_0;
  reg selector_MUX_86_reg_21_0_0_0;
  reg selector_MUX_99_reg_8_0_0_0;
  reg selector_MUX_99_reg_8_0_0_1;
  reg selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  reg fuselector_PROXY_CTRLN_1_i0_LOAD;
  reg fuselector_PROXY_CTRLN_1_i0_STORE;
  reg fuselector_PROXY_CTRLN_1_i1_LOAD;
  reg fuselector_PROXY_CTRLN_1_i1_STORE;
  reg fuselector_PROXY_CTRLN_3_i0_LOAD;
  reg fuselector_PROXY_CTRLN_3_i0_STORE;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_93_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_93_i0_STORE = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b0;
    fuselector_DPROXY_CTRLN_2_i0_LOAD = 1'b0;
    fuselector_DPROXY_CTRLN_2_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED___internal_malloc_738_1067 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1 = 1'b0;
    selector_MUX_100_reg_9_0_0_0 = 1'b0;
    selector_MUX_100_reg_9_0_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0 = 1'b0;
    selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0 = 1'b0;
    selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0 = 1'b0;
    selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1 = 1'b0;
    selector_MUX_65_gimple_return_FU_50_i0_0_0_0 = 1'b0;
    selector_MUX_72_reg_0_0_0_0 = 1'b0;
    selector_MUX_79_reg_15_0_0_0 = 1'b0;
    selector_MUX_86_reg_21_0_0_0 = 1'b0;
    selector_MUX_99_reg_8_0_0_0 = 1'b0;
    selector_MUX_99_reg_8_0_0_1 = 1'b0;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 = 1'b0;
    fuselector_PROXY_CTRLN_1_i0_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_1_i0_STORE = 1'b0;
    fuselector_PROXY_CTRLN_1_i1_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_1_i1_STORE = 1'b0;
    fuselector_PROXY_CTRLN_3_i0_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_3_i0_STORE = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b1;
          selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_921 == 1'b1)
            begin
              _next_state = S_6;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
              wrenable_reg_12 = 1'b0;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_8 = 1'b0;
              wrenable_reg_9 = 1'b0;
            end
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_LOAD = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          selector_MUX_100_reg_9_0_0_0 = 1'b1;
          selector_MUX_86_reg_21_0_0_0 = 1'b1;
          selector_MUX_99_reg_8_0_0_0 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_951 == 1'b1)
            begin
              _next_state = S_7;
              selector_MUX_100_reg_9_0_0_0 = 1'b0;
              selector_MUX_99_reg_8_0_0_0 = 1'b0;
              wrenable_reg_8 = 1'b0;
              wrenable_reg_9 = 1'b0;
            end
          else
            begin
              _next_state = S_14;
              selector_MUX_86_reg_21_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
              wrenable_reg_22 = 1'b0;
            end
        end
      S_6 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b1;
          selector_MUX_100_reg_9_0_0_1 = 1'b1;
          selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0 = 1'b1;
          selector_MUX_99_reg_8_0_0_1 = 1'b1;
          fuselector_PROXY_CTRLN_1_i0_STORE = 1'b1;
          fuselector_PROXY_CTRLN_1_i1_STORE = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          selector_MUX_79_reg_15_0_0_0 = 1'b1;
          wrenable_reg_15 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          wrenable_reg_16 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_1150 == 1'b1)
            begin
              _next_state = S_16;
            end
          else
            begin
              _next_state = S_21;
            end
        end
      S_16 :
        begin
          fuselector_DPROXY_CTRLN_2_i0_LOAD = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_1152 == 1'b1)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_25;
              done_port = 1'b1;
              wrenable_reg_17 = 1'b0;
              wrenable_reg_18 = 1'b0;
              wrenable_reg_19 = 1'b0;
            end
        end
      S_25 :
        begin
          selector_MUX_65_gimple_return_FU_50_i0_0_0_0 = 1'b1;
          _next_state = S_0;
        end
      S_17 :
        begin
          fuselector_PROXY_CTRLN_3_i0_STORE = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          selector_IN_UNBOUNDED___internal_malloc_738_1067 = 1'b1;
          if (OUT_UNBOUNDED___internal_malloc_738_1067 == 1'b0)
            begin
              _next_state = S_19;
            end
          else
            begin
              _next_state = S_20;
            end
        end
      S_19 :
        begin
          if (OUT_UNBOUNDED___internal_malloc_738_1067 == 1'b0)
            begin
              _next_state = S_19;
            end
          else
            begin
              _next_state = S_20;
            end
        end
      S_20 :
        begin
          fuselector_DPROXY_CTRLN_2_i0_STORE = 1'b1;
          selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3 = 1'b1;
          _next_state = S_22;
        end
      S_22 :
        begin
          wrenable_reg_20 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_23;
        end
      S_23 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          selector_MUX_72_reg_0_0_0_0 = 1'b1;
          selector_MUX_86_reg_21_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_1155 == 1'b1)
            begin
              _next_state = S_7;
              wrenable_reg_15 = 1'b0;
            end
          else
            begin
              _next_state = S_15;
              selector_MUX_72_reg_0_0_0_0 = 1'b0;
              selector_MUX_86_reg_21_0_0_0 = 1'b0;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
              wrenable_reg_22 = 1'b0;
            end
        end
      S_7 :
        begin
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_975 == 1'b1)
            begin
              _next_state = S_8;
              wrenable_reg_23 = 1'b0;
              wrenable_reg_24 = 1'b0;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else
            begin
              _next_state = S_11;
              wrenable_reg_27 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0 = 1'b1;
          wrenable_reg_21 = 1'b1;
          _next_state = S_13;
          done_port = 1'b1;
        end
      S_8 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_6 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_93_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0 = 1'b1;
          _next_state = S_13;
          done_port = 1'b1;
        end
      S_13 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b1;
          selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0 = 1'b1;
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for __internal_malloc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __internal_malloc(clock,
  reset,
  start_port,
  done_port,
  return_port,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  proxy_out1_796,
  proxy_out1_992,
  proxy_out1_1020,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  proxy_in1_796,
  proxy_in2_796,
  proxy_in3_796,
  proxy_sel_LOAD_796,
  proxy_sel_STORE_796,
  proxy_in1_992,
  proxy_in2_992,
  proxy_in3_992,
  proxy_sel_LOAD_992,
  proxy_sel_STORE_992,
  proxy_in1_1020,
  proxy_in2_1020,
  proxy_in3_1020,
  proxy_sel_LOAD_1020,
  proxy_sel_STORE_1020,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  parameter MEM_var_1020_38248=1048576,
    MEM_var_792_38248=524288,
    MEM_var_796_38248=524288,
    MEM_var_992_38248=524288;
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] proxy_out1_792;
  input [63:0] proxy_out1_796;
  input [63:0] proxy_out1_992;
  input [63:0] proxy_out1_1020;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [31:0] return_port;
  output [63:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [11:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [63:0] proxy_in1_796;
  output [45:0] proxy_in2_796;
  output [11:0] proxy_in3_796;
  output [1:0] proxy_sel_LOAD_796;
  output [1:0] proxy_sel_STORE_796;
  output [63:0] proxy_in1_992;
  output [45:0] proxy_in2_992;
  output [11:0] proxy_in3_992;
  output [1:0] proxy_sel_LOAD_992;
  output [1:0] proxy_sel_STORE_992;
  output [63:0] proxy_in1_1020;
  output [45:0] proxy_in2_1020;
  output [11:0] proxy_in3_1020;
  output [1:0] proxy_sel_LOAD_1020;
  output [1:0] proxy_sel_STORE_1020;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION___internal_malloc_738_1150;
  wire OUT_CONDITION___internal_malloc_738_1152;
  wire OUT_CONDITION___internal_malloc_738_1155;
  wire OUT_CONDITION___internal_malloc_738_921;
  wire OUT_CONDITION___internal_malloc_738_951;
  wire OUT_CONDITION___internal_malloc_738_975;
  wire OUT_UNBOUNDED___internal_malloc_738_1067;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_93_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_93_i0_STORE;
  wire fuselector_DPROXY_CTRLN_0_i0_LOAD;
  wire fuselector_DPROXY_CTRLN_0_i0_STORE;
  wire fuselector_DPROXY_CTRLN_2_i0_LOAD;
  wire fuselector_DPROXY_CTRLN_2_i0_STORE;
  wire fuselector_PROXY_CTRLN_1_i0_LOAD;
  wire fuselector_PROXY_CTRLN_1_i0_STORE;
  wire fuselector_PROXY_CTRLN_1_i1_LOAD;
  wire fuselector_PROXY_CTRLN_1_i1_STORE;
  wire fuselector_PROXY_CTRLN_3_i0_LOAD;
  wire fuselector_PROXY_CTRLN_3_i0_STORE;
  wire selector_IN_UNBOUNDED___internal_malloc_738_1067;
  wire selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0;
  wire selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1;
  wire selector_MUX_100_reg_9_0_0_0;
  wire selector_MUX_100_reg_9_0_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2;
  wire selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3;
  wire selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0;
  wire selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1;
  wire selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0;
  wire selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  wire selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  wire selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  wire selector_MUX_65_gimple_return_FU_50_i0_0_0_0;
  wire selector_MUX_72_reg_0_0_0_0;
  wire selector_MUX_79_reg_15_0_0_0;
  wire selector_MUX_86_reg_21_0_0_0;
  wire selector_MUX_99_reg_8_0_0_0;
  wire selector_MUX_99_reg_8_0_0_1;
  wire selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___internal_malloc Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_93_i0_LOAD(fuselector_BMEMORY_CTRLN_93_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_93_i0_STORE(fuselector_BMEMORY_CTRLN_93_i0_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .fuselector_DPROXY_CTRLN_2_i0_LOAD(fuselector_DPROXY_CTRLN_2_i0_LOAD),
    .fuselector_DPROXY_CTRLN_2_i0_STORE(fuselector_DPROXY_CTRLN_2_i0_STORE),
    .selector_IN_UNBOUNDED___internal_malloc_738_1067(selector_IN_UNBOUNDED___internal_malloc_738_1067),
    .selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0),
    .selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1(selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1),
    .selector_MUX_100_reg_9_0_0_0(selector_MUX_100_reg_9_0_0_0),
    .selector_MUX_100_reg_9_0_0_1(selector_MUX_100_reg_9_0_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0),
    .selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0(selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .selector_MUX_65_gimple_return_FU_50_i0_0_0_0(selector_MUX_65_gimple_return_FU_50_i0_0_0_0),
    .selector_MUX_72_reg_0_0_0_0(selector_MUX_72_reg_0_0_0_0),
    .selector_MUX_79_reg_15_0_0_0(selector_MUX_79_reg_15_0_0_0),
    .selector_MUX_86_reg_21_0_0_0(selector_MUX_86_reg_21_0_0_0),
    .selector_MUX_99_reg_8_0_0_0(selector_MUX_99_reg_8_0_0_0),
    .selector_MUX_99_reg_8_0_0_1(selector_MUX_99_reg_8_0_0_1),
    .selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .fuselector_PROXY_CTRLN_1_i0_LOAD(fuselector_PROXY_CTRLN_1_i0_LOAD),
    .fuselector_PROXY_CTRLN_1_i0_STORE(fuselector_PROXY_CTRLN_1_i0_STORE),
    .fuselector_PROXY_CTRLN_1_i1_LOAD(fuselector_PROXY_CTRLN_1_i1_LOAD),
    .fuselector_PROXY_CTRLN_1_i1_STORE(fuselector_PROXY_CTRLN_1_i1_STORE),
    .fuselector_PROXY_CTRLN_3_i0_LOAD(fuselector_PROXY_CTRLN_3_i0_LOAD),
    .fuselector_PROXY_CTRLN_3_i0_STORE(fuselector_PROXY_CTRLN_3_i0_STORE),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION___internal_malloc_738_1150(OUT_CONDITION___internal_malloc_738_1150),
    .OUT_CONDITION___internal_malloc_738_1152(OUT_CONDITION___internal_malloc_738_1152),
    .OUT_CONDITION___internal_malloc_738_1155(OUT_CONDITION___internal_malloc_738_1155),
    .OUT_CONDITION___internal_malloc_738_921(OUT_CONDITION___internal_malloc_738_921),
    .OUT_CONDITION___internal_malloc_738_951(OUT_CONDITION___internal_malloc_738_951),
    .OUT_CONDITION___internal_malloc_738_975(OUT_CONDITION___internal_malloc_738_975),
    .OUT_UNBOUNDED___internal_malloc_738_1067(OUT_UNBOUNDED___internal_malloc_738_1067),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___internal_malloc #(.MEM_var_1020_38248(MEM_var_1020_38248),
    .MEM_var_792_38248(MEM_var_792_38248),
    .MEM_var_796_38248(MEM_var_796_38248),
    .MEM_var_992_38248(MEM_var_992_38248)) Datapath_i (.return_port(return_port),
    .proxy_in1_792(proxy_in1_792),
    .proxy_in2_792(proxy_in2_792),
    .proxy_in3_792(proxy_in3_792),
    .proxy_sel_LOAD_792(proxy_sel_LOAD_792),
    .proxy_sel_STORE_792(proxy_sel_STORE_792),
    .proxy_in1_796(proxy_in1_796),
    .proxy_in2_796(proxy_in2_796),
    .proxy_in3_796(proxy_in3_796),
    .proxy_sel_LOAD_796(proxy_sel_LOAD_796),
    .proxy_sel_STORE_796(proxy_sel_STORE_796),
    .proxy_in1_992(proxy_in1_992),
    .proxy_in2_992(proxy_in2_992),
    .proxy_in3_992(proxy_in3_992),
    .proxy_sel_LOAD_992(proxy_sel_LOAD_992),
    .proxy_sel_STORE_992(proxy_sel_STORE_992),
    .proxy_in1_1020(proxy_in1_1020),
    .proxy_in2_1020(proxy_in2_1020),
    .proxy_in3_1020(proxy_in3_1020),
    .proxy_sel_LOAD_1020(proxy_sel_LOAD_1020),
    .proxy_sel_STORE_1020(proxy_sel_STORE_1020),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION___internal_malloc_738_1150(OUT_CONDITION___internal_malloc_738_1150),
    .OUT_CONDITION___internal_malloc_738_1152(OUT_CONDITION___internal_malloc_738_1152),
    .OUT_CONDITION___internal_malloc_738_1155(OUT_CONDITION___internal_malloc_738_1155),
    .OUT_CONDITION___internal_malloc_738_921(OUT_CONDITION___internal_malloc_738_921),
    .OUT_CONDITION___internal_malloc_738_951(OUT_CONDITION___internal_malloc_738_951),
    .OUT_CONDITION___internal_malloc_738_975(OUT_CONDITION___internal_malloc_738_975),
    .OUT_UNBOUNDED___internal_malloc_738_1067(OUT_UNBOUNDED___internal_malloc_738_1067),
    .clock(clock),
    .reset(reset),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .proxy_out1_796(proxy_out1_796),
    .proxy_out1_992(proxy_out1_992),
    .proxy_out1_1020(proxy_out1_1020),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_93_i0_LOAD(fuselector_BMEMORY_CTRLN_93_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_93_i0_STORE(fuselector_BMEMORY_CTRLN_93_i0_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .fuselector_DPROXY_CTRLN_2_i0_LOAD(fuselector_DPROXY_CTRLN_2_i0_LOAD),
    .fuselector_DPROXY_CTRLN_2_i0_STORE(fuselector_DPROXY_CTRLN_2_i0_STORE),
    .selector_IN_UNBOUNDED___internal_malloc_738_1067(selector_IN_UNBOUNDED___internal_malloc_738_1067),
    .selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_0),
    .selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1(selector_MUX_0_BMEMORY_CTRLN_93_i0_0_0_1),
    .selector_MUX_100_reg_9_0_0_0(selector_MUX_100_reg_9_0_0_0),
    .selector_MUX_100_reg_9_0_0_1(selector_MUX_100_reg_9_0_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_93_i0_1_2_0),
    .selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0(selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .selector_MUX_65_gimple_return_FU_50_i0_0_0_0(selector_MUX_65_gimple_return_FU_50_i0_0_0_0),
    .selector_MUX_72_reg_0_0_0_0(selector_MUX_72_reg_0_0_0_0),
    .selector_MUX_79_reg_15_0_0_0(selector_MUX_79_reg_15_0_0_0),
    .selector_MUX_86_reg_21_0_0_0(selector_MUX_86_reg_21_0_0_0),
    .selector_MUX_99_reg_8_0_0_0(selector_MUX_99_reg_8_0_0_0),
    .selector_MUX_99_reg_8_0_0_1(selector_MUX_99_reg_8_0_0_1),
    .selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .fuselector_PROXY_CTRLN_1_i0_LOAD(fuselector_PROXY_CTRLN_1_i0_LOAD),
    .fuselector_PROXY_CTRLN_1_i0_STORE(fuselector_PROXY_CTRLN_1_i0_STORE),
    .fuselector_PROXY_CTRLN_1_i1_LOAD(fuselector_PROXY_CTRLN_1_i1_LOAD),
    .fuselector_PROXY_CTRLN_1_i1_STORE(fuselector_PROXY_CTRLN_1_i1_STORE),
    .fuselector_PROXY_CTRLN_3_i0_LOAD(fuselector_PROXY_CTRLN_3_i0_LOAD),
    .fuselector_PROXY_CTRLN_3_i0_STORE(fuselector_PROXY_CTRLN_3_i0_STORE),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2020-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >> in2)&1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIconvert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IIconvert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2015-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BAMBU_READ4C(clock,
  reset,
  start_port,
  in1,
  done_port,
  out1);
  parameter BITSIZE_in1=32,
    BITSIZE_out1=64;
  // IN
  input clock;
  input reset;
  input start_port;
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output done_port;
  output [BITSIZE_out1-1:0] out1;
  reg done_port;
  // synthesis translate_off
  // verilator lint_off BLKSEQ
  reg signed [35:0] out1_reg;
  reg signed [BITSIZE_in1-1:0] temp_in1;
  reg signed [8:0] fgetc_res;
  assign out1 = out1_reg;
  always @(negedge clock)
    if(start_port == 1'b1)
    begin
     temp_in1 = {1'b1,in1[30:0]};
     fgetc_res=$fgetc(temp_in1);
     out1_reg[7:0]=fgetc_res[7:0];
     out1_reg[32]=fgetc_res[8];
     fgetc_res=$fgetc(temp_in1);
     out1_reg[15:8]=fgetc_res[7:0];
     out1_reg[33]=fgetc_res[8];
     fgetc_res=$fgetc(temp_in1);
     out1_reg[23:16]=fgetc_res[7:0];
     out1_reg[34]=fgetc_res[8];
     fgetc_res=$fgetc(temp_in1);
     out1_reg[31:24]=fgetc_res[7:0];
     out1_reg[35]=fgetc_res[8];
    end
  // verilator lint_on BLKSEQ
  // synthesis translate_on
  always @(posedge clock) done_port <= start_port;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2015-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BAMBU_READC(clock,
  reset,
  start_port,
  in1,
  done_port,
  out1);
  parameter BITSIZE_in1=32,
    BITSIZE_out1=16;
  // IN
  input clock;
  input reset;
  input start_port;
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output done_port;
  output [BITSIZE_out1-1:0] out1;
  reg done_port;
  // synthesis translate_off
  // verilator lint_off BLKSEQ
  reg signed [BITSIZE_out1-1:0] out1_reg;
  reg signed [BITSIZE_in1-1:0] temp_in1;
  assign out1 = out1_reg;
  always @(negedge clock)
    if(start_port == 1'b1)
    begin
     temp_in1 = {1'b1,in1[30:0]};
     out1_reg=$fgetc(temp_in1);
    end
  // verilator lint_on BLKSEQ
  // synthesis translate_on
  always @(posedge clock) done_port <= start_port;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_ior_concat_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1,
    OFFSET_PARAMETER=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  
  parameter nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire signed [nbit_out-1:0] tmp_in1;
  wire signed [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){in2[BITSIZE_in2-1]}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 <<< in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 <<< in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >>> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >>> in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_gt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_SIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Datapath RTL description for read
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_read(clock,
  reset,
  in_port_fd,
  in_port_buf,
  in_port_count,
  return_port,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_56_i0_LOAD,
  fuselector_BMEMORY_CTRLN_56_i0_STORE,
  selector_IN_UNBOUNDED_read_2208_2260,
  selector_IN_UNBOUNDED_read_2208_2445,
  selector_MUX_100_reg_7_0_0_0,
  selector_MUX_100_reg_7_0_0_1,
  selector_MUX_100_reg_7_0_1_0,
  selector_MUX_101_reg_8_0_0_0,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0,
  selector_MUX_42_gimple_return_FU_34_i0_0_0_0,
  selector_MUX_42_gimple_return_FU_34_i0_0_0_1,
  selector_MUX_42_gimple_return_FU_34_i0_0_0_2,
  selector_MUX_42_gimple_return_FU_34_i0_0_1_0,
  selector_MUX_42_gimple_return_FU_34_i0_0_1_1,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0,
  selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0,
  selector_MUX_77_reg_1_0_0_0,
  selector_MUX_77_reg_1_0_0_1,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_read_2208_2244,
  OUT_CONDITION_read_2208_2265,
  OUT_CONDITION_read_2208_2395,
  OUT_CONDITION_read_2208_2403,
  OUT_CONDITION_read_2208_2409,
  OUT_CONDITION_read_2208_2419,
  OUT_CONDITION_read_2208_2433,
  OUT_CONDITION_read_2208_2447,
  OUT_CONDITION_read_2208_2480,
  OUT_UNBOUNDED_read_2208_2260,
  OUT_UNBOUNDED_read_2208_2445);
  // IN
  input clock;
  input reset;
  input signed [31:0] in_port_fd;
  input [31:0] in_port_buf;
  input [31:0] in_port_count;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_56_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_56_i0_STORE;
  input selector_IN_UNBOUNDED_read_2208_2260;
  input selector_IN_UNBOUNDED_read_2208_2445;
  input selector_MUX_100_reg_7_0_0_0;
  input selector_MUX_100_reg_7_0_0_1;
  input selector_MUX_100_reg_7_0_1_0;
  input selector_MUX_101_reg_8_0_0_0;
  input selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0;
  input selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1;
  input selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2;
  input selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0;
  input selector_MUX_42_gimple_return_FU_34_i0_0_0_0;
  input selector_MUX_42_gimple_return_FU_34_i0_0_0_1;
  input selector_MUX_42_gimple_return_FU_34_i0_0_0_2;
  input selector_MUX_42_gimple_return_FU_34_i0_0_1_0;
  input selector_MUX_42_gimple_return_FU_34_i0_0_1_1;
  input selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0;
  input selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1;
  input selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2;
  input selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0;
  input selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0;
  input selector_MUX_77_reg_1_0_0_0;
  input selector_MUX_77_reg_1_0_0_1;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output signed [31:0] return_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_read_2208_2244;
  output OUT_CONDITION_read_2208_2265;
  output OUT_CONDITION_read_2208_2395;
  output OUT_CONDITION_read_2208_2403;
  output OUT_CONDITION_read_2208_2409;
  output OUT_CONDITION_read_2208_2419;
  output OUT_CONDITION_read_2208_2433;
  output OUT_CONDITION_read_2208_2447;
  output OUT_CONDITION_read_2208_2480;
  output OUT_UNBOUNDED_read_2208_2260;
  output OUT_UNBOUNDED_read_2208_2445;
  // Component and signal declarations
  wire null_out_signal_BMEMORY_CTRLN_56_i0_out1_0;
  wire null_out_signal_BMEMORY_CTRLN_56_i0_out1_1;
  wire [22:0] out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_40310;
  wire [63:0] out_BAMBU_READ4C_54_i0_fu_read_2208_2260;
  wire [15:0] out_BAMBU_READC_55_i0_fu_read_2208_2445;
  wire signed [7:0] out_IIconvert_expr_FU_29_i0_fu_read_2208_2322;
  wire signed [7:0] out_IIconvert_expr_FU_32_i0_fu_read_2208_2346;
  wire [31:0] out_IUdata_converter_FU_11_i0_fu_read_2208_2257;
  wire [31:0] out_IUdata_converter_FU_21_i0_fu_read_2208_2418;
  wire [22:0] out_IUdata_converter_FU_25_i0_fu_read_2208_2292;
  wire [22:0] out_IUdata_converter_FU_28_i0_fu_read_2208_2316;
  wire [31:0] out_IUdata_converter_FU_2_i0_fu_read_2208_2250;
  wire [22:0] out_IUdata_converter_FU_31_i0_fu_read_2208_2340;
  wire [31:0] out_IUdata_converter_FU_38_i0_fu_read_2208_2425;
  wire [31:0] out_IUdata_converter_FU_3_i0_fu_read_2208_2439;
  wire [31:0] out_IUdata_converter_FU_51_i0_fu_read_2208_2466;
  wire [31:0] out_MUX_100_reg_7_0_0_0;
  wire [31:0] out_MUX_100_reg_7_0_0_1;
  wire [31:0] out_MUX_100_reg_7_0_1_0;
  wire [31:0] out_MUX_101_reg_8_0_0_0;
  wire [31:0] out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0;
  wire [31:0] out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1;
  wire [31:0] out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2;
  wire [31:0] out_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0;
  wire [31:0] out_MUX_42_gimple_return_FU_34_i0_0_0_0;
  wire [31:0] out_MUX_42_gimple_return_FU_34_i0_0_0_1;
  wire [31:0] out_MUX_42_gimple_return_FU_34_i0_0_0_2;
  wire [31:0] out_MUX_42_gimple_return_FU_34_i0_0_1_0;
  wire [31:0] out_MUX_42_gimple_return_FU_34_i0_0_1_1;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0;
  wire [6:0] out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0;
  wire [31:0] out_MUX_77_reg_1_0_0_0;
  wire [31:0] out_MUX_77_reg_1_0_0_1;
  wire signed [31:0] out_UIconvert_expr_FU_19_i0_fu_read_2208_2358;
  wire signed [7:0] out_UIconvert_expr_FU_26_i0_fu_read_2208_2301;
  wire signed [7:0] out_UIconvert_expr_FU_50_i0_fu_read_2208_2462;
  wire signed [31:0] out_UIdata_converter_FU_12_i0_fu_read_2208_2259;
  wire signed [23:0] out_UIdata_converter_FU_13_i0_fu_read_2208_2261;
  wire [31:0] out_UUdata_converter_FU_20_i0_fu_read_2208_40317;
  wire signed [31:0] out_bit_ior_concat_expr_FU_57_i0_fu_read_2208_2319;
  wire signed [31:0] out_bit_ior_concat_expr_FU_58_i0_fu_read_2208_2343;
  wire signed [31:0] out_bit_ior_concat_expr_FU_59_i0_fu_read_2208_2414;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [2:0] out_const_10;
  wire [5:0] out_const_11;
  wire [5:0] out_const_12;
  wire [5:0] out_const_13;
  wire [5:0] out_const_14;
  wire [3:0] out_const_15;
  wire [15:0] out_const_16;
  wire [29:0] out_const_17;
  wire [2:0] out_const_2;
  wire [3:0] out_const_3;
  wire [4:0] out_const_4;
  wire [5:0] out_const_5;
  wire [6:0] out_const_6;
  wire [2:0] out_const_7;
  wire out_const_8;
  wire [1:0] out_const_9;
  wire [22:0] out_conv_in_port_buf_32_23;
  wire [5:0] out_conv_out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0_7_6;
  wire [6:0] out_conv_out_const_4_5_7;
  wire [31:0] out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_4_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_1_32;
  wire [31:0] out_conv_out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_3_8_32;
  wire [31:0] out_conv_out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_4_8_32;
  wire [31:0] out_conv_out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_5_8_32;
  wire [31:0] out_conv_out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_6_8_32;
  wire [22:0] out_conv_out_reg_7_reg_7_32_23;
  wire [31:0] out_conv_out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7_1_32;
  wire signed [3:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire signed [0:0] out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1;
  wire [31:0] out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_2;
  wire [7:0] out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_3;
  wire [7:0] out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_4;
  wire [7:0] out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_5;
  wire [7:0] out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_6;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40847;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40872;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40892;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40914;
  wire out_lut_expr_FU_18_i0_fu_read_2208_40600;
  wire signed [31:0] out_plus_expr_FU_32_0_32_61_i0_fu_read_2208_2450;
  wire signed [30:0] out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40911;
  wire out_read_cond_FU_23_i0_fu_read_2208_2265;
  wire out_read_cond_FU_33_i0_fu_read_2208_2395;
  wire out_read_cond_FU_35_i0_fu_read_2208_2403;
  wire out_read_cond_FU_36_i0_fu_read_2208_2409;
  wire out_read_cond_FU_37_i0_fu_read_2208_2419;
  wire out_read_cond_FU_42_i0_fu_read_2208_2433;
  wire out_read_cond_FU_4_i0_fu_read_2208_2244;
  wire out_read_cond_FU_52_i0_fu_read_2208_2447;
  wire out_read_cond_FU_53_i0_fu_read_2208_2480;
  wire [31:0] out_reg_0_reg_0;
  wire [22:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [63:0] out_reg_14_reg_14;
  wire [23:0] out_reg_15_reg_15;
  wire [7:0] out_reg_16_reg_16;
  wire [22:0] out_reg_17_reg_17;
  wire [7:0] out_reg_18_reg_18;
  wire [22:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [7:0] out_reg_21_reg_21;
  wire [22:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire out_reg_25_reg_25;
  wire out_reg_26_reg_26;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [22:0] out_reg_4_reg_4;
  wire out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [7:0] out_reg_9_reg_9;
  wire signed [7:0] out_rshift_expr_FU_32_0_32_63_i0_fu_read_2208_2325;
  wire signed [7:0] out_rshift_expr_FU_32_0_32_64_i0_fu_read_2208_2349;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40839;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40867;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40887;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40909;
  wire [0:0] out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7;
  wire [31:0] out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_8;
  wire [31:0] out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_9;
  wire out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_41490;
  wire out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_41494;
  wire out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_41498;
  wire out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_41502;
  wire out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_41506;
  wire out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_41534;
  wire out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_41538;
  wire out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_41426;
  wire out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_40598;
  wire out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_40608;
  wire out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_40610;
  wire out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_40612;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40835;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40905;
  wire [30:0] out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40901;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40832;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i0_fu_read_2208_2286;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i1_fu_read_2208_2313;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i2_fu_read_2208_2337;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i3_fu_read_2208_2459;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_40313;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40828;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40899;
  wire s_done_fu_read_2208_2260;
  wire s_done_fu_read_2208_2445;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_3));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_SIGNED_FU_i_assign_1 (.out1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_7 (.out1(out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_UNSIGNED_FU_u_assign_8 (.out1(out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_8),
    .in1(out_reg_7_reg_7));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_UNSIGNED_FU_u_assign_9 (.out1(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_9),
    .in1(out_reg_11_reg_11));
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(23),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(23),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_56_i0 (.out1({null_out_signal_BMEMORY_CTRLN_56_i0_out1_1,
      null_out_signal_BMEMORY_CTRLN_56_i0_out1_0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0}),
    .in2({23'b00000000000000000000000,
      out_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0}),
    .in3({6'b000000,
      out_conv_out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0_7_6}),
    .in4({1'b0,
      out_const_8}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_56_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_56_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_2 (.out1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_2),
    .in1(out_reg_3_reg_3));
  IUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_3 (.out1(out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_3),
    .in1(out_reg_16_reg_16));
  IUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_4 (.out1(out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_4),
    .in1(out_reg_18_reg_18));
  IUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_5 (.out1(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_5),
    .in1(out_reg_21_reg_21));
  IUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) IUdata_converter_FU_iu_conv_6 (.out1(out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_6),
    .in1(out_reg_9_reg_9));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_100_reg_7_0_0_0 (.out1(out_MUX_100_reg_7_0_0_0),
    .sel(selector_MUX_100_reg_7_0_0_0),
    .in1(out_IUdata_converter_FU_38_i0_fu_read_2208_2425),
    .in2(out_conv_out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7_1_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_100_reg_7_0_0_1 (.out1(out_MUX_100_reg_7_0_0_1),
    .sel(selector_MUX_100_reg_7_0_0_1),
    .in1(out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_8),
    .in2(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_9));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_100_reg_7_0_1_0 (.out1(out_MUX_100_reg_7_0_1_0),
    .sel(selector_MUX_100_reg_7_0_1_0),
    .in1(out_MUX_100_reg_7_0_0_0),
    .in2(out_MUX_100_reg_7_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_101_reg_8_0_0_0 (.out1(out_MUX_101_reg_8_0_0_0),
    .sel(selector_MUX_101_reg_8_0_0_0),
    .in1(out_reg_1_reg_1),
    .in2(out_plus_expr_FU_32_0_32_61_i0_fu_read_2208_2450));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_3_BMEMORY_CTRLN_56_i0_0_0_0 (.out1(out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0),
    .sel(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0),
    .in1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_2),
    .in2(out_conv_out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_3_8_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_3_BMEMORY_CTRLN_56_i0_0_0_1 (.out1(out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1),
    .sel(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1),
    .in1(out_conv_out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_4_8_32),
    .in2(out_conv_out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_5_8_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_3_BMEMORY_CTRLN_56_i0_0_0_2 (.out1(out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2),
    .sel(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2),
    .in1(out_conv_out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_6_8_32),
    .in2(out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_3_BMEMORY_CTRLN_56_i0_0_1_0 (.out1(out_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0),
    .sel(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0),
    .in1(out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1),
    .in2(out_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_42_gimple_return_FU_34_i0_0_0_0 (.out1(out_MUX_42_gimple_return_FU_34_i0_0_0_0),
    .sel(selector_MUX_42_gimple_return_FU_34_i0_0_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_24_reg_24));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_42_gimple_return_FU_34_i0_0_0_1 (.out1(out_MUX_42_gimple_return_FU_34_i0_0_0_1),
    .sel(selector_MUX_42_gimple_return_FU_34_i0_0_0_1),
    .in1(out_reg_23_reg_23),
    .in2(out_reg_20_reg_20));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_42_gimple_return_FU_34_i0_0_0_2 (.out1(out_MUX_42_gimple_return_FU_34_i0_0_0_2),
    .sel(selector_MUX_42_gimple_return_FU_34_i0_0_0_2),
    .in1(out_reg_13_reg_13),
    .in2(out_reg_1_reg_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_42_gimple_return_FU_34_i0_0_1_0 (.out1(out_MUX_42_gimple_return_FU_34_i0_0_1_0),
    .sel(selector_MUX_42_gimple_return_FU_34_i0_0_1_0),
    .in1(out_MUX_42_gimple_return_FU_34_i0_0_0_0),
    .in2(out_MUX_42_gimple_return_FU_34_i0_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_42_gimple_return_FU_34_i0_0_1_1 (.out1(out_MUX_42_gimple_return_FU_34_i0_0_1_1),
    .sel(selector_MUX_42_gimple_return_FU_34_i0_0_1_1),
    .in1(out_MUX_42_gimple_return_FU_34_i0_0_0_2),
    .in2(out_MUX_42_gimple_return_FU_34_i0_0_1_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_56_i0_1_0_0 (.out1(out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_22_reg_22));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_56_i0_1_0_1 (.out1(out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1),
    .sel(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1),
    .in1(out_reg_19_reg_19),
    .in2(out_reg_17_reg_17));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_56_i0_1_0_2 (.out1(out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2),
    .sel(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2),
    .in1(out_reg_10_reg_10),
    .in2(out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_56_i0_1_1_0 (.out1(out_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0),
    .in1(out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1),
    .in2(out_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2));
  MUX_GATE #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) MUX_5_BMEMORY_CTRLN_56_i0_2_0_0 (.out1(out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0),
    .in1(out_conv_out_const_4_5_7),
    .in2(out_const_6));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_77_reg_1_0_0_0 (.out1(out_MUX_77_reg_1_0_0_0),
    .sel(selector_MUX_77_reg_1_0_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_4_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_77_reg_1_0_0_1 (.out1(out_MUX_77_reg_1_0_0_1),
    .sel(selector_MUX_77_reg_1_0_0_1),
    .in1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_1_32),
    .in2(out_MUX_77_reg_1_0_0_0));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100001)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100010)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100011)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111110)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(30),
    .value(30'b111111111111111111111111111111)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) conv_in_port_buf_32_23 (.out1(out_conv_in_port_buf_32_23),
    .in1(in_port_buf));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0_7_6 (.out1(out_conv_out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0_7_6),
    .in1(out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(7)) conv_out_const_4_5_7 (.out1(out_conv_out_const_4_5_7),
    .in1(out_const_4));
  IUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_4_32 (.out1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_4_32),
    .in1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_1_32 (.out1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_1_32),
    .in1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(32)) conv_out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_3_8_32 (.out1(out_conv_out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_3_8_32),
    .in1(out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_3));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(32)) conv_out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_4_8_32 (.out1(out_conv_out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_4_8_32),
    .in1(out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_4));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(32)) conv_out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_5_8_32 (.out1(out_conv_out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_5_8_32),
    .in1(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_5));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(32)) conv_out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_6_8_32 (.out1(out_conv_out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_6_8_32),
    .in1(out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_6));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) conv_out_reg_7_reg_7_32_23 (.out1(out_conv_out_reg_7_reg_7_32_23),
    .in1(out_reg_7_reg_7));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7_1_32 (.out1(out_conv_out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7_1_32),
    .in1(out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2244 (.out1(out_read_cond_FU_4_i0_fu_read_2208_2244),
    .in1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_40598));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2250 (.out1(out_IUdata_converter_FU_2_i0_fu_read_2208_2250),
    .in1(in_port_fd));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2257 (.out1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in1(out_reg_1_reg_1));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2259 (.out1(out_UIdata_converter_FU_12_i0_fu_read_2208_2259),
    .in1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40835));
  BAMBU_READ4C #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) fu_read_2208_2260 (.done_port(s_done_fu_read_2208_2260),
    .out1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED_read_2208_2260),
    .in1(out_reg_0_reg_0));
  UIdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(24)) fu_read_2208_2261 (.out1(out_UIdata_converter_FU_13_i0_fu_read_2208_2261),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2265 (.out1(out_read_cond_FU_23_i0_fu_read_2208_2265),
    .in1(out_lut_expr_FU_18_i0_fu_read_2208_40600));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_2286 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i0_fu_read_2208_2286),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_IUdata_converter_FU_25_i0_fu_read_2208_2292));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_read_2208_2292 (.out1(out_IUdata_converter_FU_25_i0_fu_read_2208_2292),
    .in1(out_reg_13_reg_13));
  UIconvert_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(8)) fu_read_2208_2301 (.out1(out_UIconvert_expr_FU_26_i0_fu_read_2208_2301),
    .in1(out_reg_14_reg_14));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_2313 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i1_fu_read_2208_2313),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_IUdata_converter_FU_28_i0_fu_read_2208_2316));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_read_2208_2316 (.out1(out_IUdata_converter_FU_28_i0_fu_read_2208_2316),
    .in1(out_bit_ior_concat_expr_FU_57_i0_fu_read_2208_2319));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_read_2208_2319 (.out1(out_bit_ior_concat_expr_FU_57_i0_fu_read_2208_2319),
    .in1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40847),
    .in2(out_const_1),
    .in3(out_const_2));
  IIconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_read_2208_2322 (.out1(out_IIconvert_expr_FU_29_i0_fu_read_2208_2322),
    .in1(out_rshift_expr_FU_32_0_32_63_i0_fu_read_2208_2325));
  rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu_read_2208_2325 (.out1(out_rshift_expr_FU_32_0_32_63_i0_fu_read_2208_2325),
    .in1(out_reg_15_reg_15),
    .in2(out_const_4));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_2337 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i2_fu_read_2208_2337),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_IUdata_converter_FU_31_i0_fu_read_2208_2340));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_read_2208_2340 (.out1(out_IUdata_converter_FU_31_i0_fu_read_2208_2340),
    .in1(out_bit_ior_concat_expr_FU_58_i0_fu_read_2208_2343));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_read_2208_2343 (.out1(out_bit_ior_concat_expr_FU_58_i0_fu_read_2208_2343),
    .in1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40872),
    .in2(out_const_2),
    .in3(out_const_2));
  IIconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_read_2208_2346 (.out1(out_IIconvert_expr_FU_32_i0_fu_read_2208_2346),
    .in1(out_rshift_expr_FU_32_0_32_64_i0_fu_read_2208_2349));
  rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu_read_2208_2349 (.out1(out_rshift_expr_FU_32_0_32_64_i0_fu_read_2208_2349),
    .in1(out_reg_15_reg_15),
    .in2(out_const_5));
  UIconvert_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) fu_read_2208_2358 (.out1(out_UIconvert_expr_FU_19_i0_fu_read_2208_2358),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2395 (.out1(out_read_cond_FU_33_i0_fu_read_2208_2395),
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_41506));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2403 (.out1(out_read_cond_FU_35_i0_fu_read_2208_2403),
    .in1(out_reg_25_reg_25));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2409 (.out1(out_read_cond_FU_36_i0_fu_read_2208_2409),
    .in1(out_reg_26_reg_26));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_read_2208_2414 (.out1(out_bit_ior_concat_expr_FU_59_i0_fu_read_2208_2414),
    .in1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40892),
    .in2(out_const_7),
    .in3(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2418 (.out1(out_IUdata_converter_FU_21_i0_fu_read_2208_2418),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40914));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2419 (.out1(out_read_cond_FU_37_i0_fu_read_2208_2419),
    .in1(out_reg_5_reg_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2425 (.out1(out_IUdata_converter_FU_38_i0_fu_read_2208_2425),
    .in1(out_reg_1_reg_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2433 (.out1(out_read_cond_FU_42_i0_fu_read_2208_2433),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_40610));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2439 (.out1(out_IUdata_converter_FU_3_i0_fu_read_2208_2439),
    .in1(in_port_fd));
  BAMBU_READC #(.BITSIZE_in1(32),
    .BITSIZE_out1(16)) fu_read_2208_2445 (.done_port(s_done_fu_read_2208_2445),
    .out1(out_BAMBU_READC_55_i0_fu_read_2208_2445),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED_read_2208_2445),
    .in1(out_reg_2_reg_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2447 (.out1(out_read_cond_FU_52_i0_fu_read_2208_2447),
    .in1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_41426));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_read_2208_2450 (.out1(out_plus_expr_FU_32_0_32_61_i0_fu_read_2208_2450),
    .in1(out_reg_8_reg_8),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_2459 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i3_fu_read_2208_2459),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_conv_out_reg_7_reg_7_32_23));
  UIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(8)) fu_read_2208_2462 (.out1(out_UIconvert_expr_FU_50_i0_fu_read_2208_2462),
    .in1(out_BAMBU_READC_55_i0_fu_read_2208_2445));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2466 (.out1(out_IUdata_converter_FU_51_i0_fu_read_2208_2466),
    .in1(out_plus_expr_FU_32_0_32_61_i0_fu_read_2208_2450));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2480 (.out1(out_read_cond_FU_53_i0_fu_read_2208_2480),
    .in1(out_reg_12_reg_12));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(23)) fu_read_2208_40310 (.out1(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_40310),
    .in1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40905));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_40313 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_40313),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_40310));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_40317 (.out1(out_UUdata_converter_FU_20_i0_fu_read_2208_40317),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_read_2208_40598 (.out1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_40598),
    .in1(in_port_count),
    .in2(out_const_10));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_read_2208_40600 (.out1(out_lut_expr_FU_18_i0_fu_read_2208_40600),
    .in1(out_const_16),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_41490),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_41494),
    .in4(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_41498),
    .in5(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_41502),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_40608 (.out1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_40608),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_21_i0_fu_read_2208_2418));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_40610 (.out1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_40610),
    .in1(in_port_count),
    .in2(out_reg_7_reg_7));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_40612 (.out1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_40612),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_51_i0_fu_read_2208_2466));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40828 (.out1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40828),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_read_2208_40832 (.out1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40832),
    .in1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40828),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40835 (.out1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40835),
    .in1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40832),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40839 (.out1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40839),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40847 (.out1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40847),
    .in1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40839),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40867 (.out1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40867),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40872 (.out1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40872),
    .in1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40867),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40887 (.out1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40887),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40892 (.out1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40892),
    .in1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40887),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(64)) fu_read_2208_40899 (.out1(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40899),
    .in1(out_UUdata_converter_FU_20_i0_fu_read_2208_40317),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(31)) fu_read_2208_40901 (.out1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40901),
    .in1(out_const_17),
    .in2(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40899));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu_read_2208_40905 (.out1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40905),
    .in1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40901),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40909 (.out1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40909),
    .in1(out_reg_1_reg_1),
    .in2(out_const_2));
  plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31)) fu_read_2208_40911 (.out1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40911),
    .in1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40909),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40914 (.out1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40914),
    .in1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40911),
    .in2(out_const_2));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4)) fu_read_2208_41426 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_41426),
    .in1(out_BAMBU_READC_55_i0_fu_read_2208_2445),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41490 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_41490),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41494 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_41494),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41498 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_41498),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41502 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_41502),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41506 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_41506),
    .in1(out_reg_14_reg_14),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41534 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_41534),
    .in1(out_reg_14_reg_14),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41538 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_41538),
    .in1(out_reg_14_reg_14),
    .in2(out_const_13));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_2_i0_fu_read_2208_2250),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_77_reg_1_0_0_1),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i3_fu_read_2208_2459),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_51_i0_fu_read_2208_2466),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_40612),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_12_i0_fu_read_2208_2259),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(24),
    .BITSIZE_out1(24)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_13_i0_fu_read_2208_2261),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_UIconvert_expr_FU_26_i0_fu_read_2208_2301),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i0_fu_read_2208_2286),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_IIconvert_expr_FU_29_i0_fu_read_2208_2322),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i1_fu_read_2208_2313),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_3_i0_fu_read_2208_2439),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_bit_ior_concat_expr_FU_57_i0_fu_read_2208_2319),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_IIconvert_expr_FU_32_i0_fu_read_2208_2346),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i2_fu_read_2208_2337),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_bit_ior_concat_expr_FU_58_i0_fu_read_2208_2343),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_bit_ior_concat_expr_FU_59_i0_fu_read_2208_2414),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_41534),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_41538),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UIconvert_expr_FU_19_i0_fu_read_2208_2358),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_40313),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_40608),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40914),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_100_reg_7_0_1_0),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_101_reg_8_0_0_0),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_UIconvert_expr_FU_50_i0_fu_read_2208_2462),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  // io-signal post fix
  assign return_port = out_MUX_42_gimple_return_FU_34_i0_0_1_1;
  assign OUT_CONDITION_read_2208_2244 = out_read_cond_FU_4_i0_fu_read_2208_2244;
  assign OUT_CONDITION_read_2208_2265 = out_read_cond_FU_23_i0_fu_read_2208_2265;
  assign OUT_CONDITION_read_2208_2395 = out_read_cond_FU_33_i0_fu_read_2208_2395;
  assign OUT_CONDITION_read_2208_2403 = out_read_cond_FU_35_i0_fu_read_2208_2403;
  assign OUT_CONDITION_read_2208_2409 = out_read_cond_FU_36_i0_fu_read_2208_2409;
  assign OUT_CONDITION_read_2208_2419 = out_read_cond_FU_37_i0_fu_read_2208_2419;
  assign OUT_CONDITION_read_2208_2433 = out_read_cond_FU_42_i0_fu_read_2208_2433;
  assign OUT_CONDITION_read_2208_2447 = out_read_cond_FU_52_i0_fu_read_2208_2447;
  assign OUT_CONDITION_read_2208_2480 = out_read_cond_FU_53_i0_fu_read_2208_2480;
  assign OUT_UNBOUNDED_read_2208_2260 = s_done_fu_read_2208_2260;
  assign OUT_UNBOUNDED_read_2208_2445 = s_done_fu_read_2208_2445;

endmodule

// FSM based controller description for read
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_read(done_port,
  fuselector_BMEMORY_CTRLN_56_i0_LOAD,
  fuselector_BMEMORY_CTRLN_56_i0_STORE,
  selector_IN_UNBOUNDED_read_2208_2260,
  selector_IN_UNBOUNDED_read_2208_2445,
  selector_MUX_100_reg_7_0_0_0,
  selector_MUX_100_reg_7_0_0_1,
  selector_MUX_100_reg_7_0_1_0,
  selector_MUX_101_reg_8_0_0_0,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2,
  selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0,
  selector_MUX_42_gimple_return_FU_34_i0_0_0_0,
  selector_MUX_42_gimple_return_FU_34_i0_0_0_1,
  selector_MUX_42_gimple_return_FU_34_i0_0_0_2,
  selector_MUX_42_gimple_return_FU_34_i0_0_1_0,
  selector_MUX_42_gimple_return_FU_34_i0_0_1_1,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2,
  selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0,
  selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0,
  selector_MUX_77_reg_1_0_0_0,
  selector_MUX_77_reg_1_0_0_1,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_read_2208_2244,
  OUT_CONDITION_read_2208_2265,
  OUT_CONDITION_read_2208_2395,
  OUT_CONDITION_read_2208_2403,
  OUT_CONDITION_read_2208_2409,
  OUT_CONDITION_read_2208_2419,
  OUT_CONDITION_read_2208_2433,
  OUT_CONDITION_read_2208_2447,
  OUT_CONDITION_read_2208_2480,
  OUT_UNBOUNDED_read_2208_2260,
  OUT_UNBOUNDED_read_2208_2445,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_read_2208_2244;
  input OUT_CONDITION_read_2208_2265;
  input OUT_CONDITION_read_2208_2395;
  input OUT_CONDITION_read_2208_2403;
  input OUT_CONDITION_read_2208_2409;
  input OUT_CONDITION_read_2208_2419;
  input OUT_CONDITION_read_2208_2433;
  input OUT_CONDITION_read_2208_2447;
  input OUT_CONDITION_read_2208_2480;
  input OUT_UNBOUNDED_read_2208_2260;
  input OUT_UNBOUNDED_read_2208_2445;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_56_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_56_i0_STORE;
  output selector_IN_UNBOUNDED_read_2208_2260;
  output selector_IN_UNBOUNDED_read_2208_2445;
  output selector_MUX_100_reg_7_0_0_0;
  output selector_MUX_100_reg_7_0_0_1;
  output selector_MUX_100_reg_7_0_1_0;
  output selector_MUX_101_reg_8_0_0_0;
  output selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0;
  output selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1;
  output selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2;
  output selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0;
  output selector_MUX_42_gimple_return_FU_34_i0_0_0_0;
  output selector_MUX_42_gimple_return_FU_34_i0_0_0_1;
  output selector_MUX_42_gimple_return_FU_34_i0_0_0_2;
  output selector_MUX_42_gimple_return_FU_34_i0_0_1_0;
  output selector_MUX_42_gimple_return_FU_34_i0_0_1_1;
  output selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0;
  output selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1;
  output selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2;
  output selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0;
  output selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0;
  output selector_MUX_77_reg_1_0_0_0;
  output selector_MUX_77_reg_1_0_0_1;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [16:0] S_0 = 17'b00000000000000001,
    S_1 = 17'b00000000000000010,
    S_6 = 17'b00000000001000000,
    S_7 = 17'b00000000010000000,
    S_8 = 17'b00000000100000000,
    S_16 = 17'b10000000000000000,
    S_9 = 17'b00000001000000000,
    S_14 = 17'b00100000000000000,
    S_10 = 17'b00000010000000000,
    S_15 = 17'b01000000000000000,
    S_2 = 17'b00000000000000100,
    S_11 = 17'b00000100000000000,
    S_3 = 17'b00000000000001000,
    S_12 = 17'b00001000000000000,
    S_4 = 17'b00000000000010000,
    S_13 = 17'b00010000000000000,
    S_5 = 17'b00000000000100000;
  reg [16:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_56_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_56_i0_STORE;
  reg selector_IN_UNBOUNDED_read_2208_2260;
  reg selector_IN_UNBOUNDED_read_2208_2445;
  reg selector_MUX_100_reg_7_0_0_0;
  reg selector_MUX_100_reg_7_0_0_1;
  reg selector_MUX_100_reg_7_0_1_0;
  reg selector_MUX_101_reg_8_0_0_0;
  reg selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0;
  reg selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1;
  reg selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2;
  reg selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0;
  reg selector_MUX_42_gimple_return_FU_34_i0_0_0_0;
  reg selector_MUX_42_gimple_return_FU_34_i0_0_0_1;
  reg selector_MUX_42_gimple_return_FU_34_i0_0_0_2;
  reg selector_MUX_42_gimple_return_FU_34_i0_0_1_0;
  reg selector_MUX_42_gimple_return_FU_34_i0_0_1_1;
  reg selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0;
  reg selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1;
  reg selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2;
  reg selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0;
  reg selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0;
  reg selector_MUX_77_reg_1_0_0_0;
  reg selector_MUX_77_reg_1_0_0_1;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_56_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_56_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED_read_2208_2260 = 1'b0;
    selector_IN_UNBOUNDED_read_2208_2445 = 1'b0;
    selector_MUX_100_reg_7_0_0_0 = 1'b0;
    selector_MUX_100_reg_7_0_0_1 = 1'b0;
    selector_MUX_100_reg_7_0_1_0 = 1'b0;
    selector_MUX_101_reg_8_0_0_0 = 1'b0;
    selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0 = 1'b0;
    selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1 = 1'b0;
    selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2 = 1'b0;
    selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0 = 1'b0;
    selector_MUX_42_gimple_return_FU_34_i0_0_0_0 = 1'b0;
    selector_MUX_42_gimple_return_FU_34_i0_0_0_1 = 1'b0;
    selector_MUX_42_gimple_return_FU_34_i0_0_0_2 = 1'b0;
    selector_MUX_42_gimple_return_FU_34_i0_0_1_0 = 1'b0;
    selector_MUX_42_gimple_return_FU_34_i0_0_1_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0 = 1'b0;
    selector_MUX_77_reg_1_0_0_0 = 1'b0;
    selector_MUX_77_reg_1_0_0_1 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_100_reg_7_0_1_0 = 1'b1;
          selector_MUX_77_reg_1_0_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION_read_2208_2244 == 1'b1)
            begin
              _next_state = S_1;
              selector_MUX_100_reg_7_0_1_0 = 1'b0;
              selector_MUX_77_reg_1_0_0_1 = 1'b0;
              wrenable_reg_7 = 1'b0;
            end
          else
            begin
              _next_state = S_8;
              wrenable_reg_0 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_IN_UNBOUNDED_read_2208_2260 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION_read_2208_2265 == 1'b1)
            begin
              _next_state = S_2;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_6 :
        begin
          fuselector_BMEMORY_CTRLN_56_i0_STORE = 1'b1;
          selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0 = 1'b1;
          selector_MUX_77_reg_1_0_0_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          if (OUT_CONDITION_read_2208_2419 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_77_reg_1_0_0_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
        end
      S_7 :
        begin
          selector_MUX_100_reg_7_0_0_0 = 1'b1;
          selector_MUX_100_reg_7_0_1_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_MUX_100_reg_7_0_0_1 = 1'b1;
          selector_MUX_101_reg_8_0_0_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          if (OUT_CONDITION_read_2208_2433 == 1'b1)
            begin
              _next_state = S_9;
            end
          else
            begin
              _next_state = S_16;
              done_port = 1'b1;
              selector_MUX_100_reg_7_0_0_1 = 1'b0;
              selector_MUX_101_reg_8_0_0_0 = 1'b0;
              wrenable_reg_7 = 1'b0;
              wrenable_reg_8 = 1'b0;
            end
        end
      S_16 :
        begin
          selector_MUX_42_gimple_return_FU_34_i0_0_1_1 = 1'b1;
          _next_state = S_0;
        end
      S_9 :
        begin
          selector_IN_UNBOUNDED_read_2208_2445 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_read_2208_2447 == 1'b0)
            begin
              _next_state = S_10;
            end
          else
            begin
              _next_state = S_14;
              done_port = 1'b1;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
              wrenable_reg_12 = 1'b0;
              wrenable_reg_8 = 1'b0;
              wrenable_reg_9 = 1'b0;
            end
        end
      S_14 :
        begin
          selector_MUX_42_gimple_return_FU_34_i0_0_0_0 = 1'b1;
          selector_MUX_42_gimple_return_FU_34_i0_0_1_0 = 1'b1;
          _next_state = S_0;
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_56_i0_STORE = 1'b1;
          selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION_read_2208_2480 == 1'b1)
            begin
              _next_state = S_9;
            end
          else
            begin
              _next_state = S_15;
              done_port = 1'b1;
              wrenable_reg_7 = 1'b0;
            end
        end
      S_15 :
        begin
          selector_MUX_42_gimple_return_FU_34_i0_0_0_0 = 1'b1;
          selector_MUX_42_gimple_return_FU_34_i0_0_1_0 = 1'b1;
          _next_state = S_0;
        end
      S_2 :
        begin
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          if (OUT_CONDITION_read_2208_2395 == 1'b0)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_11;
              done_port = 1'b1;
              wrenable_reg_16 = 1'b0;
              wrenable_reg_17 = 1'b0;
              wrenable_reg_18 = 1'b0;
              wrenable_reg_19 = 1'b0;
              wrenable_reg_20 = 1'b0;
              wrenable_reg_21 = 1'b0;
              wrenable_reg_22 = 1'b0;
              wrenable_reg_23 = 1'b0;
              wrenable_reg_24 = 1'b0;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
        end
      S_11 :
        begin
          selector_MUX_42_gimple_return_FU_34_i0_0_0_2 = 1'b1;
          selector_MUX_42_gimple_return_FU_34_i0_0_1_1 = 1'b1;
          _next_state = S_0;
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_56_i0_STORE = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0 = 1'b1;
          if (OUT_CONDITION_read_2208_2403 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_12;
              done_port = 1'b1;
            end
        end
      S_12 :
        begin
          _next_state = S_0;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_56_i0_STORE = 1'b1;
          selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1 = 1'b1;
          selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0 = 1'b1;
          if (OUT_CONDITION_read_2208_2409 == 1'b0)
            begin
              _next_state = S_5;
              done_port = 1'b1;
            end
          else
            begin
              _next_state = S_13;
              done_port = 1'b1;
            end
        end
      S_13 :
        begin
          selector_MUX_42_gimple_return_FU_34_i0_0_0_1 = 1'b1;
          _next_state = S_0;
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_56_i0_STORE = 1'b1;
          selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0 = 1'b1;
          selector_MUX_42_gimple_return_FU_34_i0_0_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0 = 1'b1;
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for read
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module read(clock,
  reset,
  start_port,
  done_port,
  fd,
  \buf ,
  count,
  return_port,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input signed [31:0] fd;
  input [31:0] \buf ;
  input [31:0] count;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_read_2208_2244;
  wire OUT_CONDITION_read_2208_2265;
  wire OUT_CONDITION_read_2208_2395;
  wire OUT_CONDITION_read_2208_2403;
  wire OUT_CONDITION_read_2208_2409;
  wire OUT_CONDITION_read_2208_2419;
  wire OUT_CONDITION_read_2208_2433;
  wire OUT_CONDITION_read_2208_2447;
  wire OUT_CONDITION_read_2208_2480;
  wire OUT_UNBOUNDED_read_2208_2260;
  wire OUT_UNBOUNDED_read_2208_2445;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_56_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_56_i0_STORE;
  wire selector_IN_UNBOUNDED_read_2208_2260;
  wire selector_IN_UNBOUNDED_read_2208_2445;
  wire selector_MUX_100_reg_7_0_0_0;
  wire selector_MUX_100_reg_7_0_0_1;
  wire selector_MUX_100_reg_7_0_1_0;
  wire selector_MUX_101_reg_8_0_0_0;
  wire selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0;
  wire selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1;
  wire selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2;
  wire selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0;
  wire selector_MUX_42_gimple_return_FU_34_i0_0_0_0;
  wire selector_MUX_42_gimple_return_FU_34_i0_0_0_1;
  wire selector_MUX_42_gimple_return_FU_34_i0_0_0_2;
  wire selector_MUX_42_gimple_return_FU_34_i0_0_1_0;
  wire selector_MUX_42_gimple_return_FU_34_i0_0_1_1;
  wire selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0;
  wire selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1;
  wire selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2;
  wire selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0;
  wire selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0;
  wire selector_MUX_77_reg_1_0_0_0;
  wire selector_MUX_77_reg_1_0_0_1;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_read Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_56_i0_LOAD(fuselector_BMEMORY_CTRLN_56_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_56_i0_STORE(fuselector_BMEMORY_CTRLN_56_i0_STORE),
    .selector_IN_UNBOUNDED_read_2208_2260(selector_IN_UNBOUNDED_read_2208_2260),
    .selector_IN_UNBOUNDED_read_2208_2445(selector_IN_UNBOUNDED_read_2208_2445),
    .selector_MUX_100_reg_7_0_0_0(selector_MUX_100_reg_7_0_0_0),
    .selector_MUX_100_reg_7_0_0_1(selector_MUX_100_reg_7_0_0_1),
    .selector_MUX_100_reg_7_0_1_0(selector_MUX_100_reg_7_0_1_0),
    .selector_MUX_101_reg_8_0_0_0(selector_MUX_101_reg_8_0_0_0),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0),
    .selector_MUX_42_gimple_return_FU_34_i0_0_0_0(selector_MUX_42_gimple_return_FU_34_i0_0_0_0),
    .selector_MUX_42_gimple_return_FU_34_i0_0_0_1(selector_MUX_42_gimple_return_FU_34_i0_0_0_1),
    .selector_MUX_42_gimple_return_FU_34_i0_0_0_2(selector_MUX_42_gimple_return_FU_34_i0_0_0_2),
    .selector_MUX_42_gimple_return_FU_34_i0_0_1_0(selector_MUX_42_gimple_return_FU_34_i0_0_1_0),
    .selector_MUX_42_gimple_return_FU_34_i0_0_1_1(selector_MUX_42_gimple_return_FU_34_i0_0_1_1),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0),
    .selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0(selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0),
    .selector_MUX_77_reg_1_0_0_0(selector_MUX_77_reg_1_0_0_0),
    .selector_MUX_77_reg_1_0_0_1(selector_MUX_77_reg_1_0_0_1),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_read_2208_2244(OUT_CONDITION_read_2208_2244),
    .OUT_CONDITION_read_2208_2265(OUT_CONDITION_read_2208_2265),
    .OUT_CONDITION_read_2208_2395(OUT_CONDITION_read_2208_2395),
    .OUT_CONDITION_read_2208_2403(OUT_CONDITION_read_2208_2403),
    .OUT_CONDITION_read_2208_2409(OUT_CONDITION_read_2208_2409),
    .OUT_CONDITION_read_2208_2419(OUT_CONDITION_read_2208_2419),
    .OUT_CONDITION_read_2208_2433(OUT_CONDITION_read_2208_2433),
    .OUT_CONDITION_read_2208_2447(OUT_CONDITION_read_2208_2447),
    .OUT_CONDITION_read_2208_2480(OUT_CONDITION_read_2208_2480),
    .OUT_UNBOUNDED_read_2208_2260(OUT_UNBOUNDED_read_2208_2260),
    .OUT_UNBOUNDED_read_2208_2445(OUT_UNBOUNDED_read_2208_2445),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_read Datapath_i (.return_port(return_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_read_2208_2244(OUT_CONDITION_read_2208_2244),
    .OUT_CONDITION_read_2208_2265(OUT_CONDITION_read_2208_2265),
    .OUT_CONDITION_read_2208_2395(OUT_CONDITION_read_2208_2395),
    .OUT_CONDITION_read_2208_2403(OUT_CONDITION_read_2208_2403),
    .OUT_CONDITION_read_2208_2409(OUT_CONDITION_read_2208_2409),
    .OUT_CONDITION_read_2208_2419(OUT_CONDITION_read_2208_2419),
    .OUT_CONDITION_read_2208_2433(OUT_CONDITION_read_2208_2433),
    .OUT_CONDITION_read_2208_2447(OUT_CONDITION_read_2208_2447),
    .OUT_CONDITION_read_2208_2480(OUT_CONDITION_read_2208_2480),
    .OUT_UNBOUNDED_read_2208_2260(OUT_UNBOUNDED_read_2208_2260),
    .OUT_UNBOUNDED_read_2208_2445(OUT_UNBOUNDED_read_2208_2445),
    .clock(clock),
    .reset(reset),
    .in_port_fd(fd),
    .in_port_buf(\buf ),
    .in_port_count(count),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_56_i0_LOAD(fuselector_BMEMORY_CTRLN_56_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_56_i0_STORE(fuselector_BMEMORY_CTRLN_56_i0_STORE),
    .selector_IN_UNBOUNDED_read_2208_2260(selector_IN_UNBOUNDED_read_2208_2260),
    .selector_IN_UNBOUNDED_read_2208_2445(selector_IN_UNBOUNDED_read_2208_2445),
    .selector_MUX_100_reg_7_0_0_0(selector_MUX_100_reg_7_0_0_0),
    .selector_MUX_100_reg_7_0_0_1(selector_MUX_100_reg_7_0_0_1),
    .selector_MUX_100_reg_7_0_1_0(selector_MUX_100_reg_7_0_1_0),
    .selector_MUX_101_reg_8_0_0_0(selector_MUX_101_reg_8_0_0_0),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_0),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_1),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_0_2),
    .selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0(selector_MUX_3_BMEMORY_CTRLN_56_i0_0_1_0),
    .selector_MUX_42_gimple_return_FU_34_i0_0_0_0(selector_MUX_42_gimple_return_FU_34_i0_0_0_0),
    .selector_MUX_42_gimple_return_FU_34_i0_0_0_1(selector_MUX_42_gimple_return_FU_34_i0_0_0_1),
    .selector_MUX_42_gimple_return_FU_34_i0_0_0_2(selector_MUX_42_gimple_return_FU_34_i0_0_0_2),
    .selector_MUX_42_gimple_return_FU_34_i0_0_1_0(selector_MUX_42_gimple_return_FU_34_i0_0_1_0),
    .selector_MUX_42_gimple_return_FU_34_i0_0_1_1(selector_MUX_42_gimple_return_FU_34_i0_0_1_1),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_0_2),
    .selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0(selector_MUX_4_BMEMORY_CTRLN_56_i0_1_1_0),
    .selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0(selector_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0),
    .selector_MUX_77_reg_1_0_0_0(selector_MUX_77_reg_1_0_0_0),
    .selector_MUX_77_reg_1_0_0_1(selector_MUX_77_reg_1_0_0_1),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// Datapath RTL description for run_benchmark
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_run_benchmark(clock,
  reset,
  in_port_vargs,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE,
  fuselector_BMEMORY_CTRLN_276_i0_LOAD,
  fuselector_BMEMORY_CTRLN_276_i0_STORE,
  selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0,
  selector_MUX_160_reg_0_0_0_0,
  selector_MUX_162_reg_10_0_0_0,
  selector_MUX_163_reg_11_0_0_0,
  selector_MUX_163_reg_11_0_0_1,
  selector_MUX_164_reg_12_0_0_0,
  selector_MUX_165_reg_13_0_0_0,
  selector_MUX_174_reg_21_0_0_0,
  selector_MUX_175_reg_22_0_0_0,
  selector_MUX_186_reg_32_0_0_0,
  selector_MUX_187_reg_33_0_0_0,
  selector_MUX_190_reg_36_0_0_0,
  selector_MUX_191_reg_37_0_0_0,
  selector_MUX_193_reg_39_0_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0,
  selector_MUX_200_reg_45_0_0_0,
  selector_MUX_201_reg_46_0_0_0,
  selector_MUX_206_reg_50_0_0_0,
  selector_MUX_214_reg_58_0_0_0,
  selector_MUX_215_reg_59_0_0_0,
  selector_MUX_217_reg_60_0_0_0,
  selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0,
  selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0,
  selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1,
  selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0,
  selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0,
  selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1,
  selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_run_benchmark_38252_38927,
  OUT_CONDITION_run_benchmark_38252_38933,
  OUT_CONDITION_run_benchmark_38252_38935,
  OUT_CONDITION_run_benchmark_38252_38937,
  OUT_CONDITION_run_benchmark_38252_38939,
  OUT_CONDITION_run_benchmark_38252_38956,
  OUT_CONDITION_run_benchmark_38252_38958,
  OUT_CONDITION_run_benchmark_38252_38960,
  OUT_CONDITION_run_benchmark_38252_38962,
  OUT_CONDITION_run_benchmark_38252_38964,
  OUT_CONDITION_run_benchmark_38252_38966,
  OUT_MULTIIF_run_benchmark_38252_42504,
  OUT_MULTIIF_run_benchmark_38252_42514);
  parameter MEM_var_38536_38252=7864320;
  // IN
  input clock;
  input reset;
  input [31:0] in_port_vargs;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [45:0] S_addr_ram;
  input [63:0] S_Wdata_ram;
  input [11:0] S_data_ram_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  input fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE;
  input fuselector_BMEMORY_CTRLN_276_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_276_i0_STORE;
  input selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0;
  input selector_MUX_160_reg_0_0_0_0;
  input selector_MUX_162_reg_10_0_0_0;
  input selector_MUX_163_reg_11_0_0_0;
  input selector_MUX_163_reg_11_0_0_1;
  input selector_MUX_164_reg_12_0_0_0;
  input selector_MUX_165_reg_13_0_0_0;
  input selector_MUX_174_reg_21_0_0_0;
  input selector_MUX_175_reg_22_0_0_0;
  input selector_MUX_186_reg_32_0_0_0;
  input selector_MUX_187_reg_33_0_0_0;
  input selector_MUX_190_reg_36_0_0_0;
  input selector_MUX_191_reg_37_0_0_0;
  input selector_MUX_193_reg_39_0_0_0;
  input selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0;
  input selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1;
  input selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0;
  input selector_MUX_200_reg_45_0_0_0;
  input selector_MUX_201_reg_46_0_0_0;
  input selector_MUX_206_reg_50_0_0_0;
  input selector_MUX_214_reg_58_0_0_0;
  input selector_MUX_215_reg_59_0_0_0;
  input selector_MUX_217_reg_60_0_0_0;
  input selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0;
  input selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0;
  input selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1;
  input selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0;
  input selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0;
  input selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1;
  input selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0;
  input selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0;
  input selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1;
  input selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2;
  input selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3;
  input selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0;
  input selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1;
  input selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_36;
  input wrenable_reg_37;
  input wrenable_reg_38;
  input wrenable_reg_39;
  input wrenable_reg_4;
  input wrenable_reg_40;
  input wrenable_reg_41;
  input wrenable_reg_42;
  input wrenable_reg_43;
  input wrenable_reg_44;
  input wrenable_reg_45;
  input wrenable_reg_46;
  input wrenable_reg_47;
  input wrenable_reg_48;
  input wrenable_reg_49;
  input wrenable_reg_5;
  input wrenable_reg_50;
  input wrenable_reg_51;
  input wrenable_reg_52;
  input wrenable_reg_53;
  input wrenable_reg_54;
  input wrenable_reg_55;
  input wrenable_reg_56;
  input wrenable_reg_57;
  input wrenable_reg_58;
  input wrenable_reg_59;
  input wrenable_reg_6;
  input wrenable_reg_60;
  input wrenable_reg_61;
  input wrenable_reg_62;
  input wrenable_reg_63;
  input wrenable_reg_64;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_run_benchmark_38252_38927;
  output OUT_CONDITION_run_benchmark_38252_38933;
  output OUT_CONDITION_run_benchmark_38252_38935;
  output OUT_CONDITION_run_benchmark_38252_38937;
  output OUT_CONDITION_run_benchmark_38252_38939;
  output OUT_CONDITION_run_benchmark_38252_38956;
  output OUT_CONDITION_run_benchmark_38252_38958;
  output OUT_CONDITION_run_benchmark_38252_38960;
  output OUT_CONDITION_run_benchmark_38252_38962;
  output OUT_CONDITION_run_benchmark_38252_38964;
  output OUT_CONDITION_run_benchmark_38252_38966;
  output [2:0] OUT_MULTIIF_run_benchmark_38252_42504;
  output [1:0] OUT_MULTIIF_run_benchmark_38252_42514;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_276_i0_out1_1;
  wire [31:0] null_out_signal_array_38536_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38536_0_proxy_out1_1;
  wire [31:0] out_ARRAY_1D_STD_BRAM_NN_0_i0_array_38536_0;
  wire [31:0] out_ARRAY_1D_STD_BRAM_NN_0_i1_array_38536_0;
  wire [31:0] out_BMEMORY_CTRLN_276_i0_BMEMORY_CTRLN_276_i0;
  wire [20:0] out_IUdata_converter_FU_110_i0_fu_run_benchmark_38252_38833;
  wire [20:0] out_IUdata_converter_FU_187_i0_fu_run_benchmark_38252_40382;
  wire [20:0] out_IUdata_converter_FU_188_i0_fu_run_benchmark_38252_40395;
  wire [20:0] out_IUdata_converter_FU_189_i0_fu_run_benchmark_38252_38737;
  wire [20:0] out_IUdata_converter_FU_190_i0_fu_run_benchmark_38252_38707;
  wire [20:0] out_IUdata_converter_FU_216_i0_fu_run_benchmark_38252_38622;
  wire [20:0] out_IUdata_converter_FU_256_i0_fu_run_benchmark_38252_40486;
  wire [20:0] out_IUdata_converter_FU_257_i0_fu_run_benchmark_38252_40499;
  wire [20:0] out_IUdata_converter_FU_258_i0_fu_run_benchmark_38252_38819;
  wire [20:0] out_IUdata_converter_FU_259_i0_fu_run_benchmark_38252_38796;
  wire [31:0] out_IUdata_converter_FU_270_i0_fu_run_benchmark_38252_38856;
  wire [31:0] out_IUdata_converter_FU_271_i0_fu_run_benchmark_38252_38858;
  wire [31:0] out_IUdata_converter_FU_272_i0_fu_run_benchmark_38252_38673;
  wire [31:0] out_IUdata_converter_FU_275_i0_fu_run_benchmark_38252_38896;
  wire [31:0] out_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0;
  wire [31:0] out_MUX_160_reg_0_0_0_0;
  wire [31:0] out_MUX_162_reg_10_0_0_0;
  wire [31:0] out_MUX_163_reg_11_0_0_0;
  wire [31:0] out_MUX_163_reg_11_0_0_1;
  wire [31:0] out_MUX_164_reg_12_0_0_0;
  wire [31:0] out_MUX_165_reg_13_0_0_0;
  wire [31:0] out_MUX_174_reg_21_0_0_0;
  wire [31:0] out_MUX_175_reg_22_0_0_0;
  wire [31:0] out_MUX_186_reg_32_0_0_0;
  wire [31:0] out_MUX_187_reg_33_0_0_0;
  wire [31:0] out_MUX_190_reg_36_0_0_0;
  wire [31:0] out_MUX_191_reg_37_0_0_0;
  wire [31:0] out_MUX_193_reg_39_0_0_0;
  wire [22:0] out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0;
  wire [22:0] out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1;
  wire [22:0] out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0;
  wire [31:0] out_MUX_200_reg_45_0_0_0;
  wire [31:0] out_MUX_201_reg_46_0_0_0;
  wire [31:0] out_MUX_206_reg_50_0_0_0;
  wire [31:0] out_MUX_214_reg_58_0_0_0;
  wire [31:0] out_MUX_215_reg_59_0_0_0;
  wire [31:0] out_MUX_217_reg_60_0_0_0;
  wire [31:0] out_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0;
  wire [22:0] out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0;
  wire [22:0] out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1;
  wire [22:0] out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0;
  wire [31:0] out_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0;
  wire [31:0] out_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1;
  wire [31:0] out_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0;
  wire signed [31:0] out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584;
  wire signed [31:0] out_UIdata_converter_FU_41_i0_fu_run_benchmark_38252_38586;
  wire signed [31:0] out_UIdata_converter_FU_42_i0_fu_run_benchmark_38252_38587;
  wire signed [31:0] out_UIdata_converter_FU_43_i0_fu_run_benchmark_38252_38588;
  wire signed [31:0] out_UIdata_converter_FU_44_i0_fu_run_benchmark_38252_38950;
  wire signed [31:0] out_UIdata_converter_FU_47_i0_fu_run_benchmark_38252_38942;
  wire [22:0] out_UUdata_converter_FU_10_i0_fu_run_benchmark_38252_40392;
  wire [23:0] out_UUdata_converter_FU_13_i0_fu_run_benchmark_38252_38775;
  wire [22:0] out_UUdata_converter_FU_148_i0_fu_run_benchmark_38252_38689;
  wire [22:0] out_UUdata_converter_FU_149_i0_fu_run_benchmark_38252_38647;
  wire [22:0] out_UUdata_converter_FU_15_i0_fu_run_benchmark_38252_40483;
  wire [22:0] out_UUdata_converter_FU_17_i0_fu_run_benchmark_38252_40496;
  wire [22:0] out_UUdata_converter_FU_235_i0_fu_run_benchmark_38252_38786;
  wire [22:0] out_UUdata_converter_FU_236_i0_fu_run_benchmark_38252_38767;
  wire [31:0] out_UUdata_converter_FU_273_i0_fu_run_benchmark_38252_38870;
  wire [31:0] out_UUdata_converter_FU_274_i0_fu_run_benchmark_38252_38879;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_40338;
  wire out_UUdata_converter_FU_46_i0_fu_run_benchmark_38252_41012;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_40322;
  wire [22:0] out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_40379;
  wire [22:0] out_addr_expr_FU_11_i0_fu_run_benchmark_38252_40456;
  wire [22:0] out_addr_expr_FU_12_i0_fu_run_benchmark_38252_40466;
  wire [22:0] out_addr_expr_FU_14_i0_fu_run_benchmark_38252_40509;
  wire [22:0] out_addr_expr_FU_16_i0_fu_run_benchmark_38252_40514;
  wire [22:0] out_addr_expr_FU_5_i0_fu_run_benchmark_38252_40546;
  wire [22:0] out_addr_expr_FU_6_i0_fu_run_benchmark_38252_40362;
  wire [22:0] out_addr_expr_FU_7_i0_fu_run_benchmark_38252_40405;
  wire [22:0] out_addr_expr_FU_9_i0_fu_run_benchmark_38252_40411;
  wire signed [31:0] out_bit_ior_concat_expr_FU_277_i0_fu_run_benchmark_38252_38861;
  wire [1:0] out_const_0;
  wire [6:0] out_const_1;
  wire [1:0] out_const_10;
  wire [2:0] out_const_11;
  wire [29:0] out_const_12;
  wire [22:0] out_const_13;
  wire [13:0] out_const_2;
  wire [11:0] out_const_3;
  wire [12:0] out_const_4;
  wire out_const_5;
  wire [1:0] out_const_6;
  wire [2:0] out_const_7;
  wire [3:0] out_const_8;
  wire [14:0] out_const_9;
  wire [31:0] out_conv_out_const_13_23_32;
  wire [5:0] out_conv_out_const_1_7_6;
  wire [31:0] out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_2_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_14_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_10_24_32;
  wire out_ge_expr_FU_32_32_32_278_i0_fu_run_benchmark_38252_40616;
  wire out_ge_expr_FU_32_32_32_278_i1_fu_run_benchmark_38252_40620;
  wire out_ge_expr_FU_32_32_32_278_i2_fu_run_benchmark_38252_40622;
  wire out_ge_expr_FU_32_32_32_278_i3_fu_run_benchmark_38252_40624;
  wire out_ge_expr_FU_32_32_32_278_i4_fu_run_benchmark_38252_40626;
  wire out_ge_expr_FU_32_32_32_278_i5_fu_run_benchmark_38252_40636;
  wire signed [1:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire signed [13:0] out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1;
  wire [31:0] out_iu_conv_conn_obj_10_IUdata_converter_FU_iu_conv_2;
  wire [31:0] out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_3;
  wire [31:0] out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_4;
  wire [31:0] out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_5;
  wire [31:0] out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_6;
  wire [31:0] out_iu_conv_conn_obj_6_IUdata_converter_FU_iu_conv_7;
  wire [31:0] out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_8;
  wire [31:0] out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_9;
  wire out_le_expr_FU_32_0_32_279_i0_fu_run_benchmark_38252_40614;
  wire out_le_expr_FU_32_0_32_280_i0_fu_run_benchmark_38252_40618;
  wire out_le_expr_FU_32_0_32_280_i1_fu_run_benchmark_38252_40642;
  wire out_le_expr_FU_32_0_32_281_i0_fu_run_benchmark_38252_40630;
  wire out_le_expr_FU_32_0_32_281_i1_fu_run_benchmark_38252_40644;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_282_i0_fu_run_benchmark_38252_38681;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_282_i1_fu_run_benchmark_38252_41063;
  wire out_lt_expr_FU_32_32_32_283_i0_fu_run_benchmark_38252_40632;
  wire out_lt_expr_FU_32_32_32_283_i1_fu_run_benchmark_38252_40640;
  wire out_lut_expr_FU_48_i0_fu_run_benchmark_38252_42503;
  wire out_lut_expr_FU_49_i0_fu_run_benchmark_38252_42507;
  wire out_lut_expr_FU_50_i0_fu_run_benchmark_38252_42513;
  wire out_lut_expr_FU_51_i0_fu_run_benchmark_38252_42520;
  wire [1:0] out_multi_read_cond_FU_167_i0_fu_run_benchmark_38252_42514;
  wire [2:0] out_multi_read_cond_FU_52_i0_fu_run_benchmark_38252_42504;
  wire out_ne_expr_FU_32_32_32_284_i0_fu_run_benchmark_38252_40634;
  wire signed [31:0] out_plus_expr_FU_32_0_32_285_i0_fu_run_benchmark_38252_38634;
  wire signed [31:0] out_plus_expr_FU_32_0_32_285_i1_fu_run_benchmark_38252_38712;
  wire signed [31:0] out_plus_expr_FU_32_0_32_285_i2_fu_run_benchmark_38252_38749;
  wire signed [31:0] out_plus_expr_FU_32_0_32_285_i3_fu_run_benchmark_38252_38801;
  wire signed [31:0] out_plus_expr_FU_32_0_32_285_i4_fu_run_benchmark_38252_38829;
  wire signed [31:0] out_plus_expr_FU_32_0_32_285_i5_fu_run_benchmark_38252_38840;
  wire signed [31:0] out_plus_expr_FU_32_0_32_286_i0_fu_run_benchmark_38252_38730;
  wire signed [31:0] out_plus_expr_FU_32_0_32_286_i1_fu_run_benchmark_38252_38813;
  wire signed [31:0] out_plus_expr_FU_32_0_32_286_i2_fu_run_benchmark_38252_38899;
  wire signed [31:0] out_plus_expr_FU_32_0_32_287_i0_fu_run_benchmark_38252_41060;
  wire out_read_cond_FU_111_i0_fu_run_benchmark_38252_38935;
  wire out_read_cond_FU_128_i0_fu_run_benchmark_38252_38937;
  wire out_read_cond_FU_150_i0_fu_run_benchmark_38252_38939;
  wire out_read_cond_FU_191_i0_fu_run_benchmark_38252_38956;
  wire out_read_cond_FU_199_i0_fu_run_benchmark_38252_38958;
  wire out_read_cond_FU_217_i0_fu_run_benchmark_38252_38960;
  wire out_read_cond_FU_237_i0_fu_run_benchmark_38252_38962;
  wire out_read_cond_FU_260_i0_fu_run_benchmark_38252_38964;
  wire out_read_cond_FU_268_i0_fu_run_benchmark_38252_38966;
  wire out_read_cond_FU_72_i0_fu_run_benchmark_38252_38927;
  wire out_read_cond_FU_91_i0_fu_run_benchmark_38252_38933;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire [29:0] out_reg_16_reg_16;
  wire [30:0] out_reg_17_reg_17;
  wire [28:0] out_reg_18_reg_18;
  wire [28:0] out_reg_19_reg_19;
  wire [23:0] out_reg_1_reg_1;
  wire [30:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire out_reg_25_reg_25;
  wire out_reg_26_reg_26;
  wire [29:0] out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire [22:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire out_reg_30_reg_30;
  wire [31:0] out_reg_31_reg_31;
  wire [31:0] out_reg_32_reg_32;
  wire [31:0] out_reg_33_reg_33;
  wire [22:0] out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire [31:0] out_reg_36_reg_36;
  wire [31:0] out_reg_37_reg_37;
  wire [31:0] out_reg_38_reg_38;
  wire [31:0] out_reg_39_reg_39;
  wire [22:0] out_reg_3_reg_3;
  wire [22:0] out_reg_40_reg_40;
  wire [22:0] out_reg_41_reg_41;
  wire out_reg_42_reg_42;
  wire [31:0] out_reg_43_reg_43;
  wire [31:0] out_reg_44_reg_44;
  wire [31:0] out_reg_45_reg_45;
  wire [31:0] out_reg_46_reg_46;
  wire [31:0] out_reg_47_reg_47;
  wire out_reg_48_reg_48;
  wire out_reg_49_reg_49;
  wire [22:0] out_reg_4_reg_4;
  wire [31:0] out_reg_50_reg_50;
  wire [29:0] out_reg_51_reg_51;
  wire [22:0] out_reg_52_reg_52;
  wire out_reg_53_reg_53;
  wire [22:0] out_reg_54_reg_54;
  wire [31:0] out_reg_55_reg_55;
  wire out_reg_56_reg_56;
  wire [31:0] out_reg_57_reg_57;
  wire [31:0] out_reg_58_reg_58;
  wire [31:0] out_reg_59_reg_59;
  wire [22:0] out_reg_5_reg_5;
  wire [31:0] out_reg_60_reg_60;
  wire [31:0] out_reg_61_reg_61;
  wire [22:0] out_reg_62_reg_62;
  wire [22:0] out_reg_63_reg_63;
  wire out_reg_64_reg_64;
  wire [22:0] out_reg_6_reg_6;
  wire [22:0] out_reg_7_reg_7;
  wire [22:0] out_reg_8_reg_8;
  wire [22:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_288_i0_fu_run_benchmark_38252_40917;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_288_i1_fu_run_benchmark_38252_41057;
  wire [23:0] out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_10;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_289_i0_fu_run_benchmark_38252_41027;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_290_i0_fu_run_benchmark_38252_40947;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_290_i1_fu_run_benchmark_38252_41039;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_291_i0_fu_run_benchmark_38252_40996;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_292_i0_fu_run_benchmark_38252_38699;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_292_i1_fu_run_benchmark_38252_38793;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_293_i0_fu_run_benchmark_38252_38853;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_293_i1_fu_run_benchmark_38252_38894;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_294_i0_fu_run_benchmark_38252_38865;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_294_i1_fu_run_benchmark_38252_38877;
  wire out_ui_extract_bit_expr_FU_45_i0_fu_run_benchmark_38252_41548;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_295_i0_fu_run_benchmark_38252_38667;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_295_i1_fu_run_benchmark_38252_38868;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i0_fu_run_benchmark_38252_40352;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i1_fu_run_benchmark_38252_40359;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i2_fu_run_benchmark_38252_40420;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i3_fu_run_benchmark_38252_40431;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i4_fu_run_benchmark_38252_40446;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i5_fu_run_benchmark_38252_40453;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i6_fu_run_benchmark_38252_40523;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_296_i7_fu_run_benchmark_38252_40534;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_296_i8_fu_run_benchmark_38252_41075;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_297_i0_fu_run_benchmark_38252_40385;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_297_i1_fu_run_benchmark_38252_40398;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_297_i2_fu_run_benchmark_38252_40489;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_297_i3_fu_run_benchmark_38252_40502;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_298_i0_fu_run_benchmark_38252_40934;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_298_i1_fu_run_benchmark_38252_40943;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_298_i2_fu_run_benchmark_38252_40957;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_298_i3_fu_run_benchmark_38252_41036;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_298_i4_fu_run_benchmark_38252_41048;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_299_i0_fu_run_benchmark_38252_40975;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_299_i1_fu_run_benchmark_38252_41024;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_300_i0_fu_run_benchmark_38252_40993;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_300_i1_fu_run_benchmark_38252_41009;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_301_i0_fu_run_benchmark_38252_41082;
  wire [31:0] out_ui_minus_expr_FU_0_32_32_302_i0_fu_run_benchmark_38252_38582;
  wire [29:0] out_ui_minus_expr_FU_32_0_32_303_i0_fu_run_benchmark_38252_40954;
  wire [29:0] out_ui_minus_expr_FU_32_0_32_303_i1_fu_run_benchmark_38252_41045;
  wire out_ui_ne_expr_FU_32_32_32_304_i0_fu_run_benchmark_38252_40628;
  wire out_ui_ne_expr_FU_32_32_32_304_i1_fu_run_benchmark_38252_40638;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_305_i0_fu_run_benchmark_38252_38585;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_305_i1_fu_run_benchmark_38252_38949;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_306_i0_fu_run_benchmark_38252_40940;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_306_i1_fu_run_benchmark_38252_41033;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_307_i0_fu_run_benchmark_38252_41071;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_308_i0_fu_run_benchmark_38252_38583;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_308_i1_fu_run_benchmark_38252_38941;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_308_i2_fu_run_benchmark_38252_40931;
  wire [30:0] out_ui_plus_expr_FU_32_32_32_308_i3_fu_run_benchmark_38252_40972;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_308_i4_fu_run_benchmark_38252_40990;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_308_i5_fu_run_benchmark_38252_41006;
  wire [30:0] out_ui_plus_expr_FU_32_32_32_308_i6_fu_run_benchmark_38252_41021;
  wire [23:0] out_ui_pointer_plus_expr_FU_32_0_32_309_i0_fu_run_benchmark_38252_40470;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i0_fu_run_benchmark_38252_38873;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i10_fu_run_benchmark_38252_40492;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i11_fu_run_benchmark_38252_40505;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i12_fu_run_benchmark_38252_40526;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i13_fu_run_benchmark_38252_40537;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i1_fu_run_benchmark_38252_38882;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i2_fu_run_benchmark_38252_40355;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i3_fu_run_benchmark_38252_40365;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i4_fu_run_benchmark_38252_40388;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i5_fu_run_benchmark_38252_40401;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i6_fu_run_benchmark_38252_40423;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i7_fu_run_benchmark_38252_40434;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i8_fu_run_benchmark_38252_40449;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_310_i9_fu_run_benchmark_38252_40459;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i0_fu_run_benchmark_38252_40924;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i1_fu_run_benchmark_38252_40929;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i2_fu_run_benchmark_38252_40937;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i3_fu_run_benchmark_38252_40952;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i4_fu_run_benchmark_38252_40960;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i5_fu_run_benchmark_38252_40963;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i6_fu_run_benchmark_38252_41031;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i7_fu_run_benchmark_38252_41043;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i8_fu_run_benchmark_38252_41051;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_311_i9_fu_run_benchmark_38252_41054;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_312_i0_fu_run_benchmark_38252_40966;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_312_i1_fu_run_benchmark_38252_40970;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_312_i2_fu_run_benchmark_38252_41016;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_312_i3_fu_run_benchmark_38252_41019;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_313_i0_fu_run_benchmark_38252_40982;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_313_i1_fu_run_benchmark_38252_40986;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_313_i2_fu_run_benchmark_38252_41001;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_313_i3_fu_run_benchmark_38252_41004;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_314_i0_fu_run_benchmark_38252_41067;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_0;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_0;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [1:0] sig_out_bus_mergerSout_DataRdy5_;
  wire [63:0] sig_out_bus_mergerSout_Rdata_ram6_;
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_0));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(14),
    .BITSIZE_out1(14)) ASSIGN_SIGNED_FU_i_assign_1 (.out1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1),
    .in1(out_const_2));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(24),
    .BITSIZE_out1(24)) ASSIGN_UNSIGNED_FU_u_assign_10 (.out1(out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_10),
    .in1(out_reg_1_reg_1));
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(23),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(23),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_276_i0 (.out1({null_out_signal_BMEMORY_CTRLN_276_i0_out1_1,
      out_BMEMORY_CTRLN_276_i0_BMEMORY_CTRLN_276_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0}),
    .in2({23'b00000000000000000000000,
      out_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0}),
    .in3({6'b000000,
      out_conv_out_const_1_7_6}),
    .in4({1'b0,
      out_const_5}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_276_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_276_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_2 (.out1(out_iu_conv_conn_obj_10_IUdata_converter_FU_iu_conv_2),
    .in1(out_reg_43_reg_43));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_3 (.out1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_3),
    .in1(out_reg_31_reg_31));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_4 (.out1(out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_4),
    .in1(out_reg_31_reg_31));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_5 (.out1(out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_5),
    .in1(out_reg_44_reg_44));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_6 (.out1(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_6),
    .in1(out_reg_43_reg_43));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_7 (.out1(out_iu_conv_conn_obj_6_IUdata_converter_FU_iu_conv_7),
    .in1(out_reg_31_reg_31));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_8 (.out1(out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_8),
    .in1(out_reg_31_reg_31));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_9 (.out1(out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_9),
    .in1(out_reg_44_reg_44));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0 (.out1(out_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0),
    .sel(selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0),
    .in1(out_iu_conv_conn_obj_3_IUdata_converter_FU_iu_conv_4),
    .in2(out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_8));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_160_reg_0_0_0_0 (.out1(out_MUX_160_reg_0_0_0_0),
    .sel(selector_MUX_160_reg_0_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_2_32),
    .in2(out_lshift_expr_FU_32_0_32_282_i0_fu_run_benchmark_38252_38681));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_162_reg_10_0_0_0 (.out1(out_MUX_162_reg_10_0_0_0),
    .sel(selector_MUX_162_reg_10_0_0_0),
    .in1(out_UUdata_converter_FU_274_i0_fu_run_benchmark_38252_38879),
    .in2(out_ui_bit_ior_concat_expr_FU_294_i1_fu_run_benchmark_38252_38877));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_163_reg_11_0_0_0 (.out1(out_MUX_163_reg_11_0_0_0),
    .sel(selector_MUX_163_reg_11_0_0_0),
    .in1(out_reg_55_reg_55),
    .in2(out_reg_23_reg_23));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_163_reg_11_0_0_1 (.out1(out_MUX_163_reg_11_0_0_1),
    .sel(selector_MUX_163_reg_11_0_0_1),
    .in1(out_UUdata_converter_FU_273_i0_fu_run_benchmark_38252_38870),
    .in2(out_MUX_163_reg_11_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_164_reg_12_0_0_0 (.out1(out_MUX_164_reg_12_0_0_0),
    .sel(selector_MUX_164_reg_12_0_0_0),
    .in1(out_IUdata_converter_FU_271_i0_fu_run_benchmark_38252_38858),
    .in2(out_ui_bit_ior_concat_expr_FU_293_i0_fu_run_benchmark_38252_38853));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_165_reg_13_0_0_0 (.out1(out_MUX_165_reg_13_0_0_0),
    .sel(selector_MUX_165_reg_13_0_0_0),
    .in1(out_IUdata_converter_FU_275_i0_fu_run_benchmark_38252_38896),
    .in2(out_ui_bit_ior_concat_expr_FU_293_i1_fu_run_benchmark_38252_38894));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_174_reg_21_0_0_0 (.out1(out_MUX_174_reg_21_0_0_0),
    .sel(selector_MUX_174_reg_21_0_0_0),
    .in1(out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584),
    .in2(out_plus_expr_FU_32_0_32_285_i0_fu_run_benchmark_38252_38634));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_175_reg_22_0_0_0 (.out1(out_MUX_175_reg_22_0_0_0),
    .sel(selector_MUX_175_reg_22_0_0_0),
    .in1(out_reg_39_reg_39),
    .in2(out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_186_reg_32_0_0_0 (.out1(out_MUX_186_reg_32_0_0_0),
    .sel(selector_MUX_186_reg_32_0_0_0),
    .in1(out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_10_24_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_298_i4_fu_run_benchmark_38252_41048));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_187_reg_33_0_0_0 (.out1(out_MUX_187_reg_33_0_0_0),
    .sel(selector_MUX_187_reg_33_0_0_0),
    .in1(out_reg_11_reg_11),
    .in2(out_ui_bit_ior_concat_expr_FU_292_i1_fu_run_benchmark_38252_38793));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_190_reg_36_0_0_0 (.out1(out_MUX_190_reg_36_0_0_0),
    .sel(selector_MUX_190_reg_36_0_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_plus_expr_FU_32_0_32_285_i3_fu_run_benchmark_38252_38801));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_191_reg_37_0_0_0 (.out1(out_MUX_191_reg_37_0_0_0),
    .sel(selector_MUX_191_reg_37_0_0_0),
    .in1(out_reg_38_reg_38),
    .in2(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_14_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_193_reg_39_0_0_0 (.out1(out_MUX_193_reg_39_0_0_0),
    .sel(selector_MUX_193_reg_39_0_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_plus_expr_FU_32_0_32_285_i4_fu_run_benchmark_38252_38829));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0 (.out1(out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0),
    .sel(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0),
    .in1(out_reg_54_reg_54),
    .in2(out_reg_34_reg_34));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1 (.out1(out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1),
    .sel(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i10_fu_run_benchmark_38252_40492),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_310_i4_fu_run_benchmark_38252_40388));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0 (.out1(out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0),
    .sel(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0),
    .in1(out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0),
    .in2(out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_200_reg_45_0_0_0 (.out1(out_MUX_200_reg_45_0_0_0),
    .sel(selector_MUX_200_reg_45_0_0_0),
    .in1(out_reg_60_reg_60),
    .in2(out_UIdata_converter_FU_43_i0_fu_run_benchmark_38252_38588));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_201_reg_46_0_0_0 (.out1(out_MUX_201_reg_46_0_0_0),
    .sel(selector_MUX_201_reg_46_0_0_0),
    .in1(out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584),
    .in2(out_plus_expr_FU_32_0_32_285_i5_fu_run_benchmark_38252_38840));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_206_reg_50_0_0_0 (.out1(out_MUX_206_reg_50_0_0_0),
    .sel(selector_MUX_206_reg_50_0_0_0),
    .in1(out_reg_57_reg_57),
    .in2(out_ui_lshift_expr_FU_32_0_32_298_i0_fu_run_benchmark_38252_40934));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_214_reg_58_0_0_0 (.out1(out_MUX_214_reg_58_0_0_0),
    .sel(selector_MUX_214_reg_58_0_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_plus_expr_FU_32_0_32_285_i1_fu_run_benchmark_38252_38712));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_215_reg_59_0_0_0 (.out1(out_MUX_215_reg_59_0_0_0),
    .sel(selector_MUX_215_reg_59_0_0_0),
    .in1(out_reg_61_reg_61),
    .in2(out_reg_22_reg_22));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_217_reg_60_0_0_0 (.out1(out_MUX_217_reg_60_0_0_0),
    .sel(selector_MUX_217_reg_60_0_0_0),
    .in1(out_reg_45_reg_45),
    .in2(out_plus_expr_FU_32_0_32_286_i0_fu_run_benchmark_38252_38730));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0 (.out1(out_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0),
    .sel(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0),
    .in1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_3),
    .in2(out_iu_conv_conn_obj_6_IUdata_converter_FU_iu_conv_7));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0 (.out1(out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0),
    .sel(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0),
    .in1(out_reg_52_reg_52),
    .in2(out_reg_29_reg_29));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1 (.out1(out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1),
    .sel(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i11_fu_run_benchmark_38252_40505),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_310_i5_fu_run_benchmark_38252_40401));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0 (.out1(out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0),
    .sel(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0),
    .in1(out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0),
    .in2(out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_8_BMEMORY_CTRLN_276_i0_0_0_0 (.out1(out_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0),
    .sel(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0),
    .in1(out_iu_conv_conn_obj_10_IUdata_converter_FU_iu_conv_2),
    .in2(out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_5));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_8_BMEMORY_CTRLN_276_i0_0_0_1 (.out1(out_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1),
    .sel(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1),
    .in1(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_6),
    .in2(out_iu_conv_conn_obj_9_IUdata_converter_FU_iu_conv_9));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_8_BMEMORY_CTRLN_276_i0_0_1_0 (.out1(out_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0),
    .sel(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0),
    .in1(out_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0),
    .in2(out_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_276_i0_1_0_0 (.out1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0),
    .sel(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0),
    .in1(out_reg_63_reg_63),
    .in2(out_reg_62_reg_62));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_276_i0_1_0_1 (.out1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1),
    .sel(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1),
    .in1(out_reg_41_reg_41),
    .in2(out_reg_40_reg_40));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_276_i0_1_0_2 (.out1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2),
    .sel(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2),
    .in1(out_UUdata_converter_FU_148_i0_fu_run_benchmark_38252_38689),
    .in2(out_UUdata_converter_FU_235_i0_fu_run_benchmark_38252_38786));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_276_i0_1_0_3 (.out1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3),
    .sel(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i2_fu_run_benchmark_38252_40355),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_310_i8_fu_run_benchmark_38252_40449));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_276_i0_1_1_0 (.out1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0),
    .sel(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0),
    .in1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0),
    .in2(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_276_i0_1_1_1 (.out1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1),
    .sel(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1),
    .in1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2),
    .in2(out_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_276_i0_1_2_0 (.out1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0),
    .sel(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0),
    .in1(out_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0),
    .in2(out_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38536.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38536.mem"),
    .n_elements(4096),
    .data_size(32),
    .address_space_begin(MEM_var_38536_38252),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_38536_0 (.out1({out_ARRAY_1D_STD_BRAM_NN_0_i1_array_38536_0,
      out_ARRAY_1D_STD_BRAM_NN_0_i0_array_38536_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_0),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_0),
    .proxy_out1({null_out_signal_array_38536_0_proxy_out1_1,
      null_out_signal_array_38536_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({out_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0,
      out_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0}),
    .in2({out_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0,
      out_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0}),
    .in3({out_conv_out_const_1_7_6,
      out_conv_out_const_1_7_6}),
    .in4({out_const_5,
      out_const_5}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD,
      fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE,
      fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerSout_DataRdy5_ (.out1(sig_out_bus_mergerSout_DataRdy5_),
    .in1({sig_in_bus_mergerSout_DataRdy5_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerSout_Rdata_ram6_ (.out1(sig_out_bus_mergerSout_Rdata_ram6_),
    .in1({sig_in_bus_mergerSout_Rdata_ram6_0}));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(30),
    .value(30'b111111111111111111111111111111)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38536_38252)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b01000000000000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(12),
    .value(12'b011111111111)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b0111111111111)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(15),
    .value(15'b100000000000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_13_23_32 (.out1(out_conv_out_const_13_23_32),
    .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_1_7_6 (.out1(out_conv_out_const_1_7_6),
    .in1(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_2_32 (.out1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_2_32),
    .in1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0));
  IUdata_converter_FU #(.BITSIZE_in1(14),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_14_32 (.out1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1_I_14_32),
    .in1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_1));
  UUdata_converter_FU #(.BITSIZE_in1(24),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_10_24_32 (.out1(out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_10_24_32),
    .in1(out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_10));
  ui_minus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38582 (.out1(out_ui_minus_expr_FU_0_32_32_302_i0_fu_run_benchmark_38252_38582),
    .in1(out_const_5),
    .in2(out_IUdata_converter_FU_272_i0_fu_run_benchmark_38252_38673));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38583 (.out1(out_ui_plus_expr_FU_32_32_32_308_i0_fu_run_benchmark_38252_38583),
    .in1(out_reg_14_reg_14),
    .in2(out_reg_13_reg_13));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38584 (.out1(out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584),
    .in1(out_ui_plus_expr_FU_32_32_32_308_i0_fu_run_benchmark_38252_38583));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38585 (.out1(out_ui_plus_expr_FU_32_0_32_305_i0_fu_run_benchmark_38252_38585),
    .in1(out_reg_13_reg_13),
    .in2(out_const_5));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38586 (.out1(out_UIdata_converter_FU_41_i0_fu_run_benchmark_38252_38586),
    .in1(out_ui_plus_expr_FU_32_0_32_305_i0_fu_run_benchmark_38252_38585));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38587 (.out1(out_UIdata_converter_FU_42_i0_fu_run_benchmark_38252_38587),
    .in1(out_reg_13_reg_13));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38588 (.out1(out_UIdata_converter_FU_43_i0_fu_run_benchmark_38252_38588),
    .in1(out_reg_12_reg_12));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38622 (.out1(out_IUdata_converter_FU_216_i0_fu_run_benchmark_38252_38622),
    .in1(out_reg_21_reg_21));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38634 (.out1(out_plus_expr_FU_32_0_32_285_i0_fu_run_benchmark_38252_38634),
    .in1(out_reg_21_reg_21),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38647 (.out1(out_UUdata_converter_FU_149_i0_fu_run_benchmark_38252_38647),
    .in1(out_reg_50_reg_50));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_38667 (.out1(out_ui_lshift_expr_FU_32_0_32_295_i0_fu_run_benchmark_38252_38667),
    .in1(out_IUdata_converter_FU_272_i0_fu_run_benchmark_38252_38673),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38673 (.out1(out_IUdata_converter_FU_272_i0_fu_run_benchmark_38252_38673),
    .in1(out_reg_0_reg_0));
  lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_38681 (.out1(out_lshift_expr_FU_32_0_32_282_i0_fu_run_benchmark_38252_38681),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38689 (.out1(out_UUdata_converter_FU_148_i0_fu_run_benchmark_38252_38689),
    .in1(out_reg_11_reg_11));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_run_benchmark_38252_38699 (.out1(out_ui_bit_ior_concat_expr_FU_292_i0_fu_run_benchmark_38252_38699),
    .in1(out_ui_lshift_expr_FU_32_0_32_298_i1_fu_run_benchmark_38252_40943),
    .in2(out_ui_bit_and_expr_FU_8_0_8_290_i0_fu_run_benchmark_38252_40947),
    .in3(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38707 (.out1(out_IUdata_converter_FU_190_i0_fu_run_benchmark_38252_38707),
    .in1(out_reg_58_reg_58));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38712 (.out1(out_plus_expr_FU_32_0_32_285_i1_fu_run_benchmark_38252_38712),
    .in1(out_reg_58_reg_58),
    .in2(out_const_0));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38730 (.out1(out_plus_expr_FU_32_0_32_286_i0_fu_run_benchmark_38252_38730),
    .in1(out_reg_45_reg_45),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38737 (.out1(out_IUdata_converter_FU_189_i0_fu_run_benchmark_38252_38737),
    .in1(out_reg_58_reg_58));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38749 (.out1(out_plus_expr_FU_32_0_32_285_i2_fu_run_benchmark_38252_38749),
    .in1(out_reg_59_reg_59),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38767 (.out1(out_UUdata_converter_FU_236_i0_fu_run_benchmark_38252_38767),
    .in1(out_reg_32_reg_32));
  UUdata_converter_FU #(.BITSIZE_in1(24),
    .BITSIZE_out1(24)) fu_run_benchmark_38252_38775 (.out1(out_UUdata_converter_FU_13_i0_fu_run_benchmark_38252_38775),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_309_i0_fu_run_benchmark_38252_40470));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38786 (.out1(out_UUdata_converter_FU_235_i0_fu_run_benchmark_38252_38786),
    .in1(out_reg_33_reg_33));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_run_benchmark_38252_38793 (.out1(out_ui_bit_ior_concat_expr_FU_292_i1_fu_run_benchmark_38252_38793),
    .in1(out_ui_lshift_expr_FU_32_0_32_298_i3_fu_run_benchmark_38252_41036),
    .in2(out_ui_bit_and_expr_FU_8_0_8_290_i1_fu_run_benchmark_38252_41039),
    .in3(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38796 (.out1(out_IUdata_converter_FU_259_i0_fu_run_benchmark_38252_38796),
    .in1(out_reg_36_reg_36));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38801 (.out1(out_plus_expr_FU_32_0_32_285_i3_fu_run_benchmark_38252_38801),
    .in1(out_reg_36_reg_36),
    .in2(out_const_0));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38813 (.out1(out_plus_expr_FU_32_0_32_286_i1_fu_run_benchmark_38252_38813),
    .in1(out_reg_37_reg_37),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38819 (.out1(out_IUdata_converter_FU_258_i0_fu_run_benchmark_38252_38819),
    .in1(out_reg_36_reg_36));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38829 (.out1(out_plus_expr_FU_32_0_32_285_i4_fu_run_benchmark_38252_38829),
    .in1(out_reg_22_reg_22),
    .in2(out_const_0));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38833 (.out1(out_IUdata_converter_FU_110_i0_fu_run_benchmark_38252_38833),
    .in1(out_reg_46_reg_46));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38840 (.out1(out_plus_expr_FU_32_0_32_285_i5_fu_run_benchmark_38252_38840),
    .in1(out_reg_46_reg_46),
    .in2(out_const_0));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(1)) fu_run_benchmark_38252_38853 (.out1(out_ui_bit_ior_concat_expr_FU_293_i0_fu_run_benchmark_38252_38853),
    .in1(out_ui_lshift_expr_FU_32_0_32_299_i0_fu_run_benchmark_38252_40975),
    .in2(out_const_5),
    .in3(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38856 (.out1(out_IUdata_converter_FU_270_i0_fu_run_benchmark_38252_38856),
    .in1(out_lshift_expr_FU_32_0_32_282_i0_fu_run_benchmark_38252_38681));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38858 (.out1(out_IUdata_converter_FU_271_i0_fu_run_benchmark_38252_38858),
    .in1(out_bit_ior_concat_expr_FU_277_i0_fu_run_benchmark_38252_38861));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(1)) fu_run_benchmark_38252_38861 (.out1(out_bit_ior_concat_expr_FU_277_i0_fu_run_benchmark_38252_38861),
    .in1(out_lshift_expr_FU_32_0_32_282_i1_fu_run_benchmark_38252_41063),
    .in2(out_const_0),
    .in3(out_const_0));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_run_benchmark_38252_38865 (.out1(out_ui_bit_ior_concat_expr_FU_294_i0_fu_run_benchmark_38252_38865),
    .in1(out_ui_lshift_expr_FU_32_0_32_300_i0_fu_run_benchmark_38252_40993),
    .in2(out_ui_bit_and_expr_FU_8_0_8_291_i0_fu_run_benchmark_38252_40996),
    .in3(out_const_10));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_38868 (.out1(out_ui_lshift_expr_FU_32_0_32_295_i1_fu_run_benchmark_38252_38868),
    .in1(out_IUdata_converter_FU_270_i0_fu_run_benchmark_38252_38856),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38870 (.out1(out_UUdata_converter_FU_273_i0_fu_run_benchmark_38252_38870),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i0_fu_run_benchmark_38252_38873));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_38873 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i0_fu_run_benchmark_38252_38873),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_295_i0_fu_run_benchmark_38252_38667));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_run_benchmark_38252_38877 (.out1(out_ui_bit_ior_concat_expr_FU_294_i1_fu_run_benchmark_38252_38877),
    .in1(out_ui_lshift_expr_FU_32_0_32_300_i1_fu_run_benchmark_38252_41009),
    .in2(out_ui_lshift_expr_FU_8_0_8_301_i0_fu_run_benchmark_38252_41082),
    .in3(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38879 (.out1(out_UUdata_converter_FU_274_i0_fu_run_benchmark_38252_38879),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i1_fu_run_benchmark_38252_38882));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_38882 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i1_fu_run_benchmark_38252_38882),
    .in1(out_reg_9_reg_9),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i8_fu_run_benchmark_38252_41075));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(1)) fu_run_benchmark_38252_38894 (.out1(out_ui_bit_ior_concat_expr_FU_293_i1_fu_run_benchmark_38252_38894),
    .in1(out_ui_lshift_expr_FU_32_0_32_299_i1_fu_run_benchmark_38252_41024),
    .in2(out_ui_bit_and_expr_FU_1_0_1_289_i0_fu_run_benchmark_38252_41027),
    .in3(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38896 (.out1(out_IUdata_converter_FU_275_i0_fu_run_benchmark_38252_38896),
    .in1(out_plus_expr_FU_32_0_32_286_i2_fu_run_benchmark_38252_38899));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38899 (.out1(out_plus_expr_FU_32_0_32_286_i2_fu_run_benchmark_38252_38899),
    .in1(out_reg_0_reg_0),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38927 (.out1(out_read_cond_FU_72_i0_fu_run_benchmark_38252_38927),
    .in1(out_reg_25_reg_25));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38933 (.out1(out_read_cond_FU_91_i0_fu_run_benchmark_38252_38933),
    .in1(out_reg_48_reg_48));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38935 (.out1(out_read_cond_FU_111_i0_fu_run_benchmark_38252_38935),
    .in1(out_reg_53_reg_53));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38937 (.out1(out_read_cond_FU_128_i0_fu_run_benchmark_38252_38937),
    .in1(out_reg_49_reg_49));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38939 (.out1(out_read_cond_FU_150_i0_fu_run_benchmark_38252_38939),
    .in1(out_reg_56_reg_56));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38941 (.out1(out_ui_plus_expr_FU_32_32_32_308_i1_fu_run_benchmark_38252_38941),
    .in1(out_ui_bit_ior_concat_expr_FU_293_i1_fu_run_benchmark_38252_38894),
    .in2(out_reg_14_reg_14));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38942 (.out1(out_UIdata_converter_FU_47_i0_fu_run_benchmark_38252_38942),
    .in1(out_ui_plus_expr_FU_32_32_32_308_i1_fu_run_benchmark_38252_38941));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38949 (.out1(out_ui_plus_expr_FU_32_0_32_305_i1_fu_run_benchmark_38252_38949),
    .in1(out_reg_12_reg_12),
    .in2(out_const_5));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38950 (.out1(out_UIdata_converter_FU_44_i0_fu_run_benchmark_38252_38950),
    .in1(out_ui_plus_expr_FU_32_0_32_305_i1_fu_run_benchmark_38252_38949));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38956 (.out1(out_read_cond_FU_191_i0_fu_run_benchmark_38252_38956),
    .in1(out_lt_expr_FU_32_32_32_283_i0_fu_run_benchmark_38252_40632));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38958 (.out1(out_read_cond_FU_199_i0_fu_run_benchmark_38252_38958),
    .in1(out_reg_64_reg_64));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38960 (.out1(out_read_cond_FU_217_i0_fu_run_benchmark_38252_38960),
    .in1(out_reg_30_reg_30));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38962 (.out1(out_read_cond_FU_237_i0_fu_run_benchmark_38252_38962),
    .in1(out_reg_35_reg_35));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38964 (.out1(out_read_cond_FU_260_i0_fu_run_benchmark_38252_38964),
    .in1(out_lt_expr_FU_32_32_32_283_i1_fu_run_benchmark_38252_40640));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38966 (.out1(out_read_cond_FU_268_i0_fu_run_benchmark_38252_38966),
    .in1(out_reg_42_reg_42));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_40322 (.out1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_40322),
    .in1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_40338));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_40338 (.out1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_40338),
    .in1(in_port_vargs));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40352 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i0_fu_run_benchmark_38252_40352),
    .in1(out_IUdata_converter_FU_110_i0_fu_run_benchmark_38252_38833),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40355 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i2_fu_run_benchmark_38252_40355),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i0_fu_run_benchmark_38252_40352));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40359 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i1_fu_run_benchmark_38252_40359),
    .in1(out_IUdata_converter_FU_110_i0_fu_run_benchmark_38252_38833),
    .in2(out_const_6));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40362 (.out1(out_addr_expr_FU_6_i0_fu_run_benchmark_38252_40362),
    .in1(out_conv_out_const_13_23_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40365 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i3_fu_run_benchmark_38252_40365),
    .in1(out_reg_3_reg_3),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i1_fu_run_benchmark_38252_40359));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40379 (.out1(out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_40379),
    .in1(out_addr_expr_FU_7_i0_fu_run_benchmark_38252_40405));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_40382 (.out1(out_IUdata_converter_FU_187_i0_fu_run_benchmark_38252_40382),
    .in1(out_reg_45_reg_45));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu_run_benchmark_38252_40385 (.out1(out_ui_lshift_expr_FU_32_0_32_297_i0_fu_run_benchmark_38252_40385),
    .in1(out_IUdata_converter_FU_187_i0_fu_run_benchmark_38252_40382),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40388 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i4_fu_run_benchmark_38252_40388),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_297_i0_fu_run_benchmark_38252_40385));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40392 (.out1(out_UUdata_converter_FU_10_i0_fu_run_benchmark_38252_40392),
    .in1(out_addr_expr_FU_9_i0_fu_run_benchmark_38252_40411));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_40395 (.out1(out_IUdata_converter_FU_188_i0_fu_run_benchmark_38252_40395),
    .in1(out_reg_59_reg_59));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu_run_benchmark_38252_40398 (.out1(out_ui_lshift_expr_FU_32_0_32_297_i1_fu_run_benchmark_38252_40398),
    .in1(out_IUdata_converter_FU_188_i0_fu_run_benchmark_38252_40395),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40401 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i5_fu_run_benchmark_38252_40401),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_lshift_expr_FU_32_0_32_297_i1_fu_run_benchmark_38252_40398));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40405 (.out1(out_addr_expr_FU_7_i0_fu_run_benchmark_38252_40405),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40411 (.out1(out_addr_expr_FU_9_i0_fu_run_benchmark_38252_40411),
    .in1(out_conv_out_const_13_23_32));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40420 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i2_fu_run_benchmark_38252_40420),
    .in1(out_IUdata_converter_FU_190_i0_fu_run_benchmark_38252_38707),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40423 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i6_fu_run_benchmark_38252_40423),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i2_fu_run_benchmark_38252_40420));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40431 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i3_fu_run_benchmark_38252_40431),
    .in1(out_IUdata_converter_FU_189_i0_fu_run_benchmark_38252_38737),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40434 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i7_fu_run_benchmark_38252_40434),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i3_fu_run_benchmark_38252_40431));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40446 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i4_fu_run_benchmark_38252_40446),
    .in1(out_IUdata_converter_FU_216_i0_fu_run_benchmark_38252_38622),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40449 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i8_fu_run_benchmark_38252_40449),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i4_fu_run_benchmark_38252_40446));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40453 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i5_fu_run_benchmark_38252_40453),
    .in1(out_IUdata_converter_FU_216_i0_fu_run_benchmark_38252_38622),
    .in2(out_const_6));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40456 (.out1(out_addr_expr_FU_11_i0_fu_run_benchmark_38252_40456),
    .in1(out_conv_out_const_13_23_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40459 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i9_fu_run_benchmark_38252_40459),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i5_fu_run_benchmark_38252_40453));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40466 (.out1(out_addr_expr_FU_12_i0_fu_run_benchmark_38252_40466),
    .in1(out_conv_out_const_13_23_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(15),
    .BITSIZE_out1(24),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40470 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_309_i0_fu_run_benchmark_38252_40470),
    .in1(out_addr_expr_FU_12_i0_fu_run_benchmark_38252_40466),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40483 (.out1(out_UUdata_converter_FU_15_i0_fu_run_benchmark_38252_40483),
    .in1(out_addr_expr_FU_14_i0_fu_run_benchmark_38252_40509));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_40486 (.out1(out_IUdata_converter_FU_256_i0_fu_run_benchmark_38252_40486),
    .in1(out_reg_37_reg_37));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu_run_benchmark_38252_40489 (.out1(out_ui_lshift_expr_FU_32_0_32_297_i2_fu_run_benchmark_38252_40489),
    .in1(out_IUdata_converter_FU_256_i0_fu_run_benchmark_38252_40486),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40492 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i10_fu_run_benchmark_38252_40492),
    .in1(out_reg_7_reg_7),
    .in2(out_ui_lshift_expr_FU_32_0_32_297_i2_fu_run_benchmark_38252_40489));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40496 (.out1(out_UUdata_converter_FU_17_i0_fu_run_benchmark_38252_40496),
    .in1(out_addr_expr_FU_16_i0_fu_run_benchmark_38252_40514));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_40499 (.out1(out_IUdata_converter_FU_257_i0_fu_run_benchmark_38252_40499),
    .in1(out_reg_22_reg_22));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu_run_benchmark_38252_40502 (.out1(out_ui_lshift_expr_FU_32_0_32_297_i3_fu_run_benchmark_38252_40502),
    .in1(out_IUdata_converter_FU_257_i0_fu_run_benchmark_38252_40499),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40505 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i11_fu_run_benchmark_38252_40505),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_lshift_expr_FU_32_0_32_297_i3_fu_run_benchmark_38252_40502));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40509 (.out1(out_addr_expr_FU_14_i0_fu_run_benchmark_38252_40509),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40514 (.out1(out_addr_expr_FU_16_i0_fu_run_benchmark_38252_40514),
    .in1(out_conv_out_const_13_23_32));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40523 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i6_fu_run_benchmark_38252_40523),
    .in1(out_IUdata_converter_FU_259_i0_fu_run_benchmark_38252_38796),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40526 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i12_fu_run_benchmark_38252_40526),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i6_fu_run_benchmark_38252_40523));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_40534 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i7_fu_run_benchmark_38252_40534),
    .in1(out_IUdata_converter_FU_258_i0_fu_run_benchmark_38252_38819),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_40537 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_310_i13_fu_run_benchmark_38252_40537),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_296_i7_fu_run_benchmark_38252_40534));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_40546 (.out1(out_addr_expr_FU_5_i0_fu_run_benchmark_38252_40546),
    .in1(out_conv_out_const_13_23_32));
  le_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(12),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40614 (.out1(out_le_expr_FU_32_0_32_279_i0_fu_run_benchmark_38252_40614),
    .in1(out_rshift_expr_FU_32_0_32_288_i0_fu_run_benchmark_38252_40917),
    .in2(out_const_3));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40616 (.out1(out_ge_expr_FU_32_32_32_278_i0_fu_run_benchmark_38252_40616),
    .in1(out_UIdata_converter_FU_42_i0_fu_run_benchmark_38252_38587),
    .in2(out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(14),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40618 (.out1(out_le_expr_FU_32_0_32_280_i0_fu_run_benchmark_38252_40618),
    .in1(out_UIdata_converter_FU_41_i0_fu_run_benchmark_38252_38586),
    .in2(out_const_2));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40620 (.out1(out_ge_expr_FU_32_32_32_278_i1_fu_run_benchmark_38252_40620),
    .in1(out_UIdata_converter_FU_42_i0_fu_run_benchmark_38252_38587),
    .in2(out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40622 (.out1(out_ge_expr_FU_32_32_32_278_i2_fu_run_benchmark_38252_40622),
    .in1(out_UIdata_converter_FU_43_i0_fu_run_benchmark_38252_38588),
    .in2(out_UIdata_converter_FU_41_i0_fu_run_benchmark_38252_38586));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40624 (.out1(out_ge_expr_FU_32_32_32_278_i3_fu_run_benchmark_38252_40624),
    .in1(out_reg_24_reg_24),
    .in2(out_plus_expr_FU_32_0_32_285_i5_fu_run_benchmark_38252_38840));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40626 (.out1(out_ge_expr_FU_32_32_32_278_i4_fu_run_benchmark_38252_40626),
    .in1(out_UIdata_converter_FU_43_i0_fu_run_benchmark_38252_38588),
    .in2(out_UIdata_converter_FU_40_i0_fu_run_benchmark_38252_38584));
  ui_ne_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40628 (.out1(out_ui_ne_expr_FU_32_32_32_304_i0_fu_run_benchmark_38252_40628),
    .in1(out_reg_51_reg_51),
    .in2(out_ui_rshift_expr_FU_32_0_32_311_i5_fu_run_benchmark_38252_40963));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40630 (.out1(out_le_expr_FU_32_0_32_281_i0_fu_run_benchmark_38252_40630),
    .in1(out_UIdata_converter_FU_47_i0_fu_run_benchmark_38252_38942),
    .in2(out_const_4));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40632 (.out1(out_lt_expr_FU_32_32_32_283_i0_fu_run_benchmark_38252_40632),
    .in1(out_ARRAY_1D_STD_BRAM_NN_0_i0_array_38536_0),
    .in2(out_ARRAY_1D_STD_BRAM_NN_0_i1_array_38536_0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40634 (.out1(out_ne_expr_FU_32_32_32_284_i0_fu_run_benchmark_38252_40634),
    .in1(out_plus_expr_FU_32_0_32_285_i1_fu_run_benchmark_38252_38712),
    .in2(out_reg_47_reg_47));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40636 (.out1(out_ge_expr_FU_32_32_32_278_i5_fu_run_benchmark_38252_40636),
    .in1(out_reg_24_reg_24),
    .in2(out_plus_expr_FU_32_0_32_285_i0_fu_run_benchmark_38252_38634));
  ui_ne_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40638 (.out1(out_ui_ne_expr_FU_32_32_32_304_i1_fu_run_benchmark_38252_40638),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i8_fu_run_benchmark_38252_41051),
    .in2(out_reg_27_reg_27));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40640 (.out1(out_lt_expr_FU_32_32_32_283_i1_fu_run_benchmark_38252_40640),
    .in1(out_ARRAY_1D_STD_BRAM_NN_0_i0_array_38536_0),
    .in2(out_ARRAY_1D_STD_BRAM_NN_0_i1_array_38536_0));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(14),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40642 (.out1(out_le_expr_FU_32_0_32_280_i1_fu_run_benchmark_38252_40642),
    .in1(out_plus_expr_FU_32_0_32_285_i3_fu_run_benchmark_38252_38801),
    .in2(out_const_2));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40644 (.out1(out_le_expr_FU_32_0_32_281_i1_fu_run_benchmark_38252_40644),
    .in1(out_lshift_expr_FU_32_0_32_282_i0_fu_run_benchmark_38252_38681),
    .in2(out_const_4));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_run_benchmark_38252_40917 (.out1(out_rshift_expr_FU_32_0_32_288_i0_fu_run_benchmark_38252_40917),
    .in1(out_UIdata_converter_FU_43_i0_fu_run_benchmark_38252_38588),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40924 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i0_fu_run_benchmark_38252_40924),
    .in1(out_reg_10_reg_10),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40929 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i1_fu_run_benchmark_38252_40929),
    .in1(out_ui_lshift_expr_FU_32_0_32_295_i0_fu_run_benchmark_38252_38667),
    .in2(out_const_6));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_40931 (.out1(out_ui_plus_expr_FU_32_32_32_308_i2_fu_run_benchmark_38252_40931),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i0_fu_run_benchmark_38252_40924),
    .in2(out_reg_16_reg_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40934 (.out1(out_ui_lshift_expr_FU_32_0_32_298_i0_fu_run_benchmark_38252_40934),
    .in1(out_ui_plus_expr_FU_32_32_32_308_i2_fu_run_benchmark_38252_40931),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40937 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i2_fu_run_benchmark_38252_40937),
    .in1(out_reg_11_reg_11),
    .in2(out_const_6));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_40940 (.out1(out_ui_plus_expr_FU_32_0_32_306_i0_fu_run_benchmark_38252_40940),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i2_fu_run_benchmark_38252_40937),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40943 (.out1(out_ui_lshift_expr_FU_32_0_32_298_i1_fu_run_benchmark_38252_40943),
    .in1(out_ui_plus_expr_FU_32_0_32_306_i0_fu_run_benchmark_38252_40940),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_40947 (.out1(out_ui_bit_and_expr_FU_8_0_8_290_i0_fu_run_benchmark_38252_40947),
    .in1(out_reg_11_reg_11),
    .in2(out_const_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40952 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i3_fu_run_benchmark_38252_40952),
    .in1(out_reg_50_reg_50),
    .in2(out_const_6));
  ui_minus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_40954 (.out1(out_ui_minus_expr_FU_32_0_32_303_i0_fu_run_benchmark_38252_40954),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i3_fu_run_benchmark_38252_40952),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40957 (.out1(out_ui_lshift_expr_FU_32_0_32_298_i2_fu_run_benchmark_38252_40957),
    .in1(out_ui_minus_expr_FU_32_0_32_303_i0_fu_run_benchmark_38252_40954),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40960 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i4_fu_run_benchmark_38252_40960),
    .in1(out_reg_10_reg_10),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40963 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i5_fu_run_benchmark_38252_40963),
    .in1(out_ui_lshift_expr_FU_32_0_32_298_i2_fu_run_benchmark_38252_40957),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_run_benchmark_38252_40966 (.out1(out_ui_rshift_expr_FU_32_0_32_312_i0_fu_run_benchmark_38252_40966),
    .in1(out_reg_12_reg_12),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_run_benchmark_38252_40970 (.out1(out_ui_rshift_expr_FU_32_0_32_312_i1_fu_run_benchmark_38252_40970),
    .in1(out_IUdata_converter_FU_270_i0_fu_run_benchmark_38252_38856),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu_run_benchmark_38252_40972 (.out1(out_ui_plus_expr_FU_32_32_32_308_i3_fu_run_benchmark_38252_40972),
    .in1(out_ui_rshift_expr_FU_32_0_32_312_i0_fu_run_benchmark_38252_40966),
    .in2(out_reg_17_reg_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40975 (.out1(out_ui_lshift_expr_FU_32_0_32_299_i0_fu_run_benchmark_38252_40975),
    .in1(out_ui_plus_expr_FU_32_32_32_308_i3_fu_run_benchmark_38252_40972),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_run_benchmark_38252_40982 (.out1(out_ui_rshift_expr_FU_32_0_32_313_i0_fu_run_benchmark_38252_40982),
    .in1(out_reg_11_reg_11),
    .in2(out_const_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_run_benchmark_38252_40986 (.out1(out_ui_rshift_expr_FU_32_0_32_313_i1_fu_run_benchmark_38252_40986),
    .in1(out_ui_lshift_expr_FU_32_0_32_295_i1_fu_run_benchmark_38252_38868),
    .in2(out_const_10));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_run_benchmark_38252_40990 (.out1(out_ui_plus_expr_FU_32_32_32_308_i4_fu_run_benchmark_38252_40990),
    .in1(out_ui_rshift_expr_FU_32_0_32_313_i0_fu_run_benchmark_38252_40982),
    .in2(out_reg_18_reg_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40993 (.out1(out_ui_lshift_expr_FU_32_0_32_300_i0_fu_run_benchmark_38252_40993),
    .in1(out_ui_plus_expr_FU_32_32_32_308_i4_fu_run_benchmark_38252_40990),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_run_benchmark_38252_40996 (.out1(out_ui_bit_and_expr_FU_8_0_8_291_i0_fu_run_benchmark_38252_40996),
    .in1(out_reg_11_reg_11),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_run_benchmark_38252_41001 (.out1(out_ui_rshift_expr_FU_32_0_32_313_i2_fu_run_benchmark_38252_41001),
    .in1(out_reg_10_reg_10),
    .in2(out_const_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_run_benchmark_38252_41004 (.out1(out_ui_rshift_expr_FU_32_0_32_313_i3_fu_run_benchmark_38252_41004),
    .in1(out_ui_lshift_expr_FU_32_0_32_295_i1_fu_run_benchmark_38252_38868),
    .in2(out_const_10));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_run_benchmark_38252_41006 (.out1(out_ui_plus_expr_FU_32_32_32_308_i5_fu_run_benchmark_38252_41006),
    .in1(out_ui_rshift_expr_FU_32_0_32_313_i2_fu_run_benchmark_38252_41001),
    .in2(out_reg_19_reg_19));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_41009 (.out1(out_ui_lshift_expr_FU_32_0_32_300_i1_fu_run_benchmark_38252_41009),
    .in1(out_ui_plus_expr_FU_32_32_32_308_i5_fu_run_benchmark_38252_41006),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_41012 (.out1(out_UUdata_converter_FU_46_i0_fu_run_benchmark_38252_41012),
    .in1(out_ui_extract_bit_expr_FU_45_i0_fu_run_benchmark_38252_41548));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_run_benchmark_38252_41016 (.out1(out_ui_rshift_expr_FU_32_0_32_312_i2_fu_run_benchmark_38252_41016),
    .in1(out_reg_13_reg_13),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_run_benchmark_38252_41019 (.out1(out_ui_rshift_expr_FU_32_0_32_312_i3_fu_run_benchmark_38252_41019),
    .in1(out_IUdata_converter_FU_270_i0_fu_run_benchmark_38252_38856),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu_run_benchmark_38252_41021 (.out1(out_ui_plus_expr_FU_32_32_32_308_i6_fu_run_benchmark_38252_41021),
    .in1(out_ui_rshift_expr_FU_32_0_32_312_i2_fu_run_benchmark_38252_41016),
    .in2(out_reg_20_reg_20));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_41024 (.out1(out_ui_lshift_expr_FU_32_0_32_299_i1_fu_run_benchmark_38252_41024),
    .in1(out_ui_plus_expr_FU_32_32_32_308_i6_fu_run_benchmark_38252_41021),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_41027 (.out1(out_ui_bit_and_expr_FU_1_0_1_289_i0_fu_run_benchmark_38252_41027),
    .in1(out_reg_13_reg_13),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_41031 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i6_fu_run_benchmark_38252_41031),
    .in1(out_reg_33_reg_33),
    .in2(out_const_6));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_41033 (.out1(out_ui_plus_expr_FU_32_0_32_306_i1_fu_run_benchmark_38252_41033),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i6_fu_run_benchmark_38252_41031),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_41036 (.out1(out_ui_lshift_expr_FU_32_0_32_298_i3_fu_run_benchmark_38252_41036),
    .in1(out_ui_plus_expr_FU_32_0_32_306_i1_fu_run_benchmark_38252_41033),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_41039 (.out1(out_ui_bit_and_expr_FU_8_0_8_290_i1_fu_run_benchmark_38252_41039),
    .in1(out_reg_33_reg_33),
    .in2(out_const_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_41043 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i7_fu_run_benchmark_38252_41043),
    .in1(out_reg_32_reg_32),
    .in2(out_const_6));
  ui_minus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_41045 (.out1(out_ui_minus_expr_FU_32_0_32_303_i1_fu_run_benchmark_38252_41045),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i7_fu_run_benchmark_38252_41043),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_41048 (.out1(out_ui_lshift_expr_FU_32_0_32_298_i4_fu_run_benchmark_38252_41048),
    .in1(out_ui_minus_expr_FU_32_0_32_303_i1_fu_run_benchmark_38252_41045),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_41051 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i8_fu_run_benchmark_38252_41051),
    .in1(out_ui_lshift_expr_FU_32_0_32_298_i4_fu_run_benchmark_38252_41048),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_41054 (.out1(out_ui_rshift_expr_FU_32_0_32_311_i9_fu_run_benchmark_38252_41054),
    .in1(out_reg_10_reg_10),
    .in2(out_const_6));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_run_benchmark_38252_41057 (.out1(out_rshift_expr_FU_32_0_32_288_i1_fu_run_benchmark_38252_41057),
    .in1(out_lshift_expr_FU_32_0_32_282_i0_fu_run_benchmark_38252_38681),
    .in2(out_const_0));
  plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_41060 (.out1(out_plus_expr_FU_32_0_32_287_i0_fu_run_benchmark_38252_41060),
    .in1(out_rshift_expr_FU_32_0_32_288_i1_fu_run_benchmark_38252_41057),
    .in2(out_const_5));
  lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_41063 (.out1(out_lshift_expr_FU_32_0_32_282_i1_fu_run_benchmark_38252_41063),
    .in1(out_plus_expr_FU_32_0_32_287_i0_fu_run_benchmark_38252_41060),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_41067 (.out1(out_ui_rshift_expr_FU_32_0_32_314_i0_fu_run_benchmark_38252_41067),
    .in1(out_ui_lshift_expr_FU_32_0_32_295_i0_fu_run_benchmark_38252_38667),
    .in2(out_const_6));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_41071 (.out1(out_ui_plus_expr_FU_32_0_32_307_i0_fu_run_benchmark_38252_41071),
    .in1(out_ui_rshift_expr_FU_32_0_32_314_i0_fu_run_benchmark_38252_41067),
    .in2(out_const_12));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_41075 (.out1(out_ui_lshift_expr_FU_32_0_32_296_i8_fu_run_benchmark_38252_41075),
    .in1(out_ui_plus_expr_FU_32_0_32_307_i0_fu_run_benchmark_38252_41071),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu_run_benchmark_38252_41082 (.out1(out_ui_lshift_expr_FU_8_0_8_301_i0_fu_run_benchmark_38252_41082),
    .in1(out_UUdata_converter_FU_46_i0_fu_run_benchmark_38252_41012),
    .in2(out_const_6));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_41548 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu_run_benchmark_38252_41548),
    .in1(out_reg_10_reg_10),
    .in2(out_const_6));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_42503 (.out1(out_lut_expr_FU_48_i0_fu_run_benchmark_38252_42503),
    .in1(out_const_8),
    .in2(out_le_expr_FU_32_0_32_279_i0_fu_run_benchmark_38252_40614),
    .in3(out_ge_expr_FU_32_32_32_278_i1_fu_run_benchmark_38252_40620),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(3)) fu_run_benchmark_38252_42504 (.out1(out_multi_read_cond_FU_52_i0_fu_run_benchmark_38252_42504),
    .in1({out_lut_expr_FU_48_i0_fu_run_benchmark_38252_42503,
      out_lut_expr_FU_50_i0_fu_run_benchmark_38252_42513,
      out_lut_expr_FU_49_i0_fu_run_benchmark_38252_42507}));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_42507 (.out1(out_lut_expr_FU_49_i0_fu_run_benchmark_38252_42507),
    .in1(out_const_7),
    .in2(out_le_expr_FU_32_0_32_279_i0_fu_run_benchmark_38252_40614),
    .in3(out_ge_expr_FU_32_32_32_278_i0_fu_run_benchmark_38252_40616),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_42513 (.out1(out_lut_expr_FU_50_i0_fu_run_benchmark_38252_42513),
    .in1(out_const_5),
    .in2(out_le_expr_FU_32_0_32_279_i0_fu_run_benchmark_38252_40614),
    .in3(out_ge_expr_FU_32_32_32_278_i0_fu_run_benchmark_38252_40616),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_42514 (.out1(out_multi_read_cond_FU_167_i0_fu_run_benchmark_38252_42514),
    .in1({out_reg_28_reg_28,
      out_reg_26_reg_26}));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_42520 (.out1(out_lut_expr_FU_51_i0_fu_run_benchmark_38252_42520),
    .in1(out_const_7),
    .in2(out_le_expr_FU_32_0_32_281_i0_fu_run_benchmark_38252_40630),
    .in3(out_reg_15_reg_15),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_0 (.out1(sig_in_bus_mergerSout_DataRdy5_0),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_0 (.out1(sig_in_bus_mergerSout_Rdata_ram6_0),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_160_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(24),
    .BITSIZE_out1(24)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_13_i0_fu_run_benchmark_38252_38775),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_162_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_163_reg_11_0_0_1),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_164_reg_12_0_0_0),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_165_reg_13_0_0_0),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_minus_expr_FU_0_32_32_302_i0_fu_run_benchmark_38252_38582),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_le_expr_FU_32_0_32_281_i1_fu_run_benchmark_38252_40644),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i1_fu_run_benchmark_38252_40929),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_312_i1_fu_run_benchmark_38252_40970),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_313_i1_fu_run_benchmark_38252_40986),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_313_i3_fu_run_benchmark_38252_41004),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_40322),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_312_i3_fu_run_benchmark_38252_41019),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_174_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_175_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_294_i0_fu_run_benchmark_38252_38865),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_42_i0_fu_run_benchmark_38252_38587),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_le_expr_FU_32_0_32_280_i0_fu_run_benchmark_38252_40618),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_le_expr_FU_32_0_32_281_i0_fu_run_benchmark_38252_40630),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i9_fu_run_benchmark_38252_41054),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_51_i0_fu_run_benchmark_38252_42520),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i9_fu_run_benchmark_38252_40459),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_6_i0_fu_run_benchmark_38252_40362),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_278_i5_fu_run_benchmark_38252_40636),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_276_i0_BMEMORY_CTRLN_276_i0),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_186_reg_32_0_0_0),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_187_reg_33_0_0_0),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_236_i0_fu_run_benchmark_38252_38767),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_304_i1_fu_run_benchmark_38252_40638),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_190_reg_36_0_0_0),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_191_reg_37_0_0_0),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_286_i1_fu_run_benchmark_38252_38813),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_193_reg_39_0_0_0),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_40379),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i12_fu_run_benchmark_38252_40526),
    .wenable(wrenable_reg_40));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i13_fu_run_benchmark_38252_40537),
    .wenable(wrenable_reg_41));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_le_expr_FU_32_0_32_280_i1_fu_run_benchmark_38252_40642),
    .wenable(wrenable_reg_42));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_ARRAY_1D_STD_BRAM_NN_0_i1_array_38536_0),
    .wenable(wrenable_reg_43));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_ARRAY_1D_STD_BRAM_NN_0_i0_array_38536_0),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_200_reg_45_0_0_0),
    .wenable(wrenable_reg_45));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_201_reg_46_0_0_0),
    .wenable(wrenable_reg_46));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_44_i0_fu_run_benchmark_38252_38950),
    .wenable(wrenable_reg_47));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_278_i2_fu_run_benchmark_38252_40622),
    .wenable(wrenable_reg_48));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_278_i4_fu_run_benchmark_38252_40626),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_10_i0_fu_run_benchmark_38252_40392),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_206_reg_50_0_0_0),
    .wenable(wrenable_reg_50));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_311_i4_fu_run_benchmark_38252_40960),
    .wenable(wrenable_reg_51));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i3_fu_run_benchmark_38252_40365),
    .wenable(wrenable_reg_52));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_278_i3_fu_run_benchmark_38252_40624),
    .wenable(wrenable_reg_53));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_149_i0_fu_run_benchmark_38252_38647),
    .wenable(wrenable_reg_54));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_292_i0_fu_run_benchmark_38252_38699),
    .wenable(wrenable_reg_55));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_304_i0_fu_run_benchmark_38252_40628),
    .wenable(wrenable_reg_56));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_298_i2_fu_run_benchmark_38252_40957),
    .wenable(wrenable_reg_57));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_214_reg_58_0_0_0),
    .wenable(wrenable_reg_58));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_215_reg_59_0_0_0),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_11_i0_fu_run_benchmark_38252_40456),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_217_reg_60_0_0_0),
    .wenable(wrenable_reg_60));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_285_i2_fu_run_benchmark_38252_38749),
    .wenable(wrenable_reg_61));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i6_fu_run_benchmark_38252_40423),
    .wenable(wrenable_reg_62));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_310_i7_fu_run_benchmark_38252_40434),
    .wenable(wrenable_reg_63));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_32_32_284_i0_fu_run_benchmark_38252_40634),
    .wenable(wrenable_reg_64));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_15_i0_fu_run_benchmark_38252_40483),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_17_i0_fu_run_benchmark_38252_40496),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_5_i0_fu_run_benchmark_38252_40546),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_DataRdy5_ (.out1(Sout_DataRdy),
    .in1(sig_out_bus_mergerSout_DataRdy5_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_Rdata_ram6_ (.out1(Sout_Rdata_ram),
    .in1(sig_out_bus_mergerSout_Rdata_ram6_));
  // io-signal post fix
  assign OUT_CONDITION_run_benchmark_38252_38927 = out_read_cond_FU_72_i0_fu_run_benchmark_38252_38927;
  assign OUT_CONDITION_run_benchmark_38252_38933 = out_read_cond_FU_91_i0_fu_run_benchmark_38252_38933;
  assign OUT_CONDITION_run_benchmark_38252_38935 = out_read_cond_FU_111_i0_fu_run_benchmark_38252_38935;
  assign OUT_CONDITION_run_benchmark_38252_38937 = out_read_cond_FU_128_i0_fu_run_benchmark_38252_38937;
  assign OUT_CONDITION_run_benchmark_38252_38939 = out_read_cond_FU_150_i0_fu_run_benchmark_38252_38939;
  assign OUT_CONDITION_run_benchmark_38252_38956 = out_read_cond_FU_191_i0_fu_run_benchmark_38252_38956;
  assign OUT_CONDITION_run_benchmark_38252_38958 = out_read_cond_FU_199_i0_fu_run_benchmark_38252_38958;
  assign OUT_CONDITION_run_benchmark_38252_38960 = out_read_cond_FU_217_i0_fu_run_benchmark_38252_38960;
  assign OUT_CONDITION_run_benchmark_38252_38962 = out_read_cond_FU_237_i0_fu_run_benchmark_38252_38962;
  assign OUT_CONDITION_run_benchmark_38252_38964 = out_read_cond_FU_260_i0_fu_run_benchmark_38252_38964;
  assign OUT_CONDITION_run_benchmark_38252_38966 = out_read_cond_FU_268_i0_fu_run_benchmark_38252_38966;
  assign OUT_MULTIIF_run_benchmark_38252_42504 = out_multi_read_cond_FU_52_i0_fu_run_benchmark_38252_42504;
  assign OUT_MULTIIF_run_benchmark_38252_42514 = out_multi_read_cond_FU_167_i0_fu_run_benchmark_38252_42514;

endmodule

// FSM based controller description for run_benchmark
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_run_benchmark(done_port,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE,
  fuselector_BMEMORY_CTRLN_276_i0_LOAD,
  fuselector_BMEMORY_CTRLN_276_i0_STORE,
  selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0,
  selector_MUX_160_reg_0_0_0_0,
  selector_MUX_162_reg_10_0_0_0,
  selector_MUX_163_reg_11_0_0_0,
  selector_MUX_163_reg_11_0_0_1,
  selector_MUX_164_reg_12_0_0_0,
  selector_MUX_165_reg_13_0_0_0,
  selector_MUX_174_reg_21_0_0_0,
  selector_MUX_175_reg_22_0_0_0,
  selector_MUX_186_reg_32_0_0_0,
  selector_MUX_187_reg_33_0_0_0,
  selector_MUX_190_reg_36_0_0_0,
  selector_MUX_191_reg_37_0_0_0,
  selector_MUX_193_reg_39_0_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0,
  selector_MUX_200_reg_45_0_0_0,
  selector_MUX_201_reg_46_0_0_0,
  selector_MUX_206_reg_50_0_0_0,
  selector_MUX_214_reg_58_0_0_0,
  selector_MUX_215_reg_59_0_0_0,
  selector_MUX_217_reg_60_0_0_0,
  selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0,
  selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0,
  selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1,
  selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0,
  selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0,
  selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1,
  selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1,
  selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_run_benchmark_38252_38927,
  OUT_CONDITION_run_benchmark_38252_38933,
  OUT_CONDITION_run_benchmark_38252_38935,
  OUT_CONDITION_run_benchmark_38252_38937,
  OUT_CONDITION_run_benchmark_38252_38939,
  OUT_CONDITION_run_benchmark_38252_38956,
  OUT_CONDITION_run_benchmark_38252_38958,
  OUT_CONDITION_run_benchmark_38252_38960,
  OUT_CONDITION_run_benchmark_38252_38962,
  OUT_CONDITION_run_benchmark_38252_38964,
  OUT_CONDITION_run_benchmark_38252_38966,
  OUT_MULTIIF_run_benchmark_38252_42504,
  OUT_MULTIIF_run_benchmark_38252_42514,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_run_benchmark_38252_38927;
  input OUT_CONDITION_run_benchmark_38252_38933;
  input OUT_CONDITION_run_benchmark_38252_38935;
  input OUT_CONDITION_run_benchmark_38252_38937;
  input OUT_CONDITION_run_benchmark_38252_38939;
  input OUT_CONDITION_run_benchmark_38252_38956;
  input OUT_CONDITION_run_benchmark_38252_38958;
  input OUT_CONDITION_run_benchmark_38252_38960;
  input OUT_CONDITION_run_benchmark_38252_38962;
  input OUT_CONDITION_run_benchmark_38252_38964;
  input OUT_CONDITION_run_benchmark_38252_38966;
  input [2:0] OUT_MULTIIF_run_benchmark_38252_42504;
  input [1:0] OUT_MULTIIF_run_benchmark_38252_42514;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  output fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE;
  output fuselector_BMEMORY_CTRLN_276_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_276_i0_STORE;
  output selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0;
  output selector_MUX_160_reg_0_0_0_0;
  output selector_MUX_162_reg_10_0_0_0;
  output selector_MUX_163_reg_11_0_0_0;
  output selector_MUX_163_reg_11_0_0_1;
  output selector_MUX_164_reg_12_0_0_0;
  output selector_MUX_165_reg_13_0_0_0;
  output selector_MUX_174_reg_21_0_0_0;
  output selector_MUX_175_reg_22_0_0_0;
  output selector_MUX_186_reg_32_0_0_0;
  output selector_MUX_187_reg_33_0_0_0;
  output selector_MUX_190_reg_36_0_0_0;
  output selector_MUX_191_reg_37_0_0_0;
  output selector_MUX_193_reg_39_0_0_0;
  output selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0;
  output selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1;
  output selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0;
  output selector_MUX_200_reg_45_0_0_0;
  output selector_MUX_201_reg_46_0_0_0;
  output selector_MUX_206_reg_50_0_0_0;
  output selector_MUX_214_reg_58_0_0_0;
  output selector_MUX_215_reg_59_0_0_0;
  output selector_MUX_217_reg_60_0_0_0;
  output selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0;
  output selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0;
  output selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1;
  output selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0;
  output selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0;
  output selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1;
  output selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0;
  output selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0;
  output selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1;
  output selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2;
  output selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3;
  output selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0;
  output selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1;
  output selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_36;
  output wrenable_reg_37;
  output wrenable_reg_38;
  output wrenable_reg_39;
  output wrenable_reg_4;
  output wrenable_reg_40;
  output wrenable_reg_41;
  output wrenable_reg_42;
  output wrenable_reg_43;
  output wrenable_reg_44;
  output wrenable_reg_45;
  output wrenable_reg_46;
  output wrenable_reg_47;
  output wrenable_reg_48;
  output wrenable_reg_49;
  output wrenable_reg_5;
  output wrenable_reg_50;
  output wrenable_reg_51;
  output wrenable_reg_52;
  output wrenable_reg_53;
  output wrenable_reg_54;
  output wrenable_reg_55;
  output wrenable_reg_56;
  output wrenable_reg_57;
  output wrenable_reg_58;
  output wrenable_reg_59;
  output wrenable_reg_6;
  output wrenable_reg_60;
  output wrenable_reg_61;
  output wrenable_reg_62;
  output wrenable_reg_63;
  output wrenable_reg_64;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [29:0] S_0 = 30'b000000000000000000000000000001,
    S_28 = 30'b010000000000000000000000000000,
    S_1 = 30'b000000000000000000000000000010,
    S_17 = 30'b000000000000100000000000000000,
    S_18 = 30'b000000000001000000000000000000,
    S_19 = 30'b000000000010000000000000000000,
    S_2 = 30'b000000000000000000000000000100,
    S_20 = 30'b000000000100000000000000000000,
    S_21 = 30'b000000001000000000000000000000,
    S_22 = 30'b000000010000000000000000000000,
    S_23 = 30'b000000100000000000000000000000,
    S_24 = 30'b000001000000000000000000000000,
    S_26 = 30'b000100000000000000000000000000,
    S_25 = 30'b000010000000000000000000000000,
    S_27 = 30'b001000000000000000000000000000,
    S_4 = 30'b000000000000000000000000010000,
    S_5 = 30'b000000000000000000000000100000,
    S_6 = 30'b000000000000000000000001000000,
    S_3 = 30'b000000000000000000000000001000,
    S_8 = 30'b000000000000000000000100000000,
    S_9 = 30'b000000000000000000001000000000,
    S_10 = 30'b000000000000000000010000000000,
    S_7 = 30'b000000000000000000000010000000,
    S_12 = 30'b000000000000000001000000000000,
    S_13 = 30'b000000000000000010000000000000,
    S_15 = 30'b000000000000001000000000000000,
    S_14 = 30'b000000000000000100000000000000,
    S_16 = 30'b000000000000010000000000000000,
    S_11 = 30'b000000000000000000100000000000,
    S_29 = 30'b100000000000000000000000000000;
  reg [29:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE;
  reg fuselector_BMEMORY_CTRLN_276_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_276_i0_STORE;
  reg selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0;
  reg selector_MUX_160_reg_0_0_0_0;
  reg selector_MUX_162_reg_10_0_0_0;
  reg selector_MUX_163_reg_11_0_0_0;
  reg selector_MUX_163_reg_11_0_0_1;
  reg selector_MUX_164_reg_12_0_0_0;
  reg selector_MUX_165_reg_13_0_0_0;
  reg selector_MUX_174_reg_21_0_0_0;
  reg selector_MUX_175_reg_22_0_0_0;
  reg selector_MUX_186_reg_32_0_0_0;
  reg selector_MUX_187_reg_33_0_0_0;
  reg selector_MUX_190_reg_36_0_0_0;
  reg selector_MUX_191_reg_37_0_0_0;
  reg selector_MUX_193_reg_39_0_0_0;
  reg selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0;
  reg selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1;
  reg selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0;
  reg selector_MUX_200_reg_45_0_0_0;
  reg selector_MUX_201_reg_46_0_0_0;
  reg selector_MUX_206_reg_50_0_0_0;
  reg selector_MUX_214_reg_58_0_0_0;
  reg selector_MUX_215_reg_59_0_0_0;
  reg selector_MUX_217_reg_60_0_0_0;
  reg selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0;
  reg selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0;
  reg selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1;
  reg selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0;
  reg selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0;
  reg selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1;
  reg selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0;
  reg selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0;
  reg selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1;
  reg selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2;
  reg selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3;
  reg selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0;
  reg selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1;
  reg selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_36;
  reg wrenable_reg_37;
  reg wrenable_reg_38;
  reg wrenable_reg_39;
  reg wrenable_reg_4;
  reg wrenable_reg_40;
  reg wrenable_reg_41;
  reg wrenable_reg_42;
  reg wrenable_reg_43;
  reg wrenable_reg_44;
  reg wrenable_reg_45;
  reg wrenable_reg_46;
  reg wrenable_reg_47;
  reg wrenable_reg_48;
  reg wrenable_reg_49;
  reg wrenable_reg_5;
  reg wrenable_reg_50;
  reg wrenable_reg_51;
  reg wrenable_reg_52;
  reg wrenable_reg_53;
  reg wrenable_reg_54;
  reg wrenable_reg_55;
  reg wrenable_reg_56;
  reg wrenable_reg_57;
  reg wrenable_reg_58;
  reg wrenable_reg_59;
  reg wrenable_reg_6;
  reg wrenable_reg_60;
  reg wrenable_reg_61;
  reg wrenable_reg_62;
  reg wrenable_reg_63;
  reg wrenable_reg_64;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_276_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_276_i0_STORE = 1'b0;
    selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0 = 1'b0;
    selector_MUX_160_reg_0_0_0_0 = 1'b0;
    selector_MUX_162_reg_10_0_0_0 = 1'b0;
    selector_MUX_163_reg_11_0_0_0 = 1'b0;
    selector_MUX_163_reg_11_0_0_1 = 1'b0;
    selector_MUX_164_reg_12_0_0_0 = 1'b0;
    selector_MUX_165_reg_13_0_0_0 = 1'b0;
    selector_MUX_174_reg_21_0_0_0 = 1'b0;
    selector_MUX_175_reg_22_0_0_0 = 1'b0;
    selector_MUX_186_reg_32_0_0_0 = 1'b0;
    selector_MUX_187_reg_33_0_0_0 = 1'b0;
    selector_MUX_190_reg_36_0_0_0 = 1'b0;
    selector_MUX_191_reg_37_0_0_0 = 1'b0;
    selector_MUX_193_reg_39_0_0_0 = 1'b0;
    selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0 = 1'b0;
    selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1 = 1'b0;
    selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0 = 1'b0;
    selector_MUX_200_reg_45_0_0_0 = 1'b0;
    selector_MUX_201_reg_46_0_0_0 = 1'b0;
    selector_MUX_206_reg_50_0_0_0 = 1'b0;
    selector_MUX_214_reg_58_0_0_0 = 1'b0;
    selector_MUX_215_reg_59_0_0_0 = 1'b0;
    selector_MUX_217_reg_60_0_0_0 = 1'b0;
    selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0 = 1'b0;
    selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0 = 1'b0;
    selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1 = 1'b0;
    selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0 = 1'b0;
    selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0 = 1'b0;
    selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1 = 1'b0;
    selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_36 = 1'b0;
    wrenable_reg_37 = 1'b0;
    wrenable_reg_38 = 1'b0;
    wrenable_reg_39 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_40 = 1'b0;
    wrenable_reg_41 = 1'b0;
    wrenable_reg_42 = 1'b0;
    wrenable_reg_43 = 1'b0;
    wrenable_reg_44 = 1'b0;
    wrenable_reg_45 = 1'b0;
    wrenable_reg_46 = 1'b0;
    wrenable_reg_47 = 1'b0;
    wrenable_reg_48 = 1'b0;
    wrenable_reg_49 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_50 = 1'b0;
    wrenable_reg_51 = 1'b0;
    wrenable_reg_52 = 1'b0;
    wrenable_reg_53 = 1'b0;
    wrenable_reg_54 = 1'b0;
    wrenable_reg_55 = 1'b0;
    wrenable_reg_56 = 1'b0;
    wrenable_reg_57 = 1'b0;
    wrenable_reg_58 = 1'b0;
    wrenable_reg_59 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_60 = 1'b0;
    wrenable_reg_61 = 1'b0;
    wrenable_reg_62 = 1'b0;
    wrenable_reg_63 = 1'b0;
    wrenable_reg_64 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_160_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_28;
        end
        else
        begin
          _next_state = S_0;
        end
      S_28 :
        begin
          selector_MUX_162_reg_10_0_0_0 = 1'b1;
          selector_MUX_163_reg_11_0_0_1 = 1'b1;
          selector_MUX_164_reg_12_0_0_0 = 1'b1;
          selector_MUX_165_reg_13_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          selector_MUX_174_reg_21_0_0_0 = 1'b1;
          selector_MUX_201_reg_46_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          casez (OUT_MULTIIF_run_benchmark_38252_42504)
            3'b100 :
              begin
                _next_state = S_4;
                selector_MUX_174_reg_21_0_0_0 = 1'b0;
                wrenable_reg_21 = 1'b0;
                wrenable_reg_25 = 1'b0;
                wrenable_reg_27 = 1'b0;
              end
            3'b??1 :
              begin
                _next_state = S_17;
                selector_MUX_201_reg_46_0_0_0 = 1'b0;
                wrenable_reg_45 = 1'b0;
                wrenable_reg_46 = 1'b0;
                wrenable_reg_47 = 1'b0;
                wrenable_reg_48 = 1'b0;
                wrenable_reg_49 = 1'b0;
                wrenable_reg_50 = 1'b0;
                wrenable_reg_51 = 1'b0;
              end
            3'b?10 :
              begin
                _next_state = S_2;
                selector_MUX_174_reg_21_0_0_0 = 1'b0;
                selector_MUX_201_reg_46_0_0_0 = 1'b0;
                wrenable_reg_21 = 1'b0;
                wrenable_reg_24 = 1'b0;
                wrenable_reg_45 = 1'b0;
                wrenable_reg_46 = 1'b0;
                wrenable_reg_47 = 1'b0;
                wrenable_reg_48 = 1'b0;
                wrenable_reg_49 = 1'b0;
                wrenable_reg_50 = 1'b0;
                wrenable_reg_51 = 1'b0;
              end
            default:
              begin
                _next_state = S_3;
                selector_MUX_174_reg_21_0_0_0 = 1'b0;
                selector_MUX_201_reg_46_0_0_0 = 1'b0;
                wrenable_reg_21 = 1'b0;
                wrenable_reg_24 = 1'b0;
                wrenable_reg_25 = 1'b0;
                wrenable_reg_27 = 1'b0;
                wrenable_reg_46 = 1'b0;
              end
          endcase
        end
      S_17 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_LOAD = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          wrenable_reg_31 = 1'b1;
          _next_state = S_19;
        end
      S_19 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE = 1'b1;
          selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38960 == 1'b1)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_2 :
        begin
          selector_MUX_186_reg_32_0_0_0 = 1'b1;
          selector_MUX_187_reg_33_0_0_0 = 1'b1;
          selector_MUX_190_reg_36_0_0_0 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38927 == 1'b1)
            begin
              _next_state = S_20;
              selector_MUX_190_reg_36_0_0_0 = 1'b0;
              wrenable_reg_36 = 1'b0;
              wrenable_reg_37 = 1'b0;
            end
          else
            begin
              _next_state = S_23;
              selector_MUX_186_reg_32_0_0_0 = 1'b0;
              selector_MUX_187_reg_33_0_0_0 = 1'b0;
              wrenable_reg_32 = 1'b0;
              wrenable_reg_33 = 1'b0;
            end
        end
      S_20 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_LOAD = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          wrenable_reg_31 = 1'b1;
          _next_state = S_22;
        end
      S_22 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE = 1'b1;
          selector_MUX_190_reg_36_0_0_0 = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38962 == 1'b1)
            begin
              _next_state = S_20;
              selector_MUX_190_reg_36_0_0_0 = 1'b0;
              wrenable_reg_36 = 1'b0;
              wrenable_reg_37 = 1'b0;
            end
          else
            begin
              _next_state = S_23;
            end
        end
      S_23 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1 = 1'b1;
          selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38964 == 1'b1)
            begin
              _next_state = S_25;
              wrenable_reg_43 = 1'b0;
            end
          else
            begin
              _next_state = S_26;
              wrenable_reg_44 = 1'b0;
            end
        end
      S_26 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_STORE = 1'b1;
          selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0 = 1'b1;
          selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0 = 1'b1;
          _next_state = S_27;
        end
      S_25 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_STORE = 1'b1;
          selector_MUX_191_reg_37_0_0_0 = 1'b1;
          selector_MUX_193_reg_39_0_0_0 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_39 = 1'b1;
          _next_state = S_27;
        end
      S_27 :
        begin
          selector_MUX_175_reg_22_0_0_0 = 1'b1;
          wrenable_reg_22 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38966 == 1'b1)
            begin
              _next_state = S_23;
            end
          else
            begin
              _next_state = S_11;
              selector_MUX_175_reg_22_0_0_0 = 1'b0;
              wrenable_reg_22 = 1'b0;
            end
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_LOAD = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_52 = 1'b1;
          wrenable_reg_53 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          wrenable_reg_31 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE = 1'b1;
          selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0 = 1'b1;
          selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0 = 1'b1;
          selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38935 == 1'b1)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_3 :
        begin
          if (OUT_CONDITION_run_benchmark_38252_38933 == 1'b1)
            begin
              _next_state = S_8;
            end
          else
            begin
              _next_state = S_7;
            end
        end
      S_8 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_LOAD = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1 = 1'b1;
          wrenable_reg_54 = 1'b1;
          wrenable_reg_55 = 1'b1;
          wrenable_reg_56 = 1'b1;
          wrenable_reg_57 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_31 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE = 1'b1;
          selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0 = 1'b1;
          selector_MUX_163_reg_11_0_0_0 = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0 = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0 = 1'b1;
          selector_MUX_206_reg_50_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_50 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38939 == 1'b1)
            begin
              _next_state = S_8;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_163_reg_11_0_0_0 = 1'b0;
              selector_MUX_206_reg_50_0_0_0 = 1'b0;
              wrenable_reg_11 = 1'b0;
              wrenable_reg_50 = 1'b0;
            end
        end
      S_7 :
        begin
          selector_MUX_214_reg_58_0_0_0 = 1'b1;
          wrenable_reg_58 = 1'b1;
          wrenable_reg_59 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38937 == 1'b1)
            begin
              _next_state = S_12;
            end
          else
            begin
              _next_state = S_11;
              selector_MUX_214_reg_58_0_0_0 = 1'b0;
              wrenable_reg_58 = 1'b0;
              wrenable_reg_59 = 1'b0;
            end
        end
      S_12 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD = 1'b1;
          wrenable_reg_58 = 1'b1;
          wrenable_reg_60 = 1'b1;
          wrenable_reg_61 = 1'b1;
          wrenable_reg_62 = 1'b1;
          wrenable_reg_63 = 1'b1;
          wrenable_reg_64 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38956 == 1'b1)
            begin
              _next_state = S_14;
              wrenable_reg_43 = 1'b0;
            end
          else
            begin
              _next_state = S_15;
              wrenable_reg_44 = 1'b0;
            end
        end
      S_15 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_STORE = 1'b1;
          selector_MUX_215_reg_59_0_0_0 = 1'b1;
          selector_MUX_217_reg_60_0_0_0 = 1'b1;
          selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0 = 1'b1;
          wrenable_reg_59 = 1'b1;
          wrenable_reg_60 = 1'b1;
          _next_state = S_16;
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_276_i0_STORE = 1'b1;
          selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          selector_MUX_200_reg_45_0_0_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38958 == 1'b1)
            begin
              _next_state = S_12;
            end
          else
            begin
              _next_state = S_11;
              selector_MUX_200_reg_45_0_0_0 = 1'b0;
              wrenable_reg_45 = 1'b0;
            end
        end
      S_11 :
        begin
          wrenable_reg_11 = 1'b1;
          casez (OUT_MULTIIF_run_benchmark_38252_42514)
            2'b?1 :
              begin
                _next_state = S_1;
              end
            2'b10 :
              begin
                _next_state = S_28;
                wrenable_reg_11 = 1'b0;
              end
            default:
              begin
                _next_state = S_29;
                done_port = 1'b1;
                wrenable_reg_11 = 1'b0;
              end
          endcase
        end
      S_29 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for run_benchmark
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module run_benchmark(clock,
  reset,
  start_port,
  done_port,
  vargs,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  parameter MEM_var_38536_38252=7864320;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] vargs;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [45:0] S_addr_ram;
  input [63:0] S_Wdata_ram;
  input [11:0] S_data_ram_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [63:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_run_benchmark_38252_38927;
  wire OUT_CONDITION_run_benchmark_38252_38933;
  wire OUT_CONDITION_run_benchmark_38252_38935;
  wire OUT_CONDITION_run_benchmark_38252_38937;
  wire OUT_CONDITION_run_benchmark_38252_38939;
  wire OUT_CONDITION_run_benchmark_38252_38956;
  wire OUT_CONDITION_run_benchmark_38252_38958;
  wire OUT_CONDITION_run_benchmark_38252_38960;
  wire OUT_CONDITION_run_benchmark_38252_38962;
  wire OUT_CONDITION_run_benchmark_38252_38964;
  wire OUT_CONDITION_run_benchmark_38252_38966;
  wire [2:0] OUT_MULTIIF_run_benchmark_38252_42504;
  wire [1:0] OUT_MULTIIF_run_benchmark_38252_42514;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE;
  wire fuselector_BMEMORY_CTRLN_276_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_276_i0_STORE;
  wire selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0;
  wire selector_MUX_160_reg_0_0_0_0;
  wire selector_MUX_162_reg_10_0_0_0;
  wire selector_MUX_163_reg_11_0_0_0;
  wire selector_MUX_163_reg_11_0_0_1;
  wire selector_MUX_164_reg_12_0_0_0;
  wire selector_MUX_165_reg_13_0_0_0;
  wire selector_MUX_174_reg_21_0_0_0;
  wire selector_MUX_175_reg_22_0_0_0;
  wire selector_MUX_186_reg_32_0_0_0;
  wire selector_MUX_187_reg_33_0_0_0;
  wire selector_MUX_190_reg_36_0_0_0;
  wire selector_MUX_191_reg_37_0_0_0;
  wire selector_MUX_193_reg_39_0_0_0;
  wire selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0;
  wire selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1;
  wire selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0;
  wire selector_MUX_200_reg_45_0_0_0;
  wire selector_MUX_201_reg_46_0_0_0;
  wire selector_MUX_206_reg_50_0_0_0;
  wire selector_MUX_214_reg_58_0_0_0;
  wire selector_MUX_215_reg_59_0_0_0;
  wire selector_MUX_217_reg_60_0_0_0;
  wire selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0;
  wire selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0;
  wire selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1;
  wire selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0;
  wire selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0;
  wire selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1;
  wire selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0;
  wire selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0;
  wire selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1;
  wire selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2;
  wire selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3;
  wire selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0;
  wire selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1;
  wire selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_36;
  wire wrenable_reg_37;
  wire wrenable_reg_38;
  wire wrenable_reg_39;
  wire wrenable_reg_4;
  wire wrenable_reg_40;
  wire wrenable_reg_41;
  wire wrenable_reg_42;
  wire wrenable_reg_43;
  wire wrenable_reg_44;
  wire wrenable_reg_45;
  wire wrenable_reg_46;
  wire wrenable_reg_47;
  wire wrenable_reg_48;
  wire wrenable_reg_49;
  wire wrenable_reg_5;
  wire wrenable_reg_50;
  wire wrenable_reg_51;
  wire wrenable_reg_52;
  wire wrenable_reg_53;
  wire wrenable_reg_54;
  wire wrenable_reg_55;
  wire wrenable_reg_56;
  wire wrenable_reg_57;
  wire wrenable_reg_58;
  wire wrenable_reg_59;
  wire wrenable_reg_6;
  wire wrenable_reg_60;
  wire wrenable_reg_61;
  wire wrenable_reg_62;
  wire wrenable_reg_63;
  wire wrenable_reg_64;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_run_benchmark Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE),
    .fuselector_BMEMORY_CTRLN_276_i0_LOAD(fuselector_BMEMORY_CTRLN_276_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_276_i0_STORE(fuselector_BMEMORY_CTRLN_276_i0_STORE),
    .selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0(selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0),
    .selector_MUX_160_reg_0_0_0_0(selector_MUX_160_reg_0_0_0_0),
    .selector_MUX_162_reg_10_0_0_0(selector_MUX_162_reg_10_0_0_0),
    .selector_MUX_163_reg_11_0_0_0(selector_MUX_163_reg_11_0_0_0),
    .selector_MUX_163_reg_11_0_0_1(selector_MUX_163_reg_11_0_0_1),
    .selector_MUX_164_reg_12_0_0_0(selector_MUX_164_reg_12_0_0_0),
    .selector_MUX_165_reg_13_0_0_0(selector_MUX_165_reg_13_0_0_0),
    .selector_MUX_174_reg_21_0_0_0(selector_MUX_174_reg_21_0_0_0),
    .selector_MUX_175_reg_22_0_0_0(selector_MUX_175_reg_22_0_0_0),
    .selector_MUX_186_reg_32_0_0_0(selector_MUX_186_reg_32_0_0_0),
    .selector_MUX_187_reg_33_0_0_0(selector_MUX_187_reg_33_0_0_0),
    .selector_MUX_190_reg_36_0_0_0(selector_MUX_190_reg_36_0_0_0),
    .selector_MUX_191_reg_37_0_0_0(selector_MUX_191_reg_37_0_0_0),
    .selector_MUX_193_reg_39_0_0_0(selector_MUX_193_reg_39_0_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0),
    .selector_MUX_200_reg_45_0_0_0(selector_MUX_200_reg_45_0_0_0),
    .selector_MUX_201_reg_46_0_0_0(selector_MUX_201_reg_46_0_0_0),
    .selector_MUX_206_reg_50_0_0_0(selector_MUX_206_reg_50_0_0_0),
    .selector_MUX_214_reg_58_0_0_0(selector_MUX_214_reg_58_0_0_0),
    .selector_MUX_215_reg_59_0_0_0(selector_MUX_215_reg_59_0_0_0),
    .selector_MUX_217_reg_60_0_0_0(selector_MUX_217_reg_60_0_0_0),
    .selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0),
    .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0),
    .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1),
    .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0),
    .selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0),
    .selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1),
    .selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_run_benchmark_38252_38927(OUT_CONDITION_run_benchmark_38252_38927),
    .OUT_CONDITION_run_benchmark_38252_38933(OUT_CONDITION_run_benchmark_38252_38933),
    .OUT_CONDITION_run_benchmark_38252_38935(OUT_CONDITION_run_benchmark_38252_38935),
    .OUT_CONDITION_run_benchmark_38252_38937(OUT_CONDITION_run_benchmark_38252_38937),
    .OUT_CONDITION_run_benchmark_38252_38939(OUT_CONDITION_run_benchmark_38252_38939),
    .OUT_CONDITION_run_benchmark_38252_38956(OUT_CONDITION_run_benchmark_38252_38956),
    .OUT_CONDITION_run_benchmark_38252_38958(OUT_CONDITION_run_benchmark_38252_38958),
    .OUT_CONDITION_run_benchmark_38252_38960(OUT_CONDITION_run_benchmark_38252_38960),
    .OUT_CONDITION_run_benchmark_38252_38962(OUT_CONDITION_run_benchmark_38252_38962),
    .OUT_CONDITION_run_benchmark_38252_38964(OUT_CONDITION_run_benchmark_38252_38964),
    .OUT_CONDITION_run_benchmark_38252_38966(OUT_CONDITION_run_benchmark_38252_38966),
    .OUT_MULTIIF_run_benchmark_38252_42504(OUT_MULTIIF_run_benchmark_38252_42504),
    .OUT_MULTIIF_run_benchmark_38252_42514(OUT_MULTIIF_run_benchmark_38252_42514),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_run_benchmark #(.MEM_var_38536_38252(MEM_var_38536_38252)) Datapath_i (.Sout_Rdata_ram(Sout_Rdata_ram),
    .Sout_DataRdy(Sout_DataRdy),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_run_benchmark_38252_38927(OUT_CONDITION_run_benchmark_38252_38927),
    .OUT_CONDITION_run_benchmark_38252_38933(OUT_CONDITION_run_benchmark_38252_38933),
    .OUT_CONDITION_run_benchmark_38252_38935(OUT_CONDITION_run_benchmark_38252_38935),
    .OUT_CONDITION_run_benchmark_38252_38937(OUT_CONDITION_run_benchmark_38252_38937),
    .OUT_CONDITION_run_benchmark_38252_38939(OUT_CONDITION_run_benchmark_38252_38939),
    .OUT_CONDITION_run_benchmark_38252_38956(OUT_CONDITION_run_benchmark_38252_38956),
    .OUT_CONDITION_run_benchmark_38252_38958(OUT_CONDITION_run_benchmark_38252_38958),
    .OUT_CONDITION_run_benchmark_38252_38960(OUT_CONDITION_run_benchmark_38252_38960),
    .OUT_CONDITION_run_benchmark_38252_38962(OUT_CONDITION_run_benchmark_38252_38962),
    .OUT_CONDITION_run_benchmark_38252_38964(OUT_CONDITION_run_benchmark_38252_38964),
    .OUT_CONDITION_run_benchmark_38252_38966(OUT_CONDITION_run_benchmark_38252_38966),
    .OUT_MULTIIF_run_benchmark_38252_42504(OUT_MULTIIF_run_benchmark_38252_42504),
    .OUT_MULTIIF_run_benchmark_38252_42514(OUT_MULTIIF_run_benchmark_38252_42514),
    .clock(clock),
    .reset(reset),
    .in_port_vargs(vargs),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .Sin_DataRdy(Sin_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_0_i1_STORE),
    .fuselector_BMEMORY_CTRLN_276_i0_LOAD(fuselector_BMEMORY_CTRLN_276_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_276_i0_STORE(fuselector_BMEMORY_CTRLN_276_i0_STORE),
    .selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0(selector_MUX_0_ARRAY_1D_STD_BRAM_NN_0_i0_0_0_0),
    .selector_MUX_160_reg_0_0_0_0(selector_MUX_160_reg_0_0_0_0),
    .selector_MUX_162_reg_10_0_0_0(selector_MUX_162_reg_10_0_0_0),
    .selector_MUX_163_reg_11_0_0_0(selector_MUX_163_reg_11_0_0_0),
    .selector_MUX_163_reg_11_0_0_1(selector_MUX_163_reg_11_0_0_1),
    .selector_MUX_164_reg_12_0_0_0(selector_MUX_164_reg_12_0_0_0),
    .selector_MUX_165_reg_13_0_0_0(selector_MUX_165_reg_13_0_0_0),
    .selector_MUX_174_reg_21_0_0_0(selector_MUX_174_reg_21_0_0_0),
    .selector_MUX_175_reg_22_0_0_0(selector_MUX_175_reg_22_0_0_0),
    .selector_MUX_186_reg_32_0_0_0(selector_MUX_186_reg_32_0_0_0),
    .selector_MUX_187_reg_33_0_0_0(selector_MUX_187_reg_33_0_0_0),
    .selector_MUX_190_reg_36_0_0_0(selector_MUX_190_reg_36_0_0_0),
    .selector_MUX_191_reg_37_0_0_0(selector_MUX_191_reg_37_0_0_0),
    .selector_MUX_193_reg_39_0_0_0(selector_MUX_193_reg_39_0_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_0_1),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_0_i0_1_1_0),
    .selector_MUX_200_reg_45_0_0_0(selector_MUX_200_reg_45_0_0_0),
    .selector_MUX_201_reg_46_0_0_0(selector_MUX_201_reg_46_0_0_0),
    .selector_MUX_206_reg_50_0_0_0(selector_MUX_206_reg_50_0_0_0),
    .selector_MUX_214_reg_58_0_0_0(selector_MUX_214_reg_58_0_0_0),
    .selector_MUX_215_reg_59_0_0_0(selector_MUX_215_reg_59_0_0_0),
    .selector_MUX_217_reg_60_0_0_0(selector_MUX_217_reg_60_0_0_0),
    .selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_0_i1_0_0_0),
    .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_0),
    .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_0_1),
    .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_0_i1_1_1_0),
    .selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_0),
    .selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_0_1),
    .selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0(selector_MUX_8_BMEMORY_CTRLN_276_i0_0_1_0),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_0),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_1),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_2),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_0_3),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_0),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_1_1),
    .selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0(selector_MUX_9_BMEMORY_CTRLN_276_i0_1_2_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// Datapath RTL description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_main(clock,
  reset,
  return_port,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  selector_IN_UNBOUNDED_main_38248_38271,
  selector_IN_UNBOUNDED_main_38248_38279,
  selector_IN_UNBOUNDED_main_38248_38306,
  selector_IN_UNBOUNDED_main_38248_38365,
  selector_IN_UNBOUNDED_main_38248_38366,
  selector_IN_UNBOUNDED_main_38248_38367,
  selector_IN_UNBOUNDED_main_38248_38368,
  selector_IN_UNBOUNDED_main_38248_38371,
  selector_IN_UNBOUNDED_main_38248_38375,
  selector_IN_UNBOUNDED_main_38248_38415,
  selector_IN_UNBOUNDED_main_38248_38447,
  selector_IN_UNBOUNDED_main_38248_38456,
  selector_IN_UNBOUNDED_main_38248_38481,
  selector_IN_UNBOUNDED_main_38248_38485,
  selector_IN_UNBOUNDED_main_38248_38515,
  selector_MUX_0_CLOSE_54_i0_0_0_0,
  selector_MUX_13___assert_fail_64_i0_0_0_0,
  selector_MUX_13___assert_fail_64_i0_0_0_1,
  selector_MUX_13___assert_fail_64_i0_0_1_0,
  selector_MUX_14___assert_fail_64_i0_1_0_0,
  selector_MUX_14___assert_fail_64_i0_1_0_1,
  selector_MUX_14___assert_fail_64_i0_1_1_0,
  selector_MUX_15___assert_fail_64_i0_2_0_0,
  selector_MUX_15___assert_fail_64_i0_2_0_1,
  selector_MUX_15___assert_fail_64_i0_2_1_0,
  selector_MUX_16___assert_fail_64_i0_3_0_0,
  selector_MUX_16___assert_fail_64_i0_3_0_1,
  selector_MUX_16___assert_fail_64_i0_3_1_0,
  selector_MUX_63_read_66_i0_0_0_0,
  selector_MUX_64_read_66_i0_1_0_0,
  selector_MUX_64_read_66_i0_1_0_1,
  selector_MUX_64_read_66_i0_1_1_0,
  selector_MUX_65_read_66_i0_2_0_0,
  selector_MUX_65_read_66_i0_2_0_1,
  selector_MUX_65_read_66_i0_2_1_0,
  selector_MUX_76_reg_16_0_0_0,
  selector_MUX_82_reg_21_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_main_38248_38272,
  OUT_CONDITION_main_38248_38372,
  OUT_MULTIIF_main_38248_42879,
  OUT_MULTIIF_main_38248_42886,
  OUT_UNBOUNDED_main_38248_38271,
  OUT_UNBOUNDED_main_38248_38279,
  OUT_UNBOUNDED_main_38248_38306,
  OUT_UNBOUNDED_main_38248_38365,
  OUT_UNBOUNDED_main_38248_38366,
  OUT_UNBOUNDED_main_38248_38367,
  OUT_UNBOUNDED_main_38248_38368,
  OUT_UNBOUNDED_main_38248_38371,
  OUT_UNBOUNDED_main_38248_38375,
  OUT_UNBOUNDED_main_38248_38415,
  OUT_UNBOUNDED_main_38248_38447,
  OUT_UNBOUNDED_main_38248_38456,
  OUT_UNBOUNDED_main_38248_38481,
  OUT_UNBOUNDED_main_38248_38485,
  OUT_UNBOUNDED_main_38248_38515);
  parameter MEM_var_1020_38248=1048576,
    MEM_var_38334_38248=1572864,
    MEM_var_38536_38252=7864320,
    MEM_var_39494_74=7340032,
    MEM_var_39496_38248=2097152,
    MEM_var_39498_38248=2621440,
    MEM_var_39500_38248=3145728,
    MEM_var_39502_38248=3670016,
    MEM_var_39504_38248=4194304,
    MEM_var_39506_38248=4718592,
    MEM_var_39508_38248=5242880,
    MEM_var_39510_38248=5767168,
    MEM_var_39512_38248=6291456,
    MEM_var_39514_38248=6815744,
    MEM_var_792_38248=524288,
    MEM_var_796_38248=524288,
    MEM_var_992_38248=524288;
  // IN
  input clock;
  input reset;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [45:0] S_addr_ram;
  input [63:0] S_Wdata_ram;
  input [11:0] S_data_ram_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input selector_IN_UNBOUNDED_main_38248_38271;
  input selector_IN_UNBOUNDED_main_38248_38279;
  input selector_IN_UNBOUNDED_main_38248_38306;
  input selector_IN_UNBOUNDED_main_38248_38365;
  input selector_IN_UNBOUNDED_main_38248_38366;
  input selector_IN_UNBOUNDED_main_38248_38367;
  input selector_IN_UNBOUNDED_main_38248_38368;
  input selector_IN_UNBOUNDED_main_38248_38371;
  input selector_IN_UNBOUNDED_main_38248_38375;
  input selector_IN_UNBOUNDED_main_38248_38415;
  input selector_IN_UNBOUNDED_main_38248_38447;
  input selector_IN_UNBOUNDED_main_38248_38456;
  input selector_IN_UNBOUNDED_main_38248_38481;
  input selector_IN_UNBOUNDED_main_38248_38485;
  input selector_IN_UNBOUNDED_main_38248_38515;
  input selector_MUX_0_CLOSE_54_i0_0_0_0;
  input selector_MUX_13___assert_fail_64_i0_0_0_0;
  input selector_MUX_13___assert_fail_64_i0_0_0_1;
  input selector_MUX_13___assert_fail_64_i0_0_1_0;
  input selector_MUX_14___assert_fail_64_i0_1_0_0;
  input selector_MUX_14___assert_fail_64_i0_1_0_1;
  input selector_MUX_14___assert_fail_64_i0_1_1_0;
  input selector_MUX_15___assert_fail_64_i0_2_0_0;
  input selector_MUX_15___assert_fail_64_i0_2_0_1;
  input selector_MUX_15___assert_fail_64_i0_2_1_0;
  input selector_MUX_16___assert_fail_64_i0_3_0_0;
  input selector_MUX_16___assert_fail_64_i0_3_0_1;
  input selector_MUX_16___assert_fail_64_i0_3_1_0;
  input selector_MUX_63_read_66_i0_0_0_0;
  input selector_MUX_64_read_66_i0_1_0_0;
  input selector_MUX_64_read_66_i0_1_0_1;
  input selector_MUX_64_read_66_i0_1_1_0;
  input selector_MUX_65_read_66_i0_2_0_0;
  input selector_MUX_65_read_66_i0_2_0_1;
  input selector_MUX_65_read_66_i0_2_1_0;
  input selector_MUX_76_reg_16_0_0_0;
  input selector_MUX_82_reg_21_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output signed [31:0] return_port;
  output [63:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_main_38248_38272;
  output OUT_CONDITION_main_38248_38372;
  output [1:0] OUT_MULTIIF_main_38248_42879;
  output [1:0] OUT_MULTIIF_main_38248_42886;
  output OUT_UNBOUNDED_main_38248_38271;
  output OUT_UNBOUNDED_main_38248_38279;
  output OUT_UNBOUNDED_main_38248_38306;
  output OUT_UNBOUNDED_main_38248_38365;
  output OUT_UNBOUNDED_main_38248_38366;
  output OUT_UNBOUNDED_main_38248_38367;
  output OUT_UNBOUNDED_main_38248_38368;
  output OUT_UNBOUNDED_main_38248_38371;
  output OUT_UNBOUNDED_main_38248_38375;
  output OUT_UNBOUNDED_main_38248_38415;
  output OUT_UNBOUNDED_main_38248_38447;
  output OUT_UNBOUNDED_main_38248_38456;
  output OUT_UNBOUNDED_main_38248_38481;
  output OUT_UNBOUNDED_main_38248_38485;
  output OUT_UNBOUNDED_main_38248_38515;
  // Component and signal declarations
  wire [7:0] null_out_signal_array_1020_0_out1_0;
  wire [7:0] null_out_signal_array_1020_0_out1_1;
  wire [7:0] null_out_signal_array_38334_0_out1_0;
  wire [7:0] null_out_signal_array_38334_0_out1_1;
  wire [31:0] null_out_signal_array_38334_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38334_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39496_0_out1_0;
  wire [7:0] null_out_signal_array_39496_0_out1_1;
  wire [31:0] null_out_signal_array_39496_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39496_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39498_0_out1_0;
  wire [7:0] null_out_signal_array_39498_0_out1_1;
  wire [31:0] null_out_signal_array_39498_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39498_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39500_0_out1_0;
  wire [7:0] null_out_signal_array_39500_0_out1_1;
  wire [31:0] null_out_signal_array_39500_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39500_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39502_0_out1_0;
  wire [7:0] null_out_signal_array_39502_0_out1_1;
  wire [31:0] null_out_signal_array_39502_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39502_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39504_0_out1_0;
  wire [7:0] null_out_signal_array_39504_0_out1_1;
  wire [31:0] null_out_signal_array_39504_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39504_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39506_0_out1_0;
  wire [7:0] null_out_signal_array_39506_0_out1_1;
  wire [31:0] null_out_signal_array_39506_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39506_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39508_0_out1_0;
  wire [7:0] null_out_signal_array_39508_0_out1_1;
  wire [31:0] null_out_signal_array_39508_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39508_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39510_0_out1_0;
  wire [7:0] null_out_signal_array_39510_0_out1_1;
  wire [31:0] null_out_signal_array_39510_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39510_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39512_0_out1_0;
  wire [7:0] null_out_signal_array_39512_0_out1_1;
  wire [31:0] null_out_signal_array_39512_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39512_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39514_0_out1_0;
  wire [7:0] null_out_signal_array_39514_0_out1_1;
  wire [31:0] null_out_signal_array_39514_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39514_0_proxy_out1_1;
  wire null_out_signal_array_792_0_Sout_DataRdy_0;
  wire null_out_signal_array_792_0_Sout_DataRdy_1;
  wire [31:0] null_out_signal_array_792_0_Sout_Rdata_ram_0;
  wire [31:0] null_out_signal_array_792_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_792_0_out1_0;
  wire [31:0] null_out_signal_array_792_0_out1_1;
  wire [31:0] null_out_signal_array_796_0_out1_0;
  wire [31:0] null_out_signal_array_796_0_out1_1;
  wire null_out_signal_array_992_0_Sout_DataRdy_0;
  wire null_out_signal_array_992_0_Sout_DataRdy_1;
  wire [31:0] null_out_signal_array_992_0_Sout_Rdata_ram_0;
  wire [31:0] null_out_signal_array_992_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_992_0_out1_0;
  wire [31:0] null_out_signal_array_992_0_out1_1;
  wire [31:0] out_IUdata_converter_FU_38_i0_fu_main_38248_38402;
  wire [22:0] out_IUdata_converter_FU_39_i0_fu_main_38248_38394;
  wire [31:0] out_IUdata_converter_FU_49_i0_fu_main_38248_38503;
  wire [22:0] out_IUdata_converter_FU_50_i0_fu_main_38248_38496;
  wire [31:0] out_MUX_0_CLOSE_54_i0_0_0_0;
  wire [31:0] out_MUX_13___assert_fail_64_i0_0_0_0;
  wire [31:0] out_MUX_13___assert_fail_64_i0_0_0_1;
  wire [31:0] out_MUX_13___assert_fail_64_i0_0_1_0;
  wire [31:0] out_MUX_14___assert_fail_64_i0_1_0_0;
  wire [31:0] out_MUX_14___assert_fail_64_i0_1_0_1;
  wire [31:0] out_MUX_14___assert_fail_64_i0_1_1_0;
  wire [31:0] out_MUX_15___assert_fail_64_i0_2_0_0;
  wire [31:0] out_MUX_15___assert_fail_64_i0_2_0_1;
  wire [31:0] out_MUX_15___assert_fail_64_i0_2_1_0;
  wire [31:0] out_MUX_16___assert_fail_64_i0_3_0_0;
  wire [31:0] out_MUX_16___assert_fail_64_i0_3_0_1;
  wire [31:0] out_MUX_16___assert_fail_64_i0_3_1_0;
  wire [31:0] out_MUX_63_read_66_i0_0_0_0;
  wire [31:0] out_MUX_64_read_66_i0_1_0_0;
  wire [31:0] out_MUX_64_read_66_i0_1_0_1;
  wire [31:0] out_MUX_64_read_66_i0_1_1_0;
  wire [31:0] out_MUX_65_read_66_i0_2_0_0;
  wire [31:0] out_MUX_65_read_66_i0_2_0_1;
  wire [31:0] out_MUX_65_read_66_i0_2_1_0;
  wire [31:0] out_MUX_76_reg_16_0_0_0;
  wire [31:0] out_MUX_82_reg_21_0_0_0;
  wire signed [31:0] out_OPENN_VECTOR_BOOL32_INT8_55_i0_fu_main_38248_38279;
  wire signed [31:0] out_OPENN_VECTOR_BOOL32_INT8_55_i1_fu_main_38248_38447;
  wire [31:0] out___internal_malloc_65_i0___internal_malloc_65_i0;
  wire [22:0] out_addr_expr_FU_17_i0_fu_main_38248_40244;
  wire [22:0] out_addr_expr_FU_18_i0_fu_main_38248_40257;
  wire [22:0] out_addr_expr_FU_19_i0_fu_main_38248_40260;
  wire [22:0] out_addr_expr_FU_20_i0_fu_main_38248_40263;
  wire [22:0] out_addr_expr_FU_21_i0_fu_main_38248_40279;
  wire [22:0] out_addr_expr_FU_22_i0_fu_main_38248_40288;
  wire [22:0] out_addr_expr_FU_23_i0_fu_main_38248_40291;
  wire [22:0] out_addr_expr_FU_24_i0_fu_main_38248_40294;
  wire [22:0] out_addr_expr_FU_25_i0_fu_main_38248_40270;
  wire [22:0] out_addr_expr_FU_26_i0_fu_main_38248_40273;
  wire [22:0] out_addr_expr_FU_27_i0_fu_main_38248_40276;
  wire [22:0] out_addr_expr_FU_28_i0_fu_main_38248_40235;
  wire [22:0] out_addr_expr_FU_29_i0_fu_main_38248_40238;
  wire [22:0] out_addr_expr_FU_30_i0_fu_main_38248_40241;
  wire out_const_0;
  wire [15:0] out_const_1;
  wire [22:0] out_const_10;
  wire [22:0] out_const_11;
  wire [22:0] out_const_12;
  wire [22:0] out_const_13;
  wire [22:0] out_const_14;
  wire [22:0] out_const_15;
  wire [22:0] out_const_16;
  wire [22:0] out_const_17;
  wire [22:0] out_const_18;
  wire out_const_2;
  wire [3:0] out_const_3;
  wire [6:0] out_const_4;
  wire [6:0] out_const_5;
  wire [5:0] out_const_6;
  wire [4:0] out_const_7;
  wire [22:0] out_const_8;
  wire [22:0] out_const_9;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire signed [7:0] out_conv_out_const_0_I_1_I_8;
  wire [31:0] out_conv_out_const_10_23_32;
  wire [31:0] out_conv_out_const_11_23_32;
  wire [31:0] out_conv_out_const_12_23_32;
  wire [31:0] out_conv_out_const_13_23_32;
  wire [31:0] out_conv_out_const_14_23_32;
  wire [31:0] out_conv_out_const_15_23_32;
  wire [31:0] out_conv_out_const_16_23_32;
  wire [31:0] out_conv_out_const_17_23_32;
  wire [31:0] out_conv_out_const_18_23_32;
  wire [31:0] out_conv_out_const_4_7_32;
  wire [31:0] out_conv_out_const_5_7_32;
  wire [31:0] out_conv_out_const_6_6_32;
  wire [31:0] out_conv_out_const_7_5_32;
  wire [31:0] out_conv_out_const_8_23_32;
  wire [31:0] out_conv_out_const_9_23_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32;
  wire [31:0] out_conv_out_reg_10_reg_10_23_32;
  wire [31:0] out_conv_out_reg_11_reg_11_23_32;
  wire [31:0] out_conv_out_reg_12_reg_12_23_32;
  wire [31:0] out_conv_out_reg_13_reg_13_23_32;
  wire [31:0] out_conv_out_reg_14_reg_14_23_32;
  wire [31:0] out_conv_out_reg_18_reg_18_23_32;
  wire [31:0] out_conv_out_reg_1_reg_1_23_32;
  wire [31:0] out_conv_out_reg_22_reg_22_23_32;
  wire [31:0] out_conv_out_reg_2_reg_2_23_32;
  wire [31:0] out_conv_out_reg_3_reg_3_23_32;
  wire [31:0] out_conv_out_reg_4_reg_4_23_32;
  wire [31:0] out_conv_out_reg_5_reg_5_23_32;
  wire [31:0] out_conv_out_reg_6_reg_6_23_32;
  wire [31:0] out_conv_out_reg_7_reg_7_23_32;
  wire [31:0] out_conv_out_reg_8_reg_8_23_32;
  wire [31:0] out_conv_out_reg_9_reg_9_23_32;
  wire [31:0] out_conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391_23_32;
  wire [31:0] out_conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493_23_32;
  wire out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_40254;
  wire out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_40285;
  wire out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_40592;
  wire out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_40596;
  wire signed [0:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire out_lut_expr_FU_40_i0_fu_main_38248_42882;
  wire out_lut_expr_FU_41_i0_fu_main_38248_42885;
  wire out_lut_expr_FU_51_i0_fu_main_38248_42889;
  wire out_lut_expr_FU_52_i0_fu_main_38248_42892;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i0_fu_main_38248_38405;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i1_fu_main_38248_38506;
  wire [1:0] out_multi_read_cond_FU_42_i0_fu_main_38248_42879;
  wire [1:0] out_multi_read_cond_FU_53_i0_fu_main_38248_42886;
  wire signed [31:0] out_plus_expr_FU_32_32_32_61_i0_fu_main_38248_38400;
  wire signed [31:0] out_plus_expr_FU_32_32_32_61_i1_fu_main_38248_38501;
  wire signed [31:0] out_read_66_i0_read_66_i0;
  wire out_read_cond_FU_31_i0_fu_main_38248_38272;
  wire out_read_cond_FU_33_i0_fu_main_38248_38372;
  wire [31:0] out_reg_0_reg_0;
  wire [22:0] out_reg_10_reg_10;
  wire [22:0] out_reg_11_reg_11;
  wire [22:0] out_reg_12_reg_12;
  wire [22:0] out_reg_13_reg_13;
  wire [22:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [22:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [22:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [22:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [22:0] out_reg_2_reg_2;
  wire [22:0] out_reg_3_reg_3;
  wire [22:0] out_reg_4_reg_4;
  wire [22:0] out_reg_5_reg_5;
  wire [22:0] out_reg_6_reg_6;
  wire [22:0] out_reg_7_reg_7;
  wire [22:0] out_reg_8_reg_8;
  wire [22:0] out_reg_9_reg_9;
  wire out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_40586;
  wire out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_40590;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493;
  wire [63:0] proxy_out1_1020;
  wire [63:0] proxy_out1_792;
  wire [63:0] proxy_out1_796;
  wire [63:0] proxy_out1_992;
  wire s_CLOSE_54_i00;
  wire s___assert_fail_64_i01;
  wire s___internal_malloc_65_i02;
  wire s_done_CLOSE_54_i0;
  wire s_done___assert_fail_64_i0;
  wire s_done___internal_malloc_65_i0;
  wire s_done_fu_main_38248_38279;
  wire s_done_fu_main_38248_38366;
  wire s_done_fu_main_38248_38367;
  wire s_done_fu_main_38248_38368;
  wire s_done_fu_main_38248_38447;
  wire s_done_read_66_i0;
  wire s_read_66_i03;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_1;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_2;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_3;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_4;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_5;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_1;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_2;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_3;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_4;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_5;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_1;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_2;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_3;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_4;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_5;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_2;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_3;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_4;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_5;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_1;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_2;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_3;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_4;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_5;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_0;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_1;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_10;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_11;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_12;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_13;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_14;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_2;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_3;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_4;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_5;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_6;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_7;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_8;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_9;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_0;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_1;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_10;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_11;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_12;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_13;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_14;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_2;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_3;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_4;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_5;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_6;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_7;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_8;
  wire [63:0] sig_in_bus_mergerSout_Rdata_ram6_9;
  wire [63:0] sig_in_bus_mergerproxy_in112_0;
  wire [63:0] sig_in_bus_mergerproxy_in117_0;
  wire [63:0] sig_in_bus_mergerproxy_in122_0;
  wire [63:0] sig_in_bus_mergerproxy_in17_0;
  wire [45:0] sig_in_bus_mergerproxy_in213_0;
  wire [45:0] sig_in_bus_mergerproxy_in218_0;
  wire [45:0] sig_in_bus_mergerproxy_in223_0;
  wire [45:0] sig_in_bus_mergerproxy_in28_0;
  wire [11:0] sig_in_bus_mergerproxy_in314_0;
  wire [11:0] sig_in_bus_mergerproxy_in319_0;
  wire [11:0] sig_in_bus_mergerproxy_in324_0;
  wire [11:0] sig_in_bus_mergerproxy_in39_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD10_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD15_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD20_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD25_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE11_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE16_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE21_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE26_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_1;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_2;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_3;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_4;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_5;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_1;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_2;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_3;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_4;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_5;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_1;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_2;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_3;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_4;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_5;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_2;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_3;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_4;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_5;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_1;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_2;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_3;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_4;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_5;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_0;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_1;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_10;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_11;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_12;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_13;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_14;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_2;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_3;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_4;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_5;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_6;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_7;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_8;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_9;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_0;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_1;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_10;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_11;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_12;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_13;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_14;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_2;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_3;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_4;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_5;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_6;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_7;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_8;
  wire [63:0] sig_in_vector_bus_mergerSout_Rdata_ram6_9;
  wire [63:0] sig_in_vector_bus_mergerproxy_in112_0;
  wire [63:0] sig_in_vector_bus_mergerproxy_in117_0;
  wire [63:0] sig_in_vector_bus_mergerproxy_in122_0;
  wire [63:0] sig_in_vector_bus_mergerproxy_in17_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in213_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in218_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in223_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in28_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in314_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in319_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in324_0;
  wire [11:0] sig_in_vector_bus_mergerproxy_in39_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD10_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD15_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD20_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD25_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE11_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE16_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE21_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE26_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [1:0] sig_out_bus_mergerSout_DataRdy5_;
  wire [63:0] sig_out_bus_mergerSout_Rdata_ram6_;
  wire [63:0] sig_out_bus_mergerproxy_in112_;
  wire [63:0] sig_out_bus_mergerproxy_in117_;
  wire [63:0] sig_out_bus_mergerproxy_in122_;
  wire [63:0] sig_out_bus_mergerproxy_in17_;
  wire [45:0] sig_out_bus_mergerproxy_in213_;
  wire [45:0] sig_out_bus_mergerproxy_in218_;
  wire [45:0] sig_out_bus_mergerproxy_in223_;
  wire [45:0] sig_out_bus_mergerproxy_in28_;
  wire [11:0] sig_out_bus_mergerproxy_in314_;
  wire [11:0] sig_out_bus_mergerproxy_in319_;
  wire [11:0] sig_out_bus_mergerproxy_in324_;
  wire [11:0] sig_out_bus_mergerproxy_in39_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD10_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD15_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD20_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD25_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE11_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE16_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE21_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE26_;
  wire [63:0] sig_out_vector_bus_mergerproxy_in112_;
  wire [63:0] sig_out_vector_bus_mergerproxy_in117_;
  wire [63:0] sig_out_vector_bus_mergerproxy_in122_;
  wire [63:0] sig_out_vector_bus_mergerproxy_in17_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in213_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in218_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in223_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in28_;
  wire [11:0] sig_out_vector_bus_mergerproxy_in314_;
  wire [11:0] sig_out_vector_bus_mergerproxy_in319_;
  wire [11:0] sig_out_vector_bus_mergerproxy_in324_;
  wire [11:0] sig_out_vector_bus_mergerproxy_in39_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD10_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD15_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD20_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD25_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE11_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE16_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE21_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE26_;
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_0));
  CLOSE #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) CLOSE_54_i0 (.done_port(s_done_CLOSE_54_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s_CLOSE_54_i00),
    .in1(out_MUX_0_CLOSE_54_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_CLOSE_54_i0_0_0_0 (.out1(out_MUX_0_CLOSE_54_i0_0_0_0),
    .sel(selector_MUX_0_CLOSE_54_i0_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_15_reg_15));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_13___assert_fail_64_i0_0_0_0 (.out1(out_MUX_13___assert_fail_64_i0_0_0_0),
    .sel(selector_MUX_13___assert_fail_64_i0_0_0_0),
    .in1(out_conv_out_reg_8_reg_8_23_32),
    .in2(out_conv_out_reg_5_reg_5_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_13___assert_fail_64_i0_0_0_1 (.out1(out_MUX_13___assert_fail_64_i0_0_0_1),
    .sel(selector_MUX_13___assert_fail_64_i0_0_0_1),
    .in1(out_conv_out_reg_12_reg_12_23_32),
    .in2(out_conv_out_reg_1_reg_1_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_13___assert_fail_64_i0_0_1_0 (.out1(out_MUX_13___assert_fail_64_i0_0_1_0),
    .sel(selector_MUX_13___assert_fail_64_i0_0_1_0),
    .in1(out_MUX_13___assert_fail_64_i0_0_0_0),
    .in2(out_MUX_13___assert_fail_64_i0_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_14___assert_fail_64_i0_1_0_0 (.out1(out_MUX_14___assert_fail_64_i0_1_0_0),
    .sel(selector_MUX_14___assert_fail_64_i0_1_0_0),
    .in1(out_conv_out_reg_9_reg_9_23_32),
    .in2(out_conv_out_reg_6_reg_6_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_14___assert_fail_64_i0_1_0_1 (.out1(out_MUX_14___assert_fail_64_i0_1_0_1),
    .sel(selector_MUX_14___assert_fail_64_i0_1_0_1),
    .in1(out_conv_out_reg_2_reg_2_23_32),
    .in2(out_conv_out_reg_13_reg_13_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_14___assert_fail_64_i0_1_1_0 (.out1(out_MUX_14___assert_fail_64_i0_1_1_0),
    .sel(selector_MUX_14___assert_fail_64_i0_1_1_0),
    .in1(out_MUX_14___assert_fail_64_i0_1_0_0),
    .in2(out_MUX_14___assert_fail_64_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_15___assert_fail_64_i0_2_0_0 (.out1(out_MUX_15___assert_fail_64_i0_2_0_0),
    .sel(selector_MUX_15___assert_fail_64_i0_2_0_0),
    .in1(out_conv_out_const_4_7_32),
    .in2(out_conv_out_const_5_7_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_15___assert_fail_64_i0_2_0_1 (.out1(out_MUX_15___assert_fail_64_i0_2_0_1),
    .sel(selector_MUX_15___assert_fail_64_i0_2_0_1),
    .in1(out_conv_out_const_6_6_32),
    .in2(out_conv_out_const_7_5_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_15___assert_fail_64_i0_2_1_0 (.out1(out_MUX_15___assert_fail_64_i0_2_1_0),
    .sel(selector_MUX_15___assert_fail_64_i0_2_1_0),
    .in1(out_MUX_15___assert_fail_64_i0_2_0_0),
    .in2(out_MUX_15___assert_fail_64_i0_2_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_16___assert_fail_64_i0_3_0_0 (.out1(out_MUX_16___assert_fail_64_i0_3_0_0),
    .sel(selector_MUX_16___assert_fail_64_i0_3_0_0),
    .in1(out_conv_out_reg_7_reg_7_23_32),
    .in2(out_conv_out_reg_3_reg_3_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_16___assert_fail_64_i0_3_0_1 (.out1(out_MUX_16___assert_fail_64_i0_3_0_1),
    .sel(selector_MUX_16___assert_fail_64_i0_3_0_1),
    .in1(out_conv_out_reg_14_reg_14_23_32),
    .in2(out_conv_out_reg_10_reg_10_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_16___assert_fail_64_i0_3_1_0 (.out1(out_MUX_16___assert_fail_64_i0_3_1_0),
    .sel(selector_MUX_16___assert_fail_64_i0_3_1_0),
    .in1(out_MUX_16___assert_fail_64_i0_3_0_0),
    .in2(out_MUX_16___assert_fail_64_i0_3_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_63_read_66_i0_0_0_0 (.out1(out_MUX_63_read_66_i0_0_0_0),
    .sel(selector_MUX_63_read_66_i0_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_15_reg_15));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_64_read_66_i0_1_0_0 (.out1(out_MUX_64_read_66_i0_1_0_0),
    .sel(selector_MUX_64_read_66_i0_1_0_0),
    .in1(out_conv_out_reg_22_reg_22_23_32),
    .in2(out_conv_out_reg_18_reg_18_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_64_read_66_i0_1_0_1 (.out1(out_MUX_64_read_66_i0_1_0_1),
    .sel(selector_MUX_64_read_66_i0_1_0_1),
    .in1(out_conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391_23_32),
    .in2(out_conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493_23_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_64_read_66_i0_1_1_0 (.out1(out_MUX_64_read_66_i0_1_1_0),
    .sel(selector_MUX_64_read_66_i0_1_1_0),
    .in1(out_MUX_64_read_66_i0_1_0_0),
    .in2(out_MUX_64_read_66_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_65_read_66_i0_2_0_0 (.out1(out_MUX_65_read_66_i0_2_0_0),
    .sel(selector_MUX_65_read_66_i0_2_0_0),
    .in1(out_reg_23_reg_23),
    .in2(out_reg_19_reg_19));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_65_read_66_i0_2_0_1 (.out1(out_MUX_65_read_66_i0_2_0_1),
    .sel(selector_MUX_65_read_66_i0_2_0_1),
    .in1(out_IUdata_converter_FU_38_i0_fu_main_38248_38402),
    .in2(out_IUdata_converter_FU_49_i0_fu_main_38248_38503));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_65_read_66_i0_2_1_0 (.out1(out_MUX_65_read_66_i0_2_1_0),
    .sel(selector_MUX_65_read_66_i0_2_1_0),
    .in1(out_MUX_65_read_66_i0_2_0_0),
    .in2(out_MUX_65_read_66_i0_2_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_76_reg_16_0_0_0 (.out1(out_MUX_76_reg_16_0_0_0),
    .sel(selector_MUX_76_reg_16_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in2(out_plus_expr_FU_32_32_32_61_i0_fu_main_38248_38400));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_82_reg_21_0_0_0 (.out1(out_MUX_82_reg_21_0_0_0),
    .sel(selector_MUX_82_reg_21_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in2(out_plus_expr_FU_32_32_32_61_i1_fu_main_38248_38501));
  __assert_fail #(.MEM_var_39494_74(MEM_var_39494_74)) __assert_fail_64_i0 (.done_port(s_done___assert_fail_64_i0),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_13),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_13),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_2),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_2),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_2),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_2),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_2),
    .clock(clock),
    .reset(reset),
    .start_port(s___assert_fail_64_i01),
    .__assertion(out_MUX_13___assert_fail_64_i0_0_1_0),
    .__file(out_MUX_14___assert_fail_64_i0_1_1_0),
    .__line(out_MUX_15___assert_fail_64_i0_2_1_0),
    .__function(out_MUX_16___assert_fail_64_i0_3_1_0),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .Sin_DataRdy(Sin_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  __internal_malloc #(.MEM_var_1020_38248(MEM_var_1020_38248),
    .MEM_var_792_38248(MEM_var_792_38248),
    .MEM_var_796_38248(MEM_var_796_38248),
    .MEM_var_992_38248(MEM_var_992_38248)) __internal_malloc_65_i0 (.done_port(s_done___internal_malloc_65_i0),
    .return_port(out___internal_malloc_65_i0___internal_malloc_65_i0),
    .proxy_in1_792(sig_in_vector_bus_mergerproxy_in17_0),
    .proxy_in2_792(sig_in_vector_bus_mergerproxy_in28_0),
    .proxy_in3_792(sig_in_vector_bus_mergerproxy_in39_0),
    .proxy_sel_LOAD_792(sig_in_vector_bus_mergerproxy_sel_LOAD10_0),
    .proxy_sel_STORE_792(sig_in_vector_bus_mergerproxy_sel_STORE11_0),
    .proxy_in1_796(sig_in_vector_bus_mergerproxy_in112_0),
    .proxy_in2_796(sig_in_vector_bus_mergerproxy_in213_0),
    .proxy_in3_796(sig_in_vector_bus_mergerproxy_in314_0),
    .proxy_sel_LOAD_796(sig_in_vector_bus_mergerproxy_sel_LOAD15_0),
    .proxy_sel_STORE_796(sig_in_vector_bus_mergerproxy_sel_STORE16_0),
    .proxy_in1_992(sig_in_vector_bus_mergerproxy_in117_0),
    .proxy_in2_992(sig_in_vector_bus_mergerproxy_in218_0),
    .proxy_in3_992(sig_in_vector_bus_mergerproxy_in319_0),
    .proxy_sel_LOAD_992(sig_in_vector_bus_mergerproxy_sel_LOAD20_0),
    .proxy_sel_STORE_992(sig_in_vector_bus_mergerproxy_sel_STORE21_0),
    .proxy_in1_1020(sig_in_vector_bus_mergerproxy_in122_0),
    .proxy_in2_1020(sig_in_vector_bus_mergerproxy_in223_0),
    .proxy_in3_1020(sig_in_vector_bus_mergerproxy_in324_0),
    .proxy_sel_LOAD_1020(sig_in_vector_bus_mergerproxy_sel_LOAD25_0),
    .proxy_sel_STORE_1020(sig_in_vector_bus_mergerproxy_sel_STORE26_0),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_3),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_3),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_3),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_3),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_3),
    .clock(clock),
    .reset(reset),
    .start_port(s___internal_malloc_65_i02),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .proxy_out1_796(proxy_out1_796),
    .proxy_out1_992(proxy_out1_992),
    .proxy_out1_1020(proxy_out1_1020),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_1020.mem"),
    .MEMORY_INIT_file_b("0_array_ref_1020.mem"),
    .n_elements(393216),
    .data_size(8),
    .address_space_begin(MEM_var_1020_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_1020_0 (.out1({null_out_signal_array_1020_0_out1_1,
      null_out_signal_array_1020_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_1),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_1),
    .proxy_out1(proxy_out1_1020),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in122_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in223_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in324_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD25_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE26_));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38334.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38334.mem"),
    .n_elements(5),
    .data_size(8),
    .address_space_begin(MEM_var_38334_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_38334_0 (.out1({null_out_signal_array_38334_0_out1_1,
      null_out_signal_array_38334_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_2),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_2),
    .proxy_out1({null_out_signal_array_38334_0_proxy_out1_1,
      null_out_signal_array_38334_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39496.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39496.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_39496_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39496_0 (.out1({null_out_signal_array_39496_0_out1_1,
      null_out_signal_array_39496_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_3),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_3),
    .proxy_out1({null_out_signal_array_39496_0_proxy_out1_1,
      null_out_signal_array_39496_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39498.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39498.mem"),
    .n_elements(77),
    .data_size(8),
    .address_space_begin(MEM_var_39498_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39498_0 (.out1({null_out_signal_array_39498_0_out1_1,
      null_out_signal_array_39498_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_4),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_4),
    .proxy_out1({null_out_signal_array_39498_0_proxy_out1_1,
      null_out_signal_array_39498_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39500.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39500.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_39500_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39500_0 (.out1({null_out_signal_array_39500_0_out1_1,
      null_out_signal_array_39500_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_5),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_5),
    .proxy_out1({null_out_signal_array_39500_0_proxy_out1_1,
      null_out_signal_array_39500_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39502.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39502.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_39502_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39502_0 (.out1({null_out_signal_array_39502_0_out1_1,
      null_out_signal_array_39502_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_6),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_6),
    .proxy_out1({null_out_signal_array_39502_0_proxy_out1_1,
      null_out_signal_array_39502_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39504.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39504.mem"),
    .n_elements(77),
    .data_size(8),
    .address_space_begin(MEM_var_39504_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39504_0 (.out1({null_out_signal_array_39504_0_out1_1,
      null_out_signal_array_39504_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_7),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_7),
    .proxy_out1({null_out_signal_array_39504_0_proxy_out1_1,
      null_out_signal_array_39504_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39506.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39506.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_39506_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39506_0 (.out1({null_out_signal_array_39506_0_out1_1,
      null_out_signal_array_39506_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_8),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_8),
    .proxy_out1({null_out_signal_array_39506_0_proxy_out1_1,
      null_out_signal_array_39506_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39508.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39508.mem"),
    .n_elements(77),
    .data_size(8),
    .address_space_begin(MEM_var_39508_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39508_0 (.out1({null_out_signal_array_39508_0_out1_1,
      null_out_signal_array_39508_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_9),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_9),
    .proxy_out1({null_out_signal_array_39508_0_proxy_out1_1,
      null_out_signal_array_39508_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39510.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39510.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_39510_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39510_0 (.out1({null_out_signal_array_39510_0_out1_1,
      null_out_signal_array_39510_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_10),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_10),
    .proxy_out1({null_out_signal_array_39510_0_proxy_out1_1,
      null_out_signal_array_39510_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39512.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39512.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_39512_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39512_0 (.out1({null_out_signal_array_39512_0_out1_1,
      null_out_signal_array_39512_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_11),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_11),
    .proxy_out1({null_out_signal_array_39512_0_proxy_out1_1,
      null_out_signal_array_39512_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_39514.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39514.mem"),
    .n_elements(77),
    .data_size(8),
    .address_space_begin(MEM_var_39514_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_39514_0 (.out1({null_out_signal_array_39514_0_out1_1,
      null_out_signal_array_39514_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_12),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_12),
    .proxy_out1({null_out_signal_array_39514_0_proxy_out1_1,
      null_out_signal_array_39514_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({6'b000000,
      6'b000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_792.mem"),
    .n_elements(1),
    .data_size(32),
    .address_space_begin(MEM_var_792_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(32),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_792_0 (.out1({null_out_signal_array_792_0_out1_1,
      null_out_signal_array_792_0_out1_0}),
    .Sout_Rdata_ram({null_out_signal_array_792_0_Sout_Rdata_ram_1,
      null_out_signal_array_792_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_792_0_Sout_DataRdy_1,
      null_out_signal_array_792_0_Sout_DataRdy_0}),
    .proxy_out1(proxy_out1_792),
    .clock(clock),
    .reset(reset),
    .in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .S_Wdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Sin_Rdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .S_data_ram_size({6'b000000,
      6'b000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in17_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in28_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in39_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD10_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE11_));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_796.mem"),
    .MEMORY_INIT_file_b("0_array_ref_796.mem"),
    .n_elements(1),
    .data_size(64),
    .address_space_begin(MEM_var_796_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_796_0 (.out1({null_out_signal_array_796_0_out1_1,
      null_out_signal_array_796_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_0),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_0),
    .proxy_out1(proxy_out1_796),
    .clock(clock),
    .reset(reset),
    .in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in112_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in213_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in314_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD15_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE16_));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(23),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(32),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(32),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(32),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(6),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_992.mem"),
    .n_elements(1),
    .data_size(32),
    .address_space_begin(MEM_var_992_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(32),
    .BITSIZE_proxy_in1(32),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(6),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(32),
    .PORTSIZE_proxy_out1(2)) array_992_0 (.out1({null_out_signal_array_992_0_out1_1,
      null_out_signal_array_992_0_out1_0}),
    .Sout_Rdata_ram({null_out_signal_array_992_0_Sout_Rdata_ram_1,
      null_out_signal_array_992_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_992_0_Sout_DataRdy_1,
      null_out_signal_array_992_0_Sout_DataRdy_0}),
    .proxy_out1(proxy_out1_992),
    .clock(clock),
    .reset(reset),
    .in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({6'b000000,
      6'b000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .S_Wdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Sin_Rdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .S_data_ram_size({6'b000000,
      6'b000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in117_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in218_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in319_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD20_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE21_));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(6),
    .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_5,
      sig_in_bus_mergerMout_Wdata_ram0_4,
      sig_in_bus_mergerMout_Wdata_ram0_3,
      sig_in_bus_mergerMout_Wdata_ram0_2,
      sig_in_bus_mergerMout_Wdata_ram0_1,
      sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(6),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_5,
      sig_in_bus_mergerMout_addr_ram1_4,
      sig_in_bus_mergerMout_addr_ram1_3,
      sig_in_bus_mergerMout_addr_ram1_2,
      sig_in_bus_mergerMout_addr_ram1_1,
      sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(6),
    .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_5,
      sig_in_bus_mergerMout_data_ram_size2_4,
      sig_in_bus_mergerMout_data_ram_size2_3,
      sig_in_bus_mergerMout_data_ram_size2_2,
      sig_in_bus_mergerMout_data_ram_size2_1,
      sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(6),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_5,
      sig_in_bus_mergerMout_oe_ram3_4,
      sig_in_bus_mergerMout_oe_ram3_3,
      sig_in_bus_mergerMout_oe_ram3_2,
      sig_in_bus_mergerMout_oe_ram3_1,
      sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(6),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_5,
      sig_in_bus_mergerMout_we_ram4_4,
      sig_in_bus_mergerMout_we_ram4_3,
      sig_in_bus_mergerMout_we_ram4_2,
      sig_in_bus_mergerMout_we_ram4_1,
      sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(15),
    .BITSIZE_out1(2)) bus_mergerSout_DataRdy5_ (.out1(sig_out_bus_mergerSout_DataRdy5_),
    .in1({sig_in_bus_mergerSout_DataRdy5_14,
      sig_in_bus_mergerSout_DataRdy5_13,
      sig_in_bus_mergerSout_DataRdy5_12,
      sig_in_bus_mergerSout_DataRdy5_11,
      sig_in_bus_mergerSout_DataRdy5_10,
      sig_in_bus_mergerSout_DataRdy5_9,
      sig_in_bus_mergerSout_DataRdy5_8,
      sig_in_bus_mergerSout_DataRdy5_7,
      sig_in_bus_mergerSout_DataRdy5_6,
      sig_in_bus_mergerSout_DataRdy5_5,
      sig_in_bus_mergerSout_DataRdy5_4,
      sig_in_bus_mergerSout_DataRdy5_3,
      sig_in_bus_mergerSout_DataRdy5_2,
      sig_in_bus_mergerSout_DataRdy5_1,
      sig_in_bus_mergerSout_DataRdy5_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(15),
    .BITSIZE_out1(64)) bus_mergerSout_Rdata_ram6_ (.out1(sig_out_bus_mergerSout_Rdata_ram6_),
    .in1({sig_in_bus_mergerSout_Rdata_ram6_14,
      sig_in_bus_mergerSout_Rdata_ram6_13,
      sig_in_bus_mergerSout_Rdata_ram6_12,
      sig_in_bus_mergerSout_Rdata_ram6_11,
      sig_in_bus_mergerSout_Rdata_ram6_10,
      sig_in_bus_mergerSout_Rdata_ram6_9,
      sig_in_bus_mergerSout_Rdata_ram6_8,
      sig_in_bus_mergerSout_Rdata_ram6_7,
      sig_in_bus_mergerSout_Rdata_ram6_6,
      sig_in_bus_mergerSout_Rdata_ram6_5,
      sig_in_bus_mergerSout_Rdata_ram6_4,
      sig_in_bus_mergerSout_Rdata_ram6_3,
      sig_in_bus_mergerSout_Rdata_ram6_2,
      sig_in_bus_mergerSout_Rdata_ram6_1,
      sig_in_bus_mergerSout_Rdata_ram6_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in112_ (.out1(sig_out_bus_mergerproxy_in112_),
    .in1({sig_in_bus_mergerproxy_in112_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in117_ (.out1(sig_out_bus_mergerproxy_in117_),
    .in1({sig_in_bus_mergerproxy_in117_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in122_ (.out1(sig_out_bus_mergerproxy_in122_),
    .in1({sig_in_bus_mergerproxy_in122_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerproxy_in17_ (.out1(sig_out_bus_mergerproxy_in17_),
    .in1({sig_in_bus_mergerproxy_in17_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in213_ (.out1(sig_out_bus_mergerproxy_in213_),
    .in1({sig_in_bus_mergerproxy_in213_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in218_ (.out1(sig_out_bus_mergerproxy_in218_),
    .in1({sig_in_bus_mergerproxy_in218_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in223_ (.out1(sig_out_bus_mergerproxy_in223_),
    .in1({sig_in_bus_mergerproxy_in223_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in28_ (.out1(sig_out_bus_mergerproxy_in28_),
    .in1({sig_in_bus_mergerproxy_in28_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in314_ (.out1(sig_out_bus_mergerproxy_in314_),
    .in1({sig_in_bus_mergerproxy_in314_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in319_ (.out1(sig_out_bus_mergerproxy_in319_),
    .in1({sig_in_bus_mergerproxy_in319_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in324_ (.out1(sig_out_bus_mergerproxy_in324_),
    .in1({sig_in_bus_mergerproxy_in324_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerproxy_in39_ (.out1(sig_out_bus_mergerproxy_in39_),
    .in1({sig_in_bus_mergerproxy_in39_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD10_ (.out1(sig_out_bus_mergerproxy_sel_LOAD10_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD10_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD15_ (.out1(sig_out_bus_mergerproxy_sel_LOAD15_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD15_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD20_ (.out1(sig_out_bus_mergerproxy_sel_LOAD20_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD20_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD25_ (.out1(sig_out_bus_mergerproxy_sel_LOAD25_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD25_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE11_ (.out1(sig_out_bus_mergerproxy_sel_STORE11_),
    .in1({sig_in_bus_mergerproxy_sel_STORE11_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE16_ (.out1(sig_out_bus_mergerproxy_sel_STORE16_),
    .in1({sig_in_bus_mergerproxy_sel_STORE16_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE21_ (.out1(sig_out_bus_mergerproxy_sel_STORE21_),
    .in1({sig_in_bus_mergerproxy_sel_STORE21_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE26_ (.out1(sig_out_bus_mergerproxy_sel_STORE26_),
    .in1({sig_in_bus_mergerproxy_sel_STORE26_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b0100000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39498_38248)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39500_38248)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39502_38248)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39504_38248)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39506_38248)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39508_38248)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39510_38248)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39512_38248)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39514_38248)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1000010)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1000111)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100101)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38334_38248)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39496_38248)) const_9 (.out1(out_const_9));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(8)) conv_out_const_0_I_1_I_8 (.out1(out_conv_out_const_0_I_1_I_8),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_10_23_32 (.out1(out_conv_out_const_10_23_32),
    .in1(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_11_23_32 (.out1(out_conv_out_const_11_23_32),
    .in1(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_12_23_32 (.out1(out_conv_out_const_12_23_32),
    .in1(out_const_12));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_13_23_32 (.out1(out_conv_out_const_13_23_32),
    .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_14_23_32 (.out1(out_conv_out_const_14_23_32),
    .in1(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_15_23_32 (.out1(out_conv_out_const_15_23_32),
    .in1(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_16_23_32 (.out1(out_conv_out_const_16_23_32),
    .in1(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_17_23_32 (.out1(out_conv_out_const_17_23_32),
    .in1(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_18_23_32 (.out1(out_conv_out_const_18_23_32),
    .in1(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(32)) conv_out_const_4_7_32 (.out1(out_conv_out_const_4_7_32),
    .in1(out_const_4));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(32)) conv_out_const_5_7_32 (.out1(out_conv_out_const_5_7_32),
    .in1(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(32)) conv_out_const_6_6_32 (.out1(out_conv_out_const_6_6_32),
    .in1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(32)) conv_out_const_7_5_32 (.out1(out_conv_out_const_7_5_32),
    .in1(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_8_23_32 (.out1(out_conv_out_const_8_23_32),
    .in1(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_9_23_32 (.out1(out_conv_out_const_9_23_32),
    .in1(out_const_9));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32 (.out1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_10_reg_10_23_32 (.out1(out_conv_out_reg_10_reg_10_23_32),
    .in1(out_reg_10_reg_10));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_11_reg_11_23_32 (.out1(out_conv_out_reg_11_reg_11_23_32),
    .in1(out_reg_11_reg_11));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_12_reg_12_23_32 (.out1(out_conv_out_reg_12_reg_12_23_32),
    .in1(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_13_reg_13_23_32 (.out1(out_conv_out_reg_13_reg_13_23_32),
    .in1(out_reg_13_reg_13));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_14_reg_14_23_32 (.out1(out_conv_out_reg_14_reg_14_23_32),
    .in1(out_reg_14_reg_14));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_18_reg_18_23_32 (.out1(out_conv_out_reg_18_reg_18_23_32),
    .in1(out_reg_18_reg_18));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_1_reg_1_23_32 (.out1(out_conv_out_reg_1_reg_1_23_32),
    .in1(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_22_reg_22_23_32 (.out1(out_conv_out_reg_22_reg_22_23_32),
    .in1(out_reg_22_reg_22));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_2_reg_2_23_32 (.out1(out_conv_out_reg_2_reg_2_23_32),
    .in1(out_reg_2_reg_2));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_3_reg_3_23_32 (.out1(out_conv_out_reg_3_reg_3_23_32),
    .in1(out_reg_3_reg_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_4_reg_4_23_32 (.out1(out_conv_out_reg_4_reg_4_23_32),
    .in1(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_5_reg_5_23_32 (.out1(out_conv_out_reg_5_reg_5_23_32),
    .in1(out_reg_5_reg_5));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_6_reg_6_23_32 (.out1(out_conv_out_reg_6_reg_6_23_32),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_7_reg_7_23_32 (.out1(out_conv_out_reg_7_reg_7_23_32),
    .in1(out_reg_7_reg_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_8_reg_8_23_32 (.out1(out_conv_out_reg_8_reg_8_23_32),
    .in1(out_reg_8_reg_8));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_9_reg_9_23_32 (.out1(out_conv_out_reg_9_reg_9_23_32),
    .in1(out_reg_9_reg_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391_23_32 (.out1(out_conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391_23_32),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493_23_32 (.out1(out_conv_out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493_23_32),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_38248_38272 (.out1(out_read_cond_FU_31_i0_fu_main_38248_38272),
    .in1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_40586));
  OPENN_VECTOR_BOOL32_INT8 #(.BITSIZE_out1(32),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_Min_addr_ram(23),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(23),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_in1(32),
    .BITSIZE_in2(8)) fu_main_38248_38279 (.done_port(s_done_fu_main_38248_38279),
    .out1(out_OPENN_VECTOR_BOOL32_INT8_55_i0_fu_main_38248_38279),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED_main_38248_38279),
    .in1(out_conv_out_reg_4_reg_4_23_32),
    .in2(out_conv_out_const_0_I_1_I_8),
    .sel_open(1'b0),
    .sel___builtin_open(1'b0),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  __builtin_bambu_time_start fu_main_38248_38366 (.done_port(s_done_fu_main_38248_38366),
    .clock(clock),
    .start_port(selector_IN_UNBOUNDED_main_38248_38366));
  run_benchmark #(.MEM_var_38536_38252(MEM_var_38536_38252)) fu_main_38248_38367 (.done_port(s_done_fu_main_38248_38367),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_14),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_14),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_5),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_5),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_5),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_5),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_5),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED_main_38248_38367),
    .vargs(out_reg_0_reg_0),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .Sin_DataRdy(Sin_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  __builtin_bambu_time_stop fu_main_38248_38368 (.done_port(s_done_fu_main_38248_38368),
    .clock(clock),
    .start_port(selector_IN_UNBOUNDED_main_38248_38368));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_38248_38372 (.out1(out_read_cond_FU_33_i0_fu_main_38248_38372),
    .in1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_40590));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_main_38248_38391 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391),
    .in1(out_reg_0_reg_0),
    .in2(out_IUdata_converter_FU_39_i0_fu_main_38248_38394));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_38394 (.out1(out_IUdata_converter_FU_39_i0_fu_main_38248_38394),
    .in1(out_reg_16_reg_16));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_38248_38400 (.out1(out_plus_expr_FU_32_32_32_61_i0_fu_main_38248_38400),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_16_reg_16));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_38248_38402 (.out1(out_IUdata_converter_FU_38_i0_fu_main_38248_38402),
    .in1(out_minus_expr_FU_0_32_32_60_i0_fu_main_38248_38405));
  minus_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_38248_38405 (.out1(out_minus_expr_FU_0_32_32_60_i0_fu_main_38248_38405),
    .in1(out_const_1),
    .in2(out_reg_16_reg_16));
  OPENN_VECTOR_BOOL32_INT8 #(.BITSIZE_out1(32),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_Min_addr_ram(23),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(23),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_in1(32),
    .BITSIZE_in2(8)) fu_main_38248_38447 (.done_port(s_done_fu_main_38248_38447),
    .out1(out_OPENN_VECTOR_BOOL32_INT8_55_i1_fu_main_38248_38447),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_1),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_1),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_1),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_1),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_1),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED_main_38248_38447),
    .in1(out_conv_out_reg_11_reg_11_23_32),
    .in2(out_conv_out_const_0_I_1_I_8),
    .sel_open(1'b0),
    .sel___builtin_open(1'b0),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_main_38248_38493 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493),
    .in1(out_reg_0_reg_0),
    .in2(out_IUdata_converter_FU_50_i0_fu_main_38248_38496));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_38496 (.out1(out_IUdata_converter_FU_50_i0_fu_main_38248_38496),
    .in1(out_reg_21_reg_21));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_38248_38501 (.out1(out_plus_expr_FU_32_32_32_61_i1_fu_main_38248_38501),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_21_reg_21));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_38248_38503 (.out1(out_IUdata_converter_FU_49_i0_fu_main_38248_38503),
    .in1(out_minus_expr_FU_0_32_32_60_i1_fu_main_38248_38506));
  minus_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_38248_38506 (.out1(out_minus_expr_FU_0_32_32_60_i1_fu_main_38248_38506),
    .in1(out_const_1),
    .in2(out_reg_21_reg_21));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40235 (.out1(out_addr_expr_FU_28_i0_fu_main_38248_40235),
    .in1(out_conv_out_const_9_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40238 (.out1(out_addr_expr_FU_29_i0_fu_main_38248_40238),
    .in1(out_conv_out_const_10_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40241 (.out1(out_addr_expr_FU_30_i0_fu_main_38248_40241),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40244 (.out1(out_addr_expr_FU_17_i0_fu_main_38248_40244),
    .in1(out_conv_out_const_11_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_40254 (.out1(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_40254),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40257 (.out1(out_addr_expr_FU_18_i0_fu_main_38248_40257),
    .in1(out_conv_out_const_12_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40260 (.out1(out_addr_expr_FU_19_i0_fu_main_38248_40260),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40263 (.out1(out_addr_expr_FU_20_i0_fu_main_38248_40263),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40270 (.out1(out_addr_expr_FU_25_i0_fu_main_38248_40270),
    .in1(out_conv_out_const_14_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40273 (.out1(out_addr_expr_FU_26_i0_fu_main_38248_40273),
    .in1(out_conv_out_const_15_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40276 (.out1(out_addr_expr_FU_27_i0_fu_main_38248_40276),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40279 (.out1(out_addr_expr_FU_21_i0_fu_main_38248_40279),
    .in1(out_conv_out_const_16_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_40285 (.out1(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_40285),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40288 (.out1(out_addr_expr_FU_22_i0_fu_main_38248_40288),
    .in1(out_conv_out_const_17_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40291 (.out1(out_addr_expr_FU_23_i0_fu_main_38248_40291),
    .in1(out_conv_out_const_18_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_40294 (.out1(out_addr_expr_FU_24_i0_fu_main_38248_40294),
    .in1(out_conv_out_const_8_23_32));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_40586 (.out1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_40586),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_40590 (.out1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_40590),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  gt_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_40592 (.out1(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_40592),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i0_fu_main_38248_38400));
  gt_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_40596 (.out1(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_40596),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i1_fu_main_38248_38501));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_42879 (.out1(out_multi_read_cond_FU_42_i0_fu_main_38248_42879),
    .in1({out_lut_expr_FU_41_i0_fu_main_38248_42885,
      out_lut_expr_FU_40_i0_fu_main_38248_42882}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_42882 (.out1(out_lut_expr_FU_40_i0_fu_main_38248_42882),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_40254),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_42885 (.out1(out_lut_expr_FU_41_i0_fu_main_38248_42885),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_40254),
    .in3(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_40592),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_42886 (.out1(out_multi_read_cond_FU_53_i0_fu_main_38248_42886),
    .in1({out_lut_expr_FU_52_i0_fu_main_38248_42892,
      out_lut_expr_FU_51_i0_fu_main_38248_42889}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_42889 (.out1(out_lut_expr_FU_51_i0_fu_main_38248_42889),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_40285),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_42892 (.out1(out_lut_expr_FU_52_i0_fu_main_38248_42892),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_40285),
    .in3(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_40596),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_1 (.out1(sig_in_bus_mergerMout_Wdata_ram0_1),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_1));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_2 (.out1(sig_in_bus_mergerMout_Wdata_ram0_2),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_2));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_3 (.out1(sig_in_bus_mergerMout_Wdata_ram0_3),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_3));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_4 (.out1(sig_in_bus_mergerMout_Wdata_ram0_4),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_4));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_5 (.out1(sig_in_bus_mergerMout_Wdata_ram0_5),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_5));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_1 (.out1(sig_in_bus_mergerMout_addr_ram1_1),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_1));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_2 (.out1(sig_in_bus_mergerMout_addr_ram1_2),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_2));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_3 (.out1(sig_in_bus_mergerMout_addr_ram1_3),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_3));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_4 (.out1(sig_in_bus_mergerMout_addr_ram1_4),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_4));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_5 (.out1(sig_in_bus_mergerMout_addr_ram1_5),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_5));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_1 (.out1(sig_in_bus_mergerMout_data_ram_size2_1),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_1));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_2 (.out1(sig_in_bus_mergerMout_data_ram_size2_2),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_2));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_3 (.out1(sig_in_bus_mergerMout_data_ram_size2_3),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_3));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_4 (.out1(sig_in_bus_mergerMout_data_ram_size2_4),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_4));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_5 (.out1(sig_in_bus_mergerMout_data_ram_size2_5),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_5));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_1 (.out1(sig_in_bus_mergerMout_oe_ram3_1),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_2 (.out1(sig_in_bus_mergerMout_oe_ram3_2),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_3 (.out1(sig_in_bus_mergerMout_oe_ram3_3),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_3));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_4 (.out1(sig_in_bus_mergerMout_oe_ram3_4),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_4));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_5 (.out1(sig_in_bus_mergerMout_oe_ram3_5),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_5));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_1 (.out1(sig_in_bus_mergerMout_we_ram4_1),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_2 (.out1(sig_in_bus_mergerMout_we_ram4_2),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_3 (.out1(sig_in_bus_mergerMout_we_ram4_3),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_3));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_4 (.out1(sig_in_bus_mergerMout_we_ram4_4),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_4));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_5 (.out1(sig_in_bus_mergerMout_we_ram4_5),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_5));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_0 (.out1(sig_in_bus_mergerSout_DataRdy5_0),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_1 (.out1(sig_in_bus_mergerSout_DataRdy5_1),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_10 (.out1(sig_in_bus_mergerSout_DataRdy5_10),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_10));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_11 (.out1(sig_in_bus_mergerSout_DataRdy5_11),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_11));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_12 (.out1(sig_in_bus_mergerSout_DataRdy5_12),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_12));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_13 (.out1(sig_in_bus_mergerSout_DataRdy5_13),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_13));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_14 (.out1(sig_in_bus_mergerSout_DataRdy5_14),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_14));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_2 (.out1(sig_in_bus_mergerSout_DataRdy5_2),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_3 (.out1(sig_in_bus_mergerSout_DataRdy5_3),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_3));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_4 (.out1(sig_in_bus_mergerSout_DataRdy5_4),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_4));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_5 (.out1(sig_in_bus_mergerSout_DataRdy5_5),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_5));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_6 (.out1(sig_in_bus_mergerSout_DataRdy5_6),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_6));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_7 (.out1(sig_in_bus_mergerSout_DataRdy5_7),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_7));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_8 (.out1(sig_in_bus_mergerSout_DataRdy5_8),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_8));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_9 (.out1(sig_in_bus_mergerSout_DataRdy5_9),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_9));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_0 (.out1(sig_in_bus_mergerSout_Rdata_ram6_0),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_1 (.out1(sig_in_bus_mergerSout_Rdata_ram6_1),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_1));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_10 (.out1(sig_in_bus_mergerSout_Rdata_ram6_10),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_10));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_11 (.out1(sig_in_bus_mergerSout_Rdata_ram6_11),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_11));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_12 (.out1(sig_in_bus_mergerSout_Rdata_ram6_12),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_12));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_13 (.out1(sig_in_bus_mergerSout_Rdata_ram6_13),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_13));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_14 (.out1(sig_in_bus_mergerSout_Rdata_ram6_14),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_14));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_2 (.out1(sig_in_bus_mergerSout_Rdata_ram6_2),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_2));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_3 (.out1(sig_in_bus_mergerSout_Rdata_ram6_3),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_3));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_4 (.out1(sig_in_bus_mergerSout_Rdata_ram6_4),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_4));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_5 (.out1(sig_in_bus_mergerSout_Rdata_ram6_5),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_5));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_6 (.out1(sig_in_bus_mergerSout_Rdata_ram6_6),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_6));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_7 (.out1(sig_in_bus_mergerSout_Rdata_ram6_7),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_7));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_8 (.out1(sig_in_bus_mergerSout_Rdata_ram6_8),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_8));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerSout_Rdata_ram6_9 (.out1(sig_in_bus_mergerSout_Rdata_ram6_9),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_9));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in112_0 (.out1(sig_in_bus_mergerproxy_in112_0),
    .in1(sig_in_vector_bus_mergerproxy_in112_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in117_0 (.out1(sig_in_bus_mergerproxy_in117_0),
    .in1(sig_in_vector_bus_mergerproxy_in117_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in122_0 (.out1(sig_in_bus_mergerproxy_in122_0),
    .in1(sig_in_vector_bus_mergerproxy_in122_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerproxy_in17_0 (.out1(sig_in_bus_mergerproxy_in17_0),
    .in1(sig_in_vector_bus_mergerproxy_in17_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in213_0 (.out1(sig_in_bus_mergerproxy_in213_0),
    .in1(sig_in_vector_bus_mergerproxy_in213_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in218_0 (.out1(sig_in_bus_mergerproxy_in218_0),
    .in1(sig_in_vector_bus_mergerproxy_in218_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in223_0 (.out1(sig_in_bus_mergerproxy_in223_0),
    .in1(sig_in_vector_bus_mergerproxy_in223_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in28_0 (.out1(sig_in_bus_mergerproxy_in28_0),
    .in1(sig_in_vector_bus_mergerproxy_in28_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in314_0 (.out1(sig_in_bus_mergerproxy_in314_0),
    .in1(sig_in_vector_bus_mergerproxy_in314_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in319_0 (.out1(sig_in_bus_mergerproxy_in319_0),
    .in1(sig_in_vector_bus_mergerproxy_in319_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in324_0 (.out1(sig_in_bus_mergerproxy_in324_0),
    .in1(sig_in_vector_bus_mergerproxy_in324_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerproxy_in39_0 (.out1(sig_in_bus_mergerproxy_in39_0),
    .in1(sig_in_vector_bus_mergerproxy_in39_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD10_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD10_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD10_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD15_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD15_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD15_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD20_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD20_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD20_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD25_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD25_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD25_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE11_0 (.out1(sig_in_bus_mergerproxy_sel_STORE11_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE11_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE16_0 (.out1(sig_in_bus_mergerproxy_sel_STORE16_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE16_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE21_0 (.out1(sig_in_bus_mergerproxy_sel_STORE21_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE21_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE26_0 (.out1(sig_in_bus_mergerproxy_sel_STORE26_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE26_0));
  or or_or_CLOSE_54_i00( s_CLOSE_54_i00, selector_IN_UNBOUNDED_main_38248_38365, selector_IN_UNBOUNDED_main_38248_38481);
  or or_or___assert_fail_64_i01( s___assert_fail_64_i01, selector_IN_UNBOUNDED_main_38248_38306, selector_IN_UNBOUNDED_main_38248_38415, selector_IN_UNBOUNDED_main_38248_38456, selector_IN_UNBOUNDED_main_38248_38515);
  or or_or___internal_malloc_65_i02( s___internal_malloc_65_i02, selector_IN_UNBOUNDED_main_38248_38271, selector_IN_UNBOUNDED_main_38248_38371);
  or or_or_read_66_i03( s_read_66_i03, selector_IN_UNBOUNDED_main_38248_38375, selector_IN_UNBOUNDED_main_38248_38485);
  read read_66_i0 (.done_port(s_done_read_66_i0),
    .return_port(out_read_66_i0_read_66_i0),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_4),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_4),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_4),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_4),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_4),
    .clock(clock),
    .reset(reset),
    .start_port(s_read_66_i03),
    .fd(out_MUX_63_read_66_i0_0_0_0),
    .\buf (out_MUX_64_read_66_i0_1_1_0),
    .count(out_MUX_65_read_66_i0_2_1_0),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out___internal_malloc_65_i0___internal_malloc_65_i0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_28_i0_fu_main_38248_40235),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_27_i0_fu_main_38248_40276),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu_main_38248_40279),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu_main_38248_40288),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu_main_38248_40291),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_24_i0_fu_main_38248_40294),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_OPENN_VECTOR_BOOL32_INT8_55_i0_fu_main_38248_38279),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_76_reg_16_0_0_0),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_read_66_i0_read_66_i0),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_38_i0_fu_main_38248_38402),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_29_i0_fu_main_38248_40238),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_OPENN_VECTOR_BOOL32_INT8_55_i1_fu_main_38248_38447),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_82_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_49_i0_fu_main_38248_38503),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_30_i0_fu_main_38248_40241),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_17_i0_fu_main_38248_40244),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_18_i0_fu_main_38248_40257),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_19_i0_fu_main_38248_40260),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu_main_38248_40263),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_25_i0_fu_main_38248_40270),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_26_i0_fu_main_38248_40273),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_DataRdy5_ (.out1(Sout_DataRdy),
    .in1(sig_out_bus_mergerSout_DataRdy5_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_Rdata_ram6_ (.out1(Sout_Rdata_ram),
    .in1(sig_out_bus_mergerSout_Rdata_ram6_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in112_ (.out1(sig_out_vector_bus_mergerproxy_in112_),
    .in1(sig_out_bus_mergerproxy_in112_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in117_ (.out1(sig_out_vector_bus_mergerproxy_in117_),
    .in1(sig_out_bus_mergerproxy_in117_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in122_ (.out1(sig_out_vector_bus_mergerproxy_in122_),
    .in1(sig_out_bus_mergerproxy_in122_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in17_ (.out1(sig_out_vector_bus_mergerproxy_in17_),
    .in1(sig_out_bus_mergerproxy_in17_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in213_ (.out1(sig_out_vector_bus_mergerproxy_in213_),
    .in1(sig_out_bus_mergerproxy_in213_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in218_ (.out1(sig_out_vector_bus_mergerproxy_in218_),
    .in1(sig_out_bus_mergerproxy_in218_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in223_ (.out1(sig_out_vector_bus_mergerproxy_in223_),
    .in1(sig_out_bus_mergerproxy_in223_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in28_ (.out1(sig_out_vector_bus_mergerproxy_in28_),
    .in1(sig_out_bus_mergerproxy_in28_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in314_ (.out1(sig_out_vector_bus_mergerproxy_in314_),
    .in1(sig_out_bus_mergerproxy_in314_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in319_ (.out1(sig_out_vector_bus_mergerproxy_in319_),
    .in1(sig_out_bus_mergerproxy_in319_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in324_ (.out1(sig_out_vector_bus_mergerproxy_in324_),
    .in1(sig_out_bus_mergerproxy_in324_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in39_ (.out1(sig_out_vector_bus_mergerproxy_in39_),
    .in1(sig_out_bus_mergerproxy_in39_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD10_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD10_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD10_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD15_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD15_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD15_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD20_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD20_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD20_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD25_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD25_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD25_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE11_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE11_),
    .in1(sig_out_bus_mergerproxy_sel_STORE11_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE16_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE16_),
    .in1(sig_out_bus_mergerproxy_sel_STORE16_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE21_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE21_),
    .in1(sig_out_bus_mergerproxy_sel_STORE21_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE26_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE26_),
    .in1(sig_out_bus_mergerproxy_sel_STORE26_));
  // io-signal post fix
  assign return_port = out_conv_out_const_0_I_1_I_32;
  assign OUT_CONDITION_main_38248_38272 = out_read_cond_FU_31_i0_fu_main_38248_38272;
  assign OUT_CONDITION_main_38248_38372 = out_read_cond_FU_33_i0_fu_main_38248_38372;
  assign OUT_MULTIIF_main_38248_42879 = out_multi_read_cond_FU_42_i0_fu_main_38248_42879;
  assign OUT_MULTIIF_main_38248_42886 = out_multi_read_cond_FU_53_i0_fu_main_38248_42886;
  assign OUT_UNBOUNDED_main_38248_38271 = s_done___internal_malloc_65_i0;
  assign OUT_UNBOUNDED_main_38248_38279 = s_done_fu_main_38248_38279;
  assign OUT_UNBOUNDED_main_38248_38306 = s_done___assert_fail_64_i0;
  assign OUT_UNBOUNDED_main_38248_38365 = s_done_CLOSE_54_i0;
  assign OUT_UNBOUNDED_main_38248_38366 = s_done_fu_main_38248_38366;
  assign OUT_UNBOUNDED_main_38248_38367 = s_done_fu_main_38248_38367;
  assign OUT_UNBOUNDED_main_38248_38368 = s_done_fu_main_38248_38368;
  assign OUT_UNBOUNDED_main_38248_38371 = s_done___internal_malloc_65_i0;
  assign OUT_UNBOUNDED_main_38248_38375 = s_done_read_66_i0;
  assign OUT_UNBOUNDED_main_38248_38415 = s_done___assert_fail_64_i0;
  assign OUT_UNBOUNDED_main_38248_38447 = s_done_fu_main_38248_38447;
  assign OUT_UNBOUNDED_main_38248_38456 = s_done___assert_fail_64_i0;
  assign OUT_UNBOUNDED_main_38248_38481 = s_done_CLOSE_54_i0;
  assign OUT_UNBOUNDED_main_38248_38485 = s_done_read_66_i0;
  assign OUT_UNBOUNDED_main_38248_38515 = s_done___assert_fail_64_i0;

endmodule

// FSM based controller description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_main(done_port,
  selector_IN_UNBOUNDED_main_38248_38271,
  selector_IN_UNBOUNDED_main_38248_38279,
  selector_IN_UNBOUNDED_main_38248_38306,
  selector_IN_UNBOUNDED_main_38248_38365,
  selector_IN_UNBOUNDED_main_38248_38366,
  selector_IN_UNBOUNDED_main_38248_38367,
  selector_IN_UNBOUNDED_main_38248_38368,
  selector_IN_UNBOUNDED_main_38248_38371,
  selector_IN_UNBOUNDED_main_38248_38375,
  selector_IN_UNBOUNDED_main_38248_38415,
  selector_IN_UNBOUNDED_main_38248_38447,
  selector_IN_UNBOUNDED_main_38248_38456,
  selector_IN_UNBOUNDED_main_38248_38481,
  selector_IN_UNBOUNDED_main_38248_38485,
  selector_IN_UNBOUNDED_main_38248_38515,
  selector_MUX_0_CLOSE_54_i0_0_0_0,
  selector_MUX_13___assert_fail_64_i0_0_0_0,
  selector_MUX_13___assert_fail_64_i0_0_0_1,
  selector_MUX_13___assert_fail_64_i0_0_1_0,
  selector_MUX_14___assert_fail_64_i0_1_0_0,
  selector_MUX_14___assert_fail_64_i0_1_0_1,
  selector_MUX_14___assert_fail_64_i0_1_1_0,
  selector_MUX_15___assert_fail_64_i0_2_0_0,
  selector_MUX_15___assert_fail_64_i0_2_0_1,
  selector_MUX_15___assert_fail_64_i0_2_1_0,
  selector_MUX_16___assert_fail_64_i0_3_0_0,
  selector_MUX_16___assert_fail_64_i0_3_0_1,
  selector_MUX_16___assert_fail_64_i0_3_1_0,
  selector_MUX_63_read_66_i0_0_0_0,
  selector_MUX_64_read_66_i0_1_0_0,
  selector_MUX_64_read_66_i0_1_0_1,
  selector_MUX_64_read_66_i0_1_1_0,
  selector_MUX_65_read_66_i0_2_0_0,
  selector_MUX_65_read_66_i0_2_0_1,
  selector_MUX_65_read_66_i0_2_1_0,
  selector_MUX_76_reg_16_0_0_0,
  selector_MUX_82_reg_21_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_main_38248_38272,
  OUT_CONDITION_main_38248_38372,
  OUT_MULTIIF_main_38248_42879,
  OUT_MULTIIF_main_38248_42886,
  OUT_UNBOUNDED_main_38248_38271,
  OUT_UNBOUNDED_main_38248_38279,
  OUT_UNBOUNDED_main_38248_38306,
  OUT_UNBOUNDED_main_38248_38365,
  OUT_UNBOUNDED_main_38248_38366,
  OUT_UNBOUNDED_main_38248_38367,
  OUT_UNBOUNDED_main_38248_38368,
  OUT_UNBOUNDED_main_38248_38371,
  OUT_UNBOUNDED_main_38248_38375,
  OUT_UNBOUNDED_main_38248_38415,
  OUT_UNBOUNDED_main_38248_38447,
  OUT_UNBOUNDED_main_38248_38456,
  OUT_UNBOUNDED_main_38248_38481,
  OUT_UNBOUNDED_main_38248_38485,
  OUT_UNBOUNDED_main_38248_38515,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_main_38248_38272;
  input OUT_CONDITION_main_38248_38372;
  input [1:0] OUT_MULTIIF_main_38248_42879;
  input [1:0] OUT_MULTIIF_main_38248_42886;
  input OUT_UNBOUNDED_main_38248_38271;
  input OUT_UNBOUNDED_main_38248_38279;
  input OUT_UNBOUNDED_main_38248_38306;
  input OUT_UNBOUNDED_main_38248_38365;
  input OUT_UNBOUNDED_main_38248_38366;
  input OUT_UNBOUNDED_main_38248_38367;
  input OUT_UNBOUNDED_main_38248_38368;
  input OUT_UNBOUNDED_main_38248_38371;
  input OUT_UNBOUNDED_main_38248_38375;
  input OUT_UNBOUNDED_main_38248_38415;
  input OUT_UNBOUNDED_main_38248_38447;
  input OUT_UNBOUNDED_main_38248_38456;
  input OUT_UNBOUNDED_main_38248_38481;
  input OUT_UNBOUNDED_main_38248_38485;
  input OUT_UNBOUNDED_main_38248_38515;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_IN_UNBOUNDED_main_38248_38271;
  output selector_IN_UNBOUNDED_main_38248_38279;
  output selector_IN_UNBOUNDED_main_38248_38306;
  output selector_IN_UNBOUNDED_main_38248_38365;
  output selector_IN_UNBOUNDED_main_38248_38366;
  output selector_IN_UNBOUNDED_main_38248_38367;
  output selector_IN_UNBOUNDED_main_38248_38368;
  output selector_IN_UNBOUNDED_main_38248_38371;
  output selector_IN_UNBOUNDED_main_38248_38375;
  output selector_IN_UNBOUNDED_main_38248_38415;
  output selector_IN_UNBOUNDED_main_38248_38447;
  output selector_IN_UNBOUNDED_main_38248_38456;
  output selector_IN_UNBOUNDED_main_38248_38481;
  output selector_IN_UNBOUNDED_main_38248_38485;
  output selector_IN_UNBOUNDED_main_38248_38515;
  output selector_MUX_0_CLOSE_54_i0_0_0_0;
  output selector_MUX_13___assert_fail_64_i0_0_0_0;
  output selector_MUX_13___assert_fail_64_i0_0_0_1;
  output selector_MUX_13___assert_fail_64_i0_0_1_0;
  output selector_MUX_14___assert_fail_64_i0_1_0_0;
  output selector_MUX_14___assert_fail_64_i0_1_0_1;
  output selector_MUX_14___assert_fail_64_i0_1_1_0;
  output selector_MUX_15___assert_fail_64_i0_2_0_0;
  output selector_MUX_15___assert_fail_64_i0_2_0_1;
  output selector_MUX_15___assert_fail_64_i0_2_1_0;
  output selector_MUX_16___assert_fail_64_i0_3_0_0;
  output selector_MUX_16___assert_fail_64_i0_3_0_1;
  output selector_MUX_16___assert_fail_64_i0_3_1_0;
  output selector_MUX_63_read_66_i0_0_0_0;
  output selector_MUX_64_read_66_i0_1_0_0;
  output selector_MUX_64_read_66_i0_1_0_1;
  output selector_MUX_64_read_66_i0_1_1_0;
  output selector_MUX_65_read_66_i0_2_0_0;
  output selector_MUX_65_read_66_i0_2_0_1;
  output selector_MUX_65_read_66_i0_2_1_0;
  output selector_MUX_76_reg_16_0_0_0;
  output selector_MUX_82_reg_21_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [27:0] S_0 = 28'b0000000000000000000000000001,
    S_1 = 28'b0000000000000000000000000010,
    S_2 = 28'b0000000000000000000000000100,
    S_3 = 28'b0000000000000000000000001000,
    S_4 = 28'b0000000000000000000000010000,
    S_5 = 28'b0000000000000000000000100000,
    S_6 = 28'b0000000000000000000001000000,
    S_13 = 28'b0000000000000010000000000000,
    S_14 = 28'b0000000000000100000000000000,
    S_15 = 28'b0000000000001000000000000000,
    S_7 = 28'b0000000000000000000010000000,
    S_8 = 28'b0000000000000000000100000000,
    S_9 = 28'b0000000000000000001000000000,
    S_10 = 28'b0000000000000000010000000000,
    S_11 = 28'b0000000000000000100000000000,
    S_12 = 28'b0000000000000001000000000000,
    S_18 = 28'b0000000001000000000000000000,
    S_19 = 28'b0000000010000000000000000000,
    S_20 = 28'b0000000100000000000000000000,
    S_21 = 28'b0000001000000000000000000000,
    S_23 = 28'b0000100000000000000000000000,
    S_24 = 28'b0001000000000000000000000000,
    S_25 = 28'b0010000000000000000000000000,
    S_22 = 28'b0000010000000000000000000000,
    S_26 = 28'b0100000000000000000000000000,
    S_27 = 28'b1000000000000000000000000000,
    S_16 = 28'b0000000000010000000000000000,
    S_17 = 28'b0000000000100000000000000000;
  reg [27:0] _present_state=S_0, _next_state;
  reg done_port;
  reg selector_IN_UNBOUNDED_main_38248_38271;
  reg selector_IN_UNBOUNDED_main_38248_38279;
  reg selector_IN_UNBOUNDED_main_38248_38306;
  reg selector_IN_UNBOUNDED_main_38248_38365;
  reg selector_IN_UNBOUNDED_main_38248_38366;
  reg selector_IN_UNBOUNDED_main_38248_38367;
  reg selector_IN_UNBOUNDED_main_38248_38368;
  reg selector_IN_UNBOUNDED_main_38248_38371;
  reg selector_IN_UNBOUNDED_main_38248_38375;
  reg selector_IN_UNBOUNDED_main_38248_38415;
  reg selector_IN_UNBOUNDED_main_38248_38447;
  reg selector_IN_UNBOUNDED_main_38248_38456;
  reg selector_IN_UNBOUNDED_main_38248_38481;
  reg selector_IN_UNBOUNDED_main_38248_38485;
  reg selector_IN_UNBOUNDED_main_38248_38515;
  reg selector_MUX_0_CLOSE_54_i0_0_0_0;
  reg selector_MUX_13___assert_fail_64_i0_0_0_0;
  reg selector_MUX_13___assert_fail_64_i0_0_0_1;
  reg selector_MUX_13___assert_fail_64_i0_0_1_0;
  reg selector_MUX_14___assert_fail_64_i0_1_0_0;
  reg selector_MUX_14___assert_fail_64_i0_1_0_1;
  reg selector_MUX_14___assert_fail_64_i0_1_1_0;
  reg selector_MUX_15___assert_fail_64_i0_2_0_0;
  reg selector_MUX_15___assert_fail_64_i0_2_0_1;
  reg selector_MUX_15___assert_fail_64_i0_2_1_0;
  reg selector_MUX_16___assert_fail_64_i0_3_0_0;
  reg selector_MUX_16___assert_fail_64_i0_3_0_1;
  reg selector_MUX_16___assert_fail_64_i0_3_1_0;
  reg selector_MUX_63_read_66_i0_0_0_0;
  reg selector_MUX_64_read_66_i0_1_0_0;
  reg selector_MUX_64_read_66_i0_1_0_1;
  reg selector_MUX_64_read_66_i0_1_1_0;
  reg selector_MUX_65_read_66_i0_2_0_0;
  reg selector_MUX_65_read_66_i0_2_0_1;
  reg selector_MUX_65_read_66_i0_2_1_0;
  reg selector_MUX_76_reg_16_0_0_0;
  reg selector_MUX_82_reg_21_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38271 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38279 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38306 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38365 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38366 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38367 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38368 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38371 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38375 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38415 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38447 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38456 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38481 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38485 = 1'b0;
    selector_IN_UNBOUNDED_main_38248_38515 = 1'b0;
    selector_MUX_0_CLOSE_54_i0_0_0_0 = 1'b0;
    selector_MUX_13___assert_fail_64_i0_0_0_0 = 1'b0;
    selector_MUX_13___assert_fail_64_i0_0_0_1 = 1'b0;
    selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b0;
    selector_MUX_14___assert_fail_64_i0_1_0_0 = 1'b0;
    selector_MUX_14___assert_fail_64_i0_1_0_1 = 1'b0;
    selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b0;
    selector_MUX_15___assert_fail_64_i0_2_0_0 = 1'b0;
    selector_MUX_15___assert_fail_64_i0_2_0_1 = 1'b0;
    selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b0;
    selector_MUX_16___assert_fail_64_i0_3_0_0 = 1'b0;
    selector_MUX_16___assert_fail_64_i0_3_0_1 = 1'b0;
    selector_MUX_16___assert_fail_64_i0_3_1_0 = 1'b0;
    selector_MUX_63_read_66_i0_0_0_0 = 1'b0;
    selector_MUX_64_read_66_i0_1_0_0 = 1'b0;
    selector_MUX_64_read_66_i0_1_0_1 = 1'b0;
    selector_MUX_64_read_66_i0_1_1_0 = 1'b0;
    selector_MUX_65_read_66_i0_2_0_0 = 1'b0;
    selector_MUX_65_read_66_i0_2_0_1 = 1'b0;
    selector_MUX_65_read_66_i0_2_1_0 = 1'b0;
    selector_MUX_76_reg_16_0_0_0 = 1'b0;
    selector_MUX_82_reg_21_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_IN_UNBOUNDED_main_38248_38271 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_38248_38271;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38271 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_2;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_0 = OUT_UNBOUNDED_main_38248_38271;
          if (OUT_UNBOUNDED_main_38248_38271 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_2 :
        begin
          if (OUT_CONDITION_main_38248_38272 == 1'b1)
            begin
              _next_state = S_5;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_3 :
        begin
          selector_IN_UNBOUNDED_main_38248_38306 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_0_1 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38306 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_4 :
        begin
          selector_MUX_14___assert_fail_64_i0_1_0_1 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38306 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_5 :
        begin
          selector_IN_UNBOUNDED_main_38248_38279 = 1'b1;
          selector_MUX_76_reg_16_0_0_0 = 1'b1;
          wrenable_reg_15 = OUT_UNBOUNDED_main_38248_38279;
          wrenable_reg_16 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38279 == 1'b0)
            begin
              _next_state = S_6;
              selector_MUX_76_reg_16_0_0_0 = 1'b0;
              wrenable_reg_16 = 1'b0;
            end
          else
            begin
              _next_state = S_13;
            end
        end
      S_6 :
        begin
          selector_MUX_76_reg_16_0_0_0 = 1'b1;
          wrenable_reg_15 = OUT_UNBOUNDED_main_38248_38279;
          wrenable_reg_16 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38279 == 1'b0)
            begin
              _next_state = S_6;
              selector_MUX_76_reg_16_0_0_0 = 1'b0;
              wrenable_reg_16 = 1'b0;
            end
          else
            begin
              _next_state = S_13;
            end
        end
      S_13 :
        begin
          selector_IN_UNBOUNDED_main_38248_38375 = 1'b1;
          selector_MUX_64_read_66_i0_1_0_1 = 1'b1;
          selector_MUX_65_read_66_i0_2_0_1 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38375;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38375 == 1'b0)
            begin
              _next_state = S_14;
            end
          else
            begin
              _next_state = S_15;
            end
        end
      S_14 :
        begin
          selector_MUX_64_read_66_i0_1_1_0 = 1'b1;
          selector_MUX_65_read_66_i0_2_1_0 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38375;
          if (OUT_UNBOUNDED_main_38248_38375 == 1'b0)
            begin
              _next_state = S_14;
            end
          else
            begin
              _next_state = S_15;
            end
        end
      S_15 :
        begin
          wrenable_reg_16 = 1'b1;
          casez (OUT_MULTIIF_main_38248_42879)
            2'b?1 :
              begin
                _next_state = S_16;
                wrenable_reg_16 = 1'b0;
              end
            2'b10 :
              begin
                _next_state = S_13;
              end
            default:
              begin
                _next_state = S_7;
                wrenable_reg_16 = 1'b0;
              end
          endcase
        end
      S_7 :
        begin
          selector_IN_UNBOUNDED_main_38248_38365 = 1'b1;
          selector_IN_UNBOUNDED_main_38248_38366 = 1'b1;
          selector_IN_UNBOUNDED_main_38248_38367 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38367 == 1'b0)
            begin
              _next_state = S_8;
            end
          else
            begin
              _next_state = S_9;
            end
        end
      S_8 :
        begin
          if (OUT_UNBOUNDED_main_38248_38367 == 1'b0)
            begin
              _next_state = S_8;
            end
          else
            begin
              _next_state = S_9;
            end
        end
      S_9 :
        begin
          selector_IN_UNBOUNDED_main_38248_38368 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_IN_UNBOUNDED_main_38248_38371 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_38248_38371;
          if (OUT_UNBOUNDED_main_38248_38371 == 1'b0)
            begin
              _next_state = S_11;
            end
          else
            begin
              _next_state = S_12;
            end
        end
      S_11 :
        begin
          wrenable_reg_0 = OUT_UNBOUNDED_main_38248_38371;
          if (OUT_UNBOUNDED_main_38248_38371 == 1'b0)
            begin
              _next_state = S_11;
            end
          else
            begin
              _next_state = S_12;
            end
        end
      S_12 :
        begin
          if (OUT_CONDITION_main_38248_38372 == 1'b1)
            begin
              _next_state = S_20;
            end
          else
            begin
              _next_state = S_18;
            end
        end
      S_18 :
        begin
          selector_IN_UNBOUNDED_main_38248_38456 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_0_0 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_0_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_0_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38456 == 1'b0)
            begin
              _next_state = S_19;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_19 :
        begin
          selector_MUX_13___assert_fail_64_i0_0_0_0 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_0_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_0_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38456 == 1'b0)
            begin
              _next_state = S_19;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_20 :
        begin
          selector_IN_UNBOUNDED_main_38248_38447 = 1'b1;
          selector_MUX_82_reg_21_0_0_0 = 1'b1;
          wrenable_reg_20 = OUT_UNBOUNDED_main_38248_38447;
          wrenable_reg_21 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38447 == 1'b0)
            begin
              _next_state = S_21;
              selector_MUX_82_reg_21_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
          else
            begin
              _next_state = S_23;
            end
        end
      S_21 :
        begin
          selector_MUX_82_reg_21_0_0_0 = 1'b1;
          wrenable_reg_20 = OUT_UNBOUNDED_main_38248_38447;
          wrenable_reg_21 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38447 == 1'b0)
            begin
              _next_state = S_21;
              selector_MUX_82_reg_21_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
          else
            begin
              _next_state = S_23;
            end
        end
      S_23 :
        begin
          selector_IN_UNBOUNDED_main_38248_38485 = 1'b1;
          selector_MUX_63_read_66_i0_0_0_0 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38485;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38485 == 1'b0)
            begin
              _next_state = S_24;
            end
          else
            begin
              _next_state = S_25;
            end
        end
      S_24 :
        begin
          selector_MUX_63_read_66_i0_0_0_0 = 1'b1;
          selector_MUX_64_read_66_i0_1_0_0 = 1'b1;
          selector_MUX_64_read_66_i0_1_1_0 = 1'b1;
          selector_MUX_65_read_66_i0_2_0_0 = 1'b1;
          selector_MUX_65_read_66_i0_2_1_0 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38485;
          if (OUT_UNBOUNDED_main_38248_38485 == 1'b0)
            begin
              _next_state = S_24;
            end
          else
            begin
              _next_state = S_25;
            end
        end
      S_25 :
        begin
          wrenable_reg_21 = 1'b1;
          casez (OUT_MULTIIF_main_38248_42886)
            2'b?1 :
              begin
                _next_state = S_26;
                wrenable_reg_21 = 1'b0;
              end
            2'b10 :
              begin
                _next_state = S_23;
              end
            default:
              begin
                _next_state = S_22;
                wrenable_reg_21 = 1'b0;
              end
          endcase
        end
      S_22 :
        begin
          selector_IN_UNBOUNDED_main_38248_38481 = 1'b1;
          selector_MUX_0_CLOSE_54_i0_0_0_0 = 1'b1;
          _next_state = S_0;
          done_port = 1'b1;
        end
      S_26 :
        begin
          selector_IN_UNBOUNDED_main_38248_38515 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_0_1 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_1 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38515 == 1'b0)
            begin
              _next_state = S_27;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_27 :
        begin
          selector_MUX_13___assert_fail_64_i0_0_0_1 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_1 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38515 == 1'b0)
            begin
              _next_state = S_27;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_16 :
        begin
          selector_IN_UNBOUNDED_main_38248_38415 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_0_1 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38415 == 1'b0)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_17 :
        begin
          selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_0_1 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38415 == 1'b0)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _main(clock,
  reset,
  start_port,
  done_port,
  return_port,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [45:0] S_addr_ram;
  input [63:0] S_Wdata_ram;
  input [11:0] S_data_ram_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [63:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output [63:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_main_38248_38272;
  wire OUT_CONDITION_main_38248_38372;
  wire [1:0] OUT_MULTIIF_main_38248_42879;
  wire [1:0] OUT_MULTIIF_main_38248_42886;
  wire OUT_UNBOUNDED_main_38248_38271;
  wire OUT_UNBOUNDED_main_38248_38279;
  wire OUT_UNBOUNDED_main_38248_38306;
  wire OUT_UNBOUNDED_main_38248_38365;
  wire OUT_UNBOUNDED_main_38248_38366;
  wire OUT_UNBOUNDED_main_38248_38367;
  wire OUT_UNBOUNDED_main_38248_38368;
  wire OUT_UNBOUNDED_main_38248_38371;
  wire OUT_UNBOUNDED_main_38248_38375;
  wire OUT_UNBOUNDED_main_38248_38415;
  wire OUT_UNBOUNDED_main_38248_38447;
  wire OUT_UNBOUNDED_main_38248_38456;
  wire OUT_UNBOUNDED_main_38248_38481;
  wire OUT_UNBOUNDED_main_38248_38485;
  wire OUT_UNBOUNDED_main_38248_38515;
  wire selector_IN_UNBOUNDED_main_38248_38271;
  wire selector_IN_UNBOUNDED_main_38248_38279;
  wire selector_IN_UNBOUNDED_main_38248_38306;
  wire selector_IN_UNBOUNDED_main_38248_38365;
  wire selector_IN_UNBOUNDED_main_38248_38366;
  wire selector_IN_UNBOUNDED_main_38248_38367;
  wire selector_IN_UNBOUNDED_main_38248_38368;
  wire selector_IN_UNBOUNDED_main_38248_38371;
  wire selector_IN_UNBOUNDED_main_38248_38375;
  wire selector_IN_UNBOUNDED_main_38248_38415;
  wire selector_IN_UNBOUNDED_main_38248_38447;
  wire selector_IN_UNBOUNDED_main_38248_38456;
  wire selector_IN_UNBOUNDED_main_38248_38481;
  wire selector_IN_UNBOUNDED_main_38248_38485;
  wire selector_IN_UNBOUNDED_main_38248_38515;
  wire selector_MUX_0_CLOSE_54_i0_0_0_0;
  wire selector_MUX_13___assert_fail_64_i0_0_0_0;
  wire selector_MUX_13___assert_fail_64_i0_0_0_1;
  wire selector_MUX_13___assert_fail_64_i0_0_1_0;
  wire selector_MUX_14___assert_fail_64_i0_1_0_0;
  wire selector_MUX_14___assert_fail_64_i0_1_0_1;
  wire selector_MUX_14___assert_fail_64_i0_1_1_0;
  wire selector_MUX_15___assert_fail_64_i0_2_0_0;
  wire selector_MUX_15___assert_fail_64_i0_2_0_1;
  wire selector_MUX_15___assert_fail_64_i0_2_1_0;
  wire selector_MUX_16___assert_fail_64_i0_3_0_0;
  wire selector_MUX_16___assert_fail_64_i0_3_0_1;
  wire selector_MUX_16___assert_fail_64_i0_3_1_0;
  wire selector_MUX_63_read_66_i0_0_0_0;
  wire selector_MUX_64_read_66_i0_1_0_0;
  wire selector_MUX_64_read_66_i0_1_0_1;
  wire selector_MUX_64_read_66_i0_1_1_0;
  wire selector_MUX_65_read_66_i0_2_0_0;
  wire selector_MUX_65_read_66_i0_2_0_1;
  wire selector_MUX_65_read_66_i0_2_1_0;
  wire selector_MUX_76_reg_16_0_0_0;
  wire selector_MUX_82_reg_21_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_main Controller_i (.done_port(done_port),
    .selector_IN_UNBOUNDED_main_38248_38271(selector_IN_UNBOUNDED_main_38248_38271),
    .selector_IN_UNBOUNDED_main_38248_38279(selector_IN_UNBOUNDED_main_38248_38279),
    .selector_IN_UNBOUNDED_main_38248_38306(selector_IN_UNBOUNDED_main_38248_38306),
    .selector_IN_UNBOUNDED_main_38248_38365(selector_IN_UNBOUNDED_main_38248_38365),
    .selector_IN_UNBOUNDED_main_38248_38366(selector_IN_UNBOUNDED_main_38248_38366),
    .selector_IN_UNBOUNDED_main_38248_38367(selector_IN_UNBOUNDED_main_38248_38367),
    .selector_IN_UNBOUNDED_main_38248_38368(selector_IN_UNBOUNDED_main_38248_38368),
    .selector_IN_UNBOUNDED_main_38248_38371(selector_IN_UNBOUNDED_main_38248_38371),
    .selector_IN_UNBOUNDED_main_38248_38375(selector_IN_UNBOUNDED_main_38248_38375),
    .selector_IN_UNBOUNDED_main_38248_38415(selector_IN_UNBOUNDED_main_38248_38415),
    .selector_IN_UNBOUNDED_main_38248_38447(selector_IN_UNBOUNDED_main_38248_38447),
    .selector_IN_UNBOUNDED_main_38248_38456(selector_IN_UNBOUNDED_main_38248_38456),
    .selector_IN_UNBOUNDED_main_38248_38481(selector_IN_UNBOUNDED_main_38248_38481),
    .selector_IN_UNBOUNDED_main_38248_38485(selector_IN_UNBOUNDED_main_38248_38485),
    .selector_IN_UNBOUNDED_main_38248_38515(selector_IN_UNBOUNDED_main_38248_38515),
    .selector_MUX_0_CLOSE_54_i0_0_0_0(selector_MUX_0_CLOSE_54_i0_0_0_0),
    .selector_MUX_13___assert_fail_64_i0_0_0_0(selector_MUX_13___assert_fail_64_i0_0_0_0),
    .selector_MUX_13___assert_fail_64_i0_0_0_1(selector_MUX_13___assert_fail_64_i0_0_0_1),
    .selector_MUX_13___assert_fail_64_i0_0_1_0(selector_MUX_13___assert_fail_64_i0_0_1_0),
    .selector_MUX_14___assert_fail_64_i0_1_0_0(selector_MUX_14___assert_fail_64_i0_1_0_0),
    .selector_MUX_14___assert_fail_64_i0_1_0_1(selector_MUX_14___assert_fail_64_i0_1_0_1),
    .selector_MUX_14___assert_fail_64_i0_1_1_0(selector_MUX_14___assert_fail_64_i0_1_1_0),
    .selector_MUX_15___assert_fail_64_i0_2_0_0(selector_MUX_15___assert_fail_64_i0_2_0_0),
    .selector_MUX_15___assert_fail_64_i0_2_0_1(selector_MUX_15___assert_fail_64_i0_2_0_1),
    .selector_MUX_15___assert_fail_64_i0_2_1_0(selector_MUX_15___assert_fail_64_i0_2_1_0),
    .selector_MUX_16___assert_fail_64_i0_3_0_0(selector_MUX_16___assert_fail_64_i0_3_0_0),
    .selector_MUX_16___assert_fail_64_i0_3_0_1(selector_MUX_16___assert_fail_64_i0_3_0_1),
    .selector_MUX_16___assert_fail_64_i0_3_1_0(selector_MUX_16___assert_fail_64_i0_3_1_0),
    .selector_MUX_63_read_66_i0_0_0_0(selector_MUX_63_read_66_i0_0_0_0),
    .selector_MUX_64_read_66_i0_1_0_0(selector_MUX_64_read_66_i0_1_0_0),
    .selector_MUX_64_read_66_i0_1_0_1(selector_MUX_64_read_66_i0_1_0_1),
    .selector_MUX_64_read_66_i0_1_1_0(selector_MUX_64_read_66_i0_1_1_0),
    .selector_MUX_65_read_66_i0_2_0_0(selector_MUX_65_read_66_i0_2_0_0),
    .selector_MUX_65_read_66_i0_2_0_1(selector_MUX_65_read_66_i0_2_0_1),
    .selector_MUX_65_read_66_i0_2_1_0(selector_MUX_65_read_66_i0_2_1_0),
    .selector_MUX_76_reg_16_0_0_0(selector_MUX_76_reg_16_0_0_0),
    .selector_MUX_82_reg_21_0_0_0(selector_MUX_82_reg_21_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_main_38248_38272(OUT_CONDITION_main_38248_38272),
    .OUT_CONDITION_main_38248_38372(OUT_CONDITION_main_38248_38372),
    .OUT_MULTIIF_main_38248_42879(OUT_MULTIIF_main_38248_42879),
    .OUT_MULTIIF_main_38248_42886(OUT_MULTIIF_main_38248_42886),
    .OUT_UNBOUNDED_main_38248_38271(OUT_UNBOUNDED_main_38248_38271),
    .OUT_UNBOUNDED_main_38248_38279(OUT_UNBOUNDED_main_38248_38279),
    .OUT_UNBOUNDED_main_38248_38306(OUT_UNBOUNDED_main_38248_38306),
    .OUT_UNBOUNDED_main_38248_38365(OUT_UNBOUNDED_main_38248_38365),
    .OUT_UNBOUNDED_main_38248_38366(OUT_UNBOUNDED_main_38248_38366),
    .OUT_UNBOUNDED_main_38248_38367(OUT_UNBOUNDED_main_38248_38367),
    .OUT_UNBOUNDED_main_38248_38368(OUT_UNBOUNDED_main_38248_38368),
    .OUT_UNBOUNDED_main_38248_38371(OUT_UNBOUNDED_main_38248_38371),
    .OUT_UNBOUNDED_main_38248_38375(OUT_UNBOUNDED_main_38248_38375),
    .OUT_UNBOUNDED_main_38248_38415(OUT_UNBOUNDED_main_38248_38415),
    .OUT_UNBOUNDED_main_38248_38447(OUT_UNBOUNDED_main_38248_38447),
    .OUT_UNBOUNDED_main_38248_38456(OUT_UNBOUNDED_main_38248_38456),
    .OUT_UNBOUNDED_main_38248_38481(OUT_UNBOUNDED_main_38248_38481),
    .OUT_UNBOUNDED_main_38248_38485(OUT_UNBOUNDED_main_38248_38485),
    .OUT_UNBOUNDED_main_38248_38515(OUT_UNBOUNDED_main_38248_38515),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_main #(.MEM_var_1020_38248(1048576),
    .MEM_var_38334_38248(1572864),
    .MEM_var_38536_38252(7864320),
    .MEM_var_39494_74(7340032),
    .MEM_var_39496_38248(2097152),
    .MEM_var_39498_38248(2621440),
    .MEM_var_39500_38248(3145728),
    .MEM_var_39502_38248(3670016),
    .MEM_var_39504_38248(4194304),
    .MEM_var_39506_38248(4718592),
    .MEM_var_39508_38248(5242880),
    .MEM_var_39510_38248(5767168),
    .MEM_var_39512_38248(6291456),
    .MEM_var_39514_38248(6815744),
    .MEM_var_792_38248(524288),
    .MEM_var_796_38248(524288),
    .MEM_var_992_38248(524288)) Datapath_i (.return_port(return_port),
    .Sout_Rdata_ram(Sout_Rdata_ram),
    .Sout_DataRdy(Sout_DataRdy),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_main_38248_38272(OUT_CONDITION_main_38248_38272),
    .OUT_CONDITION_main_38248_38372(OUT_CONDITION_main_38248_38372),
    .OUT_MULTIIF_main_38248_42879(OUT_MULTIIF_main_38248_42879),
    .OUT_MULTIIF_main_38248_42886(OUT_MULTIIF_main_38248_42886),
    .OUT_UNBOUNDED_main_38248_38271(OUT_UNBOUNDED_main_38248_38271),
    .OUT_UNBOUNDED_main_38248_38279(OUT_UNBOUNDED_main_38248_38279),
    .OUT_UNBOUNDED_main_38248_38306(OUT_UNBOUNDED_main_38248_38306),
    .OUT_UNBOUNDED_main_38248_38365(OUT_UNBOUNDED_main_38248_38365),
    .OUT_UNBOUNDED_main_38248_38366(OUT_UNBOUNDED_main_38248_38366),
    .OUT_UNBOUNDED_main_38248_38367(OUT_UNBOUNDED_main_38248_38367),
    .OUT_UNBOUNDED_main_38248_38368(OUT_UNBOUNDED_main_38248_38368),
    .OUT_UNBOUNDED_main_38248_38371(OUT_UNBOUNDED_main_38248_38371),
    .OUT_UNBOUNDED_main_38248_38375(OUT_UNBOUNDED_main_38248_38375),
    .OUT_UNBOUNDED_main_38248_38415(OUT_UNBOUNDED_main_38248_38415),
    .OUT_UNBOUNDED_main_38248_38447(OUT_UNBOUNDED_main_38248_38447),
    .OUT_UNBOUNDED_main_38248_38456(OUT_UNBOUNDED_main_38248_38456),
    .OUT_UNBOUNDED_main_38248_38481(OUT_UNBOUNDED_main_38248_38481),
    .OUT_UNBOUNDED_main_38248_38485(OUT_UNBOUNDED_main_38248_38485),
    .OUT_UNBOUNDED_main_38248_38515(OUT_UNBOUNDED_main_38248_38515),
    .clock(clock),
    .reset(reset),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .Sin_DataRdy(Sin_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .selector_IN_UNBOUNDED_main_38248_38271(selector_IN_UNBOUNDED_main_38248_38271),
    .selector_IN_UNBOUNDED_main_38248_38279(selector_IN_UNBOUNDED_main_38248_38279),
    .selector_IN_UNBOUNDED_main_38248_38306(selector_IN_UNBOUNDED_main_38248_38306),
    .selector_IN_UNBOUNDED_main_38248_38365(selector_IN_UNBOUNDED_main_38248_38365),
    .selector_IN_UNBOUNDED_main_38248_38366(selector_IN_UNBOUNDED_main_38248_38366),
    .selector_IN_UNBOUNDED_main_38248_38367(selector_IN_UNBOUNDED_main_38248_38367),
    .selector_IN_UNBOUNDED_main_38248_38368(selector_IN_UNBOUNDED_main_38248_38368),
    .selector_IN_UNBOUNDED_main_38248_38371(selector_IN_UNBOUNDED_main_38248_38371),
    .selector_IN_UNBOUNDED_main_38248_38375(selector_IN_UNBOUNDED_main_38248_38375),
    .selector_IN_UNBOUNDED_main_38248_38415(selector_IN_UNBOUNDED_main_38248_38415),
    .selector_IN_UNBOUNDED_main_38248_38447(selector_IN_UNBOUNDED_main_38248_38447),
    .selector_IN_UNBOUNDED_main_38248_38456(selector_IN_UNBOUNDED_main_38248_38456),
    .selector_IN_UNBOUNDED_main_38248_38481(selector_IN_UNBOUNDED_main_38248_38481),
    .selector_IN_UNBOUNDED_main_38248_38485(selector_IN_UNBOUNDED_main_38248_38485),
    .selector_IN_UNBOUNDED_main_38248_38515(selector_IN_UNBOUNDED_main_38248_38515),
    .selector_MUX_0_CLOSE_54_i0_0_0_0(selector_MUX_0_CLOSE_54_i0_0_0_0),
    .selector_MUX_13___assert_fail_64_i0_0_0_0(selector_MUX_13___assert_fail_64_i0_0_0_0),
    .selector_MUX_13___assert_fail_64_i0_0_0_1(selector_MUX_13___assert_fail_64_i0_0_0_1),
    .selector_MUX_13___assert_fail_64_i0_0_1_0(selector_MUX_13___assert_fail_64_i0_0_1_0),
    .selector_MUX_14___assert_fail_64_i0_1_0_0(selector_MUX_14___assert_fail_64_i0_1_0_0),
    .selector_MUX_14___assert_fail_64_i0_1_0_1(selector_MUX_14___assert_fail_64_i0_1_0_1),
    .selector_MUX_14___assert_fail_64_i0_1_1_0(selector_MUX_14___assert_fail_64_i0_1_1_0),
    .selector_MUX_15___assert_fail_64_i0_2_0_0(selector_MUX_15___assert_fail_64_i0_2_0_0),
    .selector_MUX_15___assert_fail_64_i0_2_0_1(selector_MUX_15___assert_fail_64_i0_2_0_1),
    .selector_MUX_15___assert_fail_64_i0_2_1_0(selector_MUX_15___assert_fail_64_i0_2_1_0),
    .selector_MUX_16___assert_fail_64_i0_3_0_0(selector_MUX_16___assert_fail_64_i0_3_0_0),
    .selector_MUX_16___assert_fail_64_i0_3_0_1(selector_MUX_16___assert_fail_64_i0_3_0_1),
    .selector_MUX_16___assert_fail_64_i0_3_1_0(selector_MUX_16___assert_fail_64_i0_3_1_0),
    .selector_MUX_63_read_66_i0_0_0_0(selector_MUX_63_read_66_i0_0_0_0),
    .selector_MUX_64_read_66_i0_1_0_0(selector_MUX_64_read_66_i0_1_0_0),
    .selector_MUX_64_read_66_i0_1_0_1(selector_MUX_64_read_66_i0_1_0_1),
    .selector_MUX_64_read_66_i0_1_1_0(selector_MUX_64_read_66_i0_1_1_0),
    .selector_MUX_65_read_66_i0_2_0_0(selector_MUX_65_read_66_i0_2_0_0),
    .selector_MUX_65_read_66_i0_2_0_1(selector_MUX_65_read_66_i0_2_0_1),
    .selector_MUX_65_read_66_i0_2_1_0(selector_MUX_65_read_66_i0_2_1_0),
    .selector_MUX_76_reg_16_0_0_0(selector_MUX_76_reg_16_0_0_0),
    .selector_MUX_82_reg_21_0_0_0(selector_MUX_82_reg_21_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module main(clock,
  reset,
  start_port,
  done_port,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire [1:0] M_DataRdy_INT;
  wire [63:0] M_Rdata_ram_INT;
  wire [63:0] S_Wdata_ram_INT;
  wire [45:0] S_addr_ram_INT;
  wire [11:0] S_data_ram_size_INT;
  wire [1:0] S_oe_ram_INT;
  wire [1:0] S_we_ram_INT;
  wire signed [31:0] out_return_port_view_convert_expr_FU;
  
  _main _main_i0 (.done_port(done_port),
    .return_port(out_return_port_view_convert_expr_FU),
    .Sout_Rdata_ram(M_Rdata_ram_INT),
    .Sout_DataRdy(M_DataRdy_INT),
    .Mout_oe_ram(S_oe_ram_INT),
    .Mout_we_ram(S_we_ram_INT),
    .Mout_addr_ram(S_addr_ram_INT),
    .Mout_Wdata_ram(S_Wdata_ram_INT),
    .Mout_data_ram_size(S_data_ram_size_INT),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .S_oe_ram(S_oe_ram_INT),
    .S_we_ram(S_we_ram_INT),
    .S_addr_ram(S_addr_ram_INT),
    .S_Wdata_ram(S_Wdata_ram_INT),
    .S_data_ram_size(S_data_ram_size_INT),
    .M_Rdata_ram(M_Rdata_ram_INT),
    .M_DataRdy(M_DataRdy_INT),
    .Sin_Rdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .Min_Wdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_data_ram_size({6'b000000,
      6'b000000}));
  view_convert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) return_port_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_view_convert_expr_FU));

endmodule


