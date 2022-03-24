local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local sphere = Meshes:WaitForChild("Icosphere2"):Clone()
    sphere.Size = Vector3.new(1.902, 2, 2)
    sphere.Material = Enum.Material.SmoothPlastic
    sphere.TopSurface = Enum.SurfaceType.Smooth
    sphere.BottomSurface = Enum.SurfaceType.Smooth
    sphere.Name = "Icosphere"

    return sphere
end