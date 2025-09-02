-- get madatory module operators
VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

-- get other madatory dependencies
attach.Module(modules, "message") -- communication backend load

function getInfo()
	return {
		tooltip = "Buy a unit with given name if enough money",
		parameterDefs = {
            { 
				name = "unitName",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "armmav",
			}
		}
	}
end

function Run(self, units, parameter)
    local unitName = parameter.unitName

    message.SendRules({
        subject = "swampdota_buyUnit",
        data = {
            unitName = unitName
        },
    })

    return SUCCESS
end


function Reset(self)
end
