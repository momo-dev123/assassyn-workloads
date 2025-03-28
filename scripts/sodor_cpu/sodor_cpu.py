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

benchmarks = []
sodor_cycles = []
sodor_insts = []
sodor_sim_kcs = []



# Iterate workloads
for wl in workloads:
    #at /sodor_cpu
    subprocess.run(["./sodor_run.sh", wl])


    result = subprocess.run(["./sodor_cycle.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        cycles = int(output)
        print(wl,"  cycles:", cycles)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    result = subprocess.run(["./sodor_insts.sh", wl],check=True, capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        insts = int(output)
        print(wl,"  insts:", insts)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    result = subprocess.run(["./sodor_sim_time.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_time = float(output)
        print(wl,"  sim_time:", sim_time)
    except ValueError:
        print("Error: Output is not a valid float:", output)


    result = subprocess.run(["./sodor_sim_cycle.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_cycles = int(output)
        print(wl,"  sim_cycles:", sim_cycles)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    benchmarks.append(wl)
    sodor_cycles.append(cycles)
    sodor_insts.append(insts)

    sodor_sim_kcs.append(sim_cycles/(sim_time*1000))
    print("sodor_sim_kcs:", sim_cycles/(sim_time*1000))





# Create the final data dictionary
data = {
    "benchmarks": benchmarks,
    "sodor.cycle": sodor_cycles,
    "sodor.insts": sodor_insts,
    "sodor.kcycle/s": sodor_sim_kcs,
}


print(data)

df = pd.DataFrame(data)
df.to_csv("./sodor_logs/sodor.csv", index=False)

print("CSV file 'sodor.csv' has been created.")
