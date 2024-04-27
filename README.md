# The Inefficiency of Genetic Programming for Symbolic Regression

Gabriel Kronberger, Fabricio Olivetti de Franca, Harry Desmond, Deaglan J. Bartlett, and Lukas Kammerer

We analyse the search behaviour of genetic programming for symbolic regression in practically relevant but limited settings, allowing to exhaustively enumerate all solutions. This enables us to quantify the success probability of finding the best possible expressions, and to compare the search efficiency of genetic programming to random search in the space of semantically unique expressions. 
This analysis is made possible by improved algorithms for equality saturation, which we use to improve an exhaustive symbolic regression algorithm to produce the set of semantically unique expression structures that is orders of magnitude smaller than the SR search space. We compare the efficiency of random search in the set of unique expressions and genetic programming.
For our experiments we use two real-world datasets, where symbolic regression has been used to produce well-fitting univariate expressions.
The results show that genetic programming in such limited settings explores only a small fraction of all unique expressions, and evaluates expressions repeatedly that are congruent to already visited expressions. 

[Supplement (PDF)](./PDF/Supplement%20-%20The_Inefficiency_of_Genetic_Programming_for_Symbolic_Regression.pdf)

## Organization of the repository

`GP`:  scripts with the adaptation of TinyGP to support univariate functions, parameter optimization and more than one variable
`datasets`:  datasets Nikuradse 1 and 2 and RAR in CSV format
`analysis-scripts`:  scripts used to generate the results
`results`: result files containing the expressions and their fitness visited during each one of the runs of TinyGP and Operon, the same files but with the simplfied expressions, and the set of enummerated expressions by ESR. 
`plots`: plots generated for the paper + additional plots available at the supplementary material
`PDF`: pdf of the main paper and supplementary material

The file `plots/allplots.pdf` contains all plots, even those that we did not include in the extended version of the paper.

## Tools

Most of the processing is done via bash scripts in the `analysis-scripts` folder. 
Some of the processing is done with  Julia scripts.
The Julia scripts depend on installation of ExhaustiveSymbolicRegression.jl (https://github.com/gkronber/ExhaustiveSymbolicRegression)

- `analyse_gp_runs.sh` produces the top results for GP and Operon for all datasets and length limits.
- `calculate_mse.jl` takes as input the files with optimized ESR solutions and calculates the MSE (for the Nikuradse dataset), as ESR only produces the log likelihood value. The script also calculates length and depth of ESR expressions.
- `simplify_expressions.jl` takes as input the logs of GP runs with expressions (from TinyGP and Operon) parses the expressions and simplifies them. For all of the versions a hash-value is also produced to identify duplicates easily. The script additionally calculates the length and depth of expressions and simplified expressions as well as the operator counts for the original expression.
- `heatmap.jl` produces 2d histograms for the ESR solution spaces.

gnuplot is used to produce plots from the csv files in the results folder (`*.plt` files). 
Just call gnuplot with the file as argument e.g. `> gnuplot sr_scaling.plt`. The result files are produced in the plots folder.

Most of the analysis scripts call `mlr` (https://miller.readthedocs.io/en/6.12.0/) which is a great command line tool for processing csv files.
