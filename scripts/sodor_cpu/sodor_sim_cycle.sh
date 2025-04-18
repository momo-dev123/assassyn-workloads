#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="./sodor_logs/${NAME}.out"


cycles=$(cat $FILE_PATH|tail -n1 | gawk '{print $6}')
echo $cycles

