-----------------------------------
-- Area: Bastok Markets
--  NPC: Atmacite Refiner
-- Type: Voidwatch Starter Refiner
-- !pos -355.5 -10.536 -159.5 235
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterRefinerTrigger(player, npc)
end

return entity
