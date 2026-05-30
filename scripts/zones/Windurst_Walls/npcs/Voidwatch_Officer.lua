-----------------------------------
-- Area: Windurst Walls
--  NPC: Voidwatch Officer
-- Type: Voidwatch Starter Officer
-- !pos -27.5 -5.396 225.5 239
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.voidwatch.onOfficerTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterOfficerTrigger(player, npc, xi.voidwatch.routeName.WINDURST)
end

return entity