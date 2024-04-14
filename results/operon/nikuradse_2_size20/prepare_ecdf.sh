#!/bin/bash

threshold=${1:--0.02}    # set threshold or use -0.02 as default
lenlimit=${2:-1000}      # default length limit is large for unlimited length
simpllenlimit=${3:-1000}
echo "rank;rownum;evals;expr;mse;len;simplifiedlen"
echo "0;0;0;dummy;${threshold};$lenlimit;$simpllenlimit"

for i in $(seq 1 50)
do
    file="run${i}_simplified.csv.gz"
    # dummy;evals;expr;fitness;len;parsedexpr;parsedhash;numparam;len;simplifiedexpr;simplifiedhash;simplifiednumparam;simplifiedlen;parsed_op_add;parsed_op_sub;parsed_op_mul;parsed_op_div;parsed_op_pow;parsed_op_abs
    # 0;3;((0.99159664 + log_v_k_nu) + (log_v_k_nu / log_v_k_nu));-3.4028235e+38;7;(p1 + x1) + x1 / x1;7888844490422443580;1;7;p1 + x1;13829915908818337755;1;3;2;0;0;1;0;0
    mlr --headerless-csv-output --csv --fs ';' --from ${file} \
        cat -n \
        then filter "float(\$fitness) > ${threshold} && \$len <= ${lenlimit} && \$simplifiedlen <= ${simpllenlimit}" \
        then cut -f n,evals,expr,fitness,len,simplifiedlen \
        then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 1 then cat -n
