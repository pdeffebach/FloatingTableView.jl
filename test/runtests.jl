module TestFloatingTableView

using FloatingTableView
using Test

const W = FloatingTableView.TableView.WebIO

@testset "FloatingTableView.jl" begin
    t = (a = [1], b = [2])

    @test showtable(t) isa W.Scope
    @test browse(t) === nothing

    t = [(a = 1, b = 2), (a = 3, b =4)]
    @test showtable(t) isa W.Scope
    @test browse(t) === nothing

    t = (a = ["a string"], b = ["another string"])
    @test showtable(t) isa W.Scope
    @test browse(t) === nothing

    t = [1 3; 3 4]
    @test showtable(t) isa W.Scope
    @test browse(t) === nothing
end

end
