#!/bin/bash

# best fitness found in each run
for case in ../results/nikuradse_2_size10 ../results/nikuradse_2_size12 ../results/rar_size10 ../results/rar_size12
do
    for id in $(seq 1 50)
    do
        echo -n "${case##.*/};${id};"
        xz -dc ${case}/run${id}_simplified.csv.xz \
            | sed 's/inf/999999999/g' \
            | mlr --csv --fs ';' --headerless-csv-output \
                  sort -nr fitness \
                  then head -n 1 \
                  then cut -f fitness
    done
done


# best expression overall
for case in ../results/nikuradse_2_size10 ../results/nikuradse_2_size12 ../results/rar_size10 ../results/rar_size12
do
    echo "${case}"
    for id in $(seq 1 50)
    do
        xz -dc ${case}/run${id}_simplified.csv.xz \
            | sed 's/inf/999999999/g' \
            | mlr --csv --fs ';' --headerless-csv-output \
                  sort -nr fitness \
                  then head -n 1 \
                  then cut -f expression,fitness,simplexpr
    done \
    | mlr --csv --fs ';' --allow-ragged-csv-input --implicit-csv-header --headerless-csv-output sort -nr 2 then head -n 5
done