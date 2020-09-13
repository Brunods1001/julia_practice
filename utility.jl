glimpse = function(df, mnew = 5, maxlen = 100; numdigits = false)
    m = nrow(df)    
    if m < mnew
        mnew = m
    end
    
    lencol = 0
    for col in names(df)
        if lencol < length(col)
            lencol = length(col)
        end
    end
    spaces = repeat(" ", lencol)
    
    colspaces = names(df)
    for (i, col) in enumerate(colspaces)
        numspaces = lencol - length(col)
        colspaces[i] = col * repeat(" ", numspaces)
    end
    
    for (i, col) in enumerate(colspaces)
        vals = df[1:mnew, i]
        if (numdigits !== false) & (typeof(df[1, i]) <: Float64)
            vals = [round(val, digits = numdigits) for val in vals]
        end
        vals = join(vals, ", ")
        lenvals = ifelse(length(vals) < maxlen, length(vals), maxlen)
        println(
            col,
            " <", eltype(df[i]),
            ">", ": ", vals[1:lenvals], "...")
    end
end