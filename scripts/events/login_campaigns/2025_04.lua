-- Source: documentation/Login_Campaign_History_Source.txt, April 2025 - Campaign No.142.
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
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO, -- Cipher: Qultada
            xi.item.CIPHER_OF_AMCHUCHUS_ALTER_EGO, -- Cipher: Amchuchu
            xi.item.CIPHER_OF_KARAHAS_ALTER_EGO, -- Cipher: Karaha
            xi.item.CIPHER_OF_NOILLURIES_ALTER_EGO, -- Cipher: Noillurie
            xi.item.CIPHER_OF_OVJANGS_ALTER_EGO, -- Cipher: Ovjang
            xi.item.CIPHER_OF_SAKURAS_ALTER_EGO, -- Cipher: Sakura
            xi.item.TROTH, -- Troth
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.ALLIANCE_SHIRT, -- Alliance Shirt
            xi.item.ALLIANCE_PANTS, -- Alliance Pants
            xi.item.ALLIANCE_BOOTS, -- Alliance Boots
            xi.item.CIPHER_OF_MAKKIS_ALTER_EGO, -- Cipher: Makki
            xi.item.CIPHER_OF_MORIMARS_ALTER_EGO, -- Cipher: Morimar
            xi.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO, -- Cipher: S. Sibyl
            xi.item.MOUNT_TIGER, -- Tiger companion
            xi.item.MOUNT_SPHEROID, -- ♪Spheroid
            xi.item.CARBIE_CAP, -- Carbie Cap
            xi.item.CAIT_SITH_CAP, -- Cait Sith Cap
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.MOUNT_RAAZ, -- ♪Raaz
            xi.item.MOUNT_DOLL, -- ♪Doll
            xi.item.WIVRE_NOTEBOOK, -- ♪Wivre
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
            xi.item.ARTEMISS_BOW, -- Artemis's Bow
            xi.item.WHITE_RARAB_CAP, -- White Rarab Cap
            xi.item.DIAMOND_BUCKLER, -- Diamond Buckler
            xi.item.MODEL_SYNERGY_FURNACE, -- Model Synergy Furnace
            xi.item.MUTSUNOKAMI, -- Mutsunokami
            xi.item.FELINE_HAGOITA, -- Feline Hagoita
            xi.item.MANDRAGORA_POT, -- Mandragora Pot
            xi.item.BESIGILED_TABLE, -- Besigiled Table
            xi.item.ADENIUM_MASQUE, -- Adenium Masque
            xi.item.ADENIUM_SUIT, -- Adenium Suit
            xi.item.SHEET_OF_MAPITOTO_TUNES, -- Sheet of Mapitoto Tunes
            xi.item.KNIT_CAP, -- Knit Cap
            xi.item.PRISMATIC_CHEST, -- Prismatic Chest
            xi.item.MOUNT_PHUABO, -- ♪Phuabo
            xi.item.LIZARD_FANGS, -- Lizard Fangs
            xi.item.SHEET_OF_NEAR_EAST_TUNES, -- Near East Tunes
            xi.item.ESOTERIC_ATHAME, -- Esoteric Athame
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.SHEET_OF_FISHING_TUNES, -- Fishing Tunes
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
            xi.item.BEASTMENS_MEDAL, -- Beastmen's Medal
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
        },
    },

}

return prizes
