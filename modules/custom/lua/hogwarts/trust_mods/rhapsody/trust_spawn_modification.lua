------------------------------------------------------------------
--                  Trust Spawn Mod
------------------------------------------------------------------
require('modules/module_utils')
require('scripts/globals/trust') -- ensures xi.trust exists
require('scripts/globals/roe')   -- needed for xi.roe usage (trust.lua requires it too)

local rhapsody = require('modules/custom/lua/hogwarts/trust_mods/rhapsody/trust_buff')

local m = Module:new('Rhapsody_Trust_Buff')

m:addOverride('xi.trust.spawn', function(caster, spell)
    local trustId = spell:getID()
    -- caster:printToPlayer("DEBUG: xi.trust.spawn override entered (trustId=" .. trustId .. ")", 0)

    -- IMPORTANT: preserve base behavior
    local result = super(caster, spell)

    local function findSpawnedTrust()
        local party = caster:getPartyWithTrusts()
        if not party then
            return nil
        end

        for _, member in pairs(party) do
            if member:getObjType() == xi.objType.TRUST and member:getTrustID() == trustId then
                return member
            end
        end
        return nil
    end

	local function tryApply()
		local trust = findSpawnedTrust()
		if not trust then
			return false
		end

		if rhapsody.tryApplyToTrust(caster, trust) then
			caster:printToPlayer(
				"I can hear clearly -- the gentle Rhapsody of the Mothercrystal.",
				0,
				trust:getPacketName()
			)
			return true
		end

		return false
	end

    -- Try immediately (post-hook case)
    if tryApply() then
        return result
    end

    -- Retry a few times (covers timing + pre-hook-ish behavior + party state lag)
    local attempts = 0
    local function retry()
        attempts = attempts + 1

        -- caster:printToPlayer("DEBUG: retry " .. attempts .. " for trustId=" .. trustId, 0)

        if tryApply() then
            return
        end

        if attempts < 6 then
            caster:timer(100, retry)
        end
    end

    caster:timer(100, retry)

    return result
end)

return m