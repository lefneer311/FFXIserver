# Custom Augment System Development Specification

## Purpose

This document converts the project requirements into an implementation specification for AI agents working on the custom augment enum system.

**Primary Goal:** Expand the augment system into a structured 10-tier progression (Tier 0-9) without modifying `sql/augments.sql`, while ensuring every requested augment family, power progression, material theme, and job-specific flavor is represented.

---

# Non-Negotiable Requirements

## Do Not Modify augments.sql

- Existing augment definitions are the source of truth.
- Remove any proposed changes to `sql/augments.sql`.
- If an effect does not already exist, do not add it.
- Reuse only augment IDs already defined.

## Augment Entry Format

```lua
[materialItemID] = { augmentID, requiredQty, power, materialName, tier }
```

Rules:

- Power is stored as a 0-based value.
- Most augments use:
  - power = displayed value - 1
- Multiplier-based augments must respect SQL scaling.
- Power values cannot exceed system limits.
- Do not use nonsensical power mappings.

---

# Tier Structure

| Tier | Theme |
|--------|--------|
| 0 | Starter zone drops and vendor items |
| 1 | Crystals and level 15-30 drops |
| 2 | Promyvion / Empty areas |
| 3 | ~Level 50 materials |
| 4 | ~Level 60 materials, geodes |
| 5 | ~Level 70 materials |
| 6 | Job testimonies |
| 7 | Curio Part 1, Sky NM pops, Abyssea NM pops |
| 8 | Curio Part 2, Sea organs/chips, Job seals |
| 9 | HQ guild crystals, Dynamis, high-end Abyssea materials |

---

# Progression Philosophy

The prior attempts failed because they focused on generating a table instead of validating progression.

The correct process is:

1. Build a master augment matrix.
2. Map every requested augment power step.
3. Verify every requested value exists.
4. Assign tiers.
5. Assign materials.
6. Verify no power step is missing.
7. Verify no tier violates theme requirements.
8. Generate enum table last.

---

# Required Review Process

## Phase 1: Inventory Existing Augments

Review:

- sql/augments.sql
- augment enum table
- material item definitions

Produce:

- augment name
- augment ID
- minimum value
- maximum value
- multiplier
- storage method

No implementation work should begin until this inventory exists.

---

## Phase 2: Build Augment Matrix

Create a spreadsheet-like matrix containing:

- Augment name
- Power tier
- Display value
- Power storage value
- Intended augment tier
- Material category

Every requested augment progression must appear exactly once.

---

## Phase 3: Validate Coverage

The instruction set implies more than 214 augment recipes.

Verification checklist:

- Every requested augment family present
- Every requested power step present
- Every tier populated
- Job augments present
- Pet augments present
- No majority-pet tier
- Materials follow progression themes

---

# Job Flavor Rules

Whenever possible:

- Job-specific augments use job-specific items.
- Testimonies belong in Tier 6.
- Seal materials belong in Tier 8.
- Flavor takes precedence over generic stats.

Examples:

| Job | Preferred Augments |
|------|------|
| WAR | Double Attack + Critical Hit Rate % (132) |
| MNK | Kick Attacks (194) |
| THF | Treasure Hunter (147)/ Gilfinder (148) |
| WHM | Cure Spellcasting Time (323) |
| BLM | Magic Burst Damage (334) |
| RDM | Enhancing Magic Duration (1248) |
| BRD | Song Casting Time (322) / All Songs (67) |
| RNG | Snapshot (211)/ True Shot (232) |
| SAM | Weapon Skill Damage (327) |
| NIN | Daken (251)/ Ninja Tool Expertise (215) |
| DRG | Pet-focused Wyvern options |
| BST | Pet offense/defense |
| SMN | Avatar-focused bonuses |
| PUP | Automaton bonuses |
| BLU | Skillchain Damage (332) |
| SCH | Regen Potency (371) |

---

# Material Assignment Rules

## Tier 0

Must remain inexpensive.

Examples:

- Rabbit Hide
- Bat Wing
- Beehive Chip
- Flint Stone

## Tier 1

Introduce:

- All elemental crystals
- Common 15-30 drops

## Tier 4

All geodes should be grouped here.

## Tier 6

All job testimonies should be grouped here.

One testimony per job.

## Tier 7

Use:

- Curio Part 1 materials
- Sky seals
- Abyssea NM pop items

## Tier 8

Use:

- Curio Part 2 materials
- Sea organs
- Sea chips
- Job seals

## Tier 9

Use:

- Dynamis materials
- Forgotten items
- HQ guild crystals
- High-end Abyssea materials

---

# Material Progression Consistency

Whenever possible, augment families should follow a thematic material progression.

Example:

Fire Theme

- Fire Crystal
- Fire Cluster
- Fire Geode
- Flame Gem
- Fire Ore
- Flame Bead
- Ifritite
- Ifritear

Example:

Gem Theme

- Red Rock
- Sardonyx
- Garnet
- Sunstone
- Ruby

Maintain thematic continuity.

---

# Stack Size Constraints

Do not require:

- More than one stack of crystals
- Multiple faded crystals

Avoid recipes that prevent 4-augment equipment generation.

If large quantities are required:

- Upgrade to clusters instead of crystals.

---

# Beastmen Seal Progression

Must follow level progression:

1. Beastmen Seals
2. Kindred Seals
3. Kindred Crests
4. Higher equivalents

Never place all seal types in the same tier.

---

# Alignment Requirements

All generated tables must:

- Align columns consistently.
- Follow existing project formatting.
- Group related augments together.
- Group related materials together.

---

# Common Failure Modes To Avoid

Do NOT:

- Modify augments.sql
- Invent augment effects
- Mix unrelated material themes
- Place all seal types together
- Use Reisenjima crystals
- Use Thought Crystal
- Use Hope Crystal
- Require 10,000 currency pieces
- Create nonsensical TA/QA progression
- Make pet augments dominate a tier

---

# Final Acceptance Checklist

Before submitting a PR:

- [ ] augments.sql unchanged
- [ ] 10 tiers exist
- [ ] equipmentTier table updated
- [ ] key item unlock table updated
- [ ] all requested augment families represented
- [ ] all requested power steps represented
- [ ] tier themes respected
- [ ] material themes respected
- [ ] job flavor respected
- [ ] pet parity validated
- [ ] table alignment validated
- [ ] crystal stack limits validated
- [ ] seal progression validated
- [ ] Dynamis material usage validated
- [ ] no Reisenjima reward items used
