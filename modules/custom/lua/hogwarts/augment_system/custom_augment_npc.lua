------------------------------------------------------------------
--                      custom_augment_npc
------------------------------------------------------------------
require('modules/module_utils')
require('scripts/zones/Southern_San_dOria/Zone')
require('scripts/globals/player')
require('scripts/globals/npc_util')
require('scripts/globals/interaction/actions/action')
require('scripts/globals/interaction/actions/message')
require('scripts/globals/interaction/actions/sequence')

local augmentData = require("modules/custom/lua/hogwarts/augment_system/custom_augment_enum")

local m = Module:new('Custom_Augment_Shop')

-- Build a stable numeric signature for a trade so players can trade twice to confirm.
-- Uses only integers so it can be stored in local vars.
local function buildTradeSignature(trade)
    local parts = {}

    -- Prefer slot-based indexing (0-7) for compatibility with LSB trade APIs
    for slot = 0, 7 do
        local id = trade:getItemId(slot)
        if id and id ~= 0 then
            local qty = trade:getItemQty(slot) or 0
            table.insert(parts, string.format('%d:%d', id, qty))
        end
    end

    -- Fallback for implementations that enumerate 1..getItemCount()
    if #parts == 0 then
        local count = trade:getItemCount() or 0
        for i = 1, count do
            local id = trade:getItemId(i)
            if id and id ~= 0 then
                local qty = trade:getItemQty(i) or 0
                table.insert(parts, string.format('%d:%d', id, qty))
            end
        end
    end

    table.sort(parts)

    -- Simple rolling hash into signed 32-bit-ish range
    local h = 0
    for _, p in ipairs(parts) do
        for j = 1, #p do
            h = (h * 131 + p:byte(j)) % 2147483647
        end
    end

    return h
end

local DEFAULT_ROTATION = 27
local CRAFT_START_DELAY_MS = 1200
local CRAFT_TOTAL_MS = 3800
local CRAFT_FINISH_DELAY_MS = 900
local CRAFT_ANIM_PULSE_MS = 1100
local SYNTH_EFFECT_NORMAL = 0
local SYNTH_EFFECT_HQ2 = 3

local directionToRotation =
{
    north = 128,
    northeast = 160,
    east = 192,
    southeast = 224,
    south = 0,
    southwest = 32,
    west = 64,
    northwest = 96,
}

local crystalCraftFlow =
{
    { key = 'earth',     safeFacing = 'southeast', hqFacing = 'south',     synthEffect = 0x0013 },
    { key = 'water',     safeFacing = 'southwest', hqFacing = 'west',      synthEffect = 0x0010 },
    { key = 'fire',      safeFacing = 'west',      hqFacing = 'northwest', synthEffect = 0x0012 },
    { key = 'lightning', safeFacing = 'south',     hqFacing = 'southwest', synthEffect = 0x0014 },
    { key = 'air',       safeFacing = 'east',      hqFacing = 'southeast', synthEffect = 0x0011 },
    { key = 'ice',       safeFacing = 'northwest', hqFacing = 'north',     synthEffect = 0x0015 },
}

local craftLineTemplates =
{
    "Let's see... %s. Safe says %s, HQ says %s. Yeah, %s is the way.",
    "Um... let's see, %s. Safe synth says %s, but HQ superstition says %s. I'll go with %s.",
    "%s crystal, right. %s keeps it stable, %s chases the big result... %s it is!",
    "Compass nonsense says %s likes %s for success and %s for better odds. Hah! %s it is.",
    "If I follow old tavern wisdom: %s wants %s to play it safe, or %s to gamble. Today we face %s.",
}

local function buildCraftLine(craftChoice, chosenFacing)
    local template = craftLineTemplates[math.random(1, #craftLineTemplates)]
    return string.format(template, craftChoice.key, craftChoice.safeFacing, craftChoice.hqFacing, chosenFacing)
end

local function playCrystalSynthesisAnimation(player, craftChoice, useHQ2Effect)
    local loops = math.max(1, math.floor(CRAFT_TOTAL_MS / CRAFT_ANIM_PULSE_MS))
    local effect = useHQ2Effect and (craftChoice.synthEffectHQ or craftChoice.synthEffect) or craftChoice.synthEffect
    local effectType = useHQ2Effect and SYNTH_EFFECT_HQ2 or SYNTH_EFFECT_NORMAL

    local function pulse(playerArg, remaining)
        playerArg:synthesisEffectPacket(effect, effectType)

        if remaining <= 1 then
            return
        end

        playerArg:timer(CRAFT_ANIM_PULSE_MS, function(playerTimerArg)
            pulse(playerTimerArg, remaining - 1)
        end)
    end

    pulse(player, loops)
end

local function showAugmentPreview(player, npc, augmentableItem, itemTier, augments)
    player:printToPlayer('----- Augment Preview -----', 0, npc:getPacketName())
    -- player:printToPlayer(string.format('Augmented item: %d (Tier %d)', augmentableItem, itemTier), 0, npc:getPacketName())
	player:printToPlayer(string.format('Augmented item: %s (Tier %d)', augmentableName or tostring(augmentableItem), itemTier), 0, npc:getPacketName())

    for i = 1, math.min(#augments, 4) do
        local a = augments[i]
        local text = a.desc or (string.format('%s (AugmentID %d Power %d)',
            a.materialName or 'Material',
            a.augmentID or 0,
            a.power or 0
        ))
        player:printToPlayer(string.format('%d) %s', i, text), 0, xi.msg.channel.SYSTEM_3)
    end

    player:printToPlayer('If you\'re sure, hand me those same materials again and we will proceed.', 0, npc:getPacketName())
end

m:addOverride('xi.zones.Southern_San_dOria.Zone.onInitialize', function(zone)
    local cecil = zone:insertDynamicEntity({
        objtype  = xi.objType.NPC,
        name     = 'Cecil Harvey',
        look     = 971,
        x = -36.6300, y = 0.000, z = 30.7160, rotation = 27,
        widescan = 1,

        onTrade = function(player, npc, trade)
			npc:facePlayer(player)

            local augmentableItem = nil
			local augmentableName = nil
            local itemTier        = 0
            local totalItems      = trade:getItemCount()

            -- Identify exactly one augmentable item
            for i = 0, totalItems - 1 do
                local item = trade:getItem(i)
                if item then
                    local itemID = item:getID()
                    local tier   = augmentData.getItemTier(itemID)
                    if tier > 0 then
                        if augmentableItem then
                            player:printToPlayer('This is a delicate process. Please trade only one piece of equipment.', 0, npc:getPacketName())
							npc:timer(3500, function(npcArg)
                                npcArg:setRotation(npcArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
                            end)
                            return
                        end
                        augmentableItem = itemID
                        itemTier        = tier
						augmentableName = item:getName()
                    end
                end
            end

            -- Only one thing traded and it's not augmentable
            if totalItems == 1 and not augmentableItem then
                player:printToPlayer('This is interesting, but it will not work for our current purpose.', 0, npc:getPacketName())
				npc:timer(3500, function(npcArg)
					npcArg:setRotation(npcArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
				end)
				return
            end

            -- If only the augmentable item was traded: give tier hint
            if totalItems == 1 and augmentableItem then
                local hints = {
                    [1] = 'This is of average quality. This item can handle basic augments.',
                    [2] = 'A masterwork piece. Attempt stronger augments with this one.',
                    [3] = 'An artifact of another age, perhaps. We can imbue real power.',
                    [4] = 'Remarkable. I will apply all but the most powerful augments to it.',
                    [5] = 'Lunarian, perhaps? It will handle all we can muster.',
                }
                player:printToPlayer(hints[itemTier] or 'Hmm.', 0, npc:getPacketName())
				npc:timer(3500, function(npcArg)
					npcArg:setRotation(npcArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
				end)
                return
            end

            if not augmentableItem then
                player:printToPlayer('Hmmm, I just don’t see anything here I can work with.', 0, npc:getPacketName())
                npc:timer(3500, function(npcArg)
					npcArg:setRotation(npcArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
				end)
				return
            end

            -- Max tier unlocked (0..5). Keep this consistent with augmentTable keys.
            local maxTierUnlocked = 0
            if     player:hasKeyItem(xi.ki.WHISPER_OF_THE_WYRMKING)            then maxTierUnlocked = 6
			elseif player:hasKeyItem(xi.ki.CERULEAN_CRYSTAL)                   then maxTierUnlocked = 5
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_EMERALD)                then maxTierUnlocked = 4
            elseif player:hasKeyItem(xi.ki.AIRSHIP_PASS)                       then maxTierUnlocked = 3
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER)                  then maxTierUnlocked = 2
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE)                  then maxTierUnlocked = 1
            end

            -- Collect augments from materials, enforce caps
            local selectedAugments  = {}
            local totalAugmentCount = 0

            for i = 0, 7 do
                local materialID = trade:getItemId(i)
                local qty        = trade:getSlotQty(i)
                if materialID and materialID ~= 0 and materialID ~= augmentableItem and qty and qty > 0 then
					
					-- Check from the item’s tier down to 1
                    for tier = math.min(itemTier, maxTierUnlocked), 0, -1 do
                        local augmentInfo = augmentData.augmentTable[tier] and augmentData.augmentTable[tier][materialID]

						if augmentInfo then
                            -- If this augment’s tier is locked out, reject the entire trade
                            if tier > maxTierUnlocked then
                                player:printToPlayer('Some of these materials would result in augments beyond your current means to wield.', 0, npc:getPacketName())
                                npc:timer(3500, function(npcArg)
									npcArg:setRotation(npcArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
								end)
								return
                            end

                            local augmentCount = math.floor(qty / augmentInfo.requiredQty)
                            if augmentCount > 0 then
                                -- Enforce global cap of 4 augments across *all* materials
                                if totalAugmentCount + augmentCount > 4 then
                                    player:printToPlayer('This is more than we can reasonably achieve. Why not try another combination?', 0, npc:getPacketName())
                                    npc:timer(3500, function(npcArg)
										npcArg:setRotation(npcArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
									end)
									return
                                end

                                for _ = 1, augmentCount do
                                    table.insert(selectedAugments, {
                                        augmentID    = augmentInfo.augmentID,
                                        power        = augmentInfo.power,
                                        materialName = augmentInfo.materialName,
										desc         = augmentInfo.desc,
                                        tier         = tier,
                                    })
                                end
                                totalAugmentCount = totalAugmentCount + augmentCount
                            end

                            break -- Found a valid tier bucket for this materialID
                        end
                    end
                end
            end

            if #selectedAugments == 0 then
                player:printToPlayer('These materials are not suitable for augmentation.', 0, npc:getPacketName())
            	npc:timer(3500, function(npcArg)
					npcArg:setRotation(npcArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
				end)
				return
            end

            -- Consume the trade FIRST to avoid R/EX conflicts, then delay and return the new item
			-- Double-trade confirmation:
            -- 1st trade shows a preview and arms confirmation; 2nd identical trade applies the augments.
            local sig = buildTradeSignature(trade)

            -- Bind the pending signature to the specific augmentable item to prevent accidental confirms
            local pendingSig  = player:getLocalVar('CA_PENDING_SIG')
            local pendingItem = player:getLocalVar('CA_PENDING_ITEM')

            if pendingSig ~= sig or pendingItem ~= augmentableItem then
                player:setLocalVar('CA_PENDING_SIG', sig)
                player:setLocalVar('CA_PENDING_ITEM', augmentableItem)
                showAugmentPreview(player, npc, augmentableItem, itemTier, selectedAugments)
                return
            end

            -- Confirmed: clear pending and proceed
            player:setLocalVar('CA_PENDING_SIG', 0)
            player:setLocalVar('CA_PENDING_ITEM', 0)

            -- Consume the trade AFTER confirmation, then delay and return the new item
            player:tradeComplete()
            player:printToPlayer('Alright, give me just a moment now.', 0, npc:getPacketName())

            local craftChoice = crystalCraftFlow[math.random(1, #crystalCraftFlow)]
            local useHQDirection = math.random(1, 2) == 2
            local chosenFacing = useHQDirection and craftChoice.hqFacing or craftChoice.safeFacing
            local chosenRotation = directionToRotation[chosenFacing] or DEFAULT_ROTATION
            local craftLine = buildCraftLine(craftChoice, chosenFacing)

            npc:timer(CRAFT_START_DELAY_MS, function(npcArg)
                npcArg:setRotation(chosenRotation)
                player:printToPlayer(craftLine, 0, npcArg:getPacketName())

                playCrystalSynthesisAnimation(player, craftChoice, useHQDirection)
            end)

            npc:timer(CRAFT_START_DELAY_MS + CRAFT_TOTAL_MS + CRAFT_FINISH_DELAY_MS, function(npcArg)
                npcArg:facePlayer(player)

                local itemData =
                {
                    id       = augmentableItem,
                    quantity = 1,
                }

                local augments = {}

                for _, data in ipairs(selectedAugments) do
                    if data and data.augmentID and data.augmentID > 0 then
                        table.insert(augments,
                        {
                            id    = data.augmentID,
                            value = data.power or 0,
                        })
                    end
                end

                if #augments > 0 then
                    itemData.exdata =
                    {
                        augmentKind    = xi.augment.kind.HAS_AUGMENTS,
                        augmentSubKind = xi.augment.subKind.STANDARD,
                        augments       = augments,
                    }
                end

                local obtained = player:addItem(itemData)

                if obtained then
                    player:printToPlayer('Make fine use of this.', 0, npcArg:getPacketName())
                    player:printToPlayer(string.format('Augmented %s received.', augmentableName), 0, xi.msg.channel.SYSTEM_3)
                else
                    
					player:printToPlayer(string.format('The augmentation failed during item return.'), 0, xi.msg.channel.SYSTEM_3)
                end

                npcArg:timer(1200, function(npcDoneArg)
                    npcDoneArg:setRotation(npcDoneArg:getLocalVar('CA_NORMAL_ROT') or DEFAULT_ROTATION)
                end)
            end)
        end,

        onTrigger = function(player, npc)
            npc:facePlayer(player)
            player:printToPlayer('It is good to see you.', 0, npc:getPacketName())

			-- Clear any pending confirm when interacting normally
            player:setLocalVar('CA_PENDING_SIG', 0)
            player:setLocalVar('CA_PENDING_ITEM', 0)
            local maxTierUnlocked = 0
            if     player:hasKeyItem(xi.ki.WHISPER_OF_THE_WYRMKING)            then maxTierUnlocked = 6
			elseif player:hasKeyItem(xi.ki.CERULEAN_CRYSTAL)                   then maxTierUnlocked = 5
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_EMERALD)                then maxTierUnlocked = 4
            elseif player:hasKeyItem(xi.ki.AIRSHIP_PASS)                       then maxTierUnlocked = 3
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER)                  then maxTierUnlocked = 2
            elseif player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE)                  then maxTierUnlocked = 1
            end

            local lines = {
                [6] = 'This is wondrous! We may be able to provide even greater enhancements than before.  Let\'s get to work.',
				[5] = 'You have access to all that is within my power to provide.',
                [4] = 'All but the very pinnacle of power is available to you.',
                [3] = 'Reaching this level is no small feat, and surely required a good pair of boots.',
                [2] = 'That stone in your possession will help you wield more powerfully augmented items.',
                [1] = 'Everyone starts at the beginning, and you\'re beyond that already! Let\'s get started.',
                [0] = 'Have you not heard the song of the mothercrystal? Seek out its scintillating rhapsody. Each step yields rewards.',
            }
            player:printToPlayer(lines[maxTierUnlocked], 0, npc:getPacketName())
        end,
    })

    utils.unused(cecil)
end)

return m
