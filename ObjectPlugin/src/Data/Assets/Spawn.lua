local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local spawnPart = Instance.new("SpawnLocation")
    spawnPart.Size = Vector3.new(12, 1, 12)
    spawnPart.Material = Enum.Material.SmoothPlastic
    spawnPart.TopSurface = Enum.SurfaceType.Smooth
    spawnPart.BottomSurface = Enum.SurfaceType.Smooth
    spawnPart.Name = "SpawnLocation"

    local decal = Instance.new("Decal")
    decal.Texture = "rbxasset://textures/SpawnLocation.png"
    decal.Face = Enum.NormalId.Top
    decal.Parent = spawnPart
    
    return spawnPart
end