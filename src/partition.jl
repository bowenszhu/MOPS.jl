using Combinatorics

"""
$(TYPEDSIGNATURES)

Given a positive integer `k`, produce a list of all partitions which sum up to `k`.

# Examples
```jldoctest
julia> par(4)
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
julia> arm([4, 3, 1, 1], 2, 1)
2
```
"""
function arm(κ::AbstractVector, i::Integer, j::Integer)
    κ[j] - i
end

"""
$(TYPEDSIGNATURES)

Check if the given partition is valid.

A partition ``\\kappa`` is a finite, ordered, non-increasing sequence of positive integers
``\\kappa_1\\geq\\kappa_1\\geq\\kappa_1\\geq\\ldots\\geq\\kappa_l``.

# Examples
```jldoctest
julia> parvalid(Int[])
true

julia> parvalid([4, 3, 1, 1])
true

julia> parvalid([5, 3, 4])
false
```
"""
function parvalid(κ::AbstractVector)::Bool
    isempty(κ) || (issorted(κ; rev = true) && κ[end] > 0)
end
