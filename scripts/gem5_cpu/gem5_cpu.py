import subprocess
import pandas as pd


workloads = [
    'median',
    'multiply',
    'qsort',
    'rsort',
    'towers',
    'vvadd',
]

all_ipc = []
cycle_s = []


#at ./gem5_cpu
subprocess.run(["./gem5_run.sh"])

# Iterate workloads
for wl in workloads:

    result = subprocess.run(["./gem5_ipc.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        ipc = float(output)
        print(wl,"  ipc:", ipc)
    except ValueError:
        print("Error: Output is not a valid integer:", output)

    result = subprocess.run(["./gem5_cycle.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        cycle = int(output)
        print(wl,"  cycles:", cycle)
    except ValueError:
        print("Error: Output is not a valid integer:", output)
    
    result = subprocess.run(["./gem5_sim.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_time = float(output)
        print(wl,"  cycles:", sim_time)
    except ValueError:
        print("Error: Output is not a valid integer:", output)
    
    all_ipc.append(ipc)
    kc_s = float(cycle/ ( sim_time * 1000000 ) )
    cycle_s.append(kc_s  )





data = {
    "benchmarks": workloads,
    "gem5.ipc": all_ipc,
    "gem5.kcycle/s": cycle_s,

}


print(data)

df = pd.DataFrame(data)
df.to_csv("./gem5_logs/gem5.csv", index=False)

print("CSV file 'gem5.csv' has been created.")

