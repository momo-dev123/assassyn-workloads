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
gscale = plt.get_cmap('binary')
mpl.rcParams['lines.linewidth'] = 2.5

# conv_sum.sv
# counter: 2 #(8)
# fifos:
#       1 #(1, 2)
#       2 #(32, 2)
# kmp.sv
# counter: 2 #(8)
# fifos:
#       1 #(32, 2)
# merge_sort.sv
# counter: 3 #(8)
# fifos:
#       1 #(32, 2)
# minor_cpu.sv
# counter: 7 #(8)
# fifos:
#       1 #(2, 0)
#       6 #(32, 0)
#       1 #(32, 1)
#       2 #(5, 0)
#       1 #(97, 1)
# nocsr.sv
# counter: 7 #(8)
# fifos:
#       1 #(2, 0)
#       6 #(32, 0)
#       1 #(32, 1)
#       2 #(5, 0)
#       1 #(97, 1)
# priority_queue.sv
# counter: 6 #(2)
# fifos:
#       3 #(1, 0)
#       7 #(32, 0)
# radix_sort.sv
# counter: 3 #(8)
# fifos:
#       1 #(32, 1)
# spmv.sv
# counter: 5 #(8)
# fifos:
#       2 #(1, 2)
#       1 #(32, 2)
# systolic_array.sv
# counter: 97 #(8)
# fifos:
#     144 #(8, 0)
#      16 #(8, 2)

raw_breakdown = {
    'conv': {
        'fifo': [{'width': 1, 'depth': 2, 'cnt': 1}],
        'counter': {'width': 8, 'cnt': 2}
    },
    'kmp': {
        'fifo': [{'width': 32, 'depth': 0, 'cnt': 1}],
        'counter': {'width': 8, 'cnt': 2}
    },
    'merge_sort': {
        'fifo': [{'width': 32, 'depth': 2, 'cnt': 1}],
        'counter': {'width': 8, 'cnt': 3}
    },
    'minor_cpu': {
        'fifo': [
            {'width': 2, 'depth': 0, 'cnt': 1},
            {'width': 32, 'depth': 0, 'cnt': 6},
            {'width': 32, 'depth': 1, 'cnt': 1},
            {'width': 5, 'depth': 0, 'cnt': 2},
            {'width': 97, 'depth': 1, 'cnt': 1}
        ],
        'counter': {'width': 8, 'cnt': 7}
    },
    'nocsr': {
        'fifo': [
            {'width': 2, 'depth': 0, 'cnt': 1},
            {'width': 32, 'depth': 0, 'cnt': 6},
            {'width': 32, 'depth': 1, 'cnt': 1},
            {'width': 5, 'depth': 0, 'cnt': 2},
            {'width': 97, 'depth': 1, 'cnt': 1}
        ],
        'counter': {'width': 8, 'cnt': 7}
    },
    'priority_queue': {
        'fifo': [
            {'width': 1, 'depth': 0, 'cnt': 3},
            {'width': 32, 'depth': 0, 'cnt': 7}
        ],
        'counter': {'width': 2, 'cnt': 6}
    },
    'radix_sort': {
            'fifo': [{'width': 32, 'depth': 1, 'cnt': 1}],
        'counter': {'width': 8, 'cnt': 3}
    },
    'spmv': {
        'fifo': [
            {'width': 1, 'depth': 0, 'cnt': 2},
            {'width': 32, 'depth': 0, 'cnt': 1}
        ],
        'counter': {'width': 4, 'cnt': 5}
    },
    'systolic_array': {
        'fifo': [
            {'width': 8, 'depth': 0, 'cnt': 144},
            {'width': 8, 'depth': 2, 'cnt': 16}
        ],
        'counter': {'width': 8, 'cnt': 97}
    },
    'systolic_pe': {
        'fifo': [
            {'width': 8, 'depth': 0, 'cnt': 2},
            {'width': 32, 'depth': 0, 'cnt': 1}
        ],
        'counter': {'width': 2, 'cnt': 1}
    },
    'fft': {
        'fifo': [
            {'width': 1, 'depth': 0, 'cnt': 1},
            {'width': 32, 'depth': 0, 'cnt': 2},
        ],
        'counter': {'width': 2, 'cnt': 2}
    }
}


cell = json.load(open('./cell.json'))

def differentiate(raw):
    global cell
    res = {'combinational': 0, 'sequential': 0}
    for k, v in raw['design']['num_cells_by_type'].items():
        if k in cell:
            area = cell[k]['area'] * v
            res[cell[k]['type']] += area
    assert abs(raw['design']['area'] - (res['combinational'] + res['sequential'])) < 0.01
    return res

breakdown = {}
for k, v in raw_breakdown.items():
    breakdown[k] = {
        'fifo': { 'combinational': 0, 'sequential': 0 },
        'counter': { 'combinational': 0, 'sequential': 0 }
    }
    for fifo in v['fifo']:
        width = fifo['width']
        depth = fifo['depth']
        loaded = json.load(open('../component/fifo.%s.%s.json' % (width, depth), 'r'))
        loaded = differentiate(loaded)
        loaded['combinational'] *= fifo['cnt']
        loaded['sequential'] *= fifo['cnt']
        breakdown[k]['fifo']['combinational'] += loaded['combinational']
        breakdown[k]['fifo']['sequential'] += loaded['sequential']

    counter = v['counter']
    width = counter['width']
    loaded = json.load(open('../component/counter.%s.json' % width, 'r'))
    loaded = differentiate(loaded)
    loaded['combinational'] *= counter['cnt']
    loaded['sequential'] *= counter['cnt']
    breakdown[k]['counter']['combinational'] += loaded['combinational']
    breakdown[k]['counter']['sequential'] += loaded['sequential']

areas = {
  'priority_queue': './reports/priority_queue.sv.json',
  'systolic_pe': './reports/out.pe.json',
  'minor_cpu': './reports/nocsr.sv.json',
  'kmp': './reports/kmp.sv.json',
  'merge_sort': './reports/merge_sort.sv.json',
  'radix_sort': './reports/radix_sort.sv.json',
  'spmv': './reports/spmv.sv.json',
  'conv': './reports/conv_sum.sv.json',
  'fft': './reports/fft.sv.json'
}

y = []
fy = []
smy = []


for k, v in areas.items():
    loaded = json.load(open(v, 'r'))
    loaded = differentiate(loaded)
    total_area = loaded['combinational'] + loaded['sequential']
    fifo_area = breakdown[k]['fifo']['combinational'] + breakdown[k]['fifo']['sequential']
    counter_area = breakdown[k]['counter']['combinational'] + breakdown[k]['counter']['sequential']
    print(
        k,
        total_area,
        'fifo:', fifo_area, '%.2f' % (fifo_area / total_area * 100),
        'sm:', counter_area, '%.2f' % (counter_area / total_area * 100)
    )
    fy.append(breakdown[k]['fifo']['combinational'] / total_area + breakdown[k]['fifo']['sequential'] / total_area)
    smy.append(breakdown[k]['counter']['combinational'] / total_area + breakdown[k]['counter']['sequential'] / total_area)
    y.append((loaded['combinational']) / total_area + (loaded['sequential']) / total_area - fy[-1] - smy[-1])
    print(fy[-1], smy[-1], y[-1])


xs = np.arange(len(y))

fig, ax = plt.subplots()

to_legend = []
bot = np.zeros((len(xs), ))
for i, j in enumerate([smy, fy, y]):
    print(j)
    print(functools.reduce(operator.mul, j) ** (1.0 / len(j)))
    to_legend += [ax.bar(xs, j, color=gscale((i % 3) * 0.3 + 0.2), edgecolor='white', bottom=bot, hatch='//' if i >= 3 else None)]
    bot += j

ax.set_ylim(0, 1)
ax.set_xlim(-0.5, len(xs) - 0.5)

ax.set_yticks(np.arange(0, 1.01, 0.2))
ax.set_yticklabels(['%.0f%%' % (i * 100) for i in np.arange(0, 1.01, 0.2)], fontsize=12)
ax.set_xticks(xs)
ax.set_xticklabels(['pq', 'sys-pe', 'cpu', 'kmp', 'merge', 'radix', 'spmv', 'st-2d', 'fft'], fontsize=12, rotation=90)

ax.set_axisbelow(True)
ax.xaxis.grid(False)
ax.legend(to_legend[::-1], ['sm', 'fifo', 'func'][::-1],
          ncol=3,
          handlelength=1,
          fontsize=12,
          frameon=False,
          loc='upper center',
          bbox_to_anchor=(0.5, 1.15),
          handletextpad=0.5,
          columnspacing=0.5)
#ax.text(len(xs) + 0.1, 0.7, 'Sequen.', rotation=90, fontsize=12, ha='center')
#ax.text(len(xs) + 0.1, 0.37, 'Combin.', rotation=90, fontsize=12, ha='center')
#ax.set_title('Area Breakdown')

fig.subplots_adjust(top=0.8, bottom=0.4, left=0.25, right=0.55)

plt.show()
fname = __file__[:-3]
fig.savefig(f'{fname}.pdf')
#subprocess.run(f'pdf-crop-margins -p4 1 1 1 1 {fname}.pdf', shell=True)
#def mv(src, dst):
#    if os.path.exists(dst):
#        os.remove(dst)
#    shutil.move(src, dst)
#mv(f'{fname}_cropped.pdf', f'{fname}.pdf')
