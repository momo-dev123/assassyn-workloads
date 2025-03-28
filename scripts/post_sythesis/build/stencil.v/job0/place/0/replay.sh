#!/usr/bin/env bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LD_LIBRARY_PATH="/.singularity.d/libs"
export QT_QPA_PLATFORM="offscreen"
cd /home/gaod/derui_work/assassyn-workloads/scripts/post_sythesis/build/run_benchmark/job0/place/0
openroad \
    -exit \
    -metrics reports/metrics.json \
    /usr/local/lib/python3.10/dist-packages/siliconcompiler/tools/openroad/scripts/sc_apr.tcl
