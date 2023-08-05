local util = require("util")

local lapotronic_su = {
    name = "techreborn:lapotronic_su"
}

function lapotronic_su:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

function lapotronic_su:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

return lapotronic_su