-- Services
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Colors
local BG = Color3.fromRGB(22,22,22)
local PANEL = Color3.fromRGB(28,28,28)
local YELLOW = Color3.fromRGB(255, 204, 0)
local TEXT = Color3.fromRGB(235,235,235)

-- ScreenGui
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "BananaStyleUI"
gui.ResetOnSpawn = false

-- Main
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0, 560, 0, 380)
Main.Position = UDim2.new(0.5, -280, 0.5, -190)
Main.BackgroundColor3 = BG
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

-- Glow
local glow = Instance.new("UIStroke", Main)
glow.Color = YELLOW
glow.Thickness = 1.2
glow.Transparency = 0.3

-- TitleBar
local TitleBar = Instance.new("Frame", Main)
TitleBar.Size = UDim2.new(1,0,0,46)
TitleBar.BackgroundColor3 = PANEL
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel", TitleBar)
Title.Size = UDim2.new(1,-20,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "🍌 Banana Hub — Premium UI"
Title.TextColor3 = YELLOW
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextXAlignment = Left

-- Tabs
local Tabs = Instance.new("Frame", Main)
Tabs.Size = UDim2.new(0,160,1,-46)
Tabs.Position = UDim2.new(0,0,0,46)
Tabs.BackgroundColor3 = PANEL

local tabLayout = Instance.new("UIListLayout", Tabs)
tabLayout.Padding = UDim.new(0,8)
tabLayout.HorizontalAlignment = Center

-- Content
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,-160,1,-46)
Content.Position = UDim2.new(0,160,0,46)
Content.BackgroundColor3 = BG

-- Helpers
local pages = {}
local current

local function newPage(name)
	local page = Instance.new("Frame", Content)
	page.Size = UDim2.new(1,0,1,0)
	page.BackgroundTransparency = 1
	page.Visible = false
	pages[name] = page
	return page
end

local function newTab(name)
	local btn = Instance.new("TextButton", Tabs)
	btn.Size = UDim2.new(1,-16,0,40)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.Text = name
	btn.TextColor3 = TEXT
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 16
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15),
			{BackgroundColor3 = Color3.fromRGB(55,55,55)}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15),
			{BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
	end)

	btn.MouseButton1Click:Connect(function()
		if current then current.Visible = false end
		current = pages[name]
		current.Visible = true
	end)
end

-- Pages
local Home = newPage("Home")
local Farm = newPage("Farm")
local Settings = newPage("Settings")

newTab("Home")
newTab("Farm")
newTab("Settings")

current = Home
Home.Visible = true

-- UI Controls (Banana style)
local function Toggle(parent, text, callback, y)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0,260,0,42)
	btn.Position = UDim2.new(0,20,0,y)
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
	btn.TextColor3 = TEXT
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 16
	btn.Text = text.." : OFF"
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

	local on = false
	btn.MouseButton1Click:Connect(function()
		on = not on
		btn.Text = text .. (on and " : ON" or " : OFF")
		TweenService:Create(btn, TweenInfo.new(0.2), {
			BackgroundColor3 = on and YELLOW or Color3.fromRGB(35,35,35),
			TextColor3 = on and Color3.fromRGB(20,20,20) or TEXT
		}):Play()
		callback(on)
	end)
end

-- Demo Toggles (gắn script của bạn vào callback)
Toggle(Home, "Auto Farm", function(state)
	print("Auto Farm:", state)
end, 20)

Toggle(Farm, "Fast Attack", function(state)
	print("Fast Attack:", state)
end, 20)

Toggle(Settings, "Night Mode", function(state)
	print("Night Mode:", state)
end, 20)

-- Keybind
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		Main.Visible = not Main.Visible
	end
end)