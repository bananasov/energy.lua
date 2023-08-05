local furnator = require("powah.generator.furnator")
local magmator = require("powah.generator.magmator")
local thermo_generator = require("powah.generator.thermo_generator")
local reactor = require("powah.generator.reactor")
local solar_panel = require("powah.generator.solar_panel")

return {
    furnator = furnator,
    magmator = magmator,
    thermo_generator = thermo_generator,
    reactor = reactor,
    solar_panel = solar_panel
}