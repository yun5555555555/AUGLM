WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "Welcome! Popup Example",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Content = "This is an Example UI for the " .. gradient("WindUI", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")) .. " Lib",
    Buttons = {
        {
            Title = "Cancel",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "Continue",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "KE",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = "KE脚本",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = true
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
    KeySystem = {
        Key = { "1234", "5678" },
        Note = "Example Key System. \n\nThe Key is '1234' or '5678",
        URL = "link-to-linkvertise-or-discord-or-idk",
        SaveKey = true,
    },
})

Window:CreateTopbarButton("MyCustomButton1", "bird", function() print("clicked 1!") end, 990)
Window:CreateTopbarButton("MyCustomButton3", "battery-plus", function() Window:ToggleFullscreen() end, 989)

Window:EditOpenButton({
    Title = "KEKE脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    Draggable = true,
})

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "极速传奇", Opened = true})
    Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "刷", Icon = "zap" })
end

Window:SelectTab(1)

Tabs.SpeedTab:Button({
    Title = "KE刷速度",
    Desc = "刷速度",
    Callback = function()
        local code = [[
            local args = {"collectOrb", "Red Orb", "City"}
            while true do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                task.wait(0.0001)
            end
        ]]
        loadstring(code)()
    end
})

Tabs.SpeedTab:Button({
    Title = "KE刷",
    Desc = "刷砖石",
    Callback = function()
        local code = [[
            local args = {"collectOrb","Gem","City"}
            while true do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                task.wait(0.0003)
            end
        ]]
        loadstring(code)()
    end
})
Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "修改", Icon = "zap" })

Tabs.SpeedTab:Toggle({
    Title = "启用速度加速",
    Value = true,
    Callback = function(state) 
        print("速度加速启用: " .. tostring(state))
        pcall(function()
            local character = game:GetService("Players").LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid.WalkSpeed = state and 1000000 or 16
            end
        end)
    end
})

Tabs.SpeedTab:Slider({
    Title = "速度设置",
    Value = {Min = 16, Max = 100000000, Default = 10000},
    Callback = function(value) 
        print("速度设置为: " .. value)
        pcall(function()
            local character = game:GetService("Players").LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid.WalkSpeed = value
            end
        end)
    end
})

Tabs.SpeedTab:Toggle({
    Title = "启用超级跳",
    Value = false, 
    Callback = function(state) 
        print("超级跳状态: " .. tostring(state))
        pcall(function()
            local character = game:GetService("Players").LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            
            if humanoid then
                -- 开启时设为100（超级跳），关闭时恢复默认50
                humanoid.JumpPower = state and 100 or 50
            end
        end)
    end
})

Tabs.SpeedTab:Slider({
    Title = "跳跃高度设置",
    Desc = "设置跳跃高度",
    Value = {
        Min = 50,   
        Max = 10000000, 
        Default = 50 
    },
    Callback = function(value) 
        print("跳跃高度设置为: " .. value)
        pcall(function()
            local character = game:GetService("Players").LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            
            if humanoid then
                humanoid.JumpPower = value
            end
        end)
    end
})

Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "传送", Icon = "zap" })

Tabs.SpeedTab:Button({
    Title = "传送到城市",
    Desc = "传送到主城区",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(2002.0133056640625, 1.2624330520629883, 985.2265625)
        end)
    end
})

Tabs.SpeedTab:Button({
    Title = "传送到雪城",
    Desc = "传送到冰雪区域",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-9675.25, 59.63568115234375, 3783.50146484375)
        end)
    end
})

Tabs.SpeedTab:Button({
    Title = "传送到火山",
    Desc = "传送到火山区域",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-11052.4189453125, 217.59571838378906, 4898.76416015625)
        end)
    end
})

Tabs.SpeedTab:Button({
    Title = "传送到公路",
    Desc = "传送到高速公路",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-13095.255859375, 217.59567260742188, 5905.240234375)
        end)
    end
})

Tabs.SpeedTab:Section({Title = "属性修改", Opened = true})

Tabs.SpeedTab:Input({
    Title = "修改经验值",
    Placeholder = "输入经验值",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.exp.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "经验值已设置为: "..arg})
        end)
    end
})

Tabs.SpeedTab:Input({
    Title = "修改等级",
    Placeholder = "输入等级",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.level.Value = tonumber(arg) or 1
            WindUI:Notify({Title = "修改成功", Content = "等级已设置为: "..arg})
        end)
    end
})

Tabs.SpeedTab:Input({
    Title = "修改比赛数",
    Placeholder = "输入比赛数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Races.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "比赛数已设置为: "..arg})
        end)
    end
})

Tabs.SpeedTab:Input({
    Title = "修改圈数",
    Placeholder = "输入圈数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Hoops.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "圈数已设置为: "..arg})
        end)
    end
})

Tabs.SpeedTab:Input({
    Title = "修改重生次数",
    Placeholder = "输入重生次数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "重生次数已设置为: "..arg})
        end)
    end
})

Tabs.SpeedTab:Input({
    Title = "修改步数",
    Placeholder = "输入步数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Steps.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "步数已设置为: "..arg})
        end)
    end
})

Tabs.SpeedTab:Input({
    Title = "修改尾迹容量",
    Placeholder = "输入容量",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.maxPetCapacity.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "尾迹容量已设置为: "..arg})
        end)
    end
})

Tabs.SpeedTab:Input({
    Title = "修改宝石数量",
    Placeholder = "输入宝石数量",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.Gems.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "宝石数量已设置为: "..arg})
        end)
    end
})

Tabs.MainTab = Window:Section({Title = "忍者传奇", Opened = true})
Tabs.NinjaTab = Tabs.MainTab:Tab({ Title = "刷", Icon = "zap" })

Tabs.NinjaTab:Toggle({
    Title = "自动挥刀",
    Desc = "开启/关闭自动挥刀",
    Value = false,
    Callback = function(state)
        if state then
    
            _G.AutoSwing = true
            coroutine.wrap(function()
                while _G.AutoSwing do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
                    task.wait(0.2) 
                end
            end)()
            WindUI:Notify({Title = "自动挥刀", Content = "已开启"})
        else
            
            _G.AutoSwing = false
            WindUI:Notify({Title = "自动挥刀", Content = "已关闭"})
        end
    end
})

Tabs.NinjaTab:Toggle({
    Title = "无限跳跃",
    Desc = "开启/关闭无限跳跃能力",
    Value = false, 
    Callback = function(state)
        if state then
            _G.InfiniteJump = true
            
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if _G.InfiniteJump then
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("multiJump", "rightLeg")
                end
            end)
            
            WindUI:Notify({Title = "无限跳跃", Content = "已开启 - 按空格键跳跃"})
        else

            _G.InfiniteJump = false
            WindUI:Notify({Title = "无限跳跃", Content = "已关闭"})
        end
    end
})

Tabs.NinjaTab = Tabs.MainTab:Tab({ Title = "自动购买", Icon = "zap" })

Tabs.NinjaTab:Button({
    Title = "购买电竹剑",
    Desc = "购买电竹剑",
    Callback = function()
        local args = {
            [1] = "buySword",
            [2] = "Electral Bamboo"
        }
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
        WindUI:Notify({Title = "购买成功", Content = "已购买 Electral Bamboo 剑"})
    end
})

Tabs.NinjaTab:Button({
    Title = "购买超级竹剑",
    Desc = "购买超级竹剑",
    Callback = function()
        local args = {
            [1] = "buySword",
            [2] = "Ultra Bamboo"
        }
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
        WindUI:Notify({Title = "购买成功", Content = "已购买 Ultra Bamboo 剑"})
    end
})

Tabs.MainTab = Window:Section({Title = "极速传奇", Opened = true})
    Tabs.ForestTab = Tabs.MainTab:Tab({ Title = "刷", Icon = "zap" })

-- 1. 高亮填充颜色 (主色)
local fillColor = Color3.fromRGB(0, 255, 0)  -- 默认绿色
Tabs.NinjaTab:Colorpicker({
    Title = "填充颜色",
    Default = fillColor,
    Callback = function(color)
        fillColor = color
        -- 实时更新现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight.FillColor = color
            end
        end
    end
})

-- 2. 轮廓颜色
local outlineColor = Color3.new(1, 1, 1)  -- 默认白色
Tabs.NinjaTab:Colorpicker({
    Title = "轮廓颜色",
    Default = outlineColor,
    Callback = function(color)
        outlineColor = color
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight.OutlineColor = color
            end
        end
    end
})

-- 3. 透明度控制
local transparency = 0.4  -- 默认40%透明度
Tabs.NinjaTab:Slider({
    Title = "透明度",
    Value = {Min = 0, Max = 1, Default = 0.4},
    Callback = function(value)
        transparency = value
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight.FillTransparency = value
            end
        end
    end
})

-- 4. 修改创建高亮的函数（整合颜色设置）
local function createHighlight(item)
    if not item or not item.Parent then return end
    
    if item:FindFirstChild("ESP_Highlight") then
        item.ESP_Highlight:Destroy()
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = item
    highlight.FillColor = fillColor          -- 使用配置的颜色
    highlight.OutlineColor = outlineColor    -- 使用配置的轮廓色
    highlight.FillTransparency = transparency -- 使用配置的透明度
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = item
end

    Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "透视人物", Icon = "zap" })


Tabs.ForestTab = Tabs.MainTab:Tab({ Title = "物品透视", Icon = "zap" })

-- 添加透视按钮
Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Carrot"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Broken Fan"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab = Tabs.MainTab:Tab({ Title = "收集物品", Icon = "zap" })

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = ""  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Coal"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Item Chest"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Fuel Canister"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Cooked Morsel"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Tyre"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Sheet Metal"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Rifle Ammo"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Revolver Ammo"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Old Radio"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Wolf"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Bunny"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Bolt"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Tabs.ForestTab:Button({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function()
        local targetItemName = "Berry"  -- 要透视的物品名称
        local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
        local fillTransparency = 0.4  -- 透明度
        
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 创建新透视
        local function createESP(item)
            if item.Name == targetItemName then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Adornee = item
                highlight.FillColor = highlightColor
                highlight.FillTransparency = fillTransparency
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = item
            end
        end
        
        -- 立即扫描全图
        for _, item in pairs(workspace:GetDescendants()) do
            createESP(item)
        end
        
        -- 监听新生成的物品
        _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
            task.wait(0.1)  -- 等待模型加载
            createESP(item)
        end)
        
        WindUI:Notify({
            Title = "透视已激活",
            Content = "正在高亮显示所有 "..targetItemName,
            Duration = 3
        })
    end
})

Window:OnClose(function()
    print("UI closed.")
end)
