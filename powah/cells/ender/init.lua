local util = require("util")

local ender_cell = {
    types = {
        "powah:ender_cell_starter",
        "powah:ender_cell_basic",
        "powah:ender_cell_hardened",
        "powah:ender_cell_blazing",
        "powah:ender_cell_niotic",
        "powah:ender_cell_spirited",
        "powah:ender_cell_nitro",
    }
}

---@return number
function ender_cell:get_total_stored()
    local peripherals = util.get_peripherals_from_type(self.types)
    local stored = util.get_total_stored_from_type(peripherals)
    return stored
end

---@return number
function ender_cell:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(self.types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

return ender_cell