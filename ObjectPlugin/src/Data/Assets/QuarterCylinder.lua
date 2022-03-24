local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local quarter = Meshes:WaitForChild("QuarterCylinder"):Clone()
    quarter.Size = Vector3.new(2, 2, 2)
    quarter.Material = Enum.Material.SmoothPlastic
    quarter.TopSurface = Enum.SurfaceType.Smooth
    quarter.BottomSurface = Enum.SurfaceType.Smooth
    quarter.Name = "QuarterCylinder"

    return quarter
end