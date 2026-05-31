-- Source: BG Wiki Repeat Login Campaign/Past Login Campaign Rewards, 2025-06 same-month reward draft for the modern rotation reference, 2026-06.
-- Verification: drafted as a same-month analogue using repository xi.item constants; replace with source-backed retail data when available.
-- Notes: preserves the Greeter Moogle tier shape and caps each visible tier at 20 items; custom/provisional modern-cycle reference.
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
            xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO,
            xi.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO,
            xi.item.CIPHER_OF_KARAHAS_ALTER_EGO,
            xi.item.CIPHER_OF_AREUHATS_ALTER_EGO,
            xi.item.CIPHER_OF_UKAS_ALTER_EGO,
            xi.item.CIPHER_OF_KUYINS_ALTER_EGO,
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
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO,
            xi.item.CIPHER_OF_AMCHUCHUS_ALTER_EGO,
            xi.item.CIPHER_OF_NOILLURIES_ALTER_EGO,
            xi.item.CIPHER_OF_OVJANGS_ALTER_EGO,
            xi.item.CIPHER_OF_SAKURAS_ALTER_EGO,
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.WORM_FEELERS,
            xi.item.WORM_MASQUE,
            xi.item.CRAB_CAP,
            xi.item.LION_STATUE,
            xi.item.ARCIELA_STATUE,
            xi.item.MOUNT_CRAB,
            xi.item.MOUNT_GOOBBUE,
            xi.item.MOUNT_BOMB,
            xi.item.MOUNT_CRAWLER,
            xi.item.MOUNT_TIGER,
            xi.item.MOUNT_BEETLE,
            xi.item.MOUNT_DHALMEL,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5,
            xi.item.SILVER_GUN,
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
            xi.item.PHOENIX_FEATHER,
            xi.item.SQUARE_OF_DAMASCENE_CLOTH,
            xi.item.SPOOL_OF_MALBORO_FIBER,
            xi.item.PELICAN_RING,
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
