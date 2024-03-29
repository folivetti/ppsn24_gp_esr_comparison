set terminal pdf

set datafile separator ';'

set xlabel 'rank'
set ylabel 'nll'

set logscale x

# nll over rank
set output 'nikuradse_2_len10.pdf'
set yrange [:0]
plot '../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked.txt' using 1:3 with lines

# best ESR
unset logscale x
unset yrange
set xlabel "x"
set ylabel "y"
esr1(x)=1.9116247679891756 ** (1.0 / (-7.996157713918589 + x) - (1.416062521843131 ** x)) # ;-386.3689568910696;[, , , -0.07265982632715351];16948;16937;280;38;0;17;12.803841533
esr2(x)=abs(1.82870425241755 + -1.0 / (4.648009520172379 + 0.28981791796433015 ** x)) ** x; # -363.9329613432593;[, , , -0.10184196984222925];25481;25472;221;61;0;7
set datafile separator comma
plot '../datasets/nikuradse_2.csv' using 1:2 with dots title "data",\
     esr1(x) with dots title "best ESR",\
     esr2(x) with dots title "2nd ESR",\
     1.2309251538355692 with dots title "mean"


