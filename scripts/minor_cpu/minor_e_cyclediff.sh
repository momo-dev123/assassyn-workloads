#!/usr/bin/bash

if [ "$#" -eq 0 ]; then
  
  exit 1
fi

NAME=$1

FILE_PATH="../../../assassyn-public/examples/minor-cpu/workloads/${NAME}.exe"
MY_DATA_PATH="./${NAME}.log"


grep -E "pc.*is_offset_br" "$MY_DATA_PATH" | sed 's/^.............//' > temp.txt
sed 's/.*\(@.*\)/\1/' temp.txt > temp2.txt
sed 's/|.*/|/' temp2.txt > pc_hook_e.txt

VAL1_LINE="$(
  grep -in "jal" "$FILE_PATH" \
  | grep -i "setStats" \
  | cut -d: -f1 \
  | sed -n 1p
)"


VAL2_LINE="$(
  grep -in "jal" "$FILE_PATH" \
  | grep -i "setStats" \
  | cut -d: -f1 \
  | sed -n 2p
)"



VAL1_LINE_HEX=$(printf "0x%08x" $(( (VAL1_LINE - 1) * 4 )))
VAL2_LINE_HEX=$(printf "0x%08x" $(( (VAL2_LINE - 1) * 4 )))



NUMBER_BEHIND_AT_1=$(
  grep "pc: $VAL1_LINE_HEX" "pc_hook_e.txt" \
  | sed -n 's/@\([0-9]*\)\..*/\1/p'
)



NUMBER_BEHIND_AT_2=$(
  grep "pc: $VAL2_LINE_HEX" "pc_hook_e.txt" \
  | sed -n 's/@\([0-9]*\)\..*/\1/p'
)



DIFF=$((NUMBER_BEHIND_AT_2 - NUMBER_BEHIND_AT_1 ))

ABS_DIFF=$(( DIFF < 0 ? -DIFF : DIFF ))

echo "$ABS_DIFF"  

sync