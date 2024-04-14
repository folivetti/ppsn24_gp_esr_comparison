#!/bin/bash

threshold=${1:--1000} # set threshold or use -1000 as default
sortfield=${2:-3}
internalsortfield=$(($sortfield - 1))

echo "rank;run;n;expr;nll;coeff;sum_fevals;sum_restarts;sum_runtime;best_nll"

for file in run*.csv
do
    echo -n "${file};"
    # input format:
    # n;expr;nll;coeff;sum_fevals;sum_restarts;sum_runtime;best_nll
    # 1;x + (1.0 / x - p1 ^ (x + x));4815.446408213689;[-0.8352432347253846, 1.1669609835168349, -0.49945078288148015, -0.7385845507720423];8351;117;18.974739693;4815.4464082136892
    mlr --headerless-csv-output --csv --fs ';' --from ${file} filter "\$best_nll < ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n $internalsortfield then cat -n
