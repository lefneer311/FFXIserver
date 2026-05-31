-- Source: BG Wiki Repeat Login Campaign, May 2026 - Campaign No.154.
-- Verification: drafted from the current published reward list using repository xi.item constants; source rewards without constants were omitted.
-- Notes: preserves the Greeter Moogle tier shape and caps each visible tier at 20 items.
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 5,
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
            xi.item.GLINTING_SHIELD,
            xi.item.SHEEP_CAP,
        },
    },

    [5] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY,
            xi.item.DWARF_PUGIL,
            xi.item.ROUNSEY_WAND,
            xi.item.CIPHER_OF_NAJELITHS_ALTER_EGO,
            xi.item.CIPHER_OF_ZEIDS_ALTER_EGO,
            xi.item.CIPHER_OF_LUZAFS_ALTER_EGO,
            xi.item.CIPHER_OF_ABENZIOS_ALTER_EGO,
            xi.item.CIPHER_OF_GILGAMESHS_ALTER_EGO,
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO,
            xi.item.CIPHER_OF_MAXIMILIANS_ALTER_EGO,
            xi.item.CIPHER_OF_TEODORS_ALTER_EGO,
            xi.item.CIPHER_OF_KORU_MORUS_ALTER_EGO,
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO,
            xi.item.CIPHER_OF_KINGS_ALTER_EGO,
            xi.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO,
            xi.item.CIPHER_OF_LEONOYNES_ALTER_EGO,
            xi.item.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO,
        },
    },

    [9] =
    {
        ['price'] = 150,
        ['items'] =
        {
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5,
        },
    },

    [13] =
    {
        ['price'] = 150,
        ['items'] =
        {
            xi.item.MUTSUNOKAMI,
            xi.item.DIAMOND_BUCKLER,
            xi.item.RARAB_CAP,
            xi.item.PRISHE_STATUE_II,
            xi.item.ARCIELA_STATUE,
            xi.item.IROHA_STATUE,
            xi.item.LION_STATUE,
            xi.item.LILISETTE_STATUE,
            xi.item.APHMAU_STATUE,
        },
    },

    [21] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.JUG_OF_HONEY_WINE,
            xi.item.BEASTLY_SHANK,
            xi.item.CLUMP_OF_BLUE_PONDWEED,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10,
            xi.item.CALIBER_RING,
            xi.item.FACILITY_RING,
            xi.item.BRIGANDS_CHART,
            xi.item.PIRATES_CHART,
        },
    },

    [25] =
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
