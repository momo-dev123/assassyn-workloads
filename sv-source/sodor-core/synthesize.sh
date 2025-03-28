#!/usr/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime_$USER
mkdir -p "$XDG_RUNTIME_DIR"

#bind=`ls *.sv | awk '{ print "--bind " $1":/home/ubuntu/"$1 }'`
#files=`ls *.sv | awk '{ print "/home/ubuntu/"$1 }'`
bind=`ls Core.sv | awk '{ print "--bind " $1":/home/ubuntu/"$1 }'`
files=`ls Core.sv | awk '{ print "/home/ubuntu/"$1 }'`

apptainer exec $bind $HOME/open_eda.sif \
    sc $files -target asap7_demo -define SYNTHESIS=1
