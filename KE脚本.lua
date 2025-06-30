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
Tabs.ModifyTab = Tabs.MainTab:Tab({ Title = "修改", Icon = "zap" })

Tabs.ModifyTab:Toggle({
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

Tabs.ModifyTab:Slider({
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

Tabs.ModifyTab:Toggle({
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

Tabs.ModifyTab:Slider({
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

Tabs.AttributeTab:Section({Title = "属性修改", Opened = true})

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
    Tabs.SetTab = Tabs.MainTab:Tab({ Title = "透视设置", Icon = "zap" })

    local fillColor = Color3.fromRGB(0, 255, 0)  -- 默认绿色
    Tabs.ForestTab:Colorpicker({
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
    Tabs.ForestTab:Colorpicker({
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
    Tabs.ForestTab:Slider({
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

    -- 4. 添加关闭所有透视的按钮
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

    -- 修改创建高亮的函数（整合颜色设置）
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
end

Tabs.automaticTab = Tabs.MainTab:Tab({ Title = "自动", Icon = "zap" })

Window:About({
    Title = "关于自动的",
    Content = "很抱歉我们做不出来完整的",
    Icon = "info",
    Callback = function()
        print("关于信息已显示")
    end
})

Window:About({
    Title = "关于自动1",
    Content = "我们发现做不出来完整自动的比如自动吃或者攻击",
    Icon = "info",
    Callback = function()
        print("关于信息已显示")
    end
})

Window:About({
    Title = "方法",
    Content = "胡萝卜会自动拔出来可以自己拿起来吃",
    Icon = "info",
    Callback = function()
        print("关于信息已显示")
    end
})

Window:About({
    Title = "方法2",
    Content = "兔子和狼会持续传送只要点击屏幕就行了",
    Icon = "info",
    Callback = function()
        print("关于信息已显示")
    end
})

Tabs.automaticTab:Toggle({
    Title = "自动拔胡萝卜",
    Desc = "自动寻找胡萝卜",
    Value = false,
    Callback = function(state)
        if state then
            -- 开启自动收集
            _G.AutoCollectCarrots = true
            
            -- 创建收集线程
            coroutine.wrap(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                
                -- 配置参数
                local CARROT_NAME = "Carrot"
                local SEARCH_RADIUS = 50
                local TELEPORT_OFFSET = Vector3.new(0, 3, 0)
                local PICKUP_DELAY = 1
                local CONSUME_RETRY_DELAY = 0.5
                local MAX_CONSUME_RETRIES = 5
                
                -- 查找最近的胡萝卜
                local function findNearestCarrot()
                    local character = LocalPlayer.Character
                    if not character or not character:FindFirstChild("HumanoidRootPart") then
                        return nil
                    end

                    local hrp = character.HumanoidRootPart
                    local closestCarrot = nil
                    local minDistance = SEARCH_RADIUS + 1

                    local function scan(parent)
                        for _, item in ipairs(parent:GetChildren()) do
                            if item.Name == CARROT_NAME and item:IsA("Model") then
                                local primaryPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
                                if primaryPart then
                                    local distance = (primaryPart.Position - hrp.Position).Magnitude
                                    if distance < minDistance then
                                        closestCarrot = item
                                        minDistance = distance
                                    end
                                end
                            end
                            scan(item)
                        end
                    end

                    scan(workspace)
                    return closestCarrot
                end

                -- 传送至胡萝卜位置
                local function teleportToCarrot(carrot)
                    if not carrot then return false end

                    local character = LocalPlayer.Character
                    if not character or not character:FindFirstChild("HumanoidRootPart") then
                        return false
                    end

                    local hrp = character.HumanoidRootPart
                    local carrotPart = carrot.PrimaryPart or carrot:FindFirstChildWhichIsA("BasePart")
                    if not carrotPart then return false end

                    local targetPos = carrotPart.Position + TELEPORT_OFFSET
                    hrp.CFrame = CFrame.new(targetPos)
                    return true
                end

                -- 消耗胡萝卜
                local function consumeCarrotWithRetry()
                    for retry = 1, MAX_CONSUME_RETRIES do
                        local tempCarrot = ReplicatedStorage.TempStorage:FindFirstChild(CARROT_NAME)
                        if not tempCarrot then
                            wait(CONSUME_RETRY_DELAY)
                        else
                            local args = { tempCarrot }
                            local success, response = pcall(function()
                                return ReplicatedStorage.RemoteEvents.RequestConsumeItem:InvokeServer(unpack(args))
                            end)

                            if success then
                                return true
                            end
                        end
                    end
                    return false
                end

                -- 主收集循环
                while _G.AutoCollectCarrots do
                    -- 1. 查找胡萝卜
                    local carrot = findNearestCarrot()
                    if carrot then
                        -- 2. 传送
                        if teleportToCarrot(carrot) then
                            wait(0.005)  -- 等待传送稳定
                            
                            -- 3. 拾取
                            local pickupArgs = { carrot }
                            local pickupSuccess = pcall(function()
                                ReplicatedStorage.RemoteEvents.RequestStartDraggingItem:FireServer(unpack(pickupArgs))
                            end)

                            if pickupSuccess then
                                wait(PICKUP_DELAY)  -- 关键等待！
                                
                                -- 4. 消耗
                                consumeCarrotWithRetry()
                            end
                        end
                    end
                    wait(1)  -- 每次循环间隔
                end
            end)()
            
            WindUI:Notify({
                Title = "自动收集已开启",
                Content = "正在自动收集胡萝卜",
                Duration = 3
            })
        else
            -- 关闭自动收集
            _G.AutoCollectCarrots = false
            WindUI:Notify({
                Title = "自动收集已关闭",
                Content = "已停止自动收集胡萝卜",
                Duration = 3
            })
        end
    end
})

Tabs.automaticTab:Toggle({
    Title = "寻找兔子",
    Desc = "自动寻找附近的兔子",
    Value = false,
    Callback = function(state)
        if state then
            -- 开启自动攻击
            _G.AutoAttackBunny = true
            
            -- 创建攻击线程
            coroutine.wrap(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                
                -- 配置参数
                local TELEPORT_OFFSET = Vector3.new(0, 3, 0)
                local ATTACK_INTERVAL = 0.1
                local TELEPORT_INTERVAL = 0.3
                local FACE_INTERVAL = 0.2
                local BUNNY_NAME = "Bunny"
                local MAX_DISTANCE = 100
                
                -- 确保角色存在
                local function ensureCharacter()
                    repeat
                        if not LocalPlayer.Character then
                            LocalPlayer.CharacterAdded:Wait()
                        end
                        if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            wait(0.5)
                        end
                    until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    return LocalPlayer.Character
                end
                
                -- 寻找最近的活着的兔子
                local function findAliveBunny()
                    local closestBunny = nil
                    local closestDistance = MAX_DISTANCE + 1
                    
                    for _, char in ipairs(workspace.Characters:GetChildren()) do
                        if char.Name == BUNNY_NAME and char:FindFirstChild("HumanoidRootPart") then
                            local humanoid = char:FindFirstChildOfClass("Humanoid")
                            if humanoid and humanoid.Health > 0 then
                                local distance = (char.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                if distance < closestDistance then
                                    closestBunny = char
                                    closestDistance = distance
                                end
                            end
                        end
                    end
                    
                    return closestBunny
                end
                
                -- 攻击兔子的函数
                local function attackBunny(bunny)
                    local weapon = LocalPlayer.Inventory:FindFirstChild("Old Axe") or LocalPlayer.Character:FindFirstChild("Old Axe")
                    if weapon then
                        local args = {
                            [1] = "FireAllClients",
                            [2] = bunny,
                            [3] = weapon
                        }
                        ReplicatedStorage.RemoteEvents.PlayEnemyHitSound:FireServer(unpack(args))
                    end
                end
                
                -- 使角色面向目标
                local function faceTarget(target)
                    if target and target:FindFirstChild("HumanoidRootPart") then
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local targetPos = target.HumanoidRootPart.Position
                            local charPos = character.HumanoidRootPart.Position
                            local lookAt = CFrame.new(charPos, Vector3.new(targetPos.X, charPos.Y, targetPos.Z))
                            character.HumanoidRootPart.CFrame = lookAt
                        end
                    end
                end
                
                -- 主攻击循环
                local character = ensureCharacter()
                local lastTeleportTime = 0
                local lastAttackTime = 0
                local lastFaceTime = 0
                
                while _G.AutoAttackBunny do
                    local now = tick()
                    local bunny = findAliveBunny()
                    
                    if bunny and bunny:FindFirstChild("HumanoidRootPart") then
                        -- 持续面向目标逻辑
                        if now - lastFaceTime >= FACE_INTERVAL then
                            faceTarget(bunny)
                            lastFaceTime = now
                        end
                        
                        -- 持续传送逻辑
                        if now - lastTeleportTime >= TELEPORT_INTERVAL then
                            local offset = TELEPORT_OFFSET
                            local bunnyForward = bunny.HumanoidRootPart.CFrame.LookVector
                            local teleportPos = bunny.HumanoidRootPart.Position + (bunnyForward * -2) + Vector3.new(0, offset.Y, 0)
                            character.HumanoidRootPart.CFrame = CFrame.new(teleportPos)
                lastTeleportTime = now
            end
            
            -- 持续攻击逻辑
            if now - lastAttackTime >= ATTACK_INTERVAL then
                attackBunny(bunny)
                lastAttackTime = now
            end
        else
            wait(1) -- 没有找到兔子时等待1秒
        end
        
        wait(0.05) -- 主循环小等待防止卡死
    end
end

-- 安全启动
local attackThread = coroutine.create(function()
    local success, err = pcall(attackLoop)
    if not success then
        warn("攻击循环出错:", err)
    end
end)

coroutine.resume(attackThread)

-- 提供停止函数(可选)
function stopAttack()
    if attackThread then
        coroutine.close(attackThread)
    end
end


Tabs.automaticTab:Toggle({
    Title = "自动攻击狼",
    Desc = "自动寻找附近的狼",
    Value = false,
    Callback = function(state)
        if state then
            -- 开启自动攻击
            _G.AutoAttackBunny = true
            
            -- 创建攻击线程
            coroutine.wrap(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                
                -- 配置参数
                local TELEPORT_OFFSET = Vector3.new(0, 3, 0)
                local ATTACK_INTERVAL = 0.1
                local TELEPORT_INTERVAL = 0.3
                local FACE_INTERVAL = 0.2
                local BUNNY_NAME = "Wolf"
                local MAX_DISTANCE = 100
                
                -- 确保角色存在
                local function ensureCharacter()
                    repeat
                        if not LocalPlayer.Character then
                            LocalPlayer.CharacterAdded:Wait()
                        end
                        if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            wait(0.5)
                        end
                    until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    return LocalPlayer.Character
                end
                
                -- 寻找最近的活着的兔子
                local function findAliveBunny()
                    local closestBunny = nil
                    local closestDistance = MAX_DISTANCE + 1
                    
                    for _, char in ipairs(workspace.Characters:GetChildren()) do
                        if char.Name == BUNNY_NAME and char:FindFirstChild("HumanoidRootPart") then
                            local humanoid = char:FindFirstChildOfClass("Humanoid")
                            if humanoid and humanoid.Health > 0 then
                                local distance = (char.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                if distance < closestDistance then
                                    closestBunny = char
                                    closestDistance = distance
                                end
                            end
                        end
                    end
                    
                    return closestBunny
                end
                
                -- 攻击兔子的函数
                local function attackBunny(bunny)
                    local weapon = LocalPlayer.Inventory:FindFirstChild("Old Axe") or LocalPlayer.Character:FindFirstChild("Old Axe")
                    if weapon then
                        local args = {
                            [1] = "FireAllClients",
                            [2] = bunny,
                            [3] = weapon
                        }
                        ReplicatedStorage.RemoteEvents.PlayEnemyHitSound:FireServer(unpack(args))
                    end
                end
                
                -- 使角色面向目标
                local function faceTarget(target)
                    if target and target:FindFirstChild("HumanoidRootPart") then
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local targetPos = target.HumanoidRootPart.Position
                            local charPos = character.HumanoidRootPart.Position
                            local lookAt = CFrame.new(charPos, Vector3.new(targetPos.X, charPos.Y, targetPos.Z))
                            character.HumanoidRootPart.CFrame = lookAt
                        end
                    end
                end
                
                -- 主攻击循环
                local character = ensureCharacter()
                local lastTeleportTime = 0
                local lastAttackTime = 0
                local lastFaceTime = 0
                
                while _G.AutoAttackBunny do
                    local now = tick()
                    local bunny = findAliveBunny()
                    
                    if bunny and bunny:FindFirstChild("HumanoidRootPart") then
                        -- 持续面向目标逻辑
                        if now - lastFaceTime >= FACE_INTERVAL then
                            faceTarget(bunny)
                            lastFaceTime = now
                        end
                        
                        -- 持续传送逻辑
                        if now - lastTeleportTime >= TELEPORT_INTERVAL then
                            local offset = TELEPORT_OFFSET
                            local bunnyForward = bunny.HumanoidRootPart.CFrame.LookVector
                            local teleportPos = bunny.HumanoidRootPart.Position + (bunnyForward * -2) + Vector3.new(0, offset.Y, 0)
                            character.HumanoidRootPart.CFrame = CFrame.new(teleportPos)
                lastTeleportTime = now
            end
            
            -- 持续攻击逻辑
            if now - lastAttackTime >= ATTACK_INTERVAL then
                attackBunny(bunny)
                lastAttackTime = now
            end
        else
            wait(1) -- 没有找到兔子时等待1秒
        end
        
        wait(0.05) -- 主循环小等待防止卡死
    end
end

-- 安全启动
local attackThread = coroutine.create(function()
    local success, err = pcall(attackLoop)
    if not success then
        warn("攻击循环出错:", err)
    end
end)

coroutine.resume(attackThread)

-- 提供停止函数(可选)
function stopAttack()
    if attackThread then
        coroutine.close(attackThread)
    end
end

Tabs.SpeedTab:Toggle({
    Title = "自动传送到树",
    Desc = "自动寻找附近的树",
    Value = false,
    Callback = function(state)
        if state then
            -- 开启自动攻击
            _G.AutoAttackBunny = true
            
            -- 创建攻击线程
            coroutine.wrap(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                
                -- 配置参数
                local TELEPORT_OFFSET = Vector3.new(0, 3, 0)
                local ATTACK_INTERVAL = 0.1
                local TELEPORT_INTERVAL = 0.3
                local FACE_INTERVAL = 0.2
                local BUNNY_NAME = "Wolf"
                local MAX_DISTANCE = 100
                
                -- 确保角色存在
                local function ensureCharacter()
                    repeat
                        if not LocalPlayer.Character then
                            LocalPlayer.CharacterAdded:Wait()
                        end
                        if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            wait(0.5)
                        end
                    until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    return LocalPlayer.Character
                end
                
                -- 寻找最近的活着的兔子
                local function findAliveBunny()
                    local closestBunny = nil
                    local closestDistance = MAX_DISTANCE + 1
                    
                    for _, char in ipairs(workspace.Characters:GetChildren()) do
                        if char.Name == BUNNY_NAME and char:FindFirstChild("HumanoidRootPart") then
                            local humanoid = char:FindFirstChildOfClass("Humanoid")
                            if humanoid and humanoid.Health > 0 then
                                local distance = (char.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                if distance < closestDistance then
                                    closestBunny = char
                                    closestDistance = distance
                                end
                            end
                        end
                    end
                    
                    return closestBunny
                end
                
                -- 攻击兔子的函数
                local function attackBunny(bunny)
                    local weapon = LocalPlayer.Inventory:FindFirstChild("Old Axe") or LocalPlayer.Character:FindFirstChild("Old Axe")
                    if weapon then
                        local args = {
                            [1] = "FireAllClients",
                            [2] = bunny,
                            [3] = weapon
                        }
                        ReplicatedStorage.RemoteEvents.PlayEnemyHitSound:FireServer(unpack(args))
                    end
                end
                
                -- 使角色面向目标
                local function faceTarget(target)
                    if target and target:FindFirstChild("HumanoidRootPart") then
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local targetPos = target.HumanoidRootPart.Position
                            local charPos = character.HumanoidRootPart.Position
                            local lookAt = CFrame.new(charPos, Vector3.new(targetPos.X, charPos.Y, targetPos.Z))
                            character.HumanoidRootPart.CFrame = lookAt
                        end
                    end
                end
                
                -- 主攻击循环
                local character = ensureCharacter()
                local lastTeleportTime = 0
                local lastAttackTime = 0
                local lastFaceTime = 0
                
                while _G.AutoAttackBunny do
                    local now = tick()
                    local bunny = findAliveBunny()
                    
                    if bunny and bunny:FindFirstChild("HumanoidRootPart") then
                        -- 持续面向目标逻辑
                        if now - lastFaceTime >= FACE_INTERVAL then
                            faceTarget(bunny)
                            lastFaceTime = now
                        end
                        
                        -- 持续传送逻辑
                        if now - lastTeleportTime >= TELEPORT_INTERVAL then
                            local offset = TELEPORT_OFFSET
                            local bunnyForward = bunny.HumanoidRootPart.CFrame.LookVector
                            local teleportPos = bunny.HumanoidRootPart.Position + (bunnyForward * -2) + Vector3.new(0, offset.Y, 0)
                            character.HumanoidRootPart.CFrame = CFrame.new(teleportPos)
                lastTeleportTime = now
            end
            
            -- 持续攻击逻辑
            if now - lastAttackTime >= ATTACK_INTERVAL then
                attackBunny(bunny)
                lastAttackTime = now
            end
        else
            wait(1) -- 没有找到兔子时等待1秒
        end
        
        wait(0.05) -- 主循环小等待防止卡死
    end
end

-- 安全启动
local attackThread = coroutine.create(function()
    local success, err = pcall(attackLoop)
    if not success then
        warn("攻击循环出错:", err)
    end
end)

coroutine.resume(attackThread)

-- 提供停止函数(可选)
function stopAttack()
    if attackThread then
        coroutine.close(attackThread)
    end
end

Tabs.ForestTab = Tabs.MainTab:Tab({ Title = "透视人物", Icon = "zap" })

-- 在极速传奇的刷标签中添加透视玩家功能
Tabs.SpeedTab:Toggle({
    Title = "透视玩家",
    Desc = "显示所有玩家角色",
    Value = false,
    Callback = function(state)
        if state then
            -- 开启透视
            _G.PlayerESP = true
            
            -- 高亮颜色配置
            local highlightColor = Color3.fromRGB(255, 0, 0)  -- 红色高亮
            local fillTransparency = 0.7  -- 透明度
            
            -- 创建玩家高亮函数
            local function highlightPlayer(player)
                if player ~= game.Players.LocalPlayer and player.Character then
                    local character = player.Character
                    
                    -- 移除旧的高亮
                    if character:FindFirstChild("PlayerESP_Highlight") then
                        character.PlayerESP_Highlight:Destroy()
                    end
                    
                    -- 创建新高亮
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "PlayerESP_Highlight"
                    highlight.Adornee = character
                    highlight.FillColor = highlightColor
                    highlight.FillTransparency = fillTransparency
                    highlight.OutlineColor = Color3.new(1, 1, 1)
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Parent = character
                end
            end
            
            -- 立即高亮所有现有玩家
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player.Character then
                    highlightPlayer(player)
                end
            end
            
            -- 监听新玩家加入
            _G.PlayerAddedConnection = game.Players.PlayerAdded:Connect(highlightPlayer)
            
            -- 监听玩家角色变化
            _G.CharacterAddedConnection = game.Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    if _G.PlayerESP then
                        highlightPlayer(player)
                    end
                end)
            end)
            
            WindUI:Notify({
                Title = "透视已开启",
                Content = "正在高亮显示所有玩家",
                Duration = 3
            })
        else
            -- 关闭透视
            _G.PlayerESP = false
            
            -- 移除所有高亮
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("PlayerESP_Highlight") then
                    player.Character.PlayerESP_Highlight:Destroy()
                end
            end
            
            -- 断开连接
            if _G.PlayerAddedConnection then
                _G.PlayerAddedConnection:Disconnect()
            end
            if _G.CharacterAddedConnection then
                _G.CharacterAddedConnection:Disconnect()
            end
            
            WindUI:Notify({
                Title = "透视已关闭",
                Content = "已停止高亮显示玩家",
                Duration = 3
            })
        end
    end
})

Tabs.ForestTab = Tabs.MainTab:Tab({ Title = "物品透视", Icon = "zap" })

-- 添加透视按钮
Tabs.ForestTab:Toggle({
    Title = "透视胡萝卜",
    Desc = "显示所有胡萝卜",
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

Tabs.ForestTab:Toggle({
    Title = "透视坏风扇",
    Desc = "显示所有坏风扇",
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

Tabs.ForestTab:Toggle({
    Title = "透视煤炭",
    Desc = "高亮显示所有煤炭",
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

Tabs.ForestTab:Toggle({
    Title = "透视物品箱",
    Desc = "高亮显示所有物品箱",
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

Tabs.ForestTab:Toggle({
    Title = "透视燃料罐",
    Desc = "高亮显示所有燃料罐",
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

Tabs.ForestTab:Toggle({
    Title = "透视熟肉块",
    Desc = "高亮显示所有熟肉块",
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

Tabs.ForestTab:Toggle({
    Title = "透视轮胎",
    Desc = "高亮显示所有轮胎",
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

Tabs.ForestTab:Toggle({
    Title = "透视金属板",
    Desc = "高亮显示所有金属板",
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

Tabs.ForestTab:Toggle({
    Title = "透视步枪弹药",
    Desc = "高亮显示所有步枪弹药",
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

Tabs.ForestTab:Toggle({
    Title = "透视左轮手枪弹药",
    Desc = "高亮显示所有左轮手枪弹药",
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

Tabs.ForestTab:Toggle({
    Title = "透视旧收音机",
    Desc = "高亮显示所有旧收音机",
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

Tabs.ForestTab:Toggle({
    Title = "透视狼",
    Desc = "高亮显示所有狼",
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

Tabs.ForestTab:Toggle({
    Title = "透视兔子",
    Desc = "高亮显示所有兔子",
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

Tabs.ForestTab:Toggle({
    Title = "透视螺栓",
    Desc = "高亮显示所有螺栓",
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

Tabs.ForestTab:Toggle({
    Title = "透视浆果",
    Desc = "高亮显示所有浆果",
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

Tabs.ForestTab:Toggle({
    Title = "透视步枪",
    Desc = "高亮显示所有步枪",
    Callback = function()
        local targetItemName = "Rifle"  -- 要透视的物品名称
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

Tabs.ForestTab:Toggle({
    Title = "透视左轮手枪",
    Desc = "高亮显示所有左轮手枪",
    Callback = function()
        local targetItemName = "Revolver"  -- 要透视的物品名称
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

Tabs.ForestTab:Toggle({
    Title = "透视兔子脚",
    Desc = "高亮显示所有兔子脚",
    Callback = function()
        local targetItemName = "Bunny Foot"  -- 要透视的物品名称
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

Tabs.ForestTab:Toggle({
    Title = "透视椅子",
    Desc = "高亮显示所有椅子",
    Callback = function()
        local targetItemName = "Chair"  -- 要透视的物品名称
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

Tabs.ForestTab:Toggle({
    Title = "透视手电筒",
    Desc = "高亮显示所有手电筒",
    Callback = function()
        local targetItemName = "Old Flashlight"  -- 要透视的物品名称
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

Tabs.ForestTab:Toggle({
    Title = "透视木头",
    Desc = "高亮显示所有木头",
    Callback = function()
        local targetItemName = "Log"  -- 要透视的物品名称
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

Tabs.ForestTab = Tabs.MainTab:Tab({ Title = "传送", Icon = "zap" })




Window:OnClose(function()
    print("UI closed.")
end)
