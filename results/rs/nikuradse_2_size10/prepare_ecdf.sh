#!/bin/bash

threshold=${1:-0.02} # set threshold or use 0.02 as default
sortfield=${2:-3}
internalsortfield=$(($sortfield - 1))

echo "rank;run;n;expr;nll;coeff;sum_fevals;sum_restarts;sum_runtime;best_mse"

for file in run*.csv
do
    echo -n "${file};"
    mlr --headerless-csv-output --csv --fs ';' --from ${file} filter "\$best_mse < ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n $internalsortfield then cat -n
