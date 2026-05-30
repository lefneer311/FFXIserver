# Lua `setLocalVar` Naming Baseline

This note records the current naming shape of Lua local variables declared through
`setLocalVar` and turns it into guidance for coding agents. These are entity,
zone, instance, or battlefield local variables, not Lua `local` variables.

## 2026-05-30 scan summary

The scan covered every `*.lua` file in the repository and found 3,347
`setLocalVar(...)` calls.

| Measurement | Value |
| --- | ---: |
| Calls with a literal string variable name | 3,094 |
| Calls with a dynamic variable-name expression | 253 |
| Unique literal variable names | 1,138 |
| Minimum literal name length | 2 characters |
| Average literal name length, call-weighted | 11.83 characters |
| Median literal name length, call-weighted | 11 characters |
| 90th percentile literal name length, call-weighted | 18 characters |
| Maximum literal name length | 28 characters |
| Average literal name length, unique names only | 12.51 characters |
| Median literal name length, unique names only | 12 characters |

Call-weighted literal-name distribution:

| Length bucket | Calls |
| --- | ---: |
| 2-5 characters | 180 |
| 6-10 characters | 1,095 |
| 11-15 characters | 1,196 |
| 16-20 characters | 482 |
| 21-25 characters | 125 |
| 26-28 characters | 16 |

The shortest observed literal names are compact keys such as `KI`, `ph`, `pop`,
`HPP`, and `Qnt`. The longest observed literal names are 28 characters, such as
`[ZNM][Sanraku]SoulPlateValue`, `Flavors_of_Our_Lives_Refused`,
`Mission[10][5]cardianOrbDrop`, and `Mission[0][17]requiredToZone`.

Dynamic names were not included in the strict length statistics because their
final runtime length depends on values such as loop counters, NPC names, options,
or formatted mission IDs. The dynamic expressions follow the same general style:
a concise literal prefix plus a small suffix, for example
`'[jobSpecial]ability_' .. i`, `'commServicePlayer' .. i`, or
`string.format('Zvahl_teleporter_%s', table.npc)`.

## Agent guidance

When adding or changing Lua `setLocalVar` keys, conform to the existing baseline:

* Prefer short, descriptive keys in the 6-15 character range. This is where most
  existing call sites fall.
* Treat about 12 characters as the normal target length for a new literal key.
* Keep most names at or below 20 characters unless the extra context prevents a
  real collision or improves maintainability.
* Use names above 25 characters only for established patterns that need explicit
  scope, such as mission-scoped keys or shared helper/mixin keys.
* Do not invent very long prose-like keys. Existing names are compact identifiers,
  not sentences.
* Match nearby scripts first. Zone, mission, battlefield, mixin, and helper code
  often have local naming conventions that matter more than a global preference.
* Use a bracketed namespace prefix when a key is shared by a framework, global
  helper, or mixin and could collide with unrelated script state, for example
  `[jobSpecial]chance` or `[helperNpc]engageWaitTime`.
* Use concise plain keys for script-local state when nearby code already does so,
  for example `pop`, `phase`, `timer`, `spawned`, or `claimed`.
* For generated names, keep the fixed prefix compact and append only the minimum
  suffix required to distinguish entries.
* Keep `setLocalVar`, `getLocalVar`, and any reset/clear-prefix logic spelling
  exactly aligned. A shorter name is not worth a hidden mismatch.

## Review checklist for new agent-written Lua

Before submitting Lua that declares local variables through `setLocalVar`, check:

1. Does each new key match the surrounding file's style?
2. Is the key usually 6-15 characters, and only longer when scoped context is
   genuinely useful?
3. If the key is shared across helpers or mixins, does it use an appropriate
   namespace prefix?
4. If the key is dynamic, is the literal prefix compact and stable?
5. Does every `getLocalVar`, `setLocalVar`, and clear/reset reference use the
   exact same generated or literal key?

## Reproducibility note

The baseline above was produced by scanning all repository `*.lua` files for
`setLocalVar(...)`, extracting the first argument, and counting length only when
that argument was a single literal string. This deliberately excludes dynamic
expressions from exact minimum, average, percentile, and maximum length values.