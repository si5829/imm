if game.CoreGui:FindFirstChild("immortal") then
    game.CoreGui:FindFirstChild("immortal"):Destroy()
end



local mouse = game.Players.LocalPlayer:GetMouse()

local WindowTable = {}

local other = {}

local utility = {}

function utility:Wait()
    game:GetService("RunService").RenderStepped:Wait()
    return true
end

function utility:DraggingEnabled(frame, parent)
	
    parent = parent or frame
    
    -- stolen from wally or kiriot, kek
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)

end

function utility:InitializeKeybind()
    self.ended = {}

    game:GetService("UserInputService").InputEnded:Connect(function(key)
        if key.UserInputType == Enum.UserInputType.MouseButton1 then
            for i, callback in pairs(self.ended) do
                callback()
            end
        end
    end)
end


function utility:DraggingEnded(callback)
    table.insert(self.ended, callback)
end



function WindowTable:CreateWindow()

    local UI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local TItle = Instance.new("TextLabel")
    local Icon = Instance.new("ImageLabel")
    local Pages = Instance.new("Frame")
    local Pages_Container = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local allPages = Instance.new("Frame")
    local pagesFolder = Instance.new("Folder")
    local TextLabel = Instance.new("TextLabel")
    local UICorner_6 = Instance.new("UICorner")

    UI.Name = "immortal"
    UI.Parent = game.CoreGui
    UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    UI.ResetOnSpawn = false

    Main.Name = "Main"
    Main.Parent = UI
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.Position = UDim2.new(0.138064519, 0, 0.259833127, 0)
    Main.Size = UDim2.new(0, 518, 0, 393)

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Main

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.ZIndex = 5

    TItle.Name = "TItle"
    TItle.Parent = TopBar
    TItle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TItle.BackgroundTransparency = 1.000
    TItle.Position = UDim2.new(0, 35, 0, 0)
    TItle.Size = UDim2.new(1, -65, 1, 0)
    TItle.Font = Enum.Font.Gotham
    TItle.Text = "immortal"
    TItle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TItle.TextSize = 14.000
    TItle.TextXAlignment = Enum.TextXAlignment.Left

    Icon.Name = "Icon"
    Icon.Parent = TopBar
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Icon.Position = UDim2.new(0, 7, 0, 5)
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Image = "rbxassetid://11114630378"

    Pages.Name = "Pages"
    Pages.Parent = Main
    Pages.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Pages.BorderSizePixel = 0
    Pages.Position = UDim2.new(0, 5, 0, 35)
    Pages.Size = UDim2.new(0, 115, 1, -40)
    Pages.ZIndex = 5

    Pages_Container.Name = "Pages_Container"
    Pages_Container.Parent = Pages
    Pages_Container.Active = true
    Pages_Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pages_Container.BackgroundTransparency = 1.000
    Pages_Container.Position = UDim2.new(0, 0, 0, 5)
    Pages_Container.Size = UDim2.new(1, 0, 1, -5)
    Pages_Container.CanvasSize = UDim2.new(0, 0, 0, 348)
    Pages_Container.ScrollBarThickness = 0

    UIListLayout.Parent = Pages_Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    UIPadding.Parent = Pages_Container
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.PaddingTop = UDim.new(0, 5)

    allPages.Name = "allPages"
    allPages.Parent = Main
    allPages.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    allPages.BorderSizePixel = 0
    allPages.Position = UDim2.new(0, 125, 0, 35)
    allPages.Size = UDim2.new(1, -130, 1, -40)

    pagesFolder.Name = "pagesFolder"
    pagesFolder.Parent = allPages

    utility:DraggingEnabled(TopBar, Main)

    local TabHandler = {}

    function TabHandler:CreateTab(tabname)
        tabname = tabname or "New Tab"
        local TabButton = Instance.new("TextButton")
        local Page = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local UIPadding_2 = Instance.new("UIPadding")
        local UIListLayout_2 = Instance.new("UIListLayout")

        TabButton.Name = "TabButton"
        TabButton.Parent = Pages_Container
        TabButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0, 95, 0, 35)
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = tabname
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 15.000

        Page.Name = "Page"
        Page.Parent = pagesFolder
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.Visible = false
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(1, 0, 1, 0)

        UICorner_2.CornerRadius = UDim.new(0, 5)
        UICorner_2.Parent = TabButton

        UIPadding_2.Parent = Page
        UIPadding_2.PaddingLeft = UDim.new(0, 5)
        UIPadding_2.PaddingTop = UDim.new(0, 5)

        UIListLayout_2.Parent = Page
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 5)

        TabButton.MouseButton1Click:Connect(function()
            for i, v in next, pagesFolder:GetChildren() do
                v.Visible = false
            end
            Page.Visible = true

            for i, v in next, Pages_Container:GetChildren() do
                if v:IsA("TextButton") then
                    game:GetService("TweenService"):Create(v,TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                    }):Play()
                end
            end
            game:GetService("TweenService"):Create(TabButton,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
                BackgroundColor3 = Color3.fromRGB(45, 255, 0)
            }):Play()

        end)

        local ElementHandler = {}

        function ElementHandler:CreateButton(btnText, callback)
            btnText = btnText or "Text Button"
            callback = callback or function() end

            local Button = Instance.new("TextButton")
            local UICorner_3 = Instance.new("UICorner")

            Button.Name = "Button"
            Button.Parent = Page
            Button.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 0, 0, 5)
            Button.Size = UDim2.new(1, -5, 0, 35)
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14.000
            Button.MouseButton1Click:Connect(function() callback() end)

            UICorner_3.CornerRadius = UDim.new(0, 4)
            UICorner_3.Parent = Button

        end

        function ElementHandler:CreateToggle(togInfo, callback)
            togInfo = togInfo or "Toggle"
            callback = callback or function() end

            local Toggle = Instance.new("TextButton")
            local UICorner_4 = Instance.new("UICorner")
            local Title = Instance.new("TextLabel")
            local Frame = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = Page
            Toggle.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0, 0, 0, 5)
            Toggle.Size = UDim2.new(1, -5, 0, 35)
            Toggle.Font = Enum.Font.Gotham
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.TextSize = 14.000

            UICorner_4.CornerRadius = UDim.new(0, 4)
            UICorner_4.Parent = Toggle

            Title.Name = "Title"
            Title.Parent = Toggle
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0, 8, 0, 0)
            Title.Size = UDim2.new(1, -60, 1, 0)
            Title.Font = Enum.Font.Gotham
            Title.Text = togInfo
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 14.000
            Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextXAlignment = Enum.TextXAlignment.Left

            Frame.Parent = Toggle
            Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(1, -35, 0, 5)
            Frame.Size = UDim2.new(0, 25, 0, 25)

            UICorner_5.CornerRadius = UDim.new(0, 6)
            UICorner_5.Parent = Frame

            local tog = false

            Toggle.MouseButton1Click:Connect(function()
                tog = not tog
                callback(tog)
                if tog then
                    game:GetService("TweenService"):Create(Frame,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.In),{
                        BackgroundColor3 = Color3.fromRGB(45, 255, 0)
                    }):Play()
                else
                    game:GetService("TweenService"):Create(Frame,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.In),{
                        BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                    }):Play()
                end
            end)
        end

        function ElementHandler:CreateLabel(text)
            TextLabel.Parent = Page
            TextLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
            TextLabel.BorderSizePixel = 0
            TextLabel.Size = UDim2.new(1, -5, 0, 35)
            TextLabel.Font = Enum.Font.Gotham
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.Text = text
            TextLabel.TextSize = 14.000

            UICorner_6.CornerRadius = UDim.new(0, 4)
            UICorner_6.Parent = TextLabel
        end

        function ElementHandler:CreateSlider(title, default, min, max, callback)
            local Slider = Instance.new("ImageButton")
            local Title = Instance.new("TextLabel")
            local Value = Instance.new("TextLabel")
            local SliderHold = Instance.new("TextLabel")
            local Bar = Instance.new("ImageLabel")
            local Fill = Instance.new("ImageLabel")
            local UICorner = Instance.new("UICorner")
            local UICorner_2 = Instance.new("UICorner")

            Slider.Name = "Slider"
            Slider.Parent = Page
            Slider.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
            Slider.BackgroundTransparency = 1.000
            Slider.BorderSizePixel = 0
            Slider.Size = UDim2.new(1, -5, 0, 35)
            Slider.Image = "rbxassetid://5028857472"
            Slider.ImageColor3 = Color3.fromRGB(22, 22, 22)

            Title.Name = "Title"
            Title.Parent = Slider
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderSizePixel = 0
            Title.Position = UDim2.new(0, 10, 0, 5)
            Title.Size = UDim2.new(0.5, 0, 0, 16)
            Title.ZIndex = 3
            Title.Font = Enum.Font.Gotham
            Title.Text = "Slider"
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 14.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            Value.Name = "Value"
            Value.Parent = Slider
            Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Value.BackgroundTransparency = 1.000
            Value.BorderSizePixel = 0
            Value.Position = UDim2.new(1, -30, 0, 6)
            Value.Size = UDim2.new(0, 20, 0, 16)
            Value.ZIndex = 3
            Value.Font = Enum.Font.Gotham
            Value.Text = default
            Value.TextColor3 = Color3.fromRGB(255, 255, 255)
            Value.TextSize = 12.000
            Value.TextXAlignment = Enum.TextXAlignment.Right

            SliderHold.Name = "Slider"
            SliderHold.Parent = Slider
            SliderHold.BackgroundTransparency = 1
            SliderHold.BorderSizePixel = 0
            SliderHold.Position = UDim2.new(0, 10, 0, 28)
            SliderHold.Size = UDim2.new(1, -20, 0, 16)
            SliderHold.ZIndex = 3
            SliderHold.Text = ""

            Bar.Name = "Bar"
            Bar.Parent = SliderHold
            Bar.AnchorPoint = Vector2.new(0, 0.5)
            Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Bar.BackgroundTransparency = 1.000
            Bar.Position = UDim2.new(0, 0, 0.00200000009, 0)
            Bar.Size = UDim2.new(1, 0, 0, 9)
            Bar.ZIndex = 3
            Bar.Image = "rbxassetid://5028857472"
            Bar.ImageColor3 = Color3.fromRGB(25, 25, 25)

            Fill.Name = "Fill"
            Fill.Parent = Bar
            Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Fill.BackgroundTransparency = 1.000
            Fill.BorderSizePixel = 0
            Fill.Size = UDim2.new(0.800000012, 0, 1, 0)
            Fill.ZIndex = 3
            Fill.Image = "rbxassetid://5028857472"
            Fill.ImageColor3 = Color3.fromRGB(45, 255, 0)

            UICorner.CornerRadius = UDim.new(0, 4)
            UICorner.Parent = Fill

            UICorner_2.CornerRadius = UDim.new(0, 4)
            UICorner_2.Parent = Slider

            local value = default or min

            local dragging, last

            local callback = function(value)
                if callback then
                    callback(value, function(...)
                        other:updateSlider(Slider, ...)
                    end)
                end
            end

            utility:DraggingEnded(function()
                dragging = false
            end)

            other:updateSlider(Slider, nil, value, min, max)

            Slider.MouseButton1Click:Connect(function(input)
                dragging = true

                while dragging do
                    value = other:updateSlider(Slider, nil, value, min, max, value)

                    callback(value)

                    utility:Wait()
                end
            end)

            

            Bar:GetPropertyChangedSignal("Size"):Connect(function()
                value = other:updateSlider(Slider, nil, value, min, max)
                Value.Text = value
                callback(value)
            end)
            
        end


        function other:updateSlider(slider, title, value, min, max, lvalue)
    
            if title then
                slider.Title.Text = title
            end
            
            local bar = slider.Slider.Bar
            local percent = (mouse.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X

            if value then -- support negative ranges
                percent = (value - min) / (max - min)
            end
            
            percent = math.clamp(percent, 0, 1)
            value = value or math.floor(min + (max - min) * percent)
            
            utility:Tween(bar.Fill, {Size = UDim2.new(percent, 0, 1, 0)}, 0.1)
            
            return value
        end

        return ElementHandler
    end

    return TabHandler
end

return WindowTable
