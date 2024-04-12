#!/bin/bash

# TODO repeat 50 times
for i in $(seq 1 50)
do
    echo "dummy,evals,expr,fitness,len" > run${i}.csv
    ~/operon/build/cli/operon_nsgp --dataset ../../../datasets/nikuradse_2.csv --target target --train 0:361 \
			       --objective mse \
			       --enable-symbols add,mul,div,sub,inv,powabs,variable_without_coeff \
			       --disable-symbols variable \
			       --generations 250 \
			       --population-size 500 --pool-size 500 \
			       --evaluations 5000000 \
			       --female-selector tournament:4 --male-selector tournament:4 \
			       --linear-scaling=false \
			       --iterations 10 \
			       --show-pareto-front \
			       --maxlength 20 \
			       --creator-maxlength 20 \
			       | grep -E '^[0-9]+,' >> run${i}.csv
done
