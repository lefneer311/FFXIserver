-- Source: documentation/Login_Campaign_History_Source.txt, August 2025 - Campaign No.146.
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
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO, -- Cipher: Qultada
            xi.item.CIPHER_OF_KARAHAS_ALTER_EGO, -- Cipher: Karaha
            xi.item.CIPHER_OF_NOILLURIES_ALTER_EGO, -- Cipher: Noillurie
            xi.item.CIPHER_OF_OVJANGS_ALTER_EGO, -- Cipher: Ovjang
            xi.item.CIPHER_OF_KORU_MORUS_ALTER_EGO, -- Cipher: Koru-Moru
            xi.item.CIPHER_OF_RAHALS_ALTER_EGO, -- Cipher: Rahal
            xi.item.CIPHER_OF_MNEJINGS_ALTER_EGO, -- Cipher: Mnejing
            xi.item.CIPHER_OF_ZEIDS_ALTER_EGO, -- Cipher: Zeid
            xi.item.CIPHER_OF_LIONS_ALTER_EGO, -- Cipher: Lion
            xi.item.MELON_SLICER, -- Melon Slicer
            xi.item.SEIKA_UCHIWA, -- Seika Uchiwa
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.LION_STATUE, -- Lion Statue
            xi.item.ARCIELA_STATUE, -- Arciela Statue
            xi.item.HANDFUL_OF_ADOULINIAN_TOMATOES, -- Ado. Tomatoes
            xi.item.MOOGLE_BED, -- Moogle Bed
            xi.item.CRIMSON_CHEST, -- Crimson Chest
            xi.item.MOUNT_COEURL, -- ♪Coeurl
            xi.item.MOUNT_ADAMANTOISE, -- ♪Adamantoise
            xi.item.FANCY_TRUNKS, -- Fancy Trunks
            xi.item.FANCY_SHORTS, -- Fancy Shorts
            xi.item.FANCY_GILET, -- Fancy Gilet
            xi.item.FANCY_TOP, -- Fancy Top
            xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO, -- Cipher: Domina
            xi.item.CIPHER_OF_UKAS_ALTER_EGO, -- Cipher: Uka
            xi.item.CIPHER_OF_KUYINS_ALTER_EGO, -- Cipher: Kuyin
            xi.item.CIPHER_OF_MARGRETS_ALTER_EGO, -- Cipher: Margret
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO, -- Cipher: Mayakov
            xi.item.CIPHER_OF_ULLEGORES_ALTER_EGO, -- Cipher: Ullegore
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
            xi.item.MOG_KUPON_A_AGK, -- Kupon A-AGK
            xi.item.CIPHER_OF_SHANTOTTOS_ALTER_EGO_II, -- Cipher: Shantotto II
            xi.item.RED_RAPTOR_NOTEBOOK, -- ♪Red Raptor
            xi.item.NOBLE_CHOCOBO_NOTEBOOK, -- ♪Noble Chocobo
            xi.item.SILVER_GUN, -- Silver Gun
            xi.item.POISON_AXE, -- Poison Axe
            xi.item.POROGGO_CASSOCK, -- Poroggo Cassock
            xi.item.AGEIST, -- Ageist
            xi.item.LEAFKIN_BED, -- Leafkin Bed
            xi.item.COLIBRI_BED, -- Colibri Bed
            xi.item.POROGGO_FLEECE, -- Poroggo Fleece
            xi.item.ZANMATO, -- Zanmato
            xi.item.SHA_WUJINGS_LANCE, -- Sha Wujing's Lance
            xi.item.MAGICIANS_ROD, -- Magician's Rod
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.PRISHES_BOOTS, -- Prishe's Boots
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
            xi.item.CODEX_OF_ETCHINGS, -- Codex of Etchings
            xi.item.FRAYED_SACK_OF_FECUNDITY, -- Frayed Sack (Pel)
            xi.item.FRAYED_SACK_OF_PLENTY, -- Frayed Sack (Fer)
            xi.item.FRAYED_SACK_OF_OPULENCE, -- Frayed Sack (Tau)
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
            xi.item.IMPISH_BOX, -- Impish Box
        },
    },

}

return prizes
