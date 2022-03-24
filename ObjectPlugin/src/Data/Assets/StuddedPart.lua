local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local block = Instance.new("Part")
    block.Size = Vector3.new(2,1,4)
    block.Material = Enum.Material.Plastic
    block.TopSurface = Enum.SurfaceType.Studs
    block.BottomSurface = Enum.SurfaceType.Inlet
    block.Name = "Part"
    return block
end