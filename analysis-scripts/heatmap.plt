set terminal pdf
set datafile separator ','

# MSE - length
set output '../plots/esr-nikuradse-size10-heatmap.pdf'
set title "Nikuradse size 10"
set xlabel "Length"
set ylabel "MSE"
plot '../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt_heatmap.csv' matrix with image


# # set output 'esr-nikuradse-size10-depth-over-length-mse.odf'
# set title "Nikuradse size 10"
# set xlabel "MSE"
# set ylabel "Length"
# plot '< gunzip -c ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz' using 12:14 with points notitle
# 
# unset xrange
# # set output 'esr-nikuradse-size10-depth-over-length.odf'
# set title "Nikuradse size 10"
# set xlabel "Length"
# set ylabel "Depth"
# plot '< gunzip -c ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz' using 14:15 with dots notitle
# 
unset output