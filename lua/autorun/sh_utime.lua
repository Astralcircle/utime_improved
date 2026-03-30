local meta = FindMetaTable("Player")

if SERVER then
	function meta:SetUTime(num)
		self:SetNW2Int("TotalUTime", num)
	end
end

function meta:GetUTime()
	return self:GetNW2Int("TotalUTime")
end

function meta:GetUTimeSessionTime()
	return CurTime() - self:GetCreationTime()
end

function meta:GetUTimeTotalTime()
	return self:GetUTime() + CurTime() - self:GetCreationTime()
end
