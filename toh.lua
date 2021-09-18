local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local library = lib.new("AvianHub Reborn | Tower Of Hell")
local main = library:addPage("Main")
local settings = library:addPage("Settings")
local settingssec = settings:addSection("Settings")
local mainsec = main:addSection("Main")

getgenv().togglekey = Enum.KeyCode.RightShift
getgenv().anticheatdisable = false
getgenv().autofarm = false
getgenv().godmode = false

local gmt = getrawmetatable(game)
setreadonly(gmt,false)
local a
a = hookfunction(gmt.__namecall, newcclosure(function(self, ...)
        if getnamecallmethod() == "Kick" and getgenv().anticheatdisable then
        return wait(9e9)
    end
    return a(self, ...)
end))

mainsec:addButton("Anti Cheat Disable", function()
    while wait() do
       pcall(function()
           getgenv().anticheatdisable  = true
           game.Players.LocalPlayer.PlayerScripts.LocalScript:Destroy()
           game.Players.LocalPlayer.PlayerScripts.LocalScript2:Destroy()
       end) 
    end
end)

mainsec:addButton("Infinite Double Jumps", function()
    while wait() do
        pcall(function()
            game:GetService("ReplicatedStorage").globalJumps.Value = 6969
        end)
    end
end)

mainsec:addButton("TP to End", function()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.sections.finish.FinishGlow.CFrame
    end)
end)

mainsec:addSlider("WalkSpeed", 16, 16, 300, function(v)
    while wait() do
        pcall(function()
            game:GetService("ReplicatedStorage").globalSpeed.Value = v
        end)
    end
end)

mainsec:addButton("Give All Tools", function()
    for _,v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
        if v:IsA("Tool") then
            local CloneThings = v:Clone()
            wait()
            CloneThings.Parent = game.Players.LocalPlayer.Backpack
        end
    end
end)

mainsec:addToggle("Time Freeze", false, function(value)
    game:GetService("Players").LocalPlayer.PlayerScripts.timefreeze.Value = value
end)

mainsec:addToggle("God Mode", false, function(value)
    getgenv().godmode = value
end)

mainsec:addToggle("BHop", false, function(v)
    game.ReplicatedStorage.bunnyJumping.Value = v
end)

mainsec:addToggle("AutoFarm", false, function(v)
    if v then
        getgenv().anticheatdisable = true
        wait(0.1)
        pcall(function()
        game.Players.LocalPlayer.PlayerScripts.LocalScript:Destroy()
        game.Players.LocalPlayer.PlayerScripts.LocalScript2:Destroy()
        end)
    end
    getgenv().autofarm = v
end)

settingssec:addKeybind("Toggle UI", Enum.KeyCode.RightShift, function() library:toggle() end, function(key) getgenv().togglekey = key end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "AvianHub",
    Text = "Add/Message Avian#0004 on Discord for any problems!"
})

while wait() do
    pcall(function()
    if not getgenv().godmode then
        game:GetService("Players").LocalPlayer.Character.ExplosiveDeath.Disabled = false
        game:GetService("Players").LocalPlayer.Character.KillScript.Disabled = false
    else
        game:GetService("Players").LocalPlayer.Character.ExplosiveDeath.Disabled = true
        game:GetService("Players").LocalPlayer.Character.KillScript.Disabled = true
        end
    end)
    
    if getgenv().autofarm then
        delay(2, function()
            pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.sections.finish.FinishGlow.CFrame
            end)
        end)
    end
end
