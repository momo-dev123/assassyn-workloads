#!/usr/bin/env python3

import sys

component = sys.argv[1]

if component == 'counter':
    width = int(sys.argv[2])
    sig = f'{width}'
    template = f'''
module top (
  input logic clk,
  input logic rst_n,
  input logic [{width - 1}:0] delta,
  output logic delta_ready,
  input logic pop_ready,
  output logic pop_valid
);

trigger_counter #(
  .WIDTH({width})
) tci (
  .clk(clk),
  .rst_n(rst_n),
  .delta(delta),
  .delta_ready(delta_ready),
  .pop_ready(pop_ready),
  .pop_valid(pop_valid)
);

endmodule
'''
elif component == 'fifo':
    width = int(sys.argv[2])
    depth = int(sys.argv[3])
    sig = f'{width}.{depth}'
    template = f'''
module top (
    input  logic               clk,
    input  logic               rst_n,

    input  logic               push_valid,
    input  logic [{width-1}:0] push_data,
    output logic               push_ready,

    output logic               pop_valid,
    output logic [{width-1}:0] pop_data,
    input  logic               pop_ready
);

fifo #({width}, {depth}) fi (
    .clk(clk),
    .rst_n(rst_n),

    .push_valid(push_valid),
    .push_data(push_data),
    .push_ready(push_ready),

    .pop_valid(pop_valid),
    .pop_data(pop_data),
    .pop_ready(pop_ready)
);

endmodule
'''

with open('top.sv', 'w') as f:
    f.write(template)

import subprocess

subprocess.run('singularity exec --bind runtime.sv:/home/ubuntu/runtime.sv --bind top.sv:/home/ubuntu/top.sv ~/open_eda.sif sc /home/ubuntu/runtime.sv /home/ubuntu/top.sv -target asap7_demo -design top -define SYNTHESIS', shell=True)

import shutil

shutil.copy('./build/top/job0/syn/0/reports/stat.json', f'./{component}.{sig}.json')
