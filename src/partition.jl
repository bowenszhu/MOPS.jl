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
