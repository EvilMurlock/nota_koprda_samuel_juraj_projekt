local sensorInfo = {
	name = "swap_key_value",
	desc = "Swaps keys and values in a table",
	author = "Samuel Juraj Koprda",
	date = "2025-04-09",
	license = "notAlicense",
}


local EVAL_PERIOD_DEFAULT = -1 -- instant, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end


-- @description return table with swaped values
-- @argument listOfUnits [array]
return function(unitTable) 
    newRay = {}

    for i=1, #unitTable do
        local unitId = unitTable[i]
        newRay[unitId] = i
    end
    --for ind,val in pairs(unitTable) do
    --    newRay[val] = ind
    --end
    return newRay
end
