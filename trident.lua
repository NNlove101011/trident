local player = game.Players.LocalPlayer local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Example Hub (Rename This!)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({ Name = "Tab 1", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local Section = Tab:AddSection({ Name = "LocalPlayer" }) --[[ Name = - название раздела ]]. OrionLib:MakeNotification({ Name = "Welcome!", Content = "Welcome to my hub!", Image = "rbxassetid://4483345998", Time = 5 })
