-- Path: LibGui.lua

local function createInstance(className, properties, parent)
    local instance = Instance.new(className)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
    instance.Parent = parent
    return instance
end

local function createUICorner(parent, cornerRadius)
    return createInstance("UICorner", { CornerRadius = UDim.new(0, cornerRadius) }, parent)
end

local function createUIGradient(parent, colorSequence, rotation)
    return createInstance("UIGradient", { 
        Color = colorSequence, 
        Rotation = rotation or 0 
    }, parent)
end

-- Main Screen GUI
local screenGui = createInstance("ScreenGui", {
    Parent = game.CoreGui,
    Name = "LibGui",
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true
}, nil)

-- Character Frame
local characterFrame = createInstance("Frame", {
    Name = "CharacterFrame",
    Size = UDim2.new(0.52, 0, 0.64, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(121, 121, 121)
}, screenGui)

-- Inner Frame with Gradient
local innerFrame = createInstance("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(121, 121, 121)
}, characterFrame)
createUIGradient(innerFrame, ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 140, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(81, 81, 81))
}, 90)
createUICorner(innerFrame, 8)

-- Utility to create labels
local function createLabel(parent, text, position, size, fontSize)
    return createInstance("TextLabel", {
        Text = text,
        Size = size,
        Position = position,
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = fontSize,
        Font = Enum.Font.FredokaOne,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center
    }, parent)
end

-- Add TextLabel
local textLabel = createLabel(characterFrame, "SELECT TOON", UDim2.new(0.65, 0, -0.1, 0), UDim2.new(0.37, 0, 0.1, 0), 14)
createUICorner(textLabel, 8)

-- Add Scrolling Frame
local scrollingFrame = createInstance("ScrollingFrame", {
    Size = UDim2.new(0.73, 0, 0.95, 0),
    Position = UDim2.new(0.02, 0, 0.03, 0),
    CanvasSize = UDim2.new(0, 0, 4, 0),
    BackgroundTransparency = 0.65,
    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
}, characterFrame)

createInstance("UIGridLayout", {
    SortOrder = Enum.SortOrder.Name,
    FillDirection = Enum.FillDirection.Horizontal
}, scrollingFrame)

local function createButton(parent, name, text)
    local button = createInstance("TextButton", {
        Name = name,
        Text = text,
        Size = UDim2.new(0.17, 0, 0.16, 0),
        BackgroundTransparency = 1
    }, parent)
    return button
end

local button1 = createButton(scrollingFrame, "Connie", " ")
createLabel(button1, "Connie", UDim2.new(0.08, 0, 0.76, 0), UDim2.new(0.84, 0, 0.16, 0), 14)
