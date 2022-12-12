"""
$(TYPEDSIGNATURES)

Compute the Jacobian polynomials.

The implementation follows the "J" normalization where the coefficient of the smallest
monomial, corresponding to the partition ``[1,1,…,1]``, is ``|κ|!``.

# Arguments
- `α`: the Jack parameter (real positive number).
- `κ`: the partition.
- `vars`: the list of variables (in numerical or symbolic format).
"""
function jack(α, κ, vars::AbstractVector)
    @assert parvalid(κ)
    if unwrap(α) isa Number
        jack1(α, κ, vars)
    else
        jack2(α, κ, vars)
    end
end
function jack1(α, κ, vars::AbstractVector)
    @assert α ≥ 0
    l = length(vars)
    temp = Array{Any}(nothing, compute_size(κ, κ), l)
    function recurrence(l, k, μ::Vector, ν::Vector, β)
        lν = length(ν)
        index = compute_size(κ, ν)
        if isempty(ν) || iszero(ν[begin]) || iszero(l)
            return 1
        elseif lν > l && ν[l + 1] > 0
            return 0
        elseif isone(l)
            return vars[1]^ν[begin] * prod(@. α * (1:(ν[begin] - 1)) + 1)
        elseif iszero(k)
            res = temp[index, l]
            !isnothing(res) && return res
        end
        i = max(1, k)
        sumμ = sum(μ)
        t = recurrence(l - 1, 0, ν, ν, 1) * β * vars[l]^(sumμ - sum(ν))
        while lν ≥ i && ν[i] > 0
            if lν == i || ν[i] > ν[i + 1]
                ν2 = copy(ν)
                ν2[i, 1] -= 1
                γ = β * ratio(μ, ν, i, α)
                if ν[i] > 1
                    t += recurrence(l, i, μ, ν2, γ)
                else
                    t += recurrence(l - 1, 0, ν2, ν2, 1) * γ * vars[l]^(sumμ - sum(ν2))
                end
            end
            i += 1
        end
        if k == 0
            temp[index, l] = t
        end
        return t
    end
    recurrence(l, 0, κ, κ, 1)
end
function jack2(α, κ, vars::AbstractVector)
    l = length(vars)
    S = Array{Any}(nothing, compute_size(κ, κ), l)
    function recurrence(l, k, μ::Vector, ν::Vector, β)
        lν = length(ν)
        if isempty(ν) || iszero(ν[begin]) || iszero(l)
            return 1
        elseif lν > l && ν[l + 1] > 0
            return 0
        elseif isone(l)
            res = vars[begin]^ν[begin]
            if isone(ν[begin])
                return res
            end
            return res * prod(1 .+ α .* (1:(ν[begin] - 1)))
        end
        v = S[compute_size(κ, ν), l]
        iszero(k) && !isnothing(v) && return v
        i = max(1, k)
        t = recurrence(l - 1, 0, ν, ν, 1) * β * vars[l]^(sum(μ) - sum(ν))
        while lν ≥ i && ν[i] > 0
            if lν == i || ν[i] > ν[i + 1]
                ν2 = copy(ν)
                ν2[i, 1] -= 1
                γ = β * ratio2(μ, ν, i, α)
                if ν[i] > 1
                    t += recurrence(l, i, μ, ν2, γ)
                else
                    t += recurrence(l - 1, 0, ν2, ν2, 1) * γ * vars[l]^(sum(μ) - sum(ν2))
                end
            end
            i += 1
        end
        if iszero(k)
            S[compute_size(κ, ν), l] = t
        end
        return t
    end
    recurrence(l, 0, κ, κ, 1)
end
