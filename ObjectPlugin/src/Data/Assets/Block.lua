local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local block = Instance.new("Part")
    block.Size = Vector3.new(2,2,2)
    block.Material = Enum.Material.SmoothPlastic
    block.TopSurface = Enum.SurfaceType.Smooth
    block.BottomSurface = Enum.SurfaceType.Smooth
    block.Name = "Part"
    return block
end