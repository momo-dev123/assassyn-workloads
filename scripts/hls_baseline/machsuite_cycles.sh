#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="./machsuite_logs/${NAME}.cycle"

cycles=$(awk '/Average execution/ { for (i=1; i<=NF; i++) if ($i == "execution") print $(i+2) }' $FILE_PATH)

echo "$cycles"
