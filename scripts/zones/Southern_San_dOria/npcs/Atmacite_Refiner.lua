-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Atmacite Refiner
-- Type: Voidwatch Starter Refiner
-- !pos -102 1.5 -16 230
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterRefinerTrigger(player, npc)
end

return entity
