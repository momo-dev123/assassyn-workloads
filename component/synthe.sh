#!/bin/zsh

#(1, 0)
#(1, 2)
#(2, 0)
#(32, 0)
#(32, 1)
#(32, 2)
#(5, 0)
#(8, 0)
#(8, 2)
#(97, 1)

width=(1 1 2 32 32 32 5 8 8 97)
depth=(0 2 0 0 1 2 0 0 2 1)

for ((i=1; i<=${#width[@]}; i++))
do
    ./generator.py fifo ${width[$i]} ${depth[$i]}
done
