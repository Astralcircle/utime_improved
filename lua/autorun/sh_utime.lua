local meta = FindMetaTable("Player")

if SERVER then
	function meta:SetUTime(num)
		self:SetNW2Int("TotalUTime", num)
	end

	function meta:SetUTimeStart(num)
		self:SetNW2Int("UTimeStart", num)
	end
end

function meta:GetUTime()
	return self:GetNW2Int("TotalUTime")
end
function meta:GetUTimeStart()
	return self:GetNW2Int("UTimeStart")
end

function meta:GetUTimeSessionTime()
	return CurTime() - self:GetUTimeStart()
end

function meta:GetUTimeTotalTime()
	return self:GetUTime() + CurTime() - self:GetUTimeStart()
end
