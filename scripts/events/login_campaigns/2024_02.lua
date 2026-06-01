-- Source: documentation/Login_Campaign_History_Source.txt, February 2024 - Campaign No.128.
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
            xi.item.HEARTBEATER, -- Heartbeater
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.ARTEMISS_BOW, -- Artemis's Bow
            xi.item.ARTHROS_CAP, -- Arthro's Cap
            xi.item.CHOCOBO_MASQUE, -- Chocobo Masque
            xi.item.CHOCOBO_SUIT, -- Chocobo Suit
            xi.item.MOUNT_DOLL, -- ♪Doll
            xi.item.MITHKABOB_SHIRT, -- Mithkabob Shirt
            xi.item.WIVRE_NOTEBOOK, -- ♪Wivre
            xi.item.BESIGILED_TABLE, -- Besigiled Table
            xi.item.PRISMATIC_CHEST, -- Prismatic Chest
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.SHEET_OF_NEAR_EAST_TUNES, -- Near East Tunes
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
            xi.item.FISHERMANS_FEAST, -- Fisherman's Feast
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
            xi.item.VIAL_OF_LUMBER_JILLS_SPITTLE, -- Jill's Spittle
            xi.item.STRIXS_TAILFEATHER, -- Strix's Tailfeather
            xi.item.ARKES_WING, -- Arke's Wing
            xi.item.LARGANTUAS_SHARD, -- Largantua's Shard
            xi.item.VIAL_OF_BEISTS_BLOOD, -- Beist's Blood
            xi.item.DOUMA_WEAPONS_SHARD, -- Douma's Shard
            xi.item.KING_UROPYGIDS_NEEDLE, -- Uropygid's Needle
            xi.item.VEDRFOLNIRS_WING, -- Vedrfolnir's Wing
            xi.item.MUUTS_VESTMENT, -- Muut's Vestment
            xi.item.TUFT_OF_CAMAHUETOS_FUR, -- Camahueto's Fur
            xi.item.MEPHITASS_CLAW, -- Mephitas's Claw
            xi.item.COCAS_WING, -- Coca's Wing
            xi.item.AYAPECS_SHELL, -- Ayapec's Shell
            xi.item.CHUNK_OF_SPECTERS_ORE, -- Specter's Ore
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
