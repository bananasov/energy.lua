local util = require("util")

local furnator = {
    types = {
        "powah:furnator_starter",
        "powah:furnator_basic",
        "powah:furnator_hardened",
        "powah:furnator_blazing",
        "powah:furnator_niotic",
        "powah:furnator_spirited",
        "powah:furnator_nitro",
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

---@return { [string]: number }
function furnator:get_total_energy_transfer()
    local peripherals = util.get_peripherals_from_type(self.types)
    ---@type { [string]: number }
    local total_transfer = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        total_transfer[periph] = wrap.getEnergyTransfer()
    end

    return total_transfer
end

---@return number
function furnator:get_total_energy_generation()
    local peripherals = util.get_peripherals_from_type(self.types)
    local total_generation = 0

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        total_generation = total_generation + wrap.getEnergyGeneration()
    end

    return total_generation
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
        stored[periph] = wrap.getEnergyCapacity()
    end

    return stored
end

---@return string[]
function furnator:get_peripherals()
    local peripherals = util.get_peripherals_from_type(self.types)

    return peripherals
end

return furnator