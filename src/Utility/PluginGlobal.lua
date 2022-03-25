local pluginTable = {}

function pluginTable.give(pluginInstance)
    --print ("given")
    pluginTable.pluginInstance = pluginInstance
end

return pluginTable