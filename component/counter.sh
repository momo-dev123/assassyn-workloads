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

width=(2 4 8)

for ((i=1; i<=${#width[@]}; i++))
do
    ./generator.py counter ${width[$i]}
done
