local util = require("util")

local solar_panel = {
    types = {
        "powah:solar_panel_starter",
        "powah:solar_panel_basic",
        "powah:solar_panel_hardened",
        "powah:solar_panel_blazing",
        "powah:solar_panel_niotic",
        "powah:solar_panel_spirited",
        "powah:solar_panel_nitro",
    }
}

---@return number
function solar_panel:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = util.get_total_stored_from_type(peripherals)
    return stored
end

---@return number
function solar_panel:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

---@param name string The peripheral name
---@return number
function solar_panel.get_stored(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergy()
end

---@param name string The peripheral name
---@return number
function solar_panel.get_capacity(name)
    local wrap = peripheral.wrap(name)
    return wrap.getEnergyCapacity()
end

return solar_panel