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

---@return { [string]: number }
function ender_cell:get_total_energy_transfer()
    local peripherals = util.get_peripherals_from_type(self.types)
    ---@type { [string]: number }
    local total_transfer = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        total_transfer[periph] = wrap.getEnergyTransfer()
    end

    return total_transfer
end

---@return string[]
function ender_cell:get_peripherals()
    local peripherals = util.get_peripherals_from_type(self.types)

    return peripherals
end

--#region Ender Cell specific functions

---@return { [string]: number }
function ender_cell:get_channels()
    local peripherals = util.get_peripherals_from_type(self.types)
    ---@type { [string]: number }
    local channels = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        channels[periph] = wrap.getChannel()
    end

    return channels
end

---@return { [string]: number }
function ender_cell:get_max_channels()
    local peripherals = util.get_peripherals_from_type(self.types)
    ---@type { [string]: number }
    local max_channels = {}

    for _, periph in pairs(peripherals) do
        local wrap = peripheral.wrap(periph)
        max_channels[periph] = wrap.getMaxChannel()
    end

    return max_channels
end

---@param name string
---@param channel number
function ender_cell.set_channel(name, channel)
    local wrap = peripheral.wrap(name)
    wrap.setChannel(channel)
end

--#endregion

return ender_cell