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
