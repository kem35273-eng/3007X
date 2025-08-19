-- LocalScript  StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer

--  UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoginUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Login"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Parent = frame

local usernameBox = Instance.new("TextBox")
usernameBox.Size = UDim2.new(0.8, 0, 0, 40)
usernameBox.Position = UDim2.new(0.1, 0, 0, 60)
usernameBox.PlaceholderText = "Username"
usernameBox.Text = ""
usernameBox.Parent = frame

local passwordBox = Instance.new("TextBox")
passwordBox.Size = UDim2.new(0.8, 0, 0, 40)
passwordBox.Position = UDim2.new(0.1, 0, 0, 110)
passwordBox.PlaceholderText = "Password"
passwordBox.Text = ""
passwordBox.ClearTextOnFocus = true
passwordBox.TextScaled = true
passwordBox.TextSize = 18
passwordBox.TextXAlignment = Enum.TextXAlignment.Left
passwordBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
passwordBox.Parent = frame

local loginButton = Instance.new("TextButton")
loginButton.Size = UDim2.new(0.8, 0, 0, 40)
loginButton.Position = UDim2.new(0.1, 0, 0, 160)
loginButton.Text = "Login"
loginButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
loginButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loginButton.Parent = frame

--   username/password  Pastebin
local authURL = "https://pastebin.com/raw/h7zLGpsB"
local authData = {}

pcall(function()
    local raw = game:HttpGet(authURL)
    for line in string.gmatch(raw, "[^\r\n]+") do
        local user, pass = string.match(line, "([^:]+):([^:]+)")
        if user and pass then
            authData[user] = pass
        end
    end
end)

--  Login
loginButton.MouseButton1Click:Connect(function()
    local username = usernameBox.Text
    local password = passwordBox.Text

    if authData[username] and authData[username] == password then
        screenGui:Destroy()
        --  GitHub
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kem35273-eng/3007X/refs/heads/main/BANNATOWN3007X.lua"))()
    else
        title.Text = "Invalid Username/Password!"
        title.TextColor3 = Color3.fromRGB(255,0,0)
    end
end)