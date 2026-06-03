-- Source: documentation/Login_Campaign_History_Source.txt, January 2025 - Campaign No.139.
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
            xi.item.RHAPSODY_SHIRT, -- Rhapsody Shirt
            xi.item.CAIT_SITH_GUARD, -- Cait Sith Guard
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.MOUNT_TULFAIRE, -- ♪Tulfaire
            xi.item.MOUNT_SPHEROID, -- ♪Spheroid
            xi.item.MOUNT_RAAZ, -- ♪Raaz
            xi.item.ARK_TACHI, -- Ark Tachi
            xi.item.ARK_TABAR, -- Ark Tabar
            xi.item.ARK_SCYTHE, -- Ark Scythe
            xi.item.ARK_SABER, -- Ark Saber
            xi.item.ARK_SWORD, -- Ark Sword
            xi.item.MODEL_SYNERGY_FURNACE, -- Model Synergy Furnace
            xi.item.ADENIUM_MASQUE, -- Adenium Masque
            xi.item.ADENIUM_SUIT, -- Adenium Suit
            xi.item.FELINE_HAGOITA, -- Feline Hagoita
            xi.item.KNIT_CAP, -- Knit Cap
            xi.item.LIZARD_FANGS, -- Lizard Fangs
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1, -- Rem's Tale Ch.1
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2, -- Rem's Tale Ch.2
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3, -- Rem's Tale Ch.3
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4, -- Rem's Tale Ch.4
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5, -- Rem's Tale Ch.5
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.SHEET_OF_DIVINE_TUNES, -- Sheet of Divine Tunes
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
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6, -- Rem's Tale Ch.6
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7, -- Rem's Tale Ch.7
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8, -- Rem's Tale Ch.8
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9, -- Rem's Tale Ch.9
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10, -- Rem's Tale Ch.10
            xi.item.VIAL_OF_BLACK_BEETLE_BLOOD, -- Black Beetle Blood
            xi.item.PHOENIX_FEATHER, -- Phoenix Feather
            xi.item.SQUARE_OF_DAMASCENE_CLOTH, -- Damascene Cloth
            xi.item.SPOOL_OF_MALBORO_FIBER, -- Malboro Fiber
            xi.item.PIECE_OF_OXBLOOD, -- Oxblood
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
        },
    },

}

return prizes
