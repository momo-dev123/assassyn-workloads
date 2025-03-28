#!/bin/bash

files="vvadd median qsort rsort towers multiply"


for i in $files; do
    echo Simulating $i...
    {  time ../gem5/build/RISCV/gem5.opt --outdir=../gem5/m5out/ ./gem5-simple.py ./64/$i.riscv ;}  > ./64/$i.log 2>&1
    mv ../gem5/m5out/stats.txt ./64/$i.stats
done
