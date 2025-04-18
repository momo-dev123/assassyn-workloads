import subprocess
import pandas as pd
import shutil
import os

workloads = [
    'median',
    'multiply',
    'qsort',
    'rsort',
    'towers',
    'vvadd',
]


o3_cycles = []

os.chdir("./minor_logs")
subprocess.run(['python', '../../../assassyn-public/examples/o3-cpu/src/main.py',"--all-workloads"], capture_output=True, text=True)
for wl in workloads:

    result = subprocess.run(["../minor_cycles_diff.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        abs_diff = int(output)
        print(wl,"  o3_cycles:", abs_diff)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    o3_cycles.append(abs_diff)


fbp_cycles = []

for wl in workloads:

    subprocess.run(['python', '../../../assassyn-public/examples/minor-cpu/src/fbp.py',wl], capture_output=True, text=True)

    result = subprocess.run(["../minor_e_cyclediff.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        abs_diff = int(output)
        print(wl,"  fbp_cycles:", abs_diff)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    fbp_cycles.append(abs_diff)

tbp_cycles = []
tbp_rate = []

for wl in workloads:

    subprocess.run(['python', '../../../assassyn-public/examples/minor-cpu/src/br_pre_main.py',wl], capture_output=True, text=True)
    
    result = subprocess.run(["../minor_e_cyclediff.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        abs_diff = int(output)
        print(wl,"  tbp_cycles:", abs_diff)
    except ValueError:
        print("Error: Output is not a valid integer:", output)


    result = subprocess.run(["../cpu_pre_rate.sh", wl], capture_output=True, text=True)
    output = result.stdout.strip()
    try:
        fail_rate = float(output)
        succ_rate =  1 - fail_rate
        print(wl,"  pre_success_rate:", succ_rate)
    except ValueError:
        print("Error: Output is not a valid float:", output)

    tbp_cycles.append(abs_diff)
    tbp_rate.append(succ_rate)



data = {
    "benchmarks": workloads,
    "ooo-1.cycle": o3_cycles,
    "fbp.cycle": fbp_cycles,
    "tbp.cycle": tbp_cycles,
    "tbp.rate": tbp_rate,
}


print(data)
df = pd.DataFrame(data)

df.to_csv("cpu_all_version.csv", index=False)

print("CSV file 'cpu_all_version.csv' has been created.")


wl = "minor_cpu"
subprocess.run(
    ['python', f"../../../assassyn-public/examples/minor-cpu/src/main.py"],
    stdout=subprocess.DEVNULL,
    stderr=subprocess.DEVNULL
)
source_file = "/tmp/" + wl + "/" + wl + "_verilog/" + wl + ".sv"
dest = "./" + wl + ".sv"
print("copying file from ", source_file, " to ", dest)
shutil.copy(source_file, dest)

wl = "minor_cpu_br"
subprocess.run(
    ['python', f"../../../assassyn-public/examples/minor-cpu/src/br_pre_main.py"],
    stdout=subprocess.DEVNULL,
    stderr=subprocess.DEVNULL
)
source_file = "/tmp/" + wl + "/" + wl + "_verilog/" + wl + ".sv"
dest = "./" + wl + ".sv"
print("copying file from ", source_file, " to ", dest)
shutil.copy(source_file, dest)


wl = "o3_cpu"
subprocess.run(
    ['python', f"../../../assassyn-public/examples/o3-cpu/src/main.py"],
    stdout=subprocess.DEVNULL,
    stderr=subprocess.DEVNULL
)
source_file = "/tmp/" + wl + "/" + wl + "_verilog/" + wl + ".sv"
dest = "./" + wl + ".sv"
print("copying file from ", source_file, " to ", dest)
shutil.copy(source_file, dest)
