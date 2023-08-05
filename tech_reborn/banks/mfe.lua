local util = require("util")

local mfe = {
    name = "techreborn:medium_voltage_su"
}

function mfe:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

function mfe:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

return mfe