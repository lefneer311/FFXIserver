-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Voidwatch Purveyor
-- Type: Voidwatch Starter Purveyor
-- !pos -100.5 1 -51 230
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterPurveyorTrigger(player, npc)
end

return entity
