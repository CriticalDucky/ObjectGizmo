local PluginFolder = script:FindFirstAncestor("ObjectsPlugin")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")
local Fusion = require(FusionAssets:WaitForChild("Fusion"))
local Value = Fusion.Value

return Value(nil)