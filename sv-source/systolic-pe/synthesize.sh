#!/usr/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime_$USER
mkdir -p "$XDG_RUNTIME_DIR"

i=./systolic_array.sv
fname=`basename $i`
singularity exec --bind $i:/home/ubuntu/$fname $WORKLOAD_HOME/open_eda.sif sc /home/ubuntu/$fname -target asap7_demo -design pe_5_2 -define SYNTHESIS=1

cp ./build/pe_5_2/job0/syn/0/reports/stat.json ../../plot/reports/out.pe.json
