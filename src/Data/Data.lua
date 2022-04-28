local data = {}

local function find(name)
    local assets = script.Parent:WaitForChild("Assets")
    return require(assets:WaitForChild(name))
end

data.classes = {
    basic = {
        order = 1,
        color = Color3.new(0, 0.764705, 1)
    },

    stretch = {
        order = 3,
        color = Color3.new(0.772549, 0.945098, 0)
    },

    seat = {
        order = 2,
        color = Color3.new(0, 0.878431, 0.686274)
    },

    mesh1 = {
        order = 4,
        color = Color3.new(1, 0.125490, 0.313725)
    },

    shape = {
        order = 5,
        color = Color3.fromRGB(255, 81, 12)
    },

    text = {
        order = 6,
        color = Color3.fromRGB(255, 219, 12)
    },

    cone = {
        order = 7,
        color = Color3.fromRGB(255, 12, 133)
    },

    dev = {
        order = 8,
        color = Color3.fromRGB(166, 12, 255)
    },
}

data.objects = {
    basic = {
        {
            tag = "block",
            new = find("Block"),
            icon = "https://www.roblox.com/asset/?id=9087232887",
            name = "Block"
        },
    
        {
            tag = "sphere",
            new = find("Sphere"),
            icon = "https://www.roblox.com/asset/?id=9086581554",
            name = "Sphere"
        },
    
        {
            tag = "wedge",
            new = find("Wedge"),
            icon = "https://www.roblox.com/asset/?id=9086583059",
            name = "Wedge"
        },
    
        {
            tag = "cylinder",
            new = find("Cylinder"),
            icon = "https://www.roblox.com/asset/?id=9086583856",
            name = "Cylinder"
        },
    
        {
            tag = "cornerWedge",
            new = find("CornerWedge"),
            icon = "https://www.roblox.com/asset/?id=9086584476",
            name = "Corner Wedge"
        },
    
        {
            tag = "truss",
            new = find("Truss"),
            icon = "https://www.roblox.com/asset/?id=9087431519",
            name = "Truss"
        },
    
        {
            tag = "studdedPart",
            new = find("StuddedPart"),
            icon = "rbxassetid://9156673886",
            name = "Studded Part"
        },

        {
            tag = "spawn",
            new = find("Spawn"),
            icon = "rbxassetid://9179008286",
            name = "Spawn"
        },
    },

    stretch = {
        {
            tag = "stretchSphere",
            new = find("StretchSphere"),
            icon = "https://www.roblox.com/asset/?id=9086581554",
            name = "Stretch Sphere"
        },
    
        {
            tag = "stretchCylinder",
            new = find("StretchCylinder"),
            icon = "https://www.roblox.com/asset/?id=9086583856",
            name = "Stretch Cylinder"
        },
    },

    seat = {
        {
            tag = "seat",
            new = find("Seat"),
            icon = "https://www.roblox.com/asset/?id=9087609419",
            name = "Seat"
        },
    
        {
            tag = "vehicleSeat",
            new = find("VehicleSeat"),
            icon = "https://www.roblox.com/asset/?id=9087608851",
            name = "Vehicle Seat"
        },
    },

    mesh1 = {
        {
            tag = "vertexWedge",
            new = find("VertexWedge"),
            icon = "https://www.roblox.com/asset/?id=9087785941",
            name = "Vertex Wedge"
        },

        {
            tag = "antiVertexWedge",
            new = find("AntiVertexWedge"),
            icon = "rbxassetid://9182519379",
            name = "Anti-Vertex-Wedge"
        },
    
        {
            tag = "pyramid",
            new = find("Pyramid"),
            icon = "https://www.roblox.com/asset/?id=9092095556",
            name = "Pyramid"
        },

        {
            tag = "tetrahedron",
            new = find("Tetrahedron"),
            icon = "https://www.roblox.com/asset/?id=9086584476",
            name = "Tetrahedron"
        },
    
        {
            tag = "roundCornerWedge",
            new = find("RoundCornerWedge"),
            icon = "rbxassetid://9483219968",
            name = "Round Corner Wedge"
        },

        {
            tag = "halfSphere",
            new = find("HalfSphere"),
            icon = "https://www.roblox.com/asset/?id=9093433412",
            name = "Half Sphere"
        },
    
        {
            tag = "halfCylinder",
            new = find("HalfCylinder"),
            icon = "https://www.roblox.com/asset/?id=9095132460",
            name = "Half Cylinder"
        },

        {
            tag = "quarterCylinder",
            new = find("QuarterCylinder"),
            icon = "rbxassetid://9179311724",
            name = "Quarter Cylinder"
        },
    
        {
            tag = "cylinderWedge",
            new = find("CylinderWedge"),
            icon = "rbxassetid://9483381627",
            name = "Cylinder Wedge"
        },

        {
            tag = "curvedSlant",
            new = find("CurvedSlant"),
            icon = "rbxassetid://9158731033",
            name = "Curved Wedge"
        },

        {
            tag = "tunnelCube",
            new = find("TunnelCube"),
            icon = "rbxassetid://9172879254",
            name = "Tunneled Cube"
        },

        {
            tag = "icosphere1",
            new = find("Icosphere1"),
            icon = "rbxassetid://9165971078",
            name = "Icosphere 1"
        },

        {
            tag = "icosphere2",
            new = find("Icosphere2"),
            icon = "rbxassetid://9165072179",
            name = "Icosphere 2"
        },
    },

    shape = {
            
        {
            tag = "triangle",
            new = find("Triangle"),
            icon = "https://www.roblox.com/asset/?id=9112920038",
            name = "Triangle"
        },
    
        {
            tag = "pentagon",
            new = find("Pentagon"),
            icon = "rbxassetid://9179400902",
            name = "Pentagon"
        },

        {
            tag = "hexagon",
            new = find("Hexagon"),
            icon = "https://www.roblox.com/asset/?id=9149338928",
            name = "Hexagon"
        },

        {
            tag = "octagon",
            new = find("Octagon"),
            icon = "rbxassetid://9165072179",
            name = "Octagon"
        },
    
        {
            tag = "star",
            new = find("Star"),
            icon = "rbxassetid://9158926514",
            name = "Star"
        },

        {
            tag = "mathStar",
            new = find("MathStar"),
            icon = "rbxassetid://9158926592",
            name = "Mathematical Star"
        },

        {
            tag = "heart",
            new = find("Heart"),
            icon = "rbxassetid://9179124493",
            name = "Heart"
        },
    },

    cone = {
        {
            tag = "smoothCone",
            new = find("SmoothCone"),
            icon = "rbxassetid://9168485886",
            name = "Smooth Cone"
        },
        
        {
            tag = "flatCone",
            new = find("FlatCone"),
            icon = "rbxassetid://9168485886",
            name = "Flat Cone"
        },

        {
            tag = "sidedCone6",
            new = find("6SidedCone"),
            icon = "rbxassetid://9175303281",
            name = "Cone 6 Sides"
        },

        {
            tag = "slicedConeFlat",
            new = find("SlicedCone"),
            icon = "rbxassetid://9175354077",
            name = "Sliced Cone"
        },
    },

    text = {
        {
            tag = "sign",
            new = find("Sign"),
            icon = "rbxassetid://9182504851",
            name = "Sign"
        },

        {
            tag = "neon",
            new = find("Neon"),
            icon = "rbxassetid://9172667965",
            name = "Neon Sign"
        },
    },

    dev = {
        {
            tag = "developmentPart",
            new = find("DevelopmentPart"),
            icon = "rbxassetid://9483406911",
            name = "Development Part"
        },

        {
            tag = "developmentMirror",
            new = find("DevelopmentMirror"),
            icon = "rbxassetid://9483381626",
            name = "Development Mirror"
        },

        {
            tag = "developmentHinge",
            new = find("DevelopmentHinge"),
            icon = "rbxassetid://9483381623",
            name = "Development Hinge"
        },
    },
}

function data.find(tag)
    for k, v in pairs(data.objects) do
        for i, v in ipairs(v) do
            if v.tag == tag then
                return v
            end
        end
    end
end

return data
