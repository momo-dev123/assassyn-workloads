#!/bin/bash

mkdir -p verilogs

workloads=("./kmp/kmp.c" "./stencil2d/stencil.c" "./ellpack/ellpack.c" "./merge/merge.c" "./radix/radix.c" "./fft/fft.c")
new_names=("kmp"          "stencil"               "spmv"                "merge"           "radix"           "fft")


for ((i=0; i<${#workloads[@]}; i++))
do
    wl=${workloads[$i]}
    dir=$(dirname "$wl")
    echo "$dir"

    fname=${new_names[$i]}

    ~/bambu-0.9.7.AppImage "$wl" ./common/harness.c \
        -I./common \
        --top-fname=main \
        --simulator=VERILATOR \
        --file-input-data="${dir}/input.data,${dir}/check.data" \
        --simulate -s \
        --top-rtldesign-name=run_benchmark \
        --no-iob --hls-div --benchmark-name="${fname}" \
        -DBAMBU_PROFILING -DNO_FINAL_MEMCMP_CHECK \
        2>&1 | tee "${fname}_bambu.log"

    tail -n 1 "${fname}_bambu.log" > "${fname}.cycle"

    { time ./simulate_main.sh; } 2> "${fname}.time"

    sed "s|\$readmem.*||g" main.v > synth.v

    cp synth.v "verilogs/${fname}.v"

    rm -rf ./HLS_output
    rm -f *.mem *.v *.xml
done

