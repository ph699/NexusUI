--[[
    ╔═══════════════════════════════════════════════════════════╗
    ║              NexusUI Library v2.0                        ║
    ║         Professional Roblox UI Library                   ║
    ║    Android & PC Compatible | Beautiful Aesthetics        ║
    ╚═══════════════════════════════════════════════════════════╝
    
    USAGE EXAMPLE:
    
    local NexusUI = loadstring(game:HttpGet("URL_HERE"))()
    
    local Window = NexusUI:CreateWindow({
        Title = "My Script",
        SubTitle = "by Developer",
        Theme = "Dark",   -- "Dark", "Light", "Ocean", "Sunset", "Forest"
        Logo = "rbxassetid://7733960981",
        KeySystem = false,
    })
    
    local Tab = Window:AddTab({ Name = "Main", Icon = "🏠" })
    
    Tab:AddButton({
        Name = "Click Me",
        Description = "A simple button",
        Callback = function() print("Clicked!") end
    })
    
    Tab:AddToggle({
        Name = "Enable Feature",
        Default = false,
        Callback = function(val) print(val) end
    })
    
    Tab:AddSlider({
        Name = "Speed",
        Min = 0, Max = 100, Default = 50,
        Callback = function(val) print(val) end
    })
    
    Tab:AddDropdown({
        Name = "Select Item",
        Options = {"Option 1", "Option 2", "Option 3"},
        Default = "Option 1",
        Callback = function(val) print(val) end
    })
    
    Tab:AddInput({
        Name = "Text Input",
        PlaceHolder = "Type here...",
        Callback = function(val) print(val) end
    })
    
    Tab:AddLabel({ Text = "Hello World!" })
    
    Tab:AddDivider()
    
    Tab:AddColorPicker({
        Name = "Pick Color",
        Default = Color3.fromRGB(255, 100, 50),
        Callback = function(col) print(col) end
    })
    
    NexusUI:Notification({
        Title = "Welcome!",
        Message = "Script loaded successfully.",
        Duration = 5,
        Type = "Success"  -- "Success", "Error", "Info", "Warning"
    })
]]

-- ═══════════════════════════════════════
--           NEXUS UI LIBRARY
-- ═══════════════════════════════════════

local NexusUI = {}
NexusUI.__index = NexusUI

-- ─── Services ───────────────────────────
local Players            = game:GetService("Players")
local TweenService       = game:GetService("TweenService")
local UserInputService   = game:GetService("UserInputService")
local RunService         = game:GetService("RunService")
local CoreGui            = game:GetService("CoreGui")
local HttpService        = game:GetService("HttpService")

local LocalPlayer        = Players.LocalPlayer
local Mouse              = LocalPlayer:GetMouse()

-- ─── Device Detection ───────────────────
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- ─── Themes ─────────────────────────────
local Themes = {
    Dark = {
        Background      = Color3.fromRGB(15, 15, 20),
        Secondary       = Color3.fromRGB(22, 22, 30),
        Tertiary        = Color3.fromRGB(30, 30, 42),
        Accent          = Color3.fromRGB(99, 102, 241),
        AccentHover     = Color3.fromRGB(129, 132, 255),
        AccentDark      = Color3.fromRGB(67, 56, 202),
        Text            = Color3.fromRGB(240, 240, 255),
        TextSecondary   = Color3.fromRGB(160, 160, 190),
        TextDisabled    = Color3.fromRGB(90, 90, 110),
        Border          = Color3.fromRGB(50, 50, 70),
        Success         = Color3.fromRGB(52, 211, 153),
        Error           = Color3.fromRGB(248, 113, 113),
        Warning         = Color3.fromRGB(251, 191, 36),
        Info            = Color3.fromRGB(96, 165, 250),
        Shadow          = Color3.fromRGB(0, 0, 0),
        ButtonBg        = Color3.fromRGB(35, 35, 50),
        ButtonHover     = Color3.fromRGB(50, 50, 72),
        ToggleOn        = Color3.fromRGB(99, 102, 241),
        ToggleOff       = Color3.fromRGB(55, 55, 75),
        SliderFill      = Color3.fromRGB(99, 102, 241),
        SliderBg        = Color3.fromRGB(40, 40, 58),
        InputBg         = Color3.fromRGB(28, 28, 40),
        ScrollBar       = Color3.fromRGB(70, 70, 100),
        TabActive       = Color3.fromRGB(99, 102, 241),
        TabInactive     = Color3.fromRGB(35, 35, 50),
        NotifBg         = Color3.fromRGB(25, 25, 35),
    },
    Ocean = {
        Background      = Color3.fromRGB(10, 20, 35),
        Secondary       = Color3.fromRGB(15, 30, 50),
        Tertiary        = Color3.fromRGB(20, 40, 65),
        Accent          = Color3.fromRGB(0, 188, 212),
        AccentHover     = Color3.fromRGB(0, 229, 255),
        AccentDark      = Color3.fromRGB(0, 131, 148),
        Text            = Color3.fromRGB(220, 240, 255),
        TextSecondary   = Color3.fromRGB(140, 180, 220),
        TextDisabled    = Color3.fromRGB(70, 110, 150),
        Border          = Color3.fromRGB(30, 60, 90),
        Success         = Color3.fromRGB(52, 211, 153),
        Error           = Color3.fromRGB(248, 113, 113),
        Warning         = Color3.fromRGB(251, 191, 36),
        Info            = Color3.fromRGB(96, 165, 250),
        Shadow          = Color3.fromRGB(0, 0, 0),
        ButtonBg        = Color3.fromRGB(20, 45, 70),
        ButtonHover     = Color3.fromRGB(30, 60, 90),
        ToggleOn        = Color3.fromRGB(0, 188, 212),
        ToggleOff       = Color3.fromRGB(25, 50, 75),
        SliderFill      = Color3.fromRGB(0, 188, 212),
        SliderBg        = Color3.fromRGB(20, 45, 70),
        InputBg         = Color3.fromRGB(15, 35, 55),
        ScrollBar       = Color3.fromRGB(50, 100, 140),
        TabActive       = Color3.fromRGB(0, 188, 212),
        TabInactive     = Color3.fromRGB(20, 45, 70),
        NotifBg         = Color3.fromRGB(15, 30, 48),
    },
    Sunset = {
        Background      = Color3.fromRGB(20, 12, 20),
        Secondary       = Color3.fromRGB(30, 18, 30),
        Tertiary        = Color3.fromRGB(42, 25, 42),
        Accent          = Color3.fromRGB(236, 72, 153),
        AccentHover     = Color3.fromRGB(255, 110, 190),
        AccentDark      = Color3.fromRGB(157, 23, 77),
        Text            = Color3.fromRGB(255, 235, 245),
        TextSecondary   = Color3.fromRGB(200, 160, 190),
        TextDisabled    = Color3.fromRGB(100, 70, 100),
        Border          = Color3.fromRGB(65, 35, 65),
        Success         = Color3.fromRGB(52, 211, 153),
        Error           = Color3.fromRGB(248, 113, 113),
        Warning         = Color3.fromRGB(251, 191, 36),
        Info            = Color3.fromRGB(96, 165, 250),
        Shadow          = Color3.fromRGB(0, 0, 0),
        ButtonBg        = Color3.fromRGB(48, 28, 48),
        ButtonHover     = Color3.fromRGB(65, 38, 65),
        ToggleOn        = Color3.fromRGB(236, 72, 153),
        ToggleOff       = Color3.fromRGB(55, 30, 55),
        SliderFill      = Color3.fromRGB(236, 72, 153),
        SliderBg        = Color3.fromRGB(45, 25, 45),
        InputBg         = Color3.fromRGB(35, 20, 35),
        ScrollBar       = Color3.fromRGB(100, 50, 100),
        TabActive       = Color3.fromRGB(236, 72, 153),
        TabInactive     = Color3.fromRGB(45, 25, 45),
        NotifBg         = Color3.fromRGB(28, 16, 28),
    },
    Forest = {
        Background      = Color3.fromRGB(12, 20, 15),
        Secondary       = Color3.fromRGB(18, 30, 22),
        Tertiary        = Color3.fromRGB(25, 42, 30),
        Accent          = Color3.fromRGB(52, 211, 100),
        AccentHover     = Color3.fromRGB(80, 240, 130),
        AccentDark      = Color3.fromRGB(22, 130, 55),
        Text            = Color3.fromRGB(220, 250, 230),
        TextSecondary   = Color3.fromRGB(150, 200, 165),
        TextDisabled    = Color3.fromRGB(70, 110, 85),
        Border          = Color3.fromRGB(35, 65, 45),
        Success         = Color3.fromRGB(52, 211, 153),
        Error           = Color3.fromRGB(248, 113, 113),
        Warning         = Color3.fromRGB(251, 191, 36),
        Info            = Color3.fromRGB(96, 165, 250),
        Shadow          = Color3.fromRGB(0, 0, 0),
        ButtonBg        = Color3.fromRGB(25, 45, 32),
        ButtonHover     = Color3.fromRGB(35, 62, 45),
        ToggleOn        = Color3.fromRGB(52, 211, 100),
        ToggleOff       = Color3.fromRGB(30, 55, 38),
        SliderFill      = Color3.fromRGB(52, 211, 100),
        SliderBg        = Color3.fromRGB(22, 42, 30),
        InputBg         = Color3.fromRGB(18, 35, 24),
        ScrollBar       = Color3.fromRGB(55, 110, 70),
        TabActive       = Color3.fromRGB(52, 211, 100),
        TabInactive     = Color3.fromRGB(25, 48, 34),
        NotifBg         = Color3.fromRGB(15, 28, 20),
    },
    Light = {
        Background      = Color3.fromRGB(245, 245, 255),
        Secondary       = Color3.fromRGB(235, 235, 248),
        Tertiary        = Color3.fromRGB(220, 220, 240),
        Accent          = Color3.fromRGB(99, 102, 241),
        AccentHover     = Color3.fromRGB(79, 82, 221),
        AccentDark      = Color3.fromRGB(55, 48, 163),
        Text            = Color3.fromRGB(20, 20, 40),
        TextSecondary   = Color3.fromRGB(80, 80, 120),
        TextDisabled    = Color3.fromRGB(160, 160, 200),
        Border          = Color3.fromRGB(200, 200, 225),
        Success         = Color3.fromRGB(16, 185, 129),
        Error           = Color3.fromRGB(220, 38, 38),
        Warning         = Color3.fromRGB(217, 119, 6),
        Info            = Color3.fromRGB(59, 130, 246),
        Shadow          = Color3.fromRGB(0, 0, 0),
        ButtonBg        = Color3.fromRGB(228, 228, 245),
        ButtonHover     = Color3.fromRGB(210, 210, 235),
        ToggleOn        = Color3.fromRGB(99, 102, 241),
        ToggleOff       = Color3.fromRGB(200, 200, 220),
        SliderFill      = Color3.fromRGB(99, 102, 241),
        SliderBg        = Color3.fromRGB(210, 210, 235),
        InputBg         = Color3.fromRGB(235, 235, 252),
        ScrollBar       = Color3.fromRGB(170, 170, 210),
        TabActive       = Color3.fromRGB(99, 102, 241),
        TabInactive     = Color3.fromRGB(220, 220, 240),
        NotifBg         = Color3.fromRGB(240, 240, 255),
    },
}

-- ─── Utility Functions ──────────────────
local function Tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

local function FastTween(obj, t, props)
    Tween(obj, TweenInfo.new(t, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props)
end

local function SpringTween(obj, t, props)
    Tween(obj, TweenInfo.new(t, Enum.EasingStyle.Back, Enum.EasingDirection.Out), props)
end

local function MakeShadow(parent, size, transparency)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5554236805"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = transparency or 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.Size = UDim2.new(1, size or 15, 1, size or 15)
    shadow.Position = UDim2.new(0, -(size or 15) / 2, 0, -(size or 15) / 2)
    shadow.ZIndex = parent.ZIndex - 1
    shadow.Parent = parent
    return shadow
end

local function MakeCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = parent
    return corner
end

local function MakeStroke(parent, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0
    stroke.Parent = parent
    return stroke
end

local function MakeGradient(parent, colorList, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new(colorList)
    gradient.Rotation = rotation or 90
    gradient.Parent = parent
    return gradient
end

local function MakePadding(parent, top, bottom, left, right)
    local padding = Instance.new("UIPadding")
    padding.PaddingTop    = UDim.new(0, top    or 0)
    padding.PaddingBottom = UDim.new(0, bottom or 0)
    padding.PaddingLeft   = UDim.new(0, left   or 0)
    padding.PaddingRight  = UDim.new(0, right  or 0)
    padding.Parent        = parent
    return padding
end

local function MakeListLayout(parent, padding, sortOrder, fillDir)
    local layout = Instance.new("UIListLayout")
    layout.Padding         = UDim.new(0, padding or 6)
    layout.SortOrder       = sortOrder or Enum.SortOrder.LayoutOrder
    layout.FillDirection   = fillDir or Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Parent          = parent
    return layout
end

local function AutoSize(frame, layout, padding)
    layout.Changed:Connect(function()
        frame.Size = UDim2.new(1, 0, 0, layout.AbsoluteContentSize.Y + (padding or 10))
    end)
end

local function RippleEffect(button, theme, x, y)
    local ripple = Instance.new("Frame")
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0, x - button.AbsolutePosition.X, 0, y - button.AbsolutePosition.Y)
    ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ripple.BackgroundTransparency = 0.7
    ripple.BorderSizePixel = 0
    ripple.ZIndex = button.ZIndex + 10
    ripple.ClipsDescendants = false
    ripple.Parent = button
    MakeCorner(ripple, 999)

    local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 2.5
    Tween(ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, size, 0, size),
        Position = UDim2.new(0.5, -size/2, 0.5, -size/2),
        BackgroundTransparency = 1,
    })

    task.delay(0.5, function()
        ripple:Destroy()
    end)
end

-- ═══════════════════════════════════════
--           MAIN LIBRARY LOGIC
-- ═══════════════════════════════════════

NexusUI._notifications = {}
NexusUI._windows = {}
NexusUI._theme = Themes.Dark

function NexusUI:SetTheme(name)
    self._theme = Themes[name] or Themes.Dark
end

-- ─── Notification System ────────────────
function NexusUI:Notification(config)
    local theme = self._theme
    local title    = config.Title   or "Notification"
    local message  = config.Message or ""
    local duration = config.Duration or 4
    local nType    = config.Type    or "Info"

    local typeColors = {
        Success = theme.Success,
        Error   = theme.Error,
        Warning = theme.Warning,
        Info    = theme.Accent,
    }
    local typeIcons = {
        Success = "✓",
        Error   = "✕",
        Warning = "⚠",
        Info    = "ℹ",
    }

    local accentColor = typeColors[nType] or theme.Accent
    local icon = typeIcons[nType] or "ℹ"

    -- Find or create notification container
    local screenGui = CoreGui:FindFirstChild("NexusUI_Notifications")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "NexusUI_Notifications"
        screenGui.ResetOnSpawn = false
        screenGui.DisplayOrder = 999
        screenGui.IgnoreGuiInset = true
        screenGui.Parent = CoreGui
    end

    local container = screenGui:FindFirstChild("NotifContainer")
    if not container then
        container = Instance.new("Frame")
        container.Name = "NotifContainer"
        container.BackgroundTransparency = 1
        container.Size = UDim2.new(0, isMobile and 320 or 360, 1, 0)
        container.Position = UDim2.new(1, -(isMobile and 330 or 370), 0, 10)
        container.Parent = screenGui
        MakeListLayout(container, 8, Enum.SortOrder.LayoutOrder, Enum.FillDirection.Vertical)
    end

    -- Notification Frame
    local notif = Instance.new("Frame")
    notif.Name = "Notif_" .. os.clock()
    notif.BackgroundColor3 = theme.NotifBg
    notif.BorderSizePixel = 0
    notif.Size = UDim2.new(1, 0, 0, 0)
    notif.ClipsDescendants = true
    notif.Parent = container
    MakeCorner(notif, 12)
    MakeStroke(notif, accentColor, 1, 0.3)
    MakeShadow(notif, 20, 0.6)

    -- Left accent bar
    local accentBar = Instance.new("Frame")
    accentBar.Name = "AccentBar"
    accentBar.BackgroundColor3 = accentColor
    accentBar.BorderSizePixel = 0
    accentBar.Size = UDim2.new(0, 4, 1, 0)
    accentBar.Position = UDim2.new(0, 0, 0, 0)
    accentBar.Parent = notif
    MakeCorner(accentBar, 4)

    -- Icon circle
    local iconCircle = Instance.new("Frame")
    iconCircle.Name = "IconCircle"
    iconCircle.BackgroundColor3 = accentColor
    iconCircle.BackgroundTransparency = 0.8
    iconCircle.Size = UDim2.new(0, 32, 0, 32)
    iconCircle.Position = UDim2.new(0, 14, 0.5, -16)
    iconCircle.BorderSizePixel = 0
    iconCircle.Parent = notif
    MakeCorner(iconCircle, 999)

    local iconLabel = Instance.new("TextLabel")
    iconLabel.BackgroundTransparency = 1
    iconLabel.Size = UDim2.new(1, 0, 1, 0)
    iconLabel.Text = icon
    iconLabel.TextColor3 = accentColor
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = iconCircle

    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 56, 0, 10)
    titleLabel.Size = UDim2.new(1, -70, 0, 18)
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.Text
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.Parent = notif

    -- Message
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.BackgroundTransparency = 1
    msgLabel.Position = UDim2.new(0, 56, 0, 30)
    msgLabel.Size = UDim2.new(1, -70, 0, 30)
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.TextSize = 12
    msgLabel.TextWrapped = true
    msgLabel.Parent = notif

    -- Progress bar
    local progressBg = Instance.new("Frame")
    progressBg.BackgroundColor3 = theme.Border
    progressBg.BorderSizePixel = 0
    progressBg.Position = UDim2.new(0, 0, 1, -3)
    progressBg.Size = UDim2.new(1, 0, 0, 3)
    progressBg.Parent = notif
    MakeCorner(progressBg, 2)

    local progressFill = Instance.new("Frame")
    progressFill.BackgroundColor3 = accentColor
    progressFill.BorderSizePixel = 0
    progressFill.Size = UDim2.new(1, 0, 1, 0)
    progressFill.Parent = progressBg
    MakeCorner(progressFill, 2)

    -- Animate in
    local targetHeight = 74
    FastTween(notif, 0.3, { Size = UDim2.new(1, 0, 0, targetHeight) })
    Tween(progressFill, TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 0, 1, 0)
    })

    -- Close on click
    notif.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            FastTween(notif, 0.3, { Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1 })
            task.delay(0.3, function() notif:Destroy() end)
        end
    end)

    task.delay(duration, function()
        if notif and notif.Parent then
            FastTween(notif, 0.3, { Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1 })
            task.delay(0.3, function() if notif.Parent then notif:Destroy() end end)
        end
    end)
end

-- ═══════════════════════════════════════
--           WINDOW CREATION
-- ═══════════════════════════════════════
function NexusUI:CreateWindow(config)
    local theme = self._theme
    if config.Theme then
        theme = Themes[config.Theme] or Themes.Dark
        self._theme = theme
    end

    local title    = config.Title    or "NexusUI"
    local subTitle = config.SubTitle or "Script Hub"
    local logo     = config.Logo     or nil
    local KeySystem = config.KeySystem or false
    local Key       = config.Key      or nil

    -- ─── Screen GUI ─────────────────────
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NexusUI_" .. title
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 100
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = CoreGui

    -- ─── Main Window ────────────────────
    local winWidth  = isMobile and 340 or 560
    local winHeight = isMobile and 480 or 420

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainWindow"
    mainFrame.BackgroundColor3 = theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Size = UDim2.new(0, winWidth, 0, winHeight)
    mainFrame.Position = UDim2.new(0.5, -winWidth/2, 0.5, -winHeight/2)
    mainFrame.ClipsDescendants = false
    mainFrame.Parent = screenGui
    MakeCorner(mainFrame, 14)
    MakeStroke(mainFrame, theme.Border, 1, 0)
    MakeShadow(mainFrame, 30, 0.45)

    -- Subtle background gradient
    MakeGradient(mainFrame, {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(
            math.clamp(theme.Background.R * 255 + 6, 0, 255),
            math.clamp(theme.Background.G * 255 + 6, 0, 255),
            math.clamp(theme.Background.B * 255 + 8, 0, 255)
        )),
        ColorSequenceKeypoint.new(1, theme.Background),
    }, 135)

    -- ─── Title Bar ──────────────────────
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.BackgroundColor3 = theme.Secondary
    titleBar.BorderSizePixel = 0
    titleBar.Size = UDim2.new(1, 0, 0, isMobile and 52 or 48)
    titleBar.Parent = mainFrame
    MakeCorner(titleBar, 14)

    -- Bottom square for titleBar
    local titleBarBottom = Instance.new("Frame")
    titleBarBottom.BackgroundColor3 = theme.Secondary
    titleBarBottom.BorderSizePixel = 0
    titleBarBottom.Size = UDim2.new(1, 0, 0, 14)
    titleBarBottom.Position = UDim2.new(0, 0, 1, -14)
    titleBarBottom.Parent = titleBar

    -- Logo or icon
    local logoOffset = 14
    if logo then
        local logoImg = Instance.new("ImageLabel")
        logoImg.Name = "Logo"
        logoImg.BackgroundTransparency = 1
        logoImg.Image = logo
        logoImg.Size = UDim2.new(0, isMobile and 28 or 26, 0, isMobile and 28 or 26)
        logoImg.Position = UDim2.new(0, 14, 0.5, -(isMobile and 14 or 13))
        logoImg.Parent = titleBar
        logoOffset = isMobile and 50 or 46
    else
        -- Colored dot accent
        local dot = Instance.new("Frame")
        dot.BackgroundColor3 = theme.Accent
        dot.Size = UDim2.new(0, 10, 0, 10)
        dot.Position = UDim2.new(0, 14, 0.5, -5)
        dot.BorderSizePixel = 0
        dot.Parent = titleBar
        MakeCorner(dot, 999)
        logoOffset = 32
    end

    -- Title text
    local titleText = Instance.new("TextLabel")
    titleText.BackgroundTransparency = 1
    titleText.Position = UDim2.new(0, logoOffset + 4, 0, 0)
    titleText.Size = UDim2.new(1, -(logoOffset + 90), 1, 0)
    titleText.Text = title
    titleText.TextColor3 = theme.Text
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = isMobile and 14 or 14
    titleText.Parent = titleBar

    -- Subtitle
    local subText = Instance.new("TextLabel")
    subText.BackgroundTransparency = 1
    subText.Position = UDim2.new(0, logoOffset + 4, 0.5, 1)
    subText.Size = UDim2.new(1, -(logoOffset + 90), 0.5, 0)
    subText.Text = subTitle
    subText.TextColor3 = theme.TextSecondary
    subText.TextXAlignment = Enum.TextXAlignment.Left
    subText.Font = Enum.Font.Gotham
    subText.TextSize = 10
    subText.Parent = titleBar

    -- ─── Window Controls ────────────────
    local controlsFrame = Instance.new("Frame")
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.Size = UDim2.new(0, 70, 0, 30)
    controlsFrame.Position = UDim2.new(1, -76, 0.5, -15)
    controlsFrame.Parent = titleBar

    -- Minimize button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "Minimize"
    minimizeBtn.BackgroundColor3 = theme.Warning
    minimizeBtn.Size = UDim2.new(0, 12, 0, 12)
    minimizeBtn.Position = UDim2.new(0, 0, 0.5, -6)
    minimizeBtn.Text = ""
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Parent = controlsFrame
    MakeCorner(minimizeBtn, 999)

    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.BackgroundColor3 = theme.Error
    closeBtn.Size = UDim2.new(0, 12, 0, 12)
    closeBtn.Position = UDim2.new(0, 18, 0.5, -6)
    closeBtn.Text = ""
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = controlsFrame
    MakeCorner(closeBtn, 999)

    -- Fullscreen button (mobile show icon)
    local fsBtn = Instance.new("TextButton")
    fsBtn.Name = "Fullscreen"
    fsBtn.BackgroundColor3 = theme.Success
    fsBtn.Size = UDim2.new(0, 12, 0, 12)
    fsBtn.Position = UDim2.new(0, 36, 0.5, -6)
    fsBtn.Text = ""
    fsBtn.BorderSizePixel = 0
    fsBtn.Parent = controlsFrame
    MakeCorner(fsBtn, 999)

    -- ─── Content Area ───────────────────
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.BackgroundTransparency = 1
    contentArea.Size = UDim2.new(1, 0, 1, -(isMobile and 52 or 48))
    contentArea.Position = UDim2.new(0, 0, 0, isMobile and 52 or 48)
    contentArea.Parent = mainFrame

    -- ─── Sidebar (Tab list) ─────────────
    local sidebarWidth = isMobile and 90 or 110

    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.BackgroundColor3 = theme.Secondary
    sidebar.BorderSizePixel = 0
    sidebar.Size = UDim2.new(0, sidebarWidth, 1, 0)
    sidebar.Parent = contentArea

    -- Bottom-left corner for sidebar
    local sidebarCorner = Instance.new("Frame")
    sidebarCorner.BackgroundColor3 = theme.Secondary
    sidebarCorner.BorderSizePixel = 0
    sidebarCorner.Size = UDim2.new(0, 14, 0, 14)
    sidebarCorner.Position = UDim2.new(0, 0, 1, -14)
    sidebarCorner.Parent = sidebar

    -- Tab list container
    local tabList = Instance.new("ScrollingFrame")
    tabList.Name = "TabList"
    tabList.BackgroundTransparency = 1
    tabList.BorderSizePixel = 0
    tabList.Size = UDim2.new(1, 0, 1, -10)
    tabList.Position = UDim2.new(0, 0, 0, 8)
    tabList.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabList.ScrollBarThickness = 2
    tabList.ScrollBarImageColor3 = theme.ScrollBar
    tabList.Parent = sidebar
    local tabListLayout = MakeListLayout(tabList, 4)
    MakePadding(tabList, 4, 4, 6, 6)
    AutoSize(tabList, tabListLayout, 20)

    -- Sidebar border
    local sidebarBorder = Instance.new("Frame")
    sidebarBorder.BackgroundColor3 = theme.Border
    sidebarBorder.BorderSizePixel = 0
    sidebarBorder.Size = UDim2.new(0, 1, 1, 0)
    sidebarBorder.Position = UDim2.new(1, 0, 0, 0)
    sidebarBorder.Parent = sidebar

    -- ─── Page Container ─────────────────
    local pageContainer = Instance.new("Frame")
    pageContainer.Name = "PageContainer"
    pageContainer.BackgroundTransparency = 1
    pageContainer.Size = UDim2.new(1, -sidebarWidth, 1, 0)
    pageContainer.Position = UDim2.new(0, sidebarWidth, 0, 0)
    pageContainer.ClipsDescendants = true
    pageContainer.Parent = contentArea

    -- ─── Drag Logic ─────────────────────
    local dragging, dragInput, dragStart, startPos
    local function updateDrag(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)

    -- ─── Minimize/Close Animations ──────
    local isMinimized = false
    local originalSize = mainFrame.Size

    minimizeBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            FastTween(mainFrame, 0.3, { Size = UDim2.new(0, winWidth, 0, isMobile and 52 or 48) })
        else
            FastTween(mainFrame, 0.3, { Size = originalSize })
        end
    end)

    closeBtn.MouseButton1Click:Connect(function()
        FastTween(mainFrame, 0.4, { Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1 })
        task.delay(0.4, function() screenGui:Destroy() end)
    end)

    -- ─── Window Object ──────────────────
    local WindowObj = {}
    WindowObj._tabs = {}
    WindowObj._activeTab = nil
    WindowObj._theme = theme

    -- ═══════════════════════════════════
    --         ADD TAB FUNCTION
    -- ═══════════════════════════════════
    function WindowObj:AddTab(tabConfig)
        local tabName = tabConfig.Name or "Tab"
        local tabIcon = tabConfig.Icon or ""

        -- ─── Sidebar Tab Button ──────────
        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = "Tab_" .. tabName
        tabBtn.BackgroundColor3 = theme.TabInactive
        tabBtn.BorderSizePixel = 0
        tabBtn.Size = UDim2.new(1, 0, 0, isMobile and 50 or 44)
        tabBtn.Text = ""
        tabBtn.AutoButtonColor = false
        tabBtn.Parent = tabList
        MakeCorner(tabBtn, 10)

        -- Tab icon
        if tabIcon ~= "" then
            local iconLbl = Instance.new("TextLabel")
            iconLbl.BackgroundTransparency = 1
            iconLbl.Size = UDim2.new(1, 0, 0, isMobile and 20 or 18)
            iconLbl.Position = UDim2.new(0, 0, 0, isMobile and 6 or 5)
            iconLbl.Text = tabIcon
            iconLbl.TextColor3 = theme.TextSecondary
            iconLbl.Font = Enum.Font.GothamBold
            iconLbl.TextSize = isMobile and 16 or 14
            iconLbl.Name = "Icon"
            iconLbl.Parent = tabBtn

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Size = UDim2.new(1, -4, 0, isMobile and 16 or 14)
            nameLbl.Position = UDim2.new(0, 2, 1, isMobile and -22 or -18)
            nameLbl.Text = tabName
            nameLbl.TextColor3 = theme.TextSecondary
            nameLbl.Font = Enum.Font.Gotham
            nameLbl.TextSize = isMobile and 10 or 9
            nameLbl.Name = "Label"
            nameLbl.Parent = tabBtn
        else
            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Size = UDim2.new(1, -4, 1, 0)
            nameLbl.Position = UDim2.new(0, 2, 0, 0)
            nameLbl.Text = tabName
            nameLbl.TextColor3 = theme.TextSecondary
            nameLbl.Font = Enum.Font.Gotham
            nameLbl.TextSize = isMobile and 11 or 10
            nameLbl.TextWrapped = true
            nameLbl.Name = "Label"
            nameLbl.Parent = tabBtn
        end

        -- Active indicator bar
        local activeBar = Instance.new("Frame")
        activeBar.BackgroundColor3 = theme.Accent
        activeBar.BorderSizePixel = 0
        activeBar.Size = UDim2.new(0, 3, 0, 0)
        activeBar.Position = UDim2.new(0, 0, 0.5, 0)
        activeBar.Parent = tabBtn
        MakeCorner(activeBar, 2)

        -- ─── Tab Page (ScrollingFrame) ───
        local page = Instance.new("ScrollingFrame")
        page.Name = "Page_" .. tabName
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.Size = UDim2.new(1, 0, 1, 0)
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        page.ScrollBarThickness = 3
        page.ScrollBarImageColor3 = theme.ScrollBar
        page.Visible = false
        page.Parent = pageContainer
        MakePadding(page, 8, 8, 10, 10)

        local pageLayout = MakeListLayout(page, 6)
        AutoSize(page, pageLayout, 20)

        -- ─── Tab Object ─────────────────
        local TabObj = {}
        TabObj._page = page
        TabObj._theme = theme
        TabObj._layoutOrder = 0

        local function nextOrder()
            TabObj._layoutOrder = TabObj._layoutOrder + 1
            return TabObj._layoutOrder
        end

        -- Activate tab function
        local function activate()
            -- Deactivate all tabs
            for _, t in pairs(WindowObj._tabs) do
                FastTween(t._btn, 0.2, { BackgroundColor3 = theme.TabInactive })
                FastTween(t._bar, 0.2, { Size = UDim2.new(0, 3, 0, 0), Position = UDim2.new(0, 0, 0.5, 0) })
                if t._icon then FastTween(t._icon, 0.2, { TextColor3 = theme.TextSecondary }) end
                if t._label then FastTween(t._label, 0.2, { TextColor3 = theme.TextSecondary }) end
                t._page.Visible = false
            end
            -- Activate this tab
            FastTween(tabBtn, 0.2, { BackgroundColor3 = theme.TabActive })
            FastTween(activeBar, 0.2, { Size = UDim2.new(0, 3, 0.6, 0), Position = UDim2.new(0, 0, 0.2, 0) })
            local iconEl = tabBtn:FindFirstChild("Icon")
            local labelEl = tabBtn:FindFirstChild("Label")
            if iconEl  then FastTween(iconEl,  0.2, { TextColor3 = theme.Text }) end
            if labelEl then FastTween(labelEl, 0.2, { TextColor3 = theme.Text }) end
            page.Visible = true
            WindowObj._activeTab = TabObj
        end

        TabObj._btn   = tabBtn
        TabObj._bar   = activeBar
        TabObj._icon  = tabBtn:FindFirstChild("Icon")
        TabObj._label = tabBtn:FindFirstChild("Label")
        TabObj.Activate = activate

        tabBtn.MouseButton1Click:Connect(function()
            RippleEffect(tabBtn, theme, Mouse.X, Mouse.Y)
            activate()
        end)
        tabBtn.TouchTap:Connect(function(positions)
            activate()
        end)

        table.insert(WindowObj._tabs, TabObj)

        -- Activate first tab
        if #WindowObj._tabs == 1 then
            activate()
        end

        -- ═══════════════════════════════
        --        UI ELEMENTS
        -- ═══════════════════════════════

        -- ─── Helper: Create Element Frame
        local function ElementFrame(height)
            local frame = Instance.new("Frame")
            frame.BackgroundColor3 = theme.ButtonBg
            frame.BorderSizePixel = 0
            frame.Size = UDim2.new(1, 0, 0, height or 44)
            frame.LayoutOrder = nextOrder()
            frame.Parent = page
            MakeCorner(frame, 10)
            MakeStroke(frame, theme.Border, 1, 0.5)
            return frame
        end

        -- ─────────────────────────────────
        --           BUTTON
        -- ─────────────────────────────────
        function TabObj:AddButton(btnConfig)
            local name  = btnConfig.Name or "Button"
            local desc  = btnConfig.Description or nil
            local cb    = btnConfig.Callback or function() end
            local icon  = btnConfig.Icon or nil

            local height = desc and 52 or 42
            local frame = ElementFrame(height)
            frame.ClipsDescendants = true

            -- Left accent
            local lbar = Instance.new("Frame")
            lbar.BackgroundColor3 = theme.Accent
            lbar.BackgroundTransparency = 0.6
            lbar.BorderSizePixel = 0
            lbar.Size = UDim2.new(0, 3, 0.6, 0)
            lbar.Position = UDim2.new(0, 0, 0.2, 0)
            lbar.Parent = frame
            MakeCorner(lbar, 2)

            local xOffset = 14
            if icon then
                local iconLbl = Instance.new("TextLabel")
                iconLbl.BackgroundTransparency = 1
                iconLbl.Size = UDim2.new(0, 24, 0, 24)
                iconLbl.Position = UDim2.new(0, 10, 0.5, -12)
                iconLbl.Text = icon
                iconLbl.Font = Enum.Font.GothamBold
                iconLbl.TextSize = 16
                iconLbl.TextColor3 = theme.Accent
                iconLbl.Parent = frame
                xOffset = 40
            end

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Position = UDim2.new(0, xOffset, 0, desc and 8 or 0)
            nameLbl.Size = UDim2.new(1, -(xOffset + 40), desc and 0 or 1, desc and 18 or 0)
            nameLbl.Text = name
            nameLbl.TextColor3 = theme.Text
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.Font = Enum.Font.GothamSemibold
            nameLbl.TextSize = 13
            nameLbl.Parent = frame

            if desc then
                local descLbl = Instance.new("TextLabel")
                descLbl.BackgroundTransparency = 1
                descLbl.Position = UDim2.new(0, xOffset, 0, 28)
                descLbl.Size = UDim2.new(1, -(xOffset + 10), 0, 16)
                descLbl.Text = desc
                descLbl.TextColor3 = theme.TextSecondary
                descLbl.TextXAlignment = Enum.TextXAlignment.Left
                descLbl.Font = Enum.Font.Gotham
                descLbl.TextSize = 11
                descLbl.Parent = frame
            end

            -- Arrow icon
            local arrowLbl = Instance.new("TextLabel")
            arrowLbl.BackgroundTransparency = 1
            arrowLbl.Size = UDim2.new(0, 24, 0, 24)
            arrowLbl.Position = UDim2.new(1, -30, 0.5, -12)
            arrowLbl.Text = "›"
            arrowLbl.Font = Enum.Font.GothamBold
            arrowLbl.TextSize = 18
            arrowLbl.TextColor3 = theme.Accent
            arrowLbl.Parent = frame

            local btn = Instance.new("TextButton")
            btn.BackgroundTransparency = 1
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""
            btn.Parent = frame

            -- Hover
            btn.MouseEnter:Connect(function()
                FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonHover })
            end)
            btn.MouseLeave:Connect(function()
                FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonBg })
            end)

            btn.MouseButton1Click:Connect(function()
                RippleEffect(frame, theme, Mouse.X, Mouse.Y)
                FastTween(arrowLbl, 0.15, { TextColor3 = theme.AccentHover })
                task.delay(0.15, function()
                    FastTween(arrowLbl, 0.15, { TextColor3 = theme.Accent })
                end)
                task.spawn(cb)
            end)
            btn.TouchTap:Connect(function()
                task.spawn(cb)
            end)

            return frame
        end

        -- ─────────────────────────────────
        --           TOGGLE
        -- ─────────────────────────────────
        function TabObj:AddToggle(togConfig)
            local name    = togConfig.Name    or "Toggle"
            local desc    = togConfig.Description or nil
            local default = togConfig.Default ~= nil and togConfig.Default or false
            local cb      = togConfig.Callback or function() end

            local height = desc and 52 or 42
            local frame = ElementFrame(height)
            frame.ClipsDescendants = true

            local state = default

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Position = UDim2.new(0, 14, 0, desc and 8 or 0)
            nameLbl.Size = UDim2.new(1, -75, desc and 0 or 1, desc and 18 or 0)
            nameLbl.Text = name
            nameLbl.TextColor3 = theme.Text
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.Font = Enum.Font.GothamSemibold
            nameLbl.TextSize = 13
            nameLbl.Parent = frame

            if desc then
                local descLbl = Instance.new("TextLabel")
                descLbl.BackgroundTransparency = 1
                descLbl.Position = UDim2.new(0, 14, 0, 28)
                descLbl.Size = UDim2.new(1, -75, 0, 16)
                descLbl.Text = desc
                descLbl.TextColor3 = theme.TextSecondary
                descLbl.TextXAlignment = Enum.TextXAlignment.Left
                descLbl.Font = Enum.Font.Gotham
                descLbl.TextSize = 11
                descLbl.Parent = frame
            end

            -- Toggle track
            local trackW, trackH = 44, 24
            local track = Instance.new("Frame")
            track.BackgroundColor3 = state and theme.ToggleOn or theme.ToggleOff
            track.BorderSizePixel = 0
            track.Size = UDim2.new(0, trackW, 0, trackH)
            track.Position = UDim2.new(1, -(trackW + 12), 0.5, -trackH/2)
            track.Parent = frame
            MakeCorner(track, 999)
            MakeStroke(track, theme.Border, 1, 0.3)

            -- Toggle knob
            local knobSize = trackH - 6
            local knob = Instance.new("Frame")
            knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            knob.BorderSizePixel = 0
            knob.Size = UDim2.new(0, knobSize, 0, knobSize)
            knob.Position = state
                and UDim2.new(0, trackW - knobSize - 3, 0.5, -knobSize/2)
                or  UDim2.new(0, 3, 0.5, -knobSize/2)
            knob.Parent = track
            MakeCorner(knob, 999)
            MakeShadow(knob, 6, 0.5)

            -- Knob inner dot
            local knobDot = Instance.new("Frame")
            knobDot.BackgroundColor3 = state and theme.ToggleOn or Color3.fromRGB(200, 200, 220)
            knobDot.BackgroundTransparency = 0.5
            knobDot.BorderSizePixel = 0
            knobDot.Size = UDim2.new(0, 6, 0, 6)
            knobDot.Position = UDim2.new(0.5, -3, 0.5, -3)
            knobDot.Parent = knob
            MakeCorner(knobDot, 999)

            local function setToggle(val)
                state = val
                if state then
                    FastTween(track, 0.25, { BackgroundColor3 = theme.ToggleOn })
                    FastTween(knob, 0.25, { Position = UDim2.new(0, trackW - knobSize - 3, 0.5, -knobSize/2) })
                    FastTween(knobDot, 0.2, { BackgroundColor3 = theme.ToggleOn })
                else
                    FastTween(track, 0.25, { BackgroundColor3 = theme.ToggleOff })
                    FastTween(knob, 0.25, { Position = UDim2.new(0, 3, 0.5, -knobSize/2) })
                    FastTween(knobDot, 0.2, { BackgroundColor3 = Color3.fromRGB(200, 200, 220) })
                end
                task.spawn(cb, state)
            end

            local btn = Instance.new("TextButton")
            btn.BackgroundTransparency = 1
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""
            btn.Parent = frame

            btn.MouseEnter:Connect(function()
                FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonHover })
            end)
            btn.MouseLeave:Connect(function()
                FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonBg })
            end)
            btn.MouseButton1Click:Connect(function() setToggle(not state) end)
            btn.TouchTap:Connect(function() setToggle(not state) end)

            local ToggleControl = {}
            function ToggleControl:Set(val) setToggle(val) end
            function ToggleControl:Get() return state end
            return ToggleControl
        end

        -- ─────────────────────────────────
        --           SLIDER
        -- ─────────────────────────────────
        function TabObj:AddSlider(slConfig)
            local name    = slConfig.Name    or "Slider"
            local desc    = slConfig.Description or nil
            local minVal  = slConfig.Min     or 0
            local maxVal  = slConfig.Max     or 100
            local default = slConfig.Default or minVal
            local suffix  = slConfig.Suffix  or ""
            local cb      = slConfig.Callback or function() end
            local integer = slConfig.Integer ~= false

            local frame = ElementFrame(desc and 68 or 58)

            local value = math.clamp(default, minVal, maxVal)

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Position = UDim2.new(0, 14, 0, 7)
            nameLbl.Size = UDim2.new(1, -80, 0, 16)
            nameLbl.Text = name
            nameLbl.TextColor3 = theme.Text
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.Font = Enum.Font.GothamSemibold
            nameLbl.TextSize = 13
            nameLbl.Parent = frame

            local valLbl = Instance.new("TextLabel")
            valLbl.BackgroundTransparency = 1
            valLbl.Position = UDim2.new(1, -75, 0, 7)
            valLbl.Size = UDim2.new(0, 65, 0, 16)
            valLbl.Text = tostring(integer and math.round(value) or math.floor(value * 10)/10) .. suffix
            valLbl.TextColor3 = theme.Accent
            valLbl.TextXAlignment = Enum.TextXAlignment.Right
            valLbl.Font = Enum.Font.GothamBold
            valLbl.TextSize = 13
            valLbl.Parent = frame

            local trackY = desc and 38 or 32
            local trackH = 6

            local trackBg = Instance.new("Frame")
            trackBg.BackgroundColor3 = theme.SliderBg
            trackBg.BorderSizePixel = 0
            trackBg.Size = UDim2.new(1, -28, 0, trackH)
            trackBg.Position = UDim2.new(0, 14, 0, trackY)
            trackBg.Parent = frame
            MakeCorner(trackBg, 999)

            local trackFill = Instance.new("Frame")
            trackFill.BackgroundColor3 = theme.SliderFill
            trackFill.BorderSizePixel = 0
            trackFill.Size = UDim2.new((value - minVal) / (maxVal - minVal), 0, 1, 0)
            trackFill.Parent = trackBg
            MakeCorner(trackFill, 999)

            -- Glow effect on fill
            MakeGradient(trackFill, {
                ColorSequenceKeypoint.new(0, theme.AccentDark),
                ColorSequenceKeypoint.new(1, theme.AccentHover),
            }, 0)

            local thumbSize = isMobile and 18 or 14
            local thumb = Instance.new("Frame")
            thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            thumb.BorderSizePixel = 0
            thumb.Size = UDim2.new(0, thumbSize, 0, thumbSize)
            thumb.Position = UDim2.new((value - minVal) / (maxVal - minVal), -thumbSize/2, 0.5, -thumbSize/2)
            thumb.ZIndex = 3
            thumb.Parent = trackBg
            MakeCorner(thumb, 999)
            MakeShadow(thumb, 8, 0.5)

            -- Thumb inner
            local thumbInner = Instance.new("Frame")
            thumbInner.BackgroundColor3 = theme.Accent
            thumbInner.BorderSizePixel = 0
            thumbInner.Size = UDim2.new(0, thumbSize - 6, 0, thumbSize - 6)
            thumbInner.Position = UDim2.new(0.5, -(thumbSize-6)/2, 0.5, -(thumbSize-6)/2)
            thumbInner.Parent = thumb
            MakeCorner(thumbInner, 999)

            if desc then
                local descLbl = Instance.new("TextLabel")
                descLbl.BackgroundTransparency = 1
                descLbl.Position = UDim2.new(0, 14, 0, 24)
                descLbl.Size = UDim2.new(1, -28, 0, 12)
                descLbl.Text = desc
                descLbl.TextColor3 = theme.TextSecondary
                descLbl.TextXAlignment = Enum.TextXAlignment.Left
                descLbl.Font = Enum.Font.Gotham
                descLbl.TextSize = 10
                descLbl.Parent = frame
            end

            local sliding = false

            local function updateSlider(inputPos)
                local absPos  = trackBg.AbsolutePosition.X
                local absSize = trackBg.AbsoluteSize.X
                local rel = math.clamp((inputPos - absPos) / absSize, 0, 1)
                value = minVal + (maxVal - minVal) * rel
                if integer then value = math.round(value) end
                value = math.clamp(value, minVal, maxVal)

                local frac = (value - minVal) / (maxVal - minVal)
                FastTween(trackFill, 0.05, { Size = UDim2.new(frac, 0, 1, 0) })
                FastTween(thumb, 0.05, { Position = UDim2.new(frac, -thumbSize/2, 0.5, -thumbSize/2) })
                valLbl.Text = tostring(integer and math.round(value) or math.floor(value * 10)/10) .. suffix
                task.spawn(cb, value)
            end

            local btn = Instance.new("TextButton")
            btn.BackgroundTransparency = 1
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""
            btn.ZIndex = 5
            btn.Parent = trackBg

            btn.MouseButton1Down:Connect(function()
                sliding = true
                FastTween(thumb, 0.1, { Size = UDim2.new(0, thumbSize + 4, 0, thumbSize + 4), Position = UDim2.new((value-minVal)/(maxVal-minVal), -(thumbSize+4)/2, 0.5, -(thumbSize+4)/2) })
            end)
            btn.MouseButton1Up:Connect(function()
                sliding = false
                FastTween(thumb, 0.1, { Size = UDim2.new(0, thumbSize, 0, thumbSize), Position = UDim2.new((value-minVal)/(maxVal-minVal), -thumbSize/2, 0.5, -thumbSize/2) })
            end)

            UserInputService.InputChanged:Connect(function(input)
                if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateSlider(input.Position.X)
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    if sliding then
                        sliding = false
                        FastTween(thumb, 0.1, { Size = UDim2.new(0, thumbSize, 0, thumbSize) })
                    end
                end
            end)

            btn.TouchLongPress:Connect(function(positions)
                sliding = true
            end)
            btn.TouchPan:Connect(function(positions)
                if #positions > 0 then
                    updateSlider(positions[1].X)
                end
            end)
            btn.TouchSwipe:Connect(function()
                sliding = false
            end)

            local SliderControl = {}
            function SliderControl:Set(val)
                value = math.clamp(val, minVal, maxVal)
                local frac = (value - minVal) / (maxVal - minVal)
                FastTween(trackFill, 0.2, { Size = UDim2.new(frac, 0, 1, 0) })
                FastTween(thumb, 0.2, { Position = UDim2.new(frac, -thumbSize/2, 0.5, -thumbSize/2) })
                valLbl.Text = tostring(integer and math.round(value) or math.floor(value*10)/10) .. suffix
            end
            function SliderControl:Get() return value end
            return SliderControl
        end

        -- ─────────────────────────────────
        --           DROPDOWN
        -- ─────────────────────────────────
        function TabObj:AddDropdown(ddConfig)
            local name    = ddConfig.Name    or "Dropdown"
            local options = ddConfig.Options  or {}
            local default = ddConfig.Default  or (options[1] or "Select...")
            local cb      = ddConfig.Callback or function() end
            local multi   = ddConfig.Multi    or false

            local frame = ElementFrame(42)
            frame.ClipsDescendants = false
            frame.ZIndex = 10

            local selected = default
            local isOpen = false

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Position = UDim2.new(0, 14, 0, 0)
            nameLbl.Size = UDim2.new(0.5, 0, 1, 0)
            nameLbl.Text = name
            nameLbl.TextColor3 = theme.Text
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.Font = Enum.Font.GothamSemibold
            nameLbl.TextSize = 13
            nameLbl.Parent = frame

            local selectedLbl = Instance.new("TextLabel")
            selectedLbl.BackgroundTransparency = 1
            selectedLbl.Position = UDim2.new(0.5, 0, 0, 0)
            selectedLbl.Size = UDim2.new(0.5, -40, 1, 0)
            selectedLbl.Text = tostring(selected)
            selectedLbl.TextColor3 = theme.Accent
            selectedLbl.TextXAlignment = Enum.TextXAlignment.Right
            selectedLbl.Font = Enum.Font.Gotham
            selectedLbl.TextSize = 12
            selectedLbl.Parent = frame

            local arrowLbl = Instance.new("TextLabel")
            arrowLbl.BackgroundTransparency = 1
            arrowLbl.Size = UDim2.new(0, 24, 0, 24)
            arrowLbl.Position = UDim2.new(1, -30, 0.5, -12)
            arrowLbl.Text = "⌄"
            arrowLbl.Font = Enum.Font.GothamBold
            arrowLbl.TextSize = 14
            arrowLbl.TextColor3 = theme.TextSecondary
            arrowLbl.Parent = frame

            -- Dropdown list
            local dropList = Instance.new("Frame")
            dropList.BackgroundColor3 = theme.Tertiary
            dropList.BorderSizePixel = 0
            dropList.Size = UDim2.new(1, 0, 0, 0)
            dropList.Position = UDim2.new(0, 0, 1, 4)
            dropList.ClipsDescendants = true
            dropList.ZIndex = 50
            dropList.Visible = false
            dropList.Parent = frame
            MakeCorner(dropList, 10)
            MakeStroke(dropList, theme.Border, 1, 0.3)
            MakeShadow(dropList, 15, 0.5)

            local dropScroll = Instance.new("ScrollingFrame")
            dropScroll.BackgroundTransparency = 1
            dropScroll.BorderSizePixel = 0
            dropScroll.Size = UDim2.new(1, 0, 1, 0)
            dropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            dropScroll.ScrollBarThickness = 2
            dropScroll.ScrollBarImageColor3 = theme.ScrollBar
            dropScroll.ZIndex = 51
            dropScroll.Parent = dropList
            MakePadding(dropScroll, 4, 4, 6, 6)
            local dropLayout = MakeListLayout(dropScroll, 3)

            local maxVisible = math.min(#options, 5)
            local itemH = 34
            local targetH = maxVisible * (itemH + 3) + 11

            for _, opt in ipairs(options) do
                local itemBtn = Instance.new("TextButton")
                itemBtn.BackgroundColor3 = theme.ButtonBg
                itemBtn.BorderSizePixel = 0
                itemBtn.Size = UDim2.new(1, 0, 0, itemH)
                itemBtn.Text = ""
                itemBtn.AutoButtonColor = false
                itemBtn.ZIndex = 52
                itemBtn.Parent = dropScroll
                MakeCorner(itemBtn, 7)

                local checkMark = Instance.new("TextLabel")
                checkMark.BackgroundTransparency = 1
                checkMark.Size = UDim2.new(0, 20, 1, 0)
                checkMark.Position = UDim2.new(0, 6, 0, 0)
                checkMark.Text = opt == selected and "✓" or ""
                checkMark.TextColor3 = theme.Accent
                checkMark.Font = Enum.Font.GothamBold
                checkMark.TextSize = 12
                checkMark.ZIndex = 53
                checkMark.Parent = itemBtn

                local optLbl = Instance.new("TextLabel")
                optLbl.BackgroundTransparency = 1
                optLbl.Position = UDim2.new(0, 28, 0, 0)
                optLbl.Size = UDim2.new(1, -34, 1, 0)
                optLbl.Text = tostring(opt)
                optLbl.TextColor3 = opt == selected and theme.Text or theme.TextSecondary
                optLbl.TextXAlignment = Enum.TextXAlignment.Left
                optLbl.Font = Enum.Font.Gotham
                optLbl.TextSize = 12
                optLbl.ZIndex = 53
                optLbl.Parent = itemBtn

                itemBtn.MouseEnter:Connect(function()
                    FastTween(itemBtn, 0.1, { BackgroundColor3 = theme.ButtonHover })
                end)
                itemBtn.MouseLeave:Connect(function()
                    FastTween(itemBtn, 0.1, { BackgroundColor3 = theme.ButtonBg })
                end)
                itemBtn.MouseButton1Click:Connect(function()
                    selected = opt
                    selectedLbl.Text = tostring(selected)
                    -- update check marks
                    for _, child in pairs(dropScroll:GetChildren()) do
                        if child:IsA("TextButton") then
                            local lbl = child:FindFirstChildOfClass("TextLabel")
                            local ck  = child:FindFirstChild("TextLabel")
                            if lbl and lbl.Name ~= "TextLabel" then end
                            for _, c in pairs(child:GetChildren()) do
                                if c:IsA("TextLabel") then
                                    if c.Position == UDim2.new(0, 6, 0, 0) then
                                        c.Text = c.Parent:FindFirstChild("TextLabel") and
                                            (c.Parent:GetChildren()[3] and c.Parent:GetChildren()[3].Text == opt and "✓" or "") or ""
                                    end
                                end
                            end
                        end
                    end
                    -- close
                    isOpen = false
                    FastTween(dropList, 0.2, { Size = UDim2.new(1, 0, 0, 0) })
                    FastTween(arrowLbl, 0.2, { Rotation = 0 })
                    task.delay(0.2, function() dropList.Visible = false end)
                    task.spawn(cb, selected)
                end)
                itemBtn.TouchTap:Connect(function()
                    selected = opt
                    selectedLbl.Text = tostring(selected)
                    isOpen = false
                    FastTween(dropList, 0.2, { Size = UDim2.new(1, 0, 0, 0) })
                    task.delay(0.2, function() dropList.Visible = false end)
                    task.spawn(cb, selected)
                end)
            end

            dropScroll.CanvasSize = UDim2.new(0, 0, 0, dropLayout.AbsoluteContentSize.Y + 10)

            local mainBtn = Instance.new("TextButton")
            mainBtn.BackgroundTransparency = 1
            mainBtn.Size = UDim2.new(1, 0, 1, 0)
            mainBtn.Text = ""
            mainBtn.ZIndex = 11
            mainBtn.Parent = frame

            mainBtn.MouseEnter:Connect(function()
                FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonHover })
            end)
            mainBtn.MouseLeave:Connect(function()
                FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonBg })
            end)

            mainBtn.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    dropList.Visible = true
                    FastTween(dropList, 0.25, { Size = UDim2.new(1, 0, 0, targetH) })
                    FastTween(arrowLbl, 0.2, { Rotation = 180 })
                else
                    FastTween(dropList, 0.2, { Size = UDim2.new(1, 0, 0, 0) })
                    FastTween(arrowLbl, 0.2, { Rotation = 0 })
                    task.delay(0.2, function() dropList.Visible = false end)
                end
            end)
            mainBtn.TouchTap:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    dropList.Visible = true
                    FastTween(dropList, 0.25, { Size = UDim2.new(1, 0, 0, targetH) })
                else
                    FastTween(dropList, 0.2, { Size = UDim2.new(1, 0, 0, 0) })
                    task.delay(0.2, function() dropList.Visible = false end)
                end
            end)

            local DDControl = {}
            function DDControl:Set(val) selected = val; selectedLbl.Text = tostring(val) end
            function DDControl:Get() return selected end
            return DDControl
        end

        -- ─────────────────────────────────
        --          TEXT INPUT
        -- ─────────────────────────────────
        function TabObj:AddInput(inputConfig)
            local name        = inputConfig.Name        or "Input"
            local placeholder = inputConfig.PlaceHolder  or "Type here..."
            local default     = inputConfig.Default      or ""
            local isPassword  = inputConfig.Password     or false
            local cb          = inputConfig.Callback     or function() end
            local cbChanged   = inputConfig.OnChanged    or function() end

            local frame = ElementFrame(62)

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Position = UDim2.new(0, 14, 0, 8)
            nameLbl.Size = UDim2.new(1, -28, 0, 16)
            nameLbl.Text = name
            nameLbl.TextColor3 = theme.Text
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.Font = Enum.Font.GothamSemibold
            nameLbl.TextSize = 13
            nameLbl.Parent = frame

            local inputContainer = Instance.new("Frame")
            inputContainer.BackgroundColor3 = theme.InputBg
            inputContainer.BorderSizePixel = 0
            inputContainer.Size = UDim2.new(1, -28, 0, 28)
            inputContainer.Position = UDim2.new(0, 14, 0, 28)
            inputContainer.Parent = frame
            MakeCorner(inputContainer, 7)
            local inputStroke = MakeStroke(inputContainer, theme.Border, 1, 0.3)

            local textBox = Instance.new("TextBox")
            textBox.BackgroundTransparency = 1
            textBox.Size = UDim2.new(1, -16, 1, 0)
            textBox.Position = UDim2.new(0, 8, 0, 0)
            textBox.Text = default
            textBox.PlaceholderText = placeholder
            textBox.PlaceholderColor3 = theme.TextDisabled
            textBox.TextColor3 = theme.Text
            textBox.Font = Enum.Font.Gotham
            textBox.TextSize = 12
            textBox.TextXAlignment = Enum.TextXAlignment.Left
            textBox.ClearTextOnFocus = false
            if isPassword then textBox.TextTransparency = 0 end
            textBox.Parent = inputContainer

            textBox.Focused:Connect(function()
                FastTween(inputStroke, 0.2, { Color = theme.Accent, Transparency = 0 })
                FastTween(inputContainer, 0.2, { BackgroundColor3 = theme.ButtonHover })
            end)
            textBox.FocusLost:Connect(function(enterPressed)
                FastTween(inputStroke, 0.2, { Color = theme.Border, Transparency = 0.3 })
                FastTween(inputContainer, 0.2, { BackgroundColor3 = theme.InputBg })
                if enterPressed then task.spawn(cb, textBox.Text) end
            end)
            textBox:GetPropertyChangedSignal("Text"):Connect(function()
                task.spawn(cbChanged, textBox.Text)
            end)

            local InputControl = {}
            function InputControl:Set(val) textBox.Text = tostring(val) end
            function InputControl:Get() return textBox.Text end
            function InputControl:Focus() textBox:CaptureFocus() end
            return InputControl
        end

        -- ─────────────────────────────────
        --          LABEL
        -- ─────────────────────────────────
        function TabObj:AddLabel(lblConfig)
            local text  = lblConfig.Text  or "Label"
            local color = lblConfig.Color or theme.TextSecondary
            local size  = lblConfig.Size  or 13
            local align = lblConfig.Align or "Left"

            local frame = Instance.new("Frame")
            frame.BackgroundTransparency = 1
            frame.Size = UDim2.new(1, 0, 0, 26)
            frame.LayoutOrder = nextOrder()
            frame.Parent = page

            local lbl = Instance.new("TextLabel")
            lbl.BackgroundTransparency = 1
            lbl.Size = UDim2.new(1, -14, 1, 0)
            lbl.Position = UDim2.new(0, 7, 0, 0)
            lbl.Text = text
            lbl.TextColor3 = color
            lbl.Font = Enum.Font.Gotham
            lbl.TextSize = size
            lbl.TextWrapped = true
            lbl.TextXAlignment = Enum.TextXAlignment["TextXAlignment" .. align] or Enum.TextXAlignment.Left
            lbl.Parent = frame

            local LabelControl = {}
            function LabelControl:Set(t) lbl.Text = t end
            function LabelControl:SetColor(c) lbl.TextColor3 = c end
            return LabelControl
        end

        -- ─────────────────────────────────
        --          DIVIDER
        -- ─────────────────────────────────
        function TabObj:AddDivider(divConfig)
            divConfig = divConfig or {}
            local text = divConfig.Text or nil

            local frame = Instance.new("Frame")
            frame.BackgroundTransparency = 1
            frame.Size = UDim2.new(1, 0, 0, text and 28 or 14)
            frame.LayoutOrder = nextOrder()
            frame.Parent = page

            local line = Instance.new("Frame")
            line.BackgroundColor3 = theme.Border
            line.BorderSizePixel = 0
            line.Size = UDim2.new(1, -14, 0, 1)
            line.Position = UDim2.new(0, 7, 0.5, 0)
            line.Parent = frame

            if text then
                local bg = Instance.new("Frame")
                bg.BackgroundColor3 = theme.Background
                bg.BorderSizePixel = 0
                bg.Size = UDim2.new(0, 0, 0, 16)
                bg.Position = UDim2.new(0.5, 0, 0.5, -8)
                bg.AutomaticSize = Enum.AutomaticSize.X
                bg.Parent = frame
                MakePadding(bg, 0, 0, 6, 6)

                local textLbl = Instance.new("TextLabel")
                textLbl.BackgroundTransparency = 1
                textLbl.Size = UDim2.new(0, 0, 1, 0)
                textLbl.AutomaticSize = Enum.AutomaticSize.X
                textLbl.Text = text
                textLbl.TextColor3 = theme.TextDisabled
                textLbl.Font = Enum.Font.Gotham
                textLbl.TextSize = 10
                textLbl.Parent = bg
            end
        end

        -- ─────────────────────────────────
        --          COLOR PICKER
        -- ─────────────────────────────────
        function TabObj:AddColorPicker(cpConfig)
            local name    = cpConfig.Name    or "Color"
            local default = cpConfig.Default or Color3.fromRGB(255, 100, 50)
            local cb      = cpConfig.Callback or function() end

            local frame = ElementFrame(42)
            frame.ClipsDescendants = false
            frame.ZIndex = 5

            local selectedColor = default
            local isOpen = false

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Position = UDim2.new(0, 14, 0, 0)
            nameLbl.Size = UDim2.new(1, -80, 1, 0)
            nameLbl.Text = name
            nameLbl.TextColor3 = theme.Text
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.Font = Enum.Font.GothamSemibold
            nameLbl.TextSize = 13
            nameLbl.Parent = frame

            -- Color preview circle
            local colorPreview = Instance.new("Frame")
            colorPreview.BackgroundColor3 = selectedColor
            colorPreview.BorderSizePixel = 0
            colorPreview.Size = UDim2.new(0, 26, 0, 26)
            colorPreview.Position = UDim2.new(1, -38, 0.5, -13)
            colorPreview.Parent = frame
            MakeCorner(colorPreview, 6)
            MakeStroke(colorPreview, theme.Border, 1, 0.2)

            -- Color picker panel
            local pickerPanel = Instance.new("Frame")
            pickerPanel.BackgroundColor3 = theme.Tertiary
            pickerPanel.BorderSizePixel = 0
            pickerPanel.Size = UDim2.new(1, 0, 0, 0)
            pickerPanel.Position = UDim2.new(0, 0, 1, 4)
            pickerPanel.ClipsDescendants = true
            pickerPanel.ZIndex = 20
            pickerPanel.Visible = false
            pickerPanel.Parent = frame
            MakeCorner(pickerPanel, 10)
            MakeStroke(pickerPanel, theme.Border, 1, 0.3)
            MakeShadow(pickerPanel, 12, 0.5)

            -- Hue bar (simplified RGB sliders)
            local sliderData = {
                { Label = "R", Color = Color3.fromRGB(220, 70, 70),  Key = "R" },
                { Label = "G", Color = Color3.fromRGB(70, 200, 70),  Key = "G" },
                { Label = "B", Color = Color3.fromRGB(70, 130, 220), Key = "B" },
            }

            local rVal = math.round(default.R * 255)
            local gVal = math.round(default.G * 255)
            local bVal = math.round(default.B * 255)

            local function updateColor()
                selectedColor = Color3.fromRGB(rVal, gVal, bVal)
                colorPreview.BackgroundColor3 = selectedColor
                task.spawn(cb, selectedColor)
            end

            local panelContent = Instance.new("Frame")
            panelContent.BackgroundTransparency = 1
            panelContent.Size = UDim2.new(1, 0, 0, 120)
            panelContent.Parent = pickerPanel
            MakePadding(panelContent, 8, 8, 10, 10)

            local colorDisplayH = 36
            local colorDisplay = Instance.new("Frame")
            colorDisplay.BackgroundColor3 = selectedColor
            colorDisplay.BorderSizePixel = 0
            colorDisplay.Size = UDim2.new(1, -20, 0, colorDisplayH)
            colorDisplay.Position = UDim2.new(0, 10, 0, 8)
            colorDisplay.Parent = panelContent
            MakeCorner(colorDisplay, 8)

            local hexLbl = Instance.new("TextLabel")
            hexLbl.BackgroundTransparency = 1
            hexLbl.Size = UDim2.new(1, 0, 1, 0)
            hexLbl.Text = string.format("#%02X%02X%02X", rVal, gVal, bVal)
            hexLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
            hexLbl.Font = Enum.Font.GothamBold
            hexLbl.TextSize = 13
            hexLbl.Parent = colorDisplay

            local function makeRGBSlider(label, startVal, yOffset, colorAccent, onChange)
                local trackBg2 = Instance.new("Frame")
                trackBg2.BackgroundColor3 = theme.SliderBg
                trackBg2.BorderSizePixel = 0
                trackBg2.Size = UDim2.new(1, -60, 0, 5)
                trackBg2.Position = UDim2.new(0, 40, 0, yOffset)
                trackBg2.Parent = panelContent
                MakeCorner(trackBg2, 999)

                local fill2 = Instance.new("Frame")
                fill2.BackgroundColor3 = colorAccent
                fill2.BorderSizePixel = 0
                fill2.Size = UDim2.new(startVal/255, 0, 1, 0)
                fill2.Parent = trackBg2
                MakeCorner(fill2, 999)

                local th2Size = 12
                local thumb2 = Instance.new("Frame")
                thumb2.BackgroundColor3 = Color3.fromRGB(255,255,255)
                thumb2.BorderSizePixel = 0
                thumb2.Size = UDim2.new(0, th2Size, 0, th2Size)
                thumb2.Position = UDim2.new(startVal/255, -th2Size/2, 0.5, -th2Size/2)
                thumb2.ZIndex = 3
                thumb2.Parent = trackBg2
                MakeCorner(thumb2, 999)

                local valLbl2 = Instance.new("TextLabel")
                valLbl2.BackgroundTransparency = 1
                valLbl2.Size = UDim2.new(0, 34, 0, 14)
                valLbl2.Position = UDim2.new(1, 2, 0, -4)
                valLbl2.Text = tostring(startVal)
                valLbl2.TextColor3 = colorAccent
                valLbl2.Font = Enum.Font.GothamBold
                valLbl2.TextSize = 10
                valLbl2.ZIndex = 4
                valLbl2.Parent = trackBg2

                local lbl2 = Instance.new("TextLabel")
                lbl2.BackgroundTransparency = 1
                lbl2.Size = UDim2.new(0, 30, 0, 14)
                lbl2.Position = UDim2.new(0, -36, 0, -4)
                lbl2.Text = label
                lbl2.TextColor3 = colorAccent
                lbl2.Font = Enum.Font.GothamBold
                lbl2.TextSize = 11
                lbl2.Parent = trackBg2

                local sliding2 = false
                local btn2 = Instance.new("TextButton")
                btn2.BackgroundTransparency = 1
                btn2.Size = UDim2.new(1, 0, 1, 0)
                btn2.Text = ""
                btn2.ZIndex = 6
                btn2.Parent = trackBg2

                local function update2(px)
                    local rel = math.clamp((px - trackBg2.AbsolutePosition.X) / trackBg2.AbsoluteSize.X, 0, 1)
                    local val = math.round(rel * 255)
                    fill2.Size = UDim2.new(rel, 0, 1, 0)
                    thumb2.Position = UDim2.new(rel, -th2Size/2, 0.5, -th2Size/2)
                    valLbl2.Text = tostring(val)
                    onChange(val)
                    colorDisplay.BackgroundColor3 = Color3.fromRGB(rVal, gVal, bVal)
                    hexLbl.Text = string.format("#%02X%02X%02X", rVal, gVal, bVal)
                end

                btn2.MouseButton1Down:Connect(function() sliding2 = true end)
                btn2.MouseButton1Up:Connect(function() sliding2 = false end)
                UserInputService.InputChanged:Connect(function(input)
                    if sliding2 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        update2(input.Position.X)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and sliding2 then
                        sliding2 = false
                    end
                end)
            end

            makeRGBSlider("R", rVal, 52, Color3.fromRGB(220, 80, 80),  function(v) rVal = v; updateColor() end)
            makeRGBSlider("G", gVal, 72, Color3.fromRGB(80, 200, 80),  function(v) gVal = v; updateColor() end)
            makeRGBSlider("B", bVal, 92, Color3.fromRGB(80, 130, 220), function(v) bVal = v; updateColor() end)

            local openBtn = Instance.new("TextButton")
            openBtn.BackgroundTransparency = 1
            openBtn.Size = UDim2.new(1, 0, 1, 0)
            openBtn.Text = ""
            openBtn.ZIndex = 6
            openBtn.Parent = frame

            openBtn.MouseEnter:Connect(function() FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonHover }) end)
            openBtn.MouseLeave:Connect(function() FastTween(frame, 0.15, { BackgroundColor3 = theme.ButtonBg }) end)
            openBtn.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    pickerPanel.Visible = true
                    FastTween(pickerPanel, 0.25, { Size = UDim2.new(1, 0, 0, 124) })
                else
                    FastTween(pickerPanel, 0.2, { Size = UDim2.new(1, 0, 0, 0) })
                    task.delay(0.2, function() pickerPanel.Visible = false end)
                end
            end)
            openBtn.TouchTap:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    pickerPanel.Visible = true
                    FastTween(pickerPanel, 0.25, { Size = UDim2.new(1, 0, 0, 124) })
                else
                    FastTween(pickerPanel, 0.2, { Size = UDim2.new(1, 0, 0, 0) })
                    task.delay(0.2, function() pickerPanel.Visible = false end)
                end
            end)

            local CPControl = {}
            function CPControl:Set(col)
                selectedColor = col
                rVal = math.round(col.R * 255)
                gVal = math.round(col.G * 255)
                bVal = math.round(col.B * 255)
                colorPreview.BackgroundColor3 = col
                colorDisplay.BackgroundColor3 = col
                hexLbl.Text = string.format("#%02X%02X%02X", rVal, gVal, bVal)
            end
            function CPControl:Get() return selectedColor end
            return CPControl
        end

        -- ─────────────────────────────────
        --          KEYBIND
        -- ─────────────────────────────────
        function TabObj:AddKeybind(kbConfig)
            local name    = kbConfig.Name    or "Keybind"
            local default = kbConfig.Default or Enum.KeyCode.F
            local cb      = kbConfig.Callback or function() end

            local frame = ElementFrame(42)
            local currentKey = default
            local listening = false

            local nameLbl = Instance.new("TextLabel")
            nameLbl.BackgroundTransparency = 1
            nameLbl.Position = UDim2.new(0, 14, 0, 0)
            nameLbl.Size = UDim2.new(1, -90, 1, 0)
            nameLbl.Text = name
            nameLbl.TextColor3 = theme.Text
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.Font = Enum.Font.GothamSemibold
            nameLbl.TextSize = 13
            nameLbl.Parent = frame

            local keyBox = Instance.new("TextButton")
            keyBox.BackgroundColor3 = theme.InputBg
            keyBox.BorderSizePixel = 0
            keyBox.Size = UDim2.new(0, 70, 0, 26)
            keyBox.Position = UDim2.new(1, -80, 0.5, -13)
            keyBox.Text = tostring(currentKey.Name)
            keyBox.TextColor3 = theme.Accent
            keyBox.Font = Enum.Font.GothamBold
            keyBox.TextSize = 12
            keyBox.AutoButtonColor = false
            keyBox.Parent = frame
            MakeCorner(keyBox, 6)
            MakeStroke(keyBox, theme.Border, 1, 0.3)

            keyBox.MouseButton1Click:Connect(function()
                listening = true
                keyBox.Text = "..."
                FastTween(keyBox, 0.1, { BackgroundColor3 = theme.ButtonHover })
                FastTween(MakeStroke(keyBox, theme.Accent, 1, 0), 0.1, {})
            end)

            UserInputService.InputBegan:Connect(function(input)
                if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = input.KeyCode
                    keyBox.Text = tostring(currentKey.Name)
                    listening = false
                    FastTween(keyBox, 0.1, { BackgroundColor3 = theme.InputBg })
                end
            end)

            UserInputService.InputBegan:Connect(function(input)
                if not listening and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == currentKey then
                    task.spawn(cb)
                end
            end)

            local KBControl = {}
            function KBControl:Set(key) currentKey = key; keyBox.Text = tostring(key.Name) end
            function KBControl:Get() return currentKey end
            return KBControl
        end

        -- ─────────────────────────────────
        --       SECTION HEADER
        -- ─────────────────────────────────
        function TabObj:AddSection(secConfig)
            local name = secConfig.Name or "Section"

            local frame = Instance.new("Frame")
            frame.BackgroundTransparency = 1
            frame.Size = UDim2.new(1, 0, 0, 28)
            frame.LayoutOrder = nextOrder()
            frame.Parent = page

            local line = Instance.new("Frame")
            line.BackgroundColor3 = theme.Accent
            line.BackgroundTransparency = 0.6
            line.BorderSizePixel = 0
            line.Size = UDim2.new(0, 3, 0.7, 0)
            line.Position = UDim2.new(0, 7, 0.15, 0)
            line.Parent = frame
            MakeCorner(line, 2)

            local lbl = Instance.new("TextLabel")
            lbl.BackgroundTransparency = 1
            lbl.Position = UDim2.new(0, 16, 0, 0)
            lbl.Size = UDim2.new(1, -20, 1, 0)
            lbl.Text = name:upper()
            lbl.TextColor3 = theme.Accent
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Font = Enum.Font.GothamBold
            lbl.TextSize = 10
            lbl.LetterSpacing = 2
            lbl.Parent = frame
        end

        return TabObj
    end

    -- ─── Animate window in ──────────────
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.BackgroundTransparency = 1
    task.wait(0.05)
    SpringTween(mainFrame, 0.5, {
        Size = UDim2.new(0, winWidth, 0, winHeight),
        BackgroundTransparency = 0,
    })

    -- ─── Key System (optional) ──────────
    if KeySystem and Key then
        local keyFrame = Instance.new("Frame")
        keyFrame.BackgroundColor3 = theme.Secondary
        keyFrame.BorderSizePixel = 0
        keyFrame.Size = UDim2.new(1, 0, 1, 0)
        keyFrame.ZIndex = 100
        keyFrame.Parent = mainFrame
        MakeCorner(keyFrame, 14)

        local keyTitle = Instance.new("TextLabel")
        keyTitle.BackgroundTransparency = 1
        keyTitle.Size = UDim2.new(1, 0, 0, 40)
        keyTitle.Position = UDim2.new(0, 0, 0, 40)
        keyTitle.Text = "🔑  Key Required"
        keyTitle.TextColor3 = theme.Text
        keyTitle.Font = Enum.Font.GothamBold
        keyTitle.TextSize = 18
        keyTitle.Parent = keyFrame

        local keyInput = Instance.new("Frame")
        keyInput.BackgroundColor3 = theme.InputBg
        keyInput.BorderSizePixel = 0
        keyInput.Size = UDim2.new(0, winWidth - 60, 0, 36)
        keyInput.Position = UDim2.new(0.5, -(winWidth - 60)/2, 0.5, -18)
        keyInput.Parent = keyFrame
        MakeCorner(keyInput, 8)
        MakeStroke(keyInput, theme.Border, 1, 0.3)

        local keyBox = Instance.new("TextBox")
        keyBox.BackgroundTransparency = 1
        keyBox.Size = UDim2.new(1, -16, 1, 0)
        keyBox.Position = UDim2.new(0, 8, 0, 0)
        keyBox.PlaceholderText = "Enter key..."
        keyBox.PlaceholderColor3 = theme.TextDisabled
        keyBox.TextColor3 = theme.Text
        keyBox.Font = Enum.Font.Gotham
        keyBox.TextSize = 13
        keyBox.Text = ""
        keyBox.Parent = keyInput

        local submitBtn = Instance.new("TextButton")
        submitBtn.BackgroundColor3 = theme.Accent
        submitBtn.BorderSizePixel = 0
        submitBtn.Size = UDim2.new(0, winWidth - 60, 0, 36)
        submitBtn.Position = UDim2.new(0.5, -(winWidth - 60)/2, 0.5, 22)
        submitBtn.Text = "Unlock"
        submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        submitBtn.Font = Enum.Font.GothamBold
        submitBtn.TextSize = 14
        submitBtn.AutoButtonColor = false
        submitBtn.Parent = keyFrame
        MakeCorner(submitBtn, 8)

        submitBtn.MouseButton1Click:Connect(function()
            if keyBox.Text == Key then
                FastTween(keyFrame, 0.4, { BackgroundTransparency = 1 })
                for _, child in pairs(keyFrame:GetChildren()) do
                    if child:IsA("GuiObject") then
                        FastTween(child, 0.3, { BackgroundTransparency = 1 })
                    end
                end
                task.delay(0.4, function() keyFrame:Destroy() end)
            else
                FastTween(keyInput, 0.05, { BackgroundColor3 = Color3.fromRGB(100, 30, 30) })
                task.delay(0.4, function()
                    FastTween(keyInput, 0.2, { BackgroundColor3 = theme.InputBg })
                end)
                keyBox.Text = ""
                keyBox.PlaceholderText = "❌ Incorrect key!"
            end
        end)
    end

    return WindowObj
end

-- ─── Destroy all windows ─────────────────
function NexusUI:Destroy()
    for _, gui in pairs(CoreGui:GetChildren()) do
        if gui.Name:sub(1, 8) == "NexusUI_" then
            gui:Destroy()
        end
    end
end

-- ─── Toggle visibility ──────────────────
function NexusUI:Toggle()
    for _, gui in pairs(CoreGui:GetChildren()) do
        if gui.Name:sub(1, 8) == "NexusUI_" and gui.Name ~= "NexusUI_Notifications" then
            for _, win in pairs(gui:GetChildren()) do
                if win:IsA("Frame") then
                    win.Visible = not win.Visible
                end
            end
        end
    end
end

-- ─── Default hide toggle (Insert key) ──
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.Insert then
            NexusUI:Toggle()
        end
    end
end)

return NexusUI
