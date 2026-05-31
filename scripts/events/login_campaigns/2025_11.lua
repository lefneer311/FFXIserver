-- Source: BG Wiki Repeat Login Campaign/Past Login Campaign Rewards, November 2025 - Campaign No.149.
-- Verification: drafted from the published reward list using repository xi.item constants; source rewards without constants were omitted.
-- Notes: preserves the Greeter Moogle tier shape and caps each visible tier at 20 items.
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 5,
        ['items'] =
        {
            xi.item.MOUNT_TIGER,
            xi.item.MOUNT_CRAB,
            xi.item.MOUNT_BEETLE,
            xi.item.MOUNT_DHALMEL,
            xi.item.MOUNT_GOOBBUE,
            xi.item.ASTRAL_CUBE,
            xi.item.CUMULUS_MASQUE,
            xi.item.EXCALIPOOR,
        },
    },

    [5] =
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

    [9] =
    {
        ['price'] = 150,
        ['items'] =
        {
            xi.item.CUMULUS_MASQUE,
            xi.item.BLIZZARD_BRAND,
            xi.item.ARK_TACHI,
            xi.item.ARK_TABAR,
            xi.item.ARK_SCYTHE,
            xi.item.ARK_SABER,
            xi.item.ARK_SWORD,
            xi.item.MOUNT_TIGER,
            xi.item.MOUNT_CRAB,
            xi.item.MOUNT_BEETLE,
            xi.item.MOUNT_DHALMEL,
            xi.item.MOUNT_GOOBBUE,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5,
        },
    },

    [13] =
    {
        ['price'] = 500,
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
            xi.item.BRIGANDS_CHART,
            xi.item.PIRATES_CHART,
            xi.item.PHOENIX_FEATHER,
            xi.item.SQUARE_OF_DAMASCENE_CLOTH,
            xi.item.SPOOL_OF_MALBORO_FIBER,
        },
    },

    [17] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            xi.item.CUP_OF_SWEET_TEA,
            xi.item.SAVORY_SHANK,
            xi.item.CLUMP_OF_RED_PONDWEED,
        },
    },
}

return prizes
