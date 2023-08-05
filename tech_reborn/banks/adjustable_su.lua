local util = require("util")

local adjustable_su = {
    name = "techreborn:adjustable_su"
}

function adjustable_su:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

function adjustable_su:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

return adjustable_su