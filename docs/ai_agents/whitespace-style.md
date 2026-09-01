# Whitespace Style Guide for Coding Agents

This guide records the whitespace patterns that are already common in LandSandBoat. Use it when editing code so agent-authored changes blend into nearby files instead of creating whitespace churn.

## Baseline from the repository

A scan of Lua, C++, header, SQL, Python, Markdown, and text files under `scripts`, `settings`, `modules`, `src`, `sql`, `tools`, and `documentation` showed these patterns:

- Code and data files overwhelmingly end with a final newline. All scanned `.lua`, `.cpp`, `.h`, `.sql`, and `.py` files had one.
- Files usually do **not** end with an extra blank line before EOF. All scanned `.lua`, `.cpp`, `.h`, `.sql`, and `.py` files had zero trailing blank lines.
- Single blank lines are the normal separator inside code. The most common blank-line run was one line in `.lua`, `.cpp`, `.h`, `.sql`, `.md`, and `.txt` files.
- Lua functions or local function assignments usually have one blank line before them: 40,217 of 49,978 scanned Lua function starts used one blank line.
- C++ function definitions usually have one blank line before them in `.cpp` files: 5,313 of 7,540 scanned starts used one blank line.
- Header files are more compact. Inline declarations and small methods often have no blank line before them, while larger blocks still use one blank line.
- Python follows standard Python spacing more often than the rest of the tree: two blank lines before `def` or `class` was the most common pattern in scanned Python files.

These numbers are not a request to reformat old files. They are a baseline for making new edits match the local style.

## File endings

Use exactly one final newline at EOF for code, SQL, scripts, and documentation.

```text
last line of content\n
```

Agent guidance:

- Keep `insert_final_newline = true` behavior for file types that already use it.
- Do not leave the last line unterminated.
- Do not add an extra empty line after the last meaningful line.
- If a file already has unusual generated formatting, preserve the generator's style unless the task is explicitly about cleanup.

## Blank lines inside code

Use one blank line to separate logical sections. Avoid two or more consecutive blank lines in Lua, C++, SQL, and most Markdown unless the surrounding file already uses them for a specific reason.

Good:

```lua
local function isEnabled(player)
    return player:getMainLvl() >= 10
end

local function grantReward(player)
    player:addGil(100)
end
```

Avoid adding extra vertical space:

```lua
local function isEnabled(player)
    return player:getMainLvl() >= 10
end


local function grantReward(player)
    player:addGil(100)
end
```

Agent guidance:

- One blank line between functions is the default for Lua and `.cpp` source files.
- Use one blank line after a block when the next statement starts a new logical step.
- Keep related setup statements together with no blank line when they are read as one unit.
- Do not introduce multiple blank lines to make generated code look more spacious.

## Lua spacing around blocks

Lua files usually use compact, single-line separation between top-level sections, functions, tables, and return statements. Multi-line tables use one blank line between meaningful groups, not between every entry.

```lua
local prizes =
{
    xi.item.POTION,
    xi.item.ETHER,
}

local function givePrize(player, prize)
    player:addItem(prize)
end

return entity
```

Agent guidance:

- Keep one blank line between top-level tables, functions, and `return entity`.
- Inside a function, use a blank line to separate setup, validation, action, and return phases when that improves readability.
- Do not add blank lines immediately after `if`, `for`, `while`, or function-opening lines unless the surrounding file already does.
- Do not add blank lines immediately before an `end` just to pad a small block.

## C++ spacing around functions and blocks

C++ source files generally use one blank line between free functions, member functions, and larger helper blocks. Allman braces are used, and the opening brace belongs on the next line without an intervening blank line.

```cpp
void CExample::Start()
{
    enabled_ = true;
}

void CExample::Stop()
{
    enabled_ = false;
}
```

Agent guidance:

- Put exactly one blank line between adjacent function definitions in `.cpp` files unless nearby code shows a different grouping.
- Do not insert a blank line between a function signature and its opening brace.
- Keep tightly related statements together; add a single blank line before a new conceptual step.
- Header files may be denser than `.cpp` files. Match nearby declarations, inline methods, and access sections instead of forcing source-file spacing.

## SQL and data files

SQL files often separate table comments, DDL, and data sections with single blank lines. Bulk `INSERT` data is usually contiguous and should stay that way.

```sql
DROP TABLE IF EXISTS `example`;
CREATE TABLE `example` (
  `id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=Aria TRANSACTIONAL=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `example` VALUES (1);
INSERT INTO `example` VALUES (2);
```

Agent guidance:

- Keep one blank line between DDL sections and data sections.
- Do not add blank lines between every `INSERT` row.
- Preserve the existing row shape in data-heavy files.
- Avoid whitespace-only SQL reformatting unless explicitly requested.

## Markdown documentation

Markdown files in `documentation/ai_agents` use one blank line after headings, paragraphs, lists, and fenced code blocks. Lists are compact when items are closely related.

Agent guidance:

- Use one blank line after a heading before body text.
- Use one blank line before and after fenced code blocks.
- Keep related bullet lists compact; do not put blank lines between every bullet unless the items contain multiple paragraphs.
- End Markdown files with a final newline and no extra blank line.

## Alignment and indentation reminders

Whitespace is not only vertical spacing. Before changing padding or indentation, also check the local alignment style.

Agent guidance:

- Use spaces, not tabs, for Lua, C++, YAML, Markdown, and SQL indentation unless a file type requires tabs, such as Makefiles.
- Lua and C++ use 4-space indentation in the project configuration.
- SQL table definitions commonly use 2-space indentation for column lines.
- Preserve aligned `=`, commas, comments, numeric columns, and table rows when editing an existing aligned block. See the Symbol Alignment Guide for detailed examples.
- Do not run broad auto-formatting over unrelated files or unrelated sections.

## Quick checklist before submitting agent-authored code

- Does every touched file end with exactly one final newline?
- Did I avoid adding extra blank lines at EOF?
- Did I use one blank line, not two or more, between nearby functions or logical code blocks unless local style differs?
- Did I keep related table rows, SQL inserts, and small declaration groups compact?
- Did I inspect nearby examples before changing vertical spacing, indentation, or alignment?
