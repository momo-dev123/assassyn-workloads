#!/usr/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime_$USER
mkdir -p "$XDG_RUNTIME_DIR"

fname=`basename $1`

sed -i "s/.*readmem.*//g" $1 -i

apptainer exec --bind $1:/home/ubuntu/$fname $WORKLOAD_HOME/open_eda.sif \
    sc /home/ubuntu/$fname -target asap7_demo -design top \
    -define SYNTHESIS=1

cp ./build/top/job0/syn/0/reports/stat.json ../../plot/reports/report-$fname.json
mv ./build/top ./build/$fname
