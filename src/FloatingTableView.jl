module FloatingTableView

using Blink, TableView

export browse

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

function browse(df)
	if iswinnull() || !active(current())
		w = Blink.Window()
		current(w)
		body!(current(), showtable(df))
	else
		body!(current(), showtable(df))
	end

    return nothing
end

end # module
