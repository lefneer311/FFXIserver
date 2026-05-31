-----------------------------------
-- Login Campaign Reward Helpers
-----------------------------------
xi = xi or {}
xi.events = xi.events or {}
xi.events.loginCampaign = xi.events.loginCampaign or {}
xi.events.loginCampaign.rewards = xi.events.loginCampaign.rewards or {}

local validTierKeys =
{
    [1]  = true,
    [5]  = true,
    [9]  = true,
    [13] = true,
    [17] = true,
    [21] = true,
    [25] = true,
    [29] = true,
}

local tierSlots = { 1, 5, 9, 13, 17, 21, 25, 29 }

local function isInteger(value)
    return type(value) == 'number' and value == math.floor(value)
end

xi.events.loginCampaign.rewards.tierSlots = tierSlots

xi.events.loginCampaign.rewards.isValidTierKey = function(tierKey)
    return validTierKeys[tierKey] == true
end

xi.events.loginCampaign.rewards.validateTier = function(tierKey, tier)
    if not validTierKeys[tierKey] then
        return false, string.format('invalid tier key %s', tostring(tierKey))
    end

    if type(tier) ~= 'table' then
        return false, string.format('tier %u is not a table', tierKey)
    end

    if not isInteger(tier.price) or tier.price <= 0 then
        return false, string.format('tier %u has invalid price', tierKey)
    end

    if type(tier.items) ~= 'table' then
        return false, string.format('tier %u has invalid items table', tierKey)
    end

    local itemCount = #tier.items
    if itemCount < 1 or itemCount > 20 then
        return false, string.format('tier %u has %u items; expected 1-20', tierKey, itemCount)
    end

    local seenItems = {}
    for index, itemId in ipairs(tier.items) do
        if not isInteger(itemId) or itemId <= 0 then
            return false, string.format('tier %u item %u has invalid item id', tierKey, index)
        end

        if seenItems[itemId] then
            return false, string.format('tier %u contains duplicate item id %u', tierKey, itemId)
        end

        seenItems[itemId] = true
    end

    return true
end

xi.events.loginCampaign.rewards.validatePrizes = function(prizes)
    if type(prizes) ~= 'table' then
        return false, 'prizes must be a table'
    end

    local tierCount = 0
    for tierKey, tier in pairs(prizes) do
        tierCount = tierCount + 1
        local isValid, errorMessage = xi.events.loginCampaign.rewards.validateTier(tierKey, tier)
        if not isValid then
            return false, errorMessage
        end
    end

    if tierCount == 0 then
        return false, 'prizes must contain at least one tier'
    end

    return true
end

xi.events.loginCampaign.rewards.packTierPrices = function(prizes)
    local priceShift = {}

    for index, tierKey in ipairs(tierSlots) do
        local tier = prizes[tierKey]
        local price = tier and tier.price or 0
        priceShift[index] = index % 2 == 0 and bit.lshift(price, 16) or price
    end

    return
        bit.bor(priceShift[1], priceShift[2]),
        bit.bor(priceShift[3], priceShift[4]),
        bit.bor(priceShift[5], priceShift[6]),
        bit.bor(priceShift[7], priceShift[8]),
        priceShift
end

xi.events.loginCampaign.rewards.getHideOptions = function(priceShift)
    local hideOptions = 0

    for index = 1, #priceShift do
        if priceShift[index] == 0 then
            hideOptions = bit.bor(hideOptions, bit.lshift(1, index - 1))
        end
    end

    return hideOptions
end

xi.events.loginCampaign.rewards.getPaddedItems = function(tier)
    local items = {}

    for index = 1, 20 do
        items[index] = tier.items[index] or 0
    end

    return items
end

xi.events.loginCampaign.rewards.getTierForOption = function(prizes, option, offset)
    local tierKey = option - offset
    if not validTierKeys[tierKey] then
        return nil, tierKey
    end

    return prizes[tierKey], tierKey
end

return xi.events.loginCampaign.rewards
