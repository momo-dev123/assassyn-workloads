#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="./sodor_logs/${NAME}_sodor.log"
mcycle=$(grep '^mcycle =' "$FILE_PATH" | awk -F'= ' '{print $2}')

echo "$mcycle"