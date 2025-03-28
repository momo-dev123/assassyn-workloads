# Assassyn: ISCA 2025 Artifact Evaluation

## Folder Structure

1. `assassyn-public`: The repo of the assassyn language
2. Workloads & Evaluation:
    1. `riscv-bmark`: The workloads repo for the CPU evaluation
    2. `MachSuite`: The workloads for the HLS evaluation
    3. `components`: The scripts for the architectural component breakdown.
    4. `gem5`: The simulator to be compared with.
    5. `sv-source`: Some special verilog source for post-synthesis while some of those original design are very difficult to be synthesized.
    6. `scripts`: Automation scripts for generating and summarizing of experiment data.
        1. `gem5_cpu`: Scripts about using gem5.
        2. `hls_assassyn`: Scripts about using assassyn for hls benchmarks.
        3. `hls_baseline`: Scripts about using verilator and Bambu for the hls benchmarks baseline.
        4. `minor_cpu`: Scripts about simulating assassyn minor cpu with different version.
        5. `sodor_cpu`: Scripts about simulating 5 pipeline sodor core of chipyard.
        6. `post_synthesis`: Scripts about post synthesis.
        7. `my_time`: Scripts for generating preciser timer.
3. `plot`: The scripts for the figure ploting. Each `fig-x.py` is a script for the corresponding figure in the paper.

## Prerequisites

1. Anaconda: For language Python support, and the VM for synthesis.
2. Docker: For gem5 simulation.
3. Rust: For the assassyn backend elaboration.

## Replicating the Results

1. Elaborate the CPU and run all the RISCV benchmarks.
    - `minor_cpu.py`: Elaborate the CPU written in our language, run each workload, simulate both simulator and verilog, and finally export the results to `/scripts/minor_cpu/minor_logs/minor.csv`.
    - `cpu_test.py`: Elaborate different CPU versions, run each workload, get each cycles of them, and finally export the results to `/scripts/minor_cpu/minor_logs/cpu_all_version.csv`.

            ```bash
                    sourse ./assassyn-public/setup.sh
                    export VERILATOR_ROOT=$(cd ./assassyn-public/verilator && pwd)
                    export PATH="$VERILATOR_ROOT/bin:$PATH"
                    cd ./scripts/my_time
                    g++ time.cpp -o my_time
                    cd ../..
                    cd ./scripts/minor_cpu
                    python ./minor_cpu.py
                    python ./cpu_test.py
                    cd ../..
                


    - `sodor_cpu.py`: Elaborate the Sodor CPU from chipyard, run each workload,simulate and finally export the results to `/scripts/sodor_cpu/sodor_logs/sodor.csv`.
                
            ```bash
                    cd ./scripts/sodor_cpu
                    python ./sodor_cpu.py
                    cd ../..
                

    - `machsuite_hls.py`: Elaborate the HLS Baseline, run each benchmarks, synthesize, and finally export the results to `/scripts/hls_baseline/machsuite_logs/hls_baseline.csv`.
                
            ```bash
                    cd ./scripts/hls_baseline
                    python ./machsuite_hls.py
                    cd ../..
                
    - `ass_hls.py`: Elaborate the HLS using Assassyn, run each benchmarks, synthesize, and finally export the results to `/scripts/hls_baseline/ass_hls_logs/ass_hls.csv`.
                
            ```bash
                    cd ./scripts/hls_assassyn
                    python ./ass_hls.py
                    cd ../..

    - `csv_combine.py`: Combine distributed data together `/plot/HLS.csv`,`/plot/cpu-bmarks.csv`.
                
            ```bash
                    cd ./scripts/gem5_cpu
                    python ./gem5_cpu.py
                    cd ../..   

    - `gem5_cpu.py`: Simulate the benchmarks using gem5 and finally export the results to `/scripts/gem5_cpu/gem5_logs/gem5.csv`.                

2. Post Synthesize.
    - `base_report.py`: Post Synthesize all the baseline workloads, and gather the json format area result, export the results to `/plot/reports`.


    - `assassyn_report.py`: Post Synthesize all the assassyn workloads, and gather the json format area result, export the results to `/plot/reports`.

3. Plot the figures.
    - `fig-x.py`: Run each script to plot the corresponding figure in the paper.
