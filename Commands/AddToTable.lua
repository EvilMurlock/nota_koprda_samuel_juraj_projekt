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
				name = "elementToAdd",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "0",
			}
		}
	}
end

function Run(self, units, parameter)
    local tableToInsert = parameter.table
    local elementToAdd = parameter.elementToAdd

    tableToInsert[#tableToInsert+1]=elementToAdd

    return SUCCESS
end


function Reset(self)
end
