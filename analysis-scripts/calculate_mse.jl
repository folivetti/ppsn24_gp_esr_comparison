using ExhaustiveSymbolicRegression # for expression interpreter
using DataFrames, CSV

# calculate MSE for ESR expressions
function calculate_mse(filename)
    df = CSV.read("/home/gkronber/ppsn24_gp_esr_comparison/datasets/nikuradse_2.csv", DataFrame)
    x = df[:, 1]    
    y = df[:, 2]
    X = [x y]
    # structure:
    #> head ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked.txt
    # n;1;2;3;4;5;6;7;8;9;10
    # 1;p1 / (1.0 / (p2 + x) - p3 ^ x);-556.9439756680217;[0.3008681136542706, 0.6733527565497107, -0.45284796737000566, -0.05195082241417289];35962;35953;264;16;0;4;18.21685509
    newfilename = replace(filename, ".txt" => "_mse.txt")
    open(newfilename, "w") do newfile
        open(filename, "r") do file
            for line in Iterators.drop(eachline(file), 1)
                println(line)
                toks = split(line, ';')
                exprstr = toks[2] 
                nll = toks[3]
                if startswith(toks[4], "[")
                    coeffstr = chop(toks[4]; head=1, tail=1) # remove [ and ]
                    coeff = map(s -> parse(Float64, s), split(coeffstr, ','))
                else
                    coeff = Vector(undef, 0)
                end
                (expr, _) = parse_infix(exprstr, ["x"], ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9"])
                expr = create_sse_expr(expr)
                sse = ExhaustiveSymbolicRegression.interpret(expr, X, coeff);
                println(newfile, "$line;$(sse/length(x))")
                
            end
        end
    end
end

# returns an expression that calculates the sum of squared errors
# this is a bit complicated because ExhaustiveSymbolicRegression so far only produces the sum of individual errors
# TODO: add function to ESR
function create_sse_expr(expr)
    Base.remove_linenums!(expr)
    paramTup = expr.args[1]
    xSy = paramTup.args[1]
    pSy = paramTup.args[2]

    # wrapping should be done outside of the likelihood (in the creation of the model)
    body = expr.args[2].args[1]
    :(($xSy, $pSy) -> ($xSy[2] - $body)^2)
end