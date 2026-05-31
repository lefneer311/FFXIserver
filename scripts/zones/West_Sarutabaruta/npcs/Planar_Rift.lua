-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Planar Rift
-- Type: Voidwatch Rift
-- !pos 120 4 -440 115
-- !pos -441 4 -357 115
-- !pos 0 -28 560 115
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.voidwatch.onStarterRiftTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterRiftTrigger(player, npc)
end

return entity
