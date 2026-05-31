-- Source: BG Wiki Repeat Login Campaign/Past Login Campaign Rewards, November 2024 - Campaign No.137.
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
            xi.item.CUMULUS_MASQUE,
            xi.item.BLIZZARD_BRAND,
            xi.item.ARK_TACHI,
            xi.item.ARK_TABAR,
            xi.item.ARK_SCYTHE,
            xi.item.ARK_SABER,
            xi.item.ARK_SWORD,
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
            xi.item.CALIBER_RING,
            xi.item.FACILITY_RING,
            xi.item.FRAYED_SACK_OF_FECUNDITY,
            xi.item.FRAYED_SACK_OF_PLENTY,
            xi.item.FRAYED_SACK_OF_OPULENCE,
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
