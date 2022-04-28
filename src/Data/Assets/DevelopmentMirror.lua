local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local mesh = Meshes:WaitForChild("DevelopmentMirror"):Clone()

    return mesh
end