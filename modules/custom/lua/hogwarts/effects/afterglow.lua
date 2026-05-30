-----------------------------------
-- xi.effect.AFTERGLOW
-----------------------------------
---@type TEffect
local effectObject = {}

local function decodePower(power)
    if power >= 32768 then
        return power - 65536
    end

    return power
end

effectObject.onEffectGain = function(target, effect)
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
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
