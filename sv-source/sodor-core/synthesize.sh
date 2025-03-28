#!/usr/bin/bash


export XDG_RUNTIME_DIR=/tmp/runtime_$USER
mkdir -p "$XDG_RUNTIME_DIR"

bind=()
files=()
for f in *.sv; do
    abs_path="$(realpath "$f")"
    container_path="/home/ubuntu/$f"
    bind+=("--bind" "${abs_path}:${container_path}")
    files+=("${container_path}")
done

echo "binds: ${bind[@]}"
echo "FILES: ${files[@]}"

for f in "${files[@]}"; do
  echo "$f"
done > filelist.f

apptainer exec "${bind[@]}" "$ASSASSYN_HOME/open_eda.sif" \
    sc "${files[@]}" -target asap7_demo -define SYNTHESIS=1 -design Core

cp ./build/Core/job0/syn/0/reports/stat.json ../../plot/reports/sodor.json