using KernelDensity
using Interpolations
using Plots
using GZip
using CSV, Tables

# #test heatmap
# 
# x = sort(randn(5000))
# y = x * 2.3 + sort(randn(5000))
# 
# k = kde((x, y))
# ik = InterpKDE(k)
# 
# z = pdf(ik, x, y)
# 
# heatmap(x, y, z, c = :vik)
# 
# savefig("./heatmap.png");

# heatmap for ESR solutions with length and depth
# $ zcat ../results/esr/nikuradse_2_size10/fittingresults_nikuradse_ranked_mse.txt.gz | head
# 1;p1 / (1.0 / (p2 + x) - p3 ^ x);-556.9439756680217;[0.3008681136542706, 0.6733527565497107, -0.45284796737000566, -0.05195082241417289];35962;35953;264;16;0;4;18.21685509;0.0026988874840232616;4;11;5
function esr_heatmap(filename)
    GZip.open(filename, "r") do file

        x = Vector{Float64}()
        y = Vector{Float64}()
        for line in eachline(file)
            # println(line)
            toks = split(line, ';')
            nll=parse(Float64, toks[3])
            mse=parse(Float64, toks[12])        
            length=parse(Float64, toks[14])
            depth=parse(Float64, toks[15])

            if mse < 1.0 
                push!(y, length)
                push!(x, round(sqrt(mse); digits=4))
            end
        end
        println("$(length(x)) $(length(y))")
        k = kde((x,y); bandwidth=bandwidth=(0.01,1))
        # println("$(size(k))")
        ik = InterpKDE(k)
        reducedx = 0:0.001:1
        reducedy = 0:0.1:16
        z = pdf(ik, reducedx, reducedy)
        println("$(size(z))")
        # z

        # heatmapname = replace(filename, ".gz" => "_heatmap.csv")
        # CSV.write(heatmapname,  Tables.table(z), writeheader=false)

        pgfplotsx()
        # hm = heatmap(reducedx, reducedy, z, c = :vik)
        # savefig(hm, replace(filename, ".gz" => "_heatmap.png"))

        hist = histogram2d(x, y; bins = (0:0.01:1,0:1:16))
        savefig(hist, replace(filename, ".gz" => "_histogram.png"))
    end
end