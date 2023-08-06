local util = require("util")

---@class ReactorInspect
---@field autoMode boolean
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

---@param name string The peripheral name
---@return number
function reactor.get_stored(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergy()
end

---@param name string The peripheral name
---@return number
function reactor.get_capacity(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergyCapacity()
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

return reactor