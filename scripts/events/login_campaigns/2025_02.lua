-- Source: documentation/Login_Campaign_History_Source.txt, February 2025 - Campaign No.140.
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
            xi.item.SHEET_OF_NEAR_EAST_TUNES, -- Near East Tunes
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
            xi.item.DHALMEL_TROUSERS, -- Dhalmel Trousers
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
            xi.item.CHUNK_OF_WOOTZ_ORE, -- Wootz Ore
            xi.item.GRIFFON_HIDE, -- Griffon Hide
            xi.item.SPARKLING_STONE, -- Sparkling Stone
            xi.item.MAMMOTH_TUSK, -- Mammoth Tusk
            xi.item.PILE_OF_RELIC_IRON, -- Relic Iron
            xi.item.LANCEWOOD_LOG, -- Lancewood Log
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
            xi.item.GABBRATH_HORN, -- Gabbrath Horn
            xi.item.SLICE_OF_GABBRATH_MEAT, -- Gabbrath Meat
            xi.item.BZTAVIAN_STINGER, -- Bztavian Stinger
            xi.item.BZTAVIAN_WING, -- Bztavian Wing
            xi.item.ROCKFIN_FIN, -- Rockfin Fin
            xi.item.ROCKFIN_TOOTH, -- Rockfin Tooth
            xi.item.WAKTZA_ROSTRUM, -- Waktza Rostrum
            xi.item.WAKTZA_CREST, -- Waktza Crest
            xi.item.YGGDREANT_BOLE, -- Yggdreant Bole
            xi.item.YGGDREANT_ROOT, -- Yggdreant Root
            xi.item.CEHUETZI_CLAW, -- Cehuetzi Claw
            xi.item.CEHUETZI_ICE_SHARD, -- Cehuetzi Ice Shard
            xi.item.CEHUETZI_PELT, -- Cehuetzi Pelt
            xi.item.AKVANS_PENNON, -- Akvan's Pennon
            xi.item.KAGGENS_CUTICLE, -- Kaggen's Cuticle
            xi.item.CELAENOS_CLOTH, -- Celaeno's Cloth
            xi.item.SUIT_OF_HAHAVAS_MAIL, -- Hahava's Mail
            xi.item.PILS_TUILLE, -- Pil's Tuille
            xi.item.VOIDWROUGHT_PLATE, -- Voidwrought Plate
        },
    },

}

return prizes
