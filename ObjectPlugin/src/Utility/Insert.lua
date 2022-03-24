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

local screenCenter = Computed(function()
    return Vector2.new(ViewportSizeState:get().X/2, ViewportSizeState:get().Y/2)
end)

local function insert(object)
    local DEPTH = 1028
    local NONEXISTANT_DEPTH = 500

    local BASEPLATE_HEIGHT = 0

    local camera = workspace.CurrentCamera
    
    if not camera then return end

    local object = object.new()

    if not object then return end

    local size = object.Size

    local function roundPositionFromSize(position, size)
        return math.round(position - size/2) + size/2
    end

    local cameraTarget, void do
        local ray = Ray.new(camera.CFrame.Position, camera.CFrame.LookVector * DEPTH)

        local raycastResult = workspace:Raycast(ray.Origin, ray.Direction)

        local resultingPosition = (raycastResult and raycastResult.Position) or camera.CFrame.Position + ray.Unit.Direction * NONEXISTANT_DEPTH

        if not (raycastResult and raycastResult.Position) then void = true end

        cameraTarget = resultingPosition
    end

    local roundedXPosition, roundedZPosition do
        roundedXPosition = roundPositionFromSize(cameraTarget.X, size.X)
        roundedZPosition = roundPositionFromSize(cameraTarget.Z, size.Z)
    end

    local parent do
        local selection = Selection:Get()[1]

        if not selection then
            parent = workspace
        else
            local selectionParent = selection.Parent
            
            if selectionParent == game then
                parent = workspace
            else
                parent = selectionParent
            end
        end
    end

    local newPosition = Vector3.new(roundedXPosition, cameraTarget.Y, roundedZPosition)

    ChangeHistoryService:SetWaypoint("Inserting object from insert plugin")

    object.Parent = parent
    object.Position = newPosition

    local function elevate()
        while #workspace:GetPartsInPart(object) > 0 do
            object.Position += Vector3.new(0, 1, 0)
        end

        repeat
            object.Position += Vector3.new(0, -0.001, 0)
        until #workspace:GetPartsInPart(object) > 0

        object.Position += Vector3.new(0, 0.001, 0)
    end

    if void then
        local raycastResult = workspace:Raycast(
            newPosition, 
            newPosition - Vector3.new(
                0, 
                math.clamp(
                    Vector3.new(0, newPosition.Y, 0).Magnitude,
                    0,
                    5000
                ),
                0
            )
        )

        if raycastResult and raycastResult.Position then
            object.Position = raycastResult.Position
        else
            object.Position = Vector3.new(object.Position.X, 0, object.Position.Z)
        end

        elevate()
    else
        object.Position = newPosition

        elevate()
    end

    ChangeHistoryService:SetWaypoint("Inserted object from insert plugin")
    Selection:Set({object})
end

return insert