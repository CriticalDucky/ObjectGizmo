local PluginFolder = script:FindFirstAncestor("ObjectsPlugin")

local Utility = PluginFolder:WaitForChild("Utility")
local WrapUp = PluginFolder:WaitForChild("WrapUp")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")

local PluginGlobal = require(Utility:WaitForChild("PluginGlobal"))
local plugin = PluginGlobal.pluginInstance

local waitForDescendant = require(Utility:WaitForChild("WaitForDescendant"))
local theme = require(Utility:WaitForChild("Theme"))
local colorEdit = require(Utility:WaitForChild("ColorEdit"))
local connections = require(WrapUp:WaitForChild("Connections"))

local Component = require(FusionAssets:WaitForChild("Component"))

local Fusion = require(FusionAssets:WaitForChild("Fusion"))

local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local Value = Fusion.Value
local Computed = Fusion.Computed
local Observer = Fusion.Observer
local Spring = Fusion.Spring
local unwrap = Fusion.unwrap

local viewportSizeState = Value()

local function updateState(camera: Camera)
    viewportSizeState:set(camera.ViewportSize)
end

updateState(workspace.CurrentCamera)

connections:add(workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    updateState(workspace.CurrentCamera)
end))

return viewportSizeState