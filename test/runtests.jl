using SafeTestsets

@safetestset "Aqua" begin
    using Aqua, SymbolicMultivariateOrthogonalPolynomials
    Aqua.test_all(SymbolicMultivariateOrthogonalPolynomials)
end
