-----------------------------------
-- Set if you want new players to have all skills at their highest possible level
-----------------------------------
require('modules/module_utils')
require('scripts/globals/player')
-----------------------------------
local m = Module:new('new_player_capallskills')

m:addOverride('xi.player.charCreate', function(player)
    super(player)
	player:capAllSkills()
end)

return m