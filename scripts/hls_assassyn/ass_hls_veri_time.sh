#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 arg1 [arg2 ...]"
  exit 1
fi

NAME=$1


if [ "$NAME" = "merge_sort" ]; then
    {
        unset VERILATOR_ROOT
        cp -f ../../sv-source/merge-sort/merge_sort.sv /tmp/$NAME/${NAME}_verilog
        cd /tmp/$NAME
        cd ./${NAME}_verilog
        verilator --cc merge_sort.sv --exe main.cpp --top tb --timing --trace
        make -C obj_dir -f Vtb.mk
    } > /dev/null 2>&1
fi

cd /tmp/$NAME 

cd ./${NAME}_verilog


TIME_OUTPUT=$( { ../${NAME}_simulator/my_time ./obj_dir/Vtb; } 2>&1 | tee v.log )

USER_TIME=$(grep 'Time taken:' v.log | tail -n 1 | sed 's/[^0-9]*//g')


echo "$USER_TIME"