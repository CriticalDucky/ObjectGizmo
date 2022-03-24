local WrapUp = script.Parent
local PluginFolder = WrapUp.Parent
local Utility = PluginFolder:WaitForChild("Utility")

local PluginGlobal = require(Utility:WaitForChild("PluginGlobal"))
local plugin = PluginGlobal.pluginInstance

local connections = {}

connections.roblox = {}
connections.fusion = {}

function connections:add(connection)
    local connectionType do 
        if typeof(connection) == "function" then
            connectionType = "fusion"
        else
            connectionType = "roblox"
        end
    end

    --print(connectionType)

    table.insert(self[connectionType], connection)
end

local unloadingConnection

unloadingConnection = plugin.Unloading:Connect(function()
    unloadingConnection:Disconnect()

    for _, v in ipairs(connections.roblox) do
        v:Disconnect()
        --print("Disconnected", v)
    end

    for _, v in ipairs(connections.fusion) do
        v()
        --print("Disconnected", v)
    end

    --print("Unloaded")
end)

return connections