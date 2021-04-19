module FloatingTableView

using Blink: Window, body!, active
using TableView

export browse, showtable

# Method for keeping current window active borrowed 
# from Plots.jl
mutable struct CurrentWin
    nullablewin::Union{Window, Nothing}
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

current(win::Window) = (CURRENT_WIN.nullablewin = win)

"""
	browse(t; kwargs)

Browse data source in a new Blink window using 
Tables.jl's `showtable` function. 

# Arguments

- `t`, a Tables.jl-compatible data source, 
  for example a `DataFrame` or a `NamedTuple` 
  of `Vector`s
- `kwargs`, keyword arguments passed to the 
  `showtable` command from TableView.jl to 
  control the details of the new data viewer.
  See [`showtable`](@ref) for details.

# Examples

```julia
julia> t = (a = rand(10), b = rand(10))

julia> browse(t)
```

```julia
julia> t = rand(100, 100)

julia> browse(t, dark = true)
```

See also: [`showtable`](@ref)
"""
function browse(df; height = "100vh", kwargs...)
	if iswinnull() || !active(current())
		w = Window()
		current(w)
		body!(current(), showtable(df; height = height, kwargs...))
	else
		body!(current(), showtable(df; height = height, kwargs...))
	end

    return nothing
end

end # module
