local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))();

Compkiller.Colors.Highlight = Color3.fromRGB(0, 0, 0)
Compkiller.Colors.Toggle = Color3.fromRGB(30, 30, 30)
Compkiller.Colors.DropColor = Color3.fromRGB(20, 20, 20)
Compkiller.Colors.Risky = Color3.fromRGB(150, 0, 0)
Compkiller.Colors.MouseEnter = Color3.fromRGB(40, 40, 40)
Compkiller.Colors.BlockColor = Color3.fromRGB(15, 15, 15)
Compkiller.Colors.BGDBColor = Color3.fromRGB(10, 10, 10)
Compkiller.Colors.BlockBackground = Color3.fromRGB(25, 25, 25)
Compkiller.Colors.StrokeColor = Color3.fromRGB(50, 50, 50)
Compkiller.Colors.HighStrokeColor = Color3.fromRGB(80, 80, 80)
Compkiller.Colors.SwitchColor = Color3.fromRGB(200, 200, 200)
Compkiller.Colors.LineColor = Color3.fromRGB(60, 60, 60)

local Notifier = Compkiller.newNotify();

local ConfigManager = Compkiller:ConfigManager({
	Directory = "Compkiller-UI",
	Config = "Example-Configs"
});

Compkiller:Loader("rbxassetid://120245531583106" , 2.5).yield();

local Window = Compkiller.new({
	Name = "99夜优化脚本",
	Keybind = "LeftAlt",
	Logo = "rbxassetid://120245531583106",
	Scale = Compkiller.Scale.Window,
	TextSize = 15,
});

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")

local LP = Players.LocalPlayer
local Character = LP.Character or LP.CharacterAdded:Wait()

local Features = {
    KillAura = false,
    AutoChop = false,
    AutoEat = false,
    ChildESP = false,
    ChestESP = false,
    InstantInteract = false
}

local Blacklist = {}
local ESPHandles = {}

local ClientModule
local EatRemote
local function GetClientModule()
    if not ClientModule then
        ClientModule = require(LP:WaitForChild("PlayerScripts"):WaitForChild("Client"))
        EatRemote = ClientModule and ClientModule.Events and ClientModule.Events.RequestConsumeItem
    end
    return ClientModule, EatRemote
end

local function AddESP(target, name, distance, enabled)
    if not target or not target:IsDescendantOf(Workspace) then return end
    
    local rootPart = target:FindFirstChild("HumanoidRootPart") or target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
    if not rootPart then return end

    if ESPHandles[target] then
        ESPHandles[target].billboard.Enabled = enabled
        if enabled then
            ESPHandles[target].billboard.TextLabel.Text = name .. "\n" .. math.floor(distance) .. "m"
        end
        return
    end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_"..name
    billboard.Adornee = rootPart
    billboard.Size = UDim2.new(0, 100, 0, 100)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = enabled
    billboard.MaxDistance = 150
    billboard.Parent = rootPart

    local label = Instance.new("TextLabel")
    label.Text = name .. "\n" .. math.floor(distance) .. "m"
    label.Size = UDim2.new(1, 0, 0, 40)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextStrokeTransparency = 0.3
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Parent = billboard
    
    if name:match("Chest") then
        local image = Instance.new("ImageLabel")
        image.Position = UDim2.new(0, 20, 0, 40)
        image.Size = UDim2.new(0, 60, 0, 60)
        image.Image = "rbxassetid://18660563116"
        image.BackgroundTransparency = 1
        image.Parent = billboard
    end

    ESPHandles[target] = {
        billboard = billboard,
        connection = target.AncestryChanged:Connect(function()
            if not target:IsDescendantOf(Workspace) then
                if ESPHandles[target] then
                    ESPHandles[target].billboard:Destroy()
                    ESPHandles[target].connection:Disconnect()
                    ESPHandles[target] = nil
                end
            end
        end)
    }
end

local function ClearAllESP()
    for target, data in pairs(ESPHandles) do
        if data.billboard then
            data.billboard:Destroy()
        end
        if data.connection then
            data.connection:Disconnect()
        end
    end
    ESPHandles = {}
    Notifier.new({
        Title = "提示", 
        Content = "已清除所有透视", 
        Duration = 2,
        Icon = "rbxassetid://120245531583106"
    })
end

local function TryEatFood(food)
    local _, remote = GetClientModule()
    if not remote then 
        Notifier.new({
            Title = "错误", 
            Content = "无法获取进食远程函数", 
            Duration = 5,
            Icon = "rbxassetid://120245531583106"
        })
        return 
    end

    if not ReplicatedStorage:FindFirstChild("TempStorage") then
        Notifier.new({
            Title = "错误", 
            Content = "找不到临时存储", 
            Duration = 5,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end

    local foodClone = food:Clone()
    foodClone.Parent = ReplicatedStorage.TempStorage
    
    local success, result = pcall(function()
        return remote:InvokeServer(foodClone)
    end)

    if success and result and result.Success then
        Notifier.new({
            Title = "提示", 
            Content = "✅成功吃下 " .. food.Name, 
            Duration = 5,
            Icon = "rbxassetid://120245531583106"
        })
    else
        Notifier.new({
            Title = "提示", 
            Content = "❌️进食失败", 
            Duration = 5,
            Icon = "rbxassetid://120245531583106"
        })
    end
    
    foodClone:Destroy()
end

local itemConfig = {
    {name = "Log", display = "木头", espColor = Color3.fromRGB(139, 69, 19)},
    {name = "Carrot", display = "胡萝卜", espColor = Color3.fromRGB(255, 165, 0)},
    {name = "Berry", display = "浆果", espColor = Color3.fromRGB(255, 0, 0)},
    {name = "Bolt", display = "螺栓", espColor = Color3.fromRGB(255, 255, 0)},
    {name = "Broken Fan", display = "风扇", espColor = Color3.fromRGB(100, 100, 100)},
    {name = "Coal", display = "煤炭", espColor = Color3.fromRGB(0, 0, 0)},
    {name = "Coin Stack", display = "钱堆", espColor = Color3.fromRGB(255, 215, 0)},
    {name = "Fuel Canister", display = "燃料罐", espColor = Color3.fromRGB(255, 50, 50)},
    {name = "Item Chest", display = "宝箱", espColor = Color3.fromRGB(210, 180, 140)},
    {name = "Old Flashlight", display = "手电筒", espColor = Color3.fromRGB(200, 200, 200)},
    {name = "Old Radio", display = "收音机", espColor = Color3.fromRGB(150, 150, 150)},
    {name = "Rifle Ammo", display = "步枪子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Revolver Ammo", display = "左轮子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Sheet Metal", display = "金属板", espColor = Color3.fromRGB(192, 192, 192)},
    {name = "Revolver", display = "左轮", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Rifle", display = "步枪", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Bandage", display = "绷带", espColor = Color3.fromRGB(255, 240, 245)},
    {name = "Crossbow Cultist", display = "敌人", espColor = Color3.fromRGB(255, 0, 0)},
    {name = "Bear", display = "熊", espColor = Color3.fromRGB(139, 69, 19)},
    {name = "Alpha Wolf", display = "阿尔法狼", espColor = Color3.fromRGB(128, 128, 128)},
    {name = "Wolf", display = "狼", espColor = Color3.fromRGB(192, 192, 192)},
    {name = "Chair", display = "椅子", espColor = Color3.fromRGB(160, 82, 45)},
    {name = "Tyre", display = "轮胎", espColor = Color3.fromRGB(20, 20, 20)},
    {name = "Alien Chest", display = "外星宝箱", espColor = Color3.fromRGB(0, 255, 0)},
    {name = "Leather Body", display = "皮革", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Thorn Body", display = "荆棘铠甲", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Iron Body", display = "铁甲", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Chest", display = "宝箱", espColor = Color3.fromRGB(210, 180, 140)},
    {name = "Lost Child", display = "走失的孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child1", display = "走失的孩子1", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child2", display = "走失的孩子2", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child3", display = "走失的孩子3", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Dino Kid", display = "恐龙孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "kraken kid", display = "海怪孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Squid kid", display = "鱿鱼孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Koala Kid", display = "考拉孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "koala", display = "考拉", espColor = Color3.fromRGB(0, 255, 255)}
}

local BONFIRE_POSITION = Vector3.new(0.189, 7.831, -0.341)

local function findItems(itemName)
    local found = {}
    local folders = {"ltems", "Items", "MapItems", "WorldItems"}
    
    for _, folderName in ipairs(folders) do
        local folder = Workspace:FindFirstChild(folderName)
        if folder then
            for _, item in ipairs(folder:GetDescendants()) do
                if item.Name == itemName and item:IsA("Model") then
                    local primaryPart = item.PrimaryPart or item:FindFirstChild("HumanoidRootPart") or item:FindFirstChild("Handle")
                    if primaryPart then
                        table.insert(found, {model = item, part = primaryPart})
                    end
                end
            end
        end
    end
    
    return found
end

local function teleportToItem(itemName, displayName)
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        Notifier.new({
            Title = "错误", 
            Content = "角色未准备好", 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    
    local items = findItems(itemName)
    if #items == 0 then
        Notifier.new({
            Title = "提示", 
            Content = "未找到"..displayName, 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    
    local closest = nil
    local minDist = math.huge
    local charPos = Character.HumanoidRootPart.Position
    
    for _, item in ipairs(items) do
        local dist = (item.part.Position - charPos).Magnitude
        if dist < minDist then
            minDist = dist
            closest = item.part
        end
    end
    
    if closest then
        Character:MoveTo(closest.Position + Vector3.new(0, 3, 0))
        Notifier.new({
            Title = "成功", 
            Content = "已传送到"..displayName, 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
end

local function teleportToBonfire()
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        Notifier.new({
            Title = "错误", 
            Content = "角色未准备好", 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    
    Character:MoveTo(BONFIRE_POSITION)
    Notifier.new({
        Title = "成功", 
        Content = "已传送回篝火", 
        Duration = 2,
        Icon = "rbxassetid://120245531583106"
    })
end

local function teleportItemsToPlayer(itemName, displayName)
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        Notifier.new({
            Title = "错误", 
            Content = "角色未准备好", 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    
    local items = findItems(itemName)
    if #items == 0 then
        Notifier.new({
            Title = "提示", 
            Content = "未找到"..displayName, 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    
    local charPos = Character.HumanoidRootPart.Position
    local radius = 5
    local angleStep = (2 * math.pi) / #items
    
    local dragEvent = ReplicatedStorage:FindFirstChild("RemoteEvents") and 
                     ReplicatedStorage.RemoteEvents:FindFirstChild("RequestStartDraggingItem")
    
    if not dragEvent then
        Notifier.new({
            Title = "错误", 
            Content = "找不到拖拽物品的远程事件", 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    
    for i, item in ipairs(items) do
        local angle = angleStep * i
        local x = math.cos(angle) * radius
        local z = math.sin(angle) * radius
        local targetPos = charPos + Vector3.new(x, 0, z)
        
        local args = {
            [1] = item.model
        }
        dragEvent:FireServer(unpack(args))
        
        task.wait(0.1)
        
        if item.model:FindFirstChild("Handle") then
            item.model.Handle.CFrame = CFrame.new(targetPos)
        elseif item.part then
            item.part.CFrame = CFrame.new(targetPos)
        end
    end
    
    Notifier.new({
        Title = "成功", 
        Content = "已将"..#items.."个"..displayName.."传送到你旁边", 
        Duration = 2,
        Icon = "rbxassetid://120245531583106"
    })
end

local function toggleESP(itemName, displayName, color)
    if _G["ESP_"..itemName] then
        for _, gui in ipairs(_G["ESP_"..itemName].guis) do
            if gui then
                gui:Destroy()
            end
        end
        if _G["ESP_"..itemName].conn then
            _G["ESP_"..itemName].conn:Disconnect()
        end
        _G["ESP_"..itemName] = nil
        Notifier.new({
            Title = "提示", 
            Content = "已关闭"..displayName.."透视", 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    
    local items = findItems(itemName)
    _G["ESP_"..itemName] = {guis = {}}
    
    local function createESP(itemPart)
        if not itemPart or not itemPart:IsDescendantOf(Workspace) then return end
        
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_"..itemName
        billboard.Adornee = itemPart
        billboard.Size = UDim2.new(0, 100, 0, 40)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 150
        
        local text = Instance.new("TextLabel")
        text.Text = displayName
        text.Size = UDim2.new(1, 0, 1, 0)
        text.Font = Enum.Font.SourceSansBold
        text.TextSize = 18
        text.TextColor3 = color
        text.BackgroundTransparency = 1
        text.TextStrokeTransparency = 0.5
        text.TextStrokeColor3 = Color3.new(0, 0, 0)
        text.Parent = billboard
        
        billboard.Parent = itemPart
        table.insert(_G["ESP_"..itemName].guis, billboard)
        
        local conn = itemPart.AncestryChanged:Connect(function()
            if not itemPart:IsDescendantOf(Workspace) then
                if billboard then
                    billboard:Destroy()
                end
                if conn then
                    conn:Disconnect()
                end
            end
        end)
    end
    
    for _, item in ipairs(items) do
        createESP(item.part)
    end
    
    _G["ESP_"..itemName].conn = Workspace.DescendantAdded:Connect(function(descendant)
        if descendant.Name == itemName and descendant:IsA("Model") then
            local primaryPart = descendant.PrimaryPart or descendant:FindFirstChild("HumanoidRootPart") or descendant:FindFirstChild("Handle")
            if primaryPart then
                createESP(primaryPart)
            end
        end
    end)
    
    Notifier.new({
        Title = "提示", 
        Content = "已开启"..displayName.."透视 ("..#items.."个)", 
        Duration = 2,
        Icon = "rbxassetid://120245531583106"
    })
end

local lastKillAura, lastAutoChop, lastAutoEat = 0, 0, 0
local connection
RunService.Heartbeat:Connect(function()
    local now = tick()
    
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        Character = LP.Character or LP.CharacterAdded:Wait()
        return
    end
    
    if Features.InstantInteract then
        if not connection then
            connection = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
                if prompt then
                    prompt.HoldDuration = 0
                    fireproximityprompt(prompt)
                end
            end)
        end
    else
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end

    if Features.KillAura and now - lastKillAura >= 0.7 then
        lastKillAura = now
        if Character:FindFirstChild("ToolHandle") then
            local tool = Character.ToolHandle.OriginalItem.Value
            if tool and ({["Old Axe"] = true, ["Good Axe"] = true, ["Spear"] = true, ["Hatchet"] = true, ["Bone Club"] = true})[tool.Name] then
                for _, target in next, Workspace.Characters:GetChildren() do
                    if target:IsA("Model") and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("HitRegisters") then
                        local distance = (Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude
                        if distance <= 100 then
                            ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("ToolDamageObject"):InvokeServer(target, tool, true, Character.HumanoidRootPart.CFrame)
                        end
                    end
                end
            end
        end
    end

    if Features.AutoChop and now - lastAutoChop >= 0.7 then
        lastAutoChop = now
        if Character:FindFirstChild("ToolHandle") then
            local tool = Character.ToolHandle.OriginalItem.Value
            if tool and ({["Old Axe"] = true, ["Stone Axe"] = true, ["Iron Axe"] = true})[tool.Name] then
                local function ChopTree(path)
                    for _, tree in next, path:GetChildren() do
                        task.wait(.1)
                        if tree:IsA("Model") and ({["Small Tree"] = true, ["TreeBig1"] = true, ["TreeBig2"] = true, ["TreeBig3"] = true})[tree.Name] and tree:FindFirstChild("HitRegisters") then
                            local trunk = tree:FindFirstChild("Trunk") or tree:FindFirstChild("HumanoidRootPart") or tree.PrimaryPart
                            if trunk then
                                local distance = (Character.HumanoidRootPart.Position - trunk.Position).Magnitude
                                if distance <= 100 then
                                    ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("ToolDamageObject"):InvokeServer(tree, tool, true, Character.HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    end
                end
                ChopTree(Workspace.Map.Foliage)
                ChopTree(Workspace.Map.Landmarks)
            end
        end
    end

    if Features.AutoEat and now - lastAutoEat >= 10 then
        lastAutoEat = now
        local foundFood = false
        for _, obj in pairs(Workspace.Items:GetChildren()) do
            if obj:IsA("Model") and ({["Carrot"] = true, ["Berry"] = true, ["Morsel"] = false, ["Cooked Morsel"] = true, ["Steak"] = false, ["Cooked Steak"] = true})[obj.Name] then
                local mainPart = obj:FindFirstChild("Handle") or obj.PrimaryPart
                if mainPart then
                    local distance = (mainPart.Position - Character.HumanoidRootPart.Position).Magnitude
                    if distance < 25 then
                        foundFood = true
                        TryEatFood(obj)
                        break
                    end
                end
            end
        end
        if not foundFood then
            Notifier.new({
                Title = "提示", 
                Content = "25米范围内无食物", 
                Duration = 5,
                Icon = "rbxassetid://120245531583106"
            })
        end
    end

    if Features.ChestESP then
        for _, chest in next, Workspace.Items:GetChildren() do
            if chest.Name:match("Chest") and chest:IsA("Model") and not table.find(Blacklist, chest) and chest:FindFirstChild("Main") then
                local distance = (Character.HumanoidRootPart.Position - chest.Main.Position).Magnitude
                AddESP(chest, "宝箱", distance, true)
            end
        end
    end

    if Features.ChildESP then
        for _, child in next, Workspace.Characters:GetChildren() do
            if table.find({"Lost Child", "Lost Child1", "Lost Child2", "Lost Child3", "Dino Kid", "kraken kid", "Squid kid", "Koala Kid", "koala"}, child.Name) 
               and child:FindFirstChild("HumanoidRootPart") and not table.find(Blacklist, child) then
                local distance = (Character.HumanoidRootPart.Position - child.HumanoidRootPart.Position).Magnitude
                AddESP(child, "孩子", distance, true)
            end
        end
    end
end)

local PlayerList = {}
local function UpdatePlayerList()
    PlayerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerList, player.Name)
    end
end

Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)
UpdatePlayerList()

local MainTab = Window:DrawTab({
    Name = "主要功能",
    Icon = "zap",
    EnableScrolling = true
});

local MainSection = MainTab:DrawSection({
    Name = "自动功能",
    Position = 'left'	
});

MainSection:AddToggle({
    Name = "杀戮光环",
    Flag = "Kill_Aura",
    Default = false,
    Callback = function(value)
        Features.KillAura = value
        Notifier.new({
            Title = "提示",
            Content = value and "已开启杀戮光环" or "已关闭杀戮光环",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
});

MainSection:AddToggle({
    Name = "自动砍树",
    Flag = "Auto_Chop",
    Default = false,
    Callback = function(value)
        Features.AutoChop = value
        Notifier.new({
            Title = "提示",
            Content = value and "已开启自动砍树" or "已关闭自动砍树",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
});

MainSection:AddToggle({
    Name = "自动进食",
    Flag = "Auto_Eat",
    Default = false,
    Callback = function(value)
        Features.AutoEat = value
        Notifier.new({
            Title = "提示",
            Content = value and "已开启自动进食" or "已关闭自动进食",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
});

MainSection:AddToggle({
    Name = "瞬间互动",
    Flag = "Instant_Interact",
    Default = false,
    Callback = function(value)
        Features.InstantInteract = value
        Notifier.new({
            Title = "提示",
            Content = value and "已开启瞬间互动" or "已关闭瞬间互动",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
});

MainSection:AddButton({
    Name = "传送回篝火",
    Callback = teleportToBonfire
});

local ESPSection = MainTab:DrawSection({
    Name = "透视功能",
    Position = 'right'	
});

ESPSection:AddToggle({
    Name = "宝箱透视",
    Flag = "Chest_ESP",
    Default = false,
    Callback = function(value)
        Features.ChestESP = value
        Notifier.new({
            Title = "提示",
            Content = value and "已开启宝箱透视" or "已关闭宝箱透视",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
});

ESPSection:AddToggle({
    Name = "孩子透视",
    Flag = "Child_ESP",
    Default = false,
    Callback = function(value)
        Features.ChildESP = value
        Notifier.new({
            Title = "提示",
            Content = value and "已开启孩子透视" or "已关闭孩子透视",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
});

for _, item in ipairs(itemConfig) do
    ESPSection:AddButton({
        Name = item.display.."透视",
        Callback = function() 
            toggleESP(item.name, item.display, item.espColor) 
        end
    })
end

local TeleportTab = Window:DrawTab({
    Name = "传送功能",
    Icon = "map-pin",
    EnableScrolling = true
});

local TeleportSection = TeleportTab:DrawSection({
    Name = "玩家传送",
    Position = 'left'	
});

TeleportSection:AddDropdown({
    Name = "选择玩家",
    Default = "选择玩家",
    Flag = "Player_Teleport",
    Values = PlayerList,
    Callback = function(selected)
        local target = Players[selected]
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            Character:PivotTo(target.Character.HumanoidRootPart.CFrame)
            Notifier.new({
                Title = "成功",
                Content = "已传送到玩家 "..selected,
                Duration = 2,
                Icon = "rbxassetid://120245531583106"
            })
        else
            Notifier.new({
                Title = "错误",
                Content = "无法传送到该玩家",
                Duration = 2,
                Icon = "rbxassetid://120245531583106"
            })
        end
    end
});

local ItemTeleportSection = TeleportTab:DrawSection({
    Name = "物品传送",
    Position = 'right'	
});

for _, item in ipairs(itemConfig) do
    ItemTeleportSection:AddButton({
        Name = "传送到"..item.display,
        Callback = function()
            teleportToItem(item.name, item.display)
        end
    })
end

local CollectTab = Window:DrawTab({
    Name = "收集功能",
    Icon = "package",
    EnableScrolling = true
});

local CollectSection = CollectTab:DrawSection({
    Name = "物品收集",
    Position = 'left'	
});

for _, item in ipairs(itemConfig) do
    CollectSection:AddButton({
        Name = "召唤"..item.display,
        Callback = function()
            teleportItemsToPlayer(item.name, item.display)
        end
    })
end

local SettingsTab = Window:DrawTab({
    Name = "设置",
    Icon = "settings",
    EnableScrolling = true
});

local SettingsSection = SettingsTab:DrawSection({
    Name = "界面设置",
    Position = 'left'	
});

SettingsSection:AddButton({
    Name = "清除所有透视",
    Callback = ClearAllESP
});

SettingsSection:AddButton({
    Name = "重新加载脚本",
    Callback = function()
        Notifier.new({
            Title = "提示",
            Content = "正在重新加载脚本...",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/your-repo/99night-script/main/optimized.lua"))()
    end
});

Notifier.new({
    Title = "欢迎使用99夜优化脚本",
    Content = "已修复所有已知问题，请享受游戏！",
    Duration = 5,
    Icon = "rbxassetid://120245531583106"
});