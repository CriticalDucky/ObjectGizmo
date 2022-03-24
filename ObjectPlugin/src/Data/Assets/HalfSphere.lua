local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local halfSphere = Meshes:WaitForChild("HalfSphere"):Clone()
    halfSphere.Size = Vector3.new(4,2,4)
    halfSphere.Material = Enum.Material.SmoothPlastic
    halfSphere.TopSurface = Enum.SurfaceType.Smooth
    halfSphere.BottomSurface = Enum.SurfaceType.Smooth
    halfSphere.Name = "HalfSphere"

    return halfSphere
end