sql.Query("CREATE TABLE IF NOT EXISTS utime (id INTEGER PRIMARY KEY, totaltime INTEGER NOT NULL)")

hook.Add("PlayerInitialSpawn", "UTime_Initialize", function(ply)
	local steamid = ply:SteamID64()
	local row = sql.QueryTyped("SELECT totaltime FROM utime WHERE id = ?", steamid)[1]

	local time = row and row.totaltime or 0
	sql.QueryTyped("REPLACE INTO utime VALUES (?, ?)", steamid, time)

	ply:SetUTimeStart(CurTime())
	ply:SetUTime(time)
end)

timer.Create("UTime_TimeUpdater", 10, 0, function()
	for _, ply in player.Iterator() do
		sql.QueryTyped("UPDATE utime SET totaltime = ? WHERE id = ?", math.floor(ply:GetUTimeTotalTime()), ply:SteamID64())
	end
end)
