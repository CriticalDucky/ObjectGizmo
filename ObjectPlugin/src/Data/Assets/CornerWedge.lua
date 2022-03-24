local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local cornerWedge = Instance.new("CornerWedgePart")
    cornerWedge.Size = Vector3.new(2,2,2)
    cornerWedge.Material = Enum.Material.SmoothPlastic
    cornerWedge.TopSurface = Enum.SurfaceType.Smooth
    cornerWedge.BottomSurface = Enum.SurfaceType.Smooth
    cornerWedge.Name = "CornerWedgePart"
    return cornerWedge
end