sql.Query("CREATE TABLE IF NOT EXISTS utime (id INTEGER PRIMARY KEY, totaltime INTEGER NOT NULL)")

hook.Add("PlayerInitialSpawn", "UTime_Initialize", function(ply)
	local steamid = ply:SteamID64()
	local row = sql.QueryTyped("SELECT totaltime FROM utime WHERE id = ?", steamid)[1]
	local time = row and row.totaltime

	if not time then
		sql.QueryTyped("INSERT INTO utime VALUES (?, ?)", steamid, 0)
		time = 0
	end

	ply:SetUTimeStart(CurTime())
	ply:SetUTime(time)
end)

timer.Create("UTime_TimeUpdater", 60, 0, function()
	for _, ply in player.Iterator() do
		if ply:IsConnected() then
			sql.QueryTyped("UPDATE utime SET totaltime = ? WHERE id = ?", math.floor(ply:GetUTimeTotalTime()), ply:SteamID64())
		end
	end
end)
