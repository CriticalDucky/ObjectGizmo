local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local pentagon = Meshes:WaitForChild("Pentagon"):Clone()
    pentagon.Size = Vector3.new(2.103, 0.5, 2)
    pentagon.Material = Enum.Material.SmoothPlastic
    pentagon.TopSurface = Enum.SurfaceType.Smooth
    pentagon.BottomSurface = Enum.SurfaceType.Smooth
    pentagon.Name = "Pentagon"

    return pentagon
end