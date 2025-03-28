#!/usr/bin/env bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LD_LIBRARY_PATH="/.singularity.d/libs"
cd /home/gaod/derui_work/assassyn-workloads/sv-source/sodor-core/build/CSRFile/job0/convert_verilog/0
sv2v \
    inputs/CSRFile.sv \
    --write=outputs/CSRFile.v
