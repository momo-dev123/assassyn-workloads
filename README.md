# Assassyn: ISCA 2025 Artifact Evaluation

## Folder Structure

1. `assassyn`: The repo of the assassyn language
2. Workloads & Evaluation:
    1. `riscv-benchmarks`: The workloads repo for the CPU evaluation
    2. `MachSuite`: The workloads for the HLS evaluation
    3. `components`: The scripts for the architectural component breakdown.
3. `plot`: The scripts for the figure ploting. Each `fig-x.py` is a script for the corresponding figure in the paper.

## Prerequisites

1. Anaconda: For language Python support, and the VM for synthesis.
2. Docker: For gem5 simulation.
3. Rust: For the assassyn backend elaboration.

## Replicating the Results

1. Elaborate the CPU and run all the RISCV benchmarks.
    - `minor_cpu.py`: Elaborate the CPU written in our language, run each workload, simulate both simulator and verilog, and finally export the results to `/scripts/minor_cpu/minor_logs/minor.csv`.
    - `cpu_test.py`: Elaborate different CPU versions, run each workload, get each cycles of them, and finally export the results to `/scripts/minor_cpu/minor_logs/cpu_all_version.csv`.

    cd ./scripts/my_time
    g++ time.cpp -o my_time
    cd ../..

    export VERILATOR_ROOT=(cd ./assassyn-public/verilator && pwd)
    cd ./scripts/minor_cpu
    sourse ../../../assassyn-public/setup.sh
    python ./minor_cpu.py
    python ./cpu_test.py
    cd ../..

    - `sodor_cpu.py`: Elaborate the Sodor CPU from chipyard, run each workload,simulate and finally export the results to `/scripts/sodor_cpu/sodor_logs/sodor.csv`.

    cd ./scripts/sodor_cpu
    python ./sodor_cpu.py
    cd ../..

    - `machsuite_hls.py`: Elaborate the HLS Baseline, run each benchmarks, synthesize, and finally export the results to `/scripts/hls_baseline/machsuite_logs/hls_baseline.csv`.

    cd ./scripts/hls_baseline
    python ./machsuite_hls.py
    cd ../..

    - `ass_hls.py`: Elaborate the HLS using Assassyn, run each benchmarks, synthesize, and finally export the results to `/scripts/hls_baseline/ass_hls_logs/ass_hls.csv`.

    cd ./scripts/hls_assassyn
    python ./ass_hls.py
    cd ../..


2. Post Synthesize.
    - `base_report.py`: Post Synthesize all the baseline workloads, and gather the json format area result, export the results to `yyyy.csv`.
    - `assassyn_report.py`: Post Synthesize all the assassyn workloads, and gather the json format area result, export the results to `yyyy.csv`.


3. Plot the figures.
    - `fig-x.py`: Run each script to plot the corresponding figure in the paper.
