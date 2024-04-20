# set terminal pdf
# extension=".pdf"

set terminal cairolatex pdf input size 12cm,5.5cm header "\\footnotesize"
extension=".tex"

# for testing
#set terminal pdfcairo  font ", 9" size 12cm,5cm
#extension=".pdf"


set datafile separator ';'
set key autotitle columnhead # skip first line

set logscale x

set output "../plots/nikuradse2_ecdf" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.2, 0.85 spacing 0.02,0
# GP based on mse
set title "Nikuradse len=10"
set ylabel "Success probability"
set xlabel "Visited expressions"
set xrange[10:100000]
set xtics 10,10,90000
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


     
################ over function evaluations

set output "../plots/nikuradse2_ecdf_fevals" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.2, 0.85 spacing 0.02,0
# GP based on mse
set title "Nikuradse len=10"
set ylabel "Success probability"
set ytics
set xlabel "Function evaluations"
set xrange[100:10000000000]
set xtics 100,1000,10000000000
unset key
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using ($2*10):($1/50) with step lc 1 lw 2        title "GP, 0.02",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using ($2*10):($1/50) with step lc 2 lw 2        title "GP, 0.01",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using ($2*10):($1/50) with step lc 3 lw 2        title "GP, 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 7'     using 7:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.02",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 7'     using 7:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.01",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 7'    using 7:($1/50) with step lc 3 lw 2  dt "-" title "RS, 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 7'   using 7:($1/50) with step lc 4 lw 2  dt "-" title "RS, 0.0027"


# GP based on mse
set key rmargin Left maxcols 1 samplen 2 spacing 0.8
unset ylabel
unset ytics
set title "Nikuradse len=12"
plot '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.02'          using ($2*10):($1/50) with step lc 1 lw 2        title "GP, 0.02",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.01'          using ($2*10):($1/50) with step lc 2 lw 2        title "GP, 0.01",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.005'         using ($2*10):($1/50) with step lc 3 lw 2        title "GP, 0.005",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0027'        using ($2*10):($1/50) with step lc 4 lw 2        title "GP, 0.0027",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.002'         using ($2*10):($1/50) with step lc 5 lw 2        title "GP, 0.002",\
     '< cd ../results/nikuradse_2_size12 && bash prepare_ecdf.sh -0.0015'        using ($2*10):($1/50) with step lc 6 lw 2        title "GP, 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.02 7'      using 7:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.02", \
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 7'      using 7:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.01", \
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 7'     using 7:($1/50) with step lc 3 lw 2  dt "-" title "RS, 0.005",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0027 7'    using 7:($1/50) with step lc 4 lw 2  dt "-" title "RS, 0.0027",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 7'     using 7:($1/50) with step lc 5 lw 2  dt "-" title "RS, 0.002",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015 7'    using 7:($1/50) with step lc 6 lw 2  dt "-" title "RS, 0.0015",\
     
unset multiplot


################ over restarts

set output "../plots/nikuradse2_ecdf_restarts" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.2, 0.85 spacing 0.02,0
# GP based on mse
set title "Nikuradse len=10"
set ylabel "Success probability"
set ytics
set xlabel "Param. opt. restarts"
set xrange[10:10000000]
set xtics 100,1000,10000000

unset key
plot '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.02'         using 2:($1/50) with step lc 1 lw 2        title "GP, 0.02",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.01'         using 2:($1/50) with step lc 2 lw 2        title "GP, 0.01",\
     '< cd ../results/nikuradse_2_size10 && bash prepare_ecdf.sh -0.005'        using 2:($1/50) with step lc 3 lw 2        title "GP, 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.02 8'     using 8:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.02",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.01 8'     using 8:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.01",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.005 8'    using 8:($1/50) with step lc 3 lw 2  dt "-" title "RS, 0.0050",\
     '< cd ../results/rs/nikuradse_2_size10 && bash prepare_ecdf.sh 0.0027 8'   using 8:($1/50) with step lc 4 lw 2  dt "-" title "RS, 0.0027"


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
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.02 8'      using 8:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.02", \
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.01 8'      using 8:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.01", \
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.005 8'     using 8:($1/50) with step lc 3 lw 2  dt "-" title "RS, 0.005",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0027 8'    using 8:($1/50) with step lc 4 lw 2  dt "-" title "RS, 0.0027",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002 8'     using 8:($1/50) with step lc 5 lw 2  dt "-" title "RS, 0.002",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015 8'    using 8:($1/50) with step lc 6 lw 2  dt "-" title "RS, 0.0015",\
     
unset multiplot


set output "../plots/nikuradse2_mixed_len_ecdf" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.2, 0.85 spacing 0.02,0
set ytics
set ylabel "Success probability"
set xlabel "Visited expressions"
unset key
set xrange[100:2000000]
set xtics 100,100,900000

set title "Nikurase len $\\leq 12$"
plot '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 12'         using 2:($1/50) with step lc 1 lw 2        title  "GP (20), 0.002",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 12'        using 2:($1/50) with step lc 2 lw 2        title  "GP (20), 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'          using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.002",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'         using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.0015",\

unset ylabel
unset ytics
set key rmargin Left maxcols 1 samplen 2 spacing 0.8 width -4
set title "Nikurase simplified len $\\leq 12$"
plot '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.002 100 12'         using 2:($1/50) with step lc 1 lw 2        title  "GP (20), 0.002",\
     '< cd ../results/nikuradse_2_size20 && bash prepare_ecdf.sh -0.0015 100 12'        using 2:($1/50) with step lc 2 lw 2        title  "GP (20), 0.0015",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.002'              using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, 0.002",\
     '< cd ../results/rs/nikuradse_2_size12 && bash prepare_ecdf.sh 0.0015'             using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, 0.0015"
unset multiplot