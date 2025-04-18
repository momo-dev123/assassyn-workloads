import subprocess
import shutil
import os

workloads=[
    "kmp"
    ,"spmv"
    ,"merge_sort"           
    ,"radix_sort"           
    ,"conv_sum"
    ]

hls_dir = "../hls_assassyn/ass_hls_logs/"

for wl in workloads:
    #run at minor_logs
    file = hls_dir + wl + ".sv"
    print(file)
    subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
   

print("systolic-pe")
os.chdir("../../sv-source/systolic-pe")
subprocess.run(['./synthesize.sh'], capture_output=True, text=True) 

shutil.move( "../../plot/reports/report-kmp.sv.json", "../../plot/reports/kmp.sv.json")
shutil.move( "../../plot/reports/report-spmv.sv.json", "../../plot/reports/spmv.sv.json")
shutil.move( "../../plot/reports/report-merge_sort.sv.json", "../../plot/reports/merge_sort.sv.json")
shutil.move( "../../plot/reports/report-radix_sort.sv.json", "../../plot/reports/radix_sort.sv.json")
shutil.move( "../../plot/reports/report-conv_sum.sv.json", "../../plot/reports/conv_sum.sv.json")


os.chdir("../../scripts/post_sythesis")
cpu_dir = "../minor_cpu/minor_logs/"


wl = "minor_cpu"
file = cpu_dir + wl + ".sv"
print(file)
subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
shutil.move( "../../plot/reports/report-minor_cpu.sv.json", "../../plot/reports/minor_cpu.sv.json")

wl = "minor_cpu_br"
file = cpu_dir + wl + ".sv"
print(file)
subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
shutil.move( "../../plot/reports/report-minor_cpu_br.sv.json", "../../plot/reports/report-minor_cpu_br.sv.json")


wl = "o3_cpu"
file = cpu_dir + wl + ".sv"
print(file)
subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
shutil.move( "../../plot/reports/report-o3_cpu.sv.json", "../../plot/reports/report-o3_cpu.sv.json")

