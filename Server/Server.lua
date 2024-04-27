RegisterServerEvent('RUIN_Scoreboard:Open')
AddEventHandler('RUIN_Scoreboard:Open', function ()
    local src = source
    local xPlayers = GetPlayers()
	local players  = {}
   local xPlayer = exports['ruin_lib']:GetUser(src)

	for i=1, #xPlayers, 1 do
		table.insert(players, {
			source = xPlayers[i],
            name = GetPlayerName(xPlayers[i]),
            ping = GetPlayerPing(xPlayers[i]),
            totalusers = #xPlayers,
            max = GetConvarInt('sv_maxclients', 32),
            job = exports['ruin_lib']:GetJob(source),
            staffusers = GetStaffCount()
		})
	end
    table.sort(players, function(a, b)    return a.source < b.source end)
	TriggerClientEvent('RUIN_Scoreboard:Open', src, players)
end)

function GetStaffCount()
    local staff = exports['ruin_lib']:GetGroup(source)
    return staff
end


CreateThread(function()
	local uptimeMinute, uptimeHour, uptime = 0, 0, ''

	while true do
		Citizen.Wait(1000 * 60) -- every minute
		uptimeMinute = uptimeMinute + 1

		if uptimeMinute == 60 then
			uptimeMinute = 0
			uptimeHour = uptimeHour + 1
		end

		uptime = string.format("%02dh %02dm", uptimeHour, uptimeMinute)
        TriggerClientEvent('RUIN_Scoreboard:UpdateUptime', -1, uptime)
	end
end)
