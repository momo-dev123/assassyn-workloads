#!/bin/bash

files="vvadd median qsort rsort towers multiply"

for i in $files; do
    echo Simulating $i...
    build/RISCV/gem5.opt ../riscv-bmark/gem5-simple.py ../riscv-bmark/64/$i.riscv
    mv m5out/stats.txt ../riscv-bmark/64/$i.stats
done
