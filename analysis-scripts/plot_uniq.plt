set terminal pdf
set datafile separator ';'

set key tmargin
set ylabel "Number of expressions per generation"
set xrange[0:248]
set yrange[0:110]
set xlabel "Generations"

# TinyGP size 10
set output '../plots/nikuradse_2_size10_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'


set output '../plots/rar_size10_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'


### Operon size 10
set output '../plots/nikuradse_2_size10_operon_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$generation = floor($evals/100)'' then stats1 -g generation -a distinct_count -f evals,expr,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$generation = floor($evals/100); $p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'



###### TinyGP size 12
set output '../plots/nikuradse_2_size12_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'


set output '../plots/rar_size12_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'


###### Operon size 12
set output '../plots/nikuradse_2_size12_operon_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$generation = floor($evals/100)'' then stats1 -g generation -a distinct_count -f evals,expr,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$generation = floor($evals/100); $p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'



####### TinyGP size 20
set yrange[0:510] # popsize 500

set output '../plots/nikuradse_2_size20_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'


set output '../plots/rar_size20_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'

####### Operon size 20
set output '../plots/nikuradse_2_size20_operon_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$generation = floor($evals/500)'' then stats1 -g generation -a distinct_count -f evals,expr,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$generation = floor($evals/500); $p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -g generation -a sum -f p1_count' using 0:"p1_count_sum" with lines dt '.' lc 'black' title 'p1 evaluations'


########################
###### Cumulative counts
########################
set xrange[0:25000]
unset yrange
set xlabel "Visited expressions"
set ylabel "Cumulative number of expressions"

######## Tiny GP size 10
set output '../plots/nikuradse_2_size10_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'
#     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz put ''$x1_count = $simplifiedhash == 1329415668244161255 ? 1.0 : 0.0'' then stats1 -a sum -f x1_count -s' using 0:"x1_count_sum" with lines title 'x1 evaluations',\
#     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz put ''$x1_add_p1_count = $simplifiedhash == 13829915908818337755 ? 1.0 : 0.0'' then stats1 -a sum -f x1_add_p1_count -s' using 0:"x1_add_p1_count_sum" with lines title 'p1+x1 evaluations',\
     
set output '../plots/rar_size10_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'
#     '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz put ''$x1_count = $simplifiedhash == 1329415668244161255 ? 1.0 : 0.0'' then stats1 -a sum -f x1_count -s' using 0:"x1_count_sum" with lines title 'x1 evaluations',\
#     '< mlr --csv --fs '';'' --from ../results/rar_size10/run1_simplified.csv.gz put ''$x1_add_p1_count = $simplifiedhash == 13829915908818337755 ? 1.0 : 0.0'' then stats1 -a sum -f x1_add_p1_count -s' using 0:"x1_add_p1_count_sum" with lines title 'p1+x1 evaluations',\
     


########## Operon size 10
set output '../plots/nikuradse_2_size10_operon_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz stats1 -s -a distinct_count -f evals,expr,parsedhash,simplifiedhash then cut -f expr_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'
#     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$x1_count = $simplifiedhash == 1329415668244161255 ? 1.0 : 0.0'' then stats1 -a sum -f x1_count -s' using 0:"x1_count_sum" with lines title 'x1 evaluations',\
#     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size10/run1_simplified.csv.gz put ''$x1_add_p1_count = $simplifiedhash == 13829915908818337755 ? 1.0 : 0.0'' then stats1 -a sum -f x1_add_p1_count -s' using 0:"x1_add_p1_count_sum" with lines title 'p1+x1 evaluations',\
     

########### TinyGP size 12     
set output '../plots/nikuradse_2_size12_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'

set output '../plots/rar_size12_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'
#     '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz put ''$x1_count = $simplifiedhash == 1329415668244161255 ? 1.0 : 0.0'' then stats1 -a sum -f x1_count -s' using 0:"x1_count_sum" with lines title 'x1 evaluations',\
#     '< mlr --csv --fs '';'' --from ../results/rar_size12/run1_simplified.csv.gz put ''$x1_add_p1_count = $simplifiedhash == 13829915908818337755 ? 1.0 : 0.0'' then stats1 -a sum -f x1_add_p1_count -s' using 0:"x1_add_p1_count_sum" with lines title 'p1+x1 evaluations',\
     


########### Operon size 12

set output '../plots/nikuradse_2_size12_operon_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz stats1 -s -a distinct_count -f evals,expr,parsedhash,simplifiedhash then cut -f expr_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'
#     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$x1_count = $simplifiedhash == 1329415668244161255 ? 1.0 : 0.0'' then stats1 -a sum -f x1_count -s' using 0:"x1_count_sum" with lines title 'x1 evaluations',\
#     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size12/run1_simplified.csv.gz put ''$x1_add_p1_count = $simplifiedhash == 13829915908818337755 ? 1.0 : 0.0'' then stats1 -a sum -f x1_add_p1_count -s' using 0:"x1_add_p1_count_sum" with lines title 'p1+x1 evaluations',\
     


########## TinyGP size 20
set xrange[0:125000] # 500*250
set output '../plots/nikuradse_2_size20_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'

set output '../plots/rar_size20_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/rar_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'


########### Operon size 20
set output '../plots/nikuradse_2_size20_operon_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz stats1 -s -a distinct_count -f evals,expr,parsedhash,simplifiedhash then cut -f expr_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$p1_count = $simplifiedhash == 16109576223594199635 ? 1.0 : 0.0'' then stats1 -a sum -f p1_count -s' using 0:"p1_count_sum" with lines title 'p1 evaluations'
#     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$x1_count = $simplifiedhash == 1329415668244161255 ? 1.0 : 0.0'' then stats1 -a sum -f x1_count -s' using 0:"x1_count_sum" with lines title 'x1 evaluations',\
#     '< mlr --csv --fs '';'' --from ../results/operon/nikuradse_2_size20/run1_simplified.csv.gz put ''$x1_add_p1_count = $simplifiedhash == 13829915908818337755 ? 1.0 : 0.0'' then stats1 -a sum -f x1_add_p1_count -s' using 0:"x1_add_p1_count_sum" with lines title 'p1+x1 evaluations',\
     
