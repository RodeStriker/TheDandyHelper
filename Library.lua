local function createFrame(parent, name, size, position, bgColor, transparency, zIndex, additionalProps)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Name = name or "Frame"
    frame.Size = size or UDim2.new(1, 0, 1, 0)
    frame.Position = position or UDim2.new(0, 0, 0, 0)
    frame.BackgroundColor3 = bgColor or Color3.new(1, 1, 1)
    frame.BackgroundTransparency = transparency or 0
    frame.ZIndex = zIndex or 1
    for prop, value in pairs(additionalProps or {}) do
        frame[prop] = value
    end
    return frame
end

local function createScrollingFrame(parent, name, size, position, bgColor, transparency, zIndex, additionalProps)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Parent = parent
    scrollingFrame.Name = name or "ScrollingFrame"
    scrollingFrame.Size = size or UDim2.new(1, 0, 1, 0)
    scrollingFrame.Position = position or UDim2.new(0, 0, 0, 0)
    scrollingFrame.BackgroundColor3 = bgColor or Color3.new(1, 1, 1)
    scrollingFrame.BackgroundTransparency = transparency or 0
    scrollingFrame.ZIndex = zIndex or 1
    for prop, value in pairs(additionalProps or {}) do
        scrollingFrame[prop] = value
    end
    return scrollingFrame
end

local function createTextLabel(parent, name, size, position, text, textColor, textSize, additionalProps)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Name = name or "TextLabel"
    label.Size = size or UDim2.new(1, 0, 1, 0)
    label.Position = position or UDim2.new(0, 0, 0, 0)
    label.Text = text or ""
    label.TextColor3 = textColor or Color3.new(1, 1, 1)
    label.TextSize = textSize or 14
    label.BackgroundTransparency = 1
    label.BorderSizePixel = 0
    for prop, value in pairs(additionalProps or {}) do
        label[prop] = value
    end
    return label
end

local function createImageLabel(parent, name, size, position, image, imageTransparency, zIndex, additionalProps)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Parent = parent
    imageLabel.Name = name or "ImageLabel"
    imageLabel.Size = size or UDim2.new(1, 0, 1, 0)
    imageLabel.Position = position or UDim2.new(0, 0, 0, 0)
    imageLabel.Image = image or ""
    imageLabel.ImageTransparency = imageTransparency or 0
    imageLabel.ZIndex = zIndex or 1
    imageLabel.BackgroundTransparency = 1
    imageLabel.BorderSizePixel = 0
    for prop, value in pairs(additionalProps or {}) do
        imageLabel[prop] = value
    end
    return imageLabel
end

local function createUICorner(parent, cornerRadius)
    local corner = Instance.new("UICorner")
    corner.Parent = parent
    corner.CornerRadius = UDim.new(0, cornerRadius or 8)
    return corner
end

local ScreenGui_1 = Instance.new("ScreenGui")
ScreenGui_1.Parent = game.CoreGui
ScreenGui_1.Name = "LibGui"
ScreenGui_1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui_1.IgnoreGuiInset = true

local CharacterFrame = createFrame(ScreenGui_1, "CharacterFrame", UDim2.new(0.518, 0, 0.639, 0), UDim2.new(0.5, 0, 0.485, 0), Color3.fromRGB(121, 121, 121), 1, 2, {
    AnchorPoint = Vector2.new(0.5, 0.5),
    SizeConstraint = Enum.SizeConstraint.RelativeXY,
})

local Frame_2 = createFrame(CharacterFrame, "Frame", UDim2.new(1, 0, 1, 0), UDim2.new(0.5, 0, 0.5, 0), Color3.fromRGB(121, 121, 121), 0, 2, {
    AnchorPoint = Vector2.new(0.5, 0.5),
})
createUICorner(Frame_2, 8)

local UIGradient_1 = Instance.new("UIGradient")
UIGradient_1.Parent = Frame_2
UIGradient_1.Rotation = 90
UIGradient_1.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 140, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(81, 81, 81))
})

local TextLabel_1 = createTextLabel(CharacterFrame, "TextLabel", UDim2.new(0.37, 0, 0.1, 0), UDim2.new(0.646, 0, -0.1, 0), "SELECT TOON", Color3.fromRGB(255, 255, 255), 14, {
    ZIndex = 6,
    Font = Enum.Font.FredokaOne,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextYAlignment = Enum.TextYAlignment.Center
})
createUICorner(TextLabel_1, 8)

local SearchFrame = createFrame(CharacterFrame, "SearchFrame", UDim2.new(0.35, 0, 0.08, 0), UDim2.new(0.02, 0, -0.1, 0), Color3.fromRGB(0, 0, 0), 0.5, 6, {
    AnchorPoint = Vector2.new(0, 0),
})
createUICorner(SearchFrame, 6)

local SearchTextBox = Instance.new("TextBox")
SearchTextBox.Parent = SearchFrame
SearchTextBox.Size = UDim2.new(0.95, 0, 0.8, 0)
SearchTextBox.Position = UDim2.new(0.025, 0, 0.1, 0)
SearchTextBox.BackgroundTransparency = 1
SearchTextBox.Text = "Search Toons"
SearchTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchTextBox.TextSize = 14
SearchTextBox.Font = Enum.Font.FredokaOne
SearchTextBox.TextXAlignment = Enum.TextXAlignment.Left
SearchTextBox.ClearTextOnFocus = true

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = CharacterFrame
CloseButton.Size = UDim2.new(0.05, 0, 0.05, 0)
CloseButton.Position = UDim2.new(0.95, 0, 0.02, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
createUICorner(CloseButton, 8)

local ScrollingFrame_1 = createScrollingFrame(CharacterFrame, "ScrollingFrame", UDim2.new(0.727, 0, 0.945, 0), UDim2.new(0.016, 0, 0.027, 0), Color3.fromRGB(0, 0, 0), 0.65, 10, {
    ClipsDescendants = true,
    CanvasSize = UDim2.new(0, 0, 4, 0),
    ScrollBarThickness = 12,
})

local UIGridLayout_1 = Instance.new("UIGridLayout")
UIGridLayout_1.Parent = ScrollingFrame_1
UIGridLayout_1.SortOrder = Enum.SortOrder.Name
UIGridLayout_1.VerticalAlignment = Enum.VerticalAlignment.Top
UIGridLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Left
UIGridLayout_1.FillDirection = Enum.FillDirection.Horizontal

local characters = {
    {
        name = "Connie",
        image = "rbxassetid://133764935822586",
        masteryImage = "rbxassetid://17619320997",
    },
    {
        name = "Astro",
        image = "rbxassetid://17476673323",
        masteryImage = "rbxassetid://17619320997",
    }
}

for _, char in ipairs(characters) do
    local button = createFrame(ScrollingFrame_1, char.name, UDim2.new(0.173, 0, 0.155, 0), UDim2.new(0, 0, 0, 0), Color3.fromRGB(255, 255, 255), 1, 12, {
        BackgroundTransparency = 1,
    })

    local charFrame = createFrame(button, "Frame", UDim2.new(0.839, 0, 0.839, 0), UDim2.new(0.5, 0, 0.5, 0), Color3.fromRGB(121, 121, 121), 0, 2, {
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
    createUICorner(charFrame, 8)

    local charImage = createImageLabel(charFrame, "CharacterImage", UDim2.new(0.64, 0, 0.61, 0), UDim2.new(0.175, 0, 0.141, 0), char.image, 0.6, 13, {
        BackgroundTransparency = 0.6,
    })
    createUICorner(charImage, 8)

    createTextLabel(button, "CharacterName", UDim2.new(0.839, 0, 0.156, 0), UDim2.new(0.079, 0, 0.759, 0), char.name, Color3.fromRGB(255, 255, 255), 14, {
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        Font = Enum.Font.FredokaOne
    })

    local masteryStar = createImageLabel(button, "MasteryStar", UDim2.new(0.215, 0, 0.206, 0), UDim2.new(0.702, 0, 0.073, 0), char.masteryImage, 1, 13, {
        Visible = false
    })
end

print("UI Refactored and Fully Populated")
