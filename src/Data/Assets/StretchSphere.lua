local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local stretchSphere = Instance.new("Part")
    stretchSphere.Size = Vector3.new(3,3,3)
    stretchSphere.Material = Enum.Material.SmoothPlastic
    stretchSphere.TopSurface = Enum.SurfaceType.Smooth
    stretchSphere.BottomSurface = Enum.SurfaceType.Smooth
    stretchSphere.Name = "StretchSphere"

    local mesh = Instance.new("SpecialMesh")
    mesh.MeshType = Enum.MeshType.Sphere
    mesh.Parent = stretchSphere

    return stretchSphere
end