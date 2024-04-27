alreadySet = false;
AddEventHandler('playerSpawned', function()
	if not alreadySet then 
		TriggerServerEvent('RUIN_Scoreboard:SetupImg')
		alreadySet = true;
	end 
end)

RegisterKeyMapping('openScoreboard', 'Open Scoreboard', 'keyboard', 'F10')

local open = false
RegisterCommand('openScoreboard', function()
    if not open then 
        TriggerServerEvent('RUIN_Scoreboard:Open')
        open = true
    end
end)

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false) 
  open = false
end)

RegisterNetEvent('RUIN_Scoreboard:Open')
AddEventHandler('RUIN_Scoreboard:Open', function (players)
    SetNuiFocus(true, true)
    for k,v in pairs(players) do 
        SendNUIMessage({
            action = 'LoadPlayers',
            pid = v.source,
            name = v.name,
            ping = v.ping,
            avatar = v.avatar,
            job = v.job,
            totalusers = v.totalusers,
            staffusers = v.staffusers,
            max = v.max
        })
    end
end)

RegisterNetEvent('RUIN_Scoreboard:UpdateUptime')
AddEventHandler('RUIN_Scoreboard:UpdateUptime', function (uptime)
    SendNUIMessage({
        action = 'uptime',
        uptime = uptime
    })
end)
