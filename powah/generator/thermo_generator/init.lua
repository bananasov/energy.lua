local util = require("util")

local thermo_generator = {
    types = {
        "powah:thermo_generator_starter",
        "powah:thermo_generator_basic",
        "powah:thermo_generator_hardened",
        "powah:thermo_generator_blazing",
        "powah:thermo_generator_niotic",
        "powah:thermo_generator_spirited",
        "powah:thermo_generator_nitro",
    }
}

---@return number
function thermo_generator:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = util.get_total_stored_from_type(peripherals)
    return stored
end

---@return number
function thermo_generator:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

---@return { [string]: number }
function thermo_generator:get_total_energy_transfer()
    local peripherals = util.get_peripherals_from_type(self.types)
    ---@type { [string]: number }
    local total_transfer = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        total_transfer[periph] = wrap.getEnergyTransfer()
    end

    return total_transfer
end

---@return { [string]: number }
function thermo_generator:get_total_energy_generation()
    local peripherals = util.get_peripherals_from_type(self.types)
    ---@type { [string]: number }
    local total_generation = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        total_generation[periph] = wrap.getEnergyGeneration()
    end

    return total_generation
end

---@param name string The peripheral name
---@return number
function thermo_generator.get_stored(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergy()
end

---@param name string The peripheral name
---@return number
function thermo_generator.get_capacity(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergyCapacity()
end

return thermo_generator