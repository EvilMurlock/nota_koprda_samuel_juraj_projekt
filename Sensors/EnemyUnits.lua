local sensorInfo = {
	name = "FriendlyUnits around us",
	desc = "Returns list of friendly units in area around unit",
	author = "Samuel Juraj Koprda",
	date = "2025-03-26",
	license = "notAlicense",
}


local EVAL_PERIOD_DEFAULT = -1 -- instant, no cashing, im sure its fine

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end


-- @description returns list of friendly units around first unit
return function()
	local p = Sensors.core.Position()

	local friendlyTeams = Spring.Get
	local enemyUnits = {}
	
	for i=1, #enemyTeams do
		local teamID = enemyTeams[i]
		local thisTeamUnits = Spring.GetTeamUnits(teamID)
		
		for u=1, #thisTeamUnits do
			enemyUnits[#enemyUnits + 1] = thisTeamUnits[u]
		end
	end
	
	return enemyUnits
end
