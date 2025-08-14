local g = Instance.new
local S = g("ScreenGui", game.CoreGui)
local F = g("Frame", S)
F.Size = UDim2.new(0, 260, 0, 200)
F.Position = UDim2.new(0.5, -130, 0.4, 0)
F.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
F.Active = true
F.Draggable = true

-- TikTok
local L = g("TextLabel", F)
L.Size = UDim2.new(1, -20, 0, 20)
L.Position = UDim2.new(0, 10, 0, 5)
L.Text = "TT:@gg67439"
L.TextColor3 = Color3.fromRGB(255, 255, 255)
L.BackgroundTransparency = 1
L.TextScaled = true
L.TextXAlignment = Enum.TextXAlignment.Left

-- Подпись "Текст"
local LT = g("TextLabel", F)
LT.Size = UDim2.new(0, 50, 0, 20)
LT.Position = UDim2.new(0, 10, 0, 30)
LT.Text = "Текст:"
LT.TextColor3 = Color3.fromRGB(255, 255, 255)
LT.BackgroundTransparency = 1
LT.TextXAlignment = Enum.TextXAlignment.Left

-- Текст для отправки
local T = g("TextBox", F)
T.Size = UDim2.new(1, -70, 0, 40)
T.Position = UDim2.new(0, 60, 0, 25)
T.PlaceholderText = "Введите текст..."
T.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
T.TextColor3 = Color3.fromRGB(255, 255, 255)
T.ClearTextOnFocus = false
T.TextWrapped = true
T.ClipsDescendants = true
T.TextXAlignment = Enum.TextXAlignment.Left
T.TextYAlignment = Enum.TextYAlignment.Center

-- Подпись "Скорость"
local LI = g("TextLabel", F)
LI.Size = UDim2.new(0, 90, 0, 20)
LI.Position = UDim2.new(0, 10, 0, 75)
LI.Text = "Скорость (сек):"
LI.TextColor3 = Color3.fromRGB(255, 255, 255)
LI.BackgroundTransparency = 1
LI.TextXAlignment = Enum.TextXAlignment.Left

-- Поле скорости
local I = g("TextBox", F)
I.Size = UDim2.new(0, 50, 0, 30)
I.Position = UDim2.new(0, 110, 0, 70)
I.PlaceholderText = "0.1"
I.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
I.TextColor3 = Color3.fromRGB(255, 255, 255)
I.ClearTextOnFocus = false
I.TextXAlignment = Enum.TextXAlignment.Left
I.TextYAlignment = Enum.TextYAlignment.Center

-- Подпись "Кол-во"
local LC = g("TextLabel", F)
LC.Size = UDim2.new(0, 60, 0, 20)
LC.Position = UDim2.new(0, 170, 0, 75)
LC.Text = "Кол-во:"
LC.TextColor3 = Color3.fromRGB(255, 255, 255)
LC.BackgroundTransparency = 1
LC.TextXAlignment = Enum.TextXAlignment.Left

-- Поле количества
local C = g("TextBox", F)
C.Size = UDim2.new(0, 50, 0, 30)
C.Position = UDim2.new(0, 230, 0, 70)
C.PlaceholderText = "5"
C.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
C.TextColor3 = Color3.fromRGB(255, 255, 255)
C.ClearTextOnFocus = false
C.TextXAlignment = Enum.TextXAlignment.Left
C.TextYAlignment = Enum.TextYAlignment.Center

-- Кнопка спама
local B = g("TextButton", F)
B.Size = UDim2.new(1, -40, 0, 30)
B.Position = UDim2.new(0, 10, 0, 110)
B.Text = "Начать спам"
B.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
B.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка закрытия
local X = g("TextButton", F)
X.Size = UDim2.new(0, 30, 0, 30)
X.Position = UDim2.new(1, -35, 0, 5)
X.Text = "✖"
X.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.TextScaled = true
X.AutoButtonColor = true

local Spamming = false

B.MouseButton1Click:Connect(function()
    if Spamming then
        Spamming = false
        B.Text = "Начать спам"
        return
    end

    local message = T.Text
    local delay = tonumber(I.Text) or 0.1
    local count = tonumber(C.Text) or 1

    if message == "" then return end

    Spamming = true
    B.Text = "Остановить спам"

    task.spawn(function()
        for i = 1, count do
            if not Spamming then break end
            game.ReplicatedStorage.TolEvent:FireServer(message)
            task.wait(delay)
        end
        Spamming = false
        B.Text = "Начать спам"
    end)
end)

X.MouseButton1Click:Connect(function()
    Spamming = false
    F:Destroy()
end)
