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
local replace = require(Utility:WaitForChild("Replace"))

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

local InsertButton = Component "InsertButton"

local component = function()
    local buttons = {}
    
    for class, classTable in pairs(data.objects) do
        for order, object in ipairs(classTable) do
            table.insert(buttons, InsertButton {
                Object = object,
                ObjectColor = data.classes[class].color,
                Icon = object.icon,
                LayoutOrder = order + 500 * data.classes[class].order,
                OnLeftActivated = function()
                    insert(object)
                end,
                OnRightActivated = function()
                    replace(object)
                end
            })
        end
    end

    return buttons
end

return component