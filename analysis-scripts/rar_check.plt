set terminal pdf
set datafile separator comma
set output "rar_check.pdf"
set logscale y
set logscale x
set key bottom right
plot '../datasets/RAR.csv' using 1:2 with dots title 'data',\
     (1 / (1.068237475099997 **(x**x) * x**(-0.504897963565596)) + x) with lines title '1 / (1.068237475099997 ^{x^x} * x^{-0.504897963565596}) + x',\
     (1/(x**(x**x) * x**-1.3897287675733314) + x) with lines title '((1/((abs(x)**(abs(x)**(x))) * (abs(x)**(-1.3897287675733314)))) + (x))'
     