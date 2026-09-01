-- Source: documentation/Login_Campaign_History_Source.txt, May 2026 - Campaign No.155.
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
            xi.item.MERCENARY_CAMP_ENTRY_SLIP, -- M. Camp Entry
            xi.item.ATHENA_ORB, -- Athena Orb
            xi.item.TRAINING_GROUNDS_KEY, -- Tr. Grounds Key
            xi.item.FLASK_OF_PEST_REPELLENT, -- Pest Repellent
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.PINCH_OF_PUNGENT_POWDER_II, -- Pungent Powder II
            xi.item.LYCOPODIUM_MASQUE, -- Lycopodium Masque
            xi.item.KORRIGAN_MASQUE, -- Korrigan Masque
            xi.item.KORRIGAN_SUIT, -- Korrigan Suit
        },
    },

    [5] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.HANDFUL_OF_ADOULINIAN_TOMATOES, -- Ado. Tomatoes
            xi.item.MOUNT_CRAB, -- ♪Crab
            xi.item.MOUNT_BOMB, -- ♪Bomb
            xi.item.MOUNT_CRAWLER, -- ♪Crawler
            xi.item.MOUNT_BEETLE, -- ♪Beetle
            xi.item.MOUNT_TIGER, -- ♪Tiger
            xi.item.CUMULUS_MASQUE, -- Cumulus Masque
            xi.item.FIRETONGUE, -- Firetongue
            xi.item.EXCALIPOOR, -- Excalipoor
            xi.item.PUPILS_SHIRT, -- Pupil's Shirt
            xi.item.PUPILS_CAMISA, -- Pupil's Camisa
            xi.item.PUPILS_TROUSERS, -- Pupil's Trousers
            xi.item.PUPILS_SHOES, -- Pupil's Shoes
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
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6, -- Rem's Tale Ch.6
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7, -- Rem's Tale Ch.7
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8, -- Rem's Tale Ch.8
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9, -- Rem's Tale Ch.9
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10, -- Rem's Tale Ch.10
            xi.item.ETCHED_MEMORY, -- Etched Memory
            xi.item.MOUNT_MAGIC_POT, -- ♪Magic Pot
            xi.item.MOUNT_TULFAIRE, -- ♪Tulfaire
            xi.item.MOUNT_XZOMIT, -- ♪Xzomit
            xi.item.MOUNT_HIPPOGRYPH, -- ♪Hippogryph
            xi.item.NOBLE_CHOCOBO_NOTEBOOK, -- ♪Noble Chocobo
            xi.item.CIPHER_OF_SHANTOTTOS_ALTER_EGO_II, -- Cipher: Shantotto II
            xi.item.PRISHES_BOOTS, -- Prishe's Boots
            xi.item.AGEIST, -- Ageist
        },
    },

    [13] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.SQUARE_OF_DAMASCENE_CLOTH, -- Damascene Cloth
            xi.item.SPOOL_OF_MALBORO_FIBER, -- Malboro Fiber
            xi.item.PHOENIX_FEATHER, -- Phoenix Feather
            xi.item.VIAL_OF_BLACK_BEETLE_BLOOD, -- Black Beetle Blood
            xi.item.PIECE_OF_OXBLOOD, -- Oxblood
            xi.item.PARAGON_WARRIOR_CARD, -- P. WAR Card
            xi.item.PARAGON_MONK_CARD, -- P. MNK Card
            xi.item.PARAGON_WHITE_MAGE_CARD, -- P. WHM Card
            xi.item.PARAGON_BLACK_MAGE_CARD, -- P. BLM Card
            xi.item.PARAGON_RED_MAGE_CARD, -- P. RDM Card
            xi.item.PARAGON_THIEF_CARD, -- P. THF Card
            xi.item.PARAGON_PALADIN_CARD, -- P. PLD Card
            xi.item.PARAGON_DARK_KNIGHT_CARD, -- P. DRK Card
            xi.item.PARAGON_BEASTMASTER_CARD, -- P. BST Card
            xi.item.PARAGON_BARD_CARD, -- P. BRD Card
            xi.item.PARAGON_RANGER_CARD, -- P. RNG Card
        },
    },

    [17] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.BRIGANDS_CHART, -- Brigand's Chart
            xi.item.PIRATES_CHART, -- Pirate's Chart
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
            xi.item.CODEX_OF_ETCHINGS, -- Codex of Etchings
            xi.item.PATIO_DESIGN_PLAN_DOCUMENT, -- Patio Design Plans
            xi.item.CALIBER_RING, -- Caliber Ring
            xi.item.FACILITY_RING, -- Facility Ring
            xi.item.FISHERMANS_FEAST, -- Fisherman's Feast
            xi.item.KITCHEN_BRICK, -- Kitchen Brick
            xi.item.KITCHEN_STOVE, -- Kitchen Stove
            xi.item.KITCHEN_PLATE, -- Kitchen Plate
            xi.item.MALIYAKALEYA_ORB, -- Maliya. Coral Orb
            xi.item.HEPATIZON_INGOT, -- Hepatizon Ingot
            xi.item.BERYLLIUM_INGOT, -- Beryllium Ingot
            xi.item.PIECE_OF_EXALTED_LUMBER, -- Exalted Lumber
            xi.item.SPOOL_OF_SIFS_MACRAME, -- Sif's Macrame
            xi.item.VALKURM_IMPERATORS_WING, -- Imperator's Wing
            xi.item.ABYSSDIVERS_FEATHER, -- Abyssdiver Feather
            xi.item.INTUILAS_HIDE, -- Intuila's Hide
            xi.item.EMPEROR_ARTHROS_SHELL, -- Arthro's Shell
            xi.item.ORCFELTRAPS_LEAF, -- Orcfeltrap's Leaf
            xi.item.CLUMP_OF_JOYOUS_GREENS_MOSS, -- Joyous's Moss
            xi.item.WARBLADE_BEAKS_HIDE, -- Warblade's Hide
            xi.item.JESTER_MALATRIXS_SHARD, -- Malatrix's Shard
            xi.item.CACTROT_VELOZS_NEEDLE, -- Veloz's Needle
            xi.item.WOODLAND_MENDERS_LOG, -- Mender's Log
            xi.item.SYBARITIC_SAMANTHAS_VINE, -- Samantha's Vine
            xi.item.HANDFUL_OF_HEILIGTUMS_MOSS, -- Heiligtum's Moss
            xi.item.IMMANIBUGARDS_HIDE, -- Immani. Hide
            xi.item.TIYANAKS_FANG, -- Tiyanak's Fang
            xi.item.VOSOS_HIDE, -- Voso's Hide
        },
    },

    [21] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            xi.item.CUP_OF_SWEET_TEA, -- Sweet Tea
            xi.item.SAVORY_SHANK, -- Savory Shank
            xi.item.CLUMP_OF_RED_PONDWEED, -- Red Pondweed
            xi.item.IMPISH_BOX, -- Impish Box
        },
    },

    [25] =
    {
        ['price'] = 1500,
        ['items'] =
        {
            xi.item.FISTFUL_OF_MURKY_MATTER, -- Murky Matter
        },
    },

}

return prizes
