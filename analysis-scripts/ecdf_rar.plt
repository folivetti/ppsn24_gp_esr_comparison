# set terminal pdf
# extension=".pdf"

set terminal cairolatex pdf input size 12cm,4.5cm header "\\footnotesize"
extension=".tex"

# for testing
#set terminal pdfcairo  font ", 9" size 12cm,5cm
#extension=".pdf"


set datafile separator ';'
set key autotitle columnhead # skip first line

set logscale x

set output "../plots/rar_ecdf" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.25, 0.85 spacing 0.02,0
set xlabel "Visited expressions"
set ylabel "Success probability"
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


################ over function evaluations

set output "../plots/rar_ecdf_fevals" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.25, 0.85 spacing 0.02,0
unset key
set ytics
set xlabel "Function evaluations"
set ylabel "Success probability"
set xrange[100:10000000000]
set xtics 100,1000,10000000000


set title "RAR len=10"
plot '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'         using 2:($1/50) with step lc 1 lw 2        title "GP, -995",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'        using 2:($1/50) with step lc 2 lw 2        title "GP, -1000",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1005'        using 2:($1/50) with step lc 3 lw 2        title "GP, -1005",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 7'   using 7:($1/50) with step lc 1 lw 2  dt "-" title "RS, -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 7'  using 7:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -10058 7' using 7:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1005",\
     

# LEN 12

unset ylabel
unset ytics

set key rmargin Left maxcols 1 samplen 2 spacing 0.8
set title "RAR len=12"
plot '< cd ../results/rar_size12 && bash prepare_ecdf.sh 995'        using 2:($1/50) with step lc 1 lw 2        title "GP  -995",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'       using 2:($1/50) with step lc 2 lw 2        title "GP, -1000",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1005'       using 2:($1/50) with step lc 3 lw 2        title "GP, -1005",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'       using 2:($1/50) with step lc 4 lw 2        title "GP, -1013",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -995 7'  using 7:($1/50) with step lc 1 lw 2  dt "-" title "RS, -995",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000 7' using 7:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005 7' using 7:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1005",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013 7' using 7:($1/50) with step lc 4 lw 2  dt "-" title "RS, -1013",\

unset multiplot



################ over restarts
set xrange[10:20000000]
set xtics 100,1000,20000000

set output "../plots/rar_ecdf_restarts" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.25, 0.85 spacing 0.02,0
unset key
set ytics
set xlabel "Param. opt. restarts"
set ylabel "Success probability"

set title "RAR len=10"
plot '< cd ../results/rar_size10 && bash prepare_ecdf.sh 995'         using 2:($1/50) with step lc 1 lw 2        title "GP, -995",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1000'        using 2:($1/50) with step lc 2 lw 2        title "GP, -1000",\
     '< cd ../results/rar_size10 && bash prepare_ecdf.sh 1005'        using 2:($1/50) with step lc 3 lw 2        title "GP, -1005",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -995 8'   using 8:($1/50) with step lc 1 lw 2  dt "-" title "RS, -995",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -1000 8'  using 8:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size10 && bash prepare_ecdf.sh -10058 8' using 8:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1005",\
     

# LEN 12

unset ylabel
unset ytics

set key rmargin Left maxcols 1 samplen 2 spacing 0.8
set title "RAR len=12"
plot '< cd ../results/rar_size12 && bash prepare_ecdf.sh 995'        using 2:($1/50) with step lc 1 lw 2        title "GP  -995",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1000'       using 2:($1/50) with step lc 2 lw 2        title "GP, -1000",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1005'       using 2:($1/50) with step lc 3 lw 2        title "GP, -1005",\
     '< cd ../results/rar_size12 && bash prepare_ecdf.sh 1013'       using 2:($1/50) with step lc 4 lw 2        title "GP, -1013",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -995 8'  using 8:($1/50) with step lc 1 lw 2  dt "-" title "RS, -995",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000 8' using 8:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005 8' using 8:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1005",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013 8' using 8:($1/50) with step lc 4 lw 2  dt "-" title "RS, -1013",\

unset multiplot



# RAR mixed lengths

set terminal cairolatex pdf input size 12cm,5.5cm header "\\footnotesize"
extension=".tex"

set output "../plots/rar_mixed_len_ecdf" . extension
set multiplot layout 1,2 margins 0.1, 0.7, 0.2, 0.85 spacing 0.02,0
set ytics
set ylabel "Success probability"
set xlabel "Visited expressions"
unset key
set title "RAR len $\\leq 12$"
plot '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1000 12'  using 2:($1/50) with step lc 1 lw 2        title "GP (20), -1000",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005 12'  using 2:($1/50) with step lc 2 lw 2        title "GP (20), -1005",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010 12'  using 2:($1/50) with step lc 3 lw 2        title "GP (20), -1010",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1013 12'  using 2:($1/50) with step lc 4 lw 2        title "GP (20), -1013",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000' using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005' using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1005",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010' using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013' using 3:($1/50) with step lc 4 lw 2  dt "-" title "RS, -1013",\

unset ylabel 
unset ytics
set key rmargin Left maxcols 1 samplen 2 spacing 0.8 width -5
set title "RAR simplified len $\\leq 12$"
plot '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1000 100 12'  using 2:($1/50) with step lc 1 lw 2        title "GP (20), -1000",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1005 100 12'  using 2:($1/50) with step lc 2 lw 2        title "GP (20), -1005",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1010 100 12'  using 2:($1/50) with step lc 3 lw 2        title "GP (20), -1010",\
     '< cd ../results/rar_size20 && bash prepare_ecdf.sh 1013 100 12'  using 2:($1/50) with step lc 4 lw 2        title "GP (20), -1013",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1000'     using 3:($1/50) with step lc 1 lw 2  dt "-" title "RS, -1000",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1005'     using 3:($1/50) with step lc 2 lw 2  dt "-" title "RS, -1005",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1010'     using 3:($1/50) with step lc 3 lw 2  dt "-" title "RS, -1010",\
     '< cd ../results/rs/rar_size12 && bash prepare_ecdf.sh -1013'     using 3:($1/50) with step lc 4 lw 2  dt "-" title "RS, -1013",\
     
unset multiplot

