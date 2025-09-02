local sensorInfo = {
	name = "GetTableSize",
	desc = "Retursn size of table",
	author = "Samuel Juraj Koprda",
	date = "2025-09-02",
	license = "notAlicense",
}


local EVAL_PERIOD_DEFAULT = -1 -- instant, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end


-- @description return number of elements in table
-- @argument unitIdsTable [array]
return function(T)
  local count = 0
  for _ in pairs(T) do 
	count = count + 1 
	end
  --Spring.Echo("Count:  ",count)
  return count
end