local util = require("util")

---@class ReactorInspect
---@field autoMode boolean
---@field currentCarbon number
---@field maxCarbon number
---@field currentRedstone number
---@field maxRedstone number
---@field currentUranium number
---@field maxUranium number
---@field maxSolidCoolant number
---@field currentSolidCoolant number
---@field currentTemp number
---@field maxTemp number
---@field energyProduction number
---@field uraniumConsumption number

local reactor = {
    types = {
        "powah:reactor_starter",
        "powah:reactor_basic",
        "powah:reactor_hardened",
        "powah:reactor_blazing",
        "powah:reactor_niotic",
        "powah:reactor_spirited",
        "powah:reactor_nitro",
    }
}

---@return number
function reactor:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = util.get_total_stored_from_type(peripherals)
    return stored
end

---@return number
function reactor:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

---@return { [string]: number }
function reactor:get_total_energy_transfer()
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
function reactor:get_total_energy_generation()
    local peripherals = util.get_peripherals_from_type(self.types)
    local total_generation = 0

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        total_generation = total_generation + wrap.getEnergyGeneration()
    end

    return total_generation
end

---@return { [string]: number }
function reactor:get_energy_generation_all()
    local peripherals = util.get_peripherals_from_type(self.types)
    local generation = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        generation[periph] = wrap.getEnergyGeneration()
    end

    return generation
end

---@return { [string]: number }
function reactor:get_energy_stored_all()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        stored[periph] = wrap.getEnergy()
    end

    return stored
end

---@return { [string]: number }
function reactor:get_energy_capacity_all()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        stored[periph] = wrap.getEnergyCapacity()
    end

    return stored
end

---@return string[]
function reactor:get_peripherals()
    local peripherals = util.get_peripherals_from_type(self.types)

    return peripherals
end

---@return { [string]: ReactorInspect }
function reactor:inspect_all()
    local peripherals = util.get_peripherals_from_type(self.types)
    ---@type { [string]: ReactorInspect }
    local out = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        local inspect = wrap.inspect()
        out[periph] = inspect
    end

    return out
end

---@param name string
---@return ReactorInspect
function reactor.inspect(name)
    local wrap = peripheral.wrap(name)
    return wrap.inspect()
end

return reactor