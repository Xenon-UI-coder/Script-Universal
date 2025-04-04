--OP Camlock
getgenv().NemesisPreBeta = {
    ["Settings"] = {
        Disabling = {Toggle = false, Keybind = "H"},
        UpdateTickDelay = 0.05
    },
    ["Camlock"] = {
        Toggling = {
            Enable = true, 
            Keybind = "c"
        },
        Settings = {
            Prediction = { 
                true, 
                999.999, 
                false, 
                .003
            },
            Smoothing = {
                smoothness = true, 
                x = 1, 
                y = 1
            },
            OffSets = {
                Jump = {
                    Enable = false, 
                    [1] = Vector3.new(0, 3, 0)
                }
            }
        },
        Conditions = {
            Player = {
                WallCheck = false, 
                Grabbed = false, 
                Knocked = false, 
                CrewID = false
            },
            BodyParts = {"HumanoidRootPart", "Head"}
        }
    },
    ["Silent"] = {
        Toggling = { Enable = false },
        Settings = {
            Prediction = { true , 0.11934 , false, 0.003 },
            HitChance = 100,
            Resolver = true,
            OffSets = {
                Jump = {
                    Enable = false, 
                    [1] = Vector3.new(0, 0, 0)
                }
            }
        },
        Conditions = {
            Player = { WallCheck = false, Grabbed = false, Knocked = false, CrewID = false },
            BodyParts = {"HumanoidRootPart", "UpperTorso", "Head"}
        }
    },
    ["Field Of View"] = {
        Enable = true, 
        Size = 1000, 
        Color = Color3.fromRGB(255, 255, 255), 
    },
    ["Miscs"] = {
        ["Sorting"] = {
            Toggled = false,
            Key = "F",
            alphabetically = true,
            Ammo = false,
            Custom = {
                Enable = false,
                List = {[1] = "[Revolver]", [2] = "[Chicken]"} -- // etc
            }
        },
        ["Animation"] = {
            Enable = true,
            Animations = {["Greet"] = {[1] = false, [2] = "V"}}
        }
    }
}





local DUpvalue, Round, V3, V2, CF, Rservice, UserInput, Ping, Mouse, backpack  = debug.getupvalue, math.round, Vector3.new, Vector2.new, CFrame.new, game:GetService("RunService"), game:GetService("UserInputService"), game:GetService("Stats").PerformanceStats.Ping, game:GetService("Players").LocalPlayer:GetMouse(), game:GetService("Players").LocalPlayer.Backpack
local Players, Self, Character, Camera = game:GetService("Players"), game:GetService("Players").LocalPlayer, game:GetService("Players").LocalPlayer.Character or  game:GetService("Players").LocalPlayer.CharacterAdded:Wait(), game:GetService("Workspace").CurrentCamera
local idx, endp


local Storage = {
    Drawings = {},
    Connections = {},
    targets = {
        [1] = nil,
        [2] = nil
    },
    ValuePosition = nil,
    bodyparts = {
        [1] = "",
        [2] = ""
    },
    update_tick = tick(),
    etc = {
        Ctoggled = false,
        Mtoggled = false
    },
    items = {}
}



function NewConnection(type, callback)
    local connection = type:Connect(callback)
    Storage.Connections[#Storage.Connections+1] = connection
    return connection
end

function Chance(chance, maxchance)
    return math.random(maxchance) <= chance
end


function Thread(Function, ...)
    local co
    local success, result

    if Function ~= nil then
        co = coroutine.create(Function)
        success, result = coroutine.resume(co, ...)
    end
    if success ~= nil and co ~= nil and Function ~= nil then
        return result
    end
end


function wallcheck(origin)
    local parts = Camera:GetPartsObscuringTarget({origin.Position,  Character.HumanoidRootPart.Position}, {Camera, Character, origin.Parent})
    if #parts == 0 then
        return true
    end
    return false
end

function Grabbed(player)
    if player.Character ~= nil  then
        return not player.Character:FindFirstChild("GRABBING_CONSTRAINT")
    end
end

function Knocked(player)
    if player.Character ~= nil  then
        return player.Character.BodyEffects["K.O"].Value ~= true
    end
end


local pingHistory = {}
local lastPingUpdateTime = tick()



function GetPrediction()
    local currentPing = Ping:GetValue() * 0.003
    if getgenv().NemesisPreBeta.Camlock.Settings.Prediction[3] or getgenv().NemesisPreBeta.Silent.Settings.Prediction[3] then
        return currentPing
    else
        return getgenv().NemesisPreBeta.Camlock.Settings.Prediction[2] and getgenv().NemesisPreBeta.Silent.Settings.Prediction[2]
    end
end

function Crew(player)
    if game.Players.LocalPlayer:FindFirstChild("DataFolder"):FindFirstChild("Information"):FindFirstChild("Crew") then
        local SelfCrewValue =  game.Players.LocalPlayer:FindFirstChild("DataFolder"):FindFirstChild("Information"):FindFirstChild("Crew")
        if SelfCrewValue.Value ~= 0 then
            if player:FindFirstChild("DataFolder"):FindFirstChild("Information"):FindFirstChild("Crew")  then
                local Enimy = player:FindFirstChild("DataFolder"):FindFirstChild("Information"):FindFirstChild("Crew")
                if Enimy.Value == SelfCrewValue.Value then
                    return false
                end
            end
        end
    end
    return true
end



function Closespart(player, hitboxes)
    local closestPart
    local closestDistanc = math.huge
    for _, hitbox in pairs(hitboxes) do
        local part = player.Character:FindFirstChild(hitbox)
        if part then
            local pos = Camera:WorldToViewportPoint(part.Position)
            local distance = (UserInput:GetMouseLocation() - V2(pos.X, pos.Y)).Magnitude
            if distance < closestDistanc then
                closestPart = part
                closestDistanc = distance
            end
        end
    end
    return closestPart
end



function isInCustomList(toolName)
    for _, customName in ipairs(getgenv().NemesisPreBeta.Miscs.Sorting.Custom.List) do
        if toolName == customName then
            return true
        end
    end
    return false
end


function GetClosest(table)
    local MaxDistance = getgenv().NemesisPreBeta["Field Of View"].Enable and getgenv().NemesisPreBeta["Field Of View"].Size or math.huge
    local Target

    for i,v in pairs(Players:GetPlayers()) do
        if v ~= Self and v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
            local ViewPort, Visible = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local Mag = (UserInput:GetMouseLocation() - Vector2.new(ViewPort.X, ViewPort.Y)).Magnitude
            if MaxDistance > Mag and Visible and (
                (table.WallCheck and wallcheck(v.Character.HumanoidRootPart)) or true and
                (table.Grabbed and Grabbed(v)) or true and
                (table.Knocked and Knocked(v)) or true and
                (table.CrewID and Crew(v)) or true 
            ) then
                MaxDistance = Mag
                Target = v
            end
        end
    end
    return Target
end

function Velocity(Target, method)
    if method == true then
        local pos = Target.Character.HumanoidRootPart.Position
        local lastTime = tick()
        local currentPos, currentTime
        local connection
        connection =
            game:GetService("RunService").Heartbeat:Connect(
            function()
                currentPos = Target.Character.HumanoidRootPart.Position
                currentTime = tick()
                connection:Disconnect()
            end
        )
        wait(0.01)
        local velocity = (currentPos - pos) / (currentTime - lastTime)
        return Vector3.new(math.floor(velocity.X), math.floor(velocity.Y), math.floor(velocity.Z))
    else
        return Target.character:FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity
    end
end

function playAnimation(animationName)
    local args = {
        [1] = "AnimationPack",
        [2] = animationName,
    }
    game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
end


-- // updates

function UpdateSilent()
    local SilentTable = getgenv().NemesisPreBeta.Silent
    if SilentTable.Toggling.Enable then
        Storage.targets[2] = GetClosest(SilentTable.Conditions.Player)
        if Storage.targets[2] ~= nil and Storage.targets[2].Character ~= nil and Storage.targets[2].Character:FindFirstChild("HumanoidRootPart") then
            Storage.bodyparts[2] =  tostring(Closespart(Storage.targets[2], SilentTable.Conditions.BodyParts))
            local position = Storage.targets[2].Character[Storage.bodyparts[2]].Position
            if SilentTable.Settings.OffSets.Jump.Enable and Storage.targets[2].Character:FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall then
                position = position + SilentTable.Settings.OffSets.Jump[1]
            end
            Storage.CFposition = position + (SilentTable.Settings.Prediction and Velocity(Storage.targets[2], SilentTable.Settings.Resolver) * GetPrediction() or 0)
        end
    end
end


function UpdateCamlock()
    local CamLockTable = getgenv().NemesisPreBeta.Camlock
    if Storage.etc.Ctoggled and CamLockTable.Toggling.Enable and Storage.targets[1] ~= nil and Storage.targets[1].Character ~= nil then
        local position = Storage.targets[1].Character[Storage.bodyparts[1]].Position

        if CamLockTable.Settings.OffSets.Jump.Enable and Storage.targets[1].Character:FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall then
            position = position + CamLockTable.Settings.OffSets.Jump[1]
        end

        if CamLockTable.Settings.Smoothing.enable then
            local goal = CFrame.new(Camera.CFrame.Position, position + (CamLockTable.Settings.Prediction[1] * GetPrediction() or Vector3.new()))
            Camera.CFrame = Camera.CFrame:Lerp(goal, CamLockTable.Settings.Smoothing.x, CamLockTable.Settings.Smoothing.y)
        else
            local prediction = CamLockTable.Settings.Prediction[1] and Storage.targets[1].Character.HumanoidRootPart.AssemblyLinearVelocity * GetPrediction() or Vector3.new()
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, position + prediction)
        end
    end
end

do -- main connection

    NewConnection(UserInput.InputBegan, function(key, wtv)
        if key.KeyCode == Enum.KeyCode[getgenv().NemesisPreBeta.Camlock.Toggling.Keybind:upper()] and not wtv then
            if getgenv().NemesisPreBeta.Camlock.Toggling.Enable then
                Storage.etc.Ctoggled = not Storage.etc.Ctoggled
                Storage.targets[1] = GetClosest(getgenv().NemesisPreBeta.Camlock.Conditions.Player)

                if  Storage.targets[1] and  Storage.targets[1].Character then
                    Storage.bodyparts[1] = tostring(Closespart(Storage.targets[1], getgenv().NemesisPreBeta.Camlock.Conditions.BodyParts))

                end
            else
                if  Storage.targets[1] ~= nil then
                    Storage.targets[1] = nil
                end
            end
        end
    end)

    NewConnection(UserInput.InputBegan, function(key, wtv)
        if getgenv().NemesisPreBeta.Settings.Disabling.Toggle and key.KeyCode == Enum.KeyCode[getgenv().NemesisPreBeta.Settings.Disabling.Keybind:upper()]  and not wtv then
            for i,v in pairs(Storage.Connections) do
                if v then
                    v:Disconnect()
                end
            end
            for i,v in pairs(Storage.Drawings) do
                if v and v.__OBJECT_EXISTS then
                    print("f")
                end
            end
        end
    end)

    NewConnection(UserInput.InputBegan, function(key, wtv)
        if getgenv().NemesisPreBeta.Miscs.Sorting.Toggled and key.KeyCode == Enum.KeyCode[getgenv().NemesisPreBeta.Miscs.Sorting.Key:upper()] and not wtv then
            local items = {}

            if getgenv().NemesisPreBeta.Miscs.Sorting.Custom.Enable then
                for _, customName in ipairs(getgenv().NemesisPreBeta.Miscs.Sorting.Custom.List) do
                    for _, item in pairs(backpack:GetChildren()) do
                        if item:IsA("Tool") and item.Name == customName then
                            table.insert(items, 1, item)
                            break
                        end
                    end
                end
            end
            
            for _, item in pairs(backpack:GetChildren()) do
                if item:IsA("Tool") and (not getgenv().NemesisPreBeta.Miscs.Sorting.Custom.Enable or not isInCustomList(item.Name)) then
                    table.insert(items, item)
                end
            end
            
            if getgenv().NemesisPreBeta.Miscs.Sorting.alphabetically and not getgenv().NemesisPreBeta.Miscs.Sorting.Custom.Enable then
                table.sort(items, function(a, b)
                    return a.Name < b.Name
                end)
            end
            
            if getgenv().NemesisPreBeta.Miscs.Sorting.Ammo and not getgenv().NemesisPreBeta.Miscs.Sorting.Custom.Enable then
                table.sort(items, function(a, b)
                    return a.Value > b.Value
                end)
            end

            for _, item in ipairs(items) do
                item.Parent = nil
                wait(0.01)
                item.Parent = backpack
            end

        end
    end)

    NewConnection(UserInput.InputBegan, function(key, wtv)
        if getgenv().NemesisPreBeta.Miscs.Animation.Enable and not wtv then
            for animationName, animationData in pairs(getgenv().NemesisPreBeta.Miscs.Animation.Animations) do
                if animationData[1] and key.KeyCode == Enum.KeyCode[animationData[2]] then
                    playAnimation(animationName)
                    break
                end
            end
        end
    end)




    NewConnection(Rservice.Heartbeat, function()

            --//  camlock
            Thread(UpdateCamlock())

            --// Silent UPDATE
            Thread(UpdateSilent())

    end)
end


    for connection, index in next, getconnections(workspace.CurrentCamera.Changed) do
        index:Disable()
    end
    for connection, index in next, getconnections(workspace.CurrentCamera:GetPropertyChangedSignal("CFrame")) do
        index:Disable()
    end


local oldIndex
oldIndex = hookmetamethod(game, "__index", function(t, k)
	if t:IsA("Mouse") and k == "Hit" or k == "Target" then
		if  getgenv().NemesisPreBeta.Silent.Toggling.Enable and Chance(getgenv().NemesisPreBeta.Silent.Settings.HitChance, 100) and Storage.targets[2] ~= nil then
			local Hit = CFrame.new(Storage.CFposition)
			return (k == "Hit" and Hit)
		end
	end
	return oldIndex(t, k)
end)