local sensorInfo = {
	name = "GetSafePoints",
	desc = "Return points on map that are not near any enemy unit",
	author = "Naimad1",
	date = "2022-05-20",
	license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- speedups
local mapX = Game.mapSizeX
local mapZ = Game.mapSizeZ
function tablelength(T)
  local count = 0
  for _ in pairs(T) do 
	count = count + 1 
	end
  return count
end
return function(enemyPositions)
    Spring.Echo("ENEMY count ",tablelength(enemyPositions))
    local safePoints = {Vec3(3850, 682, 750)} -- base position
    for xCoord = 64, mapX, 360 do
        for zCoord = 64, mapZ, 360 do
            local yCoord = Spring.GetGroundHeight(xCoord, zCoord)
            local safe = true
            local pointPos = Vec3(xCoord, yCoord, zCoord)
            for _, enemyPos in pairs(enemyPositions) do
                if pointPos:Distance(enemyPos) < 360 then -- SJK changed this variable here
                    safe = false
                    --Spring.Echo("POINT DEEMED UNSAGFE ")
                    break
                end
            end
            if safe == true then
                Spring.Echo("POINT DEEMED SAFE ")
                safePoints[#safePoints+1] = pointPos
            end
        end
    end
    
    return safePoints
end