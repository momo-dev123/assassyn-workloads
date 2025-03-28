#!/usr/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime_$USER
mkdir -p "$XDG_RUNTIME_DIR"

apptainer exec \
    --bind ./MacUnit.sv:/home/ubuntu/MacUnit.sv \
    --bind ./PE.sv:/home/ubuntu/PE.sv \
    $WORKLOAD_HOME/open_eda.sif \
    sc /home/ubuntu/MacUnit.sv /home/ubuntu/PE.sv \
    -design PE \
    -target asap7_demo -define SYNTHESIS=1

cp ./build/PE/job0/syn/0/reports/stat.json ../../plot/reports/gemmini-pe.json
