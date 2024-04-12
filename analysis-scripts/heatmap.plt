set terminal pdf
set datafile separator ';'

set xrange[0:0.2]
# MSE - length
set output '../plots/esr-nikuradse-size10-heatmap.pdf'
set title "Nikuradse size 10"
set xlabel "MSE"
set ylabel "Length"
plot '< gunzip -c ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz' using 12:14 with dots notitle

# set output 'esr-nikuradse-size10-mse-over-depth.odf'
set title "Nikuradse size 10"
set xlabel "MSE"
set ylabel "Depth"
plot '< gunzip -c ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz' using 12:15 with dots notitle


# set output 'esr-nikuradse-size10-depth-over-length-mse.odf'
set title "Nikuradse size 10"
set xlabel "MSE"
set ylabel "Length"
plot '< gunzip -c ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz' using 12:14 with points notitle

unset xrange
# set output 'esr-nikuradse-size10-depth-over-length.odf'
set title "Nikuradse size 10"
set xlabel "Length"
set ylabel "Depth"
plot '< gunzip -c ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz' using 14:15 with dots notitle

unset output