import subprocess
import pandas as pd


workloads=["kmp","spmv","merge","radix","stencil"]
all_cycles = []
hls_kcycle_s = []
#at ./hls_baseline
#subprocess.run(["./machsuite_run.sh"],
#        stdout=subprocess.DEVNULL,
#        stderr=subprocess.DEVNULL)

# Iterate workloads
for wl in workloads:

    result = subprocess.run(["./machsuite_sim_time.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_time = float(output)
        print(wl,"  sim_time:", sim_time)
    except ValueError:
        print("Error: Output is not a valid integer:", output)

    result = subprocess.run(["./machsuite_cycles.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        cycles = int(output)
        print(wl,"  cycles:", cycles)
    except ValueError:
        print("Error: Output is not a valid integer:", output)
    
    
    all_cycles.append(cycles)
    kc_s = float(cycles/ ( sim_time * 1000 ) )
    print("kc_s:", kc_s)
    hls_kcycle_s.append(kc_s  )


data = {
    "workloads": workloads,  
    "bambu.cycle": all_cycles,
    "verilator.k/s": hls_kcycle_s,
}


print(data)

df = pd.DataFrame(data)
df.to_csv("./machsuite_logs/hls_baseline.csv", index=False)

print("CSV file 'hls_baseline.csv' has been created.")

