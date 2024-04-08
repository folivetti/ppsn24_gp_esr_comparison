set terminal pdf

set datafile separator ';'
set key autotitle columnhead # skip first line

set xlabel "# visited expressions"
set ylabel "# successful runs"
set logscale x


set key rmargin
set xrange[10:100000]

set output "../plots/rar_len10_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995' using 3:1 with step title "RS nll < -995",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995' using 3:1 with step title "GP nll < -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000' using 3:1 with step title "RS nll < -1000",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000' using 3:1 with step title "GP nll < -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010' using 3:1 with step title "RS nll < -1010",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1010' using 3:1 with step title "GP nll < -1010"

# GP based on mse
set output "../plots/nikuradse2_len10_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'        using 2:1 with step lc 1        title "GP MSE < 0.0200",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02'  using 2:1 with step lc 1 dt "." title "Operon MSE < 0.0200",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02'      using 2:1 with step lc 1 dt "-" title "RS MSE < 0.0200",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'        using 2:1 with step lc 2        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01'  using 2:1 with step lc 2 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01'      using 2:1 with step lc 2 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'       using 2:1 with step lc 3        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005' using 2:1 with step lc 3 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005'     using 2:1 with step lc 3 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027'    using 2:1 with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"


set xrange[100:10000000]

set output "../plots/rar_len12_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010' using 3:1 with step title "RS nll < -1010",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1010' using 3:1 with step title "GP nll < -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000' using 3:1 with step title "RS nll < -1000",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000' using 3:1 with step title "GP nll < -1000"

# GP based on mse
set output "../plots/nikuradse2_len12_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'        using 2:1 with step lc 1        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01'  using 2:1 with step lc 1 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01'      using 2:1 with step lc 1 dt "-" title "RS MSE < 0.0100", \
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'       using 2:1 with step lc 2        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005' using 2:1 with step lc 2 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005'     using 2:1 with step lc 2 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'       using 2:1 with step lc 3        title "GP MSE < 0.0020",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002' using 2:1 with step lc 3 dt "." title "Operon MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'     using 2:1 with step lc 3 dt "-" title "RS MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'    using 2:1 with step lc 4 dt "-" title "RS MSE < 0.0015 (best)"
     
