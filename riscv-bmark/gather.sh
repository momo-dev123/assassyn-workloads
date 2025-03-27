#!/bin/bash

files="vvadd median qsort rsort towers multiply"
STATS_DIR="./64"

for i in $files; do
    cycle=`grep "simTicks" "$STATS_DIR/$i.stats" | head -1 | awk '{print $2}'`
    ipc=`grep "system.cpu.ipc" "$STATS_DIR/$i.stats" | head -1 | awk '{print $2}'`
    echo $i,$cycle,$ipc
done
