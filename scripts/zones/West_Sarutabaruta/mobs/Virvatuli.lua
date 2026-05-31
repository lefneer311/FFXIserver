-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Virvatuli
-- Type: Voidwatch NM
-----------------------------------
require('scripts/globals/voidwatch/voidwatch')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.voidwatch.onNMDeath(mob, player)
end

entity.onMobDespawn = function(mob)
    xi.voidwatch.clearNMState(mob)
end

return entity
