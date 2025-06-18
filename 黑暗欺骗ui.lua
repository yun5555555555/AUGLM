-- 创建玩家GUI
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DarkDeceptionUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- 创建背景框架
local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundTransparency = 1
background.Parent = gui

-- 创建暗黑风格渐变背景
local gradient = Instance.new("UIGradient")
gradient.Rotation = 45
gradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.5, 0.3),
    NumberSequenceKeypoint.new(1, 0.6)
})
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 0, 50)),  -- 深紫色
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 0, 30)),  -- 深红色
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 0, 70))   -- 深蓝色
})
gradient.Parent = background

-- 背景动画
local gradientAnimation = game:GetService("RunService").Heartbeat:Connect(function(dt)
    local offset = gradient.Offset
    gradient.Offset = Vector2.new(
        (offset.X + dt * 0.05) % 1,
        (offset.Y + dt * 0.05) % 1
    )
end)

-- 创建主框架
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 30)  -- 非常深的紫色
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Parent = background

-- 圆角效果
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = mainFrame

-- 添加边框阴影
local shadow = Instance.new("UIStroke")
shadow.Color = Color3.fromRGB(150, 0, 0)  -- 红色边框
shadow.Transparency = 0.7
shadow.Thickness = 2
shadow.Parent = mainFrame

-- 创建标题
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.8, 0, 0.15, 0)
title.Position = UDim2.new(0.1, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.Text = "黑暗欺骗脚本控制台"
title.TextColor3 = Color3.fromRGB(255, 50, 50)  -- 红色文字
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- 创建按钮函数
local function createButton(name, text, positionY, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0.8, 0, 0.15, 0)
    button.Position = UDim2.new(0.1, 0, positionY, 0)
    button.BackgroundColor3 = Color3.fromRGB(80, 0, 40)  -- 深红紫色
    button.BackgroundTransparency = 0.3
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 100, 100)    -- 亮红色
    button.TextScaled = true
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = false
    button.Parent = mainFrame
    
    -- 按钮圆角
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0.2, 0)
    buttonCorner.Parent = button
    
    -- 按钮边框
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.fromRGB(150, 0, 0)
    buttonStroke.Transparency = 0.9
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button
    
    -- 鼠标悬停效果
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.2),
            {BackgroundTransparency = 0.1, TextColor3 = Color3.fromRGB(255, 150, 150)}
        ):Play()
        game:GetService("TweenService"):Create(
            buttonStroke,
            TweenInfo.new(0.2),
            {Transparency = 0.7}
        ):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.2),
            {BackgroundTransparency = 0.3, TextColor3 = Color3.fromRGB(255, 100, 100)}
        ):Play()
        game:GetService("TweenService"):Create(
            buttonStroke,
            TweenInfo.new(0.2),
            {Transparency = 0.9}
        ):Play()
    end)
    
    -- 点击动画
    button.MouseButton1Down:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.1),
            {Size = UDim2.new(0.78, 0, 0.14, 0), Position = UDim2.new(0.11, 0, positionY + 0.005, 0)}
        ):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.1),
            {Size = UDim2.new(0.8, 0, 0.15, 0), Position = UDim2.new(0.1, 0, positionY, 0)}
        ):Play()
        
        -- 涟漪效果
        local ripple = Instance.new("Frame")
        ripple.Name = "Ripple"
        ripple.Size = UDim2.new(0, 0, 0, 0)
        ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        ripple.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        ripple.BackgroundTransparency = 0.8
        ripple.Parent = button
        
        local rippleCorner = Instance.new("UICorner")
        rippleCorner.CornerRadius = UDim.new(1, 0)
        rippleCorner.Parent = ripple
        
        game:GetService("TweenService"):Create(
            ripple,
            TweenInfo.new(0.5),
            {Size = UDim2.new(2, 0, 2, 0), BackgroundTransparency = 1}
        ):Play()
        
        delay(0.5, function()
            ripple:Destroy()
        end)
        
        -- 执行回调函数
        if callback then
            callback()
        end
    end)
    
    return button
end

-- 创建功能按钮
createButton("StartScript", "自动收集水晶", 0.25, function()
    print("收集水晶已启动!")
    title.Text = "脚本运行中..."
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yun5555555555/AUGLM/refs/heads/main/%E9%80%8F%E8%A7%86.lua"))()
    -- 例如: loadDarkDeceptionScript()
    
    -- 显示通知
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "收集水晶脚本",
        Text = "脚本已成功启动",
        Duration = 3,
        Icon = "rbxassetid://7734059095"  -- 可以替换为你的图标ID
    })
end)

createButton("StartScript", "透视", 0.25, function()
    print("透视已启动!")
    title.Text = "脚本运行中..."
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yun5555555555/AUGLM/refs/heads/main/%E8%87%AA%E5%8A%A8%E6%94%B6%E9%9B%86.lua"))()
    -- 例如: loadDarkDeceptionScript()
    
    -- 显示通知
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "透视脚本",
        Text = "脚本已成功启动",
        Duration = 3,
        Icon = "rbxassetid://7734059095"  -- 可以替换为你的图标ID
    })
end)

-- 创建关闭按钮

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, 0, -0.05, 0)
closeButton.AnchorPoint = Vector2.new(0.5, 0.5)
closeButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)  -- 深红色
closeButton.BackgroundTransparency = 0.3
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 150, 150)    -- 浅红色
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.AutoButtonColor = false
closeButton.Parent = mainFrame

-- 关闭按钮圆角
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.5, 0)
closeCorner.Parent = closeButton

-- 关闭按钮动画
closeButton.MouseButton1Down:Connect(function()
    game:GetService("TweenService"):Create(
        closeButton,
        TweenInfo.new(0.1),
        {Size = UDim2.new(0.09, 0, 0.09, 0)}
    ):Play()
end)

closeButton.MouseButton1Up:Connect(function()
    game:GetService("TweenService"):Create(
        closeButton,
        TweenInfo.new(0.1),
        {Size = UDim2.new(0.1, 0, 0.1, 0)}
    ):Play()
    
    -- 关闭动画
    game:GetService("TweenService"):Create(
        mainFrame,
        TweenInfo.new(0.3),
        {Position = UDim2.new(0.5, 0, 1.5, 0)}
    ):Play()
    
    wait(0.3)
    gui:Destroy()
    gradientAnimation:Disconnect()
end)

-- 初始动画 - 从下方滑入
mainFrame.Position = UDim2.new(0.5, 0, 1.5, 0)
game:GetService("TweenService"):Create(
    mainFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Position = UDim2.new(0.5, 0, 0.5, 0)}
):Play()

-- 状态变量
local monsterESPEnabled = false
local godModeEnabled = false