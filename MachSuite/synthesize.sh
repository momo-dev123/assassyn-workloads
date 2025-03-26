fname=`basename $1`

singularity exec --bind $1:/home/ubuntu/$fname $HOME/open_eda.sif \
    sc /home/ubuntu/$fname -target asap7_demo -design run_benchmark

cp ./build/run_benchmark/job0/syn/0/reports/stat.json ./hls-$fname.json
mv ./build/run_benchmark ./build/$fname
