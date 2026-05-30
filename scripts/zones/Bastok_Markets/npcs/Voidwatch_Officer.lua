-----------------------------------
-- Area: Bastok Markets
--  NPC: Voidwatch Officer
-- Type: Voidwatch Starter Officer
-- !pos -352.5 -10.514 -162 235
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterOfficerTrigger(player, npc, xi.voidwatch.routeName.BASTOK)
end

return entity