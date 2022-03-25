local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local triangle = Meshes:WaitForChild("Triangle"):Clone()
    triangle.Size = Vector3.new(1.732, 1, 2)
    triangle.Material = Enum.Material.SmoothPlastic
    triangle.TopSurface = Enum.SurfaceType.Smooth
    triangle.BottomSurface = Enum.SurfaceType.Smooth
    triangle.Name = "Triangle"

    return triangle
end