local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local heart = Meshes:WaitForChild("Heart"):Clone()
    heart.Size = Vector3.new(2, 0.5, 2)
    heart.Material = Enum.Material.SmoothPlastic
    heart.TopSurface = Enum.SurfaceType.Smooth
    heart.BottomSurface = Enum.SurfaceType.Smooth
    heart.Name = "Heart"

    return heart
end