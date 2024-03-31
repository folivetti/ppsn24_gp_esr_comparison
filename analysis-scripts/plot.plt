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
set samples 10000
esr1(x)=0.3008681136542706 / (1.0 / (0.6733527565497107 + x) - 0.45284796737000566 ** x) # ; -556.9439756680217;[, , , -0.05195082241417289];35962;35953;264;16;0;4;18.21685509
esr2(x)=1.0 / (0.455524443322374 + abs(-0.19111053641766093 + 0.17685213286850085 ** x) ** 1.2164067923256552) # ;-547.044965684411;[, , , , 0.05339102833633362];49381;49364;293;47;0;15;35.223452367
esr3(x)=2.2620522470343785 - abs(0.7727828926039556 + -1.0 / (0.3008798424323267 + x)) ** 0.6768993471343056 # ;-497.93393070182753;[, , , , -0.061148703359623045];35789;35772;234;106;0;19;19.744250759
best_gp(x)=abs(-1.3069683836971457)**(abs((x) * (-2.716705945913883))**(abs(x)**(-1.112439179748925)))
set datafile separator comma
plot '../datasets/nikuradse_2.csv' using 1:2 with dots title "data",\
     esr1(x) with line title "ESR 1",\
     esr2(x) with line title "ESR 2",\
     esr3(x) with line title "ESR 3",\
     best_gp(x) with line lc 'black' title "GP 1"

