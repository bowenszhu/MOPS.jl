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

@testset "parvalid" begin
    @test parvalid([])
    @test parvalid([5, 5, 4, 1])
    @test !parvalid([5, 5, 4, -1])
    @test !parvalid([5, 1, 4])
    @test !parvalid([5, 1, 0])
end

@testset "conjugate" begin
    @test conjugate(Int[]) == Int[]
    @test conjugate([3, 2, 2]) == [3, 3, 1]
    @test conjugate([7, 5, 3, 3, 2]) == [5, 5, 4, 2, 2, 1, 1]
end

@testset "leg" begin
    @test leg([4], 2, 1) == 0
    @test leg([3, 2, 2], 3, 1) == 0
    @test leg([3, 2, 2], 2, 1) == 2
    @test leg([3, 2, 2], 2, 2) == 1
end
