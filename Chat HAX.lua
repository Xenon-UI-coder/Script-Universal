--Chat HAX
--[[

░█████╗░██╗░░██╗░█████╗░████████╗  ██╗░░██╗░█████╗░██╗░░██╗
██╔══██╗██║░░██║██╔══██╗╚══██╔══╝  ██║░░██║██╔══██╗╚██╗██╔╝
██║░░╚═╝███████║███████║░░░██║░░░  ███████║███████║░╚███╔╝░
██║░░██╗██╔══██║██╔══██║░░░██║░░░  ██╔══██║██╔══██║░██╔██╗░
╚█████╔╝██║░░██║██║░░██║░░░██║░░░  ██║░░██║██║░░██║██╔╝╚██╗
░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░  ╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝
                                                  
-- Script Info --
TITLE: CHAT HAX [FE]
AUTHOR: SECURITY HACKER
SERVER-SIDED: Yes
EXECUTOR REQUIRED: Any
------------------

This script is from Security Hacker

]]

----- Configuration -----
local hotkey = "P" -- The message should be sent when the key is pressed
-------------------------

------------------------------------------------------
function MainExploit()
	local FakeMessageGUI = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Topbar = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local TextLabel2 = Instance.new("TextLabel")
	local usermessagef = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local UMessage = Instance.new("TextBox")
	local TextLabel3 = Instance.new("TextLabel")
	local systemprefixf = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local SPrefix = Instance.new("TextBox")
	local TextLabel4 = Instance.new("TextLabel")
	local systemmessagef = Instance.new("Frame")
	local UICorner_7 = Instance.new("UICorner")
	local SMessage = Instance.new("TextBox")
	local Send = Instance.new("TextButton")
	local UICorner_8 = Instance.new("UICorner")
	
	FakeMessageGUI.Name = "FakeMessageGUI"
	FakeMessageGUI.Parent = game.Players.LocalPlayer.PlayerGui
	FakeMessageGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	FakeMessageGUI.DisplayOrder = 10000
	FakeMessageGUI.ResetOnSpawn = false
	
	Frame.Parent = FakeMessageGUI
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.0237248112, 0, 0.685258985, 0)
	Frame.Size = UDim2.new(0.322657138, 0, 0.292828679, 0)
	
	UICorner.Parent = Frame
	
	Topbar.Name = "Topbar"
	Topbar.Parent = Frame
	Topbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Topbar.BorderSizePixel = 0
	Topbar.Position = UDim2.new(0.0367646813, 0, 0.0408163257, 0)
	Topbar.Size = UDim2.new(0.93750006, 0, 0.163265303, 0)
	Topbar.ZIndex = 2
	
	UICorner_2.Parent = Topbar
	
	TextLabel.Parent = Topbar
	TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.054901965, 0, 0, 0)
	TextLabel.Size = UDim2.new(0.886274636, 0, 1, 0)
	TextLabel.Font = Enum.Font.GothamBlack
	TextLabel.Text = "Chat hax"
	TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	
	
	TextLabel2.Name = "TextLabel2"
	TextLabel2.Parent = Frame
	TextLabel2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel2.BackgroundTransparency = 1.000
	TextLabel2.BorderSizePixel = 0
	TextLabel2.Position = UDim2.new(0.0330882557, 0, 0.278911561, 0)
	TextLabel2.Size = UDim2.new(0.352941185, 0, 0.108843535, 0)
	TextLabel2.Font = Enum.Font.ArialBold
	TextLabel2.Text = "Your Message: "
	TextLabel2.TextColor3 = Color3.fromRGB(0, 255, 0)
	TextLabel2.TextScaled = true
	TextLabel2.TextSize = 14.000
	TextLabel2.TextWrapped = true
	TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
	
	usermessagef.Name = "usermessagef"
	usermessagef.Parent = Frame
	usermessagef.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	usermessagef.BorderSizePixel = 0
	usermessagef.Position = UDim2.new(0.386029392, 0, 0.278911561, 0)
	usermessagef.Size = UDim2.new(0.588235378, 0, 0.122448981, 0)
	
	UICorner_5.CornerRadius = UDim.new(0, 3)
	UICorner_5.Parent = usermessagef
	
	UMessage.Name = "UMessage"
	UMessage.Parent = usermessagef
	UMessage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	UMessage.BackgroundTransparency = 1.000
	UMessage.BorderColor3 = Color3.fromRGB(27, 42, 53)
	UMessage.BorderSizePixel = 0
	UMessage.Position = UDim2.new(0.0437499993, 0, 0, 0)
	UMessage.Size = UDim2.new(0.906250179, 0, 0.888888896, 0)
	UMessage.Font = Enum.Font.SourceSans
	UMessage.PlaceholderColor3 = Color3.fromRGB(0, 255, 0)
	UMessage.PlaceholderText = ""
	UMessage.Text = ""
	UMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
	UMessage.TextScaled = true
	UMessage.TextSize = 14.000
	UMessage.TextWrapped = true
	UMessage.TextXAlignment = Enum.TextXAlignment.Left
	
	TextLabel3.Name = "TextLabel3"
	TextLabel3.Parent = Frame
	TextLabel3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel3.BackgroundTransparency = 1.000
	TextLabel3.BorderSizePixel = 0
	TextLabel3.Position = UDim2.new(0.0294117853, 0, 0.442176878, 0)
	TextLabel3.Size = UDim2.new(0.352941185, 0, 0.108843535, 0)
	TextLabel3.Font = Enum.Font.ArialBold
	TextLabel3.Text = "Username"
	TextLabel3.TextColor3 = Color3.fromRGB(0, 255, 0)
	TextLabel3.TextScaled = true
	TextLabel3.TextSize = 14.000
	TextLabel3.TextWrapped = true
	TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
	
	systemprefixf.Name = "systemprefixf"
	systemprefixf.Parent = Frame
	systemprefixf.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	systemprefixf.BorderSizePixel = 0
	systemprefixf.Position = UDim2.new(0.386029392, 0, 0.442176878, 0)
	systemprefixf.Size = UDim2.new(0.588235378, 0, 0.122448981, 0)
	
	UICorner_6.CornerRadius = UDim.new(0, 3)
	UICorner_6.Parent = systemprefixf
	
	SPrefix.Name = "SPrefix"
	SPrefix.Parent = systemprefixf
	SPrefix.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	SPrefix.BackgroundTransparency = 1.000
	SPrefix.BorderColor3 = Color3.fromRGB(27, 42, 53)
	SPrefix.BorderSizePixel = 0
	SPrefix.Position = UDim2.new(0.0437499993, 0, 0, 0)
	SPrefix.Size = UDim2.new(0.906250179, 0, 0.888888896, 0)
	SPrefix.ClearTextOnFocus = false
	SPrefix.Font = Enum.Font.SourceSans
	SPrefix.PlaceholderColor3 = Color3.fromRGB(0, 255, 0)
	SPrefix.PlaceholderText = ""
	SPrefix.Text = ""
	SPrefix.TextColor3 = Color3.fromRGB(0, 255, 0)
	SPrefix.TextScaled = true
	SPrefix.TextSize = 14.000
	SPrefix.TextWrapped = true
	SPrefix.TextXAlignment = Enum.TextXAlignment.Left
	
	TextLabel4.Name = "TextLabel4"
	TextLabel4.Parent = Frame
	TextLabel4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel4.BackgroundTransparency = 1.000
	TextLabel4.BorderSizePixel = 0
	TextLabel4.Position = UDim2.new(0.0294117816, 0, 0.612244904, 0)
	TextLabel4.Size = UDim2.new(0.356617659, 0, 0.0952380896, 0)
	TextLabel4.Font = Enum.Font.ArialBold
	TextLabel4.Text = "Message:"
	TextLabel4.TextColor3 = Color3.fromRGB(0, 255, 0)
	TextLabel4.TextScaled = true
	TextLabel4.TextSize = 14.000
	TextLabel4.TextWrapped = true
	TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
	
	systemmessagef.Name = "systemmessagef"
	systemmessagef.Parent = Frame
	systemmessagef.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	systemmessagef.BorderSizePixel = 0
	systemmessagef.Position = UDim2.new(0.386029392, 0, 0.612244904, 0)
	systemmessagef.Size = UDim2.new(0.588235378, 0, 0.346938789, 0)
	
	UICorner_7.CornerRadius = UDim.new(0, 3)
	UICorner_7.Parent = systemmessagef
	
	SMessage.Name = "SMessage"
	SMessage.Parent = systemmessagef
	SMessage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	SMessage.BackgroundTransparency = 1.000
	SMessage.BorderColor3 = Color3.fromRGB(27, 42, 53)
	SMessage.BorderSizePixel = 0
	SMessage.Position = UDim2.new(0.0437499993, 0, 0, 0)
	SMessage.Size = UDim2.new(0.918749988, 0, 0.999999762, 0)
	SMessage.ClearTextOnFocus = false
	SMessage.Font = Enum.Font.SourceSans
	SMessage.PlaceholderColor3 = Color3.fromRGB(99, 110, 114)
	SMessage.PlaceholderText = ""
	SMessage.Text = ""
	SMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
	SMessage.TextSize = 14.000
	SMessage.TextWrapped = true
	SMessage.TextXAlignment = Enum.TextXAlignment.Left
	SMessage.TextYAlignment = Enum.TextYAlignment.Top
	
	Send.Name = "Send"
	Send.Parent = Frame
	Send.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Send.BorderSizePixel = 0
	Send.Position = UDim2.new(0.0330882259, 0, 0.795918405, 0)
	Send.Size = UDim2.new(0.319853008, 0, 0.122448981, 0)
	Send.Font = Enum.Font.SourceSans
	local fakekey = string.upper(hotkey)
	Send.Text = "Send [".. fakekey.. "]"
	Send.TextColor3 = Color3.fromRGB(0, 255, 0)
	Send.TextScaled = true
	Send.TextSize = 14.000
	Send.TextWrapped = true
	
	UICorner_8.CornerRadius = UDim.new(0, 3)
	UICorner_8.Parent = Send
	
	
	local function TTJVP_fake_script() -- Frame.Dragify 
		local script = Instance.new('LocalScript', Frame)
		
		local UIS = game:GetService("UserInputService")
		local function dragify(Frame)
			local dragToggle = nil
			local dragSpeed = 0
			local dragInput = nil
			local dragStart = nil
			local dragPos = nil
			function updateInput(input)
				local Delta = input.Position - dragStart
				local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
				game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
			end
			Frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
					dragToggle = true
					dragStart = input.Position
					startPos = Frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
			Frame.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == dragInput and dragToggle then
					updateInput(input)
				end
			end)
		end
		
		dragify(script.Parent)
	end
	coroutine.wrap(TTJVP_fake_script)()
	
	local script = Instance.new('LocalScript', Frame)
	
	local pg = game.Players.LocalPlayer.PlayerGui:WaitForChild("FakeMessageGUI").Frame
	
	local UMessage = pg.usermessagef.UMessage
	local SPrefix = pg.systemprefixf.SPrefix
	local SMessage = pg.systemmessagef.SMessage
	local SendB = pg.Send
	
	SendB.MouseButton1Click:Connect(function()
		local A_1   = UMessage.Text.."                                                                                                                                              ".. SPrefix.Text.. " ".. SMessage.Text
		local A_2   = "All"
		local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
		Event:FireServer(A_1, A_2)
		print("Sent fake message.")
	end)
	
	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	local actualkey = string.lower(hotkey)
	
	mouse.KeyDown:connect(function(key)
		if key == actualkey then
			local A_1   = UMessage.Text .."                                                                                                                                              ".. SPrefix.Text.. " ".. SMessage.Text
			local A_2   = "All"
			local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
			Event:FireServer(A_1, A_2)
			print("Sent fake message.")
		end
	end)
end
------------------------------------------------------

local Loader = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local t1 = Instance.new("TextLabel")
local t2 = Instance.new("TextLabel")
local SubjectFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Subject = Instance.new("TextLabel")
local t3 = Instance.new("TextLabel")

Loader.Name = "Loader"
Loader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loader.DisplayOrder = 10000

Background.Name = "Background"
Background.Parent = Loader
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.ClipsDescendants = true
Background.Position = UDim2.new(0.499000013, 0, 0.353784859, 0)
Background.Size = UDim2.new(0, 0, 0.288844615, 0)

UICorner.Parent = Background

t1.Name = "t1"
t1.Parent = Background
t1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
t1.BackgroundTransparency = 1.000
t1.BorderSizePixel = 0
t1.Position = UDim2.new(0.0808080807, 0, 0.110344827, 0)
t1.Size = UDim2.new(0.835016727, 0, 0.296551734, 0)
t1.Font = Enum.Font.GothamBlack
t1.Text = "Chat hax [FE]"
t1.TextColor3 = Color3.fromRGB(0, 255, 0)
t1.TextScaled = true
t1.TextSize = 14.000
t1.TextTransparency = 1.000
t1.TextWrapped = true

t2.Name = "t2"
t2.Parent = Background
t2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
t2.BackgroundTransparency = 1.000
t2.BorderSizePixel = 0
t2.Position = UDim2.new(0.0808080807, 0, 0.351724148, 0)
t2.Size = UDim2.new(0.835016727, 0, 0.137931034, 0)
t2.Font = Enum.Font.SourceSansLight
t2.Text = "by Security Hacker [Edit by AOC]"
t2.TextColor3 = Color3.fromRGB(0, 255, 0)
t2.TextScaled = true
t2.TextSize = 14.000
t2.TextTransparency = 1.000
t2.TextWrapped = true

SubjectFrame.Name = "SubjectFrame"
SubjectFrame.Parent = Background
SubjectFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SubjectFrame.BorderSizePixel = 0
SubjectFrame.Position = UDim2.new(0.0419999994, 0, 1, 0)
SubjectFrame.Size = UDim2.new(0.923149765, 0, 0.275065273, 0)

UICorner_2.Parent = SubjectFrame

local SUBJECT = "Thanks for using"
Subject.Name = "Subject"
Subject.Parent = SubjectFrame
Subject.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Subject.BackgroundTransparency = 1.000
Subject.BorderSizePixel = 0
Subject.Position = UDim2.new(0.0420838557, 0, 0.0752172545, 0)
Subject.Size = UDim2.new(0.904530346, 0, 0.849565387, 0)
Subject.Font = Enum.Font.SourceSansBold
Subject.Text = SUBJECT
Subject.TextColor3 = Color3.fromRGB(0, 255, 0)
Subject.TextScaled = true
Subject.TextSize = 14.000
Subject.TextWrapped = true

t3.Name = "t3"
t3.Parent = Background
t3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
t3.BackgroundTransparency = 1.000
t3.BorderSizePixel = 0
t3.Position = UDim2.new(0.434343427, 0, 0.845555723, 0)
t3.Size = UDim2.new(0.134680107, 0, 0.154444426, 0)
t3.Font = Enum.Font.ArialBold
t3.Text = "Loading."
t3.TextColor3 = Color3.fromRGB(0, 255, 0)
t3.TextScaled = true
t3.TextSize = 14.000
t3.TextTransparency = 1.000
t3.TextWrapped = true

local function DZNO_fake_script()
	local script = Instance.new('LocalScript', t3)

	while true do
		wait(0.5)
		script.Parent.Text = "Loading.."
		wait(0.5)
		script.Parent.Text = "Loading..."
	end
end
coroutine.wrap(DZNO_fake_script)()

local function GLEDHUR_fake_script()
	local script = Instance.new('LocalScript', Loader)

	local BG = script.Parent.Background
	local SF = script.Parent.Background.SubjectFrame
	
	wait(2)
	BG:TweenSizeAndPosition(UDim2.new(0.362, 0, 0.289, 0), UDim2.new(0.319, 0, 0.355, 0), 'Out', 'Quint', 2)
	wait(2)
	local Info = TweenInfo.new(0.5)
	local Tween = game:GetService("TweenService"):Create(BG.t1,Info,{TextTransparency=0})
	local Tween2 = game:GetService("TweenService"):Create(BG.t2,Info,{TextTransparency=0})
	local Tween3 = game:GetService("TweenService"):Create(BG.t3,Info,{TextTransparency=0})
	Tween:Play()
	Tween2:Play()
	wait(1.5)
	SF:TweenPosition(UDim2.new(0.042, 0, 0.57, 0), 'Out', 'Quad', 0.5)
	wait(1)
	Tween3:Play()
	local loadwait = math.random(2,4)
	wait(loadwait)
	BG.t3.LocalScript:Destroy()
	wait(0.1)
	BG.t3.Text = "Loading.."
	MainExploit()
	wait(1)
	BG.t3.Text = "Ready!"
	wait(1.5)
	BG:TweenPosition(UDim2.new(0.319, 0, -0.4, 0), 'InOut', 'Quad', 1.5)
	wait(2)
	script.Parent:Destroy()
end
coroutine.wrap(GLEDHUR_fake_script)()