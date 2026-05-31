-----------------------------------
-- Area: Bastok Markets
--  NPC: Voidwatch Purveyor
-- Type: Voidwatch Starter Purveyor
-- !pos -366 -10.05 -165 235
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterPurveyorTrigger(player, npc)
end

return entity
