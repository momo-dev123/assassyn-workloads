#!/usr/bin/env bash

cd /tmp/minor_cpu
cd ./minor_cpu_verilog

TIME_OUTPUT=$( { time -p ./obj_dir/Vtb > /dev/null; } 2>&1 )

USER_TIME=$(echo "$TIME_OUTPUT" | awk '/^user/ {print $2}')
SYS_TIME=$(echo "$TIME_OUTPUT" | awk '/^sys/ {print $2}')
REAL_TIME=$(echo "$TIME_OUTPUT" | awk '/^real/ {print $2}')

echo "$USER_TIME"
