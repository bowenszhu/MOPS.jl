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
