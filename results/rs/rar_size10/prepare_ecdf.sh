#!/bin/bash

threshold=${1:--1000} # set threshold or use -1000 as default

echo "rank;run;nevals;expr;nll;coeff;nll"

for file in run*.csv
do
     echo -n "${file};"
    mlr --headerless-csv-output --csv --fs ';' --from ${file} filter "\$best_nll < ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 2 then cat -n
