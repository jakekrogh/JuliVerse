using JuliVerse
using Documenter

DocMeta.setdocmeta!(JuliVerse, :DocTestSetup, :(using JuliVerse); recursive=true)

makedocs(;
    modules=[JuliVerse],
    authors="Jake krogh",
    sitename="JuliVerse.jl",
    format=Documenter.HTML(;
        canonical="https://jakekrogh.github.io/JuliVerse.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jakekrogh/JuliVerse.jl",
    devbranch="main",
)
