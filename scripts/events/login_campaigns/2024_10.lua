-- Source: documentation/Login_Campaign_History_Source.txt, October 2024 - Campaign No.136.
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
            xi.item.PUPILS_SHIRT, -- Pupil's Shirt
            xi.item.PUPILS_CAMISA, -- Pupil's Camisa
            xi.item.PUPILS_TROUSERS, -- Pupil's Trousers
            xi.item.PUPILS_SHOES, -- Pupil's Shoes
            xi.item.HECTEYES_BELT, -- Hecteyes Belt
            xi.item.LEECH_BELT, -- Leech Belt
            xi.item.SLIME_BELT, -- Slime Belt
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.APHMAU_STATUE, -- Aphmau Statue
            xi.item.MOUNT_TIGER, -- ♪Tiger
            xi.item.HARVEST_PASTRY, -- Harvest Pastry
            xi.item.TRACK_SHIRT, -- Track Shirt
            xi.item.TRACK_PANTS, -- Track Pants
            xi.item.KAKAI_CAP, -- Kakai Cap
            xi.item.LOST_SICKLE, -- Lost Sickle
            xi.item.AUTUMN_TREE, -- Autumn Tree
            xi.item.CHOCOBO_COMMODE, -- Chocobo Commode
            xi.item.CHEMISTRY_SET, -- Chemistry Set
            xi.item.PAINTING_OF_BLUEBLADE_FELL, -- Blueblade Fell
            xi.item.ERUDITES_STAFF, -- Erudite's Staff
            xi.item.ARK_TABAR, -- Ark Tabar
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.MOG_KUPON_A_AMR, -- Kupon A-AMR
        },
    },

    [17] =
    {
        ['price'] = 750,
        ['items'] =
        {
            xi.item.COPY_OF_MELODIOUS_PLANS, -- Melodious Plans
            xi.item.TIMBRE_CASE_KIT, -- Timbre Case Kit
            xi.item.MUSICHINERY_KIT, -- Musichinery Kit
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
            xi.item.TURKEY_WITH_ROLANBERRY_SAUCE, -- Rol. Turkey
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
            xi.item.ROLANBERRY_DELIGHTARU, -- Rol. Delightaru
            xi.item.POT_OF_WHITE_CLEMATIS, -- White Clematis
            xi.item.POT_OF_PINK_CLEMATIS, -- Pink Clematis
            xi.item.BIRCH_TREE, -- Birch Tree
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
