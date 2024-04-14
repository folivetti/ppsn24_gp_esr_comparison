#!/bin/bash

threshold=${1:--0.02}    # set threshold or use -0.02 as default
lenlimit=${2:-1000}      # use length limit 1000 as default
simpllenlimit=${3:-1000} 

echo "rank;rownum;generation;idx;expr;fitness;nodes;simplifiedlen"
echo "0;0;0;0;dummy;${threshold};${lenlimit};${simpllenlimit}"

for file in run*_simplified.csv.gz
do
    # generation;individual_index;expression;fitness;nodes;parsedexpr;parsedhash;numparam;len;simplifiedexpr;simplifiedhash;simplifiednumparam;simplifiedlen;parsed_op_count
    # 0;0;1/((-0.26595730397677475) - ((2.7116813703780163) * (x0)));-4.57237587802604;6;1.0 / (p1 - p2 * x1);13649221981342618844;2;7;p1 / (p2 + x1);13889272278406549869;2;5;Dict{Symbol, Int32}(:/ => 1, :- => 1, :* => 1)
    mlr --headerless-csv-output --csv --fs ';' --from ${file} \
        cat -n \
        then filter "float(\$fitness) > ${threshold} && \$nodes <= ${lenlimit} && \$simplifiedlen <= ${simpllenlimit}" \
        then cut -f n,generation,individual_index,expression,fitness,nodes,simplifiedlen \
        then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 1 then cat -n
