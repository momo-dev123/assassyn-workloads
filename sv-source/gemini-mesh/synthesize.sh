singularity exec \
    --bind ./MacUnit.sv:/home/ubuntu/MacUnit.sv \
    --bind ./PE.sv:/home/ubuntu/PE.sv \
    $HOME/open_eda.sif \
    sc /home/ubuntu/MacUnit.sv /home/ubuntu/PE.sv \
    -design PE \
    -target asap7_demo -define SYNTHESIS=1
