using Test, MOPS, Symbolics

@testset "par negative input" begin
    k = -1
    @test_throws ArgumentError par(k)
    k = -10
    @test_throws ArgumentError par(k)
end

@testset "arm symbolic" begin
    @variables x
    κ = [x + 5, x + 1]
    i = 1
    j = 2
    @test isequal(arm(κ, i, j), x)
end
