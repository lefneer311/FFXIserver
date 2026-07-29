-- Source: documentation/Login_Campaign_History_Source.txt, April 2024 - Campaign No.130.
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
            xi.item.ALLIANCE_SHIRT, -- Alliance Shirt
            xi.item.ALLIANCE_PANTS, -- Alliance Pants
            xi.item.ALLIANCE_BOOTS, -- Alliance Boots
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.MOUNT_TIGER, -- ♪Tiger
            xi.item.MOUNT_SPHEROID, -- ♪Spheroid
            xi.item.MOUNT_RAAZ, -- ♪Raaz
            xi.item.MOUNT_DOLL, -- ♪Doll
            xi.item.WIVRE_NOTEBOOK, -- ♪Wivre
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
            xi.item.ARTEMISS_BOW, -- Artemis's Bow
            xi.item.CARBIE_CAP, -- Carbie Cap
            xi.item.CAIT_SITH_CAP, -- Cait Sith Cap
            xi.item.WHITE_RARAB_CAP, -- White Rarab Cap
            xi.item.DIAMOND_BUCKLER, -- Diamond Buckler
            xi.item.MODEL_SYNERGY_FURNACE, -- Model Synergy Furnace
            xi.item.MUTSUNOKAMI, -- Mutsunokami
            xi.item.FELINE_HAGOITA, -- Feline Hagoita
            xi.item.MANDRAGORA_POT, -- Mandragora Pot
            xi.item.BESIGILED_TABLE, -- Besigiled Table
            xi.item.ADENIUM_MASQUE, -- Adenium Masque
            xi.item.ADENIUM_SUIT, -- Adenium Suit
            xi.item.SHEET_OF_MAPITOTO_TUNES, -- Mapitoto Tunes
            xi.item.KNIT_CAP, -- Knit Cap
            xi.item.PRISMATIC_CHEST, -- Prismatic Chest
            xi.item.MOUNT_PHUABO, -- ♪Phuabo
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.LIZARD_FANGS, -- Lizard Fangs
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
            xi.item.HIDHAEGGS_SCALE, -- Hidhaegg's Scale
            xi.item.TOLBAS_SHELL, -- Tolba's Shell
            xi.item.SOVEREIGN_BEHEMOTHS_HIDE, -- Sovereign's Hide
            xi.item.VIAL_OF_THE_TUMULT_CURATORS_BLOOD, -- Tumult's Blood
            xi.item.THUBANS_SCALE, -- Thu'ban's Scale
            xi.item.SARAMAS_HIDE, -- Sarama's Hide
            xi.item.SHEDUS_MANE, -- Shedu's Mane
        },
    },

}

return prizes
