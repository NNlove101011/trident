local player = game.Players.LocalPlayer local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "NNhub", HidePremium = false, SaveConfig = true, ConfigFolder = "NNhub"})
local Tab = Window:MakeTab({ Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local Section = Tab:AddSection({ Name = "LocalPlayer" }) --[[ Name = - название раздела ]]. OrionLib:MakeNotification({ Name = "Welcome!", Content = "Welcome to my hub!", Image = "rbxassetid://4483345998", Time = 5 })
Selction:NewButton("ESP", "ButtonInfo", function() 
       local BoxESP = {}
function BoxESP.Create(Player)
    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.fromRGB(194, 17, 17)
    Box.Filled = false
    Box.Transparency = 0.50
    Box.Thickness = 3

    local Updater

    local function UpdateBox()
        if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
            local Target2dPosition, IsVisible = workspace.CurrentCamera:WorldToViewportPoint(Player.HumanoidRootPart.Position)
            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(workspace.CurrentCamera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(40 * scale_factor), math.floor(62 * scale_factor)

            Box.Visible = IsVisible
            Box.Size = Vector2.new(width, height)
            Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)
        else
            Box.Visible = false
            if not Player then
                Box:Remove()
                Updater:Disconnect()
            end
        end
    end

    Updater = game:GetService("RunService").RenderStepped:Connect(UpdateBox)

    return Box
end

local Boxes = {}

local function EnableBoxESP()
    for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
        if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
            local Box = BoxESP.Create(Player)
            table.insert(Boxes, Box)
        end
    end
end

game.Workspace.DescendantAdded:Connect(function(i)
    if i:IsA("Model") and i:FindFirstChild("HumanoidRootPart") and i:FindFirstChild("Head") then
        local Box = BoxESP.Create(i)
        table.insert(Boxes, Box)
    end
end)

EnableBoxESP()
  end)
