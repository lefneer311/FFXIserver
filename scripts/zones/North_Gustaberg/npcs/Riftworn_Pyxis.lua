-----------------------------------
-- Area: North Gustaberg
--  NPC: Riftworn Pyxis
-- Type: Voidwatch Pyxis
-- !pos 798 0 440 106
-- !pos 558 -10 603 106
-- !pos -322 40 -42 106
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.voidwatch.onStarterPyxisTrigger(player, npc)
end

return entity
