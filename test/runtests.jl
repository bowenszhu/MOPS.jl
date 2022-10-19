using SafeTestsets

@safetestset "Aqua" begin
    using Aqua, MOPS
    Aqua.test_all(MOPS)
end
