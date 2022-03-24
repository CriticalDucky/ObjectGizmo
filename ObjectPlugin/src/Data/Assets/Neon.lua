local DataFolder = script:FindFirstAncestor("Data")
local Meshes = DataFolder:WaitForChild("Meshes")

return function ()
    local sign = Instance.new("Part")
    sign.Size = Vector3.new(4, 2, 0.5)
    sign.Material = Enum.Material.Neon
    sign.Color = Color3.new(1,1,1)
    sign.Transparency = 0.9
    sign.TopSurface = Enum.SurfaceType.Smooth
    sign.BottomSurface = Enum.SurfaceType.Smooth
    sign.Name = "Part"

    local surfaceGui = Instance.new("SurfaceGui")
    surfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    surfaceGui.PixelsPerStud = 50
    surfaceGui.LightInfluence = 0
    surfaceGui.Brightness = 5

    local textLabel = Instance.new("TextLabel")
    textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    textLabel.Position = UDim2.fromScale(0.5, 0.5)
    textLabel.Size = UDim2.fromScale(1, 1)
    textLabel.BorderSizePixel = 0
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 70
    textLabel.TextColor3 = Color3.new(1,1,1)
    textLabel.Text = "Text"

    textLabel.Parent = surfaceGui
    surfaceGui.Parent = sign

    return sign
end