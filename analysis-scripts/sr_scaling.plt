set terminal cairolatex pdf input size 10cm,5cm
set datafile separator ' '
set output '../plots/sr-scaling.tex'
set xlabel "Maximum length"
set ylabel "Count"
set logscale y
set logscale y2

numtrees(x)=a*x+b
fit numtrees(x) 'sr_scaling.txt' using 1:(log($2)) via a,b

# Final set of parameters            Asymptotic Standard Error
# =======================            ==========================
# a               = 1.82483          +/- 0.0119       (0.6519%)
# b               = -2.92767         +/- 0.1181       (4.033%)

numexpr(x)=c*x+d
fit numexpr(x) 'sr_scaling.txt' using 1:(log($3)) via c,d
# Final set of parameters            Asymptotic Standard Error
# =======================            ==========================
# c               = 1.30011          +/- 0.01051      (0.8084%)
# d               = -1.71508         +/- 0.09253      (5.395%)

set key top left reverse Left
plot 'sr_scaling.txt' using 1:2 with points title "Trees",\
     (exp(numtrees(x))) lt 1 dt '.' title "0.053 exp(1.82 x)",\
     '' using 1:3 with points lt 2 title "Unique expressions",\
     (exp(numexpr(x))) lt 2 dt '.' title "0.18 exp(1.3 x)"# ,\
     # '' using 1:($2/$3) with lines axes x1y2 lt 3 title "Factor"