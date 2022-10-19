using Test, MOPS

@testset "par negative input" begin
    k = -1
    @test_throws ArgumentError par(k)
    k = -10
    @test_throws ArgumentError par(k)
end
