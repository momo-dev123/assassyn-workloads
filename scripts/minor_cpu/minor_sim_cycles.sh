#!/usr/bin/env bash

cd /tmp/minor_cpu
cd ./minor_cpu_simulator

TIME_OUTPUT=$(cargo run --release)

last_line=$(echo "$TIME_OUTPUT" | tail -n 1)

cycle=$(echo "$last_line" | sed -nE 's/.*Cycle @([0-9.]+):.*/\1/p')

echo "$cycle"