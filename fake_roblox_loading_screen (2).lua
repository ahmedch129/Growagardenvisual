
-- Fake Roblox Loading Screen Lua Script

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FakeLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui") -- Use CoreGui to show for executor scripts

-- Create Frame (background)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderColor3 = Color3.fromRGB(201, 0, 0)
frame.BorderSizePixel = 3
frame.Parent = screenGui
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 0

-- Title TextLabel
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "ROBLOX LOADING..."
title.TextColor3 = Color3.fromRGB(201, 0, 0)
title.Font = Enum.Font.ArialBold
title.TextSize = 36
title.Parent = frame

-- Progress bar background
local progressBG = Instance.new("Frame")
progressBG.Size = UDim2.new(0.8, 0, 0, 25)
progressBG.Position = UDim2.new(0.1, 0, 0, 100)
progressBG.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
progressBG.BorderSizePixel = 1
progressBG.Parent = frame
progressBG.AnchorPoint = Vector2.new(0, 0)

-- Progress bar fill
local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(201, 0, 0)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBG

-- Status TextLabel
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 0, 30)
statusText.Position = UDim2.new(0, 0, 0, 140)
statusText.BackgroundTransparency = 1
statusText.TextColor3 = Color3.fromRGB(50, 50, 50)
statusText.Font = Enum.Font.ArialBold
statusText.TextSize = 24
statusText.Text = "Loading game assets..."
statusText.Parent = frame

-- Fake loading progress
local steps = {
    "Loading game assets...",
    "Connecting to servers...",
    "Initializing environment...",
    "Almost done...",
    "Please wait..."
}

local progressPercent = 0
local stepIndex = 1

local function updateProgress()
    if stepIndex <= #steps then
        statusText.Text = steps[stepIndex]
        progressPercent = stepIndex / #steps
        progressFill:TweenSize(UDim2.new(progressPercent, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1, true)
        stepIndex = stepIndex + 1
    else
        -- Finished, remove loading screen after delay
        wait(1)
        screenGui:Destroy()
    end
end

-- Run the loading steps every 2 seconds
while stepIndex <= #steps do
    updateProgress()
    wait(2)
end
