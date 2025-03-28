////////////////////////////////////////////////////////////////
// Start of: /home/ubuntu/stencil.v

// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2025-03-27T22:07:12
// /tmp/.mount_bambu-2F9Bsh/usr/bin/bambu executed with: /tmp/.mount_bambu-2F9Bsh/usr/bin/bambu -I./common --top-fname=main --simulator=VERILATOR --file-input-data=./stencil2d/input.data,./stencil2d/check.data --simulate -s --top-rtldesign-name=run_benchmark --no-iob --hls-div --benchmark-name=stencil -DBAMBU_PROFILING -DNO_FINAL_MEMCMP_CHECK ./stencil2d/stencil.c ./common/harness.c 
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
    MEMORY_INIT_file="array.mem",
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
  
      function integer log2;
        input integer value;
        integer temp_value;
        begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
        end
      endfunction
  
  parameter n_byte_on_databus = ALIGNMENT/8;
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  



    parameter nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : log2(n_byte_on_databus);
  
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
  
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  
  




    parameter nbit_addr = BITSIZE_S_addr_ram/*n_bytes ==  1 ? 1 : log2(n_bytes)*/;
    parameter nbits_address_space_rangesize = log2(address_space_rangesize);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 1 : log2(n_byte_on_databus);
  
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
`timescale 1ns / 1ps
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
    MEMORY_INIT_file="array.mem",
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
`timescale 1ns / 1ps
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
    MEMORY_INIT_file="array.mem",
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
`timescale 1ns / 1ps
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
    MEMORY_INIT_file="array.mem",
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
`timescale 1ns / 1ps
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
  
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  
  parameter n_bytes = (n_elements*data_size)/8;
  parameter memory_bitsize = 2*BRAM_BITSIZE;
  parameter n_byte_on_databus = memory_bitsize/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes%(n_byte_on_databus) == 0 ? 0 : 1);
  


    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : log2(n_mem_elements);
  
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
`timescale 1ns / 1ps
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
  
    
      function integer log2;
         input integer value;
         integer temp_value;
        begin
          temp_value = value-1;
          for (log2=0; temp_value>0; log2=log2+1)
            temp_value = temp_value>>1;
        end
      endfunction
    
  
    


      parameter nbits_buffer = log2(MAX_BUFF_SIZE);
    
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
  parameter MEM_var_38857_74=7340032;
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
  wire [7:0] null_out_signal_array_38857_0_out1_0;
  wire [7:0] null_out_signal_array_38857_0_out1_1;
  wire [31:0] null_out_signal_array_38857_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38857_0_proxy_out1_1;
  wire [31:0] out_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  wire [22:0] out_addr_expr_FU_3_i0_fu___assert_fail_74_38880;
  wire [22:0] out_const_0;
  wire [7:0] out_conv_in_port___line_32_8;
  wire [31:0] out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38880_23_32;
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
    .in2(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38880_23_32));
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
    .MEMORY_INIT_file_a("array_ref_38857.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38857.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_38857_74),
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
    .PORTSIZE_proxy_out1(2)) array_38857_0 (.out1({null_out_signal_array_38857_0_out1_1,
      null_out_signal_array_38857_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_0),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_0),
    .proxy_out1({null_out_signal_array_38857_0_proxy_out1_1,
      null_out_signal_array_38857_0_proxy_out1_0}),
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
    .value(MEM_var_38857_74)) const_0 (.out1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_in_port___line_32_8 (.out1(out_conv_in_port___line_32_8),
    .in1(in_port___line));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38880_23_32 (.out1(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38880_23_32),
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_38880));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_0_23_32 (.out1(out_conv_out_const_0_23_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_0_reg_0_23_32 (.out1(out_conv_out_reg_0_reg_0_23_32),
    .in1(out_reg_0_reg_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___assert_fail_74_38880 (.out1(out_addr_expr_FU_3_i0_fu___assert_fail_74_38880),
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
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_38880),
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
  parameter MEM_var_38857_74=7340032;
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
  datapath___assert_fail #(.MEM_var_38857_74(MEM_var_38857_74)) Datapath_i (.Sout_Rdata_ram(Sout_Rdata_ram),
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
  
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  
  


    parameter arg2_bitsize = log2(PRECISION);
  
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
  
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  
  


    parameter arg2_bitsize = log2(PRECISION);
  
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
  wire [22:0] out_UUdata_converter_FU_17_i0_fu___internal_free_737_38937;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_free_737_38930;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_free_737_38909;
  wire [22:0] out_UUdata_converter_FU_20_i0_fu___internal_free_737_38895;
  wire [22:0] out_UUdata_converter_FU_23_i0_fu___internal_free_737_39019;
  wire [22:0] out_UUdata_converter_FU_24_i0_fu___internal_free_737_38998;
  wire [22:0] out_UUdata_converter_FU_25_i0_fu___internal_free_737_39041;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_free_737_39012;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_free_737_39101;
  wire [22:0] out_UUdata_converter_FU_28_i0_fu___internal_free_737_39083;
  wire [22:0] out_UUdata_converter_FU_29_i0_fu___internal_free_737_39133;
  wire [22:0] out_UUdata_converter_FU_30_i0_fu___internal_free_737_39126;
  wire [22:0] out_UUdata_converter_FU_31_i0_fu___internal_free_737_39163;
  wire [22:0] out_UUdata_converter_FU_32_i0_fu___internal_free_737_39156;
  wire [22:0] out_UUdata_converter_FU_4_i0_fu___internal_free_737_38968;
  wire [22:0] out_UUdata_converter_FU_5_i0_fu___internal_free_737_38960;
  wire [22:0] out_UUdata_converter_FU_6_i0_fu___internal_free_737_39030;
  wire [22:0] out_UUdata_converter_FU_7_i0_fu___internal_free_737_39005;
  wire [22:0] out_UUdata_converter_FU_8_i0_fu___internal_free_737_39090;
  wire [22:0] out_UUdata_converter_FU_9_i0_fu___internal_free_737_39076;
  wire [19:0] out_addr_expr_FU_10_i0_fu___internal_free_737_39152;
  wire [19:0] out_addr_expr_FU_3_i0_fu___internal_free_737_38884;
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
  wire out_lut_expr_FU_14_i0_fu___internal_free_737_41168;
  wire out_lut_expr_FU_39_i0_fu___internal_free_737_41170;
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
  wire out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39779;
  wire out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39789;
  wire out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39791;
  wire out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39781;
  wire out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39785;
  wire out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39787;
  wire out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39793;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868;
  wire out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39783;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_38964;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39001;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39008;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39086;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39129;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_38981;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39058;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39113;
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
    .BITSIZE_out1(20)) fu___internal_free_737_38884 (.out1(out_addr_expr_FU_3_i0_fu___internal_free_737_38884),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38895 (.out1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_38895),
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_38909));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_38909 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_38909),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38930 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_38930),
    .in1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_38937));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_38937 (.out1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_38937),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38960 (.out1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_38960),
    .in1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_38968));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_38964 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_38964),
    .in1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_38960),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38968 (.out1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_38968),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_38981));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_38981 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_38981),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38998 (.out1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_38998),
    .in1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39019));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39001 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39001),
    .in1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_38998),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39005 (.out1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39005),
    .in1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39030));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39008 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39008),
    .in1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39005),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39012 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39012),
    .in1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39041));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39019 (.out1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39019),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39030 (.out1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39030),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39058));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39041 (.out1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39041),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39058 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39058),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39076 (.out1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39076),
    .in1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39090));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39083 (.out1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39083),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39101));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39086 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39086),
    .in1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39083),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39090 (.out1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39090),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39113));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39101 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39101),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39113 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39113),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39126 (.out1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39126),
    .in1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39133));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39129 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39129),
    .in1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39126),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39133 (.out1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39133),
    .in1(out_reg_6_reg_6));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_free_737_39152 (.out1(out_addr_expr_FU_10_i0_fu___internal_free_737_39152),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39156 (.out1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39156),
    .in1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39163));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39163 (.out1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39163),
    .in1(out_reg_6_reg_6));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_free_737_39779 (.out1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39779),
    .in1(in_port_ap),
    .in2(out_const_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39781 (.out1(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39781),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39783 (.out1(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39783),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39785 (.out1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39785),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39787 (.out1(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39787),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39789 (.out1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39789),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824),
    .in2(out_reg_9_reg_9));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39791 (.out1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39791),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39793 (.out1(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39793),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_41168 (.out1(out_lut_expr_FU_14_i0_fu___internal_free_737_41168),
    .in1(out_const_4),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39781),
    .in3(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39783),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_41170 (.out1(out_lut_expr_FU_39_i0_fu___internal_free_737_41170),
    .in1(out_const_6),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39787),
    .in3(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39793),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_774 (.out1(out_read_cond_FU_11_i0_fu___internal_free_737_774),
    .in1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39779));
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
    .in1(out_lut_expr_FU_14_i0_fu___internal_free_737_41168));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_848 (.out1(out_read_cond_FU_21_i0_fu___internal_free_737_848),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39785));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_854 (.out1(out_read_cond_FU_33_i0_fu___internal_free_737_854),
    .in1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39789));
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
    .in1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39791));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___internal_free_737_886 (.out1(out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886),
    .in1(out_reg_16_reg_16),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_909 (.out1(out_read_cond_FU_40_i0_fu___internal_free_737_909),
    .in1(out_lut_expr_FU_39_i0_fu___internal_free_737_41170));
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
    .in1(out_addr_expr_FU_3_i0_fu___internal_free_737_38884),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39086),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39129),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39156),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39001),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39012),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_38964),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39008),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39076),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_10_i0_fu___internal_free_737_39152),
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
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_38930),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_38895),
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
  wire [19:0] out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39270;
  wire [19:0] out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39254;
  wire [19:0] out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39281;
  wire [19:0] out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39263;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39210;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39196;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39221;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39203;
  wire [22:0] out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39375;
  wire [22:0] out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39361;
  wire [22:0] out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39322;
  wire [22:0] out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39308;
  wire [22:0] out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39333;
  wire [22:0] out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39315;
  wire [22:0] out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39386;
  wire [22:0] out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39368;
  wire [22:0] out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39474;
  wire [22:0] out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39460;
  wire [20:0] out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39437;
  wire [20:0] out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39430;
  wire [22:0] out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39485;
  wire [22:0] out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39467;
  wire [22:0] out_addr_expr_FU_12_i0_fu___internal_malloc_738_39260;
  wire [19:0] out_addr_expr_FU_13_i0_fu___internal_malloc_738_39296;
  wire [22:0] out_addr_expr_FU_16_i0_fu___internal_malloc_738_39178;
  wire [22:0] out_addr_expr_FU_17_i0_fu___internal_malloc_738_39181;
  wire [19:0] out_addr_expr_FU_20_i0_fu___internal_malloc_738_39414;
  wire [22:0] out_addr_expr_FU_21_i0_fu___internal_malloc_738_39419;
  wire [19:0] out_addr_expr_FU_22_i0_fu___internal_malloc_738_39426;
  wire [19:0] out_addr_expr_FU_23_i0_fu___internal_malloc_738_39405;
  wire [19:0] out_addr_expr_FU_6_i0_fu___internal_malloc_738_39184;
  wire [19:0] out_addr_expr_FU_7_i0_fu___internal_malloc_738_39240;
  wire [22:0] out_addr_expr_FU_8_i0_fu___internal_malloc_738_39251;
  wire [19:0] out_addr_expr_FU_9_i0_fu___internal_malloc_738_39292;
  wire out_const_0;
  wire [31:0] out_const_1;
  wire [1:0] out_const_10;
  wire [18:0] out_const_11;
  wire [2:0] out_const_12;
  wire [19:0] out_const_13;
  wire [22:0] out_const_14;
  wire [19:0] out_const_15;
  wire [31:0] out_const_2;
  wire [6:0] out_const_3;
  wire out_const_4;
  wire [2:0] out_const_5;
  wire [3:0] out_const_6;
  wire [12:0] out_const_7;
  wire [13:0] out_const_8;
  wire [22:0] out_const_9;
  wire [31:0] out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39178_23_32;
  wire [31:0] out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39181_23_32;
  wire [22:0] out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39184_20_23;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [31:0] out_conv_out_const_13_20_32;
  wire [31:0] out_conv_out_const_14_23_32;
  wire [31:0] out_conv_out_const_15_20_32;
  wire [5:0] out_conv_out_const_3_7_6;
  wire [31:0] out_conv_out_const_9_23_32;
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
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_94_i0_fu___internal_malloc_738_40890;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_94_i1_fu___internal_malloc_738_40904;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_95_i0_fu___internal_malloc_738_39990;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_96_i0_fu___internal_malloc_738_1063;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_97_i0_fu___internal_malloc_738_1121;
  wire [28:0] out_ui_bit_ior_concat_expr_FU_97_i1_fu___internal_malloc_738_39983;
  wire out_ui_eq_expr_FU_0_32_32_98_i0_fu___internal_malloc_738_39799;
  wire out_ui_eq_expr_FU_32_0_32_99_i0_fu___internal_malloc_738_39795;
  wire out_ui_eq_expr_FU_32_32_32_100_i0_fu___internal_malloc_738_39803;
  wire out_ui_le_expr_FU_0_32_32_101_i0_fu___internal_malloc_738_39797;
  wire out_ui_le_expr_FU_0_32_32_101_i1_fu___internal_malloc_738_39807;
  wire out_ui_le_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_39805;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_103_i0_fu___internal_malloc_738_1129;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_103_i1_fu___internal_malloc_738_39986;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_40887;
  wire [28:0] out_ui_lshift_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_40901;
  wire [30:0] out_ui_minus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_40883;
  wire [27:0] out_ui_plus_expr_FU_0_32_32_106_i0_fu___internal_malloc_738_40898;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_1079;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_107_i1_fu___internal_malloc_738_1139;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_108_i0_fu___internal_malloc_738_39206;
  wire [19:0] out_ui_pointer_plus_expr_FU_32_0_32_108_i1_fu___internal_malloc_738_39266;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_108_i2_fu___internal_malloc_738_39364;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_108_i3_fu___internal_malloc_738_39371;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_108_i4_fu___internal_malloc_738_39433;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_108_i5_fu___internal_malloc_738_39470;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_109_i0_fu___internal_malloc_738_1076;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_109_i1_fu___internal_malloc_738_1126;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_110_i0_fu___internal_malloc_738_39979;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_111_i0_fu___internal_malloc_738_40879;
  wire [27:0] out_ui_rshift_expr_FU_32_0_32_111_i1_fu___internal_malloc_738_40895;
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
    .in2(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39181_23_32));
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
    .in1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39184_20_23),
    .in2(out_MUX_5_DPROXY_CTRLN_0_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_65_gimple_return_FU_50_i0_0_0_0 (.out1(out_MUX_65_gimple_return_FU_50_i0_0_0_0),
    .sel(selector_MUX_65_gimple_return_FU_50_i0_0_0_0),
    .in1(out_conv_out_const_0_1_32),
    .in2(out_ui_pointer_plus_expr_FU_32_0_32_107_i1_fu___internal_malloc_738_1139));
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
    .in2(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39178_23_32));
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
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(19),
    .value(19'b1100000000000000000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_792_38248)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_796_38248)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_992_38248)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b00000000000000000010000000000110)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1000000000011)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b10000000000110)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_1020_38248)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39178_23_32 (.out1(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39178_23_32),
    .in1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39178));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39181_23_32 (.out1(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39181_23_32),
    .in1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39181));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39184_20_23 (.out1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39184_20_23),
    .in1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39184));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_13_20_32 (.out1(out_conv_out_const_13_20_32),
    .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_14_23_32 (.out1(out_conv_out_const_14_23_32),
    .in1(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_15_20_32 (.out1(out_conv_out_const_15_20_32),
    .in1(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_3_7_6 (.out1(out_conv_out_const_3_7_6),
    .in1(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_9_23_32 (.out1(out_conv_out_const_9_23_32),
    .in1(out_const_9));
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
    .OFFSET_PARAMETER(3)) fu___internal_malloc_738_1063 (.out1(out_ui_bit_ior_concat_expr_FU_96_i0_fu___internal_malloc_738_1063),
    .in1(out_ui_lshift_expr_FU_32_0_32_103_i1_fu___internal_malloc_738_39986),
    .in2(out_ui_bit_and_expr_FU_8_0_8_95_i0_fu___internal_malloc_738_39990),
    .in3(out_const_10));
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
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1076 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_109_i0_fu___internal_malloc_738_1076),
    .in1(out_reg_4_reg_4),
    .in2(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1079 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_1079),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_109_i0_fu___internal_malloc_738_1076),
    .in2(out_const_6));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(1)) fu___internal_malloc_738_1121 (.out1(out_ui_bit_ior_concat_expr_FU_97_i0_fu___internal_malloc_738_1121),
    .in1(out_ui_lshift_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_40887),
    .in2(out_ui_bit_and_expr_FU_1_0_1_94_i0_fu___internal_malloc_738_40890),
    .in3(out_const_4));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1126 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_109_i1_fu___internal_malloc_738_1126),
    .in1(out_reg_21_reg_21),
    .in2(out_ui_lshift_expr_FU_32_0_32_103_i0_fu___internal_malloc_738_1129));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_1129 (.out1(out_ui_lshift_expr_FU_32_0_32_103_i0_fu___internal_malloc_738_1129),
    .in1(out_ui_bit_ior_concat_expr_FU_97_i0_fu___internal_malloc_738_1121),
    .in2(out_const_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1139 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_107_i1_fu___internal_malloc_738_1139),
    .in1(out_reg_21_reg_21),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1150 (.out1(out_read_cond_FU_73_i0_fu___internal_malloc_738_1150),
    .in1(out_ui_eq_expr_FU_32_32_32_100_i0_fu___internal_malloc_738_39803));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1152 (.out1(out_read_cond_FU_77_i0_fu___internal_malloc_738_1152),
    .in1(out_ui_le_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_39805));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1155 (.out1(out_read_cond_FU_92_i0_fu___internal_malloc_738_1155),
    .in1(out_ui_le_expr_FU_0_32_32_101_i1_fu___internal_malloc_738_39807));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39178 (.out1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39178),
    .in1(out_conv_out_const_14_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39181 (.out1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39181),
    .in1(out_conv_out_const_14_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39184 (.out1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39184),
    .in1(out_conv_out_const_13_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39196 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39196),
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39210));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39203 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39203),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39221));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39206 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_108_i0_fu___internal_malloc_738_39206),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39203),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39210 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39210),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39221 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39221),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39240 (.out1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39240),
    .in1(out_conv_out_const_13_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39251 (.out1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39251),
    .in1(out_conv_out_const_14_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39254 (.out1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39254),
    .in1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39270));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39260 (.out1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39260),
    .in1(out_conv_out_const_14_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39263 (.out1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39263),
    .in1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39281));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(3),
    .BITSIZE_out1(20),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39266 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_108_i1_fu___internal_malloc_738_39266),
    .in1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39263),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39270 (.out1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39270),
    .in1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39292));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39281 (.out1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39281),
    .in1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39296));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39292 (.out1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39292),
    .in1(out_conv_out_const_14_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39296 (.out1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39296),
    .in1(out_conv_out_const_14_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39308 (.out1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39308),
    .in1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39322));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39315 (.out1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39315),
    .in1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39333));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39322 (.out1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39322),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39333 (.out1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39333),
    .in1(out_reg_0_reg_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39361 (.out1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39361),
    .in1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39375));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39364 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_108_i2_fu___internal_malloc_738_39364),
    .in1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39361),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39368 (.out1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39368),
    .in1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39386));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39371 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_108_i3_fu___internal_malloc_738_39371),
    .in1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39368),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39375 (.out1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39375),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39386 (.out1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39386),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_109_i1_fu___internal_malloc_738_1126));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39405 (.out1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_39405),
    .in1(out_conv_out_const_13_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39414 (.out1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_39414),
    .in1(out_conv_out_const_15_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39419 (.out1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_39419),
    .in1(out_conv_out_const_9_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39426 (.out1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_39426),
    .in1(out_conv_out_const_15_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_39430 (.out1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39430),
    .in1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39437));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39433 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_108_i4_fu___internal_malloc_738_39433),
    .in1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39430),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_39437 (.out1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39437),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_109_i0_fu___internal_malloc_738_1076));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39460 (.out1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39460),
    .in1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39474));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39467 (.out1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39467),
    .in1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39485));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39470 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_108_i5_fu___internal_malloc_738_39470),
    .in1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39467),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39474 (.out1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39474),
    .in1(out_reg_15_reg_15));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39485 (.out1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39485),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39795 (.out1(out_ui_eq_expr_FU_32_0_32_99_i0_fu___internal_malloc_738_39795),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39797 (.out1(out_ui_le_expr_FU_0_32_32_101_i0_fu___internal_malloc_738_39797),
    .in1(out_const_8),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39799 (.out1(out_ui_eq_expr_FU_0_32_32_98_i0_fu___internal_malloc_738_39799),
    .in1(out_const_8),
    .in2(out_reg_22_reg_22));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39803 (.out1(out_ui_eq_expr_FU_32_32_32_100_i0_fu___internal_malloc_738_39803),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_15_reg_15));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(19),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39805 (.out1(out_ui_le_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_39805),
    .in1(out_ui_bit_ior_concat_expr_FU_96_i0_fu___internal_malloc_738_1063),
    .in2(out_const_11));
  ui_le_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39807 (.out1(out_ui_le_expr_FU_0_32_32_101_i1_fu___internal_malloc_738_39807),
    .in1(out_const_8),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu___internal_malloc_738_39979 (.out1(out_ui_rshift_expr_FU_32_0_32_110_i0_fu___internal_malloc_738_39979),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_10));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(29),
    .OFFSET_PARAMETER(1)) fu___internal_malloc_738_39983 (.out1(out_ui_bit_ior_concat_expr_FU_97_i1_fu___internal_malloc_738_39983),
    .in1(out_ui_lshift_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_40901),
    .in2(out_ui_bit_and_expr_FU_1_0_1_94_i1_fu___internal_malloc_738_40904),
    .in3(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_39986 (.out1(out_ui_lshift_expr_FU_32_0_32_103_i1_fu___internal_malloc_738_39986),
    .in1(out_ui_bit_ior_concat_expr_FU_97_i1_fu___internal_malloc_738_39983),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___internal_malloc_738_39990 (.out1(out_ui_bit_and_expr_FU_8_0_8_95_i0_fu___internal_malloc_738_39990),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_12));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu___internal_malloc_738_40879 (.out1(out_ui_rshift_expr_FU_32_0_32_111_i0_fu___internal_malloc_738_40879),
    .in1(out_reg_22_reg_22),
    .in2(out_const_4));
  ui_minus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(13),
    .BITSIZE_out1(31)) fu___internal_malloc_738_40883 (.out1(out_ui_minus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_40883),
    .in1(out_ui_rshift_expr_FU_32_0_32_111_i0_fu___internal_malloc_738_40879),
    .in2(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_40887 (.out1(out_ui_lshift_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_40887),
    .in1(out_ui_minus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_40883),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40890 (.out1(out_ui_bit_and_expr_FU_1_0_1_94_i0_fu___internal_malloc_738_40890),
    .in1(out_reg_22_reg_22),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(28),
    .PRECISION(32)) fu___internal_malloc_738_40895 (.out1(out_ui_rshift_expr_FU_32_0_32_111_i1_fu___internal_malloc_738_40895),
    .in1(out_ui_rshift_expr_FU_32_0_32_110_i0_fu___internal_malloc_738_39979),
    .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(28),
    .BITSIZE_out1(28)) fu___internal_malloc_738_40898 (.out1(out_ui_plus_expr_FU_0_32_32_106_i0_fu___internal_malloc_738_40898),
    .in1(out_const_7),
    .in2(out_ui_rshift_expr_FU_32_0_32_111_i1_fu___internal_malloc_738_40895));
  ui_lshift_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu___internal_malloc_738_40901 (.out1(out_ui_lshift_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_40901),
    .in1(out_ui_plus_expr_FU_0_32_32_106_i0_fu___internal_malloc_738_40898),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_malloc_738_40904 (.out1(out_ui_bit_and_expr_FU_1_0_1_94_i1_fu___internal_malloc_738_40904),
    .in1(out_ui_rshift_expr_FU_32_0_32_110_i0_fu___internal_malloc_738_39979),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_921 (.out1(out_read_cond_FU_25_i0_fu___internal_malloc_738_921),
    .in1(out_ui_eq_expr_FU_32_0_32_99_i0_fu___internal_malloc_738_39795));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_951 (.out1(out_read_cond_FU_28_i0_fu___internal_malloc_738_951),
    .in1(out_ui_le_expr_FU_0_32_32_101_i0_fu___internal_malloc_738_39797));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_975 (.out1(out_read_cond_FU_48_i0_fu___internal_malloc_738_975),
    .in1(out_ui_eq_expr_FU_0_32_32_98_i0_fu___internal_malloc_738_39799));
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
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39196),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39240),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39251),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39254),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39260),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_108_i1_fu___internal_malloc_738_39266),
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
    .in1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39460),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_96_i0_fu___internal_malloc_738_1063),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_1079),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_108_i4_fu___internal_malloc_738_39433),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_39405),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_108_i5_fu___internal_malloc_738_39470),
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
    .in1(out_ui_bit_ior_concat_expr_FU_97_i0_fu___internal_malloc_738_1121),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_109_i1_fu___internal_malloc_738_1126),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_108_i2_fu___internal_malloc_738_39364),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_108_i3_fu___internal_malloc_738_39371),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39308),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39315),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_39414),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_39419),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_39426),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_108_i0_fu___internal_malloc_738_39206),
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
  
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  
  


    parameter arg2_bitsize = log2(PRECISION);
  
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
  
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  
  


    parameter arg2_bitsize = log2(PRECISION);
  
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
  wire [22:0] out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39673;
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
  wire [31:0] out_UUdata_converter_FU_20_i0_fu_read_2208_39680;
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
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40030;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40055;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40075;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40098;
  wire out_lut_expr_FU_18_i0_fu_read_2208_39829;
  wire signed [31:0] out_plus_expr_FU_32_0_32_61_i0_fu_read_2208_2450;
  wire signed [30:0] out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40095;
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
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40022;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40050;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40070;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40093;
  wire [0:0] out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7;
  wire [31:0] out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_8;
  wire [31:0] out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_9;
  wire out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_40592;
  wire out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_40596;
  wire out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_40600;
  wire out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_40604;
  wire out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_40608;
  wire out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_40636;
  wire out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_40640;
  wire out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_40528;
  wire out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_39827;
  wire out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_39837;
  wire out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_39839;
  wire out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_39841;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40018;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40089;
  wire [30:0] out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40085;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40015;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i0_fu_read_2208_2286;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i1_fu_read_2208_2313;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i2_fu_read_2208_2337;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i3_fu_read_2208_2459;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39676;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40011;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40083;
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
    .in1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_39827));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2250 (.out1(out_IUdata_converter_FU_2_i0_fu_read_2208_2250),
    .in1(in_port_fd));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2257 (.out1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in1(out_reg_1_reg_1));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2259 (.out1(out_UIdata_converter_FU_12_i0_fu_read_2208_2259),
    .in1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40018));
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
    .in1(out_lut_expr_FU_18_i0_fu_read_2208_39829));
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
    .in1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40030),
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
    .in1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40055),
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
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_40608));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2403 (.out1(out_read_cond_FU_35_i0_fu_read_2208_2403),
    .in1(out_reg_25_reg_25));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2409 (.out1(out_read_cond_FU_36_i0_fu_read_2208_2409),
    .in1(out_reg_26_reg_26));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_read_2208_2414 (.out1(out_bit_ior_concat_expr_FU_59_i0_fu_read_2208_2414),
    .in1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40075),
    .in2(out_const_7),
    .in3(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2418 (.out1(out_IUdata_converter_FU_21_i0_fu_read_2208_2418),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40098));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2419 (.out1(out_read_cond_FU_37_i0_fu_read_2208_2419),
    .in1(out_reg_5_reg_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2425 (.out1(out_IUdata_converter_FU_38_i0_fu_read_2208_2425),
    .in1(out_reg_1_reg_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2433 (.out1(out_read_cond_FU_42_i0_fu_read_2208_2433),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_39839));
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
    .in1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_40528));
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
    .BITSIZE_out1(23)) fu_read_2208_39673 (.out1(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39673),
    .in1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40089));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_39676 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39676),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39673));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_39680 (.out1(out_UUdata_converter_FU_20_i0_fu_read_2208_39680),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_read_2208_39827 (.out1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_39827),
    .in1(in_port_count),
    .in2(out_const_10));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_read_2208_39829 (.out1(out_lut_expr_FU_18_i0_fu_read_2208_39829),
    .in1(out_const_16),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_40592),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_40596),
    .in4(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_40600),
    .in5(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_40604),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_39837 (.out1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_39837),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_21_i0_fu_read_2208_2418));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_39839 (.out1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_39839),
    .in1(in_port_count),
    .in2(out_reg_7_reg_7));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_39841 (.out1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_39841),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_51_i0_fu_read_2208_2466));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40011 (.out1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40011),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_read_2208_40015 (.out1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40015),
    .in1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40011),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40018 (.out1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40018),
    .in1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40015),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40022 (.out1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40022),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40030 (.out1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40030),
    .in1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40022),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40050 (.out1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40050),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40055 (.out1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40055),
    .in1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40050),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40070 (.out1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40070),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40075 (.out1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40075),
    .in1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40070),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(64)) fu_read_2208_40083 (.out1(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40083),
    .in1(out_UUdata_converter_FU_20_i0_fu_read_2208_39680),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(31)) fu_read_2208_40085 (.out1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40085),
    .in1(out_const_17),
    .in2(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40083));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu_read_2208_40089 (.out1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40089),
    .in1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40085),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40093 (.out1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40093),
    .in1(out_reg_1_reg_1),
    .in2(out_const_2));
  plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31)) fu_read_2208_40095 (.out1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40095),
    .in1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40093),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40098 (.out1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40098),
    .in1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40095),
    .in2(out_const_2));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4)) fu_read_2208_40528 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_40528),
    .in1(out_BAMBU_READC_55_i0_fu_read_2208_2445),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_40592 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_40592),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_40596 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_40596),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_40600 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_40600),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_40604 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_40604),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_40608 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_40608),
    .in1(out_reg_14_reg_14),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_40636 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_40636),
    .in1(out_reg_14_reg_14),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_40640 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_40640),
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
    .in1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_39841),
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
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_40636),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_40640),
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
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39676),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_39837),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40098),
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
module mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg signed [BITSIZE_in1-1:0] in1_in;
      reg signed [BITSIZE_in2-1:0] in2_in;
      wire signed [BITSIZE_out1-1:0] mult_res;
      reg signed [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
    endgenerate

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
  fuselector_BMEMORY_CTRLN_32_i0_LOAD,
  fuselector_BMEMORY_CTRLN_32_i0_STORE,
  fuselector_BMEMORY_CTRLN_32_i1_LOAD,
  fuselector_BMEMORY_CTRLN_32_i1_STORE,
  selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0,
  selector_MUX_40_reg_1_0_0_0,
  selector_MUX_41_reg_10_0_0_0,
  selector_MUX_42_reg_11_0_0_0,
  selector_MUX_46_reg_15_0_0_0,
  selector_MUX_57_reg_6_0_0_0,
  selector_MUX_60_reg_9_0_0_0,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_run_benchmark_38252_38601,
  OUT_CONDITION_run_benchmark_38252_38708,
  OUT_MULTIIF_run_benchmark_38252_40975);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_vargs;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_32_i0_STORE;
  input fuselector_BMEMORY_CTRLN_32_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_32_i1_STORE;
  input selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  input selector_MUX_40_reg_1_0_0_0;
  input selector_MUX_41_reg_10_0_0_0;
  input selector_MUX_42_reg_11_0_0_0;
  input selector_MUX_46_reg_15_0_0_0;
  input selector_MUX_57_reg_6_0_0_0;
  input selector_MUX_60_reg_9_0_0_0;
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
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_run_benchmark_38252_38601;
  output OUT_CONDITION_run_benchmark_38252_38708;
  output [1:0] OUT_MULTIIF_run_benchmark_38252_40975;
  // Component and signal declarations
  wire [31:0] out_BMEMORY_CTRLN_32_i0_BMEMORY_CTRLN_32_i0;
  wire [31:0] out_BMEMORY_CTRLN_32_i1_BMEMORY_CTRLN_32_i0;
  wire [20:0] out_IUdata_converter_FU_15_i0_fu_run_benchmark_38252_38594;
  wire [22:0] out_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  wire [31:0] out_MUX_40_reg_1_0_0_0;
  wire [31:0] out_MUX_41_reg_10_0_0_0;
  wire [31:0] out_MUX_42_reg_11_0_0_0;
  wire [31:0] out_MUX_46_reg_15_0_0_0;
  wire [31:0] out_MUX_57_reg_6_0_0_0;
  wire [31:0] out_MUX_60_reg_9_0_0_0;
  wire [22:0] out_UUdata_converter_FU_23_i0_fu_run_benchmark_38252_38593;
  wire [22:0] out_UUdata_converter_FU_24_i0_fu_run_benchmark_38252_38596;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39732;
  wire [31:0] out_UUdata_converter_FU_30_i0_fu_run_benchmark_38252_38688;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39685;
  wire [22:0] out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39735;
  wire [22:0] out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39694;
  wire [31:0] out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39738;
  wire [31:0] out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39703;
  wire [31:0] out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_38634;
  wire [31:0] out_UUdata_converter_FU_9_i0_fu_run_benchmark_38252_38711;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [16:0] out_const_10;
  wire [1:0] out_const_11;
  wire [5:0] out_const_12;
  wire [5:0] out_const_13;
  wire [6:0] out_const_14;
  wire [7:0] out_const_15;
  wire [6:0] out_const_2;
  wire [2:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [2:0] out_const_6;
  wire [3:0] out_const_7;
  wire [15:0] out_const_8;
  wire [16:0] out_const_9;
  wire [5:0] out_conv_out_const_2_7_6;
  wire [31:0] out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_1_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_3_1_32;
  wire signed [0:0] out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0;
  wire [31:0] out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1;
  wire out_lut_expr_FU_31_i0_fu_run_benchmark_38252_40981;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_33_i0_fu_run_benchmark_38252_38598;
  wire [1:0] out_multi_read_cond_FU_25_i0_fu_run_benchmark_38252_40975;
  wire out_ne_expr_FU_32_0_32_34_i0_fu_run_benchmark_38252_39843;
  wire signed [31:0] out_plus_expr_FU_32_0_32_35_i0_fu_run_benchmark_38252_38600;
  wire signed [31:0] out_plus_expr_FU_32_32_32_36_i0_fu_run_benchmark_38252_38599;
  wire out_read_cond_FU_16_i0_fu_run_benchmark_38252_38601;
  wire out_read_cond_FU_17_i0_fu_run_benchmark_38252_38708;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [22:0] out_reg_12_reg_12;
  wire out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [22:0] out_reg_16_reg_16;
  wire [22:0] out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [31:0] out_reg_2_reg_2;
  wire [22:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [22:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire out_reg_7_reg_7;
  wire [23:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire [0:0] out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2;
  wire [0:0] out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_3;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_37_i0_fu_run_benchmark_38252_40113;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_38_i0_fu_run_benchmark_38252_40130;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_39_i0_fu_run_benchmark_38252_40164;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_40_i0_fu_run_benchmark_38252_38631;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_41_i0_fu_run_benchmark_38252_38685;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_42_i0_fu_run_benchmark_38252_38694;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_43_i0_fu_run_benchmark_38252_39752;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_43_i1_fu_run_benchmark_38252_39759;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_43_i2_fu_run_benchmark_38252_40143;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_44_i0_fu_run_benchmark_38252_40110;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i0_fu_run_benchmark_38252_40126;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_46_i0_fu_run_benchmark_38252_40160;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_46_i1_fu_run_benchmark_38252_40174;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_47_i0_fu_run_benchmark_38252_40186;
  wire out_ui_ne_expr_FU_32_0_32_48_i0_fu_run_benchmark_38252_39847;
  wire out_ui_ne_expr_FU_32_0_32_49_i0_fu_run_benchmark_38252_39849;
  wire out_ui_ne_expr_FU_32_32_32_50_i0_fu_run_benchmark_38252_39845;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_51_i0_fu_run_benchmark_38252_40107;
  wire [23:0] out_ui_plus_expr_FU_32_0_32_52_i0_fu_run_benchmark_38252_40123;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_53_i0_fu_run_benchmark_38252_40140;
  wire [23:0] out_ui_plus_expr_FU_32_0_32_53_i1_fu_run_benchmark_38252_40171;
  wire [23:0] out_ui_plus_expr_FU_32_32_32_54_i0_fu_run_benchmark_38252_40157;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_55_i0_fu_run_benchmark_38252_39689;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_56_i0_fu_run_benchmark_38252_39698;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_57_i0_fu_run_benchmark_38252_39775;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_58_i0_fu_run_benchmark_38252_38651;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_58_i1_fu_run_benchmark_38252_38691;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_58_i2_fu_run_benchmark_38252_39755;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_58_i3_fu_run_benchmark_38252_39762;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_58_i4_fu_run_benchmark_38252_39770;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_59_i0_fu_run_benchmark_38252_40102;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_60_i0_fu_run_benchmark_38252_40119;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_61_i0_fu_run_benchmark_38252_40135;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_61_i1_fu_run_benchmark_38252_40146;
  wire [5:0] out_ui_rshift_expr_FU_32_0_32_61_i2_fu_run_benchmark_38252_40181;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_62_i0_fu_run_benchmark_38252_40151;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_62_i1_fu_run_benchmark_38252_40155;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_62_i2_fu_run_benchmark_38252_40169;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_62_i3_fu_run_benchmark_38252_40177;
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
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_2 (.out1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_3 (.out1(out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_3),
    .in1(out_const_0));
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_32_i0 (.out1({out_BMEMORY_CTRLN_32_i1_BMEMORY_CTRLN_32_i0,
      out_BMEMORY_CTRLN_32_i0_BMEMORY_CTRLN_32_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1}),
    .in2({out_ui_pointer_plus_expr_FU_32_32_32_58_i3_fu_run_benchmark_38252_39762,
      out_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0}),
    .in3({out_conv_out_const_2_7_6,
      out_conv_out_const_2_7_6}),
    .in4({out_const_4,
      out_const_4}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_32_i1_LOAD,
      fuselector_BMEMORY_CTRLN_32_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_32_i1_STORE,
      fuselector_BMEMORY_CTRLN_32_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_1 (.out1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1),
    .in1(out_reg_9_reg_9));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_1_BMEMORY_CTRLN_32_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_58_i2_fu_run_benchmark_38252_39755));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_40_reg_1_0_0_0 (.out1(out_MUX_40_reg_1_0_0_0),
    .sel(selector_MUX_40_reg_1_0_0_0),
    .in1(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_46_i1_fu_run_benchmark_38252_40174));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_41_reg_10_0_0_0 (.out1(out_MUX_41_reg_10_0_0_0),
    .sel(selector_MUX_41_reg_10_0_0_0),
    .in1(out_reg_0_reg_0),
    .in2(out_ui_bit_ior_concat_expr_FU_40_i0_fu_run_benchmark_38252_38631));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_42_reg_11_0_0_0 (.out1(out_MUX_42_reg_11_0_0_0),
    .sel(selector_MUX_42_reg_11_0_0_0),
    .in1(out_UUdata_converter_FU_30_i0_fu_run_benchmark_38252_38688),
    .in2(out_ui_bit_ior_concat_expr_FU_41_i0_fu_run_benchmark_38252_38685));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_46_reg_15_0_0_0 (.out1(out_MUX_46_reg_15_0_0_0),
    .sel(selector_MUX_46_reg_15_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in2(out_plus_expr_FU_32_0_32_35_i0_fu_run_benchmark_38252_38600));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_57_reg_6_0_0_0 (.out1(out_MUX_57_reg_6_0_0_0),
    .sel(selector_MUX_57_reg_6_0_0_0),
    .in1(out_conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_3_1_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_43_i2_fu_run_benchmark_38252_40143));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_60_reg_9_0_0_0 (.out1(out_MUX_60_reg_9_0_0_0),
    .sel(selector_MUX_60_reg_9_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in2(out_plus_expr_FU_32_32_32_36_i0_fu_run_benchmark_38252_38599));
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
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000100100)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111110)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1111110)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1000000000000000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_2_7_6 (.out1(out_conv_out_const_2_7_6),
    .in1(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_1_32 (.out1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_32 (.out1(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_32),
    .in1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_3_1_32 (.out1(out_conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_3_1_32),
    .in1(out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38593 (.out1(out_UUdata_converter_FU_23_i0_fu_run_benchmark_38252_38593),
    .in1(out_reg_10_reg_10));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38594 (.out1(out_IUdata_converter_FU_15_i0_fu_run_benchmark_38252_38594),
    .in1(out_reg_15_reg_15));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38596 (.out1(out_UUdata_converter_FU_24_i0_fu_run_benchmark_38252_38596),
    .in1(out_reg_11_reg_11));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_run_benchmark_38252_38598 (.out1(out_mult_expr_FU_32_32_32_0_33_i0_fu_run_benchmark_38252_38598),
    .clock(clock),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_19_reg_19));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38599 (.out1(out_plus_expr_FU_32_32_32_36_i0_fu_run_benchmark_38252_38599),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_21_reg_21));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38600 (.out1(out_plus_expr_FU_32_0_32_35_i0_fu_run_benchmark_38252_38600),
    .in1(out_reg_15_reg_15),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38601 (.out1(out_read_cond_FU_16_i0_fu_run_benchmark_38252_38601),
    .in1(out_reg_18_reg_18));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_run_benchmark_38252_38631 (.out1(out_ui_bit_ior_concat_expr_FU_40_i0_fu_run_benchmark_38252_38631),
    .in1(out_ui_lshift_expr_FU_32_0_32_44_i0_fu_run_benchmark_38252_40110),
    .in2(out_ui_bit_and_expr_FU_8_0_8_37_i0_fu_run_benchmark_38252_40113),
    .in3(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38634 (.out1(out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_38634),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_55_i0_fu_run_benchmark_38252_39689));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_38651 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_58_i0_fu_run_benchmark_38252_38651),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_1_reg_1));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_in3(4),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(8)) fu_run_benchmark_38252_38685 (.out1(out_ui_bit_ior_concat_expr_FU_41_i0_fu_run_benchmark_38252_38685),
    .in1(out_ui_lshift_expr_FU_32_0_32_45_i0_fu_run_benchmark_38252_40126),
    .in2(out_ui_bit_and_expr_FU_8_0_8_38_i0_fu_run_benchmark_38252_40130),
    .in3(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38688 (.out1(out_UUdata_converter_FU_30_i0_fu_run_benchmark_38252_38688),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_58_i1_fu_run_benchmark_38252_38691));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_38691 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_58_i1_fu_run_benchmark_38252_38691),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_bit_ior_concat_expr_FU_42_i0_fu_run_benchmark_38252_38694));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_in3(4),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(8)) fu_run_benchmark_38252_38694 (.out1(out_ui_bit_ior_concat_expr_FU_42_i0_fu_run_benchmark_38252_38694),
    .in1(out_ui_lshift_expr_FU_32_0_32_46_i0_fu_run_benchmark_38252_40160),
    .in2(out_ui_lshift_expr_FU_8_0_8_47_i0_fu_run_benchmark_38252_40186),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38708 (.out1(out_read_cond_FU_17_i0_fu_run_benchmark_38252_38708),
    .in1(out_ui_ne_expr_FU_32_32_32_50_i0_fu_run_benchmark_38252_39845));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38711 (.out1(out_UUdata_converter_FU_9_i0_fu_run_benchmark_38252_38711),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_57_i0_fu_run_benchmark_38252_39775));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39685 (.out1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39685),
    .in1(out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39732));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(17),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39689 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_55_i0_fu_run_benchmark_38252_39689),
    .in1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39685),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_39694 (.out1(out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39694),
    .in1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39735));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(16),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39698 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_56_i0_fu_run_benchmark_38252_39698),
    .in1(out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39694),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39703 (.out1(out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39703),
    .in1(out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39738));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39732 (.out1(out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39732),
    .in1(in_port_vargs));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_39735 (.out1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39735),
    .in1(in_port_vargs));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39738 (.out1(out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39738),
    .in1(in_port_vargs));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_39752 (.out1(out_ui_lshift_expr_FU_32_0_32_43_i0_fu_run_benchmark_38252_39752),
    .in1(out_IUdata_converter_FU_15_i0_fu_run_benchmark_38252_38594),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39755 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_58_i2_fu_run_benchmark_38252_39755),
    .in1(out_reg_16_reg_16),
    .in2(out_ui_lshift_expr_FU_32_0_32_43_i0_fu_run_benchmark_38252_39752));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_39759 (.out1(out_ui_lshift_expr_FU_32_0_32_43_i1_fu_run_benchmark_38252_39759),
    .in1(out_IUdata_converter_FU_15_i0_fu_run_benchmark_38252_38594),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39762 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_58_i3_fu_run_benchmark_38252_39762),
    .in1(out_reg_17_reg_17),
    .in2(out_ui_lshift_expr_FU_32_0_32_43_i1_fu_run_benchmark_38252_39759));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39770 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_58_i4_fu_run_benchmark_38252_39770),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(17),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39775 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_57_i0_fu_run_benchmark_38252_39775),
    .in1(in_port_vargs),
    .in2(out_const_10));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_39843 (.out1(out_ne_expr_FU_32_0_32_34_i0_fu_run_benchmark_38252_39843),
    .in1(out_plus_expr_FU_32_0_32_35_i0_fu_run_benchmark_38252_38600),
    .in2(out_const_3));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_39845 (.out1(out_ui_ne_expr_FU_32_32_32_50_i0_fu_run_benchmark_38252_39845),
    .in1(out_reg_10_reg_10),
    .in2(out_reg_2_reg_2));
  ui_ne_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_39847 (.out1(out_ui_ne_expr_FU_32_0_32_48_i0_fu_run_benchmark_38252_39847),
    .in1(out_ui_rshift_expr_FU_32_0_32_61_i1_fu_run_benchmark_38252_40146),
    .in2(out_const_12));
  ui_ne_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_39849 (.out1(out_ui_ne_expr_FU_32_0_32_49_i0_fu_run_benchmark_38252_39849),
    .in1(out_ui_rshift_expr_FU_32_0_32_62_i3_fu_run_benchmark_38252_40177),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40102 (.out1(out_ui_rshift_expr_FU_32_0_32_59_i0_fu_run_benchmark_38252_40102),
    .in1(out_reg_10_reg_10),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_40107 (.out1(out_ui_plus_expr_FU_32_0_32_51_i0_fu_run_benchmark_38252_40107),
    .in1(out_ui_rshift_expr_FU_32_0_32_59_i0_fu_run_benchmark_38252_40102),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40110 (.out1(out_ui_lshift_expr_FU_32_0_32_44_i0_fu_run_benchmark_38252_40110),
    .in1(out_ui_plus_expr_FU_32_0_32_51_i0_fu_run_benchmark_38252_40107),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_40113 (.out1(out_ui_bit_and_expr_FU_8_0_8_37_i0_fu_run_benchmark_38252_40113),
    .in1(out_reg_10_reg_10),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu_run_benchmark_38252_40119 (.out1(out_ui_rshift_expr_FU_32_0_32_60_i0_fu_run_benchmark_38252_40119),
    .in1(out_reg_11_reg_11),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24)) fu_run_benchmark_38252_40123 (.out1(out_ui_plus_expr_FU_32_0_32_52_i0_fu_run_benchmark_38252_40123),
    .in1(out_ui_rshift_expr_FU_32_0_32_60_i0_fu_run_benchmark_38252_40119),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40126 (.out1(out_ui_lshift_expr_FU_32_0_32_45_i0_fu_run_benchmark_38252_40126),
    .in1(out_ui_plus_expr_FU_32_0_32_52_i0_fu_run_benchmark_38252_40123),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu_run_benchmark_38252_40130 (.out1(out_ui_bit_and_expr_FU_8_0_8_38_i0_fu_run_benchmark_38252_40130),
    .in1(out_reg_11_reg_11),
    .in2(out_const_15));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40135 (.out1(out_ui_rshift_expr_FU_32_0_32_61_i0_fu_run_benchmark_38252_40135),
    .in1(out_reg_6_reg_6),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_run_benchmark_38252_40140 (.out1(out_ui_plus_expr_FU_32_0_32_53_i0_fu_run_benchmark_38252_40140),
    .in1(out_ui_rshift_expr_FU_32_0_32_61_i0_fu_run_benchmark_38252_40135),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40143 (.out1(out_ui_lshift_expr_FU_32_0_32_43_i2_fu_run_benchmark_38252_40143),
    .in1(out_ui_plus_expr_FU_32_0_32_53_i0_fu_run_benchmark_38252_40140),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_run_benchmark_38252_40146 (.out1(out_ui_rshift_expr_FU_32_0_32_61_i1_fu_run_benchmark_38252_40146),
    .in1(out_ui_lshift_expr_FU_32_0_32_43_i2_fu_run_benchmark_38252_40143),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu_run_benchmark_38252_40151 (.out1(out_ui_rshift_expr_FU_32_0_32_62_i0_fu_run_benchmark_38252_40151),
    .in1(out_reg_6_reg_6),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu_run_benchmark_38252_40155 (.out1(out_ui_rshift_expr_FU_32_0_32_62_i1_fu_run_benchmark_38252_40155),
    .in1(out_reg_1_reg_1),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu_run_benchmark_38252_40157 (.out1(out_ui_plus_expr_FU_32_32_32_54_i0_fu_run_benchmark_38252_40157),
    .in1(out_ui_rshift_expr_FU_32_0_32_62_i0_fu_run_benchmark_38252_40151),
    .in2(out_reg_8_reg_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40160 (.out1(out_ui_lshift_expr_FU_32_0_32_46_i0_fu_run_benchmark_38252_40160),
    .in1(out_ui_plus_expr_FU_32_32_32_54_i0_fu_run_benchmark_38252_40157),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_40164 (.out1(out_ui_bit_and_expr_FU_8_0_8_39_i0_fu_run_benchmark_38252_40164),
    .in1(out_ui_rshift_expr_FU_32_0_32_61_i2_fu_run_benchmark_38252_40181),
    .in2(out_const_13));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu_run_benchmark_38252_40169 (.out1(out_ui_rshift_expr_FU_32_0_32_62_i2_fu_run_benchmark_38252_40169),
    .in1(out_reg_1_reg_1),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24)) fu_run_benchmark_38252_40171 (.out1(out_ui_plus_expr_FU_32_0_32_53_i1_fu_run_benchmark_38252_40171),
    .in1(out_ui_rshift_expr_FU_32_0_32_62_i2_fu_run_benchmark_38252_40169),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_40174 (.out1(out_ui_lshift_expr_FU_32_0_32_46_i1_fu_run_benchmark_38252_40174),
    .in1(out_ui_plus_expr_FU_32_0_32_53_i1_fu_run_benchmark_38252_40171),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu_run_benchmark_38252_40177 (.out1(out_ui_rshift_expr_FU_32_0_32_62_i3_fu_run_benchmark_38252_40177),
    .in1(out_ui_lshift_expr_FU_32_0_32_46_i1_fu_run_benchmark_38252_40174),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(6),
    .PRECISION(32)) fu_run_benchmark_38252_40181 (.out1(out_ui_rshift_expr_FU_32_0_32_61_i2_fu_run_benchmark_38252_40181),
    .in1(out_reg_6_reg_6),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(2),
    .BITSIZE_out1(8),
    .PRECISION(32)) fu_run_benchmark_38252_40186 (.out1(out_ui_lshift_expr_FU_8_0_8_47_i0_fu_run_benchmark_38252_40186),
    .in1(out_ui_bit_and_expr_FU_8_0_8_39_i0_fu_run_benchmark_38252_40164),
    .in2(out_const_5));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_40975 (.out1(out_multi_read_cond_FU_25_i0_fu_run_benchmark_38252_40975),
    .in1({out_reg_14_reg_14,
      out_reg_13_reg_13}));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_40981 (.out1(out_lut_expr_FU_31_i0_fu_run_benchmark_38252_40981),
    .in1(out_const_6),
    .in2(out_ui_ne_expr_FU_32_0_32_48_i0_fu_run_benchmark_38252_39847),
    .in3(out_reg_7_reg_7),
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
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_38634),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_40_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_41_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_42_reg_11_0_0_0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_58_i4_fu_run_benchmark_38252_39770),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_48_i0_fu_run_benchmark_38252_39847),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_31_i0_fu_run_benchmark_38252_40981),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_46_reg_15_0_0_0),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_23_i0_fu_run_benchmark_38252_38593),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_24_i0_fu_run_benchmark_38252_38596),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_34_i0_fu_run_benchmark_38252_39843),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_32_i0_BMEMORY_CTRLN_32_i0),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_9_i0_fu_run_benchmark_38252_38711),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_32_i1_BMEMORY_CTRLN_32_i0),
    .wenable(wrenable_reg_20));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_33_i0_fu_run_benchmark_38252_38598),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_56_i0_fu_run_benchmark_38252_39698),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39703),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_58_i0_fu_run_benchmark_38252_38651),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_57_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_49_i0_fu_run_benchmark_38252_39849),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(24),
    .BITSIZE_out1(24)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_62_i1_fu_run_benchmark_38252_40155),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_60_reg_9_0_0_0),
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
  assign OUT_CONDITION_run_benchmark_38252_38601 = out_read_cond_FU_16_i0_fu_run_benchmark_38252_38601;
  assign OUT_CONDITION_run_benchmark_38252_38708 = out_read_cond_FU_17_i0_fu_run_benchmark_38252_38708;
  assign OUT_MULTIIF_run_benchmark_38252_40975 = out_multi_read_cond_FU_25_i0_fu_run_benchmark_38252_40975;

endmodule

// FSM based controller description for run_benchmark
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_run_benchmark(done_port,
  fuselector_BMEMORY_CTRLN_32_i0_LOAD,
  fuselector_BMEMORY_CTRLN_32_i0_STORE,
  fuselector_BMEMORY_CTRLN_32_i1_LOAD,
  fuselector_BMEMORY_CTRLN_32_i1_STORE,
  selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0,
  selector_MUX_40_reg_1_0_0_0,
  selector_MUX_41_reg_10_0_0_0,
  selector_MUX_42_reg_11_0_0_0,
  selector_MUX_46_reg_15_0_0_0,
  selector_MUX_57_reg_6_0_0_0,
  selector_MUX_60_reg_9_0_0_0,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_run_benchmark_38252_38601,
  OUT_CONDITION_run_benchmark_38252_38708,
  OUT_MULTIIF_run_benchmark_38252_40975,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_run_benchmark_38252_38601;
  input OUT_CONDITION_run_benchmark_38252_38708;
  input [1:0] OUT_MULTIIF_run_benchmark_38252_40975;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_32_i0_STORE;
  output fuselector_BMEMORY_CTRLN_32_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_32_i1_STORE;
  output selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  output selector_MUX_40_reg_1_0_0_0;
  output selector_MUX_41_reg_10_0_0_0;
  output selector_MUX_42_reg_11_0_0_0;
  output selector_MUX_46_reg_15_0_0_0;
  output selector_MUX_57_reg_6_0_0_0;
  output selector_MUX_60_reg_9_0_0_0;
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
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [10:0] S_0 = 11'b00000000001,
    S_9 = 11'b01000000000,
    S_8 = 11'b00100000000,
    S_6 = 11'b00001000000,
    S_1 = 11'b00000000010,
    S_2 = 11'b00000000100,
    S_3 = 11'b00000001000,
    S_4 = 11'b00000010000,
    S_5 = 11'b00000100000,
    S_7 = 11'b00010000000,
    S_10 = 11'b10000000000;
  reg [10:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_32_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_32_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_32_i1_STORE;
  reg selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  reg selector_MUX_40_reg_1_0_0_0;
  reg selector_MUX_41_reg_10_0_0_0;
  reg selector_MUX_42_reg_11_0_0_0;
  reg selector_MUX_46_reg_15_0_0_0;
  reg selector_MUX_57_reg_6_0_0_0;
  reg selector_MUX_60_reg_9_0_0_0;
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
    fuselector_BMEMORY_CTRLN_32_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_32_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_32_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_32_i1_STORE = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0 = 1'b0;
    selector_MUX_40_reg_1_0_0_0 = 1'b0;
    selector_MUX_41_reg_10_0_0_0 = 1'b0;
    selector_MUX_42_reg_11_0_0_0 = 1'b0;
    selector_MUX_46_reg_15_0_0_0 = 1'b0;
    selector_MUX_57_reg_6_0_0_0 = 1'b0;
    selector_MUX_60_reg_9_0_0_0 = 1'b0;
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
          selector_MUX_40_reg_1_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_9;
        end
        else
        begin
          _next_state = S_0;
        end
      S_9 :
        begin
          selector_MUX_57_reg_6_0_0_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_MUX_41_reg_10_0_0_0 = 1'b1;
          selector_MUX_42_reg_11_0_0_0 = 1'b1;
          selector_MUX_60_reg_9_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          selector_MUX_46_reg_15_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_32_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_32_i1_LOAD = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_18 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_21 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38601 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_5 :
        begin
          if (OUT_CONDITION_run_benchmark_38252_38708 == 1'b1)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_7;
            end
        end
      S_7 :
        begin
          fuselector_BMEMORY_CTRLN_32_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0 = 1'b1;
          casez (OUT_MULTIIF_run_benchmark_38252_40975)
            2'b?1 :
              begin
                _next_state = S_8;
              end
            2'b10 :
              begin
                _next_state = S_9;
              end
            default:
              begin
                _next_state = S_10;
                done_port = 1'b1;
              end
          endcase
        end
      S_10 :
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
  input [31:0] vargs;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_run_benchmark_38252_38601;
  wire OUT_CONDITION_run_benchmark_38252_38708;
  wire [1:0] OUT_MULTIIF_run_benchmark_38252_40975;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_32_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_32_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_32_i1_STORE;
  wire selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  wire selector_MUX_40_reg_1_0_0_0;
  wire selector_MUX_41_reg_10_0_0_0;
  wire selector_MUX_42_reg_11_0_0_0;
  wire selector_MUX_46_reg_15_0_0_0;
  wire selector_MUX_57_reg_6_0_0_0;
  wire selector_MUX_60_reg_9_0_0_0;
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
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_run_benchmark Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_32_i0_LOAD(fuselector_BMEMORY_CTRLN_32_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_32_i0_STORE(fuselector_BMEMORY_CTRLN_32_i0_STORE),
    .fuselector_BMEMORY_CTRLN_32_i1_LOAD(fuselector_BMEMORY_CTRLN_32_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_32_i1_STORE(fuselector_BMEMORY_CTRLN_32_i1_STORE),
    .selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .selector_MUX_40_reg_1_0_0_0(selector_MUX_40_reg_1_0_0_0),
    .selector_MUX_41_reg_10_0_0_0(selector_MUX_41_reg_10_0_0_0),
    .selector_MUX_42_reg_11_0_0_0(selector_MUX_42_reg_11_0_0_0),
    .selector_MUX_46_reg_15_0_0_0(selector_MUX_46_reg_15_0_0_0),
    .selector_MUX_57_reg_6_0_0_0(selector_MUX_57_reg_6_0_0_0),
    .selector_MUX_60_reg_9_0_0_0(selector_MUX_60_reg_9_0_0_0),
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
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_run_benchmark_38252_38601(OUT_CONDITION_run_benchmark_38252_38601),
    .OUT_CONDITION_run_benchmark_38252_38708(OUT_CONDITION_run_benchmark_38252_38708),
    .OUT_MULTIIF_run_benchmark_38252_40975(OUT_MULTIIF_run_benchmark_38252_40975),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_run_benchmark Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_run_benchmark_38252_38601(OUT_CONDITION_run_benchmark_38252_38601),
    .OUT_CONDITION_run_benchmark_38252_38708(OUT_CONDITION_run_benchmark_38252_38708),
    .OUT_MULTIIF_run_benchmark_38252_40975(OUT_MULTIIF_run_benchmark_38252_40975),
    .clock(clock),
    .reset(reset),
    .in_port_vargs(vargs),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_32_i0_LOAD(fuselector_BMEMORY_CTRLN_32_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_32_i0_STORE(fuselector_BMEMORY_CTRLN_32_i0_STORE),
    .fuselector_BMEMORY_CTRLN_32_i1_LOAD(fuselector_BMEMORY_CTRLN_32_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_32_i1_STORE(fuselector_BMEMORY_CTRLN_32_i1_STORE),
    .selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .selector_MUX_40_reg_1_0_0_0(selector_MUX_40_reg_1_0_0_0),
    .selector_MUX_41_reg_10_0_0_0(selector_MUX_41_reg_10_0_0_0),
    .selector_MUX_42_reg_11_0_0_0(selector_MUX_42_reg_11_0_0_0),
    .selector_MUX_46_reg_15_0_0_0(selector_MUX_46_reg_15_0_0_0),
    .selector_MUX_57_reg_6_0_0_0(selector_MUX_57_reg_6_0_0_0),
    .selector_MUX_60_reg_9_0_0_0(selector_MUX_60_reg_9_0_0_0),
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
  OUT_MULTIIF_main_38248_41418,
  OUT_MULTIIF_main_38248_41425,
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
    MEM_var_38857_74=7340032,
    MEM_var_38859_38248=2097152,
    MEM_var_38861_38248=2621440,
    MEM_var_38863_38248=3145728,
    MEM_var_38865_38248=3670016,
    MEM_var_38867_38248=4194304,
    MEM_var_38869_38248=4718592,
    MEM_var_38871_38248=5242880,
    MEM_var_38873_38248=5767168,
    MEM_var_38875_38248=6291456,
    MEM_var_38877_38248=6815744,
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
  output [1:0] OUT_MULTIIF_main_38248_41418;
  output [1:0] OUT_MULTIIF_main_38248_41425;
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
  wire [7:0] null_out_signal_array_38859_0_out1_0;
  wire [7:0] null_out_signal_array_38859_0_out1_1;
  wire [31:0] null_out_signal_array_38859_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38859_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38861_0_out1_0;
  wire [7:0] null_out_signal_array_38861_0_out1_1;
  wire [31:0] null_out_signal_array_38861_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38861_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38863_0_out1_0;
  wire [7:0] null_out_signal_array_38863_0_out1_1;
  wire [31:0] null_out_signal_array_38863_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38863_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38865_0_out1_0;
  wire [7:0] null_out_signal_array_38865_0_out1_1;
  wire [31:0] null_out_signal_array_38865_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38865_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38867_0_out1_0;
  wire [7:0] null_out_signal_array_38867_0_out1_1;
  wire [31:0] null_out_signal_array_38867_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38867_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38869_0_out1_0;
  wire [7:0] null_out_signal_array_38869_0_out1_1;
  wire [31:0] null_out_signal_array_38869_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38869_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38871_0_out1_0;
  wire [7:0] null_out_signal_array_38871_0_out1_1;
  wire [31:0] null_out_signal_array_38871_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38871_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38873_0_out1_0;
  wire [7:0] null_out_signal_array_38873_0_out1_1;
  wire [31:0] null_out_signal_array_38873_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38873_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38875_0_out1_0;
  wire [7:0] null_out_signal_array_38875_0_out1_1;
  wire [31:0] null_out_signal_array_38875_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38875_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38877_0_out1_0;
  wire [7:0] null_out_signal_array_38877_0_out1_1;
  wire [31:0] null_out_signal_array_38877_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_38877_0_proxy_out1_1;
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
  wire [22:0] out_addr_expr_FU_17_i0_fu_main_38248_39607;
  wire [22:0] out_addr_expr_FU_18_i0_fu_main_38248_39620;
  wire [22:0] out_addr_expr_FU_19_i0_fu_main_38248_39623;
  wire [22:0] out_addr_expr_FU_20_i0_fu_main_38248_39626;
  wire [22:0] out_addr_expr_FU_21_i0_fu_main_38248_39642;
  wire [22:0] out_addr_expr_FU_22_i0_fu_main_38248_39651;
  wire [22:0] out_addr_expr_FU_23_i0_fu_main_38248_39654;
  wire [22:0] out_addr_expr_FU_24_i0_fu_main_38248_39657;
  wire [22:0] out_addr_expr_FU_25_i0_fu_main_38248_39633;
  wire [22:0] out_addr_expr_FU_26_i0_fu_main_38248_39636;
  wire [22:0] out_addr_expr_FU_27_i0_fu_main_38248_39639;
  wire [22:0] out_addr_expr_FU_28_i0_fu_main_38248_39598;
  wire [22:0] out_addr_expr_FU_29_i0_fu_main_38248_39601;
  wire [22:0] out_addr_expr_FU_30_i0_fu_main_38248_39604;
  wire out_const_0;
  wire [17:0] out_const_1;
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
  wire out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39617;
  wire out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39648;
  wire out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_39821;
  wire out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_39825;
  wire signed [0:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire out_lut_expr_FU_40_i0_fu_main_38248_41421;
  wire out_lut_expr_FU_41_i0_fu_main_38248_41424;
  wire out_lut_expr_FU_51_i0_fu_main_38248_41428;
  wire out_lut_expr_FU_52_i0_fu_main_38248_41431;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i0_fu_main_38248_38405;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i1_fu_main_38248_38506;
  wire [1:0] out_multi_read_cond_FU_42_i0_fu_main_38248_41418;
  wire [1:0] out_multi_read_cond_FU_53_i0_fu_main_38248_41425;
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
  wire out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_39815;
  wire out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_39819;
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
  __assert_fail #(.MEM_var_38857_74(MEM_var_38857_74)) __assert_fail_64_i0 (.done_port(s_done___assert_fail_64_i0),
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
    .MEMORY_INIT_file_a("array_ref_38859.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38859.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_38859_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38859_0 (.out1({null_out_signal_array_38859_0_out1_1,
      null_out_signal_array_38859_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_3),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_3),
    .proxy_out1({null_out_signal_array_38859_0_proxy_out1_1,
      null_out_signal_array_38859_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38861.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38861.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38861_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38861_0 (.out1({null_out_signal_array_38861_0_out1_1,
      null_out_signal_array_38861_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_4),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_4),
    .proxy_out1({null_out_signal_array_38861_0_proxy_out1_1,
      null_out_signal_array_38861_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38863.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38863.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_38863_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38863_0 (.out1({null_out_signal_array_38863_0_out1_1,
      null_out_signal_array_38863_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_5),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_5),
    .proxy_out1({null_out_signal_array_38863_0_proxy_out1_1,
      null_out_signal_array_38863_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38865.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38865.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_38865_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38865_0 (.out1({null_out_signal_array_38865_0_out1_1,
      null_out_signal_array_38865_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_6),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_6),
    .proxy_out1({null_out_signal_array_38865_0_proxy_out1_1,
      null_out_signal_array_38865_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38867.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38867.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38867_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38867_0 (.out1({null_out_signal_array_38867_0_out1_1,
      null_out_signal_array_38867_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_7),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_7),
    .proxy_out1({null_out_signal_array_38867_0_proxy_out1_1,
      null_out_signal_array_38867_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38869.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38869.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_38869_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38869_0 (.out1({null_out_signal_array_38869_0_out1_1,
      null_out_signal_array_38869_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_8),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_8),
    .proxy_out1({null_out_signal_array_38869_0_proxy_out1_1,
      null_out_signal_array_38869_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38871.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38871.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38871_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38871_0 (.out1({null_out_signal_array_38871_0_out1_1,
      null_out_signal_array_38871_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_9),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_9),
    .proxy_out1({null_out_signal_array_38871_0_proxy_out1_1,
      null_out_signal_array_38871_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38873.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38873.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_38873_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38873_0 (.out1({null_out_signal_array_38873_0_out1_1,
      null_out_signal_array_38873_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_10),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_10),
    .proxy_out1({null_out_signal_array_38873_0_proxy_out1_1,
      null_out_signal_array_38873_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38875.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38875.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_38875_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38875_0 (.out1({null_out_signal_array_38875_0_out1_1,
      null_out_signal_array_38875_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_11),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_11),
    .proxy_out1({null_out_signal_array_38875_0_proxy_out1_1,
      null_out_signal_array_38875_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_38877.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38877.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38877_38248),
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
    .PORTSIZE_proxy_out1(2)) array_38877_0 (.out1({null_out_signal_array_38877_0_out1_1,
      null_out_signal_array_38877_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_12),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_12),
    .proxy_out1({null_out_signal_array_38877_0_proxy_out1_1,
      null_out_signal_array_38877_0_proxy_out1_0}),
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
    .PORTSIZE_in1(14),
    .BITSIZE_out1(2)) bus_mergerSout_DataRdy5_ (.out1(sig_out_bus_mergerSout_DataRdy5_),
    .in1({sig_in_bus_mergerSout_DataRdy5_13,
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
    .PORTSIZE_in1(14),
    .BITSIZE_out1(64)) bus_mergerSout_Rdata_ram6_ (.out1(sig_out_bus_mergerSout_Rdata_ram6_),
    .in1({sig_in_bus_mergerSout_Rdata_ram6_13,
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
  constant_value #(.BITSIZE_out1(18),
    .value(18'b010000000000100100)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38861_38248)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38863_38248)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38865_38248)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38867_38248)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38869_38248)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38871_38248)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38873_38248)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38875_38248)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38877_38248)) const_18 (.out1(out_const_18));
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
    .value(MEM_var_38859_38248)) const_9 (.out1(out_const_9));
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
    .in1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_39815));
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
  run_benchmark fu_main_38248_38367 (.done_port(s_done_fu_main_38248_38367),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_5),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_5),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_5),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_5),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_5),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED_main_38248_38367),
    .vargs(out_reg_0_reg_0),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  __builtin_bambu_time_stop fu_main_38248_38368 (.done_port(s_done_fu_main_38248_38368),
    .clock(clock),
    .start_port(selector_IN_UNBOUNDED_main_38248_38368));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_38248_38372 (.out1(out_read_cond_FU_33_i0_fu_main_38248_38372),
    .in1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_39819));
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
  minus_expr_FU #(.BITSIZE_in1(18),
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
  minus_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_38248_38506 (.out1(out_minus_expr_FU_0_32_32_60_i1_fu_main_38248_38506),
    .in1(out_const_1),
    .in2(out_reg_21_reg_21));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39598 (.out1(out_addr_expr_FU_28_i0_fu_main_38248_39598),
    .in1(out_conv_out_const_9_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39601 (.out1(out_addr_expr_FU_29_i0_fu_main_38248_39601),
    .in1(out_conv_out_const_10_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39604 (.out1(out_addr_expr_FU_30_i0_fu_main_38248_39604),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39607 (.out1(out_addr_expr_FU_17_i0_fu_main_38248_39607),
    .in1(out_conv_out_const_11_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39617 (.out1(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39617),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39620 (.out1(out_addr_expr_FU_18_i0_fu_main_38248_39620),
    .in1(out_conv_out_const_12_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39623 (.out1(out_addr_expr_FU_19_i0_fu_main_38248_39623),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39626 (.out1(out_addr_expr_FU_20_i0_fu_main_38248_39626),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39633 (.out1(out_addr_expr_FU_25_i0_fu_main_38248_39633),
    .in1(out_conv_out_const_14_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39636 (.out1(out_addr_expr_FU_26_i0_fu_main_38248_39636),
    .in1(out_conv_out_const_15_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39639 (.out1(out_addr_expr_FU_27_i0_fu_main_38248_39639),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39642 (.out1(out_addr_expr_FU_21_i0_fu_main_38248_39642),
    .in1(out_conv_out_const_16_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39648 (.out1(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39648),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39651 (.out1(out_addr_expr_FU_22_i0_fu_main_38248_39651),
    .in1(out_conv_out_const_17_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39654 (.out1(out_addr_expr_FU_23_i0_fu_main_38248_39654),
    .in1(out_conv_out_const_18_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39657 (.out1(out_addr_expr_FU_24_i0_fu_main_38248_39657),
    .in1(out_conv_out_const_8_23_32));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39815 (.out1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_39815),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39819 (.out1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_39819),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  gt_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_39821 (.out1(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_39821),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i0_fu_main_38248_38400));
  gt_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_39825 (.out1(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_39825),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i1_fu_main_38248_38501));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_41418 (.out1(out_multi_read_cond_FU_42_i0_fu_main_38248_41418),
    .in1({out_lut_expr_FU_41_i0_fu_main_38248_41424,
      out_lut_expr_FU_40_i0_fu_main_38248_41421}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_41421 (.out1(out_lut_expr_FU_40_i0_fu_main_38248_41421),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39617),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_41424 (.out1(out_lut_expr_FU_41_i0_fu_main_38248_41424),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39617),
    .in3(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_39821),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_41425 (.out1(out_multi_read_cond_FU_53_i0_fu_main_38248_41425),
    .in1({out_lut_expr_FU_52_i0_fu_main_38248_41431,
      out_lut_expr_FU_51_i0_fu_main_38248_41428}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_41428 (.out1(out_lut_expr_FU_51_i0_fu_main_38248_41428),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39648),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_41431 (.out1(out_lut_expr_FU_52_i0_fu_main_38248_41431),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39648),
    .in3(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_39825),
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
    .in1(out_addr_expr_FU_28_i0_fu_main_38248_39598),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_27_i0_fu_main_38248_39639),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu_main_38248_39642),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu_main_38248_39651),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu_main_38248_39654),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_24_i0_fu_main_38248_39657),
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
    .in1(out_addr_expr_FU_29_i0_fu_main_38248_39601),
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
    .in1(out_addr_expr_FU_30_i0_fu_main_38248_39604),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_17_i0_fu_main_38248_39607),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_18_i0_fu_main_38248_39620),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_19_i0_fu_main_38248_39623),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu_main_38248_39626),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_25_i0_fu_main_38248_39633),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_26_i0_fu_main_38248_39636),
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
  assign OUT_MULTIIF_main_38248_41418 = out_multi_read_cond_FU_42_i0_fu_main_38248_41418;
  assign OUT_MULTIIF_main_38248_41425 = out_multi_read_cond_FU_53_i0_fu_main_38248_41425;
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
  OUT_MULTIIF_main_38248_41418,
  OUT_MULTIIF_main_38248_41425,
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
  input [1:0] OUT_MULTIIF_main_38248_41418;
  input [1:0] OUT_MULTIIF_main_38248_41425;
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
  parameter [28:0] S_0 = 29'b00000000000000000000000000001,
    S_1 = 29'b00000000000000000000000000010,
    S_2 = 29'b00000000000000000000000000100,
    S_3 = 29'b00000000000000000000000001000,
    S_4 = 29'b00000000000000000000000010000,
    S_5 = 29'b00000000000000000000000100000,
    S_6 = 29'b00000000000000000000001000000,
    S_14 = 29'b00000000000000100000000000000,
    S_15 = 29'b00000000000001000000000000000,
    S_16 = 29'b00000000000010000000000000000,
    S_7 = 29'b00000000000000000000010000000,
    S_8 = 29'b00000000000000000000100000000,
    S_9 = 29'b00000000000000000001000000000,
    S_10 = 29'b00000000000000000010000000000,
    S_11 = 29'b00000000000000000100000000000,
    S_12 = 29'b00000000000000001000000000000,
    S_13 = 29'b00000000000000010000000000000,
    S_19 = 29'b00000000010000000000000000000,
    S_20 = 29'b00000000100000000000000000000,
    S_21 = 29'b00000001000000000000000000000,
    S_22 = 29'b00000010000000000000000000000,
    S_24 = 29'b00001000000000000000000000000,
    S_25 = 29'b00010000000000000000000000000,
    S_26 = 29'b00100000000000000000000000000,
    S_23 = 29'b00000100000000000000000000000,
    S_27 = 29'b01000000000000000000000000000,
    S_28 = 29'b10000000000000000000000000000,
    S_17 = 29'b00000000000100000000000000000,
    S_18 = 29'b00000000001000000000000000000;
  reg [28:0] _present_state=S_0, _next_state;
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
              _next_state = S_14;
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
              _next_state = S_14;
            end
        end
      S_14 :
        begin
          selector_IN_UNBOUNDED_main_38248_38375 = 1'b1;
          selector_MUX_64_read_66_i0_1_0_1 = 1'b1;
          selector_MUX_65_read_66_i0_2_0_1 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38375;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38375 == 1'b0)
            begin
              _next_state = S_15;
            end
          else
            begin
              _next_state = S_16;
            end
        end
      S_15 :
        begin
          selector_MUX_64_read_66_i0_1_1_0 = 1'b1;
          selector_MUX_65_read_66_i0_2_1_0 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38375;
          if (OUT_UNBOUNDED_main_38248_38375 == 1'b0)
            begin
              _next_state = S_15;
            end
          else
            begin
              _next_state = S_16;
            end
        end
      S_16 :
        begin
          wrenable_reg_16 = 1'b1;
          casez (OUT_MULTIIF_main_38248_41418)
            2'b?1 :
              begin
                _next_state = S_17;
                wrenable_reg_16 = 1'b0;
              end
            2'b10 :
              begin
                _next_state = S_14;
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
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_IN_UNBOUNDED_main_38248_38367 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38367 == 1'b0)
            begin
              _next_state = S_9;
            end
          else
            begin
              _next_state = S_10;
            end
        end
      S_9 :
        begin
          if (OUT_UNBOUNDED_main_38248_38367 == 1'b0)
            begin
              _next_state = S_9;
            end
          else
            begin
              _next_state = S_10;
            end
        end
      S_10 :
        begin
          selector_IN_UNBOUNDED_main_38248_38368 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          selector_IN_UNBOUNDED_main_38248_38371 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_38248_38371;
          if (OUT_UNBOUNDED_main_38248_38371 == 1'b0)
            begin
              _next_state = S_12;
            end
          else
            begin
              _next_state = S_13;
            end
        end
      S_12 :
        begin
          wrenable_reg_0 = OUT_UNBOUNDED_main_38248_38371;
          if (OUT_UNBOUNDED_main_38248_38371 == 1'b0)
            begin
              _next_state = S_12;
            end
          else
            begin
              _next_state = S_13;
            end
        end
      S_13 :
        begin
          if (OUT_CONDITION_main_38248_38372 == 1'b1)
            begin
              _next_state = S_21;
            end
          else
            begin
              _next_state = S_19;
            end
        end
      S_19 :
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
              _next_state = S_20;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_20 :
        begin
          selector_MUX_13___assert_fail_64_i0_0_0_0 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_0_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_0_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38456 == 1'b0)
            begin
              _next_state = S_20;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_21 :
        begin
          selector_IN_UNBOUNDED_main_38248_38447 = 1'b1;
          selector_MUX_82_reg_21_0_0_0 = 1'b1;
          wrenable_reg_20 = OUT_UNBOUNDED_main_38248_38447;
          wrenable_reg_21 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38447 == 1'b0)
            begin
              _next_state = S_22;
              selector_MUX_82_reg_21_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
          else
            begin
              _next_state = S_24;
            end
        end
      S_22 :
        begin
          selector_MUX_82_reg_21_0_0_0 = 1'b1;
          wrenable_reg_20 = OUT_UNBOUNDED_main_38248_38447;
          wrenable_reg_21 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38447 == 1'b0)
            begin
              _next_state = S_22;
              selector_MUX_82_reg_21_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
          else
            begin
              _next_state = S_24;
            end
        end
      S_24 :
        begin
          selector_IN_UNBOUNDED_main_38248_38485 = 1'b1;
          selector_MUX_63_read_66_i0_0_0_0 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38485;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38485 == 1'b0)
            begin
              _next_state = S_25;
            end
          else
            begin
              _next_state = S_26;
            end
        end
      S_25 :
        begin
          selector_MUX_63_read_66_i0_0_0_0 = 1'b1;
          selector_MUX_64_read_66_i0_1_0_0 = 1'b1;
          selector_MUX_64_read_66_i0_1_1_0 = 1'b1;
          selector_MUX_65_read_66_i0_2_0_0 = 1'b1;
          selector_MUX_65_read_66_i0_2_1_0 = 1'b1;
          wrenable_reg_17 = OUT_UNBOUNDED_main_38248_38485;
          if (OUT_UNBOUNDED_main_38248_38485 == 1'b0)
            begin
              _next_state = S_25;
            end
          else
            begin
              _next_state = S_26;
            end
        end
      S_26 :
        begin
          wrenable_reg_21 = 1'b1;
          casez (OUT_MULTIIF_main_38248_41425)
            2'b?1 :
              begin
                _next_state = S_27;
                wrenable_reg_21 = 1'b0;
              end
            2'b10 :
              begin
                _next_state = S_24;
              end
            default:
              begin
                _next_state = S_23;
                wrenable_reg_21 = 1'b0;
              end
          endcase
        end
      S_23 :
        begin
          selector_IN_UNBOUNDED_main_38248_38481 = 1'b1;
          selector_MUX_0_CLOSE_54_i0_0_0_0 = 1'b1;
          _next_state = S_0;
          done_port = 1'b1;
        end
      S_27 :
        begin
          selector_IN_UNBOUNDED_main_38248_38515 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_0_1 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_1 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38515 == 1'b0)
            begin
              _next_state = S_28;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_28 :
        begin
          selector_MUX_13___assert_fail_64_i0_0_0_1 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_1_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_1 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38515 == 1'b0)
            begin
              _next_state = S_28;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_17 :
        begin
          selector_IN_UNBOUNDED_main_38248_38415 = 1'b1;
          selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_0_1 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38415 == 1'b0)
            begin
              _next_state = S_18;
            end
          else
            begin
              _next_state = S_0;
              done_port = 1'b1;
            end
        end
      S_18 :
        begin
          selector_MUX_13___assert_fail_64_i0_0_1_0 = 1'b1;
          selector_MUX_14___assert_fail_64_i0_1_1_0 = 1'b1;
          selector_MUX_15___assert_fail_64_i0_2_0_1 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_0_0 = 1'b1;
          selector_MUX_16___assert_fail_64_i0_3_1_0 = 1'b1;
          if (OUT_UNBOUNDED_main_38248_38415 == 1'b0)
            begin
              _next_state = S_18;
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
  wire [1:0] OUT_MULTIIF_main_38248_41418;
  wire [1:0] OUT_MULTIIF_main_38248_41425;
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
    .OUT_MULTIIF_main_38248_41418(OUT_MULTIIF_main_38248_41418),
    .OUT_MULTIIF_main_38248_41425(OUT_MULTIIF_main_38248_41425),
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
    .MEM_var_38857_74(7340032),
    .MEM_var_38859_38248(2097152),
    .MEM_var_38861_38248(2621440),
    .MEM_var_38863_38248(3145728),
    .MEM_var_38865_38248(3670016),
    .MEM_var_38867_38248(4194304),
    .MEM_var_38869_38248(4718592),
    .MEM_var_38871_38248(5242880),
    .MEM_var_38873_38248(5767168),
    .MEM_var_38875_38248(6291456),
    .MEM_var_38877_38248(6815744),
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
    .OUT_MULTIIF_main_38248_41418(OUT_MULTIIF_main_38248_41418),
    .OUT_MULTIIF_main_38248_41425(OUT_MULTIIF_main_38248_41425),
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




// End of: /home/ubuntu/stencil.v
////////////////////////////////////////////////////////////////
