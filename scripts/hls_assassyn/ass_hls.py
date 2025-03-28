import subprocess
import pandas as pd


workloads=[
    "kmp"
    ,"spmv"
    ,"merge_sort"           
    ,"radix_sort" 
    ,"conv_sum"          

    
    ]
dir = [
    "kmp/main.py"
    ,"spmv/spmv.py"
    ,"merge-sort/main.py"           
    ,"radix_sort/main.py"  
    ,"conv_sum/v2.py"         

    
]

ass_cycles = []
ass_sim_kcs = []
ass_veri_kcs = []


# Iterate workloads
for i in range(0, 5):
    wl = workloads[i]
    file = dir[i]
    # compile
    #at hls_ass
    subprocess.run(
        ['python', f"../../assassyn-public/examples/{file}"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )
    #sim

    result = subprocess.run(["./ass_hls_sim_time.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_time = float(output)/1000000
        print(wl,"  sim_time:", sim_time)
    except ValueError:
        print("Error: Output is not a valid float:", output)

    #cycles

    result = subprocess.run(["./ass_hls_cycles.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        sim_cycles = float(output)
        print(wl,"  sim_cycles:", sim_cycles)
    except ValueError:
        print("Error: Output is not a valid float:", output)  

    #verilator time

    result = subprocess.run(["./ass_hls_veri_time.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        v_time = float(output)
        print(wl,"  v_time:", v_time)
    except ValueError:
        print("Error: Output is not a valid float:", output)    

    #verilator cycles

    result = subprocess.run(["./ass_hls_veri_cycles.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        v_cycles = float(output)
        print(wl,"  v_cycles:", v_cycles)
    except ValueError:
        print("Error: Output is not a valid float:", output)


    ass_cycles.append(int(sim_cycles))
    print("ass_sim_kcs:", sim_cycles/(1000*sim_time))
    ass_sim_kcs.append(sim_cycles/(1000*sim_time))
    print("ass_veri_kcs:",  sim_cycles/(1000*v_time))
    ass_veri_kcs.append(sim_cycles/(1000*v_time))






data = {
    "workloads": workloads,
    "assassyn.cycle": ass_cycles,
    "assassyn.k/s": ass_sim_kcs,   
    "av.k/s": ass_veri_kcs,

}

print(data)

df = pd.DataFrame(data)
df.to_csv("./ass_hls_logs/ass_hls.csv", index=False)

print("CSV file 'ass_hls.csv' has been created.")

