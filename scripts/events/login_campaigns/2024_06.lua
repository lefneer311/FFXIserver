-- Source: documentation/Login_Campaign_History_Source.txt, June 2024 - Campaign No.132.
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
            xi.item.PIECE_OF_COPSE_CANDY, -- Copse Candy
            xi.item.LEAFKIN_CAP, -- Leafkin Cap
            xi.item.WORM_FEELERS, -- Worm Feelers
            xi.item.WORM_MASQUE, -- Worm Masque
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.CRAB_CAP, -- Crab Cap
            xi.item.POROGGO_COAT, -- Poroggo Coat
            xi.item.POROGGO_CASSOCK, -- Poroggo Cassock
            xi.item.LION_STATUE, -- Lion Statue
            xi.item.GIL_NABBER_SHIRT, -- Gil Nabber Shirt
            xi.item.ARCIELA_STATUE, -- Arciela Statue
            xi.item.SILVER_GUN, -- Silver Gun
            xi.item.POISON_AXE, -- Poison Axe
            xi.item.MOUNT_COEURL, -- ♪Coeurl
            xi.item.MOUNT_GOOBBUE, -- ♪Goobbue
            xi.item.MOUNT_RAAZ, -- ♪Raaz
            xi.item.MOUNT_ADAMANTOISE, -- ♪Adamantoise
            xi.item.MOUNT_DHALMEL, -- ♪Dhalmel
            xi.item.MOUNT_DOLL, -- ♪Doll
            xi.item.RED_RAPTOR_NOTEBOOK, -- ♪Red Raptor
            xi.item.GOLDEN_BOMB_NOTEBOOK, -- ♪Golden Bomb
            xi.item.WIVRE_NOTEBOOK, -- ♪Wivre
            xi.item.IRON_GIANT_NOTEBOOK, -- ♪Iron Giant
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
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
            xi.item.COPY_OF_MELODIOUS_PLANS, -- Melodious Plans
            xi.item.TIMBRE_CASE_KIT, -- Timbre Case Kit
            xi.item.MUSICHINERY_KIT, -- Musichinery Kit
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
            xi.item.PELICAN_RING, -- Pelican Ring
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
