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
julia> MOPS.sfact(3, 5)
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
julia> MOPS.gsfact(1, 3, [3, 2, 1]) |> Int
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
julia> MOPS.rho(2, [3, 1]) |> Int
5
```
"""
function rho(α, κ::AbstractVector)
    sum(κᵢ * (κᵢ - 1 - 2 * (i - 1) / α) for (i, κᵢ) in enumerate(κ))
end

function ratio(κ::AbstractVector, σ::AbstractVector, k, α)
    temp = k - α * σ[k]
    σ2 = conjugate(σ)
    tempv = map(i -> temp + 1 - i + α * κ[i], 1:k)
    p1 = prod(@. tempv / (tempv + (α - 1)))
    tempv = map(i -> temp - i + α * σ[i], 1:(k - 1))
    p2 = prod(@. (tempv + α) / tempv)
    tempv = map(i -> σ2[i] - temp - α * i, 1:(σ[k] - 1))
    p3 = prod(@. (tempv .+ α) / tempv)
    return α * p1 * p2 * p3
end
function ratio2(κ::AbstractVector, σ::AbstractVector, k, α)
    temp = k - α * σ[k]
    σ2 = conjugate(σ)
    tempv = map(i -> temp + 1 - i + α * κ[i], 1:k)
    p1 = prod(tempv .// (tempv .+ α .- 1))
    tempv = map(i -> temp - i + α * σ[i], 1:(k - 1))
    p2 = isone(k) ? 1 : prod((tempv .+ α) .// tempv)
    tempv = map(i -> σ2[i] - temp - α * i, 1:(σ[k] - 1))
    p3 = isone(σ[k]) ? 1 : prod((tempv .+ α) .// tempv)
    return α * p1 * p2 * p3
end

function compute_size(λ::AbstractVector, μ::AbstractVector)
    λ1 = λ .+ 1
    λ1[1] = 1
    cumprod!(λ1, λ1)
    reverse!(λ1)
    return dot(μ, λ1)
end
