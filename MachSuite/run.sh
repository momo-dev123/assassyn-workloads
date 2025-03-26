#!/usr/bin/zsh

mkdir -p verilogs

workloads=("./kmp/kmp.c" "./stencil2d/stencil.c" "./ellpack/ellpack.c" "./merge/merge.c" "./radix/radix.c" "./fft/fft.c")
new_names=("kmp"          "stencil"               "spmv"                "merge"           "radix"           "fft")

for ((i=1; i<=${#workloads[@]}; i++))
do

wl=${workloads[$i]}

dir=$(dirname $wl)

echo $dir

fname=${new_names[$i]}

~/bambu-0.9.7.AppImage ${wl} ./common/harness.c \
	-I./common \
	--top-fname=main \
	--simulator=VERILATOR \
	--file-input-data=${dir}/input.data,${dir}/check.data \
	--simulate -s \
	--top-rtldesign-name=run_benchmark \
	--no-iob --hls-div --benchmark-name=${fname} \
	-DBAMBU_PROFILING -DNO_FINAL_MEMCMP_CHECK 

{ time ./simulate_main.sh } 2> "${fname}.time"

sed "s|\$readmem.*||g" main.v > synth.v

cp synth.v verilogs/${fname}.v

rm -rf ./HLS_output
rm *.mem
rm *.v
rm *.xml

done

