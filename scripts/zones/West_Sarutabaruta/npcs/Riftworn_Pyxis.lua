-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Riftworn Pyxis
-- Type: Voidwatch Pyxis
-- !pos 120 4 -440 115
-- !pos -441 4 -357 115
-- !pos 0 -28 560 115
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterPyxisTrigger(player, npc)
end

return entity
