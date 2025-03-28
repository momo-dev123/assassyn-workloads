#!/usr/bin/env bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LD_LIBRARY_PATH="/.singularity.d/libs"
cd /home/gaod/derui_work/assassyn-workloads/sv-source/sodor-core/build/Core/job0/syn/0
yosys \
    -c \
    /usr/local/lib/python3.10/dist-packages/siliconcompiler/tools/yosys/sc_syn.tcl
