# The Inefficiency of Genetic Programming for Symbolic Regression

Gabriel Kronberger, Fabricio Olivetti de Franca, Harry Desmond, Deaglan J. Bartlett, and Lukas Kammerer

We analyse the search behaviour of genetic programming for
symbolic regression in practically relevant but limited settings, allow-
ing to exhaustively enumerate all solutions. This enables us to quantify
the success probability of finding the best possible expressions, and to
compare the search efficiency of genetic programming to random search
in the space of semantically unique expressions. This analysis is made
possible by improved algorithms for equality saturation, which we use to
calculate a set of semantically unique expression structures that is or-
ders of magnitude smaller than the SR search space. The experiments are
limited to two univariate real-world datasets where symbolic regression
has been used to produce well-fitting expressions. The results show that
genetic programming in such limited settings explores only a small frac-
tion of all unique expressions, and repeatedly evaluates expressions that
are congruent to already visited expressions, which limits its efficiency.

## Organization of the repository

`GP`:  scripts with the adaptation of TinyGP to support univariate functions, parameter optimization and more than one variable
`datasets`:  datasets Nikuradse 1 and 2 and RAR in CSV format
`analysis-scripts`:  scripts used to generate the results
`results`: result files containing the expressions and their fitness visited during each one of the runs of TinyGP and Operon, the same files but with the simplfied expressions, and the set of enummerated expressions by ESR. 
`plots`: plots generated for the paper + additional plots available at the supplementary material
`PDF`: pdf of the main paper and supplementary material
