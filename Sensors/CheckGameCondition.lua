local sensorInfo = {
	name = "CheckGameCondition",
	desc = "Checks for 45 points earned",
	author = "AlisherKenzhebayev",
	date = "2022-06-11",
	license = "NotALicense",
}

-- get madatory module operators
VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

-- get other madatory dependencies
attach.Module(modules, "message") -- communication backend load

local EVAL_PERIOD_DEFAULT = 0 -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return current wind statistics
return function(gameMission)	
	
	if gameMission["score"] >= 90 then -- I Samuel Juraj Koprda only changed this variable from 45 to 90
		return true
	end
	return false
end
