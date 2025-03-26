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
    - `CPU.sh`: Elaborate the CPU, run each workload, synthesize, and finally export the results to `xxxx.csv`.
2. Synthesize and simulate all the HLS workloads.
    - `HLS.sh`: Synthesize all the C workloads, and gather the result, export the results to `yyyy.csv`.
3. Plot the figures.
    - `fig-x.py`: Run each script to plot the corresponding figure in the paper.
