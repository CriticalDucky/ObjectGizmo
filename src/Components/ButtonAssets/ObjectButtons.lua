local PluginFolder = script:FindFirstAncestor("ObjectsPlugin")

local Utility = PluginFolder:WaitForChild("Utility")
local WrapUp = PluginFolder:WaitForChild("WrapUp")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")
local DataFolder = PluginFolder:WaitForChild("Data")

local PluginGlobal = require(Utility:WaitForChild("PluginGlobal"))
local plugin = PluginGlobal.pluginInstance

local waitForDescendant = require(Utility:WaitForChild("WaitForDescendant"))
local theme = require(Utility:WaitForChild("Theme"))
local colorEdit = require(Utility:WaitForChild("ColorEdit"))
local connections = require(WrapUp:WaitForChild("Connections"))
local data = require(DataFolder:WaitForChild("Data"))
local insert = require(Utility:WaitForChild("Insert"))

local Component = require(FusionAssets:WaitForChild("Component"))

local Fusion = require(FusionAssets:WaitForChild("Fusion"))

local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local State = Fusion.State
local Computed = Fusion.Computed
local Compat = Fusion.Compat
local Spring = Fusion.Spring

local unwrap = require(FusionAssets:WaitForChild("Unwrap"))

local InsertButton = Component "InsertButton"

local component = function()
    local buttons = {}
    
    for k, v in pairs(data.objects) do
        local class = k

        for i, v in ipairs(v) do
            table.insert(buttons, InsertButton {
                Object = v,
                ObjectColor = data.classes[class].color,
                Icon = v.icon,
                LayoutOrder = i + 500 * data.classes[class].order,
                OnActivated = function()
                    insert(v)
                end
            })
        end
    end

    return buttons
end

return component