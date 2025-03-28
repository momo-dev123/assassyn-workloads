import subprocess
import pandas as pd
import os

workloads = [
    'median',
    'multiply',
    'qsort',
    'rsort',
    'towers',
    'vvadd',
]

benchmarks = []
minor_cycles = []
minor_sim_kcs = []
minor_vtb_kcs = []
minor_insts = []


os.chdir("./minor_logs")
for wl in workloads:
    #run at minor_logs
    subprocess.run(['python', '../../../assassyn-public/examples/minor-cpu/src/main.py',wl], capture_output=True, text=True)
    


    result = subprocess.run(["../minor_cycles_diff.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        abs_diff = int(output)
        print(wl,"  cycles:", abs_diff)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    result = subprocess.run(["../minor_insts.sh", wl],check=True, capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        insts = int(output)
        print(wl,"  insts:", insts)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    result = subprocess.run(["../minor_sim.sh"], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_time = float(output)
        print(wl,"  sim_time:", sim_time)
    except ValueError:
        print("Error: Output is not a valid float:", output)


    result = subprocess.run(["../minor_vtb.sh"], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        vtb_time = float(output)
        print(wl,"  vtb_time:", vtb_time)
    except ValueError:
        print("Error: Output is not a valid float:", output)


    result = subprocess.run(["../minor_sim_cycles.sh"], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_cycles = float(output)
        print(wl,"  sim_cycles:", sim_cycles)
    except ValueError:
        print("Error: Output is not a valid float:", output)


    result = subprocess.run(["../minor_vtb_cycles.sh"], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        vtb_cycles = float(output)
        print(wl,"  vtb_time:", vtb_cycles)
    except ValueError:
        print("Error: Output is not a valid float:", output)


    # Append data to lists
    benchmarks.append(wl)
    minor_cycles.append(abs_diff)
    minor_insts.append(insts)

    minor_sim_kcs.append(sim_cycles/(1000*sim_time))
    print("minor_sim_kcs:", sim_cycles/(1000*sim_time))
    minor_vtb_kcs.append(vtb_cycles/(100000*vtb_time))
    print("minor_vtb_kcs:", vtb_cycles/(100000*vtb_time))




# Create the final data dictionary
data = {
    "benchmarks": benchmarks,
    "minor.cycle": minor_cycles,
    "minor.insts": minor_insts,
    "minor.kcycle/s": minor_sim_kcs,
    "minor.v.kcycle/s": minor_vtb_kcs,
}

# For example, print the data structure:
print(data)


df = pd.DataFrame(data)
df.to_csv("minor.csv", index=False)

print("CSV file 'minor.csv' has been created.")
