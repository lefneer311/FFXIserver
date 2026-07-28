-----------------------------------
-- Unlock Mog Wardrobe slots as you complete missions
-----------------------------------
require('modules/module_utils')
require('scripts/globals/missions')
-----------------------------------
local m = Module:new('mission_wardrobe_unlocks')

local unlocks =
{
    -----------------------------------
    -- Nation mission progression
    -----------------------------------
    [xi.mission.log_id.SANDORIA] =
    {
        [xi.mission.id.nation.RANK2]       = { xi.inv.WARDROBE,  40 },
        [xi.mission.id.nation.SHADOW_LORD] = { xi.inv.WARDROBE, 80 },
    },

    [xi.mission.log_id.BASTOK] =
    {
        [xi.mission.id.nation.RANK2]       = { xi.inv.WARDROBE,  40 },
        [xi.mission.id.nation.SHADOW_LORD] = { xi.inv.WARDROBE, 80 },
    },

    [xi.mission.log_id.WINDURST] =
    {
        [xi.mission.id.nation.RANK2]       = { xi.inv.WARDROBE,  40 },
        [xi.mission.id.nation.SHADOW_LORD] = { xi.inv.WARDROBE, 80 },
    },

    -----------------------------------
    -- Rise of the Zilart
    -----------------------------------
    [xi.mission.log_id.ZILART] =
    {
        [xi.mission.id.zilart.KAZHAMS_CHIEFTAINESS] = { xi.inv.WARDROBE2, 40 },
        [xi.mission.id.zilart.ARK_ANGELS]           = { xi.inv.WARDROBE2, 80 },
    },

    -----------------------------------
    -- Chains of Promathia
    -----------------------------------
    [xi.mission.log_id.COP] =
    {
        [xi.mission.id.cop.THE_MOTHERCRYSTALS] = { xi.inv.WARDROBE3, 40 },
        [xi.mission.id.cop.DAWN]               = { xi.inv.WARDROBE3, 80 },
    },

    -----------------------------------
    -- Treasures of Aht Urhgan
    -----------------------------------
    [xi.mission.log_id.TOAU] =
    {
        [xi.mission.id.toau.THE_BLACK_COFFIN]   = { xi.inv.WARDROBE4, 40 },
        [xi.mission.id.toau.ETERNAL_MERCENARY]  = { xi.inv.WARDROBE4, 80 },
    },
}

local bagNames =
{
    [xi.inv.INVENTORY]  = 'Inventory',
    [xi.inv.MOGSAFE]    = 'Mog Safe',
    [xi.inv.STORAGE]    = 'Storage',
    [xi.inv.TEMPITEMS]  = 'Temp. Items',
    [xi.inv.MOGLOCKER]  = 'Mog Locker',
    [xi.inv.MOGSATCHEL] = 'Mog Satchel',
    [xi.inv.MOGSACK]    = 'Mog Sack',
    [xi.inv.MOGCASE]    = 'Mog Case',
    [xi.inv.WARDROBE]   = 'Mog Wardrobe 1',
    [xi.inv.MOGSAFE2]   = 'Mog Safe 2',
    [xi.inv.WARDROBE2]  = 'Mog Wardrobe 2',
    [xi.inv.WARDROBE3]  = 'Mog Wardrobe 3',
    [xi.inv.WARDROBE4]  = 'Mog Wardrobe 4',
    [xi.inv.WARDROBE5]  = 'Mog Wardrobe 5',
    [xi.inv.WARDROBE6]  = 'Mog Wardrobe 6',
    [xi.inv.WARDROBE7]  = 'Mog Wardrobe 7',
    [xi.inv.WARDROBE8]  = 'Mog Wardrobe 8',
    [xi.inv.RECYCLEBIN] = 'Recycle Bin',
}

local function unlockWardrobe(player, bag, targetSize)
    local oldSize = player:getContainerSize(bag)

    if oldSize >= targetSize then
        return false, oldSize, oldSize
    end

    player:changeContainerSize(bag, targetSize - oldSize)

    return true, oldSize, player:getContainerSize(bag)
end

m:addOverride('xi.player.charCreate', function(player)
    super(player)

    -- Clamp all wardrobes to 0 on character creation.
    -- These calls are safe because container sizes are clamped to 0-80.
    player:changeContainerSize(xi.inv.WARDROBE,  -80)
    player:changeContainerSize(xi.inv.WARDROBE2, -80)
    player:changeContainerSize(xi.inv.WARDROBE3, -80)
    player:changeContainerSize(xi.inv.WARDROBE4, -80)
    player:changeContainerSize(xi.inv.WARDROBE5, -80)
    player:changeContainerSize(xi.inv.WARDROBE6, -80)
    player:changeContainerSize(xi.inv.WARDROBE7, -80)
    player:changeContainerSize(xi.inv.WARDROBE8, -80)
end)

m:addOverride('npcUtil.completeMission', function(player, logId, missionId, params)
    local result = super(player, logId, missionId, params)

    if
        result and
        unlocks[logId] and
        unlocks[logId][missionId]
    then
        local unlock = unlocks[logId][missionId]
        local bag = unlock[1]
        local targetSize = unlock[2]
        local bagName = bagNames[bag]

        local changed, oldSize, newSize = unlockWardrobe(player, bag, targetSize)

        if changed then
            local str = string.format(
                '%s capacity has grown: %i -> %i',
                bagName,
                oldSize,
                newSize
            )

            player:printToPlayer(str, xi.msg.channel.SYSTEM_3, '')
        end
    end

    return result
end)

return m