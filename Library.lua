local UILibrary = {}

function UILibrary:CreateWindow(title)
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "UILibrary"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 700, 0, 500)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Parent = screenGui

    -- UICorner for rounded edges
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame

    -- Background Frame with ImageLabel
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundTransparency = 1
    background.Parent = mainFrame

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.Image = "rbxassetid://6794283750"
    imageLabel.ScaleType = Enum.ScaleType.Tile
    imageLabel.TileSize = UDim2.new(0, 50, 0, 50)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Parent = background

    -- Add UIGradient to the ImageLabel
    local backgroundGradient = Instance.new("UIGradient")
    backgroundGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
    }
    backgroundGradient.Rotation = 45
    backgroundGradient.Parent = imageLabel

    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -50, 1, 0)
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Font = Enum.Font.GothamBold
    titleText.Text = title
    titleText.TextSize = 20
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar

    -- Circular Close Button
    local closeButton = Instance.new("ImageButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 40, 0, 40)
    closeButton.Position = UDim2.new(1, 10, 0, -20) -- Positioned outside the main frame
    closeButton.AnchorPoint = Vector2.new(1, 0.5)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.Parent = screenGui

    local closeButtonCorner = Instance.new("UICorner")
    closeButtonCorner.CornerRadius = UDim.new(1, 0) -- Makes it a circle
    closeButtonCorner.Parent = closeButton

    -- Add UIGradient to Close Button
    local closeGradient = Instance.new("UIGradient")
    closeGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 50, 50))
    }
    closeGradient.Rotation = 90
    closeGradient.Parent = closeButton

    local closeText = Instance.new("TextLabel")
    closeText.Size = UDim2.new(1, 0, 1, 0)
    closeText.BackgroundTransparency = 1
    closeText.Font = Enum.Font.GothamBold
    closeText.Text = "X"
    closeText.TextSize = 20
    closeText.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeText.Parent = closeButton

    -- Scroll Frame for Content
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -60)
    contentFrame.Position = UDim2.new(0, 10, 0, 50)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ScrollBarThickness = 8
    contentFrame.BorderSizePixel = 0
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentFrame.Parent = mainFrame

    -- Function to add rounded buttons
    local function addRoundedButton(parent, text, callback)
        local button = Instance.new("TextButton")
        button.Name = text
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.new(0, 5, 0, (#parent:GetChildren() - 1) * 45)
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

    -- Draggable functionality
    local dragging, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                local delta = input.Position - dragStart
                mainFrame.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    -- Close Button functionality
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    return {
        AddButton = function(self, buttonText, callback)
            addRoundedButton(contentFrame, buttonText, callback)
            contentFrame.CanvasSize = UDim2.new(0, 0, 0, #contentFrame:GetChildren() * 45)
        end
    }
end

return UILibrary
