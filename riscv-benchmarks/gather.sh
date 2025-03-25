#!/bin/bash

files="vvadd median qsort rsort towers multiply"

for i in $files; do
    cycle=`grep "simTicks" $i.stats | head -1 | awk '{print $2}'`
    ipc=`grep "system.cpu.ipc" $i.stats | head -1 | awk '{print $2}'`
    echo $i,$cycle,$ipc
done
