#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="./sodor_logs/${NAME}_sodor.log"


walltime=$(grep 'walltime' $FILE_PATH | sed -nE 's/.*walltime ([0-9.]+) s.*/\1/p')
echo "$walltime"


