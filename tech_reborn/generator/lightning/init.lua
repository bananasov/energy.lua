local util = require("util")

local lightning_rod = {
    name = "techreborn:lightning_rod"
}

function lightning_rod:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.name)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

function lightning_rod:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.name)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

return lightning_rod