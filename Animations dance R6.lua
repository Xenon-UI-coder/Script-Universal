--Animations dance R6
save = nil
c3 = function(r,g,b) return Color3.new(r/255,g/255,b/255) end
 
--do something ro get save file
 
if not save then
    save = {
        ui = {
            highlightcolor = c3(33, 122, 255);
            errorcolor = c3(255, 0, 0);
            --AnimationPriority colors
            core = c3(65, 65, 65);
            idle = c3(134, 200, 230);
            movement = c3(114, 230, 121);
            action = c3(235, 235, 235);
        };
        preferences = {
            
        };
        custom_animations = {
            template = {
                Title = "";
                AnimationId = "rbxassetid://";
                Image = "rbxassetid://16888680650"; --not required
                Speed = 1;
                Time = 0;
                Weight = 1;
                Loop = false;
                R6 = true;
                Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
            };
        };
    }
end
 
lp = game:GetService("Players").LocalPlayer
m = lp:GetMouse()
 
function getHumanoid()
    if not lp.Character then return nil end
    return lp.Character:FindFirstChildWhichIsA("Humanoid")
end
 
screengui = game:GetObjects("rbxassetid://02159099015")[1]
screengui.Parent = game:GetService("CoreGui")
main = screengui.Topbar.Main
 
mainframe = main.MainFrame
scrollframe = mainframe.ScrollingFrame
items = scrollframe.Items
search = scrollframe.SearchFrame.Search
searchbutton = scrollframe.SearchFrame.ImageLabel.TextButton
searchframe = scrollframe.SearchFrame
 
preview = main.Preview
previewimage = preview.Image
previewtitle = preview.Title
previewdesc = preview.Desc
 
function draggable(gObj)
    local UserInputService = game:GetService("UserInputService")
 
    local gui = gObj
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end
function tween(object,style,direction,t,Sorcerer_Wall)
    local tweenservice = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(t,Enum.EasingStyle[style],Enum.EasingDirection[direction])
    local tween = tweenservice:Create(object,tweenInfo,Sorcerer_Wall)
    tween:Play()
    return tween
end
 
draggable(screengui.Topbar)
 
function checkIfStudio()
    return game.Name ~= "Game"
end
 
if not checkIfStudio() then
    print'Client is not in Roblox studio'
    --main.Size = UDim2.new(0.398, 0, 0.477, 0)
end
 
search.Changed:connect(function(p)
    local n = 0
    for i,v in pairs (items:GetChildren()) do
        if v:IsA("TextButton") and not string.find(v.Title.Text:lower(), search.Text:lower()) then
            v.Visible = false
        elseif v:IsA("TextButton") and string.find(v.Title.Text:lower(), search.Text:lower()) then
            v.Visible = true
            n = n + 1
        end
    end
    if p == "Text" then
        if n > 0 then
            tween(searchframe, "Sine", "Out", 0.25, {
                BorderColor3 = save.ui.highlightcolor;
            })
            wait(0.25)
            tween(searchframe, "Sine", "In", 0.5, {
                BorderColor3 = c3(58, 58, 58);
            })
        else
            tween(searchframe, "Sine", "Out", 0.25, {
                BorderColor3 = save.ui.errorcolor;
            })
            wait(0.25)
            tween(searchframe, "Sine", "In", 0.5, {
                BorderColor3 = c3(58, 58, 58);
            })
        end
    end
end)
 
spawn(function()
    while wait(10) do
        --auto-save every 10 seconds
    end
end)
 
cam = workspace.CurrentCamera
 
running = {}
popAnims = {
    armturbine = {
        Title = "Arm Turbine";
        AnimationId = "rbxassetid://259438880";
        Speed = 1.5;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    weirdsway = {
        Title = "Weird Sway";
        AnimationId = "rbxassetid://248336677";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    weirdfloat = {
        Title = "Weird Float";
        AnimationId = "rbxassetid://248336459";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    weirdpose = {
        Title = "Weird Pose";
        AnimationId = "rbxassetid://248336163";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    penguinslide = {
        Title = "Penguin Slide";
        AnimationId = "rbxassetid://282574440";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    scream = {
        Title = "Scream";
        AnimationId = "rbxassetid://180611870";
        Speed = 1.5;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    crouch = {
        Title = "Crouch";
        AnimationId = "rbxassetid://182724289";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    happydance = {
        Title = "Happy Dance";
        AnimationId = "rbxassetid://248335946";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    floatinghead = {
        Title = "Floating Head";
        AnimationId = "rbxassetid://121572214";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    balloonfloat = {
        Title = "Balloon Float";
        AnimationId = "rbxassetid://148840371";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    pinchnose = {
        Title = "Pinch Nose";
        AnimationId = "rbxassetid://30235165";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    Sorcerer_Wall = {
        Title = "Sorcerer Wall combo (in TSB only)";
        AnimationId = "rbxassetid://18903642853";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = false;
        R6 = true;
        Priority = 0; --0, 1, 2, and 1000 are acceptable priorities
    };
    cry = {
        Title = "Cry";
        AnimationId = "rbxassetid://180612465";
        Speed = 0;
        Time = 1.5;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    partytime = {
        Title = "Sands";
        AnimationId = "rbxassetid://17064756083";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    moondance = {
        Title = "Moon Dance";
        AnimationId = "rbxassetid://27789359";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    insanelegs = {
        Title = "Insane Legs";
        AnimationId = "rbxassetid://87986341";
        Speed = 99;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    rotation = {
        Title = "Rotation";
        AnimationId = "rbxassetid://136801964";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    insanerotation = {
        Title = "Insane Rotation";
        AnimationId = "rbxassetid://136801964";
        Speed = 99;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    roar = {
        Title = "Roar";
        AnimationId = "rbxassetid://163209885";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    spin = {
        Title = "Spin";
        AnimationId = "rbxassetid://188632011";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    zombiearms = {
        Title = "Zombie Arms";
        AnimationId = "rbxassetid://183294396";
        Speed = 0;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    insane = {
        Title = "Insane";
        AnimationId = "rbxassetid://33796059";
        Speed = 99;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    neckbreak = {
        Title = "Neck Break";
        AnimationId = "rbxassetid://35154961";
        Speed = 0;
        Time = 2;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    headdetach = {
        Title = "Head Detach";
        AnimationId = "rbxassetid://35154961";
        Speed = 0;
        Time = 3;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    idle = {
        Title = "Idle";
        AnimationId = "rbxassetid://180435571";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
    charleston = {
        Title = "Charleston";
        AnimationId = "rbxassetid://429703734";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
}
robloxOwns = {}
 
ownerOwns = {}
 
customAnims = {}
 
function getOwnedAnimations(userid)
    local httpserv = game:GetService("HttpService")
    local owned = httpserv:GetAsync("https://inventory.roblox.com/v1/users/"..userid.."/inventory/Animation?pageNumber=1&itemsPerPage=10", true)
    return owned
end
 
 
function getAnim(name)
    return popAnims[name] or customAnims[name]
end
function runAnim(info, humanoid)
    local animation = Instance.new("Animation")
    animation.AnimationId = info.AnimationId
    
    local animtrack = humanoid:LoadAnimation(animation)
    table.insert(running,animtrack)
    animtrack.Priority = info.Priority
    animtrack.Looped = info.Loop
    
    animtrack:Play()
    animtrack:AdjustSpeed(info.Speed)
    animtrack:AdjustWeight(info.Weight)
    animtrack.TimePosition = info.Time
    
    animtrack.Stopped:connect(function()
        for i = 1,#running do
            if running[i] == animtrack then
                table.remove(running,i)
            end
        end
    end)
    
    return animtrack
end
 
template = items.Template
template.Parent = nil
 
function clear()
    for i,v in pairs (items:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end
end
 
--[[
    idle = {
        Title = "Idle";
        AnimationId = "rbxassetid://180435571";
        Speed = 1;
        Time = 0;
        Weight = 1;
        Loop = true;
        R6 = true;
        Priority = 2; --0, 1, 2, and 1000 are acceptable priorities
    };
--]]
 
function createbutton(v)
    local temp = template:Clone()
    temp.Parent = items
    temp.Name = v.Title
    temp.Title.Text = v.Title
    temp.Image.Image = v.Image or "rbxassetid://16888680650"
    if temp.Image.Image == "rbxassetid://16888680650" then
        temp.Image.ImageColor3 = (v.Priority == 0 and save.ui.idle) or (v.Priority == 1 and save.ui.movement) or (v.Priority == 2 and save.ui.action) or (v.Priority == 1000 and save.ui.core)
    else
        temp.Image.ImageColor3 = Color3.new(1,1,1)
    end
    temp.LayoutOrder = math.random(1,10000)
    
    temp.Settings.AnimationId.Value = v.AnimationId
    temp.Settings.Loop.Value = v.Loop
    temp.Settings.Priority.Value = v.Priority
    temp.Settings.R6.Value = v.R6
    temp.Settings.Speed.Value = v.Speed
    temp.Settings.Weight.Value = v.Weight
    temp.Settings.Time.Value = v.Time
    
    temp.MouseEnter:connect(function()
        preview.Title.Text = v.Title
        preview.Desc.Text = "Speed: "..tostring(v.Speed).."\nPriority: "..tostring(v.Priority).."\nR6 Rig: "..tostring(v.R6).."\nAnimID: "..tostring(v.AnimationId).."\n\n"..(v.Description or "No description provided")
        
        preview.Image.Image = v.Image or "rbxassetid://16888680650"
        if preview.Image.Image == "rbxassetid://16888680650" then
            preview.Image.ImageColor3 = (v.Priority == 0 and save.ui.idle) or (v.Priority == 1 and save.ui.movement) or (v.Priority == 2 and save.ui.action) or (v.Priority == 1000 and save.ui.core)
        else
            preview.Image.ImageColor3 = Color3.new(1,1,1)
        end
    end)
    temp.MouseButton1Click:connect(function()
        temp.Border.ImageColor3 = save.ui.highlightcolor
        for i,anim in pairs (running) do
            if anim.Animation.AnimationId == v.AnimationId then
                anim:Stop()
                return
            end
        end
        temp.Border.Visible = true
        local rAnim = runAnim(v, getHumanoid())
        rAnim.Stopped:connect(function()
            temp.Border.Visible = false
        end)
    end)
    
    return temp
end
 
dropdown = mainframe.ScrollingFrame.DropdownFrame
elements = dropdown.HoldContentsFrame.Frame.Elements
dropdownenabled = true
 
tween(dropdown.HoldContentsFrame.Frame, "Linear", "In", 0, {
    Position = UDim2.new(0,0,-1,0)
})
dropdown.HoldContentsFrame.Frame.Visible = false
 
dropdowndeactivate = screengui.DropdownDeactivate
dropdowndeactivate.Visible = false
 
function hideddown()
    tween(dropdown.HoldContentsFrame.Frame, "Linear", "In", 0, {
        Position = UDim2.new(0,0,-1,0)
    })
    dropdown.HoldContentsFrame.Frame.Visible = false
    dropdowndeactivate.Visible = false
    dropdownenabled = true
    
    for i,e in pairs (elements:GetChildren()) do
        if e:IsA("TextButton") then
            e.BackgroundColor3 = c3(46,46,46)
        end
    end
end
 
dropdown.MouseButton1Click:connect(function()
    print'ddownclick'
    dropdownenabled = not dropdownenabled
    if dropdownenabled then
        hideddown()
    else
        tween(dropdown.HoldContentsFrame.Frame, "Linear", "In", 0.3, {
            Position = UDim2.new(0,0,0,0)
        })
        dropdown.HoldContentsFrame.Frame.Visible = true
        dropdowndeactivate.Visible = true
    end
end)
 
dropdowndeactivate.MouseButton1Down:connect(function()
    hideddown()
end)
 
for i,v in pairs (elements:GetChildren()) do
    if v:IsA("TextButton") then
        v.MouseEnter:connect(function()
            for i,e in pairs (elements:GetChildren()) do
                if e:IsA("TextButton") then
                    e.BackgroundColor3 = c3(46,46,46)
                end
            end
            v.BackgroundColor3 = save.ui.highlightcolor
        end)
        v.MouseButton1Click:connect(function()
            hideddown()
            dropdown.TextLabel.Text = v.Name
            sort(v.Name)
        end)
    end
end
 
function sort(category)
    clear()
    if category == "Popular" then
        for i,v in pairs (popAnims) do
            local temp = createbutton(v)
        end
    elseif category == "?" then
        
    end
end
 
game:GetService('RunService').RenderStepped:connect(function()
    items.Parent.CanvasSize = UDim2.new(0,0,0,items.GridLayout.AbsoluteContentSize.Y + 50)
end)
 
sort("Popular")