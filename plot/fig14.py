import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import functools
import operator
import subprocess
import shutil
import os
import json

cell = json.load(open('./cell.json'))

ylim = 1.13

manual = ['reports/pq.json', 'reports/gemmini-pe.json', './reports/sodor.json']
assassyn = ['reports/priority_queue.sv.json', 'reports/out.pe.json', 'reports/report-minor_cpu_br.sv.json']

def geomean(x):
    return functools.reduce(operator.mul, x) ** (1 / len(x))

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

manual = [breakdown(json.load(open(i, 'r'))) for i in manual]
assassyn = [breakdown(json.load(open(i, 'r'))) for i in assassyn]

assassyn[-1]['combinational'] -= delta['combinational']
assassyn[-1]['sequential'] -= delta['sequential']


plt.style.use('bmh')
mpl.rcParams['lines.linewidth'] = 2.5

fig = plt.figure()
gscale = plt.get_cmap('binary')

gs = mpl.gridspec.GridSpec(1, 9)

ax = fig.add_subplot(gs[0:3])

ax.set_title('Handcrafted')

def plot_bar(ax, xs, data, norm, bot, label, color, tc, hatch='', ec='w'):
    res = ax.bar(xs, data / norm, width=0.4, label=label, color=color, edgecolor=ec, bottom=bot / norm, hatch=hatch)
    y = data + bot
    y = y / norm
    for i in range(len(xs)):
        txt = '%.0f' % data[i]
        delta = len(txt) * 0.02
        color = tc
        if len(xs) == 6 and i == 3 and bot[i] != 0 and hatch != '':
            delta = -delta
            color = 'k'

        ax.text(xs[i], y[i] - delta,
                txt, ha='center', va='center', color=color, fontsize=9, rotation=90, fontweight='bold')
    return res

xs = np.arange(3)

m_comb = np.array([i['combinational'] for i in manual])
m_seq = np.array([i['sequential'] for i in manual])
norm = m_comb + m_seq

to_legend = []
to_legend += [plot_bar(ax, xs, m_comb, norm, np.zeros((len(xs), ), np.float32), 'Combinational', gscale(0.3), 'k', ec='w')]
to_legend += [plot_bar(ax, xs, m_seq, norm, m_comb, 'Sequential', gscale(0.5), 'w', ec='w')]

comb = np.array([i['combinational'] for i in assassyn])
seq = np.array([i['sequential'] for i in assassyn])

plot_bar(ax, xs + 0.45, comb, norm, np.zeros((len(xs), ), np.float32), 'Combinational', gscale(0.3), 'k', hatch='////')
plot_bar(ax, xs + 0.45, seq, norm, comb, 'Sequential', gscale(0.5), 'w', hatch='////', ec='k')

# ax.text(0.05, 1.02, 'Area diff < 1%', fontsize=10)

print(geomean((comb + seq) / norm))

ax.set_yticks(np.arange(0, ylim, 0.2))
ax.set_ylim(0, ylim)
ax.set_xlim(-0.225, len(manual) - 0.3)
ax.set_yticklabels([f'{i:.0%}' for i in np.arange(0, ylim, 0.2)], fontsize=12)
ax.set_xticks(xs + 0.225)
ax.set_xticklabels(['pri\nque', 'sys\npe', '5stg\ncpu'], fontsize=12)

#ax.set_xticks(xs)
ax.set_axisbelow(True)
ax.xaxis.grid(False)
#ax.set_title('Area Comparison ($\mu$m$^2$)')
ax.set_ylabel('Normalized Area\n(Abs. Value in $\mu$m$^2$ on it)', fontsize=12)
#ax.set_xlim(-0.5, len(assassyn_area) - 0.5)

ax.legend(to_legend, ['Seq.', 'Comb.'],#, 'Asyn-Seq.', 'Asyn-Comb.'],
          ncol=4, frameon=False, loc='upper left', bbox_to_anchor=(-0.1, 1.05),
          handlelength=1.2, columnspacing=0.5, handletextpad=0.5, fontsize=11)


ax = fig.add_subplot(gs[3:])

ax.set_title('HLS-generated')

hls = ['reports/hls-kmp.v.json',
       'reports/hls-merge.v.json',
       'reports/hls-radix.v.json',
       'reports/hls-spmv.v.json',
       'reports/hls-stencil.v.json',
       'reports/hls-fft.v.json']
assassyn = ['reports/kmp.sv.json',
            'reports/merge_sort.sv.json',
            'reports/radix_sort.sv.json',
            'reports/spmv.sv.json',
            'reports/conv_sum.sv.json',
            'reports/fft.sv.json']

hls = [breakdown(json.load(open(i, 'r'))) if i is not None else {'combinational': 0, 'sequential': 0} for i in hls]
assassyn = [breakdown(json.load(open(i, 'r'))) if i is not None else {'combinational': 0, 'sequential': 0} for i in assassyn]

xs = np.arange(6)

h_comb = np.array([i['combinational'] for i in hls])
h_seq = np.array([i['sequential'] for i in hls])
norm = h_comb + h_seq

plot_bar(ax, xs, h_comb, norm, np.zeros((len(xs), ), np.float32), 'Combinational', gscale(0.3), 'k')
plot_bar(ax, xs, h_seq, norm, h_comb, 'Sequential', gscale(0.5), 'w')

comb = np.array([i['combinational'] for i in assassyn])
seq = np.array([i['sequential'] for i in assassyn])
aimpl = []
aimpl += [plot_bar(ax, xs + 0.45, comb, norm, np.zeros((len(xs), ), np.float32), 'Combinational', gscale(0.3), 'k', hatch='////', )]
aimpl += [plot_bar(ax, xs + 0.45, seq, norm, comb, 'Sequential', gscale(0.5), 'w', hatch='////', ec='k', )]

ax.text(0.05, 1.02, 'Hatched is Assassyn-generated', fontsize=10)
print(geomean((comb + seq) / norm))
#norm[1] = comb[1] + seq[1]
#ax.bar(xs + 0.45, comb / norm, width=0.4, label='Combinational', color=gscale(0.3), edgecolor='white')
#ax.bar(xs + 0.45, seq / norm, width=0.4, label='Sequential', bottom=comb / norm, color=gscale(0.6), edgecolor='white')

ax.xaxis.grid(False)
ax.set_axisbelow(True)
ax.set_yticks(np.arange(0, ylim, 0.2))
ax.set_ylim(0, ylim)
ax.set_yticklabels(['' for i in np.arange(0, ylim, 0.2)], fontsize=12)
ax.set_xticks(xs + 0.225)
ax.set_xticklabels(['kmp', 'merge', 'radix', 'spmv', 'st-2d', 'fft'], fontsize=12, rotation=90)
ax.set_xlim(-0.225, len(hls) - 0.3)

to_legend = to_legend[::-1] + aimpl[::-1]
#ax.legend(to_legend, ['Seq.', 'Com.'],#, 'Asyn-Seq.', 'Asyn-Comb.'],
#          ncol=4, frameon=False, loc='upper right', bbox_to_anchor=(1, 1.05),
#          handlelength=1.2, columnspacing=0.5, handletextpad=0.5, fontsize=12)


#ax.set_ylim(0, max(max(assassyn_area_normalized), max(bambu_area_normalized)) * 1.2)
#
fig.subplots_adjust(top=0.85, bottom=0.35, left=0.25, right=0.9)
#
plt.show()
#
fname = __file__[:-3]
fig.savefig(f'{fname}.pdf')
#subprocess.run(f'pdf-crop-margins -p4 1 1 1 1 {fname}.pdf', shell=True)
#def mv(src, dst):
#    if os.path.exists(dst):
#        os.remove(dst)
#    shutil.move(src, dst)
#mv(f'{fname}_cropped.pdf', f'{fname}.pdf')
##
