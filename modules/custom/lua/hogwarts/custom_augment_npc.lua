------------------------------------------------------------------
--                      custom_augment_npc
--                      Custom Augment NPC
--      Provides trade functions, dialogue, and other necessary
--      components to facilitate a custom augment shop or system;
--      to be adapted as necessary for your custom server's use
------------------------------------------------------------------
require('modules/module_utils')
require('scripts/zones/Southern_San_dOria/Zone')
require('scripts/globals/player')
require('scripts/globals/interaction/actions/action')
require('scripts/globals/interaction/actions/message')
require('scripts/globals/interaction/actions/sequence')

local augmentData = require("modules/custom/lua/hogwarts/custom_augment_enum")

local m = Module:new('Custom_Augment_Shop')

m:addOverride('xi.zones.Southern_San_dOria.Zone.onInitialize', function(zone)
    -- Insert NPC into the zone
    local cecil = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Cecil Harvey',
        look = 971,
        x = -36.6300,
        y = 0.000,
        z = 30.7160,
        rotation = 27,
        widescan = 1,

        onTrade = function(player, npc, trade)
            local item = trade:getItem(0)
            local itemID = item:getID()

            -- Check if the traded item is augmentable and get its tier
            local itemTier = augmentData.getItemTier(itemID)
            if itemTier == 0 then
                player:printToPlayer("This item cannot be augmented.", 0, npc:getPacketName())
                return
            end

            -- Check if the traded item is the only item traded
            -- If so get its tier and share info about it with the player
            if trade:getItemCount() == 1 then
                if itemTier == 1 then
                    player:printToPlayer("This is of average quality.  This item can handle tier 1 augments.", 0, npc:getPacketName())
                elseif itemTier == 2 then
                    player:printToPlayer("A masterwork piece. Attempt up to tier 2 augments with this one.", 0, npc:getPacketName())
                elseif itemTier == 3 then
                    player:printToPlayer("Hmmm, this may be an artifact of another age. Let's try tier 3 augments with this.", 0, npc:getPacketName())
                elseif itemTier == 4 then
                    player:printToPlayer("You found this on Vana'diel? Remarkable. I will apply all but the most powerful augments to it.", 0, npc:getPacketName())
                elseif itemTier == 5 then
                    player:printToPlayer("I wouldn't be surprised to learn that this is Lunarian in nature.  It will absorb all we can muster.", 0, npc:getPacketName())
                end
                return -- Exit here if only one item is traded
            end

            -- Check the player's access to augment tiers based on key items
            local maxTierUnlocked = 0
            if player:hasKeyItem(xi.ki.SCINTILLATING_RHAPSODY) then
                maxTierUnlocked = 5
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_CRIMSON) then
                maxTierUnlocked = 4
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_AZURE) then
                maxTierUnlocked = 3
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER) then
                maxTierUnlocked = 2
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE) then
                maxTierUnlocked = 1
            end

            -- Ensure the player's tier access matches the augments they want to apply
            local selectedAugments = augmentData.getAugmentsForTrade(itemTier, trade)
            if #selectedAugments == 0 then
                player:printToPlayer("The materials you traded are not correct for augmentation.", 0, npc:getPacketName())
                return
            end

            -- Apply up to 4 augments, ensuring they match the player's max unlock tier
            local finalAugments = {}
            for _, augment in ipairs(selectedAugments) do
                if augment.tier <= maxTierUnlocked then
                    table.insert(finalAugments, augment)
                else
                    player:printToPlayer("You do not have access to apply augment for " .. augment.materialName .. ".", 0, npc:getPacketName())
                end
                if #finalAugments >= 4 then break end -- Max of 4 augments
            end

            if #finalAugments == 0 then
                player:printToPlayer("No valid augments could be applied based on your key items.", 0, npc:getPacketName())
                return
            end

            -- Apply the valid augments
            player:addItem(itemID, 1,
                finalAugments[1] and finalAugments[1].augmentID or 0, finalAugments[1] and finalAugments[1].power or 0,
                finalAugments[2] and finalAugments[2].augmentID or 0, finalAugments[2] and finalAugments[2].power or 0,
                finalAugments[3] and finalAugments[3].augmentID or 0, finalAugments[3] and finalAugments[3].power or 0,
                finalAugments[4] and finalAugments[4].augmentID or 0, finalAugments[4] and finalAugments[4].power or 0
            )

            player:printToPlayer("Your item has been successfully augmented!", 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
            player:printToPlayer('Hello! It is good to see you.', 0, npc:getPacketName())
            local maxTierUnlocked = 0
            -- Check for player's key item to unlock the correct tier
            if player:hasKeyItem(xi.ki.SCINTILLATING_RHAPSODY) then
                maxTierUnlocked = 5
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_CRIMSON) then
                maxTierUnlocked = 4
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_AZURE) then
                maxTierUnlocked = 3
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER) then
                maxTierUnlocked = 2
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE) then
                maxTierUnlocked = 1
            end
            -- Adjust dialogue based on the player's access to augmentation ranks
            if maxTierUnlocked == 5 then
                player:printToPlayer('You have access to all that is within my power to provide. Tier 5.', 0, npc:getPacketName())
            elseif maxTierUnlocked == 4 then
                player:printToPlayer('All but the very pinnacle of power is available to you. Tier 4.', 0, npc:getPacketName())
            elseif maxTierUnlocked == 3 then
                player:printToPlayer('Reaching this level is is no small feat, and surely required a good pair of boots. Tier 3.', 0, npc:getPacketName())
            elseif maxTierUnlocked == 2 then
                player:printToPlayer('Surely you\'ve noticed the difference with that stone in your possession. Tier 2.', 0, npc:getPacketName())
            elseif maxTierUnlocked == 1 then
                player:printToPlayer('Everyone starts at the beginning, and you\'re beyond that already! Tier 1.', 0, npc:getPacketName())
            else
                player:printToPlayer('Have you not heard the song of the mothercrystal?  Seek out it\'s scintillating rhapsody. Each step yields rewards. Tier 0.', 0, npc:getPacketName())
            end
        end,
    })

    utils.unused(cecil)
end)

return m
