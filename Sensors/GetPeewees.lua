local sensorInfo = {
	name = "GetPeewees",
	desc = "Gets Ids of all Peewees",
	author = "Samuel Juraj Koprda",
	date = "2025-08-21",
	license = "notAlicense",
}


local EVAL_PERIOD_DEFAULT = -1 -- instant, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end


-- @description return Ids of all Peewees
-- @argument unitIdsTable [array]
return function(unitTable) 
    --return unitTable[1]

 
    local chosenUnitDef = UnitDefNames["armpw"]
  --  return chosenUnitDefId
--end
    --Spring.Echo(chosenUnitDefId.id)
    peewees = {}
    index = 1
    for i=1, #unitTable do
        unitId = unitTable[i]
        
        local unitDefId = Spring.GetUnitDefID(unitId)
        --Spring.Echo("Name of unit: ",UnitDefs)
        --Spring.Echo("Name of unit ID",unitDefID)
        local testName = UnitDefs--[unitDefID].humanName 
        --Spring.Echo("Name of unit",UnitDefs[unitDefId].name)
        --
        
        --Spring.Echo("spiting defid",unitDefId)
        local testId = chosenUnitDef.id
        --Spring.Echo("unitDefId ",unitDefId, " chosenUnidDef.id ",testId, " i ", i)

        if unitDefId == chosenUnitDef.id then
            --Spring.Echo("spiting unitid",unitId)
            peewees[index] = unitId
            index = index + 1
            
        end
        --return unitId
    end
    --for ind,val in pairs(unitTable) do
    --    newRay[val] = ind
    --end
    return peewees
end
--[[]]
