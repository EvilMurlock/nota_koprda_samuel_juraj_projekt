local sensorInfo = {
	name = "GetUnits",
	desc = "Returns a list of units ordered by their priority.",
	author = "Kahlan, Samuel Juraj Koprda", -- SJK just changed up some small details, so it works for my solution
	date = "2025-08-24",
	license = "none",
}

local EVAL_PERIOD_DEFAULT = 0 -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

function insertToList(listToInsert, returnList)
	for _, item in ipairs(listToInsert) do
		local x, y, z = Spring.GetUnitPosition(item)
		--if x > 300 and z < 2*Game.mapSizeZ/3 then
		table.insert(returnList, item)
		--end
	end
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do 
	count = count + 1 
	end
  return count
end

-- @description returns list of units ordered by priorities (number of points)
 function(myUnits)
	local orderedUnits = {}
	local unitFilter = Sensors.core.FilterUnitsByCategory

	local runners = unitFilter(myUnits, Categories.nota_kahlan_ttdr.runner)
	local rockos = unitFilter(myUnits, Categories.nota_kahlan_ttdr.rocko)
	local bulldogs = unitFilter(myUnits, Categories.nota_kahlan_ttdr.bulldog)
	local hatracks = unitFilter(myUnits, Categories.nota_kahlan_ttdr.hatracks)
	local bods = unitFilter(myUnits, Categories.nota_kahlan_ttdr.bod)
	
	--Spring.Echo("orderedUnits count ",tablelength(orderedUnits))
	insertToList(bods, orderedUnits)
	--Spring.Echo("orderedUnits PRE ",tablelength(orderedUnits))
	insertToList(hatracks, orderedUnits)
	--Spring.Echo("orderedUnits POST ",tablelength(orderedUnits))
	insertToList(bulldogs, orderedUnits)
	insertToList(rockos, orderedUnits)
	insertToList(runners, orderedUnits)

	return orderedUnits
end