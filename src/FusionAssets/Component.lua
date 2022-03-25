local PluginFolder = script.Parent.Parent
local Utility = PluginFolder:WaitForChild("Utility")
local Components = PluginFolder:WaitForChild("Components")

local waitForDescendant = require(Utility:WaitForChild("WaitForDescendant"))

return function(str)
    return require(waitForDescendant(Components, str))
end