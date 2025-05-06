local sensorInfo = {
	name = "throw_out_unit",
	desc = "Throws out the given unit out of the unit table",
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
    Spring.Echo("RUNNING removing: ",newFirstId)

    newRay = {}
    local addition = 0
    for i=1, #unitTable do
        local unitId = unitTable[i]
        if(unitId == newFirstId) then
            addition = -1
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
