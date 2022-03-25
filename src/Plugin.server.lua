local CoreGui = game:GetService("CoreGui")

local PluginFolder = script.Parent
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")
local WrapUp = PluginFolder:WaitForChild("WrapUp")
local Utility = PluginFolder:WaitForChild("Utility")

local PluginGlobal = require(Utility:WaitForChild("PluginGlobal"))
PluginGlobal.give(plugin)

local widgetSize = require(Utility:WaitForChild("WidgetSize"))
local constants = require(Utility:WaitForChild("Constants"))
local currentInsertHover = require(Utility:WaitForChild("CurrentInsertHover"))

local Fusion = require(FusionAssets:WaitForChild("Fusion"))

local State = Fusion.State
local Compat = Fusion.Compat

local Component = require(FusionAssets:WaitForChild("Component"))

local connections = require(WrapUp:WaitForChild("Connections"))

local pluginBase = Component "PluginBase"
local pluginEnabled = State(false)

local toolbar do
    local name = "Critical Suite"

    local toolbarValue = CoreGui:FindFirstChild("CriticalSuiteToolbar")

    if not toolbarValue then
        toolbarValue = Instance.new("ObjectValue")
        toolbarValue.Name = "CriticalSuiteToolbar"
        toolbarValue.Value = plugin:CreateToolbar(name)
        toolbarValue.Parent = CoreGui
    elseif not toolbarValue.Value then
        toolbarValue.Value = plugin:CreateToolbar(name)
    end

    toolbar = toolbarValue.Value
end

local enableButton = toolbar:CreateButton("OpenObjectGizmo", "Open Objects", "rbxassetid://9149212722", "Object Gizmo")
enableButton.ClickableWhenViewportHidden = true

local totalSize = constants.BUTTON_SIZE + constants.GRANTED_BAR_SPACE
local widgetInfo = DockWidgetPluginGuiInfo.new(
    Enum.InitialDockState.Bottom,
    false,
    false,
    totalSize,
    totalSize,
    totalSize,
    totalSize
)

local widget = plugin:CreateDockWidgetPluginGui("ObjectsWidget", widgetInfo)
widget.Title = constants.WIDGET_NAME

function enableButtonClicked()
    pluginEnabled:set(not pluginEnabled:get())
end

local pluginFrame: Frame = pluginBase (widget)

do
    widgetSize.size:set(pluginFrame.AbsoluteSize)

    connections:add(pluginFrame.Changed:Connect(function(change)
        if change == "AbsoluteSize" then
            widgetSize.size:set(pluginFrame[change])
        end
    end))
end

do
    local accountingValue = 0
    local text = constants.WIDGET_NAME

    connections:add(Compat(currentInsertHover):onChange(function()
        local object = currentInsertHover:get()
    
        if object ~= nil then
            widget.Title =  text .. " - " .. object.name
        else
            accountingValue += 1
            local currentAccountingValue = accountingValue

            task.wait(2)
            
            if (not currentInsertHover:get()) and (currentAccountingValue == accountingValue) then
                widget.Title = text
            end
        end
    end))

    connections:add(pluginFrame.MouseLeave:Connect(function(x, y)
        widget.Title = text
    end))
end

connections:add(Compat(pluginEnabled):onChange(function()
    widget.Enabled = pluginEnabled:get()
end))

connections:add(enableButton.Click:Connect(enableButtonClicked))