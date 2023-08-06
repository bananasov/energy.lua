local battery_box = require("tech_reborn.banks.battery_box")
local mfe = require("tech_reborn.banks.mfe")
local mfsu = require("tech_reborn.banks.mfsu")
local adjustable_su = require("tech_reborn.banks.adjustable_su")
local interdimensional_su = require("tech_reborn.banks.interdimensional_su")
local lapotronic_su = require("tech_reborn.banks.lapotronic_su")

local util = require("util")

local banks = {
	battery_box = battery_box,
	mfe = mfe,
	mfsu = mfsu,
	adjustable_su = adjustable_su,
	interdimensional_su = interdimensional_su,
	lapotronic_su = lapotronic_su,
}

local types = {
	"techreborn:low_voltage_su",
	"techreborn:medium_voltage_su",
	"techreborn:high_voltage_su",
	"techreborn:adjustable_su",
	"techreborn:interdimensional_su",
	"techreborn:lapotronic_su",
}

---@return number
function banks:get_total_stored()
	local peripherals = util.get_peripherals_from_type(types)
	local stored = util.get_total_stored_from_type(peripherals)

	return stored
end

---@return number
function banks:get_total_capacity()
	local peripherals = util.get_peripherals_from_type(types)
	local capacity = util.get_total_capacity_from_type(peripherals)

	return capacity
end

return banks
