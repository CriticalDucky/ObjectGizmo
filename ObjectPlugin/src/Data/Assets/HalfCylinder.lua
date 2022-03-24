local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local halfCylinder = Meshes:WaitForChild("HalfCylinder"):Clone()
    halfCylinder.Size = Vector3.new(2,1,2)
    halfCylinder.Material = Enum.Material.SmoothPlastic
    halfCylinder.TopSurface = Enum.SurfaceType.Smooth
    halfCylinder.BottomSurface = Enum.SurfaceType.Smooth
    halfCylinder.Name = "HalfCylinder"

    return halfCylinder
end