local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local tetra = Meshes:WaitForChild("Tetrahedron"):Clone()
    tetra.Size = Vector3.new(1.732, 1.414, 1.5)
    tetra.Material = Enum.Material.SmoothPlastic
    tetra.TopSurface = Enum.SurfaceType.Smooth
    tetra.BottomSurface = Enum.SurfaceType.Smooth
    tetra.Name = "Tetrahedron"

    return tetra
end