local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local pyramid = Meshes:WaitForChild("Pyramid"):Clone()
    pyramid.Size = Vector3.new(2,1,2)
    pyramid.Material = Enum.Material.SmoothPlastic
    pyramid.TopSurface = Enum.SurfaceType.Smooth
    pyramid.BottomSurface = Enum.SurfaceType.Smooth
    pyramid.Name = "Pyramid"

    return pyramid
end