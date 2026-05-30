-----------------------------------
-- Holy Crest QM1 Workaround
--
-- TEMPORARY: Bypasses a broken trade event (csid 56) caused by an NPC ID shift 
--
-- This module skips csid 56 entirely and goes straight to csid 33, which
-- correctly advances TheHolyCrest_Event to 5 and consumes the Wyvern Egg.
--
-----------------------------------
require('modules/module_utils')
require('scripts/globals/npc_util')
-----------------------------------
local m = Module:new('holy_crest_qm1_workaround')

m:addOverride('xi.zones.Meriphataud_Mountains.npcs.qm1.onTrade', function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.item.WYVERN_EGG) and
        player:getCharVar('TheHolyCrest_Event') == 4
    then
        player:confirmTrade()
        player:setCharVar('TheHolyCrest_Event', 5)
        player:printToPlayer("The Wyvern Egg reacts with the spine. Return to Rahal in Chateau d'Oraguille.", xi.msg.channel.SYSTEM_3, '')
        player:startEvent(33)
    end
end)

return m
