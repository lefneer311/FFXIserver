require('scripts/globals/player')
require('scripts/globals/npc_util')

local function loadAugmentData()
    package.loaded['modules/custom/lua/hogwarts/augment_system/custom_augment_enum'] = nil
    return require('modules/custom/lua/hogwarts/augment_system/custom_augment_enum')
end

local augmentNPCLogic = {}

-- Build a stable numeric signature for a trade so players can trade twice to confirm.
-- Uses only integers so it can be stored in local vars.
local function buildTradeSignature(trade)
    local parts = {}

    for slot = 0, 7 do
        local id = trade:getItemId(slot)
        if id and id ~= 0 then
            local qty = trade:getItemQty(slot) or 0
            table.insert(parts, string.format('%d:%d', id, qty))
        end
    end

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

    local h = 0
    for _, p in ipairs(parts) do
        for j = 1, #p do
            h = (h * 131 + p:byte(j)) % 2147483647
        end
    end

    return h
end

local DEFAULT_ROTATION = 180
local SPEECH_RETURN_DELAY_MS = 1200
local CRAFT_START_DELAY_MS = 1200
local CRAFT_TOTAL_MS = 3800
local CRAFT_FINISH_DELAY_MS = 900
local CRAFT_ANIM_PULSE_MS = 1100
local CRAFT_ACK_DELAY_MS = 900
local CRAFT_LINE_DELAY_MS = 2200
local SYNTH_EFFECT_NORMAL = 0
local SYNTH_EFFECT_HQ2 = 3

local directionToRotation = {
    east = 0,
    north = 190,
    west = 130,
    south = 65,
    southeast = 34,
    northeast = 228,
    northwest = 166,
    southwest = 97,
}

local crystalCraftFlow = {
    { key = 'earth',        safeFacing = 'southeast',   hqFacing = 'south',         synthEffect = 0x0013, synergyAnim = xi.animationString.SYNERGY_EARTH_FEWELL     },
    { key = 'water',        safeFacing = 'southwest',   hqFacing = 'west',          synthEffect = 0x0010, synergyAnim = xi.animationString.SYNERGY_WATER_FEWELL     },
    { key = 'fire',         safeFacing = 'west',        hqFacing = 'northwest',     synthEffect = 0x0012, synergyAnim = xi.animationString.SYNERGY_FIRE_FEWELL      },
    { key = 'lightning',    safeFacing = 'south',       hqFacing = 'southwest',     synthEffect = 0x0014, synergyAnim = xi.animationString.SYNERGY_LIGHTNING_FEWELL },
    { key = 'air',          safeFacing = 'east',        hqFacing = 'southeast',     synthEffect = 0x0011, synergyAnim = xi.animationString.SYNERGY_WIND_FEWELL      },
    { key = 'ice',          safeFacing = 'northwest',   hqFacing = 'north',         synthEffect = 0x0015, synergyAnim = xi.animationString.SYNERGY_ICE_FEWELL       },
}

local craftLineTemplates = {
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

local function restoreNormalRotation(npc, delay)
    npc:timer(delay or SPEECH_RETURN_DELAY_MS, function(npcArg)
        npc:setRotation(27)
    end)
end

local function playCrystalSynthesisAnimation(player, npc, craftChoice, useHQ2Effect)
    local loops = math.max(1, math.floor(CRAFT_TOTAL_MS / CRAFT_ANIM_PULSE_MS))
    local effect = useHQ2Effect and (craftChoice.synthEffectHQ or craftChoice.synthEffect) or craftChoice.synthEffect
    local effectType = useHQ2Effect and SYNTH_EFFECT_HQ2 or SYNTH_EFFECT_NORMAL

	npc:entityAnimationPacket(xi.animationString.CAST_ITEM_START)
    npc:entityAnimationPacket(xi.animationString.SKILL_START)

    local function pulse(npcArg, remaining)
        npcArg:synthesisEffectPacket(effect, effectType)
        if remaining <= 1 then
            return
        end
        npcArg:timer(CRAFT_ANIM_PULSE_MS, function(npcTimerArg)
		    npcTimerArg:entityAnimationPacket(craftChoice.synergyAnim or xi.animationString.SYNERGY_COMPLETE)
            pulse(npcTimerArg, remaining - 1)
        end)
    end

    pulse(npc, loops)

    npc:timer(CRAFT_TOTAL_MS, function(npcArg)
        npcArg:entityAnimationPacket(xi.animationString.SKILL_INTERRUPT)
        npcArg:entityAnimationPacket(xi.animationString.CAST_ITEM_STOP)
        npcArg:entityAnimationPacket(xi.animationString.SYNERGY_COMPLETE)
    end)
end

local MAX_AUGMENTS_PER_ITEM = 4

local function getAugmentKey(augmentInfo)
    return string.format('%d', augmentInfo.augmentID or augmentInfo[1] or 0)
end

local function showAugmentPreview(player, npc, augmentableItem, augmentableName, itemTier, augments)
    npc:timer(100, function(npcArg)
		player:printToPlayer('Combine these, then?  Let\'s see what effect might they have...', 0, npcArg:getPacketName())
	end)
	npc:timer(1800, function(npcArg)
		player:printToPlayer(string.format('Your %s is Tier %d and will receive these augments:', augmentableName or tostring(augmentableItem), itemTier), 0, npcArg:getPacketName())

		for i = 1, math.min(#augments, MAX_AUGMENTS_PER_ITEM) do
			local a = augments[i]
			local text = a.desc or (string.format('%s (AugmentID %d Power %d)', a.materialName or 'Material', a.augmentID or 0, a.power or 0))
			player:printToPlayer(string.format('%d) %s', i, text), xi.msg.channel.SYSTEM_3, npcArg:getPacketName())
		end
	end)

	npc:timer(3600, function(npcArg)
		player:printToPlayer('If you\'re sure, hand me those same materials again and we will proceed.', 0, npcArg:getPacketName())
	end)
	npc:timer(4500, function(npcArg)
		npcArg:setRotation(27)
	end)
end

function augmentNPCLogic.onTrade(player, npc, trade)
    npc:facePlayer(player)
	local augmentData = loadAugmentData()

    local augmentableItem = nil
    local augmentableName = nil
    local itemTier = 0
    local totalItems = trade:getItemCount()

    for i = 0, totalItems - 1 do
        local item = trade:getItem(i)
        if item then
            local itemID = item:getID()
            local tier = augmentData.getItemTier(itemID)
            if tier > 0 then
                if augmentableItem then
                    player:printToPlayer('This is a delicate process. Please trade only one piece of equipment.', 0, npc:getPacketName())
                    npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
                    return
                end
                augmentableItem = itemID
                itemTier = tier
                augmentableName = item:getName()
            end
        end
    end

    if totalItems == 1 and not augmentableItem then
        player:printToPlayer('This is interesting, but it will not work for our current purpose.', 0, npc:getPacketName())
        npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
        return
    end

    if totalItems == 1 and augmentableItem then
        local hints = {
            [1] = 'This is of average quality. This item can handle basic augments.',
            [2] = 'A masterwork piece. Attempt stronger augments with this one.',
            [3] = 'An artifact of another age, perhaps. We can imbue real power.',
            [4] = 'Remarkable. I will apply all but the most powerful augments to it.',
            [5] = 'Lunarian, perhaps? It will handle all we can muster.',
        }
        player:printToPlayer(hints[itemTier] or 'Hmm.', 0, npc:getPacketName())
        npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
        return
    end

    if not augmentableItem then
        player:printToPlayer('Hmmm, I just don\'t see anything here I can work with.', 0, npc:getPacketName())
        npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
        return
    end

    local maxTierUnlocked = 0
    if      player:hasKeyItem(xi.ki.WHISPER_OF_THE_WYRMKING)        then maxTierUnlocked = 9
    elseif  player:hasKeyItem(xi.ki.CERULEAN_CRYSTAL)               then maxTierUnlocked = 8
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_EMERALD)            then maxTierUnlocked = 7
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_CRIMSON)            then maxTierUnlocked = 6
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_AZURE)              then maxTierUnlocked = 5
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER)              then maxTierUnlocked = 4
    elseif  player:hasKeyItem(xi.ki.AIRSHIP_PASS)                   then maxTierUnlocked = 3
    elseif  player:hasKeyItem(xi.ki.PURE_WHITE_FEATHER)             then maxTierUnlocked = 2
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE)              then maxTierUnlocked = 1
    end

    local selectedAugments = {}
    local selectedAugmentKeys = {}
    for i = 0, 7 do
        local materialID = trade:getItemId(i)
        local qty = trade:getSlotQty(i)
        if materialID and materialID ~= 0 and materialID ~= augmentableItem and qty and qty > 0 then
            for tier = math.min(itemTier, maxTierUnlocked), 0, -1 do
                local augmentInfo = augmentData.augmentTable[tier] and augmentData.augmentTable[tier][materialID]
                if augmentInfo then
                    local requiredQty = augmentInfo.requiredQty or augmentInfo[2]
                    local augmentID = augmentInfo.augmentID or augmentInfo[1]
                    local augmentCount = math.floor(qty / requiredQty)
                    if augmentCount > 0 then
                        if augmentCount > 1 then
                            player:printToPlayer('I cannot duplicate the same augment on one item. Bring up to four distinct augments.', 0, npc:getPacketName())
                            npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
                            return
                        end

                        local augmentKey = getAugmentKey(augmentInfo)
                        if selectedAugmentKeys[augmentKey] then
                            player:printToPlayer('I cannot duplicate the same augment on one item. Bring up to four distinct augments.', 0, npc:getPacketName())
                            npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
                            return
                        end

                        if #selectedAugments >= MAX_AUGMENTS_PER_ITEM then
                            player:printToPlayer('This is more than we can reasonably achieve. Why not try another combination?', 0, npc:getPacketName())
                            npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
                            return
                        end

                        selectedAugmentKeys[augmentKey] = true
                        table.insert(selectedAugments, {augmentID = augmentID, power = augmentInfo.power or augmentInfo[3], materialName = augmentInfo.materialName or augmentInfo[4], desc = augmentInfo.desc, tier = augmentInfo.tier or augmentInfo[5] or tier})
                    end
                    break
                end
            end
        end
    end

    if #selectedAugments == 0 then
        player:printToPlayer('These materials are not suitable for augmentation.', 0, npc:getPacketName())
        npc:timer(1200, function(npcArg) npcArg:setRotation(27) end)
        return
    end


    local sig = buildTradeSignature(trade)
    local pendingSig = player:getLocalVar('CA_PENDING_SIG')
    local pendingItem = player:getLocalVar('CA_PENDING_ITEM')

    if pendingSig ~= sig or pendingItem ~= augmentableItem then
        player:setLocalVar('CA_PENDING_SIG', sig)
        player:setLocalVar('CA_PENDING_ITEM', augmentableItem)
        showAugmentPreview(player, npc, augmentableItem, augmentableName, itemTier, selectedAugments)
        return
    end

    player:setLocalVar('CA_PENDING_SIG', 0)
    player:setLocalVar('CA_PENDING_ITEM', 0)
    player:tradeComplete()
    player:printToPlayer('Alright, give me just a moment now.', 0, npc:getPacketName())

    local craftChoice = crystalCraftFlow[math.random(1, #crystalCraftFlow)]
    local useHQDirection = math.random(1, 2) == 2
    local chosenFacing = useHQDirection and craftChoice.hqFacing or craftChoice.safeFacing
    local chosenRotation = directionToRotation[chosenFacing] or DEFAULT_ROTATION
    local craftLine = buildCraftLine(craftChoice, chosenFacing)

	npc:timer(CRAFT_ACK_DELAY_MS, function(npcArg)
        player:printToPlayer('Hmmm...', 0, npcArg:getPacketName())
    end)

    npc:timer(CRAFT_LINE_DELAY_MS, function(npcArg)
        player:printToPlayer(craftLine, 0, npcArg:getPacketName())
    end)

    npc:timer(CRAFT_START_DELAY_MS, function(npcArg)
        npcArg:setRotation(chosenRotation)
        playCrystalSynthesisAnimation(player, npcArg, craftChoice, useHQDirection)
    end)

    npc:timer(CRAFT_START_DELAY_MS + CRAFT_LINE_DELAY_MS + CRAFT_TOTAL_MS + CRAFT_FINISH_DELAY_MS, function(npcArg)
        npcArg:facePlayer(player)
        local itemData = { id = augmentableItem, quantity = 1 }
        local augments = {}
        for _, data in ipairs(selectedAugments) do
            if data and data.augmentID and data.augmentID > 0 then
                table.insert(augments, { id = data.augmentID, value = data.power or 0 })
            end
        end
        if #augments > 0 then
            itemData.exdata = { augmentKind = xi.augment.kind.HAS_AUGMENTS, augmentSubKind = xi.augment.subKind.STANDARD, augments = augments }
        end

        local obtained = player:addItem(itemData)
        if obtained then
            player:printToPlayer('Make fine use of this.', 0, npcArg:getPacketName())
            player:printToPlayer(string.format('Augmented %s received.', augmentableName), xi.msg.channel.SYSTEM_3, npcArg:getPacketName())
        else
            player:printToPlayer('The augmentation failed during item return.', xi.msg.channel.SYSTEM_3, npcArg:getPacketName())
        end

        npcArg:timer(1200, function(npcDoneArg)
            npcDoneArg:setRotation(27)
        end)
    end)
end

function augmentNPCLogic.onTrigger(player, npc)
    npc:facePlayer(player)
    player:printToPlayer('It is good to see you.', 0, npc:getPacketName())
    player:setLocalVar('CA_PENDING_SIG', 0)
    player:setLocalVar('CA_PENDING_ITEM', 0)

    local maxTierUnlocked = 0
    if      player:hasKeyItem(xi.ki.WHISPER_OF_THE_WYRMKING)        then maxTierUnlocked = 9
    elseif  player:hasKeyItem(xi.ki.CERULEAN_CRYSTAL)               then maxTierUnlocked = 8
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_EMERALD)            then maxTierUnlocked = 7
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_CRIMSON)            then maxTierUnlocked = 6
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_AZURE)              then maxTierUnlocked = 5
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_UMBER)              then maxTierUnlocked = 4
    elseif  player:hasKeyItem(xi.ki.AIRSHIP_PASS)                   then maxTierUnlocked = 3
    elseif  player:hasKeyItem(xi.ki.PURE_WHITE_FEATHER)             then maxTierUnlocked = 2
    elseif  player:hasKeyItem(xi.ki.RHAPSODY_IN_WHITE)              then maxTierUnlocked = 1
    end

    local lines = {
        [9] = 'The wyrmking\'s whisper opens the pinnacle of my craft to you.',
        [8] = 'That cerulean crystal resonates with nearly every technique I know.',
        [7] = 'The emerald\'s harmony grants access to earth, sea, and sky.',
        [6] = 'Crimson resolve suits the testimony-grade augments now available.',
        [5] = 'Azure light unlocks a broad spectrum of high-level materials.',
        [4] = 'Umber resonance brings geode-based recipes within reach.',
        [3] = 'Reaching this level is no small feat, and surely required a good pair of boots.',
        [2] = 'That feather in your possession will help you wield more powerfully augmented items.',
        [1] = 'Everyone starts at the beginning, and you\'re beyond that already! Let\'s get started.',
        [0] = 'Have you not heard the song of the mothercrystal? Seek out its scintillating rhapsody. Each step yields rewards.',
    }

    player:printToPlayer(lines[maxTierUnlocked], 0, npc:getPacketName())
    restoreNormalRotation(npc)
end

return augmentNPCLogic