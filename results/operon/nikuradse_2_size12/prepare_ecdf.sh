#!/bin/bash

threshold=${1:--0.02} # set threshold or use -0.02 as default

echo "rank,rownum,idx,expr,mse"
echo "0,0,0,dummy,${threshold}"

for i in $(seq 1 50)
do
    file="run${i}.csv"
    # dummy,evals,expression,fitness
    # 0,0,((((-0.022236966) + 1.1898694) - (abs((-1.1293824)) ^ (0.27311236 * log_v_k_nu))) * (((3.7352045 * log_v_k_nu) + 5.3620472) * 1.4960924)),0.042159
    mlr --implicit-csv-header --headerless-csv-output --csv --ifs ',' --ofs ';' --from ${file} cat -n then filter "float(\$4) > ${threshold}" then head -n 1
done | mlr --implicit-csv-header --headerless-csv-output --csv --fs ';' sort -n 1 then cat -n
