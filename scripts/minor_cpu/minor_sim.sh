#!/usr/bin/env bash

cd /tmp/minor_cpu
cd ./minor_cpu_simulator

TIME_OUTPUT=$( { time -p cargo run --release; } 2>&1 )

USER_TIME=$(echo "$TIME_OUTPUT" | awk '/^user/ {print $2}')

echo "$USER_TIME"

