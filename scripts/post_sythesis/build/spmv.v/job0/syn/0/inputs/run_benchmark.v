////////////////////////////////////////////////////////////////
// Start of: /home/ubuntu/spmv.v

// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2025-03-27T22:07:31
// /tmp/.mount_bambu-hDxYH5/usr/bin/bambu executed with: /tmp/.mount_bambu-hDxYH5/usr/bin/bambu -I./common --top-fname=main --simulator=VERILATOR --file-input-data=./ellpack/input.data,./ellpack/check.data --simulate -s --top-rtldesign-name=run_benchmark --no-iob --hls-div --benchmark-name=spmv -DBAMBU_PROFILING -DNO_FINAL_MEMCMP_CHECK ./ellpack/ellpack.c ./common/harness.c 
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
  parameter MEM_var_38866_74=7340032;
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
  input [127:0] S_Wdata_ram;
  input [13:0] S_data_ram_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input selector_IN_UNBOUNDED___assert_fail_74_85;
  input selector_IN_UNBOUNDED___assert_fail_74_86;
  input selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  input fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_printf;
  input fuselector_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0___builtin_printf;
  input fuselector___builtin_abort_5_i0_abort;
  input fuselector___builtin_abort_5_i0___builtin_abort;
  input wrenable_reg_0;
  // OUT
  output [127:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_UNBOUNDED___assert_fail_74_85;
  output OUT_UNBOUNDED___assert_fail_74_86;
  // Component and signal declarations
  wire [7:0] null_out_signal_array_38866_0_out1_0;
  wire [7:0] null_out_signal_array_38866_0_out1_1;
  wire [63:0] null_out_signal_array_38866_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38866_0_proxy_out1_1;
  wire [31:0] out_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0;
  wire [22:0] out_addr_expr_FU_3_i0_fu___assert_fail_74_38889;
  wire [22:0] out_const_0;
  wire [7:0] out_conv_in_port___line_32_8;
  wire [31:0] out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38889_23_32;
  wire [31:0] out_conv_out_const_0_23_32;
  wire [31:0] out_conv_out_reg_0_reg_0_23_32;
  wire [22:0] out_reg_0_reg_0;
  wire s_done_fu___assert_fail_74_85;
  wire s_done_fu___assert_fail_74_86;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_0;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_0;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [1:0] sig_out_bus_mergerSout_DataRdy5_;
  wire [127:0] sig_out_bus_mergerSout_Rdata_ram6_;
  
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0 (.out1(out_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0),
    .sel(selector_MUX_0_PRINTFN_VECTOR_BOOL32_VECTOR_BOOL32_UINT8_VECTOR_BOOL32_VECTOR_BOOL32_4_i0_0_0_0),
    .in1(out_conv_out_reg_0_reg_0_23_32),
    .in2(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38889_23_32));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38866.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38866.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_38866_74),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38866_0 (.out1({null_out_signal_array_38866_0_out1_1,
      null_out_signal_array_38866_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_0),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_0),
    .proxy_out1({null_out_signal_array_38866_0_proxy_out1_1,
      null_out_signal_array_38866_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
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
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerSout_Rdata_ram6_ (.out1(sig_out_bus_mergerSout_Rdata_ram6_),
    .in1({sig_in_bus_mergerSout_Rdata_ram6_0}));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38866_74)) const_0 (.out1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(8)) conv_in_port___line_32_8 (.out1(out_conv_in_port___line_32_8),
    .in1(in_port___line));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38889_23_32 (.out1(out_conv_out_addr_expr_FU_3_i0_fu___assert_fail_74_38889_23_32),
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_38889));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_0_23_32 (.out1(out_conv_out_const_0_23_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_reg_0_reg_0_23_32 (.out1(out_conv_out_reg_0_reg_0_23_32),
    .in1(out_reg_0_reg_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___assert_fail_74_38889 (.out1(out_addr_expr_FU_3_i0_fu___assert_fail_74_38889),
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
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
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
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
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
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_0 (.out1(sig_in_bus_mergerSout_Rdata_ram6_0),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_0));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_3_i0_fu___assert_fail_74_38889),
    .wenable(wrenable_reg_0));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
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
  parameter MEM_var_38866_74=7340032;
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
  input [127:0] S_Wdata_ram;
  input [13:0] S_data_ram_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [127:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
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
  datapath___assert_fail #(.MEM_var_38866_74(MEM_var_38866_74)) Datapath_i (.Sout_Rdata_ram(Sout_Rdata_ram),
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
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
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
  output [127:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
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
  wire [22:0] out_UUdata_converter_FU_17_i0_fu___internal_free_737_38946;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_free_737_38939;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_free_737_38918;
  wire [22:0] out_UUdata_converter_FU_20_i0_fu___internal_free_737_38904;
  wire [22:0] out_UUdata_converter_FU_23_i0_fu___internal_free_737_39028;
  wire [22:0] out_UUdata_converter_FU_24_i0_fu___internal_free_737_39007;
  wire [22:0] out_UUdata_converter_FU_25_i0_fu___internal_free_737_39050;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_free_737_39021;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_free_737_39110;
  wire [22:0] out_UUdata_converter_FU_28_i0_fu___internal_free_737_39092;
  wire [22:0] out_UUdata_converter_FU_29_i0_fu___internal_free_737_39142;
  wire [22:0] out_UUdata_converter_FU_30_i0_fu___internal_free_737_39135;
  wire [22:0] out_UUdata_converter_FU_31_i0_fu___internal_free_737_39172;
  wire [22:0] out_UUdata_converter_FU_32_i0_fu___internal_free_737_39165;
  wire [22:0] out_UUdata_converter_FU_4_i0_fu___internal_free_737_38977;
  wire [22:0] out_UUdata_converter_FU_5_i0_fu___internal_free_737_38969;
  wire [22:0] out_UUdata_converter_FU_6_i0_fu___internal_free_737_39039;
  wire [22:0] out_UUdata_converter_FU_7_i0_fu___internal_free_737_39014;
  wire [22:0] out_UUdata_converter_FU_8_i0_fu___internal_free_737_39099;
  wire [22:0] out_UUdata_converter_FU_9_i0_fu___internal_free_737_39085;
  wire [19:0] out_addr_expr_FU_10_i0_fu___internal_free_737_39161;
  wire [19:0] out_addr_expr_FU_3_i0_fu___internal_free_737_38893;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire out_const_2;
  wire [2:0] out_const_3;
  wire [3:0] out_const_4;
  wire [1:0] out_const_5;
  wire [3:0] out_const_6;
  wire [31:0] out_const_7;
  wire [19:0] out_const_8;
  wire [31:0] out_conv_out_const_8_20_32;
  wire [22:0] out_conv_out_reg_1_reg_1_20_23;
  wire [22:0] out_conv_out_reg_5_reg_5_20_23;
  wire out_lut_expr_FU_14_i0_fu___internal_free_737_50510;
  wire out_lut_expr_FU_39_i0_fu___internal_free_737_50512;
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
  wire out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39813;
  wire out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39823;
  wire out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39825;
  wire out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39815;
  wire out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39819;
  wire out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39821;
  wire out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39827;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868;
  wire out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39817;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_38973;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39010;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39017;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39095;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39138;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_38990;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39067;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39122;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu___internal_free_737_780;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869;
  wire [31:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0;
  wire [31:0] out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1;
  wire [31:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2;
  wire [31:0] out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3;
  wire [31:0] out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_4;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_7925_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_7926_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_7927_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_7928_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_7929_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_7925_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_7926_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_7927_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_7928_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_7929_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [127:0] sig_out_bus_mergerproxy_in1_7925_;
  wire [45:0] sig_out_bus_mergerproxy_in2_7926_;
  wire [13:0] sig_out_bus_mergerproxy_in3_7927_;
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
    .BITSIZE_in3(7),
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
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
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
    .in3({out_const_1,
      out_const_1}),
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
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      out_const_1}),
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
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_7925_ (.out1(sig_out_bus_mergerproxy_in1_7925_),
    .in1({sig_in_bus_mergerproxy_in1_7925_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerproxy_in2_7926_ (.out1(sig_out_bus_mergerproxy_in2_7926_),
    .in1({sig_in_bus_mergerproxy_in2_7926_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_7927_ (.out1(sig_out_bus_mergerproxy_in3_7927_),
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
    .BITSIZE_out1(20)) fu___internal_free_737_38893 (.out1(out_addr_expr_FU_3_i0_fu___internal_free_737_38893),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38904 (.out1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_38904),
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_38918));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_38918 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_38918),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38939 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_38939),
    .in1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_38946));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_38946 (.out1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_38946),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38969 (.out1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_38969),
    .in1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_38977));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_38973 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_38973),
    .in1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_38969),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_38977 (.out1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_38977),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_38990));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_38990 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_38990),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39007 (.out1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_39007),
    .in1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39028));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39010 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39010),
    .in1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_39007),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39014 (.out1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39014),
    .in1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39039));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39017 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39017),
    .in1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_39014),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39021 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39021),
    .in1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39050));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39028 (.out1(out_UUdata_converter_FU_23_i0_fu___internal_free_737_39028),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39039 (.out1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_39039),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39067));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39050 (.out1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_39050),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39067 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_39067),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39085 (.out1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39085),
    .in1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39099));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39092 (.out1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39092),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39110));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39095 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39095),
    .in1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_39092),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39099 (.out1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_39099),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39122));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39110 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_39110),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39122 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_39122),
    .in1(in_port_ap),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39135 (.out1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39135),
    .in1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39142));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_free_737_39138 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39138),
    .in1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_39135),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39142 (.out1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_39142),
    .in1(out_reg_6_reg_6));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_free_737_39161 (.out1(out_addr_expr_FU_10_i0_fu___internal_free_737_39161),
    .in1(out_conv_out_const_8_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_free_737_39165 (.out1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39165),
    .in1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39172));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_free_737_39172 (.out1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_39172),
    .in1(out_reg_6_reg_6));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_free_737_39813 (.out1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39813),
    .in1(in_port_ap),
    .in2(out_const_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39815 (.out1(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39815),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39817 (.out1(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39817),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39819 (.out1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39819),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39821 (.out1(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39821),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39823 (.out1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39823),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824),
    .in2(out_reg_9_reg_9));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39825 (.out1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39825),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_39827 (.out1(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39827),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_50510 (.out1(out_lut_expr_FU_14_i0_fu___internal_free_737_50510),
    .in1(out_const_4),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_39815),
    .in3(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_39817),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___internal_free_737_50512 (.out1(out_lut_expr_FU_39_i0_fu___internal_free_737_50512),
    .in1(out_const_6),
    .in2(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_39821),
    .in3(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_39827),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_774 (.out1(out_read_cond_FU_11_i0_fu___internal_free_737_774),
    .in1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_39813));
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
    .in1(out_lut_expr_FU_14_i0_fu___internal_free_737_50510));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_848 (.out1(out_read_cond_FU_21_i0_fu___internal_free_737_848),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_39819));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_854 (.out1(out_read_cond_FU_33_i0_fu___internal_free_737_854),
    .in1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_39823));
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
    .in1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_39825));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___internal_free_737_886 (.out1(out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886),
    .in1(out_reg_16_reg_16),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_909 (.out1(out_read_cond_FU_40_i0_fu___internal_free_737_909),
    .in1(out_lut_expr_FU_39_i0_fu___internal_free_737_50512));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_7925_0 (.out1(sig_in_bus_mergerproxy_in1_7925_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7925_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerproxy_in2_7926_0 (.out1(sig_in_bus_mergerproxy_in2_7926_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_7926_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_7927_0 (.out1(sig_in_bus_mergerproxy_in3_7927_0),
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
    .in1(out_addr_expr_FU_3_i0_fu___internal_free_737_38893),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_39095),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_39138),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_39165),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_39010),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_39021),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_38973),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_39017),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_39085),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_10_i0_fu___internal_free_737_39161),
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
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_38939),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_38904),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_69_reg_9_0_0_1),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7925_ (.out1(proxy_in1_792),
    .in1(sig_out_bus_mergerproxy_in1_7925_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_7926_ (.out1(proxy_in2_792),
    .in1(sig_out_bus_mergerproxy_in2_7926_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [127:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
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
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [127:0] proxy_out1_796;
  input [127:0] proxy_out1_992;
  input [127:0] proxy_out1_1020;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
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
  output [127:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [127:0] proxy_in1_796;
  output [45:0] proxy_in2_796;
  output [13:0] proxy_in3_796;
  output [1:0] proxy_sel_LOAD_796;
  output [1:0] proxy_sel_STORE_796;
  output [127:0] proxy_in1_992;
  output [45:0] proxy_in2_992;
  output [13:0] proxy_in3_992;
  output [1:0] proxy_sel_LOAD_992;
  output [1:0] proxy_sel_STORE_992;
  output [127:0] proxy_in1_1020;
  output [45:0] proxy_in2_1020;
  output [13:0] proxy_in3_1020;
  output [1:0] proxy_sel_LOAD_1020;
  output [1:0] proxy_sel_STORE_1020;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
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
  wire [19:0] out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39279;
  wire [19:0] out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39263;
  wire [19:0] out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39290;
  wire [19:0] out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39272;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39219;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39205;
  wire [22:0] out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39230;
  wire [22:0] out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39212;
  wire [22:0] out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39384;
  wire [22:0] out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39370;
  wire [22:0] out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39331;
  wire [22:0] out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39317;
  wire [22:0] out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39342;
  wire [22:0] out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39324;
  wire [22:0] out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39395;
  wire [22:0] out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39377;
  wire [22:0] out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39483;
  wire [22:0] out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39469;
  wire [20:0] out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39446;
  wire [20:0] out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39439;
  wire [22:0] out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39494;
  wire [22:0] out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39476;
  wire [22:0] out_addr_expr_FU_12_i0_fu___internal_malloc_738_39269;
  wire [19:0] out_addr_expr_FU_13_i0_fu___internal_malloc_738_39305;
  wire [22:0] out_addr_expr_FU_16_i0_fu___internal_malloc_738_39187;
  wire [22:0] out_addr_expr_FU_17_i0_fu___internal_malloc_738_39190;
  wire [19:0] out_addr_expr_FU_20_i0_fu___internal_malloc_738_39423;
  wire [22:0] out_addr_expr_FU_21_i0_fu___internal_malloc_738_39428;
  wire [19:0] out_addr_expr_FU_22_i0_fu___internal_malloc_738_39435;
  wire [19:0] out_addr_expr_FU_23_i0_fu___internal_malloc_738_39414;
  wire [19:0] out_addr_expr_FU_6_i0_fu___internal_malloc_738_39193;
  wire [19:0] out_addr_expr_FU_7_i0_fu___internal_malloc_738_39249;
  wire [22:0] out_addr_expr_FU_8_i0_fu___internal_malloc_738_39260;
  wire [19:0] out_addr_expr_FU_9_i0_fu___internal_malloc_738_39301;
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
  wire [13:0] out_const_7;
  wire [22:0] out_const_8;
  wire [1:0] out_const_9;
  wire [31:0] out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39187_23_32;
  wire [31:0] out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39190_23_32;
  wire [22:0] out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39193_20_23;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [31:0] out_conv_out_const_12_20_32;
  wire [31:0] out_conv_out_const_13_23_32;
  wire [31:0] out_conv_out_const_14_20_32;
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
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_42626;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063;
  wire out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_39833;
  wire out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_39829;
  wire out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_39837;
  wire out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_39831;
  wire out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_39841;
  wire out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_39839;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_101_i0_fu___internal_malloc_738_1129;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_42622;
  wire [31:0] out_ui_minus_expr_FU_32_0_32_102_i0_fu___internal_malloc_738_1121;
  wire [28:0] out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_42619;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_104_i0_fu___internal_malloc_738_1079;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_104_i1_fu___internal_malloc_738_1139;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39215;
  wire [19:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39275;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_39373;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_39380;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_39442;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_39479;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_42615;
  wire [31:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2;
  wire [31:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_3;
  wire [31:0] out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4;
  wire [31:0] out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_5;
  wire [31:0] out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_6;
  wire [31:0] out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7;
  wire [31:0] out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_8;
  wire [31:0] out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_9;
  wire s_done_fu___internal_malloc_738_1067;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_1;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_1;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_1;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_1;
  wire [127:0] sig_in_bus_mergerproxy_in1_10205_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_7926_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_7926_1;
  wire [127:0] sig_in_bus_mergerproxy_in1_7967_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_9928_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_10209_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_79210_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_79210_1;
  wire [45:0] sig_in_bus_mergerproxy_in2_79611_0;
  wire [45:0] sig_in_bus_mergerproxy_in2_99212_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_102013_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_79214_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_79214_1;
  wire [13:0] sig_in_bus_mergerproxy_in3_79615_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_99216_0;
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
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_1;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_1;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_1;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_1;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_10205_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_7926_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_7926_1;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_7967_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_9928_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_10209_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_79210_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_79210_1;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_79611_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in2_99212_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_102013_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_79214_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_79214_1;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_79615_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_99216_0;
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
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [127:0] sig_out_bus_mergerproxy_in1_10205_;
  wire [127:0] sig_out_bus_mergerproxy_in1_7926_;
  wire [127:0] sig_out_bus_mergerproxy_in1_7967_;
  wire [127:0] sig_out_bus_mergerproxy_in1_9928_;
  wire [45:0] sig_out_bus_mergerproxy_in2_10209_;
  wire [45:0] sig_out_bus_mergerproxy_in2_79210_;
  wire [45:0] sig_out_bus_mergerproxy_in2_79611_;
  wire [45:0] sig_out_bus_mergerproxy_in2_99212_;
  wire [13:0] sig_out_bus_mergerproxy_in3_102013_;
  wire [13:0] sig_out_bus_mergerproxy_in3_79214_;
  wire [13:0] sig_out_bus_mergerproxy_in3_79615_;
  wire [13:0] sig_out_bus_mergerproxy_in3_99216_;
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
    .BITSIZE_in3(7),
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
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
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
    .in3({7'b0000000,
      out_const_3}),
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
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      out_const_3}),
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
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      out_const_3}),
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
    .in2(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39190_23_32));
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
    .in1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39193_20_23),
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
    .in2(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39187_23_32));
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
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({out_const_3,
      out_const_3}),
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
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      out_const_3}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_PROXY_CTRLN_3_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_PROXY_CTRLN_3_i0_STORE}),
    .proxy_out1(proxy_out1_1020));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_1,
      sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_1,
      sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
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
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_10205_ (.out1(sig_out_bus_mergerproxy_in1_10205_),
    .in1({sig_in_bus_mergerproxy_in1_10205_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_7926_ (.out1(sig_out_bus_mergerproxy_in1_7926_),
    .in1({sig_in_bus_mergerproxy_in1_7926_1,
      sig_in_bus_mergerproxy_in1_7926_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_7967_ (.out1(sig_out_bus_mergerproxy_in1_7967_),
    .in1({sig_in_bus_mergerproxy_in1_7967_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_9928_ (.out1(sig_out_bus_mergerproxy_in1_9928_),
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
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_102013_ (.out1(sig_out_bus_mergerproxy_in3_102013_),
    .in1({sig_in_bus_mergerproxy_in3_102013_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_79214_ (.out1(sig_out_bus_mergerproxy_in3_79214_),
    .in1({sig_in_bus_mergerproxy_in3_79214_1,
      sig_in_bus_mergerproxy_in3_79214_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_79615_ (.out1(sig_out_bus_mergerproxy_in3_79615_),
    .in1({sig_in_bus_mergerproxy_in3_79615_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_99216_ (.out1(sig_out_bus_mergerproxy_in3_99216_),
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
    .value(32'b00000000000000000010000011001111)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b10000011001111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_1020_38248)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39187_23_32 (.out1(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_39187_23_32),
    .in1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39187));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39190_23_32 (.out1(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_39190_23_32),
    .in1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39190));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(23)) conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39193_20_23 (.out1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_39193_20_23),
    .in1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39193));
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
    .in1(out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_42622),
    .in2(out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_42626),
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
    .BITSIZE_in2(14),
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
    .in1(out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_39837));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1152 (.out1(out_read_cond_FU_77_i0_fu___internal_malloc_738_1152),
    .in1(out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_39839));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1155 (.out1(out_read_cond_FU_92_i0_fu___internal_malloc_738_1155),
    .in1(out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_39841));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39187 (.out1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_39187),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39190 (.out1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_39190),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39193 (.out1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_39193),
    .in1(out_conv_out_const_12_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39205 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39205),
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39219));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39212 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39212),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39230));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39215 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39215),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_malloc_738_39212),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39219 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_39219),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39230 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_39230),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39249 (.out1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39249),
    .in1(out_conv_out_const_12_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39260 (.out1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39260),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39263 (.out1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39263),
    .in1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39279));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39269 (.out1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39269),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39272 (.out1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39272),
    .in1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39290));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(3),
    .BITSIZE_out1(20),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39275 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39275),
    .in1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_39272),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39279 (.out1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_39279),
    .in1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39301));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39290 (.out1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_39290),
    .in1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39305));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39301 (.out1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_39301),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39305 (.out1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_39305),
    .in1(out_conv_out_const_13_23_32));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39317 (.out1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39317),
    .in1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39331));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39324 (.out1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39324),
    .in1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39342));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39331 (.out1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_39331),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39342 (.out1(out_UUdata_converter_FU_44_i0_fu___internal_malloc_738_39342),
    .in1(out_reg_0_reg_0));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39370 (.out1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39370),
    .in1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39384));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39373 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_39373),
    .in1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_39370),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39377 (.out1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39377),
    .in1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39395));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39380 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_39380),
    .in1(out_UUdata_converter_FU_47_i0_fu___internal_malloc_738_39377),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39384 (.out1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_39384),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39395 (.out1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_39395),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i1_fu___internal_malloc_738_1126));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39414 (.out1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_39414),
    .in1(out_conv_out_const_12_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39423 (.out1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_39423),
    .in1(out_conv_out_const_14_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39428 (.out1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_39428),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_39435 (.out1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_39435),
    .in1(out_conv_out_const_14_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_39439 (.out1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39439),
    .in1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39446));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39442 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_39442),
    .in1(out_UUdata_converter_FU_76_i0_fu___internal_malloc_738_39439),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_39446 (.out1(out_UUdata_converter_FU_75_i0_fu___internal_malloc_738_39446),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_106_i0_fu___internal_malloc_738_1076));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39469 (.out1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39469),
    .in1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39483));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39476 (.out1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39476),
    .in1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39494));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_39479 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_39479),
    .in1(out_UUdata_converter_FU_91_i0_fu___internal_malloc_738_39476),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39483 (.out1(out_UUdata_converter_FU_71_i0_fu___internal_malloc_738_39483),
    .in1(out_reg_15_reg_15));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu___internal_malloc_738_39494 (.out1(out_UUdata_converter_FU_90_i0_fu___internal_malloc_738_39494),
    .in1(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39829 (.out1(out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_39829),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39831 (.out1(out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_39831),
    .in1(out_const_7),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39833 (.out1(out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_39833),
    .in1(out_const_7),
    .in2(out_reg_22_reg_22));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39837 (.out1(out_ui_eq_expr_FU_32_32_32_98_i0_fu___internal_malloc_738_39837),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_15_reg_15));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(19),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39839 (.out1(out_ui_le_expr_FU_32_0_32_100_i0_fu___internal_malloc_738_39839),
    .in1(out_ui_bit_ior_concat_expr_FU_95_i0_fu___internal_malloc_738_1063),
    .in2(out_const_10));
  ui_le_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_39841 (.out1(out_ui_le_expr_FU_0_32_32_99_i1_fu___internal_malloc_738_39841),
    .in1(out_const_7),
    .in2(out_BMEMORY_CTRLN_93_i0_BMEMORY_CTRLN_93_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu___internal_malloc_738_42615 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_42615),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu___internal_malloc_738_42619 (.out1(out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_42619),
    .in1(out_const_7),
    .in2(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___internal_malloc_738_42615));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_42622 (.out1(out_ui_lshift_expr_FU_32_0_32_101_i1_fu___internal_malloc_738_42622),
    .in1(out_ui_plus_expr_FU_0_32_32_103_i0_fu___internal_malloc_738_42619),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___internal_malloc_738_42626 (.out1(out_ui_bit_and_expr_FU_8_0_8_94_i0_fu___internal_malloc_738_42626),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_11));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_921 (.out1(out_read_cond_FU_25_i0_fu___internal_malloc_738_921),
    .in1(out_ui_eq_expr_FU_32_0_32_97_i0_fu___internal_malloc_738_39829));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_951 (.out1(out_read_cond_FU_28_i0_fu___internal_malloc_738_951),
    .in1(out_ui_le_expr_FU_0_32_32_99_i0_fu___internal_malloc_738_39831));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_975 (.out1(out_read_cond_FU_48_i0_fu___internal_malloc_738_975),
    .in1(out_ui_eq_expr_FU_0_32_32_96_i0_fu___internal_malloc_738_39833));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_1 (.out1(sig_in_bus_mergerMout_Wdata_ram0_1),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_1));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_1 (.out1(sig_in_bus_mergerMout_addr_ram1_1),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_1));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_1 (.out1(sig_in_bus_mergerMout_data_ram_size2_1),
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
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_10205_0 (.out1(sig_in_bus_mergerproxy_in1_10205_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_10205_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_7926_0 (.out1(sig_in_bus_mergerproxy_in1_7926_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7926_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_7926_1 (.out1(sig_in_bus_mergerproxy_in1_7926_1),
    .in1(sig_in_vector_bus_mergerproxy_in1_7926_1));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_7967_0 (.out1(sig_in_bus_mergerproxy_in1_7967_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7967_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_9928_0 (.out1(sig_in_bus_mergerproxy_in1_9928_0),
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
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_102013_0 (.out1(sig_in_bus_mergerproxy_in3_102013_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_102013_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_79214_0 (.out1(sig_in_bus_mergerproxy_in3_79214_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_79214_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_79214_1 (.out1(sig_in_bus_mergerproxy_in3_79214_1),
    .in1(sig_in_vector_bus_mergerproxy_in3_79214_1));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_79615_0 (.out1(sig_in_bus_mergerproxy_in3_79615_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_79615_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_99216_0 (.out1(sig_in_bus_mergerproxy_in3_99216_0),
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
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_39205),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_39249),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_39260),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_39263),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_39269),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i1_fu___internal_malloc_738_39275),
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
    .in1(out_UUdata_converter_FU_72_i0_fu___internal_malloc_738_39469),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i4_fu___internal_malloc_738_39442),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_39414),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i5_fu___internal_malloc_738_39479),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i2_fu___internal_malloc_738_39373),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i3_fu___internal_malloc_738_39380),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_43_i0_fu___internal_malloc_738_39317),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_39324),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_39423),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_39428),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_39435),
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
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_105_i0_fu___internal_malloc_738_39215),
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
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_10205_ (.out1(proxy_in1_1020),
    .in1(sig_out_bus_mergerproxy_in1_10205_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7926_ (.out1(proxy_in1_792),
    .in1(sig_out_bus_mergerproxy_in1_7926_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7967_ (.out1(proxy_in1_796),
    .in1(sig_out_bus_mergerproxy_in1_7967_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
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
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_102013_ (.out1(proxy_in3_1020),
    .in1(sig_out_bus_mergerproxy_in3_102013_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_79214_ (.out1(proxy_in3_792),
    .in1(sig_out_bus_mergerproxy_in3_79214_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_79615_ (.out1(proxy_in3_796),
    .in1(sig_out_bus_mergerproxy_in3_79615_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [127:0] proxy_out1_796;
  input [127:0] proxy_out1_992;
  input [127:0] proxy_out1_1020;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [31:0] return_port;
  output [127:0] proxy_in1_792;
  output [45:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [127:0] proxy_in1_796;
  output [45:0] proxy_in2_796;
  output [13:0] proxy_in3_796;
  output [1:0] proxy_sel_LOAD_796;
  output [1:0] proxy_sel_STORE_796;
  output [127:0] proxy_in1_992;
  output [45:0] proxy_in2_992;
  output [13:0] proxy_in3_992;
  output [1:0] proxy_sel_LOAD_992;
  output [1:0] proxy_sel_STORE_992;
  output [127:0] proxy_in1_1020;
  output [45:0] proxy_in2_1020;
  output [13:0] proxy_in3_1020;
  output [1:0] proxy_sel_LOAD_1020;
  output [1:0] proxy_sel_STORE_1020;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
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
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
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
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
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
  wire [22:0] out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39682;
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
  wire [31:0] out_UUdata_converter_FU_20_i0_fu_read_2208_39689;
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
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_42666;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_42691;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_42711;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_42734;
  wire out_lut_expr_FU_18_i0_fu_read_2208_39863;
  wire signed [31:0] out_plus_expr_FU_32_0_32_61_i0_fu_read_2208_2450;
  wire signed [30:0] out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_42731;
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
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_42658;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_42686;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_42706;
  wire signed [29:0] out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_42729;
  wire [0:0] out_u_assign_conn_obj_6_ASSIGN_UNSIGNED_FU_u_assign_7;
  wire [31:0] out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_8;
  wire [31:0] out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_9;
  wire out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_47805;
  wire out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_47809;
  wire out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_47813;
  wire out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_47817;
  wire out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_47821;
  wire out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_47849;
  wire out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_47853;
  wire out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_47745;
  wire out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_39861;
  wire out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_39871;
  wire out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_39873;
  wire out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_39875;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_42654;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_42725;
  wire [30:0] out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_42721;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_42651;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i0_fu_read_2208_2286;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i1_fu_read_2208_2313;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i2_fu_read_2208_2337;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i3_fu_read_2208_2459;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39685;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_42647;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_42719;
  wire s_done_fu_read_2208_2260;
  wire s_done_fu_read_2208_2445;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
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
    .BITSIZE_in3(7),
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
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
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
    .in3({7'b0000000,
      out_MUX_5_BMEMORY_CTRLN_56_i0_2_0_0}),
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
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
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
    .in1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_39861));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2250 (.out1(out_IUdata_converter_FU_2_i0_fu_read_2208_2250),
    .in1(in_port_fd));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2257 (.out1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in1(out_reg_1_reg_1));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2259 (.out1(out_UIdata_converter_FU_12_i0_fu_read_2208_2259),
    .in1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_42654));
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
    .in1(out_lut_expr_FU_18_i0_fu_read_2208_39863));
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
    .in1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_42666),
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
    .in1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_42691),
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
    .in1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_47821));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2403 (.out1(out_read_cond_FU_35_i0_fu_read_2208_2403),
    .in1(out_reg_25_reg_25));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2409 (.out1(out_read_cond_FU_36_i0_fu_read_2208_2409),
    .in1(out_reg_26_reg_26));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_read_2208_2414 (.out1(out_bit_ior_concat_expr_FU_59_i0_fu_read_2208_2414),
    .in1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_42711),
    .in2(out_const_7),
    .in3(out_const_2));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2418 (.out1(out_IUdata_converter_FU_21_i0_fu_read_2208_2418),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_42734));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2419 (.out1(out_read_cond_FU_37_i0_fu_read_2208_2419),
    .in1(out_reg_5_reg_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_2425 (.out1(out_IUdata_converter_FU_38_i0_fu_read_2208_2425),
    .in1(out_reg_1_reg_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_read_2208_2433 (.out1(out_read_cond_FU_42_i0_fu_read_2208_2433),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_39873));
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
    .in1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_47745));
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
    .BITSIZE_out1(23)) fu_read_2208_39682 (.out1(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39682),
    .in1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_42725));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_read_2208_39685 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39685),
    .in1(out_conv_in_port_buf_32_23),
    .in2(out_ASSIGN_UNSIGNED_FU_22_i0_fu_read_2208_39682));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_read_2208_39689 (.out1(out_UUdata_converter_FU_20_i0_fu_read_2208_39689),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_read_2208_39861 (.out1(out_ui_gt_expr_FU_32_0_32_66_i0_fu_read_2208_39861),
    .in1(in_port_count),
    .in2(out_const_10));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_read_2208_39863 (.out1(out_lut_expr_FU_18_i0_fu_read_2208_39863),
    .in1(out_const_16),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_47805),
    .in3(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_47809),
    .in4(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_47813),
    .in5(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_47817),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_39871 (.out1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_39871),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_21_i0_fu_read_2208_2418));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_39873 (.out1(out_ui_gt_expr_FU_32_32_32_67_i1_fu_read_2208_39873),
    .in1(in_port_count),
    .in2(out_reg_7_reg_7));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_read_2208_39875 (.out1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_39875),
    .in1(in_port_count),
    .in2(out_IUdata_converter_FU_51_i0_fu_read_2208_2466));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_42647 (.out1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_42647),
    .in1(out_IUdata_converter_FU_11_i0_fu_read_2208_2257),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_read_2208_42651 (.out1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_42651),
    .in1(out_ui_rshift_expr_FU_32_0_32_73_i0_fu_read_2208_42647),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_42654 (.out1(out_ui_lshift_expr_FU_32_0_32_68_i0_fu_read_2208_42654),
    .in1(out_ui_plus_expr_FU_32_0_32_71_i0_fu_read_2208_42651),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_42658 (.out1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_42658),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_42666 (.out1(out_lshift_expr_FU_32_0_32_60_i0_fu_read_2208_42666),
    .in1(out_rshift_expr_FU_32_0_32_65_i0_fu_read_2208_42658),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_42686 (.out1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_42686),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_42691 (.out1(out_lshift_expr_FU_32_0_32_60_i1_fu_read_2208_42691),
    .in1(out_rshift_expr_FU_32_0_32_65_i1_fu_read_2208_42686),
    .in2(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_42706 (.out1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_42706),
    .in1(out_reg_13_reg_13),
    .in2(out_const_2));
  lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_42711 (.out1(out_lshift_expr_FU_32_0_32_60_i2_fu_read_2208_42711),
    .in1(out_rshift_expr_FU_32_0_32_65_i2_fu_read_2208_42706),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(64)) fu_read_2208_42719 (.out1(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_42719),
    .in1(out_UUdata_converter_FU_20_i0_fu_read_2208_39689),
    .in2(out_const_9));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(31)) fu_read_2208_42721 (.out1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_42721),
    .in1(out_const_17),
    .in2(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_read_2208_42719));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu_read_2208_42725 (.out1(out_ui_lshift_expr_FU_64_0_64_69_i0_fu_read_2208_42725),
    .in1(out_ui_plus_expr_FU_0_32_32_70_i0_fu_read_2208_42721),
    .in2(out_const_9));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_read_2208_42729 (.out1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_42729),
    .in1(out_reg_1_reg_1),
    .in2(out_const_2));
  plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31)) fu_read_2208_42731 (.out1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_42731),
    .in1(out_rshift_expr_FU_32_0_32_65_i3_fu_read_2208_42729),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_read_2208_42734 (.out1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_42734),
    .in1(out_plus_expr_FU_32_0_32_62_i0_fu_read_2208_42731),
    .in2(out_const_2));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4)) fu_read_2208_47745 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu_read_2208_47745),
    .in1(out_BAMBU_READC_55_i0_fu_read_2208_2445),
    .in2(out_const_15));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_47805 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu_read_2208_47805),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_47809 (.out1(out_ui_extract_bit_expr_FU_15_i0_fu_read_2208_47809),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_47813 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu_read_2208_47813),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_13));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_47817 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu_read_2208_47817),
    .in1(out_BAMBU_READ4C_54_i0_fu_read_2208_2260),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_47821 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu_read_2208_47821),
    .in1(out_reg_14_reg_14),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_47849 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_47849),
    .in1(out_reg_14_reg_14),
    .in2(out_const_12));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_read_2208_47853 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_47853),
    .in1(out_reg_14_reg_14),
    .in2(out_const_13));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
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
    .in1(out_ui_gt_expr_FU_32_32_32_67_i2_fu_read_2208_39875),
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
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu_read_2208_47849),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu_read_2208_47853),
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
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_72_i4_fu_read_2208_39685),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_67_i0_fu_read_2208_39871),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_lshift_expr_FU_32_0_32_60_i3_fu_read_2208_42734),
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
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
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
module UUconvert_expr_FU(in1,
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
module ui_bit_ior_expr_FU(in1,
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
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_not_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = ~in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_xor_expr_FU(in1,
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
  assign out1 = in1 ^ in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
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
      reg [BITSIZE_in1-1:0] in1_in;
      reg [BITSIZE_in2-1:0] in2_in;
      wire [BITSIZE_out1-1:0] mult_res;
      reg [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
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
module ui_ternary_plus_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 + in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ternary_pm_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 - in3;
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
  fuselector_BMEMORY_CTRLN_332_i0_LOAD,
  fuselector_BMEMORY_CTRLN_332_i0_STORE,
  fuselector_BMEMORY_CTRLN_332_i1_LOAD,
  fuselector_BMEMORY_CTRLN_332_i1_STORE,
  selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0,
  selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0,
  selector_MUX_600_reg_1_0_0_0,
  selector_MUX_620_reg_2_0_0_0,
  selector_MUX_631_reg_3_0_0_0,
  selector_MUX_686_reg_8_0_0_0,
  selector_MUX_697_reg_9_0_0_0,
  selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0,
  selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_100,
  wrenable_reg_101,
  wrenable_reg_102,
  wrenable_reg_103,
  wrenable_reg_104,
  wrenable_reg_105,
  wrenable_reg_106,
  wrenable_reg_107,
  wrenable_reg_108,
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
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_78,
  wrenable_reg_79,
  wrenable_reg_8,
  wrenable_reg_80,
  wrenable_reg_81,
  wrenable_reg_82,
  wrenable_reg_83,
  wrenable_reg_84,
  wrenable_reg_85,
  wrenable_reg_86,
  wrenable_reg_87,
  wrenable_reg_88,
  wrenable_reg_89,
  wrenable_reg_9,
  wrenable_reg_90,
  wrenable_reg_91,
  wrenable_reg_92,
  wrenable_reg_93,
  wrenable_reg_94,
  wrenable_reg_95,
  wrenable_reg_96,
  wrenable_reg_97,
  wrenable_reg_98,
  wrenable_reg_99,
  OUT_CONDITION_run_benchmark_38252_38724,
  OUT_CONDITION_run_benchmark_38252_38727);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_vargs;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_332_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_332_i0_STORE;
  input fuselector_BMEMORY_CTRLN_332_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_332_i1_STORE;
  input selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0;
  input selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0;
  input selector_MUX_600_reg_1_0_0_0;
  input selector_MUX_620_reg_2_0_0_0;
  input selector_MUX_631_reg_3_0_0_0;
  input selector_MUX_686_reg_8_0_0_0;
  input selector_MUX_697_reg_9_0_0_0;
  input selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0;
  input selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_100;
  input wrenable_reg_101;
  input wrenable_reg_102;
  input wrenable_reg_103;
  input wrenable_reg_104;
  input wrenable_reg_105;
  input wrenable_reg_106;
  input wrenable_reg_107;
  input wrenable_reg_108;
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
  input wrenable_reg_65;
  input wrenable_reg_66;
  input wrenable_reg_67;
  input wrenable_reg_68;
  input wrenable_reg_69;
  input wrenable_reg_7;
  input wrenable_reg_70;
  input wrenable_reg_71;
  input wrenable_reg_72;
  input wrenable_reg_73;
  input wrenable_reg_74;
  input wrenable_reg_75;
  input wrenable_reg_76;
  input wrenable_reg_77;
  input wrenable_reg_78;
  input wrenable_reg_79;
  input wrenable_reg_8;
  input wrenable_reg_80;
  input wrenable_reg_81;
  input wrenable_reg_82;
  input wrenable_reg_83;
  input wrenable_reg_84;
  input wrenable_reg_85;
  input wrenable_reg_86;
  input wrenable_reg_87;
  input wrenable_reg_88;
  input wrenable_reg_89;
  input wrenable_reg_9;
  input wrenable_reg_90;
  input wrenable_reg_91;
  input wrenable_reg_92;
  input wrenable_reg_93;
  input wrenable_reg_94;
  input wrenable_reg_95;
  input wrenable_reg_96;
  input wrenable_reg_97;
  input wrenable_reg_98;
  input wrenable_reg_99;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION_run_benchmark_38252_38724;
  output OUT_CONDITION_run_benchmark_38252_38727;
  // Component and signal declarations
  wire [10:0] out_ASSIGN_UNSIGNED_FU_27_i0_fu_run_benchmark_38252_49805;
  wire [5:0] out_ASSIGN_UNSIGNED_FU_289_i0_fu_run_benchmark_38252_49819;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_29_i0_fu_run_benchmark_38252_49807;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_34_i0_fu_run_benchmark_38252_49809;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_35_i0_fu_run_benchmark_38252_49811;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_36_i0_fu_run_benchmark_38252_49813;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_37_i0_fu_run_benchmark_38252_49815;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_90_i0_fu_run_benchmark_38252_49817;
  wire [63:0] out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0;
  wire [63:0] out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0;
  wire [5:0] out_IUdata_converter_FU_109_i0_fu_run_benchmark_38252_48032;
  wire [20:0] out_IUdata_converter_FU_24_i0_fu_run_benchmark_38252_38666;
  wire [19:0] out_IUdata_converter_FU_25_i0_fu_run_benchmark_38252_38694;
  wire [0:0] out_IUdata_converter_FU_286_i0_fu_run_benchmark_38252_48608;
  wire [0:0] out_IUdata_converter_FU_287_i0_fu_run_benchmark_38252_48617;
  wire [0:0] out_IUdata_converter_FU_288_i0_fu_run_benchmark_38252_48623;
  wire [63:0] out_IUdata_converter_FU_89_i0_fu_run_benchmark_38252_47880;
  wire [55:0] out_IUdata_converter_FU_97_i0_fu_run_benchmark_38252_47939;
  wire [22:0] out_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0;
  wire [7:0] out_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0;
  wire [31:0] out_MUX_600_reg_1_0_0_0;
  wire [31:0] out_MUX_620_reg_2_0_0_0;
  wire [31:0] out_MUX_631_reg_3_0_0_0;
  wire [63:0] out_MUX_686_reg_8_0_0_0;
  wire [31:0] out_MUX_697_reg_9_0_0_0;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0;
  wire [22:0] out_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1;
  wire signed [1:0] out_UIconvert_expr_FU_108_i0_fu_run_benchmark_38252_48023;
  wire signed [6:0] out_UIconvert_expr_FU_111_i0_fu_run_benchmark_38252_48044;
  wire signed [1:0] out_UIconvert_expr_FU_56_i0_fu_run_benchmark_38252_49169;
  wire signed [1:0] out_UIconvert_expr_FU_88_i0_fu_run_benchmark_38252_47871;
  wire signed [1:0] out_UIconvert_expr_FU_96_i0_fu_run_benchmark_38252_47930;
  wire signed [1:0] out_UIdata_converter_FU_123_i0_fu_run_benchmark_38252_48158;
  wire signed [1:0] out_UIdata_converter_FU_124_i0_fu_run_benchmark_38252_48182;
  wire signed [1:0] out_UIdata_converter_FU_167_i0_fu_run_benchmark_38252_48323;
  wire signed [1:0] out_UIdata_converter_FU_55_i0_fu_run_benchmark_38252_49154;
  wire [10:0] out_UUconvert_expr_FU_26_i0_fu_run_benchmark_38252_48879;
  wire [10:0] out_UUconvert_expr_FU_28_i0_fu_run_benchmark_38252_48895;
  wire out_UUdata_converter_FU_100_i0_fu_run_benchmark_38252_47981;
  wire out_UUdata_converter_FU_101_i0_fu_run_benchmark_38252_47993;
  wire [31:0] out_UUdata_converter_FU_10_i0_fu_run_benchmark_38252_38564;
  wire [5:0] out_UUdata_converter_FU_110_i0_fu_run_benchmark_38252_48035;
  wire out_UUdata_converter_FU_117_i0_fu_run_benchmark_38252_48116;
  wire [31:0] out_UUdata_converter_FU_11_i0_fu_run_benchmark_38252_38565;
  wire [31:0] out_UUdata_converter_FU_12_i0_fu_run_benchmark_38252_38566;
  wire [31:0] out_UUdata_converter_FU_13_i0_fu_run_benchmark_38252_38568;
  wire [22:0] out_UUdata_converter_FU_18_i0_fu_run_benchmark_38252_38631;
  wire [22:0] out_UUdata_converter_FU_19_i0_fu_run_benchmark_38252_38663;
  wire out_UUdata_converter_FU_206_i0_fu_run_benchmark_38252_48452;
  wire [22:0] out_UUdata_converter_FU_20_i0_fu_run_benchmark_38252_38702;
  wire out_UUdata_converter_FU_246_i0_fu_run_benchmark_38252_48479;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39760;
  wire out_UUdata_converter_FU_313_i0_fu_run_benchmark_38252_48778;
  wire out_UUdata_converter_FU_325_i0_fu_run_benchmark_38252_48835;
  wire out_UUdata_converter_FU_328_i0_fu_run_benchmark_38252_48847;
  wire out_UUdata_converter_FU_33_i0_fu_run_benchmark_38252_48909;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39694;
  wire out_UUdata_converter_FU_42_i0_fu_run_benchmark_38252_49001;
  wire out_UUdata_converter_FU_44_i0_fu_run_benchmark_38252_49010;
  wire out_UUdata_converter_FU_47_i0_fu_run_benchmark_38252_49037;
  wire out_UUdata_converter_FU_49_i0_fu_run_benchmark_38252_49046;
  wire [22:0] out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39763;
  wire out_UUdata_converter_FU_51_i0_fu_run_benchmark_38252_49136;
  wire out_UUdata_converter_FU_53_i0_fu_run_benchmark_38252_49142;
  wire [11:0] out_UUdata_converter_FU_57_i0_fu_run_benchmark_38252_49187;
  wire [22:0] out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39703;
  wire out_UUdata_converter_FU_62_i0_fu_run_benchmark_38252_49214;
  wire [31:0] out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39766;
  wire [31:0] out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39711;
  wire [31:0] out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_39769;
  wire [31:0] out_UUdata_converter_FU_9_i0_fu_run_benchmark_38252_39720;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [6:0] out_const_10;
  wire [3:0] out_const_100;
  wire [4:0] out_const_101;
  wire [15:0] out_const_102;
  wire [63:0] out_const_103;
  wire [4:0] out_const_104;
  wire [5:0] out_const_105;
  wire [63:0] out_const_106;
  wire [63:0] out_const_107;
  wire [23:0] out_const_108;
  wire [9:0] out_const_109;
  wire [2:0] out_const_11;
  wire [10:0] out_const_110;
  wire [10:0] out_const_111;
  wire [62:0] out_const_112;
  wire [63:0] out_const_113;
  wire [12:0] out_const_114;
  wire [15:0] out_const_115;
  wire [31:0] out_const_116;
  wire [31:0] out_const_117;
  wire [31:0] out_const_118;
  wire [31:0] out_const_119;
  wire [5:0] out_const_12;
  wire [63:0] out_const_120;
  wire [51:0] out_const_121;
  wire [52:0] out_const_122;
  wire [53:0] out_const_123;
  wire [54:0] out_const_124;
  wire [55:0] out_const_125;
  wire [62:0] out_const_126;
  wire [63:0] out_const_127;
  wire [6:0] out_const_13;
  wire [6:0] out_const_14;
  wire [6:0] out_const_15;
  wire [5:0] out_const_16;
  wire [5:0] out_const_17;
  wire [6:0] out_const_18;
  wire out_const_19;
  wire [2:0] out_const_2;
  wire [1:0] out_const_20;
  wire [2:0] out_const_21;
  wire [3:0] out_const_22;
  wire [4:0] out_const_23;
  wire [5:0] out_const_24;
  wire [7:0] out_const_25;
  wire [12:0] out_const_26;
  wire [15:0] out_const_27;
  wire [52:0] out_const_28;
  wire [51:0] out_const_29;
  wire [3:0] out_const_3;
  wire [40:0] out_const_30;
  wire [60:0] out_const_31;
  wire [5:0] out_const_32;
  wire [4:0] out_const_33;
  wire [5:0] out_const_34;
  wire [24:0] out_const_35;
  wire [63:0] out_const_36;
  wire [12:0] out_const_37;
  wire [5:0] out_const_38;
  wire [31:0] out_const_39;
  wire [4:0] out_const_4;
  wire [63:0] out_const_40;
  wire [3:0] out_const_41;
  wire [4:0] out_const_42;
  wire [5:0] out_const_43;
  wire [5:0] out_const_44;
  wire [4:0] out_const_45;
  wire [5:0] out_const_46;
  wire [15:0] out_const_47;
  wire [5:0] out_const_48;
  wire [2:0] out_const_49;
  wire [5:0] out_const_5;
  wire [3:0] out_const_50;
  wire [4:0] out_const_51;
  wire [63:0] out_const_52;
  wire [5:0] out_const_53;
  wire [4:0] out_const_54;
  wire [5:0] out_const_55;
  wire [7:0] out_const_56;
  wire [12:0] out_const_57;
  wire [13:0] out_const_58;
  wire [31:0] out_const_59;
  wire [6:0] out_const_6;
  wire [30:0] out_const_60;
  wire [31:0] out_const_61;
  wire [5:0] out_const_62;
  wire [30:0] out_const_63;
  wire [46:0] out_const_64;
  wire [3:0] out_const_65;
  wire [4:0] out_const_66;
  wire [5:0] out_const_67;
  wire [5:0] out_const_68;
  wire [4:0] out_const_69;
  wire [7:0] out_const_7;
  wire [5:0] out_const_70;
  wire [5:0] out_const_71;
  wire [1:0] out_const_72;
  wire [2:0] out_const_73;
  wire [3:0] out_const_74;
  wire [5:0] out_const_75;
  wire [5:0] out_const_76;
  wire [15:0] out_const_77;
  wire [4:0] out_const_78;
  wire [5:0] out_const_79;
  wire [3:0] out_const_8;
  wire [7:0] out_const_80;
  wire [5:0] out_const_81;
  wire [3:0] out_const_82;
  wire [4:0] out_const_83;
  wire [5:0] out_const_84;
  wire [5:0] out_const_85;
  wire [4:0] out_const_86;
  wire [5:0] out_const_87;
  wire [7:0] out_const_88;
  wire [63:0] out_const_89;
  wire [4:0] out_const_9;
  wire [5:0] out_const_90;
  wire [2:0] out_const_91;
  wire [3:0] out_const_92;
  wire [4:0] out_const_93;
  wire [7:0] out_const_94;
  wire [30:0] out_const_95;
  wire [15:0] out_const_96;
  wire [4:0] out_const_97;
  wire [29:0] out_const_98;
  wire [15:0] out_const_99;
  wire signed [31:0] out_conv_out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0_I_64_I_32;
  wire [6:0] out_conv_out_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0_8_7;
  wire [7:0] out_conv_out_const_6_7_8;
  wire [6:0] out_conv_out_const_7_8_7;
  wire [31:0] out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32;
  wire signed [0:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_333_i0_fu_run_benchmark_38252_48026;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_334_i0_fu_run_benchmark_38252_48161;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_334_i1_fu_run_benchmark_38252_48185;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_334_i2_fu_run_benchmark_38252_48326;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_335_i0_fu_run_benchmark_38252_47874;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_335_i1_fu_run_benchmark_38252_47933;
  wire out_lut_expr_FU_107_i0_fu_run_benchmark_38252_48020;
  wire out_lut_expr_FU_116_i0_fu_run_benchmark_38252_48113;
  wire out_lut_expr_FU_118_i0_fu_run_benchmark_38252_48143;
  wire out_lut_expr_FU_157_i0_fu_run_benchmark_38252_49876;
  wire out_lut_expr_FU_158_i0_fu_run_benchmark_38252_49879;
  wire out_lut_expr_FU_159_i0_fu_run_benchmark_38252_49882;
  wire out_lut_expr_FU_160_i0_fu_run_benchmark_38252_49885;
  wire out_lut_expr_FU_161_i0_fu_run_benchmark_38252_49888;
  wire out_lut_expr_FU_162_i0_fu_run_benchmark_38252_49891;
  wire out_lut_expr_FU_163_i0_fu_run_benchmark_38252_49894;
  wire out_lut_expr_FU_164_i0_fu_run_benchmark_38252_49897;
  wire out_lut_expr_FU_165_i0_fu_run_benchmark_38252_49900;
  wire out_lut_expr_FU_166_i0_fu_run_benchmark_38252_48317;
  wire out_lut_expr_FU_196_i0_fu_run_benchmark_38252_49905;
  wire out_lut_expr_FU_197_i0_fu_run_benchmark_38252_49909;
  wire out_lut_expr_FU_198_i0_fu_run_benchmark_38252_49912;
  wire out_lut_expr_FU_199_i0_fu_run_benchmark_38252_49915;
  wire out_lut_expr_FU_200_i0_fu_run_benchmark_38252_49918;
  wire out_lut_expr_FU_201_i0_fu_run_benchmark_38252_49921;
  wire out_lut_expr_FU_202_i0_fu_run_benchmark_38252_49924;
  wire out_lut_expr_FU_203_i0_fu_run_benchmark_38252_49927;
  wire out_lut_expr_FU_204_i0_fu_run_benchmark_38252_49930;
  wire out_lut_expr_FU_205_i0_fu_run_benchmark_38252_48446;
  wire out_lut_expr_FU_235_i0_fu_run_benchmark_38252_49935;
  wire out_lut_expr_FU_236_i0_fu_run_benchmark_38252_49938;
  wire out_lut_expr_FU_237_i0_fu_run_benchmark_38252_49941;
  wire out_lut_expr_FU_238_i0_fu_run_benchmark_38252_49944;
  wire out_lut_expr_FU_239_i0_fu_run_benchmark_38252_49947;
  wire out_lut_expr_FU_240_i0_fu_run_benchmark_38252_49950;
  wire out_lut_expr_FU_241_i0_fu_run_benchmark_38252_49953;
  wire out_lut_expr_FU_242_i0_fu_run_benchmark_38252_49956;
  wire out_lut_expr_FU_243_i0_fu_run_benchmark_38252_49959;
  wire out_lut_expr_FU_244_i0_fu_run_benchmark_38252_49962;
  wire out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470;
  wire out_lut_expr_FU_275_i0_fu_run_benchmark_38252_49966;
  wire out_lut_expr_FU_276_i0_fu_run_benchmark_38252_49969;
  wire out_lut_expr_FU_277_i0_fu_run_benchmark_38252_49972;
  wire out_lut_expr_FU_278_i0_fu_run_benchmark_38252_49975;
  wire out_lut_expr_FU_279_i0_fu_run_benchmark_38252_49979;
  wire out_lut_expr_FU_280_i0_fu_run_benchmark_38252_49982;
  wire out_lut_expr_FU_281_i0_fu_run_benchmark_38252_49985;
  wire out_lut_expr_FU_282_i0_fu_run_benchmark_38252_49988;
  wire out_lut_expr_FU_283_i0_fu_run_benchmark_38252_49991;
  wire out_lut_expr_FU_284_i0_fu_run_benchmark_38252_49994;
  wire out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602;
  wire out_lut_expr_FU_290_i0_fu_run_benchmark_38252_49999;
  wire out_lut_expr_FU_291_i0_fu_run_benchmark_38252_48673;
  wire out_lut_expr_FU_302_i0_fu_run_benchmark_38252_50004;
  wire out_lut_expr_FU_303_i0_fu_run_benchmark_38252_50008;
  wire out_lut_expr_FU_304_i0_fu_run_benchmark_38252_50011;
  wire out_lut_expr_FU_305_i0_fu_run_benchmark_38252_50015;
  wire out_lut_expr_FU_306_i0_fu_run_benchmark_38252_50018;
  wire out_lut_expr_FU_307_i0_fu_run_benchmark_38252_50021;
  wire out_lut_expr_FU_308_i0_fu_run_benchmark_38252_50024;
  wire out_lut_expr_FU_309_i0_fu_run_benchmark_38252_50027;
  wire out_lut_expr_FU_310_i0_fu_run_benchmark_38252_50031;
  wire out_lut_expr_FU_311_i0_fu_run_benchmark_38252_50035;
  wire out_lut_expr_FU_312_i0_fu_run_benchmark_38252_48775;
  wire out_lut_expr_FU_319_i0_fu_run_benchmark_38252_50041;
  wire out_lut_expr_FU_320_i0_fu_run_benchmark_38252_48817;
  wire out_lut_expr_FU_323_i0_fu_run_benchmark_38252_50045;
  wire out_lut_expr_FU_324_i0_fu_run_benchmark_38252_48832;
  wire out_lut_expr_FU_326_i0_fu_run_benchmark_38252_50049;
  wire out_lut_expr_FU_327_i0_fu_run_benchmark_38252_48844;
  wire out_lut_expr_FU_32_i0_fu_run_benchmark_38252_48906;
  wire out_lut_expr_FU_38_i0_fu_run_benchmark_38252_48980;
  wire out_lut_expr_FU_39_i0_fu_run_benchmark_38252_48983;
  wire out_lut_expr_FU_40_i0_fu_run_benchmark_38252_48986;
  wire out_lut_expr_FU_41_i0_fu_run_benchmark_38252_48998;
  wire out_lut_expr_FU_43_i0_fu_run_benchmark_38252_49007;
  wire out_lut_expr_FU_45_i0_fu_run_benchmark_38252_49028;
  wire out_lut_expr_FU_46_i0_fu_run_benchmark_38252_49034;
  wire out_lut_expr_FU_48_i0_fu_run_benchmark_38252_49043;
  wire out_lut_expr_FU_54_i0_fu_run_benchmark_38252_49151;
  wire out_lut_expr_FU_61_i0_fu_run_benchmark_38252_49211;
  wire out_lut_expr_FU_67_i0_fu_run_benchmark_38252_49834;
  wire out_lut_expr_FU_68_i0_fu_run_benchmark_38252_49837;
  wire out_lut_expr_FU_69_i0_fu_run_benchmark_38252_49840;
  wire out_lut_expr_FU_70_i0_fu_run_benchmark_38252_49844;
  wire out_lut_expr_FU_71_i0_fu_run_benchmark_38252_49848;
  wire out_lut_expr_FU_72_i0_fu_run_benchmark_38252_49852;
  wire out_lut_expr_FU_73_i0_fu_run_benchmark_38252_49856;
  wire out_lut_expr_FU_74_i0_fu_run_benchmark_38252_49280;
  wire out_lut_expr_FU_78_i0_fu_run_benchmark_38252_49292;
  wire out_lut_expr_FU_82_i0_fu_run_benchmark_38252_49863;
  wire out_lut_expr_FU_83_i0_fu_run_benchmark_38252_49310;
  wire out_lut_expr_FU_87_i0_fu_run_benchmark_38252_49328;
  wire out_lut_expr_FU_95_i0_fu_run_benchmark_38252_47927;
  wire out_lut_expr_FU_98_i0_fu_run_benchmark_38252_47969;
  wire out_lut_expr_FU_99_i0_fu_run_benchmark_38252_47972;
  wire out_ne_expr_FU_32_0_32_336_i0_fu_run_benchmark_38252_39877;
  wire signed [31:0] out_plus_expr_FU_32_0_32_337_i0_fu_run_benchmark_38252_38677;
  wire out_read_cond_FU_329_i0_fu_run_benchmark_38252_38724;
  wire out_read_cond_FU_330_i0_fu_run_benchmark_38252_38727;
  wire [31:0] out_reg_0_reg_0;
  wire out_reg_100_reg_100;
  wire out_reg_101_reg_101;
  wire out_reg_102_reg_102;
  wire out_reg_103_reg_103;
  wire out_reg_104_reg_104;
  wire out_reg_105_reg_105;
  wire out_reg_106_reg_106;
  wire out_reg_107_reg_107;
  wire out_reg_108_reg_108;
  wire out_reg_10_reg_10;
  wire [62:0] out_reg_11_reg_11;
  wire [22:0] out_reg_12_reg_12;
  wire out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire [20:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [1:0] out_reg_20_reg_20;
  wire out_reg_21_reg_21;
  wire out_reg_22_reg_22;
  wire out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire [10:0] out_reg_25_reg_25;
  wire [20:0] out_reg_26_reg_26;
  wire [31:0] out_reg_27_reg_27;
  wire [63:0] out_reg_28_reg_28;
  wire [20:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_30_reg_30;
  wire [12:0] out_reg_31_reg_31;
  wire out_reg_32_reg_32;
  wire out_reg_33_reg_33;
  wire out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire out_reg_36_reg_36;
  wire out_reg_37_reg_37;
  wire [63:0] out_reg_38_reg_38;
  wire [20:0] out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_40_reg_40;
  wire out_reg_41_reg_41;
  wire out_reg_42_reg_42;
  wire [31:0] out_reg_43_reg_43;
  wire [52:0] out_reg_44_reg_44;
  wire [52:0] out_reg_45_reg_45;
  wire [41:0] out_reg_46_reg_46;
  wire [31:0] out_reg_47_reg_47;
  wire [21:0] out_reg_48_reg_48;
  wire [20:0] out_reg_49_reg_49;
  wire [22:0] out_reg_4_reg_4;
  wire [9:0] out_reg_50_reg_50;
  wire [54:0] out_reg_51_reg_51;
  wire [1:0] out_reg_52_reg_52;
  wire [63:0] out_reg_53_reg_53;
  wire out_reg_54_reg_54;
  wire out_reg_55_reg_55;
  wire [63:0] out_reg_56_reg_56;
  wire [63:0] out_reg_57_reg_57;
  wire [63:0] out_reg_58_reg_58;
  wire [10:0] out_reg_59_reg_59;
  wire [22:0] out_reg_5_reg_5;
  wire out_reg_60_reg_60;
  wire out_reg_61_reg_61;
  wire out_reg_62_reg_62;
  wire [53:0] out_reg_63_reg_63;
  wire [1:0] out_reg_64_reg_64;
  wire out_reg_65_reg_65;
  wire out_reg_66_reg_66;
  wire out_reg_67_reg_67;
  wire out_reg_68_reg_68;
  wire out_reg_69_reg_69;
  wire [22:0] out_reg_6_reg_6;
  wire out_reg_70_reg_70;
  wire out_reg_71_reg_71;
  wire [51:0] out_reg_72_reg_72;
  wire [10:0] out_reg_73_reg_73;
  wire out_reg_74_reg_74;
  wire out_reg_75_reg_75;
  wire out_reg_76_reg_76;
  wire out_reg_77_reg_77;
  wire [54:0] out_reg_78_reg_78;
  wire out_reg_79_reg_79;
  wire [22:0] out_reg_7_reg_7;
  wire [54:0] out_reg_80_reg_80;
  wire [5:0] out_reg_81_reg_81;
  wire out_reg_82_reg_82;
  wire out_reg_83_reg_83;
  wire out_reg_84_reg_84;
  wire out_reg_85_reg_85;
  wire out_reg_86_reg_86;
  wire out_reg_87_reg_87;
  wire out_reg_88_reg_88;
  wire out_reg_89_reg_89;
  wire [63:0] out_reg_8_reg_8;
  wire out_reg_90_reg_90;
  wire out_reg_91_reg_91;
  wire out_reg_92_reg_92;
  wire out_reg_93_reg_93;
  wire out_reg_94_reg_94;
  wire out_reg_95_reg_95;
  wire out_reg_96_reg_96;
  wire out_reg_97_reg_97;
  wire out_reg_98_reg_98;
  wire out_reg_99_reg_99;
  wire [31:0] out_reg_9_reg_9;
  wire signed [0:0] out_rshift_expr_FU_32_0_32_338_i0_fu_run_benchmark_38252_48029;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_339_i0_fu_run_benchmark_38252_48164;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_339_i1_fu_run_benchmark_38252_48188;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_339_i2_fu_run_benchmark_38252_48329;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_340_i0_fu_run_benchmark_38252_47877;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_340_i1_fu_run_benchmark_38252_47936;
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_341_i0_fu_run_benchmark_38252_47948;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_342_i0_fu_run_benchmark_38252_47858;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_342_i1_fu_run_benchmark_38252_47863;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_343_i0_fu_run_benchmark_38252_47942;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_343_i1_fu_run_benchmark_38252_48868;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_343_i2_fu_run_benchmark_38252_48884;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_344_i1_fu_run_benchmark_38252_48679;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_344_i2_fu_run_benchmark_38252_48787;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_345_i0_fu_run_benchmark_38252_48173;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_346_i0_fu_run_benchmark_38252_48876;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_346_i1_fu_run_benchmark_38252_48892;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_346_i2_fu_run_benchmark_38252_49226;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_347_i0_fu_run_benchmark_38252_48915;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_347_i1_fu_run_benchmark_38252_48933;
  wire [9:0] out_ui_bit_and_expr_FU_16_0_16_348_i0_fu_run_benchmark_38252_49124;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_349_i0_fu_run_benchmark_38252_49022;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_349_i1_fu_run_benchmark_38252_49058;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_349_i2_fu_run_benchmark_38252_49061;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_350_i0_fu_run_benchmark_38252_48128;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_351_i0_fu_run_benchmark_38252_48962;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_351_i1_fu_run_benchmark_38252_48972;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_351_i2_fu_run_benchmark_38252_49067;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_351_i3_fu_run_benchmark_38252_49079;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_352_i0_fu_run_benchmark_38252_49109;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_353_i0_fu_run_benchmark_38252_47904;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_353_i1_fu_run_benchmark_38252_48697;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_353_i2_fu_run_benchmark_38252_48790;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_353_i3_fu_run_benchmark_38252_49130;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_353_i4_fu_run_benchmark_38252_49184;
  wire [54:0] out_ui_bit_and_expr_FU_64_0_64_354_i0_fu_run_benchmark_38252_48074;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_355_i0_fu_run_benchmark_38252_48080;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_355_i1_fu_run_benchmark_38252_48122;
  wire [53:0] out_ui_bit_and_expr_FU_64_0_64_356_i0_fu_run_benchmark_38252_49115;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_356_i1_fu_run_benchmark_38252_49160;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_357_i0_fu_run_benchmark_38252_49199;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_358_i0_fu_run_benchmark_38252_49235;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_359_i2_fu_run_benchmark_38252_47895;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_359_i3_fu_run_benchmark_38252_47898;
  wire [52:0] out_ui_bit_and_expr_FU_64_64_64_359_i4_fu_run_benchmark_38252_48059;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_360_i0_fu_run_benchmark_38252_43067;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_360_i1_fu_run_benchmark_38252_43096;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_361_i0_fu_run_benchmark_38252_43083;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_362_i0_fu_run_benchmark_38252_47978;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_363_i0_fu_run_benchmark_38252_48041;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_364_i0_fu_run_benchmark_38252_48095;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_365_i0_fu_run_benchmark_38252_49166;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_366_i0_fu_run_benchmark_38252_38711;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_366_i1_fu_run_benchmark_38252_38719;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_367_i0_fu_run_benchmark_38252_38715;
  wire [55:0] out_ui_bit_ior_concat_expr_FU_368_i0_fu_run_benchmark_38252_48098;
  wire [63:0] out_ui_bit_ior_concat_expr_FU_369_i0_fu_run_benchmark_38252_49112;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_370_i0_fu_run_benchmark_38252_47987;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_371_i0_fu_run_benchmark_38252_47999;
  wire [62:0] out_ui_bit_ior_expr_FU_0_64_64_372_i0_fu_run_benchmark_38252_48700;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_373_i0_fu_run_benchmark_38252_48856;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_374_i0_fu_run_benchmark_38252_48859;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_375_i0_fu_run_benchmark_38252_48951;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_375_i1_fu_run_benchmark_38252_48954;
  wire [51:0] out_ui_bit_ior_expr_FU_0_64_64_376_i0_fu_run_benchmark_38252_49127;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_377_i0_fu_run_benchmark_38252_49193;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_378_i0_fu_run_benchmark_38252_49238;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_379_i0_fu_run_benchmark_38252_48614;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_380_i0_fu_run_benchmark_38252_48629;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_381_i0_fu_run_benchmark_38252_48632;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_382_i0_fu_run_benchmark_38252_48659;
  wire [63:0] out_ui_bit_ior_expr_FU_64_0_64_383_i0_fu_run_benchmark_38252_48977;
  wire [62:0] out_ui_bit_ior_expr_FU_64_64_64_384_i0_fu_run_benchmark_38252_47892;
  wire [62:0] out_ui_bit_ior_expr_FU_64_64_64_384_i1_fu_run_benchmark_38252_47901;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_384_i2_fu_run_benchmark_38252_48853;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_384_i3_fu_run_benchmark_38252_49181;
  wire [5:0] out_ui_bit_ior_expr_FU_8_8_8_385_i0_fu_run_benchmark_38252_48038;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_385_i1_fu_run_benchmark_38252_49013;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_385_i2_fu_run_benchmark_38252_49016;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_385_i3_fu_run_benchmark_38252_49049;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_385_i4_fu_run_benchmark_38252_49052;
  wire [63:0] out_ui_bit_not_expr_FU_64_64_386_i0_fu_run_benchmark_38252_47886;
  wire [54:0] out_ui_bit_not_expr_FU_64_64_386_i1_fu_run_benchmark_38252_48050;
  wire [55:0] out_ui_bit_xor_expr_FU_64_64_64_387_i0_fu_run_benchmark_38252_48077;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_388_i0_fu_run_benchmark_38252_48688;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_388_i1_fu_run_benchmark_38252_48805;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_388_i2_fu_run_benchmark_38252_49334;
  wire [55:0] out_ui_cond_expr_FU_64_64_64_64_389_i0_fu_run_benchmark_38252_48167;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_389_i1_fu_run_benchmark_38252_48191;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_389_i2_fu_run_benchmark_38252_48332;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_389_i3_fu_run_benchmark_38252_48458;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_389_i4_fu_run_benchmark_38252_48485;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_389_i5_fu_run_benchmark_38252_48650;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_389_i6_fu_run_benchmark_38252_48820;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_389_i7_fu_run_benchmark_38252_49295;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_389_i8_fu_run_benchmark_38252_49313;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_389_i9_fu_run_benchmark_38252_49340;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_390_i0_fu_run_benchmark_38252_48476;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_390_i1_fu_run_benchmark_38252_48635;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_390_i2_fu_run_benchmark_38252_48989;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_390_i3_fu_run_benchmark_38252_48992;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_390_i4_fu_run_benchmark_38252_48995;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_390_i5_fu_run_benchmark_38252_49031;
  wire out_ui_eq_expr_FU_0_16_16_391_i0_fu_run_benchmark_38252_47963;
  wire out_ui_eq_expr_FU_0_16_16_391_i1_fu_run_benchmark_38252_47966;
  wire out_ui_eq_expr_FU_16_0_16_392_i0_fu_run_benchmark_38252_47951;
  wire out_ui_eq_expr_FU_16_0_16_392_i1_fu_run_benchmark_38252_47954;
  wire out_ui_eq_expr_FU_16_0_16_393_i0_fu_run_benchmark_38252_48140;
  wire out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176;
  wire out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918;
  wire out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936;
  wire out_ui_eq_expr_FU_16_0_16_395_i2_fu_run_benchmark_38252_49229;
  wire out_ui_eq_expr_FU_16_0_16_396_i0_fu_run_benchmark_38252_48921;
  wire out_ui_eq_expr_FU_16_0_16_396_i1_fu_run_benchmark_38252_48939;
  wire out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131;
  wire out_ui_eq_expr_FU_64_0_64_398_i0_fu_run_benchmark_38252_48924;
  wire out_ui_eq_expr_FU_64_0_64_398_i1_fu_run_benchmark_38252_48942;
  wire out_ui_eq_expr_FU_64_0_64_399_i0_fu_run_benchmark_38252_49220;
  wire out_ui_extract_bit_expr_FU_102_i0_fu_run_benchmark_38252_48005;
  wire out_ui_extract_bit_expr_FU_103_i0_fu_run_benchmark_38252_48008;
  wire out_ui_extract_bit_expr_FU_104_i0_fu_run_benchmark_38252_48011;
  wire out_ui_extract_bit_expr_FU_105_i0_fu_run_benchmark_38252_48014;
  wire out_ui_extract_bit_expr_FU_106_i0_fu_run_benchmark_38252_48017;
  wire out_ui_extract_bit_expr_FU_112_i0_fu_run_benchmark_38252_48101;
  wire out_ui_extract_bit_expr_FU_113_i0_fu_run_benchmark_38252_48104;
  wire out_ui_extract_bit_expr_FU_114_i0_fu_run_benchmark_38252_48107;
  wire out_ui_extract_bit_expr_FU_115_i0_fu_run_benchmark_38252_48110;
  wire out_ui_extract_bit_expr_FU_119_i0_fu_run_benchmark_38252_48146;
  wire out_ui_extract_bit_expr_FU_120_i0_fu_run_benchmark_38252_48149;
  wire out_ui_extract_bit_expr_FU_121_i0_fu_run_benchmark_38252_48152;
  wire out_ui_extract_bit_expr_FU_122_i0_fu_run_benchmark_38252_48155;
  wire out_ui_extract_bit_expr_FU_125_i0_fu_run_benchmark_38252_48194;
  wire out_ui_extract_bit_expr_FU_126_i0_fu_run_benchmark_38252_48197;
  wire out_ui_extract_bit_expr_FU_127_i0_fu_run_benchmark_38252_48200;
  wire out_ui_extract_bit_expr_FU_128_i0_fu_run_benchmark_38252_48203;
  wire out_ui_extract_bit_expr_FU_129_i0_fu_run_benchmark_38252_48206;
  wire out_ui_extract_bit_expr_FU_130_i0_fu_run_benchmark_38252_48209;
  wire out_ui_extract_bit_expr_FU_131_i0_fu_run_benchmark_38252_48212;
  wire out_ui_extract_bit_expr_FU_132_i0_fu_run_benchmark_38252_48215;
  wire out_ui_extract_bit_expr_FU_133_i0_fu_run_benchmark_38252_48218;
  wire out_ui_extract_bit_expr_FU_134_i0_fu_run_benchmark_38252_48221;
  wire out_ui_extract_bit_expr_FU_135_i0_fu_run_benchmark_38252_48224;
  wire out_ui_extract_bit_expr_FU_136_i0_fu_run_benchmark_38252_48227;
  wire out_ui_extract_bit_expr_FU_137_i0_fu_run_benchmark_38252_48230;
  wire out_ui_extract_bit_expr_FU_138_i0_fu_run_benchmark_38252_48233;
  wire out_ui_extract_bit_expr_FU_139_i0_fu_run_benchmark_38252_48236;
  wire out_ui_extract_bit_expr_FU_140_i0_fu_run_benchmark_38252_48239;
  wire out_ui_extract_bit_expr_FU_141_i0_fu_run_benchmark_38252_48242;
  wire out_ui_extract_bit_expr_FU_142_i0_fu_run_benchmark_38252_48245;
  wire out_ui_extract_bit_expr_FU_143_i0_fu_run_benchmark_38252_48248;
  wire out_ui_extract_bit_expr_FU_144_i0_fu_run_benchmark_38252_48251;
  wire out_ui_extract_bit_expr_FU_145_i0_fu_run_benchmark_38252_48254;
  wire out_ui_extract_bit_expr_FU_146_i0_fu_run_benchmark_38252_48257;
  wire out_ui_extract_bit_expr_FU_147_i0_fu_run_benchmark_38252_48260;
  wire out_ui_extract_bit_expr_FU_148_i0_fu_run_benchmark_38252_48263;
  wire out_ui_extract_bit_expr_FU_149_i0_fu_run_benchmark_38252_48266;
  wire out_ui_extract_bit_expr_FU_150_i0_fu_run_benchmark_38252_48269;
  wire out_ui_extract_bit_expr_FU_151_i0_fu_run_benchmark_38252_48272;
  wire out_ui_extract_bit_expr_FU_152_i0_fu_run_benchmark_38252_48275;
  wire out_ui_extract_bit_expr_FU_153_i0_fu_run_benchmark_38252_48278;
  wire out_ui_extract_bit_expr_FU_154_i0_fu_run_benchmark_38252_48281;
  wire out_ui_extract_bit_expr_FU_155_i0_fu_run_benchmark_38252_48284;
  wire out_ui_extract_bit_expr_FU_156_i0_fu_run_benchmark_38252_48287;
  wire out_ui_extract_bit_expr_FU_168_i0_fu_run_benchmark_38252_48335;
  wire out_ui_extract_bit_expr_FU_169_i0_fu_run_benchmark_38252_48338;
  wire out_ui_extract_bit_expr_FU_170_i0_fu_run_benchmark_38252_48341;
  wire out_ui_extract_bit_expr_FU_171_i0_fu_run_benchmark_38252_48344;
  wire out_ui_extract_bit_expr_FU_172_i0_fu_run_benchmark_38252_48347;
  wire out_ui_extract_bit_expr_FU_173_i0_fu_run_benchmark_38252_48350;
  wire out_ui_extract_bit_expr_FU_174_i0_fu_run_benchmark_38252_48353;
  wire out_ui_extract_bit_expr_FU_175_i0_fu_run_benchmark_38252_48356;
  wire out_ui_extract_bit_expr_FU_176_i0_fu_run_benchmark_38252_48359;
  wire out_ui_extract_bit_expr_FU_177_i0_fu_run_benchmark_38252_48362;
  wire out_ui_extract_bit_expr_FU_178_i0_fu_run_benchmark_38252_48365;
  wire out_ui_extract_bit_expr_FU_179_i0_fu_run_benchmark_38252_48368;
  wire out_ui_extract_bit_expr_FU_180_i0_fu_run_benchmark_38252_48371;
  wire out_ui_extract_bit_expr_FU_181_i0_fu_run_benchmark_38252_48374;
  wire out_ui_extract_bit_expr_FU_182_i0_fu_run_benchmark_38252_48377;
  wire out_ui_extract_bit_expr_FU_183_i0_fu_run_benchmark_38252_48380;
  wire out_ui_extract_bit_expr_FU_184_i0_fu_run_benchmark_38252_48383;
  wire out_ui_extract_bit_expr_FU_185_i0_fu_run_benchmark_38252_48386;
  wire out_ui_extract_bit_expr_FU_186_i0_fu_run_benchmark_38252_48389;
  wire out_ui_extract_bit_expr_FU_187_i0_fu_run_benchmark_38252_48392;
  wire out_ui_extract_bit_expr_FU_188_i0_fu_run_benchmark_38252_48395;
  wire out_ui_extract_bit_expr_FU_189_i0_fu_run_benchmark_38252_48398;
  wire out_ui_extract_bit_expr_FU_190_i0_fu_run_benchmark_38252_48401;
  wire out_ui_extract_bit_expr_FU_191_i0_fu_run_benchmark_38252_48404;
  wire out_ui_extract_bit_expr_FU_192_i0_fu_run_benchmark_38252_48407;
  wire out_ui_extract_bit_expr_FU_193_i0_fu_run_benchmark_38252_48410;
  wire out_ui_extract_bit_expr_FU_194_i0_fu_run_benchmark_38252_48413;
  wire out_ui_extract_bit_expr_FU_195_i0_fu_run_benchmark_38252_48416;
  wire out_ui_extract_bit_expr_FU_207_i0_fu_run_benchmark_38252_49782;
  wire out_ui_extract_bit_expr_FU_208_i0_fu_run_benchmark_38252_49786;
  wire out_ui_extract_bit_expr_FU_209_i0_fu_run_benchmark_38252_49715;
  wire out_ui_extract_bit_expr_FU_210_i0_fu_run_benchmark_38252_49790;
  wire out_ui_extract_bit_expr_FU_211_i0_fu_run_benchmark_38252_49723;
  wire out_ui_extract_bit_expr_FU_212_i0_fu_run_benchmark_38252_49727;
  wire out_ui_extract_bit_expr_FU_213_i0_fu_run_benchmark_38252_49620;
  wire out_ui_extract_bit_expr_FU_214_i0_fu_run_benchmark_38252_49731;
  wire out_ui_extract_bit_expr_FU_215_i0_fu_run_benchmark_38252_49735;
  wire out_ui_extract_bit_expr_FU_216_i0_fu_run_benchmark_38252_49635;
  wire out_ui_extract_bit_expr_FU_217_i0_fu_run_benchmark_38252_49739;
  wire out_ui_extract_bit_expr_FU_218_i0_fu_run_benchmark_38252_49643;
  wire out_ui_extract_bit_expr_FU_219_i0_fu_run_benchmark_38252_49647;
  wire out_ui_extract_bit_expr_FU_220_i0_fu_run_benchmark_38252_49550;
  wire out_ui_extract_bit_expr_FU_221_i0_fu_run_benchmark_38252_49794;
  wire out_ui_extract_bit_expr_FU_222_i0_fu_run_benchmark_38252_49798;
  wire out_ui_extract_bit_expr_FU_223_i0_fu_run_benchmark_38252_49754;
  wire out_ui_extract_bit_expr_FU_224_i0_fu_run_benchmark_38252_49802;
  wire out_ui_extract_bit_expr_FU_225_i0_fu_run_benchmark_38252_49762;
  wire out_ui_extract_bit_expr_FU_226_i0_fu_run_benchmark_38252_49766;
  wire out_ui_extract_bit_expr_FU_227_i0_fu_run_benchmark_38252_49673;
  wire out_ui_extract_bit_expr_FU_228_i0_fu_run_benchmark_38252_49770;
  wire out_ui_extract_bit_expr_FU_229_i0_fu_run_benchmark_38252_49774;
  wire out_ui_extract_bit_expr_FU_230_i0_fu_run_benchmark_38252_49688;
  wire out_ui_extract_bit_expr_FU_231_i0_fu_run_benchmark_38252_49778;
  wire out_ui_extract_bit_expr_FU_232_i0_fu_run_benchmark_38252_49696;
  wire out_ui_extract_bit_expr_FU_233_i0_fu_run_benchmark_38252_49700;
  wire out_ui_extract_bit_expr_FU_234_i0_fu_run_benchmark_38252_49594;
  wire out_ui_extract_bit_expr_FU_247_i0_fu_run_benchmark_38252_48488;
  wire out_ui_extract_bit_expr_FU_248_i0_fu_run_benchmark_38252_48491;
  wire out_ui_extract_bit_expr_FU_249_i0_fu_run_benchmark_38252_48494;
  wire out_ui_extract_bit_expr_FU_250_i0_fu_run_benchmark_38252_48497;
  wire out_ui_extract_bit_expr_FU_251_i0_fu_run_benchmark_38252_48500;
  wire out_ui_extract_bit_expr_FU_252_i0_fu_run_benchmark_38252_48503;
  wire out_ui_extract_bit_expr_FU_253_i0_fu_run_benchmark_38252_48506;
  wire out_ui_extract_bit_expr_FU_254_i0_fu_run_benchmark_38252_48509;
  wire out_ui_extract_bit_expr_FU_255_i0_fu_run_benchmark_38252_48512;
  wire out_ui_extract_bit_expr_FU_256_i0_fu_run_benchmark_38252_48515;
  wire out_ui_extract_bit_expr_FU_257_i0_fu_run_benchmark_38252_48518;
  wire out_ui_extract_bit_expr_FU_258_i0_fu_run_benchmark_38252_48521;
  wire out_ui_extract_bit_expr_FU_259_i0_fu_run_benchmark_38252_48524;
  wire out_ui_extract_bit_expr_FU_260_i0_fu_run_benchmark_38252_48527;
  wire out_ui_extract_bit_expr_FU_261_i0_fu_run_benchmark_38252_48530;
  wire out_ui_extract_bit_expr_FU_262_i0_fu_run_benchmark_38252_48533;
  wire out_ui_extract_bit_expr_FU_263_i0_fu_run_benchmark_38252_48536;
  wire out_ui_extract_bit_expr_FU_264_i0_fu_run_benchmark_38252_48539;
  wire out_ui_extract_bit_expr_FU_265_i0_fu_run_benchmark_38252_48542;
  wire out_ui_extract_bit_expr_FU_266_i0_fu_run_benchmark_38252_48545;
  wire out_ui_extract_bit_expr_FU_267_i0_fu_run_benchmark_38252_48548;
  wire out_ui_extract_bit_expr_FU_268_i0_fu_run_benchmark_38252_48551;
  wire out_ui_extract_bit_expr_FU_269_i0_fu_run_benchmark_38252_48554;
  wire out_ui_extract_bit_expr_FU_270_i0_fu_run_benchmark_38252_48557;
  wire out_ui_extract_bit_expr_FU_271_i0_fu_run_benchmark_38252_48560;
  wire out_ui_extract_bit_expr_FU_272_i0_fu_run_benchmark_38252_48563;
  wire out_ui_extract_bit_expr_FU_273_i0_fu_run_benchmark_38252_48566;
  wire out_ui_extract_bit_expr_FU_274_i0_fu_run_benchmark_38252_48569;
  wire out_ui_extract_bit_expr_FU_292_i0_fu_run_benchmark_38252_48703;
  wire out_ui_extract_bit_expr_FU_293_i0_fu_run_benchmark_38252_48706;
  wire out_ui_extract_bit_expr_FU_294_i0_fu_run_benchmark_38252_48709;
  wire out_ui_extract_bit_expr_FU_295_i0_fu_run_benchmark_38252_48712;
  wire out_ui_extract_bit_expr_FU_296_i0_fu_run_benchmark_38252_48715;
  wire out_ui_extract_bit_expr_FU_297_i0_fu_run_benchmark_38252_48718;
  wire out_ui_extract_bit_expr_FU_298_i0_fu_run_benchmark_38252_48721;
  wire out_ui_extract_bit_expr_FU_299_i0_fu_run_benchmark_38252_48724;
  wire out_ui_extract_bit_expr_FU_300_i0_fu_run_benchmark_38252_48727;
  wire out_ui_extract_bit_expr_FU_301_i0_fu_run_benchmark_38252_48730;
  wire out_ui_extract_bit_expr_FU_30_i0_fu_run_benchmark_38252_48900;
  wire out_ui_extract_bit_expr_FU_314_i0_fu_run_benchmark_38252_48793;
  wire out_ui_extract_bit_expr_FU_315_i0_fu_run_benchmark_38252_48796;
  wire out_ui_extract_bit_expr_FU_316_i0_fu_run_benchmark_38252_48799;
  wire out_ui_extract_bit_expr_FU_317_i0_fu_run_benchmark_38252_48802;
  wire out_ui_extract_bit_expr_FU_318_i0_fu_run_benchmark_38252_48811;
  wire out_ui_extract_bit_expr_FU_31_i0_fu_run_benchmark_38252_48903;
  wire out_ui_extract_bit_expr_FU_321_i0_fu_run_benchmark_38252_48823;
  wire out_ui_extract_bit_expr_FU_322_i0_fu_run_benchmark_38252_48826;
  wire out_ui_extract_bit_expr_FU_50_i0_fu_run_benchmark_38252_49133;
  wire out_ui_extract_bit_expr_FU_52_i0_fu_run_benchmark_38252_49139;
  wire out_ui_extract_bit_expr_FU_58_i0_fu_run_benchmark_38252_49196;
  wire out_ui_extract_bit_expr_FU_59_i0_fu_run_benchmark_38252_49205;
  wire out_ui_extract_bit_expr_FU_60_i0_fu_run_benchmark_38252_49208;
  wire out_ui_extract_bit_expr_FU_63_i0_fu_run_benchmark_38252_49232;
  wire out_ui_extract_bit_expr_FU_64_i0_fu_run_benchmark_38252_49250;
  wire out_ui_extract_bit_expr_FU_65_i0_fu_run_benchmark_38252_49253;
  wire out_ui_extract_bit_expr_FU_66_i0_fu_run_benchmark_38252_49256;
  wire out_ui_extract_bit_expr_FU_75_i0_fu_run_benchmark_38252_49283;
  wire out_ui_extract_bit_expr_FU_76_i0_fu_run_benchmark_38252_49286;
  wire out_ui_extract_bit_expr_FU_77_i0_fu_run_benchmark_38252_49289;
  wire out_ui_extract_bit_expr_FU_79_i0_fu_run_benchmark_38252_49298;
  wire out_ui_extract_bit_expr_FU_80_i0_fu_run_benchmark_38252_49301;
  wire out_ui_extract_bit_expr_FU_81_i0_fu_run_benchmark_38252_49304;
  wire out_ui_extract_bit_expr_FU_84_i0_fu_run_benchmark_38252_49316;
  wire out_ui_extract_bit_expr_FU_85_i0_fu_run_benchmark_38252_49319;
  wire out_ui_extract_bit_expr_FU_86_i0_fu_run_benchmark_38252_49322;
  wire out_ui_extract_bit_expr_FU_91_i0_fu_run_benchmark_38252_47915;
  wire out_ui_extract_bit_expr_FU_92_i0_fu_run_benchmark_38252_47918;
  wire out_ui_extract_bit_expr_FU_93_i0_fu_run_benchmark_38252_47921;
  wire out_ui_extract_bit_expr_FU_94_i0_fu_run_benchmark_38252_47924;
  wire [54:0] out_ui_lshift_expr_FU_0_64_64_400_i0_fu_run_benchmark_38252_48047;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_401_i0_fu_run_benchmark_38252_38688;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_402_i0_fu_run_benchmark_38252_39792;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_403_i0_fu_run_benchmark_38252_39800;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_404_i0_fu_run_benchmark_38252_43063;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_404_i1_fu_run_benchmark_38252_43093;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_405_i0_fu_run_benchmark_38252_43080;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_406_i0_fu_run_benchmark_38252_47984;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_406_i1_fu_run_benchmark_38252_47996;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_406_i2_fu_run_benchmark_38252_48682;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_406_i3_fu_run_benchmark_38252_48808;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_406_i4_fu_run_benchmark_38252_49190;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_407_i0_fu_run_benchmark_38252_47990;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_407_i1_fu_run_benchmark_38252_48002;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_408_i0_fu_run_benchmark_38252_48062;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_408_i1_fu_run_benchmark_38252_48656;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_409_i0_fu_run_benchmark_38252_48092;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_410_i0_fu_run_benchmark_38252_48134;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_410_i1_fu_run_benchmark_38252_49100;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_411_i0_fu_run_benchmark_38252_48179;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_412_i0_fu_run_benchmark_38252_48320;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_413_i0_fu_run_benchmark_38252_48449;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_414_i0_fu_run_benchmark_38252_48473;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_415_i0_fu_run_benchmark_38252_48605;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_415_i1_fu_run_benchmark_38252_49148;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_415_i2_fu_run_benchmark_38252_49178;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_416_i0_fu_run_benchmark_38252_48653;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_417_i0_fu_run_benchmark_38252_48691;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_418_i0_fu_run_benchmark_38252_48838;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_419_i0_fu_run_benchmark_38252_48850;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_420_i0_fu_run_benchmark_38252_48912;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_421_i0_fu_run_benchmark_38252_49106;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_422_i0_fu_run_benchmark_38252_49118;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_423_i0_fu_run_benchmark_38252_49337;
  wire [53:0] out_ui_lshift_expr_FU_64_64_64_424_i0_fu_run_benchmark_38252_49157;
  wire [50:0] out_ui_lshift_expr_FU_64_64_64_424_i1_fu_run_benchmark_38252_49175;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_425_i0_fu_run_benchmark_38252_48455;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_426_i0_fu_run_benchmark_38252_48482;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_427_i0_fu_run_benchmark_38252_48611;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_428_i0_fu_run_benchmark_38252_48620;
  wire [5:0] out_ui_lshift_expr_FU_8_0_8_429_i0_fu_run_benchmark_38252_48626;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_430_i0_fu_run_benchmark_38252_49004;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_430_i1_fu_run_benchmark_38252_49040;
  wire out_ui_lt_expr_FU_16_16_16_431_i0_fu_run_benchmark_38252_48664;
  wire out_ui_lt_expr_FU_64_64_64_432_i0_fu_run_benchmark_38252_47868;
  wire [10:0] out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_434_i0_fu_run_benchmark_38252_49064;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_434_i1_fu_run_benchmark_38252_49073;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_434_i2_fu_run_benchmark_38252_49085;
  wire [41:0] out_ui_mult_expr_FU_32_32_32_0_434_i3_fu_run_benchmark_38252_49094;
  wire out_ui_ne_expr_FU_32_32_32_435_i0_fu_run_benchmark_38252_39879;
  wire out_ui_ne_expr_FU_64_0_64_436_i0_fu_run_benchmark_38252_47957;
  wire out_ui_ne_expr_FU_64_0_64_436_i1_fu_run_benchmark_38252_47960;
  wire out_ui_ne_expr_FU_64_0_64_436_i2_fu_run_benchmark_38252_48927;
  wire out_ui_ne_expr_FU_64_0_64_436_i3_fu_run_benchmark_38252_48930;
  wire out_ui_ne_expr_FU_64_0_64_436_i4_fu_run_benchmark_38252_48945;
  wire out_ui_ne_expr_FU_64_0_64_436_i5_fu_run_benchmark_38252_48948;
  wire out_ui_ne_expr_FU_64_0_64_437_i0_fu_run_benchmark_38252_48068;
  wire out_ui_ne_expr_FU_64_0_64_438_i0_fu_run_benchmark_38252_49202;
  wire [12:0] out_ui_plus_expr_FU_16_16_16_439_i0_fu_run_benchmark_38252_49145;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_440_i0_fu_run_benchmark_38252_43060;
  wire [27:0] out_ui_plus_expr_FU_32_0_32_441_i0_fu_run_benchmark_38252_43077;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_441_i1_fu_run_benchmark_38252_43090;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_442_i0_fu_run_benchmark_38252_48089;
  wire [55:0] out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119;
  wire [62:0] out_ui_plus_expr_FU_64_64_64_442_i2_fu_run_benchmark_38252_48781;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_442_i3_fu_run_benchmark_38252_49076;
  wire [52:0] out_ui_plus_expr_FU_64_64_64_442_i4_fu_run_benchmark_38252_49088;
  wire [63:0] out_ui_plus_expr_FU_64_64_64_442_i5_fu_run_benchmark_38252_49217;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_443_i0_fu_run_benchmark_38252_39698;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_0_32_444_i0_fu_run_benchmark_38252_39707;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_445_i0_fu_run_benchmark_38252_39715;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_445_i1_fu_run_benchmark_38252_39728;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_446_i0_fu_run_benchmark_38252_38684;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_446_i1_fu_run_benchmark_38252_39795;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_446_i2_fu_run_benchmark_38252_39803;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_447_i0_fu_run_benchmark_38252_43055;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_447_i1_fu_run_benchmark_38252_43088;
  wire [27:0] out_ui_rshift_expr_FU_32_0_32_448_i0_fu_run_benchmark_38252_43073;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_449_i0_fu_run_benchmark_38252_47907;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_449_i1_fu_run_benchmark_38252_47945;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_449_i2_fu_run_benchmark_38252_48784;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_449_i3_fu_run_benchmark_38252_48873;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_449_i4_fu_run_benchmark_38252_48889;
  wire [1:0] out_ui_rshift_expr_FU_64_0_64_449_i5_fu_run_benchmark_38252_49163;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_449_i6_fu_run_benchmark_38252_49223;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_450_i0_fu_run_benchmark_38252_48053;
  wire [53:0] out_ui_rshift_expr_FU_64_0_64_450_i1_fu_run_benchmark_38252_48083;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_450_i2_fu_run_benchmark_38252_48086;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_451_i0_fu_run_benchmark_38252_48056;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_451_i1_fu_run_benchmark_38252_48065;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_451_i2_fu_run_benchmark_38252_48638;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_451_i3_fu_run_benchmark_38252_48641;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_452_i0_fu_run_benchmark_38252_48125;
  wire [15:0] out_ui_rshift_expr_FU_64_0_64_453_i0_fu_run_benchmark_38252_48170;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_454_i0_fu_run_benchmark_38252_48644;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_454_i1_fu_run_benchmark_38252_48647;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_455_i0_fu_run_benchmark_38252_48685;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_456_i0_fu_run_benchmark_38252_48694;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_457_i0_fu_run_benchmark_38252_48957;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_457_i1_fu_run_benchmark_38252_48967;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_457_i2_fu_run_benchmark_38252_49070;
  wire [21:0] out_ui_rshift_expr_FU_64_0_64_457_i3_fu_run_benchmark_38252_49082;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_457_i4_fu_run_benchmark_38252_49091;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_458_i0_fu_run_benchmark_38252_49103;
  wire [9:0] out_ui_rshift_expr_FU_64_0_64_459_i0_fu_run_benchmark_38252_49121;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_460_i0_fu_run_benchmark_38252_49331;
  wire [54:0] out_ui_rshift_expr_FU_64_64_64_461_i0_fu_run_benchmark_38252_48071;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_462_i0_fu_run_benchmark_38252_49019;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_462_i1_fu_run_benchmark_38252_49055;
  wire [1:0] out_ui_rshift_expr_FU_8_8_8_463_i0_fu_run_benchmark_38252_49172;
  wire [12:0] out_ui_ternary_plus_expr_FU_16_0_16_16_464_i0_fu_run_benchmark_38252_49025;
  wire [41:0] out_ui_ternary_plus_expr_FU_64_64_64_64_465_i0_fu_run_benchmark_38252_49097;
  wire [10:0] out_ui_ternary_pm_expr_FU_16_0_16_16_466_i0_fu_run_benchmark_38252_48676;
  wire [63:0] out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_0));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) ASSIGN_VECTOR_BOOL_FU_vb_assign_1 (.out1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1),
    .in1(out_reg_8_reg_8));
  BMEMORY_CTRLN #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(64),
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
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_332_i0 (.out1({out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0,
      out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1}),
    .in2({out_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0,
      out_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1}),
    .in3({out_conv_out_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0_8_7,
      out_conv_out_const_7_8_7}),
    .in4({out_const_19,
      out_const_19}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_332_i1_LOAD,
      fuselector_BMEMORY_CTRLN_332_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_332_i1_STORE,
      fuselector_BMEMORY_CTRLN_332_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_12_BMEMORY_CTRLN_332_i1_1_0_0 (.out1(out_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0),
    .sel(selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0),
    .in1(out_UUdata_converter_FU_18_i0_fu_run_benchmark_38252_38631),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_446_i2_fu_run_benchmark_38252_39803));
  MUX_GATE #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) MUX_13_BMEMORY_CTRLN_332_i1_2_0_0 (.out1(out_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0),
    .sel(selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0),
    .in1(out_conv_out_const_6_7_8),
    .in2(out_const_7));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_600_reg_1_0_0_0 (.out1(out_MUX_600_reg_1_0_0_0),
    .sel(selector_MUX_600_reg_1_0_0_0),
    .in1(out_UUdata_converter_FU_11_i0_fu_run_benchmark_38252_38565),
    .in2(out_ui_bit_ior_concat_expr_FU_367_i0_fu_run_benchmark_38252_38715));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_620_reg_2_0_0_0 (.out1(out_MUX_620_reg_2_0_0_0),
    .sel(selector_MUX_620_reg_2_0_0_0),
    .in1(out_UUdata_converter_FU_12_i0_fu_run_benchmark_38252_38566),
    .in2(out_ui_bit_ior_concat_expr_FU_366_i1_fu_run_benchmark_38252_38719));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_631_reg_3_0_0_0 (.out1(out_MUX_631_reg_3_0_0_0),
    .sel(selector_MUX_631_reg_3_0_0_0),
    .in1(out_UUdata_converter_FU_10_i0_fu_run_benchmark_38252_38564),
    .in2(out_ui_bit_ior_concat_expr_FU_366_i0_fu_run_benchmark_38252_38711));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_686_reg_8_0_0_0 (.out1(out_MUX_686_reg_8_0_0_0),
    .sel(selector_MUX_686_reg_8_0_0_0),
    .in1(out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_374_i0_fu_run_benchmark_38252_48859));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_697_reg_9_0_0_0 (.out1(out_MUX_697_reg_9_0_0_0),
    .sel(selector_MUX_697_reg_9_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in2(out_plus_expr_FU_32_0_32_337_i0_fu_run_benchmark_38252_38677));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_332_i0_1_0_0 (.out1(out_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0),
    .sel(selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_12_reg_12));
  MUX_GATE #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) MUX_9_BMEMORY_CTRLN_332_i0_1_0_1 (.out1(out_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1),
    .sel(selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_446_i1_fu_run_benchmark_38252_39795),
    .in2(out_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(46),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(46)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
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
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0101000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_100 (.out1(out_const_100));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_101 (.out1(out_const_101));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111011100000000)) const_102 (.out1(out_const_102));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111011110110011110101011001000111100110101000101100010010000000)) const_103 (.out1(out_const_103));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_104 (.out1(out_const_104));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_105 (.out1(out_const_105));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111100000000000000000000000011111110000000000000000000000000)) const_106 (.out1(out_const_106));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111100000000000000000000000011111111000000000000000100000000)) const_107 (.out1(out_const_107));
  constant_value #(.BITSIZE_out1(24),
    .value(24'b111111110000000011111110)) const_108 (.out1(out_const_108));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111111)) const_109 (.out1(out_const_109));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111110)) const_110 (.out1(out_const_110));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_111 (.out1(out_const_111));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111110000000000000000000000000000000000000000000000000000)) const_112 (.out1(out_const_112));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111110000000100010001000011111111111100001110111011100000)) const_113 (.out1(out_const_113));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1111111111111)) const_114 (.out1(out_const_114));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111111)) const_115 (.out1(out_const_115));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111110110010100000)) const_116 (.out1(out_const_116));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111110000000001)) const_117 (.out1(out_const_117));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111110)) const_118 (.out1(out_const_118));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_119 (.out1(out_const_119));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111100000000101010000000000000000000)) const_120 (.out1(out_const_120));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_121 (.out1(out_const_121));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b11111111111111111111111111111111111111111111111111111)) const_122 (.out1(out_const_122));
  constant_value #(.BITSIZE_out1(54),
    .value(54'b111111111111111111111111111111111111111111111111111111)) const_123 (.out1(out_const_123));
  constant_value #(.BITSIZE_out1(55),
    .value(55'b1111111111111111111111111111111111111111111111111111111)) const_124 (.out1(out_const_124));
  constant_value #(.BITSIZE_out1(56),
    .value(56'b11111111111111111111111111111111111111111111111111111111)) const_125 (.out1(out_const_125));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_126 (.out1(out_const_126));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_127 (.out1(out_const_127));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110011)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10000000)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1000000000000)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1000000000000000)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b10000000000000000000000000000000000000000000000000000)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1000000000000000100000000000000010001000100010000000)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(41),
    .value(41'b10000000011111111000000001111111100000000)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(61),
    .value(61'b1000000010000000100010000000000000000000000000000000000000000)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100001)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10001)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100010)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(25),
    .value(25'b1000100010000000000000000)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1000100010001101000000000000010110001000100010000000000000000000)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1000100011110)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100011)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b10001100101011101001110110111111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1000110010101110100111011011111100000000000000000000000000000000)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10010)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100100)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100101)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10011)) const_45 (.out1(out_const_45));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100110)) const_46 (.out1(out_const_46));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1001101001100000)) const_47 (.out1(out_const_47));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100111)) const_48 (.out1(out_const_48));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_49 (.out1(out_const_49));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1010)) const_50 (.out1(out_const_50));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_51 (.out1(out_const_51));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1010001011100110100000001100010010110011111101111001000111010101)) const_52 (.out1(out_const_52));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_53 (.out1(out_const_53));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10101)) const_54 (.out1(out_const_54));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101010)) const_55 (.out1(out_const_55));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10101000)) const_56 (.out1(out_const_56));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1010100000100)) const_57 (.out1(out_const_57));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b10101000001000)) const_58 (.out1(out_const_58));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b10101000010101110000000011111111)) const_59 (.out1(out_const_59));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1010100010101010101010101010101)) const_60 (.out1(out_const_60));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b10101011101010101010101010101010)) const_61 (.out1(out_const_61));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101011)) const_62 (.out1(out_const_62));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1010111000000100000000000000000)) const_63 (.out1(out_const_63));
  constant_value #(.BITSIZE_out1(47),
    .value(47'b10101110101011100000000010101110101011101010111)) const_64 (.out1(out_const_64));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1011)) const_65 (.out1(out_const_65));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_66 (.out1(out_const_66));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101100)) const_67 (.out1(out_const_67));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101101)) const_68 (.out1(out_const_68));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_69 (.out1(out_const_69));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101110)) const_70 (.out1(out_const_70));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101111)) const_71 (.out1(out_const_71));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_72 (.out1(out_const_72));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_73 (.out1(out_const_73));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_74 (.out1(out_const_74));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110000)) const_75 (.out1(out_const_75));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110001)) const_76 (.out1(out_const_76));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1100010010000000)) const_77 (.out1(out_const_77));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_78 (.out1(out_const_78));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110010)) const_79 (.out1(out_const_79));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11001000)) const_80 (.out1(out_const_80));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_81 (.out1(out_const_81));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_82 (.out1(out_const_82));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11010)) const_83 (.out1(out_const_83));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110100)) const_84 (.out1(out_const_84));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110101)) const_85 (.out1(out_const_85));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_86 (.out1(out_const_86));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110110)) const_87 (.out1(out_const_87));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11011000)) const_88 (.out1(out_const_88));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1101100001010000100010000000000011011000110110001101100011011000)) const_89 (.out1(out_const_89));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01010)) const_9 (.out1(out_const_9));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110111)) const_90 (.out1(out_const_90));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_91 (.out1(out_const_91));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_92 (.out1(out_const_92));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_93 (.out1(out_const_93));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100000)) const_94 (.out1(out_const_94));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1110011010100010110001001000000)) const_95 (.out1(out_const_95));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1110011110010000)) const_96 (.out1(out_const_96));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_97 (.out1(out_const_97));
  constant_value #(.BITSIZE_out1(30),
    .value(30'b111011011111110000100001001100)) const_98 (.out1(out_const_98));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1110111111111111)) const_99 (.out1(out_const_99));
  IIdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0_I_64_I_32 (.out1(out_conv_out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0_I_64_I_32),
    .in1(out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0_8_7 (.out1(out_conv_out_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0_8_7),
    .in1(out_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(8)) conv_out_const_6_7_8 (.out1(out_conv_out_const_6_7_8),
    .in1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_7_8_7 (.out1(out_conv_out_const_7_8_7),
    .in1(out_const_7));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32 (.out1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38564 (.out1(out_UUdata_converter_FU_10_i0_fu_run_benchmark_38252_38564),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_443_i0_fu_run_benchmark_38252_39698));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38565 (.out1(out_UUdata_converter_FU_11_i0_fu_run_benchmark_38252_38565),
    .in1(out_UUdata_converter_FU_9_i0_fu_run_benchmark_38252_39720));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38566 (.out1(out_UUdata_converter_FU_12_i0_fu_run_benchmark_38252_38566),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_445_i0_fu_run_benchmark_38252_39715));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38568 (.out1(out_UUdata_converter_FU_13_i0_fu_run_benchmark_38252_38568),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_445_i1_fu_run_benchmark_38252_39728));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38631 (.out1(out_UUdata_converter_FU_18_i0_fu_run_benchmark_38252_38631),
    .in1(out_reg_3_reg_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38663 (.out1(out_UUdata_converter_FU_19_i0_fu_run_benchmark_38252_38663),
    .in1(out_reg_1_reg_1));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_38666 (.out1(out_IUdata_converter_FU_24_i0_fu_run_benchmark_38252_38666),
    .in1(out_reg_9_reg_9));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_38677 (.out1(out_plus_expr_FU_32_0_32_337_i0_fu_run_benchmark_38252_38677),
    .in1(out_reg_9_reg_9),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_38684 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_446_i0_fu_run_benchmark_38252_38684),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_401_i0_fu_run_benchmark_38252_38688));
  ui_lshift_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_38688 (.out1(out_ui_lshift_expr_FU_32_0_32_401_i0_fu_run_benchmark_38252_38688),
    .in1(out_IUdata_converter_FU_25_i0_fu_run_benchmark_38252_38694),
    .in2(out_const_72));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu_run_benchmark_38252_38694 (.out1(out_IUdata_converter_FU_25_i0_fu_run_benchmark_38252_38694),
    .in1(out_conv_out_BMEMORY_CTRLN_332_i1_BMEMORY_CTRLN_332_i0_I_64_I_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_38702 (.out1(out_UUdata_converter_FU_20_i0_fu_run_benchmark_38252_38702),
    .in1(out_reg_2_reg_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_run_benchmark_38252_38711 (.out1(out_ui_bit_ior_concat_expr_FU_366_i0_fu_run_benchmark_38252_38711),
    .in1(out_ui_lshift_expr_FU_32_0_32_404_i0_fu_run_benchmark_38252_43063),
    .in2(out_ui_bit_and_expr_FU_8_0_8_360_i0_fu_run_benchmark_38252_43067),
    .in3(out_const_72));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(4)) fu_run_benchmark_38252_38715 (.out1(out_ui_bit_ior_concat_expr_FU_367_i0_fu_run_benchmark_38252_38715),
    .in1(out_ui_lshift_expr_FU_32_0_32_405_i0_fu_run_benchmark_38252_43080),
    .in2(out_ui_bit_and_expr_FU_8_0_8_361_i0_fu_run_benchmark_38252_43083),
    .in3(out_const_21));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_run_benchmark_38252_38719 (.out1(out_ui_bit_ior_concat_expr_FU_366_i1_fu_run_benchmark_38252_38719),
    .in1(out_ui_lshift_expr_FU_32_0_32_404_i1_fu_run_benchmark_38252_43093),
    .in2(out_ui_bit_and_expr_FU_8_0_8_360_i1_fu_run_benchmark_38252_43096),
    .in3(out_const_72));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38724 (.out1(out_read_cond_FU_329_i0_fu_run_benchmark_38252_38724),
    .in1(out_reg_10_reg_10));
  read_cond_FU #(.BITSIZE_in1(1)) fu_run_benchmark_38252_38727 (.out1(out_read_cond_FU_330_i0_fu_run_benchmark_38252_38727),
    .in1(out_ui_ne_expr_FU_32_32_32_435_i0_fu_run_benchmark_38252_39879));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39694 (.out1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39694),
    .in1(out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39760));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(16),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39698 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_443_i0_fu_run_benchmark_38252_39698),
    .in1(out_UUdata_converter_FU_3_i0_fu_run_benchmark_38252_39694),
    .in2(out_const_102));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_39703 (.out1(out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39703),
    .in1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39763));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(16),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39707 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_444_i0_fu_run_benchmark_38252_39707),
    .in1(out_UUdata_converter_FU_5_i0_fu_run_benchmark_38252_39703),
    .in2(out_const_96));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39711 (.out1(out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39711),
    .in1(out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39766));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(16),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39715 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_445_i0_fu_run_benchmark_38252_39715),
    .in1(out_UUdata_converter_FU_7_i0_fu_run_benchmark_38252_39711),
    .in2(out_const_47));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39720 (.out1(out_UUdata_converter_FU_9_i0_fu_run_benchmark_38252_39720),
    .in1(out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_39769));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(16),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39728 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_445_i1_fu_run_benchmark_38252_39728),
    .in1(in_port_vargs),
    .in2(out_const_47));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39760 (.out1(out_UUdata_converter_FU_2_i0_fu_run_benchmark_38252_39760),
    .in1(in_port_vargs));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_run_benchmark_38252_39763 (.out1(out_UUdata_converter_FU_4_i0_fu_run_benchmark_38252_39763),
    .in1(in_port_vargs));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39766 (.out1(out_UUdata_converter_FU_6_i0_fu_run_benchmark_38252_39766),
    .in1(in_port_vargs));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_39769 (.out1(out_UUdata_converter_FU_8_i0_fu_run_benchmark_38252_39769),
    .in1(in_port_vargs));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_39792 (.out1(out_ui_lshift_expr_FU_32_0_32_402_i0_fu_run_benchmark_38252_39792),
    .in1(out_IUdata_converter_FU_24_i0_fu_run_benchmark_38252_38666),
    .in2(out_const_72));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39795 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_446_i1_fu_run_benchmark_38252_39795),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_402_i0_fu_run_benchmark_38252_39792));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(23),
    .PRECISION(32)) fu_run_benchmark_38252_39800 (.out1(out_ui_lshift_expr_FU_32_0_32_403_i0_fu_run_benchmark_38252_39800),
    .in1(out_IUdata_converter_FU_24_i0_fu_run_benchmark_38252_38666),
    .in2(out_const_20));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23),
    .LSB_PARAMETER(0)) fu_run_benchmark_38252_39803 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_446_i2_fu_run_benchmark_38252_39803),
    .in1(out_reg_7_reg_7),
    .in2(out_ui_lshift_expr_FU_32_0_32_403_i0_fu_run_benchmark_38252_39800));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_39877 (.out1(out_ne_expr_FU_32_0_32_336_i0_fu_run_benchmark_38252_39877),
    .in1(out_plus_expr_FU_32_0_32_337_i0_fu_run_benchmark_38252_38677),
    .in2(out_const_9));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_39879 (.out1(out_ui_ne_expr_FU_32_32_32_435_i0_fu_run_benchmark_38252_39879),
    .in1(out_reg_1_reg_1),
    .in2(out_reg_0_reg_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_run_benchmark_38252_43055 (.out1(out_ui_rshift_expr_FU_32_0_32_447_i0_fu_run_benchmark_38252_43055),
    .in1(out_reg_3_reg_3),
    .in2(out_const_72));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_run_benchmark_38252_43060 (.out1(out_ui_plus_expr_FU_32_0_32_440_i0_fu_run_benchmark_38252_43060),
    .in1(out_ui_rshift_expr_FU_32_0_32_447_i0_fu_run_benchmark_38252_43055),
    .in2(out_const_19));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_43063 (.out1(out_ui_lshift_expr_FU_32_0_32_404_i0_fu_run_benchmark_38252_43063),
    .in1(out_ui_plus_expr_FU_32_0_32_440_i0_fu_run_benchmark_38252_43060),
    .in2(out_const_72));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_run_benchmark_38252_43067 (.out1(out_ui_bit_and_expr_FU_8_0_8_360_i0_fu_run_benchmark_38252_43067),
    .in1(out_reg_3_reg_3),
    .in2(out_const_91));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(28),
    .PRECISION(32)) fu_run_benchmark_38252_43073 (.out1(out_ui_rshift_expr_FU_32_0_32_448_i0_fu_run_benchmark_38252_43073),
    .in1(out_reg_1_reg_1),
    .in2(out_const_21));
  ui_plus_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_in2(3),
    .BITSIZE_out1(28)) fu_run_benchmark_38252_43077 (.out1(out_ui_plus_expr_FU_32_0_32_441_i0_fu_run_benchmark_38252_43077),
    .in1(out_ui_rshift_expr_FU_32_0_32_448_i0_fu_run_benchmark_38252_43073),
    .in2(out_const_49));
  ui_lshift_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_43080 (.out1(out_ui_lshift_expr_FU_32_0_32_405_i0_fu_run_benchmark_38252_43080),
    .in1(out_ui_plus_expr_FU_32_0_32_441_i0_fu_run_benchmark_38252_43077),
    .in2(out_const_21));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_run_benchmark_38252_43083 (.out1(out_ui_bit_and_expr_FU_8_0_8_361_i0_fu_run_benchmark_38252_43083),
    .in1(out_reg_1_reg_1),
    .in2(out_const_100));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_run_benchmark_38252_43088 (.out1(out_ui_rshift_expr_FU_32_0_32_447_i1_fu_run_benchmark_38252_43088),
    .in1(out_reg_2_reg_2),
    .in2(out_const_72));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(3),
    .BITSIZE_out1(29)) fu_run_benchmark_38252_43090 (.out1(out_ui_plus_expr_FU_32_0_32_441_i1_fu_run_benchmark_38252_43090),
    .in1(out_ui_rshift_expr_FU_32_0_32_447_i1_fu_run_benchmark_38252_43088),
    .in2(out_const_49));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_43093 (.out1(out_ui_lshift_expr_FU_32_0_32_404_i1_fu_run_benchmark_38252_43093),
    .in1(out_ui_plus_expr_FU_32_0_32_441_i1_fu_run_benchmark_38252_43090),
    .in2(out_const_72));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_run_benchmark_38252_43096 (.out1(out_ui_bit_and_expr_FU_8_0_8_360_i1_fu_run_benchmark_38252_43096),
    .in1(out_reg_2_reg_2),
    .in2(out_const_91));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu_run_benchmark_38252_47858 (.out1(out_ui_bit_and_expr_FU_0_64_64_342_i0_fu_run_benchmark_38252_47858),
    .in1(out_const_126),
    .in2(out_ui_cond_expr_FU_64_64_64_64_389_i9_fu_run_benchmark_38252_49340));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu_run_benchmark_38252_47863 (.out1(out_ui_bit_and_expr_FU_0_64_64_342_i1_fu_run_benchmark_38252_47863),
    .in1(out_const_126),
    .in2(out_reg_8_reg_8));
  ui_lt_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47868 (.out1(out_ui_lt_expr_FU_64_64_64_432_i0_fu_run_benchmark_38252_47868),
    .in1(out_ui_bit_and_expr_FU_0_64_64_342_i0_fu_run_benchmark_38252_47858),
    .in2(out_reg_11_reg_11));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_47871 (.out1(out_UIconvert_expr_FU_88_i0_fu_run_benchmark_38252_47871),
    .in1(out_ui_lt_expr_FU_64_64_64_432_i0_fu_run_benchmark_38252_47868));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_47874 (.out1(out_lshift_expr_FU_64_0_64_335_i0_fu_run_benchmark_38252_47874),
    .in1(out_UIconvert_expr_FU_88_i0_fu_run_benchmark_38252_47871),
    .in2(out_const_18));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu_run_benchmark_38252_47877 (.out1(out_rshift_expr_FU_64_0_64_340_i0_fu_run_benchmark_38252_47877),
    .in1(out_lshift_expr_FU_64_0_64_335_i0_fu_run_benchmark_38252_47874),
    .in2(out_const_18));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_47880 (.out1(out_IUdata_converter_FU_89_i0_fu_run_benchmark_38252_47880),
    .in1(out_rshift_expr_FU_64_0_64_340_i0_fu_run_benchmark_38252_47877));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_47883 (.out1(out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883),
    .in1(out_reg_56_reg_56),
    .in2(out_reg_8_reg_8));
  ui_bit_not_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_47886 (.out1(out_ui_bit_not_expr_FU_64_64_386_i0_fu_run_benchmark_38252_47886),
    .in1(out_IUdata_converter_FU_89_i0_fu_run_benchmark_38252_47880));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_47889 (.out1(out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889),
    .in1(out_reg_57_reg_57),
    .in2(out_reg_58_reg_58));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu_run_benchmark_38252_47892 (.out1(out_ui_bit_ior_expr_FU_64_64_64_384_i0_fu_run_benchmark_38252_47892),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889),
    .in2(out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_47895 (.out1(out_ui_bit_and_expr_FU_64_64_64_359_i2_fu_run_benchmark_38252_47895),
    .in1(out_reg_56_reg_56),
    .in2(out_reg_58_reg_58));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_47898 (.out1(out_ui_bit_and_expr_FU_64_64_64_359_i3_fu_run_benchmark_38252_47898),
    .in1(out_reg_57_reg_57),
    .in2(out_reg_8_reg_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu_run_benchmark_38252_47901 (.out1(out_ui_bit_ior_expr_FU_64_64_64_384_i1_fu_run_benchmark_38252_47901),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i3_fu_run_benchmark_38252_47898),
    .in2(out_ui_bit_and_expr_FU_64_64_64_359_i2_fu_run_benchmark_38252_47895));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_47904 (.out1(out_ui_bit_and_expr_FU_64_0_64_353_i0_fu_run_benchmark_38252_47904),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_384_i0_fu_run_benchmark_38252_47892),
    .in2(out_const_121));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_run_benchmark_38252_47907 (.out1(out_ui_rshift_expr_FU_64_0_64_449_i0_fu_run_benchmark_38252_47907),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_384_i0_fu_run_benchmark_38252_47892),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_47910 (.out1(out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910),
    .in1(out_ui_rshift_expr_FU_64_0_64_449_i0_fu_run_benchmark_38252_47907),
    .in2(out_const_111));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_47915 (.out1(out_ui_extract_bit_expr_FU_91_i0_fu_run_benchmark_38252_47915),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_47918 (.out1(out_ui_extract_bit_expr_FU_92_i0_fu_run_benchmark_38252_47918),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_47921 (.out1(out_ui_extract_bit_expr_FU_93_i0_fu_run_benchmark_38252_47921),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i3_fu_run_benchmark_38252_47898),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_47924 (.out1(out_ui_extract_bit_expr_FU_94_i0_fu_run_benchmark_38252_47924),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i2_fu_run_benchmark_38252_47895),
    .in2(out_const_105));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47927 (.out1(out_lut_expr_FU_95_i0_fu_run_benchmark_38252_47927),
    .in1(out_const_37),
    .in2(out_ui_extract_bit_expr_FU_91_i0_fu_run_benchmark_38252_47915),
    .in3(out_ui_extract_bit_expr_FU_92_i0_fu_run_benchmark_38252_47918),
    .in4(out_ui_extract_bit_expr_FU_93_i0_fu_run_benchmark_38252_47921),
    .in5(out_ui_extract_bit_expr_FU_94_i0_fu_run_benchmark_38252_47924),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_47930 (.out1(out_UIconvert_expr_FU_96_i0_fu_run_benchmark_38252_47930),
    .in1(out_lut_expr_FU_95_i0_fu_run_benchmark_38252_47927));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_47933 (.out1(out_lshift_expr_FU_64_0_64_335_i1_fu_run_benchmark_38252_47933),
    .in1(out_UIconvert_expr_FU_96_i0_fu_run_benchmark_38252_47930),
    .in2(out_const_18));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu_run_benchmark_38252_47936 (.out1(out_rshift_expr_FU_64_0_64_340_i1_fu_run_benchmark_38252_47936),
    .in1(out_lshift_expr_FU_64_0_64_335_i1_fu_run_benchmark_38252_47933),
    .in2(out_const_18));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(56)) fu_run_benchmark_38252_47939 (.out1(out_IUdata_converter_FU_97_i0_fu_run_benchmark_38252_47939),
    .in1(out_rshift_expr_FU_64_0_64_340_i1_fu_run_benchmark_38252_47936));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_47942 (.out1(out_ui_bit_and_expr_FU_0_64_64_343_i0_fu_run_benchmark_38252_47942),
    .in1(out_const_121),
    .in2(out_ui_bit_ior_expr_FU_64_64_64_384_i1_fu_run_benchmark_38252_47901));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_run_benchmark_38252_47945 (.out1(out_ui_rshift_expr_FU_64_0_64_449_i1_fu_run_benchmark_38252_47945),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_384_i1_fu_run_benchmark_38252_47901),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_47948 (.out1(out_ui_bit_and_expr_FU_0_16_16_341_i0_fu_run_benchmark_38252_47948),
    .in1(out_const_111),
    .in2(out_ui_rshift_expr_FU_64_0_64_449_i1_fu_run_benchmark_38252_47945));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47951 (.out1(out_ui_eq_expr_FU_16_0_16_392_i0_fu_run_benchmark_38252_47951),
    .in1(out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47954 (.out1(out_ui_eq_expr_FU_16_0_16_392_i1_fu_run_benchmark_38252_47954),
    .in1(out_ui_bit_and_expr_FU_0_16_16_341_i0_fu_run_benchmark_38252_47948),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47957 (.out1(out_ui_ne_expr_FU_64_0_64_436_i0_fu_run_benchmark_38252_47957),
    .in1(out_ui_bit_and_expr_FU_64_0_64_353_i0_fu_run_benchmark_38252_47904),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47960 (.out1(out_ui_ne_expr_FU_64_0_64_436_i1_fu_run_benchmark_38252_47960),
    .in1(out_ui_bit_and_expr_FU_0_64_64_343_i0_fu_run_benchmark_38252_47942),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47963 (.out1(out_ui_eq_expr_FU_0_16_16_391_i0_fu_run_benchmark_38252_47963),
    .in1(out_const_111),
    .in2(out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47966 (.out1(out_ui_eq_expr_FU_0_16_16_391_i1_fu_run_benchmark_38252_47966),
    .in1(out_const_111),
    .in2(out_ui_bit_and_expr_FU_0_16_16_341_i0_fu_run_benchmark_38252_47948));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47969 (.out1(out_lut_expr_FU_98_i0_fu_run_benchmark_38252_47969),
    .in1(out_const_19),
    .in2(out_ui_eq_expr_FU_16_0_16_392_i0_fu_run_benchmark_38252_47951),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47972 (.out1(out_lut_expr_FU_99_i0_fu_run_benchmark_38252_47972),
    .in1(out_const_19),
    .in2(out_ui_eq_expr_FU_16_0_16_392_i1_fu_run_benchmark_38252_47954),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_minus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_47975 (.out1(out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975),
    .in1(out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910),
    .in2(out_ui_bit_and_expr_FU_0_16_16_341_i0_fu_run_benchmark_38252_47948));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_47978 (.out1(out_ui_bit_and_expr_FU_8_0_8_362_i0_fu_run_benchmark_38252_47978),
    .in1(out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975),
    .in2(out_const_111));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47981 (.out1(out_UUdata_converter_FU_100_i0_fu_run_benchmark_38252_47981),
    .in1(out_lut_expr_FU_98_i0_fu_run_benchmark_38252_47969));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_47984 (.out1(out_ui_lshift_expr_FU_64_0_64_406_i0_fu_run_benchmark_38252_47984),
    .in1(out_UUdata_converter_FU_100_i0_fu_run_benchmark_38252_47981),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_47987 (.out1(out_ui_bit_ior_expr_FU_0_64_64_370_i0_fu_run_benchmark_38252_47987),
    .in1(out_ui_lshift_expr_FU_64_0_64_406_i0_fu_run_benchmark_38252_47984),
    .in2(out_ui_bit_and_expr_FU_64_0_64_353_i0_fu_run_benchmark_38252_47904));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_47990 (.out1(out_ui_lshift_expr_FU_64_0_64_407_i0_fu_run_benchmark_38252_47990),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_370_i0_fu_run_benchmark_38252_47987),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_47993 (.out1(out_UUdata_converter_FU_101_i0_fu_run_benchmark_38252_47993),
    .in1(out_lut_expr_FU_99_i0_fu_run_benchmark_38252_47972));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_47996 (.out1(out_ui_lshift_expr_FU_64_0_64_406_i1_fu_run_benchmark_38252_47996),
    .in1(out_UUdata_converter_FU_101_i0_fu_run_benchmark_38252_47993),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_47999 (.out1(out_ui_bit_ior_expr_FU_0_64_64_371_i0_fu_run_benchmark_38252_47999),
    .in1(out_ui_lshift_expr_FU_64_0_64_406_i1_fu_run_benchmark_38252_47996),
    .in2(out_ui_bit_and_expr_FU_0_64_64_343_i0_fu_run_benchmark_38252_47942));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48002 (.out1(out_ui_lshift_expr_FU_64_0_64_407_i1_fu_run_benchmark_38252_48002),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_371_i0_fu_run_benchmark_38252_47999),
    .in2(out_const_2));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48005 (.out1(out_ui_extract_bit_expr_FU_102_i0_fu_run_benchmark_38252_48005),
    .in1(out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975),
    .in2(out_const_73));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48008 (.out1(out_ui_extract_bit_expr_FU_103_i0_fu_run_benchmark_38252_48008),
    .in1(out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975),
    .in2(out_const_91));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48011 (.out1(out_ui_extract_bit_expr_FU_104_i0_fu_run_benchmark_38252_48011),
    .in1(out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48014 (.out1(out_ui_extract_bit_expr_FU_105_i0_fu_run_benchmark_38252_48014),
    .in1(out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48017 (.out1(out_ui_extract_bit_expr_FU_106_i0_fu_run_benchmark_38252_48017),
    .in1(out_ui_minus_expr_FU_16_16_16_433_i0_fu_run_benchmark_38252_47975),
    .in2(out_const_50));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48020 (.out1(out_lut_expr_FU_107_i0_fu_run_benchmark_38252_48020),
    .in1(out_const_118),
    .in2(out_ui_extract_bit_expr_FU_102_i0_fu_run_benchmark_38252_48005),
    .in3(out_ui_extract_bit_expr_FU_103_i0_fu_run_benchmark_38252_48008),
    .in4(out_ui_extract_bit_expr_FU_104_i0_fu_run_benchmark_38252_48011),
    .in5(out_ui_extract_bit_expr_FU_105_i0_fu_run_benchmark_38252_48014),
    .in6(out_ui_extract_bit_expr_FU_106_i0_fu_run_benchmark_38252_48017),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48023 (.out1(out_UIconvert_expr_FU_108_i0_fu_run_benchmark_38252_48023),
    .in1(out_lut_expr_FU_107_i0_fu_run_benchmark_38252_48020));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_48026 (.out1(out_lshift_expr_FU_32_0_32_333_i0_fu_run_benchmark_38252_48026),
    .in1(out_UIconvert_expr_FU_108_i0_fu_run_benchmark_38252_48023),
    .in2(out_const_17));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu_run_benchmark_38252_48029 (.out1(out_rshift_expr_FU_32_0_32_338_i0_fu_run_benchmark_38252_48029),
    .in1(out_lshift_expr_FU_32_0_32_333_i0_fu_run_benchmark_38252_48026),
    .in2(out_const_17));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_48032 (.out1(out_IUdata_converter_FU_109_i0_fu_run_benchmark_38252_48032),
    .in1(out_rshift_expr_FU_32_0_32_338_i0_fu_run_benchmark_38252_48029));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_48035 (.out1(out_UUdata_converter_FU_110_i0_fu_run_benchmark_38252_48035),
    .in1(out_IUdata_converter_FU_109_i0_fu_run_benchmark_38252_48032));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_48038 (.out1(out_ui_bit_ior_expr_FU_8_8_8_385_i0_fu_run_benchmark_38252_48038),
    .in1(out_UUdata_converter_FU_110_i0_fu_run_benchmark_38252_48035),
    .in2(out_ui_bit_and_expr_FU_8_0_8_362_i0_fu_run_benchmark_38252_47978));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_48041 (.out1(out_ui_bit_and_expr_FU_8_0_8_363_i0_fu_run_benchmark_38252_48041),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_385_i0_fu_run_benchmark_38252_48038),
    .in2(out_const_105));
  UIconvert_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(7)) fu_run_benchmark_38252_48044 (.out1(out_UIconvert_expr_FU_111_i0_fu_run_benchmark_38252_48044),
    .in1(out_ui_bit_and_expr_FU_8_0_8_363_i0_fu_run_benchmark_38252_48041));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48047 (.out1(out_ui_lshift_expr_FU_0_64_64_400_i0_fu_run_benchmark_38252_48047),
    .in1(out_const_127),
    .in2(out_UIconvert_expr_FU_111_i0_fu_run_benchmark_38252_48044));
  ui_bit_not_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) fu_run_benchmark_38252_48050 (.out1(out_ui_bit_not_expr_FU_64_64_386_i1_fu_run_benchmark_38252_48050),
    .in1(out_ui_lshift_expr_FU_0_64_64_400_i0_fu_run_benchmark_38252_48047));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_48053 (.out1(out_ui_rshift_expr_FU_64_0_64_450_i0_fu_run_benchmark_38252_48053),
    .in1(out_ui_bit_not_expr_FU_64_64_386_i1_fu_run_benchmark_38252_48050),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_48056 (.out1(out_ui_rshift_expr_FU_64_0_64_451_i0_fu_run_benchmark_38252_48056),
    .in1(out_ui_lshift_expr_FU_64_0_64_407_i1_fu_run_benchmark_38252_48002),
    .in2(out_const_20));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_48059 (.out1(out_ui_bit_and_expr_FU_64_64_64_359_i4_fu_run_benchmark_38252_48059),
    .in1(out_ui_rshift_expr_FU_64_0_64_450_i0_fu_run_benchmark_38252_48053),
    .in2(out_ui_rshift_expr_FU_64_0_64_451_i0_fu_run_benchmark_38252_48056));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48062 (.out1(out_ui_lshift_expr_FU_64_0_64_408_i0_fu_run_benchmark_38252_48062),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i4_fu_run_benchmark_38252_48059),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_48065 (.out1(out_ui_rshift_expr_FU_64_0_64_451_i1_fu_run_benchmark_38252_48065),
    .in1(out_ui_lshift_expr_FU_64_0_64_408_i0_fu_run_benchmark_38252_48062),
    .in2(out_const_20));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48068 (.out1(out_ui_ne_expr_FU_64_0_64_437_i0_fu_run_benchmark_38252_48068),
    .in1(out_ui_rshift_expr_FU_64_0_64_451_i1_fu_run_benchmark_38252_48065),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(7),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48071 (.out1(out_ui_rshift_expr_FU_64_64_64_461_i0_fu_run_benchmark_38252_48071),
    .in1(out_ui_lshift_expr_FU_64_0_64_407_i1_fu_run_benchmark_38252_48002),
    .in2(out_UIconvert_expr_FU_111_i0_fu_run_benchmark_38252_48044));
  ui_bit_and_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(55),
    .BITSIZE_out1(55)) fu_run_benchmark_38252_48074 (.out1(out_ui_bit_and_expr_FU_64_0_64_354_i0_fu_run_benchmark_38252_48074),
    .in1(out_ui_rshift_expr_FU_64_64_64_461_i0_fu_run_benchmark_38252_48071),
    .in2(out_const_124));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu_run_benchmark_38252_48077 (.out1(out_ui_bit_xor_expr_FU_64_64_64_387_i0_fu_run_benchmark_38252_48077),
    .in1(out_ui_bit_and_expr_FU_64_0_64_354_i0_fu_run_benchmark_38252_48074),
    .in2(out_IUdata_converter_FU_97_i0_fu_run_benchmark_38252_47939));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu_run_benchmark_38252_48080 (.out1(out_ui_bit_and_expr_FU_64_0_64_355_i0_fu_run_benchmark_38252_48080),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_387_i0_fu_run_benchmark_38252_48077),
    .in2(out_const_125));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu_run_benchmark_38252_48083 (.out1(out_ui_rshift_expr_FU_64_0_64_450_i1_fu_run_benchmark_38252_48083),
    .in1(out_ui_bit_and_expr_FU_64_0_64_355_i0_fu_run_benchmark_38252_48080),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_48086 (.out1(out_ui_rshift_expr_FU_64_0_64_450_i2_fu_run_benchmark_38252_48086),
    .in1(out_ui_lshift_expr_FU_64_0_64_407_i0_fu_run_benchmark_38252_47990),
    .in2(out_const_20));
  ui_plus_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(53),
    .BITSIZE_out1(54)) fu_run_benchmark_38252_48089 (.out1(out_ui_plus_expr_FU_64_64_64_442_i0_fu_run_benchmark_38252_48089),
    .in1(out_ui_rshift_expr_FU_64_0_64_450_i1_fu_run_benchmark_38252_48083),
    .in2(out_ui_rshift_expr_FU_64_0_64_450_i2_fu_run_benchmark_38252_48086));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu_run_benchmark_38252_48092 (.out1(out_ui_lshift_expr_FU_64_0_64_409_i0_fu_run_benchmark_38252_48092),
    .in1(out_reg_63_reg_63),
    .in2(out_const_20));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48095 (.out1(out_ui_bit_and_expr_FU_8_0_8_364_i0_fu_run_benchmark_38252_48095),
    .in1(out_ui_bit_and_expr_FU_64_0_64_355_i0_fu_run_benchmark_38252_48080),
    .in2(out_const_72));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(56),
    .OFFSET_PARAMETER(2)) fu_run_benchmark_38252_48098 (.out1(out_ui_bit_ior_concat_expr_FU_368_i0_fu_run_benchmark_38252_48098),
    .in1(out_ui_lshift_expr_FU_64_0_64_409_i0_fu_run_benchmark_38252_48092),
    .in2(out_reg_64_reg_64),
    .in3(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48101 (.out1(out_ui_extract_bit_expr_FU_112_i0_fu_run_benchmark_38252_48101),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48104 (.out1(out_ui_extract_bit_expr_FU_113_i0_fu_run_benchmark_38252_48104),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48107 (.out1(out_ui_extract_bit_expr_FU_114_i0_fu_run_benchmark_38252_48107),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i3_fu_run_benchmark_38252_47898),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48110 (.out1(out_ui_extract_bit_expr_FU_115_i0_fu_run_benchmark_38252_48110),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i2_fu_run_benchmark_38252_47895),
    .in2(out_const_105));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48113 (.out1(out_lut_expr_FU_116_i0_fu_run_benchmark_38252_48113),
    .in1(out_const_37),
    .in2(out_ui_extract_bit_expr_FU_112_i0_fu_run_benchmark_38252_48101),
    .in3(out_ui_extract_bit_expr_FU_113_i0_fu_run_benchmark_38252_48104),
    .in4(out_ui_extract_bit_expr_FU_114_i0_fu_run_benchmark_38252_48107),
    .in5(out_ui_extract_bit_expr_FU_115_i0_fu_run_benchmark_38252_48110),
    .in6(out_ui_ne_expr_FU_64_0_64_437_i0_fu_run_benchmark_38252_48068),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48116 (.out1(out_UUdata_converter_FU_117_i0_fu_run_benchmark_38252_48116),
    .in1(out_lut_expr_FU_116_i0_fu_run_benchmark_38252_48113));
  ui_plus_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1),
    .BITSIZE_out1(56)) fu_run_benchmark_38252_48119 (.out1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in1(out_ui_bit_ior_concat_expr_FU_368_i0_fu_run_benchmark_38252_48098),
    .in2(out_reg_65_reg_65));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu_run_benchmark_38252_48122 (.out1(out_ui_bit_and_expr_FU_64_0_64_355_i1_fu_run_benchmark_38252_48122),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_125));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu_run_benchmark_38252_48125 (.out1(out_ui_rshift_expr_FU_64_0_64_452_i0_fu_run_benchmark_38252_48125),
    .in1(out_ui_bit_and_expr_FU_64_0_64_355_i1_fu_run_benchmark_38252_48122),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_48128 (.out1(out_ui_bit_and_expr_FU_32_0_32_350_i0_fu_run_benchmark_38252_48128),
    .in1(out_ui_rshift_expr_FU_64_0_64_452_i0_fu_run_benchmark_38252_48125),
    .in2(out_const_119));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48131 (.out1(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in1(out_ui_bit_and_expr_FU_32_0_32_350_i0_fu_run_benchmark_38252_48128),
    .in2(out_const_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu_run_benchmark_38252_48134 (.out1(out_ui_lshift_expr_FU_64_0_64_410_i0_fu_run_benchmark_38252_48134),
    .in1(out_ui_bit_and_expr_FU_64_0_64_355_i1_fu_run_benchmark_38252_48122),
    .in2(out_const_6));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48140 (.out1(out_ui_eq_expr_FU_16_0_16_393_i0_fu_run_benchmark_38252_48140),
    .in1(out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910),
    .in2(out_const_110));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48143 (.out1(out_lut_expr_FU_118_i0_fu_run_benchmark_38252_48143),
    .in1(out_const_92),
    .in2(out_ui_eq_expr_FU_0_16_16_391_i1_fu_run_benchmark_38252_47966),
    .in3(out_ui_eq_expr_FU_0_16_16_391_i0_fu_run_benchmark_38252_47963),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48146 (.out1(out_ui_extract_bit_expr_FU_119_i0_fu_run_benchmark_38252_48146),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48149 (.out1(out_ui_extract_bit_expr_FU_120_i0_fu_run_benchmark_38252_48149),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48152 (.out1(out_ui_extract_bit_expr_FU_121_i0_fu_run_benchmark_38252_48152),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i3_fu_run_benchmark_38252_47898),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48155 (.out1(out_ui_extract_bit_expr_FU_122_i0_fu_run_benchmark_38252_48155),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i2_fu_run_benchmark_38252_47895),
    .in2(out_const_105));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48158 (.out1(out_UIdata_converter_FU_123_i0_fu_run_benchmark_38252_48158),
    .in1(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_48161 (.out1(out_lshift_expr_FU_32_0_32_334_i0_fu_run_benchmark_38252_48161),
    .in1(out_UIdata_converter_FU_123_i0_fu_run_benchmark_38252_48158),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu_run_benchmark_38252_48164 (.out1(out_rshift_expr_FU_32_0_32_339_i0_fu_run_benchmark_38252_48164),
    .in1(out_lshift_expr_FU_32_0_32_334_i0_fu_run_benchmark_38252_48161),
    .in2(out_const_16));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(56),
    .BITSIZE_in3(56),
    .BITSIZE_out1(56)) fu_run_benchmark_38252_48167 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i0_fu_run_benchmark_38252_48167),
    .in1(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in2(out_ui_lshift_expr_FU_64_0_64_410_i0_fu_run_benchmark_38252_48134),
    .in3(out_ui_bit_and_expr_FU_64_0_64_355_i1_fu_run_benchmark_38252_48122));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu_run_benchmark_38252_48170 (.out1(out_ui_rshift_expr_FU_64_0_64_453_i0_fu_run_benchmark_38252_48170),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i0_fu_run_benchmark_38252_48167),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu_run_benchmark_38252_48173 (.out1(out_ui_bit_and_expr_FU_16_0_16_345_i0_fu_run_benchmark_38252_48173),
    .in1(out_ui_rshift_expr_FU_64_0_64_453_i0_fu_run_benchmark_38252_48170),
    .in2(out_const_115));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48176 (.out1(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in1(out_ui_bit_and_expr_FU_16_0_16_345_i0_fu_run_benchmark_38252_48173),
    .in2(out_const_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48179 (.out1(out_ui_lshift_expr_FU_64_0_64_411_i0_fu_run_benchmark_38252_48179),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i0_fu_run_benchmark_38252_48167),
    .in2(out_const_5));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48182 (.out1(out_UIdata_converter_FU_124_i0_fu_run_benchmark_38252_48182),
    .in1(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_48185 (.out1(out_lshift_expr_FU_32_0_32_334_i1_fu_run_benchmark_38252_48185),
    .in1(out_UIdata_converter_FU_124_i0_fu_run_benchmark_38252_48182),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu_run_benchmark_38252_48188 (.out1(out_rshift_expr_FU_32_0_32_339_i1_fu_run_benchmark_38252_48188),
    .in1(out_lshift_expr_FU_32_0_32_334_i1_fu_run_benchmark_38252_48185),
    .in2(out_const_16));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(56),
    .BITSIZE_out1(55)) fu_run_benchmark_38252_48191 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i1_fu_run_benchmark_38252_48191),
    .in1(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in2(out_ui_lshift_expr_FU_64_0_64_411_i0_fu_run_benchmark_38252_48179),
    .in3(out_ui_cond_expr_FU_64_64_64_64_389_i0_fu_run_benchmark_38252_48167));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48194 (.out1(out_ui_extract_bit_expr_FU_125_i0_fu_run_benchmark_38252_48194),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48197 (.out1(out_ui_extract_bit_expr_FU_126_i0_fu_run_benchmark_38252_48197),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_24));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48200 (.out1(out_ui_extract_bit_expr_FU_127_i0_fu_run_benchmark_38252_48200),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_23));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48203 (.out1(out_ui_extract_bit_expr_FU_128_i0_fu_run_benchmark_38252_48203),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48206 (.out1(out_ui_extract_bit_expr_FU_129_i0_fu_run_benchmark_38252_48206),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48209 (.out1(out_ui_extract_bit_expr_FU_130_i0_fu_run_benchmark_38252_48209),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_32));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48212 (.out1(out_ui_extract_bit_expr_FU_131_i0_fu_run_benchmark_38252_48212),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48215 (.out1(out_ui_extract_bit_expr_FU_132_i0_fu_run_benchmark_38252_48215),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_76));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_48218 (.out1(out_ui_extract_bit_expr_FU_133_i0_fu_run_benchmark_38252_48218),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48221 (.out1(out_ui_extract_bit_expr_FU_134_i0_fu_run_benchmark_38252_48221),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48224 (.out1(out_ui_extract_bit_expr_FU_135_i0_fu_run_benchmark_38252_48224),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48227 (.out1(out_ui_extract_bit_expr_FU_136_i0_fu_run_benchmark_38252_48227),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_79));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_48230 (.out1(out_ui_extract_bit_expr_FU_137_i0_fu_run_benchmark_38252_48230),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_72));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48233 (.out1(out_ui_extract_bit_expr_FU_138_i0_fu_run_benchmark_38252_48233),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48236 (.out1(out_ui_extract_bit_expr_FU_139_i0_fu_run_benchmark_38252_48236),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48239 (.out1(out_ui_extract_bit_expr_FU_140_i0_fu_run_benchmark_38252_48239),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_81));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48242 (.out1(out_ui_extract_bit_expr_FU_141_i0_fu_run_benchmark_38252_48242),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48245 (.out1(out_ui_extract_bit_expr_FU_142_i0_fu_run_benchmark_38252_48245),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48248 (.out1(out_ui_extract_bit_expr_FU_143_i0_fu_run_benchmark_38252_48248),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_51));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48251 (.out1(out_ui_extract_bit_expr_FU_144_i0_fu_run_benchmark_38252_48251),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_84));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48254 (.out1(out_ui_extract_bit_expr_FU_145_i0_fu_run_benchmark_38252_48254),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_49));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48257 (.out1(out_ui_extract_bit_expr_FU_146_i0_fu_run_benchmark_38252_48257),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48260 (.out1(out_ui_extract_bit_expr_FU_147_i0_fu_run_benchmark_38252_48260),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_54));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48263 (.out1(out_ui_extract_bit_expr_FU_148_i0_fu_run_benchmark_38252_48263),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48266 (.out1(out_ui_extract_bit_expr_FU_149_i0_fu_run_benchmark_38252_48266),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_73));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48269 (.out1(out_ui_extract_bit_expr_FU_150_i0_fu_run_benchmark_38252_48269),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_46));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48272 (.out1(out_ui_extract_bit_expr_FU_151_i0_fu_run_benchmark_38252_48272),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48275 (.out1(out_ui_extract_bit_expr_FU_152_i0_fu_run_benchmark_38252_48275),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_87));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48278 (.out1(out_ui_extract_bit_expr_FU_153_i0_fu_run_benchmark_38252_48278),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_91));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48281 (.out1(out_ui_extract_bit_expr_FU_154_i0_fu_run_benchmark_38252_48281),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_48));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48284 (.out1(out_ui_extract_bit_expr_FU_155_i0_fu_run_benchmark_38252_48284),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48287 (.out1(out_ui_extract_bit_expr_FU_156_i0_fu_run_benchmark_38252_48287),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_90));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48317 (.out1(out_lut_expr_FU_166_i0_fu_run_benchmark_38252_48317),
    .in1(out_const_23),
    .in2(out_lut_expr_FU_157_i0_fu_run_benchmark_38252_49876),
    .in3(out_lut_expr_FU_158_i0_fu_run_benchmark_38252_49879),
    .in4(out_lut_expr_FU_165_i0_fu_run_benchmark_38252_49900),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(5),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48320 (.out1(out_ui_lshift_expr_FU_64_0_64_412_i0_fu_run_benchmark_38252_48320),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i1_fu_run_benchmark_38252_48191),
    .in2(out_const_4));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48323 (.out1(out_UIdata_converter_FU_167_i0_fu_run_benchmark_38252_48323),
    .in1(out_lut_expr_FU_166_i0_fu_run_benchmark_38252_48317));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_run_benchmark_38252_48326 (.out1(out_lshift_expr_FU_32_0_32_334_i2_fu_run_benchmark_38252_48326),
    .in1(out_UIdata_converter_FU_167_i0_fu_run_benchmark_38252_48323),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu_run_benchmark_38252_48329 (.out1(out_rshift_expr_FU_32_0_32_339_i2_fu_run_benchmark_38252_48329),
    .in1(out_lshift_expr_FU_32_0_32_334_i2_fu_run_benchmark_38252_48326),
    .in2(out_const_16));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(55),
    .BITSIZE_out1(55)) fu_run_benchmark_38252_48332 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i2_fu_run_benchmark_38252_48332),
    .in1(out_lut_expr_FU_166_i0_fu_run_benchmark_38252_48317),
    .in2(out_ui_lshift_expr_FU_64_0_64_412_i0_fu_run_benchmark_38252_48320),
    .in3(out_ui_cond_expr_FU_64_64_64_64_389_i1_fu_run_benchmark_38252_48191));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48335 (.out1(out_ui_extract_bit_expr_FU_168_i0_fu_run_benchmark_38252_48335),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_93));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48338 (.out1(out_ui_extract_bit_expr_FU_169_i0_fu_run_benchmark_38252_48338),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_74));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48341 (.out1(out_ui_extract_bit_expr_FU_170_i0_fu_run_benchmark_38252_48341),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_67));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48344 (.out1(out_ui_extract_bit_expr_FU_171_i0_fu_run_benchmark_38252_48344),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48347 (.out1(out_ui_extract_bit_expr_FU_172_i0_fu_run_benchmark_38252_48347),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48350 (.out1(out_ui_extract_bit_expr_FU_173_i0_fu_run_benchmark_38252_48350),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_51));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48353 (.out1(out_ui_extract_bit_expr_FU_174_i0_fu_run_benchmark_38252_48353),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_84));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48356 (.out1(out_ui_extract_bit_expr_FU_175_i0_fu_run_benchmark_38252_48356),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_97));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48359 (.out1(out_ui_extract_bit_expr_FU_176_i0_fu_run_benchmark_38252_48359),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_82));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48362 (.out1(out_ui_extract_bit_expr_FU_177_i0_fu_run_benchmark_38252_48362),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_68));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48365 (.out1(out_ui_extract_bit_expr_FU_178_i0_fu_run_benchmark_38252_48365),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_49));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48368 (.out1(out_ui_extract_bit_expr_FU_179_i0_fu_run_benchmark_38252_48368),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48371 (.out1(out_ui_extract_bit_expr_FU_180_i0_fu_run_benchmark_38252_48371),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_54));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48374 (.out1(out_ui_extract_bit_expr_FU_181_i0_fu_run_benchmark_38252_48374),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48377 (.out1(out_ui_extract_bit_expr_FU_182_i0_fu_run_benchmark_38252_48377),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_101));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48380 (.out1(out_ui_extract_bit_expr_FU_183_i0_fu_run_benchmark_38252_48380),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_92));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48383 (.out1(out_ui_extract_bit_expr_FU_184_i0_fu_run_benchmark_38252_48383),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48386 (.out1(out_ui_extract_bit_expr_FU_185_i0_fu_run_benchmark_38252_48386),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_73));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48389 (.out1(out_ui_extract_bit_expr_FU_186_i0_fu_run_benchmark_38252_48389),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_46));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48392 (.out1(out_ui_extract_bit_expr_FU_187_i0_fu_run_benchmark_38252_48392),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48395 (.out1(out_ui_extract_bit_expr_FU_188_i0_fu_run_benchmark_38252_48395),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_87));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48398 (.out1(out_ui_extract_bit_expr_FU_189_i0_fu_run_benchmark_38252_48398),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_104));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48401 (.out1(out_ui_extract_bit_expr_FU_190_i0_fu_run_benchmark_38252_48401),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_100));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48404 (.out1(out_ui_extract_bit_expr_FU_191_i0_fu_run_benchmark_38252_48404),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48407 (.out1(out_ui_extract_bit_expr_FU_192_i0_fu_run_benchmark_38252_48407),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_91));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48410 (.out1(out_ui_extract_bit_expr_FU_193_i0_fu_run_benchmark_38252_48410),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_48));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48413 (.out1(out_ui_extract_bit_expr_FU_194_i0_fu_run_benchmark_38252_48413),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48416 (.out1(out_ui_extract_bit_expr_FU_195_i0_fu_run_benchmark_38252_48416),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_90));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48446 (.out1(out_lut_expr_FU_205_i0_fu_run_benchmark_38252_48446),
    .in1(out_const_36),
    .in2(out_lut_expr_FU_166_i0_fu_run_benchmark_38252_48317),
    .in3(out_lut_expr_FU_197_i0_fu_run_benchmark_38252_49909),
    .in4(out_lut_expr_FU_198_i0_fu_run_benchmark_38252_49912),
    .in5(out_lut_expr_FU_199_i0_fu_run_benchmark_38252_49915),
    .in6(out_lut_expr_FU_201_i0_fu_run_benchmark_38252_49921),
    .in7(out_lut_expr_FU_204_i0_fu_run_benchmark_38252_49930),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(4),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48449 (.out1(out_ui_lshift_expr_FU_64_0_64_413_i0_fu_run_benchmark_38252_48449),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i2_fu_run_benchmark_38252_48332),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48452 (.out1(out_UUdata_converter_FU_206_i0_fu_run_benchmark_38252_48452),
    .in1(out_lut_expr_FU_205_i0_fu_run_benchmark_38252_48446));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu_run_benchmark_38252_48455 (.out1(out_ui_lshift_expr_FU_8_0_8_425_i0_fu_run_benchmark_38252_48455),
    .in1(out_UUdata_converter_FU_206_i0_fu_run_benchmark_38252_48452),
    .in2(out_const_20));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(55),
    .BITSIZE_out1(55)) fu_run_benchmark_38252_48458 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i3_fu_run_benchmark_38252_48458),
    .in1(out_reg_79_reg_79),
    .in2(out_reg_80_reg_80),
    .in3(out_reg_78_reg_78));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48470 (.out1(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in1(out_const_19),
    .in2(out_lut_expr_FU_239_i0_fu_run_benchmark_38252_49947),
    .in3(out_lut_expr_FU_244_i0_fu_run_benchmark_38252_49962),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48473 (.out1(out_ui_lshift_expr_FU_64_0_64_414_i0_fu_run_benchmark_38252_48473),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i3_fu_run_benchmark_38252_48458),
    .in2(out_const_2));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48476 (.out1(out_ui_cond_expr_FU_8_8_8_8_390_i0_fu_run_benchmark_38252_48476),
    .in1(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in2(out_const_72),
    .in3(out_const_19));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48479 (.out1(out_UUdata_converter_FU_246_i0_fu_run_benchmark_38252_48479),
    .in1(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu_run_benchmark_38252_48482 (.out1(out_ui_lshift_expr_FU_8_0_8_426_i0_fu_run_benchmark_38252_48482),
    .in1(out_UUdata_converter_FU_246_i0_fu_run_benchmark_38252_48479),
    .in2(out_const_19));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(55),
    .BITSIZE_out1(55)) fu_run_benchmark_38252_48485 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i4_fu_run_benchmark_38252_48485),
    .in1(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in2(out_ui_lshift_expr_FU_64_0_64_414_i0_fu_run_benchmark_38252_48473),
    .in3(out_ui_cond_expr_FU_64_64_64_64_389_i3_fu_run_benchmark_38252_48458));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48488 (.out1(out_ui_extract_bit_expr_FU_247_i0_fu_run_benchmark_38252_48488),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_78));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48491 (.out1(out_ui_extract_bit_expr_FU_248_i0_fu_run_benchmark_38252_48491),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48494 (.out1(out_ui_extract_bit_expr_FU_249_i0_fu_run_benchmark_38252_48494),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_53));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48497 (.out1(out_ui_extract_bit_expr_FU_250_i0_fu_run_benchmark_38252_48497),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48500 (.out1(out_ui_extract_bit_expr_FU_251_i0_fu_run_benchmark_38252_48500),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_32));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48503 (.out1(out_ui_extract_bit_expr_FU_252_i0_fu_run_benchmark_38252_48503),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48506 (.out1(out_ui_extract_bit_expr_FU_253_i0_fu_run_benchmark_38252_48506),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_76));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48509 (.out1(out_ui_extract_bit_expr_FU_254_i0_fu_run_benchmark_38252_48509),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_97));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48512 (.out1(out_ui_extract_bit_expr_FU_255_i0_fu_run_benchmark_38252_48512),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_82));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48515 (.out1(out_ui_extract_bit_expr_FU_256_i0_fu_run_benchmark_38252_48515),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_68));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48518 (.out1(out_ui_extract_bit_expr_FU_257_i0_fu_run_benchmark_38252_48518),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_49));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48521 (.out1(out_ui_extract_bit_expr_FU_258_i0_fu_run_benchmark_38252_48521),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48524 (.out1(out_ui_extract_bit_expr_FU_259_i0_fu_run_benchmark_38252_48524),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_54));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48527 (.out1(out_ui_extract_bit_expr_FU_260_i0_fu_run_benchmark_38252_48527),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48530 (.out1(out_ui_extract_bit_expr_FU_261_i0_fu_run_benchmark_38252_48530),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_86));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48533 (.out1(out_ui_extract_bit_expr_FU_262_i0_fu_run_benchmark_38252_48533),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48536 (.out1(out_ui_extract_bit_expr_FU_263_i0_fu_run_benchmark_38252_48536),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_48539 (.out1(out_ui_extract_bit_expr_FU_264_i0_fu_run_benchmark_38252_48539),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_72));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48542 (.out1(out_ui_extract_bit_expr_FU_265_i0_fu_run_benchmark_38252_48542),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48545 (.out1(out_ui_extract_bit_expr_FU_266_i0_fu_run_benchmark_38252_48545),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48548 (.out1(out_ui_extract_bit_expr_FU_267_i0_fu_run_benchmark_38252_48548),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_81));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48551 (.out1(out_ui_extract_bit_expr_FU_268_i0_fu_run_benchmark_38252_48551),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_104));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_48554 (.out1(out_ui_extract_bit_expr_FU_269_i0_fu_run_benchmark_38252_48554),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_100));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48557 (.out1(out_ui_extract_bit_expr_FU_270_i0_fu_run_benchmark_38252_48557),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_48560 (.out1(out_ui_extract_bit_expr_FU_271_i0_fu_run_benchmark_38252_48560),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_91));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48563 (.out1(out_ui_extract_bit_expr_FU_272_i0_fu_run_benchmark_38252_48563),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_48));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_48566 (.out1(out_ui_extract_bit_expr_FU_273_i0_fu_run_benchmark_38252_48566),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48569 (.out1(out_ui_extract_bit_expr_FU_274_i0_fu_run_benchmark_38252_48569),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_90));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48602 (.out1(out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602),
    .in1(out_const_88),
    .in2(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in3(out_lut_expr_FU_279_i0_fu_run_benchmark_38252_49979),
    .in4(out_lut_expr_FU_284_i0_fu_run_benchmark_38252_49994),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48605 (.out1(out_ui_lshift_expr_FU_64_0_64_415_i0_fu_run_benchmark_38252_48605),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i4_fu_run_benchmark_38252_48485),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48608 (.out1(out_IUdata_converter_FU_286_i0_fu_run_benchmark_38252_48608),
    .in1(out_rshift_expr_FU_32_0_32_339_i2_fu_run_benchmark_38252_48329));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_run_benchmark_38252_48611 (.out1(out_ui_lshift_expr_FU_8_0_8_427_i0_fu_run_benchmark_38252_48611),
    .in1(out_IUdata_converter_FU_286_i0_fu_run_benchmark_38252_48608),
    .in2(out_const_11));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_run_benchmark_38252_48614 (.out1(out_ui_bit_ior_expr_FU_0_8_8_379_i0_fu_run_benchmark_38252_48614),
    .in1(out_ui_lshift_expr_FU_8_0_8_425_i0_fu_run_benchmark_38252_48455),
    .in2(out_ui_lshift_expr_FU_8_0_8_427_i0_fu_run_benchmark_38252_48611));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48617 (.out1(out_IUdata_converter_FU_287_i0_fu_run_benchmark_38252_48617),
    .in1(out_rshift_expr_FU_32_0_32_339_i1_fu_run_benchmark_38252_48188));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu_run_benchmark_38252_48620 (.out1(out_ui_lshift_expr_FU_8_0_8_428_i0_fu_run_benchmark_38252_48620),
    .in1(out_IUdata_converter_FU_287_i0_fu_run_benchmark_38252_48617),
    .in2(out_const_3));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48623 (.out1(out_IUdata_converter_FU_288_i0_fu_run_benchmark_38252_48623),
    .in1(out_rshift_expr_FU_32_0_32_339_i0_fu_run_benchmark_38252_48164));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu_run_benchmark_38252_48626 (.out1(out_ui_lshift_expr_FU_8_0_8_429_i0_fu_run_benchmark_38252_48626),
    .in1(out_IUdata_converter_FU_288_i0_fu_run_benchmark_38252_48623),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_48629 (.out1(out_ui_bit_ior_expr_FU_0_8_8_380_i0_fu_run_benchmark_38252_48629),
    .in1(out_ui_lshift_expr_FU_8_0_8_428_i0_fu_run_benchmark_38252_48620),
    .in2(out_ui_lshift_expr_FU_8_0_8_429_i0_fu_run_benchmark_38252_48626));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_48632 (.out1(out_ui_bit_ior_expr_FU_0_8_8_381_i0_fu_run_benchmark_38252_48632),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_380_i0_fu_run_benchmark_38252_48629),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_379_i0_fu_run_benchmark_38252_48614));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48635 (.out1(out_ui_cond_expr_FU_8_8_8_8_390_i1_fu_run_benchmark_38252_48635),
    .in1(out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602),
    .in2(out_ui_cond_expr_FU_8_8_8_8_390_i0_fu_run_benchmark_38252_48476),
    .in3(out_ui_lshift_expr_FU_8_0_8_426_i0_fu_run_benchmark_38252_48482));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_48638 (.out1(out_ui_rshift_expr_FU_64_0_64_451_i2_fu_run_benchmark_38252_48638),
    .in1(out_ui_lshift_expr_FU_64_0_64_415_i0_fu_run_benchmark_38252_48605),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_48641 (.out1(out_ui_rshift_expr_FU_64_0_64_451_i3_fu_run_benchmark_38252_48641),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i4_fu_run_benchmark_38252_48485),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_run_benchmark_38252_48644 (.out1(out_ui_rshift_expr_FU_64_0_64_454_i0_fu_run_benchmark_38252_48644),
    .in1(out_ui_rshift_expr_FU_64_0_64_451_i2_fu_run_benchmark_38252_48638),
    .in2(out_const_19));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_run_benchmark_38252_48647 (.out1(out_ui_rshift_expr_FU_64_0_64_454_i1_fu_run_benchmark_38252_48647),
    .in1(out_ui_rshift_expr_FU_64_0_64_451_i3_fu_run_benchmark_38252_48641),
    .in2(out_const_19));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_48650 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i5_fu_run_benchmark_38252_48650),
    .in1(out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602),
    .in2(out_ui_rshift_expr_FU_64_0_64_454_i0_fu_run_benchmark_38252_48644),
    .in3(out_ui_rshift_expr_FU_64_0_64_454_i1_fu_run_benchmark_38252_48647));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu_run_benchmark_38252_48653 (.out1(out_ui_lshift_expr_FU_64_0_64_416_i0_fu_run_benchmark_38252_48653),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i5_fu_run_benchmark_38252_48650),
    .in2(out_const_19));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_48656 (.out1(out_ui_lshift_expr_FU_64_0_64_408_i1_fu_run_benchmark_38252_48656),
    .in1(out_ui_lshift_expr_FU_64_0_64_416_i0_fu_run_benchmark_38252_48653),
    .in2(out_const_20));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(2),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_48659 (.out1(out_ui_bit_ior_expr_FU_0_8_8_382_i0_fu_run_benchmark_38252_48659),
    .in1(out_reg_81_reg_81),
    .in2(out_ui_cond_expr_FU_8_8_8_8_390_i1_fu_run_benchmark_38252_48635));
  ui_lt_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48664 (.out1(out_ui_lt_expr_FU_16_16_16_431_i0_fu_run_benchmark_38252_48664),
    .in1(out_reg_59_reg_59),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_382_i0_fu_run_benchmark_38252_48659));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48673 (.out1(out_lut_expr_FU_291_i0_fu_run_benchmark_38252_48673),
    .in1(out_const_61),
    .in2(out_ui_lt_expr_FU_16_16_16_431_i0_fu_run_benchmark_38252_48664),
    .in3(out_lut_expr_FU_239_i0_fu_run_benchmark_38252_49947),
    .in4(out_lut_expr_FU_244_i0_fu_run_benchmark_38252_49962),
    .in5(out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602),
    .in6(out_lut_expr_FU_290_i0_fu_run_benchmark_38252_49999),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_in3(6),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48676 (.out1(out_ui_ternary_pm_expr_FU_16_0_16_16_466_i0_fu_run_benchmark_38252_48676),
    .in1(out_reg_73_reg_73),
    .in2(out_const_19),
    .in3(out_ASSIGN_UNSIGNED_FU_289_i0_fu_run_benchmark_38252_49819));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48679 (.out1(out_ui_bit_and_expr_FU_16_0_16_344_i1_fu_run_benchmark_38252_48679),
    .in1(out_ui_ternary_pm_expr_FU_16_0_16_16_466_i0_fu_run_benchmark_38252_48676),
    .in2(out_const_111));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu_run_benchmark_38252_48682 (.out1(out_ui_lshift_expr_FU_64_0_64_406_i2_fu_run_benchmark_38252_48682),
    .in1(out_ui_bit_and_expr_FU_16_0_16_344_i1_fu_run_benchmark_38252_48679),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(6),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_run_benchmark_38252_48685 (.out1(out_ui_rshift_expr_FU_64_0_64_455_i0_fu_run_benchmark_38252_48685),
    .in1(out_ui_lshift_expr_FU_64_0_64_406_i2_fu_run_benchmark_38252_48682),
    .in2(out_const_84));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48688 (.out1(out_ui_cond_expr_FU_16_16_16_16_388_i0_fu_run_benchmark_38252_48688),
    .in1(out_lut_expr_FU_291_i0_fu_run_benchmark_38252_48673),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_64_0_64_455_i0_fu_run_benchmark_38252_48685));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu_run_benchmark_38252_48691 (.out1(out_ui_lshift_expr_FU_64_0_64_417_i0_fu_run_benchmark_38252_48691),
    .in1(out_ui_cond_expr_FU_16_16_16_16_388_i0_fu_run_benchmark_38252_48688),
    .in2(out_const_84));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_run_benchmark_38252_48694 (.out1(out_ui_rshift_expr_FU_64_0_64_456_i0_fu_run_benchmark_38252_48694),
    .in1(out_ui_lshift_expr_FU_64_0_64_408_i1_fu_run_benchmark_38252_48656),
    .in2(out_const_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_48697 (.out1(out_ui_bit_and_expr_FU_64_0_64_353_i1_fu_run_benchmark_38252_48697),
    .in1(out_ui_rshift_expr_FU_64_0_64_456_i0_fu_run_benchmark_38252_48694),
    .in2(out_const_121));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu_run_benchmark_38252_48700 (.out1(out_ui_bit_ior_expr_FU_0_64_64_372_i0_fu_run_benchmark_38252_48700),
    .in1(out_ui_bit_and_expr_FU_64_0_64_353_i1_fu_run_benchmark_38252_48697),
    .in2(out_ui_lshift_expr_FU_64_0_64_417_i0_fu_run_benchmark_38252_48691));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48703 (.out1(out_ui_extract_bit_expr_FU_292_i0_fu_run_benchmark_38252_48703),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48706 (.out1(out_ui_extract_bit_expr_FU_293_i0_fu_run_benchmark_38252_48706),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48709 (.out1(out_ui_extract_bit_expr_FU_294_i0_fu_run_benchmark_38252_48709),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_48712 (.out1(out_ui_extract_bit_expr_FU_295_i0_fu_run_benchmark_38252_48712),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48715 (.out1(out_ui_extract_bit_expr_FU_296_i0_fu_run_benchmark_38252_48715),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_48718 (.out1(out_ui_extract_bit_expr_FU_297_i0_fu_run_benchmark_38252_48718),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_72));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48721 (.out1(out_ui_extract_bit_expr_FU_298_i0_fu_run_benchmark_38252_48721),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48724 (.out1(out_ui_extract_bit_expr_FU_299_i0_fu_run_benchmark_38252_48724),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_48727 (.out1(out_ui_extract_bit_expr_FU_300_i0_fu_run_benchmark_38252_48727),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_48730 (.out1(out_ui_extract_bit_expr_FU_301_i0_fu_run_benchmark_38252_48730),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_20));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48775 (.out1(out_lut_expr_FU_312_i0_fu_run_benchmark_38252_48775),
    .in1(out_const_89),
    .in2(out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602),
    .in3(out_lut_expr_FU_303_i0_fu_run_benchmark_38252_50008),
    .in4(out_lut_expr_FU_305_i0_fu_run_benchmark_38252_50015),
    .in5(out_lut_expr_FU_306_i0_fu_run_benchmark_38252_50018),
    .in6(out_lut_expr_FU_307_i0_fu_run_benchmark_38252_50021),
    .in7(out_lut_expr_FU_311_i0_fu_run_benchmark_38252_50035),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48778 (.out1(out_UUdata_converter_FU_313_i0_fu_run_benchmark_38252_48778),
    .in1(out_lut_expr_FU_312_i0_fu_run_benchmark_38252_48775));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu_run_benchmark_38252_48781 (.out1(out_ui_plus_expr_FU_64_64_64_442_i2_fu_run_benchmark_38252_48781),
    .in1(out_UUdata_converter_FU_313_i0_fu_run_benchmark_38252_48778),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_372_i0_fu_run_benchmark_38252_48700));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_run_benchmark_38252_48784 (.out1(out_ui_rshift_expr_FU_64_0_64_449_i2_fu_run_benchmark_38252_48784),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i2_fu_run_benchmark_38252_48781),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48787 (.out1(out_ui_bit_and_expr_FU_16_0_16_344_i2_fu_run_benchmark_38252_48787),
    .in1(out_ui_rshift_expr_FU_64_0_64_449_i2_fu_run_benchmark_38252_48784),
    .in2(out_const_111));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_48790 (.out1(out_ui_bit_and_expr_FU_64_0_64_353_i2_fu_run_benchmark_38252_48790),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i2_fu_run_benchmark_38252_48781),
    .in2(out_const_121));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48793 (.out1(out_ui_extract_bit_expr_FU_314_i0_fu_run_benchmark_38252_48793),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48796 (.out1(out_ui_extract_bit_expr_FU_315_i0_fu_run_benchmark_38252_48796),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48799 (.out1(out_ui_extract_bit_expr_FU_316_i0_fu_run_benchmark_38252_48799),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i3_fu_run_benchmark_38252_47898),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48802 (.out1(out_ui_extract_bit_expr_FU_317_i0_fu_run_benchmark_38252_48802),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i2_fu_run_benchmark_38252_47895),
    .in2(out_const_105));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48805 (.out1(out_ui_cond_expr_FU_16_16_16_16_388_i1_fu_run_benchmark_38252_48805),
    .in1(out_reg_67_reg_67),
    .in2(out_const_111),
    .in3(out_ui_bit_and_expr_FU_16_0_16_344_i2_fu_run_benchmark_38252_48787));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu_run_benchmark_38252_48808 (.out1(out_ui_lshift_expr_FU_64_0_64_406_i3_fu_run_benchmark_38252_48808),
    .in1(out_ui_cond_expr_FU_16_16_16_16_388_i1_fu_run_benchmark_38252_48805),
    .in2(out_const_14));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48811 (.out1(out_ui_extract_bit_expr_FU_318_i0_fu_run_benchmark_38252_48811),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_90));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48817 (.out1(out_lut_expr_FU_320_i0_fu_run_benchmark_38252_48817),
    .in1(out_const_35),
    .in2(out_reg_61_reg_61),
    .in3(out_reg_60_reg_60),
    .in4(out_reg_92_reg_92),
    .in5(out_reg_66_reg_66),
    .in6(out_lut_expr_FU_319_i0_fu_run_benchmark_38252_50041),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_48820 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i6_fu_run_benchmark_38252_48820),
    .in1(out_lut_expr_FU_320_i0_fu_run_benchmark_38252_48817),
    .in2(out_ui_bit_and_expr_FU_64_0_64_353_i2_fu_run_benchmark_38252_48790),
    .in3(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48823 (.out1(out_ui_extract_bit_expr_FU_321_i0_fu_run_benchmark_38252_48823),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i1_fu_run_benchmark_38252_47889),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48826 (.out1(out_ui_extract_bit_expr_FU_322_i0_fu_run_benchmark_38252_48826),
    .in1(out_ui_bit_and_expr_FU_64_64_64_359_i0_fu_run_benchmark_38252_47883),
    .in2(out_const_105));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48832 (.out1(out_lut_expr_FU_324_i0_fu_run_benchmark_38252_48832),
    .in1(out_const_113),
    .in2(out_reg_68_reg_68),
    .in3(out_reg_69_reg_69),
    .in4(out_reg_70_reg_70),
    .in5(out_reg_71_reg_71),
    .in6(out_lut_expr_FU_319_i0_fu_run_benchmark_38252_50041),
    .in7(out_reg_74_reg_74),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48835 (.out1(out_UUdata_converter_FU_325_i0_fu_run_benchmark_38252_48835),
    .in1(out_lut_expr_FU_324_i0_fu_run_benchmark_38252_48832));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_48838 (.out1(out_ui_lshift_expr_FU_64_0_64_418_i0_fu_run_benchmark_38252_48838),
    .in1(out_UUdata_converter_FU_325_i0_fu_run_benchmark_38252_48835),
    .in2(out_const_105));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48844 (.out1(out_lut_expr_FU_327_i0_fu_run_benchmark_38252_48844),
    .in1(out_const_116),
    .in2(out_ui_eq_expr_FU_0_16_16_391_i1_fu_run_benchmark_38252_47966),
    .in3(out_ui_eq_expr_FU_0_16_16_391_i0_fu_run_benchmark_38252_47963),
    .in4(out_ui_ne_expr_FU_64_0_64_436_i1_fu_run_benchmark_38252_47960),
    .in5(out_ui_ne_expr_FU_64_0_64_436_i0_fu_run_benchmark_38252_47957),
    .in6(out_lut_expr_FU_326_i0_fu_run_benchmark_38252_50049),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48847 (.out1(out_UUdata_converter_FU_328_i0_fu_run_benchmark_38252_48847),
    .in1(out_lut_expr_FU_327_i0_fu_run_benchmark_38252_48844));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_run_benchmark_38252_48850 (.out1(out_ui_lshift_expr_FU_64_0_64_419_i0_fu_run_benchmark_38252_48850),
    .in1(out_UUdata_converter_FU_328_i0_fu_run_benchmark_38252_48847),
    .in2(out_const_13));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_48853 (.out1(out_ui_bit_ior_expr_FU_64_64_64_384_i2_fu_run_benchmark_38252_48853),
    .in1(out_reg_72_reg_72),
    .in2(out_ui_cond_expr_FU_64_64_64_64_389_i6_fu_run_benchmark_38252_48820));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_48856 (.out1(out_ui_bit_ior_expr_FU_0_64_64_373_i0_fu_run_benchmark_38252_48856),
    .in1(out_ui_lshift_expr_FU_64_0_64_418_i0_fu_run_benchmark_38252_48838),
    .in2(out_ui_bit_ior_expr_FU_64_64_64_384_i2_fu_run_benchmark_38252_48853));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_48859 (.out1(out_ui_bit_ior_expr_FU_0_64_64_374_i0_fu_run_benchmark_38252_48859),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_373_i0_fu_run_benchmark_38252_48856),
    .in2(out_ui_lshift_expr_FU_64_0_64_406_i3_fu_run_benchmark_38252_48808));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_48868 (.out1(out_ui_bit_and_expr_FU_0_64_64_343_i1_fu_run_benchmark_38252_48868),
    .in1(out_const_121),
    .in2(out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_run_benchmark_38252_48873 (.out1(out_ui_rshift_expr_FU_64_0_64_449_i3_fu_run_benchmark_38252_48873),
    .in1(out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48876 (.out1(out_ui_bit_and_expr_FU_16_0_16_346_i0_fu_run_benchmark_38252_48876),
    .in1(out_ui_rshift_expr_FU_64_0_64_449_i3_fu_run_benchmark_38252_48873),
    .in2(out_const_111));
  UUconvert_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48879 (.out1(out_UUconvert_expr_FU_26_i0_fu_run_benchmark_38252_48879),
    .in1(out_ui_bit_and_expr_FU_16_0_16_346_i0_fu_run_benchmark_38252_48876));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_48884 (.out1(out_ui_bit_and_expr_FU_0_64_64_343_i2_fu_run_benchmark_38252_48884),
    .in1(out_const_121),
    .in2(out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_run_benchmark_38252_48889 (.out1(out_ui_rshift_expr_FU_64_0_64_449_i4_fu_run_benchmark_38252_48889),
    .in1(out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48892 (.out1(out_ui_bit_and_expr_FU_16_0_16_346_i1_fu_run_benchmark_38252_48892),
    .in1(out_ui_rshift_expr_FU_64_0_64_449_i4_fu_run_benchmark_38252_48889),
    .in2(out_const_111));
  UUconvert_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48895 (.out1(out_UUconvert_expr_FU_28_i0_fu_run_benchmark_38252_48895),
    .in1(out_ui_bit_and_expr_FU_16_0_16_346_i1_fu_run_benchmark_38252_48892));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48900 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu_run_benchmark_38252_48900),
    .in1(out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0),
    .in2(out_const_105));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_48903 (.out1(out_ui_extract_bit_expr_FU_31_i0_fu_run_benchmark_38252_48903),
    .in1(out_BMEMORY_CTRLN_332_i0_BMEMORY_CTRLN_332_i0),
    .in2(out_const_105));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48906 (.out1(out_lut_expr_FU_32_i0_fu_run_benchmark_38252_48906),
    .in1(out_const_73),
    .in2(out_reg_13_reg_13),
    .in3(out_ui_extract_bit_expr_FU_31_i0_fu_run_benchmark_38252_48903),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48909 (.out1(out_UUdata_converter_FU_33_i0_fu_run_benchmark_38252_48909),
    .in1(out_lut_expr_FU_32_i0_fu_run_benchmark_38252_48906));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_48912 (.out1(out_ui_lshift_expr_FU_64_0_64_420_i0_fu_run_benchmark_38252_48912),
    .in1(out_UUdata_converter_FU_33_i0_fu_run_benchmark_38252_48909),
    .in2(out_const_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48915 (.out1(out_ui_bit_and_expr_FU_16_0_16_347_i0_fu_run_benchmark_38252_48915),
    .in1(out_ui_bit_and_expr_FU_16_0_16_346_i0_fu_run_benchmark_38252_48876),
    .in2(out_const_119));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48918 (.out1(out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918),
    .in1(out_ui_bit_and_expr_FU_16_0_16_347_i0_fu_run_benchmark_38252_48915),
    .in2(out_const_111));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48921 (.out1(out_ui_eq_expr_FU_16_0_16_396_i0_fu_run_benchmark_38252_48921),
    .in1(out_UUconvert_expr_FU_26_i0_fu_run_benchmark_38252_48879),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48924 (.out1(out_ui_eq_expr_FU_64_0_64_398_i0_fu_run_benchmark_38252_48924),
    .in1(out_ui_bit_and_expr_FU_0_64_64_343_i1_fu_run_benchmark_38252_48868),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48927 (.out1(out_ui_ne_expr_FU_64_0_64_436_i2_fu_run_benchmark_38252_48927),
    .in1(out_ui_bit_and_expr_FU_0_64_64_343_i1_fu_run_benchmark_38252_48868),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48930 (.out1(out_ui_ne_expr_FU_64_0_64_436_i3_fu_run_benchmark_38252_48930),
    .in1(out_ui_bit_and_expr_FU_0_64_64_343_i1_fu_run_benchmark_38252_48868),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_48933 (.out1(out_ui_bit_and_expr_FU_16_0_16_347_i1_fu_run_benchmark_38252_48933),
    .in1(out_ui_bit_and_expr_FU_16_0_16_346_i1_fu_run_benchmark_38252_48892),
    .in2(out_const_119));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48936 (.out1(out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936),
    .in1(out_ui_bit_and_expr_FU_16_0_16_347_i1_fu_run_benchmark_38252_48933),
    .in2(out_const_111));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48939 (.out1(out_ui_eq_expr_FU_16_0_16_396_i1_fu_run_benchmark_38252_48939),
    .in1(out_UUconvert_expr_FU_28_i0_fu_run_benchmark_38252_48895),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48942 (.out1(out_ui_eq_expr_FU_64_0_64_398_i1_fu_run_benchmark_38252_48942),
    .in1(out_ui_bit_and_expr_FU_0_64_64_343_i2_fu_run_benchmark_38252_48884),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48945 (.out1(out_ui_ne_expr_FU_64_0_64_436_i4_fu_run_benchmark_38252_48945),
    .in1(out_ui_bit_and_expr_FU_0_64_64_343_i2_fu_run_benchmark_38252_48884),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48948 (.out1(out_ui_ne_expr_FU_64_0_64_436_i5_fu_run_benchmark_38252_48948),
    .in1(out_ui_bit_and_expr_FU_0_64_64_343_i2_fu_run_benchmark_38252_48884),
    .in2(out_const_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_48951 (.out1(out_ui_bit_ior_expr_FU_0_64_64_375_i0_fu_run_benchmark_38252_48951),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_0_64_64_343_i1_fu_run_benchmark_38252_48868));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_48954 (.out1(out_ui_bit_ior_expr_FU_0_64_64_375_i1_fu_run_benchmark_38252_48954),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_0_64_64_343_i2_fu_run_benchmark_38252_48884));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu_run_benchmark_38252_48957 (.out1(out_ui_rshift_expr_FU_64_0_64_457_i0_fu_run_benchmark_38252_48957),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_375_i0_fu_run_benchmark_38252_48951),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_48962 (.out1(out_ui_bit_and_expr_FU_32_0_32_351_i0_fu_run_benchmark_38252_48962),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_375_i0_fu_run_benchmark_38252_48951),
    .in2(out_const_119));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu_run_benchmark_38252_48967 (.out1(out_ui_rshift_expr_FU_64_0_64_457_i1_fu_run_benchmark_38252_48967),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_375_i1_fu_run_benchmark_38252_48954),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_48972 (.out1(out_ui_bit_and_expr_FU_32_0_32_351_i1_fu_run_benchmark_38252_48972),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_375_i1_fu_run_benchmark_38252_48954),
    .in2(out_const_119));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_48977 (.out1(out_ui_bit_ior_expr_FU_64_0_64_383_i0_fu_run_benchmark_38252_48977),
    .in1(out_ui_lshift_expr_FU_64_0_64_420_i0_fu_run_benchmark_38252_48912),
    .in2(out_const_112));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48980 (.out1(out_lut_expr_FU_38_i0_fu_run_benchmark_38252_48980),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918),
    .in3(out_ui_eq_expr_FU_64_0_64_398_i0_fu_run_benchmark_38252_48924),
    .in4(out_ui_ne_expr_FU_64_0_64_436_i3_fu_run_benchmark_38252_48930),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48983 (.out1(out_lut_expr_FU_39_i0_fu_run_benchmark_38252_48983),
    .in1(out_const_22),
    .in2(out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918),
    .in3(out_ui_eq_expr_FU_64_0_64_398_i0_fu_run_benchmark_38252_48924),
    .in4(out_ui_ne_expr_FU_64_0_64_436_i3_fu_run_benchmark_38252_48930),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48986 (.out1(out_lut_expr_FU_40_i0_fu_run_benchmark_38252_48986),
    .in1(out_const_58),
    .in2(out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918),
    .in3(out_ui_eq_expr_FU_64_0_64_398_i0_fu_run_benchmark_38252_48924),
    .in4(out_ui_ne_expr_FU_64_0_64_436_i3_fu_run_benchmark_38252_48930),
    .in5(out_ui_ne_expr_FU_64_0_64_436_i2_fu_run_benchmark_38252_48927),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48989 (.out1(out_ui_cond_expr_FU_8_8_8_8_390_i2_fu_run_benchmark_38252_48989),
    .in1(out_lut_expr_FU_39_i0_fu_run_benchmark_38252_48983),
    .in2(out_const_0),
    .in3(out_const_72));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48992 (.out1(out_ui_cond_expr_FU_8_8_8_8_390_i3_fu_run_benchmark_38252_48992),
    .in1(out_lut_expr_FU_40_i0_fu_run_benchmark_38252_48986),
    .in2(out_ui_cond_expr_FU_8_8_8_8_390_i2_fu_run_benchmark_38252_48989),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_48995 (.out1(out_ui_cond_expr_FU_8_8_8_8_390_i4_fu_run_benchmark_38252_48995),
    .in1(out_lut_expr_FU_38_i0_fu_run_benchmark_38252_48980),
    .in2(out_const_72),
    .in3(out_ui_cond_expr_FU_8_8_8_8_390_i3_fu_run_benchmark_38252_48992));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_48998 (.out1(out_lut_expr_FU_41_i0_fu_run_benchmark_38252_48998),
    .in1(out_const_22),
    .in2(out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918),
    .in3(out_ui_eq_expr_FU_64_0_64_398_i0_fu_run_benchmark_38252_48924),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49001 (.out1(out_UUdata_converter_FU_42_i0_fu_run_benchmark_38252_49001),
    .in1(out_lut_expr_FU_41_i0_fu_run_benchmark_38252_48998));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_run_benchmark_38252_49004 (.out1(out_ui_lshift_expr_FU_8_0_8_430_i0_fu_run_benchmark_38252_49004),
    .in1(out_UUdata_converter_FU_42_i0_fu_run_benchmark_38252_49001),
    .in2(out_const_19));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49007 (.out1(out_lut_expr_FU_43_i0_fu_run_benchmark_38252_49007),
    .in1(out_const_19),
    .in2(out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918),
    .in3(out_ui_eq_expr_FU_16_0_16_396_i0_fu_run_benchmark_38252_48921),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49010 (.out1(out_UUdata_converter_FU_44_i0_fu_run_benchmark_38252_49010),
    .in1(out_lut_expr_FU_43_i0_fu_run_benchmark_38252_49007));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49013 (.out1(out_ui_bit_ior_expr_FU_8_8_8_385_i1_fu_run_benchmark_38252_49013),
    .in1(out_ui_cond_expr_FU_8_8_8_8_390_i4_fu_run_benchmark_38252_48995),
    .in2(out_ui_lshift_expr_FU_8_0_8_430_i0_fu_run_benchmark_38252_49004));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49016 (.out1(out_ui_bit_ior_expr_FU_8_8_8_385_i2_fu_run_benchmark_38252_49016),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_385_i1_fu_run_benchmark_38252_49013),
    .in2(out_UUdata_converter_FU_44_i0_fu_run_benchmark_38252_49010));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_run_benchmark_38252_49019 (.out1(out_ui_rshift_expr_FU_8_0_8_462_i0_fu_run_benchmark_38252_49019),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_385_i2_fu_run_benchmark_38252_49016),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49022 (.out1(out_ui_bit_and_expr_FU_1_1_1_349_i0_fu_run_benchmark_38252_49022),
    .in1(out_ui_rshift_expr_FU_8_0_8_462_i0_fu_run_benchmark_38252_49019),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_385_i2_fu_run_benchmark_38252_49016));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_in3(11),
    .BITSIZE_out1(13)) fu_run_benchmark_38252_49025 (.out1(out_ui_ternary_plus_expr_FU_16_0_16_16_464_i0_fu_run_benchmark_38252_49025),
    .in1(out_reg_25_reg_25),
    .in2(out_const_117),
    .in3(out_ASSIGN_UNSIGNED_FU_29_i0_fu_run_benchmark_38252_49807));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49028 (.out1(out_lut_expr_FU_45_i0_fu_run_benchmark_38252_49028),
    .in1(out_const_77),
    .in2(out_ui_eq_expr_FU_64_0_64_398_i1_fu_run_benchmark_38252_48942),
    .in3(out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936),
    .in4(out_ui_ne_expr_FU_64_0_64_436_i5_fu_run_benchmark_38252_48948),
    .in5(out_ui_ne_expr_FU_64_0_64_436_i4_fu_run_benchmark_38252_48945),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49031 (.out1(out_ui_cond_expr_FU_8_8_8_8_390_i5_fu_run_benchmark_38252_49031),
    .in1(out_lut_expr_FU_45_i0_fu_run_benchmark_38252_49028),
    .in2(out_const_72),
    .in3(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49034 (.out1(out_lut_expr_FU_46_i0_fu_run_benchmark_38252_49034),
    .in1(out_const_22),
    .in2(out_ui_eq_expr_FU_64_0_64_398_i1_fu_run_benchmark_38252_48942),
    .in3(out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49037 (.out1(out_UUdata_converter_FU_47_i0_fu_run_benchmark_38252_49037),
    .in1(out_lut_expr_FU_46_i0_fu_run_benchmark_38252_49034));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_run_benchmark_38252_49040 (.out1(out_ui_lshift_expr_FU_8_0_8_430_i1_fu_run_benchmark_38252_49040),
    .in1(out_UUdata_converter_FU_47_i0_fu_run_benchmark_38252_49037),
    .in2(out_const_19));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49043 (.out1(out_lut_expr_FU_48_i0_fu_run_benchmark_38252_49043),
    .in1(out_const_19),
    .in2(out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936),
    .in3(out_ui_eq_expr_FU_16_0_16_396_i1_fu_run_benchmark_38252_48939),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49046 (.out1(out_UUdata_converter_FU_49_i0_fu_run_benchmark_38252_49046),
    .in1(out_lut_expr_FU_48_i0_fu_run_benchmark_38252_49043));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49049 (.out1(out_ui_bit_ior_expr_FU_8_8_8_385_i3_fu_run_benchmark_38252_49049),
    .in1(out_ui_cond_expr_FU_8_8_8_8_390_i5_fu_run_benchmark_38252_49031),
    .in2(out_ui_lshift_expr_FU_8_0_8_430_i1_fu_run_benchmark_38252_49040));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49052 (.out1(out_ui_bit_ior_expr_FU_8_8_8_385_i4_fu_run_benchmark_38252_49052),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_385_i3_fu_run_benchmark_38252_49049),
    .in2(out_UUdata_converter_FU_49_i0_fu_run_benchmark_38252_49046));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_run_benchmark_38252_49055 (.out1(out_ui_rshift_expr_FU_8_0_8_462_i1_fu_run_benchmark_38252_49055),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_385_i4_fu_run_benchmark_38252_49052),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49058 (.out1(out_ui_bit_and_expr_FU_1_1_1_349_i1_fu_run_benchmark_38252_49058),
    .in1(out_ui_rshift_expr_FU_8_0_8_462_i1_fu_run_benchmark_38252_49055),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_385_i4_fu_run_benchmark_38252_49052));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49061 (.out1(out_ui_bit_and_expr_FU_1_1_1_349_i2_fu_run_benchmark_38252_49061),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_385_i4_fu_run_benchmark_38252_49052),
    .in2(out_reg_20_reg_20));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu_run_benchmark_38252_49064 (.out1(out_ui_mult_expr_FU_32_32_32_0_434_i0_fu_run_benchmark_38252_49064),
    .clock(clock),
    .in1(out_reg_30_reg_30),
    .in2(out_reg_19_reg_19));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_49067 (.out1(out_ui_bit_and_expr_FU_32_0_32_351_i2_fu_run_benchmark_38252_49067),
    .in1(out_ui_mult_expr_FU_32_32_32_0_434_i0_fu_run_benchmark_38252_49064),
    .in2(out_const_119));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu_run_benchmark_38252_49070 (.out1(out_ui_rshift_expr_FU_64_0_64_457_i2_fu_run_benchmark_38252_49070),
    .in1(out_ui_mult_expr_FU_32_32_32_0_434_i0_fu_run_benchmark_38252_49064),
    .in2(out_const_6));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(21),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu_run_benchmark_38252_49073 (.out1(out_ui_mult_expr_FU_32_32_32_0_434_i1_fu_run_benchmark_38252_49073),
    .clock(clock),
    .in1(out_reg_40_reg_40),
    .in2(out_reg_18_reg_18));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(53),
    .BITSIZE_out1(54)) fu_run_benchmark_38252_49076 (.out1(out_ui_plus_expr_FU_64_64_64_442_i3_fu_run_benchmark_38252_49076),
    .in1(out_reg_43_reg_43),
    .in2(out_reg_44_reg_44));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_49079 (.out1(out_ui_bit_and_expr_FU_32_0_32_351_i3_fu_run_benchmark_38252_49079),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i3_fu_run_benchmark_38252_49076),
    .in2(out_const_119));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(22),
    .PRECISION(64)) fu_run_benchmark_38252_49082 (.out1(out_ui_rshift_expr_FU_64_0_64_457_i3_fu_run_benchmark_38252_49082),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i3_fu_run_benchmark_38252_49076),
    .in2(out_const_6));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu_run_benchmark_38252_49085 (.out1(out_ui_mult_expr_FU_32_32_32_0_434_i2_fu_run_benchmark_38252_49085),
    .clock(clock),
    .in1(out_reg_29_reg_29),
    .in2(out_reg_27_reg_27));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_49088 (.out1(out_ui_plus_expr_FU_64_64_64_442_i4_fu_run_benchmark_38252_49088),
    .in1(out_ui_bit_and_expr_FU_32_0_32_351_i3_fu_run_benchmark_38252_49079),
    .in2(out_reg_45_reg_45));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu_run_benchmark_38252_49091 (.out1(out_ui_rshift_expr_FU_64_0_64_457_i4_fu_run_benchmark_38252_49091),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i4_fu_run_benchmark_38252_49088),
    .in2(out_const_6));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(42),
    .PIPE_PARAMETER(0)) fu_run_benchmark_38252_49094 (.out1(out_ui_mult_expr_FU_32_32_32_0_434_i3_fu_run_benchmark_38252_49094),
    .clock(clock),
    .in1(out_reg_39_reg_39),
    .in2(out_reg_26_reg_26));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_in2(42),
    .BITSIZE_in3(21),
    .BITSIZE_out1(42)) fu_run_benchmark_38252_49097 (.out1(out_ui_ternary_plus_expr_FU_64_64_64_64_465_i0_fu_run_benchmark_38252_49097),
    .in1(out_reg_48_reg_48),
    .in2(out_reg_46_reg_46),
    .in3(out_reg_49_reg_49));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_49100 (.out1(out_ui_lshift_expr_FU_64_0_64_410_i1_fu_run_benchmark_38252_49100),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i4_fu_run_benchmark_38252_49088),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu_run_benchmark_38252_49103 (.out1(out_ui_rshift_expr_FU_64_0_64_458_i0_fu_run_benchmark_38252_49103),
    .in1(out_ui_lshift_expr_FU_64_0_64_410_i1_fu_run_benchmark_38252_49100),
    .in2(out_const_24));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_49106 (.out1(out_ui_lshift_expr_FU_64_0_64_421_i0_fu_run_benchmark_38252_49106),
    .in1(out_ui_rshift_expr_FU_64_0_64_458_i0_fu_run_benchmark_38252_49103),
    .in2(out_const_24));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_49109 (.out1(out_ui_bit_and_expr_FU_32_0_32_352_i0_fu_run_benchmark_38252_49109),
    .in1(out_ui_bit_and_expr_FU_32_0_32_351_i2_fu_run_benchmark_38252_49067),
    .in2(out_const_119));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_in3(6),
    .BITSIZE_out1(64),
    .OFFSET_PARAMETER(32)) fu_run_benchmark_38252_49112 (.out1(out_ui_bit_ior_concat_expr_FU_369_i0_fu_run_benchmark_38252_49112),
    .in1(out_ui_lshift_expr_FU_64_0_64_421_i0_fu_run_benchmark_38252_49106),
    .in2(out_reg_47_reg_47),
    .in3(out_const_24));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(54),
    .BITSIZE_out1(54)) fu_run_benchmark_38252_49115 (.out1(out_ui_bit_and_expr_FU_64_0_64_356_i0_fu_run_benchmark_38252_49115),
    .in1(out_ui_bit_ior_concat_expr_FU_369_i0_fu_run_benchmark_38252_49112),
    .in2(out_const_123));
  ui_lshift_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(5),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_run_benchmark_38252_49118 (.out1(out_ui_lshift_expr_FU_64_0_64_422_i0_fu_run_benchmark_38252_49118),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_465_i0_fu_run_benchmark_38252_49097),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu_run_benchmark_38252_49121 (.out1(out_ui_rshift_expr_FU_64_0_64_459_i0_fu_run_benchmark_38252_49121),
    .in1(out_ui_bit_ior_concat_expr_FU_369_i0_fu_run_benchmark_38252_49112),
    .in2(out_const_15));
  ui_bit_and_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu_run_benchmark_38252_49124 (.out1(out_ui_bit_and_expr_FU_16_0_16_348_i0_fu_run_benchmark_38252_49124),
    .in1(out_ui_rshift_expr_FU_64_0_64_459_i0_fu_run_benchmark_38252_49121),
    .in2(out_const_109));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_49127 (.out1(out_ui_bit_ior_expr_FU_0_64_64_376_i0_fu_run_benchmark_38252_49127),
    .in1(out_reg_50_reg_50),
    .in2(out_ui_lshift_expr_FU_64_0_64_422_i0_fu_run_benchmark_38252_49118));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_49130 (.out1(out_ui_bit_and_expr_FU_64_0_64_353_i3_fu_run_benchmark_38252_49130),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_376_i0_fu_run_benchmark_38252_49127),
    .in2(out_const_121));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49133 (.out1(out_ui_extract_bit_expr_FU_50_i0_fu_run_benchmark_38252_49133),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_465_i0_fu_run_benchmark_38252_49097),
    .in2(out_const_53));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49136 (.out1(out_UUdata_converter_FU_51_i0_fu_run_benchmark_38252_49136),
    .in1(out_ui_extract_bit_expr_FU_50_i0_fu_run_benchmark_38252_49133));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49139 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu_run_benchmark_38252_49139),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_465_i0_fu_run_benchmark_38252_49097),
    .in2(out_const_53));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49142 (.out1(out_UUdata_converter_FU_53_i0_fu_run_benchmark_38252_49142),
    .in1(out_UUdata_converter_FU_51_i0_fu_run_benchmark_38252_49136));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_out1(13)) fu_run_benchmark_38252_49145 (.out1(out_ui_plus_expr_FU_16_16_16_439_i0_fu_run_benchmark_38252_49145),
    .in1(out_UUdata_converter_FU_53_i0_fu_run_benchmark_38252_49142),
    .in2(out_reg_31_reg_31));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_run_benchmark_38252_49148 (.out1(out_ui_lshift_expr_FU_64_0_64_415_i1_fu_run_benchmark_38252_49148),
    .in1(out_ui_bit_and_expr_FU_64_0_64_356_i0_fu_run_benchmark_38252_49115),
    .in2(out_const_1));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49151 (.out1(out_lut_expr_FU_54_i0_fu_run_benchmark_38252_49151),
    .in1(out_const_19),
    .in2(out_ui_extract_bit_expr_FU_52_i0_fu_run_benchmark_38252_49139),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49154 (.out1(out_UIdata_converter_FU_55_i0_fu_run_benchmark_38252_49154),
    .in1(out_lut_expr_FU_54_i0_fu_run_benchmark_38252_49151));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu_run_benchmark_38252_49157 (.out1(out_ui_lshift_expr_FU_64_64_64_424_i0_fu_run_benchmark_38252_49157),
    .in1(out_reg_51_reg_51),
    .in2(out_UIdata_converter_FU_55_i0_fu_run_benchmark_38252_49154));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(54),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_49160 (.out1(out_ui_bit_and_expr_FU_64_0_64_356_i1_fu_run_benchmark_38252_49160),
    .in1(out_ui_lshift_expr_FU_64_64_64_424_i0_fu_run_benchmark_38252_49157),
    .in2(out_const_123));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu_run_benchmark_38252_49163 (.out1(out_ui_rshift_expr_FU_64_0_64_449_i5_fu_run_benchmark_38252_49163),
    .in1(out_ui_bit_and_expr_FU_64_0_64_356_i0_fu_run_benchmark_38252_49115),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49166 (.out1(out_ui_bit_and_expr_FU_8_0_8_365_i0_fu_run_benchmark_38252_49166),
    .in1(out_ui_rshift_expr_FU_64_0_64_449_i5_fu_run_benchmark_38252_49163),
    .in2(out_const_72));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_run_benchmark_38252_49169 (.out1(out_UIconvert_expr_FU_56_i0_fu_run_benchmark_38252_49169),
    .in1(out_UUdata_converter_FU_51_i0_fu_run_benchmark_38252_49136));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu_run_benchmark_38252_49172 (.out1(out_ui_rshift_expr_FU_8_8_8_463_i0_fu_run_benchmark_38252_49172),
    .in1(out_reg_52_reg_52),
    .in2(out_UIconvert_expr_FU_56_i0_fu_run_benchmark_38252_49169));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(51),
    .PRECISION(64)) fu_run_benchmark_38252_49175 (.out1(out_ui_lshift_expr_FU_64_64_64_424_i1_fu_run_benchmark_38252_49175),
    .in1(out_ui_bit_and_expr_FU_64_0_64_353_i3_fu_run_benchmark_38252_49130),
    .in2(out_UIdata_converter_FU_55_i0_fu_run_benchmark_38252_49154));
  ui_lshift_expr_FU #(.BITSIZE_in1(51),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_run_benchmark_38252_49178 (.out1(out_ui_lshift_expr_FU_64_0_64_415_i2_fu_run_benchmark_38252_49178),
    .in1(out_ui_lshift_expr_FU_64_64_64_424_i1_fu_run_benchmark_38252_49175),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_49181 (.out1(out_ui_bit_ior_expr_FU_64_64_64_384_i3_fu_run_benchmark_38252_49181),
    .in1(out_ui_lshift_expr_FU_64_0_64_415_i2_fu_run_benchmark_38252_49178),
    .in2(out_ui_rshift_expr_FU_8_8_8_463_i0_fu_run_benchmark_38252_49172));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_run_benchmark_38252_49184 (.out1(out_ui_bit_and_expr_FU_64_0_64_353_i4_fu_run_benchmark_38252_49184),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_384_i3_fu_run_benchmark_38252_49181),
    .in2(out_const_121));
  UUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(12)) fu_run_benchmark_38252_49187 (.out1(out_UUdata_converter_FU_57_i0_fu_run_benchmark_38252_49187),
    .in1(out_ui_plus_expr_FU_16_16_16_439_i0_fu_run_benchmark_38252_49145));
  ui_lshift_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_49190 (.out1(out_ui_lshift_expr_FU_64_0_64_406_i4_fu_run_benchmark_38252_49190),
    .in1(out_UUdata_converter_FU_57_i0_fu_run_benchmark_38252_49187),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_49193 (.out1(out_ui_bit_ior_expr_FU_0_64_64_377_i0_fu_run_benchmark_38252_49193),
    .in1(out_ui_bit_and_expr_FU_64_0_64_353_i4_fu_run_benchmark_38252_49184),
    .in2(out_ui_lshift_expr_FU_64_0_64_406_i4_fu_run_benchmark_38252_49190));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_49196 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu_run_benchmark_38252_49196),
    .in1(out_ui_plus_expr_FU_16_16_16_439_i0_fu_run_benchmark_38252_49145),
    .in2(out_const_74));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu_run_benchmark_38252_49199 (.out1(out_ui_bit_and_expr_FU_64_0_64_357_i0_fu_run_benchmark_38252_49199),
    .in1(out_ui_bit_and_expr_FU_64_0_64_356_i1_fu_run_benchmark_38252_49160),
    .in2(out_const_122));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49202 (.out1(out_ui_ne_expr_FU_64_0_64_438_i0_fu_run_benchmark_38252_49202),
    .in1(out_ui_bit_and_expr_FU_64_0_64_357_i0_fu_run_benchmark_38252_49199),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49205 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu_run_benchmark_38252_49205),
    .in1(out_ui_lshift_expr_FU_64_64_64_424_i0_fu_run_benchmark_38252_49157),
    .in2(out_const_85));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49208 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu_run_benchmark_38252_49208),
    .in1(out_ui_rshift_expr_FU_8_8_8_463_i0_fu_run_benchmark_38252_49172),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49211 (.out1(out_lut_expr_FU_61_i0_fu_run_benchmark_38252_49211),
    .in1(out_const_56),
    .in2(out_ui_extract_bit_expr_FU_59_i0_fu_run_benchmark_38252_49205),
    .in3(out_ui_ne_expr_FU_64_0_64_438_i0_fu_run_benchmark_38252_49202),
    .in4(out_ui_extract_bit_expr_FU_60_i0_fu_run_benchmark_38252_49208),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49214 (.out1(out_UUdata_converter_FU_62_i0_fu_run_benchmark_38252_49214),
    .in1(out_lut_expr_FU_61_i0_fu_run_benchmark_38252_49211));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_49217 (.out1(out_ui_plus_expr_FU_64_64_64_442_i5_fu_run_benchmark_38252_49217),
    .in1(out_reg_54_reg_54),
    .in2(out_reg_53_reg_53));
  ui_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49220 (.out1(out_ui_eq_expr_FU_64_0_64_399_i0_fu_run_benchmark_38252_49220),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_377_i0_fu_run_benchmark_38252_49193),
    .in2(out_const_127));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_run_benchmark_38252_49223 (.out1(out_ui_rshift_expr_FU_64_0_64_449_i6_fu_run_benchmark_38252_49223),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i5_fu_run_benchmark_38252_49217),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_49226 (.out1(out_ui_bit_and_expr_FU_16_0_16_346_i2_fu_run_benchmark_38252_49226),
    .in1(out_ui_rshift_expr_FU_64_0_64_449_i6_fu_run_benchmark_38252_49223),
    .in2(out_const_111));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49229 (.out1(out_ui_eq_expr_FU_16_0_16_395_i2_fu_run_benchmark_38252_49229),
    .in1(out_ui_bit_and_expr_FU_16_0_16_346_i2_fu_run_benchmark_38252_49226),
    .in2(out_const_111));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49232 (.out1(out_ui_extract_bit_expr_FU_63_i0_fu_run_benchmark_38252_49232),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i5_fu_run_benchmark_38252_49217),
    .in2(out_const_105));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu_run_benchmark_38252_49235 (.out1(out_ui_bit_and_expr_FU_64_0_64_358_i0_fu_run_benchmark_38252_49235),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i5_fu_run_benchmark_38252_49217),
    .in2(out_const_126));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_49238 (.out1(out_ui_bit_ior_expr_FU_0_64_64_378_i0_fu_run_benchmark_38252_49238),
    .in1(out_ui_bit_and_expr_FU_64_0_64_358_i0_fu_run_benchmark_38252_49235),
    .in2(out_reg_28_reg_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49250 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu_run_benchmark_38252_49250),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i2_fu_run_benchmark_38252_49061),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49253 (.out1(out_ui_extract_bit_expr_FU_65_i0_fu_run_benchmark_38252_49253),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i0_fu_run_benchmark_38252_49022),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49256 (.out1(out_ui_extract_bit_expr_FU_66_i0_fu_run_benchmark_38252_49256),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i1_fu_run_benchmark_38252_49058),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49280 (.out1(out_lut_expr_FU_74_i0_fu_run_benchmark_38252_49280),
    .in1(out_const_106),
    .in2(out_reg_32_reg_32),
    .in3(out_reg_21_reg_21),
    .in4(out_reg_33_reg_33),
    .in5(out_reg_41_reg_41),
    .in6(out_lut_expr_FU_69_i0_fu_run_benchmark_38252_49840),
    .in7(out_reg_42_reg_42),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49283 (.out1(out_ui_extract_bit_expr_FU_75_i0_fu_run_benchmark_38252_49283),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i2_fu_run_benchmark_38252_49061),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49286 (.out1(out_ui_extract_bit_expr_FU_76_i0_fu_run_benchmark_38252_49286),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i0_fu_run_benchmark_38252_49022),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49289 (.out1(out_ui_extract_bit_expr_FU_77_i0_fu_run_benchmark_38252_49289),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i1_fu_run_benchmark_38252_49058),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49292 (.out1(out_lut_expr_FU_78_i0_fu_run_benchmark_38252_49292),
    .in1(out_const_107),
    .in2(out_reg_34_reg_34),
    .in3(out_reg_22_reg_22),
    .in4(out_reg_35_reg_35),
    .in5(out_reg_41_reg_41),
    .in6(out_lut_expr_FU_69_i0_fu_run_benchmark_38252_49840),
    .in7(out_reg_42_reg_42),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_49295 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i7_fu_run_benchmark_38252_49295),
    .in1(out_lut_expr_FU_74_i0_fu_run_benchmark_38252_49280),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_378_i0_fu_run_benchmark_38252_49238),
    .in3(out_reg_28_reg_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49298 (.out1(out_ui_extract_bit_expr_FU_79_i0_fu_run_benchmark_38252_49298),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i2_fu_run_benchmark_38252_49061),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49301 (.out1(out_ui_extract_bit_expr_FU_80_i0_fu_run_benchmark_38252_49301),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i0_fu_run_benchmark_38252_49022),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49304 (.out1(out_ui_extract_bit_expr_FU_81_i0_fu_run_benchmark_38252_49304),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i1_fu_run_benchmark_38252_49058),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(41),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49310 (.out1(out_lut_expr_FU_83_i0_fu_run_benchmark_38252_49310),
    .in1(out_const_30),
    .in2(out_reg_36_reg_36),
    .in3(out_reg_23_reg_23),
    .in4(out_reg_37_reg_37),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_lut_expr_FU_82_i0_fu_run_benchmark_38252_49863),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_49313 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i8_fu_run_benchmark_38252_49313),
    .in1(out_lut_expr_FU_78_i0_fu_run_benchmark_38252_49292),
    .in2(out_ui_cond_expr_FU_64_64_64_64_389_i7_fu_run_benchmark_38252_49295),
    .in3(out_reg_28_reg_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49316 (.out1(out_ui_extract_bit_expr_FU_84_i0_fu_run_benchmark_38252_49316),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i2_fu_run_benchmark_38252_49061),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49319 (.out1(out_ui_extract_bit_expr_FU_85_i0_fu_run_benchmark_38252_49319),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i0_fu_run_benchmark_38252_49022),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_run_benchmark_38252_49322 (.out1(out_ui_extract_bit_expr_FU_86_i0_fu_run_benchmark_38252_49322),
    .in1(out_ui_bit_and_expr_FU_1_1_1_349_i1_fu_run_benchmark_38252_49058),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49328 (.out1(out_lut_expr_FU_87_i0_fu_run_benchmark_38252_49328),
    .in1(out_const_108),
    .in2(out_ui_extract_bit_expr_FU_84_i0_fu_run_benchmark_38252_49316),
    .in3(out_reg_24_reg_24),
    .in4(out_ui_extract_bit_expr_FU_86_i0_fu_run_benchmark_38252_49322),
    .in5(out_lut_expr_FU_67_i0_fu_run_benchmark_38252_49834),
    .in6(out_lut_expr_FU_73_i0_fu_run_benchmark_38252_49856),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu_run_benchmark_38252_49331 (.out1(out_ui_rshift_expr_FU_64_0_64_460_i0_fu_run_benchmark_38252_49331),
    .in1(out_ui_bit_ior_expr_FU_64_0_64_383_i0_fu_run_benchmark_38252_48977),
    .in2(out_const_81));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu_run_benchmark_38252_49334 (.out1(out_ui_cond_expr_FU_16_16_16_16_388_i2_fu_run_benchmark_38252_49334),
    .in1(out_lut_expr_FU_87_i0_fu_run_benchmark_38252_49328),
    .in2(out_const_114),
    .in3(out_ui_rshift_expr_FU_64_0_64_460_i0_fu_run_benchmark_38252_49331));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_run_benchmark_38252_49337 (.out1(out_ui_lshift_expr_FU_64_0_64_423_i0_fu_run_benchmark_38252_49337),
    .in1(out_ui_cond_expr_FU_16_16_16_16_388_i2_fu_run_benchmark_38252_49334),
    .in2(out_const_81));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_run_benchmark_38252_49340 (.out1(out_ui_cond_expr_FU_64_64_64_64_389_i9_fu_run_benchmark_38252_49340),
    .in1(out_lut_expr_FU_83_i0_fu_run_benchmark_38252_49310),
    .in2(out_ui_cond_expr_FU_64_64_64_64_389_i8_fu_run_benchmark_38252_49313),
    .in3(out_reg_38_reg_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49550 (.out1(out_ui_extract_bit_expr_FU_220_i0_fu_run_benchmark_38252_49550),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_87));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49594 (.out1(out_ui_extract_bit_expr_FU_234_i0_fu_run_benchmark_38252_49594),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_90));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49620 (.out1(out_ui_extract_bit_expr_FU_213_i0_fu_run_benchmark_38252_49620),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_79));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49635 (.out1(out_ui_extract_bit_expr_FU_216_i0_fu_run_benchmark_38252_49635),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49643 (.out1(out_ui_extract_bit_expr_FU_218_i0_fu_run_benchmark_38252_49643),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_46));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49647 (.out1(out_ui_extract_bit_expr_FU_219_i0_fu_run_benchmark_38252_49647),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49673 (.out1(out_ui_extract_bit_expr_FU_227_i0_fu_run_benchmark_38252_49673),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_81));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49688 (.out1(out_ui_extract_bit_expr_FU_230_i0_fu_run_benchmark_38252_49688),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49696 (.out1(out_ui_extract_bit_expr_FU_232_i0_fu_run_benchmark_38252_49696),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_48));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49700 (.out1(out_ui_extract_bit_expr_FU_233_i0_fu_run_benchmark_38252_49700),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49715 (.out1(out_ui_extract_bit_expr_FU_209_i0_fu_run_benchmark_38252_49715),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49723 (.out1(out_ui_extract_bit_expr_FU_211_i0_fu_run_benchmark_38252_49723),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49727 (.out1(out_ui_extract_bit_expr_FU_212_i0_fu_run_benchmark_38252_49727),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49731 (.out1(out_ui_extract_bit_expr_FU_214_i0_fu_run_benchmark_38252_49731),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_101));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_49735 (.out1(out_ui_extract_bit_expr_FU_215_i0_fu_run_benchmark_38252_49735),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_92));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_49739 (.out1(out_ui_extract_bit_expr_FU_217_i0_fu_run_benchmark_38252_49739),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_73));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49754 (.out1(out_ui_extract_bit_expr_FU_223_i0_fu_run_benchmark_38252_49754),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu_run_benchmark_38252_49762 (.out1(out_ui_extract_bit_expr_FU_225_i0_fu_run_benchmark_38252_49762),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49766 (.out1(out_ui_extract_bit_expr_FU_226_i0_fu_run_benchmark_38252_49766),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49770 (.out1(out_ui_extract_bit_expr_FU_228_i0_fu_run_benchmark_38252_49770),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_104));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_49774 (.out1(out_ui_extract_bit_expr_FU_229_i0_fu_run_benchmark_38252_49774),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_100));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu_run_benchmark_38252_49778 (.out1(out_ui_extract_bit_expr_FU_231_i0_fu_run_benchmark_38252_49778),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_91));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49782 (.out1(out_ui_extract_bit_expr_FU_207_i0_fu_run_benchmark_38252_49782),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_49786 (.out1(out_ui_extract_bit_expr_FU_208_i0_fu_run_benchmark_38252_49786),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_49790 (.out1(out_ui_extract_bit_expr_FU_210_i0_fu_run_benchmark_38252_49790),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu_run_benchmark_38252_49794 (.out1(out_ui_extract_bit_expr_FU_221_i0_fu_run_benchmark_38252_49794),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_86));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu_run_benchmark_38252_49798 (.out1(out_ui_extract_bit_expr_FU_222_i0_fu_run_benchmark_38252_49798),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu_run_benchmark_38252_49802 (.out1(out_ui_extract_bit_expr_FU_224_i0_fu_run_benchmark_38252_49802),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i1_fu_run_benchmark_38252_48119),
    .in2(out_const_72));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_49805 (.out1(out_ASSIGN_UNSIGNED_FU_27_i0_fu_run_benchmark_38252_49805),
    .in1(out_UUconvert_expr_FU_26_i0_fu_run_benchmark_38252_48879));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_49807 (.out1(out_ASSIGN_UNSIGNED_FU_29_i0_fu_run_benchmark_38252_49807),
    .in1(out_UUconvert_expr_FU_28_i0_fu_run_benchmark_38252_48895));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_49809 (.out1(out_ASSIGN_UNSIGNED_FU_34_i0_fu_run_benchmark_38252_49809),
    .in1(out_ui_rshift_expr_FU_64_0_64_457_i0_fu_run_benchmark_38252_48957));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_49811 (.out1(out_ASSIGN_UNSIGNED_FU_35_i0_fu_run_benchmark_38252_49811),
    .in1(out_ui_bit_and_expr_FU_32_0_32_351_i0_fu_run_benchmark_38252_48962));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu_run_benchmark_38252_49813 (.out1(out_ASSIGN_UNSIGNED_FU_36_i0_fu_run_benchmark_38252_49813),
    .in1(out_ui_rshift_expr_FU_64_0_64_457_i1_fu_run_benchmark_38252_48967));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_run_benchmark_38252_49815 (.out1(out_ASSIGN_UNSIGNED_FU_37_i0_fu_run_benchmark_38252_49815),
    .in1(out_ui_bit_and_expr_FU_32_0_32_351_i1_fu_run_benchmark_38252_48972));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_run_benchmark_38252_49817 (.out1(out_ASSIGN_UNSIGNED_FU_90_i0_fu_run_benchmark_38252_49817),
    .in1(out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu_run_benchmark_38252_49819 (.out1(out_ASSIGN_UNSIGNED_FU_289_i0_fu_run_benchmark_38252_49819),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_382_i0_fu_run_benchmark_38252_48659));
  lut_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49834 (.out1(out_lut_expr_FU_67_i0_fu_run_benchmark_38252_49834),
    .in1(out_const_64),
    .in2(out_reg_14_reg_14),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_17_reg_17),
    .in5(out_ui_eq_expr_FU_64_0_64_398_i1_fu_run_benchmark_38252_48942),
    .in6(out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936),
    .in7(out_ui_ne_expr_FU_64_0_64_436_i4_fu_run_benchmark_38252_48945),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49837 (.out1(out_lut_expr_FU_68_i0_fu_run_benchmark_38252_49837),
    .in1(out_const_59),
    .in2(out_ui_extract_bit_expr_FU_59_i0_fu_run_benchmark_38252_49205),
    .in3(out_ui_ne_expr_FU_64_0_64_438_i0_fu_run_benchmark_38252_49202),
    .in4(out_ui_extract_bit_expr_FU_60_i0_fu_run_benchmark_38252_49208),
    .in5(out_ui_extract_bit_expr_FU_58_i0_fu_run_benchmark_38252_49196),
    .in6(out_ui_eq_expr_FU_64_0_64_399_i0_fu_run_benchmark_38252_49220),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49840 (.out1(out_lut_expr_FU_69_i0_fu_run_benchmark_38252_49840),
    .in1(out_const_23),
    .in2(out_ui_extract_bit_expr_FU_63_i0_fu_run_benchmark_38252_49232),
    .in3(out_ui_eq_expr_FU_16_0_16_395_i2_fu_run_benchmark_38252_49229),
    .in4(out_reg_55_reg_55),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49844 (.out1(out_lut_expr_FU_70_i0_fu_run_benchmark_38252_49844),
    .in1(out_const_80),
    .in2(out_ui_eq_expr_FU_64_0_64_398_i1_fu_run_benchmark_38252_48942),
    .in3(out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936),
    .in4(out_ui_ne_expr_FU_64_0_64_436_i4_fu_run_benchmark_38252_48945),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49848 (.out1(out_lut_expr_FU_71_i0_fu_run_benchmark_38252_49848),
    .in1(out_const_98),
    .in2(out_ui_eq_expr_FU_64_0_64_398_i1_fu_run_benchmark_38252_48942),
    .in3(out_ui_eq_expr_FU_16_0_16_395_i1_fu_run_benchmark_38252_48936),
    .in4(out_ui_ne_expr_FU_64_0_64_436_i5_fu_run_benchmark_38252_48948),
    .in5(out_ui_ne_expr_FU_64_0_64_436_i4_fu_run_benchmark_38252_48945),
    .in6(out_ui_eq_expr_FU_16_0_16_396_i1_fu_run_benchmark_38252_48939),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49852 (.out1(out_lut_expr_FU_72_i0_fu_run_benchmark_38252_49852),
    .in1(out_const_63),
    .in2(out_reg_14_reg_14),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_17_reg_17),
    .in5(out_reg_15_reg_15),
    .in6(out_lut_expr_FU_70_i0_fu_run_benchmark_38252_49844),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49856 (.out1(out_lut_expr_FU_73_i0_fu_run_benchmark_38252_49856),
    .in1(out_const_120),
    .in2(out_reg_14_reg_14),
    .in3(out_reg_16_reg_16),
    .in4(out_reg_17_reg_17),
    .in5(out_lut_expr_FU_70_i0_fu_run_benchmark_38252_49844),
    .in6(out_lut_expr_FU_71_i0_fu_run_benchmark_38252_49848),
    .in7(out_lut_expr_FU_72_i0_fu_run_benchmark_38252_49852),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49863 (.out1(out_lut_expr_FU_82_i0_fu_run_benchmark_38252_49863),
    .in1(out_const_94),
    .in2(out_ui_extract_bit_expr_FU_63_i0_fu_run_benchmark_38252_49232),
    .in3(out_ui_eq_expr_FU_16_0_16_395_i2_fu_run_benchmark_38252_49229),
    .in4(out_reg_55_reg_55),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49876 (.out1(out_lut_expr_FU_157_i0_fu_run_benchmark_38252_49876),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_141_i0_fu_run_benchmark_38252_48242),
    .in5(out_ui_extract_bit_expr_FU_142_i0_fu_run_benchmark_38252_48245),
    .in6(out_ui_extract_bit_expr_FU_143_i0_fu_run_benchmark_38252_48248),
    .in7(out_ui_extract_bit_expr_FU_144_i0_fu_run_benchmark_38252_48251),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49879 (.out1(out_lut_expr_FU_158_i0_fu_run_benchmark_38252_49879),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_145_i0_fu_run_benchmark_38252_48254),
    .in5(out_ui_extract_bit_expr_FU_146_i0_fu_run_benchmark_38252_48257),
    .in6(out_ui_extract_bit_expr_FU_147_i0_fu_run_benchmark_38252_48260),
    .in7(out_ui_extract_bit_expr_FU_148_i0_fu_run_benchmark_38252_48263),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49882 (.out1(out_lut_expr_FU_159_i0_fu_run_benchmark_38252_49882),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_149_i0_fu_run_benchmark_38252_48266),
    .in5(out_ui_extract_bit_expr_FU_150_i0_fu_run_benchmark_38252_48269),
    .in6(out_ui_extract_bit_expr_FU_151_i0_fu_run_benchmark_38252_48272),
    .in7(out_ui_extract_bit_expr_FU_152_i0_fu_run_benchmark_38252_48275),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49885 (.out1(out_lut_expr_FU_160_i0_fu_run_benchmark_38252_49885),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_153_i0_fu_run_benchmark_38252_48278),
    .in5(out_ui_extract_bit_expr_FU_154_i0_fu_run_benchmark_38252_48281),
    .in6(out_ui_extract_bit_expr_FU_155_i0_fu_run_benchmark_38252_48284),
    .in7(out_ui_extract_bit_expr_FU_156_i0_fu_run_benchmark_38252_48287),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49888 (.out1(out_lut_expr_FU_161_i0_fu_run_benchmark_38252_49888),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_125_i0_fu_run_benchmark_38252_48194),
    .in5(out_ui_extract_bit_expr_FU_126_i0_fu_run_benchmark_38252_48197),
    .in6(out_ui_extract_bit_expr_FU_127_i0_fu_run_benchmark_38252_48200),
    .in7(out_ui_extract_bit_expr_FU_128_i0_fu_run_benchmark_38252_48203),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49891 (.out1(out_lut_expr_FU_162_i0_fu_run_benchmark_38252_49891),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_129_i0_fu_run_benchmark_38252_48206),
    .in5(out_ui_extract_bit_expr_FU_130_i0_fu_run_benchmark_38252_48209),
    .in6(out_ui_extract_bit_expr_FU_131_i0_fu_run_benchmark_38252_48212),
    .in7(out_ui_extract_bit_expr_FU_132_i0_fu_run_benchmark_38252_48215),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49894 (.out1(out_lut_expr_FU_163_i0_fu_run_benchmark_38252_49894),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_133_i0_fu_run_benchmark_38252_48218),
    .in5(out_ui_extract_bit_expr_FU_134_i0_fu_run_benchmark_38252_48221),
    .in6(out_ui_extract_bit_expr_FU_135_i0_fu_run_benchmark_38252_48224),
    .in7(out_ui_extract_bit_expr_FU_136_i0_fu_run_benchmark_38252_48227),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49897 (.out1(out_lut_expr_FU_164_i0_fu_run_benchmark_38252_49897),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_137_i0_fu_run_benchmark_38252_48230),
    .in5(out_ui_extract_bit_expr_FU_138_i0_fu_run_benchmark_38252_48233),
    .in6(out_ui_extract_bit_expr_FU_139_i0_fu_run_benchmark_38252_48236),
    .in7(out_ui_extract_bit_expr_FU_140_i0_fu_run_benchmark_38252_48239),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49900 (.out1(out_lut_expr_FU_165_i0_fu_run_benchmark_38252_49900),
    .in1(out_const_19),
    .in2(out_lut_expr_FU_159_i0_fu_run_benchmark_38252_49882),
    .in3(out_lut_expr_FU_160_i0_fu_run_benchmark_38252_49885),
    .in4(out_lut_expr_FU_161_i0_fu_run_benchmark_38252_49888),
    .in5(out_lut_expr_FU_162_i0_fu_run_benchmark_38252_49891),
    .in6(out_lut_expr_FU_163_i0_fu_run_benchmark_38252_49894),
    .in7(out_lut_expr_FU_164_i0_fu_run_benchmark_38252_49897),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49905 (.out1(out_lut_expr_FU_196_i0_fu_run_benchmark_38252_49905),
    .in1(out_const_39),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_182_i0_fu_run_benchmark_38252_48377),
    .in5(out_ui_extract_bit_expr_FU_183_i0_fu_run_benchmark_38252_48380),
    .in6(out_ui_extract_bit_expr_FU_184_i0_fu_run_benchmark_38252_48383),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49909 (.out1(out_lut_expr_FU_197_i0_fu_run_benchmark_38252_49909),
    .in1(out_const_40),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_189_i0_fu_run_benchmark_38252_48398),
    .in5(out_ui_extract_bit_expr_FU_190_i0_fu_run_benchmark_38252_48401),
    .in6(out_ui_extract_bit_expr_FU_191_i0_fu_run_benchmark_38252_48404),
    .in7(out_lut_expr_FU_196_i0_fu_run_benchmark_38252_49905),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49912 (.out1(out_lut_expr_FU_198_i0_fu_run_benchmark_38252_49912),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_185_i0_fu_run_benchmark_38252_48386),
    .in5(out_ui_extract_bit_expr_FU_186_i0_fu_run_benchmark_38252_48389),
    .in6(out_ui_extract_bit_expr_FU_187_i0_fu_run_benchmark_38252_48392),
    .in7(out_ui_extract_bit_expr_FU_188_i0_fu_run_benchmark_38252_48395),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49915 (.out1(out_lut_expr_FU_199_i0_fu_run_benchmark_38252_49915),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_192_i0_fu_run_benchmark_38252_48407),
    .in5(out_ui_extract_bit_expr_FU_193_i0_fu_run_benchmark_38252_48410),
    .in6(out_ui_extract_bit_expr_FU_194_i0_fu_run_benchmark_38252_48413),
    .in7(out_ui_extract_bit_expr_FU_195_i0_fu_run_benchmark_38252_48416),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49918 (.out1(out_lut_expr_FU_200_i0_fu_run_benchmark_38252_49918),
    .in1(out_const_39),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_168_i0_fu_run_benchmark_38252_48335),
    .in5(out_ui_extract_bit_expr_FU_169_i0_fu_run_benchmark_38252_48338),
    .in6(out_ui_extract_bit_expr_FU_170_i0_fu_run_benchmark_38252_48341),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49921 (.out1(out_lut_expr_FU_201_i0_fu_run_benchmark_38252_49921),
    .in1(out_const_40),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_175_i0_fu_run_benchmark_38252_48356),
    .in5(out_ui_extract_bit_expr_FU_176_i0_fu_run_benchmark_38252_48359),
    .in6(out_ui_extract_bit_expr_FU_177_i0_fu_run_benchmark_38252_48362),
    .in7(out_lut_expr_FU_200_i0_fu_run_benchmark_38252_49918),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49924 (.out1(out_lut_expr_FU_202_i0_fu_run_benchmark_38252_49924),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_171_i0_fu_run_benchmark_38252_48344),
    .in5(out_ui_extract_bit_expr_FU_172_i0_fu_run_benchmark_38252_48347),
    .in6(out_ui_extract_bit_expr_FU_173_i0_fu_run_benchmark_38252_48350),
    .in7(out_ui_extract_bit_expr_FU_174_i0_fu_run_benchmark_38252_48353),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49927 (.out1(out_lut_expr_FU_203_i0_fu_run_benchmark_38252_49927),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_178_i0_fu_run_benchmark_38252_48365),
    .in5(out_ui_extract_bit_expr_FU_179_i0_fu_run_benchmark_38252_48368),
    .in6(out_ui_extract_bit_expr_FU_180_i0_fu_run_benchmark_38252_48371),
    .in7(out_ui_extract_bit_expr_FU_181_i0_fu_run_benchmark_38252_48374),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49930 (.out1(out_lut_expr_FU_204_i0_fu_run_benchmark_38252_49930),
    .in1(out_const_19),
    .in2(out_lut_expr_FU_202_i0_fu_run_benchmark_38252_49924),
    .in3(out_lut_expr_FU_203_i0_fu_run_benchmark_38252_49927),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49935 (.out1(out_lut_expr_FU_235_i0_fu_run_benchmark_38252_49935),
    .in1(out_const_95),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_207_i0_fu_run_benchmark_38252_49782),
    .in5(out_ui_extract_bit_expr_FU_208_i0_fu_run_benchmark_38252_49786),
    .in6(out_ui_extract_bit_expr_FU_209_i0_fu_run_benchmark_38252_49715),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49938 (.out1(out_lut_expr_FU_236_i0_fu_run_benchmark_38252_49938),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_210_i0_fu_run_benchmark_38252_49790),
    .in5(out_ui_extract_bit_expr_FU_211_i0_fu_run_benchmark_38252_49723),
    .in6(out_ui_extract_bit_expr_FU_212_i0_fu_run_benchmark_38252_49727),
    .in7(out_ui_extract_bit_expr_FU_213_i0_fu_run_benchmark_38252_49620),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49941 (.out1(out_lut_expr_FU_237_i0_fu_run_benchmark_38252_49941),
    .in1(out_const_95),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_214_i0_fu_run_benchmark_38252_49731),
    .in5(out_ui_extract_bit_expr_FU_215_i0_fu_run_benchmark_38252_49735),
    .in6(out_ui_extract_bit_expr_FU_216_i0_fu_run_benchmark_38252_49635),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49944 (.out1(out_lut_expr_FU_238_i0_fu_run_benchmark_38252_49944),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_217_i0_fu_run_benchmark_38252_49739),
    .in5(out_ui_extract_bit_expr_FU_218_i0_fu_run_benchmark_38252_49643),
    .in6(out_ui_extract_bit_expr_FU_219_i0_fu_run_benchmark_38252_49647),
    .in7(out_ui_extract_bit_expr_FU_220_i0_fu_run_benchmark_38252_49550),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49947 (.out1(out_lut_expr_FU_239_i0_fu_run_benchmark_38252_49947),
    .in1(out_const_103),
    .in2(out_reg_77_reg_77),
    .in3(out_reg_79_reg_79),
    .in4(out_reg_93_reg_93),
    .in5(out_reg_94_reg_94),
    .in6(out_reg_95_reg_95),
    .in7(out_reg_96_reg_96),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49950 (.out1(out_lut_expr_FU_240_i0_fu_run_benchmark_38252_49950),
    .in1(out_const_95),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_221_i0_fu_run_benchmark_38252_49794),
    .in5(out_ui_extract_bit_expr_FU_222_i0_fu_run_benchmark_38252_49798),
    .in6(out_ui_extract_bit_expr_FU_223_i0_fu_run_benchmark_38252_49754),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49953 (.out1(out_lut_expr_FU_241_i0_fu_run_benchmark_38252_49953),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_224_i0_fu_run_benchmark_38252_49802),
    .in5(out_ui_extract_bit_expr_FU_225_i0_fu_run_benchmark_38252_49762),
    .in6(out_ui_extract_bit_expr_FU_226_i0_fu_run_benchmark_38252_49766),
    .in7(out_ui_extract_bit_expr_FU_227_i0_fu_run_benchmark_38252_49673),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49956 (.out1(out_lut_expr_FU_242_i0_fu_run_benchmark_38252_49956),
    .in1(out_const_95),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_228_i0_fu_run_benchmark_38252_49770),
    .in5(out_ui_extract_bit_expr_FU_229_i0_fu_run_benchmark_38252_49774),
    .in6(out_ui_extract_bit_expr_FU_230_i0_fu_run_benchmark_38252_49688),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49959 (.out1(out_lut_expr_FU_243_i0_fu_run_benchmark_38252_49959),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_231_i0_fu_run_benchmark_38252_49778),
    .in5(out_ui_extract_bit_expr_FU_232_i0_fu_run_benchmark_38252_49696),
    .in6(out_ui_extract_bit_expr_FU_233_i0_fu_run_benchmark_38252_49700),
    .in7(out_ui_extract_bit_expr_FU_234_i0_fu_run_benchmark_38252_49594),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49962 (.out1(out_lut_expr_FU_244_i0_fu_run_benchmark_38252_49962),
    .in1(out_const_103),
    .in2(out_reg_77_reg_77),
    .in3(out_reg_79_reg_79),
    .in4(out_reg_97_reg_97),
    .in5(out_reg_98_reg_98),
    .in6(out_reg_99_reg_99),
    .in7(out_reg_100_reg_100),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49966 (.out1(out_lut_expr_FU_275_i0_fu_run_benchmark_38252_49966),
    .in1(out_const_39),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_247_i0_fu_run_benchmark_38252_48488),
    .in5(out_ui_extract_bit_expr_FU_248_i0_fu_run_benchmark_38252_48491),
    .in6(out_ui_extract_bit_expr_FU_249_i0_fu_run_benchmark_38252_48494),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49969 (.out1(out_lut_expr_FU_276_i0_fu_run_benchmark_38252_49969),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_250_i0_fu_run_benchmark_38252_48497),
    .in5(out_ui_extract_bit_expr_FU_251_i0_fu_run_benchmark_38252_48500),
    .in6(out_ui_extract_bit_expr_FU_252_i0_fu_run_benchmark_38252_48503),
    .in7(out_ui_extract_bit_expr_FU_253_i0_fu_run_benchmark_38252_48506),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49972 (.out1(out_lut_expr_FU_277_i0_fu_run_benchmark_38252_49972),
    .in1(out_const_39),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_254_i0_fu_run_benchmark_38252_48509),
    .in5(out_ui_extract_bit_expr_FU_255_i0_fu_run_benchmark_38252_48512),
    .in6(out_ui_extract_bit_expr_FU_256_i0_fu_run_benchmark_38252_48515),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49975 (.out1(out_lut_expr_FU_278_i0_fu_run_benchmark_38252_49975),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_257_i0_fu_run_benchmark_38252_48518),
    .in5(out_ui_extract_bit_expr_FU_258_i0_fu_run_benchmark_38252_48521),
    .in6(out_ui_extract_bit_expr_FU_259_i0_fu_run_benchmark_38252_48524),
    .in7(out_ui_extract_bit_expr_FU_260_i0_fu_run_benchmark_38252_48527),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49979 (.out1(out_lut_expr_FU_279_i0_fu_run_benchmark_38252_49979),
    .in1(out_const_52),
    .in2(out_reg_77_reg_77),
    .in3(out_reg_79_reg_79),
    .in4(out_reg_101_reg_101),
    .in5(out_reg_102_reg_102),
    .in6(out_reg_103_reg_103),
    .in7(out_reg_104_reg_104),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49982 (.out1(out_lut_expr_FU_280_i0_fu_run_benchmark_38252_49982),
    .in1(out_const_39),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_261_i0_fu_run_benchmark_38252_48530),
    .in5(out_ui_extract_bit_expr_FU_262_i0_fu_run_benchmark_38252_48533),
    .in6(out_ui_extract_bit_expr_FU_263_i0_fu_run_benchmark_38252_48536),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49985 (.out1(out_lut_expr_FU_281_i0_fu_run_benchmark_38252_49985),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_264_i0_fu_run_benchmark_38252_48539),
    .in5(out_ui_extract_bit_expr_FU_265_i0_fu_run_benchmark_38252_48542),
    .in6(out_ui_extract_bit_expr_FU_266_i0_fu_run_benchmark_38252_48545),
    .in7(out_ui_extract_bit_expr_FU_267_i0_fu_run_benchmark_38252_48548),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49988 (.out1(out_lut_expr_FU_282_i0_fu_run_benchmark_38252_49988),
    .in1(out_const_39),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_268_i0_fu_run_benchmark_38252_48551),
    .in5(out_ui_extract_bit_expr_FU_269_i0_fu_run_benchmark_38252_48554),
    .in6(out_ui_extract_bit_expr_FU_270_i0_fu_run_benchmark_38252_48557),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49991 (.out1(out_lut_expr_FU_283_i0_fu_run_benchmark_38252_49991),
    .in1(out_const_103),
    .in2(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .in3(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .in4(out_ui_extract_bit_expr_FU_271_i0_fu_run_benchmark_38252_48560),
    .in5(out_ui_extract_bit_expr_FU_272_i0_fu_run_benchmark_38252_48563),
    .in6(out_ui_extract_bit_expr_FU_273_i0_fu_run_benchmark_38252_48566),
    .in7(out_ui_extract_bit_expr_FU_274_i0_fu_run_benchmark_38252_48569),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49994 (.out1(out_lut_expr_FU_284_i0_fu_run_benchmark_38252_49994),
    .in1(out_const_52),
    .in2(out_reg_77_reg_77),
    .in3(out_reg_79_reg_79),
    .in4(out_reg_105_reg_105),
    .in5(out_reg_106_reg_106),
    .in6(out_reg_107_reg_107),
    .in7(out_reg_108_reg_108),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_49999 (.out1(out_lut_expr_FU_290_i0_fu_run_benchmark_38252_49999),
    .in1(out_const_27),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_77_reg_77),
    .in5(out_reg_79_reg_79),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50004 (.out1(out_lut_expr_FU_302_i0_fu_run_benchmark_38252_50004),
    .in1(out_const_19),
    .in2(out_reg_77_reg_77),
    .in3(out_reg_79_reg_79),
    .in4(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50008 (.out1(out_lut_expr_FU_303_i0_fu_run_benchmark_38252_50008),
    .in1(out_const_26),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_89_reg_89),
    .in5(out_lut_expr_FU_302_i0_fu_run_benchmark_38252_50004),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50011 (.out1(out_lut_expr_FU_304_i0_fu_run_benchmark_38252_50011),
    .in1(out_const_19),
    .in2(out_reg_77_reg_77),
    .in3(out_reg_79_reg_79),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(61),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50015 (.out1(out_lut_expr_FU_305_i0_fu_run_benchmark_38252_50015),
    .in1(out_const_31),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_90_reg_90),
    .in5(out_reg_91_reg_91),
    .in6(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in7(out_lut_expr_FU_304_i0_fu_run_benchmark_38252_50011),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50018 (.out1(out_lut_expr_FU_306_i0_fu_run_benchmark_38252_50018),
    .in1(out_const_26),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_82_reg_82),
    .in5(out_lut_expr_FU_302_i0_fu_run_benchmark_38252_50004),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50021 (.out1(out_lut_expr_FU_307_i0_fu_run_benchmark_38252_50021),
    .in1(out_const_26),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_83_reg_83),
    .in5(out_lut_expr_FU_302_i0_fu_run_benchmark_38252_50004),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(61),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50024 (.out1(out_lut_expr_FU_308_i0_fu_run_benchmark_38252_50024),
    .in1(out_const_31),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_84_reg_84),
    .in5(out_reg_85_reg_85),
    .in6(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in7(out_lut_expr_FU_304_i0_fu_run_benchmark_38252_50011),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(61),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50027 (.out1(out_lut_expr_FU_309_i0_fu_run_benchmark_38252_50027),
    .in1(out_const_31),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_86_reg_86),
    .in5(out_reg_87_reg_87),
    .in6(out_lut_expr_FU_245_i0_fu_run_benchmark_38252_48470),
    .in7(out_lut_expr_FU_304_i0_fu_run_benchmark_38252_50011),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50031 (.out1(out_lut_expr_FU_310_i0_fu_run_benchmark_38252_50031),
    .in1(out_const_99),
    .in2(out_reg_75_reg_75),
    .in3(out_reg_76_reg_76),
    .in4(out_reg_88_reg_88),
    .in5(out_lut_expr_FU_302_i0_fu_run_benchmark_38252_50004),
    .in6(out_lut_expr_FU_309_i0_fu_run_benchmark_38252_50027),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50035 (.out1(out_lut_expr_FU_311_i0_fu_run_benchmark_38252_50035),
    .in1(out_const_57),
    .in2(out_reg_62_reg_62),
    .in3(out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602),
    .in4(out_lut_expr_FU_308_i0_fu_run_benchmark_38252_50024),
    .in5(out_lut_expr_FU_310_i0_fu_run_benchmark_38252_50031),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50041 (.out1(out_lut_expr_FU_319_i0_fu_run_benchmark_38252_50041),
    .in1(out_const_60),
    .in2(out_ui_lt_expr_FU_16_16_16_431_i0_fu_run_benchmark_38252_48664),
    .in3(out_lut_expr_FU_239_i0_fu_run_benchmark_38252_49947),
    .in4(out_lut_expr_FU_244_i0_fu_run_benchmark_38252_49962),
    .in5(out_lut_expr_FU_285_i0_fu_run_benchmark_38252_48602),
    .in6(out_lut_expr_FU_290_i0_fu_run_benchmark_38252_49999),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50045 (.out1(out_lut_expr_FU_323_i0_fu_run_benchmark_38252_50045),
    .in1(out_const_19),
    .in2(out_ui_extract_bit_expr_FU_314_i0_fu_run_benchmark_38252_48793),
    .in3(out_ui_extract_bit_expr_FU_315_i0_fu_run_benchmark_38252_48796),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu_run_benchmark_38252_50049 (.out1(out_lut_expr_FU_326_i0_fu_run_benchmark_38252_50049),
    .in1(out_const_29),
    .in2(out_ui_eq_expr_FU_0_16_16_391_i1_fu_run_benchmark_38252_47966),
    .in3(out_ui_eq_expr_FU_0_16_16_391_i0_fu_run_benchmark_38252_47963),
    .in4(out_ui_extract_bit_expr_FU_119_i0_fu_run_benchmark_38252_48146),
    .in5(out_ui_extract_bit_expr_FU_120_i0_fu_run_benchmark_38252_48149),
    .in6(out_ui_extract_bit_expr_FU_121_i0_fu_run_benchmark_38252_48152),
    .in7(out_ui_extract_bit_expr_FU_122_i0_fu_run_benchmark_38252_48155),
    .in8(1'b0),
    .in9(1'b0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(23),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(46)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
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
    .in1(out_UUdata_converter_FU_13_i0_fu_run_benchmark_38252_38568),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_600_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_336_i0_fu_run_benchmark_38252_39877),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_100 (.out1(out_reg_100_reg_100),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_243_i0_fu_run_benchmark_38252_49959),
    .wenable(wrenable_reg_100));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_101 (.out1(out_reg_101_reg_101),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_275_i0_fu_run_benchmark_38252_49966),
    .wenable(wrenable_reg_101));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_102 (.out1(out_reg_102_reg_102),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_276_i0_fu_run_benchmark_38252_49969),
    .wenable(wrenable_reg_102));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_103 (.out1(out_reg_103_reg_103),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_277_i0_fu_run_benchmark_38252_49972),
    .wenable(wrenable_reg_103));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_104 (.out1(out_reg_104_reg_104),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_278_i0_fu_run_benchmark_38252_49975),
    .wenable(wrenable_reg_104));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_105 (.out1(out_reg_105_reg_105),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_280_i0_fu_run_benchmark_38252_49982),
    .wenable(wrenable_reg_105));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_106 (.out1(out_reg_106_reg_106),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_281_i0_fu_run_benchmark_38252_49985),
    .wenable(wrenable_reg_106));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_107 (.out1(out_reg_107_reg_107),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_282_i0_fu_run_benchmark_38252_49988),
    .wenable(wrenable_reg_107));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_108 (.out1(out_reg_108_reg_108),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_283_i0_fu_run_benchmark_38252_49991),
    .wenable(wrenable_reg_108));
  register_SE #(.BITSIZE_in1(63),
    .BITSIZE_out1(63)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_342_i1_fu_run_benchmark_38252_47863),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_446_i0_fu_run_benchmark_38252_38684),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu_run_benchmark_38252_48900),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_395_i0_fu_run_benchmark_38252_48918),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_396_i0_fu_run_benchmark_38252_48921),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_64_0_64_398_i0_fu_run_benchmark_38252_48924),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_64_0_64_436_i2_fu_run_benchmark_38252_48927),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_457_i0_fu_run_benchmark_38252_48957),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_351_i0_fu_run_benchmark_38252_48962),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_620_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_385_i2_fu_run_benchmark_38252_49016),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_65_i0_fu_run_benchmark_38252_49253),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_76_i0_fu_run_benchmark_38252_49286),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_80_i0_fu_run_benchmark_38252_49301),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_85_i0_fu_run_benchmark_38252_49319),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_27_i0_fu_run_benchmark_38252_49805),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_34_i0_fu_run_benchmark_38252_49809),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_35_i0_fu_run_benchmark_38252_49811),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_420_i0_fu_run_benchmark_38252_48912),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_457_i1_fu_run_benchmark_38252_48967),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_631_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_351_i1_fu_run_benchmark_38252_48972),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(13),
    .BITSIZE_out1(13)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_16_0_16_16_464_i0_fu_run_benchmark_38252_49025),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_64_i0_fu_run_benchmark_38252_49250),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_66_i0_fu_run_benchmark_38252_49256),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_75_i0_fu_run_benchmark_38252_49283),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_77_i0_fu_run_benchmark_38252_49289),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_79_i0_fu_run_benchmark_38252_49298),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_81_i0_fu_run_benchmark_38252_49304),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_423_i0_fu_run_benchmark_38252_49337),
    .wenable(wrenable_reg_38));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_36_i0_fu_run_benchmark_38252_49813),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_444_i0_fu_run_benchmark_38252_39707),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_37_i0_fu_run_benchmark_38252_49815),
    .wenable(wrenable_reg_40));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_67_i0_fu_run_benchmark_38252_49834),
    .wenable(wrenable_reg_41));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_73_i0_fu_run_benchmark_38252_49856),
    .wenable(wrenable_reg_42));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_457_i2_fu_run_benchmark_38252_49070),
    .wenable(wrenable_reg_43));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_434_i1_fu_run_benchmark_38252_49073),
    .wenable(wrenable_reg_44));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_434_i2_fu_run_benchmark_38252_49085),
    .wenable(wrenable_reg_45));
  register_SE #(.BITSIZE_in1(42),
    .BITSIZE_out1(42)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_434_i3_fu_run_benchmark_38252_49094),
    .wenable(wrenable_reg_46));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_352_i0_fu_run_benchmark_38252_49109),
    .wenable(wrenable_reg_47));
  register_STD #(.BITSIZE_in1(22),
    .BITSIZE_out1(22)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_457_i3_fu_run_benchmark_38252_49082),
    .wenable(wrenable_reg_48));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_457_i4_fu_run_benchmark_38252_49091),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_18_i0_fu_run_benchmark_38252_38631),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_348_i0_fu_run_benchmark_38252_49124),
    .wenable(wrenable_reg_50));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_415_i1_fu_run_benchmark_38252_49148),
    .wenable(wrenable_reg_51));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_365_i0_fu_run_benchmark_38252_49166),
    .wenable(wrenable_reg_52));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_377_i0_fu_run_benchmark_38252_49193),
    .wenable(wrenable_reg_53));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_62_i0_fu_run_benchmark_38252_49214),
    .wenable(wrenable_reg_54));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_68_i0_fu_run_benchmark_38252_49837),
    .wenable(wrenable_reg_55));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_89_i0_fu_run_benchmark_38252_47880),
    .wenable(wrenable_reg_56));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_not_expr_FU_64_64_386_i0_fu_run_benchmark_38252_47886),
    .wenable(wrenable_reg_57));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i9_fu_run_benchmark_38252_49340),
    .wenable(wrenable_reg_58));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_344_i0_fu_run_benchmark_38252_47910),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_19_i0_fu_run_benchmark_38252_38663),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_0_16_16_391_i0_fu_run_benchmark_38252_47963),
    .wenable(wrenable_reg_60));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_0_16_16_391_i1_fu_run_benchmark_38252_47966),
    .wenable(wrenable_reg_61));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_64_0_64_437_i0_fu_run_benchmark_38252_48068),
    .wenable(wrenable_reg_62));
  register_STD #(.BITSIZE_in1(54),
    .BITSIZE_out1(54)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_64_64_64_442_i0_fu_run_benchmark_38252_48089),
    .wenable(wrenable_reg_63));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_364_i0_fu_run_benchmark_38252_48095),
    .wenable(wrenable_reg_64));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_65 (.out1(out_reg_65_reg_65),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_117_i0_fu_run_benchmark_38252_48116),
    .wenable(wrenable_reg_65));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_66 (.out1(out_reg_66_reg_66),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_393_i0_fu_run_benchmark_38252_48140),
    .wenable(wrenable_reg_66));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_67 (.out1(out_reg_67_reg_67),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_118_i0_fu_run_benchmark_38252_48143),
    .wenable(wrenable_reg_67));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_68 (.out1(out_reg_68_reg_68),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_316_i0_fu_run_benchmark_38252_48799),
    .wenable(wrenable_reg_68));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_69 (.out1(out_reg_69_reg_69),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_317_i0_fu_run_benchmark_38252_48802),
    .wenable(wrenable_reg_69));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_20_i0_fu_run_benchmark_38252_38702),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_70 (.out1(out_reg_70_reg_70),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_321_i0_fu_run_benchmark_38252_48823),
    .wenable(wrenable_reg_70));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_71 (.out1(out_reg_71_reg_71),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_322_i0_fu_run_benchmark_38252_48826),
    .wenable(wrenable_reg_71));
  register_SE #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_72 (.out1(out_reg_72_reg_72),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_419_i0_fu_run_benchmark_38252_48850),
    .wenable(wrenable_reg_72));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_73 (.out1(out_reg_73_reg_73),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_90_i0_fu_run_benchmark_38252_49817),
    .wenable(wrenable_reg_73));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_74 (.out1(out_reg_74_reg_74),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_323_i0_fu_run_benchmark_38252_50045),
    .wenable(wrenable_reg_74));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_75 (.out1(out_reg_75_reg_75),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_32_0_32_397_i0_fu_run_benchmark_38252_48131),
    .wenable(wrenable_reg_75));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_76 (.out1(out_reg_76_reg_76),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_394_i0_fu_run_benchmark_38252_48176),
    .wenable(wrenable_reg_76));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_77 (.out1(out_reg_77_reg_77),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_166_i0_fu_run_benchmark_38252_48317),
    .wenable(wrenable_reg_77));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_78 (.out1(out_reg_78_reg_78),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_cond_expr_FU_64_64_64_64_389_i2_fu_run_benchmark_38252_48332),
    .wenable(wrenable_reg_78));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_79 (.out1(out_reg_79_reg_79),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_205_i0_fu_run_benchmark_38252_48446),
    .wenable(wrenable_reg_79));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_686_reg_8_0_0_0),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_80 (.out1(out_reg_80_reg_80),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_413_i0_fu_run_benchmark_38252_48449),
    .wenable(wrenable_reg_80));
  register_STD #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) reg_81 (.out1(out_reg_81_reg_81),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_381_i0_fu_run_benchmark_38252_48632),
    .wenable(wrenable_reg_81));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_82 (.out1(out_reg_82_reg_82),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_292_i0_fu_run_benchmark_38252_48703),
    .wenable(wrenable_reg_82));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_83 (.out1(out_reg_83_reg_83),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_293_i0_fu_run_benchmark_38252_48706),
    .wenable(wrenable_reg_83));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_84 (.out1(out_reg_84_reg_84),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_294_i0_fu_run_benchmark_38252_48709),
    .wenable(wrenable_reg_84));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_85 (.out1(out_reg_85_reg_85),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_295_i0_fu_run_benchmark_38252_48712),
    .wenable(wrenable_reg_85));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_86 (.out1(out_reg_86_reg_86),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_296_i0_fu_run_benchmark_38252_48715),
    .wenable(wrenable_reg_86));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_87 (.out1(out_reg_87_reg_87),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_297_i0_fu_run_benchmark_38252_48718),
    .wenable(wrenable_reg_87));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_88 (.out1(out_reg_88_reg_88),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_298_i0_fu_run_benchmark_38252_48721),
    .wenable(wrenable_reg_88));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_89 (.out1(out_reg_89_reg_89),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_299_i0_fu_run_benchmark_38252_48724),
    .wenable(wrenable_reg_89));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_697_reg_9_0_0_0),
    .wenable(wrenable_reg_9));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_90 (.out1(out_reg_90_reg_90),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_300_i0_fu_run_benchmark_38252_48727),
    .wenable(wrenable_reg_90));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_91 (.out1(out_reg_91_reg_91),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_301_i0_fu_run_benchmark_38252_48730),
    .wenable(wrenable_reg_91));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_92 (.out1(out_reg_92_reg_92),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_318_i0_fu_run_benchmark_38252_48811),
    .wenable(wrenable_reg_92));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_93 (.out1(out_reg_93_reg_93),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_235_i0_fu_run_benchmark_38252_49935),
    .wenable(wrenable_reg_93));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_94 (.out1(out_reg_94_reg_94),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_236_i0_fu_run_benchmark_38252_49938),
    .wenable(wrenable_reg_94));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_95 (.out1(out_reg_95_reg_95),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_237_i0_fu_run_benchmark_38252_49941),
    .wenable(wrenable_reg_95));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_96 (.out1(out_reg_96_reg_96),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_238_i0_fu_run_benchmark_38252_49944),
    .wenable(wrenable_reg_96));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_97 (.out1(out_reg_97_reg_97),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_240_i0_fu_run_benchmark_38252_49950),
    .wenable(wrenable_reg_97));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_98 (.out1(out_reg_98_reg_98),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_241_i0_fu_run_benchmark_38252_49953),
    .wenable(wrenable_reg_98));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_99 (.out1(out_reg_99_reg_99),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_242_i0_fu_run_benchmark_38252_49956),
    .wenable(wrenable_reg_99));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  assign OUT_CONDITION_run_benchmark_38252_38724 = out_read_cond_FU_329_i0_fu_run_benchmark_38252_38724;
  assign OUT_CONDITION_run_benchmark_38252_38727 = out_read_cond_FU_330_i0_fu_run_benchmark_38252_38727;

endmodule

// FSM based controller description for run_benchmark
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_run_benchmark(done_port,
  fuselector_BMEMORY_CTRLN_332_i0_LOAD,
  fuselector_BMEMORY_CTRLN_332_i0_STORE,
  fuselector_BMEMORY_CTRLN_332_i1_LOAD,
  fuselector_BMEMORY_CTRLN_332_i1_STORE,
  selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0,
  selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0,
  selector_MUX_600_reg_1_0_0_0,
  selector_MUX_620_reg_2_0_0_0,
  selector_MUX_631_reg_3_0_0_0,
  selector_MUX_686_reg_8_0_0_0,
  selector_MUX_697_reg_9_0_0_0,
  selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0,
  selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_100,
  wrenable_reg_101,
  wrenable_reg_102,
  wrenable_reg_103,
  wrenable_reg_104,
  wrenable_reg_105,
  wrenable_reg_106,
  wrenable_reg_107,
  wrenable_reg_108,
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
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_78,
  wrenable_reg_79,
  wrenable_reg_8,
  wrenable_reg_80,
  wrenable_reg_81,
  wrenable_reg_82,
  wrenable_reg_83,
  wrenable_reg_84,
  wrenable_reg_85,
  wrenable_reg_86,
  wrenable_reg_87,
  wrenable_reg_88,
  wrenable_reg_89,
  wrenable_reg_9,
  wrenable_reg_90,
  wrenable_reg_91,
  wrenable_reg_92,
  wrenable_reg_93,
  wrenable_reg_94,
  wrenable_reg_95,
  wrenable_reg_96,
  wrenable_reg_97,
  wrenable_reg_98,
  wrenable_reg_99,
  OUT_CONDITION_run_benchmark_38252_38724,
  OUT_CONDITION_run_benchmark_38252_38727,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_run_benchmark_38252_38724;
  input OUT_CONDITION_run_benchmark_38252_38727;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_332_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_332_i0_STORE;
  output fuselector_BMEMORY_CTRLN_332_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_332_i1_STORE;
  output selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0;
  output selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0;
  output selector_MUX_600_reg_1_0_0_0;
  output selector_MUX_620_reg_2_0_0_0;
  output selector_MUX_631_reg_3_0_0_0;
  output selector_MUX_686_reg_8_0_0_0;
  output selector_MUX_697_reg_9_0_0_0;
  output selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0;
  output selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_100;
  output wrenable_reg_101;
  output wrenable_reg_102;
  output wrenable_reg_103;
  output wrenable_reg_104;
  output wrenable_reg_105;
  output wrenable_reg_106;
  output wrenable_reg_107;
  output wrenable_reg_108;
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
  output wrenable_reg_65;
  output wrenable_reg_66;
  output wrenable_reg_67;
  output wrenable_reg_68;
  output wrenable_reg_69;
  output wrenable_reg_7;
  output wrenable_reg_70;
  output wrenable_reg_71;
  output wrenable_reg_72;
  output wrenable_reg_73;
  output wrenable_reg_74;
  output wrenable_reg_75;
  output wrenable_reg_76;
  output wrenable_reg_77;
  output wrenable_reg_78;
  output wrenable_reg_79;
  output wrenable_reg_8;
  output wrenable_reg_80;
  output wrenable_reg_81;
  output wrenable_reg_82;
  output wrenable_reg_83;
  output wrenable_reg_84;
  output wrenable_reg_85;
  output wrenable_reg_86;
  output wrenable_reg_87;
  output wrenable_reg_88;
  output wrenable_reg_89;
  output wrenable_reg_9;
  output wrenable_reg_90;
  output wrenable_reg_91;
  output wrenable_reg_92;
  output wrenable_reg_93;
  output wrenable_reg_94;
  output wrenable_reg_95;
  output wrenable_reg_96;
  output wrenable_reg_97;
  output wrenable_reg_98;
  output wrenable_reg_99;
  parameter [15:0] S_0 = 16'b0000000000000001,
    S_1 = 16'b0000000000000010,
    S_2 = 16'b0000000000000100,
    S_3 = 16'b0000000000001000,
    S_4 = 16'b0000000000010000,
    S_5 = 16'b0000000000100000,
    S_6 = 16'b0000000001000000,
    S_7 = 16'b0000000010000000,
    S_8 = 16'b0000000100000000,
    S_9 = 16'b0000001000000000,
    S_10 = 16'b0000010000000000,
    S_11 = 16'b0000100000000000,
    S_12 = 16'b0001000000000000,
    S_13 = 16'b0010000000000000,
    S_14 = 16'b0100000000000000,
    S_15 = 16'b1000000000000000;
  reg [15:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_332_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_332_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_332_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_332_i1_STORE;
  reg selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0;
  reg selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0;
  reg selector_MUX_600_reg_1_0_0_0;
  reg selector_MUX_620_reg_2_0_0_0;
  reg selector_MUX_631_reg_3_0_0_0;
  reg selector_MUX_686_reg_8_0_0_0;
  reg selector_MUX_697_reg_9_0_0_0;
  reg selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0;
  reg selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_100;
  reg wrenable_reg_101;
  reg wrenable_reg_102;
  reg wrenable_reg_103;
  reg wrenable_reg_104;
  reg wrenable_reg_105;
  reg wrenable_reg_106;
  reg wrenable_reg_107;
  reg wrenable_reg_108;
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
  reg wrenable_reg_65;
  reg wrenable_reg_66;
  reg wrenable_reg_67;
  reg wrenable_reg_68;
  reg wrenable_reg_69;
  reg wrenable_reg_7;
  reg wrenable_reg_70;
  reg wrenable_reg_71;
  reg wrenable_reg_72;
  reg wrenable_reg_73;
  reg wrenable_reg_74;
  reg wrenable_reg_75;
  reg wrenable_reg_76;
  reg wrenable_reg_77;
  reg wrenable_reg_78;
  reg wrenable_reg_79;
  reg wrenable_reg_8;
  reg wrenable_reg_80;
  reg wrenable_reg_81;
  reg wrenable_reg_82;
  reg wrenable_reg_83;
  reg wrenable_reg_84;
  reg wrenable_reg_85;
  reg wrenable_reg_86;
  reg wrenable_reg_87;
  reg wrenable_reg_88;
  reg wrenable_reg_89;
  reg wrenable_reg_9;
  reg wrenable_reg_90;
  reg wrenable_reg_91;
  reg wrenable_reg_92;
  reg wrenable_reg_93;
  reg wrenable_reg_94;
  reg wrenable_reg_95;
  reg wrenable_reg_96;
  reg wrenable_reg_97;
  reg wrenable_reg_98;
  reg wrenable_reg_99;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_332_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_332_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_332_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_332_i1_STORE = 1'b0;
    selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0 = 1'b0;
    selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0 = 1'b0;
    selector_MUX_600_reg_1_0_0_0 = 1'b0;
    selector_MUX_620_reg_2_0_0_0 = 1'b0;
    selector_MUX_631_reg_3_0_0_0 = 1'b0;
    selector_MUX_686_reg_8_0_0_0 = 1'b0;
    selector_MUX_697_reg_9_0_0_0 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0 = 1'b0;
    selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_100 = 1'b0;
    wrenable_reg_101 = 1'b0;
    wrenable_reg_102 = 1'b0;
    wrenable_reg_103 = 1'b0;
    wrenable_reg_104 = 1'b0;
    wrenable_reg_105 = 1'b0;
    wrenable_reg_106 = 1'b0;
    wrenable_reg_107 = 1'b0;
    wrenable_reg_108 = 1'b0;
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
    wrenable_reg_65 = 1'b0;
    wrenable_reg_66 = 1'b0;
    wrenable_reg_67 = 1'b0;
    wrenable_reg_68 = 1'b0;
    wrenable_reg_69 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_70 = 1'b0;
    wrenable_reg_71 = 1'b0;
    wrenable_reg_72 = 1'b0;
    wrenable_reg_73 = 1'b0;
    wrenable_reg_74 = 1'b0;
    wrenable_reg_75 = 1'b0;
    wrenable_reg_76 = 1'b0;
    wrenable_reg_77 = 1'b0;
    wrenable_reg_78 = 1'b0;
    wrenable_reg_79 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_80 = 1'b0;
    wrenable_reg_81 = 1'b0;
    wrenable_reg_82 = 1'b0;
    wrenable_reg_83 = 1'b0;
    wrenable_reg_84 = 1'b0;
    wrenable_reg_85 = 1'b0;
    wrenable_reg_86 = 1'b0;
    wrenable_reg_87 = 1'b0;
    wrenable_reg_88 = 1'b0;
    wrenable_reg_89 = 1'b0;
    wrenable_reg_9 = 1'b0;
    wrenable_reg_90 = 1'b0;
    wrenable_reg_91 = 1'b0;
    wrenable_reg_92 = 1'b0;
    wrenable_reg_93 = 1'b0;
    wrenable_reg_94 = 1'b0;
    wrenable_reg_95 = 1'b0;
    wrenable_reg_96 = 1'b0;
    wrenable_reg_97 = 1'b0;
    wrenable_reg_98 = 1'b0;
    wrenable_reg_99 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_600_reg_1_0_0_0 = 1'b1;
          selector_MUX_620_reg_2_0_0_0 = 1'b1;
          selector_MUX_631_reg_3_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_332_i1_LOAD = 1'b1;
          selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          selector_MUX_686_reg_8_0_0_0 = 1'b1;
          selector_MUX_697_reg_9_0_0_0 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_332_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_332_i1_LOAD = 1'b1;
          selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0 = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
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
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_332_i0_LOAD = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          wrenable_reg_52 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_53 = 1'b1;
          wrenable_reg_54 = 1'b1;
          wrenable_reg_55 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          wrenable_reg_56 = 1'b1;
          wrenable_reg_57 = 1'b1;
          wrenable_reg_58 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          wrenable_reg_59 = 1'b1;
          wrenable_reg_60 = 1'b1;
          wrenable_reg_61 = 1'b1;
          wrenable_reg_62 = 1'b1;
          wrenable_reg_63 = 1'b1;
          wrenable_reg_64 = 1'b1;
          wrenable_reg_65 = 1'b1;
          wrenable_reg_66 = 1'b1;
          wrenable_reg_67 = 1'b1;
          wrenable_reg_68 = 1'b1;
          wrenable_reg_69 = 1'b1;
          wrenable_reg_70 = 1'b1;
          wrenable_reg_71 = 1'b1;
          wrenable_reg_72 = 1'b1;
          wrenable_reg_73 = 1'b1;
          wrenable_reg_74 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          wrenable_reg_100 = 1'b1;
          wrenable_reg_101 = 1'b1;
          wrenable_reg_102 = 1'b1;
          wrenable_reg_103 = 1'b1;
          wrenable_reg_104 = 1'b1;
          wrenable_reg_105 = 1'b1;
          wrenable_reg_106 = 1'b1;
          wrenable_reg_107 = 1'b1;
          wrenable_reg_108 = 1'b1;
          wrenable_reg_75 = 1'b1;
          wrenable_reg_76 = 1'b1;
          wrenable_reg_77 = 1'b1;
          wrenable_reg_78 = 1'b1;
          wrenable_reg_79 = 1'b1;
          wrenable_reg_80 = 1'b1;
          wrenable_reg_81 = 1'b1;
          wrenable_reg_82 = 1'b1;
          wrenable_reg_83 = 1'b1;
          wrenable_reg_84 = 1'b1;
          wrenable_reg_85 = 1'b1;
          wrenable_reg_86 = 1'b1;
          wrenable_reg_87 = 1'b1;
          wrenable_reg_88 = 1'b1;
          wrenable_reg_89 = 1'b1;
          wrenable_reg_90 = 1'b1;
          wrenable_reg_91 = 1'b1;
          wrenable_reg_92 = 1'b1;
          wrenable_reg_93 = 1'b1;
          wrenable_reg_94 = 1'b1;
          wrenable_reg_95 = 1'b1;
          wrenable_reg_96 = 1'b1;
          wrenable_reg_97 = 1'b1;
          wrenable_reg_98 = 1'b1;
          wrenable_reg_99 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          wrenable_reg_8 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38724 == 1'b1)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_14;
            end
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_332_i0_STORE = 1'b1;
          selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0 = 1'b1;
          if (OUT_CONDITION_run_benchmark_38252_38727 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_15;
              done_port = 1'b1;
            end
        end
      S_15 :
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
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_run_benchmark_38252_38724;
  wire OUT_CONDITION_run_benchmark_38252_38727;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_332_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_332_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_332_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_332_i1_STORE;
  wire selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0;
  wire selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0;
  wire selector_MUX_600_reg_1_0_0_0;
  wire selector_MUX_620_reg_2_0_0_0;
  wire selector_MUX_631_reg_3_0_0_0;
  wire selector_MUX_686_reg_8_0_0_0;
  wire selector_MUX_697_reg_9_0_0_0;
  wire selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0;
  wire selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_100;
  wire wrenable_reg_101;
  wire wrenable_reg_102;
  wire wrenable_reg_103;
  wire wrenable_reg_104;
  wire wrenable_reg_105;
  wire wrenable_reg_106;
  wire wrenable_reg_107;
  wire wrenable_reg_108;
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
  wire wrenable_reg_65;
  wire wrenable_reg_66;
  wire wrenable_reg_67;
  wire wrenable_reg_68;
  wire wrenable_reg_69;
  wire wrenable_reg_7;
  wire wrenable_reg_70;
  wire wrenable_reg_71;
  wire wrenable_reg_72;
  wire wrenable_reg_73;
  wire wrenable_reg_74;
  wire wrenable_reg_75;
  wire wrenable_reg_76;
  wire wrenable_reg_77;
  wire wrenable_reg_78;
  wire wrenable_reg_79;
  wire wrenable_reg_8;
  wire wrenable_reg_80;
  wire wrenable_reg_81;
  wire wrenable_reg_82;
  wire wrenable_reg_83;
  wire wrenable_reg_84;
  wire wrenable_reg_85;
  wire wrenable_reg_86;
  wire wrenable_reg_87;
  wire wrenable_reg_88;
  wire wrenable_reg_89;
  wire wrenable_reg_9;
  wire wrenable_reg_90;
  wire wrenable_reg_91;
  wire wrenable_reg_92;
  wire wrenable_reg_93;
  wire wrenable_reg_94;
  wire wrenable_reg_95;
  wire wrenable_reg_96;
  wire wrenable_reg_97;
  wire wrenable_reg_98;
  wire wrenable_reg_99;
  
  controller_run_benchmark Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_332_i0_LOAD(fuselector_BMEMORY_CTRLN_332_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_332_i0_STORE(fuselector_BMEMORY_CTRLN_332_i0_STORE),
    .fuselector_BMEMORY_CTRLN_332_i1_LOAD(fuselector_BMEMORY_CTRLN_332_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_332_i1_STORE(fuselector_BMEMORY_CTRLN_332_i1_STORE),
    .selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0(selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0),
    .selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0(selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0),
    .selector_MUX_600_reg_1_0_0_0(selector_MUX_600_reg_1_0_0_0),
    .selector_MUX_620_reg_2_0_0_0(selector_MUX_620_reg_2_0_0_0),
    .selector_MUX_631_reg_3_0_0_0(selector_MUX_631_reg_3_0_0_0),
    .selector_MUX_686_reg_8_0_0_0(selector_MUX_686_reg_8_0_0_0),
    .selector_MUX_697_reg_9_0_0_0(selector_MUX_697_reg_9_0_0_0),
    .selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0(selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0),
    .selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1(selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_100(wrenable_reg_100),
    .wrenable_reg_101(wrenable_reg_101),
    .wrenable_reg_102(wrenable_reg_102),
    .wrenable_reg_103(wrenable_reg_103),
    .wrenable_reg_104(wrenable_reg_104),
    .wrenable_reg_105(wrenable_reg_105),
    .wrenable_reg_106(wrenable_reg_106),
    .wrenable_reg_107(wrenable_reg_107),
    .wrenable_reg_108(wrenable_reg_108),
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
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
    .wrenable_reg_78(wrenable_reg_78),
    .wrenable_reg_79(wrenable_reg_79),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_80(wrenable_reg_80),
    .wrenable_reg_81(wrenable_reg_81),
    .wrenable_reg_82(wrenable_reg_82),
    .wrenable_reg_83(wrenable_reg_83),
    .wrenable_reg_84(wrenable_reg_84),
    .wrenable_reg_85(wrenable_reg_85),
    .wrenable_reg_86(wrenable_reg_86),
    .wrenable_reg_87(wrenable_reg_87),
    .wrenable_reg_88(wrenable_reg_88),
    .wrenable_reg_89(wrenable_reg_89),
    .wrenable_reg_9(wrenable_reg_9),
    .wrenable_reg_90(wrenable_reg_90),
    .wrenable_reg_91(wrenable_reg_91),
    .wrenable_reg_92(wrenable_reg_92),
    .wrenable_reg_93(wrenable_reg_93),
    .wrenable_reg_94(wrenable_reg_94),
    .wrenable_reg_95(wrenable_reg_95),
    .wrenable_reg_96(wrenable_reg_96),
    .wrenable_reg_97(wrenable_reg_97),
    .wrenable_reg_98(wrenable_reg_98),
    .wrenable_reg_99(wrenable_reg_99),
    .OUT_CONDITION_run_benchmark_38252_38724(OUT_CONDITION_run_benchmark_38252_38724),
    .OUT_CONDITION_run_benchmark_38252_38727(OUT_CONDITION_run_benchmark_38252_38727),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_run_benchmark Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_run_benchmark_38252_38724(OUT_CONDITION_run_benchmark_38252_38724),
    .OUT_CONDITION_run_benchmark_38252_38727(OUT_CONDITION_run_benchmark_38252_38727),
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
    .fuselector_BMEMORY_CTRLN_332_i0_LOAD(fuselector_BMEMORY_CTRLN_332_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_332_i0_STORE(fuselector_BMEMORY_CTRLN_332_i0_STORE),
    .fuselector_BMEMORY_CTRLN_332_i1_LOAD(fuselector_BMEMORY_CTRLN_332_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_332_i1_STORE(fuselector_BMEMORY_CTRLN_332_i1_STORE),
    .selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0(selector_MUX_12_BMEMORY_CTRLN_332_i1_1_0_0),
    .selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0(selector_MUX_13_BMEMORY_CTRLN_332_i1_2_0_0),
    .selector_MUX_600_reg_1_0_0_0(selector_MUX_600_reg_1_0_0_0),
    .selector_MUX_620_reg_2_0_0_0(selector_MUX_620_reg_2_0_0_0),
    .selector_MUX_631_reg_3_0_0_0(selector_MUX_631_reg_3_0_0_0),
    .selector_MUX_686_reg_8_0_0_0(selector_MUX_686_reg_8_0_0_0),
    .selector_MUX_697_reg_9_0_0_0(selector_MUX_697_reg_9_0_0_0),
    .selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0(selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_0),
    .selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1(selector_MUX_9_BMEMORY_CTRLN_332_i0_1_0_1),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_100(wrenable_reg_100),
    .wrenable_reg_101(wrenable_reg_101),
    .wrenable_reg_102(wrenable_reg_102),
    .wrenable_reg_103(wrenable_reg_103),
    .wrenable_reg_104(wrenable_reg_104),
    .wrenable_reg_105(wrenable_reg_105),
    .wrenable_reg_106(wrenable_reg_106),
    .wrenable_reg_107(wrenable_reg_107),
    .wrenable_reg_108(wrenable_reg_108),
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
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
    .wrenable_reg_78(wrenable_reg_78),
    .wrenable_reg_79(wrenable_reg_79),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_80(wrenable_reg_80),
    .wrenable_reg_81(wrenable_reg_81),
    .wrenable_reg_82(wrenable_reg_82),
    .wrenable_reg_83(wrenable_reg_83),
    .wrenable_reg_84(wrenable_reg_84),
    .wrenable_reg_85(wrenable_reg_85),
    .wrenable_reg_86(wrenable_reg_86),
    .wrenable_reg_87(wrenable_reg_87),
    .wrenable_reg_88(wrenable_reg_88),
    .wrenable_reg_89(wrenable_reg_89),
    .wrenable_reg_9(wrenable_reg_9),
    .wrenable_reg_90(wrenable_reg_90),
    .wrenable_reg_91(wrenable_reg_91),
    .wrenable_reg_92(wrenable_reg_92),
    .wrenable_reg_93(wrenable_reg_93),
    .wrenable_reg_94(wrenable_reg_94),
    .wrenable_reg_95(wrenable_reg_95),
    .wrenable_reg_96(wrenable_reg_96),
    .wrenable_reg_97(wrenable_reg_97),
    .wrenable_reg_98(wrenable_reg_98),
    .wrenable_reg_99(wrenable_reg_99));
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
  OUT_MULTIIF_main_38248_50768,
  OUT_MULTIIF_main_38248_50775,
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
    MEM_var_38866_74=7340032,
    MEM_var_38868_38248=2097152,
    MEM_var_38870_38248=2621440,
    MEM_var_38872_38248=3145728,
    MEM_var_38874_38248=3670016,
    MEM_var_38876_38248=4194304,
    MEM_var_38878_38248=4718592,
    MEM_var_38880_38248=5242880,
    MEM_var_38882_38248=5767168,
    MEM_var_38884_38248=6291456,
    MEM_var_38886_38248=6815744,
    MEM_var_792_38248=524288,
    MEM_var_796_38248=524288,
    MEM_var_992_38248=524288;
  // IN
  input clock;
  input reset;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [45:0] S_addr_ram;
  input [127:0] S_Wdata_ram;
  input [13:0] S_data_ram_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
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
  output [127:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION_main_38248_38272;
  output OUT_CONDITION_main_38248_38372;
  output [1:0] OUT_MULTIIF_main_38248_50768;
  output [1:0] OUT_MULTIIF_main_38248_50775;
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
  wire [63:0] null_out_signal_array_38334_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38334_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38868_0_out1_0;
  wire [7:0] null_out_signal_array_38868_0_out1_1;
  wire [63:0] null_out_signal_array_38868_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38868_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38870_0_out1_0;
  wire [7:0] null_out_signal_array_38870_0_out1_1;
  wire [63:0] null_out_signal_array_38870_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38870_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38872_0_out1_0;
  wire [7:0] null_out_signal_array_38872_0_out1_1;
  wire [63:0] null_out_signal_array_38872_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38872_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38874_0_out1_0;
  wire [7:0] null_out_signal_array_38874_0_out1_1;
  wire [63:0] null_out_signal_array_38874_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38874_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38876_0_out1_0;
  wire [7:0] null_out_signal_array_38876_0_out1_1;
  wire [63:0] null_out_signal_array_38876_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38876_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38878_0_out1_0;
  wire [7:0] null_out_signal_array_38878_0_out1_1;
  wire [63:0] null_out_signal_array_38878_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38878_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38880_0_out1_0;
  wire [7:0] null_out_signal_array_38880_0_out1_1;
  wire [63:0] null_out_signal_array_38880_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38880_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38882_0_out1_0;
  wire [7:0] null_out_signal_array_38882_0_out1_1;
  wire [63:0] null_out_signal_array_38882_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38882_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38884_0_out1_0;
  wire [7:0] null_out_signal_array_38884_0_out1_1;
  wire [63:0] null_out_signal_array_38884_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38884_0_proxy_out1_1;
  wire [7:0] null_out_signal_array_38886_0_out1_0;
  wire [7:0] null_out_signal_array_38886_0_out1_1;
  wire [63:0] null_out_signal_array_38886_0_proxy_out1_0;
  wire [63:0] null_out_signal_array_38886_0_proxy_out1_1;
  wire null_out_signal_array_792_0_Sout_DataRdy_0;
  wire null_out_signal_array_792_0_Sout_DataRdy_1;
  wire [63:0] null_out_signal_array_792_0_Sout_Rdata_ram_0;
  wire [63:0] null_out_signal_array_792_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_792_0_out1_0;
  wire [31:0] null_out_signal_array_792_0_out1_1;
  wire [31:0] null_out_signal_array_796_0_out1_0;
  wire [31:0] null_out_signal_array_796_0_out1_1;
  wire null_out_signal_array_992_0_Sout_DataRdy_0;
  wire null_out_signal_array_992_0_Sout_DataRdy_1;
  wire [63:0] null_out_signal_array_992_0_Sout_Rdata_ram_0;
  wire [63:0] null_out_signal_array_992_0_Sout_Rdata_ram_1;
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
  wire [22:0] out_addr_expr_FU_17_i0_fu_main_38248_39616;
  wire [22:0] out_addr_expr_FU_18_i0_fu_main_38248_39629;
  wire [22:0] out_addr_expr_FU_19_i0_fu_main_38248_39632;
  wire [22:0] out_addr_expr_FU_20_i0_fu_main_38248_39635;
  wire [22:0] out_addr_expr_FU_21_i0_fu_main_38248_39651;
  wire [22:0] out_addr_expr_FU_22_i0_fu_main_38248_39660;
  wire [22:0] out_addr_expr_FU_23_i0_fu_main_38248_39663;
  wire [22:0] out_addr_expr_FU_24_i0_fu_main_38248_39666;
  wire [22:0] out_addr_expr_FU_25_i0_fu_main_38248_39642;
  wire [22:0] out_addr_expr_FU_26_i0_fu_main_38248_39645;
  wire [22:0] out_addr_expr_FU_27_i0_fu_main_38248_39648;
  wire [22:0] out_addr_expr_FU_28_i0_fu_main_38248_39607;
  wire [22:0] out_addr_expr_FU_29_i0_fu_main_38248_39610;
  wire [22:0] out_addr_expr_FU_30_i0_fu_main_38248_39613;
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
  wire out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39626;
  wire out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39657;
  wire out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_39855;
  wire out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_39859;
  wire signed [0:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire out_lut_expr_FU_40_i0_fu_main_38248_50771;
  wire out_lut_expr_FU_41_i0_fu_main_38248_50774;
  wire out_lut_expr_FU_51_i0_fu_main_38248_50778;
  wire out_lut_expr_FU_52_i0_fu_main_38248_50781;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i0_fu_main_38248_38405;
  wire signed [31:0] out_minus_expr_FU_0_32_32_60_i1_fu_main_38248_38506;
  wire [1:0] out_multi_read_cond_FU_42_i0_fu_main_38248_50768;
  wire [1:0] out_multi_read_cond_FU_53_i0_fu_main_38248_50775;
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
  wire out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_39849;
  wire out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_39853;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_63_i0_fu_main_38248_38391;
  wire [22:0] out_ui_pointer_plus_expr_FU_32_32_32_63_i1_fu_main_38248_38493;
  wire [127:0] proxy_out1_1020;
  wire [127:0] proxy_out1_792;
  wire [127:0] proxy_out1_796;
  wire [127:0] proxy_out1_992;
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
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_1;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_2;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_3;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_4;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_5;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_1;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_2;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_3;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_4;
  wire [45:0] sig_in_bus_mergerMout_addr_ram1_5;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_1;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_2;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_3;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_4;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_5;
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
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_0;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_1;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_10;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_11;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_12;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_13;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_2;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_3;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_4;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_5;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_6;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_7;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_8;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_9;
  wire [127:0] sig_in_bus_mergerproxy_in112_0;
  wire [127:0] sig_in_bus_mergerproxy_in117_0;
  wire [127:0] sig_in_bus_mergerproxy_in122_0;
  wire [127:0] sig_in_bus_mergerproxy_in17_0;
  wire [45:0] sig_in_bus_mergerproxy_in213_0;
  wire [45:0] sig_in_bus_mergerproxy_in218_0;
  wire [45:0] sig_in_bus_mergerproxy_in223_0;
  wire [45:0] sig_in_bus_mergerproxy_in28_0;
  wire [13:0] sig_in_bus_mergerproxy_in314_0;
  wire [13:0] sig_in_bus_mergerproxy_in319_0;
  wire [13:0] sig_in_bus_mergerproxy_in324_0;
  wire [13:0] sig_in_bus_mergerproxy_in39_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD10_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD15_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD20_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD25_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE11_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE16_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE21_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE26_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_1;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_2;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_3;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_4;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_5;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_1;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_2;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_3;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_4;
  wire [45:0] sig_in_vector_bus_mergerMout_addr_ram1_5;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_1;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_2;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_3;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_4;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_5;
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
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_0;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_1;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_10;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_11;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_12;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_13;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_2;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_3;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_4;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_5;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_6;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_7;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_8;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_9;
  wire [127:0] sig_in_vector_bus_mergerproxy_in112_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in117_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in122_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in17_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in213_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in218_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in223_0;
  wire [45:0] sig_in_vector_bus_mergerproxy_in28_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in314_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in319_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in324_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in39_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD10_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD15_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD20_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD25_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE11_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE16_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE21_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE26_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [45:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [1:0] sig_out_bus_mergerSout_DataRdy5_;
  wire [127:0] sig_out_bus_mergerSout_Rdata_ram6_;
  wire [127:0] sig_out_bus_mergerproxy_in112_;
  wire [127:0] sig_out_bus_mergerproxy_in117_;
  wire [127:0] sig_out_bus_mergerproxy_in122_;
  wire [127:0] sig_out_bus_mergerproxy_in17_;
  wire [45:0] sig_out_bus_mergerproxy_in213_;
  wire [45:0] sig_out_bus_mergerproxy_in218_;
  wire [45:0] sig_out_bus_mergerproxy_in223_;
  wire [45:0] sig_out_bus_mergerproxy_in28_;
  wire [13:0] sig_out_bus_mergerproxy_in314_;
  wire [13:0] sig_out_bus_mergerproxy_in319_;
  wire [13:0] sig_out_bus_mergerproxy_in324_;
  wire [13:0] sig_out_bus_mergerproxy_in39_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD10_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD15_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD20_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD25_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE11_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE16_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE21_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE26_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in112_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in117_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in122_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in17_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in213_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in218_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in223_;
  wire [45:0] sig_out_vector_bus_mergerproxy_in28_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in314_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in319_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in324_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in39_;
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
  __assert_fail #(.MEM_var_38866_74(MEM_var_38866_74)) __assert_fail_64_i0 (.done_port(s_done___assert_fail_64_i0),
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
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
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
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      7'b0000000}),
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
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
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
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38868.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38868.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_38868_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38868_0 (.out1({null_out_signal_array_38868_0_out1_1,
      null_out_signal_array_38868_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_3),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_3),
    .proxy_out1({null_out_signal_array_38868_0_proxy_out1_1,
      null_out_signal_array_38868_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38870.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38870.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38870_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38870_0 (.out1({null_out_signal_array_38870_0_out1_1,
      null_out_signal_array_38870_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_4),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_4),
    .proxy_out1({null_out_signal_array_38870_0_proxy_out1_1,
      null_out_signal_array_38870_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38872.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38872.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_38872_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38872_0 (.out1({null_out_signal_array_38872_0_out1_1,
      null_out_signal_array_38872_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_5),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_5),
    .proxy_out1({null_out_signal_array_38872_0_proxy_out1_1,
      null_out_signal_array_38872_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38874.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38874.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_38874_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38874_0 (.out1({null_out_signal_array_38874_0_out1_1,
      null_out_signal_array_38874_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_6),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_6),
    .proxy_out1({null_out_signal_array_38874_0_proxy_out1_1,
      null_out_signal_array_38874_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38876.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38876.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38876_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38876_0 (.out1({null_out_signal_array_38876_0_out1_1,
      null_out_signal_array_38876_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_7),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_7),
    .proxy_out1({null_out_signal_array_38876_0_proxy_out1_1,
      null_out_signal_array_38876_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38878.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38878.mem"),
    .n_elements(31),
    .data_size(8),
    .address_space_begin(MEM_var_38878_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38878_0 (.out1({null_out_signal_array_38878_0_out1_1,
      null_out_signal_array_38878_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_8),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_8),
    .proxy_out1({null_out_signal_array_38878_0_proxy_out1_1,
      null_out_signal_array_38878_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38880.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38880.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38880_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38880_0 (.out1({null_out_signal_array_38880_0_out1_1,
      null_out_signal_array_38880_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_9),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_9),
    .proxy_out1({null_out_signal_array_38880_0_proxy_out1_1,
      null_out_signal_array_38880_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38882.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38882.mem"),
    .n_elements(11),
    .data_size(8),
    .address_space_begin(MEM_var_38882_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38882_0 (.out1({null_out_signal_array_38882_0_out1_1,
      null_out_signal_array_38882_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_10),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_10),
    .proxy_out1({null_out_signal_array_38882_0_proxy_out1_1,
      null_out_signal_array_38882_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38884.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38884.mem"),
    .n_elements(36),
    .data_size(8),
    .address_space_begin(MEM_var_38884_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38884_0 (.out1({null_out_signal_array_38884_0_out1_1,
      null_out_signal_array_38884_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_11),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_11),
    .proxy_out1({null_out_signal_array_38884_0_proxy_out1_1,
      null_out_signal_array_38884_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_38886.mem"),
    .MEMORY_INIT_file_b("0_array_ref_38886.mem"),
    .n_elements(70),
    .data_size(8),
    .address_space_begin(MEM_var_38886_38248),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_38886_0 (.out1({null_out_signal_array_38886_0_out1_1,
      null_out_signal_array_38886_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_12),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_12),
    .proxy_out1({null_out_signal_array_38886_0_proxy_out1_1,
      null_out_signal_array_38886_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
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
    .proxy_in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .proxy_in2({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .proxy_in3({7'b0000000,
      7'b0000000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(23),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
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
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      7'b0000000}),
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
    .S_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Sin_Rdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .S_data_ram_size({7'b0000000,
      7'b0000000}),
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
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
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
    .BRAM_BITSIZE(64),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      7'b0000000}),
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
    .BITSIZE_in3(7),
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
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
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
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(23),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
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
    .in3({7'b0000000,
      7'b0000000}),
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
    .S_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Sin_Rdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .S_data_ram_size({7'b0000000,
      7'b0000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in117_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in218_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in319_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD20_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE21_));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(6),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
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
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(6),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
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
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(14),
    .BITSIZE_out1(128)) bus_mergerSout_Rdata_ram6_ (.out1(sig_out_bus_mergerSout_Rdata_ram6_),
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
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in112_ (.out1(sig_out_bus_mergerproxy_in112_),
    .in1({sig_in_bus_mergerproxy_in112_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in117_ (.out1(sig_out_bus_mergerproxy_in117_),
    .in1({sig_in_bus_mergerproxy_in117_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in122_ (.out1(sig_out_bus_mergerproxy_in122_),
    .in1({sig_in_bus_mergerproxy_in122_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in17_ (.out1(sig_out_bus_mergerproxy_in17_),
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
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in314_ (.out1(sig_out_bus_mergerproxy_in314_),
    .in1({sig_in_bus_mergerproxy_in314_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in319_ (.out1(sig_out_bus_mergerproxy_in319_),
    .in1({sig_in_bus_mergerproxy_in319_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in324_ (.out1(sig_out_bus_mergerproxy_in324_),
    .in1({sig_in_bus_mergerproxy_in324_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in39_ (.out1(sig_out_bus_mergerproxy_in39_),
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
    .value(18'b010000011001110000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38870_38248)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38872_38248)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38874_38248)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38876_38248)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38878_38248)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38880_38248)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38882_38248)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38884_38248)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(23),
    .value(MEM_var_38886_38248)) const_18 (.out1(out_const_18));
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
    .value(MEM_var_38868_38248)) const_9 (.out1(out_const_9));
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
    .in1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_39849));
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
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
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
    .in1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_39853));
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
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
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
    .BITSIZE_out1(23)) fu_main_38248_39607 (.out1(out_addr_expr_FU_28_i0_fu_main_38248_39607),
    .in1(out_conv_out_const_9_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39610 (.out1(out_addr_expr_FU_29_i0_fu_main_38248_39610),
    .in1(out_conv_out_const_10_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39613 (.out1(out_addr_expr_FU_30_i0_fu_main_38248_39613),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39616 (.out1(out_addr_expr_FU_17_i0_fu_main_38248_39616),
    .in1(out_conv_out_const_11_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39626 (.out1(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39626),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39629 (.out1(out_addr_expr_FU_18_i0_fu_main_38248_39629),
    .in1(out_conv_out_const_12_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39632 (.out1(out_addr_expr_FU_19_i0_fu_main_38248_39632),
    .in1(out_conv_out_const_13_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39635 (.out1(out_addr_expr_FU_20_i0_fu_main_38248_39635),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39642 (.out1(out_addr_expr_FU_25_i0_fu_main_38248_39642),
    .in1(out_conv_out_const_14_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39645 (.out1(out_addr_expr_FU_26_i0_fu_main_38248_39645),
    .in1(out_conv_out_const_15_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39648 (.out1(out_addr_expr_FU_27_i0_fu_main_38248_39648),
    .in1(out_conv_out_const_8_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39651 (.out1(out_addr_expr_FU_21_i0_fu_main_38248_39651),
    .in1(out_conv_out_const_16_23_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39657 (.out1(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39657),
    .in1(out_reg_17_reg_17),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39660 (.out1(out_addr_expr_FU_22_i0_fu_main_38248_39660),
    .in1(out_conv_out_const_17_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39663 (.out1(out_addr_expr_FU_23_i0_fu_main_38248_39663),
    .in1(out_conv_out_const_18_23_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(23)) fu_main_38248_39666 (.out1(out_addr_expr_FU_24_i0_fu_main_38248_39666),
    .in1(out_conv_out_const_8_23_32));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39849 (.out1(out_ui_ne_expr_FU_32_0_32_62_i0_fu_main_38248_39849),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_38248_39853 (.out1(out_ui_ne_expr_FU_32_0_32_62_i1_fu_main_38248_39853),
    .in1(out_reg_0_reg_0),
    .in2(out_const_0));
  gt_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_39855 (.out1(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_39855),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i0_fu_main_38248_38400));
  gt_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_38248_39859 (.out1(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_39859),
    .in1(out_const_1),
    .in2(out_plus_expr_FU_32_32_32_61_i1_fu_main_38248_38501));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_50768 (.out1(out_multi_read_cond_FU_42_i0_fu_main_38248_50768),
    .in1({out_lut_expr_FU_41_i0_fu_main_38248_50774,
      out_lut_expr_FU_40_i0_fu_main_38248_50771}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_50771 (.out1(out_lut_expr_FU_40_i0_fu_main_38248_50771),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39626),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_50774 (.out1(out_lut_expr_FU_41_i0_fu_main_38248_50774),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i0_fu_main_38248_39626),
    .in3(out_gt_expr_FU_0_32_32_59_i0_fu_main_38248_39855),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_38248_50775 (.out1(out_multi_read_cond_FU_53_i0_fu_main_38248_50775),
    .in1({out_lut_expr_FU_52_i0_fu_main_38248_50781,
      out_lut_expr_FU_51_i0_fu_main_38248_50778}));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_38248_50778 (.out1(out_lut_expr_FU_51_i0_fu_main_38248_50778),
    .in1(out_const_2),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39657),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_38248_50781 (.out1(out_lut_expr_FU_52_i0_fu_main_38248_50781),
    .in1(out_const_3),
    .in2(out_ge_expr_FU_32_0_32_58_i1_fu_main_38248_39657),
    .in3(out_gt_expr_FU_0_32_32_59_i1_fu_main_38248_39859),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_1 (.out1(sig_in_bus_mergerMout_Wdata_ram0_1),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_1));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_2 (.out1(sig_in_bus_mergerMout_Wdata_ram0_2),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_2));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_3 (.out1(sig_in_bus_mergerMout_Wdata_ram0_3),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_3));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_4 (.out1(sig_in_bus_mergerMout_Wdata_ram0_4),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_4));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_5 (.out1(sig_in_bus_mergerMout_Wdata_ram0_5),
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
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_1 (.out1(sig_in_bus_mergerMout_data_ram_size2_1),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_1));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_2 (.out1(sig_in_bus_mergerMout_data_ram_size2_2),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_2));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_3 (.out1(sig_in_bus_mergerMout_data_ram_size2_3),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_3));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_4 (.out1(sig_in_bus_mergerMout_data_ram_size2_4),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_4));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_5 (.out1(sig_in_bus_mergerMout_data_ram_size2_5),
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
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_0 (.out1(sig_in_bus_mergerSout_Rdata_ram6_0),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_1 (.out1(sig_in_bus_mergerSout_Rdata_ram6_1),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_1));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_10 (.out1(sig_in_bus_mergerSout_Rdata_ram6_10),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_10));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_11 (.out1(sig_in_bus_mergerSout_Rdata_ram6_11),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_11));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_12 (.out1(sig_in_bus_mergerSout_Rdata_ram6_12),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_12));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_13 (.out1(sig_in_bus_mergerSout_Rdata_ram6_13),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_13));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_2 (.out1(sig_in_bus_mergerSout_Rdata_ram6_2),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_2));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_3 (.out1(sig_in_bus_mergerSout_Rdata_ram6_3),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_3));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_4 (.out1(sig_in_bus_mergerSout_Rdata_ram6_4),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_4));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_5 (.out1(sig_in_bus_mergerSout_Rdata_ram6_5),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_5));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_6 (.out1(sig_in_bus_mergerSout_Rdata_ram6_6),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_6));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_7 (.out1(sig_in_bus_mergerSout_Rdata_ram6_7),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_7));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_8 (.out1(sig_in_bus_mergerSout_Rdata_ram6_8),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_8));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_9 (.out1(sig_in_bus_mergerSout_Rdata_ram6_9),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_9));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in112_0 (.out1(sig_in_bus_mergerproxy_in112_0),
    .in1(sig_in_vector_bus_mergerproxy_in112_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in117_0 (.out1(sig_in_bus_mergerproxy_in117_0),
    .in1(sig_in_vector_bus_mergerproxy_in117_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in122_0 (.out1(sig_in_bus_mergerproxy_in122_0),
    .in1(sig_in_vector_bus_mergerproxy_in122_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in17_0 (.out1(sig_in_bus_mergerproxy_in17_0),
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
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in314_0 (.out1(sig_in_bus_mergerproxy_in314_0),
    .in1(sig_in_vector_bus_mergerproxy_in314_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in319_0 (.out1(sig_in_bus_mergerproxy_in319_0),
    .in1(sig_in_vector_bus_mergerproxy_in319_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in324_0 (.out1(sig_in_bus_mergerproxy_in324_0),
    .in1(sig_in_vector_bus_mergerproxy_in324_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in39_0 (.out1(sig_in_bus_mergerproxy_in39_0),
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
    .in1(out_addr_expr_FU_28_i0_fu_main_38248_39607),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_27_i0_fu_main_38248_39648),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu_main_38248_39651),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu_main_38248_39660),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu_main_38248_39663),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_24_i0_fu_main_38248_39666),
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
    .in1(out_addr_expr_FU_29_i0_fu_main_38248_39610),
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
    .in1(out_addr_expr_FU_30_i0_fu_main_38248_39613),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_17_i0_fu_main_38248_39616),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_18_i0_fu_main_38248_39629),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_19_i0_fu_main_38248_39632),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu_main_38248_39635),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_25_i0_fu_main_38248_39642),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(23),
    .BITSIZE_out1(23)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_26_i0_fu_main_38248_39645),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(46),
    .BITSIZE_out1(23),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_Rdata_ram6_ (.out1(Sout_Rdata_ram),
    .in1(sig_out_bus_mergerSout_Rdata_ram6_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in112_ (.out1(sig_out_vector_bus_mergerproxy_in112_),
    .in1(sig_out_bus_mergerproxy_in112_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in117_ (.out1(sig_out_vector_bus_mergerproxy_in117_),
    .in1(sig_out_bus_mergerproxy_in117_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in122_ (.out1(sig_out_vector_bus_mergerproxy_in122_),
    .in1(sig_out_bus_mergerproxy_in122_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
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
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in314_ (.out1(sig_out_vector_bus_mergerproxy_in314_),
    .in1(sig_out_bus_mergerproxy_in314_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in319_ (.out1(sig_out_vector_bus_mergerproxy_in319_),
    .in1(sig_out_bus_mergerproxy_in319_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in324_ (.out1(sig_out_vector_bus_mergerproxy_in324_),
    .in1(sig_out_bus_mergerproxy_in324_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
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
  assign OUT_MULTIIF_main_38248_50768 = out_multi_read_cond_FU_42_i0_fu_main_38248_50768;
  assign OUT_MULTIIF_main_38248_50775 = out_multi_read_cond_FU_53_i0_fu_main_38248_50775;
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
  OUT_MULTIIF_main_38248_50768,
  OUT_MULTIIF_main_38248_50775,
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
  input [1:0] OUT_MULTIIF_main_38248_50768;
  input [1:0] OUT_MULTIIF_main_38248_50775;
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
          casez (OUT_MULTIIF_main_38248_50768)
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
          casez (OUT_MULTIIF_main_38248_50775)
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
  input [127:0] S_Wdata_ram;
  input [13:0] S_data_ram_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [45:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output [127:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [45:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_main_38248_38272;
  wire OUT_CONDITION_main_38248_38372;
  wire [1:0] OUT_MULTIIF_main_38248_50768;
  wire [1:0] OUT_MULTIIF_main_38248_50775;
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
    .OUT_MULTIIF_main_38248_50768(OUT_MULTIIF_main_38248_50768),
    .OUT_MULTIIF_main_38248_50775(OUT_MULTIIF_main_38248_50775),
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
    .MEM_var_38866_74(7340032),
    .MEM_var_38868_38248(2097152),
    .MEM_var_38870_38248(2621440),
    .MEM_var_38872_38248(3145728),
    .MEM_var_38874_38248(3670016),
    .MEM_var_38876_38248(4194304),
    .MEM_var_38878_38248(4718592),
    .MEM_var_38880_38248(5242880),
    .MEM_var_38882_38248(5767168),
    .MEM_var_38884_38248(6291456),
    .MEM_var_38886_38248(6815744),
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
    .OUT_MULTIIF_main_38248_50768(OUT_MULTIIF_main_38248_50768),
    .OUT_MULTIIF_main_38248_50775(OUT_MULTIIF_main_38248_50775),
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
  wire [127:0] M_Rdata_ram_INT;
  wire [127:0] S_Wdata_ram_INT;
  wire [45:0] S_addr_ram_INT;
  wire [13:0] S_data_ram_size_INT;
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
    .Sin_Rdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({23'b00000000000000000000000,
      23'b00000000000000000000000}),
    .Min_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Min_data_ram_size({7'b0000000,
      7'b0000000}));
  view_convert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) return_port_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_view_convert_expr_FU));

endmodule




// End of: /home/ubuntu/spmv.v
////////////////////////////////////////////////////////////////
