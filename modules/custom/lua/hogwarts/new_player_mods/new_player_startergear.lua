-----------------------------------
-- Set if you want new players to get some helpful items
-----------------------------------
require('modules/module_utils')
require('scripts/globals/player')
-----------------------------------
-- Items to be given to all new players
--
-- 11811 - Destrier Beret
-- 10293 - Chocobo Shirt
--  - Ring
--  - Earring 1
--  - Earring 2
local m = Module:new('new_player_startergear')

m:addOverride('xi.player.charCreate', function(player)
	player:addItem(11811,1)
	player:addItem(10293,1)
	player:addItem(14670,1,51,3,52,3,53,5,61,3) -- +4hp heal/+4mp heal/+6% spell interruption down/+4 occasionally resist
	player:addItem(13374,1,132,2,140,2,145,2,146,2) -- +3% DA/+3% Crit/+3% FastCast/+3 Counter/+3 Dual Wield
	player:addItem(13375,1,140,2,132,5,107,5,108,5) -- +3% FastCast/+6% DA/+6% Crit/Pet: +6 Atk & Rng Atk & Mag.Acc & Mag.Atk.Bns
	-- player.addItem(26410,1,363,24,1152,3,153,9,145,9)-- Diamond Shield +block chance +shield mastery +counter
	super(player)
end)

return m
