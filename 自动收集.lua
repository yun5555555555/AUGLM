-- 自动收集 Shard 碎片的增强脚本
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- 配置参数
local COLLECTION_RANGE = 15  -- 收集范围
local TELEPORT_DELAY = 0.08  -- 传送延迟（秒）
local SHARD_NAME = "Shard"  -- 碎片名称
local MONKEY_NAME = "Monkey" -- 危险NPC名称
local SAFE_DISTANCE = 30    -- 安全距离
local MAX_SHARDS = 100      -- 最大收集数量
local CHECK_MONKEY_INTERVAL = 0.5 -- 检查NPC间隔

-- 存储数据
local collectedShards = {}
local collectedCount = 0
local isRunning = true
local monkeyCheckCooldown = 0

-- 创建悬浮窗
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ShardCollectorGUI"
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.5, -100, 0.1, 0)
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Text = "自动收集水晶"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

local countLabel = Instance.new("TextLabel")
countLabel.Text = "已收集: 0"
countLabel.Size = UDim2.new(1, 0, 0, 30)
countLabel.Position = UDim2.new(0, 0, 0, 30)
countLabel.BackgroundTransparency = 1
countLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
countLabel.Font = Enum.Font.Gotham
countLabel.TextSize = 16
countLabel.Parent = frame

local statusLabel = Instance.new("TextLabel")
statusLabel.Text = "状态: 运行中"
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 60)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(200, 255, 200)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.Parent = frame

-- 更新UI
local function updateUI()
    countLabel.Text = "已收集: "..collectedCount
end

-- 快速传送到目标位置
local function teleportTo(position)
    local tweenInfo = TweenInfo.new(
        TELEPORT_DELAY,
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.InOut,
        0,
        false,
        0
    )
    
    local tween = TweenService:Create(rootPart, tweenInfo, {CFrame = CFrame.new(position)})
    tween:Play()
    tween.Completed:Wait()
end

-- 检查附近是否有Monkey NPC
local function checkForMonkeys()
    local monkeys = {}
    
    for _, npc in ipairs(workspace:GetChildren()) do
        if npc.Name == MONKEY_NAME and npc:FindFirstChild("HumanoidRootPart") then
            local distance = (npc.HumanoidRootPart.Position - rootPart.Position).Magnitude
            if distance < SAFE_DISTANCE then
                table.insert(monkeys, npc)
            end
        end
    end
    
    return monkeys
end

-- 找到最安全的Shard位置（远离Monkey）
local function findSafeShard(monkeys)
    local shards = {}
    local bestShard = nil
    local maxSafetyScore = -math.huge
    
    -- 获取所有Shard
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == SHARD_NAME and obj:IsA("BasePart") and not collectedShards[obj] then
            table.insert(shards, obj)
        end
    end
    
    if #shards == 0 then return nil end
    
    -- 评估每个Shard的安全性
    for _, shard in ipairs(shards) do
        local safetyScore = 0
        
        -- 计算与所有Monkey的平均距离
        for _, monkey in ipairs(monkeys) do
            local distance = (shard.Position - monkey.HumanoidRootPart.Position).Magnitude
            safetyScore = safetyScore + distance
        end
        
        -- 稍微偏好距离玩家近的Shard
        local playerDistance = (shard.Position - rootPart.Position).Magnitude
        safetyScore = safetyScore - playerDistance * 0.5
        
        if safetyScore > maxSafetyScore then
            maxSafetyScore = safetyScore
            bestShard = shard
        end
    end
    
    return bestShard
end

-- 躲避Monkey
local function evadeMonkeys(monkeys)
    statusLabel.Text = "状态: 躲避Monkey中"
    statusLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
    
    local safeShard = findSafeShard(monkeys)
    if safeShard then
        teleportTo(safeShard.Position)
        return true
    end
    
    -- 如果没有安全的Shard，传送到随机远处位置
    local randomPos = rootPart.Position + Vector3.new(
        math.random(-SAFE_DISTANCE, SAFE_DISTANCE),
        0,
        math.random(-SAFE_DISTANCE, SAFE_DISTANCE)
    )
    teleportTo(randomPos)
    return false
end

-- 检查并收集碎片
local function collectShard(shard)
    if not shard or not shard:IsA("BasePart") or collectedShards[shard] then
        return false
    end
    
    -- 标记为已收集
    collectedShards[shard] = true
    collectedCount = collectedCount + 1
    
    -- 传送到碎片位置
    teleportTo(shard.Position)
    
    -- 模拟收集动作
    firetouchinterest(rootPart, shard, 0)
    firetouchinterest(rootPart, shard, 1)
    
    updateUI()
    return true
end

-- 查找附近的碎片
local function findNearbyShards()
    local shards = {}
    
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == SHARD_NAME and obj:IsA("BasePart") and not collectedShards[obj] then
            table.insert(shards, obj)
        end
    end
    
    -- 按距离排序
    table.sort(shards, function(a, b)
        return (a.Position - rootPart.Position).Magnitude < (b.Position - rootPart.Position).Magnitude
    end)
    
    return shards
end

-- 主收集循环
local function autoCollect()
    while isRunning and collectedCount < MAX_SHARDS do
        -- 定期检查Monkey
        monkeyCheckCooldown = monkeyCheckCooldown - RunService.Heartbeat:Wait()
        
        if monkeyCheckCooldown <= 0 then
            local monkeys = checkForMonkeys()
            if #monkeys > 0 then
                evadeMonkeys(monkeys)
                monkeyCheckCooldown = CHECK_MONKEY_INTERVAL
                continue
            end
            monkeyCheckCooldown = CHECK_MONKEY_INTERVAL
        end
        
        local shards = findNearbyShards()
        
        if #shards == 0 then
            statusLabel.Text = "状态: 未找到Shard"
            statusLabel.TextColor3 = Color3.fromRGB(255, 255, 150)
            wait(1)
            continue
        end
        
        statusLabel.Text = "状态: 收集中..."
        statusLabel.TextColor3 = Color3.fromRGB(200, 255, 200)
        
        for _, shard in ipairs(shards) do
            if not isRunning or collectedCount >= MAX_SHARDS then break end
            
            collectShard(shard)
            RunService.Heartbeat:Wait()
        end
    end
    
    statusLabel.Text = "状态: "..(collectedCount >= MAX_SHARDS and "收集完成" or "已停止")
    statusLabel.TextColor3 = collectedCount >= MAX_SHARDS and Color3.fromRGB(150, 255, 150) or Color3.fromRGB(255, 150, 150)
end

-- 当角色重生时重新初始化
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
end)

-- 添加快捷键控制（例如按P暂停/继续）
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.P then
        isRunning = not isRunning
        statusLabel.Text = "状态: "..(isRunning and "运行中" or "已暂停")
        statusLabel.TextColor3 = isRunning and Color3.fromRGB(200, 255, 200) or Color3.fromRGB(255, 255, 150)
        
        if isRunning then
            autoCollect()
        end
    end
end)

-- 开始自动收集
autoCollect()