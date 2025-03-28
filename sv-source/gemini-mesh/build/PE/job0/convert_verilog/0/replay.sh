#!/usr/bin/env bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LD_LIBRARY_PATH="/.singularity.d/libs"
cd /home/gaod/derui_work/assassyn-workloads/sv-source/gemini-mesh/build/PE/job0/convert_verilog/0
sv2v \
    inputs/PE.sv \
    --write=outputs/PE.v
