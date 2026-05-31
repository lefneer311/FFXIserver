# Symbol Alignment Guide for Coding Agents

This guide records how LandSandBoat currently aligns symbols such as `=`, `,`, and inline comments in code blocks. Use it when generating or editing code so new changes match the surrounding style instead of flattening intentionally tabular code.

## Baseline from the repository

A scan of Lua, C++, header, SQL, and Python files under `scripts`, `settings`, `modules`, `src`, `sql`, and `tools` found extensive local alignment:

- 252,827 assignment-like lines were found.
- 82,171 of those lines used two or more spaces before `=`.
- 11,163 consecutive assignment blocks had three or more nearby lines aligned to the same `=` column.
- 344,719 comma-containing lines were found.
- 7,647 consecutive comma blocks had three or more nearby lines with commas aligned to the same column.

These numbers are not a formatting rule by themselves. They show that alignment is common and intentional in data-heavy areas of the project.

## General rule

**Preserve and extend local alignment when a block is already tabular.** Do not apply a universal rule that collapses repeated spaces around `=`, `,`, or comments to one space.

When editing an existing block:

1. Look at the surrounding lines first.
2. If related lines align `=`, `,`, values, or `--` / `//` comments, keep that alignment.
3. If adding a longer name or value, realign the affected local block rather than leaving a ragged outlier.
4. Keep alignment local to the logical group. Do not realign a whole file because one block changed.
5. Prefer readability over exact columns when expressions become too long.

## Lua tables and settings

Lua table data commonly aligns `=` within a related group and often aligns inline comments after the comma.

```lua
xi.damageType =
{
    NONE      = 0,
    PIERCING  = 1,
    SLASHING  = 2,
    BLUNT     = 3,
    ELEMENTAL = 5,
}
```

Settings files use the same approach, sometimes with a second aligned column for comments.

```lua
xi.settings.main =
{
    ENABLE_COP       = 1,
    ENABLE_TOAU      = 1,
    ENABLE_ABYSSEA   = 1,
    ENABLE_VOIDWATCH = 1, -- Not an expansion, but has its own storyline.

    ENABLE_FIELD_MANUALS  = 1, -- Enables Fields of Valor
    ENABLE_GROUNDS_TOMES  = 1, -- Enables Grounds of Valor
    ENABLE_SURVIVAL_GUIDE = 1, -- Enables Survival Guides
    REGIME_WAIT           = 1, -- Make people wait until the next game day.
}
```

Agent guidance:

- Add new entries in the same visual table style when neighboring entries are aligned.
- Keep a single space around `=` only in non-tabular code or where the surrounding block already does that.
- Align comments in dense settings or enum-like blocks when nearby comments are aligned.
- Do not reflow unrelated setting groups just to make distant columns match.

## Lua local variables

Short groups of related locals often align `=` when they are initialized together.

```lua
local zoneId        = player:getZoneID()
local triggerAreaId = triggerArea:getTriggerAreaID()
local data          = npcData[zoneId]
```

But ordinary one-off assignments do not need padding.

```lua
local mask = player:getCharVar('[ffr]deliveryMask')
local alreadyDelivered = utils.mask.getBit(mask, k)
```

Agent guidance:

- Align a run of related declarations when the surrounding function already does so.
- Do not introduce alignment for every local variable in a function.
- If only one line is being added to an unaligned group, keep it unaligned.

## Lua inline table rows and commas

Data rows often align repeated fields, numeric signs, string values, closing braces, and trailing commas to make coordinates or records easy to compare.

```lua
local npcData =
{
    [xi.zone.PORT_SAN_DORIA] =
    {
        [0] = { triggerArea = 1, x =   76.331, z = -128.655, offset = 0, npc = 'Answald'  },
        [1] = { triggerArea = 2, x =  -13.768, z =  -95.857, offset = 1, npc = 'Prietta'  },
        [2] = { triggerArea = 3, x =    0.750, z =  -81.438, offset = 2, npc = 'Miene'    },
    },
}
```

Agent guidance:

- Preserve numeric padding used to align positive and negative coordinates.
- Preserve string padding before `}` when existing rows align the row ending.
- Keep trailing commas in multi-line Lua tables.
- When adding a row, copy the shape of a nearby row and adjust the data.

## C++ declarations, globals, and enum blocks

C++ and header files frequently align names, `=`, and comments in compact lists.

```cpp
enum class DEATH_TYPE : uint8
{
    NONE        = 0,
    PHYSICAL    = 1,
    MAGICAL     = 2,
    WS_PHYSICAL = 3,
    WS_MAGICAL  = 4,
};
```

Global declarations may align the variable names or comments when types have different lengths.

```cpp
std::array<CWeaponSkill*, MAX_WEAPONSKILL_ID> g_PWeaponSkillList; // Holds all Weapon skills
std::array<CMobSkill*, MAX_MOBSKILL_ID>       g_PMobSkillList;    // List of mob skills
std::unordered_map<uint32, CPetSkill*>        g_PPetSkillList;    // List of pet skills
```

Local C++ variable declarations may also align names in a small group.

```cpp
uint32 x    = 0;
auto   rset = db::preparedStmt("SELECT ...");
```

Agent guidance:

- Preserve alignment in enum-like blocks and small declaration groups.
- Align inline comments when the existing declaration group does so.
- Do not pad every C++ declaration by default; only continue local style.
- Avoid large-scale churn in headers or source files because alignment changes are noisy in review.

## SQL and generated-looking data

SQL files and large data tables can have their own alignment and column layout. For these files, prioritize the existing row shape over general language preferences.

Agent guidance:

- Copy an adjacent row as a template for inserts or edits.
- Preserve comma placement and visual columns in bulk `INSERT` values.
- Do not auto-format SQL tables unless the task explicitly asks for that cleanup.

## What agents should not do

Avoid these changes unless specifically requested:

```diff
-    ENABLE_COP       = 1,
-    ENABLE_TOAU      = 1,
-    ENABLE_ABYSSEA   = 1,
+    ENABLE_COP = 1,
+    ENABLE_TOAU = 1,
+    ENABLE_ABYSSEA = 1,
```

```diff
-    NONE        = 0,
-    PHYSICAL    = 1,
-    WS_PHYSICAL = 3,
+    NONE = 0,
+    PHYSICAL = 1,
+    WS_PHYSICAL = 3,
```

Also avoid expanding alignment scope too far:

- Do not align across unrelated blank-line-separated groups.
- Do not align across separate functions.
- Do not align generated or imported blocks differently from their existing generator style.
- Do not mix tabs and spaces to achieve columns; use spaces for alignment.

## Quick checklist before submitting agent-authored code

- Did I inspect nearby examples before choosing spacing?
- If I touched a table-like block, do new `=`, `,`, braces, and comments line up with neighboring rows?
- If I added a longer identifier, did I realign only the affected local block?
- Did I avoid whitespace-only churn outside the lines needed for the change?
- Did I preserve trailing commas in multi-line Lua table entries?
