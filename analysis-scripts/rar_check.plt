set terminal pdf
set datafile separator comma
set output "rar_check.pdf"
set logscale y
set logscale x
set key bottom right
plot 'rar_check.csv' using 1:2 with dots title '1 / (1.068237475099997 ^{x^x} * x^{-0.504897963565596}) + x',\
     '../datasets/RAR.csv' using 1:2 with dots title 'data'