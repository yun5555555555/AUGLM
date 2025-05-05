local function createAdaptiveWatermark()
    if game.CoreGui:FindFirstChild("AUG_Watermark") then
        game.CoreGui.AUG_Watermark:Destroy()
    end


    local screenSize = workspace.CurrentCamera.ViewportSize

    local watermarkGui = Instance.new("ScreenGui")
    watermarkGui.Name = "AUG_Watermark"
    watermarkGui.Parent = game.CoreGui
    watermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    watermarkGui.ResetOnSpawn = false

    local watermarkText = Instance.new("TextLabel")
    watermarkText.Name = "WatermarkText"
    watermarkText.Parent = watermarkGui
    watermarkText.Text = "洛天依水印" 
    watermarkText.TextColor3 = Color3.fromRGB(255, 255, 255)
    watermarkText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    watermarkText.TextStrokeTransparency = 0.3 
    watermarkText.Font = Enum.Font.GothamBold 
    watermarkText.TextSize = math.floor(screenSize.Y * 0.02)
    watermarkText.BackgroundTransparency = 1 
    watermarkText.AnchorPoint = Vector2.new(1, 0) 
    watermarkText.Position = UDim2.new(1, -10, 0, 10) 
    watermarkText.TextXAlignment = Enum.TextXAlignment.Right 

    watermarkText.Size = UDim2.new(0, watermarkText.TextBounds.X + 20, 0, watermarkText.TextBounds.Y + 10)

    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        screenSize = workspace.CurrentCamera.ViewportSize
        watermarkText.TextSize = math.floor(screenSize.Y * 0.02)
        watermarkText.Size = UDim2.new(0, watermarkText.TextBounds.X + 20, 0, watermarkText.TextBounds.Y + 10)
    end)
end

createAdaptiveWatermark()

local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "少羽脚本1.0版本",
    Text = "少羽加载（反挂机已开启）",
    Duration = 5, 
})
print("反挂机开启")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/dUiCrXYP"))()
local Window = OrionLib:MakeWindow({Name = "少羽脚本（禁止倒卖）", HidePremium = false, SaveConfig = true,IntroText = "欢迎使用少羽脚本", ConfigFolder = "欢迎使用少羽脚本"})
local about = Window:MakeTab({
    Name = "少羽脚本禁止倒卖:洛天依上传脚本源码",
    Icon = "rbxassetid://93566402708060",
    PremiumOnly = false
})

about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID"," "..game.GameId.."")

local Tab = Window:MakeTab({
	Name = "其他作者",
	Icon = "rbxassetid://93566402708060",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "水下世界支持很多游戏_名单已被破除（不可用）",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/Fish/main/sx')))()
    end
})

Tab:AddButton({	Name = "面包脚本（不可用）",	Callback = function()  _G["面包脚本作者TA"]="xdjhadgdsrfcyefjhsadcctyseyr6432478rudghfvszhxcaheey"loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,109,119,48,112,102,69,70,77})end)())))()--神光    
end
})

Tab:AddButton({
	Name = "小魔",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaomoNB666/xiaomoNB666/main/666.txt"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "同用",
	Icon = "rbxassetid://93566402708060",
	PremiumOnly = false
})

Tab:AddButton({
    Name = "偷别人物品栏",
    Callback = function()
          --Copy And Paste:
    for i,v in pairs (game.Players:GetChildren()) do
    wait()
    for i,b in pairs (v.Backpack:GetChildren()) do
    b.Parent = game.Players.LocalPlayer.       Backpack
    end
    end
      end
})

Tab:AddButton({
	Name = "伪名说话",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()
	end 
})

Tab:AddButton({
  Name = "HUA 光影",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/arzRCgwS"))()
  end
})

Tab:AddButton({
  Name = "光影_2",
  Default = false,
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  end
})

Tab:AddButton({
	Name = "超高画质",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end
})    

Tab:AddButton({
  Name = "旋转",
  Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
  end
})

Tab:AddButton({
	Name = "转起来",
	Callback = function()
      	loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
  	end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Tab:AddButton({
	Name = "飞车",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
	end
})

Tab:AddButton({
	Name = "爬墙",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end
})

Tab:AddButton({
    Name = "动作",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddButton({
	Name = "踏空行走",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
	end
})

local Tab= Window:MakeTab({
	Name = "👁玩家👁",
	Icon = "rbxassetid://93566402708060",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "奖励自己",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/minecrafttotem/yzhs./main/Fe%20pp%20script%20very%20fun"))()
  end
})

Tab:AddButton({
	Name = "无限跳",
    Default = false,
	Callback = function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
	end
})

Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "移动速度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddButton({
	Name = "🚀飞行",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/U27yQRxS"))()
  	end
})

Tab:AddButton({
	Name = "透视",
	Callback = function()
      	local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
  	end
})

Tab:AddButton({
	Name = "传送玩家",
	Callback = function()
      	loadstring(game:HttpGet(("https://pastebin.com/raw/YNVbeqPy")))()
  	end
})

Tab:AddButton({
	Name = "fps显示",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/FPS-Counter'))()
  	end
})

Tab:AddButton({
	Name = "玩家进入提示",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "监狱人生",
	Icon = "rbxassetid://93566402708060",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "脚本"
})

Tab:AddButton({
	Name = "1",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/De4aYHDY"))()
  	end
})

local Section = Tab:AddSection({
	Name = "功能"
})

Tab:AddButton({
	Name = "变车模型",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
  	end
})

Tab:AddButton({
	Name = "变死神（有惊喜仅自己可见）",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()    
  	end
})

Tab:AddButton({
	Name = "变钢铁侠（有惊喜别人能看见）",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
  	end
})

Tab:AddButton({
	Name = "手里剑（秒杀）",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
  	end
})

Tab:AddButton({
	Name = "杀死全部（新版重复杀）",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
  	end
})

Tab:AddButton({
	Name = "无敌模式（别人可见）",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
  	end
})

Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddButton({
	Name = "逮捕",
	Callback = function()
Player = game.Players.LocalPlayer
	Pcf = Player.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
	if v.Name ~= Player.Name then
	local i = 10
    repeat
    wait()
    i = i-1
    game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
    until i == 0
end
end
end
})

local Section = Tab:AddSection({
	Name = "传送位置"
})

Tab:AddButton({
	Name = "警卫室",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
  	end
})

Tab:AddButton({
	Name = "监狱室内",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
  	end
})

Tab:AddButton({
	Name = "罪犯复活点",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
  	end
})

Tab:AddButton({
	Name = "监狱室外",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
  	end
})

local Tab = Window:MakeTab({
	Name = "🌚小黑子",
	Icon = "rbxassetid://93566402708060",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "1",
  Callback = function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/malicious-dev/RobloxScripting/main/swordwarrior.lua'),true))()
  end
})

Tab:AddButton({
  Name = "2",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0SwordWarriors"))()
  end
})

Tab:AddButton({
    Name = "3(需卡密)",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/SwordWarrior", true))()    
    end
})

Tab:AddButton({
  Name = "4",
  Callback = function()
   loadstring(game:HttpGet("https://scriptblox.com/raw/UPD-Sword-Warriors-Simulator-OP-EASY-UGC-SOON-AUTOFARM-8004"))()
  end
})

Tab:AddButton({
  Name = "5(需卡密)",
  Callback = function()
   loadstring(game:HttpGet("https://scriptblox.com/raw/Toilet!Event!Sword-Warriors!-NEW-OP-SCRIPT-7866"))()
  end
})

Tab:AddButton({
  Name = "6",
  Callback = function()
   loadstring(game:HttpGet("https://scriptblox.com/raw/ToiletTower!Sword-Warriors!-Instant-Sword-Swing-7653"))()
  end
})

local Tab = Window:MakeTab({
	Name = "鲨口求生(bushi",
	Icon = "rbxassetid://93566402708060",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "脚本",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
  end
})

Tab:AddDropdown({
	Name = "选择你的免费船(鲨鱼)",
	Default = "1",
	Options = {"无", "DuckyBoatBeta", "DuckyBoat", "BlueCanopyMotorboat", "BlueWoodenMotorboat", "UnicornBoat", "Jetski", "RedMarlin", "Sloop", "TugBoat", "SmallDinghyMotorboat", "JetskiDonut", "Marlin", "TubeBoat", "FishingBoat", "VikingShip", "SmallWoodenSailboat", "RedCanopyMotorboat", "Catamaran", "CombatBoat", "TourBoat", "Duckmarine", "PartyBoat", "MilitarySubmarine", "GingerbreadSteamBoat", "Sleigh2022", "Snowmobile", "CruiseShip"},
	Callback = function(Value)
local ohString1 = (Value)
game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(ohString1)
	end 
})

Tab:AddButton({
	Name = "自动杀鲨鱼🦈(鲨鱼)",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
  	end    
})

Tab:AddButton({	Name = "自动杀鲨鱼（鲨2）",	Callback = function()     loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()  
end
})

local Tab = Window:MakeTab({
	Name = "少羽赞助人员：少羽牛逼666-@   -无敌少羽大王-泷",
	Icon = "rbxassetid://93566402708060",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "源码提供：少羽牛逼666、无敌 @    、少羽大王、泷、"
})
