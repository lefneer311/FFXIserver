-- Source: BG Wiki Repeat Login Campaign/Past Login Campaign Rewards, April 2025 - Campaign No.142.
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
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO,
            xi.item.CIPHER_OF_AMCHUCHUS_ALTER_EGO,
            xi.item.CIPHER_OF_NOILLURIES_ALTER_EGO,
            xi.item.CIPHER_OF_OVJANGS_ALTER_EGO,
            xi.item.CIPHER_OF_SAKURAS_ALTER_EGO,
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
            xi.item.MOUNT_TIGER,
            xi.item.MOUNT_CRAB,
            xi.item.MOUNT_BEETLE,
            xi.item.MOUNT_DHALMEL,
            xi.item.MOUNT_GOOBBUE,
            xi.item.CHERRY_TREE,
            xi.item.ROUNSEY_WAND,
            xi.item.RARAB_CAP,
            xi.item.MORBOL_CAP,
            xi.item.SHEEP_CAP,
            xi.item.ARCIELA_STATUE,
            xi.item.IROHA_STATUE,
            xi.item.LION_STATUE,
            xi.item.APHMAU_STATUE,
            xi.item.ARTEMISS_BOW,
            xi.item.DIAMOND_BUCKLER,
            xi.item.MUTSUNOKAMI,
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
