#!/bin/bash

files="vvadd median qsort rsort towers multiply"

for i in $files; do
    echo Simulating $i...
    build/RISCV/gem5.opt configs/learning_gem5/part1/simple-riscv.py ../bmarks/64/$i.riscv
    mv m5out/stats.txt ../bmarks/64/$i.stats
done
