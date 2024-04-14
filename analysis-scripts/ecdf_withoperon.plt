set terminal pdf

set datafile separator ';'
set key autotitle columnhead # skip first line

set xlabel "# visited expressions"
set ylabel "Success probability"
set logscale x


set key rmargin
set xrange[10:100000]

# GP based on mse
set title "Nikuradse len 10"
set xlabel "visited expressions"
set output "../plots/with_operon/nikuradse2_len10_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using 2:($1/50) with step lc 1        title "GP MSE < 0.0200",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'  using 2:($1/50) with step lc 1 dt "." title "Operon MSE < 0.0200",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02'       using 3:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'  using 2:($1/50) with step lc 2 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01'       using 3:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using 2:($1/50) with step lc 3        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005' using 2:($1/50) with step lc 3 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005'      using 3:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027'     using 3:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"


set title "Nikuradse len 10"
set output "../plots/with_operon/nikuradse2_len10_ecdf_fevals.pdf"
unset xrange
set xlabel "# fevals"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using ($2*10):($1/50) with step lc 1        title "GP MSE < 0.0200",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'  using ($2*10):($1/50) with step lc 1 dt "." title "Operon MSE < 0.0200",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 7'     using 7:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using ($2*10):($1/50) with step lc 2        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'  using ($2*10):($1/50) with step lc 2 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 7'     using 7:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using ($2*10):($1/50) with step lc 3        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005' using ($2*10):($1/50) with step lc 3 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 7'    using 7:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 7'   using 7:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"

set title "Nikuradse len 10"
set output "../plots/with_operon/nikuradse2_len10_ecdf_restarts.pdf"
unset xrange
set xlabel "# restarts"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using 2:($1/50) with step lc 1        title "GP MSE < 0.0200",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'  using 2:($1/50) with step lc 1 dt "." title "Operon MSE < 0.0200",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 8'     using 8:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'  using 2:($1/50) with step lc 2 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 8'     using 8:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using 2:($1/50) with step lc 3        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005' using 2:($1/50) with step lc 3 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 8'    using 8:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 8'   using 8:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"


set xrange[100:2000000]

# LEN 12
set xrange[100:2000000]
# GP based on mse
set title "Nikuradse len 12"
set output "../plots/with_operon/nikuradse2_len12_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using 2:($1/50) with step lc 1        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'   using 2:($1/50) with step lc 1 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01'        using 3:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100", \
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'  using 2:($1/50) with step lc 2 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005'       using 3:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using 2:($1/50) with step lc 3        title "GP MSE < 0.0020",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'  using 2:($1/50) with step lc 3 dt "." title "Operon MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'       using 3:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using 2:($1/50) with step lc 4        title "GP MSE < 0.0015",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015' using 2:($1/50) with step lc 4 dt "." title "Operon MSE < 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using 3:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)",\
     

unset xrange
set title "Nikuradse len 12"
set output "../plots/with_operon/nikuradse2_len12_ecdf_fevals.pdf"
unset xrange
set xlabel "# fevals"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using ($2*10):($1/50) with step lc 1        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'   using ($2*10):($1/50) with step lc 1 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 7'      using 7:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using ($2*10):($1/50) with step lc 2        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'  using ($2*10):($1/50) with step lc 2 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 7'     using 7:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using ($2*10):($1/50) with step lc 3        title "GP MSE < 0.0020",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'  using ($2*10):($1/50) with step lc 3 dt "." title "Operon MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 7'     using 7:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using ($2*10):($1/50) with step lc 4        title "GP MSE < 0.0015",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015' using ($2*10):($1/50) with step lc 4 dt "." title "Operon MSE < 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using ($2*10):($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)",\

set title "Nikuradse len 12"
set output "../plots/with_operon/nikuradse2_len12_ecdf_restarts.pdf"
unset xrange
set xlabel "# restarts"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using 2:($1/50) with step lc 1        title "GP MSE < 0.0100",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'   using 2:($1/50) with step lc 1 dt "." title "Operon MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 8'      using 8:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0050",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'  using 2:($1/50) with step lc 2 dt "." title "Operon MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 8'     using 8:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using 2:($1/50) with step lc 3        title "GP MSE < 0.0020",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'  using 2:($1/50) with step lc 3 dt "." title "Operon MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 8'     using 8:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using 2:($1/50) with step lc 4        title "GP MSE < 0.0015",\
     '< cd ../results/operon/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015' using 2:($1/50) with step lc 4 dt "." title "Operon MSE < 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using 2:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)"



# LEN 20
set xrange[100:2000000]

set xlabel "# visited expressions"

set title "Nikuradse len 20"
# GP based on mse
set output "../plots/with_operon/nikuradse2_len20_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.01'          using 2:($1/50) with step lc 1        title "GP MSE < 0.010",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.01'   using 2:($1/50) with step lc 1 dt "." title "Operon MSE < 0.010",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.005'         using 2:($1/50) with step lc 2        title "GP MSE < 0.005",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.005'  using 2:($1/50) with step lc 2 dt "." title "Operon MSE < 0.005",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.003'         using 2:($1/50) with step lc 3        title "GP MSE < 0.003",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.003'  using 2:($1/50) with step lc 3 dt "." title "Operon MSE < 0.003",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015'        using 2:($1/50) with step lc 4        title "GP MSE < 0.0015",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015' using 2:($1/50) with step lc 4 dt "." title "Operon MSE < 0.0015",\

  

# Nikuradse mixed lengths
set key tmargin
set title "Nikurase len 12"
set output "../plots/nikuradse2_mixed_len_ecdf.pdf"
plot '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'         using 3:($1/50) with step lc 1        title "RS (12) MSE < 0.0015",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 12' using 2:($1/50) with step lc 1 dt "." title "Operon (20) MSE < 0.0015 & len<=12",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 12'        using 2:($1/50) with step lc 1 dt "-" title "GP (20) MSE < 0.0015 & len<=12",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'          using 3:($1/50) with step lc 2        title "RS (12) MSE < 0.002",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 12'  using 2:($1/50) with step lc 2 dt "." title "Operon (20) MSE < 0.002 & len<=12",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 12'         using 2:($1/50) with step lc 2 dt "-" title "GP (20) MSE < 0.002 & len<=12"

set key tmargin
set title "Nikurase len 12"
set output "../plots/nikuradse2_mixed_simplifiedlen_ecdf.pdf"
plot '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'             using 3:($1/50) with step lc 1        title "RS (12) MSE < 0.0015",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 100 12' using 2:($1/50) with step lc 1 dt "." title "Operon (20) MSE < 0.0015 & simpllen<=12",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 100 12'        using 2:($1/50) with step lc 1 dt "-" title "GP (20) MSE < 0.0015 & simpllen<=12",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'              using 3:($1/50) with step lc 2        title "RS (12) MSE < 0.002",\
     '< cd ../results/operon/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 100 12'  using 2:($1/50) with step lc 2 dt "." title "Operon (20) MSE < 0.002 & simpllen<=12",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 100 12'         using 2:($1/50) with step lc 2 dt "-" title "GP (20) MSE < 0.002 & simpllen<=12"
