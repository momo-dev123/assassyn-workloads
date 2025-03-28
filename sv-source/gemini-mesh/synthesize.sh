#!/usr/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime_$USER
mkdir -p "$XDG_RUNTIME_DIR"

apptainer exec \
    --bind ./MacUnit.sv:/home/ubuntu/MacUnit.sv \
    --bind ./PE_16.sv:/home/ubuntu/PE_16.sv \
    $WORKLOAD_HOME/open_eda.sif \
    sc /home/ubuntu/MacUnit.sv /home/ubuntu/PE_16.sv \
    -design PE_16 \
    -target asap7_demo -define SYNTHESIS=1

cp ./build/PE_16/job0/syn/0/reports/stat.json ../../plot/reports/gemmini-pe.json
