-----------------------------------
-- Area: Windurst Walls
--  NPC: Voidwatch Purveyor
-- Type: Voidwatch Starter Purveyor
-- !pos -227.169 -8 190.7 239
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterPurveyorTrigger(player, npc)
end

return entity
