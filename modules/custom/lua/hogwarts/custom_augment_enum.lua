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
    [5] = {5234, 5235, 5236, 5237}, -- Example Tier 5 Weapons
}

-- Define materials and their corresponding augment for each tier.
-- Augment table format: { augmentID, requiredQty, power, materialName, tier }
augmentData.augmentTable = {
    -- Tier 1 Augments
    [1] = {
        [839] = { augmentID = 33, requiredQty = 1, power = 1, materialName = "Crawler Cocoon", tier = 1 }, -- DEF+1
        [1254] = { augmentID = 23, requiredQty = 1, power = 2, materialName = "Animal Glue", tier = 1 }, -- Accuracy+2
    },
    -- Tier 2 Augments
    [2] = {
        [839] = { augmentID = 33, requiredQty = 2, power = 2, materialName = "Crawler Cocoon", tier = 2 }, -- DEF+2
        [1500] = { augmentID = 25, requiredQty = 2, power = 1, materialName = "Beetle Shell", tier = 2 }, -- Attack+1
    },
    -- Tier 3 Augments
    [3] = {
        [839] = { augmentID = 33, requiredQty = 3, power = 3, materialName = "Crawler Cocoon", tier = 3 }, -- DEF+3
        [1254] = { augmentID = 23, requiredQty = 2, power = 3, materialName = "Animal Glue", tier = 3 }, -- Accuracy+3
    },
    -- Tier 4 Augments
    [4] = {
        [839] = { augmentID = 33, requiredQty = 4, power = 4, materialName = "Crawler Cocoon", tier = 4 }, -- DEF+4
        [1500] = { augmentID = 25, requiredQty = 3, power = 2, materialName = "Beetle Shell", tier = 4 }, -- Attack+2
    },
    -- Tier 5 Augments
    [5] = {
        [839] = { augmentID = 33, requiredQty = 5, power = 5, materialName = "Crawler Cocoon", tier = 5 }, -- DEF+5
        [1500] = { augmentID = 25, requiredQty = 4, power = 3, materialName = "Beetle Shell", tier = 5 }, -- Attack+3
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
