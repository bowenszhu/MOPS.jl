using SpecialFunctions: gamma

"""
$(TYPEDSIGNATURES)

Compute the shifted factorial, which is the ratio of two factorials
```math
\\frac{(r+k+1)!}{(r-1)!}
```
for integral `k` or equivalently the ratio of two Gamma functions
```math
\\frac{Γ(r+k)}{Γ(r)}.
```

The shifted factorial is also known as the Pochhammer symbol and rising factorial.

# Examples
```jldoctest
julia> sfact(3, 5)
2520
```
"""
function sfact(r, k)
    if isinteger(k)
        return prod(r + i for i in 0:(Int(k) - 1))
    else
        return gamma(r + k) / gamma(r)
    end
end

"""
$(TYPEDSIGNATURES)

Compute the generalized shifted factorial.

The generalized shifted factorial extends the definition of factorials to include partition
parameters. More precisely
```math
\\operatorname{gsfact}(α,r,κ)=
∏_{i=1}^{\\operatorname{length}(κ)}\\operatorname{sfact}\\left(r-\\frac{i-1}{α},κ_i\\right).
```

See also: [`sfact`](@ref).

# Examples
```jldoctest
julia> gsfact(1, 3, [3, 2, 1]) |> Int
360
```
"""
function gsfact(α, r, κ::AbstractVector)
    prod(sfact(r - (i - 1) / α, κᵢ) for (i, κᵢ) in enumerate(κ))
end

"""
$(TYPEDSIGNATURES)

The ``ρ`` function of a partition.

Given the Jack parameter (real positive integer) `α` and the partition `κ`,
```math
ρ(α,κ)=∑_{i=1}^{\\operatorname{length}(κ)}κ_i\\left(κ_i-1-\\frac{2(i-1)}{α}\\right)
```

# Examples
```jldoctest
julia> rho(2, [3, 1]) |> Int
5
```
"""
function rho(α, κ::AbstractVector)
    sum(κᵢ * (κᵢ - 1 - 2 * (i - 1) / α) for (i, κᵢ) in enumerate(κ))
end
