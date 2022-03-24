local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local octagon = Meshes:WaitForChild("Octagon"):Clone()
    octagon.Size = Vector3.new(2, 0.5, 2)
    octagon.Material = Enum.Material.SmoothPlastic
    octagon.TopSurface = Enum.SurfaceType.Smooth
    octagon.BottomSurface = Enum.SurfaceType.Smooth
    octagon.Name = "Octagon"

    return octagon
end