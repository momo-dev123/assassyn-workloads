#!/bin/bash

if [ "$#" -eq 0 ]; then
  exit 1
fi

NAME=$1

FILE_PATH="./machsuite_logs/${NAME}.time"

user_time=$(awk '/^user/ { match($0, /([0-9]+\.[0-9]+)s/, a); print a[1] }' "$FILE_PATH")

echo "$user_time"