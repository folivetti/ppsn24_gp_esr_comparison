set terminal pdf
set datafile separator ';'

set output '../plots/nikuradse_2_size10_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)"


set output '../plots/nikuradse_2_size10_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size10/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     x with lines title "evaluations expressions"


set output '../plots/nikuradse_2_size12_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)"

set output '../plots/nikuradse_2_size12_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size12/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     x with lines title "evaluations expressions"


set output '../plots/nikuradse_2_size20_run1_uniq.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz stats1 -g generation -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash' using 1:2 with lines title 'individuals',\
     '' using 1:3 with lines title "distinct parameterized expr",\
     '' using 1:4 with lines title "distinct expr (structures)",\
     '' using 1:5 with lines title "distinct simplified expr (structures)"

set output '../plots/nikuradse_2_size20_run1_uniq_accumulated.pdf'
plot '< mlr --csv --fs '';'' --from ../results/nikuradse_2_size20/run1_simplified.csv.gz stats1 -s -a distinct_count -f individual_index,expression,parsedhash,simplifiedhash then cut -f expression_distinct_count,parsedhash_distinct_count,simplifiedhash_distinct_count' using 0:1 with lines title 'distinct parameterized expr',\
     '' using 0:2 with lines title "distinct expr (structures)",\
     '' using 0:3 with lines title "distinct simplified expr (structures)",\
     x with lines title "evaluations expressions"
