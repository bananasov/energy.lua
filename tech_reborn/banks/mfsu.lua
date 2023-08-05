local util = require("util")

local mfsu = {
    name = "techreborn:high_voltage_su"
}

function mfsu:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

function mfsu:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

return mfsu