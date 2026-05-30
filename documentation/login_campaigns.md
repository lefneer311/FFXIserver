# FFXI-Style Monthly Login Campaign Framework

## Purpose

This document summarizes the observed structure of Final Fantasy XI's Repeat Login Campaign rewards during the 2024–2025 calendar years and proposes a framework for implementing a similar system within LandSandBoat as a custom module.

The goal is not to duplicate retail reward lists exactly, but to reproduce the predictable seasonal patterns and rotating reward structures that make login campaigns feel both familiar and fresh over time.

---

# Observed Campaign Structure

## Monthly Cadence

Retail login campaigns follow a highly consistent schedule:

* One campaign per month
* Campaigns typically run from mid-month into the following month
* Players earn login points daily
* Rewards are exchanged using accumulated points
* Reward costs are divided into tiers

Typical reward tiers include:

| Tier         | Purpose                              |
| ------------ | ------------------------------------ |
| Low Cost     | Consumables, utility items           |
| Medium Cost  | Trust ciphers, furnishings           |
| High Cost    | Cosmetics, mounts, rare collectibles |
| Premium Cost | Featured rewards and limited items   |

---

# Core Reward Categories

Campaign rewards generally fall into four categories.

## 1. Base Utility Pool

These rewards appear almost every month and provide a stable foundation for the campaign.

Examples include:

* Warp items
* Trust-related rewards
* Consumables
* Crafting materials
* Beastmen-related currencies
* Mog Garden items
* General quality-of-life items

These items provide consistency across campaigns and help ensure every month contains useful rewards.

---

## 2. Trust Cipher Rotation

Trust ciphers represent one of the most predictable recurring reward groups.

Observed behavior:

* Multiple trusts appear every month
* Standard trusts recur frequently
* Expansion-related trusts rotate throughout the year
* Seasonal and event trusts appear less frequently

Approximate rotation pattern:

| Trust Type      | Frequency                |
| --------------- | ------------------------ |
| Standard Trusts | Every 3–6 months         |
| Event Trusts    | 1–2 times per year       |
| Seasonal Trusts | During associated events |

The overall system appears rotational rather than random.

---

## 3. Seasonal Rewards

Many rewards are selected according to the time of year.

### Spring (March–May)

Common themes:

* Festival items
* Cherry blossom themed items
* Decorative furnishings
* Light cosmetic rewards

### Summer (June–August)

Common themes:

* Swimwear
* Summer outfits
* Fireworks
* Beach and vacation-themed rewards

### Fall (September–November)

Common themes:

* Harvest-themed items
* Seasonal foods
* Autumn furnishings
* Halloween rewards during October

### Winter (December–February)

Common themes:

* Holiday items
* Winter furnishings
* Snow-themed cosmetics
* Increased number of desirable rewards

---

## 4. Rare or Featured Rewards

These serve as campaign highlights.

Common examples:

* Mounts
* Costumes
* Furnishings
* Event collectibles
* Rare cosmetics

Observed behavior:

* Appear quarterly or semi-annually
* Often return year-over-year
* Used to encourage participation

---

# Annual Recycling Pattern

Comparing campaigns across 2024 and 2025 reveals significant reuse.

Observed characteristics:

* Approximately 60–70% of rewards repeat from previous years
* Seasonal themes remain consistent
* Trust rotations shift slightly
* Rare rewards periodically return
* New rewards are introduced gradually

This indicates a template-driven design rather than a fully randomized reward system.

---

# Proposed Login Campaign Model

The campaign can be represented conceptually as:

```lua
Campaign =
{
    month,
    season,

    rewardPool =
    {
        baseItems,
        trustRotation,
        seasonalItems,
        rareItems,
    }
}
```

---

# Season Mapping

```lua
local seasonByMonth =
{
    [1]  = "winter",
    [2]  = "winter",

    [3]  = "spring",
    [4]  = "spring",
    [5]  = "spring",

    [6]  = "summer",
    [7]  = "summer",
    [8]  = "summer",

    [9]  = "fall",
    [10] = "fall",
    [11] = "fall",

    [12] = "winter",
}
```

---

# Reward Pool Structure

```lua
local rewardPools =
{
    base =
    {
        -- Always available items
    },

    seasonal =
    {
        spring = {},
        summer = {},
        fall   = {},
        winter = {},
    },

    trusts =
    {
        -- Trust cipher list
    },

    rare =
    {
        -- Mounts, costumes, furnishings, etc.
    },
}
```

---

# Trust Rotation Logic

Trusts should rotate predictably.

Example implementation:

```lua
local function getMonthlyTrusts(month)
    local offset = (month * 3) % #rewardPools.trusts

    return slice(
        rewardPools.trusts,
        offset,
        5
    )
end
```

Recommended rules:

* Avoid repeating trusts within three months
* Rotate through the complete trust pool
* Allow manual overrides for special events

---

# Rare Reward Selection

Rare rewards should be limited and carefully controlled.

Example implementation:

```lua
local function getRareItems(month)
    return weightedSelect(
        rewardPools.rare,
        2,
        {
            cooldownMonths = 6,
        }
    )
end
```

Recommended rules:

* Select 1–3 rare items each campaign
* Prevent repetition within six months
* Favor seasonally appropriate rewards

---

# Campaign Assembly

Example composition logic:

```lua
function buildLoginCampaign(month)
    local season = seasonByMonth[month]

    return
    {
        base =
            rewardPools.base,

        seasonal =
            rewardPools.seasonal[season],

        trusts =
            getMonthlyTrusts(month),

        rare =
            getRareItems(month),
    }
end
```

---

# Recommended Module Requirements

A LandSandBoat login campaign module should support:

## Deterministic Rotation

* Month-based campaign generation
* Predictable seasonal behavior
* Stable trust rotation

## Seasonal Content

* Spring reward pool
* Summer reward pool
* Fall reward pool
* Winter reward pool

## Rare Reward Tracking

* Cooldown-based recurrence prevention
* Weighted selection
* Featured campaign rewards

## Administrative Controls

* Manual reward overrides
* Forced campaign selection
* Event campaign support
* Anniversary campaign support
* Holiday campaign support

---

# Design Philosophy

The retail login campaign system appears to follow a simple principle:

> Predictable seasonal content with controlled rotation and limited randomness.

Players are encouraged to log in because:

* Useful rewards are always available.
* Seasonal rewards return at expected times.
* Rare rewards eventually come back.
* Campaigns remain familiar without feeling completely repetitive.

A LandSandBoat implementation should prioritize these same characteristics rather than relying on fully random reward generation.

---

# Future Enhancements

Potential additions include:

* JSON-based campaign definitions
* Database-backed reward pools
* GM commands for campaign management
* Web administration support
* Multiple concurrent campaigns
* Account-wide reward tracking
* Automatic annual campaign generation

These enhancements would allow server operators to reproduce retail-like behavior while maintaining complete control over reward selection.
