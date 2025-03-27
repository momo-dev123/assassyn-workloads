#!/usr/bin/env bash

cd /tmp/minor_cpu
cd ./minor_cpu_verilog

last_val=$(./obj_dir/Vtb | tail -n 1 | awk '{print $1}')

echo "$last_val"