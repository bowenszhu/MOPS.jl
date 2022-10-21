# TODO: optimize
function egen(κ::AbstractVector)
    if length(κ) == 1
        if κ[1] == 1
            return [similar(κ, 0), κ]
        else
            return [[κ[1] - 1], κ]
        end
    end
    lst1 = egen(κ[1:(end - 1)])
    lst2 = []
    for l in lst1
        if length(l) == length(κ) - 1
            if l[end] < κ[end]
                temp = κ[end] - 1
                if temp != 0
                    push!(l, temp)
                end
                push!(lst2, l)
            else
                l2 = [l..., κ[end]]
                temp = κ[end] - 1
                if temp != 0
                    push!(l, temp)
                end
                push!(lst2, l, l2)
            end
        else
            push!(lst2, l)
        end
    end
    lst2
end

# TODO: optimize
function eval_jack(a, l, x)
    if length(x) < length(l)
        return 0
    elseif isempty(l)
        return 1
    elseif length(x) == 1
        return x[1]^l[1] * a^(l[1] - 1) * sfact(1 / a + 1, l[1] - 1)
    end
    ls = sum(l)
    lc = conjugate(l)
    uvalid = egen(lc)
    res = 0
    for u in uvalid
        uc = u
        u = conjugate(u)
        us = sum(u)
        ab = 1
        for i in eachindex(u), j in 1:u[i]
            if j ≤ length(uc) && j ≤ length(lc) && lc[j] == uc[j]
                ab /= uc[j] - i + a * (u[i] - j + 1)
            else
                ab /= uc[j] - i + 1 + a * (u[i] - j)
            end
        end
        for i in eachindex(l), j in 1:l[i]
            if j ≤ length(uc) && j ≤ length(lc) && lc[j] == uc[j]
                ab *= lc[j] - i + a * (l[i] - j + 1)
            else
                ab *= lc[j] - i + 1 + a * (l[i] - j)
            end
        end
        term = x[end]^(ls - us) * ab * eval_jack(a, u, @view x[1:(end - 1)])
        res += term
    end
    res
end
