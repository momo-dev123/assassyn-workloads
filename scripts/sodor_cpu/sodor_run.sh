#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

cd ../../chipyard

source ./env.sh

cd ./sims/verilator

LOGFILE="${NAME}_sodor.log"
OUTFILE_DIR="./output/chipyard.harness.TestHarness.Sodor5StageConfig/${NAME}.out"

make run-binary CONFIG=Sodor5StageConfig BINARY=../../generators/riscv-sodor/riscv-bmarks/${NAME}.riscv &> "$LOGFILE"

mv  ./${LOGFILE} ../../../scripts/sodor_cpu/sodor_logs/
mv $OUTFILE_DIR ../../../scripts/sodor_cpu/sodor_logs/

