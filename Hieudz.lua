local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Hieudz"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 420, 0, 260)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0

local Corner = Instance.new("UICorner", MainFrame)
Corner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.Text = "Hiếu dz"
Title.TextColor3 = Color3.fromRGB(255, 221, 85)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left


local Logo = Instance.new("ImageLabel")
Logo.Parent = MainFrame
Logo.Size = UDim2.new(0, 80, 0, 80)
Logo.Position = UDim2.new(0, 10, 0, 60)
Logo.BackgroundTransparency = 1


Logo.Image = "rbxassetid://101194804954754"


local Info = Instance.new("TextLabel")
Info.Parent = MainFrame
Info.Size = UDim2.new(1, -110, 0, 80)
Info.Position = UDim2.new(0, 100, 0, 60)
Info.Text = "Version: 1.0\nStatus: Ready"
Info.TextColor3 = Color3.fromRGB(220, 220, 220)
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextWrapped = true
Info.TextXAlignment = Left
Info.TextYAlignment = Top
Info.BackgroundTransparency = 1


local FarmButton = Instance.new("TextButton")
FarmButton.Parent = MainFrame
FarmButton.Size = UDim2.new(0, 180, 0, 40)
FarmButton.Position = UDim2.new(0, 10, 1, -50)
FarmButton.Text = "Auto Farm: OFF"
FarmButton.Font = Enum.Font.GothamBold
FarmButton.TextSize = 14
FarmButton.TextColor3 = Color3.new(1,1,1)
FarmButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local BtnCorner = Instance.new("UICorner", FarmButton)
BtnCorner.CornerRadius = UDim.new(0, 8)


local farming = false
FarmButton.MouseButton1Click:Connect(function()
	farming = not farming
	FarmButton.Text = farming and "Auto Farm: ON" or "Auto Farm: OFF"
end)