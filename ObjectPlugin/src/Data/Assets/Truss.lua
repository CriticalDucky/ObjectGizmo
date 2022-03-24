local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local truss = Instance.new("TrussPart")
    truss.Size = Vector3.new(2,4,2)
    truss.Material = Enum.Material.SmoothPlastic
    truss.TopSurface = Enum.SurfaceType.Smooth
    truss.BottomSurface = Enum.SurfaceType.Smooth

    truss.Name = "Truss"

    return truss
end