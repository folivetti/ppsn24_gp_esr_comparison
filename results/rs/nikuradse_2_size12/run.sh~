#!/bin/bash

for i in $(seq 1 50)
do
    echo "evals;expr;nll;coeff;mse;best_mse" > run${i}.csv
    
    # explanation:
    # randomly shuffle all expressions
    # get only the expression (1), nll (2), parameters (3), and mse (12)
    # calculate the minimum of mse (12) and use online algorithm (streaming -s)
    # output all rows with row numbers (-n)
    # awk: output only the lines where field 6 (min mse) changes (to save space)
    
    mlr --csv --fs ';' --headerless-csv-output --implicit-csv-header \
        --from ../../esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt \
        shuffle \
        then cut -f 1,2,3,12 \
        then stats1 -a min -f 12 -s \
        then cat -n \
        | awk -F ';' '!a[$6]++' \
	>> run${i}.csv
done
