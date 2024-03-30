set terminal pdf

set datafile separator ';'

set xlabel 'rank'
set ylabel 'nll'

set logscale x

# nll over rank
set output 'nikuradse_2_len10.pdf'
set yrange [:0]
plot '../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked.txt' using 1:3 with lines

# best ESR and GP for len 10
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


set output 'nikuradse_2_len12.pdf'
# preliminary for len 12
esr_12_1(x)= -2.222117918490698 / (1.0 / (-0.25295131557669676 - x) - 3.433805441623689e-5 ** (0.13702096272873504 ** x)) # ;-668.6547708198748;[, , , , 0.03815680479216008];28504;28487;138;202;0;36;21.157990458
esr_12_2(x)= 1.927580431816604 / (4.042534136469229 ** (0.4626950274627606 ** x) - abs(1.0 / x) ** x) # ;-661.1879708742022;[, , , -0.0389520185097851];10824;10815;70;210;0;66;9.694095837
esr_12_3(x)= 2.1599179109043236 - abs(-2.101400095710107 + -1.0 / (-0.3724608457307987 - 0.0954766211313884 ** x)) ** 1.4308150149465624 # ;-642.5677312213526;[, , , , , 0.041008068043925906];51073;51040;280;120;0;6;22.421377723
plot '../datasets/nikuradse_2.csv' using 1:2 with dots title "data",\
     esr_12_1(x) with line title "ESR 1",\
     esr_12_1(x) with line title "ESR 2",\
     esr_12_1(x) with line title "ESR 3"
