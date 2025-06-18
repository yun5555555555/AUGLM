-- Shard ESP 透视脚本
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- 存储 ESP 元素的表
local shardESP = {
    enabled = false,
    objects = {},
    visuals = {}
}

-- 创建单个 Shard 的 ESP
local function createShardESP(shard)
    if not shard or not shard:IsA("BasePart") then return end
    
    -- 如果已经为这个 Shard 创建了 ESP，则跳过
    if shardESP.visuals[shard] then return end
    
    -- 创建边界框
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ShardESP_"..shard.Name
    box.Adornee = shard
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = shard.Size
    box.Transparency = 0.5
    box.Color3 = Color3.fromRGB(0, 255, 255)  -- 青色
    box.Parent = shard
    
    -- 创建名称标签
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ShardInfo_"..shard.Name
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0, shard.Size.Y/2 + 2, 0)
    billboard.Adornee = shard
    billboard.Parent = shard
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = shard.Name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0.3
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Parent = billboard
    
    -- 存储引用
    shardESP.visuals[shard] = {
        box = box,
        billboard = billboard,
        label = label
    }
end

-- 移除单个 Shard 的 ESP
local function removeShardESP(shard)
    if shardESP.visuals[shard] then
        shardESP.visuals[shard].box:Destroy()
        shardESP.visuals[shard].billboard:Destroy()
        shardESP.visuals[shard] = nil
    end
end

-- 查找并标记所有名为 "Shard" 的物体
local function findAndMarkShards()
    -- 清除现有的 ESP
    for shard, _ in pairs(shardESP.visuals) do
        removeShardESP(shard)
    end
    
    -- 在工作区中查找名为 "Shard" 的物体
    local shards = workspace:FindFirstChild("Shard") and {workspace:FindFirstChild("Shard")} 
                  or workspace:GetDescendants()
    
    for _, obj in ipairs(shards) do
        if obj.Name == "Shard" and obj:IsA("BasePart") then
            createShardESP(obj)
            table.insert(shardESP.objects, obj)
        end
    end
end

-- 更新 ESP 可见性
local function updateESPVisibility()
    for shard, visual in pairs(shardESP.visuals) do
        if shard and shard.Parent then
            visual.box.Visible = shardESP.enabled
            visual.billboard.Enabled = shardESP.enabled
        else
            removeShardESP(shard)
        end
    end
end

-- 创建 UI 控制
local function createShardESPUI()
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Shard ESP", "Sentinel")

    -- 主标签
    local MainTab = Window:NewTab("控制")
    local MainSection = MainTab:NewSection("Shard ESP 设置")

    -- 开启/关闭 ESP
    MainSection:NewToggle("开启 Shard ESP", "显示/隐藏 Shard ESP", false, function(state)
        shardESP.enabled = state
        updateESPVisibility()
        
        if state then
            Library:Notify("Shard ESP 已启用", "所有名为 'Shard' 的物体将被标记", 3)
        else
            Library:Notify("Shard ESP 已禁用", "所有标记已被移除", 3)
        end
    end)

    -- 刷新按钮
    MainSection:NewButton("刷新 Shard", "重新查找并标记 Shard", function()
        findAndMarkShards()
        updateESPVisibility()
        Library:Notify("已刷新", "重新查找了所有 Shard", 2)
    end)

    -- 自动更新
    MainSection:NewToggle("自动更新", "自动检测新出现的 Shard", false, function(state)
        if state then
            shardESP.connection = workspace.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "Shard" and descendant:IsA("BasePart") then
                    createShardESP(descendant)
                    table.insert(shardESP.objects, descendant)
                    updateESPVisibility()
                end
            end)
        elseif shardESP.connection then
            shardESP.connection:Disconnect()
            shardESP.connection = nil
        end
    end)
end

-- 初始化
createShardESPUI()
findAndMarkShards()

-- 自动清理
LocalPlayer.CharacterRemoving:Connect(function()
    for shard, _ in pairs(shardESP.visuals) do
        removeShardESP(shard)
    end
end)