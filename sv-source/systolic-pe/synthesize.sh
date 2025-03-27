i=./systolic_array.sv
fname=`basename $i`
singularity exec --bind $i:/home/ubuntu/$fname $HOME/open_eda.sif sc /home/ubuntu/$fname -target asap7_demo -design pe_5_2 -define SYNTHESIS=1
