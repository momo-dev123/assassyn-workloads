#!/bin/bash

files="vvadd median qsort rsort towers multiply"

for i in $files; do
    echo Compiling $i...

    riscv64-unknown-elf-gcc ${i}/${i}_main.c \
       -I./common -O3 -o ./64/${i}.riscv \
       ./common/m5op.S -I./$i
    # riscv64-unknown-linux-gnu-gcc ${i}/${i}_main.c \
    #     -I./common -O3 -o ../riscv-bmarks/64/${i}.riscv \
    #     ./common/m5op.S -I./$i -march=rv64iafd -static
done
