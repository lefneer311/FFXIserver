-- Source: documentation/Login_Campaign_History_Source.txt, March 2024 - Campaign No.129.
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
            xi.item.TROTH, -- Troth
            xi.item.GLINTING_SHIELD, -- Glinting Shield
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
            xi.item.FAR_EAST_HEARTH, -- Far East Hearth
            xi.item.CHERRY_TREE, -- Cherry Tree
            xi.item.ROUNSEY_WAND, -- Rounsey Wand
            xi.item.PINCH_OF_PUNGENT_POWDER_III, -- Pungent Powder III
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.RARAB_CAP, -- Rarab Cap
            xi.item.MORBOL_CAP, -- Morbol Cap
            xi.item.SHEEP_CAP, -- Sheep Cap
            xi.item.MOUNT_WARMACHINE, -- ♪Warmachine
            xi.item.DIAMOND_BUCKLER, -- Diamond Buckler
            xi.item.PRISHE_STATUE_II, -- Prishe Statue II
            xi.item.ARCIELA_STATUE, -- Arciela Statue
            xi.item.IROHA_STATUE, -- Iroha Statue
            xi.item.LION_STATUE, -- Lion Statue
            xi.item.LILISETTE_STATUE, -- Lilisette Statue
            xi.item.APHMAU_STATUE, -- Aphmau Statue
            xi.item.MUTSUNOKAMI, -- Mutsunokami
            xi.item.MANDRAGORA_POT, -- Mandragora Pot
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
            xi.item.MOUNT_PHUABO, -- ♪Phuabo
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.ESOTERIC_ATHAME, -- Esoteric Athame
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
            xi.item.AZRAELS_EYE, -- Azrael's Eye
            xi.item.STICK_OF_ETHEREAL_INCENSE, -- Ethereal Incense
            xi.item.VIAL_OF_BAKUNAWAS_INK, -- Bakunawa's Ink
            xi.item.AZURE_TOOTHED_CLAWBERRYS_COAT, -- Clawberry's Coat
            xi.item.SUIT_OF_CENTURIO_XX_IS_ARMOR, -- Centurio's Armor
            xi.item.MHUUFYAS_BEAK, -- Mhuufya's Beak
            xi.item.VIDMAPIRES_CLAW, -- Vidmapire's Claw
            xi.item.VERMILLION_FISHFLYS_WING, -- Vermillion's Wing
            xi.item.PINCH_OF_VOLATILE_CLUSTERS_ASH, -- V. Cluster's Ash
            xi.item.PINCH_OF_GRAND_GRENADES_ASH, -- G. Grenade's Ash
            xi.item.CAROUSING_CELINES_VINE, -- Celine's Vine
            xi.item.GLAZEMANES_FANG, -- Glazemane's Fang
            xi.item.WYVERNHUNTER_BAMBROXS_SHAWL, -- Bambrox's Shawl
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
        },
    },

}

return prizes
