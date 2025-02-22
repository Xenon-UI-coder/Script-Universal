local function callback(Text)
    if Text == "Yes" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AOCScript/AOC/main/AOC_Protected.lua", true))()
    elseif Text == "No" then
        game.Players.localPlayer:kick("MOTHET FUCKER")
    end
end

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback

game.StarterGui:SetCore("SendNotification", {
    Title = "AOC",
    Text = "Do you want to open This HUB?",
    Icon = "",
    Duration = 9000000000000,
    Button1 = "Yes",
    Button2 = "No",
    Callback = NotificationBindable,
})