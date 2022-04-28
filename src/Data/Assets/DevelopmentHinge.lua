local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local mesh = Meshes:WaitForChild("DevelopmentHinge"):Clone()

    return mesh
end