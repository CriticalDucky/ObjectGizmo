local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local CollectionService = game:GetService("CollectionService")

local PluginFolder = script:FindFirstAncestor("ObjectsPlugin")

local Utility = PluginFolder:WaitForChild("Utility")
local WrapUp = PluginFolder:WaitForChild("WrapUp")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")
local ViewportSizeState = require(Utility:WaitForChild("ViewportSizeState"))
local generateAPI = require(Utility:WaitForChild("API"))

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

local success, results do
    local RETRIES = 5

    for i = 1, RETRIES do
        success, results = generateAPI()

        if success then
            break
        end
    end
end

local function getProps(class)
    return success and results.getProperties("BasePart", plugin)
end

local function replace(object)
    if not success then
        warn("ObjectGizmo: Could not replace object(s). HTTP Request Error; Try restarting the plugin.")
    end

    local selection = Selection:Get()

    local errorHappened = false

    local function errorWarn()
        warn("ObjectGizmo: Some objects could not be swapped")
    end

    ChangeHistoryService:SetWaypoint("Replacing objects")

    local newObjects = {}

    for _, selected in ipairs(selection) do
        if typeof(selected) == "Instance" and selected:IsA("BasePart") and not selected:IsA("Terrain") then
            local newObject: BasePart = object.new()
            table.insert(newObjects, newObject)

            for _, child in ipairs(selected:GetChildren()) do
                child.Parent = newObject
            end

            for _, property in ipairs(getProps(selected.ClassName)) do
                pcall(function()
                    newObject[property] = selected[property]
                end)
            end

            for _, tag in pairs(CollectionService:GetTags(selected)) do
                CollectionService:AddTag(newObject, tag)
            end

            for attribute, value in pairs(selected:GetAttributes()) do
                newObject:SetAttribute(attribute, value)
            end

            selected:Remove()
            selected = nil
        else
            if not errorHappened then
                errorHappened = true
                errorWarn()
            end
        end
    end

    ChangeHistoryService:SetWaypoint("Replaced objects")

    if #newObjects > 0 then
        Selection:Set(newObjects)
    end
end

return replace