#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 arg1 [arg2 ...]"
  exit 1
fi

NAME=$1

cp ../my_time/my_time /tmp/$NAME/${NAME}_simulator/

cd /tmp/$NAME 

cd ./${NAME}_simulator
cargo run --release --quiet > /dev/null 2>&1

TIME_OUTPUT=$( { ./my_time ./target/release/${NAME}_simulator; } 2>&1 | tee sim.log )

USER_TIME=$(grep 'Time taken:' sim.log | tail -n 1 | sed 's/[^0-9]*//g')

echo "$USER_TIME"

