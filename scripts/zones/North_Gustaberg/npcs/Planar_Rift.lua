-----------------------------------
-- Area: North Gustaberg
--  NPC: Planar Rift
-- Type: Voidwatch Rift
-- !pos 798 0 440 106
-- !pos 558 -10 603 106
-- !pos -322 40 -42 106
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
