using Documenter, MOPS

DocMeta.setdocmeta!(MOPS, :DocTestSetup, :(using MOPS); recursive = true)

makedocs(sitename = "MOPS.jl",
         modules = [MOPS],
         pages = [
             "Home" => "index.md",
             "API" => "api.md",
         ])

deploydocs(repo = "github.com/bowenszhu/MOPS.jl.git",
           push_preview = true)
