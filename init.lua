local energy = {}

local old_path = package.path
package.path = package.path .. "/energy_rewrite/?;/energy_rewrite/?.lua;/energy_rewrite/?/init.lua;"

energy.util = require("util")
energy.powah = {
    generator = require("powah.generator"),
    cells = require("powah.cells")
}

package.path = old_path

return energy