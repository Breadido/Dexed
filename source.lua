
-- creadits to hoho hub old ui library for the button ripple effect

local dexed = {}

function dexed:DraggingEnabled(frame, parent)
	parent = parent or frame

	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0.15), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end


function dexed.SetupUI(title)
	local ScreenGui = Instance.new("ScreenGui")
	local Dexed = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local PageButton = Instance.new("ScrollingFrame")
	local PageListLayout = Instance.new("UIListLayout")
	local PageContents = Instance.new("Frame")

	ScreenGui.Parent = game.CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Dexed.Name = "Dexed"
	Dexed.Parent = ScreenGui
	Dexed.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	Dexed.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Dexed.BorderSizePixel = 0
	Dexed.Position = UDim2.new(0.209976792, 0, 0.208835348, 0)
	Dexed.Size = UDim2.new(0, 500, 0, 290)

	TextLabel.Parent = Dexed
	TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(0, 500, 0, 25)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.Text = "   "..title
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 16.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	dexed:DraggingEnabled(TextLabel, Dexed)

	PageButton.Name = "PageButton"
	PageButton.Parent = Dexed
	PageButton.Active = true
	PageButton.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	PageButton.BackgroundTransparency = 1.000
	PageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PageButton.BorderSizePixel = 0
	PageButton.Position = UDim2.new(0, 0, 0.113793105, 0)
	PageButton.Size = UDim2.new(0, 175, 0, 257)
	PageButton.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	PageButton.ScrollBarThickness = 5
	PageButton.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

	PageListLayout.Name = "PageListLayout"
	PageListLayout.Parent = PageButton
	PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	PageListLayout.Padding = UDim.new(0, 2)

	PageContents.Name = "PageContents"
	PageContents.Parent = Dexed
	PageContents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PageContents.BackgroundTransparency = 1.000
	PageContents.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PageContents.BorderSizePixel = 0
	PageContents.Position = UDim2.new(0.370000005, 0, 0.113793105, 0)
	PageContents.Size = UDim2.new(0, 315, 0, 257)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		PageButton.CanvasSize = UDim2.new(0,0,0,PageListLayout.AbsoluteContentSize.Y)
	end)

	local page = {}
	
	function page.CreatePage(pagetext)
		local Page = Instance.new("TextButton")
		local Page_2 = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")

		Page.Name = tostring(pagetext)
		Page.Parent = PageButton
		Page.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0.0285714287, 0, 0, 0)
		Page.Size = UDim2.new(0, 169, 0, 30)
		Page.AutoButtonColor = false
		Page.Font = Enum.Font.SourceSansBold
		Page.Text = "   "..tostring(pagetext)
		Page.TextColor3 = Color3.fromRGB(150,150,150)
		Page.TextSize = 16.000
		Page.TextXAlignment = Enum.TextXAlignment.Left

		Page_2.Name = tostring(pagetext)
		Page_2.Parent = PageContents
		Page_2.Active = true
		Page_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page_2.BackgroundTransparency = 1.000
		Page_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page_2.BorderSizePixel = 0
		Page_2.Size = UDim2.new(0, 315, 0, 257)
		Page_2.Visible = false
		Page_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		Page_2.ScrollBarThickness = 5
		Page_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

		UIListLayout.Parent = Page_2
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 2)
		
		game:GetService("RunService").RenderStepped:Connect(function()
			Page_2.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 2)
		end)

		Page.MouseButton1Click:Connect(function()
			for i, v in next, PageContents:GetChildren() do
				if v.ClassName == "ScrollingFrame" then
					v.Visible = false
				end
			end
			if PageContents[Page.Name] then
				PageContents[Page.Name].Visible = true
			end
		end)

		local dexedUIfeature = {}

		function dexedUIfeature.CreateButton(text, func)
			local Button = Instance.new("Frame")
			local ButtonFrameCorner = Instance.new("UICorner")
			local ButtonText = Instance.new("TextLabel")
			local ButtonTrigger = Instance.new("TextButton")

			Button.Name = "Button"
			Button.Parent = Page_2
			Button.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 310, 0, 30)

			ButtonFrameCorner.CornerRadius = UDim.new(0, 4)
			ButtonFrameCorner.Name = "ButtonFrameCorner"
			ButtonFrameCorner.Parent = Button

			ButtonText.Name = "ButtonText"
			ButtonText.Parent = Button
			ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.BackgroundTransparency = 1.000
			ButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonText.BorderSizePixel = 0
			ButtonText.Size = UDim2.new(0, 310, 0, 30)
			ButtonText.Font = Enum.Font.SourceSans
			ButtonText.Text = "   "..text
			ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.TextSize = 16.000
			ButtonText.TextXAlignment = Enum.TextXAlignment.Left

			ButtonTrigger.Name = "ButtonTrigger"
			ButtonTrigger.Parent = Button
			ButtonTrigger.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
			ButtonTrigger.BackgroundTransparency = 1.000
			ButtonTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonTrigger.BorderSizePixel = 0
			ButtonTrigger.Size = UDim2.new(0, 310, 0, 30)
			ButtonTrigger.AutoButtonColor = false
			ButtonTrigger.Font = Enum.Font.SourceSans
			ButtonTrigger.Text = ""
			ButtonTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
			ButtonTrigger.TextSize = 14.000

			local Circle = Instance.new("ImageLabel")
			Circle.Name = "Circle"
			Circle.BackgroundColor3 = Color3.new(1, 1, 1)
			Circle.BackgroundTransparency = 1
			Circle.Image = "rbxassetid://266543268"
			Circle.ImageTransparency = 0.5

			local function Resize(part, new, _delay)
				_delay = _delay or 0.5
				local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local tween = game:GetService("TweenService"):Create(part, tweenInfo, new)
				tween:Play()
			end

			local function ripple(button, x, y)
				spawn(function()
					button.ClipsDescendants = true
					local circle = Circle:Clone()
					circle.Parent = button
					circle.ZIndex = 1000
					local new_x = x - circle.AbsolutePosition.X
					local new_y = y - circle.AbsolutePosition.Y
					circle.Position = UDim2.new(0, new_x, 0, new_y)
					local size = 0
					if button.AbsoluteSize.X > button.AbsoluteSize.Y then
						size = button.AbsoluteSize.X * 1.5
					elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
						size = button.AbsoluteSize.Y * 1.5
					elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
						size = button.AbsoluteSize.X * 1.5
					end
					circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
					Resize(circle, {ImageTransparency = 1}, 0.5)

					wait(0.5)
					circle:Destroy()
				end)
			end


			ButtonTrigger.MouseButton1Click:Connect(function()
				func()
				ripple(ButtonTrigger, game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y)
			end)
		end

		function dexedUIfeature.CreateToggle(text, func)
			local Toggle = Instance.new("Frame")
			local ToggleFrameCorner = Instance.new("UICorner")
			local ToggleText = Instance.new("TextLabel")
			local ToggleTrigger = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")

			Toggle.Name = "Toggle"
			Toggle.Parent = Page_2
			Toggle.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 310, 0, 30)

			ToggleFrameCorner.CornerRadius = UDim.new(0, 4)
			ToggleFrameCorner.Name = "ToggleFrameCorner"
			ToggleFrameCorner.Parent = Toggle

			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleText.BorderSizePixel = 0
			ToggleText.Size = UDim2.new(0, 310, 0, 30)
			ToggleText.Font = Enum.Font.SourceSans
			ToggleText.Text = "   "..text
			ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.TextSize = 16.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left

			ToggleTrigger.Name = "ToggleTrigger"
			ToggleTrigger.Parent = Toggle
			ToggleTrigger.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
			ToggleTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleTrigger.BorderSizePixel = 0
			ToggleTrigger.Position = UDim2.new(0.90322578, 0, 0.166666672, 0)
			ToggleTrigger.Size = UDim2.new(0, 20, 0, 20)
			ToggleTrigger.AutoButtonColor = false
			ToggleTrigger.Font = Enum.Font.SourceSans
			ToggleTrigger.Text = ""
			ToggleTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleTrigger.TextSize = 14.000

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = ToggleTrigger

			local toggled = false

			ToggleTrigger.MouseButton1Click:Connect(function()
				if toggled == false then
					toggled = true
					func(toggled)
					game:GetService("TweenService"):Create(ToggleTrigger, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(8, 180, 94)}):Play()
				else
					toggled = false
					func(toggled)
					game:GetService("TweenService"):Create(ToggleTrigger, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(29,29,29)}):Play()
				end
			end)	
		end

		function dexedUIfeature.CreateSlider(text, min, max, func)
			local Slider = Instance.new("Frame")
			local SliderFrameCorner = Instance.new("UICorner")
			local SliderText = Instance.new("TextLabel")
			local SliderValue = Instance.new("TextLabel")
			local Slider2 = Instance.new("CanvasGroup")
			local Slider2Corner = Instance.new("UICorner")
			local Slider2Fill = Instance.new("Frame")
			local Slider2FillTrigger = Instance.new("TextButton")

			Slider.Name = "Slider"
			Slider.Parent = Page_2
			Slider.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0, 0, 0.249027237, 0)
			Slider.Size = UDim2.new(0, 310, 0, 55)

			SliderFrameCorner.CornerRadius = UDim.new(0, 4)
			SliderFrameCorner.Name = "SliderFrameCorner"
			SliderFrameCorner.Parent = Slider

			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 1.000
			SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderText.BorderSizePixel = 0
			SliderText.Size = UDim2.new(0, 310, 0, 30)
			SliderText.Font = Enum.Font.SourceSans
			SliderText.Text = "   "..text
			SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.TextSize = 16.000
			SliderText.TextXAlignment = Enum.TextXAlignment.Left

			SliderValue.Name = "SliderValue"
			SliderValue.Parent = Slider
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderValue.BorderSizePixel = 0
			SliderValue.Position = UDim2.new(0.806451619, 0, 0.654545426, 0)
			SliderValue.Size = UDim2.new(0, 55, 0, 10)
			SliderValue.Font = Enum.Font.SourceSansSemibold
			SliderValue.Text = "0"
			SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.TextSize = 16.000

			Slider2.Name = "Slider"
			Slider2.Position = UDim2.new(0.029,0,0.655,0)
			Slider2.Parent = Slider
			Slider2.Size = UDim2.new(0, 235,0, 9)
			Slider2.BackgroundColor3 = Color3.fromRGB(53,53,53)
			Slider2.BorderColor3 = Color3.fromRGB(0,0,0)
			Slider2.Active = false

			Slider2Corner.Parent = Slider2
			Slider2Corner.Name = "Slider2Corner"
			Slider2Corner.CornerRadius = UDim.new(0,3)

			Slider2Fill.Parent = Slider2
			Slider2Fill.Name = "Slider2Fill"
			Slider2Fill.Position = UDim2.new(0,0,0,0)
			Slider2Fill.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Slider2Fill.Size = UDim2.new(0,0,0,10)
			Slider2Fill.BorderSizePixel = 0
			Slider2Fill.Active = false
			
			Slider2FillTrigger.Parent = Slider2
			Slider2FillTrigger.Name = "Slider2FillTrigger"
			Slider2FillTrigger.BackgroundTransparency = 1
			Slider2FillTrigger.Position = UDim2.new(0,0,0,0)
			Slider2FillTrigger.Size = UDim2.new(0,234,0,9)
			Slider2FillTrigger.Text = ""
			
			local minvalue = tonumber(min)
			local maxvalue = tonumber(max)

			local Trigger = Slider2FillTrigger
			local TextLabel = SliderValue
			local Fill = Slider2Fill
			local Parent = Slider

			local dragging = true
			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			local Value = 0

			Trigger.MouseButton1Down:Connect(function()
				TextLabel.Text = Value
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 260) * Fill.AbsoluteSize.X) + tonumber(minvalue)) or 0
				func(Value)
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
				Fill.Size = UDim2.new(0, math.clamp(mouse.X - Fill.AbsolutePosition.X, 0, 260), 0, 16)
				moveconnection = mouse.Move:Connect(function()
					TextLabel.Text = Value
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 260) * Fill.AbsoluteSize.X) + tonumber(minvalue))
					func(Value)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
					Fill.Size = UDim2.new(0, math.clamp(mouse.X - Fill.AbsolutePosition.X, 0, 260), 0, 16)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 260) * Fill.AbsoluteSize.X) + tonumber(minvalue))
						func(Value)
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
						Fill.Size = UDim2.new(0, math.clamp(mouse.X - Fill.AbsolutePosition.X, 0, 260), 0, 16)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
		end
		
		function dexedUIfeature.CreateDropdown(text, tablelist, func)
			local tablelist = tablelist or {"Option"}
			
			local Dropdown = Instance.new("Frame")
			local DropdownFrameCorner = Instance.new("UICorner")
			local DropdownText = Instance.new("TextLabel")
			local OptionList = Instance.new("ScrollingFrame")
			local OptionListLayout = Instance.new("UIListLayout")
			local DropdownTrigger = Instance.new("TextButton")

			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = Page_2
			Dropdown.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.Position = UDim2.new(0, 0, 0.0544747077, 0)
			Dropdown.Size = UDim2.new(0, 310, 0, 30)

			DropdownFrameCorner.CornerRadius = UDim.new(0, 4)
			DropdownFrameCorner.Name = "DropdownFrameCorner"
			DropdownFrameCorner.Parent = Dropdown

			DropdownText.Name = "DropdownText"
			DropdownText.Parent = Dropdown
			DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownText.BackgroundTransparency = 1.000
			DropdownText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownText.BorderSizePixel = 0
			DropdownText.Size = UDim2.new(0, 310, 0, 30)
			DropdownText.Font = Enum.Font.SourceSans
			DropdownText.Text = "   "..text
			DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownText.TextSize = 16.000
			DropdownText.TextXAlignment = Enum.TextXAlignment.Left

			OptionList.Name = "OptionList"
			OptionList.Parent = Dropdown
			OptionList.Active = true
			OptionList.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			OptionList.BorderColor3 = Color3.fromRGB(0, 0, 0)
			OptionList.BorderSizePixel = 0
			OptionList.Position = UDim2.new(0, 0, 0.200000003, 0)
			OptionList.Size = UDim2.new(0, 310, 0, 120)
			OptionList.Visible = false
			OptionList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			OptionList.ScrollBarThickness = 10
			OptionList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			
			OptionListLayout.Name = "OptionListLayout"
			OptionListLayout.Parent = OptionList
			OptionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			
			DropdownTrigger.Name = "DropdownTrigger"
			DropdownTrigger.Parent = Dropdown
			DropdownTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTrigger.BackgroundTransparency = 1.000
			DropdownTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownTrigger.BorderSizePixel = 0
			DropdownTrigger.Position = UDim2.new(0.90322578, 0, -0.0133333337, 0)
			DropdownTrigger.Size = UDim2.new(0, 30, 0, 30)
			DropdownTrigger.AutoButtonColor = false
			DropdownTrigger.Font = Enum.Font.SourceSansBold
			DropdownTrigger.Text = "+"
			DropdownTrigger.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTrigger.TextSize = 20.000
			
			local opened = false
			local dropdowntrig = DropdownTrigger
			local optionlist = OptionList
			
			game:GetService("RunService").RenderStepped:Connect(function()
				optionlist.CanvasSize = UDim2.new(0,0,0,OptionListLayout.AbsoluteContentSize.Y)
			end)
			
			for i, v in next, tablelist do
				local Option = Instance.new("TextButton")
				local OptionIndicator = Instance.new("Frame")
				local TextLabell = Instance.new("TextLabel")
				
				Option.Name = "Option"
				Option.Parent = OptionList
				Option.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Option.BorderSizePixel = 0
				Option.Size = UDim2.new(0, 300, 0, 20)
				Option.Font = Enum.Font.SourceSans
				Option.Text = ""
				Option.TextColor3 = Color3.fromRGB(255, 255, 255)
				Option.TextSize = 14.000
				Option.TextXAlignment = Enum.TextXAlignment.Left

				OptionIndicator.Name = "OptionIndicator"
				OptionIndicator.Parent = Option
				OptionIndicator.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				OptionIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OptionIndicator.BorderSizePixel = 0
				OptionIndicator.Position = UDim2.new(0.983333349, 0, 0.100000001, 0)
				OptionIndicator.Size = UDim2.new(0, 5, 0, 15)
				
				TextLabell.Name = "OptionText"
				TextLabell.Parent = Option
				TextLabell.Font = Enum.Font.SourceSans
				TextLabell.Text = tostring(v)
				TextLabell.TextColor3 = Color3.fromRGB(255,255,255)
				TextLabell.BorderSizePixel = 0
				TextLabell.TextXAlignment = Enum.TextXAlignment.Left
				TextLabell.TextSize = 14
				TextLabell.BackgroundTransparency = 1
				TextLabell.Position = UDim2.new(0.03, 0,0, 0)
				TextLabell.Size = UDim2.new(0,285,0,20)
			end

			dropdowntrig.MouseButton1Click:Connect(function()
				if opened == false then
					opened = true
					game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.1), {Size = UDim2.new(0,310,0,150)}):Play()
					wait(0.1)
					optionlist.Visible = true
				else
					opened = false
					game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.1), {Size = UDim2.new(0,310,0,30)}):Play()
					optionlist.Visible = false
				end
			end)
			
			for i, v in next, optionlist:GetChildren() do
				if v.ClassName == "TextButton" and v.Name == "Option" then
					v.MouseButton1Click:connect(function()
						for ii, vv in next, optionlist:GetChildren() do
							if vv.ClassName == "TextButton" and vv.Name == "Option" then
								vv.OptionIndicator.BackgroundColor3 = Color3.fromRGB(55,55,55)
							end
						end
						v.OptionIndicator.BackgroundColor3 = Color3.fromRGB(8, 180, 94)
						func(v.OptionText.Text)
					end)
				end
			end
			
			local dropdownFeature = {}
			
			function dropdownFeature.ClearDropdownList()
				for i, v in next, optionlist:GetChildren() do
					if v.ClassName == "TextButton" and v.Name == "Option" then
						v:Destroy()
					end
				end
			end
			
			function dropdownFeature.CreateOption(text)
				local Option = Instance.new("TextButton")
				local OptionIndicator = Instance.new("Frame")
				local TextLabell = Instance.new("TextLabel")

				Option.Name = "Option"
				Option.Parent = OptionList
				Option.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Option.BorderSizePixel = 0
				Option.Size = UDim2.new(0, 300, 0, 20)
				Option.Font = Enum.Font.SourceSans
				Option.Text = ""
				Option.TextColor3 = Color3.fromRGB(255, 255, 255)
				Option.TextSize = 14.000
				Option.TextXAlignment = Enum.TextXAlignment.Left

				OptionIndicator.Name = "OptionIndicator"
				OptionIndicator.Parent = Option
				OptionIndicator.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				OptionIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OptionIndicator.BorderSizePixel = 0
				OptionIndicator.Position = UDim2.new(0.983333349, 0, 0.100000001, 0)
				OptionIndicator.Size = UDim2.new(0, 5, 0, 15)

				TextLabell.Name = "OptionText"
				TextLabell.Parent = Option
				TextLabell.Font = Enum.Font.SourceSans
				TextLabell.Text = tostring(text)
				TextLabell.TextColor3 = Color3.fromRGB(255,255,255)
				TextLabell.BorderSizePixel = 0
				TextLabell.TextXAlignment = Enum.TextXAlignment.Left
				TextLabell.TextSize = 14
				TextLabell.BackgroundTransparency = 1
				TextLabell.Position = UDim2.new(0.03, 0,0, 0)
				TextLabell.Size = UDim2.new(0,285,0,20)
				
				for i, v in next, optionlist:GetChildren() do
					if v.ClassName == "TextButton" and v.Name == "Option" then
						v.MouseButton1Click:connect(function()
							for ii, vv in next, optionlist:GetChildren() do
								if vv.ClassName == "TextButton" and vv.Name == "Option" then
									vv.OptionIndicator.BackgroundColor3 = Color3.fromRGB(55,55,55)
								end
							end
							v.OptionIndicator.BackgroundColor3 = Color3.fromRGB(8, 180, 94)
							func(v.OptionText.Text)
						end)
					end
				end
			end
			return dropdownFeature
		end
		
		function dexedUIfeature.CreateLabel(text)
			local Label = Instance.new("Frame")
			local LabelFrameCorner = Instance.new("UICorner")
			local LabelText = Instance.new("TextLabel")
			local LabelTrigger = Instance.new("TextButton")

			Label.Name = "Button"
			Label.Parent = Page_2
			Label.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 310, 0, 20)

			LabelFrameCorner.CornerRadius = UDim.new(0, 4)
			LabelFrameCorner.Name = "ButtonFrameCorner"
			LabelFrameCorner.Parent = Label

			LabelText.Name = "ButtonText"
			LabelText.Parent = Label
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LabelText.BorderSizePixel = 0
			LabelText.Size = UDim2.new(0, 310, 0, 20)
			LabelText.Font = Enum.Font.SourceSans
			LabelText.Text = "   "..text
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 16.000
			LabelText.TextXAlignment = Enum.TextXAlignment.Left

			LabelTrigger.Name = "ButtonTrigger"
			LabelTrigger.Parent = Label
			LabelTrigger.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
			LabelTrigger.BackgroundTransparency = 1.000
			LabelTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LabelTrigger.BorderSizePixel = 0
			LabelTrigger.Size = UDim2.new(0, 310, 0, 20)
			LabelTrigger.AutoButtonColor = false
			LabelTrigger.Font = Enum.Font.SourceSans
			LabelTrigger.Text = ""
			LabelTrigger.TextColor3 = Color3.fromRGB(0, 0, 0)
			LabelTrigger.TextSize = 14.000
		end

		return dexedUIfeature
	end
	return page
end
return dexed
