#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 arg1 [arg2 ...]"
  exit 1
fi

NAME=$1

cd /tmp/$NAME 

cd ./${NAME}_verilog

if [ "$NAME" = "merge_sort" ]; then
  cycle="1"
else 
  cycle=$(awk '/finish/ { if (match($0, /^[[:space:]]*([0-9]+)/, a)) print a[1] }' v.log | head -n 1)
fi

echo "$cycle"
