#!/usr/bin/env bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LD_LIBRARY_PATH="/.singularity.d/libs"
cd /home/gaod/derui_work/assassyn-workloads/sv-source/systolic-pe/build/pe_5_2/job0/convert_verilog/0
sv2v \
    inputs/pe_5_2.sv \
    --write=outputs/pe_5_2.v
