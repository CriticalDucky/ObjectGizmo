local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local sphere = Instance.new("Part")
    sphere.Shape = Enum.PartType.Ball
    sphere.Size = Vector3.new(3,3,3)
    sphere.Material = Enum.Material.SmoothPlastic
    sphere.TopSurface = Enum.SurfaceType.Smooth
    sphere.BottomSurface = Enum.SurfaceType.Smooth

    sphere.Name = "Sphere"
    
    return sphere
end