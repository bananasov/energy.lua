local energy = {}

local old_path = package.path
package.path = package.path .. "/energy/?;/energy/?.lua;/energy/?/init.lua;"

energy.util = require("util")

energy.powah = {
    generator = require("powah.generator"),
    cells = require("powah.cells")
}

energy.tech_reborn = {
    generator = require("tech_reborn.generator"),
    banks = require("tech_reborn.banks")
}

package.path = old_path

return energy