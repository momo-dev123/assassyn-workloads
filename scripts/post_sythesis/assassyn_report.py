import subprocess
import shutil
import os

#workloads=[
#    "kmp"
#    ,"spmv"
#    ,"merge_sort"           
#    ,"radix_sort"           
#    ,"fft"
#    ,"conv_sum"
#    ]
#
dir = "/tmp/"

#for wl in workloads:
#    #run at minor_logs
#    file = dir + wl + "/" + wl + "_verilog/" + wl + ".sv"
#    print(file)
#    subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
   
#subprocess.run(
#    ['python', f"../../assassyn-public/examples/minor-cpu/src/nocsr.py"],
#    stdout=subprocess.DEVNULL,
#    stderr=subprocess.DEVNULL
#)
#wl = "minor_cpu"
#file = dir + wl + "/" + wl + "_verilog/" + wl + ".sv"
#print(file)
#subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
#shutil.move( "../../plot/reports/report-minor_cpu.sv.json", "../../plot/reports/nocsr.sv.json")
#print("priority-queue")
#subprocess.run(
#    ['python', f"../../assassyn-public/examples/priority-queue/main.py"],
#    stdout=subprocess.DEVNULL,
#    stderr=subprocess.DEVNULL
#)
#wl = "priority_queue"
#file = dir + wl + "/" + wl + "_verilog/" + wl + ".sv"
#print(file)
#subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
#shutil.move( "../../plot/reports/report-priority_queue.sv.json", "../../plot/reports/priority_queue.sv.json")
#
#print("systolic-pe")
#os.chdir("../../sv-source/systolic-pe")
#subprocess.run(['./synthesize.sh'], capture_output=True, text=True) 
#
#shutil.move( "../../plot/reports/report-kmp.sv.json", "../../plot/reports/kmp.sv.json")
#shutil.move( "../../plot/reports/report-spmv.sv.json", "../../plot/reports/spmv.sv.json")
#shutil.move( "../../plot/reports/report-merge_sort.sv.json", "../../plot/reports/merge_sort.sv.json")
#shutil.move( "../../plot/reports/report-radix_sort.sv.json", "../../plot/reports/radix_sort.sv.json")
#shutil.move( "../../plot/reports/report-conv_sum.sv.json", "../../plot/reports/conv_sum.sv.json")
#shutil.move( "../../plot/reports/report-fft.sv.json", "../../plot/reports/fft.sv.json")

   
#subprocess.run(
#    ['python', f"../../assassyn-public/examples/minor-cpu/src/main.py"],
#    stdout=subprocess.DEVNULL,
#    stderr=subprocess.DEVNULL
#)
#wl = "minor_cpu"
#file = dir + wl + "/" + wl + "_verilog/" + wl + ".sv"
#print(file)
#subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
#shutil.move( "../../plot/reports/report-minor_cpu.sv.json", "../../plot/reports/minor_cpu.sv.json")

#subprocess.run(
#    ['python', f"../../assassyn-public/examples/minor-cpu/src/br_pre_main.py"],
#    stdout=subprocess.DEVNULL,
#    stderr=subprocess.DEVNULL
#)
#wl = "minor_cpu_br"
#file = dir + wl + "/" + wl + "_verilog/" + wl + ".sv"
#print(file)
#subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
#shutil.move( "../../plot/reports/report-minor_cpu_br.sv.json", "../../plot/reports/report-minor_cpu_br.sv.json")


subprocess.run(
    ['python', f"../../assassyn-public/examples/o3-cpu/src/main.py"],
    stdout=subprocess.DEVNULL,
    stderr=subprocess.DEVNULL
)
wl = "o3_cpu"
file = dir + wl + "/" + wl + "_verilog/" + wl + ".sv"
print(file)
subprocess.run(['./synthesize.sh',file], capture_output=True, text=True)
shutil.move( "../../plot/reports/report-o3_cpu.sv.json", "../../plot/reports/report-o3_cpu.sv.json")

