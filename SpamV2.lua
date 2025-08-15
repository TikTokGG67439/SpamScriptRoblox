local g = Instance.new
local S = g("ScreenGui", game.CoreGui)
local F = g("Frame", S)
F.Size = UDim2.new(0, 280, 0, 280)
F.Position = UDim2.new(0.5, -140, 0.4, 0)
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

-- Код
local LT = g("TextLabel", F)
LT.Size = UDim2.new(0, 90, 0, 20)
LT.Position = UDim2.new(0, 10, 0, 30)
LT.Text = "Код:"
LT.TextColor3 = Color3.fromRGB(255, 255, 255)
LT.BackgroundTransparency = 1
LT.TextXAlignment = Enum.TextXAlignment.Left

-- TextBox
local T = g("TextBox", F)
T.Size = UDim2.new(1, -20, 0, 60)
T.Position = UDim2.new(0, 10, 0, 50)
T.PlaceholderText = "Вставьте любую команду..."
T.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
T.TextColor3 = Color3.fromRGB(255, 255, 255)
T.ClearTextOnFocus = false
T.TextWrapped = true
T.TextXAlignment = Enum.TextXAlignment.Left
T.TextYAlignment = Enum.TextYAlignment.Top

-- Скорость
local LI = g("TextLabel", F)
LI.Size = UDim2.new(0, 90, 0, 20)
LI.Position = UDim2.new(0, 10, 0, 120)
LI.Text = "Скорость (сек):"
LI.TextColor3 = Color3.fromRGB(255, 255, 255)
LI.BackgroundTransparency = 1
LI.TextXAlignment = Enum.TextXAlignment.Left

local I = g("TextBox", F)
I.Size = UDim2.new(0, 50, 0, 30)
I.Position = UDim2.new(0, 110, 0, 115)
I.PlaceholderText = "0.1"
I.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
I.TextColor3 = Color3.fromRGB(255, 255, 255)
I.ClearTextOnFocus = false
I.TextXAlignment = Enum.TextXAlignment.Left
I.TextYAlignment = Enum.TextYAlignment.Center

-- Кол-во
local LC = g("TextLabel", F)
LC.Size = UDim2.new(0, 60, 0, 20)
LC.Position = UDim2.new(0, 170, 0, 120)
LC.Text = "Кол-во:"
LC.TextColor3 = Color3.fromRGB(255, 255, 255)
LC.BackgroundTransparency = 1
LC.TextXAlignment = Enum.TextXAlignment.Left

local C = g("TextBox", F)
C.Size = UDim2.new(0, 50, 0, 30)
C.Position = UDim2.new(0, 230, 0, 115)
C.PlaceholderText = "5"
C.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
C.TextColor3 = Color3.fromRGB(255, 255, 255)
C.ClearTextOnFocus = false
C.TextXAlignment = Enum.TextXAlignment.Left
C.TextYAlignment = Enum.TextYAlignment.Center

-- Кнопка "Ввести"
local EnterButton = g("TextButton", F)
EnterButton.Size = UDim2.new(1, -40, 0, 30)
EnterButton.Position = UDim2.new(0, 10, 0, 160)
EnterButton.Text = "Ввести"
EnterButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка "Спам"
local SpamButton = g("TextButton", F)
SpamButton.Size = UDim2.new(1, -40, 0, 30)
SpamButton.Position = UDim2.new(0, 10, 0, 200)
SpamButton.Text = "Начать спам"
SpamButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpamButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка "Clear"
local ClearButton = g("TextButton", F)
ClearButton.Size = UDim2.new(1, -40, 0, 30)
ClearButton.Position = UDim2.new(0, 10, 0, 240)
ClearButton.Text = "Clear"
ClearButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Закрытие
local X = g("TextButton", F)
X.Size = UDim2.new(0, 30, 0, 30)
X.Position = UDim2.new(1, -35, 0, 5)
X.Text = "✖️"
X.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.TextScaled = true
X.AutoButtonColor = true

local Spamming = false

-- Функция для выполнения команды
local function ExecuteCommand(code)
    if code == "" then return end
    local success, err = pcall(function()
        -- Прямое выполнение кода
        loadstring(code)()
    end)
    if not success then warn("Ошибка: "..err) end
end

-- Ввод один раз
EnterButton.MouseButton1Click:Connect(function()
    ExecuteCommand(T.Text)
end)

-- Спам
SpamButton.MouseButton1Click:Connect(function()
    if Spamming then
        Spamming = false
        SpamButton.Text = "Начать спам"
        return
    end
local code = T.Text
    local delayTime = tonumber(I.Text) or 0.1
    local countNum = tonumber(C.Text) or 1
    if code == "" then return end

    Spamming = true
    SpamButton.Text = "Остановить спам"

    task.spawn(function()
        for i = 1, countNum do
            if not Spamming then break end
            ExecuteCommand(code)
            task.wait(delayTime)
        end
        Spamming = false
        SpamButton.Text = "Начать спам"
    end)
end)

-- Очистка TextBox
ClearButton.MouseButton1Click:Connect(function()
    T.Text = ""
end)

-- Закрытие
X.MouseButton1Click:Connect(function()
    Spamming = false
    F:Destroy()
end)
