-- Source: documentation/Login_Campaign_History_Source.txt, June 2025 - Campaign No.144.
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
            xi.item.CIPHER_OF_AMCHUCHUS_ALTER_EGO, -- Cipher: Amchuchu
            xi.item.CIPHER_OF_SAKURAS_ALTER_EGO, -- Cipher: Sakura
            xi.item.CIPHER_OF_ABENZIOS_ALTER_EGO, -- Cipher: Abenzio
            xi.item.CIPHER_OF_KUYINS_ALTER_EGO, -- Cipher: Kuyin
            xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO, -- Cipher: Domina
            xi.item.CIPHER_OF_RONGELOUTSS_ALTER_EGO, -- Cipher: Rongelouts
            xi.item.CIPHER_OF_KINGS_ALTER_EGO, -- Cipher: King
            xi.item.CIPHER_OF_KAYEELS_ALTER_EGO, -- Cipher: Kayeel
            xi.item.CIPHER_OF_MARGRETS_ALTER_EGO, -- Cipher: Margret
            xi.item.CIPHER_OF_RAHALS_ALTER_EGO, -- Cipher: Rahal
            xi.item.CIPHER_OF_CIDS_ALTER_EGO, -- Cipher: Cid
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.BONANZA_BALL, -- Bonanza Ball
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.EUDAEMON_BLADE, -- Eudaemon Blade
            xi.item.EUDAEMON_CAPE, -- Eudaemon Cape
            xi.item.EUDAEMON_RING, -- Eudaemon Ring
            xi.item.EUDAEMON_SASH, -- Eudaemon Sash
            xi.item.EUDAEMON_SHIELD, -- Eudaemon Shld.
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.CIPHER_OF_ZEIDS_ALTER_EGO, -- Cipher: Zeid
            xi.item.CIPHER_OF_LIONS_ALTER_EGO, -- Cipher: Lion
            xi.item.CIPHER_OF_NAJAS_ALTER_EGO, -- Cipher: Naja
            xi.item.CIPHER_OF_UKAS_ALTER_EGO, -- Cipher: Uka
            xi.item.CIPHER_OF_AREUHATS_ALTER_EGO, -- Cipher: Areuhat
            xi.item.CIPHER_OF_LHES_ALTER_EGO, -- Cipher: Lhe
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO, -- Cipher: Mayakov
            xi.item.CIPHER_OF_DARRCUILNS_ALTER_EGO, -- Cipher: Darrcuiln
            xi.item.MOUNT_COEURL, -- ♪Coeurl
            xi.item.MOUNT_GOOBBUE, -- ♪Goobbue
            xi.item.MOUNT_RAAZ, -- ♪Raaz
            xi.item.MOUNT_ADAMANTOISE, -- ♪Adamantoise
            xi.item.MOUNT_DHALMEL, -- ♪Dhalmel
            xi.item.CRAB_CAP, -- Crab Cap
            xi.item.POROGGO_COAT, -- Poroggo Coat
            xi.item.GIL_NABBER_SHIRT, -- Gil Nabber Shirt
            xi.item.LION_STATUE, -- Lion Statue
            xi.item.ARCIELA_STATUE, -- Arciela Statue
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.MOUNT_DOLL, -- ♪Doll
            xi.item.RED_RAPTOR_NOTEBOOK, -- ♪Red Raptor
            xi.item.GOLDEN_BOMB_NOTEBOOK, -- ♪Golden Bomb
            xi.item.WIVRE_NOTEBOOK, -- ♪Wivre
            xi.item.IRON_GIANT_NOTEBOOK, -- ♪Iron Giant
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
            xi.item.POISON_AXE, -- Poison Axe
            xi.item.SILVER_GUN, -- Silver Gun
            xi.item.POROGGO_CASSOCK, -- Poroggo Cassock
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
            xi.item.MODEL_SYNERGY_FURNACE_II, -- Model Syn. Furn. II
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
            xi.item.MALIYAKALEYA_ORB, -- Maliya. Coral Orb
            xi.item.HEPATIZON_INGOT, -- Hepatizon Ingot
            xi.item.BERYLLIUM_INGOT, -- Beryllium Ingot
            xi.item.PIECE_OF_EXALTED_LUMBER, -- Exalted Lumber
            xi.item.SPOOL_OF_SIFS_MACRAME, -- Sif's Macrame
        },
    },

}

return prizes
