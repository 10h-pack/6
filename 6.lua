--Vars
	LocalPlayer = game:GetService("Players").LocalPlayer
	Camera = workspace.CurrentCamera
	RunService = game:GetService("RunService")
	VirtualUser = game:GetService("VirtualUser")
	MarketplaceService = game:GetService("MarketplaceService")

	--Get Current Vehicle
	function GetCurrentVehicle()
		return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart and LocalPlayer.Character.Humanoid.SeatPart.Parent
	end

	--Metatables
	MT = getrawmetatable(game)
	Old_Index = MT.__index
	setreadonly(MT, false)
	MT.__index = newcclosure(function(self, K)
		if self:IsA("Sound") and self:IsDescendantOf(workspace.SessionVehicles) and AntiSkidMarkSounds then
			self:Stop()
			return
		end
		return Old_Index(self, K)
	end)
	setreadonly(MT, true)

	--Regular TP
	function TP(cframe)
		GetCurrentVehicle():SetPrimaryPartCFrame(cframe)
	end

	--Velocity TP
	function VelocityTP(cframe)
		TeleportSpeed = 500
		Car = GetCurrentVehicle()
		for I,V in pairs(GetCurrentVehicle():GetDescendants()) do
			if V:IsA("BodyGyro") then
				V:Destroy()
			end
		end
		local BodyGyro = Instance.new("BodyGyro", Car.PrimaryPart)
		BodyGyro.P = 5000
		BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BodyGyro.CFrame = Car.PrimaryPart.CFrame
		local BodyVelocity = Instance.new("BodyVelocity", Car.PrimaryPart)
		BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		BodyVelocity.Velocity = CFrame.new(Car.PrimaryPart.Position, cframe.p).LookVector * TeleportSpeed
		wait((Car.PrimaryPart.Position - cframe.p).Magnitude / TeleportSpeed)
		BodyVelocity.Velocity = Vector3.new()
		wait(0.1)
		BodyVelocity:Destroy()
		BodyGyro:Destroy()
	end

	--Auto Farm
	StartPosition = CFrame.new(Vector3.new(-1818, -79, -10685), Vector3.new(-880, -79, -10769))
	EndPosition = CFrame.new(Vector3.new(-965, -79, -10761), Vector3.new(-880, -79, -10769))
	AutoFarmFunc = coroutine.create(function()
		while wait() do
			if not AutoFarm then
				AutoFarmRunning = false
				coroutine.yield()
			end
			AutoFarmRunning = true
			pcall(function()
				if not GetCurrentVehicle() and tick() - (LastNotif or 0) > 5 then
					LastNotif = tick()
					SendNotification("Aloha Scripts", "Please Enter A Vehicle!")
				else
					TP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
					VelocityTP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
					TP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
					VelocityTP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
				end
			end)
		end
	end)
	
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() 
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))() 

 wait(1) 
 Notification:Notify( 
     {Title = "猫王", Description = "正在加载"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 
 wait(2) 
 Notification:Notify( 
     {Title = "猫王", Description = "准备好了！"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 )
 wait(0.2)
 Notification:Notify( 
     {Title = "猫王", Description = "支持作者猫王和小天"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 )
 wait(0.4)
 
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UICorner = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Frame.BackgroundTransparency = 0.500
Frame.Position = UDim2.new(0.858712733, 0, 0.0237762257, 0)
Frame.Size = UDim2.new(0.129513338, 0, 0.227972031, 0)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "关闭"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 50.000
TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextStrokeTransparency = 0.000
TextButton.TextWrapped = true
TextButton.MouseButton1Down:Connect(function()
    if TextButton.Text == "关闭" then
        TextButton.Text = "打开"
    else
        TextButton.Text = "关闭"
    end
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E" , false , game)
end) -- replace "E" with your keybind

UITextSizeConstraint.Parent = TextButton
UITextSizeConstraint.MaxTextSize = 30


local win = lib:Window("格林维尔",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E) -- your own keybind 

local tab = win:Tab("主要功能")

tab:Toggle("自动驾驶", false, function(value)
    AutoFarm = value
			if value and not AutoFarmRunning then
				coroutine.resume(AutoFarmFunc)
			end
end)

tab:Toggle("触摸地面", false, function(value)
    TouchTheRoad = value
end)

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/VeaMSRZK"))()
local Tab = Window:MakeTab({
    Name = "6",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
