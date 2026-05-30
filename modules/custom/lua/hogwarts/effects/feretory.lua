-----------------------------------
-- Feretory
-- Relic Inspiration; "Legends inspire legends."
--
-- Level 75 relics equipped in main/sub/ranged inspire nearby party/alliance
-- members. The recipient's main job determines the bonus. Nearby qualifying
-- relic count determines tier:
--
-- 1 relic nearby  = Tier I
-- 3 relics nearby = Tier II
-- 5+ relics nearby = Tier III
-----------------------------------

require('modules/module_utils')
require('scripts/enum/effect')
require('scripts/enum/item')
require('scripts/enum/job')
require('scripts/enum/mod')
require('scripts/enum/slot')
-----------------------------------

local m = Module:new('feretory')

-----------------------------------
-- Tuning
-----------------------------------

local ENABLE_FERETORY = true
local DEBUG_FERETORY  = false

local AURA_RADIUS     = 22
local PULSE_SECONDS   = 15
local EFFECT_DURATION = 45

local VAR_NEXT_PULSE = 'FeretoryNextPulse'
local VAR_RELICS     = 'FeretoryRelics'
local VAR_TIER       = 'FeretoryTier'

-- Use the Afterglow status so affected players display the afterglow visual,
-- but override its icon to the appropriate Aftermath tier icon.
local FERETORY_EFFECT = xi.effect.AFTERGLOW

-----------------------------------
-- Level 75 relic item IDs
-----------------------------------

local relicItems =
{
    [18264] = true, -- Spharai
    [18270] = true, -- Mandau
    [18276] = true, -- Excalibur
    [18282] = true, -- Ragnarok
    [18288] = true, -- Guttler
    [18294] = true, -- Bravura
    [18306] = true, -- Apocalypse
    [18312] = true, -- Gungnir
    [18318] = true, -- Kikoku
    [18324] = true, -- Amanomurakumo
    [18330] = true, -- Mjollnir
    [18336] = true, -- Claustrum
    [18342] = true, -- Annihilator
    [18348] = true, -- Yoichinoyumi
    [18571] = true, -- Gjallarhorn
    [11928] = true, -- Aegis
}

local relicSlots =
{
    xi.slot.MAIN,
    xi.slot.SUB,
    xi.slot.RANGED,
}

-----------------------------------
-- Recipient job bonus table
-----------------------------------

local relicInspiration =
{
    [xi.job.WAR] = { mod = xi.mod.ENMITY, power = { 10, 25, 50 } },
    [xi.job.MNK] = { mod = xi.mod.COUNTER, power = { 5, 10, 20 } },
    [xi.job.WHM] = { mod = xi.mod.CURE_POTENCY, power = { 5, 10, 20 } },
    [xi.job.BLM] = { mod = xi.mod.MATT, power = { 10, 25, 50 } },
    [xi.job.RDM] = { mod = xi.mod.FASTCAST, power = { 5, 10, 20 } },
    [xi.job.THF] = { mod = xi.mod.CRITHITRATE, power = { 5, 10, 20 } },
    [xi.job.PLD] = { mod = xi.mod.DMG, power = { -3, -6, -10 } },
    [xi.job.DRK] = { mod = xi.mod.ATT, power = { 10, 25, 50 } },
    [xi.job.BST] = { mod = xi.mod.PET_ATK_DEF, power = { 5, 10, 20 } },
    [xi.job.BRD] = { mod = xi.mod.SONG_SPELLCASTING_TIME, power = { -5, -10, -20 } },
    [xi.job.RNG] = { mod = xi.mod.RACC, power = { 10, 25, 50 } },
    [xi.job.SAM] = { mod = xi.mod.STORETP, power = { 5, 10, 20 } },
    [xi.job.NIN] = { mod = xi.mod.EVA, power = { 10, 25, 50 } },
    [xi.job.DRG] = { mod = xi.mod.JUMP_TP_BONUS, power = { 5, 10, 20 } },
    [xi.job.SMN] = { mod = xi.mod.BLOOD_BOON, power = { 5, 10, 20 } },
    [xi.job.BLU] = { mod = xi.mod.BLUE_MAGIC_EFFECT, power = { 10, 25, 50 } },
    [xi.job.COR] = { mod = xi.mod.SNAPSHOT, power = { 5, 10, 20 } },
    [xi.job.PUP] = { mod = xi.mod.AUTO_MELEE_SKILL, power = { 10, 25, 50 } },
    [xi.job.DNC] = { mod = xi.mod.WALTZ_POTENCY, power = { 5, 10, 20 } },
    [xi.job.SCH] = { mod = xi.mod.HELIX_EFFECT, power = { 5, 10, 20 } },
    [xi.job.GEO] = { mod = xi.mod.GEOMANCY_BONUS, power = { 1, 2, 3 } },
    [xi.job.RUN] = { mod = xi.mod.PARRY, power = { 10, 25, 50 } },
}

-----------------------------------
-- Helpers
-----------------------------------

local function debugMessage(player, message)
    if DEBUG_FERETORY then
        player:printToPlayer('[Feretory] ' .. message)
    end
end

local function isRelicItem(itemId)
    return itemId ~= nil and relicItems[itemId] == true
end

local function countEquippedRelics(player)
    local count = 0

    for _, slot in ipairs(relicSlots) do
        if isRelicItem(player:getEquipID(slot)) then
            count = count + 1
        end
    end

    return count
end

local function getTier(relicCount)
    if relicCount >= 5 then
        return 3
    elseif relicCount >= 3 then
        return 2
    elseif relicCount >= 1 then
        return 1
    end

    return 0
end

local function getAftermathIcon(tier)
    return xi.effect['AFTERMATH_LV' .. tier]
end

local function encodePower(power)
    if power < 0 then
        return 65536 + power
    end

    return power
end

local function decodePower(power)
    if power >= 32768 then
        return power - 65536
    end

    return power
end

local function updateRelicSourceState(player)
    player:setLocalVar(VAR_RELICS, countEquippedRelics(player))
end

local function isFeretoryStatusEffect(effect)
    if effect == nil then
        return false
    end

    local tier = effect:getTier()

    return effect:getSubType() ~= 0 and tier >= 1 and tier <= 3 and effect:getPower() == tier
end

local function isEligibleRecipient(source, target)
    if target == nil or not target:isPC() then
        return false
    end

    if source:getZoneID() ~= target:getZoneID() then
        return false
    end

    if source:checkDistance(target) > AURA_RADIUS then
        return false
    end

    return true
end

local function insertEligibleMember(members, source, target)
    if isEligibleRecipient(source, target) then
        table.insert(members, target)
    end
end

local function getEligibleGroupMembers(source)
    local members = {}

    for _, member in ipairs(source:getAlliance()) do
        insertEligibleMember(members, source, member)
    end

    return members
end

local function countNearbyGroupRelics(target)
    local relicCount = 0
    local members = getEligibleGroupMembers(target)

    for _, member in ipairs(members) do
        relicCount = relicCount + countEquippedRelics(member)
    end

    return relicCount
end

local function clearFeretory(target)
    if isFeretoryStatusEffect(target:getStatusEffect(FERETORY_EFFECT)) then
        target:delStatusEffect(FERETORY_EFFECT)
    end

    target:setLocalVar(VAR_TIER, 0)
end

local function applyFeretory(target, relicCount)
    local tier = getTier(relicCount)

    if tier == 0 then
        clearFeretory(target)
        return
    end

    local bonus = relicInspiration[target:getMainJob()]
    if bonus == nil or bonus.mod == nil then
        clearFeretory(target)
        return
    end

    local power = bonus.power[tier]
    if power == nil then
        clearFeretory(target)
        return
    end

    if isFeretoryStatusEffect(target:getStatusEffect(FERETORY_EFFECT)) then
        target:delStatusEffect(FERETORY_EFFECT)
    end

    target:addStatusEffect(FERETORY_EFFECT,
    {
        power    = tier,
        duration = EFFECT_DURATION,
        origin   = target,
        icon     = getAftermathIcon(tier),
        subType  = bonus.mod,
        subPower = encodePower(power),
        tier     = tier,
    })

    target:setLocalVar(VAR_TIER, tier)

    debugMessage(target, string.format(
        'Applied Tier %u. relicCount=%u mod=%u power=%i',
        tier,
        relicCount,
        bonus.mod,
        power
    ))
end

local function refreshFeretory(target)
    updateRelicSourceState(target)

    if not ENABLE_FERETORY then
        clearFeretory(target)
        return
    end

    local relicCount = countNearbyGroupRelics(target)

    debugMessage(target, string.format(
        'Refresh. nearbyRelics=%u equippedRelics=%u',
        relicCount,
        target:getLocalVar(VAR_RELICS)
    ))

    applyFeretory(target, relicCount)
end

-----------------------------------
-- Listener callbacks
-----------------------------------

local function onFeretoryTick(player)
    local now = GetSystemTime()

    if player:getLocalVar(VAR_NEXT_PULSE) > now then
        return
    end

    player:setLocalVar(VAR_NEXT_PULSE, now + PULSE_SECONDS)
    refreshFeretory(player)
end

local function addFeretoryListeners(player)
    player:addListener('TICK', 'FERETORY_TICK', function(playerArg)
        onFeretoryTick(playerArg)
    end)
end

local function initializeFeretory(player)
    clearFeretory(player)
    updateRelicSourceState(player)
    addFeretoryListeners(player)
    player:setLocalVar(VAR_NEXT_PULSE, GetSystemTime() + PULSE_SECONDS)
    refreshFeretory(player)
end

-----------------------------------
-- Afterglow effect hook
-----------------------------------

-- The engine automatically loads regular status-effect scripts from
-- scripts/effects.  Keeping this custom Afterglow behavior in the module means
-- we need to create the effect table before registering the override.
xi.module.ensureTable('xi.effects.afterglow')

m:addOverride('xi.effects.afterglow.onEffectGain', function(target, effect)
    local mod = effect:getSubType()
    local tier = effect:getTier()

    -- Feretory stores its tier in both power and tier, and stores the bonus
    -- modifier in subType.  Leave any unrelated Afterglow use with default
    -- fields untouched.
    if
        mod ~= 0 and
        tier >= 1 and
        tier <= 3 and
        effect:getPower() == tier
    then
        effect:addMod(mod, decodePower(effect:getSubPower()))
    end
end)

-----------------------------------
-- Hook player entry point
-----------------------------------

m:addOverride('xi.player.onGameIn', function(player, firstLogin, zoning)
    super(player, firstLogin, zoning)

    initializeFeretory(player)
end)

return m