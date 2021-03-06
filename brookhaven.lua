local car_remote = game.ReplicatedStorage.Z.ZZ.ZZZ.28Ca28r
local function getplayer(s)
    s = s:lower() -- Remove this if you want case sensitivity
    for _, player in ipairs(game.Players:GetPlayers()) do
        if s == player.Name:lower():sub(1, #s) then
            return player
        end
        if s == player.DisplayName:lower():sub(1, #s) then
            return player
        end
    end
    return nil
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local win = library.CreateLib("AvianHub Reborn | Brookhaven", "BloodTheme")
local maintab = win:NewTab("Main")
local main = maintab:NewSection("Main")
local cctab = win:NewTab("Candy Corn")
local cc = cctab:NewSection("Candy Corn AutoFarm")
local ccunlock = cctab:NewSection("Unlock Vehicles")

main:NewTextBox("Kill", "Kills the selected player", function(txt)
    if getplayer(txt) then
    car_remote:FireServer("PickingCar","SchoolBus")
    wait(1)
    
    local char = game.Players.LocalPlayer.Character
    local who = getplayer(txt).Character
    local car = workspace.Vehicles[char.Name.."Car"]
    local pos = char.HumanoidRootPart.CFrame
    
    repeat wait(0.05)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = car.Body.VehicleSeat.CFrame + Vector3.new(math.random(5),math.random(5),math.random(5))
    until char.Humanoid.Sit
    
    local seated = who.Humanoid.Sit
    who.Humanoid.Seated:Connect(function(sit)
    seated = sit
    end)
    
    repeat
        car:SetPrimaryPartCFrame(who.HumanoidRootPart.CFrame + Vector3.new(math.random(10),0,math.random(10)))
        wait(0.05)
    until seated
    
    car:SetPrimaryPartCFrame(CFrame.new(999999, workspace.FallenPartsDestroyHeight + 5,999999))
    wait(0.1)
    char.Humanoid.Sit = false
    wait(0.1)
    repeat wait() until char:FindFirstChild("HumanoidRootPart")
    char.HumanoidRootPart.CFrame = pos
    end
end)

main:NewTextBox("Bring", "Brings the selected player", function(txt)
    if getplayer(txt) then
    car_remote:FireServer("PickingCar","SchoolBus")
    wait(1)
    
    local char = game.Players.LocalPlayer.Character
    local who = getplayer(txt).Character
    local car = workspace.Vehicles[char.Name.."Car"]
    local pos = char.HumanoidRootPart.CFrame
    
    repeat wait(0.05)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = car.Body.VehicleSeat.CFrame + Vector3.new(math.random(5),math.random(5),math.random(5))
    until char.Humanoid.Sit
    
    local seated = who.Humanoid.Sit
    who.Humanoid.Seated:Connect(function(sit)
    seated = sit
    end)
    
    repeat
        car:SetPrimaryPartCFrame(who.HumanoidRootPart.CFrame + Vector3.new(math.random(10),0,math.random(10)))
        wait(0.05)
    until seated
    
    car:SetPrimaryPartCFrame(pos)
    end
end)

main:NewTextBox("Go to", "Teleports to the selected player", function(txt)
    if getplayer(txt) then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getplayer(txt).Character.HumanoidRootPart.CFrame
    end
end)

main:NewTextBox("View", "Views/Spectates the selected player", function(txt)
    if getplayer(txt) then
        workspace.Camera.CameraSubject = getplayer(txt).Character.Humanoid
    end
end)

main:NewButton("Unview", "Unviews (if viewing another player)", function()
    workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)

main:NewButton("Unban from all houses", "Unban", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name:find("Banned") then
            v:Destroy()
        end
    end
end)
