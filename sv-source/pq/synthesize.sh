#!/usr/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime_$USER
mkdir -p "$XDG_RUNTIME_DIR"

i=./priority_queue.sv
fname=`basename $i`


apptainer exec --bind $i:/home/ubuntu/$fname $ASSASSYN_HOME/open_eda.sif \
    sc /home/ubuntu/$fname -target asap7_demo -design pq

cp ./build/pq/job0/syn/0/reports/stat.json ../../plot/reports/pq.json

