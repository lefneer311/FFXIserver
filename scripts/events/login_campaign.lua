-----------------------------------
-- Login Campaign
-- https://www.bg-wiki.com/ffxi/Repeat_Login_Campaign
-----------------------------------
require('scripts/globals/npc_util')
local rewardHelpers = require('scripts/events/login_campaign_rewards')
local registry = require('scripts/events/login_campaign_registry')
-----------------------------------
xi = xi or {}
xi.events = xi.events or {}
xi.events.loginCampaign = xi.events.loginCampaign or {}

local function getJstNow()
    return { year = JstYear(), month = JstMonth(), day = JstDayOfTheMonth(), hour = JstHour() }
end

local function isEnabled()
    return xi.settings.main.ENABLE_LOGIN_CAMPAIGN == 1
end

local function getEarnCampaign()
    if isEnabled() then
        return registry.getEarnCampaign(getJstNow())
    end
end

local function getRedeemCampaign()
    if isEnabled() then
        return registry.getRedeemCampaign(getJstNow())
    end
end

-- Checks if a Login Campaign is active.
xi.events.loginCampaign.canEarnPoints = function()
    return getEarnCampaign() ~= nil
end

xi.events.loginCampaign.canExchangePoints = function()
    return getRedeemCampaign() ~= nil
end

-- Gives Login Points once a day.
xi.events.loginCampaign.onGameIn = function(player)
    local campaign = getEarnCampaign()
    if campaign == nil then
        return
    end

    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local loginPoints = player:getCurrency('login_points')

    local playercMonth = player:getCharVar('LoginCampaignMonth')
    local playercYear  = player:getCharVar('LoginCampaignYear')
    local playercId    = player:getCharVar('LoginCampaignId')
    local nextMidnight = player:getCharVar('LoginCampaignNextMidnight')
    local loginCount   = player:getCharVar('LoginCampaignLoginNumber')

    -- Carry last months points if there's any
    if
        playercId ~= campaign.id and
        (playercMonth ~= campaign.displayMonth or playercYear ~= campaign.displayYear)
    then
        if loginPoints > 1500 then
            player:setCurrency('login_points', 1500)
            player:messageSpecial(ID.text.CARRIED_OVER_POINTS, 0, 1500)
        elseif loginPoints ~= 0 then
            player:messageSpecial(ID.text.CARRIED_OVER_POINTS, 0, loginPoints)
        end

        player:setCharVar('LoginCampaignMonth', campaign.displayMonth)
        player:setCharVar('LoginCampaignYear', campaign.displayYear)
        player:setCharVar('LoginCampaignId', campaign.id)
        loginCount = 0
    elseif playercId ~= campaign.id then
        player:setCharVar('LoginCampaignId', campaign.id)
    end

    -- Show Info about campaign (month, year, login time)
    if nextMidnight ~= JstMidnight() then
        player:messageSpecial(ID.text.LOGIN_CAMPAIGN_UNDERWAY, campaign.displayYear, campaign.displayMonth)

        if loginCount == 0 then
            loginCount = 1
        else
            loginCount = loginCount + 1
        end

        player:setCharVar('LoginCampaignNextMidnight', JstMidnight())

        -- adds currency
        if loginCount == 1 then
            player:addCurrency('login_points', 500)
            player:messageSpecial(ID.text.LOGIN_NUMBER, 0, loginCount, 500, player:getCurrency('login_points'))
        else
            player:addCurrency('login_points', 100)
            player:messageSpecial(ID.text.LOGIN_NUMBER, 0, loginCount, 100, player:getCurrency('login_points'))
        end

        player:setCharVar('LoginCampaignLoginNumber', loginCount)
    end
end

-- Beginning of CS with Greeter Moogle.
-- Handles showing the correct list of prices and hiding the options that are not available
xi.events.loginCampaign.onTrigger = function(player, csid)
    local campaign = getRedeemCampaign()
    if campaign == nil then
        -- TODO: What do the moogles do when the campaign isn't active?
        return
    end

    local loginPoints = player:getCurrency('login_points')
    local cDate = bit.bor(campaign.displayYear, bit.lshift(campaign.displayMonth, 28))
    local priceBit1, priceBit2, priceBit3, priceBit4, priceShift = rewardHelpers.packTierPrices(campaign.rewards)
    local hideOptions = rewardHelpers.getHideOptions(priceShift)

    -- Eight param is not used/unknown
    player:startEvent(csid, cDate, loginPoints, priceBit1, priceBit2, priceBit3, priceBit4, hideOptions)
end

-- Shows list of items depending on option selected.
-- It also is in charge of purchasing selected item.
xi.events.loginCampaign.onEventUpdate = function(player, csid, option, npc)
    local campaign = getRedeemCampaign()
    if campaign == nil then
        return
    end

    local showItems    = bit.band(option, 31) -- first 32 bits are for showing correct item list
    local itemSelected = bit.band(bit.rshift(option, 5), 31)
    local itemQuantity = bit.band(bit.rshift(option, 11), 511)
    local loginPoints  = player:getCurrency('login_points')
    local prizes       = campaign.rewards

    if rewardHelpers.isValidTierKey(showItems) then
        local tier = prizes[showItems]
        if tier == nil then
            return
        end

        local items = rewardHelpers.getPaddedItems(tier)

        player:updateEvent(
            bit.bor(items[1], bit.lshift(items[2], 16)),
            bit.bor(items[3], bit.lshift(items[4], 16)),
            bit.bor(items[5], bit.lshift(items[6], 16)),
            bit.bor(items[7], bit.lshift(items[8], 16)),
            bit.bor(items[9], bit.lshift(items[10], 16)),
            bit.bor(items[11], bit.lshift(items[12], 16)),
            bit.bor(items[13], bit.lshift(items[14], 16)),
            bit.bor(items[15], bit.lshift(items[16], 16)))

    elseif rewardHelpers.isValidTierKey(showItems - 1) then
        local tier = prizes[showItems - 1]
        if tier == nil then
            return
        end

        local price          = tier.price
        local totalItemsMask = (2 ^ 20 - 1) - (2 ^ #tier.items - 1) -- Uses 20 bits and sets to 1 for items not used.
        local items          = rewardHelpers.getPaddedItems(tier)

        player:updateEvent(
            bit.bor(items[17], bit.lshift(items[18], 16)),
            bit.bor(items[19], bit.lshift(items[20], 16)),
            totalItemsMask,
            price,
            loginPoints)

    elseif rewardHelpers.isValidTierKey(showItems - 2) then
        local tier = prizes[showItems - 2]
        if tier == nil then
            return
        end

        local item = tier.items[itemSelected + 1]
        if item == nil or item == 0 or itemQuantity < 1 then
            return
        end

        local loginPointCost = tier.price * itemQuantity
        if loginPointCost > loginPoints then
            return
        end

        if npcUtil.giveItem(player, { { item, itemQuantity } }) then
            player:delCurrency('login_points', loginPointCost)
            player:updateEvent(
                item,
                player:getCurrency('login_points'), -- Login Points after purchase
                0, -- Unknown (most likely totalItemMask)
                tier.price,
                loginPoints) -- Login points before purchase
        end
    end
end
