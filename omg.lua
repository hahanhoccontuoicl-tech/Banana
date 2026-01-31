--// OMG UI SCRIPT (FULL)
--// UI + Button + Toggle + Close

-- SERVICES
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OMG_UI"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- MAIN FRAME
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 400, 0, 260)
Main.Position = UDim2.new(0.5, -200, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui
Main.Active = true
Main.Draggable = true

-- BO GÓC
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

-- TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "🔥 OMG SCRIPT UI"
Title.TextColor3 = Color3.fromRGB(255, 80, 80)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.Parent = Main

-- BUTTON
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 160, 0, 40)
Button.Position = UDim2.new(0, 20, 0, 60)
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.Text = "💥 Test Button"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.Gotham
Button.TextSize = 16
Button.Parent = Main
Instance.new("UICorner", Button)

-- TOGGLE SPEED
local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(0, 160, 0, 40)
Toggle.Position = UDim2.new(0, 20, 0, 120)
Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Toggle.Text = "❌ Speed OFF"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.Font = Enum.Font.Gotham
Toggle.TextSize = 16
Toggle.Parent = Main
Instance.new("UICorner", Toggle)

-- CLOSE BUTTON
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -40, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Close.Parent = Main
Instance.new("UICorner", Close)

-- BIẾN TOGGLE
local SpeedOn = false

-- BUTTON FUNCTION
Button.MouseButton1Click:Connect(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "OMG Script",
        Text = "Bạn đã bấm nút!",
        Duration = 2
    })
end)

-- TOGGLE FUNCTION
Toggle.MouseButton1Click:Connect(function()
    SpeedOn = not SpeedOn
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")

    if humanoid then
        if SpeedOn then
            Toggle.Text = "✅ Speed ON"
            Toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            humanoid.WalkSpeed = 50
        else
            Toggle.Text = "❌ Speed OFF"
            Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            humanoid.WalkSpeed = 16
        end
    end
end)

-- CLOSE UI
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)