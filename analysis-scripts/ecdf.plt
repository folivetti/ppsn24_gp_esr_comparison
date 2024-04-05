set terminal pdf

set datafile separator ';'
set key autotitle columnhead # skip first line

set xlabel "# visited expressions"
set ylabel "# successful runs"
set logscale x


set key top left
set xrange[10:100000]

set output "../plots/rar_len10_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000' using 3:1 with step title "RS nll < -1000"

# GP based on fitness (mse?)
set output "../plots/nikuradse2_len10_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02' using 3:1 with step title "GP MSE < 0.02",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02' using 3:1 with step title "RS MSE < 0.02"


set xrange[100:10000000]

set output "../plots/rar_len12_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010' using 3:1 with step title "RS nll < -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000' using 3:1 with step title "RS nll < -1000"

# GP based on fitness (mse?)
set output "../plots/nikuradse2_len12_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01' using 3:1 with step title "GP MSE < 0.01",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01' using 3:1 with step title "RS MSE < 0.01"
