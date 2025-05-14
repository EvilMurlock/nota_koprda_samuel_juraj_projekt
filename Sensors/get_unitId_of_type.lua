local sensorInfo = {
	name = "get_unitId_of_type",
	desc = "Gets the first unit id of that type",
	author = "Samuel Juraj Koprda",
	date = "2025-04-29",
	license = "notAlicense",
}


local EVAL_PERIOD_DEFAULT = -1 -- instant, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end


-- @description return id of unit of that type
-- @argument unitTable [array]
-- @argument unitType
return function(unitTable, unitType) 
    --return unitTable[1]

 
    local chosenUnitDefId = UnitDefNames[unitType]
  --  return chosenUnitDefId
--end
    --Spring.Echo(chosenUnitDefId.id)
    for i=1, #unitTable do
        unitId = unitTable[i]
        
        local unitDefId = Spring.GetUnitDefID(unitId)
        --Spring.Echo("spiting defid",unitDefId)
        --Spring.Echo("spiting unitid",unitId)
        if unitDefId == chosenUnitDefId.id then
            --Spring.Echo("spiting unitid",unitId)
            return unitId
        end
        --return unitId
    end
    --for ind,val in pairs(unitTable) do
    --    newRay[val] = ind
    --end
    return 5
end
--[[]]
