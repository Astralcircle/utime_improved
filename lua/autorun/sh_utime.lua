local meta = FindMetaTable("Player")

if SERVER then
	function meta:SetUTime(num)
		self:SetCBInt("TotalUTime", num)
	end
end

function meta:GetUTime()
	return self:GetCBInt("TotalUTime")
end

function meta:GetUTimeSessionTime()
	return CurTime() - self:GetCreationTime()
end

function meta:GetUTimeTotalTime()
	return self:GetUTime() + CurTime() - self:GetCreationTime()
end
