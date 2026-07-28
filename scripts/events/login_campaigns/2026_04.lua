-- Source: documentation/Login_Campaign_History_Source.txt, April 2026 - Campaign No.154.
-- Verification: generated directly from the published source table; reward names were resolved through sql/item_basic.sql and xi.item constants.
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 5,
        ['items'] =
        {
            xi.item.BEASTMENS_SEAL, -- Beastmen's Seal
            xi.item.KINDREDS_SEAL, -- Kindred's Seal
            xi.item.KINDREDS_CREST, -- Kindred's Crest
            xi.item.HIGH_KINDREDS_CREST, -- High Kindred's Crest
            xi.item.SACRED_KINDREDS_CREST, -- S. Kindred Crest
            xi.item.CORDIAL_INVITE, -- Cordial Invite
            xi.item.MARTIAL_BALL_INVITE, -- Martial Ball Invite
            xi.item.MERCENARY_CAMP_ENTRY_SLIP, -- M. Camp Entry
            xi.item.ATHENA_ORB, -- Athena Orb
            xi.item.TRAINING_GROUNDS_KEY, -- Tr. Grounds Key
            xi.item.FLASK_OF_PEST_REPELLENT, -- Pest Repellent
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.PINCH_OF_PUNGENT_POWDER, -- Pungent Powder
            xi.item.ALLIANCE_SHIRT, -- Alliance Shirt
            xi.item.ALLIANCE_PANTS, -- Alliance Pants
            xi.item.ALLIANCE_BOOTS, -- Alliance Boots
        },
    },

    [5] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.CIPHER_OF_NAJAS_ALTER_EGO, -- Cipher: Naja
            xi.item.CIPHER_OF_SAKURAS_ALTER_EGO, -- Cipher: Sakura
            xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO, -- Cipher: Domina
            xi.item.CIPHER_OF_ELIVIRAS_ALTER_EGO, -- Cipher: Elivira
            xi.item.CIPHER_OF_RAHALS_ALTER_EGO, -- Cipher: Rahal
            xi.item.CIPHER_OF_KUYINS_ALTER_EGO, -- Cipher: Kuyin
            xi.item.CIPHER_OF_KUKKIS_ALTER_EGO, -- Cipher: Kukki
            xi.item.CIPHER_OF_LHES_ALTER_EGO, -- Cipher: Lhe
            xi.item.CIPHER_OF_BRYGIDS_ALTER_EGO, -- Cipher: Brygid
            xi.item.CIPHER_OF_RONGELOUTSS_ALTER_EGO, -- Cipher: Rongelouts
            xi.item.CIPHER_OF_ULLEGORES_ALTER_EGO, -- Cipher: Ullegore
            xi.item.CIPHER_OF_MAKKIS_ALTER_EGO, -- Cipher: Makki
            xi.item.CIPHER_OF_MORIMARS_ALTER_EGO, -- Cipher: Morimar
            xi.item.CIPHER_OF_DARRCUILNS_ALTER_EGO, -- Cipher: Darrcuiln
            xi.item.CARBIE_CAP, -- Carbie Cap
            xi.item.CAIT_SITH_CAP, -- Cait Sith Cap
        },
    },

    [9] =
    {
        ['price'] = 150,
        ['items'] =
        {
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1, -- Rem's Tale Ch.1
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2, -- Rem's Tale Ch.2
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3, -- Rem's Tale Ch.3
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4, -- Rem's Tale Ch.4
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5, -- Rem's Tale Ch.5
            xi.item.ETCHED_MEMORY, -- Etched Memory
            xi.item.MODEL_SYNERGY_FURNACE, -- Model Synergy Furnace
            xi.item.MANDRAGORA_POT, -- Mandragora Pot
            xi.item.BESIGILED_TABLE, -- Besigiled Table
            xi.item.PRISMATIC_CHEST, -- Prismatic Chest
            xi.item.SHEET_OF_MAPITOTO_TUNES, -- Sheet of Mapitoto Tunes
            xi.item.SHEET_OF_NEAR_EAST_TUNES, -- Near East Tunes
            xi.item.SHEET_OF_DIVINE_TUNES, -- Sheet of Divine Tunes
            xi.item.SHEET_OF_FISHING_TUNES, -- Sheet of Fishing Tunes
            xi.item.MOUNT_SPHEROID, -- ♪Spheroid
            xi.item.MOUNT_RAAZ, -- ♪Raaz
            xi.item.MOUNT_DOLL, -- ♪Doll
            xi.item.WIVRE_NOTEBOOK, -- ♪Wivre
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
            xi.item.MOUNT_PHUABO, -- ♪Phuabo
            xi.item.KYUKOTO, -- Kyukoto
            xi.item.ESOTERIC_ATHAME, -- Esoteric Athame
            xi.item.LIZARD_FANGS, -- Lizard Fangs
            xi.item.MUTSUNOKAMI, -- Mutsunokami
            xi.item.FELINE_HAGOITA, -- Feline Hagoita
            xi.item.ARTEMISS_BOW, -- Artemis's Bow
            xi.item.ADENIUM_MASQUE, -- Adenium Masque
            xi.item.ADENIUM_SUIT, -- Adenium Suit
            xi.item.KNIT_CAP, -- Knit Cap
            xi.item.DHALMEL_TROUSERS, -- Dhalmel Trousers
            xi.item.WHITE_RARAB_CAP, -- White Rarab Cap
            xi.item.DIAMOND_BUCKLER, -- Diamond Buckler
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.BRIGANDS_CHART, -- Brigand's Chart
            xi.item.PIRATES_CHART, -- Pirate's Chart
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6, -- Rem's Tale Ch.6
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7, -- Rem's Tale Ch.7
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8, -- Rem's Tale Ch.8
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9, -- Rem's Tale Ch.9
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10, -- Rem's Tale Ch.10
            xi.item.CODEX_OF_ETCHINGS, -- Codex of Etchings
            xi.item.PATIO_DESIGN_PLAN_DOCUMENT, -- Patio Design Plans
            xi.item.CALIBER_RING, -- Caliber Ring
            xi.item.FACILITY_RING, -- Facility Ring
            xi.item.COPY_OF_MELODIOUS_PLANS, -- Melodious Plans
            xi.item.TIMBRE_CASE_KIT, -- Timbre Case Kit
            xi.item.MUSICHINERY_KIT, -- Musichinery Kit
        },
    },

    [17] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            xi.item.CUP_OF_SWEET_TEA, -- Sweet Tea
            xi.item.SAVORY_SHANK, -- Savory Shank
            xi.item.CLUMP_OF_RED_PONDWEED, -- Red Pondweed
        },
    },

    [21] =
    {
        ['price'] = 1500,
        ['items'] =
        {
            xi.item.FISTFUL_OF_ALABASTER_MATTER, -- Alabaster Matter
        },
    },

}

return prizes
