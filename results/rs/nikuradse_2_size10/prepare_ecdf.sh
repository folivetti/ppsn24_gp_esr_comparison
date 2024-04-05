#!/bin/bash

threshold=${1:-0.02} # set threshold or default

echo "rank;run;nevals;expr;nll;coeff;mse;mse"

for file in run*.csv
do
     echo -n "${file};"
    mlr --headerless-csv-output --csv --fs ';' --from ${file} filter "\$best_mse < ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 2 then cat -n
