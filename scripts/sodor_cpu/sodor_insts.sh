#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="./sodor_logs/${NAME}_sodor.log"
minstret=$(grep '^minstret =' "$FILE_PATH" | gawk -F'= ' '{print $2}')

echo "$minstret"