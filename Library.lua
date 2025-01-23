local LibraryUI = {}

function LibraryUI:CreateLibrary()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "LibraryUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0.5, 0, 0.6, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(121, 121, 121)
    MainFrame.BorderSizePixel = 0

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = MainFrame
    UICorner.CornerRadius = UDim.new(0, 8)

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Parent = MainFrame
    ScrollingFrame.Name = "ItemScrollingFrame"
    ScrollingFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
    ScrollingFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.ScrollBarThickness = 10
    
    local UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.Parent = ScrollingFrame
    UIGridLayout.CellSize = UDim2.new(0.2, 0, 0.2, 0)
    UIGridLayout.CellPadding = UDim2.new(0.02, 0, 0.02, 0)

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        ScrollingFrame = ScrollingFrame,
        UIGridLayout = UIGridLayout,
    }
end

function LibraryUI:AddElement(library, name, imageId)
    local ElementButton = Instance.new("TextButton")
    ElementButton.Parent = library.ScrollingFrame
    ElementButton.Name = name
    ElementButton.Text = ""
    ElementButton.BackgroundColor3 = Color3.fromRGB(121, 121, 121)
    ElementButton.Size = UDim2.new(0, 100, 0, 100)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = ElementButton
    UICorner.CornerRadius = UDim.new(0, 8)

    local Image = Instance.new("ImageLabel")
    Image.Parent = ElementButton
    Image.Image = "rbxassetid://" .. imageId
    Image.Size = UDim2.new(0.8, 0, 0.8, 0)
    Image.Position = UDim2.new(0.1, 0, 0.1, 0)
    Image.BackgroundTransparency = 1

    return ElementButton
end

return LibraryUI
