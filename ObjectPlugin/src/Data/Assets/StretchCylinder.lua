local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local stretchCylinder = Meshes:WaitForChild("StretchCylinder"):Clone()
    stretchCylinder.Size = Vector3.new(2,2,2)
    stretchCylinder.Material = Enum.Material.SmoothPlastic
    stretchCylinder.TopSurface = Enum.SurfaceType.Smooth
    stretchCylinder.BottomSurface = Enum.SurfaceType.Smooth
    stretchCylinder.Name = "StretchCylinder"

    return stretchCylinder
end