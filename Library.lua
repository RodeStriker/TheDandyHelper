local LibGui = {}

local function createInstance(className, properties)
    local instance = Instance.new(className)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
    return instance
end

function LibGui.createButton(parent, text, position, size)
    return createInstance("TextButton", {
        Parent = parent,
        Text = text,
        Size = size,
        Position = position,
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        AutoButtonColor = true
    })
end

function LibGui.createLabel(parent, text, position, size)
    return createInstance("TextLabel", {
        Parent = parent,
        Text = text,
        Size = size,
        Position = position,
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSans,
        TextSize = 14
    })
end

function LibGui.createFrame(parent, position, size)
    return createInstance("Frame", {
        Parent = parent,
        Size = size,
        Position = position,
        BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    })
end

function LibGui.createTextbox(parent, placeholder, position, size)
    return createInstance("TextBox", {
        Parent = parent,
        PlaceholderText = placeholder,
        Size = size,
        Position = position,
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        ClearTextOnFocus = false
    })
end

function LibGui.createDropdown(parent, options, position, size)
    local dropdown = createInstance("Frame", {
        Parent = parent,
        Size = size,
        Position = position,
        BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    })

    local button = createInstance("TextButton", {
        Parent = dropdown,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Text = "Select"
    })

    local list = createInstance("ScrollingFrame", {
        Parent = dropdown,
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 1, 0),
        Visible = false,
        CanvasSize = UDim2.new(0, 0, #options * 0.1, 0)
    })

    for i, option in ipairs(options) do
        createInstance("TextButton", {
            Parent = list,
            Size = UDim2.new(1, 0, 0.1, 0),
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.SourceSans,
            TextSize = 14,
            Text = option,
            MouseButton1Click = function()
                button.Text = option
                list.Visible = false
            end
        })
    end

    button.MouseButton1Click:Connect(function()
        list.Visible = not list.Visible
    end)

    return dropdown
end

return LibGui
