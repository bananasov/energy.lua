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

return thermo_generator