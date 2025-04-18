#!/usr/bin/env bash

cd /tmp/minor_cpu
cd ./minor_cpu_verilog

TIME_OUTPUT=$( { time -p ./obj_dir/Vtb > /dev/null; } 2>&1 )

USER_TIME=$(echo "$TIME_OUTPUT" | gawk '/^user/ {print $2}')
SYS_TIME=$(echo "$TIME_OUTPUT" | gawk '/^sys/ {print $2}')
REAL_TIME=$(echo "$TIME_OUTPUT" | gawk '/^real/ {print $2}')

echo "$USER_TIME"
