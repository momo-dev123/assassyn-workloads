#!/bin/bash


# Check if at least one argument was provided
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 arg1 [arg2 ...]"
  exit 1
fi

# Access the first argument


# The name you want to use (e.g., "multiply")
NAME=$1

# Construct file paths from that name
FILE_PATH="../../../assassyn-public/examples/minor-cpu/workloads/${NAME}.exe"
MY_DATA_PATH="./${NAME}.log"


# Extract just the first match
VAL1="$(
  grep -i "jal" "$FILE_PATH" \
  | grep -i "setStats" \
  | gawk '{print $1}' \
  | sed -n 1p
)"

# Extract the second match
VAL2="$(
  grep -i "jal" "$FILE_PATH" \
  | grep -i "setStats" \
  | gawk '{print $1}' \
  | sed -n 2p
)"

 

LINE1=$(grep -n "raw: 0x${VAL1}" pc_hook_d.txt | head -n1 | cut -d: -f1)
LINE2=$(grep -n "raw: 0x${VAL2}" pc_hook_d.txt | head -n1 | cut -d: -f1)

DIFF=$((LINE2 - LINE1))
ABS_DIFF=$(( DIFF < 0 ? -DIFF : DIFF ))
INSTS=$((ABS_DIFF + 1))

echo "$INSTS"  

rm temp.txt temp2.txt pc_hook_d.txt