-- Source: documentation/Login_Campaign_History_Source.txt, March 2025 - Campaign No.141.
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
            xi.item.CORDIAL_INVITE, -- Cordial Invite
            xi.item.MARTIAL_BALL_INVITE, -- Martial Ball Invite
            xi.item.TRAINING_GROUNDS_KEY, -- Tr. Grounds Key
            xi.item.MERCENARY_CAMP_ENTRY_SLIP, -- M. Camp Entry
            xi.item.GLINTING_SHIELD, -- Glinting Shield
            xi.item.FLASK_OF_PEST_REPELLENT, -- Pest Repellent
            xi.item.ATHENA_ORB, -- Athena Orb
            xi.item.CRACKED_NUT, -- Cracked Nut
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.PINCH_OF_PUNGENT_POWDER, -- Pungent Powder
            xi.item.PINCH_OF_PUNGENT_POWDER_II, -- Pungent Powder II
            xi.item.TROTH, -- Troth
            xi.item.BONANZA_BALL, -- Bonanza Ball
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.MOG_KUPON_I_S1, -- Kupon I-S1
            xi.item.EUDAEMON_BLADE, -- Eudaemon Blade
            xi.item.EUDAEMON_CAPE, -- Eudaemon Cape
            xi.item.EUDAEMON_RING, -- Eudaemon Ring
            xi.item.EUDAEMON_SASH, -- Eudaemon Sash
            xi.item.EUDAEMON_SHIELD, -- Eudaemon Shield
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.ASTRAL_CUBE, -- Astral Cube
            xi.item.FAR_EAST_HEARTH, -- Far East Hearth
            xi.item.CHERRY_TREE, -- Cherry Tree
            xi.item.ROUNSEY_WAND, -- Rounsey Wand
            xi.item.PINCH_OF_PUNGENT_POWDER_III, -- Pungent Powder III
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.RARAB_CAP, -- Rarab Cap
            xi.item.MORBOL_CAP, -- Morbol Cap
            xi.item.SHEEP_CAP, -- Sheep Cap
            xi.item.MOUNT_WARMACHINE, -- ♪Warmachine
            xi.item.DIAMOND_BUCKLER, -- Diamond Buckler
            xi.item.PRISHE_STATUE_II, -- Prishe Statue II
            xi.item.ARCIELA_STATUE, -- Arciela Statue
            xi.item.IROHA_STATUE, -- Iroha Statue
            xi.item.LION_STATUE, -- Lion Statue
            xi.item.LILISETTE_STATUE, -- Lilisette Statue
            xi.item.APHMAU_STATUE, -- Aphmau Statue
            xi.item.MUTSUNOKAMI, -- Mutsunokami
            xi.item.MANDRAGORA_POT, -- Mandragora Pot
            xi.item.BYAKKO_NOTEBOOK, -- ♪Byakko
            xi.item.MOUNT_PHUABO, -- ♪Phuabo
            xi.item.ESOTERIC_ATHAME, -- Esoteric Athame
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.SHEET_OF_FISHING_TUNES, -- Fishing Tunes
        },
    },

    [17] =
    {
        ['price'] = 750,
        ['items'] =
        {
            xi.item.KITCHEN_BRICK, -- Kitchen Brick
            xi.item.KITCHEN_STOVE, -- Kitchen Stove
            xi.item.KITCHEN_PLATE, -- Kitchen Plate
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
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
            xi.item.PARAGON_SAMURAI_CARD, -- P. SAM Card
            xi.item.PARAGON_NINJA_CARD, -- P. NIN Card
            xi.item.PARAGON_DRAGOON_CARD, -- P. DRG Card
            xi.item.PARAGON_SUMMONER_CARD, -- P. SMN Card
            xi.item.PARAGON_BLUE_MAGE_CARD, -- P. BLU Card
            xi.item.PARAGON_CORSAIR_CARD, -- P. COR Card
            xi.item.PARAGON_PUPPETMASTER_CARD, -- P. PUP Card
            xi.item.PARAGON_DANCER_CARD, -- P. DNC Card
            xi.item.PARAGON_SCHOLAR_CARD, -- P. SCH Card
            xi.item.PARAGON_GEOMANCER_CARD, -- P. GEO Card
            xi.item.PARAGON_RUNE_FENCER_CARD, -- P. RUN Card
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
            xi.item.VALKURM_IMPERATORS_WING, -- Imperator's Wing
            xi.item.EMPEROR_ARTHROS_SHELL, -- Arthro's Shell
            xi.item.ORCFELTRAPS_LEAF, -- Orcfeltrap's Leaf
            xi.item.JAR_OF_GARBAGE_GELS_MUCUS, -- G. Gel's Mucus
            xi.item.CLUMP_OF_JOYOUS_GREENS_MOSS, -- Joyous's Moss
            xi.item.ABYSSDIVERS_FEATHER, -- Abyssdiver Feather
            xi.item.INTUILAS_HIDE, -- Intuila's Hide
            xi.item.VOSOS_HIDE, -- Voso's Hide
            xi.item.WARBLADE_BEAKS_HIDE, -- Warblade's Hide
            xi.item.HANDFUL_OF_HEILIGTUMS_MOSS, -- Heiligtum's Moss
            xi.item.JESTER_MALATRIXS_SHARD, -- Malatrix's Shard
            xi.item.IMMANIBUGARDS_HIDE, -- Immani. Hide
            xi.item.TIYANAKS_FANG, -- Tiyanak's Fang
            xi.item.CACTROT_VELOZS_NEEDLE, -- Veloz's Needle
            xi.item.WOODLAND_MENDERS_LOG, -- Mender's Log
            xi.item.SYBARITIC_SAMANTHAS_VINE, -- Samantha's Vine
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
        },
    },

}

return prizes
