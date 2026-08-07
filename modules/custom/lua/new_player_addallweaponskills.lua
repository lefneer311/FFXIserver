-----------------------------------
-- Set if you want new players to know all learnable weaponskills
-----------------------------------
require('modules/module_utils')
require('scripts/globals/player')
-----------------------------------
local m = Module:new('new_player_addallweaponskills')

m:addOverride('xi.player.charCreate', function(player)
    player:addAllWeaponSkills()
	super(player)
end)

return m