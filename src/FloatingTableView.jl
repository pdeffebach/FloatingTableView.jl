module FloatingTableView

using Blink, TableView

export browse, showtable

mutable struct CurrentWin
    nullablewin::Union{Blink.Window, Nothing}
end
const CURRENT_WIN = CurrentWin(nothing)

iswinnull() = CURRENT_WIN.nullablewin === nothing

"""
    current()
Returns the Blink Window object for the current plot
"""
function current()
    if iswinnull()
        error("No current window")
    end
    CURRENT_WIN.nullablewin
end

current(win::Blink.Window) = (CURRENT_WIN.nullablewin = win)

"""
	browse(df; kwargs)

Browse a Tables.jl compatible data source in a new Blink window using 
Tables.jl's `showtable` function. 

See also: [`showtable`](@ref)
"""
function browse(df; kwargs...)
	if iswinnull() || !active(current())
		w = Blink.Window()
		current(w)
		body!(current(), showtable(df; kwargs...))
	else
		body!(current(), showtable(df; kwargs...))
	end

    return nothing
end

end # module
