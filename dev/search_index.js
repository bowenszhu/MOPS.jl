var documenterSearchIndex = {"docs":
[{"location":"api/#API-reference","page":"API","title":"API reference","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [MOPS]","category":"page"},{"location":"api/#MOPS.arm-Tuple{AbstractVector, Integer, Integer}","page":"API","title":"MOPS.arm","text":"arm(κ::AbstractVector, i::Integer, j::Integer) -> Any\n\n\nCompute the arm-length of a partition at a square.\n\nGiven the diagram of the partition κ, the arm-length of the (i, j) square S is the number of squares to the right of S, in other words arm(κ, i, j) = κ[j] - i.\n\nExamples\n\n┌───┬───┬───┬───┐\n│   │ S │   │   │\n├───┼───┼───┼───┘\n│   │   │   │\n├───┼───┴───┘\n│   │\n├───┤\n│   │\n└───┘\n\njulia> arm([4, 3, 1, 1], 2, 1)\n2\n\n\n\n\n\n","category":"method"},{"location":"api/#MOPS.conjugate-Union{Tuple{AbstractVector{T}}, Tuple{T}} where T","page":"API","title":"MOPS.conjugate","text":"conjugate(κ::AbstractArray{T, 1}) -> Any\n\n\nReturn the conjugate partition.\n\nExamples\n\n┌───┬───┬───┬───┐         ┌───┬───┬───┬───┬───┐\n│   │   │   │   │         │   │   │   │   │   │\n├───┼───┼───┼───┘         ├───┼───┼───┼───┼───┘\n│   │   │   │             │   │   │   │   │\n├───┼───┼───┘        ➔    ├───┼───┼───┴───┘\n│   │   │                 │   │   │\n├───┼───┤                 ├───┼───┘\n│   │   │                 │   │\n├───┼───┘                 └───┘\n│   │\n└───┘\n\njulia> conjugate([4, 3, 2, 2, 1]) |> println\n[5, 4, 2, 1]\n\n\n\n\n\n","category":"method"},{"location":"api/#MOPS.leg-Tuple{AbstractVector, Integer, Integer}","page":"API","title":"MOPS.leg","text":"leg(κ::AbstractVector, i::Integer, j::Integer) -> Any\n\n\nCompute the leg-length of a partition at a square.\n\nGiven the diagram of the partition κ, the arm-length of the (i, j) square S is the number of squares below S.\n\nExamples\n\n┌───┬───┬───┬───┐\n│   │ S │   │   │\n├───┼───┼───┼───┘\n│   │   │   │\n├───┼───┼───┤\n│   │   │   │\n└───┴───┴───┘\n\njulia> leg([4, 3, 3], 2, 1)\n2\n\n\n\n\n\n","category":"method"},{"location":"api/#MOPS.par-Tuple{Integer}","page":"API","title":"MOPS.par","text":"par(k::Integer) -> Vector{Vector{Int64}}\n\n\nGiven a positive integer k, produce a list of all partitions which sum up to k.\n\nExamples\n\njulia> par(4)\n5-element Vector{Vector{Int64}}:\n [4]\n [3, 1]\n [2, 2]\n [2, 1, 1]\n [1, 1, 1, 1]\n\n\n\n\n\n","category":"method"},{"location":"api/#MOPS.parvalid-Tuple{AbstractVector}","page":"API","title":"MOPS.parvalid","text":"parvalid(κ::AbstractVector) -> Bool\n\n\nCheck if the given partition is valid.\n\nA partition kappa is a finite, ordered, non-increasing sequence of positive integers kappa_1geqkappa_1geqkappa_1geqldotsgeqkappa_l.\n\nExamples\n\njulia> parvalid(Int[])\ntrue\n\njulia> parvalid([4, 3, 1, 1])\ntrue\n\njulia> parvalid([5, 3, 4])\nfalse\n\n\n\n\n\n","category":"method"},{"location":"api/#MOPS.sfact-Tuple{Any, Any}","page":"API","title":"MOPS.sfact","text":"sfact(r, k)\n\n\nCompute the shifted factorial, which is\n\nfrac(r+k+1)(r-1)\n\nfor integral k or equivalently\n\nfracΓ(r+k)Γ(r)\n\nThis is also called the Pochhammer symbol and rising factorial.\n\nExamples\n\njulia> sfact(3, 5)\n2520\n\n\n\n\n\n","category":"method"},{"location":"#MOPS.jl:-Multivariate-Orthogonal-Polynomials-Symbolically","page":"Home","title":"MOPS.jl: Multivariate Orthogonal Polynomials Symbolically","text":"","category":"section"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"}]
}
