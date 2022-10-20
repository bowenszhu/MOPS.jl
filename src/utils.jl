using SpecialFunctions: gamma

"""
$(SIGNATURES)

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
