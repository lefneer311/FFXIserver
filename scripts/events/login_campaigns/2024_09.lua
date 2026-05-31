-- Source: BG Wiki Repeat Login Campaign/Past Login Campaign Rewards, September 2024 - Campaign No.135.
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
            xi.item.IROHA_STATUE,
            xi.item.RARAB_CAP,
            xi.item.APHMAU_STATUE,
            xi.item.HARVEST_PASTRY,
            xi.item.TRACK_SHIRT,
            xi.item.TRACK_PANTS,
            xi.item.KAKAI_CAP,
            xi.item.AUTUMN_TREE,
            xi.item.CHOCOBO_COMMODE,
            xi.item.ARK_SCYTHE,
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
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10,
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
