#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 arg1 [arg2 ...]"
  exit 1
fi

NAME=$1

cd /tmp/$NAME 

cd ./${NAME}_simulator
cycle=$(awk '/finish/ { match($0, /Cycle @([0-9.]+):/, a); print a[1] }' sim.log)

echo "$cycle"

