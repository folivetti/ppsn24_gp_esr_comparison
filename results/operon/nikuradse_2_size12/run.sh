#!/bin/bash

# TODO repeat 50 times
for i in $(seq 1 50)
do
    echo "dummy,evals,expr,fitness,len" > run${i}.csv
    ~/operon/build/cli/operon_nsgp --dataset ../../../datasets/nikuradse_2.csv --target target --train 0:361 \
			       --objective mse \
			       --enable-symbols add,mul,div,sub,inv,powabs \
			       --generations 250 \
			       --population-size 100 --pool-size 100 \
			       --female-selector tournament:2 --male-selector tournament:2 \
			       --linear-scaling=false \
			       --iterations 50 \
			       --show-pareto-front \
			       --maxlength 8 \
			       --creator-maxlength 8 \
			       --threads 1 \
			       | grep -E '^[0-9]+,' >> run${i}.csv &
done
