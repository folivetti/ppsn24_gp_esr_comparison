#set terminal pdf
#extension = ".pdf"

set terminal cairolatex pdf input size 12cm,7cm header "\\footnotesize"
extension=".tex"

## for testing
#set terminal pdfcairo  font ", 9" size 12cm,6cm
#extension=".pdf"


set datafile separator ';'

set ylabel "Fraction of expr."
set xrange[0:248]
set yrange[0:1]
set xlabel "Generations"

########## TinyGP Nikuradse
set output '../plots/nikuradse_2_run1_uniq' . extension
set multiplot layout 2,3 margin 0.1, 0.99, 0.3, 0.90 spacing 0.01,0.15
###### TinyGP size 10
unset key
set title "Len=10, Pop=100"
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:($3/100) with lines title "distinct expr",\
     '' using 1:($4/100) with lines title "distinct structures",\
     '' using 1:($5/100) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/100) with lines dt '.' lc 'black' title 'p1 evaluations'

unset ylabel
unset ytics
###### TinyGP size 12
set title "Len=12, Pop=100"
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:($3/100) with lines title "distinct expr",\
     '' using 1:($4/100) with lines title "distinct structures",\
     '' using 1:($5/100) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/100) with lines dt '.' lc 'black' title 'p1 evaluations'

###### TinyGP size 20
set key at screen 0.5,0.1 center width -10 maxrows 2
set title "Len=20, Pop=500"
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:($3/500) with lines title "distinct expr",\
     '' using 1:($4/500) with lines title "distinct structures",\
     '' using 1:($5/500) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/500) with lines dt '.' lc 'black' title 'p1 evaluations'

unset title
unset key

######### Cumulative plots
set xrange [0:25000]
set xtics 5000,10000,15000
set ylabel "Fraction of evals."
set xlabel "Evaluations"
set ytics 
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/25000) with lines title 'distinct expr',\
     '' using 0:($2/25000) with lines title "distinct structures",\
     '' using 0:($3/25000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/25000) with lines  dt '.' lc 'black' title 'p1 evaluations'

unset ylabel
unset ytics
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/25000) with lines title 'distinct expr',\
     '' using 0:($2/25000) with lines title "distinct structures",\
     '' using 0:($3/25000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/25000) with lines  dt '.' lc 'black' title 'p1 evaluations'

set xrange [0:125000]
set xtics 5000,50000,100000
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/125000) with lines title 'distinct expr',\
     '' using 0:($2/125000) with lines title "distinct structures",\
     '' using 0:($3/125000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/125000) with lines  dt '.' lc 'black' title 'p1 evaluations'

unset xrange 
unset xtics
unset multiplot


########## TinyGP RAR
set output '../plots/rar_run1_uniq' . extension
set multiplot layout 2,3 margin 0.1, 0.99, 0.3, 0.90 spacing 0.01,0.15
###### RAR size 10
set ylabel "Fraction of expr."
set yrange [0:1]
set ytics
set xlabel "Generations"
set xrange [0:250]
set xtics 0,50,200
unset key
set title "Len=10, Pop=100"
plot '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:($3/100) with lines title "distinct expr",\
     '' using 1:($4/100) with lines title "distinct structures",\
     '' using 1:($5/100) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/100) with lines dt '.' lc 'black' title 'p1 evaluations'

unset ylabel
unset ytics
###### RAR size 12
set title "Len=12, Pop=100"
plot '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:($3/100) with lines title "distinct expr",\
     '' using 1:($4/100) with lines title "distinct structures",\
     '' using 1:($5/100) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/100) with lines dt '.' lc 'black' title 'p1 evaluations'

###### RAR size 20
set key at screen 0.5,0.1 center width -10 maxrows 2
set title "Len=20, Pop=500"
plot '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:($3/500) with lines title "distinct expr",\
     '' using 1:($4/500) with lines title "distinct structures",\
     '' using 1:($5/500) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/500) with lines dt '.' lc 'black' title 'p1 evaluations'

unset title
unset key

##### Cumulative plots
set xrange [0:25000]
set xtics 5000,10000,15000
set ylabel "Fraction of evals."
set xlabel "Evaluations"
set ytics 
plot '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/25000) with lines title 'distinct expr',\
     '' using 0:($2/25000) with lines title "distinct structures",\
     '' using 0:($3/25000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/25000) with lines  dt '.' lc 'black' title 'p1 evaluations'

unset ylabel
unset ytics
plot '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/25000) with lines title 'distinct expr',\
     '' using 0:($2/25000) with lines title "distinct structures",\
     '' using 0:($3/25000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/25000) with lines  dt '.' lc 'black' title 'p1 evaluations'

set xrange [0:125000]
set xtics 5000,50000,100000
plot '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/125000) with lines title 'distinct expr',\
     '' using 0:($2/125000) with lines title "distinct structures",\
     '' using 0:($3/125000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/125000) with lines  dt '.' lc 'black' title 'p1 evaluations'

unset xrange 
unset xtics

unset multiplot


############## Operon

set ylabel "Fraction of expr."
set xrange[0:248]
set yrange[0:1]
set xlabel "Generations"

########## Operon Nikuradse
set output '../plots/nikuradse_2_run1_operon_uniq' . extension
set multiplot layout 2,3 margin 0.1, 0.99, 0.3, 0.90 spacing 0.01,0.15
###### Operon size 10
unset key
set title "Len=10, Pop=100"
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$generation = floor($evals/100)'' then stats1 -g generation -a distinct_count -f evals,expr,parsedhash,simplifiedhash' using 1:($3/100) with lines title "distinct expr",\
     '' using 1:($4/100) with lines title "distinct structures",\
     '' using 1:($5/100) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$generation = floor($evals/100); $p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/100) with lines dt '.' lc 'black' title 'p1 evaluations'

unset ylabel
unset ytics
###### Operon size 12
set title "Len=12, Pop=100"
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$generation = floor($evals/100)'' then stats1 -g generation -a distinct_count -f evals,expr,parsedhash,simplifiedhash' using 1:($3/100) with lines title "distinct expr",\
     '' using 1:($4/100) with lines title "distinct structures",\
     '' using 1:($5/100) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$generation = floor($evals/100); $p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/100) with lines dt '.' lc 'black' title 'p1 evaluations'

###### Operon size 20
set key at screen 0.5,0.1 center width -10 maxrows 2
set title "Len=20, Pop=500"
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$generation = floor($evals/500)'' then stats1 -g generation -a distinct_count -f evals,expr,parsedhash,simplifiedhash' using 1:($3/500) with lines title "distinct expr",\
     '' using 1:($4/500) with lines title "distinct structures",\
     '' using 1:($5/500) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$generation = floor($evals/500); $p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:(column("p1_count_sum")/500) with lines dt '.' lc 'black' title 'p1 evaluations'

unset title
unset key

######### Cumulative plots
set xrange [0:25000]
set xtics 5000,10000,15000
set ylabel "Fraction of evals."
set xlabel "Evaluations"
set ytics 
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz stats1 -s -a distinct_count -f evals,expr,parsedhash,simplifiedhash then cut -f expr_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/25000) with lines title 'distinct expr',\
     '' using 0:($2/25000) with lines title "distinct structures",\
     '' using 0:($3/25000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/25000) with lines  dt '.' lc 'black' title 'p1 evaluations'

unset ylabel
unset ytics
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz stats1 -s -a distinct_count -f evals,expr,parsedhash,simplifiedhash then cut -f expr_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/25000) with lines title 'distinct expr',\
     '' using 0:($2/25000) with lines title "distinct structures",\
     '' using 0:($3/25000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/25000) with lines  dt '.' lc 'black' title 'p1 evaluations'

set xrange [0:125000]
set xtics 5000,50000,100000
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz stats1 -s -a distinct_count -f evals,expr,parsedhash,simplifiedhash then cut -f expr_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:($1/125000) with lines title 'distinct expr',\
     '' using 0:($2/125000) with lines title "distinct structures",\
     '' using 0:($3/125000) with lines title "distinct structures (simplified)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:(column("p1_count_sum")/125000) with lines  dt '.' lc 'black' title 'p1 evaluations'

unset xrange 
unset xtics
unset multiplot
