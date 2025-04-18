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
4. `bambu-0.9.7.AppImage`,`open_eda.sif`: Prerequisites package.

## Prerequisites

1. Anaconda: For language Python support.
2. Docker: For environment construction.


## Replicating the Results


1. Build the workload docker and warmup to update the cargo dependancy


            ```zsh
                    docker build  --build-arg UID=$(id -u)  --build-arg GID=$(id -g)  -t assassyn_workloads .

                    

2. Elaborate the CPU and run all the RISCV benchmarks.

a. Generate the Gem5 CPU 

- `gem5_cpu.py`: Simulate the benchmarks using gem5 and finally export the results to `/scripts/gem5_cpu/gem5_logs/gem5.csv`.

            ```zsh
                    cd ./scripts/gem5_cpu
                    bash ./gem5_run.sh
                    cd ../.. 

                    docker run -it --rm --privileged -v "$(pwd):/app" assassyn_workloads

                    cd ./scripts/gem5_cpu
                    python ./gem5_cpu.py
                    
                    exit
 

b. Generate the Sodor CPU datas
- `sodor_cpu.py`: Elaborate the Sodor CPU from chipyard, run each workload,simulate and finally export the results to `/scripts/sodor_cpu/sodor_logs/sodor.csv`.
                
            ```zsh
                    docker run -it --rm --privileged -v "$(pwd):/app" assassyn_workloads

                    sourse ./setup.sh
                    cd ./scripts/sodor_cpu
                    python ./sodor_cpu.py
                    
                    exit

c. Generate the Minor CPU datas
- `minor_cpu.py`: Elaborate the CPU written in our language, run each workload, simulate both simulator and verilog, and finally export the results to `/scripts/minor_cpu/minor_logs/minor.csv`.
- `cpu_test.py`: Elaborate different CPU versions, run each workload, get each cycles of them, and finally export the results to `/scripts/minor_cpu/minor_logs/cpu_all_version.csv`.
- `python ./assassyn-public/examples/minor-cpu/src/main.py vvadd`The first run will appear error because the cargo dependancy, and the second run will successfully pass.

            ```zsh
                    docker run -it --rm --privileged -v "$(pwd):/app" assassyn_workloads

                    sourse ./setup.sh

                    python ./assassyn-public/examples/minor-cpu/src/main.py vvadd

                    cd /tmp/minor_cpu
                    cargo build --release
                    cd /tmp/minor_cpu/minor_cpu_simulator
                    cargo build --release

                    cd /app
                    python ./assassyn-public/examples/minor-cpu/src/main.py vvadd

                    cd ./scripts/my_time
                    g++ time.cpp -o my_time
                    cd ../..
                    cd ./scripts/minor_cpu
                    python ./minor_cpu.py
                    python ./cpu_test.py
                    
                    exit

3. Elaborate the HLS Baselines and Assassyn and run the post synthesis.


- `machsuite_hls.py`: Elaborate the HLS Baseline, run each benchmarks, synthesize, and finally export the results to `/scripts/hls_baseline/machsuite_logs/hls_baseline.csv`.
- `base_report.py`: Post Synthesize all the baseline workloads, and gather the json format area result, export the results to `/plot/reports`.
                
            ```zsh
                    sourse ./setup.sh
                    cd ./scripts/hls_baseline
                    bash ./machsuite_run.sh
                    cd ../..        

                    docker run -it --rm --privileged -v "$(pwd):/app" assassyn_workloads
                    sourse ./setup.sh

                    cd ./scripts/hls_baseline
                    python ./machsuite_hls.py

                    exit

                    cd ./scripts/post_sythesis
                    python ./base_report.py
                    cd ../..
                    
                    



- `ass_hls.py`: Elaborate the HLS using Assassyn, run each benchmarks, synthesize, and finally export the results to `/scripts/hls_baseline/ass_hls_logs/ass_hls.csv`.
- `assassyn_report.py`: Post Synthesize all the assassyn workloads, and gather the json format area result, export the results to `/plot/reports`.
- `python ./assassyn-public/examples/minor-cpu/src/main.py vvadd`The first run will appear error because the cargo dependancy, and the second run will successfully pass.

            ```zsh
                    docker run -it --rm --privileged -v "$(pwd):/app" assassyn_workloads
                    sourse ./setup.sh

                    python ./assassyn-public/examples/minor-cpu/src/main.py vvadd

                    cd /tmp/minor_cpu
                    cargo build --release
                    cd /tmp/minor_cpu/minor_cpu_simulator
                    cargo build --release

                    cd /app
                    python ./assassyn-public/examples/minor-cpu/src/main.py vvadd

                    cd ./scripts/hls_assassyn
                    python ./ass_hls.py
                      
                    exit

                    cd ./scripts/post_sythesis
                    python ./assassyn_report.py
                    cd ../..
                    
                    




4. Re-build the csv files and plot the figures
- `csv_combine.py`: Rebuild the final csv file for use.
- `fig-x.py`: Run each script to plot the corresponding figure in the paper.

            ```zsh
                    docker run -it --rm --privileged -v "$(pwd):/app" assassyn_workloads
                    sourse ./setup.sh

                    cd ./scripts
                    python ./csv_combine.py
                    cd ../plot
                    python ./fig12.py
                    python ./fig13.py
                    python ./fig14.py
                    python ./fig15.py
                    python ./fig16.py
                    python ./fig17.py
                    
                    exit


