#!/bin/bash

for i in $(seq 1 50)
do
    echo "n;expr;nll;coeff;sum_fevals;sum_restarts;sum_runtime;best_nll" > run${i}.csv
    # n 1                                       2                    3                                             4      5     6   7  8 9  10                          
    # 1;1.0 / (p1 + abs(p2 + abs(x) ^ p3) ^ p4);-1002.3409364613959;[0.018006544923177555, ... 0.7399037066655398];62476;62475;326;134;0;18;542.856112939

    # explanation:
    # randomly shuffle all expressions
    # calculate the sum of fevals, restarts, and runtime using online algorithm
    # calculate the minimum of nll (2) and use online algorithm (streaming -s)
    # output all rows with row numbers (-n)
    # awk: output only the lines where field 5 (min nll) changes (to save space)
    
    mlr --csv --fs ';' --headerless-csv-output \
        --from ../../esr/rar_size12/fittingresults_rar_ranked.txt \
        shuffle \
        then stats1 -a sum -f 4,6,10 -s \
        then stats1 -a min -f 2 -s \
        then cut -f 1,2,3,4_sum,6_sum,10_sum,2_min \
        then cat -n \
        | awk -F ';' '!a[$8]++' \
	>> run${i}.csv
done
