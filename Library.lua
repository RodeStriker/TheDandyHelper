local UILibrary = {}

function UILibrary:CreateWindow(title)
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "UILibrary"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true -- Ensures compatibility on mobile
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Main Frame (stores all other frames)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 600, 0, 400)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true -- Required for dragging
    mainFrame.Parent = screenGui

    -- UICorner for rounded edges
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10) -- Adjust for roundness
    corner.Parent = mainFrame

    -- Background Image with Gradient
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Position = UDim2.new(0, 0, 0, 0)
    background.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    background.BorderSizePixel = 0
    background.Parent = mainFrame

    -- Gradient Effect
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
    }
    gradient.Rotation = 45
    gradient.Parent = background

    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -50, 1, 0)
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Font = Enum.Font.GothamBold
    titleText.Text = title
    titleText.TextSize = 18
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar

    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 40, 0, 40)
    closeButton.Position = UDim2.new(1, -40, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 20
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Parent = titleBar

    -- Scrolling Frame for Content
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -60)
    contentFrame.Position = UDim2.new(0, 10, 0, 50)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ScrollBarThickness = 8
    contentFrame.BorderSizePixel = 0
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentFrame.Parent = mainFrame

    -- Add UICorner to ScrollingFrame items dynamically
    local function addRoundedButton(parent, text, callback)
        local button = Instance.new("TextButton")
        button.Name = text
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.new(0, 5, 0, (#contentFrame:GetChildren() - 1) * 45)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = text
        button.Font = Enum.Font.GothamBold
        button.TextSize = 16
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Parent = parent

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 5)
        btnCorner.Parent = button

        button.MouseButton1Click:Connect(callback)
    end

    -- Make the UI Draggable
    local dragging = false
    local dragInput, dragStart, startPos

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Close functionality
    closeButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)

    return {
        AddButton = function(self, buttonText, callback)
            addRoundedButton(contentFrame, buttonText, callback)
            contentFrame.CanvasSize = UDim2.new(0, 0, 0, #contentFrame:GetChildren() * 45)
        end
    }
end

return UILibrary
