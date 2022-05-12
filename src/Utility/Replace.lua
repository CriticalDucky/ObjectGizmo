local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")

local PluginFolder = script:FindFirstAncestor("ObjectsPlugin")

local Utility = PluginFolder:WaitForChild("Utility")
local WrapUp = PluginFolder:WaitForChild("WrapUp")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")
local ViewportSizeState = require(Utility:WaitForChild("ViewportSizeState"))

local PluginGlobal = require(Utility:WaitForChild("PluginGlobal"))
local plugin = PluginGlobal.pluginInstance

local waitForDescendant = require(Utility:WaitForChild("WaitForDescendant"))

local connections = require(WrapUp:WaitForChild("Connections"))

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

local function replace(object)
    local basePartProps = { -- Hey CriticalDucky! Why are you doing this? It's super inefficient! 

    }

    local selection = Selection:Get()

    local errorHappened = false

    local function errorWarn()
        warn("ObjectGizmo: Some objects could not be swapped")
    end

    ChangeHistoryService:SetWaypoint("Replacing objects")

    for _, v in ipairs(selection) do
        if typeof(v) == "Instance" and v:IsA("BasePart") and not v:IsA("Terrain") then
            local newObject = object.new()
        else
            if not errorHappened then
                errorHappened = true
                errorWarn()
            end
        end
    end

    ChangeHistoryService:SetWaypoint("Replaced objects")
end

return replace