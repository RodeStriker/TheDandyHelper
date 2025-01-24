local GuiLibrary = {}

function GuiLibrary:CreateWindow()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TabsGui"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = game.CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0.52, 0, 0.64, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundTransparency = 1
    MainFrame.Parent = ScreenGui

    local BackgroundFrame = Instance.new("Frame")
    BackgroundFrame.Size = UDim2.new(1, 0, 1, 0)
    BackgroundFrame.BackgroundColor3 = Color3.fromRGB(121, 121, 121)
    BackgroundFrame.Parent = MainFrame

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new(
        Color3.fromRGB(140, 140, 140),
        Color3.fromRGB(81, 81, 81)
    )
    Gradient.Rotation = 90
    Gradient.Parent = BackgroundFrame

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = BackgroundFrame

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        BackgroundFrame = BackgroundFrame,
    }
end

function GuiLibrary:AddTitle(window, titleText)
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0.46, 0, 0.1, 0)
    Title.Position = UDim2.new(0.5, 0, -0.1, 0)
    Title.AnchorPoint = Vector2.new(0.5, 0)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextSize = 18
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.FredokaOne
    Title.Parent = window.MainFrame
end

function GuiLibrary:AddScrollingFrame(window)
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Name = "ScrollingFrame"
    ScrollingFrame.Size = UDim2.new(0.7, 0, 0.94, 0)
    ScrollingFrame.Position = UDim2.new(0.02, 0, 0.03, 0)
    ScrollingFrame.BackgroundTransparency = 0.65
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 4, 0)
    ScrollingFrame.ScrollBarThickness = 12
    ScrollingFrame.Parent = window.MainFrame

    local GridLayout = Instance.new("UIGridLayout")
    GridLayout.SortOrder = Enum.SortOrder.Name
    GridLayout.FillDirection = Enum.FillDirection.Horizontal
    GridLayout.Parent = ScrollingFrame

    return ScrollingFrame
end

function GuiLibrary:AddButton(parent, buttonText, callback)
    local Button = Instance.new("TextButton")
    Button.Name = buttonText .. "Button"
    Button.Size = UDim2.new(0.17, 0, 0.15, 0)
    Button.BackgroundTransparency = 1
    Button.Text = buttonText
    Button.TextSize = 14
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.FredokaOne
    Button.Parent = parent

    Button.MouseButton1Click:Connect(function()
        callback()
    end)

    return Button
end

return GuiLibrary
