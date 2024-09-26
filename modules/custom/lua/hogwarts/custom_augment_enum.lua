------------------------------------------------------------------
--                      custom_augment_enum
--                      Custom Augment Utilities
--      Provides functions, tables, and items for a custom
--      augmentation shop or system; to be adapted as appropriate
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

local augmentData = {}

-- Define equipment tiers (assigning equipment to specific tiers)
augmentData.equipmentTier = {
    [1] = {1234, 1235, 1236, 1237}, -- Example Tier 1 Weapons
    [2] = {2234, 2235, 2236, 2237}, -- Example Tier 2 Weapons
    [3] = {3234, 3235, 3236, 3237}, -- Example Tier 3 Weapons
    [4] = {4234, 4235, 4236, 4237}, -- Example Tier 4 Weapons
    [5] = {16448, 16535, 5236, 5237}, -- Example Tier 5 Weapons
}

-- Define materials and their corresponding augment for each tier.
-- Augment table format: { augmentID, requiredQty, power, materialName, tier }
-- Augment values can be identified in the server/source/sql/augments.sql file
--
augmentData.augmentTable = {
    -- Tier 1 Augments
    [1] = {
        [2004] = { augmentID = 18, requiredQty = 3, power = 0, materialName = "Carapace Powder", tier = 1 }, -- HP/MP +32
        [744] = { augmentID = 68, requiredQty = 3, power = 3, materialName = "Silver Ingot", tier = 1 }, -- Accuracy/Attack +4
        [826] = { augmentID = 69, requiredQty = 3, power = 3, materialName = "Linen Cloth", tier = 1 }, -- Ranged Accuracy/Ranged Attack +4
        [711] = { augmentID = 131, requiredQty = 3, power = 2, materialName = "Walnut Lumber", tier = 1 }, -- Magic Accuracy/Magic Attack Bonus +3
        [615] = { augmentID = 134, requiredQty = 3, power = 3, materialName = "Selbina Butter", tier = 1 }, -- Magic Defense Bonus +4
        [2011] = { augmentID = 142, requiredQty = 3, power = 1, materialName = "Wolf Fur", tier = 1 }, -- Store TP +2
        [662] = { augmentID = 143, requiredQty = 3, power = 1, materialName = "Iron Sheet", tier = 1 }, -- Double Attack +2%
        [1111] = { augmentID = 145, requiredQty = 3, power = 4, materialName = "Gelatin", tier = 1 }, -- Counter +5%
        [2113] = { augmentID = 146, requiredQty = 6, power = 3, materialName = "Baking Soda", tier = 1 }, -- Dual Wield +4
        [1882] = { augmentID = 176, requiredQty = 3, power = 2, materialName = "Flaxseed Oil", tier = 1 }, -- Resist Sleep +3
        [764] = { augmentID = 178, requiredQty = 3, power = 2, materialName = "Brass Chain", tier = 1 }, -- Resist Paralyze +3
        [848] = { augmentID = 180, requiredQty = 3, power = 2, materialName = "Dhalmel Leather", tier = 1 }, -- Resist Silence +3
        [2109] = { augmentID = 182, requiredQty = 3, power = 2, materialName = "Bittern", tier = 1 }, -- Resist Petrify +3
        [1635] = { augmentID = 188, requiredQty = 3, power = 2, materialName = "Paktong Ingot", tier = 1 }, -- Resist Charm +3
        [627] = { augmentID = 362, requiredQty = 12, power = 2, materialName = "Maple Sugar", tier = 1 }, -- Magic Damage +3
    },
    -- Tier 2 Augments
    [2] = {
        [1691] = { augmentID = 33, requiredQty = 3, power = 7, materialName = "Giant Scale", tier = 2 }, -- Defense +8
        [3541] = { augmentID = 39, requiredQty = 3, power = 4, materialName = "Seasoning Stone", tier = 2 }, -- Enmity +5
        [2953] = { augmentID = 41, requiredQty = 3, power = 4, materialName = "Viscous Spittle", tier = 2 }, -- Critical Hit Rate +5%
        [4368] = { augmentID = 44, requiredQty = 3, power = 4, materialName = "2-Leaf Mandragora Bud", tier = 2 }, -- Store TP/Subtle Blow +5
        [1619] = { augmentID = 53, requiredQty = 3, power = 9, materialName = "Hippogryph Feather", tier = 2 }, -- Spell Interruption Rate -10%
        [5113] = { augmentID = 57, requiredQty = 3, power = 4, materialName = "Cracked Nut", tier = 2 }, -- Magical Critical Hit Rate +5%
        [4526] = { augmentID = 61, requiredQty = 3, power = 0, materialName = "Silkworm Egg", tier = 2 }, -- Occ. Resist Status Effects +1%
        [554] = { augmentID = 68, requiredQty = 3, power = 9, materialName = "Gold Orcmask", tier = 2 }, -- Accuracy/Attack +10
        [4508] = { augmentID = 69, requiredQty = 6, power = 9, materialName = "Royal Jelly", tier = 2 }, -- Ranged Accuracy/Ranged Attack +10
        [1685] = { augmentID = 81, requiredQty = 3, power = 5, materialName = "Warding Oil", tier = 2 }, -- Evasion/Magic Evasion +6
        [1980] = { augmentID = 112, requiredQty = 3, power = 1, materialName = "Antican Acid", tier = 2 }, -- Pet: Damage Taken -2%
        [17397] = { augmentID = 108, requiredQty = 3, power = 3, materialName = "Shell Bug", tier = 2 }, -- Pet: Magic Accuracy/Magic Attack Bonus +4
        [842] = { augmentID = 124, requiredQty = 3, power = 5, materialName = "Giant Bird Feather", tier = 2 }, -- Pet: Att/RAtt/Acc/RAcc +6
        [557] = { augmentID = 80, requiredQty = 3, power = 7, materialName = "Ahriman Lens", tier = 2 }, -- Magic Accuracy/Magic Attack Bonus +8
        [1666] = { augmentID = 134, requiredQty = 3, power = 7, materialName = "Chameleon Diamond", tier = 2 }, -- Magic Defense Bonus +8
        [1114] = { augmentID = 139, requiredQty = 12, power = 7, materialName = "Qdv. Mage Blood", tier = 2 }, -- Rapid Shot +8
        [5115] = { augmentID = 140, requiredQty = 3, power = 7, materialName = "R. Moko Grass", tier = 2 }, -- Fast Cast +8%
        [1612] = { augmentID = 288, requiredQty = 3, power = 4, materialName = "Radiant Memory", tier = 2 }, -- Divine Magic Skill +5
        [1608] = { augmentID = 290, requiredQty = 3, power = 4, materialName = "Fleeting Memory", tier = 2 }, -- Enhancing Magic Skill +5
        [1611] = { augmentID = 291, requiredQty = 3, power = 4, materialName = "Somber Memory", tier = 2 }, -- Enfeebling Magic Skill +5
        [1606] = { augmentID = 292, requiredQty = 3, power = 4, materialName = "Burning Memory", tier = 2 }, -- Elemental Magic Skill +5
        [1613] = { augmentID = 293, requiredQty = 3, power = 4, materialName = "Malevolent Memory", tier = 2 }, -- Dark Magic Skill +5
        [1609] = { augmentID = 294, requiredQty = 3, power = 4, materialName = "Profane Memory", tier = 2 }, -- Summoning Magic Skill +5
        [1610] = { augmentID = 296, requiredQty = 3, power = 4, materialName = "Startling Memory", tier = 2 }, -- Singing Skill +5
        [1607] = { augmentID = 299, requiredQty = 6, power = 4, materialName = "Bitter Memory", tier = 2 }, -- Blue Magic Skill +5
        [5154] = { augmentID = 329, requiredQty = 3, power = 1, materialName = "Tavnazian Liver", tier = 2 }, -- Cure Potency +2%
        [2524] = { augmentID = 330, requiredQty = 3, power = 4, materialName = "Peiste Stinger", tier = 2 }, -- Waltz Potency +5%
        [5116] = { augmentID = 334, requiredQty = 3, power = 4, materialName = "Cavorting Worm", tier = 2 }, -- Magic Burst Bonus +5%
        [906] = { augmentID = 740, requiredQty = 3, power = 4, materialName = "Starmite Shell", tier = 2 }, -- Main Hand Damage +5
    },
    -- Tier 3 Augments
    [3] = {
        [3300] = { augmentID = 1152, requiredQty = 3, power = 22, materialName = "Soil Geode", tier = 3 }, -- Defense +32
        [3304] = { augmentID = 80, requiredQty = 3, power = 11, materialName = "Shadow Geode", tier = 3 }, -- Magic Accuracy/Magic Damage +12
        [1785] = { augmentID = 144, requiredQty = 3, power = 4, materialName = "Xzomit Organ", tier = 3 }, -- Triple Attack +2%
        [2187] = { augmentID = 148, requiredQty = 24, power = 0, materialName = "Imperial Gold Piece", tier = 3 }, -- Gilfinder +1
        [1818] = { augmentID = 153, requiredQty = 3, power = 14, materialName = "Euvhi Organ", tier = 3 }, -- Shield Master +15
        [1787] = { augmentID = 211, requiredQty = 3, power = 9, materialName = "Hpemde Organ", tier = 3 }, -- Snapshot +10
        [2890] = { augmentID = 212, requiredQty = 3, power = 9, materialName = "Clionid Wing", tier = 3 }, -- Recycle +10
        [1784] = { augmentID = 328, requiredQty = 3, power = 1, materialName = "Yovra Organ", tier = 3 }, -- Critical Hit Damage +2%
        [1788] = { augmentID = 335, requiredQty = 3, power = 1, materialName = "Phuabo Organ", tier = 3 }, -- Magic Critical Hit Damage +2%
        [2889] = { augmentID = 341, requiredQty = 6, power = 4, materialName = "Limule Pincer", tier = 3 }, -- Automaton Repair Potency +5%
        [2641] = { augmentID = 343, requiredQty = 3, power = 9, materialName = "Amoeban Pseudopod", tier = 3 }, -- Drain and Aspir Potency +10
        [1783] = { augmentID = 1248, requiredQty = 3, power = 9, materialName = "Luminian Tissue", tier = 3 }, -- Enhancing Magic Duration +10% augID 374 or 1248
        [3297] = { augmentID = 512, requiredQty = 3, power = 3, materialName = "Flame Geode", tier = 3 }, -- STR +4
        [3301] = { augmentID = 513, requiredQty = 3, power = 3, materialName = "Thunder Geode", tier = 3 }, -- DEX +4
        [3299] = { augmentID = 515, requiredQty = 3, power = 3, materialName = "Breeze Geode", tier = 3 }, -- AGI +4
        [3298] = { augmentID = 516, requiredQty = 3, power = 3, materialName = "Snow Geode", tier = 3 }, -- INT +4
        [3302] = { augmentID = 517, requiredQty = 3, power = 3, materialName = "Aqua Geode", tier = 3 }, -- MND +4
        [3303] = { augmentID = 518, requiredQty = 3, power = 3, materialName = "Light Geode", tier = 3 }, -- CHR +4
        [2640] = { augmentID = 896, requiredQty = 3, power = 9, materialName = "Murex Spicule", tier = 3 }, -- Enspell Damage +10
        [1819] = { augmentID = 1251, requiredQty = 3, power = 9, materialName = "Luminion Chip", tier = 3 }, -- Enfeebling Magic Duration +10%
        [1786] = { augmentID = 1472, requiredQty = 3, power = 5, materialName = "Aern Organ", tier = 3 }, -- Parry Rate (Inquartata) +6%

    },
    -- Tier 4 Augments
    [4] = {
        [0001] = { augmentID = 33, requiredQty = 4, power = 4, materialName = "Crawler Cocoon", tier = 4 }, -- DEF+4
        [0002] = { augmentID = 25, requiredQty = 3, power = 2, materialName = "Beetle Shell", tier = 4 }, -- Attack+2
    },
    -- Tier 5 Augments
    [5] = {
        [0003] = { augmentID = 33, requiredQty = 5, power = 5, materialName = "Crawler Cocoon", tier = 5 }, -- DEF+5
        [0004] = { augmentID = 25, requiredQty = 4, power = 3, materialName = "Beetle Shell", tier = 5 }, -- Attack+3
    },
    -- Continue adding materials for other tiers...
}

-- Function to get the tier of an item based on its ID
function augmentData.getItemTier(itemID)
    for tier, items in pairs(augmentData.equipmentTier) do
        for _, id in ipairs(items) do
            if id == itemID then
                return tier
            end
        end
    end
    return 0 -- If not found, return 0 indicating the item cannot be augmented
end

-- Function to retrieve augments for a given item tier and the materials traded
function augmentData.getAugmentsForTrade(itemTier, trade)
    local selectedAugments = {}

    -- Loop through trade items and check if they correspond to valid augments
    for i = 1, trade:getItemCount() do
        local materialID = trade:getItemId(i)
        local qty = trade:getItemQty(i)

        -- For each material, check if it can apply an augment for the item's tier or lower
        for tier = itemTier, 1, -1 do
            local augmentInfo = augmentData.augmentTable[tier][materialID]
            if augmentInfo and qty >= augmentInfo.requiredQty then
                table.insert(selectedAugments, {
                    augmentID = augmentInfo.augmentID,
                    power = augmentInfo.power,
                    materialName = augmentInfo.materialName,
                    tier = tier
                })
                if #selectedAugments >= 4 then break end -- Max of 4 augments
            end
        end
        if #selectedAugments >= 4 then break end -- Stop if 4 augments are found
    end

    return selectedAugments
end

return augmentData
