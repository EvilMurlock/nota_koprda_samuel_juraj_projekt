local sensorInfo = {
	name = "make_unit_first",
	desc = "Makes the unit the first one in the table, gives it key 1",
	author = "Samuel Juraj Koprda",
	date = "2025-05-07",
	license = "notAlicense",
}


local EVAL_PERIOD_DEFAULT = -1 -- instant, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end


-- @description return table with swaped values
-- @argument listOfUnits [array], newFirstId [int]
return function(unitTable, newFirstId)
    --Spring.Echo("RUNNING THNING")

    newRay = {}
    local addition = 1
    for i=1, #unitTable do
        local unitId = unitTable[i]
        if(unitId == newFirstId) then
            newRay[1] = unitId
            addition = 0
        else
            newRay[i+addition] = unitId
        end
    end
    --Spring.Echo("spiting newRay",newRay)
    --for ind,val in pairs(unitTable) do
    --    newRay[val] = ind
    --end
    return newRay
end
