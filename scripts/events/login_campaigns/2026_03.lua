-- Source: documentation/Login_Campaign_History_Source.txt, March 2026 - Campaign No.153.
-- Verification: generated directly from the published source table; reward names were resolved through sql/item_basic.sql and xi.item constants.
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 5,
        ['items'] =
        {
            xi.item.BEASTMENS_SEAL, -- Beastmen's Seal
            xi.item.KINDREDS_SEAL, -- Kindred's Seal
            xi.item.KINDREDS_CREST, -- Kindred's Crest
            xi.item.HIGH_KINDREDS_CREST, -- High Kindred's Crest
            xi.item.SACRED_KINDREDS_CREST, -- S. Kindred Crest
            xi.item.CORDIAL_INVITE, -- Cordial Invite
            xi.item.MARTIAL_BALL_INVITE, -- Martial Ball Invite
            xi.item.TRAINING_GROUNDS_KEY, -- Tr. Grounds Key
            xi.item.MERCENARY_CAMP_ENTRY_SLIP, -- M. Camp Entry
            xi.item.FLASK_OF_PEST_REPELLENT, -- Pest Repellent
            xi.item.ATHENA_ORB, -- Athena Orb
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.CRACKED_NUT, -- Cracked Nut
            xi.item.GLINTING_SHIELD, -- Glinting Shield
            xi.item.SHEEP_CAP, -- Sheep Cap
            xi.item.MOUNT_WARMACHINE, -- ♪Warmachine
        },
    },

    [5] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.ROUNSEY_WAND, -- Rounsey Wand
            xi.item.CIPHER_OF_NAJELITHS_ALTER_EGO, -- Cipher: Najelith
            xi.item.CIPHER_OF_ZEIDS_ALTER_EGO, -- Cipher: Zeid
            xi.item.CIPHER_OF_LUZAFS_ALTER_EGO, -- Cipher: Luzaf
            xi.item.CIPHER_OF_ABENZIOS_ALTER_EGO, -- Cipher: Abenzio
            xi.item.CIPHER_OF_GILGAMESHS_ALTER_EGO, -- Cipher: Gilgamesh
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO, -- Cipher: Mayakov
            xi.item.CIPHER_OF_MAXIMILIANS_ALTER_EGO, -- Cipher: Maximilian
            xi.item.CIPHER_OF_TEODORS_ALTER_EGO, -- Cipher: Teodor
            xi.item.CIPHER_OF_KORU_MORUS_ALTER_EGO, -- Cipher: Koru-Moru
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO, -- Cipher: Qultada
            xi.item.CIPHER_OF_KINGS_ALTER_EGO, -- Cipher: King
            xi.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO, -- Cipher: Rughadjeen
            xi.item.CIPHER_OF_LEONOYNES_ALTER_EGO, -- Cipher: Leonoyne
            xi.item.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO, -- Cipher: Robel-Akbel
        },
    },

    [9] =
    {
        ['price'] = 150,
        ['items'] =
        {
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1, -- Rem's Tale Ch.1
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2, -- Rem's Tale Ch.2
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3, -- Rem's Tale Ch.3
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4, -- Rem's Tale Ch.4
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5, -- Rem's Tale Ch.5
            xi.item.ETCHED_MEMORY, -- Etched Memory
            xi.item.SHEET_OF_FISHING_TUNES, -- Sheet of Fishing Tunes
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
            xi.item.MOUNT_PHUABO, -- ♪Phuabo
            xi.item.MUTSUNOKAMI, -- Mutsunokami
            xi.item.ESOTERIC_ATHAME, -- Esoteric Athame
            xi.item.DIAMOND_BUCKLER, -- Diamond Buckler
            xi.item.RARAB_CAP, -- Rarab Cap
            xi.item.MANDRAGORA_POT, -- Mandragora Pot
            xi.item.PRISHE_STATUE_II, -- Prishe Statue II
            xi.item.ARCIELA_STATUE, -- Arciela Statue
            xi.item.IROHA_STATUE, -- Iroha Statue
            xi.item.LION_STATUE, -- Lion Statue
            xi.item.LILISETTE_STATUE, -- Lilisette Statue
            xi.item.APHMAU_STATUE, -- Aphmau Statue
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.PATIO_DESIGN_PLAN_DOCUMENT, -- Patio Design Plans
            xi.item.KITCHEN_BRICK, -- Kitchen Brick
            xi.item.KITCHEN_STOVE, -- Kitchen Stove
            xi.item.KITCHEN_PLATE, -- Kitchen Plate
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6, -- Rem's Tale Ch.6
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7, -- Rem's Tale Ch.7
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8, -- Rem's Tale Ch.8
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9, -- Rem's Tale Ch.9
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10, -- Rem's Tale Ch.10
            xi.item.CODEX_OF_ETCHINGS, -- Codex of Etchings
            xi.item.CALIBER_RING, -- Caliber Ring
            xi.item.FACILITY_RING, -- Facility Ring
            xi.item.BRIGANDS_CHART, -- Brigand's Chart
            xi.item.PIRATES_CHART, -- Pirate's Chart
        },
    },

    [17] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            xi.item.CUP_OF_SWEET_TEA, -- Sweet Tea
            xi.item.SAVORY_SHANK, -- Savory Shank
            xi.item.CLUMP_OF_RED_PONDWEED, -- Red Pondweed
        },
    },

    [21] =
    {
        ['price'] = 1500,
        ['items'] =
        {
            xi.item.OLD_CASE_P1, -- Old Case +1
        },
    },

}

return prizes
