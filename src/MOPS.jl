module MOPS

using Combinatorics
using DocStringExtensions
using LinearAlgebra
using SpecialFunctions: gamma
using Symbolics: unwrap

include("partition.jl")
include("utils.jl")
include("jack.jl")

export jack

end # module MOPS
