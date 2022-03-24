local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local cylinder = Instance.new("Part")
    cylinder.Shape = Enum.PartType.Cylinder
    cylinder.CFrame = CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90))
    cylinder.Size = Vector3.new(2,2,2)
    cylinder.Material = Enum.Material.SmoothPlastic
    cylinder.TopSurface = Enum.SurfaceType.Smooth
    cylinder.BottomSurface = Enum.SurfaceType.Smooth
    cylinder.Name = "Cylinder"
    return cylinder
end