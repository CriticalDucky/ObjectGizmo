return function(x)
    if typeof(x) == "table" and x.type == "State" then
        return x:get()
    else
        return x
    end
end