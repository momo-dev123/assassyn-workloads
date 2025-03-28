import subprocess
import os
import shutil

#workloads=[ 
#    "kmp","stencil","spmv", 
#    "radix",
#    "fft"
#    ]
#dir = "../../MachSuite/verilogs/"
#
#for wl in workloads:
#    #run at minor_logs
#    file = dir + wl + ".v"
#    print(file)
#    subprocess.run(['./synthesize_hls.sh',file], capture_output=True, text=True)
#    shutil.move( f"../../plot/reports/report-{wl}.v.json", f"../../plot/reports/hls-{wl}.v.json")

print("gemini-mesh")
os.chdir("../../sv-source/gemini-mesh")
subprocess.run(['./synthesize.sh'], capture_output=True, text=True) 

#print("sodor-core")
#os.chdir("../sodor-core")
#subprocess.run(['./synthesize.sh'], capture_output=True, text=True) 
#
#
#print("hls-merge")
#os.chdir("../hls")
#subprocess.run(['./synthesize.sh',"./merge.v"], capture_output=True, text=True)
#shutil.copy("./hls-merge.v.json", "../../plot/reports/hls-merge.v.json")
#
#print("pq")
#os.chdir("../pq")
#subprocess.run(['./synthesize.sh'], capture_output=True, text=True)
