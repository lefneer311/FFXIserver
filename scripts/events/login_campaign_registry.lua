-----------------------------------
-- Login Campaign Registry
-----------------------------------
require('scripts/events/login_campaign_rewards')
-----------------------------------
xi = xi or {}
xi.events = xi.events or {}
xi.events.loginCampaign = xi.events.loginCampaign or {}
xi.events.loginCampaign.registry = xi.events.loginCampaign.registry or {}

local campaigns =
{
    {
        id           = 202506,
        name         = 'June 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 6,
        earnStart    = { year = 2025, month = 6, day = 11, hour = 17 },
        earnEnd      = { year = 2025, month = 7, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 7, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2025_06'),
    },
}

local function validateCampaign(campaign)
    if type(campaign) ~= 'table' then
        return false, 'campaign entry is not a table'
    end

    if type(campaign.id) ~= 'number' or campaign.id ~= math.floor(campaign.id) then
        return false, 'campaign id must be an integer'
    end

    if type(campaign.displayYear) ~= 'number' or type(campaign.displayMonth) ~= 'number' then
        return false, string.format('campaign %u has invalid display date', campaign.id)
    end

    if
        not utils.timeIsBefore(campaign.earnStart, campaign.earnEnd) or
        not utils.timeIsBefore(campaign.earnEnd, campaign.redeemEnd)
    then
        return false, string.format('campaign %u has invalid time windows', campaign.id)
    end

    return xi.events.loginCampaign.rewards.validatePrizes(campaign.rewards)
end

xi.events.loginCampaign.registry.getCampaigns = function()
    return campaigns
end

xi.events.loginCampaign.registry.validateCampaigns = function()
    local seenIds = {}

    for _, campaign in ipairs(campaigns) do
        if seenIds[campaign.id] then
            return false, string.format('duplicate campaign id %u', campaign.id)
        end

        seenIds[campaign.id] = true

        local isValid, errorMessage = validateCampaign(campaign)
        if not isValid then
            return false, errorMessage
        end
    end

    return true
end

xi.events.loginCampaign.registry.getEarnCampaign = function(jstNow)
    for _, campaign in ipairs(campaigns) do
        if
            utils.timeIsAfterOrEqual(jstNow, campaign.earnStart) and
            utils.timeIsBefore(jstNow, campaign.earnEnd)
        then
            return campaign
        end
    end
end

xi.events.loginCampaign.registry.getRedeemCampaign = function(jstNow)
    for _, campaign in ipairs(campaigns) do
        if
            utils.timeIsAfterOrEqual(jstNow, campaign.earnStart) and
            utils.timeIsBefore(jstNow, campaign.redeemEnd)
        then
            return campaign
        end
    end
end

xi.events.loginCampaign.registry.getCampaignById = function(id)
    for _, campaign in ipairs(campaigns) do
        if campaign.id == id then
            return campaign
        end
    end
end

xi.events.loginCampaign.registry.getLatestCampaign = function()
    return campaigns[#campaigns]
end

local isValid, errorMessage = xi.events.loginCampaign.registry.validateCampaigns()
if not isValid then
    error(string.format('Invalid login campaign registry: %s', errorMessage))
end

return xi.events.loginCampaign.registry
