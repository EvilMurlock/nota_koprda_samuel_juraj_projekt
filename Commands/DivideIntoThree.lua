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
				name = "table",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "armmav",
			},
			{ 
				name = "first",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "0",
			},
			{ 
				name = "seccond",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "0",
			},
			{ 
				name = "third",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "0",
			}
		}
	}
end

function Run(self, units, parameter)
    local baseTable = parameter.table
	local first = parameter.first
	local seccond = parameter.seccond
	local third = parameter.third

	local count = 1
	local index = 1
	for k, unitId in pairs(baseTable) do 

		if(count%3 == 0) then
			first[index] = unitId
			--Spring.Echo("Added to first ",unitId)
		else if (count%3 == 1) then
				seccond[index] = unitId
				--Spring.Echo("Added to seccond ",unitId)
			else
				third[index] = unitId
				--Spring.Echo("Added to third ",unitId)
			end
		end
		count = count + 1
		if(count > 3)then
			index = index +1
			count = 1
		end
	end

    return SUCCESS
end


function Reset(self)
end
