#!/usr/bin/env bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LD_LIBRARY_PATH="/.singularity.d/libs"
export QT_QPA_PLATFORM="offscreen"
cd /home/gaod/derui_work/assassyn-workloads/sv-source/gemini-mesh/build/PE/job0/route/0
openroad \
    -exit \
    -metrics reports/metrics.json \
    /usr/local/lib/python3.10/dist-packages/siliconcompiler/tools/openroad/scripts/sc_apr.tcl
