local util = require("util")

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

return reactor