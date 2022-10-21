using Test, MOPS, Symbolics

@testset "sfact" begin
    @test sfact(2, 0) == 1
    @test sfact(3, 5) == 3 * 4 * 5 * 6 * 7

    @variables x
    @test isequal(sfact(x, 3), x * (1 + x) * (2 + x))
end

@testset "gsfact" begin
    @test Int(gsfact(1, 3, [3, 2, 1])) == 360
    @test Int(gsfact(2, 2, [4, 2, 2, 1])) == 450
end

@testset "rho" begin
    @test rho(2, [3, 1]) == 5
    @test rho(1, [4, 1, 1]) == 6
end
