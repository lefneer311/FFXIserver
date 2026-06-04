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

-- Define equipment tiers (assigning equipment to specific tiers)
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
-- Augment values can be identified in the server/source/sql/augments.sql file
--
augmentData.augmentTable = {
    -- Tier 0 Augments
    [0] = {
        [ 4096] = { augmentID = 68,      requiredQty = 3,    power = 1,   materialName = "Fire Crystal",            tier = 0, desc = "Accuracy/Attack +2" },
        [ 4098] = { augmentID = 69,      requiredQty = 3,    power = 1,   materialName = "Wind Crystal",            tier = 0, desc = "Ranged Accuracy/Ranged Attack +2" },
        [ 4100] = { augmentID = 41,      requiredQty = 3,    power = 1,   materialName = "Lightning Crystal",       tier = 0, desc = "Critical Hit Rate +2%" },
        [ 4101] = { augmentID = 81,      requiredQty = 3,    power = 3,   materialName = "Water Crystal",           tier = 0, desc = "Evasion/Magic Evasion +4" },
        [ 4097] = { augmentID = 131,     requiredQty = 3,    power = 1,   materialName = "Ice Crystal",             tier = 0, desc = "Magic Accuracy/Magic Attack Bonus +2" },
        [ 4099] = { augmentID = 33,      requiredQty = 3,    power = 5,   materialName = "Earth Crystal",           tier = 0, desc = "Defense +6" },
        [ 4102] = { augmentID = 134,     requiredQty = 3,    power = 1,   materialName = "Light Crystal",           tier = 0, desc = "Magic Defense Bonus +2" },
        [ 4103] = { augmentID = 142,     requiredQty = 3,    power = 2,   materialName = "Dark Crystal",            tier = 0, desc = "Store TP +3" },
        [  627] = { augmentID = 362,     requiredQty = 3,    power = 1,   materialName = "Maple Sugar",             tier = 0, desc = "Magic Damage +2" },
        [  859] = { augmentID = 137,     requiredQty = 1,    power = 2,   materialName = "Ram Skin",                tier = 0, desc = "Regen +1" },
        [  895] = { augmentID = 53,      requiredQty = 1,    power = 2,   materialName = "Ram Horn",                tier = 0, desc = "Spell Interrupt Rate Down +4%" },
    },
    -- Tier 1 Augments
    [1] = {
        [  859] = { augmentID = 137,    requiredQty = 1,    power = 0,   materialName = "Ram Skin",                 tier = 1, desc = "Regen +1" },                                      -- Regen +1
        [  895] = { augmentID = 138,    requiredQty = 1,    power = 0,   materialName = "Ram Horn",                 tier = 1, desc = "Refresh +1" },                                    -- Refresh +1
        [  744] = { augmentID = 68,     requiredQty = 3,    power = 2,   materialName = "Silver Ingot",             tier = 1, desc = "Accuracy/Attack +3" },                            -- Accuracy/Attack +3
        [  826] = { augmentID = 69,     requiredQty = 3,    power = 2,   materialName = "Linen Cloth",              tier = 1, desc = "Ranged Accuracy/Ranged Attack +3" },              -- Ranged Accuracy/Ranged Attack +3
        [  711] = { augmentID = 131,    requiredQty = 3,    power = 1,   materialName = "Walnut Lumber",            tier = 1, desc = "Magic Accuracy/Magic Attack Bonus +2" },          -- Magic Accuracy/Magic Attack Bonus +2
        [  615] = { augmentID = 134,    requiredQty = 3,    power = 2,   materialName = "Selbina Butter",           tier = 1, desc = "Magic Defense Bonus +3" },                        -- Magic Defense Bonus +3
        [ 2011] = { augmentID = 142,    requiredQty = 3,    power = 5,   materialName = "Wolf Fur",                 tier = 1, desc = "Store TP +6" },                                   -- Store TP +6
        [  662] = { augmentID = 143,    requiredQty = 3,    power = 2,   materialName = "Iron Sheet",               tier = 1, desc = "Double Attack +3%" },                             -- Double Attack +3%
        [ 1111] = { augmentID = 145,    requiredQty = 3,    power = 2,   materialName = "Gelatin",                  tier = 1, desc = "Counter +3%" },                                   -- Counter +3%
        [ 2113] = { augmentID = 146,    requiredQty = 6,    power = 2,   materialName = "Baking Soda",              tier = 1, desc = "Dual Wield +3" },                                 -- Dual Wield +3
        [ 1882] = { augmentID = 176,    requiredQty = 3,    power = 2,   materialName = "Flaxseed Oil",             tier = 1, desc = "Resist Sleep +3" },                               -- Resist Sleep +3
        [  764] = { augmentID = 178,    requiredQty = 3,    power = 2,   materialName = "Brass Chain",              tier = 1, desc = "Resist Paralyze +3" },                            -- Resist Paralyze +3
        [  848] = { augmentID = 180,    requiredQty = 3,    power = 2,   materialName = "Dhalmel Leather",          tier = 1, desc = "Resist Silence +3" },                             -- Resist Silence +3
        [ 2109] = { augmentID = 182,    requiredQty = 3,    power = 2,   materialName = "Bittern",                  tier = 1, desc = "Resist Petrify +3" },                             -- Resist Petrify +3
        [ 1635] = { augmentID = 188,    requiredQty = 3,    power = 2,   materialName = "Paktong Ingot",            tier = 1, desc = "Resist Charm +3" },                               -- Resist Charm +3
        [  627] = { augmentID = 362,    requiredQty = 3,    power = 2,   materialName = "Maple Sugar",              tier = 1, desc = "Magic Damage +3" },                               -- Magic Damage +3
    },
    -- Tier 2 Augments
    [2] = {
        [ 1691] = { augmentID = 33,     requiredQty = 3,    power = 23,  materialName = "Giant Scale",              tier = 2, desc = "Defense +24" },                                   -- Defense +24
        [ 3541] = { augmentID = 39,     requiredQty = 3,    power = 4,   materialName = "Seasoning Stone",          tier = 2, desc = "Enmity +5" },                                     -- Enmity +5
        [ 2953] = { augmentID = 41,     requiredQty = 3,    power = 2,   materialName = "Viscous Spittle",          tier = 2, desc = "Critical Hit Rate +3%" },                         -- Critical Hit Rate +3%
        [ 4368] = { augmentID = 44,     requiredQty = 3,    power = 5,   materialName = "2-Leaf Mandragora Bud",    tier = 2, desc = "Store TP/Subtle Blow +6" },                       -- Store TP/Subtle Blow +6
        [ 1619] = { augmentID = 53,     requiredQty = 3,    power = 5,   materialName = "Hippogryph Feather",       tier = 2, desc = "Spell Interruption Rate -6%" },                   -- Spell Interruption Rate -6%
        [ 5113] = { augmentID = 57,     requiredQty = 3,    power = 2,   materialName = "Cracked Nut",              tier = 2, desc = "Magical Critical Hit Rate +3%" },                 -- Magical Critical Hit Rate +3%
        [ 4526] = { augmentID = 61,     requiredQty = 3,    power = 0,   materialName = "Silkworm Egg",             tier = 2, desc = "Occ. Resist Status Effects +1%" },                -- Occ. Resist Status Effects +1%
        [  554] = { augmentID = 68,     requiredQty = 3,    power = 5,   materialName = "Gold Orcmask",             tier = 2, desc = "Accuracy/Attack +6" },                            -- Accuracy/Attack +6
        [ 4508] = { augmentID = 69,     requiredQty = 6,    power = 5,   materialName = "Royal Jelly",              tier = 2, desc = "Ranged Accuracy/Ranged Attack +6" },              -- Ranged Accuracy/Ranged Attack +6
        [ 1685] = { augmentID = 81,     requiredQty = 3,    power = 5,   materialName = "Warding Oil",              tier = 2, desc = "Evasion/Magic Evasion +6" },                      -- Evasion/Magic Evasion +6
        [ 1980] = { augmentID = 112,    requiredQty = 3,    power = 1,   materialName = "Antican Acid",             tier = 2, desc = "Pet: Damage Taken -2%" },                         -- Pet: Damage Taken -2%
        [17397] = { augmentID = 108,    requiredQty = 3,    power = 3,   materialName = "Shell Bug",                tier = 2, desc = "Pet: Magic Accuracy/Magic Attack Bonus +4" },     -- Pet: Magic Accuracy/Magic Attack Bonus +4
        [  842] = { augmentID = 124,    requiredQty = 3,    power = 5,   materialName = "Giant Bird Feather",       tier = 2, desc = "Pet: Att/RAtt/Acc/RAcc +6" },                     -- Pet: Att/RAtt/Acc/RAcc +6
        [  557] = { augmentID = 131,    requiredQty = 3,    power = 3,   materialName = "Ahriman Lens",             tier = 2, desc = "Magic Accuracy/Magic Attack Bonus +4" },          -- Magic Accuracy/Magic Attack Bonus +4
        [ 1666] = { augmentID = 134,    requiredQty = 3,    power = 5,   materialName = "Chameleon Diamond",        tier = 2, desc = "Magic Defense Bonus +6" },                        -- Magic Defense Bonus +6
        [ 1114] = { augmentID = 139,    requiredQty = 12,   power = 7,   materialName = "Qdv. Mage Blood",          tier = 2, desc = "Rapid Shot +8" },                                 -- Rapid Shot +8
        [ 5115] = { augmentID = 140,    requiredQty = 3,    power = 7,   materialName = "R. Moko Grass",            tier = 2, desc = "Fast Cast +8%" },                                 -- Fast Cast +8%
		[ 2640] = { augmentID = 896,    requiredQty = 3,    power = 3,   materialName = "Murex Spicule",            tier = 3, desc = "Enspell Damage +4" },                             -- Enspell Damage +4
        [ 1612] = { augmentID = 288,    requiredQty = 3,    power = 7,   materialName = "Radiant Memory",           tier = 2, desc = "Divine Magic Skill +8" },                         -- Divine Magic Skill +8
        [ 1608] = { augmentID = 290,    requiredQty = 3,    power = 7,   materialName = "Fleeting Memory",          tier = 2, desc = "Enhancing Magic Skill +8" },                      -- Enhancing Magic Skill +8
        [ 1611] = { augmentID = 291,    requiredQty = 3,    power = 7,   materialName = "Somber Memory",            tier = 2, desc = "Enfeebling Magic Skill +8" },                     -- Enfeebling Magic Skill +8
        [ 1606] = { augmentID = 292,    requiredQty = 3,    power = 7,   materialName = "Burning Memory",           tier = 2, desc = "Elemental Magic Skill +8" },                      -- Elemental Magic Skill +8
        [ 1613] = { augmentID = 293,    requiredQty = 3,    power = 7,   materialName = "Malevolent Memory",        tier = 2, desc = "Dark Magic Skill +8" },                           -- Dark Magic Skill +8
        [ 1609] = { augmentID = 294,    requiredQty = 3,    power = 7,   materialName = "Profane Memory",           tier = 2, desc = "Summoning Magic Skill +8" },                      -- Summoning Magic Skill +8
        [ 1610] = { augmentID = 296,    requiredQty = 3,    power = 7,   materialName = "Startling Memory",         tier = 2, desc = "Singing Skill +8" },                              -- Singing Skill +8
        [ 1607] = { augmentID = 299,    requiredQty = 6,    power = 7,   materialName = "Bitter Memory",            tier = 2, desc = "Blue Magic Skill +8" },                           -- Blue Magic Skill +8
        [ 1772] = { augmentID = 299,    requiredQty = 3,    power = 7,   materialName = "Super Cermet",             tier = 2, desc = "Shield Skill +8" },                               -- Shield Skill +8
        [ 5154] = { augmentID = 329,    requiredQty = 3,    power = 5,   materialName = "Tavnazian Liver",          tier = 2, desc = "Cure Potency +6%" },                              -- Cure Potency +6%
        [ 2524] = { augmentID = 330,    requiredQty = 3,    power = 5,   materialName = "Peiste Stinger",           tier = 2, desc = "Waltz Potency +6%" },                             -- Waltz Potency +6%
        [ 5116] = { augmentID = 334,    requiredQty = 3,    power = 7,   materialName = "Cavorting Worm",           tier = 2, desc = "Magic Burst Bonus +8%" },                         -- Magic Burst Bonus +8%
        [  906] = { augmentID = 740,    requiredQty = 3,    power = 3,   materialName = "Starmite Shell",           tier = 2, desc = "Main Hand Damage +4" },                           -- Main Hand Damage +4
    },
    -- Tier 3 Augments
    [3] = {
        [ 3300] = { augmentID = 33,     requiredQty = 3,    power = 31,  materialName = "Soil Geode",               tier = 3, desc = "Defense +32" },                                   -- Defense +32
        [ 3304] = { augmentID = 80,     requiredQty = 3,    power = 8,   materialName = "Shadow Geode",             tier = 3, desc = "Magic Accuracy/Magic Damage +9" },                -- Magic Accuracy/Magic Damage +9
        [ 1785] = { augmentID = 144,    requiredQty = 3,    power = 1,   materialName = "Xzomit Organ",             tier = 3, desc = "Triple Attack +2%" },                             -- Triple Attack +2%
		[  666] = { augmentID = 143,    requiredQty = 3,    power = 5,   materialName = "Steel Sheet",              tier = 1, desc = "Double Attack +6%" },                             -- Double Attack +6%
        [ 2187] = { augmentID = 148,    requiredQty = 10,   power = 0,   materialName = "Imperial Gold Piece",      tier = 3, desc = "Gilfinder +1" },                                  -- Gilfinder +1
        [ 1818] = { augmentID = 153,    requiredQty = 3,    power = 5,   materialName = "Euvhi Organ",              tier = 3, desc = "Shield Master +6" },                              -- Shield Master +6
        [ 1787] = { augmentID = 211,    requiredQty = 3,    power = 11,  materialName = "Hpemde Organ",             tier = 3, desc = "Snapshot +12" },                                  -- Snapshot +12
        [ 2890] = { augmentID = 212,    requiredQty = 3,    power = 11,  materialName = "Clionid Wing",             tier = 3, desc = "Recycle +12" },                                   -- Recycle +12
        [ 1784] = { augmentID = 328,    requiredQty = 3,    power = 1,   materialName = "Yovra Organ",              tier = 3, desc = "Critical Hit Damage +2%" },                       -- Critical Hit Damage +2%
        [ 1788] = { augmentID = 335,    requiredQty = 3,    power = 1,   materialName = "Phuabo Organ",             tier = 3, desc = "Magic Critical Hit Damage +2%" },                 -- Magic Critical Hit Damage +2%
        [ 2889] = { augmentID = 341,    requiredQty = 8,    power = 4,   materialName = "Limule Pincer",            tier = 3, desc = "Automaton Repair Potency +5%" },                  -- Automaton Repair Potency +9%
        [ 2641] = { augmentID = 343,    requiredQty = 3,    power = 9,   materialName = "Amoeban Pseudopod",        tier = 3, desc = "Drain and Aspir Potency +10" },                   -- Drain and Aspir Potency +10
        [ 1783] = { augmentID = 1248,   requiredQty = 3,    power = 11,  materialName = "Luminian Tissue",          tier = 3, desc = "Enhancing Magic Duration +12%" },                 -- Enhancing Magic Duration +12%
        [ 3297] = { augmentID = 512,    requiredQty = 3,    power = 5,   materialName = "Flame Geode",              tier = 3, desc = "STR +6" },                                        -- STR +6
        [ 3301] = { augmentID = 513,    requiredQty = 3,    power = 5,   materialName = "Thunder Geode",            tier = 3, desc = "DEX +6" },                                        -- DEX +6
        [ 3299] = { augmentID = 515,    requiredQty = 3,    power = 5,   materialName = "Breeze Geode",             tier = 3, desc = "AGI +6" },                                        -- AGI +6
        [ 3298] = { augmentID = 516,    requiredQty = 3,    power = 5,   materialName = "Snow Geode",               tier = 3, desc = "INT +6" },                                        -- INT +6
        [ 3302] = { augmentID = 517,    requiredQty = 3,    power = 5,   materialName = "Aqua Geode",               tier = 3, desc = "MND +6" },                                        -- MND +6
        [ 3303] = { augmentID = 518,    requiredQty = 3,    power = 5,   materialName = "Light Geode",              tier = 3, desc = "CHR +6" },                                        -- CHR +6
        [ 1819] = { augmentID = 1251,   requiredQty = 3,    power = 11,  materialName = "Luminion Chip",            tier = 3, desc = "Enfeebling Magic Duration +12%" },                -- Enfeebling Magic Duration +12%
        [ 1786] = { augmentID = 1472,   requiredQty = 3,    power = 5,   materialName = "Aern Organ",               tier = 3, desc = "Parry Rate (Inquartata) +6%" },                   -- Parry Rate (Inquartata) +6%
		[  951] = { augmentID = 215,    requiredQty = 12,   power = 11,  materialName = "Wijnruit",                 tier = 3, desc = "Ninja tool expertise +12" },                      -- Ninja tool expertise +12
		[ 1630] = { augmentID = 251,    requiredQty = 3,    power = 5,   materialName = "Pinch of Cluster Ash",     tier = 3, desc = "Daken +6" },                                      -- Daken +6
		[  911] = { augmentID = 194,    requiredQty = 1,    power = 8,   materialName = "Rampaging Horn",           tier = 3, desc = "Kick Attacks +9" },                               -- Kick Attacks +9
		[  910] = { augmentID = 194,    requiredQty = 1,    power = 8,   materialName = "Lumbering Horn",           tier = 3, desc = "Kick Attacks +9" },                               -- Kick Attacks +9

    },
    -- Tier 4 Augments
    [4] = {
        [ 3300] = { augmentID = 1152,   requiredQty = 3,    power = 3,   materialName = "Soil Geode",               tier = 4, desc = "Defense +40" },                                   -- Defense +40
        [ 8960] = { augmentID = 39,     requiredQty = 1,    power = 9,   materialName = "Leaforb Stone",            tier = 4, desc = "Enmity +10" },                                    -- Enmity +10
        [ 8942] = { augmentID = 44,     requiredQty = 1,    power = 9,   materialName = "Leaftip Stone",            tier = 4, desc = "Store TP/Subtle Blow +10" },                      -- Store TP/Subtle Blow +10
        [ 8957] = { augmentID = 81,     requiredQty = 1,    power = 11,  materialName = "Snoworb Stone",            tier = 4, desc = "Evasion/Magic Evasion +12" },                     -- Evasion/Magic Evasion +12
        [ 3951] = { augmentID = 29,     requiredQty = 1,    power = 4,   materialName = "Wailing Stone",            tier = 4, desc = "Pet: Enmity +5" },                                -- Pet: Enmity +5
        [ 3954] = { augmentID = 137,    requiredQty = 1,    power = 11,  materialName = "Ghastly Stone",            tier = 4, desc = "Pet: Regen +25" },                                -- Pet: Regen +12
        [ 4033] = { augmentID = 134,    requiredQty = 1,    power = 4,   materialName = "Verdigris Stone",          tier = 4, desc = "Pet: Magic Defense Bonus +5" },                   -- Pet: Magic Defense Bonus +5
        [ 8933] = { augmentID = 134,    requiredQty = 1,    power = 11,  materialName = "Leafslit Stone",           tier = 4, desc = "Magic Defense Bonus +12" },                       -- Magic Defense Bonus +12
        [ 3974] = { augmentID = 137,    requiredQty = 1,    power = 3,   materialName = "Airlixir",                 tier = 4, desc = "Regen +4" },                                      -- Regen +4
        [ 3895] = { augmentID = 138,    requiredQty = 1,    power = 3,   materialName = "Rala Visage I",            tier = 4, desc = "Refresh +4" },                                    -- Refresh +4
        [ 8939] = { augmentID = 144,    requiredQty = 1,    power = 2,   materialName = "Snowtip Stone",            tier = 4, desc = "Triple Attack +3%" },                             -- Triple Attack +3%
        [ 8954] = { augmentID = 145,    requiredQty = 1,    power = 9,   materialName = "Duskdim Stone",            tier = 4, desc = "Counter +10%" },                                  -- Counter +10%
        [ 3910] = { augmentID = 146,    requiredQty = 1,    power = 7,   materialName = "Cirdas Visage I",          tier = 4, desc = "Dual Wield +8" },                                 -- Dual Wield +8
        [ 8956] = { augmentID = 325,    requiredQty = 1,    power = 2,   materialName = "Duskorb Stone",            tier = 4, desc = "Quick Draw Ability Delay -2" },                   -- Quick Draw Ability Delay -2
        [ 8741] = { augmentID = 329,    requiredQty = 1,    power = 3,   materialName = "Rakaznar Visage I",        tier = 4, desc = "Cure Potency +4%" },                              -- Cure Potency +4%
        [ 4037] = { augmentID = 332,    requiredQty = 1,    power = 1,   materialName = "Yorcia Visage I",          tier = 4, desc = "Skillchain Damage +2%" },                         -- Skillchain Damage +2%
        [ 8930] = { augmentID = 334,    requiredQty = 1,    power = 9,   materialName = "Snowslit Stone",           tier = 4, desc = "Magic Burst Bonus +10%" },                        -- Magic Burst Bonus +10%
        [ 8936] = { augmentID = 353,    requiredQty = 1,    power = 1,   materialName = "Duskslit Stone",           tier = 4, desc = "TP Bonus +100" },                                 -- TP Bonus +100
        [ 8945] = { augmentID = 371,    requiredQty = 1,    power = 4,   materialName = "Dusktip Stone",            tier = 4, desc = "Regen Potency +5%" },                             -- Regen Potency +5%
        [ 8951] = { augmentID = 740,    requiredQty = 1,    power = 7,   materialName = "Leafdim Stone",            tier = 4, desc = "Main Hand Damage +8" },                           -- Main Hand Damage +8
        [ 8948] = { augmentID = 1249,   requiredQty = 1,    power = 7,   materialName = "Snowdim Stone",            tier = 4, desc = "Helix Effect Duration +8" },                      -- Helix Effect Duration +8
    },
    -- Tier 5 Augments
    [5] = {
        [ 8946] = { augmentID = 41,     requiredQty = 1,    power = 7,   materialName = "Dusktip Stone +1",         tier = 5, desc = "Critical Hit Rate +8%" },                         -- Critical Hit Rate +8%
        [ 8940] = { augmentID = 40,     requiredQty = 1,    power = 9,   materialName = "Snowtip Stone +1",         tier = 5, desc = "Magic Critical Hit Rate +10%" },                  -- Magic Critical Hit Rate +10%
        [ 8948] = { augmentID = 50,     requiredQty = 1,    power = 2,   materialName = "Snowdim Stone +1",         tier = 5, desc = "Occ. Resist Status Effects +3" },                 -- Occ. Resist Status Effects +3
        [ 8931] = { augmentID = 132,    requiredQty = 1,    power = 4,   materialName = "Snowslit Stone +1",        tier = 5, desc = "Pet: Double Attack/Critical Hit Rate +5%" },      -- Pet: Double Attack/Critical Hit Rate +5%
        [ 3896] = { augmentID = 142,    requiredQty = 1,    power = 9,   materialName = "Rala Visage II",           tier = 5, desc = "Pet: Store TP +10" },                             -- Pet: Store TP +10
        [ 3911] = { augmentID = 25,     requiredQty = 1,    power = 9,   materialName = "Cirdas Visage II",         tier = 5, desc = "Pet: Magic Evasion +10" },                        -- Pet: Magic Evasion +10
        [ 8742] = { augmentID = 52,     requiredQty = 1,    power = 9,   materialName = "Rakaznar Visage II",       tier = 5, desc = "Pet: Breath +10" },                               -- Pet: Breath +10
        [ 3975] = { augmentID = 53,     requiredQty = 1,    power = 3,   materialName = "Airlixir +1",              tier = 5, desc = "Pet: TP Bonus +40" },                             -- Pet: TP Bonus +40
        [ 4034] = { augmentID = 131,    requiredQty = 1,    power = 9,   materialName = "Verdigris Stone +1",       tier = 5, desc = "Magic Accuracy/Magic Attack Bonus +10" },         -- Magic Accuracy/Magic Attack Bonus +10
        [ 8937] = { augmentID = 140,    requiredQty = 1,    power = 15,  materialName = "Duskslit Stone +1",        tier = 5, desc = "Fast Cast +16%" },                                -- Fast Cast +16%
        [ 3952] = { augmentID = 194,    requiredQty = 1,    power = 14,  materialName = "Wailing Stone +1",         tier = 5, desc = "Kick Attacks +15" },                              -- Kick Attacks +15
        [ 4038] = { augmentID = 335,    requiredQty = 1,    power = 3,   materialName = "Yorcia Visage II",         tier = 5, desc = "Magic Critical Hit Damage +4%" },                 -- Magic Critical Hit Damage +4%
        [ 8943] = { augmentID = 351,    requiredQty = 1,    power = 4,   materialName = "Leaftip Stone +1",         tier = 5, desc = "Occ. Quickens Spellcasting +5%" },                -- Occ. Quickens Spellcasting +5%
        [ 8934] = { augmentID = 360,    requiredQty = 1,    power = 4,   materialName = "Leafslit Stone +1",        tier = 5, desc = "Save TP +50" },                                   -- Save TP +50
        [ 8952] = { augmentID = 512,    requiredQty = 1,    power = 7,   materialName = "Leafdim Stone +1",         tier = 5, desc = "STR +8" },                                        -- STR +8
        [ 8955] = { augmentID = 513,    requiredQty = 1,    power = 7,   materialName = "Duskdim Stone +1",         tier = 5, desc = "DEX +8" },                                        -- DEX +8
        [ 8958] = { augmentID = 515,    requiredQty = 1,    power = 7,   materialName = "Snoworb Stone +1",         tier = 5, desc = "AGI +8" },                                        -- AGI +8
        [ 8964] = { augmentID = 516,    requiredQty = 1,    power = 7,   materialName = "Duskorb Stone +1",         tier = 5, desc = "INT +8" },                                        -- INT +8
        [ 8961] = { augmentID = 517,    requiredQty = 1,    power = 7,   materialName = "Leaforb Stone +1",         tier = 5, desc = "MND +8" },                                        -- MND +8
        [ 3955] = { augmentID = 518,    requiredQty = 1,    power = 7,   materialName = "Ghastly Stone +1",         tier = 5, desc = "CHR +8" },                                        -- CHR +8
    },
    -- Tier 6 Augments
    [6] = {
    -- Heroics (Nocturnal Souls) (all quantities = 1)
        [ 1945] = { augmentID = 44,     requiredQty = 1,    power = 14,  materialName = "Black Rivet",              tier = 6, desc = "Store TP/Subtle Blow +15" },                      -- Store TP/Subtle Blow +15
        [ 1933] = { augmentID = 50,     requiredQty = 1,    power = 3,   materialName = "Ancient Brass",            tier = 6, desc = "Occ. Resist Status Effects +4" },                 -- Occ. Resist Status Effects +4
        [ 3451] = { augmentID = 68,     requiredQty = 1,    power = 19,  materialName = "Comet Fragment",           tier = 6, desc = "Accuracy/Attack +20" },                           -- Accuracy/Attack +20
        [ 1937] = { augmentID = 69,     requiredQty = 1,    power = 19,  materialName = "Diabolic Yarn",            tier = 6, desc = "Ranged Accuracy/Ranged Attack +20" },             -- Ranged Accuracy/Ranged Attack +20
        [ 4029] = { augmentID = 98,     requiredQty = 1,    power = 23,  materialName = "Runeweave",                tier = 6, desc = "Magic Accuracy/Magic Damage +24" },               -- Magic Accuracy/Magic Damage +24
        [ 1932] = { augmentID = 81,     requiredQty = 1,    power = 17,  materialName = "Ut. Gold Thread",          tier = 6, desc = "Evasion/Magic Evasion +18" },                     -- Evasion/Magic Evasion +18
        [ 1947] = { augmentID = 131,    requiredQty = 1,    power = 5,   materialName = "Fetid Lanolin",            tier = 6, desc = "Pet: Magic Accuracy/Magic Attack Bonus +6" },     -- Pet: Magic Accuracy/Magic Attack Bonus +6
        [ 1955] = { augmentID = 53,     requiredQty = 1,    power = 79,  materialName = "Ebony Lacquer",            tier = 6, desc = "Pet: TP Bonus +80" },                             -- Pet: TP Bonus +80
        [ 1938] = { augmentID = 131,    requiredQty = 1,    power = 11,  materialName = "Ruby Silk Thread",         tier = 6, desc = "Magic Accuracy/Magic Attack Bonus +12" },         -- Magic Accuracy/Magic Attack Bonus +12
        [ 1939] = { augmentID = 134,    requiredQty = 1,    power = 14,  materialName = "Cardinal Cloth",           tier = 6, desc = "Magic Defense Bonus +15" },                       -- Magic Defense Bonus +15
        [ 1935] = { augmentID = 144,    requiredQty = 1,    power = 3,   materialName = "Benedict Yarn",            tier = 6, desc = "Triple Attack +4%" },                             -- Triple Attack +4%
        [ 1957] = { augmentID = 328,    requiredQty = 1,    power = 3,   materialName = "Blue Rivet",               tier = 6, desc = "Critical Hit Damage +4%" },                       -- Critical Hit Damage +4%
        [ 1944] = { augmentID = 332,    requiredQty = 1,    power = 2,   materialName = "Dark Orichalcum",          tier = 6, desc = "Skillchain Damage +3%" },                         -- Skillchain Damage +3%
        [ 1931] = { augmentID = 335,    requiredQty = 1,    power = 5,   materialName = "Argyro Rivet",             tier = 6, desc = "Magic Critical Hit Damage +6%" },                 -- Magic Critical Hit Damage +6%
        [ 1946] = { augmentID = 350,    requiredQty = 1,    power = 3,   materialName = "Smalt Leather",            tier = 6, desc = "Occ. Maximize Magic Accuracy +4%" },              -- Occ. Maximize Magic Accuracy +4%
        [ 1943] = { augmentID = 53,     requiredQty = 1,    power = 4,   materialName = "White Rivet",              tier = 6, desc = "TP Bonus +250" },                                 -- TP Bonus +250
        [ 1942] = { augmentID = 740,    requiredQty = 1,    power = 15,  materialName = "Snowy Cermet",             tier = 6, desc = "Main Hand Damage +16" },                          -- Main Hand Damage +16
    },
    -- Continue adding materials for other tiers...
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
        return 5 -- Assign to Tier 5 if within range
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
            if augmentInfo and qty >= augmentInfo.requiredQty and not selectedAugmentIDs[augmentInfo.augmentID] then
                table.insert(selectedAugments, {
                    augmentID = augmentInfo.augmentID,
                    power = augmentInfo.power,
                    materialName = augmentInfo.materialName,
                    desc = augmentInfo.desc,
                    tier = tier -- maybe augmentInfo.tier so it matches
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
