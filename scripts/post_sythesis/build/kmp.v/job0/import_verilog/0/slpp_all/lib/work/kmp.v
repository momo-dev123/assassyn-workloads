// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2025-03-27T22:06:57
// /tmp/.mount_bambu-JbeVuM/usr/bin/bambu executed with: /tmp/.mount_bambu-JbeVuM/usr/bin/bambu -I./common --top-fname=main --simulator=VERILATOR --file-input-data=./kmp/input.data,./kmp/check.data --simulate -s --top-rtldesign-name=run_benchmark --no-iob --hls-div --benchmark-name=kmp -DBAMBU_PROFILING -DNO_FINAL_MEMCMP_CHECK ./kmp/kmp.c ./common/harness.c 
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
  parameter MEM_var_39032_74=7340032;
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
  wire [7:0] null_out_signal_array_39032_0_out1_0;
  wire [7:0] null_out_signal_array_39032_0_out1_1;
  wire [31:0] null_out_signal_array_39032_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39032_0_proxy_out1_1;
  wire [31:0] out_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  wire [22:0] out_addr_expr_FU_3_i0_fu___assert_fail_74_39055;
  wire [22:0] out_const_0;
  wire [7:0] out_conv_in_port___line_32_8;
  wire [31:0] out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39055_23_32;
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
    .in2(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39055_23_32));
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
    .MEMORY_INIT_file_a("array_ref_39032.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39032.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_39032_74),
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
    .PORTSIZE_proxy_out1(2)) array_39032_0 (.out1({null_out_signal_array_39032_0_out1_1,
      null_out_signal_array_39032_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_0),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_0),
    .proxy_out1({null_out_signal_array_39032_0_proxy_out1_1,
      null_out_signal_array_39032_0_proxy_out1_0}),
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
    .value(MEM_var_39032_74)) const_0 (.out1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_in_port___line_32_8 (.out1(out_conv_in_port___line_32_8),
    .in1(in_port___line));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39055_23_32 (.out1(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_39055_23_32),
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_39055));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_0_23_32 (.out1(out_conv_out_const_0_23_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_0_reg_0_23_32 (.out1(out_conv_out_reg_0_reg_0_23_32),
    .in1(out_reg_0_reg_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___assert_fail_74_39055 (.out1(out_addr_expr_FU_3_i0_fu___assert_fail_74_39055),
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
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_39055),
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
  parameter MEM_var_39032_74=7340032;
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
  datapath___assert_fail #(.MEM_var_39032_74(MEM_var_39032_74)) Datapath_i (.Sout_Rdata_ram(Sout_Rdata_ram),
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
  wire [22:0] out_UUdata_converter_FU_17_i0_fu___internal_free_737_39112;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_free_737_39105;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_free_737_39084;
  wire [22:0] out_UUdata_converter_FU_20_i0_fu___internal_free_737_39070;
  wire [22:0] out_UUdata_converter_FU_23_i0_fu___internal_free_737_39194;
  wire [22:0] out_UUdata_converter_FU_24_i0_fu___internal_free_737_39173;
  wire [22:0] out_UUdata_converter_FU_25_i0_fu___internal_free_737_39216;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_free_737_39187;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_free_737_39276;
  wire [22:0] out_UUdata_converter_FU_28_i0_fu___internal_free_737_39258;
  wire [22:0] out_UUdata_converter_FU_29_i0_fu___internal_free_737_39308;
  wire [22:0] out_UUdata_converter_FU_30_i0_fu___internal_free_737_39301;
  wire [22:0] out_UUdata_converter_FU_31_i0_fu___internal_free_737_39338;
  wire [22:0] out_UUdata_converter_FU_32_i0_fu___internal_free_737_39331;
  wire [22:0] out_UUdata_converter_FU_4_i0_fu___internal_free_737_39143;
  wire [22:0] out_UUdata_converter_FU_5_i0_fu___internal_free_737_39135;
  wire [22:0] out_UUdata_converter_FU_6_i0_fu___internal_free_737_39205;
  wire [22:0] out_UUdata_converter_FU_7_i0_fu___internal_free_737_39180;
  wire [22:0] out_UUdata_converter_FU_8_i0_fu___internal_free_737_39265;
  wire [22:0] out_UUdata_converter_FU_9_i0_fu___internal_free_737_39251;
  wire [19:0] out_addr_expr_FU_10_i0_fu___internal_free_737_39327;
  wire [19:0] out_addr_expr_FU_3_i0_fu___internal_free_737_39059;
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
  wire out_lut_expr_FU_14_i0_fu___internal_free_737_42098;
  wire out_lut_expr_FU_39_i0_fu___internal_free_737_42100;
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
  wire out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39956;
  wire out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39966;
  wire out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39968;
  wire out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39958;
  wire out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39962;
  wire out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39964;
  wire out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39970;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868;
  wire out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39960;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_39139;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39176;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39183;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39261;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39304;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_39156;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39233;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39288;
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
    .BITSIZE_out1(20)) fu___internal_free_737_39059 (.out1(out_addr_expr_FU_3_i0_fu___internal_free_737_39059),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39070 (.out1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_39070),
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_39084));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39084 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_39084),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39105 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_39105),
    .in1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_39112));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39112 (.out1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_39112),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39135 (.out1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_39135),
    .in1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_39143));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39139 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_39139),
    .in1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_39135),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39143 (.out1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_39143),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_39156));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39156 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_39156),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39173 (.out1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_39173),
    .in1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39194));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39176 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39176),
    .in1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_39173),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39180 (.out1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39180),
    .in1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39205));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39183 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39183),
    .in1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39180),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39187 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39187),
    .in1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39216));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39194 (.out1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39194),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39205 (.out1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39205),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39233));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39216 (.out1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39216),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39233 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39233),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39251 (.out1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39251),
    .in1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39265));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39258 (.out1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39258),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39276));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39261 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39261),
    .in1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39258),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39265 (.out1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39265),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39288));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39276 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39276),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39288 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39288),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39301 (.out1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39301),
    .in1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39308));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39304 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39304),
    .in1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39301),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39308 (.out1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39308),
    .in1(out_reg_6_reg_6));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_free_737_39327 (.out1(out_addr_expr_FU_10_i0_fu___internal_free_737_39327),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39331 (.out1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39331),
    .in1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39338));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39338 (.out1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39338),
    .in1(out_reg_6_reg_6));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_free_737_39956 (.out1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39956),
    .in1(in_port_ap),
    .in2(out_const_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39958 (.out1(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39958),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39960 (.out1(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39960),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39962 (.out1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39962),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39964 (.out1(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39964),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39966 (.out1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39966),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824),
    .in2(out_reg_9_reg_9));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39968 (.out1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39968),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39970 (.out1(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39970),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_42098 (.out1(out_lut_expr_FU_14_i0_fu___internal_free_737_42098),
    .in1(out_const_4),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39958),
    .in3(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39960),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_42100 (.out1(out_lut_expr_FU_39_i0_fu___internal_free_737_42100),
    .in1(out_const_6),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39964),
    .in3(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39970),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_774 (.out1(out_read_cond_FU_11_i0_fu___internal_free_737_774),
    .in1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39956));
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
    .in1(out_lut_expr_FU_14_i0_fu___internal_free_737_42098));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_848 (.out1(out_read_cond_FU_21_i0_fu___internal_free_737_848),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39962));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_854 (.out1(out_read_cond_FU_33_i0_fu___internal_free_737_854),
    .in1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39966));
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
    .in1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39968));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___internal_free_737_886 (.out1(out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886),
    .in1(out_reg_16_reg_16),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_909 (.out1(out_read_cond_FU_40_i0_fu___internal_free_737_909),
    .in1(out_lut_expr_FU_39_i0_fu___internal_free_737_42100));
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
    .in1(out_addr_expr_FU_3_i0_fu___internal_free_737_39059),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39261),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39304),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39331),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39176),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39187),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_39139),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39183),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39251),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_10_i0_fu___internal_free_737_39327),
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
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_39105),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_39070),
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
  wire [19:0] out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39445;
  wire [19:0] out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39429;
  wire [19:0] out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39456;
  wire [19:0] out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39438;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39385;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39371;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39396;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39378;
  wire [22:0] out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39550;
  wire [22:0] out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39536;
  wire [22:0] out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39497;
  wire [22:0] out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39483;
  wire [22:0] out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39508;
  wire [22:0] out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39490;
  wire [22:0] out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39561;
  wire [22:0] out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39543;
  wire [22:0] out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39649;
  wire [22:0] out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39635;
  wire [20:0] out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39612;
  wire [20:0] out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39605;
  wire [22:0] out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39660;
  wire [22:0] out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39642;
  wire [22:0] out_addr_expr_FU_12_i0_fu___internal_malloc_738_39435;
  wire [19:0] out_addr_expr_FU_13_i0_fu___internal_malloc_738_39471;
  wire [22:0] out_addr_expr_FU_16_i0_fu___internal_malloc_738_39353;
  wire [22:0] out_addr_expr_FU_17_i0_fu___internal_malloc_738_39356;
  wire [19:0] out_addr_expr_FU_20_i0_fu___internal_malloc_738_39589;
  wire [22:0] out_addr_expr_FU_21_i0_fu___internal_malloc_738_39594;
  wire [19:0] out_addr_expr_FU_22_i0_fu___internal_malloc_738_39601;
  wire [19:0] out_addr_expr_FU_23_i0_fu___internal_malloc_738_39580;
  wire [19:0] out_addr_expr_FU_6_i0_fu___internal_malloc_738_39359;
  wire [19:0] out_addr_expr_FU_7_i0_fu___internal_malloc_738_39415;
  wire [22:0] out_addr_expr_FU_8_i0_fu___internal_malloc_738_39426;
  wire [19:0] out_addr_expr_FU_9_i0_fu___internal_malloc_738_39467;
  wire out_const_0;
  wire [31:0] out_const_1;
  wire [2:0] out_const_10;
  wire [11:0] out_const_11;
  wire [19:0] out_const_12;
  wire [22:0] out_const_13;
  wire [19:0] out_const_14;
  wire [31:0] out_const_2;
  wire [6:0] out_const_3;
  wire out_const_4;
  wire [2:0] out_const_5;
  wire [3:0] out_const_6;
  wire [22:0] out_const_7;
  wire [1:0] out_const_8;
  wire [18:0] out_const_9;
  wire [31:0] out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39353_23_32;
  wire [31:0] out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39356_23_32;
  wire [22:0] out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39359_20_23;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [31:0] out_conv_out_const_12_20_32;
  wire [31:0] out_conv_out_const_13_23_32;
  wire [31:0] out_conv_out_const_14_20_32;
  wire [5:0] out_conv_out_const_3_7_6;
  wire [31:0] out_conv_out_const_7_23_32;
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
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_40221;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063;
  wire out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_39976;
  wire out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_39972;
  wire out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_39980;
  wire out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_39974;
  wire out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_39984;
  wire out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_39982;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_101_i0_fu___internal_malloc_738_1129;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_40217;
  wire [31:0] out_ui_minus_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_1121;
  wire [28:0] out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_40214;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_1079;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_1139;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39381;
  wire [19:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39441;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_39539;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_39546;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_39608;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_39645;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_40210;
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
    .in2(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39356_23_32));
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
    .in1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39359_20_23),
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
    .in2(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39353_23_32));
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
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(12),
    .value(12'b111111010111)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_792_38248)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_796_38248)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_992_38248)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b00000000000000000000111111010111)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_1020_38248)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(19),
    .value(19'b1100000000000000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39353_23_32 (.out1(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39353_23_32),
    .in1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39353));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39356_23_32 (.out1(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39356_23_32),
    .in1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39356));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39359_20_23 (.out1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39359_20_23),
    .in1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39359));
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
    .BITSIZE_out1(32)) conv_out_const_7_23_32 (.out1(out_conv_out_const_7_23_32),
    .in1(out_const_7));
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
    .in1(out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_40217),
    .in2(out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_40221),
    .in3(out_const_8));
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
    .in2(out_const_11));
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
    .in2(out_const_8));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1139 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_1139),
    .in1(out_reg_21_reg_21),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1150 (.out1(out_read_cond_FU_73_i0_fu___internal_malloc_738_1150),
    .in1(out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_39980));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1152 (.out1(out_read_cond_FU_77_i0_fu___internal_malloc_738_1152),
    .in1(out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_39982));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1155 (.out1(out_read_cond_FU_92_i0_fu___internal_malloc_738_1155),
    .in1(out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_39984));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39353 (.out1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39353),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39356 (.out1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39356),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39359 (.out1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39359),
    .in1(out_conv_out_const_12_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39371 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39371),
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39385));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39378 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39378),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39396));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39381 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39381),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39378),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39385 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39385),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39396 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39396),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39415 (.out1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39415),
    .in1(out_conv_out_const_12_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39426 (.out1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39426),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39429 (.out1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39429),
    .in1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39445));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39435 (.out1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39435),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39438 (.out1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39438),
    .in1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39456));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(3),
    .BITSIZE_out1(20),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39441 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39441),
    .in1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39438),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39445 (.out1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39445),
    .in1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39467));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39456 (.out1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39456),
    .in1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39471));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39467 (.out1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39467),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39471 (.out1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39471),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39483 (.out1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39483),
    .in1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39497));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39490 (.out1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39490),
    .in1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39508));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39497 (.out1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39497),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39508 (.out1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39508),
    .in1(out_reg_0_reg_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39536 (.out1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39536),
    .in1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39550));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39539 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_39539),
    .in1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39536),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39543 (.out1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39543),
    .in1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39561));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39546 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_39546),
    .in1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39543),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39550 (.out1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39550),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39561 (.out1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39561),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39580 (.out1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_39580),
    .in1(out_conv_out_const_12_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39589 (.out1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_39589),
    .in1(out_conv_out_const_14_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39594 (.out1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_39594),
    .in1(out_conv_out_const_7_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39601 (.out1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_39601),
    .in1(out_conv_out_const_14_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_39605 (.out1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39605),
    .in1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39612));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39608 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_39608),
    .in1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39605),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_39612 (.out1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39612),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39635 (.out1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39635),
    .in1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39649));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39642 (.out1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39642),
    .in1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39660));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39645 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_39645),
    .in1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39642),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39649 (.out1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39649),
    .in1(out_reg_15_reg_15));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39660 (.out1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39660),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39972 (.out1(out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_39972),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39974 (.out1(out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_39974),
    .in1(out_const_11),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39976 (.out1(out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_39976),
    .in1(out_const_11),
    .in2(out_reg_22_reg_22));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39980 (.out1(out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_39980),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_15_reg_15));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(19),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39982 (.out1(out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_39982),
    .in1(out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063),
    .in2(out_const_9));
  ui_le_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39984 (.out1(out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_39984),
    .in1(out_const_11),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu___internal_malloc_738_40210 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_40210),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_8));
  ui_plus_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu___internal_malloc_738_40214 (.out1(out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_40214),
    .in1(out_const_11),
    .in2(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_40210));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_40217 (.out1(out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_40217),
    .in1(out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_40214),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___internal_malloc_738_40221 (.out1(out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_40221),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_10));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_921 (.out1(out_read_cond_FU_25_i0_fu___internal_malloc_738_921),
    .in1(out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_39972));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_951 (.out1(out_read_cond_FU_28_i0_fu___internal_malloc_738_951),
    .in1(out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_39974));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_975 (.out1(out_read_cond_FU_48_i0_fu___internal_malloc_738_975),
    .in1(out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_39976));
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
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39371),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39415),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39426),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39429),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39435),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39441),
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
    .in1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39635),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_39608),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_39580),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_39645),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_39539),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_39546),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39483),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39490),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_39589),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_39594),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_39601),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39381),
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
  wire [22:0] out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39887;
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
  wire [31:0] out_UUdata_converter_FU_20_i0_fu_read_2208_39894;
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
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40280;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40305;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40325;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40348;
  wire out_lut_expr_FU_18_i0_fu_read_2208_40033;
  wire signed [31:0] out_plus_expr_FU_32_0_32_61_i0_fu_read_2208_2450;
  wire signed [30:0] out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40345;
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
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40272;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40300;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40320;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40343;
  wire [0:0] out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7;
  wire [31:0] out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_8;
  wire [31:0] out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_9;
  wire out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_41585;
  wire out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_41589;
  wire out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_41593;
  wire out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_41597;
  wire out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_41601;
  wire out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_41629;
  wire out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_41633;
  wire out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_41521;
  wire out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_40031;
  wire out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_40041;
  wire out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_40043;
  wire out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_40045;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40268;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40339;
  wire [30:0] out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40335;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40265;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i0_fu_read_2208_2286;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i1_fu_read_2208_2313;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i2_fu_read_2208_2337;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i3_fu_read_2208_2459;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39890;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40261;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40333;
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
    .in1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_40031));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2250 (.out1(out_IUdata_converter_FU_2_i0_fu_read_2208_2250),
    .in1(in_port_fd));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2257 (.out1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in1(out_reg_1_reg_1));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2259 (.out1(out_UIdata_converter_FU_12_i0_fu_read_2208_2259),
    .in1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40268));
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
    .in1(out_lut_expr_FU_18_i0_fu_read_2208_40033));
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
    .in1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40280),
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
    .in1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40305),
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
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_41601));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2403 (.out1(out_read_cond_FU_35_i0_fu_read_2208_2403),
    .in1(out_reg_25_reg_25));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2409 (.out1(out_read_cond_FU_36_i0_fu_read_2208_2409),
    .in1(out_reg_26_reg_26));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_read_2208_2414 (.out1(out_bit_ior_concat_expr_FU_59_i0_fu_read_2208_2414),
    .in1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40325),
    .in2(out_const_7),
    .in3(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2418 (.out1(out_IUdata_converter_FU_21_i0_fu_read_2208_2418),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40348));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2419 (.out1(out_read_cond_FU_37_i0_fu_read_2208_2419),
    .in1(out_reg_5_reg_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2425 (.out1(out_IUdata_converter_FU_38_i0_fu_read_2208_2425),
    .in1(out_reg_1_reg_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2433 (.out1(out_read_cond_FU_42_i0_fu_read_2208_2433),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_40043));
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
    .in1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_41521));
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
    .BITSIZE_out1(23)) fu_read_2208_39887 (.out1(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39887),
    .in1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40339));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_39890 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39890),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39887));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_39894 (.out1(out_UUdata_converter_FU_20_i0_fu_read_2208_39894),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_read_2208_40031 (.out1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_40031),
    .in1(in_port_count),
    .in2(out_const_10));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_read_2208_40033 (.out1(out_lut_expr_FU_18_i0_fu_read_2208_40033),
    .in1(out_const_16),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_41585),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_41589),
    .in4(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_41593),
    .in5(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_41597),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_40041 (.out1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_40041),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_21_i0_fu_read_2208_2418));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_40043 (.out1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_40043),
    .in1(in_port_count),
    .in2(out_reg_7_reg_7));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_40045 (.out1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_40045),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_51_i0_fu_read_2208_2466));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40261 (.out1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40261),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_read_2208_40265 (.out1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40265),
    .in1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_40261),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40268 (.out1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_40268),
    .in1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_40265),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40272 (.out1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40272),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40280 (.out1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_40280),
    .in1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_40272),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40300 (.out1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40300),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40305 (.out1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_40305),
    .in1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_40300),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40320 (.out1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40320),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40325 (.out1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_40325),
    .in1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_40320),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(64)) fu_read_2208_40333 (.out1(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40333),
    .in1(out_UUdata_converter_FU_20_i0_fu_read_2208_39894),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(31)) fu_read_2208_40335 (.out1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40335),
    .in1(out_const_17),
    .in2(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_40333));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu_read_2208_40339 (.out1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_40339),
    .in1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_40335),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_40343 (.out1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40343),
    .in1(out_reg_1_reg_1),
    .in2(out_const_2));
  plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31)) fu_read_2208_40345 (.out1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40345),
    .in1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_40343),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_40348 (.out1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40348),
    .in1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_40345),
    .in2(out_const_2));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4)) fu_read_2208_41521 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_41521),
    .in1(out_BAMBU_READC_55_i0_fu_read_2208_2445),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41585 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_41585),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41589 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_41589),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41593 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_41593),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41597 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_41597),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41601 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_41601),
    .in1(out_reg_14_reg_14),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41629 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_41629),
    .in1(out_reg_14_reg_14),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_41633 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_41633),
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
    .in1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_40045),
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
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_41629),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_41633),
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
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39890),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_40041),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_40348),
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
  #~@buf#~@,
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
  input [31:0] #~@buf#~@;
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
    .in_port_buf(#~@buf#~@),
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
// Copyright (C) 2020-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >>> in2)&1;
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

// Datapath RTL description for kmp
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_kmp(clock,
  reset,
  in_port_pattern,
  in_port_input,
  in_port_kmpNext,
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
  fuselector_BMEMORY_CTRLN_335_i0_LOAD,
  fuselector_BMEMORY_CTRLN_335_i0_STORE,
  fuselector_BMEMORY_CTRLN_335_i1_LOAD,
  fuselector_BMEMORY_CTRLN_335_i1_STORE,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0,
  selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0,
  selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0,
  selector_MUX_840_reg_0_0_0_0,
  selector_MUX_840_reg_0_0_0_1,
  selector_MUX_841_reg_1_0_0_0,
  selector_MUX_852_reg_2_0_0_0,
  selector_MUX_854_reg_21_0_0_0,
  selector_MUX_858_reg_25_0_0_0,
  selector_MUX_858_reg_25_0_0_1,
  selector_MUX_861_reg_28_0_0_0,
  selector_MUX_861_reg_28_0_0_1,
  selector_MUX_862_reg_29_0_0_0,
  selector_MUX_863_reg_3_0_0_0,
  selector_MUX_868_reg_34_0_0_0,
  selector_MUX_868_reg_34_0_0_1,
  selector_MUX_871_reg_37_0_0_0,
  selector_MUX_890_reg_54_0_0_0,
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
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_kmp_38537_38738,
  OUT_CONDITION_kmp_38537_38822,
  OUT_CONDITION_kmp_38537_38824,
  OUT_CONDITION_kmp_38537_38829,
  OUT_CONDITION_kmp_38537_38896,
  OUT_CONDITION_kmp_38537_38900,
  OUT_CONDITION_kmp_38537_38926,
  OUT_CONDITION_kmp_38537_38937,
  OUT_CONDITION_kmp_38537_38946,
  OUT_CONDITION_kmp_38537_38956,
  OUT_CONDITION_kmp_38537_38969,
  OUT_MULTIIF_kmp_38537_40355);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_pattern;
  input [31:0] in_port_input;
  input [31:0] in_port_kmpNext;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_335_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_335_i0_STORE;
  input fuselector_BMEMORY_CTRLN_335_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_335_i1_STORE;
  input selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0;
  input selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1;
  input selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2;
  input selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3;
  input selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0;
  input selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1;
  input selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0;
  input selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0;
  input selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0;
  input selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1;
  input selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2;
  input selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3;
  input selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0;
  input selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1;
  input selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0;
  input selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0;
  input selector_MUX_840_reg_0_0_0_0;
  input selector_MUX_840_reg_0_0_0_1;
  input selector_MUX_841_reg_1_0_0_0;
  input selector_MUX_852_reg_2_0_0_0;
  input selector_MUX_854_reg_21_0_0_0;
  input selector_MUX_858_reg_25_0_0_0;
  input selector_MUX_858_reg_25_0_0_1;
  input selector_MUX_861_reg_28_0_0_0;
  input selector_MUX_861_reg_28_0_0_1;
  input selector_MUX_862_reg_29_0_0_0;
  input selector_MUX_863_reg_3_0_0_0;
  input selector_MUX_868_reg_34_0_0_0;
  input selector_MUX_868_reg_34_0_0_1;
  input selector_MUX_871_reg_37_0_0_0;
  input selector_MUX_890_reg_54_0_0_0;
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
  output OUT_CONDITION_kmp_38537_38738;
  output OUT_CONDITION_kmp_38537_38822;
  output OUT_CONDITION_kmp_38537_38824;
  output OUT_CONDITION_kmp_38537_38829;
  output OUT_CONDITION_kmp_38537_38896;
  output OUT_CONDITION_kmp_38537_38900;
  output OUT_CONDITION_kmp_38537_38926;
  output OUT_CONDITION_kmp_38537_38937;
  output OUT_CONDITION_kmp_38537_38946;
  output OUT_CONDITION_kmp_38537_38956;
  output OUT_CONDITION_kmp_38537_38969;
  output [1:0] OUT_MULTIIF_kmp_38537_40355;
  // Component and signal declarations
  wire [31:0] out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0;
  wire [31:0] out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0;
  wire [22:0] out_IUdata_converter_FU_119_i0_fu_kmp_38537_38789;
  wire [22:0] out_IUdata_converter_FU_215_i0_fu_kmp_38537_38871;
  wire [20:0] out_IUdata_converter_FU_232_i0_fu_kmp_38537_38888;
  wire [22:0] out_IUdata_converter_FU_279_i0_fu_kmp_38537_38844;
  wire [22:0] out_IUdata_converter_FU_313_i0_fu_kmp_38537_38966;
  wire [22:0] out_IUdata_converter_FU_82_i0_fu_kmp_38537_38826;
  wire [22:0] out_IUdata_converter_FU_83_i0_fu_kmp_38537_38805;
  wire [22:0] out_IUdata_converter_FU_86_i0_fu_kmp_38537_38797;
  wire [22:0] out_IUdata_converter_FU_87_i0_fu_kmp_38537_38816;
  wire [22:0] out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0;
  wire [22:0] out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1;
  wire [22:0] out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2;
  wire [22:0] out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3;
  wire [22:0] out_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0;
  wire [22:0] out_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1;
  wire [6:0] out_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0;
  wire [31:0] out_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1;
  wire [22:0] out_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0;
  wire [6:0] out_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0;
  wire [31:0] out_MUX_840_reg_0_0_0_0;
  wire [31:0] out_MUX_840_reg_0_0_0_1;
  wire [31:0] out_MUX_841_reg_1_0_0_0;
  wire [31:0] out_MUX_852_reg_2_0_0_0;
  wire [31:0] out_MUX_854_reg_21_0_0_0;
  wire [22:0] out_MUX_858_reg_25_0_0_0;
  wire [22:0] out_MUX_858_reg_25_0_0_1;
  wire [31:0] out_MUX_861_reg_28_0_0_0;
  wire [31:0] out_MUX_861_reg_28_0_0_1;
  wire [31:0] out_MUX_862_reg_29_0_0_0;
  wire [31:0] out_MUX_863_reg_3_0_0_0;
  wire [22:0] out_MUX_868_reg_34_0_0_0;
  wire [22:0] out_MUX_868_reg_34_0_0_1;
  wire [7:0] out_MUX_871_reg_37_0_0_0;
  wire [31:0] out_MUX_890_reg_54_0_0_0;
  wire [22:0] out_UUdata_converter_FU_280_i0_fu_kmp_38537_38911;
  wire [22:0] out_UUdata_converter_FU_281_i0_fu_kmp_38537_38948;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_kmp_38537_38721;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_kmp_38537_38919;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_kmp_38537_38940;
  wire [22:0] out_UUdata_converter_FU_84_i0_fu_kmp_38537_38767;
  wire [22:0] out_UUdata_converter_FU_85_i0_fu_kmp_38537_38760;
  wire [22:0] out_UUdata_converter_FU_88_i0_fu_kmp_38537_38819;
  wire out_const_0;
  wire [31:0] out_const_1;
  wire [3:0] out_const_10;
  wire [4:0] out_const_11;
  wire [32:0] out_const_12;
  wire [15:0] out_const_13;
  wire [31:0] out_const_14;
  wire [63:0] out_const_15;
  wire [4:0] out_const_16;
  wire [3:0] out_const_17;
  wire [4:0] out_const_18;
  wire [4:0] out_const_19;
  wire [1:0] out_const_2;
  wire [2:0] out_const_20;
  wire [3:0] out_const_21;
  wire [4:0] out_const_22;
  wire [4:0] out_const_23;
  wire [3:0] out_const_24;
  wire [4:0] out_const_25;
  wire [4:0] out_const_26;
  wire [1:0] out_const_27;
  wire [2:0] out_const_28;
  wire [3:0] out_const_29;
  wire [3:0] out_const_3;
  wire [4:0] out_const_30;
  wire [4:0] out_const_31;
  wire [3:0] out_const_32;
  wire [4:0] out_const_33;
  wire [4:0] out_const_34;
  wire [2:0] out_const_35;
  wire [3:0] out_const_36;
  wire [4:0] out_const_37;
  wire [4:0] out_const_38;
  wire [3:0] out_const_39;
  wire [4:0] out_const_4;
  wire [4:0] out_const_40;
  wire [62:0] out_const_41;
  wire [4:0] out_const_42;
  wire [14:0] out_const_43;
  wire [29:0] out_const_44;
  wire [6:0] out_const_5;
  wire [2:0] out_const_6;
  wire out_const_7;
  wire [1:0] out_const_8;
  wire [2:0] out_const_9;
  wire [22:0] out_conv_in_port_kmpNext_32_23;
  wire [22:0] out_conv_in_port_pattern_32_23;
  wire [7:0] out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_32_8;
  wire signed [7:0] out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8;
  wire [7:0] out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_32_8;
  wire signed [7:0] out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8;
  wire [5:0] out_conv_out_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0_7_6;
  wire [5:0] out_conv_out_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0_7_6;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [6:0] out_conv_out_const_4_5_7;
  wire [31:0] out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_2_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_1_32;
  wire [20:0] out_conv_out_reg_34_reg_34_23_21;
  wire out_extract_bit_expr_FU_100_i0_fu_kmp_38537_40607;
  wire out_extract_bit_expr_FU_101_i0_fu_kmp_38537_40610;
  wire out_extract_bit_expr_FU_102_i0_fu_kmp_38537_40613;
  wire out_extract_bit_expr_FU_103_i0_fu_kmp_38537_40616;
  wire out_extract_bit_expr_FU_105_i0_fu_kmp_38537_40623;
  wire out_extract_bit_expr_FU_106_i0_fu_kmp_38537_40626;
  wire out_extract_bit_expr_FU_107_i0_fu_kmp_38537_40629;
  wire out_extract_bit_expr_FU_108_i0_fu_kmp_38537_40632;
  wire out_extract_bit_expr_FU_110_i0_fu_kmp_38537_40757;
  wire out_extract_bit_expr_FU_111_i0_fu_kmp_38537_40760;
  wire out_extract_bit_expr_FU_112_i0_fu_kmp_38537_40772;
  wire out_extract_bit_expr_FU_113_i0_fu_kmp_38537_40775;
  wire out_extract_bit_expr_FU_114_i0_fu_kmp_38537_40787;
  wire out_extract_bit_expr_FU_115_i0_fu_kmp_38537_40790;
  wire out_extract_bit_expr_FU_116_i0_fu_kmp_38537_40802;
  wire out_extract_bit_expr_FU_117_i0_fu_kmp_38537_40805;
  wire out_extract_bit_expr_FU_120_i0_fu_kmp_38537_40636;
  wire out_extract_bit_expr_FU_121_i0_fu_kmp_38537_40639;
  wire out_extract_bit_expr_FU_122_i0_fu_kmp_38537_40642;
  wire out_extract_bit_expr_FU_123_i0_fu_kmp_38537_40645;
  wire out_extract_bit_expr_FU_124_i0_fu_kmp_38537_40648;
  wire out_extract_bit_expr_FU_125_i0_fu_kmp_38537_40651;
  wire out_extract_bit_expr_FU_127_i0_fu_kmp_38537_40657;
  wire out_extract_bit_expr_FU_128_i0_fu_kmp_38537_40660;
  wire out_extract_bit_expr_FU_129_i0_fu_kmp_38537_40663;
  wire out_extract_bit_expr_FU_12_i0_fu_kmp_38537_40371;
  wire out_extract_bit_expr_FU_130_i0_fu_kmp_38537_40666;
  wire out_extract_bit_expr_FU_131_i0_fu_kmp_38537_40669;
  wire out_extract_bit_expr_FU_133_i0_fu_kmp_38537_40675;
  wire out_extract_bit_expr_FU_134_i0_fu_kmp_38537_40678;
  wire out_extract_bit_expr_FU_135_i0_fu_kmp_38537_40681;
  wire out_extract_bit_expr_FU_136_i0_fu_kmp_38537_40684;
  wire out_extract_bit_expr_FU_137_i0_fu_kmp_38537_40687;
  wire out_extract_bit_expr_FU_139_i0_fu_kmp_38537_40693;
  wire out_extract_bit_expr_FU_13_i0_fu_kmp_38537_40374;
  wire out_extract_bit_expr_FU_140_i0_fu_kmp_38537_40696;
  wire out_extract_bit_expr_FU_141_i0_fu_kmp_38537_40699;
  wire out_extract_bit_expr_FU_142_i0_fu_kmp_38537_40702;
  wire out_extract_bit_expr_FU_143_i0_fu_kmp_38537_40705;
  wire out_extract_bit_expr_FU_145_i0_fu_kmp_38537_40711;
  wire out_extract_bit_expr_FU_146_i0_fu_kmp_38537_40714;
  wire out_extract_bit_expr_FU_147_i0_fu_kmp_38537_40717;
  wire out_extract_bit_expr_FU_148_i0_fu_kmp_38537_40720;
  wire out_extract_bit_expr_FU_149_i0_fu_kmp_38537_40723;
  wire out_extract_bit_expr_FU_14_i0_fu_kmp_38537_40377;
  wire out_extract_bit_expr_FU_151_i0_fu_kmp_38537_40729;
  wire out_extract_bit_expr_FU_152_i0_fu_kmp_38537_40732;
  wire out_extract_bit_expr_FU_153_i0_fu_kmp_38537_40735;
  wire out_extract_bit_expr_FU_154_i0_fu_kmp_38537_40738;
  wire out_extract_bit_expr_FU_155_i0_fu_kmp_38537_40741;
  wire out_extract_bit_expr_FU_157_i0_fu_kmp_38537_40747;
  wire out_extract_bit_expr_FU_159_i0_fu_kmp_38537_40751;
  wire out_extract_bit_expr_FU_15_i0_fu_kmp_38537_40380;
  wire out_extract_bit_expr_FU_161_i0_fu_kmp_38537_40763;
  wire out_extract_bit_expr_FU_162_i0_fu_kmp_38537_40766;
  wire out_extract_bit_expr_FU_164_i0_fu_kmp_38537_40778;
  wire out_extract_bit_expr_FU_165_i0_fu_kmp_38537_40781;
  wire out_extract_bit_expr_FU_167_i0_fu_kmp_38537_40793;
  wire out_extract_bit_expr_FU_168_i0_fu_kmp_38537_40796;
  wire out_extract_bit_expr_FU_170_i0_fu_kmp_38537_40808;
  wire out_extract_bit_expr_FU_171_i0_fu_kmp_38537_40811;
  wire out_extract_bit_expr_FU_176_i0_fu_kmp_38537_40818;
  wire out_extract_bit_expr_FU_177_i0_fu_kmp_38537_40821;
  wire out_extract_bit_expr_FU_178_i0_fu_kmp_38537_40824;
  wire out_extract_bit_expr_FU_179_i0_fu_kmp_38537_40827;
  wire out_extract_bit_expr_FU_17_i0_fu_kmp_38537_40388;
  wire out_extract_bit_expr_FU_180_i0_fu_kmp_38537_40830;
  wire out_extract_bit_expr_FU_181_i0_fu_kmp_38537_40833;
  wire out_extract_bit_expr_FU_183_i0_fu_kmp_38537_40839;
  wire out_extract_bit_expr_FU_184_i0_fu_kmp_38537_40842;
  wire out_extract_bit_expr_FU_185_i0_fu_kmp_38537_40845;
  wire out_extract_bit_expr_FU_186_i0_fu_kmp_38537_40848;
  wire out_extract_bit_expr_FU_187_i0_fu_kmp_38537_40851;
  wire out_extract_bit_expr_FU_189_i0_fu_kmp_38537_40857;
  wire out_extract_bit_expr_FU_18_i0_fu_kmp_38537_40392;
  wire out_extract_bit_expr_FU_190_i0_fu_kmp_38537_40860;
  wire out_extract_bit_expr_FU_191_i0_fu_kmp_38537_40863;
  wire out_extract_bit_expr_FU_192_i0_fu_kmp_38537_40866;
  wire out_extract_bit_expr_FU_193_i0_fu_kmp_38537_40869;
  wire out_extract_bit_expr_FU_195_i0_fu_kmp_38537_40875;
  wire out_extract_bit_expr_FU_196_i0_fu_kmp_38537_40878;
  wire out_extract_bit_expr_FU_197_i0_fu_kmp_38537_40881;
  wire out_extract_bit_expr_FU_198_i0_fu_kmp_38537_40884;
  wire out_extract_bit_expr_FU_199_i0_fu_kmp_38537_40887;
  wire out_extract_bit_expr_FU_19_i0_fu_kmp_38537_40395;
  wire out_extract_bit_expr_FU_201_i0_fu_kmp_38537_40893;
  wire out_extract_bit_expr_FU_202_i0_fu_kmp_38537_40896;
  wire out_extract_bit_expr_FU_203_i0_fu_kmp_38537_40899;
  wire out_extract_bit_expr_FU_204_i0_fu_kmp_38537_40902;
  wire out_extract_bit_expr_FU_205_i0_fu_kmp_38537_40905;
  wire out_extract_bit_expr_FU_207_i0_fu_kmp_38537_40911;
  wire out_extract_bit_expr_FU_208_i0_fu_kmp_38537_40914;
  wire out_extract_bit_expr_FU_209_i0_fu_kmp_38537_40917;
  wire out_extract_bit_expr_FU_20_i0_fu_kmp_38537_40398;
  wire out_extract_bit_expr_FU_210_i0_fu_kmp_38537_40920;
  wire out_extract_bit_expr_FU_211_i0_fu_kmp_38537_40923;
  wire out_extract_bit_expr_FU_213_i0_fu_kmp_38537_40929;
  wire out_extract_bit_expr_FU_218_i0_fu_kmp_38537_40933;
  wire out_extract_bit_expr_FU_219_i0_fu_kmp_38537_40936;
  wire out_extract_bit_expr_FU_221_i0_fu_kmp_38537_40948;
  wire out_extract_bit_expr_FU_222_i0_fu_kmp_38537_40951;
  wire out_extract_bit_expr_FU_224_i0_fu_kmp_38537_40963;
  wire out_extract_bit_expr_FU_225_i0_fu_kmp_38537_40966;
  wire out_extract_bit_expr_FU_227_i0_fu_kmp_38537_40978;
  wire out_extract_bit_expr_FU_228_i0_fu_kmp_38537_40981;
  wire out_extract_bit_expr_FU_22_i0_fu_kmp_38537_40405;
  wire out_extract_bit_expr_FU_23_i0_fu_kmp_38537_40409;
  wire out_extract_bit_expr_FU_240_i0_fu_kmp_38537_40991;
  wire out_extract_bit_expr_FU_241_i0_fu_kmp_38537_40994;
  wire out_extract_bit_expr_FU_242_i0_fu_kmp_38537_40997;
  wire out_extract_bit_expr_FU_243_i0_fu_kmp_38537_41000;
  wire out_extract_bit_expr_FU_244_i0_fu_kmp_38537_41003;
  wire out_extract_bit_expr_FU_245_i0_fu_kmp_38537_41006;
  wire out_extract_bit_expr_FU_247_i0_fu_kmp_38537_41012;
  wire out_extract_bit_expr_FU_248_i0_fu_kmp_38537_41015;
  wire out_extract_bit_expr_FU_249_i0_fu_kmp_38537_41018;
  wire out_extract_bit_expr_FU_24_i0_fu_kmp_38537_40412;
  wire out_extract_bit_expr_FU_250_i0_fu_kmp_38537_41021;
  wire out_extract_bit_expr_FU_251_i0_fu_kmp_38537_41024;
  wire out_extract_bit_expr_FU_253_i0_fu_kmp_38537_41030;
  wire out_extract_bit_expr_FU_254_i0_fu_kmp_38537_41033;
  wire out_extract_bit_expr_FU_255_i0_fu_kmp_38537_41036;
  wire out_extract_bit_expr_FU_256_i0_fu_kmp_38537_41039;
  wire out_extract_bit_expr_FU_257_i0_fu_kmp_38537_41042;
  wire out_extract_bit_expr_FU_259_i0_fu_kmp_38537_41048;
  wire out_extract_bit_expr_FU_25_i0_fu_kmp_38537_40415;
  wire out_extract_bit_expr_FU_260_i0_fu_kmp_38537_41051;
  wire out_extract_bit_expr_FU_261_i0_fu_kmp_38537_41054;
  wire out_extract_bit_expr_FU_262_i0_fu_kmp_38537_41057;
  wire out_extract_bit_expr_FU_263_i0_fu_kmp_38537_41060;
  wire out_extract_bit_expr_FU_265_i0_fu_kmp_38537_41066;
  wire out_extract_bit_expr_FU_266_i0_fu_kmp_38537_41069;
  wire out_extract_bit_expr_FU_267_i0_fu_kmp_38537_41072;
  wire out_extract_bit_expr_FU_268_i0_fu_kmp_38537_41075;
  wire out_extract_bit_expr_FU_269_i0_fu_kmp_38537_41078;
  wire out_extract_bit_expr_FU_271_i0_fu_kmp_38537_41084;
  wire out_extract_bit_expr_FU_272_i0_fu_kmp_38537_41087;
  wire out_extract_bit_expr_FU_273_i0_fu_kmp_38537_41090;
  wire out_extract_bit_expr_FU_274_i0_fu_kmp_38537_41093;
  wire out_extract_bit_expr_FU_275_i0_fu_kmp_38537_41096;
  wire out_extract_bit_expr_FU_277_i0_fu_kmp_38537_41102;
  wire out_extract_bit_expr_FU_27_i0_fu_kmp_38537_40423;
  wire out_extract_bit_expr_FU_283_i0_fu_kmp_38537_41106;
  wire out_extract_bit_expr_FU_284_i0_fu_kmp_38537_41109;
  wire out_extract_bit_expr_FU_285_i0_fu_kmp_38537_41112;
  wire out_extract_bit_expr_FU_286_i0_fu_kmp_38537_41115;
  wire out_extract_bit_expr_FU_288_i0_fu_kmp_38537_41121;
  wire out_extract_bit_expr_FU_289_i0_fu_kmp_38537_41124;
  wire out_extract_bit_expr_FU_28_i0_fu_kmp_38537_40427;
  wire out_extract_bit_expr_FU_290_i0_fu_kmp_38537_41127;
  wire out_extract_bit_expr_FU_291_i0_fu_kmp_38537_41130;
  wire out_extract_bit_expr_FU_293_i0_fu_kmp_38537_41136;
  wire out_extract_bit_expr_FU_294_i0_fu_kmp_38537_41139;
  wire out_extract_bit_expr_FU_295_i0_fu_kmp_38537_41142;
  wire out_extract_bit_expr_FU_296_i0_fu_kmp_38537_41145;
  wire out_extract_bit_expr_FU_298_i0_fu_kmp_38537_41151;
  wire out_extract_bit_expr_FU_299_i0_fu_kmp_38537_41154;
  wire out_extract_bit_expr_FU_29_i0_fu_kmp_38537_40430;
  wire out_extract_bit_expr_FU_300_i0_fu_kmp_38537_41157;
  wire out_extract_bit_expr_FU_301_i0_fu_kmp_38537_41160;
  wire out_extract_bit_expr_FU_303_i0_fu_kmp_38537_40939;
  wire out_extract_bit_expr_FU_304_i0_fu_kmp_38537_40942;
  wire out_extract_bit_expr_FU_305_i0_fu_kmp_38537_40954;
  wire out_extract_bit_expr_FU_306_i0_fu_kmp_38537_40957;
  wire out_extract_bit_expr_FU_307_i0_fu_kmp_38537_40969;
  wire out_extract_bit_expr_FU_308_i0_fu_kmp_38537_40972;
  wire out_extract_bit_expr_FU_309_i0_fu_kmp_38537_40984;
  wire out_extract_bit_expr_FU_30_i0_fu_kmp_38537_40433;
  wire out_extract_bit_expr_FU_310_i0_fu_kmp_38537_40987;
  wire out_extract_bit_expr_FU_314_i0_fu_kmp_38537_41164;
  wire out_extract_bit_expr_FU_315_i0_fu_kmp_38537_41167;
  wire out_extract_bit_expr_FU_316_i0_fu_kmp_38537_41170;
  wire out_extract_bit_expr_FU_317_i0_fu_kmp_38537_41173;
  wire out_extract_bit_expr_FU_319_i0_fu_kmp_38537_41179;
  wire out_extract_bit_expr_FU_320_i0_fu_kmp_38537_41182;
  wire out_extract_bit_expr_FU_321_i0_fu_kmp_38537_41185;
  wire out_extract_bit_expr_FU_322_i0_fu_kmp_38537_41188;
  wire out_extract_bit_expr_FU_324_i0_fu_kmp_38537_41194;
  wire out_extract_bit_expr_FU_325_i0_fu_kmp_38537_41197;
  wire out_extract_bit_expr_FU_326_i0_fu_kmp_38537_41200;
  wire out_extract_bit_expr_FU_327_i0_fu_kmp_38537_41203;
  wire out_extract_bit_expr_FU_329_i0_fu_kmp_38537_41209;
  wire out_extract_bit_expr_FU_330_i0_fu_kmp_38537_41212;
  wire out_extract_bit_expr_FU_331_i0_fu_kmp_38537_41215;
  wire out_extract_bit_expr_FU_332_i0_fu_kmp_38537_41218;
  wire out_extract_bit_expr_FU_43_i0_fu_kmp_38537_40437;
  wire out_extract_bit_expr_FU_44_i0_fu_kmp_38537_40440;
  wire out_extract_bit_expr_FU_45_i0_fu_kmp_38537_40443;
  wire out_extract_bit_expr_FU_46_i0_fu_kmp_38537_40446;
  wire out_extract_bit_expr_FU_47_i0_fu_kmp_38537_40449;
  wire out_extract_bit_expr_FU_48_i0_fu_kmp_38537_40452;
  wire out_extract_bit_expr_FU_50_i0_fu_kmp_38537_40459;
  wire out_extract_bit_expr_FU_51_i0_fu_kmp_38537_40462;
  wire out_extract_bit_expr_FU_52_i0_fu_kmp_38537_40466;
  wire out_extract_bit_expr_FU_53_i0_fu_kmp_38537_40470;
  wire out_extract_bit_expr_FU_54_i0_fu_kmp_38537_40474;
  wire out_extract_bit_expr_FU_56_i0_fu_kmp_38537_40481;
  wire out_extract_bit_expr_FU_57_i0_fu_kmp_38537_40485;
  wire out_extract_bit_expr_FU_58_i0_fu_kmp_38537_40489;
  wire out_extract_bit_expr_FU_59_i0_fu_kmp_38537_40493;
  wire out_extract_bit_expr_FU_60_i0_fu_kmp_38537_40497;
  wire out_extract_bit_expr_FU_62_i0_fu_kmp_38537_40504;
  wire out_extract_bit_expr_FU_63_i0_fu_kmp_38537_40508;
  wire out_extract_bit_expr_FU_64_i0_fu_kmp_38537_40512;
  wire out_extract_bit_expr_FU_65_i0_fu_kmp_38537_40516;
  wire out_extract_bit_expr_FU_66_i0_fu_kmp_38537_40520;
  wire out_extract_bit_expr_FU_68_i0_fu_kmp_38537_40527;
  wire out_extract_bit_expr_FU_69_i0_fu_kmp_38537_40531;
  wire out_extract_bit_expr_FU_70_i0_fu_kmp_38537_40535;
  wire out_extract_bit_expr_FU_71_i0_fu_kmp_38537_40539;
  wire out_extract_bit_expr_FU_72_i0_fu_kmp_38537_40543;
  wire out_extract_bit_expr_FU_74_i0_fu_kmp_38537_40550;
  wire out_extract_bit_expr_FU_75_i0_fu_kmp_38537_40554;
  wire out_extract_bit_expr_FU_76_i0_fu_kmp_38537_40558;
  wire out_extract_bit_expr_FU_77_i0_fu_kmp_38537_40562;
  wire out_extract_bit_expr_FU_78_i0_fu_kmp_38537_40566;
  wire out_extract_bit_expr_FU_80_i0_fu_kmp_38537_40573;
  wire out_extract_bit_expr_FU_90_i0_fu_kmp_38537_40577;
  wire out_extract_bit_expr_FU_91_i0_fu_kmp_38537_40580;
  wire out_extract_bit_expr_FU_92_i0_fu_kmp_38537_40583;
  wire out_extract_bit_expr_FU_93_i0_fu_kmp_38537_40586;
  wire out_extract_bit_expr_FU_95_i0_fu_kmp_38537_40592;
  wire out_extract_bit_expr_FU_96_i0_fu_kmp_38537_40595;
  wire out_extract_bit_expr_FU_97_i0_fu_kmp_38537_40598;
  wire out_extract_bit_expr_FU_98_i0_fu_kmp_38537_40601;
  wire out_gt_expr_FU_32_0_32_336_i0_fu_kmp_38537_40008;
  wire signed [1:0] out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0;
  wire signed [0:0] out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1;
  wire [31:0] out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_2;
  wire [31:0] out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_3;
  wire out_lut_expr_FU_104_i0_fu_kmp_38537_40619;
  wire out_lut_expr_FU_109_i0_fu_kmp_38537_39998;
  wire out_lut_expr_FU_126_i0_fu_kmp_38537_40654;
  wire out_lut_expr_FU_132_i0_fu_kmp_38537_40672;
  wire out_lut_expr_FU_138_i0_fu_kmp_38537_40690;
  wire out_lut_expr_FU_144_i0_fu_kmp_38537_40708;
  wire out_lut_expr_FU_150_i0_fu_kmp_38537_40726;
  wire out_lut_expr_FU_156_i0_fu_kmp_38537_40744;
  wire out_lut_expr_FU_158_i0_fu_kmp_38537_40358;
  wire out_lut_expr_FU_160_i0_fu_kmp_38537_40754;
  wire out_lut_expr_FU_163_i0_fu_kmp_38537_40769;
  wire out_lut_expr_FU_166_i0_fu_kmp_38537_40784;
  wire out_lut_expr_FU_169_i0_fu_kmp_38537_40799;
  wire out_lut_expr_FU_16_i0_fu_kmp_38537_40383;
  wire out_lut_expr_FU_172_i0_fu_kmp_38537_40814;
  wire out_lut_expr_FU_173_i0_fu_kmp_38537_40361;
  wire out_lut_expr_FU_182_i0_fu_kmp_38537_40836;
  wire out_lut_expr_FU_188_i0_fu_kmp_38537_40854;
  wire out_lut_expr_FU_194_i0_fu_kmp_38537_40872;
  wire out_lut_expr_FU_200_i0_fu_kmp_38537_40890;
  wire out_lut_expr_FU_206_i0_fu_kmp_38537_40908;
  wire out_lut_expr_FU_212_i0_fu_kmp_38537_40926;
  wire out_lut_expr_FU_214_i0_fu_kmp_38537_40004;
  wire out_lut_expr_FU_21_i0_fu_kmp_38537_40401;
  wire out_lut_expr_FU_220_i0_fu_kmp_38537_40945;
  wire out_lut_expr_FU_223_i0_fu_kmp_38537_40960;
  wire out_lut_expr_FU_226_i0_fu_kmp_38537_40975;
  wire out_lut_expr_FU_229_i0_fu_kmp_38537_40006;
  wire out_lut_expr_FU_246_i0_fu_kmp_38537_41009;
  wire out_lut_expr_FU_252_i0_fu_kmp_38537_41027;
  wire out_lut_expr_FU_258_i0_fu_kmp_38537_41045;
  wire out_lut_expr_FU_264_i0_fu_kmp_38537_41063;
  wire out_lut_expr_FU_26_i0_fu_kmp_38537_40418;
  wire out_lut_expr_FU_270_i0_fu_kmp_38537_41081;
  wire out_lut_expr_FU_276_i0_fu_kmp_38537_41099;
  wire out_lut_expr_FU_278_i0_fu_kmp_38537_40012;
  wire out_lut_expr_FU_287_i0_fu_kmp_38537_41118;
  wire out_lut_expr_FU_292_i0_fu_kmp_38537_41133;
  wire out_lut_expr_FU_297_i0_fu_kmp_38537_41148;
  wire out_lut_expr_FU_302_i0_fu_kmp_38537_40014;
  wire out_lut_expr_FU_318_i0_fu_kmp_38537_41176;
  wire out_lut_expr_FU_31_i0_fu_kmp_38537_39992;
  wire out_lut_expr_FU_323_i0_fu_kmp_38537_41191;
  wire out_lut_expr_FU_328_i0_fu_kmp_38537_41206;
  wire out_lut_expr_FU_333_i0_fu_kmp_38537_40016;
  wire out_lut_expr_FU_49_i0_fu_kmp_38537_40455;
  wire out_lut_expr_FU_55_i0_fu_kmp_38537_40477;
  wire out_lut_expr_FU_61_i0_fu_kmp_38537_40500;
  wire out_lut_expr_FU_67_i0_fu_kmp_38537_40523;
  wire out_lut_expr_FU_73_i0_fu_kmp_38537_40546;
  wire out_lut_expr_FU_79_i0_fu_kmp_38537_40569;
  wire out_lut_expr_FU_81_i0_fu_kmp_38537_39996;
  wire out_lut_expr_FU_94_i0_fu_kmp_38537_40589;
  wire out_lut_expr_FU_99_i0_fu_kmp_38537_40604;
  wire [1:0] out_multi_read_cond_FU_174_i0_fu_kmp_38537_40355;
  wire out_ne_expr_FU_32_0_32_337_i0_fu_kmp_38537_39994;
  wire signed [31:0] out_plus_expr_FU_32_0_32_338_i0_fu_kmp_38537_38771;
  wire signed [31:0] out_plus_expr_FU_32_0_32_338_i1_fu_kmp_38537_38811;
  wire signed [31:0] out_plus_expr_FU_32_0_32_338_i2_fu_kmp_38537_38890;
  wire signed [31:0] out_plus_expr_FU_32_0_32_338_i3_fu_kmp_38537_38928;
  wire out_read_cond_FU_118_i0_fu_kmp_38537_38829;
  wire out_read_cond_FU_216_i0_fu_kmp_38537_38896;
  wire out_read_cond_FU_230_i0_fu_kmp_38537_38900;
  wire out_read_cond_FU_233_i0_fu_kmp_38537_38926;
  wire out_read_cond_FU_236_i0_fu_kmp_38537_38937;
  wire out_read_cond_FU_282_i0_fu_kmp_38537_38946;
  wire out_read_cond_FU_311_i0_fu_kmp_38537_38956;
  wire out_read_cond_FU_32_i0_fu_kmp_38537_38738;
  wire out_read_cond_FU_334_i0_fu_kmp_38537_38969;
  wire out_read_cond_FU_37_i0_fu_kmp_38537_38822;
  wire out_read_cond_FU_89_i0_fu_kmp_38537_38824;
  wire [31:0] out_reg_0_reg_0;
  wire [22:0] out_reg_10_reg_10;
  wire [22:0] out_reg_11_reg_11;
  wire [7:0] out_reg_12_reg_12;
  wire out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [22:0] out_reg_22_reg_22;
  wire out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire [22:0] out_reg_25_reg_25;
  wire [7:0] out_reg_26_reg_26;
  wire [22:0] out_reg_27_reg_27;
  wire [31:0] out_reg_28_reg_28;
  wire [31:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_30_reg_30;
  wire [31:0] out_reg_31_reg_31;
  wire [22:0] out_reg_32_reg_32;
  wire out_reg_33_reg_33;
  wire [22:0] out_reg_34_reg_34;
  wire [22:0] out_reg_35_reg_35;
  wire [22:0] out_reg_36_reg_36;
  wire [7:0] out_reg_37_reg_37;
  wire out_reg_38_reg_38;
  wire out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire out_reg_40_reg_40;
  wire out_reg_41_reg_41;
  wire out_reg_42_reg_42;
  wire out_reg_43_reg_43;
  wire out_reg_44_reg_44;
  wire out_reg_45_reg_45;
  wire out_reg_46_reg_46;
  wire out_reg_47_reg_47;
  wire out_reg_48_reg_48;
  wire out_reg_49_reg_49;
  wire [31:0] out_reg_4_reg_4;
  wire out_reg_50_reg_50;
  wire out_reg_51_reg_51;
  wire out_reg_52_reg_52;
  wire out_reg_53_reg_53;
  wire [31:0] out_reg_54_reg_54;
  wire [22:0] out_reg_55_reg_55;
  wire [22:0] out_reg_56_reg_56;
  wire [22:0] out_reg_57_reg_57;
  wire [22:0] out_reg_5_reg_5;
  wire [22:0] out_reg_6_reg_6;
  wire [22:0] out_reg_7_reg_7;
  wire out_reg_8_reg_8;
  wire [22:0] out_reg_9_reg_9;
  wire [22:0] out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_4;
  wire [22:0] out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_5;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_339_i0_fu_kmp_38537_40254;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_340_i0_fu_kmp_38537_38765;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_341_i0_fu_kmp_38537_38863;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_342_i0_fu_kmp_38537_38879;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_343_i0_fu_kmp_38537_40250;
  wire out_ui_ne_expr_FU_32_32_32_344_i0_fu_kmp_38537_40010;
  wire [20:0] out_ui_plus_expr_FU_32_0_32_345_i0_fu_kmp_38537_38882;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_346_i0_fu_kmp_38537_38923;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_347_i0_fu_kmp_38537_40247;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_348_i0_fu_kmp_38537_38720;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_349_i0_fu_kmp_38537_38943;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i0_fu_kmp_38537_38784;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i1_fu_kmp_38537_38794;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i2_fu_kmp_38537_38827;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i3_fu_kmp_38537_38859;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i4_fu_kmp_38537_38876;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i5_fu_kmp_38537_38898;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i6_fu_kmp_38537_38954;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i7_fu_kmp_38537_38967;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i8_fu_kmp_38537_39774;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_350_i9_fu_kmp_38537_39782;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_351_i0_fu_kmp_38537_40242;
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
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_2));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_SIGNED_FU_i_assign_1 (.out1(out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) ASSIGN_UNSIGNED_FU_u_assign_4 (.out1(out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_4),
    .in1(out_reg_34_reg_34));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) ASSIGN_UNSIGNED_FU_u_assign_5 (.out1(out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_5),
    .in1(out_reg_55_reg_55));
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_335_i0 (.out1({out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0,
      out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({out_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0,
      32'b00000000000000000000000000000000}),
    .in2({out_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0,
      out_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1}),
    .in3({out_conv_out_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0_7_6,
      out_conv_out_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0_7_6}),
    .in4({out_const_7,
      out_const_7}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_335_i1_LOAD,
      fuselector_BMEMORY_CTRLN_335_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_335_i1_STORE,
      fuselector_BMEMORY_CTRLN_335_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_2 (.out1(out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_2),
    .in1(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_3 (.out1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_3),
    .in1(out_reg_0_reg_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_0_BMEMORY_CTRLN_335_i0_1_0_0 (.out1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0),
    .sel(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_36_reg_36));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_0_BMEMORY_CTRLN_335_i0_1_0_1 (.out1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1),
    .sel(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1),
    .in1(out_reg_32_reg_32),
    .in2(out_reg_25_reg_25));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_0_BMEMORY_CTRLN_335_i0_1_0_2 (.out1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2),
    .sel(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2),
    .in1(out_reg_22_reg_22),
    .in2(out_reg_10_reg_10));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_0_BMEMORY_CTRLN_335_i0_1_0_3 (.out1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3),
    .sel(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i7_fu_kmp_38537_38967),
    .in2(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_0_BMEMORY_CTRLN_335_i0_1_1_0 (.out1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0),
    .sel(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0),
    .in1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1),
    .in2(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_0_BMEMORY_CTRLN_335_i0_1_1_1 (.out1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1),
    .sel(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1),
    .in1(out_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3),
    .in2(out_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0));
  MUX_GATE #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0),
    .in1(out_conv_out_const_4_5_7),
    .in2(out_const_5));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_3_BMEMORY_CTRLN_335_i1_0_0_0 (.out1(out_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0),
    .sel(selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0),
    .in1(out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_2),
    .in2(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_3));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_335_i1_1_0_0 (.out1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_57_reg_57));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_335_i1_1_0_1 (.out1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1),
    .sel(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1),
    .in1(out_reg_56_reg_56),
    .in2(out_reg_35_reg_35));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_335_i1_1_0_2 (.out1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2),
    .sel(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2),
    .in1(out_reg_27_reg_27),
    .in2(out_reg_11_reg_11));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_335_i1_1_0_3 (.out1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3),
    .sel(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3),
    .in1(out_conv_in_port_kmpNext_32_23),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_350_i3_fu_kmp_38537_38859));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_335_i1_1_1_0 (.out1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0),
    .in1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0),
    .in2(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_335_i1_1_1_1 (.out1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1),
    .sel(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1),
    .in1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2),
    .in2(out_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_4_BMEMORY_CTRLN_335_i1_1_2_0 (.out1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0),
    .in1(out_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0),
    .in2(out_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1));
  MUX_GATE #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) MUX_5_BMEMORY_CTRLN_335_i1_2_0_0 (.out1(out_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0),
    .in1(out_conv_out_const_4_5_7),
    .in2(out_const_5));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_840_reg_0_0_0_0 (.out1(out_MUX_840_reg_0_0_0_0),
    .sel(selector_MUX_840_reg_0_0_0_0),
    .in1(out_reg_21_reg_21),
    .in2(out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_1_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_840_reg_0_0_0_1 (.out1(out_MUX_840_reg_0_0_0_1),
    .sel(selector_MUX_840_reg_0_0_0_1),
    .in1(out_plus_expr_FU_32_0_32_338_i0_fu_kmp_38537_38771),
    .in2(out_MUX_840_reg_0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_841_reg_1_0_0_0 (.out1(out_MUX_841_reg_1_0_0_0),
    .sel(selector_MUX_841_reg_1_0_0_0),
    .in1(out_UUdata_converter_FU_2_i0_fu_kmp_38537_38721),
    .in2(out_ui_bit_ior_concat_expr_FU_340_i0_fu_kmp_38537_38765));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_852_reg_2_0_0_0 (.out1(out_MUX_852_reg_2_0_0_0),
    .sel(selector_MUX_852_reg_2_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_2_32),
    .in2(out_plus_expr_FU_32_0_32_338_i1_fu_kmp_38537_38811));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_854_reg_21_0_0_0 (.out1(out_MUX_854_reg_21_0_0_0),
    .sel(selector_MUX_854_reg_21_0_0_0),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_858_reg_25_0_0_0 (.out1(out_MUX_858_reg_25_0_0_0),
    .sel(selector_MUX_858_reg_25_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_6_reg_6));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_858_reg_25_0_0_1 (.out1(out_MUX_858_reg_25_0_0_1),
    .sel(selector_MUX_858_reg_25_0_0_1),
    .in1(out_UUdata_converter_FU_84_i0_fu_kmp_38537_38767),
    .in2(out_MUX_858_reg_25_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_861_reg_28_0_0_0 (.out1(out_MUX_861_reg_28_0_0_0),
    .sel(selector_MUX_861_reg_28_0_0_0),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_1_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_861_reg_28_0_0_1 (.out1(out_MUX_861_reg_28_0_0_1),
    .sel(selector_MUX_861_reg_28_0_0_1),
    .in1(out_plus_expr_FU_32_0_32_338_i2_fu_kmp_38537_38890),
    .in2(out_MUX_861_reg_28_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_862_reg_29_0_0_0 (.out1(out_MUX_862_reg_29_0_0_0),
    .sel(selector_MUX_862_reg_29_0_0_0),
    .in1(out_reg_31_reg_31),
    .in2(out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_1_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_863_reg_3_0_0_0 (.out1(out_MUX_863_reg_3_0_0_0),
    .sel(selector_MUX_863_reg_3_0_0_0),
    .in1(out_reg_30_reg_30),
    .in2(out_UUdata_converter_FU_3_i0_fu_kmp_38537_38919));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_868_reg_34_0_0_0 (.out1(out_MUX_868_reg_34_0_0_0),
    .sel(selector_MUX_868_reg_34_0_0_0),
    .in1(out_IUdata_converter_FU_279_i0_fu_kmp_38537_38844),
    .in2(out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_4));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_868_reg_34_0_0_1 (.out1(out_MUX_868_reg_34_0_0_1),
    .sel(selector_MUX_868_reg_34_0_0_1),
    .in1(out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_5),
    .in2(out_MUX_868_reg_34_0_0_0));
  MUX_GATE #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) MUX_871_reg_37_0_0_0 (.out1(out_MUX_871_reg_37_0_0_0),
    .sel(selector_MUX_871_reg_37_0_0_0),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_32_8),
    .in2(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_32_8));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_890_reg_54_0_0_0 (.out1(out_MUX_890_reg_54_0_0_0),
    .sel(selector_MUX_890_reg_54_0_0_0),
    .in1(out_reg_28_reg_28),
    .in2(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0));
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
  constant_value #(.BITSIZE_out1(32),
    .value(32'b00000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(33),
    .value(33'b100000000000000000000000000000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1000010000100001)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b10000100001000010000000000000000)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1000010000100001000000000000000000000000000000000000000000000000)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10001)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10010)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10011)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1010)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10101)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1011)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11000)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11010)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111101111011110111111111111111111111111111111111111111111111111)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(15),
    .value(15'b111111010011011)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(30),
    .value(30'b111111111111111111111111111111)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) conv_in_port_kmpNext_32_23 (.out1(out_conv_in_port_kmpNext_32_23),
    .in1(in_port_kmpNext));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) conv_in_port_pattern_32_23 (.out1(out_conv_in_port_pattern_32_23),
    .in1(in_port_pattern));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_32_8 (.out1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_32_8),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8 (.out1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_32_8 (.out1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_32_8),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8 (.out1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0_7_6 (.out1(out_conv_out_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0_7_6),
    .in1(out_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0_7_6 (.out1(out_conv_out_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0_7_6),
    .in1(out_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(7)) conv_out_const_4_5_7 (.out1(out_conv_out_const_4_5_7),
    .in1(out_const_4));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_2_32 (.out1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_2_32),
    .in1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_1_32 (.out1(out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_1_32),
    .in1(out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(21)) conv_out_reg_34_reg_34_23_21 (.out1(out_conv_out_reg_34_reg_34_23_21),
    .in1(out_reg_34_reg_34));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_kmp_38537_38720 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_348_i0_fu_kmp_38537_38720),
    .in1(in_port_kmpNext),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_kmp_38537_38721 (.out1(out_UUdata_converter_FU_2_i0_fu_kmp_38537_38721),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_348_i0_fu_kmp_38537_38720));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38738 (.out1(out_read_cond_FU_32_i0_fu_kmp_38537_38738),
    .in1(out_lut_expr_FU_31_i0_fu_kmp_38537_39992));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38760 (.out1(out_UUdata_converter_FU_85_i0_fu_kmp_38537_38760),
    .in1(out_reg_1_reg_1));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_kmp_38537_38765 (.out1(out_ui_bit_ior_concat_expr_FU_340_i0_fu_kmp_38537_38765),
    .in1(out_ui_lshift_expr_FU_32_0_32_343_i0_fu_kmp_38537_40250),
    .in2(out_ui_bit_and_expr_FU_8_0_8_339_i0_fu_kmp_38537_40254),
    .in3(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38767 (.out1(out_UUdata_converter_FU_84_i0_fu_kmp_38537_38767),
    .in1(out_reg_1_reg_1));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_kmp_38537_38771 (.out1(out_plus_expr_FU_32_0_32_338_i0_fu_kmp_38537_38771),
    .in1(out_reg_21_reg_21),
    .in2(out_const_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38784 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i0_fu_kmp_38537_38784),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_119_i0_fu_kmp_38537_38789));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38789 (.out1(out_IUdata_converter_FU_119_i0_fu_kmp_38537_38789),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38794 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i1_fu_kmp_38537_38794),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_86_i0_fu_kmp_38537_38797));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38797 (.out1(out_IUdata_converter_FU_86_i0_fu_kmp_38537_38797),
    .in1(out_reg_0_reg_0));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38805 (.out1(out_IUdata_converter_FU_83_i0_fu_kmp_38537_38805),
    .in1(out_reg_2_reg_2));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_kmp_38537_38811 (.out1(out_plus_expr_FU_32_0_32_338_i1_fu_kmp_38537_38811),
    .in1(out_reg_2_reg_2),
    .in2(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38816 (.out1(out_IUdata_converter_FU_87_i0_fu_kmp_38537_38816),
    .in1(out_reg_2_reg_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38819 (.out1(out_UUdata_converter_FU_88_i0_fu_kmp_38537_38819),
    .in1(out_reg_1_reg_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38822 (.out1(out_read_cond_FU_37_i0_fu_kmp_38537_38822),
    .in1(out_reg_8_reg_8));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38824 (.out1(out_read_cond_FU_89_i0_fu_kmp_38537_38824),
    .in1(out_lut_expr_FU_81_i0_fu_kmp_38537_39996));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38826 (.out1(out_IUdata_converter_FU_82_i0_fu_kmp_38537_38826),
    .in1(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38827 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i2_fu_kmp_38537_38827),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_82_i0_fu_kmp_38537_38826));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38829 (.out1(out_read_cond_FU_118_i0_fu_kmp_38537_38829),
    .in1(out_lut_expr_FU_109_i0_fu_kmp_38537_39998));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38844 (.out1(out_IUdata_converter_FU_279_i0_fu_kmp_38537_38844),
    .in1(out_reg_28_reg_28));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38859 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i3_fu_kmp_38537_38859),
    .in1(in_port_kmpNext),
    .in2(out_ui_lshift_expr_FU_32_0_32_341_i0_fu_kmp_38537_38863));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_kmp_38537_38863 (.out1(out_ui_lshift_expr_FU_32_0_32_341_i0_fu_kmp_38537_38863),
    .in1(out_conv_out_reg_34_reg_34_23_21),
    .in2(out_const_8));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38871 (.out1(out_IUdata_converter_FU_215_i0_fu_kmp_38537_38871),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38876 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i4_fu_kmp_38537_38876),
    .in1(in_port_kmpNext),
    .in2(out_ui_lshift_expr_FU_32_0_32_342_i0_fu_kmp_38537_38879));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_kmp_38537_38879 (.out1(out_ui_lshift_expr_FU_32_0_32_342_i0_fu_kmp_38537_38879),
    .in1(out_ui_plus_expr_FU_32_0_32_345_i0_fu_kmp_38537_38882),
    .in2(out_const_8));
  ui_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(30),
    .BITSIZE_out1(21)) fu_kmp_38537_38882 (.out1(out_ui_plus_expr_FU_32_0_32_345_i0_fu_kmp_38537_38882),
    .in1(out_IUdata_converter_FU_232_i0_fu_kmp_38537_38888),
    .in2(out_const_44));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_kmp_38537_38888 (.out1(out_IUdata_converter_FU_232_i0_fu_kmp_38537_38888),
    .in1(out_plus_expr_FU_32_0_32_338_i2_fu_kmp_38537_38890));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_kmp_38537_38890 (.out1(out_plus_expr_FU_32_0_32_338_i2_fu_kmp_38537_38890),
    .in1(out_reg_54_reg_54),
    .in2(out_const_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38896 (.out1(out_read_cond_FU_216_i0_fu_kmp_38537_38896),
    .in1(out_lut_expr_FU_214_i0_fu_kmp_38537_40004));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38898 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i5_fu_kmp_38537_38898),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_215_i0_fu_kmp_38537_38871));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38900 (.out1(out_read_cond_FU_230_i0_fu_kmp_38537_38900),
    .in1(out_lut_expr_FU_229_i0_fu_kmp_38537_40006));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38911 (.out1(out_UUdata_converter_FU_280_i0_fu_kmp_38537_38911),
    .in1(out_reg_3_reg_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_kmp_38537_38919 (.out1(out_UUdata_converter_FU_3_i0_fu_kmp_38537_38919),
    .in1(in_port_input));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_kmp_38537_38923 (.out1(out_ui_plus_expr_FU_32_0_32_346_i0_fu_kmp_38537_38923),
    .in1(out_reg_3_reg_3),
    .in2(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38926 (.out1(out_read_cond_FU_233_i0_fu_kmp_38537_38926),
    .in1(out_gt_expr_FU_32_0_32_336_i0_fu_kmp_38537_40008));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_kmp_38537_38928 (.out1(out_plus_expr_FU_32_0_32_338_i3_fu_kmp_38537_38928),
    .in1(out_reg_29_reg_29),
    .in2(out_const_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38937 (.out1(out_read_cond_FU_236_i0_fu_kmp_38537_38937),
    .in1(out_reg_33_reg_33));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_kmp_38537_38940 (.out1(out_UUdata_converter_FU_4_i0_fu_kmp_38537_38940),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_349_i0_fu_kmp_38537_38943));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(15),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_kmp_38537_38943 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_349_i0_fu_kmp_38537_38943),
    .in1(in_port_input),
    .in2(out_const_43));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38946 (.out1(out_read_cond_FU_282_i0_fu_kmp_38537_38946),
    .in1(out_lut_expr_FU_278_i0_fu_kmp_38537_40012));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38948 (.out1(out_UUdata_converter_FU_281_i0_fu_kmp_38537_38948),
    .in1(out_reg_3_reg_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38954 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i6_fu_kmp_38537_38954),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_279_i0_fu_kmp_38537_38844));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38956 (.out1(out_read_cond_FU_311_i0_fu_kmp_38537_38956),
    .in1(out_lut_expr_FU_302_i0_fu_kmp_38537_40014));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_kmp_38537_38966 (.out1(out_IUdata_converter_FU_313_i0_fu_kmp_38537_38966),
    .in1(out_reg_28_reg_28));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_38967 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i7_fu_kmp_38537_38967),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_313_i0_fu_kmp_38537_38966));
  read_cond_FU #(.BITSIZE_in1(1)) fu_kmp_38537_38969 (.out1(out_read_cond_FU_334_i0_fu_kmp_38537_38969),
    .in1(out_lut_expr_FU_333_i0_fu_kmp_38537_40016));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_39774 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i8_fu_kmp_38537_39774),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_87_i0_fu_kmp_38537_38816));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_kmp_38537_39782 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_350_i9_fu_kmp_38537_39782),
    .in1(out_conv_in_port_pattern_32_23),
    .in2(out_IUdata_converter_FU_83_i0_fu_kmp_38537_38805));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_kmp_38537_39992 (.out1(out_lut_expr_FU_31_i0_fu_kmp_38537_39992),
    .in1(out_const_15),
    .in2(out_extract_bit_expr_FU_27_i0_fu_kmp_38537_40423),
    .in3(out_extract_bit_expr_FU_28_i0_fu_kmp_38537_40427),
    .in4(out_extract_bit_expr_FU_29_i0_fu_kmp_38537_40430),
    .in5(out_extract_bit_expr_FU_30_i0_fu_kmp_38537_40433),
    .in6(out_lut_expr_FU_21_i0_fu_kmp_38537_40401),
    .in7(out_lut_expr_FU_26_i0_fu_kmp_38537_40418),
    .in8(1'b0),
    .in9(1'b0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_kmp_38537_39994 (.out1(out_ne_expr_FU_32_0_32_337_i0_fu_kmp_38537_39994),
    .in1(out_plus_expr_FU_32_0_32_338_i1_fu_kmp_38537_38811),
    .in2(out_const_3));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_39996 (.out1(out_lut_expr_FU_81_i0_fu_kmp_38537_39996),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_80_i0_fu_kmp_38537_40573),
    .in3(out_lut_expr_FU_79_i0_fu_kmp_38537_40569),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu_kmp_38537_39998 (.out1(out_lut_expr_FU_109_i0_fu_kmp_38537_39998),
    .in1(out_const_41),
    .in2(out_extract_bit_expr_FU_105_i0_fu_kmp_38537_40623),
    .in3(out_extract_bit_expr_FU_106_i0_fu_kmp_38537_40626),
    .in4(out_extract_bit_expr_FU_107_i0_fu_kmp_38537_40629),
    .in5(out_extract_bit_expr_FU_108_i0_fu_kmp_38537_40632),
    .in6(out_lut_expr_FU_99_i0_fu_kmp_38537_40604),
    .in7(out_lut_expr_FU_104_i0_fu_kmp_38537_40619),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_40004 (.out1(out_lut_expr_FU_214_i0_fu_kmp_38537_40004),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_213_i0_fu_kmp_38537_40929),
    .in3(out_lut_expr_FU_212_i0_fu_kmp_38537_40926),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu_kmp_38537_40006 (.out1(out_lut_expr_FU_229_i0_fu_kmp_38537_40006),
    .in1(out_const_41),
    .in2(out_extract_bit_expr_FU_227_i0_fu_kmp_38537_40978),
    .in3(out_extract_bit_expr_FU_228_i0_fu_kmp_38537_40981),
    .in4(out_reg_44_reg_44),
    .in5(out_reg_45_reg_45),
    .in6(out_lut_expr_FU_223_i0_fu_kmp_38537_40960),
    .in7(out_lut_expr_FU_226_i0_fu_kmp_38537_40975),
    .in8(1'b0),
    .in9(1'b0));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_kmp_38537_40008 (.out1(out_gt_expr_FU_32_0_32_336_i0_fu_kmp_38537_40008),
    .in1(out_plus_expr_FU_32_0_32_338_i2_fu_kmp_38537_38890),
    .in2(out_const_6));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_kmp_38537_40010 (.out1(out_ui_ne_expr_FU_32_32_32_344_i0_fu_kmp_38537_40010),
    .in1(out_ui_plus_expr_FU_32_0_32_346_i0_fu_kmp_38537_38923),
    .in2(out_reg_4_reg_4));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_40012 (.out1(out_lut_expr_FU_278_i0_fu_kmp_38537_40012),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_277_i0_fu_kmp_38537_41102),
    .in3(out_lut_expr_FU_276_i0_fu_kmp_38537_41099),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_out1(1)) fu_kmp_38537_40014 (.out1(out_lut_expr_FU_302_i0_fu_kmp_38537_40014),
    .in1(out_const_41),
    .in2(out_extract_bit_expr_FU_298_i0_fu_kmp_38537_41151),
    .in3(out_extract_bit_expr_FU_299_i0_fu_kmp_38537_41154),
    .in4(out_extract_bit_expr_FU_300_i0_fu_kmp_38537_41157),
    .in5(out_extract_bit_expr_FU_301_i0_fu_kmp_38537_41160),
    .in6(out_lut_expr_FU_292_i0_fu_kmp_38537_41133),
    .in7(out_lut_expr_FU_297_i0_fu_kmp_38537_41148),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_kmp_38537_40016 (.out1(out_lut_expr_FU_333_i0_fu_kmp_38537_40016),
    .in1(out_const_15),
    .in2(out_extract_bit_expr_FU_329_i0_fu_kmp_38537_41209),
    .in3(out_extract_bit_expr_FU_330_i0_fu_kmp_38537_41212),
    .in4(out_reg_52_reg_52),
    .in5(out_reg_53_reg_53),
    .in6(out_lut_expr_FU_323_i0_fu_kmp_38537_41191),
    .in7(out_lut_expr_FU_328_i0_fu_kmp_38537_41206),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_kmp_38537_40242 (.out1(out_ui_rshift_expr_FU_32_0_32_351_i0_fu_kmp_38537_40242),
    .in1(out_reg_1_reg_1),
    .in2(out_const_8));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_kmp_38537_40247 (.out1(out_ui_plus_expr_FU_32_0_32_347_i0_fu_kmp_38537_40247),
    .in1(out_ui_rshift_expr_FU_32_0_32_351_i0_fu_kmp_38537_40242),
    .in2(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_kmp_38537_40250 (.out1(out_ui_lshift_expr_FU_32_0_32_343_i0_fu_kmp_38537_40250),
    .in1(out_ui_plus_expr_FU_32_0_32_347_i0_fu_kmp_38537_40247),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_kmp_38537_40254 (.out1(out_ui_bit_and_expr_FU_8_0_8_339_i0_fu_kmp_38537_40254),
    .in1(out_reg_1_reg_1),
    .in2(out_const_27));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_kmp_38537_40355 (.out1(out_multi_read_cond_FU_174_i0_fu_kmp_38537_40355),
    .in1({out_lut_expr_FU_173_i0_fu_kmp_38537_40361,
      out_reg_23_reg_23}));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_kmp_38537_40358 (.out1(out_lut_expr_FU_158_i0_fu_kmp_38537_40358),
    .in1(out_const_36),
    .in2(out_extract_bit_expr_FU_157_i0_fu_kmp_38537_40747),
    .in3(out_lut_expr_FU_156_i0_fu_kmp_38537_40744),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu_kmp_38537_40361 (.out1(out_lut_expr_FU_173_i0_fu_kmp_38537_40361),
    .in1(out_const_8),
    .in2(out_reg_24_reg_24),
    .in3(out_lut_expr_FU_172_i0_fu_kmp_38537_40814),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40371 (.out1(out_extract_bit_expr_FU_12_i0_fu_kmp_38537_40371),
    .in1(out_reg_26_reg_26),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40374 (.out1(out_extract_bit_expr_FU_13_i0_fu_kmp_38537_40374),
    .in1(out_reg_26_reg_26),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40377 (.out1(out_extract_bit_expr_FU_14_i0_fu_kmp_38537_40377),
    .in1(out_reg_12_reg_12),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40380 (.out1(out_extract_bit_expr_FU_15_i0_fu_kmp_38537_40380),
    .in1(out_reg_12_reg_12),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40383 (.out1(out_lut_expr_FU_16_i0_fu_kmp_38537_40383),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_12_i0_fu_kmp_38537_40371),
    .in3(out_extract_bit_expr_FU_13_i0_fu_kmp_38537_40374),
    .in4(out_extract_bit_expr_FU_14_i0_fu_kmp_38537_40377),
    .in5(out_extract_bit_expr_FU_15_i0_fu_kmp_38537_40380),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40388 (.out1(out_extract_bit_expr_FU_17_i0_fu_kmp_38537_40388),
    .in1(out_reg_26_reg_26),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40392 (.out1(out_extract_bit_expr_FU_18_i0_fu_kmp_38537_40392),
    .in1(out_reg_26_reg_26),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40395 (.out1(out_extract_bit_expr_FU_19_i0_fu_kmp_38537_40395),
    .in1(out_reg_12_reg_12),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40398 (.out1(out_extract_bit_expr_FU_20_i0_fu_kmp_38537_40398),
    .in1(out_reg_12_reg_12),
    .in2(out_const_27));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_kmp_38537_40401 (.out1(out_lut_expr_FU_21_i0_fu_kmp_38537_40401),
    .in1(out_const_14),
    .in2(out_extract_bit_expr_FU_17_i0_fu_kmp_38537_40388),
    .in3(out_extract_bit_expr_FU_18_i0_fu_kmp_38537_40392),
    .in4(out_extract_bit_expr_FU_19_i0_fu_kmp_38537_40395),
    .in5(out_extract_bit_expr_FU_20_i0_fu_kmp_38537_40398),
    .in6(out_lut_expr_FU_16_i0_fu_kmp_38537_40383),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40405 (.out1(out_extract_bit_expr_FU_22_i0_fu_kmp_38537_40405),
    .in1(out_reg_26_reg_26),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40409 (.out1(out_extract_bit_expr_FU_23_i0_fu_kmp_38537_40409),
    .in1(out_reg_26_reg_26),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40412 (.out1(out_extract_bit_expr_FU_24_i0_fu_kmp_38537_40412),
    .in1(out_reg_12_reg_12),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40415 (.out1(out_extract_bit_expr_FU_25_i0_fu_kmp_38537_40415),
    .in1(out_reg_12_reg_12),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40418 (.out1(out_lut_expr_FU_26_i0_fu_kmp_38537_40418),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_22_i0_fu_kmp_38537_40405),
    .in3(out_extract_bit_expr_FU_23_i0_fu_kmp_38537_40409),
    .in4(out_extract_bit_expr_FU_24_i0_fu_kmp_38537_40412),
    .in5(out_extract_bit_expr_FU_25_i0_fu_kmp_38537_40415),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40423 (.out1(out_extract_bit_expr_FU_27_i0_fu_kmp_38537_40423),
    .in1(out_reg_26_reg_26),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40427 (.out1(out_extract_bit_expr_FU_28_i0_fu_kmp_38537_40427),
    .in1(out_reg_26_reg_26),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40430 (.out1(out_extract_bit_expr_FU_29_i0_fu_kmp_38537_40430),
    .in1(out_reg_12_reg_12),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40433 (.out1(out_extract_bit_expr_FU_30_i0_fu_kmp_38537_40433),
    .in1(out_reg_12_reg_12),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40437 (.out1(out_extract_bit_expr_FU_43_i0_fu_kmp_38537_40437),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40440 (.out1(out_extract_bit_expr_FU_44_i0_fu_kmp_38537_40440),
    .in1(out_reg_0_reg_0),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_40443 (.out1(out_extract_bit_expr_FU_45_i0_fu_kmp_38537_40443),
    .in1(out_reg_0_reg_0),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_40446 (.out1(out_extract_bit_expr_FU_46_i0_fu_kmp_38537_40446),
    .in1(out_reg_0_reg_0),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40449 (.out1(out_extract_bit_expr_FU_47_i0_fu_kmp_38537_40449),
    .in1(out_reg_0_reg_0),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40452 (.out1(out_extract_bit_expr_FU_48_i0_fu_kmp_38537_40452),
    .in1(out_reg_0_reg_0),
    .in2(out_const_20));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_40455 (.out1(out_lut_expr_FU_49_i0_fu_kmp_38537_40455),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_43_i0_fu_kmp_38537_40437),
    .in3(out_extract_bit_expr_FU_44_i0_fu_kmp_38537_40440),
    .in4(out_extract_bit_expr_FU_45_i0_fu_kmp_38537_40443),
    .in5(out_extract_bit_expr_FU_46_i0_fu_kmp_38537_40446),
    .in6(out_extract_bit_expr_FU_47_i0_fu_kmp_38537_40449),
    .in7(out_extract_bit_expr_FU_48_i0_fu_kmp_38537_40452),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40459 (.out1(out_extract_bit_expr_FU_50_i0_fu_kmp_38537_40459),
    .in1(out_reg_0_reg_0),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40462 (.out1(out_extract_bit_expr_FU_51_i0_fu_kmp_38537_40462),
    .in1(out_reg_0_reg_0),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40466 (.out1(out_extract_bit_expr_FU_52_i0_fu_kmp_38537_40466),
    .in1(out_reg_0_reg_0),
    .in2(out_const_10));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40470 (.out1(out_extract_bit_expr_FU_53_i0_fu_kmp_38537_40470),
    .in1(out_reg_0_reg_0),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40474 (.out1(out_extract_bit_expr_FU_54_i0_fu_kmp_38537_40474),
    .in1(out_reg_0_reg_0),
    .in2(out_const_21));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40477 (.out1(out_lut_expr_FU_55_i0_fu_kmp_38537_40477),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_50_i0_fu_kmp_38537_40459),
    .in3(out_extract_bit_expr_FU_51_i0_fu_kmp_38537_40462),
    .in4(out_extract_bit_expr_FU_52_i0_fu_kmp_38537_40466),
    .in5(out_extract_bit_expr_FU_53_i0_fu_kmp_38537_40470),
    .in6(out_extract_bit_expr_FU_54_i0_fu_kmp_38537_40474),
    .in7(out_lut_expr_FU_49_i0_fu_kmp_38537_40455),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40481 (.out1(out_extract_bit_expr_FU_56_i0_fu_kmp_38537_40481),
    .in1(out_reg_0_reg_0),
    .in2(out_const_24));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40485 (.out1(out_extract_bit_expr_FU_57_i0_fu_kmp_38537_40485),
    .in1(out_reg_0_reg_0),
    .in2(out_const_29));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40489 (.out1(out_extract_bit_expr_FU_58_i0_fu_kmp_38537_40489),
    .in1(out_reg_0_reg_0),
    .in2(out_const_32));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40493 (.out1(out_extract_bit_expr_FU_59_i0_fu_kmp_38537_40493),
    .in1(out_reg_0_reg_0),
    .in2(out_const_36));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40497 (.out1(out_extract_bit_expr_FU_60_i0_fu_kmp_38537_40497),
    .in1(out_reg_0_reg_0),
    .in2(out_const_39));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40500 (.out1(out_lut_expr_FU_61_i0_fu_kmp_38537_40500),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_56_i0_fu_kmp_38537_40481),
    .in3(out_extract_bit_expr_FU_57_i0_fu_kmp_38537_40485),
    .in4(out_extract_bit_expr_FU_58_i0_fu_kmp_38537_40489),
    .in5(out_extract_bit_expr_FU_59_i0_fu_kmp_38537_40493),
    .in6(out_extract_bit_expr_FU_60_i0_fu_kmp_38537_40497),
    .in7(out_lut_expr_FU_55_i0_fu_kmp_38537_40477),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40504 (.out1(out_extract_bit_expr_FU_62_i0_fu_kmp_38537_40504),
    .in1(out_reg_0_reg_0),
    .in2(out_const_11));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40508 (.out1(out_extract_bit_expr_FU_63_i0_fu_kmp_38537_40508),
    .in1(out_reg_0_reg_0),
    .in2(out_const_16));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40512 (.out1(out_extract_bit_expr_FU_64_i0_fu_kmp_38537_40512),
    .in1(out_reg_0_reg_0),
    .in2(out_const_18));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40516 (.out1(out_extract_bit_expr_FU_65_i0_fu_kmp_38537_40516),
    .in1(out_reg_0_reg_0),
    .in2(out_const_19));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40520 (.out1(out_extract_bit_expr_FU_66_i0_fu_kmp_38537_40520),
    .in1(out_reg_0_reg_0),
    .in2(out_const_22));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40523 (.out1(out_lut_expr_FU_67_i0_fu_kmp_38537_40523),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_62_i0_fu_kmp_38537_40504),
    .in3(out_extract_bit_expr_FU_63_i0_fu_kmp_38537_40508),
    .in4(out_extract_bit_expr_FU_64_i0_fu_kmp_38537_40512),
    .in5(out_extract_bit_expr_FU_65_i0_fu_kmp_38537_40516),
    .in6(out_extract_bit_expr_FU_66_i0_fu_kmp_38537_40520),
    .in7(out_lut_expr_FU_61_i0_fu_kmp_38537_40500),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40527 (.out1(out_extract_bit_expr_FU_68_i0_fu_kmp_38537_40527),
    .in1(out_reg_0_reg_0),
    .in2(out_const_23));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40531 (.out1(out_extract_bit_expr_FU_69_i0_fu_kmp_38537_40531),
    .in1(out_reg_0_reg_0),
    .in2(out_const_25));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40535 (.out1(out_extract_bit_expr_FU_70_i0_fu_kmp_38537_40535),
    .in1(out_reg_0_reg_0),
    .in2(out_const_26));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40539 (.out1(out_extract_bit_expr_FU_71_i0_fu_kmp_38537_40539),
    .in1(out_reg_0_reg_0),
    .in2(out_const_30));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40543 (.out1(out_extract_bit_expr_FU_72_i0_fu_kmp_38537_40543),
    .in1(out_reg_0_reg_0),
    .in2(out_const_31));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40546 (.out1(out_lut_expr_FU_73_i0_fu_kmp_38537_40546),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_68_i0_fu_kmp_38537_40527),
    .in3(out_extract_bit_expr_FU_69_i0_fu_kmp_38537_40531),
    .in4(out_extract_bit_expr_FU_70_i0_fu_kmp_38537_40535),
    .in5(out_extract_bit_expr_FU_71_i0_fu_kmp_38537_40539),
    .in6(out_extract_bit_expr_FU_72_i0_fu_kmp_38537_40543),
    .in7(out_lut_expr_FU_67_i0_fu_kmp_38537_40523),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40550 (.out1(out_extract_bit_expr_FU_74_i0_fu_kmp_38537_40550),
    .in1(out_reg_0_reg_0),
    .in2(out_const_33));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40554 (.out1(out_extract_bit_expr_FU_75_i0_fu_kmp_38537_40554),
    .in1(out_reg_0_reg_0),
    .in2(out_const_34));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40558 (.out1(out_extract_bit_expr_FU_76_i0_fu_kmp_38537_40558),
    .in1(out_reg_0_reg_0),
    .in2(out_const_37));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40562 (.out1(out_extract_bit_expr_FU_77_i0_fu_kmp_38537_40562),
    .in1(out_reg_0_reg_0),
    .in2(out_const_38));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40566 (.out1(out_extract_bit_expr_FU_78_i0_fu_kmp_38537_40566),
    .in1(out_reg_0_reg_0),
    .in2(out_const_40));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40569 (.out1(out_lut_expr_FU_79_i0_fu_kmp_38537_40569),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_74_i0_fu_kmp_38537_40550),
    .in3(out_extract_bit_expr_FU_75_i0_fu_kmp_38537_40554),
    .in4(out_extract_bit_expr_FU_76_i0_fu_kmp_38537_40558),
    .in5(out_extract_bit_expr_FU_77_i0_fu_kmp_38537_40562),
    .in6(out_extract_bit_expr_FU_78_i0_fu_kmp_38537_40566),
    .in7(out_lut_expr_FU_73_i0_fu_kmp_38537_40546),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40573 (.out1(out_extract_bit_expr_FU_80_i0_fu_kmp_38537_40573),
    .in1(out_reg_0_reg_0),
    .in2(out_const_42));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40577 (.out1(out_extract_bit_expr_FU_90_i0_fu_kmp_38537_40577),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40580 (.out1(out_extract_bit_expr_FU_91_i0_fu_kmp_38537_40580),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40583 (.out1(out_extract_bit_expr_FU_92_i0_fu_kmp_38537_40583),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40586 (.out1(out_extract_bit_expr_FU_93_i0_fu_kmp_38537_40586),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40589 (.out1(out_lut_expr_FU_94_i0_fu_kmp_38537_40589),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_90_i0_fu_kmp_38537_40577),
    .in3(out_extract_bit_expr_FU_91_i0_fu_kmp_38537_40580),
    .in4(out_extract_bit_expr_FU_92_i0_fu_kmp_38537_40583),
    .in5(out_extract_bit_expr_FU_93_i0_fu_kmp_38537_40586),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40592 (.out1(out_extract_bit_expr_FU_95_i0_fu_kmp_38537_40592),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40595 (.out1(out_extract_bit_expr_FU_96_i0_fu_kmp_38537_40595),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40598 (.out1(out_extract_bit_expr_FU_97_i0_fu_kmp_38537_40598),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40601 (.out1(out_extract_bit_expr_FU_98_i0_fu_kmp_38537_40601),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_kmp_38537_40604 (.out1(out_lut_expr_FU_99_i0_fu_kmp_38537_40604),
    .in1(out_const_14),
    .in2(out_extract_bit_expr_FU_95_i0_fu_kmp_38537_40592),
    .in3(out_extract_bit_expr_FU_96_i0_fu_kmp_38537_40595),
    .in4(out_extract_bit_expr_FU_97_i0_fu_kmp_38537_40598),
    .in5(out_extract_bit_expr_FU_98_i0_fu_kmp_38537_40601),
    .in6(out_lut_expr_FU_94_i0_fu_kmp_38537_40589),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40607 (.out1(out_extract_bit_expr_FU_100_i0_fu_kmp_38537_40607),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40610 (.out1(out_extract_bit_expr_FU_101_i0_fu_kmp_38537_40610),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40613 (.out1(out_extract_bit_expr_FU_102_i0_fu_kmp_38537_40613),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40616 (.out1(out_extract_bit_expr_FU_103_i0_fu_kmp_38537_40616),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40619 (.out1(out_lut_expr_FU_104_i0_fu_kmp_38537_40619),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_100_i0_fu_kmp_38537_40607),
    .in3(out_extract_bit_expr_FU_101_i0_fu_kmp_38537_40610),
    .in4(out_extract_bit_expr_FU_102_i0_fu_kmp_38537_40613),
    .in5(out_extract_bit_expr_FU_103_i0_fu_kmp_38537_40616),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40623 (.out1(out_extract_bit_expr_FU_105_i0_fu_kmp_38537_40623),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40626 (.out1(out_extract_bit_expr_FU_106_i0_fu_kmp_38537_40626),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40629 (.out1(out_extract_bit_expr_FU_107_i0_fu_kmp_38537_40629),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40632 (.out1(out_extract_bit_expr_FU_108_i0_fu_kmp_38537_40632),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40636 (.out1(out_extract_bit_expr_FU_120_i0_fu_kmp_38537_40636),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40639 (.out1(out_extract_bit_expr_FU_121_i0_fu_kmp_38537_40639),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_40642 (.out1(out_extract_bit_expr_FU_122_i0_fu_kmp_38537_40642),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_40645 (.out1(out_extract_bit_expr_FU_123_i0_fu_kmp_38537_40645),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40648 (.out1(out_extract_bit_expr_FU_124_i0_fu_kmp_38537_40648),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40651 (.out1(out_extract_bit_expr_FU_125_i0_fu_kmp_38537_40651),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_20));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_40654 (.out1(out_lut_expr_FU_126_i0_fu_kmp_38537_40654),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_120_i0_fu_kmp_38537_40636),
    .in3(out_extract_bit_expr_FU_121_i0_fu_kmp_38537_40639),
    .in4(out_extract_bit_expr_FU_122_i0_fu_kmp_38537_40642),
    .in5(out_extract_bit_expr_FU_123_i0_fu_kmp_38537_40645),
    .in6(out_extract_bit_expr_FU_124_i0_fu_kmp_38537_40648),
    .in7(out_extract_bit_expr_FU_125_i0_fu_kmp_38537_40651),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40657 (.out1(out_extract_bit_expr_FU_127_i0_fu_kmp_38537_40657),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40660 (.out1(out_extract_bit_expr_FU_128_i0_fu_kmp_38537_40660),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40663 (.out1(out_extract_bit_expr_FU_129_i0_fu_kmp_38537_40663),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_10));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40666 (.out1(out_extract_bit_expr_FU_130_i0_fu_kmp_38537_40666),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40669 (.out1(out_extract_bit_expr_FU_131_i0_fu_kmp_38537_40669),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_21));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40672 (.out1(out_lut_expr_FU_132_i0_fu_kmp_38537_40672),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_127_i0_fu_kmp_38537_40657),
    .in3(out_extract_bit_expr_FU_128_i0_fu_kmp_38537_40660),
    .in4(out_extract_bit_expr_FU_129_i0_fu_kmp_38537_40663),
    .in5(out_extract_bit_expr_FU_130_i0_fu_kmp_38537_40666),
    .in6(out_extract_bit_expr_FU_131_i0_fu_kmp_38537_40669),
    .in7(out_lut_expr_FU_126_i0_fu_kmp_38537_40654),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40675 (.out1(out_extract_bit_expr_FU_133_i0_fu_kmp_38537_40675),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_24));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40678 (.out1(out_extract_bit_expr_FU_134_i0_fu_kmp_38537_40678),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_29));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40681 (.out1(out_extract_bit_expr_FU_135_i0_fu_kmp_38537_40681),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_32));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40684 (.out1(out_extract_bit_expr_FU_136_i0_fu_kmp_38537_40684),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_36));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40687 (.out1(out_extract_bit_expr_FU_137_i0_fu_kmp_38537_40687),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_39));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40690 (.out1(out_lut_expr_FU_138_i0_fu_kmp_38537_40690),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_133_i0_fu_kmp_38537_40675),
    .in3(out_extract_bit_expr_FU_134_i0_fu_kmp_38537_40678),
    .in4(out_extract_bit_expr_FU_135_i0_fu_kmp_38537_40681),
    .in5(out_extract_bit_expr_FU_136_i0_fu_kmp_38537_40684),
    .in6(out_extract_bit_expr_FU_137_i0_fu_kmp_38537_40687),
    .in7(out_lut_expr_FU_132_i0_fu_kmp_38537_40672),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40693 (.out1(out_extract_bit_expr_FU_139_i0_fu_kmp_38537_40693),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_11));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40696 (.out1(out_extract_bit_expr_FU_140_i0_fu_kmp_38537_40696),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_16));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40699 (.out1(out_extract_bit_expr_FU_141_i0_fu_kmp_38537_40699),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_18));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40702 (.out1(out_extract_bit_expr_FU_142_i0_fu_kmp_38537_40702),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_19));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40705 (.out1(out_extract_bit_expr_FU_143_i0_fu_kmp_38537_40705),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_22));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40708 (.out1(out_lut_expr_FU_144_i0_fu_kmp_38537_40708),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_139_i0_fu_kmp_38537_40693),
    .in3(out_extract_bit_expr_FU_140_i0_fu_kmp_38537_40696),
    .in4(out_extract_bit_expr_FU_141_i0_fu_kmp_38537_40699),
    .in5(out_extract_bit_expr_FU_142_i0_fu_kmp_38537_40702),
    .in6(out_extract_bit_expr_FU_143_i0_fu_kmp_38537_40705),
    .in7(out_lut_expr_FU_138_i0_fu_kmp_38537_40690),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40711 (.out1(out_extract_bit_expr_FU_145_i0_fu_kmp_38537_40711),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_23));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40714 (.out1(out_extract_bit_expr_FU_146_i0_fu_kmp_38537_40714),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_25));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40717 (.out1(out_extract_bit_expr_FU_147_i0_fu_kmp_38537_40717),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_26));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40720 (.out1(out_extract_bit_expr_FU_148_i0_fu_kmp_38537_40720),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_30));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40723 (.out1(out_extract_bit_expr_FU_149_i0_fu_kmp_38537_40723),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_31));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40726 (.out1(out_lut_expr_FU_150_i0_fu_kmp_38537_40726),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_145_i0_fu_kmp_38537_40711),
    .in3(out_extract_bit_expr_FU_146_i0_fu_kmp_38537_40714),
    .in4(out_extract_bit_expr_FU_147_i0_fu_kmp_38537_40717),
    .in5(out_extract_bit_expr_FU_148_i0_fu_kmp_38537_40720),
    .in6(out_extract_bit_expr_FU_149_i0_fu_kmp_38537_40723),
    .in7(out_lut_expr_FU_144_i0_fu_kmp_38537_40708),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40729 (.out1(out_extract_bit_expr_FU_151_i0_fu_kmp_38537_40729),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_33));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40732 (.out1(out_extract_bit_expr_FU_152_i0_fu_kmp_38537_40732),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_34));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40735 (.out1(out_extract_bit_expr_FU_153_i0_fu_kmp_38537_40735),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_37));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40738 (.out1(out_extract_bit_expr_FU_154_i0_fu_kmp_38537_40738),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_38));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40741 (.out1(out_extract_bit_expr_FU_155_i0_fu_kmp_38537_40741),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_40));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40744 (.out1(out_lut_expr_FU_156_i0_fu_kmp_38537_40744),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_151_i0_fu_kmp_38537_40729),
    .in3(out_extract_bit_expr_FU_152_i0_fu_kmp_38537_40732),
    .in4(out_extract_bit_expr_FU_153_i0_fu_kmp_38537_40735),
    .in5(out_extract_bit_expr_FU_154_i0_fu_kmp_38537_40738),
    .in6(out_extract_bit_expr_FU_155_i0_fu_kmp_38537_40741),
    .in7(out_lut_expr_FU_150_i0_fu_kmp_38537_40726),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40747 (.out1(out_extract_bit_expr_FU_157_i0_fu_kmp_38537_40747),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_42));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40751 (.out1(out_extract_bit_expr_FU_159_i0_fu_kmp_38537_40751),
    .in1(out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0),
    .in2(out_const_42));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_40754 (.out1(out_lut_expr_FU_160_i0_fu_kmp_38537_40754),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_159_i0_fu_kmp_38537_40751),
    .in3(out_lut_expr_FU_156_i0_fu_kmp_38537_40744),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40757 (.out1(out_extract_bit_expr_FU_110_i0_fu_kmp_38537_40757),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40760 (.out1(out_extract_bit_expr_FU_111_i0_fu_kmp_38537_40760),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40763 (.out1(out_extract_bit_expr_FU_161_i0_fu_kmp_38537_40763),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40766 (.out1(out_extract_bit_expr_FU_162_i0_fu_kmp_38537_40766),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40769 (.out1(out_lut_expr_FU_163_i0_fu_kmp_38537_40769),
    .in1(out_const_13),
    .in2(out_reg_13_reg_13),
    .in3(out_reg_14_reg_14),
    .in4(out_extract_bit_expr_FU_161_i0_fu_kmp_38537_40763),
    .in5(out_extract_bit_expr_FU_162_i0_fu_kmp_38537_40766),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40772 (.out1(out_extract_bit_expr_FU_112_i0_fu_kmp_38537_40772),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40775 (.out1(out_extract_bit_expr_FU_113_i0_fu_kmp_38537_40775),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40778 (.out1(out_extract_bit_expr_FU_164_i0_fu_kmp_38537_40778),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40781 (.out1(out_extract_bit_expr_FU_165_i0_fu_kmp_38537_40781),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_kmp_38537_40784 (.out1(out_lut_expr_FU_166_i0_fu_kmp_38537_40784),
    .in1(out_const_14),
    .in2(out_reg_15_reg_15),
    .in3(out_reg_16_reg_16),
    .in4(out_extract_bit_expr_FU_164_i0_fu_kmp_38537_40778),
    .in5(out_extract_bit_expr_FU_165_i0_fu_kmp_38537_40781),
    .in6(out_lut_expr_FU_163_i0_fu_kmp_38537_40769),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40787 (.out1(out_extract_bit_expr_FU_114_i0_fu_kmp_38537_40787),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40790 (.out1(out_extract_bit_expr_FU_115_i0_fu_kmp_38537_40790),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40793 (.out1(out_extract_bit_expr_FU_167_i0_fu_kmp_38537_40793),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40796 (.out1(out_extract_bit_expr_FU_168_i0_fu_kmp_38537_40796),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40799 (.out1(out_lut_expr_FU_169_i0_fu_kmp_38537_40799),
    .in1(out_const_13),
    .in2(out_reg_17_reg_17),
    .in3(out_reg_18_reg_18),
    .in4(out_extract_bit_expr_FU_167_i0_fu_kmp_38537_40793),
    .in5(out_extract_bit_expr_FU_168_i0_fu_kmp_38537_40796),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40802 (.out1(out_extract_bit_expr_FU_116_i0_fu_kmp_38537_40802),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40805 (.out1(out_extract_bit_expr_FU_117_i0_fu_kmp_38537_40805),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40808 (.out1(out_extract_bit_expr_FU_170_i0_fu_kmp_38537_40808),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40811 (.out1(out_extract_bit_expr_FU_171_i0_fu_kmp_38537_40811),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_kmp_38537_40814 (.out1(out_lut_expr_FU_172_i0_fu_kmp_38537_40814),
    .in1(out_const_15),
    .in2(out_reg_19_reg_19),
    .in3(out_reg_20_reg_20),
    .in4(out_extract_bit_expr_FU_170_i0_fu_kmp_38537_40808),
    .in5(out_extract_bit_expr_FU_171_i0_fu_kmp_38537_40811),
    .in6(out_lut_expr_FU_166_i0_fu_kmp_38537_40784),
    .in7(out_lut_expr_FU_169_i0_fu_kmp_38537_40799),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40818 (.out1(out_extract_bit_expr_FU_176_i0_fu_kmp_38537_40818),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40821 (.out1(out_extract_bit_expr_FU_177_i0_fu_kmp_38537_40821),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_40824 (.out1(out_extract_bit_expr_FU_178_i0_fu_kmp_38537_40824),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_40827 (.out1(out_extract_bit_expr_FU_179_i0_fu_kmp_38537_40827),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40830 (.out1(out_extract_bit_expr_FU_180_i0_fu_kmp_38537_40830),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40833 (.out1(out_extract_bit_expr_FU_181_i0_fu_kmp_38537_40833),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_20));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_40836 (.out1(out_lut_expr_FU_182_i0_fu_kmp_38537_40836),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_176_i0_fu_kmp_38537_40818),
    .in3(out_extract_bit_expr_FU_177_i0_fu_kmp_38537_40821),
    .in4(out_extract_bit_expr_FU_178_i0_fu_kmp_38537_40824),
    .in5(out_extract_bit_expr_FU_179_i0_fu_kmp_38537_40827),
    .in6(out_extract_bit_expr_FU_180_i0_fu_kmp_38537_40830),
    .in7(out_extract_bit_expr_FU_181_i0_fu_kmp_38537_40833),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40839 (.out1(out_extract_bit_expr_FU_183_i0_fu_kmp_38537_40839),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_40842 (.out1(out_extract_bit_expr_FU_184_i0_fu_kmp_38537_40842),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40845 (.out1(out_extract_bit_expr_FU_185_i0_fu_kmp_38537_40845),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_10));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40848 (.out1(out_extract_bit_expr_FU_186_i0_fu_kmp_38537_40848),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40851 (.out1(out_extract_bit_expr_FU_187_i0_fu_kmp_38537_40851),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_21));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40854 (.out1(out_lut_expr_FU_188_i0_fu_kmp_38537_40854),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_183_i0_fu_kmp_38537_40839),
    .in3(out_extract_bit_expr_FU_184_i0_fu_kmp_38537_40842),
    .in4(out_extract_bit_expr_FU_185_i0_fu_kmp_38537_40845),
    .in5(out_extract_bit_expr_FU_186_i0_fu_kmp_38537_40848),
    .in6(out_extract_bit_expr_FU_187_i0_fu_kmp_38537_40851),
    .in7(out_lut_expr_FU_182_i0_fu_kmp_38537_40836),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40857 (.out1(out_extract_bit_expr_FU_189_i0_fu_kmp_38537_40857),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_24));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40860 (.out1(out_extract_bit_expr_FU_190_i0_fu_kmp_38537_40860),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_29));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40863 (.out1(out_extract_bit_expr_FU_191_i0_fu_kmp_38537_40863),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_32));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40866 (.out1(out_extract_bit_expr_FU_192_i0_fu_kmp_38537_40866),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_36));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_40869 (.out1(out_extract_bit_expr_FU_193_i0_fu_kmp_38537_40869),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_39));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40872 (.out1(out_lut_expr_FU_194_i0_fu_kmp_38537_40872),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_189_i0_fu_kmp_38537_40857),
    .in3(out_extract_bit_expr_FU_190_i0_fu_kmp_38537_40860),
    .in4(out_extract_bit_expr_FU_191_i0_fu_kmp_38537_40863),
    .in5(out_extract_bit_expr_FU_192_i0_fu_kmp_38537_40866),
    .in6(out_extract_bit_expr_FU_193_i0_fu_kmp_38537_40869),
    .in7(out_lut_expr_FU_188_i0_fu_kmp_38537_40854),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40875 (.out1(out_extract_bit_expr_FU_195_i0_fu_kmp_38537_40875),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_11));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40878 (.out1(out_extract_bit_expr_FU_196_i0_fu_kmp_38537_40878),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_16));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40881 (.out1(out_extract_bit_expr_FU_197_i0_fu_kmp_38537_40881),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_18));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40884 (.out1(out_extract_bit_expr_FU_198_i0_fu_kmp_38537_40884),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_19));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40887 (.out1(out_extract_bit_expr_FU_199_i0_fu_kmp_38537_40887),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_22));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40890 (.out1(out_lut_expr_FU_200_i0_fu_kmp_38537_40890),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_195_i0_fu_kmp_38537_40875),
    .in3(out_extract_bit_expr_FU_196_i0_fu_kmp_38537_40878),
    .in4(out_extract_bit_expr_FU_197_i0_fu_kmp_38537_40881),
    .in5(out_extract_bit_expr_FU_198_i0_fu_kmp_38537_40884),
    .in6(out_extract_bit_expr_FU_199_i0_fu_kmp_38537_40887),
    .in7(out_lut_expr_FU_194_i0_fu_kmp_38537_40872),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40893 (.out1(out_extract_bit_expr_FU_201_i0_fu_kmp_38537_40893),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_23));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40896 (.out1(out_extract_bit_expr_FU_202_i0_fu_kmp_38537_40896),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_25));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40899 (.out1(out_extract_bit_expr_FU_203_i0_fu_kmp_38537_40899),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_26));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40902 (.out1(out_extract_bit_expr_FU_204_i0_fu_kmp_38537_40902),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_30));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40905 (.out1(out_extract_bit_expr_FU_205_i0_fu_kmp_38537_40905),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_31));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40908 (.out1(out_lut_expr_FU_206_i0_fu_kmp_38537_40908),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_201_i0_fu_kmp_38537_40893),
    .in3(out_extract_bit_expr_FU_202_i0_fu_kmp_38537_40896),
    .in4(out_extract_bit_expr_FU_203_i0_fu_kmp_38537_40899),
    .in5(out_extract_bit_expr_FU_204_i0_fu_kmp_38537_40902),
    .in6(out_extract_bit_expr_FU_205_i0_fu_kmp_38537_40905),
    .in7(out_lut_expr_FU_200_i0_fu_kmp_38537_40890),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40911 (.out1(out_extract_bit_expr_FU_207_i0_fu_kmp_38537_40911),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_33));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40914 (.out1(out_extract_bit_expr_FU_208_i0_fu_kmp_38537_40914),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_34));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40917 (.out1(out_extract_bit_expr_FU_209_i0_fu_kmp_38537_40917),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_37));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40920 (.out1(out_extract_bit_expr_FU_210_i0_fu_kmp_38537_40920),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_38));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40923 (.out1(out_extract_bit_expr_FU_211_i0_fu_kmp_38537_40923),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_40));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_40926 (.out1(out_lut_expr_FU_212_i0_fu_kmp_38537_40926),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_207_i0_fu_kmp_38537_40911),
    .in3(out_extract_bit_expr_FU_208_i0_fu_kmp_38537_40914),
    .in4(out_extract_bit_expr_FU_209_i0_fu_kmp_38537_40917),
    .in5(out_extract_bit_expr_FU_210_i0_fu_kmp_38537_40920),
    .in6(out_extract_bit_expr_FU_211_i0_fu_kmp_38537_40923),
    .in7(out_lut_expr_FU_206_i0_fu_kmp_38537_40908),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_40929 (.out1(out_extract_bit_expr_FU_213_i0_fu_kmp_38537_40929),
    .in1(out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0),
    .in2(out_const_42));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40933 (.out1(out_extract_bit_expr_FU_218_i0_fu_kmp_38537_40933),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40936 (.out1(out_extract_bit_expr_FU_219_i0_fu_kmp_38537_40936),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40939 (.out1(out_extract_bit_expr_FU_303_i0_fu_kmp_38537_40939),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_40942 (.out1(out_extract_bit_expr_FU_304_i0_fu_kmp_38537_40942),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40945 (.out1(out_lut_expr_FU_220_i0_fu_kmp_38537_40945),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_218_i0_fu_kmp_38537_40933),
    .in3(out_extract_bit_expr_FU_219_i0_fu_kmp_38537_40936),
    .in4(out_reg_38_reg_38),
    .in5(out_reg_39_reg_39),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40948 (.out1(out_extract_bit_expr_FU_221_i0_fu_kmp_38537_40948),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40951 (.out1(out_extract_bit_expr_FU_222_i0_fu_kmp_38537_40951),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40954 (.out1(out_extract_bit_expr_FU_305_i0_fu_kmp_38537_40954),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_40957 (.out1(out_extract_bit_expr_FU_306_i0_fu_kmp_38537_40957),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_kmp_38537_40960 (.out1(out_lut_expr_FU_223_i0_fu_kmp_38537_40960),
    .in1(out_const_14),
    .in2(out_extract_bit_expr_FU_221_i0_fu_kmp_38537_40948),
    .in3(out_extract_bit_expr_FU_222_i0_fu_kmp_38537_40951),
    .in4(out_reg_40_reg_40),
    .in5(out_reg_41_reg_41),
    .in6(out_lut_expr_FU_220_i0_fu_kmp_38537_40945),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40963 (.out1(out_extract_bit_expr_FU_224_i0_fu_kmp_38537_40963),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40966 (.out1(out_extract_bit_expr_FU_225_i0_fu_kmp_38537_40966),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40969 (.out1(out_extract_bit_expr_FU_307_i0_fu_kmp_38537_40969),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40972 (.out1(out_extract_bit_expr_FU_308_i0_fu_kmp_38537_40972),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_40975 (.out1(out_lut_expr_FU_226_i0_fu_kmp_38537_40975),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_224_i0_fu_kmp_38537_40963),
    .in3(out_extract_bit_expr_FU_225_i0_fu_kmp_38537_40966),
    .in4(out_reg_42_reg_42),
    .in5(out_reg_43_reg_43),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40978 (.out1(out_extract_bit_expr_FU_227_i0_fu_kmp_38537_40978),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40981 (.out1(out_extract_bit_expr_FU_228_i0_fu_kmp_38537_40981),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40984 (.out1(out_extract_bit_expr_FU_309_i0_fu_kmp_38537_40984),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_40987 (.out1(out_extract_bit_expr_FU_310_i0_fu_kmp_38537_40987),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40991 (.out1(out_extract_bit_expr_FU_240_i0_fu_kmp_38537_40991),
    .in1(out_reg_28_reg_28),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1)) fu_kmp_38537_40994 (.out1(out_extract_bit_expr_FU_241_i0_fu_kmp_38537_40994),
    .in1(out_reg_28_reg_28),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_40997 (.out1(out_extract_bit_expr_FU_242_i0_fu_kmp_38537_40997),
    .in1(out_reg_28_reg_28),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2)) fu_kmp_38537_41000 (.out1(out_extract_bit_expr_FU_243_i0_fu_kmp_38537_41000),
    .in1(out_reg_28_reg_28),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_41003 (.out1(out_extract_bit_expr_FU_244_i0_fu_kmp_38537_41003),
    .in1(out_reg_28_reg_28),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_41006 (.out1(out_extract_bit_expr_FU_245_i0_fu_kmp_38537_41006),
    .in1(out_reg_28_reg_28),
    .in2(out_const_20));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_kmp_38537_41009 (.out1(out_lut_expr_FU_246_i0_fu_kmp_38537_41009),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_240_i0_fu_kmp_38537_40991),
    .in3(out_extract_bit_expr_FU_241_i0_fu_kmp_38537_40994),
    .in4(out_extract_bit_expr_FU_242_i0_fu_kmp_38537_40997),
    .in5(out_extract_bit_expr_FU_243_i0_fu_kmp_38537_41000),
    .in6(out_extract_bit_expr_FU_244_i0_fu_kmp_38537_41003),
    .in7(out_extract_bit_expr_FU_245_i0_fu_kmp_38537_41006),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_41012 (.out1(out_extract_bit_expr_FU_247_i0_fu_kmp_38537_41012),
    .in1(out_reg_28_reg_28),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3)) fu_kmp_38537_41015 (.out1(out_extract_bit_expr_FU_248_i0_fu_kmp_38537_41015),
    .in1(out_reg_28_reg_28),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41018 (.out1(out_extract_bit_expr_FU_249_i0_fu_kmp_38537_41018),
    .in1(out_reg_28_reg_28),
    .in2(out_const_10));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41021 (.out1(out_extract_bit_expr_FU_250_i0_fu_kmp_38537_41021),
    .in1(out_reg_28_reg_28),
    .in2(out_const_17));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41024 (.out1(out_extract_bit_expr_FU_251_i0_fu_kmp_38537_41024),
    .in1(out_reg_28_reg_28),
    .in2(out_const_21));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_41027 (.out1(out_lut_expr_FU_252_i0_fu_kmp_38537_41027),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_247_i0_fu_kmp_38537_41012),
    .in3(out_extract_bit_expr_FU_248_i0_fu_kmp_38537_41015),
    .in4(out_extract_bit_expr_FU_249_i0_fu_kmp_38537_41018),
    .in5(out_extract_bit_expr_FU_250_i0_fu_kmp_38537_41021),
    .in6(out_extract_bit_expr_FU_251_i0_fu_kmp_38537_41024),
    .in7(out_lut_expr_FU_246_i0_fu_kmp_38537_41009),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41030 (.out1(out_extract_bit_expr_FU_253_i0_fu_kmp_38537_41030),
    .in1(out_reg_28_reg_28),
    .in2(out_const_24));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41033 (.out1(out_extract_bit_expr_FU_254_i0_fu_kmp_38537_41033),
    .in1(out_reg_28_reg_28),
    .in2(out_const_29));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41036 (.out1(out_extract_bit_expr_FU_255_i0_fu_kmp_38537_41036),
    .in1(out_reg_28_reg_28),
    .in2(out_const_32));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41039 (.out1(out_extract_bit_expr_FU_256_i0_fu_kmp_38537_41039),
    .in1(out_reg_28_reg_28),
    .in2(out_const_36));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4)) fu_kmp_38537_41042 (.out1(out_extract_bit_expr_FU_257_i0_fu_kmp_38537_41042),
    .in1(out_reg_28_reg_28),
    .in2(out_const_39));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_41045 (.out1(out_lut_expr_FU_258_i0_fu_kmp_38537_41045),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_253_i0_fu_kmp_38537_41030),
    .in3(out_extract_bit_expr_FU_254_i0_fu_kmp_38537_41033),
    .in4(out_extract_bit_expr_FU_255_i0_fu_kmp_38537_41036),
    .in5(out_extract_bit_expr_FU_256_i0_fu_kmp_38537_41039),
    .in6(out_extract_bit_expr_FU_257_i0_fu_kmp_38537_41042),
    .in7(out_lut_expr_FU_252_i0_fu_kmp_38537_41027),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41048 (.out1(out_extract_bit_expr_FU_259_i0_fu_kmp_38537_41048),
    .in1(out_reg_28_reg_28),
    .in2(out_const_11));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41051 (.out1(out_extract_bit_expr_FU_260_i0_fu_kmp_38537_41051),
    .in1(out_reg_28_reg_28),
    .in2(out_const_16));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41054 (.out1(out_extract_bit_expr_FU_261_i0_fu_kmp_38537_41054),
    .in1(out_reg_28_reg_28),
    .in2(out_const_18));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41057 (.out1(out_extract_bit_expr_FU_262_i0_fu_kmp_38537_41057),
    .in1(out_reg_28_reg_28),
    .in2(out_const_19));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41060 (.out1(out_extract_bit_expr_FU_263_i0_fu_kmp_38537_41060),
    .in1(out_reg_28_reg_28),
    .in2(out_const_22));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_41063 (.out1(out_lut_expr_FU_264_i0_fu_kmp_38537_41063),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_259_i0_fu_kmp_38537_41048),
    .in3(out_extract_bit_expr_FU_260_i0_fu_kmp_38537_41051),
    .in4(out_extract_bit_expr_FU_261_i0_fu_kmp_38537_41054),
    .in5(out_extract_bit_expr_FU_262_i0_fu_kmp_38537_41057),
    .in6(out_extract_bit_expr_FU_263_i0_fu_kmp_38537_41060),
    .in7(out_lut_expr_FU_258_i0_fu_kmp_38537_41045),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41066 (.out1(out_extract_bit_expr_FU_265_i0_fu_kmp_38537_41066),
    .in1(out_reg_28_reg_28),
    .in2(out_const_23));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41069 (.out1(out_extract_bit_expr_FU_266_i0_fu_kmp_38537_41069),
    .in1(out_reg_28_reg_28),
    .in2(out_const_25));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41072 (.out1(out_extract_bit_expr_FU_267_i0_fu_kmp_38537_41072),
    .in1(out_reg_28_reg_28),
    .in2(out_const_26));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41075 (.out1(out_extract_bit_expr_FU_268_i0_fu_kmp_38537_41075),
    .in1(out_reg_28_reg_28),
    .in2(out_const_30));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41078 (.out1(out_extract_bit_expr_FU_269_i0_fu_kmp_38537_41078),
    .in1(out_reg_28_reg_28),
    .in2(out_const_31));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_41081 (.out1(out_lut_expr_FU_270_i0_fu_kmp_38537_41081),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_265_i0_fu_kmp_38537_41066),
    .in3(out_extract_bit_expr_FU_266_i0_fu_kmp_38537_41069),
    .in4(out_extract_bit_expr_FU_267_i0_fu_kmp_38537_41072),
    .in5(out_extract_bit_expr_FU_268_i0_fu_kmp_38537_41075),
    .in6(out_extract_bit_expr_FU_269_i0_fu_kmp_38537_41078),
    .in7(out_lut_expr_FU_264_i0_fu_kmp_38537_41063),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41084 (.out1(out_extract_bit_expr_FU_271_i0_fu_kmp_38537_41084),
    .in1(out_reg_28_reg_28),
    .in2(out_const_33));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41087 (.out1(out_extract_bit_expr_FU_272_i0_fu_kmp_38537_41087),
    .in1(out_reg_28_reg_28),
    .in2(out_const_34));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41090 (.out1(out_extract_bit_expr_FU_273_i0_fu_kmp_38537_41090),
    .in1(out_reg_28_reg_28),
    .in2(out_const_37));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41093 (.out1(out_extract_bit_expr_FU_274_i0_fu_kmp_38537_41093),
    .in1(out_reg_28_reg_28),
    .in2(out_const_38));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41096 (.out1(out_extract_bit_expr_FU_275_i0_fu_kmp_38537_41096),
    .in1(out_reg_28_reg_28),
    .in2(out_const_40));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_kmp_38537_41099 (.out1(out_lut_expr_FU_276_i0_fu_kmp_38537_41099),
    .in1(out_const_12),
    .in2(out_extract_bit_expr_FU_271_i0_fu_kmp_38537_41084),
    .in3(out_extract_bit_expr_FU_272_i0_fu_kmp_38537_41087),
    .in4(out_extract_bit_expr_FU_273_i0_fu_kmp_38537_41090),
    .in5(out_extract_bit_expr_FU_274_i0_fu_kmp_38537_41093),
    .in6(out_extract_bit_expr_FU_275_i0_fu_kmp_38537_41096),
    .in7(out_lut_expr_FU_270_i0_fu_kmp_38537_41081),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_kmp_38537_41102 (.out1(out_extract_bit_expr_FU_277_i0_fu_kmp_38537_41102),
    .in1(out_reg_28_reg_28),
    .in2(out_const_42));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41106 (.out1(out_extract_bit_expr_FU_283_i0_fu_kmp_38537_41106),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41109 (.out1(out_extract_bit_expr_FU_284_i0_fu_kmp_38537_41109),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41112 (.out1(out_extract_bit_expr_FU_285_i0_fu_kmp_38537_41112),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41115 (.out1(out_extract_bit_expr_FU_286_i0_fu_kmp_38537_41115),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_41118 (.out1(out_lut_expr_FU_287_i0_fu_kmp_38537_41118),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_283_i0_fu_kmp_38537_41106),
    .in3(out_extract_bit_expr_FU_284_i0_fu_kmp_38537_41109),
    .in4(out_extract_bit_expr_FU_285_i0_fu_kmp_38537_41112),
    .in5(out_extract_bit_expr_FU_286_i0_fu_kmp_38537_41115),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41121 (.out1(out_extract_bit_expr_FU_288_i0_fu_kmp_38537_41121),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41124 (.out1(out_extract_bit_expr_FU_289_i0_fu_kmp_38537_41124),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41127 (.out1(out_extract_bit_expr_FU_290_i0_fu_kmp_38537_41127),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41130 (.out1(out_extract_bit_expr_FU_291_i0_fu_kmp_38537_41130),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_kmp_38537_41133 (.out1(out_lut_expr_FU_292_i0_fu_kmp_38537_41133),
    .in1(out_const_14),
    .in2(out_extract_bit_expr_FU_288_i0_fu_kmp_38537_41121),
    .in3(out_extract_bit_expr_FU_289_i0_fu_kmp_38537_41124),
    .in4(out_extract_bit_expr_FU_290_i0_fu_kmp_38537_41127),
    .in5(out_extract_bit_expr_FU_291_i0_fu_kmp_38537_41130),
    .in6(out_lut_expr_FU_287_i0_fu_kmp_38537_41118),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41136 (.out1(out_extract_bit_expr_FU_293_i0_fu_kmp_38537_41136),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41139 (.out1(out_extract_bit_expr_FU_294_i0_fu_kmp_38537_41139),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41142 (.out1(out_extract_bit_expr_FU_295_i0_fu_kmp_38537_41142),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41145 (.out1(out_extract_bit_expr_FU_296_i0_fu_kmp_38537_41145),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_41148 (.out1(out_lut_expr_FU_297_i0_fu_kmp_38537_41148),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_293_i0_fu_kmp_38537_41136),
    .in3(out_extract_bit_expr_FU_294_i0_fu_kmp_38537_41139),
    .in4(out_extract_bit_expr_FU_295_i0_fu_kmp_38537_41142),
    .in5(out_extract_bit_expr_FU_296_i0_fu_kmp_38537_41145),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41151 (.out1(out_extract_bit_expr_FU_298_i0_fu_kmp_38537_41151),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41154 (.out1(out_extract_bit_expr_FU_299_i0_fu_kmp_38537_41154),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41157 (.out1(out_extract_bit_expr_FU_300_i0_fu_kmp_38537_41157),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41160 (.out1(out_extract_bit_expr_FU_301_i0_fu_kmp_38537_41160),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41164 (.out1(out_extract_bit_expr_FU_314_i0_fu_kmp_38537_41164),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41167 (.out1(out_extract_bit_expr_FU_315_i0_fu_kmp_38537_41167),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_7));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41170 (.out1(out_extract_bit_expr_FU_316_i0_fu_kmp_38537_41170),
    .in1(out_reg_37_reg_37),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1)) fu_kmp_38537_41173 (.out1(out_extract_bit_expr_FU_317_i0_fu_kmp_38537_41173),
    .in1(out_reg_37_reg_37),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_41176 (.out1(out_lut_expr_FU_318_i0_fu_kmp_38537_41176),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_314_i0_fu_kmp_38537_41164),
    .in3(out_extract_bit_expr_FU_315_i0_fu_kmp_38537_41167),
    .in4(out_reg_46_reg_46),
    .in5(out_reg_47_reg_47),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41179 (.out1(out_extract_bit_expr_FU_319_i0_fu_kmp_38537_41179),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41182 (.out1(out_extract_bit_expr_FU_320_i0_fu_kmp_38537_41182),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_27));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41185 (.out1(out_extract_bit_expr_FU_321_i0_fu_kmp_38537_41185),
    .in1(out_reg_37_reg_37),
    .in2(out_const_8));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(2)) fu_kmp_38537_41188 (.out1(out_extract_bit_expr_FU_322_i0_fu_kmp_38537_41188),
    .in1(out_reg_37_reg_37),
    .in2(out_const_27));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_kmp_38537_41191 (.out1(out_lut_expr_FU_323_i0_fu_kmp_38537_41191),
    .in1(out_const_14),
    .in2(out_extract_bit_expr_FU_319_i0_fu_kmp_38537_41179),
    .in3(out_extract_bit_expr_FU_320_i0_fu_kmp_38537_41182),
    .in4(out_reg_48_reg_48),
    .in5(out_reg_49_reg_49),
    .in6(out_lut_expr_FU_318_i0_fu_kmp_38537_41176),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41194 (.out1(out_extract_bit_expr_FU_324_i0_fu_kmp_38537_41194),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41197 (.out1(out_extract_bit_expr_FU_325_i0_fu_kmp_38537_41197),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_35));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41200 (.out1(out_extract_bit_expr_FU_326_i0_fu_kmp_38537_41200),
    .in1(out_reg_37_reg_37),
    .in2(out_const_28));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41203 (.out1(out_extract_bit_expr_FU_327_i0_fu_kmp_38537_41203),
    .in1(out_reg_37_reg_37),
    .in2(out_const_35));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_kmp_38537_41206 (.out1(out_lut_expr_FU_328_i0_fu_kmp_38537_41206),
    .in1(out_const_13),
    .in2(out_extract_bit_expr_FU_324_i0_fu_kmp_38537_41194),
    .in3(out_extract_bit_expr_FU_325_i0_fu_kmp_38537_41197),
    .in4(out_reg_50_reg_50),
    .in5(out_reg_51_reg_51),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41209 (.out1(out_extract_bit_expr_FU_329_i0_fu_kmp_38537_41209),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41212 (.out1(out_extract_bit_expr_FU_330_i0_fu_kmp_38537_41212),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_I_32_I_8),
    .in2(out_const_20));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41215 (.out1(out_extract_bit_expr_FU_331_i0_fu_kmp_38537_41215),
    .in1(out_reg_37_reg_37),
    .in2(out_const_9));
  extract_bit_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3)) fu_kmp_38537_41218 (.out1(out_extract_bit_expr_FU_332_i0_fu_kmp_38537_41218),
    .in1(out_reg_37_reg_37),
    .in2(out_const_20));
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
    .in1(out_MUX_840_reg_0_0_0_1),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_841_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i2_fu_kmp_38537_38827),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i9_fu_kmp_38537_39782),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i1_BMEMORY_CTRLN_335_i0_32_8),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_110_i0_fu_kmp_38537_40757),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_111_i0_fu_kmp_38537_40760),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_112_i0_fu_kmp_38537_40772),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_113_i0_fu_kmp_38537_40775),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_114_i0_fu_kmp_38537_40787),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_115_i0_fu_kmp_38537_40790),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_116_i0_fu_kmp_38537_40802),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_852_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_117_i0_fu_kmp_38537_40805),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_854_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i0_fu_kmp_38537_38784),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_158_i0_fu_kmp_38537_40358),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_160_i0_fu_kmp_38537_40754),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_858_reg_25_0_0_1),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out_BMEMORY_CTRLN_335_i0_BMEMORY_CTRLN_335_i0_32_8),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_reg_25_reg_25),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_861_reg_28_0_0_1),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_862_reg_29_0_0_0),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_863_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_346_i0_fu_kmp_38537_38923),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_338_i3_fu_kmp_38537_38928),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_281_i0_fu_kmp_38537_38948),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_344_i0_fu_kmp_38537_40010),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_868_reg_34_0_0_1),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_280_i0_fu_kmp_38537_38911),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i6_fu_kmp_38537_38954),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_871_reg_37_0_0_0),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_303_i0_fu_kmp_38537_40939),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_304_i0_fu_kmp_38537_40942),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu_kmp_38537_38940),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_305_i0_fu_kmp_38537_40954),
    .wenable(wrenable_reg_40));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_306_i0_fu_kmp_38537_40957),
    .wenable(wrenable_reg_41));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_307_i0_fu_kmp_38537_40969),
    .wenable(wrenable_reg_42));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_308_i0_fu_kmp_38537_40972),
    .wenable(wrenable_reg_43));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_309_i0_fu_kmp_38537_40984),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_310_i0_fu_kmp_38537_40987),
    .wenable(wrenable_reg_45));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_316_i0_fu_kmp_38537_41170),
    .wenable(wrenable_reg_46));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_317_i0_fu_kmp_38537_41173),
    .wenable(wrenable_reg_47));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_321_i0_fu_kmp_38537_41185),
    .wenable(wrenable_reg_48));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_322_i0_fu_kmp_38537_41188),
    .wenable(wrenable_reg_49));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i1_fu_kmp_38537_38794),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_326_i0_fu_kmp_38537_41200),
    .wenable(wrenable_reg_50));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_327_i0_fu_kmp_38537_41203),
    .wenable(wrenable_reg_51));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_331_i0_fu_kmp_38537_41215),
    .wenable(wrenable_reg_52));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_extract_bit_expr_FU_332_i0_fu_kmp_38537_41218),
    .wenable(wrenable_reg_53));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_890_reg_54_0_0_0),
    .wenable(wrenable_reg_54));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_215_i0_fu_kmp_38537_38871),
    .wenable(wrenable_reg_55));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i5_fu_kmp_38537_38898),
    .wenable(wrenable_reg_56));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i4_fu_kmp_38537_38876),
    .wenable(wrenable_reg_57));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_88_i0_fu_kmp_38537_38819),
    .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_350_i8_fu_kmp_38537_39774),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_337_i0_fu_kmp_38537_39994),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_85_i0_fu_kmp_38537_38760),
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
  assign return_port = out_conv_out_const_0_I_1_I_32;
  assign OUT_CONDITION_kmp_38537_38738 = out_read_cond_FU_32_i0_fu_kmp_38537_38738;
  assign OUT_CONDITION_kmp_38537_38822 = out_read_cond_FU_37_i0_fu_kmp_38537_38822;
  assign OUT_CONDITION_kmp_38537_38824 = out_read_cond_FU_89_i0_fu_kmp_38537_38824;
  assign OUT_CONDITION_kmp_38537_38829 = out_read_cond_FU_118_i0_fu_kmp_38537_38829;
  assign OUT_CONDITION_kmp_38537_38896 = out_read_cond_FU_216_i0_fu_kmp_38537_38896;
  assign OUT_CONDITION_kmp_38537_38900 = out_read_cond_FU_230_i0_fu_kmp_38537_38900;
  assign OUT_CONDITION_kmp_38537_38926 = out_read_cond_FU_233_i0_fu_kmp_38537_38926;
  assign OUT_CONDITION_kmp_38537_38937 = out_read_cond_FU_236_i0_fu_kmp_38537_38937;
  assign OUT_CONDITION_kmp_38537_38946 = out_read_cond_FU_282_i0_fu_kmp_38537_38946;
  assign OUT_CONDITION_kmp_38537_38956 = out_read_cond_FU_311_i0_fu_kmp_38537_38956;
  assign OUT_CONDITION_kmp_38537_38969 = out_read_cond_FU_334_i0_fu_kmp_38537_38969;
  assign OUT_MULTIIF_kmp_38537_40355 = out_multi_read_cond_FU_174_i0_fu_kmp_38537_40355;

endmodule

// FSM based controller description for kmp
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_kmp(done_port,
  fuselector_BMEMORY_CTRLN_335_i0_LOAD,
  fuselector_BMEMORY_CTRLN_335_i0_STORE,
  fuselector_BMEMORY_CTRLN_335_i1_LOAD,
  fuselector_BMEMORY_CTRLN_335_i1_STORE,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0,
  selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0,
  selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1,
  selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0,
  selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0,
  selector_MUX_840_reg_0_0_0_0,
  selector_MUX_840_reg_0_0_0_1,
  selector_MUX_841_reg_1_0_0_0,
  selector_MUX_852_reg_2_0_0_0,
  selector_MUX_854_reg_21_0_0_0,
  selector_MUX_858_reg_25_0_0_0,
  selector_MUX_858_reg_25_0_0_1,
  selector_MUX_861_reg_28_0_0_0,
  selector_MUX_861_reg_28_0_0_1,
  selector_MUX_862_reg_29_0_0_0,
  selector_MUX_863_reg_3_0_0_0,
  selector_MUX_868_reg_34_0_0_0,
  selector_MUX_868_reg_34_0_0_1,
  selector_MUX_871_reg_37_0_0_0,
  selector_MUX_890_reg_54_0_0_0,
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
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_kmp_38537_38738,
  OUT_CONDITION_kmp_38537_38822,
  OUT_CONDITION_kmp_38537_38824,
  OUT_CONDITION_kmp_38537_38829,
  OUT_CONDITION_kmp_38537_38896,
  OUT_CONDITION_kmp_38537_38900,
  OUT_CONDITION_kmp_38537_38926,
  OUT_CONDITION_kmp_38537_38937,
  OUT_CONDITION_kmp_38537_38946,
  OUT_CONDITION_kmp_38537_38956,
  OUT_CONDITION_kmp_38537_38969,
  OUT_MULTIIF_kmp_38537_40355,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_kmp_38537_38738;
  input OUT_CONDITION_kmp_38537_38822;
  input OUT_CONDITION_kmp_38537_38824;
  input OUT_CONDITION_kmp_38537_38829;
  input OUT_CONDITION_kmp_38537_38896;
  input OUT_CONDITION_kmp_38537_38900;
  input OUT_CONDITION_kmp_38537_38926;
  input OUT_CONDITION_kmp_38537_38937;
  input OUT_CONDITION_kmp_38537_38946;
  input OUT_CONDITION_kmp_38537_38956;
  input OUT_CONDITION_kmp_38537_38969;
  input [1:0] OUT_MULTIIF_kmp_38537_40355;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_335_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_335_i0_STORE;
  output fuselector_BMEMORY_CTRLN_335_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_335_i1_STORE;
  output selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0;
  output selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1;
  output selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2;
  output selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3;
  output selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0;
  output selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1;
  output selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0;
  output selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0;
  output selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0;
  output selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1;
  output selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2;
  output selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3;
  output selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0;
  output selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1;
  output selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0;
  output selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0;
  output selector_MUX_840_reg_0_0_0_0;
  output selector_MUX_840_reg_0_0_0_1;
  output selector_MUX_841_reg_1_0_0_0;
  output selector_MUX_852_reg_2_0_0_0;
  output selector_MUX_854_reg_21_0_0_0;
  output selector_MUX_858_reg_25_0_0_0;
  output selector_MUX_858_reg_25_0_0_1;
  output selector_MUX_861_reg_28_0_0_0;
  output selector_MUX_861_reg_28_0_0_1;
  output selector_MUX_862_reg_29_0_0_0;
  output selector_MUX_863_reg_3_0_0_0;
  output selector_MUX_868_reg_34_0_0_0;
  output selector_MUX_868_reg_34_0_0_1;
  output selector_MUX_871_reg_37_0_0_0;
  output selector_MUX_890_reg_54_0_0_0;
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
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [29:0] S_0 = 30'b000000000000000000000000000001,
    S_5 = 30'b000000000000000000000000100000,
    S_6 = 30'b000000000000000000000001000000,
    S_7 = 30'b000000000000000000000010000000,
    S_8 = 30'b000000000000000000000100000000,
    S_9 = 30'b000000000000000000001000000000,
    S_10 = 30'b000000000000000000010000000000,
    S_11 = 30'b000000000000000000100000000000,
    S_12 = 30'b000000000000000001000000000000,
    S_13 = 30'b000000000000000010000000000000,
    S_1 = 30'b000000000000000000000000000010,
    S_2 = 30'b000000000000000000000000000100,
    S_3 = 30'b000000000000000000000000001000,
    S_4 = 30'b000000000000000000000000010000,
    S_22 = 30'b000000010000000000000000000000,
    S_23 = 30'b000000100000000000000000000000,
    S_24 = 30'b000001000000000000000000000000,
    S_25 = 30'b000010000000000000000000000000,
    S_26 = 30'b000100000000000000000000000000,
    S_14 = 30'b000000000000000100000000000000,
    S_15 = 30'b000000000000001000000000000000,
    S_28 = 30'b010000000000000000000000000000,
    S_29 = 30'b100000000000000000000000000000,
    S_16 = 30'b000000000000010000000000000000,
    S_17 = 30'b000000000000100000000000000000,
    S_18 = 30'b000000000001000000000000000000,
    S_19 = 30'b000000000010000000000000000000,
    S_20 = 30'b000000000100000000000000000000,
    S_21 = 30'b000000001000000000000000000000,
    S_27 = 30'b001000000000000000000000000000;
  reg [29:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_335_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_335_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_335_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_335_i1_STORE;
  reg selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0;
  reg selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1;
  reg selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2;
  reg selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3;
  reg selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0;
  reg selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1;
  reg selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0;
  reg selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0;
  reg selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0;
  reg selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1;
  reg selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2;
  reg selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3;
  reg selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0;
  reg selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1;
  reg selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0;
  reg selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0;
  reg selector_MUX_840_reg_0_0_0_0;
  reg selector_MUX_840_reg_0_0_0_1;
  reg selector_MUX_841_reg_1_0_0_0;
  reg selector_MUX_852_reg_2_0_0_0;
  reg selector_MUX_854_reg_21_0_0_0;
  reg selector_MUX_858_reg_25_0_0_0;
  reg selector_MUX_858_reg_25_0_0_1;
  reg selector_MUX_861_reg_28_0_0_0;
  reg selector_MUX_861_reg_28_0_0_1;
  reg selector_MUX_862_reg_29_0_0_0;
  reg selector_MUX_863_reg_3_0_0_0;
  reg selector_MUX_868_reg_34_0_0_0;
  reg selector_MUX_868_reg_34_0_0_1;
  reg selector_MUX_871_reg_37_0_0_0;
  reg selector_MUX_890_reg_54_0_0_0;
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
    fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_335_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_335_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_335_i1_STORE = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 = 1'b0;
    selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0 = 1'b0;
    selector_MUX_840_reg_0_0_0_0 = 1'b0;
    selector_MUX_840_reg_0_0_0_1 = 1'b0;
    selector_MUX_841_reg_1_0_0_0 = 1'b0;
    selector_MUX_852_reg_2_0_0_0 = 1'b0;
    selector_MUX_854_reg_21_0_0_0 = 1'b0;
    selector_MUX_858_reg_25_0_0_0 = 1'b0;
    selector_MUX_858_reg_25_0_0_1 = 1'b0;
    selector_MUX_861_reg_28_0_0_0 = 1'b0;
    selector_MUX_861_reg_28_0_0_1 = 1'b0;
    selector_MUX_862_reg_29_0_0_0 = 1'b0;
    selector_MUX_863_reg_3_0_0_0 = 1'b0;
    selector_MUX_868_reg_34_0_0_0 = 1'b0;
    selector_MUX_868_reg_34_0_0_1 = 1'b0;
    selector_MUX_871_reg_37_0_0_0 = 1'b0;
    selector_MUX_890_reg_54_0_0_0 = 1'b0;
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
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          fuselector_BMEMORY_CTRLN_335_i1_STORE = 1'b1;
          selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3 = 1'b1;
          selector_MUX_841_reg_1_0_0_0 = 1'b1;
          selector_MUX_852_reg_2_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_5;
        end
        else
        begin
          _next_state = S_0;
        end
      S_5 :
        begin
          selector_MUX_858_reg_25_0_0_1 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38824 == 1'b1)
            begin
              _next_state = S_8;
              wrenable_reg_5 = 1'b0;
              wrenable_reg_6 = 1'b0;
              wrenable_reg_7 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              selector_MUX_858_reg_25_0_0_1 = 1'b0;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_9 = 1'b0;
            end
        end
      S_6 :
        begin
          fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_335_i1_LOAD = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0 = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          wrenable_reg_12 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_2;
        end
      S_8 :
        begin
          fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_335_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          selector_MUX_854_reg_21_0_0_0 = 1'b1;
          selector_MUX_858_reg_25_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_25 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38829 == 1'b1)
            begin
              _next_state = S_10;
              selector_MUX_854_reg_21_0_0_0 = 1'b0;
              selector_MUX_858_reg_25_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
              wrenable_reg_25 = 1'b0;
            end
          else
            begin
              _next_state = S_3;
              wrenable_reg_12 = 1'b0;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_15 = 1'b0;
              wrenable_reg_16 = 1'b0;
              wrenable_reg_17 = 1'b0;
              wrenable_reg_18 = 1'b0;
              wrenable_reg_19 = 1'b0;
              wrenable_reg_20 = 1'b0;
            end
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          selector_MUX_840_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          casez (OUT_MULTIIF_kmp_38537_40355)
            2'b?1 :
              begin
                _next_state = S_2;
              end
            2'b10 :
              begin
                _next_state = S_1;
                selector_MUX_840_reg_0_0_0_0 = 1'b0;
                wrenable_reg_0 = 1'b0;
                wrenable_reg_26 = 1'b0;
              end
            default:
              begin
                _next_state = S_3;
                selector_MUX_840_reg_0_0_0_0 = 1'b0;
                wrenable_reg_0 = 1'b0;
                wrenable_reg_26 = 1'b0;
              end
          endcase
        end
      S_1 :
        begin
          _next_state = S_1;
        end
      S_2 :
        begin
          selector_MUX_854_reg_21_0_0_0 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_27 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38738 == 1'b1)
            begin
              _next_state = S_3;
              wrenable_reg_27 = 1'b0;
            end
          else
            begin
              _next_state = S_4;
              selector_MUX_854_reg_21_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
        end
      S_3 :
        begin
          selector_MUX_840_reg_0_0_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_27 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_335_i1_STORE = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38822 == 1'b1)
            begin
              _next_state = S_5;
              wrenable_reg_28 = 1'b0;
              wrenable_reg_29 = 1'b0;
            end
          else
            begin
              _next_state = S_22;
            end
        end
      S_22 :
        begin
          selector_MUX_868_reg_34_0_0_0 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38946 == 1'b1)
            begin
              _next_state = S_25;
              wrenable_reg_32 = 1'b0;
            end
          else
            begin
              _next_state = S_23;
              selector_MUX_868_reg_34_0_0_0 = 1'b0;
              wrenable_reg_34 = 1'b0;
              wrenable_reg_35 = 1'b0;
              wrenable_reg_36 = 1'b0;
            end
        end
      S_23 :
        begin
          fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1 = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          selector_MUX_871_reg_37_0_0_0 = 1'b1;
          wrenable_reg_37 = 1'b1;
          _next_state = S_28;
        end
      S_25 :
        begin
          fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_335_i1_LOAD = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0 = 1'b1;
          _next_state = S_26;
        end
      S_26 :
        begin
          selector_MUX_890_reg_54_0_0_0 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_54 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38956 == 1'b1)
            begin
              _next_state = S_14;
              selector_MUX_890_reg_54_0_0_0 = 1'b0;
              wrenable_reg_54 = 1'b0;
            end
          else
            begin
              _next_state = S_18;
              wrenable_reg_34 = 1'b0;
              wrenable_reg_37 = 1'b0;
              wrenable_reg_38 = 1'b0;
              wrenable_reg_39 = 1'b0;
              wrenable_reg_40 = 1'b0;
              wrenable_reg_41 = 1'b0;
              wrenable_reg_42 = 1'b0;
              wrenable_reg_43 = 1'b0;
              wrenable_reg_44 = 1'b0;
              wrenable_reg_45 = 1'b0;
            end
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_335_i1_LOAD = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          selector_MUX_861_reg_28_0_0_0 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_54 = 1'b1;
          wrenable_reg_55 = 1'b1;
          wrenable_reg_56 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38896 == 1'b1)
            begin
              _next_state = S_16;
              selector_MUX_861_reg_28_0_0_0 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
          else
            begin
              _next_state = S_28;
              wrenable_reg_54 = 1'b0;
              wrenable_reg_55 = 1'b0;
              wrenable_reg_56 = 1'b0;
            end
        end
      S_28 :
        begin
          fuselector_BMEMORY_CTRLN_335_i0_LOAD = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3 = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          wrenable_reg_52 = 1'b1;
          wrenable_reg_53 = 1'b1;
          _next_state = S_29;
        end
      S_29 :
        begin
          selector_MUX_890_reg_54_0_0_0 = 1'b1;
          wrenable_reg_54 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38969 == 1'b1)
            begin
              _next_state = S_18;
            end
          else
            begin
              _next_state = S_21;
              selector_MUX_890_reg_54_0_0_0 = 1'b0;
              wrenable_reg_54 = 1'b0;
            end
        end
      S_16 :
        begin
          fuselector_BMEMORY_CTRLN_335_i1_LOAD = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0 = 1'b1;
          _next_state = S_17;
        end
      S_17 :
        begin
          selector_MUX_868_reg_34_0_0_1 = 1'b1;
          wrenable_reg_34 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38900 == 1'b1)
            begin
              _next_state = S_14;
            end
          else
            begin
              _next_state = S_18;
              selector_MUX_868_reg_34_0_0_1 = 1'b0;
              wrenable_reg_34 = 1'b0;
            end
        end
      S_18 :
        begin
          selector_MUX_861_reg_28_0_0_1 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_57 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38926 == 1'b1)
            begin
              _next_state = S_19;
              selector_MUX_861_reg_28_0_0_1 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
          else
            begin
              _next_state = S_21;
              wrenable_reg_57 = 1'b0;
            end
        end
      S_19 :
        begin
          fuselector_BMEMORY_CTRLN_335_i1_LOAD = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0 = 1'b1;
          _next_state = S_20;
        end
      S_20 :
        begin
          selector_MUX_861_reg_28_0_0_0 = 1'b1;
          selector_MUX_862_reg_29_0_0_0 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          selector_MUX_863_reg_3_0_0_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          if (OUT_CONDITION_kmp_38537_38937 == 1'b1)
            begin
              _next_state = S_22;
            end
          else
            begin
              _next_state = S_27;
              done_port = 1'b1;
              selector_MUX_863_reg_3_0_0_0 = 1'b0;
              wrenable_reg_3 = 1'b0;
            end
        end
      S_27 :
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

// Top component for kmp
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module kmp(clock,
  reset,
  start_port,
  done_port,
  pattern,
  #~@input#~@,
  kmpNext,
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
  input [31:0] pattern;
  input [31:0] #~@input#~@;
  input [31:0] kmpNext;
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
  wire OUT_CONDITION_kmp_38537_38738;
  wire OUT_CONDITION_kmp_38537_38822;
  wire OUT_CONDITION_kmp_38537_38824;
  wire OUT_CONDITION_kmp_38537_38829;
  wire OUT_CONDITION_kmp_38537_38896;
  wire OUT_CONDITION_kmp_38537_38900;
  wire OUT_CONDITION_kmp_38537_38926;
  wire OUT_CONDITION_kmp_38537_38937;
  wire OUT_CONDITION_kmp_38537_38946;
  wire OUT_CONDITION_kmp_38537_38956;
  wire OUT_CONDITION_kmp_38537_38969;
  wire [1:0] OUT_MULTIIF_kmp_38537_40355;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_335_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_335_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_335_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_335_i1_STORE;
  wire selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0;
  wire selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1;
  wire selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2;
  wire selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3;
  wire selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0;
  wire selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1;
  wire selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0;
  wire selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0;
  wire selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0;
  wire selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1;
  wire selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2;
  wire selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3;
  wire selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0;
  wire selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1;
  wire selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0;
  wire selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0;
  wire selector_MUX_840_reg_0_0_0_0;
  wire selector_MUX_840_reg_0_0_0_1;
  wire selector_MUX_841_reg_1_0_0_0;
  wire selector_MUX_852_reg_2_0_0_0;
  wire selector_MUX_854_reg_21_0_0_0;
  wire selector_MUX_858_reg_25_0_0_0;
  wire selector_MUX_858_reg_25_0_0_1;
  wire selector_MUX_861_reg_28_0_0_0;
  wire selector_MUX_861_reg_28_0_0_1;
  wire selector_MUX_862_reg_29_0_0_0;
  wire selector_MUX_863_reg_3_0_0_0;
  wire selector_MUX_868_reg_34_0_0_0;
  wire selector_MUX_868_reg_34_0_0_1;
  wire selector_MUX_871_reg_37_0_0_0;
  wire selector_MUX_890_reg_54_0_0_0;
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
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_kmp Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_335_i0_LOAD(fuselector_BMEMORY_CTRLN_335_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_335_i0_STORE(fuselector_BMEMORY_CTRLN_335_i0_STORE),
    .fuselector_BMEMORY_CTRLN_335_i1_LOAD(fuselector_BMEMORY_CTRLN_335_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_335_i1_STORE(fuselector_BMEMORY_CTRLN_335_i1_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0(selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0),
    .selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0(selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0),
    .selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0(selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0),
    .selector_MUX_840_reg_0_0_0_0(selector_MUX_840_reg_0_0_0_0),
    .selector_MUX_840_reg_0_0_0_1(selector_MUX_840_reg_0_0_0_1),
    .selector_MUX_841_reg_1_0_0_0(selector_MUX_841_reg_1_0_0_0),
    .selector_MUX_852_reg_2_0_0_0(selector_MUX_852_reg_2_0_0_0),
    .selector_MUX_854_reg_21_0_0_0(selector_MUX_854_reg_21_0_0_0),
    .selector_MUX_858_reg_25_0_0_0(selector_MUX_858_reg_25_0_0_0),
    .selector_MUX_858_reg_25_0_0_1(selector_MUX_858_reg_25_0_0_1),
    .selector_MUX_861_reg_28_0_0_0(selector_MUX_861_reg_28_0_0_0),
    .selector_MUX_861_reg_28_0_0_1(selector_MUX_861_reg_28_0_0_1),
    .selector_MUX_862_reg_29_0_0_0(selector_MUX_862_reg_29_0_0_0),
    .selector_MUX_863_reg_3_0_0_0(selector_MUX_863_reg_3_0_0_0),
    .selector_MUX_868_reg_34_0_0_0(selector_MUX_868_reg_34_0_0_0),
    .selector_MUX_868_reg_34_0_0_1(selector_MUX_868_reg_34_0_0_1),
    .selector_MUX_871_reg_37_0_0_0(selector_MUX_871_reg_37_0_0_0),
    .selector_MUX_890_reg_54_0_0_0(selector_MUX_890_reg_54_0_0_0),
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
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_kmp_38537_38738(OUT_CONDITION_kmp_38537_38738),
    .OUT_CONDITION_kmp_38537_38822(OUT_CONDITION_kmp_38537_38822),
    .OUT_CONDITION_kmp_38537_38824(OUT_CONDITION_kmp_38537_38824),
    .OUT_CONDITION_kmp_38537_38829(OUT_CONDITION_kmp_38537_38829),
    .OUT_CONDITION_kmp_38537_38896(OUT_CONDITION_kmp_38537_38896),
    .OUT_CONDITION_kmp_38537_38900(OUT_CONDITION_kmp_38537_38900),
    .OUT_CONDITION_kmp_38537_38926(OUT_CONDITION_kmp_38537_38926),
    .OUT_CONDITION_kmp_38537_38937(OUT_CONDITION_kmp_38537_38937),
    .OUT_CONDITION_kmp_38537_38946(OUT_CONDITION_kmp_38537_38946),
    .OUT_CONDITION_kmp_38537_38956(OUT_CONDITION_kmp_38537_38956),
    .OUT_CONDITION_kmp_38537_38969(OUT_CONDITION_kmp_38537_38969),
    .OUT_MULTIIF_kmp_38537_40355(OUT_MULTIIF_kmp_38537_40355),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_kmp Datapath_i (.return_port(return_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_kmp_38537_38738(OUT_CONDITION_kmp_38537_38738),
    .OUT_CONDITION_kmp_38537_38822(OUT_CONDITION_kmp_38537_38822),
    .OUT_CONDITION_kmp_38537_38824(OUT_CONDITION_kmp_38537_38824),
    .OUT_CONDITION_kmp_38537_38829(OUT_CONDITION_kmp_38537_38829),
    .OUT_CONDITION_kmp_38537_38896(OUT_CONDITION_kmp_38537_38896),
    .OUT_CONDITION_kmp_38537_38900(OUT_CONDITION_kmp_38537_38900),
    .OUT_CONDITION_kmp_38537_38926(OUT_CONDITION_kmp_38537_38926),
    .OUT_CONDITION_kmp_38537_38937(OUT_CONDITION_kmp_38537_38937),
    .OUT_CONDITION_kmp_38537_38946(OUT_CONDITION_kmp_38537_38946),
    .OUT_CONDITION_kmp_38537_38956(OUT_CONDITION_kmp_38537_38956),
    .OUT_CONDITION_kmp_38537_38969(OUT_CONDITION_kmp_38537_38969),
    .OUT_MULTIIF_kmp_38537_40355(OUT_MULTIIF_kmp_38537_40355),
    .clock(clock),
    .reset(reset),
    .in_port_pattern(pattern),
    .in_port_input(#~@input#~@),
    .in_port_kmpNext(kmpNext),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_335_i0_LOAD(fuselector_BMEMORY_CTRLN_335_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_335_i0_STORE(fuselector_BMEMORY_CTRLN_335_i0_STORE),
    .fuselector_BMEMORY_CTRLN_335_i1_LOAD(fuselector_BMEMORY_CTRLN_335_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_335_i1_STORE(fuselector_BMEMORY_CTRLN_335_i1_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_0),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_1),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_2),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_0_3),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_0),
    .selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1(selector_MUX_0_BMEMORY_CTRLN_335_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0(selector_MUX_1_BMEMORY_CTRLN_335_i0_2_0_0),
    .selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0(selector_MUX_3_BMEMORY_CTRLN_335_i1_0_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_2),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_0_3),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_1_1),
    .selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0(selector_MUX_4_BMEMORY_CTRLN_335_i1_1_2_0),
    .selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0(selector_MUX_5_BMEMORY_CTRLN_335_i1_2_0_0),
    .selector_MUX_840_reg_0_0_0_0(selector_MUX_840_reg_0_0_0_0),
    .selector_MUX_840_reg_0_0_0_1(selector_MUX_840_reg_0_0_0_1),
    .selector_MUX_841_reg_1_0_0_0(selector_MUX_841_reg_1_0_0_0),
    .selector_MUX_852_reg_2_0_0_0(selector_MUX_852_reg_2_0_0_0),
    .selector_MUX_854_reg_21_0_0_0(selector_MUX_854_reg_21_0_0_0),
    .selector_MUX_858_reg_25_0_0_0(selector_MUX_858_reg_25_0_0_0),
    .selector_MUX_858_reg_25_0_0_1(selector_MUX_858_reg_25_0_0_1),
    .selector_MUX_861_reg_28_0_0_0(selector_MUX_861_reg_28_0_0_0),
    .selector_MUX_861_reg_28_0_0_1(selector_MUX_861_reg_28_0_0_1),
    .selector_MUX_862_reg_29_0_0_0(selector_MUX_862_reg_29_0_0_0),
    .selector_MUX_863_reg_3_0_0_0(selector_MUX_863_reg_3_0_0_0),
    .selector_MUX_868_reg_34_0_0_0(selector_MUX_868_reg_34_0_0_0),
    .selector_MUX_868_reg_34_0_0_1(selector_MUX_868_reg_34_0_0_1),
    .selector_MUX_871_reg_37_0_0_0(selector_MUX_871_reg_37_0_0_0),
    .selector_MUX_890_reg_54_0_0_0(selector_MUX_890_reg_54_0_0_0),
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
  selector_IN_UNBOUNDED_run_benchmark_38252_38986,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  OUT_UNBOUNDED_run_benchmark_38252_38986);
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
  input selector_IN_UNBOUNDED_run_benchmark_38252_38986;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_UNBOUNDED_run_benchmark_38252_38986;
  // Component and signal declarations
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39946;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39899;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39949;
  wire [31:0] out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39908;
  wire [22:0] out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39952;
  wire [22:0] out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39916;
  wire [2:0] out_const_0;
  wire [14:0] out_const_1;
  wire [31:0] out_conv_out_reg_2_reg_2_23_32;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire [22:0] out_reg_2_reg_2;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_10_i0_fu_run_benchmark_38252_39911;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_9_i0_fu_run_benchmark_38252_39903;
  wire s_done_fu_run_benchmark_38252_38986;
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
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(15),
    .value(15'b111111010100000)) const_1 (.out1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_2_reg_2_23_32 (.out1(out_conv_out_reg_2_reg_2_23_32),
    .in1(out_reg_2_reg_2));
  kmp fu_run_benchmark_38252_38986 (.done_port(s_done_fu_run_benchmark_38252_38986),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .reset(reset),
    .start_port(selector_IN_UNBOUNDED_run_benchmark_38252_38986),
    .pattern(out_conv_out_reg_2_reg_2_23_32),
    .#~@input#~@(out_reg_1_reg_1),
    .kmpNext(out_reg_0_reg_0),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39899 (.out1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39899),
    .in1(out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39946));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(15),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39903 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_9_i0_fu_run_benchmark_38252_39903),
    .in1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39899),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39908 (.out1(out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39908),
    .in1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39949));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39911 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_10_i0_fu_run_benchmark_38252_39911),
    .in1(out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39908),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_39916 (.out1(out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39916),
    .in1(out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39952));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39946 (.out1(out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39946),
    .in1(in_port_vargs));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39949 (.out1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39949),
    .in1(in_port_vargs));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_39952 (.out1(out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39952),
    .in1(in_port_vargs));
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_9_i0_fu_run_benchmark_38252_39903),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_10_i0_fu_run_benchmark_38252_39911),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39916),
    .wenable(wrenable_reg_2));
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
  assign OUT_UNBOUNDED_run_benchmark_38252_38986 = s_done_fu_run_benchmark_38252_38986;

endmodule

// FSM based controller description for run_benchmark
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_run_benchmark(done_port,
  selector_IN_UNBOUNDED_run_benchmark_38252_38986,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  OUT_UNBOUNDED_run_benchmark_38252_38986,
  clock,
  reset,
  start_port);
  // IN
  input OUT_UNBOUNDED_run_benchmark_38252_38986;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_IN_UNBOUNDED_run_benchmark_38252_38986;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  parameter [3:0] S_0 = 4'b0001,
    S_1 = 4'b0010,
    S_2 = 4'b0100,
    S_3 = 4'b1000;
  reg [3:0] _present_state=S_0, _next_state;
  reg done_port;
  reg selector_IN_UNBOUNDED_run_benchmark_38252_38986;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_IN_UNBOUNDED_run_benchmark_38252_38986 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_IN_UNBOUNDED_run_benchmark_38252_38986 = 1'b1;
          if (OUT_UNBOUNDED_run_benchmark_38252_38986 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_3;
              done_port = 1'b1;
            end
        end
      S_2 :
        begin
          if (OUT_UNBOUNDED_run_benchmark_38252_38986 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_3;
              done_port = 1'b1;
            end
        end
      S_3 :
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
  wire OUT_UNBOUNDED_run_benchmark_38252_38986;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire selector_IN_UNBOUNDED_run_benchmark_38252_38986;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  
  controller_run_benchmark Controller_i (.done_port(done_delayed_REG_signal_in),
    .selector_IN_UNBOUNDED_run_benchmark_38252_38986(selector_IN_UNBOUNDED_run_benchmark_38252_38986),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .OUT_UNBOUNDED_run_benchmark_38252_38986(OUT_UNBOUNDED_run_benchmark_38252_38986),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_run_benchmark Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_UNBOUNDED_run_benchmark_38252_38986(OUT_UNBOUNDED_run_benchmark_38252_38986),
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
    .selector_IN_UNBOUNDED_run_benchmark_38252_38986(selector_IN_UNBOUNDED_run_benchmark_38252_38986),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

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
  OUT_MULTIIF_main_38248_42358,
  OUT_MULTIIF_main_38248_42365,
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
    MEM_var_39032_74=7340032,
    MEM_var_39034_38248=2097152,
    MEM_var_39036_38248=2621440,
    MEM_var_39038_38248=3145728,
    MEM_var_39040_38248=3670016,
    MEM_var_39042_38248=4194304,
    MEM_var_39044_38248=4718592,
    MEM_var_39046_38248=5242880,
    MEM_var_39048_38248=5767168,
    MEM_var_39050_38248=6291456,
    MEM_var_39052_38248=6815744,
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
  output [1:0] OUT_MULTIIF_main_38248_42358;
  output [1:0] OUT_MULTIIF_main_38248_42365;
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
  wire [7:0] null_out_signal_array_39034_0_out1_0;
  wire [7:0] null_out_signal_array_39034_0_out1_1;
  wire [31:0] null_out_signal_array_39034_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39034_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39036_0_out1_0;
  wire [7:0] null_out_signal_array_39036_0_out1_1;
  wire [31:0] null_out_signal_array_39036_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39036_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39038_0_out1_0;
  wire [7:0] null_out_signal_array_39038_0_out1_1;
  wire [31:0] null_out_signal_array_39038_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39038_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39040_0_out1_0;
  wire [7:0] null_out_signal_array_39040_0_out1_1;
  wire [31:0] null_out_signal_array_39040_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39040_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39042_0_out1_0;
  wire [7:0] null_out_signal_array_39042_0_out1_1;
  wire [31:0] null_out_signal_array_39042_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39042_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39044_0_out1_0;
  wire [7:0] null_out_signal_array_39044_0_out1_1;
  wire [31:0] null_out_signal_array_39044_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39044_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39046_0_out1_0;
  wire [7:0] null_out_signal_array_39046_0_out1_1;
  wire [31:0] null_out_signal_array_39046_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39046_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39048_0_out1_0;
  wire [7:0] null_out_signal_array_39048_0_out1_1;
  wire [31:0] null_out_signal_array_39048_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39048_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39050_0_out1_0;
  wire [7:0] null_out_signal_array_39050_0_out1_1;
  wire [31:0] null_out_signal_array_39050_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39050_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_39052_0_out1_0;
  wire [7:0] null_out_signal_array_39052_0_out1_1;
  wire [31:0] null_out_signal_array_39052_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_39052_0_proxy_out1_1;
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
  wire [22:0] out_addr_expr_FU_17_i0_fu_main_38248_39821;
  wire [22:0] out_addr_expr_FU_18_i0_fu_main_38248_39834;
  wire [22:0] out_addr_expr_FU_19_i0_fu_main_38248_39837;
  wire [22:0] out_addr_expr_FU_20_i0_fu_main_38248_39840;
  wire [22:0] out_addr_expr_FU_21_i0_fu_main_38248_39856;
  wire [22:0] out_addr_expr_FU_22_i0_fu_main_38248_39865;
  wire [22:0] out_addr_expr_FU_23_i0_fu_main_38248_39868;
  wire [22:0] out_addr_expr_FU_24_i0_fu_main_38248_39871;
  wire [22:0] out_addr_expr_FU_25_i0_fu_main_38248_39847;
  wire [22:0] out_addr_expr_FU_26_i0_fu_main_38248_39850;
  wire [22:0] out_addr_expr_FU_27_i0_fu_main_38248_39853;
  wire [22:0] out_addr_expr_FU_28_i0_fu_main_38248_39812;
  wire [22:0] out_addr_expr_FU_29_i0_fu_main_38248_39815;
  wire [22:0] out_addr_expr_FU_30_i0_fu_main_38248_39818;
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
  wire out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39831;
  wire out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39862;
  wire out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_40025;
  wire out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_40029;
  wire signed [0:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire out_lut_expr_FU_40_i0_fu_main_38248_42361;
  wire out_lut_expr_FU_41_i0_fu_main_38248_42364;
  wire out_lut_expr_FU_51_i0_fu_main_38248_42368;
  wire out_lut_expr_FU_52_i0_fu_main_38248_42371;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i0_fu_main_38248_38405;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i1_fu_main_38248_38506;
  wire [1:0] out_multi_read_cond_FU_42_i0_fu_main_38248_42358;
  wire [1:0] out_multi_read_cond_FU_53_i0_fu_main_38248_42365;
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
  wire out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_40019;
  wire out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_40023;
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
  __assert_fail #(.MEM_var_39032_74(MEM_var_39032_74)) __assert_fail_64_i0 (.done_port(s_done___assert_fail_64_i0),
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
    .MEMORY_INIT_file_a("array_ref_39034.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39034.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_39034_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39034_0 (.out1({null_out_signal_array_39034_0_out1_1,
      null_out_signal_array_39034_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_3),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_3),
    .proxy_out1({null_out_signal_array_39034_0_proxy_out1_1,
      null_out_signal_array_39034_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39036.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39036.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_39036_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39036_0 (.out1({null_out_signal_array_39036_0_out1_1,
      null_out_signal_array_39036_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_4),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_4),
    .proxy_out1({null_out_signal_array_39036_0_proxy_out1_1,
      null_out_signal_array_39036_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39038.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39038.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_39038_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39038_0 (.out1({null_out_signal_array_39038_0_out1_1,
      null_out_signal_array_39038_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_5),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_5),
    .proxy_out1({null_out_signal_array_39038_0_proxy_out1_1,
      null_out_signal_array_39038_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39040.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39040.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_39040_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39040_0 (.out1({null_out_signal_array_39040_0_out1_1,
      null_out_signal_array_39040_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_6),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_6),
    .proxy_out1({null_out_signal_array_39040_0_proxy_out1_1,
      null_out_signal_array_39040_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39042.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39042.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_39042_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39042_0 (.out1({null_out_signal_array_39042_0_out1_1,
      null_out_signal_array_39042_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_7),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_7),
    .proxy_out1({null_out_signal_array_39042_0_proxy_out1_1,
      null_out_signal_array_39042_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39044.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39044.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_39044_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39044_0 (.out1({null_out_signal_array_39044_0_out1_1,
      null_out_signal_array_39044_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_8),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_8),
    .proxy_out1({null_out_signal_array_39044_0_proxy_out1_1,
      null_out_signal_array_39044_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39046.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39046.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_39046_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39046_0 (.out1({null_out_signal_array_39046_0_out1_1,
      null_out_signal_array_39046_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_9),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_9),
    .proxy_out1({null_out_signal_array_39046_0_proxy_out1_1,
      null_out_signal_array_39046_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39048.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39048.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_39048_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39048_0 (.out1({null_out_signal_array_39048_0_out1_1,
      null_out_signal_array_39048_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_10),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_10),
    .proxy_out1({null_out_signal_array_39048_0_proxy_out1_1,
      null_out_signal_array_39048_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39050.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39050.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_39050_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39050_0 (.out1({null_out_signal_array_39050_0_out1_1,
      null_out_signal_array_39050_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_11),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_11),
    .proxy_out1({null_out_signal_array_39050_0_proxy_out1_1,
      null_out_signal_array_39050_0_proxy_out1_0}),
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
    .MEMORY_INIT_file_a("array_ref_39052.mem"),
    .MEMORY_INIT_file_b("0_array_ref_39052.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_39052_38248),
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
    .PORTSIZE_proxy_out1(2)) array_39052_0 (.out1({null_out_signal_array_39052_0_out1_1,
      null_out_signal_array_39052_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_12),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_12),
    .proxy_out1({null_out_signal_array_39052_0_proxy_out1_1,
      null_out_signal_array_39052_0_proxy_out1_0}),
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
  constant_value #(.BITSIZE_out1(16),
    .value(16'b0111111010110000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39036_38248)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39038_38248)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39040_38248)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39042_38248)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39044_38248)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39046_38248)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39048_38248)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39050_38248)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_39052_38248)) const_18 (.out1(out_const_18));
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
    .value(MEM_var_39034_38248)) const_9 (.out1(out_const_9));
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
    .in1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_40019));
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
    .in1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_40023));
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
    .BITSIZE_out1(23)) fu_main_38248_39812 (.out1(out_addr_expr_FU_28_i0_fu_main_38248_39812),
    .in1(out_conv_out_const_9_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39815 (.out1(out_addr_expr_FU_29_i0_fu_main_38248_39815),
    .in1(out_conv_out_const_10_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39818 (.out1(out_addr_expr_FU_30_i0_fu_main_38248_39818),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39821 (.out1(out_addr_expr_FU_17_i0_fu_main_38248_39821),
    .in1(out_conv_out_const_11_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39831 (.out1(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39831),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39834 (.out1(out_addr_expr_FU_18_i0_fu_main_38248_39834),
    .in1(out_conv_out_const_12_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39837 (.out1(out_addr_expr_FU_19_i0_fu_main_38248_39837),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39840 (.out1(out_addr_expr_FU_20_i0_fu_main_38248_39840),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39847 (.out1(out_addr_expr_FU_25_i0_fu_main_38248_39847),
    .in1(out_conv_out_const_14_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39850 (.out1(out_addr_expr_FU_26_i0_fu_main_38248_39850),
    .in1(out_conv_out_const_15_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39853 (.out1(out_addr_expr_FU_27_i0_fu_main_38248_39853),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39856 (.out1(out_addr_expr_FU_21_i0_fu_main_38248_39856),
    .in1(out_conv_out_const_16_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39862 (.out1(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39862),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39865 (.out1(out_addr_expr_FU_22_i0_fu_main_38248_39865),
    .in1(out_conv_out_const_17_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39868 (.out1(out_addr_expr_FU_23_i0_fu_main_38248_39868),
    .in1(out_conv_out_const_18_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39871 (.out1(out_addr_expr_FU_24_i0_fu_main_38248_39871),
    .in1(out_conv_out_const_8_23_32));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_40019 (.out1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_40019),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_40023 (.out1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_40023),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  gt_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_40025 (.out1(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_40025),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i0_fu_main_38248_38400));
  gt_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_40029 (.out1(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_40029),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i1_fu_main_38248_38501));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_42358 (.out1(out_multi_read_cond_FU_42_i0_fu_main_38248_42358),
    .in1({out_lut_expr_FU_41_i0_fu_main_38248_42364,
      out_lut_expr_FU_40_i0_fu_main_38248_42361}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_42361 (.out1(out_lut_expr_FU_40_i0_fu_main_38248_42361),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39831),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_42364 (.out1(out_lut_expr_FU_41_i0_fu_main_38248_42364),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39831),
    .in3(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_40025),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_42365 (.out1(out_multi_read_cond_FU_53_i0_fu_main_38248_42365),
    .in1({out_lut_expr_FU_52_i0_fu_main_38248_42371,
      out_lut_expr_FU_51_i0_fu_main_38248_42368}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_42368 (.out1(out_lut_expr_FU_51_i0_fu_main_38248_42368),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39862),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_42371 (.out1(out_lut_expr_FU_52_i0_fu_main_38248_42371),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39862),
    .in3(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_40029),
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
    .#~@buf#~@(out_MUX_64_read_66_i0_1_1_0),
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
    .in1(out_addr_expr_FU_28_i0_fu_main_38248_39812),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_27_i0_fu_main_38248_39853),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu_main_38248_39856),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu_main_38248_39865),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu_main_38248_39868),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_24_i0_fu_main_38248_39871),
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
    .in1(out_addr_expr_FU_29_i0_fu_main_38248_39815),
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
    .in1(out_addr_expr_FU_30_i0_fu_main_38248_39818),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_17_i0_fu_main_38248_39821),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_18_i0_fu_main_38248_39834),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_19_i0_fu_main_38248_39837),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu_main_38248_39840),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_25_i0_fu_main_38248_39847),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_26_i0_fu_main_38248_39850),
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
  assign OUT_MULTIIF_main_38248_42358 = out_multi_read_cond_FU_42_i0_fu_main_38248_42358;
  assign OUT_MULTIIF_main_38248_42365 = out_multi_read_cond_FU_53_i0_fu_main_38248_42365;
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
  OUT_MULTIIF_main_38248_42358,
  OUT_MULTIIF_main_38248_42365,
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
  input [1:0] OUT_MULTIIF_main_38248_42358;
  input [1:0] OUT_MULTIIF_main_38248_42365;
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
          casez (OUT_MULTIIF_main_38248_42358)
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
          casez (OUT_MULTIIF_main_38248_42365)
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
  wire [1:0] OUT_MULTIIF_main_38248_42358;
  wire [1:0] OUT_MULTIIF_main_38248_42365;
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
    .OUT_MULTIIF_main_38248_42358(OUT_MULTIIF_main_38248_42358),
    .OUT_MULTIIF_main_38248_42365(OUT_MULTIIF_main_38248_42365),
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
    .MEM_var_39032_74(7340032),
    .MEM_var_39034_38248(2097152),
    .MEM_var_39036_38248(2621440),
    .MEM_var_39038_38248(3145728),
    .MEM_var_39040_38248(3670016),
    .MEM_var_39042_38248(4194304),
    .MEM_var_39044_38248(4718592),
    .MEM_var_39046_38248(5242880),
    .MEM_var_39048_38248(5767168),
    .MEM_var_39050_38248(6291456),
    .MEM_var_39052_38248(6815744),
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
    .OUT_MULTIIF_main_38248_42358(OUT_MULTIIF_main_38248_42358),
    .OUT_MULTIIF_main_38248_42365(OUT_MULTIIF_main_38248_42365),
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


