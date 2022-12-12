using SafeTestsets

@time @safetestset "partition" begin include("partition.jl") end
@time @safetestset "utils" begin include("utils.jl") end
@time @safetestset "jack" begin include("jack.jl") end
