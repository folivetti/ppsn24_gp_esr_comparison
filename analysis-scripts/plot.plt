# set terminal pdf
# extension='.pdf'

set terminal cairolatex pdf input  size 6cm,4cm header "\\footnotesize"
extension=".tex"

# for testing
#set terminal pdfcairo  font ", 9" size 6cm,4cm
#extension=".pdf"


set datafile separator ';'
# set key autotitle columnhead # skip first line

set xlabel 'Fraction of expressions'
set ylabel 'MSE'

set logscale x
set format x "%g"
set xtics 1e-6,100,1
set yrange [0:0.1]

set key top left
# nll over rank
set output '../plots/nikuradse_2_len10_distr' . extension
file_niku_10='< mlr --fs '';'' --csv --implicit-csv-header --headerless-csv-output --from ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz sort -n 12 then cat -n'
# set xrange[-1000:700]

# Nikuradse-2 simple solutions:
# 655;p1 ^ (x * p2 ^ x);-205.19387879294123;[4.682827702646683, 0.44452991664764474, -0.13727453442047305];5640;5635;57;77;0;55;3.9187137;0.018844297460021364;3;7;4
# 5465;p1 * x + p2;12.258336978911998;[0.024538294168174428, 1.7580876451033518, -0.2503048408147103];8575;8570;55;0;0;55;2.26998658;0.06265251369818783;3;5;3
# 6544;p1;13.309966315176322;[1.79801105008965, -0.2510330485312239];1959;1956;35;0;0;35;0.562610219;0.06301759103812457;2;1;1
# 14906;x;440.85138715053824;[-0.817816712242031];372;370;15;0;0;15;0.118814066;0.6688241748187844;1;1;1
# 14273;p1 + x;432.75721959365126;[0.17102735016361126, 0.7997335950972455];1199;1196;35;0;0;35;0.334774249;0.6395738210321937;2;3;2
# 14179;p1 * x;432.50338257646234;[0.9037386957070468, -0.7991730055943305];1665;1662;35;0;0;35;0.460652152;0.6386775021098049;2;3;2

stats file_niku_10 using 1:13 name 'nikuradse10' nooutput
set arrow 1 from 0.06,0.06301759103812457 to 1,0.06301759103812457 nohead dt '.'
set label 1 "$p_1$" at 0.8,0.07 right
set arrow 2 from 0.006,0.01884 to 1,0.01884 nohead dt '.'
set label 2 "$p_1^{x p_2^x}$" at 0.8, 0.026  right
plot file_niku_10 using ($1/(nikuradse10_records + nikuradse10_outofrange)):13 with lines title "ESR"

set output '../plots/nikuradse_2_len12_distr' . extension
file_niku_12 = '< mlr --fs '';'' --csv --implicit-csv-header --headerless-csv-output --from ../results/esr/nikuradse_2_size12/fittingresults_nikuradse_ranked_mse.txt.gz sort -n 12 then cat -n'
stats file_niku_12 using 1:13 name 'nikuradse12' nooutput
plot file_niku_12 using ($1/(nikuradse12_records + nikuradse12_outofrange)):13  with lines title "ESR"

# curves for both lengths in a single plot
set output '../plots/nikuradse_2_distr' . extension
plot file_niku_10 using ($1/(nikuradse10_records + nikuradse10_outofrange)):13 with lines title "len=10",\
     file_niku_12 using ($1/(nikuradse12_records + nikuradse12_outofrange)):13 with lines title "len=12"

unset ylabel 
set yrange [0:0.01]
set xrange [1e-6:0.01]
# curves for both lengths in a single plot
set output '../plots/nikuradse_2_distr_zoom' . extension
plot file_niku_10 using ($1/(nikuradse10_records + nikuradse10_outofrange)):13 with lines notitle,\
     file_niku_12 using ($1/(nikuradse12_records + nikuradse12_outofrange)):13 with lines notitle

unset arrow 1
unset label 1
unset arrow 2
unset label 2

unset xrange
set key bottom left
set ylabel "LogLik"
set output '../plots/rar_len10_distr' . extension
## simple solutions for RAR
# 2520;p1 * abs(x) ^ p2;-906.4884220047759;[1.8235845411241511, 0.6667610774662592, 0.08588861167123577, -0.5034648298302491, 0.7419886688553087];7813;7811;103;13;0;95;13.27649652;0.0;5;5;3
# 4576;p1 * x + p2;-648.116916370563;[1.5405325322551837, 0.1881927938776106, -0.10645502913939864, -0.5029976709598329, 0.730362538158277];11348;11346;143;4;0;95;15.172699798;0.0;5;5;3
# 7694;p1 + x;-244.02216183518337;[0.2581442134192054, 0.14184507786137746, -0.49137712934790717, 0.7463075161443765];9479;9478;150;3;0;75;42.787358776;0.0;4;3;2
# 16453;p1 * x;890.5103774501652;[2.7483830232837088, -0.23879556673189395, -0.5086580417041469, -0.720348719433717];4964;4962;83;0;0;75;6.291692709;0.0;4;3;2
# 40895;x;2584.110971267746;[0.4957513315071035, -0.4929774304986182, 0.7375894139345711];2923;2922;62;0;0;55;3.640390009;0.0;3;1;1
# 41460;p1;2604.6529254125985;[0.8499751815613602, -0.5025468518950512, -0.5027739959886637, -0.7407943494874705];4587;4585;82;0;0;75;5.742140528;0.0;4;1;1

rar10file = '< zcat ../results/esr/rar_size10/fittingresults_rar_ranked_mse.txt.gz'
set yrange [0:1100]
stats rar10file using 1:3 name 'rar10' nooutput
set arrow 1 from 0.02,906.5 to 1,906.5 nohead dt '.'
set label 1 "$p_1\\, x^{p_2}$" at 0.02, 906.5 right
set arrow 2 from 0.02,648.11 to 1,648.11 nohead dt '.'
set label 2 "$p_1\\, x + p_2$" at 0.02,648.11 right
set arrow 3 from 0.02,244 to 1,244 nohead dt '.'
set label 3 "$p_1 + x$" at 0.02,244 right

plot rar10file using ($1/(rar10_records + rar10_outofrange)):(-$3) with lines title "ESR"

set output '../plots/rar_len12_distr' . extension
rar12file='< zcat ../results/esr/rar_size12/fittingresults_rar_ranked_mse.txt.gz'
stats rar12file using 1:3 name 'rar12' nooutput
plot rar12file using ($1/(rar12_records + rar12_outofrange)):(-$3) with lines title "ESR"

# curves for both lengths in a single plot
set output '../plots/rar_distr' . extension
plot rar10file using ($1/(rar10_records + rar10_outofrange)):(-$3) with lines notitle,\
     rar12file using ($1/(rar12_records + rar12_outofrange)):(-$3) with lines notitle

unset label 1
unset label 2
unset label 3
set yrange [960:1020]
unset ylabel
set output '../plots/rar_distr_zoom' . extension
plot rar10file using ($1/(rar10_records + rar10_outofrange)):(-$3) with lines title "len=10",\
     rar12file using ($1/(rar12_records + rar12_outofrange)):(-$3) with lines title "len=12",

set yrange [0:1100]
unset logscale x
set key top right
set output '../plots/rar_distr_yscale' . extension
plot rar10file using ($1/(rar10_records + rar10_outofrange)):(-$3) with lines title "len=10",\
     rar12file using ($1/(rar12_records + rar12_outofrange)):(-$3) with lines title "len=12"
unset logscale y
unset yrange
unset xrange

unset arrow 1
unset label 1
unset arrow 2
unset label 2
