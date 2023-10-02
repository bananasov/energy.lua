local util = require("util")

local energy_cell = {
    types = {
        "energyCell"
    }
}

---@return number
function energy_cell:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = util.get_total_stored_from_type(peripherals)
    return stored
end

---@return number
function energy_cell:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

---@return string[]
function energy_cell:get_peripherals()
    local peripherals = util.get_peripherals_from_type(self.types)

    return peripherals
end

return energy_cell