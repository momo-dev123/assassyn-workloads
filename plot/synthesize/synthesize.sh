singularity exec --bind $1:/home/ubuntu/$1 \
     $HOME/open_eda.sif sc /home/ubuntu/$1 \
     -target asap7_demo \
     -tool_task_var 'yosys syn_asic flatten false' \
     -design top -define SYNTHESIS=1

mv ./build/top ./build/${1}_top
