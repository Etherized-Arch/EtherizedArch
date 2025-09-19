-- [LG] Load Arch (WindUI)
local Arch = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- [CW] Create Window
local Window = Arch:CreateWindow({
    Title = "Etherized Arch",
    Icon = "rbxassetid://108173040048222",
    Author = "by Autherium",
    Folder = "EtherizedArch",
    Background = "rbxassetid://71326696175409",
    Size = UDim2.fromOffset(600, 350),
    Transparent = true,
})

-- [LOC] Localization
Arch:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["UPDATE_LOGS"] = "Update Logs",
            ["MAIN"] = "Main",
            ["SHOP"] = "Shop",
            ["TELEPORT"] = "Teleport",
            ["PLAYER"] = "Player",
            ["MISC"] = "Misc",
            ["SETTINGS"] = "Settings",
            ["CREDITS"] = "Credits"
        },
        ["id"] = {
            ["UPDATE_LOGS"] = "Catatan Perubahan",
            ["MAIN"] = "Utama",
            ["SHOP"] = "Toko",
            ["TELEPORT"] = "Teleport",
            ["PLAYER"] = "Pemain",
            ["MISC"] = "Lainnya",
            ["SETTINGS"] = "Pengaturan",
            ["CREDITS"] = "Kredit"
        }
    }
})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- [CT] Create Tabs
local Logs = Window:Tab({ Title = "loc:UPDATE_LOGS", Icon = "scroll-text" })
Window:Divider()
local Main = Window:Tab({ Title = "loc:MAIN", Icon = "fish" })
local Shop = Window:Tab({ Title = "loc:SHOP", Icon = "shopping-cart" })
local Teleport = Window:Tab({ Title = "loc:TELEPORT", Icon = "map" })
local Player = Window:Tab({ Title = "loc:PLAYER", Icon = "user" })
local Misc = Window:Tab({ Title = "Misc", Icon = "settings-2" })
local Settings = Window:Tab({ Title = "loc:SETTINGS", Icon = "settings" })
local Credits = Window:Tab({ Title = "loc:CREDITS", Icon = "crown" })

-- [LE] Logs Elements
local ChangelogsSection = Logs:Section({ 
    Title = "| Changelog",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "scroll-text",
})

Logs:Divider()
InitialSection = Logs:Section({ 
    Title = "Public Release",
    TextXAlignment = "Center",
    TextSize = 17,
})

-- [ME] Main Elements
local FarmingSection = Main:Section({ 
    Title = "| Farming",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "fish",
})

Main:Divider()
local AutoFishingSection = Main:Section({ 
    Title = "Auto Fishing",
    TextXAlignment = "Center",
    TextSize = 17,
})

local FishMethod = Main:Dropdown({
    Title = "Fishing Method",
    Values = { "Normal", "Fast" },
    Value = "",
    Callback = function() end
})

local AutoFishToggle = Main:Toggle({
    Title = "Enable Auto Fishing",
    Desc = "Automatically fish using the selected method.",
    Icon = "fish",
    Type = "Checkbox",
    Default = false,
    Callback = function() end
})

Main:Divider()
local AutoFavSection = Main:Section({
    Title = "Auto Favorite",
    TextXAlignment = "Center",
    TextSize = 17,
})

local SelectFavRarity = Main:Dropdown({
    Title = "Select Rarity",
    Values = { "Common", "Rare", "Epic", "Legendary" },
    Callback = function() end
})

local FavDelay = Main:Slider({
    Title = "Favorite Delay (seconds)",
    Step = 1,
    Value = {
        Min = 5,
        Max = 300,
        Default = 5,
    },
    Callback = function() end
})

local FavToggle = Main:Toggle({
    Title = "Enable Auto Favorite",
    Icon = "heart",
    Type = "Checkbox",
    Default = false,
    Callback = function() end
})

-- [SE] Shop Elements
local ShopSection = Shop:Section({ 
    Title = "| Rods & Bobbers",
    TextXAlignment = "LEFT",
    TextSize = 20,
    Icon = "shopping-cart",
})

Shop:Divider()
local RodsSection = Shop:Section({ 
    Title = "Purchase Rods",
    TextXAlignment = "Center",
    TextSize = 17,
})

local BuySelectRods = Shop:Dropdown({
    Title = "Choose Rods",
    Values = { "Basic", "Advanced" },
    Multi = true,
    Callback = function() end
})

local BuyRods = Shop:Button({
    Title = "Buy Selected Rods",
    Locked = false,
    Callback = function() end
})

local BuyAres = Shop:Button({
    Title = "Buy Ares Rod (3M)",
    Locked = false,
    Callback = function() end
})

local BuyAngler = Shop:Button({
    Title = "Buy Angler Rod (8M)",
    Locked = false,
    Callback = function() end
})

Shop:Divider()
local BobbersSection = Shop:Section({ 
    Title = "Purchase Bobbers",
    TextXAlignment = "Center",
    TextSize = 17,
})

local BuySelectBobbers = Shop:Dropdown({
    Title = "Choose Bobbers",
    Values = { "Basic", "Advanced" },
    Multi = true,
    Callback = function() end
})

local BuyBobbers = Shop:Button({
    Title = "Buy Selected Bobbers",
    Locked = false,
    Callback = function() end
})

local SellSection = Shop:Section({ 
    Title = "| Sell",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "dollar-sign",
})

Shop:Divider()
local SellFishSection = Shop:Section({ 
    Title = "Sell Fish",
    TextXAlignment = "Center",
    TextSize = 17,
})

local SellFishSlider = Shop:Slider({
    Title = "Sell Fish Threshold",
    Step = 1,
    Value = {
        Min = 5,
        Max = 5000,
        Default = 1000,
    },
    Callback = function() end
})

local SellFishRarity = Shop:Dropdown({
    Title = "Choose Rarity",
    Values = { "Basic", "Advanced" },
    Multi = true,
    Callback = function() end
})

local SellFishToggle = Shop:Toggle({
    Title = "Enable Auto Sell",
    Icon = "check",
    Type = "Checkbox",
    Default = false,
    Callback = function() end
})

-- [TE] Teleport Elements
local TeleportSection = Teleport:Section({
    Title = "| Teleports",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "map",
})

Teleport:Divider()
local IslandsSection = Teleport:Section({ 
    Title = "Teleport to Island",
    TextXAlignment = "Center",
    TextSize = 17,
})

local SelectIslands = Teleport:Dropdown({
    Title = "Choose Island",
    Values = { "Island A", "Island B" },
    Value = "",
    Callback = function() end
})

local IslandsTP = Teleport:Button({
    Title = "Teleport Now",
    Locked = false,
    Callback = function() end
})

Teleport:Divider()
local NPCSection = Teleport:Section({ 
    Title = "Teleport to NPC",
    TextXAlignment = "Center",
    TextSize = 17,
})

local SelectNPC = Teleport:Dropdown({
    Title = "Choose NPC",
    Values = { "NPC A", "NPC B" },
    Value = "",
    Callback = function() end
})

local NPCTP = Teleport:Button({
    Title = "Teleport Now",
    Locked = false,
    Callback = function() end
})

Teleport:Divider()
local PlayerTPSection = Teleport:Section({
    Title = "Teleport to Player",
    TextXAlignment = "Center",
    TextSize = 17,
})

local SelectPlayers = Teleport:Dropdown({
    Title = "Choose Player",
    Values = { "Player A", "Player B" },
    Value = "",
    Callback = function() end
})

local PlayerTP = Teleport:Button({
    Title = "Teleport Now",
    Locked = false,
    Callback = function() end
})

-- [PE] Player Elements
local PlayerSection = Player:Section({
    Title = "| User & Utility",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "contact",
})

Player:Divider()
local UserSection = Player:Section({
    Title = "User Options",
    TextXAlignment = "Center",
    TextSize = 17,
})

local BlackScreen = Player:Toggle({
    Title = "Black Screen",
    Icon = "check",
    Type = "Checkbox",
    Default = false,
    Callback = function() end
})

local NoClip = false
local Noclip = Player:Toggle({
    Title = "No Clip",
    Icon = "check",
    Type = "Checkbox",
    Default = false,
    Callback = function(Value)
    NoClip = Value 
end
})

RunService.Stepped:Connect(function()
    if NoClip and LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

local InfiniteJump = Player:Toggle({
    Title = "Infinite Jump",
    Icon = "check",
    Type = "Checkbox",
    Default = false,
    Callback = function() end
})

local SpeedSlider = Player:Slider({
    Title = "Walk Speed",
    Step = 1,
    Value = {
        Min = 16,
        Max = 120,
        Default = 50,
    },
    Callback = function() end
})

local flyToggle = false
local flySpeed = 1
local FLYING = false
local flyKeyDown, flyKeyUp, mfly2

-- PC Fly
local function sFLY()
    repeat task.wait() until LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:WaitForChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect(); flyKeyUp:Disconnect() end

    local T = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local CONTROL = {F=0,B=0,L=0,R=0,Q=0,E=0}
    local SPEED = flySpeed

    local BG = Instance.new('BodyGyro', T)
    local BV = Instance.new('BodyVelocity', T)
    BG.P = 9e4
    BG.MaxTorque = Vector3.new(9e9,9e9,9e9)
    BG.CFrame = T.CFrame
    BV.MaxForce = Vector3.new(9e9,9e9,9e9)
    BV.Velocity = Vector3.new(0,0,0)

    FLYING = true
    task.spawn(function()
        while FLYING do
            task.wait()
            if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                SPEED = flySpeed
            else
                SPEED = 0
            end
            if SPEED ~= 0 then
                BV.Velocity = ((workspace.CurrentCamera.CFrame.LookVector * (CONTROL.F + CONTROL.B)) +
                              ((workspace.CurrentCamera.CFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,0).p) -
                              workspace.CurrentCamera.CFrame.p)) * SPEED
            else
                BV.Velocity = Vector3.new(0,0,0)
            end
            BG.CFrame = workspace.CurrentCamera.CFrame
        end
        BG:Destroy()
        BV:Destroy()
        if LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
            LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        end
    end)

    flyKeyDown = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY=="W" then CONTROL.F=flySpeed
            elseif KEY=="S" then CONTROL.B=-flySpeed
            elseif KEY=="A" then CONTROL.L=-flySpeed
            elseif KEY=="D" then CONTROL.R=flySpeed
            elseif KEY=="E" then CONTROL.Q=flySpeed*2
            elseif KEY=="Q" then CONTROL.E=-flySpeed*2 end
        end
    end)

    flyKeyUp = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY=="W" then CONTROL.F=0
            elseif KEY=="S" then CONTROL.B=0
            elseif KEY=="A" then CONTROL.L=0
            elseif KEY=="D" then CONTROL.R=0
            elseif KEY=="E" then CONTROL.Q=0
            elseif KEY=="Q" then CONTROL.E=0 end
        end
    end)
end

-- Mobile Fly Logic
local function MobileFly()
    FLYING = true
    local root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local camera = workspace.CurrentCamera
    local controlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    local v3inf = Vector3.new(9e9,9e9,9e9)

    local bv = Instance.new("BodyVelocity", root)
    bv.MaxForce = v3inf
    bv.Velocity = Vector3.new(0,0,0)

    local bg = Instance.new("BodyGyro", root)
    bg.MaxTorque = v3inf
    bg.P = 1000
    bg.D = 50

    mfly2 = RunService.RenderStepped:Connect(function()
        if LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
            local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            humanoid.PlatformStand = true
            bg.CFrame = camera.CFrame
            local direction = controlModule:GetMoveVector()
            bv.Velocity = camera.CFrame.RightVector * (direction.X * (flySpeed*50))
            bv.Velocity = bv.Velocity - camera.CFrame.LookVector * (direction.Z * (flySpeed*50))
        end
    end)
end

local FlyToggle = Player:Toggle({
    Title = "Enable Fly",
    Icon = "wind",
    Type = "Checkbox",
    Default = false,
    Callback = function(Value)
        flyToggle = Value
        if flyToggle then
            if UserInputService.TouchEnabled then
                MobileFly()
            else
                sFLY()
            end
        else
            FLYING = false
            if flyKeyDown then flyKeyDown:Disconnect(); flyKeyDown=nil end
            if flyKeyUp then flyKeyUp:Disconnect(); flyKeyUp=nil end
            if mfly2 then mfly2:Disconnect(); mfly2=nil end
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                if root:FindFirstChild("BodyVelocity") then root.BodyVelocity:Destroy() end
                if root:FindFirstChild("BodyGyro") then root.BodyGyro:Destroy() end
            end
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            if humanoid then humanoid.PlatformStand = false end
        end
    end
})

local FlySpeedSlider = Player:Slider({
    Title = "Fly Speed",
    Step = 1,
    Value = {
        Min = 1,
        Max = 10,
        Default = 1,
    },
    Callback = function(Value)
        flySpeed = Value
    end
})

Player:Divider()
local UtilitySection = Player:Section({
    Title = "Utility Tools",
    TextXAlignment = "Center",
    TextSize = 17,
})

local RedeemCodes = Player:Button({
    Title = "Redeem Codes",
    Locked = false,
    Callback = function() end
})

local SavePosition = Player:Button({
    Title = "Save Current Position",
    Locked = false,
    Callback = function() end
})

local TeleportPosition = Player:Toggle({
    Title = "Lock to Saved Position",
    Icon = "check",
    Type = "Checkbox",
    Default = false,
    Callback = function() end
})

-- [SE] Setting Elements
local DiscordSection = Settings:Section({
    Title = "| Discord",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "send",
})

Settings:Divider()
local DiscordServerSection = Credits:Section({
    Title = "Discord Info",
    TextXAlignment = "Left",
    TextSize = 17,
})

local InviteCode  = "HGJxSk37Ns"
local DiscordAPI  = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true&with_expiration=true"
local InviteLink  = "https://discord.gg/" .. InviteCode

local Response = game:GetService("HttpService"):JSONDecode(Arch.Creator.Request({
    Url = DiscordAPI,
    Method = "GET",
    Headers = {
        ["User-Agent"] = "RobloxBot/1.0",
        ["Accept"]     = "application/json",
    }
}).Body)

if Response and Response.guild then
    local DiscordInfo = Settings:Paragraph({
        Title     = Response.guild.name,
        Desc      =
            ' <font color="#52525b">Member Count :</font> ' .. tostring(Response.approximate_member_count) ..
            '\n <font color="#16a34a">Online Count :</font> ' .. tostring(Response.approximate_presence_count),
        Image     = "https://cdn.discordapp.com/icons/" .. Response.guild.id .. "/" .. Response.guild.icon .. ".png?size=1024",
        ImageSize = 42,
    })

    Settings:Button({
        Title    = "Update Info",
        Callback = function()
            local UpdatedResponse = game:GetService("HttpService"):JSONDecode(Arch.Creator.Request({
                Url    = DiscordAPI,
                Method = "GET",
            }).Body)

            if UpdatedResponse and UpdatedResponse.guild then
                DiscordInfo:SetDesc(
                    ' <font color="#52525b">Member Count :</font> ' .. tostring(UpdatedResponse.approximate_member_count) ..
                    '\n <font color="#16a34a">Online Count :</font> ' .. tostring(UpdatedResponse.approximate_presence_count)
                )
            end
        end
    })

    Settings:Button({
        Title    = "Copy Invite Link",
        Callback = function()
            if setclipboard then
                setclipboard(InviteLink)
            elseif toclipboard then
                toclipboard(InviteLink)
            end
        end
    })
end

-- [ME] Misc Elements
local MiscSection = Misc:Section({
    Title = "| Miscellaneous",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "settings-2",
})

Misc:Divider()
local WebhookSection = Misc:Section({
    Title = "Webhook Settings",
    TextXAlignment = "Center",
    TextSize = 17,
})

local WebhookInput = Misc:Input({
    Title = "Webhook URL",
    InputIcon = "link",
    Type = "Input",
    Placeholder = "Webhook URL",
    Callback = function() end
})

local WebhookRarity = Misc:Dropdown({
    Title = "Choose Rarity",
    Values = { "Common", "Rare", "Epic", "Legendary" },
    Value = "",
    Callback = function() end
})

local WebhookToggle = Misc:Toggle({
    Title = "Enable Webhook",
    Icon = "check",
    Type = "Checkbox",
    Default = false,
    Callback = function() end
})

Misc:Divider()
local ServerSection = Misc:Section({
    Title = "Server Tools",
    TextXAlignment = "Center",
    TextSize = 17,
})

local Rejoin = Misc:Button({
    Title = "Rejoin Server",
    Locked = false,
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
    end
})

local Serverhop = Misc:Button({
    Title = "Server Hop",
    Locked = false,
    Callback = function()
        local servers = {}
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local response = game:HttpGet(url)
        local data = HttpService:JSONDecode(response)

        for _, server in ipairs(data.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                table.insert(servers, server.id)
            end
        end

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
        end
    end
})

Misc:Divider()

local CopyServerID = Misc:Button({
    Title = "Copy Server ID",
    Locked = false,
    Callback = function()
        if setclipboard then
            setclipboard(game.JobId)
        elseif toclipboard then
            toclipboard(game.JobId)
        end
    end
})

local ServerIDBox
ServerIDBox = Misc:Input({
    Title = "Enter Server ID",
    InputIcon = "server",
    Type = "Input",
    Placeholder = "Paste ID",
    Callback = function(text)
        ServerIDBox.ServerIdValue = text
    end
})

local JoinServerID = Misc:Button({
    Title = "Join Server ID",
    Locked = false,
    Callback = function()
        local serverId = ServerIDBox.ServerIdValue
        if serverId and serverId ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, Players.LocalPlayer)
        end
    end
})

-- [CE] Credit Elements
local CreditsSection = Credits:Section({
    Title = "| Credits",
    TextXAlignment = "Left",
    TextSize = 20,
    Icon = "crown",
})

Credits:Divider()
local Contributors = Credits:Section({
    Title = "Contributors",
    TextXAlignment = "Left",
    TextSize = 17,
})

local WindUIParagraph = Credits:Paragraph({
    Title = "WindUI (.ftgs)",
    Desc = "Thanks for the beautiful UI framework used in this project.",
    Locked = false,
})

local ElvishHubParagraph = Credits:Paragraph({
    Title = "ElvishHubV4",
    Desc = "Thanks for the fly system and additional script references.",
    Locked = false,
})

local StellarHubParagraph = Credits:Paragraph({
    Title = "Stellar Hub",
    Desc = "Thanks for the feature ideas and inspiration.",
    Locked = false,
})