#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="../../riscv-bmark/64/${NAME}.log"

tick=$(grep "Exiting @ tick" "$FILE_PATH" | sed -E 's/^Exiting @ tick ([0-9]+) .*/\1/')

echo "$tick"