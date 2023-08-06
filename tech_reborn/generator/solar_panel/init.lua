local util = require("util")

local solar = {}
local types = {
	"techreborn:basic_solar_panel",
	"techreborn:advanced_solar_panel",
	"techreborn:industrial_solar_panel",
	"techreborn:ultimate_solar_panel",
	"techreborn:quantum_solar_panel",
	"techreborn:creative_solar_panel",
}

solar.basic = require("tech_reborn.generator.solar_panel.basic")
solar.advanced = require("tech_reborn.generator.solar_panel.advanced")
solar.industrial = require("tech_reborn.generator.solar_panel.industrial")
solar.ultimate = require("tech_reborn.generator.solar_panel.ultimate")
solar.quantum = require("tech_reborn.generator.solar_panel.quantum")
solar.creative = require("tech_reborn.generator.solar_panel.creative")

---@return number
function solar:get_total_stored()
    local peripherals = util.get_peripherals_from_type(types)
    local stored = util.get_total_stored_from_type(peripherals)

    return stored
end

---@return number
function solar:get_total_capacity()
    local peripherals = util.get_peripherals_from_type(types)
    local capacity = util.get_total_capacity_from_type(peripherals)

    return capacity
end

return solar
