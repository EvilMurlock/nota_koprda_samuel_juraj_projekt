-- get madatory module operators
VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

-- get other madatory dependencies
attach.Module(modules, "message") -- communication backend load

function getInfo()
	return {
		tooltip = "Adds element to table",
		parameterDefs = {
            { 
				name = "unitTable",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "armmav",
			}
		}
	}
end

function Run(self, units, parameter)
    local unitTable = parameter.unitTable

	--local count = 0
	--livingUnits = {}
	deleted_count = 0
	for k, unitId in pairs(unitTable) do 
		if(Spring.GetUnitIsDead(unitId) ~= false) then
			unitTable[k] = nil
			deleted_count = deleted_count + 1
			--Spring.Echo("unit Dead: : ",Spring.GetUnitIsDead(unitId) == false)
			--Spring.Echo("Removed Dead: : ",k)
			end
		unitTable[k] = unitTable[k+deleted_count]
		--Spring.Echo("Key: ",k)
		end

	-- clear table
	--for k, _ in pairs(unitTable) do 
	--	unitTable[k] = nil
	--	
	--	end
--
--	for k, unitId in pairs(livingUnits) do 
--		unitTable[count] = unitId
--		count = count + 1 
--		
--		end
    return SUCCESS
end


function Reset(self)
end
