using ExhaustiveSymbolicRegression # for expression interpreter
using DataFrames, CSV

# calculate MSE for ESR expressions
function calculate_mse(filename)
    # Nikuradse:
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
                # println(line)
                toks = split(line, ';')
                exprstr = toks[2] 
                nll = parse(Float64, toks[3])
                (expr, _) = parse_infix(exprstr, ["x"], ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p"])
                # dump(expr)

                exprlen = expr_len(expr)
                exprdepth = expr_depth(expr)
                expr = create_sse_expr(expr)
                if startswith(toks[4], "[")
                    coeffstr = chop(toks[4]; head=1, tail=1) # remove [ and ]
                    coeff = map(s -> parse(Float64, s), split(coeffstr, ','))
                else
                    coeff = Vector(undef, 0)
                end
                if nll < floatmax()
                    sse = ExhaustiveSymbolicRegression.interpret(expr, X, coeff) # for nikuradse
                    # sse = 0 # for RAR we do not need SSE 
                else
                    sse = floatmax()
                end
                println(newfile, "$line;$(sse/length(x));$(length(coeff));$(exprlen);$(exprdepth)")
            end
        end
    end
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