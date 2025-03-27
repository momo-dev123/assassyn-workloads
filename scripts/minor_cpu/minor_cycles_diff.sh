#!/bin/bash


# Check if at least one argument was provided
if [ "$#" -eq 0 ]; then
  
  exit 1
fi

# Access the first argument


# The name you want to use (e.g., "multiply")
NAME=$1


# Construct file paths from that name
FILE_PATH="../../../assassyn-public/examples/minor-cpu/workloads/${NAME}.exe"
MY_DATA_PATH="./${NAME}.log"


grep -E "raw.*addr" "$MY_DATA_PATH" | sed 's/^.............//' > temp.txt
sed 's/.*\(@.*\)/\1/' temp.txt > temp2.txt
sed 's/. | addr/ | addr/' temp2.txt > pc_hook_d.txt


# Extract just the first match
VAL1="$(
  grep -i "jal" "$FILE_PATH" \
  | grep -i "setStats" \
  | awk '{print $1}' \
  | sed -n 1p
)"

# Extract the second match
VAL2="$(
  grep -i "jal" "$FILE_PATH" \
  | grep -i "setStats" \
  | awk '{print $1}' \
  | sed -n 2p
)"

NUMBER_BEHIND_AT_1="$(
  grep "raw: 0x${VAL1}" pc_hook_d.txt \
  | awk -F'[@:]' '{ print $2 }' \
  | sed 's/\..*//'
)"


NUMBER_BEHIND_AT_2="$(
  grep "raw: 0x${VAL2}" pc_hook_d.txt \
  | awk -F'[@:]' '{ print $2 }' \
  | sed 's/\..*//'
)"


# Now subtract:
DIFF=$((NUMBER_BEHIND_AT_1 - NUMBER_BEHIND_AT_2 ))

ABS_DIFF=$(( DIFF < 0 ? -DIFF : DIFF ))

echo "$ABS_DIFF"  

sync
