module FloatingTableView

using Blink, TableView

export browse

function browse(df)
    w =Blink.Window()
    body!(w, showtable(df))
    return nothing
end

end # module
