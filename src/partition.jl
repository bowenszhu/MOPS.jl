"""
$(TYPEDSIGNATURES)

Given a positive integer `k`, produce a list of all partitions which sum up to `k`.

# Examples
```jldoctest
julia> MOPS.par(4)
5-element Vector{Vector{Int64}}:
 [4]
 [3, 1]
 [2, 2]
 [2, 1, 1]
 [1, 1, 1, 1]
```
"""
function par(k::Integer)
    collect(partitions(k))
end

"""
$(TYPEDSIGNATURES)

Compute the arm-length of a partition at a square.

Given the diagram of the partition `κ`, the arm-length of the (`i`, `j`) square `S` is the
number of squares to the right of `S`, in other words `arm(κ, i, j) = κ[j] - i`.

# Examples
```julia
┌───┬───┬───┬───┐
│   │ S │   │   │
├───┼───┼───┼───┘
│   │   │   │
├───┼───┴───┘
│   │
├───┤
│   │
└───┘
```
```jldoctest
julia> MOPS.arm([4, 3, 1, 1], 2, 1)
2
```
"""
function arm(κ::AbstractVector, i::Integer, j::Integer)
    κ[j] - i
end

"""
$(TYPEDSIGNATURES)

Check if the given partition is valid.

A partition ``\\kappa`` is a finite, ordered, non-increasing sequence of nonnegative
integers ``\\kappa_1\\geq\\kappa_1\\geq\\kappa_1\\geq\\ldots\\geq\\kappa_l``.

# Examples
```jldoctest
julia> MOPS.parvalid(Int[])
true

julia> MOPS.parvalid([4, 3, 1, 1])
true

julia> MOPS.parvalid([5, 3, 4])
false
```
"""
function parvalid(κ::AbstractVector)::Bool
    isempty(κ) || (issorted(κ; rev = true) && κ[end] ≥ 0)
end

"""
$(TYPEDSIGNATURES)

Return the conjugate partition.

# Examples
```julia
┌───┬───┬───┬───┐         ┌───┬───┬───┬───┬───┐
│   │   │   │   │         │   │   │   │   │   │
├───┼───┼───┼───┘         ├───┼───┼───┼───┼───┘
│   │   │   │             │   │   │   │   │
├───┼───┼───┘        ➔    ├───┼───┼───┴───┘
│   │   │                 │   │   │
├───┼───┤                 ├───┼───┘
│   │   │                 │   │
├───┼───┘                 └───┘
│   │
└───┘
```
```jldoctest
julia> MOPS.conjugate([4, 3, 2, 2, 1]) |> println
[5, 4, 2, 1]
```
"""
function conjugate(κ::AbstractVector{T}) where {T}
    @assert parvalid(κ)
    if isempty(κ)
        return similar(κ)
    end
    res = zeros(T, κ[1])
    oneT = one(T)
    for κᵢ in κ
        res[1:κᵢ] .+= oneT
    end
    res
end

"""
$(TYPEDSIGNATURES)

Compute the leg-length of a partition at a square.

Given the diagram of the partition `κ`, the arm-length of the (`i`, `j`) square `S` is the
number of squares below `S`.

# Examples
```julia
┌───┬───┬───┬───┐
│   │ S │   │   │
├───┼───┼───┼───┘
│   │   │   │
├───┼───┼───┤
│   │   │   │
└───┴───┴───┘
```
```jldoctest
julia> MOPS.leg([4, 3, 3], 2, 1)
2
```
"""
function leg(κ::AbstractVector, i::Integer, j::Integer)
    arm(conjugate(κ), j, i)
end

"""
$(TYPEDSIGNATURES)

Compute the upper hook length of a partition at a square.

Given the parameter `α`, the partition `κ` and the location (`i`, `j`),
```math
\\operatorname{uhook}(α,κ,i,j)=\\operatorname{leg}(κ,i,j)+α(1+\\operatorname{arm}(κ,i,j))
```

See also: [`arm`](@ref), [`leg`](@ref), [`lhook`](@ref).

# Examples
```julia
┌───┬───┬───┬───┐
│   │ S │   │   │
├───┼───┼───┴───┘
│   │   │
├───┼───┘
│   │
└───┘
```
```jldoctest
julia> MOPS.uhook(2, [4, 2, 1], 2, 1)
7
```
"""
function uhook(α, κ::AbstractVector, i::Integer, j::Integer)
    leg(κ, i, j) + α * (1 + arm(κ, i, j))
end

"""
$(TYPEDSIGNATURES)

Compute the lower hook length of a partition at a square.

Given the parameter `α`, the partition `κ` and the location (`i`, `j`),
```math
\\operatorname{lhook}(α,κ,i,j)=\\operatorname{leg}(κ,i,j)+1+α\\operatorname{arm}(κ,i,j)
```

See also: [`arm`](@ref), [`leg`](@ref), [`uhook`](@ref).

# Examples
```julia
┌───┬───┬───┬───┐
│   │ S │   │   │
├───┼───┼───┴───┘
│   │   │
├───┼───┘
│   │
└───┘
```
```jldoctest
julia> MOPS.lhook(2, [4, 2, 1], 2, 1)
6
```
"""
function lhook(α, κ::AbstractVector, i::Integer, j::Integer)
    leg(κ, i, j) + 1 + α * arm(κ, i, j)
end

"""
$(TYPEDSIGNATURES)

Determines if a partition is a subpartition of the other.

Returns `true` if `σ[i] ≤ κ[i]` for all `i`.

# Examples
```jldoctest
julia> MOPS.issubpar([5, 3], [6, 4, 2])
true

julia> MOPS.issubpar([5], [4, 1])
false

julia> MOPS.issubpar([5, 5, 1], [6, 5])
false
```
"""
function issubpar(σ::AbstractVector, κ::AbstractVector)
    if length(σ) > length(κ)
        return false
    end
    for (σᵢ, κᵢ) in zip(σ, κ)
        if σᵢ > κᵢ
            return false
        end
    end
    return true
end
