local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local cone = Meshes:WaitForChild("SlicedCone"):Clone()
    cone.Size = Vector3.new(2, 2, 2)
    cone.Material = Enum.Material.SmoothPlastic
    cone.TopSurface = Enum.SurfaceType.Smooth
    cone.BottomSurface = Enum.SurfaceType.Smooth
    cone.Name = "Cone"

    return cone
end