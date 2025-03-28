#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="../../riscv-bmark/64/${NAME}.log"
user_time=$(awk '/^user/ { match($0, /([0-9]+)m([0-9.]+)s/, a); print a[2] }' "$FILE_PATH")

echo "$user_time"