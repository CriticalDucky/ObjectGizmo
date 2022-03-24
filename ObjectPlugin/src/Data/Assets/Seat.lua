local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local seat = Instance.new("Seat")
    seat.BrickColor = BrickColor.new("Black")
    seat.Size = Vector3.new(2,1,2)
    seat.Material = Enum.Material.SmoothPlastic
    seat.TopSurface = Enum.SurfaceType.Smooth
    seat.BottomSurface = Enum.SurfaceType.Smooth

    local decal = Instance.new("Decal")
    decal.Color3 = Color3.new(1,1,1)
    decal.Texture =  "rbxassetid://7733668653"
    decal.Face = Enum.NormalId.Top
    decal.Name = "Direction"
    decal.Parent = seat

    seat.Name = "Seat"

    return seat
end