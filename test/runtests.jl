using SafeTestsets

@safetestset "partition" begin include("partition.jl") end
@safetestset "utils" begin include("utils.jl") end
