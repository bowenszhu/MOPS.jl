using Test, MOPS, Symbolics

@testset "sfact" begin
    @test sfact(3, 5) == 3 * 4 * 5 * 6 * 7

    @variables x
    @test isequal(sfact(x, 3), x * (1 + x) * (2 + x))
end
