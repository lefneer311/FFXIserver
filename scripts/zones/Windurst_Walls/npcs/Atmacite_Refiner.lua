-----------------------------------
-- Area: Windurst Walls
--  NPC: Atmacite Refiner
-- Type: Voidwatch Starter Refiner
-- !pos -27.5 -5.36 222 239
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterRefinerTrigger(player, npc)
end

return entity
