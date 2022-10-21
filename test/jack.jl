using Test, MOPS

@testset "egen" begin
    @test MOPS.egen([1]) == [Int[], [1]]
    @test MOPS.egen([2]) == [[1], [2]]
    @test MOPS.egen([3, 2, 1]) ==
          [[2, 1], [2, 1, 1], [2, 2], [2, 2, 1], [3, 1], [3, 1, 1], [3, 2], [3, 2, 1]]
    @test MOPS.egen([3, 2]) == [[2, 1], [2, 2], [3, 1], [3, 2]]
    @test MOPS.egen([3, 3, 2]) ==
          [[2, 2, 1], [2, 2, 2], [3, 2, 1], [3, 2, 2], [3, 3, 1], [3, 3, 2]]
end

@testset "eval_jack" begin
    @test MOPS.eval_jack(1, [4, 2, 1], [5, 3, 2]) == 7944480
    @test MOPS.eval_jack(2, [4, 2, 1], [5, 3, 2]) == 28874880
    @test MOPS.eval_jack(1, [4, 2, 2, 1], [5, 3, 2]) == 0
    @test MOPS.eval_jack(1, [4, 2, 2, 1], [5, 3, 2, 1]) == 229320000
    @test MOPS.eval_jack(2, [4, 2, 2, 1], [5, 3, 2, 1]) ≈ 924636000
    @test MOPS.eval_jack(1, [4], [5]) == 15000
    @test MOPS.eval_jack(2, [4], [5]) == 65625
    @test MOPS.eval_jack(1, [], [5]) == 1
end
