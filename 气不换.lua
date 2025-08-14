game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game) wait(0.2) game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
loadstring([==[local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel1 = Instance.new("TextLabel")
local TextLabel2 = Instance.new("TextLabel")
local TextLabel3 = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local PauseButton = Instance.new("TextButton")
local ServerCountLabel = Instance.new("TextLabel")

ScreenGui.Name = "AutoMoneyPrinterUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主框架
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(173, 216, 230)
Frame.BackgroundTransparency = 0.1
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

-- 第一行文字
TextLabel1.Name = "Line1"
TextLabel1.Parent = Frame
TextLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel1.BackgroundTransparency = 1
TextLabel1.Position = UDim2.new(0, 0, 0, 20)
TextLabel1.Size = UDim2.new(1, 0, 0.2, 0)
TextLabel1.Font = Enum.Font.SourceSansBold
TextLabel1.Text = "挂机助手 版本:儿子版(不换服)"
TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel1.TextSize = 20

-- 第二行文字
TextLabel2.Name = "Line2"
TextLabel2.Parent = Frame
TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Position = UDim2.new(0, 0, 0.4, 0)
TextLabel2.Size = UDim2.new(1, 0, 0.2, 0)
TextLabel2.Font = Enum.Font.SourceSans
TextLabel2.Text = "状态: 等待启动"
TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel2.TextSize = 18

-- 第三行文字
TextLabel3.Name = "Line3"
TextLabel3.Parent = Frame
TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Position = UDim2.new(0, 0, 0.7, 0)
TextLabel3.Size = UDim2.new(1, 0, 0.2, 0)
TextLabel3.Font = Enum.Font.SourceSans
TextLabel3.Text = "作者: BEN   我是Arlime爸爸"
TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel3.TextSize = 16

-- 开关按钮设置
ToggleButton.Name = "ToggleUIButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 150, 200)
ToggleButton.BackgroundTransparency = 0.1
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Size = UDim2.new(0, 100, 0, 30)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "隐藏UI"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14

-- 暂停/继续按钮设置
PauseButton.Name = "PauseButton"
PauseButton.Parent = ScreenGui
PauseButton.BackgroundColor3 = Color3.fromRGB(200, 100, 100)
PauseButton.BackgroundTransparency = 0.1
PauseButton.Position = UDim2.new(0, 120, 0, 10)
PauseButton.Size = UDim2.new(0, 100, 0, 30)
PauseButton.Font = Enum.Font.SourceSansBold
PauseButton.Text = "暂停脚本"
PauseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PauseButton.TextSize = 14

-- 服务器人数显示设置
ServerCountLabel.Name = "ServerCountLabel"
ServerCountLabel.Parent = ScreenGui
ServerCountLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ServerCountLabel.BackgroundTransparency = 0.5
ServerCountLabel.Position = UDim2.new(0, 10, 1, -70)
ServerCountLabel.Size = UDim2.new(0, 280, 0, 60)
ServerCountLabel.Font = Enum.Font.SourceSansBold
ServerCountLabel.Text = "服务器: 0/0"
ServerCountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerCountLabel.TextSize = 28
ServerCountLabel.TextXAlignment = Enum.TextXAlignment.Center

-- 添加按钮圆角
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 5)
ButtonCorner.Parent = ToggleButton

local ButtonCorner2 = Instance.new("UICorner")
ButtonCorner2.CornerRadius = UDim.new(0, 5)
ButtonCorner2.Parent = PauseButton

local ServerCountCorner = Instance.new("UICorner")
ServerCountCorner.CornerRadius = UDim.new(0, 5)
ServerCountCorner.Parent = ServerCountLabel

-- 更新UI状态的函数
local function updateUI(text)
    TextLabel2.Text = "状态: "..text
end

-- 更新服务器人数显示
local function updateServerCount()
    local players = game:GetService("Players")
    ServerCountLabel.Text = string.format("服务器: %d/%d", #players:GetPlayers(), players.MaxPlayers)
end

-- UI显示状态
local isUIVisible = true
-- 脚本运行状态
local isScriptRunning = true

-- 切换UI显示/隐藏的函数
local function toggleUI()
    isUIVisible = not isUIVisible
    Frame.Visible = isUIVisible
    ToggleButton.Text = isUIVisible and "隐藏UI" or "显示UI"
end

-- 切换脚本运行状态的函数
local function toggleScript()
    isScriptRunning = not isScriptRunning
    PauseButton.Text = isScriptRunning and "暂停脚本" or "继续脚本"
    PauseButton.BackgroundColor3 = isScriptRunning and Color3.fromRGB(200, 100, 100) or Color3.fromRGB(100, 200, 100)
    updateUI(isScriptRunning and "脚本已继续" or "脚本已暂停")
end

-- 绑定按钮点击事件
ToggleButton.MouseButton1Click:Connect(toggleUI)
PauseButton.MouseButton1Click:Connect(toggleScript)

-- 自动按E交互功能
local UserInputService = game:GetService("UserInputService")
local stopScript = false

-- 按P键停止脚本
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.P then
        stopScript = true
    end
end)

-- 自动按E的协程
local function autoPressE()
    while not stopScript do
        if isScriptRunning then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            wait(0.1)
        else
            wait(0.1)
        end
    end
end

-- 启动自动按E
coroutine.wrap(autoPressE)()

-- 以下是物品收集主脚本
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local scriptStartTime = os.time()
local forbiddenZoneCenter = Vector3.new(352.884155, 13.0287256, -1353.05396)
local forbiddenRadius = 80

-- 初始化角色位置
local epoh1 = CFrame.new(998.4656372070312, 15, 395.9789733886719)
HumanoidRootPart.CFrame = epoh1

-- 优先捡取的物品列表
local targetItems = {
    "Money Printer",
    "Blue Candy Cane",
    "Bunny Balloon",
    "Ghost Balloon",
    "Clover Balloon",
    "Bat Balloon",
    "Gold Clover Balloon",
    "Golden Rose",
    "Black Rose",
    "Heart Balloon",
}

local function ShowNotification(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "BEN HUB",
        Text = text,
        Duration = 5
    })
    updateUI(text)
end

-- 自动移动功能
local function autoMove()
    while true do
        if character and HumanoidRootPart and humanoid.Health > 0 and isScriptRunning then
            local moveDirection = HumanoidRootPart.CFrame.LookVector
            humanoid:Move(moveDirection)
        end
        task.wait(1)
    end
end

-- 启动自动移动
coroutine.wrap(autoMove)()

-- 物品检测函数
local function FindMoneyPrinters()
    local moneyPrinters = {}
    
    for _, itemFolder in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
        for _, item in pairs(itemFolder:GetChildren()) do
            if item:IsA("MeshPart") or item:IsA("Part") then
                local itemPos = item.Position
                local distance = (itemPos - forbiddenZoneCenter).Magnitude
                
                if distance > forbiddenRadius then
                    for _, child in pairs(item:GetChildren()) do
                        if child:IsA("ProximityPrompt") and child.ObjectText == "Money Printer" then
                            table.insert(moneyPrinters, {
                                item = item,
                                prompt = child
                            })
                        end
                    end
                end
            end
        end
    end
    
    return moneyPrinters
end

local function PickItem(item, prompt)
    local itemName = prompt.ObjectText
    ShowNotification("正在拾取: "..itemName)
    
    local startTime = tick()
    local timeout = 30
    local itemCollected = false
    
    prompt.RequiresLineOfSight = false
    prompt.HoldDuration = 0
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if not isScriptRunning then
            updateUI("脚本已暂停 - 拾取中断")
            return
        end
        
        if not item or not item.Parent then
            itemCollected = true
            connection:Disconnect()
            return
        end
        
        if tick() - startTime >= timeout then
            connection:Disconnect()
            item:Destroy()
            return
        end
        
        humanoid:Move(Vector3.new(1, 0, 0))
        HumanoidRootPart.CFrame = item.CFrame * CFrame.new(0, 2, 0)
        fireproximityprompt(prompt)
        
        updateUI("拾取中: "..itemName.." ("..math.floor(tick() - startTime).."秒)")
    end)
    
    repeat 
        task.wait(0.1) 
    until itemCollected or not item or not item.Parent or tick() - startTime >= timeout or not isScriptRunning
    
    if connection and connection.Connected then
        connection:Disconnect()
    end
    
    return itemCollected
end

local function AutoPickMoneyPrinter()
    ShowNotification("优先寻找物品...")
    
    local printers = FindMoneyPrinters()
    
    if #printers > 0 then
        local closestPrinter = nil
        local minDistance = math.huge
        
        for _, printerData in ipairs(printers) do
            local distance = (printerData.item.Position - HumanoidRootPart.Position).Magnitude
            if distance < minDistance then
                minDistance = distance
                closestPrinter = printerData
            end
        end
        
        if closestPrinter then
            return PickItem(closestPrinter.item, closestPrinter.prompt)
        end
    end
    
    return false
end

-- 创建服务器人数更新循环
coroutine.wrap(function()
    while true do
        updateServerCount()
        task.wait(1)
    end
end)()

-- 主循环
while true do
    character = player.Character or player.CharacterAdded:Wait()
    HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
    scriptStartTime = os.time()
    
    if isScriptRunning then
        local foundPrinter = AutoPickMoneyPrinter()
        
        if not foundPrinter then
            ShowNotification("没有找到物品，继续搜索...")
            task.wait(1)
        end
    else
        updateUI("脚本已暂停")
        task.wait(1)
    end
    
    task.wait(0.5)
end]==])()