#!/bin/bash

for i in $(seq 1 50)
do
    echo "n;expr;nll;coeff;sum_fevals;sum_restarts;sum_runtime;best_mse" > run${i}.csv
    # 1 2                                 3                 4                                                                                  5     6     7   8  9 10 11           12                  13 14 15
    # 1;p1 / (1.0 / (p2 + x) - p3 ^ x);-556.9439756680217;[0.3008681136542706, 0.6733527565497107, -0.45284796737000566, -0.05195082241417289];35962;35953;264;16;0;4;18.21685509;0.0026988874840232616;4;10;5

    # explanation:
    # randomly shuffle all expressions
    # calculate the sum of fevals, restarts, and runtime using online algorithm
    # calculate the minimum of mse (12) and use online algorithm (streaming -s)
    # output all rows with row numbers (-n)
    # awk: output only the lines where field 8 (best nll) changes (to save space)
    
    mlr --csv --fs ';' --implicit-csv-header --headerless-csv-output \
        --from ../../esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz \
        shuffle \
        then stats1 -a sum -f 5,7,11 -s \
        then stats1 -a min -f 12 -s \
        then cut -f 2,3,4,5_sum,7_sum,11_sum,12_min \
        then cat -n \
        | awk -F ';' '!a[$8]++' \
	>> run${i}.csv
done
