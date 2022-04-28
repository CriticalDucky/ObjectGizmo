local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local mesh = Meshes:WaitForChild("RoundCornerWedge"):Clone()

    return mesh
end