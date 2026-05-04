------------------------------------------------------------------
--                      custom_augment_npc
------------------------------------------------------------------
require('modules/module_utils')
require('scripts/zones/Southern_San_dOria/Zone')

local m = Module:new('Custom_Augment_Shop')

-- Keeps NPC logic dynamic for adjustments without restarting xi_map.exe
local function loadAugmentNPCLogic()
    package.loaded['modules/custom/lua/hogwarts/augment_system/custom_augment_npc_logic'] = nil
    return require('modules/custom/lua/hogwarts/augment_system/custom_augment_npc_logic')
end

m:addOverride('xi.zones.Southern_San_dOria.Zone.onInitialize', function(zone)
    local cecil = zone:insertDynamicEntity({
        objtype  = xi.objType.NPC,
        name     = 'Cecil Harvey',
        look     = 971,
        x = -36.6300, y = 0.000, z = 30.7160, rotation = 27,
        widescan = 1,

        onTrigger = function(player, npc)
            loadAugmentNPCLogic().onTrigger(player, npc)
        end,

        onTrade = function(player, npc, trade)
            loadAugmentNPCLogic().onTrade(player, npc, trade)
        end,
    })

    utils.unused(cecil)
end)

return m
