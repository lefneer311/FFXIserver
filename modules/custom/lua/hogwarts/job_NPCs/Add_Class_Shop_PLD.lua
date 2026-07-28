-----------------------------------
-- Area: Southern San dOria
--  NPC: Cecil Harvey
-- Type: Custom Class Shop & Quest NPC
-----------------------------------
require('modules/module_utils')
require('scripts/zones/Southern_San_dOria/Zone')
require('scripts/globals/player')
-----------------------------------
local m = Module:new('Class_Shop_PLD')

m:addOverride('xi.zones.Southern_San_dOria.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)

    -- Insert NPC into zone
    local Cecil = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,

        -- The name visible to players
        -- NOTE: Even if you plan on making the name invisible, we're using it internally for lookups
        --     : So populate it with something unique-ish even if you aren't going to use it.
        --     : You can then hide the name with entity:hideName(true)
        -- NOTE: This name CAN include spaces and underscores.
        name = 'Cecil Harvey',

        -- Optional: Define a different name that is visible to players.
        -- 'Horro' (DE_Horro) will still be used internally for lookups.
        -- packetName = 'New Horro',

        -- You can use regular model ids (See documentation/model_ids.txt, or play around with !costume)
        look = 3100,

        -- You can also use the raw packet look information (as a string), as seen in npc_list and mob_pools
        -- look = '0x0100020500101120003000400050006000700000',

        -- Set the position using in-game x, y and z
        x = -36.6300,
        y = 0.000,
        z = 30.7160,

        -- Rotation is scaled 0-255, with 0 being East
        rotation = 27,

        -- Overriding widescan is only available to NPCs.
        widescan = 1,

        -- onTrade and onTrigger can be hooked up to your dynamic entity,
        -- just like with regular entities. You can also omit these.
        onTrade = function(player, npc, trade)
            -- NOTE: We have to use getPacketName, because the regular name is modified and being used
            --     : for internal lookups
            -- player:PrintToPlayer('That\'s generous of you.  Though, I\'m not sure what I would do with that.  Why don\'t you hold onto it for now?', 0, npc:getPacketName())
			if npcUtil.tradeHasExactly(trade, 20685) then
                    player:PrintToPlayer('Now this is a proper weapon!\nThis will make it even better.', 0, npc:getPacketName())
					player:confirmTrade()
					return player:addItem(20685, 1, 45, 8, 1090, 3, 363, 9, 137, 19)
                end
        end,

        -- The entity will not be 'triggerable' unless you populate onTrigger
        onTrigger = function(player, npc)
            -- NOTE: We have to use getPacketName, because the regular name is modified and being used
            --     : for internal lookups
            if player:getMainJob() == xi.job.PLD then
                if player:getMainLvl() >= 40 and player:getMainLvl() <= 70 then
                    player:PrintToPlayer('Ahh, welcome.  We are kin in purpose.', 0, npc:getPacketName())
                    player:PrintToPlayer('I suppose this equipment might seem ancient by your reckoning... but no matter.', 0, npc:getPacketName())
                    player:PrintToPlayer('You will find they are quite sturdy and possessing powerful enchantments.', 0, npc:getPacketName())
                    stock = {
                        17643,5000,-- Honor Sword
                        26410,2500,-- Diamond Buckler
                        11994,2000,-- Gallant Torque
                        12515,15000,-- Gallant Coronet
                        12644,25000,-- Gallant Surcoat
                        13967,12500,-- Gallant Gauntlets
                        14220,17500,-- Gallant Breeches
                        14095,10000,-- Gallant Leggings
                    }
                    xi.shop.general(player,stock);
                elseif player:getMainLvl() >= 71 and player:getMainLvl() <= 79 then
                    player:PrintToPlayer('My how you\'ve grown!', 0, npc:getPacketName())
                    player:PrintToPlayer('These pieces are even older than those I offered you before... older and also, more powerful.', 0, npc:getPacketName())
                    stock = {
                        17643,5000,-- Honor Sword
                        26410,2500,-- Diamond Buckler
                        18276,1250000,-- Excalibur
                        18997,1250000,-- Burtgang
                        15070,1250000,-- Aegis
                        11994,2000,-- Gallant Torque
                        12515,15000,-- Gallant Coronet
                        15231,45000,-- Gallant Coronet +1
                        12644,25000,-- Gallant Surcoat
                        14479,75000,-- Gallant Surcoat +1
                        13967,12500,-- Gallant Gauntlets
                        14896,37500,-- Gallant Gauntlets +1
                        14220,17500,-- Gallant Breeches
                        15567,52500,-- Gallant Breeches +1
                        14095,10000,-- Gallant Leggings
                        15358,30000,-- Gallant Leggings +1
                        15481,20000,-- Valor Cape
                        15078,30000,-- Valor Coronet
                        15251,45000,-- Valor Coronet +1
                        15093,50000,-- Valor Surcoat
                        14506,75000,-- Valor Surcoat +1
                        15108,25000,-- Valor Gauntlets
                        14915,37500,-- Valor Gauntlets +1
                        15123,35000,-- Valor Breeches
                        15586,52500,-- Valor Breeches +1
                        15138,20000,-- Valor Leggings
                        15671,30000,-- Valor Leggings +1
                    }
                    xi.shop.general(player,stock);
                elseif player:getMainLvl() >= 80 and player:getMainLvl() <= 98 then
                    player:PrintToPlayer('It is time these things become available to you, Paladin.', 0, npc:getPacketName())
                    stock = {
                        17643,5000,-- Honor Sword
                        26410,2500,-- Diamond Buckler
                        18276,1250000,-- Excalibur
                        18997,1250000,-- Burtgang
                        19536,1500000,-- Almace
                        15070,1250000,-- Aegis
                        16193,1500000,-- Ochain
                        11994,2000,-- Gallant Torque
                        12515,15000,-- Gallant Coronet
                        15231,45000,-- Gallant Coronet +1
                        12644,25000,-- Gallant Surcoat
                        14479,75000,-- Gallant Surcoat +1
                        13967,12500,-- Gallant Gauntlets
                        14896,37500,-- Gallant Gauntlets +1
                        14220,17500,-- Gallant Breeches
                        15567,52500,-- Gallant Breeches +1
                        14095,10000,-- Gallant Leggings
                        15358,30000,-- Gallant Leggings +1
                        15481,20000,-- Valor Cape
                        15078,30000,-- Valor Coronet
                        15251,45000,-- Valor Coronet +1
                        10656,90000,-- Valor Coronet +2
                        15093,50000,-- Valor Surcoat
                        14506,75000,-- Valor Surcoat +1
                        10676,150000,-- Valor Surcoat +2
                        15108,25000,-- Valor Gauntlets
                        14915,37500,-- Valor Gauntlets +1
                        10696,75000,-- Valor Gauntlets +2
                        15123,35000,-- Valor Breeches
                        15586,52500,-- Valor Breeches +1
                        10716,105000,-- Valor Breeches +2
                        15138,20000,-- Valor Leggings
                        15671,30000,-- Valor Leggings +1
                        10736,60000,-- Valor Leggings +2
                        11595,25000,-- Creed Collar
                        11750,25000,-- Creed Baudrier
                        11709,25000,-- Creed Earring
                        12014,5000,-- Creed Armet
                        11170,45000,-- Creed Armet +1
                        11070,90000,-- Creed Armet +2
                        12034,5000,-- Creed Cuirass
                        11190,75000,-- Creed Cuirass +1
                        11090,150000,-- Creed Cuirass +2
                        12054,5000,-- Creed Gauntlets
                        11210,37500,-- Creed Gauntlets +1
                        11110,75000,-- Creed Gauntlets +2
                        12074,5000,-- Creed Cuisses
                        11230,52500,-- Creed Cuisses +1
                        11130,105000,-- Creed Cuisses +2
                        12094,5000,-- Creed Sabatons
                        11250,30000,-- Creed Sabatons +1
                        11150,60000,-- Creed Sabatons +2
                    }
                    xi.shop.general(player,stock);
                elseif player:getMainLvl() >= 99 then
                    player:PrintToPlayer('If only there was some way to prove your measure beyond mere experience...', 0, npc:getPacketName())
                    player:PrintToPlayer('Hmmm... maybe the moogles?  No, that won\'t do.', 0, npc:getPacketName())
                    player:PrintToPlayer('See anything you like?', 0, npc:getPacketName())
                    stock = {
                        17643,5000,-- Honor Sword
                        26410,2500,-- Diamond Buckler
                        18276,1250000,-- Excalibur
                        18997,1250000,-- Burtgang
                        19536,1500000,-- Almace
                        15070,1250000,-- Aegis
                        16193,1500000,-- Ochain
                        11994,2000,-- Gallant Torque
                        12515,15000,-- Gallant Coronet
                        15231,45000,-- Gallant Coronet +1
                        27669,135000,-- Reverence Coronet
                        12644,25000,-- Gallant Surcoat
                        14479,75000,-- Gallant Surcoat +1
                        27813,225000,-- Reverence Surcoat
                        13967,12500,-- Gallant Gauntlets
                        14896,37500,-- Gallant Gauntlets +1
                        27949,112500,-- Reverence Gauntlets
                        14220,17500,-- Gallant Breeches
                        15567,52500,-- Gallant Breeches +1
                        28096,157500,-- Reverence Breeches
                        14095,10000,-- Gallant Leggings
                        15358,30000,-- Gallant Leggings +1
                        28229,90000,-- Reverence Leggings
                        15481,20000,-- Valor Cape
                        15078,30000,-- Valor Coronet
                        15251,45000,-- Valor Coronet +1
                        10656,90000,-- Valor Coronet +2
                        26636,135000,-- Caballarius Coronet
                        15093,50000,-- Valor Surcoat
                        14506,75000,-- Valor Surcoat +1
                        10676,150000,-- Valor Surcoat +2
                        26812,225000,-- Caballarius Surcoat
                        15108,25000,-- Valor Gauntlets
                        14915,37500,-- Valor Gauntlets +1
                        10696,75000,-- Valor Gauntlets +2
                        26988,112500,-- Caballarius Gauntlets
                        15123,35000,-- Valor Breeches
                        15586,52500,-- Valor Breeches +1
                        10716,105000,-- Valor Breeches +2
                        27164,157500,-- Caballarius Breeches
                        15138,20000,-- Valor Leggings
                        15671,30000,-- Valor Leggings +1
                        10736,60000,-- Valor Leggings +2
                        27340,90000,-- Caballarius Leggings
                        11595,25000,-- Creed Collar
                        11750,25000,-- Creed Baudrier
                        11709,25000,-- Creed Earring
                        12014,5000,-- Creed Armet
                        11170,45000,-- Creed Armet +1
                        11070,90000,-- Creed Armet +2
                        26752,135000,-- Chevalier's Armet
                        12034,5000,-- Creed Cuirass
                        11190,75000,-- Creed Cuirass +1
                        11090,150000,-- Creed Cuirass +2
                        26910,225000,-- Chevalier Cuirass
                        12054,5000,-- Creed Gauntlets
                        11210,37500,-- Creed Gauntlets +1
                        11110,75000,-- Creed Gauntlets +2
                        27064,112500,-- Chevalier Gauntlets
                        12074,5000,-- Creed Cuisses
                        11230,52500,-- Creed Cuisses +1
                        11130,105000,-- Creed Cuisses +2
                        27249,157500,-- Chevalier's Cuisses
                        12094,5000,-- Creed Sabatons
                        11250,30000,-- Creed Sabatons +1
                        11150,60000,-- Creed Sabatons +2
                        27423,90000,-- Chevalier Sabatons
                        26252,50000,-- Rudianos's Mantle
                        25456,50000,-- Chevalier Earring
                        25457,75000,-- Chevalier Earring +1
                        25458,100000,-- Chevalier Earring +2
                    }
                    xi.shop.general(player,stock);
                else
                    player:PrintToPlayer('A knewly appointed knight?  Hmmm...  Take this.', 0, npc:getPacketName())
                    -- player.addItem(26410,1,363,24,1152,3,153,9,145,9)
                    player:PrintToPlayer('I, like you, once walked the path of the Paladin.', 0, npc:getPacketName())
                    -- player:PrintToPlayer('It is my desire to share with you that which I have come to know of this noble purpose.', 0, npc:getPacketName())
                    player:PrintToPlayer('Pray, walk a bit further along the path before we next meet.', 0, npc:getPacketName())
                end
            else
                player:PrintToPlayer('Welcome to San d\'Oria!', 0, npc:getPacketName())
                if player:getMainJob() ~= xi.job.PLD and player:getMainLvl() >=30 then
                    player:PrintToPlayer('Say... I recognize that look.', 0, npc:getPacketName())
                    player:PrintToPlayer('There\'s a fellow here in Southern San d\'Oria by the name of Balasiel who knows a thing or two you may find of interest.', 0, npc:getPacketName())
                    player:PrintToPlayer('Why don\'t you seek him out and see what he has to offer you.', 0, npc:getPacketName())
                    player:PrintToPlayer('Until we meet again.', 0, npc:getPacketName())
                else
                    player:PrintToPlayer('The road to adventure is well worth walking.  You may yet find what you seek.', 0, npc:getPacketName())
                    player:PrintToPlayer('Goodbye for now!', 0, npc:getPacketName())
                end
            end
        end,
    })

    -- Use the mob object however you like
    -- horro:getID() etc.
    -- We're not doing anything with it, so ignore this object
    utils.unused(Cecil)

    -- You could also just not capture the object
    -- zone:insertDynamicEntity({ ...
end)

return m
