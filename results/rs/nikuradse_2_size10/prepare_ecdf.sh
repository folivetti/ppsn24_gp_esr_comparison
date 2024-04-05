#!/bin/bash

threshold=${1:-0.02} # set threshold or default

echo "rank;nevals;expr;nll;coeff;mse;mse"
echo "0;0;dummy;;;;${threshold}"

for file in run*.csv
do
    mlr --headerless-csv-output --csv --fs ';' --from ${file} filter "\$best_mse < ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 1 then cat -n


