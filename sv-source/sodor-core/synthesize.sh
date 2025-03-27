bind=`ls *.sv | awk '{ print "--bind " $1":/home/ubuntu/"$1 }'`
files=`ls *.sv | awk '{ print "/home/ubuntu/"$1 }'`

singularity exec $bind $HOME/open_eda.sif \
    sc $files -target asap7_demo -define SYNTHESIS=1
