#!/usr/bin/bash

if [ "$#" -eq 0 ]; then
  
  exit 1
fi

NAME=$1

MY_DATA_PATH="./${NAME}.log"

Fail_COUNT=$(grep '\[e\][[:space:]]*pre_failed:[[:space:]]*1' "$MY_DATA_PATH" | wc -l)


Pre_COUNT=$(grep '\[F1\][[:space:]]*state:[[:space:]]*1' "$MY_DATA_PATH" | wc -l)


result=$(gawk "BEGIN { printf \"%.4f\", ($Fail_COUNT + 1) / ($Pre_COUNT + 1) }")
echo "$result"

