-- Source: documentation/Login_Campaign_History_Source.txt, October 2025 - Campaign No.148.
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
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.CIPHER_OF_NOILLURIES_ALTER_EGO, -- Cipher: Noillurie
            xi.item.CIPHER_OF_SAKURAS_ALTER_EGO, -- Cipher: Sakura
            xi.item.CIPHER_OF_OVJANGS_ALTER_EGO, -- Cipher: Ovjang
            xi.item.CIPHER_OF_MILDAURIONS_ALTER_EGO, -- Cipher: Mildaurion
            xi.item.CIPHER_OF_LEONOYNES_ALTER_EGO, -- Cipher: Leonoyne
            xi.item.PUPILS_SHIRT, -- Pupil's Shirt
            xi.item.PUPILS_CAMISA, -- Pupil's Camisa
            xi.item.PUPILS_TROUSERS, -- Pupil's Trousers
            xi.item.PUPILS_SHOES, -- Pupil's Shoes
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.HECTEYES_BELT, -- Hecteyes Belt
            xi.item.LEECH_BELT, -- Leech Belt
            xi.item.SLIME_BELT, -- Slime Belt
            xi.item.MOUNT_TIGER, -- ♪Tiger
            xi.item.TRACK_SHIRT, -- Track Shirt
            xi.item.TRACK_PANTS, -- Track Pants
            xi.item.APHMAU_STATUE, -- Aphmau Statue
            xi.item.CIPHER_OF_MAXIMILIANS_ALTER_EGO, -- Cipher: Maximilian
            xi.item.CIPHER_OF_MORIMARS_ALTER_EGO, -- Cipher: Morimar
            xi.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO, -- Cipher: S. Sibyl
            xi.item.CIPHER_OF_BRYGIDS_ALTER_EGO, -- Cipher: Brygid
            xi.item.CIPHER_OF_RAHALS_ALTER_EGO, -- Cipher: Rahal
            xi.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO, -- Cipher: Rughadjeen
            xi.item.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO, -- Cipher: Robel-Akbel
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1, -- Rem's Tale Ch.1
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2, -- Rem's Tale Ch.2
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3, -- Rem's Tale Ch.3
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4, -- Rem's Tale Ch.4
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5, -- Rem's Tale Ch.5
            xi.item.ETCHED_MEMORY, -- Etched Memory
            xi.item.HARVEST_PASTRY, -- Harvest Pastry
            xi.item.KAKAI_CAP, -- Kakai Cap
            xi.item.LOST_SICKLE, -- Lost Sickle
            xi.item.AUTUMN_TREE, -- Autumn Tree
            xi.item.CHOCOBO_COMMODE, -- Chocobo Commode
            xi.item.CHEMISTRY_SET, -- Chemistry Set
            xi.item.PAINTING_OF_BLUEBLADE_FELL, -- Blueblade Fell
            xi.item.ERUDITES_STAFF, -- Erudite's Staff
            xi.item.ARK_TABAR, -- Ark Tabar
            xi.item.MOG_KUPON_A_AMR, -- Kupon A-AMR
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.ILM_WESKIT, -- Ilm Weskit
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
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6, -- Rem's Tale Ch.6
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7, -- Rem's Tale Ch.7
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8, -- Rem's Tale Ch.8
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9, -- Rem's Tale Ch.9
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10, -- Rem's Tale Ch.10
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
            xi.item.ROLANBERRY_DELIGHTARU, -- Rol. Delightaru
            xi.item.POT_OF_WHITE_CLEMATIS, -- White Clematis
            xi.item.FACILITY_RING, -- Facility Ring
            xi.item.CODEX_OF_ETCHINGS, -- Codex of Etchings
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
