------------------------------------------------------------------
--                      custom_augment_enum
--                      Custom Augment Utilities
--      Provides functions, tables, and items for a custom
--      augmentation shop or system; to be adapted as appropriate
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

local augmentData = {}

local MAX_AUGMENTS_PER_ITEM = 4

-- Review notes for the 10-tier custom augment update:
-- * augment_enum_spec.md requires a 0-9 tier structure using only sql/augments.sql IDs.
-- * sql/augments.sql was inventoried for IDs, comments, multipliers, and packet-safe power storage.
-- * Material IDs/names were checked against sql/item_basic.sql and assigned by the spec tier themes.
-- * Power values below are stored values: normal +N effects use power = N - 1, TP Bonus uses 50-step
--   storage, and pet TP Bonus uses augment 122's +20 base/step semantics.
-- * Families intentionally covered: melee/ranged/magic offense, defenses, TP, DA/TA/QA, job-flavored
--   augments, avatar/automaton/pet augments, cures/regen/refresh, songs, and utility augments.

-- Define equipment tiers (assigning equipment to specific tiers).
-- Placeholder IDs remain until Hogwarts-specific item progression IDs are provided.
augmentData.equipmentTier = {
    [0] = {0234, 0235, 0236, 0237}, -- PLACEHOLDER Tier 0 Weapons
    [1] = {1234, 1235, 1236, 1237}, -- PLACEHOLDER Tier 1 Weapons
    [2] = {2234, 2235, 2236, 2237}, -- PLACEHOLDER Tier 2 Weapons
    [3] = {3234, 3235, 3236, 3237}, -- PLACEHOLDER Tier 3 Weapons
    [4] = {4234, 4235, 4236, 4237}, -- PLACEHOLDER Tier 4 Weapons
    [5] = {5234, 5235, 5236, 5237}, -- PLACEHOLDER Tier 5 Weapons
    [6] = {6234, 6235, 6236, 6237}, -- PLACEHOLDER Tier 6 Weapons
    [7] = {7234, 7235, 7236, 7237}, -- PLACEHOLDER Tier 7 Weapons
    [8] = {8234, 8235, 8236, 8237}, -- PLACEHOLDER Tier 8 Weapons
    [9] = {9234, 9235, 9236, 9237}, -- PLACEHOLDER Tier 9 Weapons
}

-- Define materials and their corresponding augment for each tier.
-- Augment table format: [materialItemID] = { augmentID, requiredQty, power, materialName, tier }
-- Augment values are sourced from sql/augments.sql; item IDs are sourced from sql/item_basic.sql.
--
augmentData.augmentTable = {
    -- Tier 0 Augments
    [0] = { -- Augment table format: [materialItemID] = { augmentID, requiredQty, power, materialName, tier }
        [  856] = { 68  , 2 , 0 , "Rabbit Hide",                0 }, -- Accuracy/Attack +1
        [  922] = { 69  , 2 , 0 , "Bat Wing",                   0 }, -- Ranged Accuracy/Ranged Attack +1
        [  912] = { 134 , 2 , 0 , "Beehive Chip",               0 }, -- Magic Defense Bonus +1
        [  768] = { 131 , 2 , 0 , "Flint Stone",                0 }, -- Magic Accuracy/Magic Attack +1
        [  839] = { 33  , 2 , 2 , "Crawler Cocoon",             0 }, -- Defense +3
        [  846] = { 142 , 2 , 0 , "Insect Wing",                0 }, -- Store TP +1
        [  847] = { 195 , 2 , 0 , "Bird Feather",               0 }, -- Subtle Blow +1
        [  852] = { 140 , 2 , 0 , "Lizard Skin",                0 }, -- Fast Cast +1%
        [  847] = { 31  , 2 , 0 , "Beetle Shell",               0 }, -- Evasion +1
        [ 4096] = { 512 , 1 , 0 , "Fire Crystal",               0 }, -- STR +1
        [ 4097] = { 516 , 1 , 0 , "Ice Crystal",                0 }, -- INT +1
        [ 4098] = { 515 , 1 , 0 , "Wind Crystal",               0 }, -- AGI +1
        [ 4099] = { 514 , 1 , 0 , "Earth Crystal",              0 }, -- VIT +1
        [ 4100] = { 513 , 1 , 0 , "Lightning Crystal",          0 }, -- DEX +1
        [ 4101] = { 517 , 1 , 0 , "Water Crystal",              0 }, -- MND +1
        [ 4102] = { 518 , 1 , 0 , "Light Crystal",              0 }, -- CHR +1
        [ 4103] = { 17  , 1 , 3 , "Dark Crystal",               0 }, -- HP/MP +4
        [  895] = { 796 , 1 , 0 , "Ram Horn",                   0 }, -- All Elemental Resist +1
        [  859] = { 137 , 1 , 0 , "Ram Skin",                   0 }, -- Regen +1
        [  627] = { 362 , 2 , 0 , "Maple Sugar",                0 }, -- Magic Damage +1
    },
    -- Tier 1 Augments
    [1] = {
        [  856] = { 68  , 7 , 2 , "Rabbit Hide",                1 }, -- Accuracy/Attack +3
        [  922] = { 69  , 7 , 2 , "Bat Wing",                   1 }, -- Ranged Accuracy/Ranged Attack +3
        [  912] = { 134 , 7 , 1 , "Beehive Chip",               1 }, -- Magic Defense Bonus +2
        [  768] = { 131 , 7 , 2 , "Flint Stone",                1 }, -- Magic Accuracy/Magic Attack +3
        [  839] = { 33  , 7 , 8 , "Crawler Cocoon",             1 }, -- Defense +9
        [  846] = { 142 , 7 , 2 , "Insect Wing",                1 }, -- Store TP +3
        [  847] = { 195 , 7 , 2 , "Bird Feather",               1 }, -- Subtle Blow +3
        [  852] = { 140 , 7 , 2 , "Lizard Skin",                1 }, -- Fast Cast +3%
        [  847] = { 31  , 7 , 2 , "Beetle Shell",               1 }, -- Evasion +3
        [ 4096] = { 512 , 7 , 1 , "Fire Crystal",               1 }, -- STR +2
        [ 4097] = { 516 , 7 , 1 , "Ice Crystal",                1 }, -- INT +2
        [ 4098] = { 515 , 7 , 1 , "Wind Crystal",               1 }, -- AGI +2
        [ 4099] = { 514 , 7 , 1 , "Earth Crystal",              1 }, -- VIT +2
        [ 4100] = { 513 , 7 , 1 , "Lightning Crystal",          1 }, -- DEX +2
        [ 4101] = { 517 , 7 , 1 , "Water Crystal",              1 }, -- MND +2
        [ 4102] = { 518 , 7 , 1 , "Light Crystal",              1 }, -- CHR +2
        [ 4103] = { 17  , 7 , 7 , "Dark Crystal",               1 }, -- HP/MP +8
        [  895] = { 796 , 7 , 2 , "Ram Horn",                   1 }, -- All Elemental Resist +3
        [  859] = { 137 , 7 , 1 , "Ram Skin",                   1 }, -- Regen +2
        [  841] = { 41  , 2 , 0 , "Yagudo Feather",             1 }, -- Critical Hit Chance +1%
        [  505] = { 40  , 2 , 2 , "Sheepskin",                  1 }, -- Enmity -3
        [  560] = { 143 , 2 , 0 , "Zeruhn Soot",                1 }, -- Double Attack +1%
        [ 4370] = { 362 , 2 , 2 , "Honey",                      1 }, -- Magic Damage +3
        [ 4374] = { 329 , 2 , 2 , "Sleepshroom",                1 }, -- Cure Potency +3%
        [  884] = { 194 , 2 , 0 , "Black Tiger Fang",           1 }, -- Kick Attacks +1
        [  501] = { 151 , 2 , 0 , "Quadav Helm",                1 }, -- Martial Arts +1
        [  953] = { 146 , 2 , 0 , "Treant Bulb",                1 }, -- Dual Wield +1
        [  858] = { 39  , 2 , 0 , "Wolf Hide",                  1 }, -- Enmity +3
        [ 4373] = { 145 , 2 , 0 , "Woozyshroom",                1 }, -- Counter +1
        [ 1016] = { 139 , 2 , 2 , "Remi Shell",                 1 }, -- Rapid Shot +3%
        [  498] = { 363 , 2 , 0 , "Yagudo Bead Necklace",       1 }, -- Block Rate +1%
        [ 4387] = { 1472, 2 , 0 , "Wild Onion",                 1 }, -- Parry Rate +1%
    },
    -- Tier 2 Augments (clusters)
    [2] = {
        [  856] = { 68  , 12, 4 , "Rabbit Hide",                2 }, -- Accuracy/Attack +5
        [  922] = { 69  , 12, 4 , "Bat Wing",                   2 }, -- Ranged Accuracy/Ranged Attack +5
        [  912] = { 134 , 12, 2 , "Beehive Chip",               2 }, -- Magic Defense Bonus +3
        [  768] = { 131 , 12, 4 , "Flint Stone",                2 }, -- Magic Accuracy/Magic Attack +5
        [  839] = { 33  , 12, 14, "Crawler Cocoon",             2 }, -- Defense +15
        [  846] = { 142 , 12, 4 , "Insect Wing",                2 }, -- Store TP +5
        [  847] = { 195 , 12, 4 , "Bird Feather",               2 }, -- Subtle Blow +5
        [  852] = { 140 , 12, 4 , "Lizard Skin",                2 }, -- Fast Cast +5%
        [  847] = { 31  , 12, 4 , "Beetle Shell",               2 }, -- Evasion +5
        [ 4096] = { 512 , 1 , 2 , "Fire Cluster",               2 }, -- STR +3
        [ 4097] = { 516 , 1 , 2 , "Ice Cluster",                2 }, -- INT +3
        [ 4098] = { 515 , 1 , 2 , "Wind Cluster",               2 }, -- AGI +3
        [ 4099] = { 514 , 1 , 2 , "Earth Cluster",              2 }, -- VIT +3
        [ 4100] = { 513 , 1 , 2 , "Lightning Cluster",          2 }, -- DEX +3
        [ 4101] = { 517 , 1 , 2 , "Water Cluster",              2 }, -- MND +3
        [ 4102] = { 518 , 1 , 2 , "Light Cluster",              2 }, -- CHR +3
        [ 4103] = { 17  , 1 , 11, "Dark Cluster",               2 }, -- HP/MP +12
        [  895] = { 796 , 12, 4 , "Ram Horn",                   2 }, -- All Elemental Resist +5
        [  859] = { 137 , 12, 2 , "Ram Skin",                   2 }, -- Regen +3
        [  841] = { 41  , 12, 1 , "Yagudo Feather",             2 }, -- Critical Hit Chance +2%
        [  505] = { 40  , 12, 4 , "Sheepskin",                  2 }, -- Enmity -5
        [  560] = { 143 , 12, 2 , "Zeruhn Soot",                2 }, -- Double Attack +3%
        [ 4370] = { 362 , 12, 4 , "Honey",                      2 }, -- Magic Damage +5
        [ 4374] = { 329 , 12, 4 , "Sleepshroom",                2 }, -- Cure Potency +5%
        [  884] = { 194 , 12, 2 , "Black Tiger Fang",           2 }, -- Kick Attacks +3
        [  501] = { 151 , 12, 2 , "Quadav Helm",                2 }, -- Martial Arts +3
        [  953] = { 146 , 12, 2 , "Treant Bulb",                2 }, -- Dual Wield +3
        [  858] = { 39  , 12, 4 , "Wolf Hide",                  2 }, -- Enmity +5
        [ 4373] = { 145 , 12, 1 , "Woozyshroom",                2 }, -- Counter +2
        [ 1016] = { 139 , 12, 5 , "Remi Shell",                 2 }, -- Rapid Shot +6%
        [  498] = { 363 , 12, 2 , "Yagudo Bead Necklace",       2 }, -- Block Rate +3%
        [ 4387] = { 1472, 12, 2 , "Wild Onion",                 2 }, -- Parry Rate +3%
        [ 4368] = { 138 , 12, 0 , "Two-Leaf Mandragora Bud",    2 }, -- Refresh +1
        [ 1126] = { 353 , 3 , 2 , "Beastmen Seal",              2 }, -- Critical Damage +1%
    },
    -- Tier 3 Augments (chips, rocks)
    [3] = {
        [  940] = { 68  , 3 , 6 , "Revival Root",               3 }, -- Accuracy/Attack +7
        [  955] = { 69  , 3 , 6 , "Golem Shard",                3 }, -- Ranged Accuracy/Ranged Attack +7
        [ 1165] = { 134 , 3 , 9 , "Doll Shard",                 3 }, -- Magic Defense Bonus +4
        [  954] = { 131 , 3 , 9 , "Magic Pot Shard",            3 }, -- Magic Accuracy/Magic Attack Bonus +7
        [  857] = { 33  , 3 , 20, "Dhalmel Hide",               3 }, -- Defense +21
        [  928] = { 143 , 3 , 4 , "Bomb Ash",                   3 }, -- Double Attack +5%
        [  920] = { 362 , 3 , 6 , "Malboro Vine",               3 }, -- Magic Damage +7
        [  894] = { 140 , 3 , 7 , "Beetle Jaw",                 3 }, -- Fast Cast +8%
        [ 1118] = { 31  , 3 , 6 , "Antican Pauldron",           3 }, -- Evasion +7
        [ 1121] = { 896 , 3 , 1 , "Antican Robe",               3 }, -- Enspell Damage +2
        [  938] = { 53  , 3 , 7 , "Papaka Grass",               3 }, -- Spell Interruption Rate -8%
        [  893] = { 54  , 3 , 1 , "Giant Femur",                3 }, -- Physical Damage Taken -2%
        [ 1985] = { 55  , 3 , 2 , "Helmet Mole",                3 }, -- Magic Damage Taken -2%
        [ 1836] = { 37  , 1 , 4 , "Marble",                     3 }, -- Magic Evasion +5
        [ 2539] = { 198 , 3 , 4 , "Dhalmel Hair",               3 }, -- Zanshin +2%
        [  838] = { 49  , 3 , 0 , "Spider Web",                 3 }, -- Haste +1%
        [ 1154] = { 371 , 3 , 0 , "Three-Leaf Mandragora Bud",  3 }, -- Triple Attack +1%
        [  568] = { 148 , 1 , 0 , "Goblin Die",                 3 }, -- Gilfinder +1
        [ 4096] = { 512 , 3 , 3 , "Fire Cluster",               3 }, -- STR +4
        [ 4097] = { 516 , 3 , 3 , "Ice Cluster",                3 }, -- INT +4
        [ 4098] = { 515 , 3 , 3 , "Wind Cluster",               3 }, -- AGI +4
        [ 4099] = { 514 , 3 , 3 , "Earth Cluster",              3 }, -- VIT +4
        [ 4100] = { 513 , 3 , 3 , "Lightning Cluster",          3 }, -- DEX +4
        [ 4101] = { 517 , 3 , 3 , "Water Cluster",              3 }, -- MND +4
        [ 4102] = { 518 , 3 , 3 , "Light Cluster",              3 }, -- CHR +4
        [ 4103] = { 17  , 3 , 15, "Dark Cluster",               3 }, -- HP/MP +16
        [  873] = { 68  , 1 , 0 , "Red Chip",                   3 }, -- Fire Affinity +1
        [  475] = { 131 , 1 , 0 , "Blue Chip",                  3 }, -- Water Affinity +1
        [  476] = { 69  , 1 , 0 , "Yellow Chip",                3 }, -- Earth Affinity +1
        [  477] = { 134 , 1 , 0 , "Green Chip",                 3 }, -- Air Affinity +1
        [  478] = { 140 , 1 , 0 , "Clear Chip",                 3 }, -- Ice Affinity +1
        [  479] = { 142 , 1 , 0 , "Purple Chip",                3 }, -- Lightning Affinity +1
        [  480] = { 123 , 1 , 0 , "White Chip",                 3 }, -- Light Affinity +1
        [  481] = { 112 , 1 , 0 , "Black Chip",                 3 }, -- Dark Affinity +1
        [  772] = { 294 , 1 , 3 , "Green Rock",                 3 }, -- Summoning Magic Skill +4
        [  769] = { 291 , 3 , 3 , "Red Rock",                   3 }, -- Enfeebling Magic Skill +4
        [  770] = { 299 , 3 , 3 , "Blue Rock",                  3 }, -- Blue Magic Skill +4
        [  774] = { 290 , 3 , 3 , "Purple Rock",                3 }, -- Enhancing Magic Skill +4
        [  771] = { 289 , 3 , 3 , "Yellow Rock",                3 }, -- Healing Magic Skill +4
        [  773] = { 292 , 3 , 3 , "Translucent Rock",           3 }, -- Elemental Magic Skill +4
        [  775] = { 293 , 3 , 3 , "Black Rock",                 3 }, -- Dark Magic Skill +4
        [  776] = { 288 , 3 , 3 , "White Rock",                 3 }, -- Divine Magic Skill +4
    },
    -- Tier 4 Augments (geodes)
    [4] = {
        [  838] = { 49  , 7 , 1 , "Spider Web",                 4 }, -- Haste +2%
        [ 4096] = { 512 , 7 , 4 , "Fire Cluster",               4 }, -- STR +5
        [ 4097] = { 516 , 7 , 4 , "Ice Cluster",                4 }, -- INT +5
        [ 4098] = { 515 , 7 , 4 , "Wind Cluster",               4 }, -- AGI +5
        [ 4099] = { 514 , 7 , 4 , "Earth Cluster",              4 }, -- VIT +5
        [ 4100] = { 513 , 7 , 4 , "Lightning Cluster",          4 }, -- DEX +5
        [ 4101] = { 517 , 7 , 4 , "Water Cluster",              4 }, -- MND +5
        [ 4102] = { 518 , 7 , 4 , "Light Cluster",              4 }, -- CHR +5
        [ 4103] = { 17  , 7 , 19, "Dark Cluster",               4 }, -- HP/MP +20
        [ 4508] = { 195 , 12, 2 , "Royal Jelly",                4 }, -- Refresh +2
        [ 1154] = { 371 , 7 , 2 , "Three-Leaf Mandragora Bud",  4 }, -- Triple Attack +3%
        [ 4369] = { 354 , 3 , 0 , "Four-Leaf Mandragora Bud",   4 }, -- Quadruple Attack +1%
        [ 1126] = { 147 , 9 , 0 , "Beastmen's Seal",            4 }, -- Treasure Hunter +1
        [ 3297] = { 740 , 30, 11, "Flame Geode",                4 }, -- Melee Weapon Damage +12
        [ 3298] = { 139 , 10, 9 , "Snow Geode",                 4 }, -- Rapid Shot +10%
        [ 3299] = { 746 , 30, 11, "Breeze Geode",               4 }, -- Ranged Weapon Damage +12
        [ 3300] = { 368 , 10, 0 , "Soil Geode",                 4 }, -- Phalanx Received +1
        [ 3301] = { 41  , 10, 2 , "Thunder Geode",              4 }, -- Critical Hit Chance +3%
        [ 3302] = { 371 , 10, 1 , "Aqua Geode",                 4 }, -- Regen Potency +2
        [ 3303] = { 1248, 10, 9 , "Light Geode",                4 }, -- Enhancing Magic Duration +10%
        [ 3304] = { 1158, 10, 1 , "Shadow Geode",               4 }, -- Occ. Resist Status Ailments +2
        [ 1114] = { 899 , 3 , 0 , "Qdv. Mage Blood",            4 }, -- Enspell Damage +1%
        [ 1150] = { 756 , 1 , 31, "Snobby Letter",              4 }, -- Melee Weapon Delay -32
        [ 1619] = { 764 , 3 , 31, "Hippogryph Feather",         4 }, -- Ranged Weapon Delay -32
        [  554] = { 153 , 3 , 2 , "Gold Orcmask",               4 }, -- Shield Mastery +3
        [ 1649] = { 251 , 3 , 2 , "Scarlet Stone",              4 }, -- Daken +3
        [ 5154] = { 145 , 3 , 2 , "Tavnazian Liver",            4 }, -- Counter +3
    },
    -- Tier 5 Augments (memories)
    [5] = {
        [ 4096] = { 512 , 12, 5 , "Fire Cluster",               5 }, -- STR +6
        [ 4097] = { 516 , 12, 5 , "Ice Cluster",                5 }, -- INT +6
        [ 4098] = { 515 , 12, 5 , "Wind Cluster",               5 }, -- AGI +6
        [ 4099] = { 514 , 12, 5 , "Earth Cluster",              5 }, -- VIT +6
        [ 4100] = { 513 , 12, 5 , "Lightning Cluster",          5 }, -- DEX +6
        [ 4101] = { 517 , 12, 5 , "Water Cluster",              5 }, -- MND +6
        [ 4102] = { 518 , 12, 5 , "Light Cluster",              5 }, -- CHR +6
        [ 4103] = { 17  , 12, 23, "Dark Cluster",               5 }, -- HP/MP +24
        [ 1691] = { 33  , 3 , 23, "Giant Scale",                5 }, -- Defense +24
        [ 3541] = { 39  , 3 , 4 , "Seasoning Stone",            5 }, -- Enmity +8
        [ 2953] = { 41  , 3 , 2 , "Viscous Spittle",            5 }, -- 
        [ 1619] = { 53  , 3 , 5 , "Hippogryph Feather",         5 }, -- 
        [ 5113] = { 57  , 3 , 2 , "Cracked Nut",                5 }, -- 
        [ 4526] = { 61  , 3 , 0 , "Silkworm Egg",               5 }, -- 
        [ 1685] = { 81  , 3 , 5 , "Warding Oil",                5 }, -- 
        [ 1980] = { 112 , 3 , 1 , "Antican Acid",               5 }, -- 
        [17397] = { 108 , 3 , 3 , "Shell Bug",                  5 }, -- 
        [  842] = { 124 , 3 , 5 , "Giant Bird Feather",         5 }, -- 
        [  557] = { 131 , 3 , 3 , "Ahriman Lens",               5 }, -- 
        [ 1666] = { 134 , 3 , 5 , "Chameleon Diamond",          5 }, -- 
        [ 5115] = { 140 , 3 , 7 , "R. Moko Grass",              5 }, -- 
        [ 1612] = { 288 , 3 , 7 , "Radiant Memory",             5 }, -- Recycle +8
        [ 1608] = { 290 , 3 , 7 , "Fleeting Memory",            5 }, -- Ninja Tool Expertise +8
        [ 1611] = { 291 , 3 , 7 , "Shimmering Memory",          5 }, -- 
        [ 1609] = { 294 , 3 , 7 , "Profane Memory",             5 }, -- Fast Cast +
        [ 1610] = { 296 , 3 , 7 , "Startling Memory",           5 }, -- Enemy Critical Hit Rate -3%
        [ 1607] = { 299 , 6 , 7 , "Bitter Memory",              5 }, -- 
        [ 1772] = { 299 , 3 , 7 , "Super Cermet",               5 }, -- Shield Skill +8
        [ 2524] = { 330 , 3 , 5 , "Peiste Stinger",             5 }, -- 
        [ 5116] = { 334 , 3 , 7 , "Cavorting Worm",             5 }, -- 
        [  906] = { 740 , 3 , 3 , "Starmite Shell",             5 }, -- 
        [  897] = { 69  , 1 , 14, "Scorpion Claw",              5 }, -- 
        [  896] = { 131 , 1 , 14, "Scorpion Shell",             5 }, -- 
        [  902] = { 134 , 1 , 14, "Demon Horn",                 5 }, -- 
        [  886] = { 142 , 1 , 14, "Demon Skull",                5 }, -- 
        [  924] = { 195 , 1 , 9 , "Fiend Blood",                5 }, -- 
        [ 1116] = { 143 , 1 , 4 , "Manticore Hide",             5 }, -- 
        [ 1123] = { 144 , 1 , 1 , "Manticore Fang",             5 }, -- 
        [ 1127] = { 353 , 3 , 4 , "Kindred Seal",               5 }, -- 
        [ 1117] = { 354 , 1 , 0 , "Manticore Leather",          5 }, -- 
        [ 2150] = { 232 , 1 , 0 , "Colibri Feather",            5 }, -- True Shot +1
        [ 2157] = { 251 , 1 , 2 , "Imp Horn",                   5 }, -- Daken +3
        [ 2171] = { 211 , 1 , 4 , "Colibri Beak",               5 }, -- Snapshot +4
        [ 2147] = { 112 , 1 , 2 , "Marid Tusk",                 5 }, -- 
        [ 2151] = { 71  , 1 , 14, "Marid Hide",                 5 }, -- Damage Taken -1%
        [ 2158] = { 327 , 1 , 4 , "Hydra Fang",                 5 }, -- 
        [ 2168] = { 369 , 1 , 4 , "Cerberus Claw",              5 }, -- 
        [ 2371] = { 334 , 1 , 4 , "Khimaira Horn",              5 }, -- 
        [ 2371] = { 334 , 1 , 4 , "Dahu Hair",                  5 }, -- 
        [ 2371] = { 334 , 1 , 4 , "Manticore Hair",             5 }, -- 
    },
    -- Tier 6 Augments (testimonies, anima, sky/sea drops)
    [6] = {
        [ 1255] = { 143 , 1 , 6 , "Fire Ore",                   6 }, -- STR +7
        [ 1256] = { 334 , 1 , 6 , "Ice Ore",                    6 }, -- INT +7
        [ 1257] = { 140 , 1 , 6 , "Wind Ore",                   6 }, -- AGI +7
        [ 1258] = { 99  , 1 , 6 , "Earth Ore",                  6 }, -- VIT +7
        [ 1259] = { 146 , 1 , 6 , "Lightning Ore",              6 }, -- DEX +7
        [ 1260] = { 371 , 1 , 6 , "Water Ore",                  6 }, -- MND +7
        [ 1261] = { 369 , 1 , 6 , "Light Ore",                  6 }, -- CHR +7
        [ 1262] = { 321 , 1 , 27, "Dark Ore",                   6 }, -- HP/MP +28
        [ 1426] = { 132 , 1 , 5 , "Warrior Testimony",          6 }, -- Dbl.Atk. +6% / Crit.hit rate +6%
        [ 1427] = { 194 , 1 , 5 , "Monk Testimony",             6 }, -- Kick Attacks +6
        [ 1428] = { 371 , 1 , 5 , "White Mage Testimony",       6 }, -- 
        [ 1429] = { 334 , 1 , 5 , "Black Mage Testimony",       6 }, -- Magic Burst Damage +6%
        [ 1430] = { 140 , 1 , 5 , "Red Mage Testimony",         6 }, -- Enfeebling Magic Duration +20%
        [ 1431] = { 147 , 1 , 0 , "Thief Testimony",            6 }, -- Treasure Hunter +1
        [ 1432] = { 71  , 1 , 5 , "Paladin Testimony",          6 }, -- Damage Taken -2%
        [ 1433] = { 327 , 1 , 5 , "Dark Knight Testimony",      6 }, -- Weapon Skill Damage +6%
        [ 1434] = { 124 , 1 , 17, "Beastmaster Testimony",      6 }, -- Pet: Acc/R.Acc/Atk/R.Atk +16
        [ 1435] = { 322 , 1 , 5 , "Bard Testimony",             6 }, -- Song Spellcasting Time -6%
        [ 1436] = { 211 , 1 , 5 , "Ranger Testimony",           6 }, -- Ranged Weapon Delay -64
        [ 1437] = { 1264, 1 , 5 , "Samurai Testimony",          6 }, -- Meditate Duration +6
        [ 1438] = { 215 , 1 , 5 , "Ninja Testimony",            6 }, -- Melee Weapon Delay -64
        [ 1439] = { 122 , 1 , 14, "Dragoon Testimony",          6 }, -- Pet: TP Bonus +300
        [ 1440] = { 369 , 1 , 5 , "Summoner Testimony",         6 }, -- Avatar: Blood Pact Damage +6%
        [ 2331] = { 334 , 1 , 6 , "Blue Mage Testimony",        6 }, -- Skillchain Damage +6%
        [ 2333] = { 278 , 1 , 6 , "Puppetmaster Testimony",     6 }, -- 
        [ 2332] = { 211 , 1 , 6 , "Corsair Testimony",          6 }, -- Snapshot +6
        [ 2556] = { 330 , 1 , 6 , "Dancer Testimony",           6 }, -- 
        [ 2557] = { 334 , 1 , 7 , "Scholar Testimony",          6 }, -- Magic Burst Damage +8%
        [  495] = { 334 , 1 , 7 , "Quadav Charm",               6 }, -- 
        [ 1101] = { 334 , 1 , 7 , "Mottled Quadav Egg",         6 }, -- 
        [ 2557] = { 334 , 1 , 7 , "Scholar Testimony",          6 }, -- 
        [ 2166] = { 334 , 1 , 4 , "Marid Hair",                 6 }, -- 
        [ 2463] = { 334 , 1 , 4 , "Colorful Hair",              6 }, -- 
        [ 2337] = { 334 , 1 , 4 , "Wamoura Hair",               6 }, -- 
        [  772] = { 294 , 12, 7 , "Green Rock",                 6 }, -- Summoning Magic Skill +8
        [  769] = { 291 , 12, 7 , "Red Rock",                   6 }, -- Enfeebling Magic Skill +8
        [  770] = { 299 , 12, 7 , "Blue Rock",                  6 }, -- Blue Magic Skill +8
        [  774] = { 290 , 12, 7 , "Purple Rock",                6 }, -- Enhancing Magic Skill +8
        [  771] = { 289 , 12, 7 , "Yellow Rock",                6 }, -- Healing Magic Skill +8
        [  773] = { 292 , 12, 7 , "Translucent Rock",           6 }, -- Elemental Magic Skill +8
        [  775] = { 293 , 12, 7 , "Black Rock",                 6 }, -- Dark Magic Skill +8
        [  776] = { 288 , 12, 7 , "White Rock",                 6 }, -- Divine Magic Skill +8
        [ 3297] = { 740 , 60, 15, "Flame Geode",                6 }, -- Melee Weapon Damage +16
        [ 3298] = { 139 , 30, 15, "Snow Geode",                 6 }, -- Rapid Shot +16%
        [ 3299] = { 746 , 60, 15, "Breeze Geode",               6 }, -- Ranged Weapon Damage +16
        [ 3300] = { 368 , 30, 1 , "Soil Geode",                 6 }, -- Phalanx Received +2
        [ 3301] = { 41  , 30, 3 , "Thunder Geode",              6 }, -- Critical Hit Chance +4%
        [ 3302] = { 371 , 30, 3 , "Aqua Geode",                 6 }, -- Regen Potency +4
        [ 3303] = { 1248, 30, 19, "Light Geode",                6 }, -- Enhancing Magic Duration +20%
        [ 3304] = { 1158, 30, 3 , "Shadow Geode",               6 }, -- Occ. Resist Status Ailments +4
    },
    -- Tier 7 Augments (NM/HNM Drops) (job seals: head / hands)
    [7] = {
        [ 1784] = { 108 , 1 , 24, "Phuabo Organ",               7 }, -- Pet: Magic Accuracy/Magic Attack Bonus +25
        [ 1785] = { 131 , 1 , 24, "Xzomit Organ",               7 }, -- Magic Accuracy/Magic Attack Bonus +25
        [ 1786] = { 68  , 1 , 27, "Aern Organ",                 7 }, -- Accuracy/Attack +28
        [ 1787] = { 69  , 1 , 27, "Hpemde Organ",               7 }, -- Ranged Accuracy/Ranged Attack +28
        [ 1788] = { 353 , 1 , 8 , "Yovra Organ",                7 }, -- TP Bonus +450
        [ 1818] = { 144 , 1 , 3 , "Euvhi Organ",                7 }, -- Triple Attack +4%
        [ 1819] = { 354 , 1 , 2 , "Luminion Chip",              7 }, -- Quadruple Attack +3%
        [ 1404] = { 68  , 1 , 19, "Seal of Genbu",              7 }, -- Accuracy/Attack +20
        [ 1405] = { 69  , 1 , 19, "Seal of Seiryu",             7 }, -- Ranged Accuracy/Ranged Attack +20
        [ 1406] = { 131 , 1 , 19, "Seal of Byakko",             7 }, -- Magic Accuracy/Magic Attack Bonus +20
        [ 1407] = { 134 , 1 , 19, "Seal of Suzaku",             7 }, -- Magic Defense Bonus +20
        [ 1419] = { 143 , 1 , 6 , "Springstone",                7 }, -- Double Attack +7%
        [ 1421] = { 144 , 1 , 2 , "Summerstone",                7 }, -- Triple Attack +3%
        [ 1423] = { 354 , 1 , 1 , "Autumnstone",                7 }, -- Quadruple Attack +2%
        [ 1425] = { 327 , 1 , 6 , "Winterstone",                7 }, -- Weapon Skill Damage +7%
        [ 2929] = { 353 , 1 , 6 , "Helm of Briareus",           7 }, -- TP Bonus +350
        [ 2930] = { 334 , 1 , 7 , "Carabosses Gem",             7 }, -- Magic Burst Damage +8%
        [ 2932] = { 140 , 1 , 7 , "Kukulkans Fang",             7 }, -- Fast Cast +8%
        [ 2927] = { 112 , 1 , 3 , "Glavoid Shell",              7 }, -- Pet: Damage Taken -4%
        [ 2928] = { 371 , 1 , 7 , "Two-Leaf Chloris Bud",       7 }, -- Regen Potency +8
        [ 2963] = { 251 , 1 , 7 , "Ulhuadshis Fang",            7 }, -- Daken +8
        [ 2964] = { 215 , 1 , 7 , "Sobeks Skin",                7 }, -- Ninja Tool Expertise +8
        [ 1313] = { 1798, 1 , 13, "Siren's Hair",               7 }, -- Pet: CHR +14
        [ 3316] = { 512 , 1 , 13, "Flame Gem",                  7 }, -- STR +14
        [ 3317] = { 516 , 1 , 13, "Snow Gem",                   7 }, -- INT +14
        [ 3318] = { 515 , 1 , 13, "Breeze Gem",                 7 }, -- AGI +14
        [ 3319] = { 514 , 1 , 13, "Soil Gem",                   7 }, -- VIT +14
        [ 3320] = { 513 , 1 , 13, "Thunder Gem",                7 }, -- DEX +14
        [ 3321] = { 517 , 1 , 13, "Aqua Gem",                   7 }, -- MND +14
        [ 3322] = { 518 , 1 , 13, "Light Gem",                  7 }, -- CHR +14
        [ 3323] = { 1798, 1 , 13, "Shadow Gem",                 7 }, -- Pet: CHR +14
        -- Siren's Hair 1313
    },
    -- Tier 8 Augments (job seals: legs / feet)
    [8] = {
        [ 3110] = { 68  , 2 , 24, "Ravagers Seal: Head",        8 }, -- Accuracy/Attack +25
        [ 3111] = { 194 , 2 , 8 , "Tantra Seal: Head",          8 }, -- Kick Attacks +9
        [ 3112] = { 329 , 2 , 8 , "Orison Seal: Head",          8 }, -- Cure Potency +9%
        [ 3113] = { 334 , 2 , 8 , "Goetia Seal: Head",          8 }, -- Magic Burst Damage +9%
        [ 3114] = { 140 , 2 , 8 , "Estoqueurs Seal: Head",      8 }, -- Fast Cast +9%
        [ 3115] = { 147 , 2 , 2 , "Raiders Seal: Head",         8 }, -- Treasure Hunter +3
        [ 3118] = { 124 , 2 , 24, "Ferine Seal: Head",          8 }, -- Pet: Acc/R.Acc/Atk/R.Atk +25
        [ 3119] = { 67  , 2 , 0 , "Aoidos Seal: Head",          8 }, -- All Songs +1
        [ 3120] = { 211 , 2 , 8 , "Sylvan Seal: Head",          8 }, -- Snapshot +9
        [ 3121] = { 327 , 2 , 8 , "Unkai Seal: Head",           8 }, -- Weapon Skill Damage +9%
        [ 3122] = { 251 , 2 , 8 , "Iga Seal: Head",             8 }, -- Daken +9
        [ 3123] = { 122 , 2 , 24, "Lancers Seal: Head",         8 }, -- Pet: TP Bonus +500
        [ 3124] = { 120 , 2 , 8 , "Callers Seal: Head",         8 }, -- Avatar: Magic Attack Bonus +9
        [ 3125] = { 334 , 2 , 9 , "Mavi Seal: Head",            8 }, -- Magic Burst Damage +10%
        [ 3127] = { 280 , 2 , 8 , "Cirque Seal: Head",          8 }, -- Automaton Magic Skill +9
        [ 3130] = { 68  , 2 , 10, "Ravagers Seal: Body",        8 }, -- Accuracy/Attack +11
        [ 3131] = { 194 , 2 , 10, "Tantra Seal: Body",          8 }, -- Kick Attacks +11
        [ 3132] = { 371 , 2 , 10, "Orison Seal: Body",          8 }, -- Regen Potency +11
        [ 3133] = { 334 , 2 , 10, "Goetia Seal: Body",          8 }, -- Magic Burst Damage +11%
        [ 3134] = { 140 , 2 , 10, "Estoqueurs Seal: Body",      8 }, -- Fast Cast +11%
        [ 3135] = { 147 , 2 , 3 , "Raiders Seal: Body",         8 }, -- Treasure Hunter +4
        [ 3136] = { 49  , 2 , 10, "Creed Seal: Body",           8 }, -- Haste +11%
        [ 3137] = { 327 , 2 , 10, "Bale Seal: Body",            8 }, -- Weapon Skill Damage +11%
        [ 3138] = { 124 , 2 , 10, "Ferine Seal: Body",          8 }, -- Pet: Acc/R.Acc/Atk/R.Atk +11
        [ 3139] = { 322 , 2 , 10, "Aoidos Seal: Body",          8 }, -- Song Spellcasting Time -11%
        [ 3140] = { 211 , 2 , 10, "Sylvan Seal: Body",          8 }, -- Snapshot +11
        [ 3141] = { 327 , 2 , 10, "Unkai Seal: Body",           8 }, -- Weapon Skill Damage +11%
        [ 3142] = { 215 , 2 , 10, "Iga Seal: Body",             8 }, -- Ninja Tool Expertise +11
        [ 3143] = { 122 , 2 , 25, "Lancers Seal: Body",         8 }, -- Pet: TP Bonus +520
        [ 3144] = { 369 , 2 , 10, "Callers Seal: Body",         8 }, -- Avatar: Blood Pact Damage +11
        [ 3145] = { 334 , 2 , 10, "Mavi Seal: Body",            8 }, -- Magic Burst Damage +11%
        [ 3146] = { 211 , 2 , 10, "Navarchs Seal: Body",        8 }, -- Snapshot +11
        [ 3147] = { 279 , 2 , 10, "Cirque Seal: Body",          8 }, -- Automaton Ranged Skill +11
        [ 3148] = { 330 , 2 , 10, "Charis Seal: Body",          8 }, -- Waltz Potency +11%
        [ 3149] = { 334 , 2 , 10, "Savant Seal: Body",          8 }, -- Magic Burst Damage +11%
        [ 3150] = { 68  , 2 , 11, "Ravagers Seal: Hands",       8 }, -- Accuracy/Attack +12
        [ 3151] = { 194 , 2 , 11, "Tantra Seal: Hands",         8 }, -- Kick Attacks +12
        [ 3152] = { 371 , 2 , 11, "Orison Seal: Hands",         8 }, -- Regen Potency +12
        [ 3153] = { 334 , 2 , 11, "Goetia Seal: Hands",         8 }, -- Magic Burst Damage +12%
        [ 3154] = { 140 , 2 , 11, "Estoqueurs Seal: Hands",     8 }, -- Fast Cast +12%
        [ 3155] = { 147 , 2 , 4 , "Raiders Seal: Hands",        8 }, -- Treasure Hunter +5
        [ 3156] = { 49  , 2 , 11, "Creed Seal: Hands",          8 }, -- Haste +12%
        [ 3157] = { 327 , 2 , 11, "Bale Seal: Hands",           8 }, -- Weapon Skill Damage +12%
        [ 3158] = { 124 , 2 , 11, "Ferine Seal: Hands",         8 }, -- Pet: Acc/R.Acc/Atk/R.Atk +12
        [ 3159] = { 322 , 2 , 11, "Aoidos Seal: Hands",         8 }, -- Song Spellcasting Time -12%
        [ 3160] = { 211 , 2 , 11, "Sylvan Seal: Hands",         8 }, -- Snapshot +12
        [ 3161] = { 327 , 2 , 11, "Unkai Seal: Hands",          8 }, -- Weapon Skill Damage +12%
        [ 3162] = { 215 , 2 , 11, "Iga Seal: Hands",            8 }, -- Ninja Tool Expertise +12
        [ 3163] = { 122 , 2 , 26, "Lancers Seal: Hands",        8 }, -- Pet: TP Bonus +540
        [ 3164] = { 369 , 2 , 11, "Callers Seal: Hands",        8 }, -- Avatar: Blood Pact Damage +12
        [ 3165] = { 334 , 2 , 11, "Mavi Seal: Hands",           8 }, -- Magic Burst Damage +12%
        [ 3166] = { 211 , 2 , 11, "Navarchs Seal: Hands",       8 }, -- Snapshot +12
        [ 3167] = { 279 , 2 , 11, "Cirque Seal: Hands",         8 }, -- Automaton Ranged Skill +12
        [ 3168] = { 330 , 2 , 11, "Charis Seal: Hands",         8 }, -- Waltz Potency +12%
        [ 3169] = { 334 , 2 , 11, "Savant Seal: Hands",         8 }, -- Magic Burst Damage +12%
        [ 3520] = { 952 , 1 , 0 , "Ifritite",                   8 }, -- Fire Affinity: Avatar Perp Cost -1
        [ 3521] = { 953 , 1 , 0 , "Shivite",                    8 }, -- Ice Affinity: Avatar Perp Cost -1
        [ 3522] = { 954 , 1 , 0 , "Garudite",                   8 }, -- Wind Affinity: Avatar Perp Cost -1
        [ 3523] = { 955 , 1 , 0 , "Titanite",                   8 }, -- Earth Affinity: Avatar Perp Cost -1
        [ 3524] = { 956 , 1 , 0 , "Ramuite",                    8 }, -- Thunder Affinity: Avatar Perp Cost -1
        [ 3525] = { 957 , 1 , 0 , "Leviatite",                  8 }, -- Water Affinity: Avatar Perp Cost -1
        [ 3526] = { 958 , 1 , 0 , "Carbite",                    8 }, -- Light Affinity: Avatar Perp Cost -1
        [ 3527] = { 959 , 1 , 0 , "Fenrite",                    8 }, -- Dark Affinity: Avatar Perp Cost -1
    },
    -- Tier 9 Augments (job seals: body) (curio moogle craft materials) (high quality craft crystals)
    [9] = {
        [  873] = { 68  , 7 , 2 , "Red Chip",                   9 }, -- Fire Affinity +3
        [  475] = { 131 , 7 , 2 , "Blue Chip",                  9 }, -- Water Affinity +3
        [  476] = { 69  , 7 , 2 , "Yellow Chip",                9 }, -- Earth Affinity +3
        [  477] = { 134 , 7 , 2 , "Green Chip",                 9 }, -- Air Affinity +3
        [  478] = { 140 , 7 , 2 , "Clear Chip",                 9 }, -- Ice Affinity +3
        [  479] = { 142 , 7 , 2 , "Purple Chip",                9 }, -- Lightning Affinity +3
        [  480] = { 123 , 7 , 2 , "White Chip",                 9 }, -- Light Affinity +3
        [  481] = { 112 , 7 , 2 , "Black Chip",                 9 }, -- Dark Affinity +3
        [ 1299] = { 512 , 1 , 15, "Fire Bead",                  9 }, -- STR +16
        [ 1300] = { 516 , 1 , 15, "Ice Bead",                   9 }, -- INT +16
        [ 1301] = { 515 , 1 , 15, "Wind Bead",                  9 }, -- AGI +16
        [ 1302] = { 514 , 1 , 15, "Earth Bead",                 9 }, -- VIT +16
        [ 1303] = { 513 , 1 , 15, "Lightning Bead",             9 }, -- DEX +16
        [ 1304] = { 517 , 1 , 15, "Water Bead",                 9 }, -- MND +16
        [ 1305] = { 518 , 1 , 15, "Light Bead",                 9 }, -- CHR +16
        [ 1306] = { 1796, 1 , 15, "Dark Bead",                  9 }, -- Pet: INT +16
        [ 4238] = { 68  , 1 , 30, "Inferno Crystal",            9 }, -- Accuracy/Attack +31
        [ 4239] = { 131 , 1 , 30, "Glacier Crystal",            9 }, -- Magic Accuracy/Magic Attack Bonus +31
        [ 4240] = { 69  , 1 , 30, "Cyclone Crystal",            9 }, -- Ranged Accuracy/Ranged Attack +31
        [ 4241] = { 99  , 1 , 30, "Terra Crystal",              9 }, -- Pet: Defense +31
        [ 4242] = { 143 , 1 , 9 , "Plasma Crystal",             9 }, -- Double Attack +10%
        [ 4243] = { 371 , 1 , 9 , "Torrent Crystal",            9 }, -- Regen Potency +10
        [ 4244] = { 369 , 1 , 9 , "Aurora Crystal",             9 }, -- Avatar: Blood Pact Damage +10
        [ 4245] = { 138 , 1 , 9 , "Twilight Crystal",           9 }, -- Refresh +10
        [ 3494] = { 144 , 1 , 4 , "Forgotten Hope",             9 }, -- Triple Attack +5%
        [ 3495] = { 354 , 1 , 3 , "Forgotten Touch",            9 }, -- Quadruple Attack +4%
        [ 3497] = { 327 , 1 , 9 , "Forgotten Step",             9 }, -- Weapon Skill Damage +10%
        [ 1452] = { 353 , 25, 9 , "Ordelle Bronzepiece",        9 }, -- TP Bonus +500
        [ 1455] = { 146 , 25, 9 , "One Byne Bill",              9 }, -- Dual Wield +10
        [ 3290] = { 334 , 1 , 9 , "Isgebinds Heart",            9 }, -- Magic Burst Damage +10%
        [ 3287] = { 143 , 1 , 11, "Orthrus Claw",               9 }, -- Double Attack +12%
        [ 3288] = { 112 , 1 , 4 , "Draguas Scale",              9 }, -- Pet: Damage Taken -5%
        [ 3289] = { 122 , 1 , 29, "Apademak Horn",              9 }, -- Pet: TP Bonus +600
        [ 3291] = { 211 , 1 , 9 , "Alfards Fang",               9 }, -- Snapshot +10
        [ 3292] = { 215 , 1 , 9 , "Azdajas Horn",               9 }, -- Ninja Tool Expertise +10
        [ 2169] = { 124 , 1 , 30, "Cerberus Hide",              9 }, -- Pet: Acc/R.Acc/Atk/R.Atk +31
        [ 2372] = { 140 , 1 , 9 , "Khimaira Mane",              9 }, -- Fast Cast +10%
        [ 2172] = { 251 , 1 , 9 , "Hydra Scale",                9 }, -- Daken +10
        [ 3493] = { 143 , 1 , 10, "Forgotten Thought",          9 }, -- Double Attack +11%
        [ 3496] = { 140 , 1 , 10, "Forgotten Journey",          9 }, -- Fast Cast +11%
    },
}

-- Function to get the tier of an item based on its ID
function augmentData.getItemTier(itemID)
    -- First, check predefined item lists
    for tier, items in pairs(augmentData.equipmentTier) do
        for _, id in ipairs(items) do
            if id == itemID then
                return tier
            end
        end
    end
    
    -- Then check for item ranges (example for Tier 5)
    if itemID >= 10240 and itemID <= 28671 then
        return 9 -- Assign to Tier 9 if within range
    end

    -- You can add additional ranges here for other tiers if needed.

    return 0 -- If not found, return 0 indicating the item cannot be augmented
end


-- Function to retrieve augments for a given item tier and the materials traded
function augmentData.getAugmentsForTrade(itemTier, trade)
    local selectedAugments = {}
    local selectedAugmentIDs = {}

    -- Loop through trade items and check if they correspond to valid augments
    for i = 1, trade:getItemCount() do
        local materialID = trade:getItemId(i)
        local qty = trade:getItemQty(i)

        -- For each material, check if it can apply an augment for the item's tier or lower
        for tier = itemTier, 0, -1 do
            local augmentInfo = augmentData.augmentTable[tier] and augmentData.augmentTable[tier][materialID]
            local augmentID = augmentInfo and (augmentInfo.augmentID or augmentInfo[1])
            local requiredQty = augmentInfo and (augmentInfo.requiredQty or augmentInfo[2])
            if augmentInfo and qty >= requiredQty and not selectedAugmentIDs[augmentID] then
                table.insert(selectedAugments, {
                    augmentID = augmentID,
                    power = augmentInfo.power or augmentInfo[3],
                    materialName = augmentInfo.materialName or augmentInfo[4],
                    desc = augmentInfo.desc,
                    tier = augmentInfo.tier or augmentInfo[5],
                })
                selectedAugmentIDs[augmentInfo.augmentID] = true
                break
            end
        end
        if #selectedAugments >= MAX_AUGMENTS_PER_ITEM then break end -- Stop if 4 unique augments are found
    end

    return selectedAugments
end

return augmentData
