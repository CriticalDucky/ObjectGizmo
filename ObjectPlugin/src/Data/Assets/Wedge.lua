local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local wedge = Instance.new("WedgePart")
    wedge.Size = Vector3.new(2,2,2)
    wedge.Material = Enum.Material.SmoothPlastic
    wedge.TopSurface = Enum.SurfaceType.Smooth
    wedge.BottomSurface = Enum.SurfaceType.Smooth

    wedge.Name = "Wedge"

    return wedge
end