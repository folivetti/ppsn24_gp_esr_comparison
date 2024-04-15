set terminal pdf

set datafile separator ';'
set key autotitle columnhead # skip first line

set xlabel "# visited expressions"
set ylabel "Success probability"
set logscale x


set key rmargin
set xrange[10:100000]

set title "RAR len 10"
set output "../plots/rar_len10_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995'   using 3:($1/50) with step lc 1        title "RS nll < -995",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'       using 2:($1/50) with step lc 1 dt "." title "GP nll < -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000'  using 3:($1/50) with step lc 2        title "RS nll < -1000",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'      using 2:($1/50) with step lc 2 dt "." title "GP nll < -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010'  using 3:($1/50) with step lc 3        title "RS nll < -1010",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1010'      using 2:($1/50) with step lc 3 dt "." title "GP nll < -1010"

unset xrange
set title "RAR len 10"
set output "../plots/rar_len10_ecdf_fevals.pdf"
set xlabel "# function evaluations"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 7'  using 7:($1/50) with step lc 1        title "RS nll < -995",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'        using ($2*10):($1/50) with step lc 1 dt "." title "GP nll < -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 7' using 7:($1/50) with step lc 2        title "RS nll < -1000",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'       using ($2*10):($1/50) with step lc 2 dt "." title "GP nll < -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010 7' using 7:($1/50) with step lc 3        title "RS nll < -1010",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1010'       using ($2*10):($1/50) with step lc 3 dt "." title "GP nll < -1010"


set title "RAR len 10"
set output "../plots/rar_len10_ecdf_restarts.pdf"
set xlabel "# param opt restarts"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 8'  using 8:($1/50) with step lc 1        title "RS nll < -995",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'        using 2:($1/50) with step lc 1 dt "." title "GP nll < -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 8' using 8:($1/50) with step lc 2        title "RS nll < -1000",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'       using 2:($1/50) with step lc 2 dt "." title "GP nll < -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010 8' using 8:($1/50) with step lc 3        title "RS nll < -1010",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1010'       using 2:($1/50) with step lc 3 dt "." title "GP nll < -1010"

set title "RAR len 10"
set output "../plots/rar_len10_ecdf_runtime.pdf"
set xlabel "runtime [s]"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 9'   using 9:($1/50) with step lc 1        title "RS nll < -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 9'  using 9:($1/50) with step lc 2        title "RS nll < -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010 9'  using 9:($1/50) with step lc 3        title "RS nll < -1010",\

set xrange[10:100000]

# GP based on mse
set title "Nikuradse len 10"
set xlabel "visited expressions"
set output "../plots/nikuradse2_len10_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using 2:($1/50) with step lc 1        title "GP MSE < 0.0200",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02'       using 3:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01'       using 3:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using 2:($1/50) with step lc 3        title "GP MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005'      using 3:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027'     using 3:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"


set title "Nikuradse len 10"
set output "../plots/nikuradse2_len10_ecdf_fevals.pdf"
unset xrange
set xlabel "# fevals"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using ($2*10):($1/50) with step lc 1        title "GP MSE < 0.0200",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 7'     using 7:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using ($2*10):($1/50) with step lc 2        title "GP MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 7'     using 7:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using ($2*10):($1/50) with step lc 3        title "GP MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 7'    using 7:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 7'   using 7:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"

set title "Nikuradse len 10"
set output "../plots/nikuradse2_len10_ecdf_restarts.pdf"
unset xrange
set xlabel "# restarts"
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using 2:($1/50) with step lc 1        title "GP MSE < 0.0200",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 8'     using 8:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 8'     using 8:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using 2:($1/50) with step lc 3        title "GP MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 8'    using 8:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 8'   using 8:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"


set xrange[100:2000000]

# LEN 12

set title "RAR len 12"
set output "../plots/rar_len12_ecdf.pdf"
set xlabel "# visited expressions"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000' using 3:($1/50) with step lc 1        title "RS nll < -1000",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'     using 2:($1/50) with step lc 1 dt "." title "GP nll < -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010' using 3:($1/50) with step lc 2        title "RS nll < -1010",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1010'     using 2:($1/50) with step lc 2 dt "." title "GP nll < -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013' using 3:($1/50) with step lc 3        title "RS nll < -1013",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'     using 2:($1/50) with step lc 3 dt "." title "GP nll < -1013",\
     


unset xrange
set title "RAR len 12"
set output "../plots/rar_len12_ecdf_fevals.pdf"
set xlabel "# function evaluations"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000 7' using 7:($1/50) with step lc 1        title "RS nll < -1000",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'       using ($2*10):($1/50) with step lc 1 dt "." title "GP nll < -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010 7' using 7:($1/50) with step lc 2        title "RS nll < -1010",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1010'       using ($2*10):($1/50) with step lc 2 dt "." title "GP nll < -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013 7' using 7:($1/50) with step lc 3        title "RS nll < -1013",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'       using ($2*10):($1/50) with step lc 3 dt "." title "GP nll < -1013"


set title "RAR len 12"
set output "../plots/rar_len12_ecdf_restarts.pdf"
set xlabel "# param opt restarts"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000 8' using 8:($1/50) with step lc 1        title "RS nll < -1000",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'       using 2:($1/50) with step lc 1 dt "." title "GP nll < -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010 8' using 8:($1/50) with step lc 2        title "RS nll < -1010",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1010'       using 2:($1/50) with step lc 2 dt "." title "GP nll < -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013 8' using 8:($1/50) with step lc 3        title "RS nll < -1013",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'       using 2:($1/50) with step lc 3 dt "." title "GP nll < -1013"

set xrange[100:2000000]
# GP based on mse
set title "Nikuradse len 12"
set output "../plots/nikuradse2_len12_ecdf.pdf"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using 2:($1/50) with step lc 1        title "GP MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01'        using 3:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100", \
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005'       using 3:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using 2:($1/50) with step lc 3        title "GP MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'       using 3:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using 2:($1/50) with step lc 4        title "GP MSE < 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using 3:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)",\
     

unset xrange
set title "Nikuradse len 12"
set output "../plots/nikuradse2_len12_ecdf_fevals.pdf"
unset xrange
set xlabel "# fevals"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using ($2*10):($1/50) with step lc 1        title "GP MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 7'      using 7:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using ($2*10):($1/50) with step lc 2        title "GP MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 7'     using 7:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using ($2*10):($1/50) with step lc 3        title "GP MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 7'     using 7:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using ($2*10):($1/50) with step lc 4        title "GP MSE < 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using ($2*10):($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)",\

set title "Nikuradse len 12"
set output "../plots/nikuradse2_len12_ecdf_restarts.pdf"
unset xrange
set xlabel "# restarts"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using 2:($1/50) with step lc 1        title "GP MSE < 0.0100",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 8'      using 8:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0050",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 8'     using 8:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using 2:($1/50) with step lc 3        title "GP MSE < 0.0020",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 8'     using 8:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using 2:($1/50) with step lc 4        title "GP MSE < 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using 2:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)"



# LEN 20
set xrange[100:2000000]

set xlabel "# visited expressions"
set title "RAR len 20"
set output "../plots/rar_len20_ecdf.pdf"
# rank;run;nevals;expr;nll;coeff;nll 
plot '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1000'     using 2:($1/50) with step lc 1 title "GP nll < -1000",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005'     using 2:($1/50) with step lc 2 title "GP nll < -1005",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010'     using 2:($1/50) with step lc 3 title "GP nll < -1010"  
     
  

# Nikuradse mixed lengths
set key tmargin
set title "Nikurase len 12"
set output "../plots/nikuradse2_mixed_len_ecdf.pdf"
plot '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'         using 3:($1/50) with step lc 1        title "RS (12) MSE < 0.0015",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 12'        using 2:($1/50) with step lc 1 dt "-" title "GP (20) MSE < 0.0015 & len<=12",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'          using 3:($1/50) with step lc 2        title "RS (12) MSE < 0.002",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 12'         using 2:($1/50) with step lc 2 dt "-" title "GP (20) MSE < 0.002 & len<=12"

set key tmargin
set title "Nikurase len 12"
set output "../plots/nikuradse2_mixed_simplifiedlen_ecdf.pdf"
plot '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'             using 3:($1/50) with step lc 1        title "RS (12) MSE < 0.0015",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 100 12'        using 2:($1/50) with step lc 1 dt "-" title "GP (20) MSE < 0.0015 & simpllen<=12",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'              using 3:($1/50) with step lc 2        title "RS (12) MSE < 0.002",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 100 12'         using 2:($1/50) with step lc 2 dt "-" title "GP (20) MSE < 0.002 & simpllen<=12"


# RAR mixed lengths
set key tmargin
set title "RAR len 12"
set output "../plots/RAR_mixed_len_ecdf.pdf"
plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005' using 3:($1/50) with step lc 1        title "RS (12) NLL < -1005",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005 12'  using 2:($1/50) with step lc 1 dt "-" title "GP (20) NLL < -1005 & len<=12",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010' using 3:($1/50) with step lc 2        title "RS (12) NLL < -1010",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010 12'  using 2:($1/50) with step lc 2 dt "-" title "GP (20) NLL < -1010 & len<=12",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013' using 3:($1/50) with step lc 3        title "RS (12) NLL < -1013",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1013 12'  using 2:($1/50) with step lc 3 dt "-" title "GP (20) NLL < -1013 & len<=12"

set key tmargin
set title "RAR len 12"
set output "../plots/RAR_mixed_simplifiedlen_ecdf.pdf"
plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005'     using 3:($1/50) with step lc 1        title "RS (12) NLL < -1005",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005 100 12'  using 2:($1/50) with step lc 1 dt "-" title "GP (20) NLL < -1005 & len<=12",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010'     using 3:($1/50) with step lc 2        title "RS (12) NLL < -1010",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010 100 12'  using 2:($1/50) with step lc 2 dt "-" title "GP (20) NLL < -1010 & len<=12",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013'     using 3:($1/50) with step lc 3        title "RS (12) NLL < -1013",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1013 100 12'  using 2:($1/50) with step lc 3 dt "-" title "GP (20) NLL < -1013 & len<=12"
