local sensorInfo = {
	name = "scale_vectors_in_table",
	desc = "Scales the vectors in the table",
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


-- @description return table with scaled vecrors
-- @argument scaler value [float], and list of vectors [array]
return function(scaler, vectors) 
    newRay = {}

    for i=1, #vectors do
        local vector = vectors[i]
        newRay[i] = vector*scaler
    end
    --for ind,val in pairs(unitTable) do
    --    newRay[val] = ind
    --end
    return newRay
end
