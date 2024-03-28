using ExhaustiveSymbolicRegression # requires simplify_semantic_analysis branch


# processes all run files in folder
function simplify_runs(folder)
    for file in readdir(folder; join=true)
        if !isnothing(match(r"run[0-9]+.csv", file))
            simplify_run(file)
        end
    end
end

# parses run.csv files and adds the simplified expression and hash for the simplified expression to each line
# results are written to run_simplified.csv

# example for run files: 
# generation,individual_index,expression,fitness
# 0,0,((x0) + (abs(0.2138350494822749)**(1.144814669216602))) + ((x0) - (x0)),-0.6395738210323725
function simplify_run(filename)
    newfilename = replace(filename, ".csv" => "") * "_simplified.csv"     
    open(filename, "r") do file
        open(newfilename, "w") do newfile
            lineno = 0
            for line in eachline(file)
                lineno += 1
                if lineno == 1
                    println(newfile,"$line,prasedexpr,parsedhash,simplifiedexpr,simplifiedhash")
                else
                    toks = split(line, ',')
                    gen = toks[1]
                    idx = toks[2]
                    exprstr = toks[3]
                    fitness = parse(Float64, toks[4])
                    (expr, coeff) = ExhaustiveSymbolicRegression.parse_infix(exprstr, ["x0", "x1"], Vector{String}(); numbers_as_parameters=true)
                    (simplexpr, simplcoeff) = ExhaustiveSymbolicRegression.simplify(expr, coeff)
                    body = expr.args[2].args[1]
                    simplbody = simplexpr.args[2]
                    
                    println(newfile, "$line,$(ExhaustiveSymbolicRegression.tostring(body)),$(hash(body)),$(ExhaustiveSymbolicRegression.tostring(simplbody)),$(hash(simplbody))")
                end
            end
        end
    end
end
