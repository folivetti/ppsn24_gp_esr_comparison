#!/bin/bash

threshold=${1:-1000} # set threshold or use 1000 as default

echo "rank;rownum;generation;idx;expr;fitness;nodes"
echo "0;0;0;0;dummy;${threshold};0"

for file in run*.csv
do
    # generation,individual_index,expression,fitness,nodes
    # 0,0,1/((abs(x0)**(-0.05962666974686582)) / ((1.2706606520639872) - (-0.4981652116233919))),-0.05093312902550394,8
    mlr --headerless-csv-output --csv --ifs ',' --ofs ';' --from ${file} cat -n then filter "float(\$fitness) > ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 1 then cat -n
