using SafeTestsets

@safetestset "Aqua" begin
    using Aqua, MOPS
    Aqua.test_all(MOPS)
end
@safetestset "partition" begin include("partition.jl") end
@safetestset "utils" begin include("utils.jl") end
@safetestset "jack" begin include("jack.jl") end
