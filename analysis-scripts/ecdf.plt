set terminal pdf

set datafile separator ';'
set key autotitle columnhead # skip first line

set xlabel "# evals"
set ylabel "# successful runs"
set logscale x


set key top left
set xrange[10:100000]

set output "../plots/nikuradse2_len10_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/nikuradse_2_10 && bash prepare_ecdf.sh -550' using 3:1 with step title "RS nll < -550"

set output "../plots/rar_len10_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_10 && bash prepare_ecdf.sh -1000' using 3:1 with step title "RS nll < -1000"


set xrange[100:10000000]

set output "../plots/nikuradse2_len12_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/nikuradse_2_12 && bash prepare_ecdf.sh -660' using 3:1 with step title "RS nll < -660"

set output "../plots/rar_len12_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_12 && bash prepare_ecdf.sh -1010' using 3:1 with step title "RS nll < -1010"