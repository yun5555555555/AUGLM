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
    Title = "KE脚本",
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

Tabs.DeliverTab = Tabs.MainTab:Tab({ Title = "传送", Icon = "zap" })

Tabs.DeliverTab:Button({
    Title = "传送到城市",
    Desc = "传送到主城区",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(2002.0133056640625, 1.2624330520629883, 985.2265625)
        end)
    end
})

Tabs.DeliverTab:Button({
    Title = "传送到雪城",
    Desc = "传送到冰雪区域",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-9675.25, 59.63568115234375, 3783.50146484375)
        end)
    end
})

Tabs.DeliverTab:Button({
    Title = "传送到火山",
    Desc = "传送到火山区域",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-11052.4189453125, 217.59571838378906, 4898.76416015625)
        end)
    end
})

Tabs.DeliverTab:Button({
    Title = "传送到公路",
    Desc = "传送到高速公路",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-13095.255859375, 217.59567260742188, 5905.240234375)
        end)
    end
})

Tabs.AttributeTab = Tabs.MainTab:Tab({ Title = "属性修改", Icon = "zap" })

Tabs.AttributeTab:Input({
    Title = "修改经验值",
    Placeholder = "输入经验值",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.exp.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "经验值已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改等级",
    Placeholder = "输入等级",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.level.Value = tonumber(arg) or 1
            WindUI:Notify({Title = "修改成功", Content = "等级已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改比赛数",
    Placeholder = "输入比赛数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Races.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "比赛数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改圈数",
    Placeholder = "输入圈数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Hoops.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "圈数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改重生次数",
    Placeholder = "输入重生次数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "重生次数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改步数",
    Placeholder = "输入步数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Steps.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "步数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改尾迹容量",
    Placeholder = "输入容量",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.maxPetCapacity.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "尾迹容量已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
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

Tabs.buyTab = Tabs.MainTab:Tab({ Title = "自动购买", Icon = "zap" })

Tabs.buyTab:Button({
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

Tabs.buyTab:Button({
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

Tabs.MainTab = Window:Section({Title = "生成99天", Opened = true})
Tabs.ForestTab = Tabs.MainTab:Tab({ Title = "物品透视", Icon = "zap" })

Tabs.ForestTab:Toggle({
    Title = "透视兔子脚",
    Desc = "高亮显示所有兔子脚",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Bunny Foot"  -- 要透视的物品名称
            local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
            local fillTransparency = 0.4  -- 透明度
            
            -- 创建新透视
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
        else
            -- 关闭透视时只移除当前物品的高亮
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Bunny Foot" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            -- 断开连接
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示兔子脚",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视胡萝卜",
    Desc = "高亮显示所有胡萝卜",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Carrot"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Carrot" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示胡萝卜",
                Duration = 3
            })
        end
    end
})

-- 透视坏风扇
Tabs.ForestTab:Toggle({
    Title = "透视坏风扇",
    Desc = "高亮显示所有坏风扇",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Broken Fan"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Broken Fan" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示坏风扇",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视煤",
    Desc = "高亮显示所有煤",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Coal"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Coal" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示煤",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视坏物品箱",
    Desc = "高亮显示所有物品箱",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Item Chest"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Item Chest" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示物品箱",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视坏燃料罐",
    Desc = "高亮显示所有坏燃料罐",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Fuel Canister"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Fuel Canister" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示燃料罐",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视坏熟肉",
    Desc = "高亮显示所有熟肉块",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Cooked Morsel"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Cooked Morsel" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示坏熟肉",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视轮胎",
    Desc = "高亮显示所有轮胎",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Tyre"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Tyre" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示轮胎",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视金属板",
    Desc = "高亮显示所有金属板",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Sheet Metal"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Sheet Metal" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示金属板",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视步枪弹药",
    Desc = "高亮显示所有步枪弹药",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Rifle Ammo"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Rifle Ammo" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示步枪弹药",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视坏左轮手枪弹药",
    Desc = "高亮显示所有左轮手枪弹药",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Revolver Ammo"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Revolver Ammo" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示左轮手枪弹药",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视旧收音机",
    Desc = "高亮显示所有旧收音机",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Old Radio"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Old Radio" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示旧收音机",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视狼",
    Desc = "高亮显示所有狼",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Wolf"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Wolf" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示狼",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视兔子",
    Desc = "高亮显示所有兔子",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Bunny"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Bunny" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示兔子",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视螺栓",
    Desc = "高亮显示所有螺栓",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Bolt"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Bolt" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示螺栓",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视浆果",
    Desc = "高亮显示所有浆果",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Berry"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Berry" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示浆果",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视旧手电筒",
    Desc = "高亮显示所有旧手电筒",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Old Flashlight"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Old Flashlight" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示旧手电筒",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视原木",
    Desc = "高亮显示所有原木",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Log"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Log" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示原木",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视椅子",
    Desc = "高亮显示所有椅子",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Chair"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Chair" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示椅子",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视步枪",
    Desc = "高亮显示所有步枪",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Rifle"
            local highlightColor = Color3.fromRGB(0, 255, 0)
            local fillTransparency = 0.4
            
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
            
            for _, item in pairs(workspace:GetDescendants()) do
                createESP(item)
            end
            
            _G.ESPConnection = workspace.DescendantAdded:Connect(function(item)
                task.wait(0.1)
                createESP(item)
            end)
            
            WindUI:Notify({
                Title = "透视已激活",
                Content = "正在高亮显示所有 "..targetItemName,
                Duration = 3
            })
        else
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示步枪",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视左轮手枪",
    Desc = "高亮显示所有左轮手枪",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Revolver"  -- 要透视的物品名称
            local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
            local fillTransparency = 0.4  -- 透明度
            
            -- 创建新透视
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
        else
            -- 关闭透视时只移除当前物品的高亮
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Revolver" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            -- 断开连接
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示左轮手枪",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视绷带",
    Desc = "高亮显示所有绷带",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Bandage"  -- 要透视的物品名称
            local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
            local fillTransparency = 0.4  -- 透明度
            
            -- 创建新透视
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
        else
            -- 关闭透视时只移除当前物品的高亮
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Revolver" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            -- 断开连接
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示绷带",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab:Toggle({
    Title = "透视阿尔法狼",
    Desc = "高亮显示所有阿尔法狼",
    Callback = function(state)
        if state then
            -- 开启透视
            local targetItemName = "Alpha Wolf"  -- 要透视的物品名称
            local highlightColor = Color3.fromRGB(0, 255, 0)  -- 绿色高亮
            local fillTransparency = 0.4  -- 透明度
            
            -- 创建新透视
            local function createESP(item)
                if item.Name == targetItemName and not item:FindFirstChild("ESP_Highlight") then
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
        else
            -- 关闭透视时只移除当前物品的高亮
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "Alpha Wolf" and item:FindFirstChild("ESP_Highlight") then
                    item.ESP_Highlight:Destroy()
                end
            end
            
            -- 断开连接
            if _G.ESPConnection then
                _G.ESPConnection:Disconnect()
                _G.ESPConnection = nil
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示绷带",
                Duration = 3
            })
        end
    end
})

Tabs.DTab = Tabs.MainTab:Tab({ Title = "传送", Icon = "zap" })

Tabs.DTab:Button({
    Title = "传送到胡萝卜",
    Desc = "直接传送到最近的胡萝卜旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Carrot"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送胡萝卜",
    Desc = "直接传送到最近的煤胡旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Coal"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到物品箱",
    Desc = "直接传送到最近的物品箱旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Item Chest"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到燃料罐",
    Desc = "直接传送到最近的燃料罐旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Fuel Canister"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到熟肉块",
    Desc = "直接传送到最近的熟肉块旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Cooked Morsel"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到轮胎",
    Desc = "直接传送到最近的轮胎旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Tyre"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到金属板",
    Desc = "直接传送到最近的金属板旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Sheet Metal"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到步枪弹药",
    Desc = "直接传送到最近的步枪弹药旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Rifle Ammo"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到左轮手枪弹药",
    Desc = "直接传送到最近的左轮手枪弹药旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Revolver Ammo"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})


Tabs.DTab:Button({
    Title = "传送到旧收音机",
    Desc = "直接传送到最近的旧收音机旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Old Radio"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到狼",
    Desc = "直接传送到最近的狼旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Wolf"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到兔子",
    Desc = "直接传送到最近的兔子旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Bunny"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到螺栓",
    Desc = "直接传送到最近的螺栓旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Bolt"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到浆果",
    Desc = "直接传送到最近的浆果旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Berry"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到手电筒",
    Desc = "直接传送到最近的手电筒旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Old Flashlight"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到原木",
    Desc = "直接传送到最近的原木旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Log"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到椅子",
    Desc = "直接传送到最近的椅子旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Chair"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到左轮手枪",
    Desc = "直接传送到最近的左轮手枪旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Revolver"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到步枪",
    Desc = "直接传送到最近的步枪旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Rifle"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到绷带",
    Desc = "直接传送到最近的绷带旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Bandage"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到步枪",
    Desc = "直接传送到最近的步枪旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Rifle"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})

Tabs.DTab:Button({
    Title = "传送到沃尔法狼",
    Desc = "直接传送到最近的沃尔法狼旁边",
    Callback = function()
        -- 要传送的目标物品名称（可修改为其他物品如"Tree"、"Wolf"等）
        local targetName = "Alpha Wolf"
        
        -- 获取玩家角色和HRP
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return -- 静默失败，不显示错误
        end
        
        local hrp = character.HumanoidRootPart
        local closestItem = nil
        local minDistance = math.huge -- 初始设为极大值
        
        -- 优化搜索：只搜索包含BasePart的模型
        for _, item in pairs(workspace:GetDescendants()) do
            if item.Name == targetName then
                -- 如果是模型，找它的主部件
                local primaryPart = item:IsA("Model") and item.PrimaryPart or item
                
                -- 确保有有效的BasePart
                if primaryPart and primaryPart:IsA("BasePart") then
                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                    if distance < minDistance then
                        closestItem = primaryPart
                        minDistance = distance
                    end
                end
            end
        end
        
        -- 如果找到目标物品，进行传送
        if closestItem then
            -- 计算传送位置（物品上方3个单位，并面向物品）
            local offset = Vector3.new(0, 3, 0)
            hrp.CFrame = CFrame.new(closestItem.Position + offset, closestItem.Position)
        end
    end
})



Tabs.SetTab = Tabs.MainTab:Tab({ Title = "透视设置", Icon = "zap" })

-- 定义默认颜色和透明度（全局变量，只定义一次）
local fillColor = Color3.fromRGB(0, 255, 0)  -- 默认绿色
local outlineColor = Color3.new(1, 1, 1)     -- 默认白色
local transparency = 0.4                     -- 默认40%透明度

-- 1. 填充颜色选择器
Tabs.SetTab:Colorpicker({
    Title = "填充颜色",
    Default = fillColor,
    Callback = function(color)
        fillColor = color
        -- 更新所有已存在的高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight.FillColor = color
            end
        end
    end
})

-- 2. 轮廓颜色选择器
Tabs.SetTab:Colorpicker({
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

-- 3. 透明度滑块
Tabs.SetTab:Slider({
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

-- 4. 关闭所有透视按钮
Tabs.SetTab:Button({
    Title = "关闭所有透视",
    Desc = "清除所有高亮效果",
    Callback = function()
        -- 清除现有高亮
        for _, item in pairs(workspace:GetDescendants()) do
            if item:FindFirstChild("ESP_Highlight") then
                item.ESP_Highlight:Destroy()
            end
        end
        
        -- 断开连接
        if _G.ESPConnection then
            _G.ESPConnection:Disconnect()
            _G.ESPConnection = nil
        end
        
        WindUI:Notify({
            Title = "透视已关闭",
            Content = "所有高亮效果已清除",
            Duration = 3
        })
    end
})

-- 高亮创建函数（放在标签外部，作为全局辅助函数）
local function createHighlight(item)
    if not item or not item.Parent then return end
    
    -- 移除旧的高亮
    if item:FindFirstChild("ESP_Highlight") then
        item.ESP_Highlight:Destroy()
    end
    
    -- 创建新高亮
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = item
    highlight.FillColor = fillColor
    highlight.OutlineColor = outlineColor
    highlight.FillTransparency = transparency
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = item
end

-- 在透视人物标签中添加玩家透视功能
Tabs.SetTab:Toggle({
    Title = "透视玩家",
    Desc = "高亮显示所有玩家角色",
    Value = false,
    Callback = function(state)
        if state then
            -- 开启透视
            _G.PlayerESP = true
            
            -- 颜色配置（本地玩家和其他玩家不同颜色）
            local localPlayer = game:GetService("Players").LocalPlayer
            local localColor = Color3.fromRGB(0, 255, 0)  -- 绿色表示自己
            local otherColor = Color3.fromRGB(255, 0, 0)  -- 红色表示其他玩家
            
            -- 创建高亮函数
            local function highlightPlayer(player)
                if player.Character then
                    -- 移除旧的高亮（如果存在）
                    if player.Character:FindFirstChild("PlayerESP_Highlight") then
                        player.Character.PlayerESP_Highlight:Destroy()
                    end
                    
                    -- 创建新高亮
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "PlayerESP_Highlight"
                    highlight.Adornee = player.Character
                    highlight.FillColor = (player == localPlayer) and localColor or otherColor
                    highlight.OutlineColor = Color3.new(1, 1, 1)
                    highlight.FillTransparency = 0.5
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Parent = player.Character
                end
            end
            
            -- 立即高亮所有现有玩家
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                highlightPlayer(player)
            end
            
            -- 监听新玩家加入
            _G.PlayerAddedConnection = game:GetService("Players").PlayerAdded:Connect(highlightPlayer)
            
            -- 监听玩家角色变化
            _G.CharacterAddedConnection = game:GetService("Players").PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    if _G.PlayerESP then
                        highlightPlayer(player)
                    end
                end)
            end)
        else
            -- 关闭透视
            _G.PlayerESP = false
            
            -- 移除所有高亮
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("PlayerESP_Highlight") then
                    player.Character.PlayerESP_Highlight:Destroy()
                end
            end
            
            -- 断开事件监听
            if _G.PlayerAddedConnection then
                _G.PlayerAddedConnection:Disconnect()
            end
            if _G.CharacterAddedConnection then
                _G.CharacterAddedConnection:Disconnect()
            end
        end
    end
})

-- 创建全局表存储所有玩家的显示UI
local playerInventories = {}

-- 创建玩家头顶显示的UI
local function createPlayerInventoryDisplay(player)
    -- 如果已有显示则先移除
    if playerInventories[player] then
        playerInventories[player]:Destroy()
    end
    
    -- 创建BillboardGui（始终面向玩家的3D UI）
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "InventoryDisplay"
    billboard.Size = UDim2.new(0, 200, 0, 150)
    billboard.StudsOffset = Vector3.new(0, 3, 0)  -- 头顶上方3个单位
    billboard.AlwaysOnTop = true
    billboard.LightInfluence = 0  -- 不受光照影响
    billboard.Adornee = player.Character:WaitForChild("Head")
    billboard.Parent = player.Character
    
    -- 创建背景框
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Parent = billboard
    
    -- 创建标题文本
    local title = Instance.new("TextLabel")
    title.Text = player.Name.."的背包"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 14
    title.Font = Enum.Font.SourceSansBold
    title.Size = UDim2.new(1, 0, 0, 20)
    title.BackgroundTransparency = 1
    title.Parent = frame
    
    -- 创建内容文本
    local content = Instance.new("TextLabel")
    content.Name = "Content"
    content.Text = "加载中..."
    content.TextColor3 = Color3.new(1, 1, 1)
    content.TextSize = 12
    content.Font = Enum.Font.SourceSans
    content.Size = UDim2.new(1, -10, 1, -25)
    content.Position = UDim2.new(0, 5, 0, 20)
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextYAlignment = Enum.TextYAlignment.Top
    content.TextWrapped = true
    content.BackgroundTransparency = 1
    content.Parent = frame
    
    playerInventories[player] = billboard
    return content
end

-- 获取玩家Inventory内容
local function getInventoryContents(player)
    -- 尝试从不同位置获取Inventory
    if player:FindFirstChild("Inventory") then
        return player.Inventory:GetChildren()
    elseif player:FindFirstChild("Backpack") then
        return player.Backpack:GetChildren()
    elseif player.Character and player.Character:FindFirstChild("Inventory") then
        return player.Character.Inventory:GetChildren()
    end
    return {}
end

-- 更新玩家背包显示
local function updatePlayerInventoryDisplay(player)
    if not player or not player.Character then return end
    
    local items = getInventoryContents(player)
    local displayText = ""
    
    -- 格式化显示内容
    for _, item in ipairs(items) do
        displayText = displayText .. item.Name .. "\n"
    end
    
    -- 更新UI
    if playerInventories[player] then
        local content = playerInventories[player]:FindFirstChild("Frame"):FindFirstChild("Content")
        if content then
            content.Text = displayText ~= "" and displayText or "空"
        end
    else
        local content = createPlayerInventoryDisplay(player)
        content.Text = displayText ~= "" and displayText or "空"
    end
end

-- 监听玩家加入
game:GetService("Players").PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(1)  -- 等待角色完全加载
        updatePlayerInventoryDisplay(player)
    end)
end)

-- 初始处理所有玩家
for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        player.CharacterAdded:Connect(function(character)
            wait(1)
            updatePlayerInventoryDisplay(player)
        end)
        if player.Character then
            updatePlayerInventoryDisplay(player)
        end
    end
end

-- 添加开关控制
Tabs.SetTab:Toggle({
    Title = "显示玩家背包",
    Desc = "显示背包内容",
    Value = false,
    Callback = function(state)
        if state then
            -- 开启显示
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    updatePlayerInventoryDisplay(player)
                end
            end
        else
            -- 关闭显示
            for _, billboard in pairs(playerInventories) do
                billboard:Destroy()
            end
            playerInventories = {}
        end
    end
})

Tabs.STab = Tabs.MainTab:Tab({ Title = "娱乐", Icon = "zap" })

-- 添加删除Map的功能
Tabs.STab:Button({
    Title = "删除地图",
    Desc = "删除游戏中的Map对象(谨慎使用)",
    Callback = function()
        -- 查找并删除所有名为"Map"的对象
        local maps = workspace:FindFirstChild("Map")
        if maps then
            maps:Destroy()
            WindUI:Notify({
                Title = "操作成功",
                Content = "已删除Map对象",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "操作失败",
                Content = "未找到Map对象",
                Duration = 3
            })
        end
    end
})

Tabs.STab:Button({
    Title = "管理地图内容",
    Desc = "查看并删除Map对象中的内容",
    Callback = function()
        -- 查找Map对象
        local map = workspace:FindFirstChild("Map")
        
        if not map then
            WindUI:Notify({
                Title = "错误",
                Content = "未找到Map对象",
                Duration = 3
            })
            return
        end
        
        -- 创建新窗口来显示Map内容
        local mapWindow = WindUI:CreateWindow({
            Title = "地图内容管理器",
            Icon = "folder",
            Size = UDim2.fromOffset(500, 400),
            Theme = Window.Theme
        })
        
        local mapSection = mapWindow:Section({Title = "Map内容", Opened = true})
        local mapContentTab = mapSection:Tab({Title = "内容列表", Icon = "list"})
        
        -- 存储选择的项目
        local selectedItems = {}
        
        -- 递归显示Map内容
        local function displayContents(parent, tab, indent)
            indent = indent or 0
            
            for _, child in ipairs(parent:GetChildren()) do
                -- 创建选择框
                tab:Toggle({
                    Title = string.rep("    ", indent) .. child.Name,
                    Desc = child.ClassName,
                    Value = false,
                    Callback = function(state)
                        selectedItems[child] = state
                    end
                })
                
                -- 如果有子项，递归显示
                if #child:GetChildren() > 0 then
                    displayContents(child, tab, indent + 1)
                end
            end
        end
        
        -- 显示Map内容
        displayContents(map, mapContentTab)
        
        -- 添加删除按钮
        mapContentTab:Button({
            Title = "删除选中项",
            Desc = "永久删除选中的项目",
            Callback = function()
                local count = 0
                
                -- 先确认
                WindUI:Confirm({
                    Title = "确认删除",
                    Content = "确定要删除选中的 "..table.count(selectedItems).." 个项目吗？此操作不可撤销！",
                    Buttons = {
                        {
                            Title = "取消",
                            Callback = function() end,
                            Variant = "Secondary"
                        },
                        {
                            Title = "确认删除",
                            Callback = function()
                                for item, selected in pairs(selectedItems) do
                                    if selected and item.Parent then
                                        pcall(function() -- 使用pcall防止出错
                                            item:Destroy()
                                            count = count + 1
                                        end)
                                    end
                                end
                                
                                WindUI:Notify({
                                    Title = "删除完成",
                                    Content = "已成功删除 "..count.." 个项目",
                                    Duration = 5
                                })
                                
                                -- 刷新窗口
                                mapWindow:Close()
                                mapWindow = nil
                            end,
                            Variant = "Destructive"
                        }
                    }
                })
            end
        })
        
        -- 添加关闭窗口按钮
        mapContentTab:Button({
            Title = "关闭管理器",
            Desc = "关闭此窗口",
            Callback = function()
                mapWindow:Close()
            end
        })
    end
})

Window:OnClose(function()
    print("UI closed.")
end)
