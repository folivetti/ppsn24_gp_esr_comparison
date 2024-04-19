#!/bin/bash

# best fitness found in each run
for case in ../results/nikuradse_1_size10 ../results/nikuradse_1_size12 ../results/nikuradse_1_size20 \
					  ../results/nikuradse_2_size10 ../results/nikuradse_2_size12 ../results/nikuradse_2_size20 \
					  ../results/operon/nikuradse_2_size10 ../results/operon/nikuradse_2_size12 ../results/operon/nikuradse_2_size20 \
            ../results/rar_size10 ../results/rar_size12 ../results/rar_size20
do
    for id in $(seq 1 50)
    do
        echo -n "${case#.*/};${id};"
        zcat ${case}/run${id}.csv.gz \
            | sed 's/inf/999999999/g' \
            | mlr --csv --ifs ',' --ofs ';' --headerless-csv-output \
                  sort -nr fitness \
                  then head -n 1 \
                  then cut -f fitness
    done
done | mlr --implicit-csv-header --csv --fs ';' stats1 -f 3 -g 1 -a max,mean,stddev


# best expression overall
    for case in ../results/nikuradse_2_size10 ../results/nikuradse_2_size12 ../results/nikuradse_2_size20 \
					      ../results/operon/nikuradse_2_size10 ../results/operon/nikuradse_2_size12 ../results/operon/nikuradse_2_size20 \
					      ../results/rar_size10 ../results/rar_size12 ../results/rar_size20
do
    echo "${case}"
    for id in $(seq 1 50)
    do
        zcat ${case}/run${id}.csv.gz \
            | sed 's/inf/999999999/g' \
	    | sed 's/,expr,/,expression,/g' \
            | mlr --csv --ifs ',' --ofs ';' --headerless-csv-output \
                  sort -nr fitness \
                  then head -n 1 \
                  then cut -f expression,fitness
    done \
    | mlr --csv --fs ';' --allow-ragged-csv-input --implicit-csv-header --headerless-csv-output sort -nr 2 then head -n 5
done
