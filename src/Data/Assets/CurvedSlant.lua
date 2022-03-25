local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local slant = Meshes:WaitForChild("CurvedSlant"):Clone()
    slant.Size = Vector3.new(2, 2, 2)
    slant.Material = Enum.Material.SmoothPlastic
    slant.TopSurface = Enum.SurfaceType.Smooth
    slant.BottomSurface = Enum.SurfaceType.Smooth
    slant.Name = "CurvedSlant"

    return slant
end