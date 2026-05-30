# Login Reward Implementation Plan

## Goal

Implement a login reward system that feels like the retail Final Fantasy XI Repeat Login Campaign while staying maintainable for LandSandBoat operators. The system should preserve the retail-facing player experience: monthly campaigns, once-per-JST-day point awards, point carryover limits, Greeter Moogle exchange menus, tiered rewards, source-backed monthly prize lists, and predictable seasonal recurrence.

This plan intentionally separates retail-accurate campaign execution from optional custom reward generation. Retail-like behavior should be driven by explicit, reviewed campaign data; procedural or template-generated reward lists are acceptable only as offline preparation tools or opt-in custom content.

## Guiding Principles

- Treat retail reward lists as source-backed data, not as runtime procedural output.
- Keep the live campaign table explicit and reviewable so operators can audit every item offered during a campaign.
- Prefer named `xi.item` constants over bare numeric item IDs.
- Verify missing item constants against repository data before adding them to runtime reward tables.
- Preserve the existing Greeter Moogle event shape and client option slots unless packet captures prove a different structure.
- Use JST for all campaign boundaries, login day rollover, point messages, and redemption windows.
- Cross-check behavior against retail captures, event dumps, BG Wiki, FFXI Wikia, and in-client testing before treating the result as retail-accurate.

## Existing Behavior to Preserve

The current implementation already contains important retail-facing behavior that should be retained and hardened instead of replaced wholesale.

- `scripts/events/login_campaign.lua` owns the campaign event namespace, point earning, Greeter Moogle trigger flow, exchange menu updates, and purchase handling.
- `scripts/events/login_campaign_data.lua` provides the explicit reward table consumed by the Greeter Moogle flow.
- Greeter Moogle NPC scripts in city zones should remain thin stubs that delegate to the shared event implementation.
- Rewards are presented in eight client option groups keyed by slots `1`, `5`, `9`, `13`, `17`, `21`, `25`, and `29`.
- Each group has a single point price and up to 20 visible item slots.
- The first login in a campaign grants 500 points, later daily logins grant 100 points, and previous campaign points carry over with a 1,500 point cap.
- Campaign earning and reward exchange are separate windows: earning ends before redemption closes.

## Retail Experience Targets

### Monthly Cadence

Retail campaigns should be represented as one campaign per month with these fields:

```lua
{
    id = 202506,
    name = "June 2025 Login Campaign",
    displayYear = 2025,
    displayMonth = 6,
    earnStart = { year = 2025, month = 6, day = 11, hour = 17 },
    earnEnd = { year = 2025, month = 7, day = 2, hour = 23 },
    redeemEnd = { year = 2025, month = 7, day = 10, hour = 0 },
    rewards = require('scripts/events/login_campaigns/2025_06'),
}
```

All times should be stored and compared in JST. `displayYear` and `displayMonth` should drive the Greeter Moogle campaign message and the packed campaign date parameter passed to the client.

### Daily Point Awarding

Daily login rewards should match the retail-feeling pattern currently implemented:

1. On game-in, return immediately if the login campaign setting is disabled or the earning window is inactive.
2. Detect whether the character has entered a new campaign by comparing stored campaign ID, year, or month.
3. When entering a new campaign, carry over existing login points up to 1,500 and reset the campaign login count.
4. Award points only once per JST day, using the stored JST midnight marker.
5. Award 500 points for the first login number of the campaign.
6. Award 100 points for each later eligible login day.
7. Send the same campaign-underway and login-number messages that retail players expect.

The stored campaign identifier should eventually move from separate month/year variables to a compact campaign ID such as `LoginCampaignId`. Existing variables can be migrated lazily so current character state is not discarded.

### Greeter Moogle Exchange

Greeter Moogles should continue to use the existing shared handler pattern:

- `onTrigger` starts the exchange event only when redemption is available.
- `onEventUpdate` handles list display, item mask display, and purchase requests.
- The reward table remains grouped by the client option slot keys.
- The exchange menu hides empty tiers by setting the existing hide-options bitmask.
- Each tier sends at most 20 item IDs to the client.
- Purchase handling validates the selected item, quantity, player points, and inventory space before subtracting currency.

The purchase path should add defensive validation before granting items:

- Reject unknown tier keys.
- Reject missing or zero item IDs.
- Reject selected indexes outside the tier's item list.
- Reject quantities less than one or greater than the client-supported range.
- Recalculate cost server-side from the selected tier price and quantity.
- Subtract login points only after `npcUtil.giveItem` succeeds.

## Data Model

### Campaign Registry

Add a small registry module that selects the active campaign by time instead of editing hard-coded date variables every month.

Suggested file:

```text
scripts/events/login_campaign_registry.lua
```

Suggested shape:

```lua
local campaigns =
{
    {
        id = 202506,
        displayYear = 2025,
        displayMonth = 6,
        earnStart = { year = 2025, month = 6, day = 11, hour = 17 },
        earnEnd = { year = 2025, month = 7, day = 2, hour = 23 },
        redeemEnd = { year = 2025, month = 7, day = 10, hour = 0 },
        rewards = require('scripts/events/login_campaigns/2025_06'),
    },
}

return campaigns
```

Selection helpers should expose:

- `getEarnCampaign(jstNow)` for point awards.
- `getRedeemCampaign(jstNow)` for Greeter Moogle exchange.
- `getCampaignById(id)` for migration, tests, and GM tools.
- `getLatestCampaign()` for administrative diagnostics.

### Monthly Reward Files

Store reviewed monthly rewards in one file per campaign rather than overwriting one monolithic table. This makes historical campaigns auditable and supports redemption overlap without losing the prior month's reward list.

Suggested path:

```text
scripts/events/login_campaigns/YYYY_MM.lua
```

Suggested reward table shape:

```lua
---@type prizes
local prizes =
{
    [1] =
    {
        price = 10,
        items =
        {
            xi.item.BEASTMENS_SEAL,
            xi.item.KINDREDS_SEAL,
        },
    },

    [5] =
    {
        price = 100,
        items =
        {
            xi.item.CIPHER_OF_NAJAS_ALTER_EGO,
        },
    },
}

return prizes
```

Keep the option slot keys compatible with the existing client flow. Add tests that reject unrecognized top-level keys, missing prices, empty item lists, more than 20 items in a tier, non-integer prices, unknown items, and bare numeric IDs unless they are explicitly allowlisted with a source comment.

### Source Metadata

Each monthly reward file should include source comments at the top:

```lua
-- Source: BG Wiki Repeat Login Campaign page, captured YYYY-MM-DD.
-- Verification: compared against retail captures/event dumps when available.
-- Notes: missing enum constants added in scripts/enum/item.lua for this campaign.
```

If a reward is intentionally custom or extrapolated from seasonal patterns, mark the file and registry entry clearly as custom/non-retail so it cannot be mistaken for source-backed retail data.

## Reward Curation Workflow

### Retail-Accurate Monthly Update

1. Capture the official monthly reward list from BG Wiki or another reliable source.
2. Save the raw source or extraction artifact outside the runtime event path.
3. Resolve every reward name to an item ID using `scripts/enum/item.lua` and `sql/item_basic.sql`.
4. Add missing `xi.item` enum names before using the item in campaign data.
5. Build `scripts/events/login_campaigns/YYYY_MM.lua` using the reviewed table shape.
6. Add or update the registry entry with JST earning and redemption dates.
7. Run the login campaign data validator and Lua runtime tests.
8. Test the Greeter Moogle menu in a client, confirming tier prices, item names, masks, purchase success, insufficient points, and full-inventory behavior.

### Optional Custom Generation

A generator may exist, but it should not directly replace live campaign data. It should emit a proposed monthly table for human review.

Acceptable generator behavior:

- Deterministic output for a given campaign month and seed.
- Seasonal reward pools matching spring, summer, fall, and winter themes.
- Trust cipher rotation with cooldowns to avoid repeating the same trusts too often.
- Rare reward cooldown tracking when campaign history is available.
- Explicit output in the same table shape consumed by the Greeter Moogle event.
- A clear custom/non-retail label when output is based on patterns rather than a published retail list.

Unacceptable generator behavior:

- Runtime random selection of live reward lists.
- Silent insertion of unverified item IDs.
- Replacing reviewed retail data because a pattern appears statistically plausible.
- Producing more than 20 visible items per tier.
- Changing tier slots or client packet assumptions without packet-capture evidence.

## Implementation Phases

### Phase 1: Harden Current Runtime

- Add a validation helper for the current `login_campaign_data.lua` table.
- Validate tier keys, prices, item list lengths, selected indexes, and purchase quantities in `login_campaign.lua`.
- Ensure `canEarnPoints` and `canExchangePoints` return explicit booleans.
- Keep Greeter Moogle NPC files as delegation-only scripts.
- Add Lua tests that load the campaign table and exercise tier packing for 0, 1, 16, 17, and 20 item tiers.

### Phase 2: Add Campaign Registry

- Move hard-coded campaign dates into a registry module.
- Update runtime code to select the earn or redeem campaign by JST time.
- Preserve existing character variables but begin writing a campaign ID variable for future migrations.
- Support redemption overlap by selecting the proper reward table for the active redeem window.
- Add tests for before-start, earning, post-earning redemption, and after-redemption times.

### Phase 3: Split Monthly Data

- Create `scripts/events/login_campaigns/` for monthly reward files.
- Move the current reward data into the first monthly file.
- Keep `login_campaign_data.lua` temporarily as a compatibility shim if needed.
- Update documentation explaining how to add the next campaign month.
- Add a validator command suitable for CI and local contributor use.

### Phase 4: Retail Data Backfill

- Backfill recent campaigns from source-backed monthly reward lists.
- Prefer named enum constants and add missing names in `scripts/enum/item.lua`.
- Keep one reviewed commit per logical campaign batch where possible.
- Record source notes in each campaign file.
- Mark any uncertain entries with TODO comments instead of guessing.

### Phase 5: Optional Generator Tooling

- Add an offline generator only after the explicit retail path is stable.
- Emit generated output to a staging path, not directly into live runtime files.
- Require a review step that resolves item constants and source/custom labels.
- Include a diff-friendly summary of tier counts, trust ciphers, seasonal items, rare rewards, and repeated items from previous months.

## Test Plan

### Static Validation

Create a Lua or Python validation script that checks every registered campaign:

- Campaign IDs are unique.
- Time windows are valid and ordered.
- Reward files load successfully.
- Tier keys are limited to `1`, `5`, `9`, `13`, `17`, `21`, `25`, and `29`.
- Tier prices are positive integers.
- Tiers contain 1-20 item IDs.
- Every item ID is a positive integer after enum resolution.
- There are no duplicate item IDs within a tier unless retail data explicitly requires it.
- Bare numeric IDs include an inline source comment or fail validation.

### Runtime Unit Tests

Add Lua tests for:

- Earning disabled by setting.
- Earning before, during, and after the campaign window.
- Redemption during earning, after earning, and after redemption close.
- First login point amount.
- Later daily login point amount.
- Once-per-JST-day enforcement.
- Campaign rollover and 1,500 point carryover cap.
- Empty tier hiding.
- Price bit packing for all eight tier slots.
- Item list packing for the first 16 and final 4 item slots.
- Purchase validation and inventory failure handling.

### Client Verification

Verify in-game with Greeter Moogles in all supported starter-city zones:

- Campaign-underway message displays the correct month and year.
- Login-number message displays the expected login count, awarded points, and total points.
- Greeter Moogle event opens only during redemption.
- Tier prices match the configured reward data.
- Hidden tiers do not appear.
- Item names and icons match expected rewards.
- Buying one item, buying multiple quantities, insufficient points, and full inventory all behave correctly.
- Points are deducted only after a successful item grant.

### Retail Capture Verification

When captures are available, compare:

- Event IDs and parameters for Greeter Moogle trigger.
- Event update options for tier selection and purchase.
- Message IDs and parameter order for login point awards.
- NPC positions and script headers for any added or changed Greeter Moogles.
- Packet-level behavior for unknown parameters before changing existing assumptions.

## Administrative Controls

Add operator-facing controls only after the core behavior is stable:

- A setting to enable or disable login campaigns.
- A setting or GM command to force a campaign ID for testing.
- A diagnostic command to show active earn/redeem campaign, server JST, and loaded reward file.
- Optional commands to grant or reset login points for testing.
- Clear logs when a campaign file fails validation.

Administrative overrides must not bypass reward table validation.

## Documentation Updates

After implementation, update the existing documentation with:

- How to add a new source-backed monthly campaign.
- How to verify item constants and add missing enum names.
- How to run the validation script and Lua tests.
- How to perform client verification with Greeter Moogles.
- How to label custom/non-retail campaign data.
- How to use retail packet captures and event dumps for disputed behavior.

## Acceptance Criteria

The implementation is ready when:

- A campaign can be selected from a registry by JST time.
- The live reward list is explicit, reviewed, and source-commented.
- Greeter Moogle exchange still uses the retail-compatible tier slot structure.
- Players earn points once per JST day with first-login and later-login award values.
- Campaign rollover carries over at most 1,500 login points.
- Redemption remains available after point earning closes.
- Invalid reward data fails validation before reaching runtime.
- Tests cover campaign windows, rollover, point grants, tier packing, and purchase validation.
- Client verification confirms the visible retail-like menu and purchase behavior.
- Any procedural generation is offline, deterministic, reviewed, and clearly marked as custom unless it exactly matches a source-backed retail month.
