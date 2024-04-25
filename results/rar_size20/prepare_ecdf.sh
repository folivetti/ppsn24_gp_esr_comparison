#!/bin/bash

threshold=${1:-1005} # set threshold or use 1005 as default
lenlimit=${2:-1000}      # use length limit 1000 as default
simpllenlimit=${3:-1000} 

echo "rank;rownum;generation;idx;expr;fitness;nodes;simplifiedlen"
echo "0;0;0;0;dummy;${threshold};${lenlimit};${simpllenlimit}"

for file in run*_simplified.csv.gz
do
    # generation;individual_index;expression;fitness;nodes;parsedexpr;parsedhash;numparam;len;simplifiedexpr;simplifiedhash;simplifiednumparam;simplifiedlen;parsed_op_add;parsed_op_sub;parsed_op_mul;parsed_op_div;parsed_op_pow;parsed_op_abs
    # 0;0;abs(1/(0.5502373178387527))**((x0) - ((-0.18081925656718956) + (1.459317978048097)));-1301.41087224514;8;abs(1.0 / p1) ^ (x1 - (p2 + p3));1136530595201969594;3;8;p1 ^ (p2 + x1);15570590691227934858;2;5;1;1;0;1;1;1
    mlr --headerless-csv-output --csv --fs ';' --from ${file} \
         cat -n \
         then filter "float(\$fitness) > ${threshold} &&  \$nodes <= ${lenlimit} && \$simplifiedlen <= ${simpllenlimit}" \
         then cut -f n,generation,individual_index,expression,fitness,nodes,simplifiedlen \
         then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 1 then cat -n
