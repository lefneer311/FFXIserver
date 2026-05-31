-- Source: BG Wiki Repeat Login Campaign/Past Login Campaign Rewards, July 2024 - Campaign No.133.
-- Verification: drafted from the published reward list using repository xi.item constants; source rewards without constants were omitted.
-- Notes: preserves the Greeter Moogle tier shape and caps each visible tier at 20 items.
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.BEASTMENS_SEAL,
            xi.item.KINDREDS_SEAL,
            xi.item.KINDREDS_CREST,
            xi.item.HIGH_KINDREDS_CREST,
            xi.item.SACRED_KINDREDS_CREST,
            xi.item.SEASONING_STONE,
            xi.item.FOSSILIZED_FANG,
            xi.item.FOSSILIZED_BONE,
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.MOG_KUPON_I_S1,
            xi.item.EUDAEMON_BLADE,
            xi.item.EUDAEMON_CAPE,
            xi.item.EUDAEMON_RING,
            xi.item.EUDAEMON_SASH,
            xi.item.EUDAEMON_SHIELD,
            xi.item.DRILL_CALAMARY,
            xi.item.DWARF_PUGIL,
            xi.item.CIPHER_OF_ABENZIOS_ALTER_EGO,
            xi.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO,
            xi.item.CIPHER_OF_LHES_ALTER_EGO,
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO,
            xi.item.CIPHER_OF_BRYGIDS_ALTER_EGO,
            xi.item.CIPHER_OF_MILDAURIONS_ALTER_EGO,
            xi.item.CIPHER_OF_RONGELOUTSS_ALTER_EGO,
            xi.item.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO,
            xi.item.CIPHER_OF_ULLEGORES_ALTER_EGO,
            xi.item.CIPHER_OF_TEODORS_ALTER_EGO,
            xi.item.CIPHER_OF_DARRCUILNS_ALTER_EGO,
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.EXCALIPOOR,
            xi.item.KYUKA_UCHIWA,
            xi.item.BOMB_MASQUE,
            xi.item.MOUNT_BOMB,
            xi.item.MOUNT_CRAWLER,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5,
            xi.item.ARK_TACHI,
            xi.item.ARK_TABAR,
        },
    },

    [21] =
    {
        ['price'] = 750,
        ['items'] =
        {
            xi.item.COPY_OF_MELODIOUS_PLANS,
            xi.item.TIMBRE_CASE_KIT,
            xi.item.MUSICHINERY_KIT,
            xi.item.JUG_OF_HONEY_WINE,
            xi.item.BEASTLY_SHANK,
            xi.item.CLUMP_OF_BLUE_PONDWEED,
        },
    },

    [25] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            xi.item.COPY_OF_MELODIOUS_PLANS,
            xi.item.TIMBRE_CASE_KIT,
            xi.item.MUSICHINERY_KIT,
            xi.item.JUG_OF_HONEY_WINE,
            xi.item.BEASTLY_SHANK,
            xi.item.CLUMP_OF_BLUE_PONDWEED,
            xi.item.PHOENIX_FEATHER,
            xi.item.SQUARE_OF_DAMASCENE_CLOTH,
            xi.item.SPOOL_OF_MALBORO_FIBER,
        },
    },

    [29] =
    {
        ['price'] = 1500,
        ['items'] =
        {
            xi.item.CUP_OF_SWEET_TEA,
            xi.item.SAVORY_SHANK,
            xi.item.CLUMP_OF_RED_PONDWEED,
        },
    },
}

return prizes
