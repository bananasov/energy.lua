local util = require("util")

local magmator = {
    types = {
        "powah:magmator_starter",
        "powah:magmator_basic",
        "powah:magmator_hardened",
        "powah:magmator_blazing",
        "powah:magmator_niotic",
        "powah:magmator_spirited",
        "powah:magmator_nitro",
    }
}

---@return number
function magmator:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = util.get_total_stored_from_type(peripherals)
    return stored
end

---@return number
function magmator:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

---@param name string The peripheral name
---@return number
function magmator.get_stored(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergy()
end

---@param name string The peripheral name
---@return number
function magmator.get_capacity(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergyCapacity()
end

return magmator