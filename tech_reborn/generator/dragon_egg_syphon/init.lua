local util = require("util")

local dragon_egg_syphon = {
    name = "techreborn:dragon_egg_syphon"
}

function dragon_egg_syphon:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

function dragon_egg_syphon:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.name)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

return dragon_egg_syphon