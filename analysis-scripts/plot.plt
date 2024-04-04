set terminal pdf

set datafile separator ';'
set key autotitle columnhead # skip first line

set ylabel 'fraction of expressions'
set xlabel 'logLik'

set logscale y
set format y "%g"
# nll over rank
set output '../plots/nikuradse_2_len10_distr.pdf'
file='../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked.txt'
set xrange[-1000:700]
stats file using 3:1 name 'nikuradse10' nooutput
plot file using (-$3):($1/(nikuradse10_records + nikuradse10_outofrange)) with lines title "ESR"

set output '../plots/nikuradse_2_len12_distr.pdf'
file = '../results/esr/nikuradse_2_size12/fittingresults_nikuradse_ranked.txt'
stats file using 3:1 name 'nikuradse12' nooutput
plot file using (-$3):($1/(nikuradse12_records + nikuradse12_outofrange))  with lines title "ESR"

# curves for both lengths in a single plot
set output '../plots/nikuradse_2_distr.pdf'
plot '../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked.txt' using (-$3):($1/(nikuradse10_records + nikuradse10_outofrange)) with lines title "ESR len=10",\
     '../results/esr/nikuradse_2_size12/fittingresults_nikuradse_ranked.txt' using (-$3):($1/(nikuradse12_records + nikuradse12_outofrange)) with lines title "ESR len=12"


set output '../plots/rar_len10_distr.pdf'
file = '../results/esr/rar_size10/fittingresults_rar_ranked.txt'
set xrange [0:1100]
stats file using 3:1 name 'rar10' nooutput
plot file using (-$3):($1/(rar10_records + rar10_outofrange)) with lines title "ESR"

set output '../plots/rar_len12_distr.pdf'
file='< zcat ../results/esr/rar_size12/fittingresults_rar_ranked.txt.gz'
stats file using 3:1 name 'rar12' nooutput
plot file using (-$3):($1/(rar12_records + rar12_outofrange)) with lines title "ESR"

# curves for both lengths in a single plot
set output '../plots/rar_distr.pdf'
plot '../results/esr/rar_size10/fittingresults_rar_ranked.txt' using (-$3):($1/(rar10_records + rar10_outofrange)) with lines title "ESR len=10",\
     '< zcat ../results/esr/rar_size12/fittingresults_rar_ranked.txt.gz' using (-$3):($1/(rar12_records + rar12_outofrange)) with lines title "ESR len=12"

unset logscale y
set output '../plots/rar_distr_yscale.pdf'
plot '../results/esr/rar_size10/fittingresults_rar_ranked.txt' using (-$3):($1/(rar10_records + rar10_outofrange)) with lines title "ESR len=10",\
     '< zcat ../results/esr/rar_size12/fittingresults_rar_ranked.txt.gz' using (-$3):($1/(rar12_records + rar12_outofrange)) with lines title "ESR len=12"
unset logscale x
unset yrange
unset xrange

# key for scatter plots
set key top left

# plot models for nikuradse_2 len 10
unset logscale x
unset logscale y
set xlabel "x"
set ylabel "y"
set samples 10000
set output '../plots/nikuradse_2_len10.pdf'

# n;1;2;3;4;5;6;7;8;9;10
# 1;p1 / (1.0 / (p2 + x) - p3 ^ x);-556.9439756680217;[0.3008681136542706, 0.6733527565497107, -0.45284796737000566, -0.05195082241417289];35962;35953;264;16;0;4;18.21685509
# DUPLICATE 2;p1 / (1.0 / (p2 - x) + p3 ^ x);-556.9439756670192;[-0.30086811261486995, -0.6733527125693481, 0.4528479731674669, 0.05195084686912565];36104;36095;262;18;0;7;17.554298902
# 3;1.0 / (p1 + abs(p2 + p3 ^ x) ^ p4);-547.044965684411;[0.455524443322374, -0.19111053641766093, -0.17685213286850085, 1.2164067923256552, 0.05339102833633362];49381;49364;293;47;0;15;35.223452367
# 4;p1 - abs(p2 + -1.0 / (p3 + x)) ^ p4;-497.93393070182753;[2.2620522470343785, 0.7727828926039556, 0.3008798424323267, 0.6768993471343056, -0.061148703359623045];35789;35772;234;106;0;19;19.744250759

esr_nikuradse2_10_1(x)=0.3008681136542706 / (1.0 / (0.6733527565497107 + x) - 0.45284796737000566 ** x) 
esr_nikuradse2_10_2(x)=1.0 / (0.455524443322374 + abs(-0.19111053641766093 + 0.17685213286850085 ** x) ** 1.2164067923256552)
esr_nikuradse2_10_3(x)=2.2620522470343785 - abs(0.7727828926039556 + -1.0 / (0.3008798424323267 + x)) ** 0.6768993471343056

set datafile separator comma
plot '../datasets/nikuradse_2.csv' using 1:2 with dots title "data",\
     esr_nikuradse2_10_1(x) with line title "ESR 1",\
     esr_nikuradse2_10_2(x) with line title "ESR 2",\
     esr_nikuradse2_10_3(x) with line title "ESR 3"



# n;1;2;3;4;5;6;7;8;9;10
# 1;p1 / (1.0 / (p2 - x) - p3 ^ (p4 ^ x));-668.6547708198748;[-2.222117918490698, -0.25295131557669676, 3.433805441623689e-5, 0.13702096272873504, 0.03815680479216008];28504;28487;138;202;0;36;21.157990458
# DUPLICATE 2;p1 / (1.0 / (p2 + x) + p3 ^ (p4 ^ x));-668.6547708198007;[2.2221178362022687, 0.2529513366663108, -3.433810352807388e-5, -0.1370209875630055, 0.03815680906869558];26977;26960;123;217;0;28;21.717293198
# 3;p1 / (abs(x) ^ -x - p2 ^ (p3 ^ x));-661.1879708742023;[-1.927580429721346, -4.042534139013752, 0.4626950261513254, -0.03895201922036024];11785;11776;80;179;0;75;12.442506798
# DUPLICATE 4;p1 / (p2 ^ (p3 ^ x) - abs(1.0 / x) ^ x);-661.1879708742022;[1.927580431816604, 4.042534136469229, 0.4626950274627606, -0.0389520185097851];10824;10815;70;210;0;66;9.694095837
# DUPLICATE 5;p1 / (abs(1.0 / x) ^ x - p2 ^ (p3 ^ x));-661.187970874199;[-1.9275804350248278, -4.0425341484973325, -0.4626950281228838, -0.038952020829361673];10888;10879;67;213;0;64;9.961947619
# 6;p1 - abs(p2 + -1.0 / (p3 - p4 ^ x)) ^ p5;-642.5677312213526;[2.1599179109043236, -2.101400095710107, -0.3724608457307987, -0.0954766211313884, 1.4308150149465624, 0.041008068043925906];51073;51040;280;120;0;6;22.421377723

# plot models for nikuradse_2 len 12
esr_nikuradse2_12_1(x)=-2.222117918490698 / (1.0 / (-0.25295131557669676 - x) - 3.433805441623689e-5 ** (0.13702096272873504 ** x))
esr_nikuradse2_12_2(x)=-1.927580429721346 / (abs(x) ** -x - 4.042534139013752 ** (0.4626950261513254 ** x))
esr_nikuradse2_12_3(x)=2.1599179109043236 - abs(-2.101400095710107 + -1.0 / (-0.3724608457307987 - 0.0954766211313884 ** x)) ** 1.4308150149465624
set output '../plots/nikuradse_2_len12.pdf'
plot '../datasets/nikuradse_2.csv' using 1:2 with dots title "data",\
     esr_nikuradse2_12_1(x) with line title "ESR 1",\
     esr_nikuradse2_12_2(x) with line title "ESR 2",\
     esr_nikuradse2_12_3(x) with line title "ESR 3"


# plot RAR len 10
set logscale x
set logscale y

# n;1;2;3;4;5;6;7;8;9;10
# 1;1.0 / (p1 + abs(p2 + abs(x) ^ p3) ^ p4);-1002.3409364613959;[0.018006544923177555, -0.2760156709678234, -0.2971832094207702, 1.7515977075079971, -0.0805857551180957, -0.5025184341869173, 0.7399037066655398];62476;62475;326;134;0;18;542.856112939
# DUPLICATE 2;1.0 / (p1 - abs(p2 + abs(x) ^ p3) ^ p4);-1002.3409364590589;[-0.018006421855819413, -0.27601522405795453, -0.297182755589866, 1.7516007575333878, 0.08058579491405887, -0.5025191136129609, -0.7399036046852624];63607;63606;355;105;0;10;145.586424617
# 3;p1 ^ (p2 - abs(x) ^ p3) - x;-1002.0572884848282;[1.3901083781647179e-5, 0.910750395396945, 0.07225605289484723, 0.08060908287264575, -0.5025295166347075, 0.7399856535558762];40780;40778;231;100;0;1;106.611579992
# DUPLICATE 4;p1 ^ (p2 - abs(1.0 / x) ^ p3) - x;-1002.0572884769697;[-1.390183897778798e-5, 0.9107499846414503, -0.07225640863726829, 0.08060908949831899, -0.5025292103945913, -0.7399858574698234];41230;41228;236;98;0;2;113.759939018
# DUPLICATE 5;x - p1 ^ (p2 - abs(x) ^ p3);-1002.0572882599361;[1.390072488525905e-5, 0.910750425326041, 0.0722560377706656, -0.0806089027396649, -0.5025293716125293, 0.7399860482600139];43746;43744;265;90;0;1;115.696060009
# 6;1.0 / (p1 + p2 ^ (p3 ^ (abs(x) ^ p4)));-1001.9527055830329;[-0.992933975821711, -358.5992450223275, -0.07763149586146882, 0.2223180296608993, 0.08064963402386001, -0.5024959900148084, -0.7398880010189128];21211;21204;24;213;3;1;77.135439258
esr_rar_10_1(x)=1.0 / (0.018006544923177555 + abs(-0.2760156709678234 + abs(x) **  -0.2971832094207702) ** 1.7515977075079971)
esr_rar_10_2(x)=1.3901083781647179e-5 ** (0.910750395396945 - abs(x) ** 0.07225605289484723) - x
esr_rar_10_3(x)=1.0 / (-0.992933975821711 + 358.5992450223275 ** (0.07763149586146882 ** (abs(x) ** 0.2223180296608993)))
set output '../plots/rar_len10.pdf'
plot '../datasets/RAR.csv' using 1:2 with dots title "data",\
     esr_rar_10_1(x) with line title "ESR 1",\
     esr_rar_10_2(x) with line title "ESR 2",\
     esr_rar_10_3(x) with line title "ESR 3"

# plot RAR len 12
# n;1;2;3;4;5;6;7;8;9;10
# 1;p1 * abs(x) ^ (-1.0 / (p2 + abs(p3 + x) ^ p4));-1013.2384638792784;[-1.7302245173940842, -2.40586258570395, -0.017892186956077034, 0.051284150873232376, 0.07915900803213895, -0.5024228473024372, -0.7397713386530679];33446;33444;318;65;0;3;251.039409717
# DUPLICATE 2;p1 * abs(x) ^ (1.0 / (p2 - abs(p3 + x) ^ p4));-1013.2384637845921;[-1.7302169269405268, 2.4058631050573074, -0.017892185557353994, 0.051285015586606246, -0.07915923994288941, -0.502424380432485, 0.7397716453383808];34648;34646;323;56;0;2;85.076564159
# 3;1.0 / (p1 ^ (abs(p2 + x) ^ p3) - abs(x) ^ p4);-1011.7646849614036;[0.4071110905561187, -0.017525486114932452, 0.22156731497379784, -0.5016951493294719, 0.07955245685092333, -0.5020357283705413, 0.7395350424413347];31326;31316;143;202;2;4;314.893725137
# 4;p1 + (abs(p2 + -1.0 / (p3 - x)) ^ x - x);-1010.8428845579119;[-1.0252474430328333, -0.775258498296267, -1.2719727716586922, -0.07914707905946171, -0.502644943118263, 0.7394415194348706];48339;48338;349;51;0;2;94.707817502
esr_rar_12_1(x)=abs(-1.7302245173940842 * abs(x) ** (-1.0 / (-2.40586258570395 + abs(-0.017892186956077034 + x) ** 0.051284150873232376)))
esr_rar_12_2(x)=abs(1.0 / (0.4071110905561187 ** (abs(-0.017525486114932452 + x) **  0.22156731497379784) - abs(x) ** -0.5016951493294719))
esr_rar_12_3(x)=abs(-1.0252474430328333 + (abs(-0.775258498296267 + -1.0 / (-1.2719727716586922 - x)) ** x - x))
set output '../plots/rar_len12.pdf'
plot '../datasets/RAR.csv' using 1:2 with dots title "data",\
     esr_rar_12_1(x) with line title "ESR 1",\
     esr_rar_12_2(x) with line title "ESR 2",\
     esr_rar_12_3(x) with line title "ESR 3"
unset output
