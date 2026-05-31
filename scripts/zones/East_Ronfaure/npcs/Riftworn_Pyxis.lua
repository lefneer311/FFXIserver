-----------------------------------
-- Area: East Ronfaure
--  NPC: Riftworn Pyxis
-- Type: Voidwatch Pyxis
-- !pos 288 -61 368 101
-- !pos 183 -20 -315 101
-- !pos 434 -51 315 101
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterPyxisTrigger(player, npc)
end

return entity
