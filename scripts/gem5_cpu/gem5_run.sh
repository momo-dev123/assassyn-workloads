#!/bin/bash


docker run \
    -u $UID:$GID \
    -v "$(realpath ../../gem5)":/gem5 \
    -v "$(realpath ../../riscv-bmark)":/riscv-bmark \
    --rm -it \
    ghcr.io/gem5/ubuntu-22.04_all-dependencies:latest \
    bash -c "cd /riscv-bmark && ./simulate.sh"

