using FloatingTableView
using Test

@testset "FloatingTableView.jl" begin
    t = (a = [1], b = [2])
    browse(t)

    browse(t, dark = true)
    browse(t, width = "50%")
    browse(t, height = 600)
end
