import pandas
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import functools
import operator
import subprocess
import shutil
import os
import json

plt.style.use('bmh')
mpl.rcParams['lines.linewidth'] = 2.5

raw = pandas.read_csv('cpu-bmarks.csv')
gscale = plt.get_cmap('binary')

mcycle = raw['minor.cycle']
minsts = raw['minor.insts']

mcpi = (mcycle / minsts)

scycle = raw['sodor.cycle']
sinsts = raw['sodor.insts']

cpu_speedup = scycle / mcycle

raw = pandas.read_csv('HLS.csv')

bambu_cycle = pandas.to_numeric(raw['bambu.cycle'], errors='coerce').fillna(1000) # handle NA, need to change
assassyn_cycle = pandas.to_numeric(raw['assassyn.cycle'], errors='coerce').fillna(1000) # handle NA, need to change

hls_speedup = bambu_cycle / assassyn_cycle

def average(a):
    return sum(a) / len(a)

def appendavg(a):
    a = list(a)
    a.append(average(a))
    return a

def appendgmean(a):
    a = list(a)
    a.append(functools.reduce(operator.mul, a) ** (1/len(a)))
    return a

def load_area_safe(path):
    with open(path, 'r') as f:
        data = json.load(f)
        try:
            return data['design']['area']
        except KeyError:
            print(f"Missing ['design']['area'] in file: {path}")
            return None
        


cpu_speedup = appendgmean(cpu_speedup)[-1]

base_area = ['./reports/pq.json', 'reports/gemmini-pe.json', './reports/sodor.json', './reports/hls-kmp.v.json', './reports/hls-merge.v.json', './reports/hls-radix.v.json', './reports/hls-spmv.v.json', './reports/hls-stencil.v.json']
assy_area = ['./reports/priority_queue.sv.json', 'reports/out.pe.json', './reports/nocsr.sv.json', './reports/kmp.sv.json', './reports/merge_sort.sv.json', './reports/radix_sort.sv.json', './reports/spmv.sv.json', './reports/conv_sum.sv.json']
xlabels = ['pq', 'sys-pe', 'cpu', 'kmp', 'merge', 'radix', 'spmv', 'st-2d']


base_area = np.array([json.load(open(i, 'r'))['design']['area'] for i in base_area])
assy_area = np.array([json.load(open(i, 'r'))['design']['area'] for i in assy_area])

print(base_area)
print(assy_area)

norm_area = assy_area / base_area
speedup = np.array([1.0, 1.0 , cpu_speedup] + list(hls_speedup))
print(speedup)
print(norm_area)

grid = mpl.gridspec.GridSpec(1, 8)
fig = plt.figure()

def plot(ax, s, ylabel):

    data = (speedup / norm_area)[s]
    data = appendgmean(data)
    print(data[-1])

    ax.bar(np.arange(len(data)), data, width=0.75, color=gscale(0.5), edgecolor='white')
    ax.set_xticks(np.arange(len(data)) + 0.2)
    ax.set_xticklabels(xlabels[s] + ['gmean'], ha='right', fontsize=12, rotation=90)
    for i, j in enumerate(data):
        if j > 8:
            ax.text(i, 6, f'{j:.0f}', ha='center', va='bottom', fontsize=12, color='w')

    ax.xaxis.grid(False)
    ax.set_axisbelow(True)
    ax.set_yscale('log')
    ax.get_yaxis().set_major_formatter(mpl.ticker.ScalarFormatter())
    ax.set_ylim(0.5, 8)
    ax.set_yticks([0.5, 1, 2, 4, 8])
    if ylabel:
        ax.set_yticklabels(['2$^{%d}$' % (i - 1) for i in range(5)])
        ax.set_ylabel('Speedup/(Normalized Area)', fontsize=12)
    else:
        ax.set_yticklabels([''] * 5)
    ax.set_xlim(-0.5, len(data) - 0.5)

ax = fig.add_subplot(grid[0, 0:3])
plot(ax, slice(0, 3), True)
ax.set_title('Handcrafted')

ax = fig.add_subplot(grid[0,3:])
plot(ax, slice(3, 8), False)
ax.set_title('HLS-generated')

fig.subplots_adjust(top=0.64, bottom=0.2, left=0.12, right=0.6, wspace=0.2)
#ax.set_title('(b) Accelerator Perf.')
#ax.set_ylabel('Speedup o/ HLS', fontsize=12)
#ax.set_ylim(0, 3)
#
plt.show()

fname = __file__[:-3]
fig.savefig(f'{fname}.pdf')
subprocess.run(f'pdf-crop-margins -p4 1 1 1 1 {fname}.pdf', shell=True)
def mv(src, dst):
    if os.path.exists(dst):
        os.remove(dst)
    shutil.move(src, dst)
mv(f'{fname}_cropped.pdf', f'{fname}.pdf')
