 -- Prison Life

 local LocalizationService = game:GetService("LocalizationService")
 local Players = game:GetService("Players")
     local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
     local Window = Library.CreateLib("Prison Life (Solaris Hub)", "DarkTheme")

     wait(1.2)
         game.StarterGui:SetCore("SendNotification", {
         Title = "Solaris Hub loaded";
         Text = "Made by Real_PainNonsense & PainExploit Team";
         Duration = 6;
     })
             
     -- Main

     local Main = Window:NewTab("Main")
     local MainSection = Main:NewSection("Main")

     MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
         local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
         local Event = game:GetService("Workspace").Remote.ItemHandler
         Event:InvokeServer(A_1)
     end)
 
     MainSection:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Remington 870", "AK-47"}, function(v)
         local module = nil
         if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
             module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
         elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
             module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
         end
         if module ~= nil then
             module["MaxAmmo"] = math.huge
             module["CurrentAmmo"] = math.huge
             module["StoredAmmo"] = math.huge
             module["FireRate"] = 0.000001
             module["Spread"] = 0
             module["Range"] = math.huge
             module["Bullets"] = 10
             module["ReloadTime"] = 0.000001
             module["AutoFire"] = true
         end
     end)
     
     MainSection:NewButton("Arrest Criminal", "Arrest all criminal", function()
         local Player = game.Players.LocalPlayer
         local cpos = Player.Character.HumanoidRootPart.CFrame
         for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
         if v.Name ~= Player.Name then
         local i = 10
             repeat
             wait()
             i = i-1
             game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
             Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
             until i == 0
         end
     end
 end)

     MainSection:NewButton("Arrest", "Click arrest", function()
         local mouse = game.Players.LocalPlayer:GetMouse()
         local arrestEvent = game.Workspace.Remote.arrest
         mouse.Button1Down:connect(function()
         local obj = mouse.Target
         local response = arrestEvent:InvokeServer(obj)
     end)
 end)

 MainSection:NewButton("Super Punch", "One hit", function()
     mainRemotes = game.ReplicatedStorage meleeRemote = mainRemotes['meleeEvent'] mouse = game.Players.LocalPlayer:GetMouse() punching = false cooldown = false function punch() cooldown = true local part = Instance.new("Part", game.Players.LocalPlayer.Character) part.Transparency = 1 part.Size = Vector3.new(5, 2, 3) part.CanCollide = false local w1 = Instance.new("Weld", part) w1.Part0 = game.Players.LocalPlayer.Character.Torso w1.Part1 = part w1.C1 = CFrame.new(0,0,2) part.Touched:connect(function(hit) if game.Players:FindFirstChild(hit.Parent.Name) then local plr = game.Players:FindFirstChild(hit.Parent.Name) if plr.Name ~= game.Players.LocalPlayer.Name then part:Destroy() for i = 1,100 do meleeRemote:FireServer(plr) end end end end) wait(1) cooldown = false part:Destroy() end mouse.KeyDown:connect(function(key) if cooldown == false then if key:lower() == "f" then punch() end end end)
 end)

     MainSection:NewButton("BaseBallBat", "Give Localplayer baseballbat", function()
         local LocalPlayer = game.Players.LocalPlayer
         local Character = LocalPlayer.Character
             local Backpack = LocalPlayer.Backpack
             local Humanoid = Character.Humanoid
             if not Backpack:FindFirstChild("Bat") and not Character:FindFirstChild("Bat") then
                 local BaseBallBat = Instance.new("Tool", Backpack)
                 local Handle = Instance.new("Part", BaseBallBat)
                 BaseBallBat.GripPos = Vector3.new(0, -1.15, 0)
                 BaseBallBat.Name = "Bat"
                 Handle.Name = "Handle"
                 Handle.Size = Vector3.new(0.4, 5, 0.4)
                 local Animation =Instance.new("Animation", BaseBallBat)
                 Animation.AnimationId = "rbxassetid://218504594"
                 local Track = Humanoid:LoadAnimation(Animation)
                 local Cooldown = false
                 local Attacked = false
                 local Attacking = false
                 BaseBallBat.Equipped:Connect(function()
                     BaseBallBat.Activated:Connect(function()
                         if not Cooldown then
                             Cooldown = true
                             Attacking = true
                             Track:Play()
                             Handle.Touched:Connect(function(Hit)
                                 if Hit.Parent and Hit.Parent ~= game.Players.LocalPlayer and not Attacked and Attacking then
                                     Attacked = true
                                     for i = 1,15 do
                                         game.ReplicatedStorage.meleeEvent:FireServer(game.Players[Hit.Parent.Name])
     
                                     end
                                 end
                             end)
                             wait(0.25)
                             Cooldown = false
                             Attacked = false
                             Attacking = false
                         end  
                 end)
             end)
         end
     end)

     MainSection:NewLabel("Remove Building")

     MainSection:NewToggle("Remove Prison Guard Outpost", "Remove prison guard outpost", function()
         if workspace:FindFirstChild("Prison_Guard_Outpost") then
             workspace.Prison_Guard_Outpost.Parent = game.Lighting
             else game.Lighting.Prison_Guard_Outpost.Parent = game.Workspace
         end
     end)
     
     MainSection:NewToggle("Remove Prison Cellblock", "Remove prison cellblock", function()
         if workspace:FindFirstChild("Prison_Cellblock") then
             workspace.Prison_Cellblock.Parent = game.Lighting
             else game.Lighting.Prison_Cellblock.Parent = game.Workspace
         end
     end)

     MainSection:NewToggle("Remove Prison Administration", "Remove prison administration", function()
         if workspace:FindFirstChild("Prison_Administration") then
             workspace.Prison_Administration.Parent = game.Lighting
             else game.Lighting.Prison_Administration.Parent = game.Workspace
         end
     end)

     MainSection:NewToggle("Remove Prison OuterWall", "Remove prison outerWall", function()
         if workspace:FindFirstChild("Prison_OuterWall") then
             workspace.Prison_OuterWall.Parent = game.Lighting
             else game.Lighting.Prison_OuterWall.Parent = game.Workspace
         end
     end)

     MainSection:NewToggle("Remove Prison Cafeteria", "Remove prison cafeteria", function()
     if workspace:FindFirstChild("Prison_Cafeteria") then
         workspace.Prison_Cafeteria.Parent = game.Lighting
         else game.Lighting.Prison_Cafeteria.Parent = game.Workspace
     end
 end)

 MainSection:NewToggle("Remove Doors", "Remove all doors", function()
     if workspace:FindFirstChild("Doors") then
         workspace.Doors.Parent = game.Lighting
         else if game.Lighting:FindFirstChild("Doors") then
             game.Lighting.Doors.Parent = workspace
         end
     end
 end)

 MainSection:NewToggle("Remove Fences", "Remove all Fences", function()
     if workspace:FindFirstChild("Prison_Fences") then
         workspace.Prison_Fences.Parent = game.Lighting
         else game.Lighting.Prison_Fences.Parent = workspace
     end
 end)

     MainSection:NewLabel("Server")

     MainSection:NewButton("Open Gate", "Gate open", function()
     workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Prison Gate"]["Prison Gate"])
 end)

 MainSection:NewButton("Crash Server", "Make server crash", function()
     local Player = game.Players.LocalPlayer.Name
     game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

     wait(1.2)
     game.StarterGui:SetCore("SendNotification", {
     Title = "Server crashed";
     Text = "The server will being crashed in 30 second";
     Duration = 6;
 })
     wait(30)
     for i,v in pairs(game.Players[Player].Backpack:GetChildren()) do
         if v.name == "Remington 870" then
             v.Parent = game.Players.LocalPlayer.Character
         end
     end
         local Gun = "Remington 870"
         Gun = game.Players[Player].Character[Gun]
         game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
             function FireGun(target)
             coroutine.resume(coroutine.create(function()
             local bulletTable = {}
             table.insert(bulletTable, {
             Hit = target,
             Distance = 100,
             Cframe = CFrame.new(0,1,1),
             RayObject = Ray.new(Vector3.new(0.1,0.2), Vector3.new(0.3,0.4))
             })
             game.ReplicatedStorage.ShootEvent:FireServer(bulletTable, Gun)
             wait()
         end))
     end
             while game:GetService("RunService").Stepped:wait() do
             for count = 0, 10, 10 do
             FireGun()
         end
     end
 end)   
 
 
 -- Player

     local Player = Window:NewTab("Player")
     local PlayerSection = Player:NewSection("Player")
 
     PlayerSection:NewSlider("WalkSpeed", "Changes the walkspeed", 250, 16, function(v)
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
     end)
 
     PlayerSection:NewSlider("JumpPower", "Changes the jumppower", 250, 50, function(v)
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
     end)

     PlayerSection:NewButton("Btools", "Give localplayer btools", function()
         local tool1   = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
         tool1.BinType = "Hammer"
     end)

     local InfiniteJumpEnabled;
     PlayerSection:NewToggle("Infinite Jump", "By toggling this you can jump infinitely", function(State)
     InfiniteJumpEnabled = State

     local Player = game:GetService("Players").LocalPlayer
     game:GetService("UserInputService").JumpRequest:Connect(function()
         if InfiniteJumpEnabled then
             Player.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
         end
     end)
 end)

     PlayerSection:NewButton("Reset", "Fast respawn", function()
         local A_1 = "\66\114\111\121\111\117\98\97\100\100"
         local Event = game:GetService("Workspace").Remote.loadchar
         Event:InvokeServer(A_1)
     end)

     PlayerSection:NewButton("Rejoin", "Rejoin the server", function()
         local tpservice= game:GetService("TeleportService")
         local plr = game.Players.LocalPlayer
         tpservice:Teleport(game.PlaceId, plr)
     end)

     -- Change Team

     local ChangeTeam = Window:NewTab("Change Team")
     local ChangeTeamSection = ChangeTeam:NewSection("Change Team")

     ChangeTeamSection:NewButton("Guards", "Become guards team", function()
         workspace.Remote.TeamEvent:FireServer("Bright blue")
     end)

     ChangeTeamSection:NewButton("Inmate", "Become inmate team", function()
         workspace.Remote.TeamEvent:FireServer("Bright orange")
     end)

     ChangeTeamSection:NewButton("Neutral", "Become neutral team", function()
         workspace.Remote.TeamEvent:FireServer("Medium stone grey")
     end)

     ChangeTeamSection:NewButton("Criminal", "Become Criminal team", function()
         wait(0.3)
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)
     end)

     -- Teleport

     local TeleportSection = Window:NewTab("Teleport")
     local TeleportSection = TeleportSection:NewSection("Teleport")

     TeleportSection:NewButton("Prison", "Teleport to prison", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.77,100,2379.07)
     end)

     TeleportSection:NewButton("Yard", "Teleport to yard", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(781.6845703125, 97.999946594238, 2462.8779296875)
     end)

     TeleportSection:NewButton("Criminal Base", "Teleport to criminal base", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-859.15161132813, 94.476051330566, 2058.5427246094)
     end)

     TeleportSection:NewButton("Hallway", "Teleport to hallway", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(860.78448486328, 99.990005493164, 2362.9597167969)
     end)

     TeleportSection:NewButton("Entrance Gate", "Teleport to entrancegate", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(491.27182006836, 98.039939880371, 2216.3107910156)
     end)

     TeleportSection:NewButton("Entrance", "Teleport to entrance", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(653.81713867188, 99.990005493164, 2272.083984375)
     end)

     TeleportSection:NewButton("CellBlock", "Teleport to cellblock", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.43115234375, 99.989990234375, 2440.3828125)
     end)

     TeleportSection:NewButton("Cafeteria", "Teleport to cafeteria", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(932.06213378906, 99.989959716797, 2290.4250488281)
     end)

     TeleportSection:NewButton("Armory", "Teleport to armory", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(835.28918457031, 99.990005493164, 2285.4909667969)
     end)

     TeleportSection:NewButton("Gaurds Only", "Teleport to gaurds only.", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(830.04302978516, 99.990005493164, 2327.0859375)
     end)

     TeleportSection:NewButton("Car Spawn", "Teleport to car spawn", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-200, 55, 1880)
     end)

     TeleportSection:NewButton("Shops", "Teleport to shops", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-415, 55, 1750)
     end)

     TeleportSection:NewButton("Gas Station", "Teleport to gas station", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-520, 55, 1660)
     end)

     TeleportSection:NewButton("Secret Spot", "Teleport to secret spot", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920, 95, 1990)
     end)

     TeleportSection:NewButton("Police Cars", "Teleport to police cars", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(615, 100, 2515)
     end)

     TeleportSection:NewButton("Police Area", "Teleport to police area", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(855, 100, 2297)
     end)

     TeleportSection:NewButton("Grocery Shop", "Teleport to grocery shop", function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-415, 55, 1750)
     end)
     
     --  Settings

     local Settings = Window:NewTab("Settings")
     local SettingsSelection = Settings:NewSection("Settings")

     SettingsSelection:NewKeybind("KeybindText", "Change keybind", Enum.KeyCode.V, function()
         Library:ToggleUI()
     end)

     -- Credits

     local Credits = Window:NewTab("Credits")
     CreditsSection = Credits:NewSection("Credits")

     CreditsSection:NewLabel("Made by Real_PainNonsense & PainExploit Team")