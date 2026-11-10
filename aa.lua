-- discord.gg/syncrypt

if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.wait(math.random())

local HinaHub = getgenv and getgenv().HinaHub

if not HinaHub or not HinaHub.script_id then
	return
end

local hub = HinaHub.hub or "Hina Hub"
local discord = HinaHub.discord or ""
local keyLink = HinaHub.keyLink or ""
local premLink = HinaHub.premLink or ""
local workinkLink = HinaHub.workinkLink or ""
local t1 = {
	name = HinaHub.name or "",
	script_id = HinaHub.script_id
}
local lib = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()

lib.script_id = t1.script_id
pcall(function()
	if makefolder then
		makefolder(hub)
	end
end)

local v9 = hub .. "/Universal_Key.txt"

local function v10()
	if isfile and isfile(v9) then
		return readfile(v9)
	end

	return ""
end
local function v11(p1)
	pcall(function()
		if writefile then
			writefile(v9, p1)
		end
	end)
end
local function v12()
	pcall(function()
		if delfile then
			delfile(v9)
		elseif writefile then
			writefile(v9, "")
		end
	end)
end
local function v13(p2)
	if not p2 or p2 == "" then
		return "INVALID"
	end

	script_key = p2

	local ok, result = pcall(function()
		return lib.check_key(p2)
	end)

	if not ok or not result then
		return "INVALID"
	end

	if result.code == "KEY_VALID" then
		return "VALID"
	end

	if result.code == "KEY_HWID_LOCKED" then
		return "HWID"
	end

	return "INVALID"
end
local function v16(p3)
	if v13(p3) ~= "VALID" then
		return false
	end

	v11(p3)
	lib.load_script()

	return true
end

if script_key and script_key ~= "" and v16(script_key) then
	return
end

local v17 = v10()

if v17 ~= "" then
	if v16(v17) then
		return
	end

	v12()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local t2 = {
	bg = Color3.fromRGB(30, 30, 35),
	accent = Color3.fromRGB(220, 80, 120),
	buttonBg = Color3.fromRGB(50, 50, 58),
	textPrimary = Color3.fromRGB(255, 255, 255),
	textSecondary = Color3.fromRGB(160, 160, 170),
	inputBg = Color3.fromRGB(38, 38, 45),
	inputBorder = Color3.fromRGB(70, 70, 80),
	shadow = Color3.fromRGB(0, 0, 0),
	green = Color3.fromRGB(80, 200, 120),
	orange = Color3.fromRGB(240, 180, 60),
	red = Color3.fromRGB(240, 80, 80)
}
local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "KeySystemUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function()
	if syn and syn.protect_gui then
		syn.protect_gui(ScreenGui)
	end

	if gethui then
		ScreenGui.Parent = gethui()
	else
		ScreenGui.Parent = PlayerGui
	end
end)

if not ScreenGui.Parent then
	ScreenGui.Parent = PlayerGui
end

local Frame = Instance.new("Frame")

Frame.Name = "Shadow"
Frame.Size = UDim2.fromOffset(440, 500)
Frame.Position = UDim2.new(0.5, 4, 0.5, 4)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = t2.shadow
Frame.BackgroundTransparency = 0.6
Frame.BorderSizePixel = 0
Frame.ZIndex = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = Frame

local Frame2 = Instance.new("Frame")

Frame2.Name = "MainFrame"
Frame2.Size = UDim2.fromOffset(440, 500)
Frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame2.BackgroundColor3 = t2.bg
Frame2.BorderSizePixel = 0
Frame2.ClipsDescendants = true
Frame2.AutomaticSize = Enum.AutomaticSize.Y
Frame2.ZIndex = 1
Frame2.Parent = ScreenGui

local UICorner2 = Instance.new("UICorner")

UICorner2.CornerRadius = UDim.new(0, 14)
UICorner2.Parent = Frame2

local UIStroke = Instance.new("UIStroke")

UIStroke.Color = t2.accent
UIStroke.Thickness = 2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = Frame2

local Frame3 = Instance.new("Frame")

Frame3.Name = "TitleBar"
Frame3.Size = UDim2.new(1, 0, 0, 46)
Frame3.BackgroundTransparency = 1
Frame3.ZIndex = 2
Frame3.Parent = Frame2

local TextLabel = Instance.new("TextLabel")

TextLabel.Name = "Title"
TextLabel.Size = UDim2.new(1, -32, 1, 0)
TextLabel.Position = UDim2.fromOffset(16, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = hub .. " Key System"
TextLabel.TextColor3 = t2.textPrimary
TextLabel.TextSize = 16
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.ZIndex = 3
TextLabel.Parent = Frame3

local Frame4 = Instance.new("Frame")

Frame4.Name = "Content"
Frame4.Size = UDim2.new(1, -32, 0, 0)
Frame4.Position = UDim2.fromOffset(16, 46)
Frame4.BackgroundTransparency = 1
Frame4.AutomaticSize = Enum.AutomaticSize.Y
Frame4.ZIndex = 2
Frame4.Parent = Frame2

local UIPadding = Instance.new("UIPadding")

UIPadding.PaddingBottom = UDim.new(0, 16)
UIPadding.Parent = Frame4

local UIListLayout = Instance.new("UIListLayout")

UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = Frame4

local TextLabel2 = Instance.new("TextLabel")

TextLabel2.Name = "AccessPanel"
TextLabel2.Size = UDim2.new(1, 0, 0, 26)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = t1.name
TextLabel2.TextColor3 = t2.accent
TextLabel2.TextSize = 16
TextLabel2.Font = Enum.Font.GothamBold
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel2.LayoutOrder = 1
TextLabel2.ZIndex = 3
TextLabel2.Parent = Frame4

local Frame5 = Instance.new("Frame")

Frame5.Name = "InputContainer"
Frame5.Size = UDim2.new(1, 0, 0, 44)
Frame5.BackgroundColor3 = t2.inputBg
Frame5.BorderSizePixel = 0
Frame5.LayoutOrder = 2
Frame5.ZIndex = 3
Frame5.Parent = Frame4

local UICorner3 = Instance.new("UICorner")

UICorner3.CornerRadius = UDim.new(0, 10)
UICorner3.Parent = Frame5

local UIStroke2 = Instance.new("UIStroke")

UIStroke2.Color = t2.inputBorder
UIStroke2.Thickness = 1
UIStroke2.Transparency = 0.3
UIStroke2.Parent = Frame5

local TextBox = Instance.new("TextBox")

TextBox.Name = "KeyInput"
TextBox.Size = UDim2.new(1, -24, 1, 0)
TextBox.Position = UDim2.fromOffset(12, 0)
TextBox.BackgroundTransparency = 1
TextBox.PlaceholderText = "Enter your key here..."
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
TextBox.Text = ""
TextBox.TextColor3 = t2.textPrimary
TextBox.TextSize = 14
TextBox.Font = Enum.Font.Gotham
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = false
TextBox.ZIndex = 4
TextBox.Parent = Frame5
TextBox.Focused:Connect(function()
	TweenService:Create(UIStroke2, TweenInfo.new(0.2), {
		Color = t2.accent,
		Transparency = 0
	}):Play()
end)
TextBox.FocusLost:Connect(function()
	TweenService:Create(UIStroke2, TweenInfo.new(0.2), {
		Color = t2.inputBorder,
		Transparency = 0.3
	}):Play()
end)

local TextLabel3 = Instance.new("TextLabel")

TextLabel3.Name = "Status"
TextLabel3.Size = UDim2.new(1, 0, 0, 22)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Text = "Status: Waiting..."
TextLabel3.TextColor3 = t2.textSecondary
TextLabel3.TextSize = 13
TextLabel3.Font = Enum.Font.Gotham
TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
TextLabel3.LayoutOrder = 3
TextLabel3.ZIndex = 3
TextLabel3.Parent = Frame4

local Frame6 = Instance.new("Frame")

Frame6.Name = "Divider"
Frame6.Size = UDim2.new(1, 0, 0, 1)
Frame6.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Frame6.BorderSizePixel = 0
Frame6.LayoutOrder = 4
Frame6.ZIndex = 3
Frame6.Parent = Frame4

local function createTextButton(p4, p5, p6, p7)
	local buttonBg = p7 or t2.buttonBg
	local TextButton = Instance.new("TextButton")

	TextButton.Name = p4
	TextButton.Size = UDim2.new(1, 0, 0, 44)
	TextButton.BackgroundColor3 = buttonBg
	TextButton.Text = ""
	TextButton.BorderSizePixel = 0
	TextButton.LayoutOrder = p6
	TextButton.ZIndex = 3
	TextButton.AutoButtonColor = false
	TextButton.Parent = Frame4

	local UICorner4 = Instance.new("UICorner")

	UICorner4.CornerRadius = UDim.new(0, 10)
	UICorner4.Parent = TextButton

	local UIStroke3 = Instance.new("UIStroke")

	UIStroke3.Color = Color3.fromRGB(65, 65, 75)
	UIStroke3.Thickness = 1
	UIStroke3.Transparency = 0.5
	UIStroke3.Parent = TextButton

	local TextLabel4 = Instance.new("TextLabel")

	TextLabel4.Name = "Label"
	TextLabel4.Size = UDim2.new(1, 0, 1, 0)
	TextLabel4.BackgroundTransparency = 1
	TextLabel4.Text = p5 .. " " .. p4
	TextLabel4.TextColor3 = t2.textPrimary
	TextLabel4.TextSize = 14
	TextLabel4.Font = Enum.Font.GothamSemibold
	TextLabel4.ZIndex = 4
	TextLabel4.Parent = TextButton

	local v47 = buttonBg

	TextButton.MouseEnter:Connect(function()
		TweenService:Create(TextButton, TweenInfo.new(0.2), {
			BackgroundColor3 = Color3.fromRGB(math.min(v47.R * 255 + 15, 255), math.min(v47.G * 255 + 15, 255), math.min(v47.B * 255 + 15, 255))
		}):Play()
		TweenService:Create(UIStroke3, TweenInfo.new(0.2), {
			Transparency = 0
		}):Play()
	end)
	TextButton.MouseLeave:Connect(function()
		local t3 = {
			BackgroundColor3 = v47
		}

		TweenService:Create(TextButton, TweenInfo.new(0.2), t3):Play()
		TweenService:Create(UIStroke3, TweenInfo.new(0.2), {
			Transparency = 0.5
		}):Play()
	end)
	TextButton.MouseButton1Down:Connect(function()
		TweenService:Create(TextButton, TweenInfo.new(0.05), {
			Size = UDim2.new(1, -4, 0, 42)
		}):Play()
	end)
	TextButton.MouseButton1Up:Connect(function()
		TweenService:Create(TextButton, TweenInfo.new(0.1), {
			Size = UDim2.new(1, 0, 0, 44)
		}):Play()
	end)

	return TextButton
end

local submitKey = createTextButton("Submit Key", "🔒", 5, t2.accent)
local v50 = createTextButton("Get Key (Linkvertise Link)", "🔗", 6)
local v51 = createTextButton("Get Key (Linkvertise Prem Link)", "🔗", 7)
local v52 = createTextButton("Get Key (Work.ink Link)", "🔗", 8)
local discordLink = createTextButton("Discord Link", "💬", 9)
local u54 = false
local Position
local Position2

Frame3.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		u54 = true
		Position = input.Position
		Position2 = Frame2.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				u54 = false
			end
		end)
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if u54 then
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			local v57 = input.Position - Position
			local uDim2 = UDim2.new(Position2.X.Scale, Position2.X.Offset + v57.X, Position2.Y.Scale, Position2.Y.Offset + v57.Y)

			Frame2.Position = uDim2
			Frame.Position = UDim2.new(uDim2.X.Scale, uDim2.X.Offset + 4, uDim2.Y.Scale, uDim2.Y.Offset + 4)
		end
	end
end)

local function v59(p8, p9)
	TextLabel3.Text = "Status: " .. p8
	TextLabel3.TextColor3 = p9 or t2.textSecondary
end
local function v60(p10, p11)
	local function v61()
		if setclipboard then
			setclipboard(p10)
		end
	end

	pcall(v61)
	v59(p11 .. " copied!", t2.green)
end

local u62 = false

submitKey.MouseButton1Click:Connect(function()
	if u62 then
		return
	end

	local Text = TextBox.Text

	if Text == "" then
		v59("Please enter a key!", t2.red)

		return
	end

	u62 = true
	v59("Verifying...", t2.orange)
	task.spawn(function()
		local v64 = v13(Text)

		if v64 == "VALID" then
			v59("Key valid! Loading...", t2.green)
			v11(Text)
			task.wait(0.6)
			ScreenGui:Destroy()
			lib.load_script()
		elseif v64 == "HWID" then
			v59("Key locked to another device!", t2.red)
		else
			v59("Invalid key!", t2.red)
		end

		u62 = false
	end)
end)
v50.MouseButton1Click:Connect(function()
	v60(keyLink, "Linkvertise link")
end)
v51.MouseButton1Click:Connect(function()
	v60(premLink, "Linkvertise Prem link")
end)
v52.MouseButton1Click:Connect(function()
	v60(workinkLink, "Work.ink link")
end)
discordLink.MouseButton1Click:Connect(function()
	v60("https://discord.gg/" .. discord, "Discord link")
	pcall(function()
		local request_ = syn and syn.request or http and http.request or http_request or request

		if request_ then
			request_({
				Url = "http://127.0.0.1:6463/rpc?v=1",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
					origin = "https://discord.com"
				},
				Body = game:GetService("HttpService"):JSONEncode({
					cmd = "INVITE_BROWSER",
					args = {
						code = discord
					},
					nonce = "."
				})
			})
		end
	end)
end)
Frame2.Size = UDim2.fromOffset(440, 0)
Frame.Size = UDim2.fromOffset(440, 0)
Frame2.BackgroundTransparency = 1
Frame.BackgroundTransparency = 1
task.wait(0.1)
TweenService:Create(Frame2, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	BackgroundTransparency = 0
}):Play()
TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	BackgroundTransparency = 0.6
}):Play()
Frame2.Size = UDim2.fromOffset(440, 500)
Frame.Size = UDim2.fromOffset(440, 500)
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	Frame.Size = UDim2.fromOffset(440, UIListLayout.AbsoluteContentSize.Y + 46 + 16 + 16)
end)
v59("Waiting for key...", t2.textSecondary)
print("[" .. hub .. "] Key system loaded for " .. t1.name)
