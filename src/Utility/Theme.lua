local Utility = script.Parent
local PluginFolder = Utility.Parent
local WrapUp = PluginFolder:WaitForChild("WrapUp")
local FusionAssets = PluginFolder:WaitForChild("FusionAssets")
local Fusion = require(FusionAssets:WaitForChild("Fusion"))

local Value = Fusion.Value

local connections = require(WrapUp:WaitForChild("Connections"))

local Studio: Studio = settings().Studio
local Theme: StudioTheme = Studio.Theme

local themeEditor = {}

local themes = {}

local function searchForTheme(tag, mod)
    local tableTag = themes[tag] or {}
    themes[tag] = tableTag

    local state = tableTag[mod or "Default"] or Value(Theme:GetColor(Enum.StudioStyleGuideColor[tag], Enum.StudioStyleGuideModifier[mod or "Default"]))
    tableTag[mod or "Default"] = state

    if not state then error("Error with searchForTheme input/function") end

    return state
end

connections:add(Studio.ThemeChanged:Connect(function()
    Theme = Studio.Theme

    for k, v in pairs(themes) do
        local tag = k

        for k1, v1 in pairs(v) do
            local mod = k1
            local state = v1

            state:set(Theme:GetColor(Enum.StudioStyleGuideColor[tag], Enum.StudioStyleGuideModifier[mod]), true)
        end
    end
end))

function themeEditor.getTheme(tag, mod)
    return searchForTheme(tag, mod)
end

return themeEditor