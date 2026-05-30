-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Voidwatch Officer
-- Type: Voidwatch Starter Officer
-- !pos -106 1.5 -16 230
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.voidwatch.onOfficerTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterOfficerTrigger(player, npc, xi.voidwatch.routeName.SANDORIA)
end

return entity