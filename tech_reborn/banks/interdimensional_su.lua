local util = require("util")

local interdimensional_su = {
    name = "techreborn:interdimensional_su"
}

function interdimensional_su:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

function interdimensional_su:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

return interdimensional_su