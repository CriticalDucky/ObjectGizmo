local PluginFolder = script:FindFirstAncestor("ObjectsPlugin")

local Utility = PluginFolder:WaitForChild("Utility")

local WrapUp = PluginFolder:WaitForChild("WrapUp")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")

local PluginGlobal = require(Utility:WaitForChild("PluginGlobal"))
local plugin = PluginGlobal.pluginInstance

local constants = require(Utility:WaitForChild("Constants"))
local waitForDescendant = require(Utility:WaitForChild("WaitForDescendant"))
local theme = require(Utility:WaitForChild("Theme"))
local colorEdit = require(Utility:WaitForChild("ColorEdit"))
local connections = require(WrapUp:WaitForChild("Connections"))
local currentInsertHover = require(Utility:WaitForChild("CurrentInsertHover"))

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

local component = function(props)
    local themeState = theme.getTheme("MainBackground")
    local objectColor = props.ObjectColor or Color3.fromRGB(255, 115, 0)
    local onLeftActivated = props.OnLeftActivated
    local onRightActivated = props.OnRightActivated
    local object = props.Object
    
    local hovering = State(false)
    local leftClicking = State(false)
    local rightClicking = State(false)

    local clicking = Computed(function()
        return leftClicking:get() or rightClicking:get()
    end)

    local idleButtonColor = Computed(function()
        return colorEdit(themeState:get(), {val = -0.05}, true)
    end)

    local hoverButtonColor = Computed(function()
        return idleButtonColor:get():lerp(unwrap(objectColor), 0.2)
    end)

    local clickingButtonColor = Computed(function()
        return idleButtonColor:get():lerp(unwrap(objectColor), 0.5)
    end)

    local computedColor = Computed(function()
        if clicking:get() then
            return clickingButtonColor:get()
        elseif hovering:get() then
            return hoverButtonColor:get()
        else
            return idleButtonColor:get()
        end
    end)

    local colorSpring = Spring(computedColor, 50, 1)

    local frame = New "ImageButton" {
        BackgroundColor3 = colorSpring,
        --BackgroundTransparency = 0.9,
        ImageTransparency = 1,
        LayoutOrder = props.LayoutOrder,

        [Children] = {
            New "UICorner" {
                CornerRadius = UDim.new(0, constants.BUTTON_ROUNDING)
            },

            New "ImageLabel" {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = Spring(Computed(function()
                    if hovering:get() then
                        return UDim2.fromOffset(constants.ICON_HOVER_SIZE, constants.ICON_HOVER_SIZE)
                    else
                        return UDim2.fromOffset(constants.ICON_SIZE, constants.ICON_SIZE)
                    end
                end), 50, 1),
                Position = UDim2.fromScale(0.5, 0.5),

                BackgroundTransparency = 1,

                ImageColor3 = Spring(Computed(function()
                    if clicking:get() then
                        return Color3.new(1,1,1)
                    else
                        return unwrap(objectColor)
                    end
                end), 50, 1),
                Image = props.Icon or "rbxassetid://7733917120"
            }
        },

        [OnEvent "MouseEnter"] = function()
            hovering:set(true)
            currentInsertHover:set(object)
        end,

        [OnEvent "MouseLeave"] = function()
            hovering:set(false)
            leftClicking:set(false)
            rightClicking:set(false)
            
            if currentInsertHover:get() == object then
                currentInsertHover:set(nil)
            end
        end,

        [OnEvent "MouseButton1Down"] = function()
            leftClicking:set(true)
        end,

        [OnEvent "MouseButton1Up"] = function()
            if leftClicking:get() then
                leftClicking:set(false)
                if onLeftActivated then
                    onLeftActivated()
                else
                    --print("Activated")
                end
            end
        end,

        [OnEvent "MouseButton2Down"] = function()
            rightClicking:set(true)
        end,

        [OnEvent "MouseButton2Up"] = function()
            if rightClicking:get() then
                rightClicking:set(false)
                if onRightActivated then
                    onRightActivated()
                else
                    --print("Activated")
                end
            end
        end
    }
    
    return frame
end

return component