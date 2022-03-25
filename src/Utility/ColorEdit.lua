return function(color3: Color3, edits, increment: boolean) -- For HSV values
    local h, s, v = color3:ToHSV()
    
    local t = { -- The keys go in the increments
        hue = h,
        sat = s,
        val = v
    }
    
    for k, v in pairs(edits) do
        if increment then
            t[k] += v
        else
            t[k] = v
        end
        
        t[k] = math.clamp(t[k], 0, 1)
    end
    
    return Color3.fromHSV(t.hue, t.sat, t.val)
end