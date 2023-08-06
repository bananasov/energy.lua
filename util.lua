local util = {
    levels = { "E", "k  E", "M E", "G E", "T E", "P E", "E E" }
}

---@param peripheral_type string|table The peripheral type
---@return table peripheral The peripheral(s) gotten
function util.get_peripherals_from_type(peripheral_type)
    local peripherals = {}

    if type(peripheral_type) == "table" then
        for _, v in pairs(peripheral_type) do
            for i, periph in pairs(peripheral.getNames()) do
                if periph:find(v) then
                    peripherals[i] = periph
                end
            end
        end
    else
        for i, v in pairs(peripheral.getNames()) do
            if v:find(peripheral_type) then
                peripherals[i] = v
            end
        end
    end

    return peripherals
end

---@param energy_amount number The energy amount
---@param decimals number The amount of decimal points
---@return string formatted The formatted string
function util.to_radix(energy_amount, decimals)
    local exponential = math.max(math.log(energy_amount, 10), 1)

    local value_level = math.floor(exponential / 3 + 1e-10) + 1
    local level_divider = 10 ^ ((value_level - 1) * 3)

    local decim_1 = 10 ^ decimals
    local decim_2 = 100 ^ decimals

    local output = ("%%.%df%s")
        :format(decimals, "%s")
        :format(math.ceil((energy_amount * decim_1) / (level_divider / decim_1)) / decim_2, util.levels[value_level])
        :gsub("[0%.0]*% [%s% ]-", " ")

    return output
end

---@param peripheral_type table|string The peripheral type(s)
---@return number
function util.get_total_stored_from_type(peripheral_type)
    local iStored = 0

    if type(peripheral_type) == "table" then
        for _, v in pairs(peripheral_type) do
            local peripherals = util.get_peripherals_from_type(v)

            for _, periph in pairs(peripherals) do
                local wrap = peripheral.wrap(periph)
                iStored = iStored + wrap.getEnergy()
            end
        end
    else
        local peripherals = util.get_peripherals_from_type(peripheral_type)

        for _, periph in pairs(peripherals) do
            local wrap = peripheral.wrap(periph)
            iStored = iStored + wrap.getEnergy()
        end
    end

    return iStored
end

---@param peripheral_type table|string The peripheral type(s)
function util.get_total_capacity_from_type(peripheral_type)
    local capacity = 0

    if type(peripheral_type) == "table" then
        for _, v in pairs(peripheral_type) do
            local peripherals = util.get_peripherals_from_type(v)

            for i, periph in pairs(peripherals) do
                local wrap = peripheral.wrap(periph)
                capacity = capacity + wrap.getEnergyCapacity()
            end
        end
    else
        local peripherals = util.get_peripherals_from_type(peripheral_type)

        for _, periph in pairs(peripherals) do
            local wrap = peripheral.wrap(periph)
            capacity = capacity + wrap.getEnergyCapacity()
        end
    end

    return capacity
end

return util