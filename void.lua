local Hint = Instance.new("Hint", game.CoreGui)
Hint.Text = "Wa"
wait()
Hint.Text = "Wai"
wait()
Hint.Text = "Wait"
wait()
Hint.Text = "Waiti"
wait()
Hint.Text = "Waitin"
wait()
Hint.Text = "Waiting"
wait()
Hint.Text = "Waiting "
wait()
Hint.Text = "Waiting t"
wait()
Hint.Text = "Waiting to"
wait()
Hint.Text = "Waiting to load"
wait()
Hint.Text = "Waiting to load."
wait()
Hint.Text = "Waiting to load.."
wait()
Hint.Text = "Waiting to load..."
wait(1)
Hint.Text = "Waiting to load.."
wait(1)
Hint.Text = "Waiting to load..."
wait(1)
Hint.Text = "Waiting to load.."
wait(1)
Hint.Text = "Waiting to load..."
wait(1)
Hint.Text = "Waiting to load.."
wait(1)
Hint.Text = "Waiting to load."
wait()
Hint.Text = "Waiting to load"
wait()
Hint.Text = "Waiting to loa"
wait()
Hint.Text = "Waiting to l"
wait()
Hint.Text = "Waiting to "
wait()
Hint.Text = "Waiting to"
wait()
Hint.Text = "Waiting t"
wait()
Hint.Text = "Waiting "
wait()
Hint.Text = "Waiting"
wait()
Hint.Text = "Waiting"
wait()
Hint.Text = "Waitin"
wait()
Hint.Text = "Waiti"
wait()
Hint.Text = "Wait"
wait()
Hint.Text = "Wai"
wait()
Hint.Text = "Wa"
wait()
Hint.Text = "W"
wait()
Hint.Text = ""
wait()

local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)

for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "PlantColor" then
v.BrickColor = BrickColor.new(324)
else
if v.Name == "PlantColor1" then
v.BrickColor = BrickColor.new(328)
else
if v.Name == "PlantColor2" then
v.BrickColor = BrickColor.new(323)
else
if v.Name == "PlantColor3" then
v.BrickColor = BrickColor.new(324)
end
end
end
end
end

for _, z in next, game:GetService("Lighting"):GetChildren() do
    z:Destroy()
end
        
local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    if game.Players.LocalPlayer.Character.Humanoid then
        if game.Players.LocalPlayer.Character.Humanoid:findFirstChild("Bullet") then
            if game.Players.LocalPlayer.Character.Humanoid.Bullet:findFirstChild("Trail") then
                if game.Players.LocalPlayer.Character.Humanoid:findFirstChild("Bullet").Name == "BulletDone" then
                end
                if game.Players.LocalPlayer.Character.Humanoid:findFirstChild("Bullet"):findFirstChild("Trail").Lifetime < 0.21 then
                    game.Players.LocalPlayer.Character.Humanoid:findFirstChild("Bullet").Trail.Lifetime = 0.21
                    game.Players.LocalPlayer.Character.Humanoid:findFirstChild("Bullet").Trail.Transparency = NumberSequence.new(0.6)
                    game.Players.LocalPlayer.Character.Humanoid:findFirstChild("Bullet").Trail.Color = ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
                    game.Players.LocalPlayer.Character.Humanoid:findFirstChild("Bullet").Name = "BulletDone"
                end
            end
        end
    end
end)

game.Players.LocalPlayer.Character.Humanoid.StateChanged:Connect(function(old, new)
    if new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.PlatformStanding then
	    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	    game.Players.LocalPlayer.Character.Humanoid.Sit = false
	    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    repeat wait() until char:FindFirstChild("Humanoid")
    char.Humanoid.StateChanged:Connect(function(old, new)
	    if new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.PlatformStanding then
	        char.Humanoid.PlatformStand = false
	        char.Humanoid.Sit = false
	        char.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	        char.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	    end
    end)
end)

repeat wait() until game:IsLoaded() and game:WaitForChild"Players";

local Players, Uis, SGui = game:GetService"Players", game:GetService"UserInputService", game:GetService"StarterGui"; -- Services
local Client, AntiGH = Players.LocalPlayer, true;

function StateChangedEvent(T, Changed)
   if AntiGH == true then
       if Client and Client.Character and Client.Character:FindFirstChildOfClass"Humanoid" then
           if Changed == Enum.HumanoidStateType.FallingDown or Changed == Enum.HumanoidStateType.PlatformStanding then
               Client.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running);Client.Character.Humanoid.PlatformStand = false -- Credits to Aidez for this part
           end
       end
   end
end
Client.Character:WaitForChild"Humanoid".StateChanged:Connect(StateChangedEvent)

function CharacterAddedEvent()
   Client.Character:WaitForChild"Humanoid";
   Client.Character.Humanoid.StateChanged:Connect(StateChangedEvent)
end
Client.CharacterAdded:Connect(CharacterAddedEvent)

Uis.InputBegan:Connect(function(Key)
   if not Uis:GetFocusedTextBox() then
       if Key.KeyCode == Enum.KeyCode.RightAlt then
           AntiGH = not AntiGH
       end
   end
end)

Duration = 16;
local LocalP = game.Players.LocalPlayer
local mouse = LocalP:GetMouse()
local rightclickdown = false
mouse.Button2Down:Connect(function()
    rightclickdown = true
    local donemouse = false
    if mouse.Target ~= nil then
        if mouse.Target:FindFirstAncestor("Door") then
            local door = mouse.Target:FindFirstAncestor("Door")
            if door:FindFirstChild("Lock") and LocalP:DistanceFromCharacter(mouse.Target.CFrame.p) < 10 then
                if door:FindFirstChild("Lock"):FindFirstChild("ClickDetector") then
                    if door:FindFirstChild("Lock"):FindFirstChild("ClickDetector"):FindFirstChild("RemoteEvent") then
                        door:FindFirstChild("Lock"):FindFirstChild("ClickDetector"):FindFirstChild("RemoteEvent"):FireServer()
                        donemouse = true
                    end
                end
            end
        end
    end
end)

local lp = game.Players.LocalPlayer
local lpimage = game.Players:GetUserThumbnailAsync(lp.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420)
local mouse = lp:GetMouse()
local rservice = game:GetService("RunService")
local prefix = ""
local cmds
local resetkey = "r"
local infstam = true
local dsky = false
local ac = false
local noclip = false
local rejoin = false
local glocklaunch = false

local meta = getrawmetatable(game)
local caller = checkcaller or is_protosmasher_caller
local newindex = meta.__newindex
setreadonly(meta, false)
meta.__newindex =
    newcclosure(
    function(self, meme, value)
        if caller() then
            return newindex(self, meme, value)
        end
        if tostring(self) == "HumanoidRootPart" or tostring(self) == "Torso" then
            if meme == "CFrame" or meme == "Position" or meme == "Velocity" then
                return true
            end
        end
        return newindex(self, meme, value)
    end
)
setreadonly(meta, true)

function esp(player)
    if player.Name ~= lp.Name then
        local bbg = Instance.new("BillboardGui", game.CoreGui)
        bbg.Name = player.Name
        bbg.AlwaysOnTop = true
        bbg.Enabled = true
        bbg.Size = UDim2.new(1, 0, 1, 0)
        bbg.StudsOffset = Vector3.new(0, 2, 0)
        local tlabel = Instance.new("TextLabel", bbg)
        tlabel.BackgroundTransparency = 1
        tlabel.Size = UDim2.new(1, 0, 1, 0)
        tlabel.Text = player.Name
        tlabel.TextColor3 = Color3.new(210, 255, 255)
        game.Players.PlayerRemoving:Connect(
            function(plrr)
                if plrr == player then
                    game.CoreGui:FindFirstChild(plrr.Name):Destroy()
                end
            end
        )
    end
end

function notif(title, msg, dur)
    game:GetService("StarterGui"):SetCore(
        "SendNotification",
        {
            ["Icon"] = lpimage,
            ["Title"] = title,
            ["Text"] = msg,
            ["Duration"] = dur
        }
    )
end

function infstam()
    wait(0.5)
    if game.PlaceId ~= 455366377 then
        lp.Backpack.ServerTraits.Stann.Changed:Connect(
            function()
                if infstam then
                    lp.Backpack.ServerTraits.Stann.Value = 100
                end
            end
        )
    else
        lp.Character.Stamina.Changed:Connect(
            function()
                if infstam then
                    lp.Character.Stamina.Value = 100
                end
            end
        )
    end
end
function anticlaim()
    local myTools = {}
    for _, z in pairs(lp.Backpack:GetChildren()) do
        if z:IsA "Tool" then
            table.insert(myTools, z)
        end
    end
    lp.Character.ChildAdded:Connect(
        function(instance)
            if ac then
                if instance.Name ~= "nillingprocessigbecausethisisalongnameeitherwaystillworks" and instance:IsA "Tool" then
                    instance:Destroy()
                    wait(0.1)
                    instance:Destroy()
                end
            end
        end
    )
    lp.Backpack.ChildRemoved:Connect(
        function(instance)
            local toolnames_ = {}
            table.insert(toolnames_, instance.Name)
            instance.Name = "nillingprocessigbecausethisisalongnameeitherwaystillworks"
            wait()
            instance.Name = toolnames_[1]
        end
    )
end

infstam()
anticlaim()

lp.CharacterAdded:Connect(
    function()
        infstam()
        anticlaim()
    end
)

mouse.KeyDown:Connect(
    function(key)
        if key == resetkey then
            lp.Character.Humanoid:ChangeState(15)
        end
    end
)

lp.Chatted:Connect(
    function(Message)
        local args = string.split(Message, " ")
        if args[1] == prefix .. "view" then
            if args[2] and args[2] ~= "" or " " then end
            local Targ = GetPlayer(tostring(args[2]))
            Workspace.CurrentCamera.CameraSubject = Targ.Character.Humanoid
            notif("View", "Now Viewing" .. Targ.Name, 2)
        end
        if args[1] == prefix .. "unview" then
            Workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
            notif("UnView", "Unviewed", 2)
        end
        if args[1] == prefix .. "reset" then
            lp.Character.Humanoid:ChangeState(15)
        end
        if args[1] == prefix .. "prefix" then
            if args[2] and args[2] ~= "" or " " then end
            prefix = args[2]
        end
        if args[1] == prefix .. "esp" then
            if args[2] and args[2] ~= "" or " " then end
            local plYer = GetPlayer(tostring(args[2]))
            esp(plYer)
            notif("Revealed", plYer.Name, 2)
        end
        if args[1] == prefix .. "unesp" then
            if args[2] and args[2] ~= "" or " " then end
            local plYer = GetPlayer(tostring(args[2]))
            if game.CoreGui:FindFirstChild(plYer.Name) then
                game.CoreGui:FindFirstChild(plYer.Name):Destroy()
            else
                notif("Cannot UnEsp", plYer.Name, 2)
            end
        end
        if args[1] == prefix .. "fov" then
            if args[2] and args[2] ~= "" or " " then end
            Workspace.CurrentCamera.FieldOfView = tonumber(args[2])
            notif("FieldOfView", "Changed To" .. " " .. tonumber(args[2]), 2)
        end
        if args[1] == prefix .. "dsky" then
         for _, z in next, game:GetService("Lighting"):GetChildren() do
          z:Destroy()
         end
        end
        if args[1] == prefix .. "infstam" then
            infstam = not infstam
            if infstam then
                notif("Infinite Stamina", "Turned To True", 2)
            else
                notif("Infinite Stamina", "Turned To False", 2)
            end
        end
        if args[1] == prefix .. "anticlaim" then
            ac = not ac
            if ac then
                notif("Anti - Claim", "Turned To True", 2)
            else
                notif("Anti - Claim", "Turned To False", 2)
            end
        end
        if args[1] == prefix .. "rejoin" then
            local ts = game:GetService("TeleportService")
             local p = game:GetService("Players").LocalPlayer
              ts:Teleport(game.PlaceId, p)
              notif("Rejoin", "Rejoining...", 2)
        end
        if args[1] == prefix .. "rseats" then
            for _,z in pairs(game:GetDescendants()) do
                if z:IsA'Seat' then
                    z:Destroy()
                end
            end
        end
    end
)

function GetPlayer(String)
    local Targ
    local StrLower = String:lower()
    for _, z in pairs(game:GetService("Players"):GetPlayers()) do
        if z.Name:lower():sub(1, #String) == String:lower() then
            Targ = z
        end
    end
    if String == "me" then
        Targ = lp
    end
    if String == "" or String == " " then
        Targ = nil
    end
    return Targ
end

rservice.Stepped:Connect(
    function()
        pcall(
            function()
                if noclip then
                    for _, z in pairs(lp.Character:GetDescendants()) do
                        if z:IsA "Part" then
                            z.CanCollide = false
                        end
                    end
                end
                for _, z in pairs(game.CoreGui:GetChildren()) do
                    if z:IsA "BillboardGui" then
                        for _, v in pairs(game.Players:GetPlayers()) do
                            if z.Name == v.Name then
                                if v.Character and v.Character.Head and v.Character.Humanoid then
                                    z.Adornee = v.Character.Head
                                end
                            end
                        end
                    end
                end
            end
        )
    end
)

local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local Player = Players.LocalPlayer
local FeLooping, FlingTime, HeadFlinging, ToolWeld, CharWeld = false, 0.5, true, true, true
local Spammer, SpamMessage, Delay = false, "ez", 0.2
local FeTarget;
local FePart;

local meta = getrawmetatable(game)
local namecall = meta.__namecall
setreadonly(meta,false)

meta.__namecall = newcclosure(function(self,...)
    local method = getnamecallmethod()
    local args = {...}
    if method == 'Destroy' and tostring(self) == 'BodyVelocity' then
        return wait(9e9)
    end
    if method == "LoadAnimation" then
        if FeLooping then
            return wait(9e9)
        end
    end
    return namecall(self,...)
end)

setreadonly(meta,true)

local function findp(name)
    local t = {}
    if name:lower() == "all" then
        for i,v in pairs(Players:GetPlayers()) do
            table.insert(t,v)
        end
        return t
    elseif name:lower() == "others" then
        for i,v in pairs(Players:GetPlayers()) do
            if v ~= Player then
                table.insert(t,v)
            end
        end
        return t
    elseif name:lower() == "me" then
        table.insert(t,Players)
        return t
    else
        for _,player in pairs(Players:GetPlayers()) do
            if name:lower() == player.Name:sub(1,name:len()):lower() then
                table.insert(t,player)
            end
        end
        return t
    end
    return nil
end

local function WeldTool(Tool, Part)
    local Handle = Tool.Handle
    if Handle and Part then
        local Weld = Instance.new("ManualWeld")
        Weld.Part0 = Handle
        Weld.Part1 = Part
        Weld.C0 = CFrame.new()
        Weld.C1 = Part.CFrame:inverse() * Handle.CFrame
        Weld.Parent = Handle
        return;
    end
end

local function Chat(str)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(str),"All")
end

local Library = loadstring(game:HttpGet('https://pastebin.com/raw/d6rxRXPU', true))()

local Window = Library:CreateWindow('Fe-Loop')
local TargetFolder = Window:AddFolder('Target')
local SettingsFolder = Window:AddFolder('Settings')
local SpamFolder = Window:AddFolder('Spam')

TargetFolder:AddBox({text = "Target Name", flag = "tname", value = "Name", callback = function(str)
    if findp(str) and findp(str)[1] then
        FeTarget = findp(str)[1]
        print("target is now set to " .. FeTarget.Name)
    end
end})

TargetFolder:AddToggle({text = "Fe-Loop", flag = "felooping", state = false, callback = function(bool)
    FeLooping = bool
    if FeLooping == true then
        Player.Character:BreakJoints()
    end
    print("feloop is now set to " .. tostring(bool))
end})

SettingsFolder:AddBox({text = "Fling Time", flag = "fti", value = "Time (0.1)", callback = function(str)
    print("time is now set to " .. str)
end})

SettingsFolder:AddToggle({text = "Head Fling", flag = "hf", state = true, callback = function(bool)
    HeadFling = bool
    print("head fling is now set to " .. tostring(bool))
end})

SettingsFolder:AddToggle({text = "Tool Weld", flag = "tw", state = true, callback = function(bool)
    ToolWeld = bool
    print("tool weld is now set to " .. tostring(bool))
end})

SettingsFolder:AddToggle({text = "Char Weld", flag = "cw", state = true, callback = function(bool)
    ToolWeld = bool
    print("char weld is now set to " .. tostring(bool))
end})

SpamFolder:AddToggle({text = "Spam", flag = "spaa", state = false, callback = function(bool)
    Spammer = bool
    print("spammer is now set to " .. tostring(bool))
end})

SpamFolder:AddBox({text = "Spam Message", flag = "spa", value = "Message", callback = function(str)
    SpamMessage = str
    print("message is now set to " .. str)
end})

SpamFolder:AddBox({text = "Delay", flag = "spad", value = "Spam Delay (0.2)", callback = function(str)
    if tonumber(str) then
        Delay = tonumber(str)
    end
    print("spam delay is now set to " .. str)
end})

Window:AddBind({text = "Toggle UI", key = "RightShift", callback = function() Library:Close() end})

Library:Init()

Player.CharacterAdded:Connect(function(NewChar)
    if FeLooping then
        NewChar:WaitForChild("Humanoid")
        NewChar:WaitForChild("Right Leg")
        NewChar["Right Leg"]:Remove()
        NewChar:WaitForChild("Animate")
        local NewHum = NewChar.Humanoid:Clone()
        NewChar.Humanoid:Remove()
        NewHum.Parent = NewChar
        NewChar.Animate.Disabled = true
        NewChar:WaitForChild("HumanoidRootPart")
        if CharWeld then
            for _, Part in next, NewChar:GetChildren() do
                if Part and Part:IsA'BasePart' then
                    Part.FrontSurface = Enum.SurfaceType.Weld
                    Part.LeftSurface = Enum.SurfaceType.Weld
                    Part.RightSurface = Enum.SurfaceType.Weld
                    Part.TopSurface = Enum.SurfaceType.Weld
                    Part.BottomSurface = Enum.SurfaceType.Weld
                    Part.BackSurface = Enum.SurfaceType.Weld
                end 
            end
        end
    end
end)

RunService.Stepped:Connect(function()
    if FeLooping and FeTarget and FeTarget.Character then
        local TargetPart = FeTarget.Character:FindFirstChild("HumanoidRootPart") or FeTarget.Character:FindFirstChild("Torso")
        local Root = Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character:FindFirstChild("Torso")
        local FlingPart;
        if HeadFlinging then
            FlingPart = FeTarget.Character:FindFirstChild("Right Arm") or FeTarget.Character:FindFirstChild("Head")
        else
            FlingPart = FeTarget.Character:FindFirstChild("Right Arm")
        end
        for _, Tool in next, Player.Backpack:GetChildren() do
            Tool.Parent = Player.Character
            Tool:GetPropertyChangedSignal("Parent"):wait()
            if ToolWeld then
                pcall(function()
                    WeldTool(Tool, FlingPart)
                end)
            end
        end
        if TargetPart and Root then
            Root.CFrame = TargetPart.CFrame * CFrame.new(0,0,-math.random(0.1, 1.9))
            wait(tonumber(FlingTime))
            Root.CFrame = FlingPart.CFrame
            wait()
            Root.CFrame = Root.CFrame * CFrame.new(0,3,0)
        end
    end
end)

coroutine.resume(coroutine.create(function()
    while wait(Delay) do
        if Spammer then
            Chat(SpamMessage)
        end
    end
end))

Hint.Text = "F"
wait()
Hint.Text = "Fi"
wait()
Hint.Text = "Fin"
wait()
Hint.Text = "Fini"
wait()
Hint.Text = "Finis"
wait()
Hint.Text = "Finish"
wait()
Hint.Text = "Finishe"
wait()
Hint.Text = "Finished"
wait()
Hint.Text = "Finished!"
wait(2)
Hint.Text = "Finished"
wait()
Hint.Text = "Finishe"
wait()
Hint.Text = "Finish"
wait()
Hint.Text = "Finis"
wait()
Hint.Text = "Fini"
wait()
Hint.Text = "Fin"
wait()
Hint.Text = "Fi"
wait()
Hint.Text = "F"
wait()
Hint.Text = ""
wait()
Hint.Text = "v"
wait()
Hint.Text = "vo"
wait()
Hint.Text = "voi"
wait()
Hint.Text = "void"
wait()
Hint.Text = "void "
wait()
Hint.Text = "void o"
wait()
Hint.Text = "void on"
wait()
Hint.Text = "void on t"
wait()
Hint.Text = "void on to"
wait()
Hint.Text = "void on top"
wait()
Hint.Text = "void on top!"
wait(2)
Hint.Text = "void on top"
wait()
Hint.Text = "void on to"
wait()
Hint.Text = "void on t"
wait()
Hint.Text = "void on "
wait()
Hint.Text = "void on"
wait()
Hint.Text = "void o"
wait()
Hint.Text = "void "
wait()
Hint.Text = "void"
wait()
Hint.Text = "voi"
wait()
Hint.Text = "vo"
wait()
Hint.Text = "v"
wait()
Hint.Text = ""
wait()
Hint:Destroy()
