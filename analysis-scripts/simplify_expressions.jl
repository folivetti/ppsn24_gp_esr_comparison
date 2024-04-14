using ExhaustiveSymbolicRegression # requires simplify_semantic_analysis branch


# processes all run files in folder
function simplify_runs(folder; header = true, varnames=["x0", "x1"])
    for file in readdir(folder; join=true)
        if !isnothing(match(r"run[0-9]+.csv", file))
            println(file)
            simplify_run(file, header=header, varnames=varnames)
        end
    end
end

# parses run.csv files and adds the simplified expression and hash for the simplified expression to each line
# results are written to run_simplified.csv

# example for run files: 
# generation,individual_index,expression,fitness
# 0,0,((x0) + (abs(0.2138350494822749)**(1.144814669216602))) + ((x0) - (x0)),-0.6395738210323725

function simplify_run(filename; header=true, varnames=["x0", "x1"])
    newfilename = replace(filename, ".csv" => "") * "_simplified.csv"     
    open(filename, "r") do file
        open(newfilename, "w") do newfile
            lineno = 0
            for line in eachline(file)
                line = replace(line, "," => ";")
                lineno += 1
                if lineno == 1 && header
                    println(newfile,"$line;parsedexpr;parsedhash;numparam;len;simplifiedexpr;simplifiedhash;simplifiednumparam;simplifiedlen;" *
                                    "parsed_op_add;parsed_op_sub;parsed_op_mul;parsed_op_div;parsed_op_pow;parsed_op_abs")
                else
                    toks = split(line, ';')
                    gen = toks[1]
                    idx = toks[2]
                    exprstr = toks[3]
                    fitness = parse(Float64, toks[4])
                    (expr, coeff) = ExhaustiveSymbolicRegression.parse_infix(exprstr, varnames, Vector{String}(); numbers_as_parameters=true)
                    body = expr.args[2].args[1]

                    numparam = length(coeff)
                    len=expr_len(body)
                    opdict = countop!(Dict{Symbol, Int32}(), body)
                    (simplexpr, simplcoeff) = ExhaustiveSymbolicRegression.simplify(expr, coeff)
                    simplbody = simplexpr.args[2]
                    simplnumparam = length(simplcoeff)
                    simplen = expr_len(simplbody)
                    println(newfile, "$line;$(ExhaustiveSymbolicRegression.tostring(body));$(hash(body));$numparam;$len;"*
                                     "$(ExhaustiveSymbolicRegression.tostring(simplbody));$(hash(simplbody));$simplnumparam;$simplen;"*
                                     "$(get(opdict, :+, 0));$(get(opdict, :-, 0));$(get(opdict, :*, 0));$(get(opdict, :/, 0));$(get(opdict, :^, 0));$(get(opdict, :abs, 0))")
                end
            end
        end
    end
end

countop!(dict, sy::Symbol) = dict
countop!(dict, val::Number) = dict
function countop!(dict, expr::Expr) 
    head = expr.head
    if head == :call
        op = expr.args[1] # function or operator that is called
        freq = get!(dict, op, 0) # inserts default value if not found
        dict[op] = freq + 1
        for ch in expr.args[2:end]
            countop!(dict, ch)
        end
    elseif head == :ref
        # nothing to do
    else
        error("unexpected case")
    end
    dict
end



is_abs(expr) = expr isa Expr && expr.head == :call && expr.args[1] == :abs

expr_len(val::Number) = 1
expr_len(sy::Symbol) = 1
expr_len(a::LineNumberNode) = 0
function expr_len(expr::Expr)
    if expr.head == :->
        expr_len(expr.args[2])
    elseif expr.head == :ref
        1
    else
        @assert expr.head == :call || expr.head == :block dump(expr)
        if expr.args[1] == :^ && is_abs(expr.args[2])
            # count pow(abs(..)) as only one Symbol
            sum(expr_len, expr.args[2:end]) # sum the length of both arguments but do not include the power symbol
        elseif expr.args[1] == :/ && (expr.args[2] == 1.0 || expr.args[2] == -1.0)
            # count 1/... as one inv(...)
            1 + sum(expr_len, expr.args[3:end])
        else
            sum(expr_len, expr.args)
        end
    end
end
expr_depth(val::Number) = 1
expr_depth(sy::Symbol) = 1
expr_depth(a::LineNumberNode) = 0
function expr_depth(expr::Expr)
    if expr.head == :->
        expr_depth(expr.args[2])
    elseif expr.head == :block
        maximum(map(expr_depth, expr.args))
    elseif expr.head == :ref
        1
    else
        @assert expr.head == :call dump(expr)
        if expr.args[1] == :^ && is_abs(expr.args[2])
            # count pow(abs(..)) as only one Symbol
            1 + maximum([expr_depth(expr.args[2]) - 1, expr_depth(expr.args[3])])
        else
            1 + maximum(map(expr_depth, expr.args))
        end
    end
end