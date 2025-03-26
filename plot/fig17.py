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
fcycle = raw['fbp.cycles']
tcycle = raw['tbp.cycles']
o3cycle= raw['ooo-1.cycle']

gs = mpl.gridspec.GridSpec(1, 10, wspace=0.1, hspace=0.04)

fig = plt.figure()
axes = [fig.add_subplot(gs[0,0:6]),
fig.add_subplot(gs[0,7:10])]

def gmean(a):
    aa = [i for i in a if i != 0 and not np.isnan(i)]
    return functools.reduce(operator.mul, aa) ** (1.0 / len(aa))

def appendgmean(a):
    a = list(a)
    a.append(gmean(a))
    return np.array(a)

ax = axes[0]

data = [mcycle, fcycle, tcycle, o3cycle]


for i in range(4):
    ys = np.array(data[0]) / np.array(data[i])
    ys = appendgmean(ys)
    xs = np.arange(len(ys))
    print(ys[-1])
    for x, y in enumerate(ys):
        if y > 1.5:
            ax.text(x * 5 + i, y - 0.23, f'{y:.1f}', fontsize=8, ha='center', rotation=90, color='w', fontweight='bold')
    ax.bar(xs * 5 + i, ys,
           width=1, label=['base', 'bp.f', 'bp.t', 'ooo'][i], color=gscale(0.2 + i * 0.2), edgecolor='k')

#ax.text(5.5, 1.6, 'Lower CPI is better', fontsize=8)

wl = list(map(lambda x: x[:-4], raw['wl']))
ax.set_xticks(xs * 5 + 3)
ax.set_xticklabels(wl + ['g-mean'], rotation=90, ha='right', fontsize=12)

ax.xaxis.grid(False)
ax.set_axisbelow(True)
ax.legend(ncol=4, handlelength=1, columnspacing=0.5, handletextpad=0.25,
          fontsize=11, frameon=False, bbox_to_anchor=(0.23, 1.05), loc='upper left')

ax.set_xlim(-0.75, xs[-1] * 5 + 4.2)
ax.set_ylim(0, 1.5)
ax.set_yticks(np.arange(0, 1.51, 0.25))

fig.subplots_adjust(top=0.64, bottom=0.2, left=0.2, right=0.9, wspace=0.5)
ax.set_title('(a) CPU Performance')
ax.set_ylabel('Speedup o/ Base Design', fontsize=12)


ax = axes[1]


cell = json.load(open('./cell.json'))

def breakdown(raw):
    global cell
    res = {'combinational': 0, 'sequential': 0}
    for k, v in raw['design']['num_cells_by_type'].items():
        if k in cell:
            area = cell[k]['area'] * v
            res[cell[k]['type']] += area
    return res

nocsr = breakdown(json.load(open('reports/nocsr.sv.json')))
minor = breakdown(json.load(open('reports/minor_cpu.sv.json')))

delta = {
    'combinational': (minor['combinational'] - nocsr['combinational']),
    'sequential': (minor['sequential'] - nocsr['sequential'])
}


base = breakdown(json.load(open('reports/report-minor_cpu.sv.json')))
bp = breakdown(json.load(open('reports/report-minor_cpu_br.sv.json')))
o3 = breakdown(json.load(open('reports/report-o3_cpu.sv.json')))

data = [base, bp, o3]
for i in data:
    i['combinational'] -= delta['combinational']
    i['sequential'] -= delta['sequential']

comb = np.array([i['combinational'] for i in data])
seq = np.array([i['sequential'] for i in data])
print(comb)
print(seq)
norm = comb + seq
comb = comb 
seq = seq 
print(comb)
print(seq)

for i, v in enumerate(comb / norm):
    ax.text(i, v - 0.1, f'{comb[i]:.0f}', ha='center', va='bottom', fontsize=10, weight='bold')
    ax.text(i, v + 0.05, f'{seq[i]:.0f}', ha='center', va='bottom', fontsize=10, weight='bold')
ax.bar([0, 1, 2], seq / norm, width=0.75, label='seq', color=gscale(0.5), edgecolor='k', bottom=comb / norm)
ax.bar([0, 1, 2], comb / norm, width=0.75, label='comb', color=gscale(0.3), edgecolor='k')

ax.legend(ncol=1, handlelength=1, columnspacing=0.5, handletextpad=0.25,
          fontsize=11, frameon=False, loc='upper right', bbox_to_anchor=(1.48, 1))

delta = 0.2
ax.text(0 - delta, 0.05, '1.00x')
ax.text(1 - delta, 0.05, '%.2fx' % ((comb[1] + seq[1]) / norm[0]))
ax.text(2 - delta, 0.05, '%.2fx' % ((comb[2] + seq[2]) / norm[0]))

fig.subplots_adjust(top=0.64, bottom=0.2, left=0.12, right=0.91, wspace=0.05)
ax.set_title('(b) Area Breakdown')
ax.xaxis.grid(False)
ax.set_axisbelow(True)
ax.set_ylim(0, 1)
ax.set_yticks(np.arange(0, 5) * 0.25)
ax.set_xticks([0, 1, 2])
ax.set_xticklabels(['Base', 'Br. Pred', 'OoO'], fontsize=12, rotation=90)

plt.show()

fname = __file__[:-3]
fig.savefig(f'{fname}.pdf')
subprocess.run(f'pdf-crop-margins -p4 1 1 1 1 {fname}.pdf', shell=True)
def mv(src, dst):
    if os.path.exists(dst):
        os.remove(dst)
    shutil.move(src, dst)
mv(f'{fname}_cropped.pdf', f'{fname}.pdf')
