local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local hexagon = Meshes:WaitForChild("Hexagon"):Clone()
    hexagon.Size = Vector3.new(1.732, 1, 2)
    hexagon.Material = Enum.Material.SmoothPlastic
    hexagon.TopSurface = Enum.SurfaceType.Smooth
    hexagon.BottomSurface = Enum.SurfaceType.Smooth
    hexagon.Name = "Hexagon"

    return hexagon
end