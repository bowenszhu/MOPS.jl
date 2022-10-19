using Documenter, MOPS

makedocs(sitename = "MOPS.jl",
         pages = [
             "Home" => "index.md",
         ])

deploydocs(repo = "github.com/bowenszhu/MOPS.jl.git")
