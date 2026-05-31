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
        id           = 202401,
        name         = 'January 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 1,
        earnStart    = { year = 2024, month = 1, day = 11, hour = 0 },
        earnEnd      = { year = 2024, month = 2, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 2, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_01'),
    },

    {
        id           = 202402,
        name         = 'February 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 2,
        earnStart    = { year = 2024, month = 2, day = 14, hour = 0 },
        earnEnd      = { year = 2024, month = 3, day = 5, hour = 23 },
        redeemEnd    = { year = 2024, month = 3, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_02'),
    },

    {
        id           = 202403,
        name         = 'March 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 3,
        earnStart    = { year = 2024, month = 3, day = 12, hour = 0 },
        earnEnd      = { year = 2024, month = 4, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 4, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_03'),
    },

    {
        id           = 202404,
        name         = 'April 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 4,
        earnStart    = { year = 2024, month = 4, day = 11, hour = 0 },
        earnEnd      = { year = 2024, month = 5, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 5, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_04'),
    },

    {
        id           = 202405,
        name         = 'May 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 5,
        earnStart    = { year = 2024, month = 5, day = 14, hour = 0 },
        earnEnd      = { year = 2024, month = 6, day = 3, hour = 23 },
        redeemEnd    = { year = 2024, month = 6, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_05'),
    },

    {
        id           = 202406,
        name         = 'June 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 6,
        earnStart    = { year = 2024, month = 6, day = 11, hour = 0 },
        earnEnd      = { year = 2024, month = 7, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 7, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_06'),
    },

    {
        id           = 202407,
        name         = 'July 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 7,
        earnStart    = { year = 2024, month = 7, day = 11, hour = 0 },
        earnEnd      = { year = 2024, month = 8, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 8, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_07'),
    },

    {
        id           = 202408,
        name         = 'August 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 8,
        earnStart    = { year = 2024, month = 8, day = 14, hour = 0 },
        earnEnd      = { year = 2024, month = 9, day = 4, hour = 23 },
        redeemEnd    = { year = 2024, month = 9, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_08'),
    },

    {
        id           = 202409,
        name         = 'September 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 9,
        earnStart    = { year = 2024, month = 9, day = 11, hour = 0 },
        earnEnd      = { year = 2024, month = 10, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 10, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_09'),
    },

    {
        id           = 202410,
        name         = 'October 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 10,
        earnStart    = { year = 2024, month = 10, day = 11, hour = 0 },
        earnEnd      = { year = 2024, month = 11, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 11, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_10'),
    },

    {
        id           = 202411,
        name         = 'November 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 11,
        earnStart    = { year = 2024, month = 11, day = 12, hour = 0 },
        earnEnd      = { year = 2024, month = 12, day = 2, hour = 23 },
        redeemEnd    = { year = 2024, month = 12, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_11'),
    },

    {
        id           = 202412,
        name         = 'December 2024 Login Campaign',
        displayYear  = 2024,
        displayMonth = 12,
        earnStart    = { year = 2024, month = 12, day = 11, hour = 0 },
        earnEnd      = { year = 2025, month = 1, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 1, day = 8, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2024_12'),
    },

    {
        id           = 202501,
        name         = 'January 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 1,
        earnStart    = { year = 2025, month = 1, day = 10, hour = 0 },
        earnEnd      = { year = 2025, month = 2, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 2, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2025_01'),
    },

    {
        id           = 202502,
        name         = 'February 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 2,
        earnStart    = { year = 2025, month = 2, day = 13, hour = 0 },
        earnEnd      = { year = 2025, month = 3, day = 4, hour = 23 },
        redeemEnd    = { year = 2025, month = 3, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2025_02'),
    },

    {
        id           = 202503,
        name         = 'March 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 3,
        earnStart    = { year = 2025, month = 3, day = 11, hour = 0 },
        earnEnd      = { year = 2025, month = 4, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 4, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2025_03'),
    },

    {
        id           = 202504,
        name         = 'April 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 4,
        earnStart    = { year = 2025, month = 4, day = 11, hour = 0 },
        earnEnd      = { year = 2025, month = 5, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 5, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2025_04'),
    },

    {
        id           = 202505,
        name         = 'May 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 5,
        earnStart    = { year = 2025, month = 5, day = 13, hour = 17 },
        earnEnd      = { year = 2025, month = 6, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 6, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2025_05'),
    },

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

    {
        id           = 202507,
        name         = 'July 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 7,
        earnStart    = { year = 2025, month = 7, day = 11, hour = 17 },
        earnEnd      = { year = 2025, month = 8, day = 4, hour = 23 },
        redeemEnd    = { year = 2025, month = 8, day = 12, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2025_07'),
    },

    {
        id           = 202508,
        name         = 'August 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 8,
        earnStart    = { year = 2025, month = 8, day = 13, hour = 17 },
        earnEnd      = { year = 2025, month = 9, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 9, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2025_08'),
    },

    {
        id           = 202509,
        name         = 'September 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 9,
        earnStart    = { year = 2025, month = 9, day = 11, hour = 17 },
        earnEnd      = { year = 2025, month = 10, day = 1, hour = 23 },
        redeemEnd    = { year = 2025, month = 10, day = 9, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2025_09'),
    },

    {
        id           = 202510,
        name         = 'October 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 10,
        earnStart    = { year = 2025, month = 10, day = 10, hour = 17 },
        earnEnd      = { year = 2025, month = 11, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 11, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2025_10'),
    },

    {
        id           = 202511,
        name         = 'November 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 11,
        earnStart    = { year = 2025, month = 11, day = 11, hour = 17 },
        earnEnd      = { year = 2025, month = 12, day = 2, hour = 23 },
        redeemEnd    = { year = 2025, month = 12, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2025_11'),
    },

    {
        id           = 202512,
        name         = 'December 2025 Login Campaign',
        displayYear  = 2025,
        displayMonth = 12,
        earnStart    = { year = 2025, month = 12, day = 11, hour = 17 },
        earnEnd      = { year = 2026, month = 1, day = 4, hour = 23 },
        redeemEnd    = { year = 2026, month = 1, day = 12, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2025_12'),
    },

    {
        id           = 202601,
        name         = 'January 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 1,
        earnStart    = { year = 2026, month = 1, day = 14, hour = 17 },
        earnEnd      = { year = 2026, month = 2, day = 1, hour = 23 },
        redeemEnd    = { year = 2026, month = 2, day = 8, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2026_01'),
    },

    {
        id           = 202602,
        name         = 'February 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 2,
        earnStart    = { year = 2026, month = 2, day = 10, hour = 17 },
        earnEnd      = { year = 2026, month = 3, day = 2, hour = 23 },
        redeemEnd    = { year = 2026, month = 3, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2026_02'),
    },

    {
        id           = 202603,
        name         = 'March 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 3,
        earnStart    = { year = 2026, month = 3, day = 11, hour = 17 },
        earnEnd      = { year = 2026, month = 3, day = 29, hour = 23 },
        redeemEnd    = { year = 2026, month = 4, day = 5, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2026_03'),
    },

    {
        id           = 202604,
        name         = 'April 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 4,
        earnStart    = { year = 2026, month = 4, day = 7, hour = 17 },
        earnEnd      = { year = 2026, month = 5, day = 1, hour = 23 },
        redeemEnd    = { year = 2026, month = 5, day = 10, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2026_04'),
    },

    {
        id           = 202605,
        name         = 'May 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 5,
        earnStart    = { year = 2026, month = 5, day = 12, hour = 17 },
        earnEnd      = { year = 2026, month = 6, day = 2, hour = 23 },
        redeemEnd    = { year = 2026, month = 6, day = 9, hour = 23 },
        rewards      = require('scripts/events/login_campaigns/2026_05'),
    },

    {
        id           = 202606,
        name         = 'June 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 6,
        earnStart    = { year = 2026, month = 6, day = 11, hour = 17 },
        earnEnd      = { year = 2026, month = 7, day = 2, hour = 23 },
        redeemEnd    = { year = 2026, month = 7, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2026_06'),
    },

    {
        id           = 202607,
        name         = 'July 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 7,
        earnStart    = { year = 2026, month = 7, day = 11, hour = 17 },
        earnEnd      = { year = 2026, month = 8, day = 4, hour = 23 },
        redeemEnd    = { year = 2026, month = 8, day = 12, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2026_07'),
    },

    {
        id           = 202608,
        name         = 'August 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 8,
        earnStart    = { year = 2026, month = 8, day = 13, hour = 17 },
        earnEnd      = { year = 2026, month = 9, day = 2, hour = 23 },
        redeemEnd    = { year = 2026, month = 9, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2026_08'),
    },

    {
        id           = 202609,
        name         = 'September 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 9,
        earnStart    = { year = 2026, month = 9, day = 11, hour = 17 },
        earnEnd      = { year = 2026, month = 10, day = 1, hour = 23 },
        redeemEnd    = { year = 2026, month = 10, day = 9, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2026_09'),
    },

    {
        id           = 202610,
        name         = 'October 2026 Login Campaign',
        displayYear  = 2026,
        displayMonth = 10,
        earnStart    = { year = 2026, month = 10, day = 10, hour = 17 },
        earnEnd      = { year = 2026, month = 11, day = 2, hour = 23 },
        redeemEnd    = { year = 2026, month = 11, day = 10, hour = 0 },
        rewards      = require('scripts/events/login_campaigns/2026_10'),
    },
}

local campaignModes =
{
    legacy = 'legacy',
    modern = 'modern',
}

local modernCycleStartId = 202611
local legacyRotationStartId = 202601
local monthNames =
{
    [1]  = 'January',
    [2]  = 'February',
    [3]  = 'March',
    [4]  = 'April',
    [5]  = 'May',
    [6]  = 'June',
    [7]  = 'July',
    [8]  = 'August',
    [9]  = 'September',
    [10] = 'October',
    [11] = 'November',
    [12] = 'December',
}

local function getCampaignId(year, month)
    return year * 100 + month
end

local function getConfiguredMode()
    local configuredMode =
        xi.settings and xi.settings.main and xi.settings.main.LOGIN_CAMPAIGN_MODE or campaignModes.modern

    if configuredMode == campaignModes.legacy or configuredMode == 0 then
        return campaignModes.legacy
    end

    return campaignModes.modern
end

local function getRegisteredCampaignById(id)
    for _, campaign in ipairs(campaigns) do
        if campaign.id == id then
            return campaign
        end
    end
end

local function getPreviousCampaignMonth(year, month)
    if month == 1 then
        return year - 1, 12
    end

    return year, month - 1
end

local function shiftedDate(date, yearOffset)
    return
    {
        year  = date.year + yearOffset,
        month = date.month,
        day   = date.day,
        hour  = date.hour,
    }
end

local function getLegacyTemplateId(year, month)
    local templateYear = year % 2 == 0 and 2024 or 2025

    return getCampaignId(templateYear, month)
end

local function getModernTemplateId(year, month)
    local templateYear = month >= 11 and 2025 or 2026

    return getCampaignId(templateYear, month)
end

local function buildRotatedCampaign(year, month, mode)
    local campaignId = getCampaignId(year, month)
    local templateId
    local yearOffset

    if mode == campaignModes.legacy then
        if campaignId < legacyRotationStartId then
            return getRegisteredCampaignById(campaignId)
        end

        templateId = getLegacyTemplateId(year, month)
        yearOffset = year - math.floor(templateId / 100)
    else
        if campaignId < modernCycleStartId then
            return getRegisteredCampaignById(campaignId)
        end

        templateId = getModernTemplateId(year, month)
        if month >= 11 then
            yearOffset = year - 2025
        else
            yearOffset = year - 2026
        end
    end

    local template = getRegisteredCampaignById(templateId)
    if template == nil then
        return nil
    end

    return
    {
        id           = campaignId,
        name         = string.format('%s %u Login Campaign', monthNames[month], year),
        displayYear  = year,
        displayMonth = month,
        earnStart    = shiftedDate(template.earnStart, yearOffset),
        earnEnd      = shiftedDate(template.earnEnd, yearOffset),
        redeemEnd    = shiftedDate(template.redeemEnd, yearOffset),
        rewards      = template.rewards,
        templateId   = template.id,
        cycleMode    = mode,
    }
end

local function getCandidateCampaigns(jstNow)
    local mode = getConfiguredMode()
    local previousYear, previousMonth = getPreviousCampaignMonth(jstNow.year, jstNow.month)
    local candidateCampaigns = {}
    local previousCampaign = buildRotatedCampaign(previousYear, previousMonth, mode)
    local currentCampaign = buildRotatedCampaign(jstNow.year, jstNow.month, mode)

    if previousCampaign ~= nil then
        table.insert(candidateCampaigns, previousCampaign)
    end

    if currentCampaign ~= nil then
        table.insert(candidateCampaigns, currentCampaign)
    end

    return candidateCampaigns
end

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

xi.events.loginCampaign.registry.getCampaignMode = function()
    return getConfiguredMode()
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

    local generatedCampaigns =
    {
        buildRotatedCampaign(2027,  1, campaignModes.legacy),
        buildRotatedCampaign(2028, 12, campaignModes.legacy),
        buildRotatedCampaign(2026, 11, campaignModes.modern),
        buildRotatedCampaign(2027,  1, campaignModes.modern),
        buildRotatedCampaign(2028, 10, campaignModes.modern),
    }

    for _, generatedCampaign in ipairs(generatedCampaigns) do
        local isValid, errorMessage = validateCampaign(generatedCampaign)
        if not isValid then
            return false, errorMessage
        end
    end

    return true
end

xi.events.loginCampaign.registry.getEarnCampaign = function(jstNow)
    for _, campaign in ipairs(getCandidateCampaigns(jstNow)) do
        if
            campaign ~= nil and
            utils.timeIsAfterOrEqual(jstNow, campaign.earnStart) and
            utils.timeIsBefore(jstNow, campaign.earnEnd)
        then
            return campaign
        end
    end
end

xi.events.loginCampaign.registry.getRedeemCampaign = function(jstNow)
    for _, campaign in ipairs(getCandidateCampaigns(jstNow)) do
        if
            campaign ~= nil and
            utils.timeIsAfterOrEqual(jstNow, campaign.earnStart) and
            utils.timeIsBefore(jstNow, campaign.redeemEnd)
        then
            return campaign
        end
    end
end

xi.events.loginCampaign.registry.getCampaignById = function(id)
    local registeredCampaign = getRegisteredCampaignById(id)
    if registeredCampaign ~= nil then
        return registeredCampaign
    end

    local year = math.floor(id / 100)
    local month = id % 100
    if month < 1 or month > 12 then
        return nil
    end

    return buildRotatedCampaign(year, month, getConfiguredMode())
end

xi.events.loginCampaign.registry.getLatestCampaign = function()
    return campaigns[#campaigns]
end

local isValid, errorMessage = xi.events.loginCampaign.registry.validateCampaigns()
if not isValid then
    error(string.format('Invalid login campaign registry: %s', errorMessage))
end

return xi.events.loginCampaign.registry
