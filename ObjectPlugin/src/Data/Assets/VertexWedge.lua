local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local wedge = Meshes:WaitForChild("VertexWedge"):Clone()
    wedge.Size = Vector3.new(2,2,2)
    wedge.Material = Enum.Material.SmoothPlastic
    wedge.TopSurface = Enum.SurfaceType.Smooth
    wedge.BottomSurface = Enum.SurfaceType.Smooth
    wedge.Name = "VertexWedge"

    return wedge
end