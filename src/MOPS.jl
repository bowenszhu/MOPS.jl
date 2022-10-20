module MOPS

using DocStringExtensions

include("partition.jl")
export par, arm, parvalid, conjugate, leg

include("utils.jl")
export sfact

end # module MOPS
