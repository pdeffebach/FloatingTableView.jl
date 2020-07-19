# FloatingTableView

View your datasets in a new window. Ideal for terminal-based data cleaning workflows. 

FloatingTableView.jl leverages Julia Computing's [TableView.jl](https://github.com/JuliaComputing/TableView.jl) and [Blink.jl](https://github.com/JuliaGizmos/Blink.jl) to view any [Tables.jl](https://github.com/JuliaData/Tables.jl) compatible data source in an Electron-based window. 

The function exports a single, one-argument function 

```
julia> using DataFrames, FloatingTableView

julia> df = DataFrame(rand(100, 100));

julia> browse(df)
```

Because TableView.jl uses lazy-loading of data, FloatingTableView can handle very large datasets with no performance penalty. Because it uses an Electron-based window via Blink.jl, there is a non-trivial "time to first browse" startup time. However repeated calls to `browse` will be fast. 

Similar packages: [BrowseTables.jl](https://github.com/tpapp/BrowseTables.jl). Opens tables in a browser instead of an electron window, which may offer slightly improved performance for small datasets. However columns are not re-sizeable. Due the lazy-loading FloatingTableView will offer much better performance for large datasets. 


