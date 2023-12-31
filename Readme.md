## Example
```lua
local dexed = loadstring(game:HttpGet('https://raw.githubusercontent.com/Breadido/Dexed/main/source.lua'))()
local ui = dexed.SetupUI("cool ui library ig")
local page = ui.CreatePage("Page")
page.CreateButton("cool button ig", function()
	print("Clicked!... YAY!")
end)
page.CreateToggle("cool toggle ig", function(a)
	print(a)
end)
page.CreateSlider("cool slider ig", 16, 500, function(a)
	print(a)
end)
local ForRefreshDropdown = {"No","More","Fruit","List","For","You","Bud","LOL"}
local dropdown = page.CreateDropdown("What Is Your Favorite Fruits?", {"Mango","Strawberry","Grapes","Blueberry","Bananas","Watermelon","Melon","Apples"},function(a)
	print(a)
end)
page.CreateButton("Refresh Dropdown", function()
	dropdown.ClearDropdownList()
	wait(0.1)
	for i, v in next, ForRefreshDropdown do
		dropdown.CreateOption(v)
	end
end)
page.CreateLabel("LABELL")
```
## Preview
![image](https://github.com/Breadido/Dexed/assets/142183346/eb42e2fe-62a2-4004-bd45-6b609e1f9911)
