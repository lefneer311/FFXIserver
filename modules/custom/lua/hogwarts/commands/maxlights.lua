-----------------------------------
-- func: maxlight <light>
-- desc: Sets selected Abyssea light to configured cap.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local lightData =
{
    pearl       = { type = xi.abyssea.lightType.PEARLESCENT, setting = 'ABYSSEA_CRUOR_PEARL_CAP',  default = 230 },
    pearlescent = { type = xi.abyssea.lightType.PEARLESCENT, setting = 'ABYSSEA_CRUOR_PEARL_CAP',  default = 230 },

    gold       = { type = xi.abyssea.lightType.GOLDEN,       setting = 'ABYSSEA_CRUOR_GOLD_CAP',   default = 200 },
    golden     = { type = xi.abyssea.lightType.GOLDEN,       setting = 'ABYSSEA_CRUOR_GOLD_CAP',   default = 200 },

    silver     = { type = xi.abyssea.lightType.SILVERY,      setting = 'ABYSSEA_CRUOR_SILVER_CAP', default = 200 },
    silvery    = { type = xi.abyssea.lightType.SILVERY,      setting = 'ABYSSEA_CRUOR_SILVER_CAP', default = 200 },

    ebon       = { type = xi.abyssea.lightType.EBON,         setting = 'ABYSSEA_CRUOR_EBON_CAP',   default = 200 },

    azure      = { type = xi.abyssea.lightType.AZURE,        setting = 'ABYSSEA_CRUOR_AZURE_CAP',  default = 255 },
    ruby       = { type = xi.abyssea.lightType.RUBY,         setting = 'ABYSSEA_CRUOR_RUBY_CAP',   default = 255 },
    amber      = { type = xi.abyssea.lightType.AMBER,        setting = 'ABYSSEA_CRUOR_AMBER_CAP',  default = 255 },
}

local function getConfig(name, default)
    local value = xi.settings.main[name]
    if value == nil then
        return default
    end

    return value
end

local function error(player)
    player:printToPlayer('Usage: !maxlight <pearl|gold|silver|ebon|azure|ruby|amber>', xi.msg.channel.SYSTEM_3)
end

commandObj.onTrigger = function(player, lightName)
    if lightName == nil then
        error(player)
        return
    end

    local key = string.lower(lightName)
    local data = lightData[key]

    if data == nil then
        error(player)
        return
    end

    local cap = getConfig(data.setting, data.default)
    local current = xi.abyssea.getLightValue(player, data.type) or 0
    local amount = math.max(0, cap - current)

    if amount > 0 then
        xi.abyssea.addPlayerLights(player, data.type, amount)
    end

    player:printToPlayer(
        string.format('%s light set to cap (%u). Added %u.', key, cap, amount),
        xi.msg.channel.SYSTEM_3
    )
end

return commandObj