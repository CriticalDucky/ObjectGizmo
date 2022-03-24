local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local cube = Meshes:WaitForChild("TunnelCube"):Clone()
    cube.Size = Vector3.new(2, 2, 2)
    cube.Material = Enum.Material.SmoothPlastic
    cube.TopSurface = Enum.SurfaceType.Smooth
    cube.BottomSurface = Enum.SurfaceType.Smooth
    cube.Name = "TunnelCube"

    return cube
end