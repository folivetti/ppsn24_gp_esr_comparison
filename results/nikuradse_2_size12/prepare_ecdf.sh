#!/bin/bash

threshold=${1:--0.02} # set threshold or use -0.02 as default

echo "rank;run;rownum;generation;idx;expr;fitness;nodes"

for file in run*.csv
do
    echo -n "${file};"
    # generation,individual_index,expression,fitness,nodes
    # 0,0,1/((abs(x0)**(-0.05962666974686582)) / ((1.2706606520639872) - (-0.4981652116233919))),-0.05093312902550394,8
    mlr --headerless-csv-output --csv --ifs ',' --ofs ';' --from ${file} cat -n then filter "float(\$fitness) > ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 2 then cat -n
