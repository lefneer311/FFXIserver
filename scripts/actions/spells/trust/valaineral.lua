-----------------------------------
-- Trust: Valaineral
-- Very powerful at low levels due to his special ability letting him use Uriel Blade before he has access to it as a normal weapon skill (lv.50).
-- Uriel Blade can be used under 1000 TP based on certain conditions, making him excellent at engaging multiple targets.
-- Casts Protect spells on himself under the effect of Majesty with the added defense of Shield Barrier
-- Uses weapon skills randomly around 2000 TP and does not try to close skillchains.
-- Possesses Enmity+, Cure Potency Bonus +50%, Spell interruption rate decrease, Refresh+ (+3mp/tick Auto) and Damage Taken -8%, HP+10%, MP+20%
-----------------------------------
---@type TSpellTrust
local spellObject = {}

local urielBladeId = 238

local function addRetailStats(mob)
    mob:setMobMod(xi.mobMod.CAN_SHIELD_BLOCK, 1)
    mob:setMobMod(xi.mobMod.CAN_PARRY, 3)
    mob:setMod(xi.mod.SHIELDBLOCKRATE, 45) -- 45% base block rate for size 3
    mob:addMod(xi.mod.ENMITY, 20)
    mob:addMod(xi.mod.CURE_POTENCY, 50)
    mob:addMod(xi.mod.SPELLINTERRUPT, 50)
    mob:addMod(xi.mod.REFRESH, 3)
    mob:addMod(xi.mod.DMG, -8)
    mob:addMod(xi.mod.HPP, 10)
    mob:addMod(xi.mod.MPP, 20)
end

local function addSelfBuffGambits(mob)
    mob:addGambit(ai.t.SELF,
    {
        { ai.c.NOT_STATUS, xi.effect.MAJESTY },
        { ai.c.NOT_STATUS, xi.effect.PROTECT },
    },
    { ai.r.JA, ai.s.SPECIFIC, xi.ja.MAJESTY })

    mob:addGambit(ai.t.SELF,
        { ai.c.NOT_STATUS, xi.effect.PROTECT },
        { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECT })

    mob:addGambit(ai.t.SELF,
        { ai.c.NOT_STATUS, xi.effect.REPRISAL },
        { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.REPRISAL })

    mob:addGambit(ai.t.SELF,
        { ai.c.NOT_STATUS, xi.effect.ENLIGHT },
        { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ENLIGHT })

    mob:addGambit(ai.t.SELF,
        { ai.c.NOT_STATUS, xi.effect.PHALANX },
        { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PHALANX })
end

local function addEnmityGambits(mob)
    mob:addGambit(ai.t.SELF,
        { ai.c.NOT_HAS_TOP_ENMITY, 0 },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE })

    mob:addGambit(ai.t.TARGET,
        { ai.c.NOT_STATUS, xi.effect.FLASH },
        { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH })
end

local function addDefensiveJAGambits(mob)
    mob:addGambit(ai.t.SELF,
        { ai.c.NOT_STATUS, xi.effect.DEFENDER },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.DEFENDER })

    mob:addGambit(ai.t.SELF,
        {
            { ai.c.NOT_STATUS, xi.effect.SENTINEL },
            { ai.c.NOT_STATUS, xi.effect.PALISADE },
        },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL })

    mob:addGambit(ai.t.SELF,
        {
            { ai.c.NOT_STATUS, xi.effect.PALISADE },
            { ai.c.NOT_STATUS, xi.effect.SENTINEL },
        },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.PALISADE })

    mob:addGambit(ai.t.SELF,
        {
            { ai.c.MPP_LT, 50 },
            { ai.c.TP_GTE, 1000 },
        },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.CHIVALRY })

    mob:addGambit(ai.t.TARGET,
        { ai.c.STATUS, xi.effect.CHAINSPELL },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART })

    mob:addGambit(ai.t.TARGET,
        { ai.c.STATUS, xi.effect.MANAFONT },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART })

    mob:addGambit(ai.t.TARGET,
        { ai.c.STATUS, xi.effect.ASTRAL_FLOW },
        { ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART })
end

local function addCureGambits(mob)
    mob:addGambit(ai.t.SELF,
        { ai.c.HPP_LT, 75 },
        {
            { ai.r.JA, ai.s.SPECIFIC, xi.ja.MAJESTY },
            { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE },
        })

    mob:addGambit(ai.t.PARTY,
        { ai.c.HPP_LT, 50 },
        {
            { ai.r.JA, ai.s.SPECIFIC, xi.ja.MAJESTY },
            { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE },
        })
end

local function buildValaineralWSWeights(mob)
    local mainSkill = mob:getSkillLevel(xi.skill.SWORD)
    local weights = {}

    if mainSkill >= 154 then
        weights[238] = 5 -- Uriel Blade, PLD level 50
    end

    if mainSkill >= 149 then
        weights[38] = 1 -- Circle Blade, PLD level 49
    end

    if mainSkill >= 240 then
        weights[42] = 5 -- Savage Blade, PLD level 68
    end

    if mainSkill >= 300 then
        weights[47] = 1 -- Sanguine Blade, PLD level 80
    end

    return weights
end

-- To-do: revisit shield barrier values for ilvl once available;
local function buildShieldMasterPower(mob)
    local lvl = mob:getMainLvl()
    local shieldMasteryPower = 0

    if lvl >= 96 then
        shieldMasteryPower = 40
    elseif lvl >= 75 then
        shieldMasteryPower = 30
    elseif lvl >= 50 then
        shieldMasteryPower = 20
    elseif lvl >= 25 then
        shieldMasteryPower = 10
    end

    return shieldMasteryPower
end

local function buildShieldDefensePower(mob)
    -- Valaineral uses a size 3 shield, numbers are based on common shield values at these levels
    local lvl = mob:getMainLvl()
    local shieldDefensePower = 0

    if lvl >= 99 then
        shieldDefensePower = 35 -- Adamas
    elseif lvl >= 80 then
        shieldDefensePower = 31 -- Gleaming Shield
    elseif lvl >= 75 then
        shieldDefensePower = 22 -- Koenig Shield
    elseif lvl >= 70 then
        shieldDefensePower = 18 -- Diamond Shield
    end

    return shieldDefensePower
end

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onMobSpawn = function(mob)

    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    -- Gambits appear to be evaluated in order. This ordering makes
    -- enmity actions take priority over cure actions when both qualify.
    addRetailStats(mob)
    mob:setMod(xi.mod.SHIELD_MASTERY_TP, buildShieldMasterPower(mob))
    mob:setMod(xi.mod.SHIELD_BARRIER, buildShieldDefensePower(mob))

    addEnmityGambits(mob)
    addDefensiveJAGambits(mob)
    addCureGambits(mob)
    addSelfBuffGambits(mob)

    -- Dynamically build a weighted weaponskill table based on current
    -- combat skill rating eligibility.
    mob:setTrustTPWeaponSkillWeights(buildValaineralWSWeights(mob))
    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.WEIGHTED_WS, 2000)

    mob:addListener('WEAPONSKILL_USE', 'VALAINERAL_SPECIAL_MESSAGE', function(mobArg, target, skill)
        if skill:getID() == urielBladeId then
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end

        local pendingTpBonus = mobArg:getLocalVar('[trust]valaineral_uriel_tp_bonus')
        if pendingTpBonus > 0 then
            mobArg:delMod(xi.mod.TP_BONUS, pendingTpBonus)
            mobArg:setLocalVar('[trust]valaineral_uriel_tp_bonus', 0)
        end
    end)

    mob:addListener('COMBAT_TICK', 'VALAINERAL_SPECIAL', function(mobArg, target, wsid, tp, action)
        if
            not mobArg:canUseAbilities() or
            mobArg:getCurrentAction() ~= xi.action.category.BASIC_ATTACK
        then
            return
        end

        local now = GetSystemTime()
        local nextUrielAttempt = mobArg:getLocalVar('[trust]valaineral_uriel_next')
        if now < nextUrielAttempt then
            return
        end

        -- Force Uriel Blade only against the mob that is threatening the
        -- master, and only when that mob is in melee range.
        local forceTarget = mobArg:getTrustMasterThreatMob(22)
        if forceTarget and forceTarget:isMob() and forceTarget:isAlive() then
            local distanceToForceTarget = mobArg:checkDistance(forceTarget)
            local meleeRangeToForceTarget = mobArg:getMeleeRange(forceTarget)

            -- Do not fall back to the current target. If the qualifying mob
            -- is not in range yet, wait for a later tick.
            if distanceToForceTarget <= (meleeRangeToForceTarget + 0.5) then
                local currentTP = mobArg:getTP()
                local neededBonus = 0

                -- Retail damage observations suggest that when Valaineral
                -- uses Uriel Blade below 1000 TP, TP is normalized to 1000
                -- for fTP calculation.
                local pendingTpBonus = mobArg:getLocalVar('[trust]valaineral_uriel_tp_bonus')
                if pendingTpBonus > 0 then
                    mobArg:delMod(xi.mod.TP_BONUS, pendingTpBonus)
                    mobArg:setLocalVar('[trust]valaineral_uriel_tp_bonus', 0)
                end

                if currentTP < 1000 then
                    neededBonus = 1000 - currentTP
                    mobArg:addMod(xi.mod.TP_BONUS, neededBonus)
                    mobArg:setLocalVar('[trust]valaineral_uriel_tp_bonus', neededBonus)
                end

                mobArg:setLocalVar('[trust]valaineral_uriel_next', now + 8)
                mobArg:useWeaponSkill(urielBladeId, forceTarget)
                return
            end

            return
        end

        -- Use Divine Emblem before casting Flash if Flash is available,
        -- Divine Emblem is available, and the target does not already
        -- have Flash.
        local currentTarget = mobArg:getTarget()
        if
            currentTarget and
            not currentTarget:hasStatusEffect(xi.effect.FLASH) and
            not mobArg:hasRecast(xi.recast.MAGIC, xi.magic.spell.FLASH) and
            not mobArg:hasRecast(xi.recast.ABILITY, xi.ja.DIVINE_EMBLEM) and
            not mobArg:hasStatusEffect(xi.effect.DIVINE_EMBLEM)
        then
            mobArg:useJobAbility(xi.ja.DIVINE_EMBLEM, mobArg)
        end
    end)

    --[[ Remove the comment block to enable
    This listener adds the additional light damage
    effect to Valaineral's Hauteclaire. It is a flavor mod
    and only matches his WotG battlefield behavior.
    mob:addListener('ATTACK', 'VALAINERAL_ATTACKS', function(mobArg, target, action)
        if not target or not action then
            return
        end

        local targetID = target:getID()
        local actionMsg = action:getMsg(targetID)

        if actionMsg ~= xi.msg.basic.HIT_DMG and actionMsg ~= xi.msg.basic.HIT_CRIT then
            return
        end

        local divineSkill = mobArg:getSkillLevel(xi.skill.DIVINE_MAGIC)

        -- Enlight-style formula to determine maximum potency.
        local maxPower = math.floor((((divineSkill / 20) * 3) + 12) - (divineSkill / 40))

        -- Roll 85% to 100% of max for damage variation.
        local minPower = math.floor(maxPower * 0.85)
        local rolledPower = math.random(minPower, maxPower)

        local addEffect, message, damage = xi.combat.action.executeAddEffectDamage(mobArg, target, {
            chance         = 95,
            attackType     = xi.attackType.MAGICAL,
            magicalElement = xi.element.LIGHT,
            basePower      = rolledPower,
            canMAB         = false,
            canResist      = false,
        })

        if addEffect > 0 and damage > 0 then
            action:additionalEffect(targetID, addEffect)
            action:addEffectMessage(targetID, message)
            action:addEffectParam(targetID, damage)
        end
    end)
    ]]
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
    mob:removeListener('VALAINERAL_ATTACKS')
    mob:removeListener('VALAINERAL_SPECIAL')
    mob:removeListener('VALAINERAL_SPECIAL_MESSAGE')

    local pendingTpBonus = mob:getLocalVar('[trust]valaineral_uriel_tp_bonus')
    if pendingTpBonus > 0 then
        mob:delMod(xi.mod.TP_BONUS, pendingTpBonus)
        mob:setLocalVar('[trust]valaineral_uriel_tp_bonus', 0)
    end
end

spellObject.onMobDeath = function(mob)