-- modules/custom/lua/hogwarts/trust_mods/rhapsody/trust_buff.lua
local M = {}

M.ZONES = {
    [xi.zone.RIVERNE_SITE_A01] = true,
    [xi.zone.SEALIONS_DEN]     = true,
}

-- Key Item Gate: Rhapsody in White
local REQUIRED_KI = xi.ki.RHAPSODY_IN_WHITE

local function clamp(v, lo, hi)
    if v < lo then return lo end
    if v > hi then return hi end
    return v
end

local function shouldApply(player)
    if player == nil then return false end
    if not player:hasKeyItem(REQUIRED_KI) then return false end
    if not M.ZONES[player:getZoneID()] then return false end
    return true
end

local function getSupportValues(player)
    local lvl = player:getMainLvl()

    -- Keep <=70 if you want future capped content support; whitelist prevents leakage.
    if lvl > 76 then
        return nil
    end

    -- Reliability: modest and capped
    local acc  = clamp(math.floor(lvl / 3), 8, 18)  -- 30->10, 40->13, 70->18 cap
    local macc = clamp(math.floor(lvl / 3), 8, 18)

    -- Survivability: AoE forgiveness is the main lever
    local dmgAoe = -clamp(math.floor(lvl / 4), 6, 15) -- 30->-7, 40->-10, 70->-15 cap

    -- Small general DT to reduce random spikes, kept modest
    local dmg    = -clamp(math.floor(lvl / 18), 1, 5) -- 30->-1, 40->-2, 70->-3/-4 cap

    -- Small sustain; avoid immortality
    local regen  = clamp(math.floor(lvl / 25), 1, 2)  -- 30->1, 40->1, 70->2

    return {
        acc    = acc,
        macc   = macc,
        dmgAoe = dmgAoe,
        dmg    = dmg,
        regen  = regen,
    }
end

local function apply(trust, v)
    trust:addMod(xi.mod.ACC, v.acc)
    trust:addMod(xi.mod.MACC, v.macc)
    trust:addMod(xi.mod.DMG_AOE, v.dmgAoe)
    trust:addMod(xi.mod.DMG, v.dmg)
    trust:addMod(xi.mod.REGEN, v.regen)
end

function M.tryApplyToTrust(player, trust)
    if trust == nil or player == nil then
        return false
    end

    if not shouldApply(player) then
        return false
    end

    local v = getSupportValues(player)
    if v == nil then
        return false
    end

    apply(trust, v)
    return true
end

return M