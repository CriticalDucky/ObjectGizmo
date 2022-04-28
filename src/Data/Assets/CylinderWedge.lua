local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local mesh = Meshes:WaitForChild("CylinderWedge"):Clone()

    return mesh
end