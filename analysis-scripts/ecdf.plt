# set terminal pdf
# extension=".pdf"

set terminal cairolatex pdf input size 12cm,5cm header "\\footnotesize"
extension=".tex"

# for testing
#set terminal pdfcairo  font ", 9" size 12cm,5cm
#extension=".pdf"


set datafile separator ';'
set key autotitle columnhead # skip first line

set xlabel "# visited expressions"
set ylabel "Success probability"
set logscale x


set key rmargin

set output "../plots/rar_ecdf" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.15, 0.9 spacing 0.02,0
set xrange[10:100000]
set xtics 10,10,90000
unset key
set title "RAR len=10"
plot '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'       using 2:($1/50) with step lc 1 lw 2        title "GP, -995",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'      using 2:($1/50) with step lc 2 lw 2        title "GP, -1000",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1005'      using 2:($1/50) with step lc 3 lw 2        title "GP, -1005",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995'   using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000'  using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1005'  using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1005",\
     
set xrange[100:2000000]

# LEN 12

unset ylabel
unset ytics
set xrange[100:2000000]
set xtics 100,100,900000
set key rmargin Left maxcols 1 samplen 2 spacing 0.8
set title "RAR len=12"
plot '< cd ../results/rar_size12 && bash prepare_ecdf.sh 995'      using 2:($1/50) with step lc 1 lw 2        title "GP  -995",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'     using 2:($1/50) with step lc 2 lw 2        title "GP, -1000",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1005'     using 2:($1/50) with step lc 3 lw 2        title "GP, -1005",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'     using 2:($1/50) with step lc 4 lw 2        title "GP, -1013",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -995'  using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, -995",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000' using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005' using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1005",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013' using 3:($1/50) with step lc 4 lw 2  dt "-" title "RS, -1013",\

unset multiplot


# RAR mixed lengths
set key rmargin
set rmargin at screen 0.8
set title "RAR len 12"
set output "../plots/RAR_mixed_len_ecdf" . extension
plot '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005 12'  using 2:($1/50) with step lc 1 lw 2        title "GP, -1000 \\& len$\leq$12",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005 12'  using 2:($1/50) with step lc 2 lw 2        title "GP, -1005 \\& len$\leq$12",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010 12'  using 2:($1/50) with step lc 3 lw 2        title "GP, -1010 \\& len$\leq$12",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1013 12'  using 2:($1/50) with step lc 4 lw 2        title "GP, -1013 \\& len$\leq$12",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000' using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005' using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1005",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010' using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013' using 3:($1/50) with step lc 4 lw 2  dt "-" title "RS, -1013",\
     

set key rmargin
set title "RAR len 12"
set output "../plots/RAR_mixed_simplifiedlen_ecdf" . extension
plot '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1000 100 12'  using 2:($1/50) with step lc 1 lw 2        title "GP, -1000 \\& len$\leq$12",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005 100 12'  using 2:($1/50) with step lc 2 lw 2        title "GP, -1005 \\& len$\leq$12",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010 100 12'  using 2:($1/50) with step lc 3 lw 2        title "GP, -1010 \\& len$\leq$12",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1013 100 12'  using 2:($1/50) with step lc 4 lw 2        title "GP, -1013 \\& len$\leq$12",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000'     using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005'     using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1005",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010'     using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013'     using 3:($1/50) with step lc 4 lw 2  dt "-" title "RS, -1013",\
     
unset rmargin

# 
# unset xrange
# set title "RAR len 10"
# set output "../plots/rar_len10_ecdf_fevals" . extension
# set xlabel "# function evaluations"
# # rank;run;nevals;expr;nll;coeff;nll 
# plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 7'  using 7:($1/50) with step lc 1        title "RS nll < -995",\
#      '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'        using ($2*10):($1/50) with step lc 1  dt "-" title "GP nll < -995",\
#      '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 7' using 7:($1/50) with step lc 2        title "RS nll < -1000",\
#      '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'       using ($2*10):($1/50) with step lc 2  dt "-" title "GP nll < -1000",\
#      '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010 7' using 7:($1/50) with step lc 3        title "RS nll < -1010",\
#      '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1010'       using ($2*10):($1/50) with step lc 3  dt "-" title "GP nll < -1010"
# 
# 
# set title "RAR len 10"
# set output "../plots/rar_len10_ecdf_restarts" . extension
# set xlabel "# param opt restarts"
# # rank;run;nevals;expr;nll;coeff;nll 
# plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 8'  using 8:($1/50) with step lc 1        title "RS nll < -995",\
#      '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'        using 2:($1/50) with step lc 1  dt "-" title "GP nll < -995",\
#      '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 8' using 8:($1/50) with step lc 2        title "RS nll < -1000",\
#      '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'       using 2:($1/50) with step lc 2  dt "-" title "GP nll < -1000",\
#      '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010 8' using 8:($1/50) with step lc 3        title "RS nll < -1010",\
#      '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1010'       using 2:($1/50) with step lc 3  dt "-" title "GP nll < -1010"
# 
# set title "RAR len 10"
# set output "../plots/rar_len10_ecdf_runtime" . extension
# set xlabel "runtime [s]"
# # rank;run;nevals;expr;nll;coeff;nll 
# plot '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 9'   using 9:($1/50) with step lc 1        title "RS nll < -995",\
#      '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 9'  using 9:($1/50) with step lc 2        title "RS nll < -1000",\
#      '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1010 9'  using 9:($1/50) with step lc 3        title "RS nll < -1010",\
# 



#      
# 
# 
# unset xrange
# set title "RAR len 12"
# set output "../plots/rar_len12_ecdf_fevals" . extension
# set xlabel "# function evaluations"
# # rank;run;nevals;expr;nll;coeff;nll 
# plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000 7' using 7:($1/50) with step lc 1        title "RS nll < -1000",\
#      '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'       using ($2*10):($1/50) with step lc 1  dt "-" title "GP nll < -1000",\
#      '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010 7' using 7:($1/50) with step lc 2        title "RS nll < -1010",\
#      '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1010'       using ($2*10):($1/50) with step lc 2  dt "-" title "GP nll < -1010",\
#      '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013 7' using 7:($1/50) with step lc 3        title "RS nll < -1013",\
#      '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'       using ($2*10):($1/50) with step lc 3  dt "-" title "GP nll < -1013"
# 
# 
# set title "RAR len 12"
# set output "../plots/rar_len12_ecdf_restarts" . extension
# set xlabel "# param opt restarts"
# # rank;run;nevals;expr;nll;coeff;nll 
# plot '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000 8' using 8:($1/50) with step lc 1        title "RS nll < -1000",\
#      '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'       using 2:($1/50) with step lc 1  dt "-" title "GP nll < -1000",\
#      '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010 8' using 8:($1/50) with step lc 2        title "RS nll < -1010",\
#      '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1010'       using 2:($1/50) with step lc 2  dt "-" title "GP nll < -1010",\
#      '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013 8' using 8:($1/50) with step lc 3        title "RS nll < -1013",\
#      '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'       using 2:($1/50) with step lc 3  dt "-" title "GP nll < -1013"


# # LEN 20
# set xrange[100:2000000]
# 
# set xlabel "# visited expressions"
# set title "RAR len 20"
# set output "../plots/rar_len20_ecdf" . extension
# # rank;run;nevals;expr;nll;coeff;nll 
# plot '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1000'     using 2:($1/50) with step lc 1 title "GP nll < -1000",\
#      '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005'     using 2:($1/50) with step lc 2 title "GP nll < -1005",\
#      '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010'     using 2:($1/50) with step lc 3 title "GP nll < -1010"  

set xrange[10:100000]
set xtics 10,10,90000

set output "../plots/nikuradse2_ecdf" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.15, 0.9 spacing 0.02,0
# GP based on mse
set title "Nikuradse len=10"
set ylabel "Success probability"
set xlabel "visited expressions"
unset key
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using 2:($1/50) with step lc 1 lw 2        title "GP, 0.02",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using 2:($1/50) with step lc 2 lw 2        title "GP, 0.01",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using 2:($1/50) with step lc 3 lw 2        title "GP, 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02'       using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.02",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01'       using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.01",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005'      using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027'     using 3:($1/50) with step lc 4 lw 2  dt "-" title "RS, 0.0027"

set xrange[100:2000000]
set xtics 100,100,900000
# GP based on mse
set key rmargin Left maxcols 1 samplen 2 spacing 0.8
unset ylabel
unset ytics
set title "Nikuradse len=12"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.02'          using 2:($1/50) with step lc 1 lw 2        title "GP, 0.02",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using 2:($1/50) with step lc 2 lw 2        title "GP, 0.01",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using 2:($1/50) with step lc 3 lw 2        title "GP, 0.005",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0027'        using 2:($1/50) with step lc 4 lw 2        title "GP, 0.0027",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using 2:($1/50) with step lc 5 lw 2        title "GP, 0.002",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using 2:($1/50) with step lc 6 lw 2        title "GP, 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.02'        using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.02", \
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01'        using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.01", \
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005'       using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, 0.005",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0027'      using 3:($1/50) with step lc 4 lw 2  dt "-" title "RS, 0.0027",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'       using 3:($1/50) with step lc 5 lw 2  dt "-" title "RS, 0.002",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using 3:($1/50) with step lc 6 lw 2  dt "-" title "RS, 0.0015",\
     
unset multiplot

# set title "Nikuradse len 10"
# set output "../plots/nikuradse2_len10_ecdf_fevals" . extension
# unset xrange
# set xlabel "# fevals"
# plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using ($2*10):($1/50) with step lc 1        title "GP MSE < 0.0200",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 7'     using 7:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
#      '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using ($2*10):($1/50) with step lc 2        title "GP MSE < 0.0100",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 7'     using 7:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
#      '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using ($2*10):($1/50) with step lc 3        title "GP MSE < 0.0050",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 7'    using 7:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 7'   using 7:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"
# 
# set title "Nikuradse len 10"
# set output "../plots/nikuradse2_len10_ecdf_restarts" . extension
# unset xrange
# set xlabel "# restarts"
# plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using 2:($1/50) with step lc 1        title "GP MSE < 0.0200",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 8'     using 8:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0200",\
#      '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0100",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 8'     using 8:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0100",\
#      '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using 2:($1/50) with step lc 3        title "GP MSE < 0.0050",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 8'    using 8:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0050",\
#      '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 8'   using 8:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0027 (best)"





# unset xrange
# set title "Nikuradse len 12"
# set output "../plots/nikuradse2_len12_ecdf_fevals" . extension
# unset xrange
# set xlabel "# fevals"
# plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using ($2*10):($1/50) with step lc 1        title "GP MSE < 0.0100",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 7'      using 7:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100",\
#      '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using ($2*10):($1/50) with step lc 2        title "GP MSE < 0.0050",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 7'     using 7:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
#      '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using ($2*10):($1/50) with step lc 3        title "GP MSE < 0.0020",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 7'     using 7:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
#      '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using ($2*10):($1/50) with step lc 4        title "GP MSE < 0.0015",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using ($2*10):($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)",\
# 
# set title "Nikuradse len 12"
# set output "../plots/nikuradse2_len12_ecdf_restarts" . extension
# unset xrange
# set xlabel "# restarts"
# plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using 2:($1/50) with step lc 1        title "GP MSE < 0.0100",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 8'      using 8:($1/50) with step lc 1 dt "-" title "RS MSE < 0.0100",\
#      '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using 2:($1/50) with step lc 2        title "GP MSE < 0.0050",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 8'     using 8:($1/50) with step lc 2 dt "-" title "RS MSE < 0.0050",\
#      '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using 2:($1/50) with step lc 3        title "GP MSE < 0.0020",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 8'     using 8:($1/50) with step lc 3 dt "-" title "RS MSE < 0.0020",\
#      '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using 2:($1/50) with step lc 4        title "GP MSE < 0.0015",\
#      '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'      using 2:($1/50) with step lc 4 dt "-" title "RS MSE < 0.0015 (best)"
# 

     
  

# Nikuradse mixed lengths
set key rmargin
set rmargin at screen 0.8
set title "Nikurase len 12"
set output "../plots/nikuradse2_mixed_len_ecdf" . extension
plot '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 12'         using 2:($1/50) with step lc 1 lw 2        title "GP, 0.002 \\& $len \leq 12$",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 12'        using 2:($1/50) with step lc 2 lw 2        title "GP, 0.0015 \\& $len \leq 12$",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'          using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.002",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'         using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.0015",\
     
     
set key rmargin
set title "Nikurase len 12"
set output "../plots/nikuradse2_mixed_simplifiedlen_ecdf" . extension
plot '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 100 12'         using 2:($1/50) with step lc 1 lw 2        title "GP, 0.002 \\& $len \leq 12$",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 100 12'        using 2:($1/50) with step lc 2 lw 2        title "GP, 0.0015 \\& $len \leq 12$",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'              using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.002",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'             using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.0015",\
     
     

