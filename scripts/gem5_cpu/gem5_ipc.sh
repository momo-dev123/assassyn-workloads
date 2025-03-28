#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="../../riscv-bmark/64/${NAME}.stats"

ipc=$(awk '$1 == "system.cpu.ipc" { print $2; exit }' $FILE_PATH)
echo "$ipc"

