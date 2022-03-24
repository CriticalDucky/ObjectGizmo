local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local star = Meshes:WaitForChild("MathStar"):Clone()
    star.Size = Vector3.new(2.103, 0.5, 2)
    star.Material = Enum.Material.SmoothPlastic
    star.TopSurface = Enum.SurfaceType.Smooth
    star.BottomSurface = Enum.SurfaceType.Smooth
    star.Name = "Star"

    return star
end