local energy = {}

local old_path = package.path
local sourcePath = fs.getDir(select(2, ...) or "")

package.path = string.format(
    package.path .. "/%s/?;/%s/?.lua;/%s/?/init.lua;",
    sourcePath, sourcePath, sourcePath
)

energy.util = require("util")

energy.powah = {
	generator = require("powah.generator"),
	cells = require("powah.cells"),
}

energy.tech_reborn = {
	generator = require("tech_reborn.generator"),
	banks = require("tech_reborn.banks"),
}

---@param name string The peripheral name
---@return number
function energy.get_stored(name)
	local wrap = peripheral.wrap(name)
	return wrap.getEnergy()
end

---@param name string The peripheral name
---@return number
function energy.get_capacity(name)
	local wrap = peripheral.wrap(name)
	return wrap.getEnergyCapacity()
end

package.path = old_path

return energy
