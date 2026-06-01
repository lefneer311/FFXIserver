-- Source: documentation/Login_Campaign_History_Source.txt, November 2024 - Campaign No.137.
-- Verification: generated directly from the published source table; reward names were resolved through sql/item_basic.sql and xi.item constants.
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.BEASTMENS_SEAL, -- Beastmen's Seal
            xi.item.KINDREDS_SEAL, -- Kindred's Seal
            xi.item.KINDREDS_CREST, -- Kindred's Crest
            xi.item.HIGH_KINDREDS_CREST, -- High Kindred's Crest
            xi.item.SACRED_KINDREDS_CREST, -- S. Kindred Crest
            xi.item.CORDIAL_INVITE, -- Cordial Invite
            xi.item.MARTIAL_BALL_INVITE, -- Martial Ball Invite
            xi.item.TRAINING_GROUNDS_KEY, -- Tr. Grounds Key
            xi.item.MERCENARY_CAMP_ENTRY_SLIP, -- M. Camp Entry
            xi.item.FLASK_OF_PEST_REPELLENT, -- Pest Repellent
            xi.item.ATHENA_ORB, -- Athena Orb
            xi.item.CRACKED_NUT, -- Cracked Nut
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.PINCH_OF_PUNGENT_POWDER, -- Pungent Powder
            xi.item.PINCH_OF_PUNGENT_POWDER_II, -- Pungent Powder II
            xi.item.TARAZACUM_ORB, -- Tarazacum Orb
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.MOG_KUPON_I_S1, -- Kupon I-S1
            xi.item.EUDAEMON_BLADE, -- Eudaemon Blade
            xi.item.EUDAEMON_CAPE, -- Eudaemon Cape
            xi.item.EUDAEMON_RING, -- Eudaemon Ring
            xi.item.EUDAEMON_SASH, -- Eudaemon Sash
            xi.item.EUDAEMON_SHIELD, -- Eudaemon Shield
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.ASTRAL_CUBE, -- Astral Cube
            xi.item.ZINNIA_ORB, -- Zinnia Orb
            xi.item.EXCALIPOOR, -- Excalipoor
            xi.item.PIECE_OF_COPSE_CANDY, -- Copse Candy
            xi.item.LEECH_BELT, -- Leech Belt
            xi.item.SLIME_BELT, -- Slime Belt
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.MOUNT_GOOBBUE, -- ♪Goobbue
            xi.item.MOUNT_CRAB, -- ♪Crab
            xi.item.MOUNT_BEETLE, -- ♪Beetle
            xi.item.CUMULUS_MASQUE, -- Cumulus Masque
            xi.item.BLIZZARD_BRAND, -- Blizzard Brand
            xi.item.WYRMKING_MASQUE_P1, -- Wyrm. Masque +1
            xi.item.WYRMKING_SUIT_P1, -- Wyrmking Suit +1
            xi.item.MOUNT_DHALMEL, -- ♪Dhalmel
            xi.item.GOLDEN_BOMB_NOTEBOOK, -- ♪Golden Bomb
            xi.item.IRON_GIANT_NOTEBOOK, -- ♪Iron Giant
            xi.item.IXION_NOTEBOOK, -- ♪Ixion
            xi.item.CHOCOBO_CHAIR_II, -- Chocobo Chair II
            xi.item.ARK_TACHI, -- Ark Tachi
            xi.item.ARK_TABAR, -- Ark Tabar
            xi.item.ARK_SCYTHE, -- Ark Scythe
            xi.item.ARK_SABER, -- Ark Saber
            xi.item.ARK_SWORD, -- Ark Sword
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.MOG_KUPON_A_AEV, -- Kupon A-AEV
        },
    },

    [17] =
    {
        ['price'] = 750,
        ['items'] =
        {
            xi.item.KITCHEN_BRICK, -- Kitchen Brick
            xi.item.KITCHEN_STOVE, -- Kitchen Stove
            xi.item.KITCHEN_PLATE, -- Kitchen Plate
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
            xi.item.BRIGANDS_CHART, -- Brigand's Chart
            xi.item.PIRATES_CHART, -- Pirate's Chart
        },
    },

    [21] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            xi.item.PATIO_DESIGN_PLAN_DOCUMENT, -- Patio Design Plans
            xi.item.CALIBER_RING, -- Caliber Ring
            xi.item.FACILITY_RING, -- Facility Ring
            xi.item.FRAYED_SACK_OF_FECUNDITY, -- Frayed Sack (Pel)
            xi.item.FRAYED_SACK_OF_PLENTY, -- Frayed Sack (Fer)
            xi.item.FRAYED_SACK_OF_OPULENCE, -- Frayed Sack (Tau)
            xi.item.WORN_SACK_OF_SS_STONES_P2, -- Worn Sack (SS +2)
            xi.item.WORN_SACK_OF_LS_STONES_P2, -- Worn Sack (LS +2)
            xi.item.WORN_SACK_OF_DS_STONES_P2, -- Worn Sack (DS +2)
            xi.item.WORN_SACK_OF_ST_STONES_P2, -- Worn Sack (ST +2)
            xi.item.WORN_SACK_OF_LT_STONES_P2, -- Worn Sack (LT +2)
            xi.item.WORN_SACK_OF_DT_STONES_P2, -- Worn Sack (DT +2)
            xi.item.WORN_SACK_OF_SD_STONES_P2, -- Worn Sack (SD +2)
            xi.item.WORN_SACK_OF_LD_STONES_P2, -- Worn Sack (LD +2)
            xi.item.WORN_SACK_OF_DD_STONES_P2, -- Worn Sack (DD +2)
            xi.item.WORN_SACK_OF_SO_STONES_P2, -- Worn Sack (SO +2)
            xi.item.WORN_SACK_OF_LO_STONES_P2, -- Worn Sack (LO +2)
            xi.item.WORN_SACK_OF_DO_STONES_P2, -- Worn Sack (DO +2)
        },
    },

    [25] =
    {
        ['price'] = 1500,
        ['items'] =
        {
            xi.item.CUP_OF_SWEET_TEA, -- Sweet Tea
            xi.item.SAVORY_SHANK, -- Savory Shank
            xi.item.CLUMP_OF_RED_PONDWEED, -- Red Pondweed
            xi.item.MALIYAKALEYA_ORB, -- Maliya. Coral Orb
            xi.item.HEPATIZON_INGOT, -- Hepatizon Ingot
            xi.item.BERYLLIUM_INGOT, -- Beryllium Ingot
            xi.item.PIECE_OF_EXALTED_LUMBER, -- Exalted Lumber
            xi.item.SPOOL_OF_SIFS_MACRAME, -- Sif's Macrame
            xi.item.MUNDUS_SHIELD, -- Mundus Shield
        },
    },

}

return prizes
