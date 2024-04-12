#!/bin/bash

threshold=${1:--0.02} # set threshold or use -0.02 as default
lenlimit=${2:-1000}   # default length limit is large for unlimited length
echo "rank;rownum;evals;expr;mse;len"
echo "0;0;0;dummy;${threshold};$lenlimit"

for i in $(seq 1 50)
do
    file="run${i}.csv.gz"
    # dummy,evals,expr,fitness,len
    # 0,3,((0.99159664 + log_v_k_nu) + (log_v_k_nu / log_v_k_nu)),-3.4028235e+38,7
    mlr --headerless-csv-output --csv --ifs ',' --ofs ';' --from ${file} \
        cat -n \
        then filter "float(\$fitness) > ${threshold} && \$len <= ${lenlimit}" \
        then cut -f n,evals,expr,fitness,len \
        then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 1 then cat -n
