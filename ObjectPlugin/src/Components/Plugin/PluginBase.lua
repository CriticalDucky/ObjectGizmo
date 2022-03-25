local PluginFolder = script:FindFirstAncestor("ObjectsPlugin")

local Utility = PluginFolder:WaitForChild("Utility")
local WrapUp = PluginFolder:WaitForChild("WrapUp")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")

local widgetSize = require(Utility:WaitForChild("WidgetSize"))
local constants = require(Utility:WaitForChild("Constants"))
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
local State = Fusion.State
local Computed = Fusion.Computed
local Compat = Fusion.Compat
local Spring = Fusion.Spring

local unwrap = require(FusionAssets:WaitForChild("Unwrap"))

local ObjectButtons = Component "ObjectButtons"

local component = function(widget)
    local mouseIn = State(false)

    local scrollbarColor = Computed(function()
        local currentMouseIn = mouseIn:get()

        if currentMouseIn then
            return theme.getTheme("ScrollBar", "Hover"):get()
        else
            return theme.getTheme("ScrollBar", "Default"):get()
        end
    end)

    local scrollingFrame: ScrollingFrame = New "ScrollingFrame" {
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.new(
            1,
            -8,
            1,
            -8
        ),
        Position = UDim2.new(0.5, 0, 0, 4),

        BackgroundTransparency = 1,

        AutomaticCanvasSize = Computed(function()
            return Enum.AutomaticSize[widgetSize.mode:get() or "X"]
        end),
        CanvasSize = UDim2.fromScale(0, 1),

        ScrollBarImageColor3 = Spring(scrollbarColor, 50, 1),
        ScrollBarThickness = 4,
        ScrollingDirection =  Computed(function()
            return Enum.ScrollingDirection[widgetSize.mode:get() or "X"]
        end),
        ScrollBarImageTransparency = 0,
        HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
        VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,

        TopImage = "rbxassetid://158362307",
        MidImage = "rbxassetid://158362264",
        BottomImage = "rbxassetid://158362221",

        [Children] = {
            -- New "UIListLayout" {
            --     Padding = UDim.new(0, 4),
            --     FillDirection = Enum.FillDirection.Vertical,
            --     HorizontalAlignment = Enum.HorizontalAlignment.Left,
            --     VerticalAlignment = Enum.VerticalAlignment.Top,
            --     SortOrder = Enum.SortOrder.LayoutOrder
            -- },

            New "UIGridLayout" {
                CellPadding = UDim2.fromOffset(4, 4),
                CellSize = UDim2.fromOffset(constants.BUTTON_SIZE, constants.BUTTON_SIZE),
                StartCorner = Enum.StartCorner.TopLeft,

                FillDirection = Computed(function()
                    return Enum.FillDirection[widgetSize.mode:get() == "Y" and "Horizontal" or "Vertical"]
                end),
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                
            },

            ObjectButtons {},
        }
    }

    connections:add(Compat(widgetSize.mode):onChange(function()
        scrollingFrame.CanvasPosition = Vector2.new(0, 0)
    end))

    local frame = New "Frame" {
        AnchorPoint = Vector2.new(0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.new(),

        BackgroundColor3 = theme.getTheme("MainBackground", "Default"),

        [Children] = {
            scrollingFrame
        },

        [OnEvent "MouseEnter"] = function()
            mouseIn:set(true)
        end,

        [OnEvent "MouseLeave"] = function()
            mouseIn:set(false)
        end,

        Parent = widget
    }

    return frame
end

return component