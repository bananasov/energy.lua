local util = require("util")

local furnator = {
    types = {
        "furnator"
    }
}

---@return number
function furnator:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = util.get_total_stored_from_type(peripherals)
    return stored
end

---@return number
function furnator:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

function furnator:get_energy_generation_all()
    local peripherals = util.get_peripherals_from_type(self.types)
    local generation = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        generation[periph] = wrap.getEnergyGeneration()
    end

    return generation
end

---@return { [string]: number }
function furnator:get_energy_stored_all()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        stored[periph] = wrap.getEnergy()
    end

    return stored
end

---@return { [string]: number }
function furnator:get_energy_capacity_all()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        stored[periph] = wrap.getMaxEnergy()
    end

    return stored
end

---@return string[]
function furnator:get_peripherals()
    local peripherals = util.get_peripherals_from_type(self.types)

    return peripherals
end

return furnator