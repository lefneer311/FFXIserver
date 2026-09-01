# Repeat Login Campaign Reward Generation Re-evaluation

The seasonal reward-generator proposal should not replace the default
`login_campaign_data.lua` table in core LandSandBoat as-is.

## Recommendation

Keep the stock login campaign rewards as an explicit, reviewed data table and treat
any generated reward lists as opt-in custom content or as an offline data-prep step.
A generator can still be useful, but it should produce a deterministic table that is
reviewed before being wired into a live campaign.

## Rationale

- Retail Repeat Login Campaigns are source-backed monthly reward lists, not a live
  procedural system that can be inferred perfectly from seasonal patterns.
- A procedural default can silently diverge from retail if a month contains a one-off
  reward, collaboration item, anniversary exception, or a different point tier.
- The existing Greeter Moogle event expects an explicit reward table keyed by client
  option slots and point tiers, which makes campaign contents easy for operators to
  audit and override.
- Item IDs should be verified against repository enums or database rows before being
  exposed in a live reward list; large numeric-ID tables are harder to review than
  named `xi.item` entries.
- Cooldown or randomness claims require persistent state or explicit campaign
  history. Without that state, the behaviour is only a deterministic approximation.

## Safer implementation path

1. Extract source-backed monthly reward data from BG Wiki into an intermediate file
   outside the runtime event path.
2. Resolve each reward to a repository item enum where one exists, adding enum names
   in `scripts/enum/item.lua` before using bare numeric IDs in campaign data.
3. Generate or update `scripts/events/login_campaign_data.lua` only after review, so
   the live campaign remains an explicit table.
4. Put seasonal/template generation behind an opt-in custom module if a private
   server wants non-retail recurring campaigns.
5. Add Lua runtime coverage for loading the data table and for verifying the Greeter
   Moogle slot limit of 20 visible rewards per tier.

## Acceptance criteria for a future generator

- It must not replace the default static table unless the generated output exactly
  matches a reviewed source-backed campaign month.
- It must avoid unverified item IDs.
- It must preserve the existing table shape consumed by `login_campaign.lua`.
- It must provide reproducible output for a given campaign month.
- It must be documented as custom/non-retail if it intentionally extrapolates from
  seasonal patterns instead of matching a published campaign list.
