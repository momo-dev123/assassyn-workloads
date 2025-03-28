#!/bin/bash

cd ../../MachSuite
verilator --version
#export PATH="../assassyn-public/verilator/bin:$PATH"
unset VERILATOR_ROOT


bash ./run.sh

new_names=("kmp"          "stencil"               "spmv"                "merge"           "radix"           "fft")

for ((i=0; i<${#new_names[@]}; i++))
do
echo $i
wl=${new_names[$i]}
echo $wl


mv ${wl}.cycle ../scripts/hls_baseline/machsuite_logs/
mv ${wl}.time ../scripts/hls_baseline/machsuite_logs/


done

