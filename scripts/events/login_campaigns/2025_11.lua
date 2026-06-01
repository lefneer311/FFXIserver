-- Source: documentation/Login_Campaign_History_Source.txt, November 2025 - Campaign No.149.
-- Verification: generated directly from the published source table; reward names were resolved through sql/item_basic.sql and xi.item constants.
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 5,
        ['items'] =
        {
            xi.item.CORDIAL_INVITE, -- Cordial Invite
            xi.item.MARTIAL_BALL_INVITE, -- Martial Ball Invite
            xi.item.TRAINING_GROUNDS_KEY, -- Tr. Grounds Key
            xi.item.MERCENARY_CAMP_ENTRY_SLIP, -- M. Camp Entry
            xi.item.FLASK_OF_PEST_REPELLENT, -- Pest Repellent
            xi.item.ATHENA_ORB, -- Athena Orb
            xi.item.CRACKED_NUT, -- Cracked Nut
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.PINCH_OF_PUNGENT_POWDER, -- Pungent Powder
            xi.item.PINCH_OF_PUNGENT_POWDER_II, -- Pungent Powder II
            xi.item.MOUNT_GOOBBUE, -- ♪Goobbue
            xi.item.MOUNT_CRAB, -- ♪Crab
            xi.item.ASTRAL_CUBE, -- Astral Cube
            xi.item.CUMULUS_MASQUE, -- Cumulus Masque
            xi.item.DISPATCHERS_AXE, -- Dispatcher's Axe
            xi.item.EXCALIPOOR, -- Excalipoor
        },
    },

    [5] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.BEASTMENS_SEAL, -- Beastmen's Seal
            xi.item.KINDREDS_SEAL, -- Kindred's Seal
            xi.item.KINDREDS_CREST, -- Kindred's Crest
            xi.item.HIGH_KINDREDS_CREST, -- High Kindred's Crest
            xi.item.SACRED_KINDREDS_CREST, -- S. Kindred Crest
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO, -- Cipher: Qultada
            xi.item.CIPHER_OF_OVJANGS_ALTER_EGO, -- Cipher: Ovjang
            xi.item.CIPHER_OF_KARAHAS_ALTER_EGO, -- Cipher: Karaha
            xi.item.CIPHER_OF_NOILLURIES_ALTER_EGO, -- Cipher: Noillurie
            xi.item.CIPHER_OF_MARGRETS_ALTER_EGO, -- Cipher: Margret
            xi.item.CIPHER_OF_LEHKOS_ALTER_EGO, -- Cipher: Lehko
            xi.item.CIPHER_OF_UKAS_ALTER_EGO, -- Cipher: Uka
            xi.item.CIPHER_OF_AREUHATS_ALTER_EGO, -- Cipher: Areuhat
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO, -- Cipher: Mayakov
            xi.item.CIPHER_OF_TEODORS_ALTER_EGO, -- Cipher: Teodor
            xi.item.CIPHER_OF_KORU_MORUS_ALTER_EGO, -- Cipher: Koru-Moru
            xi.item.CIPHER_OF_MNEJINGS_ALTER_EGO, -- Cipher: Mnejing
            xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO, -- Cipher: Domina
            xi.item.CIPHER_OF_KUKKIS_ALTER_EGO, -- Cipher: Kukki
            xi.item.CIPHER_OF_ULLEGORES_ALTER_EGO, -- Cipher: Ullegore
        },
    },

    [9] =
    {
        ['price'] = 150,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1, -- Rem's Tale Ch.1
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2, -- Rem's Tale Ch.2
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3, -- Rem's Tale Ch.3
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4, -- Rem's Tale Ch.4
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5, -- Rem's Tale Ch.5
            xi.item.ETCHED_MEMORY, -- Etched Memory
            xi.item.MOUNT_BEETLE, -- ♪Beetle
            xi.item.MOUNT_DHALMEL, -- ♪Dhalmel
            xi.item.GOLDEN_BOMB_NOTEBOOK, -- ♪Golden Bomb
            xi.item.IRON_GIANT_NOTEBOOK, -- ♪Iron Giant
            xi.item.PIECE_OF_COPSE_CANDY, -- Copse Candy
            xi.item.BLIZZARD_BRAND, -- Blizzard Brand
            xi.item.WYRMKING_MASQUE_P1, -- Wyrm. Masque +1
            xi.item.WYRMKING_SUIT_P1, -- Wyrmking Suit +1
            xi.item.CHOCOBO_CHAIR_II, -- Chocobo Chair II
            xi.item.MOG_KUPON_A_AEV, -- Kupon A-AEV
            xi.item.MOG_KUPON_A_AHM, -- Kupon A-AHM
            xi.item.MOG_KUPON_A_AGK, -- Kupon A-AGK
            xi.item.MOG_KUPON_A_ATT, -- Kupon A-ATT
            xi.item.MOG_KUPON_A_AMR, -- Kupon A-AMR
            xi.item.ARK_TACHI, -- Ark Tachi
            xi.item.ARK_TABAR, -- Ark Tabar
            xi.item.ARK_SCYTHE, -- Ark Scythe
            xi.item.ARK_SABER, -- Ark Saber
            xi.item.ARK_SWORD, -- Ark Sword
            xi.item.ARK_SHIELD, -- Ark Shield
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
            xi.item.VIAL_OF_BLACK_BEETLE_BLOOD, -- Beetle Blood
            xi.item.PHOENIX_FEATHER, -- Phoenix Feather
            xi.item.SQUARE_OF_DAMASCENE_CLOTH, -- Damascene Cloth
            xi.item.SPOOL_OF_MALBORO_FIBER, -- Malboro Fiber
            xi.item.PIECE_OF_OXBLOOD, -- Oxblood
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

    [17] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            xi.item.CUP_OF_SWEET_TEA, -- Sweet Tea
            xi.item.SAVORY_SHANK, -- Savory Shank
            xi.item.CLUMP_OF_RED_PONDWEED, -- Red Pondweed
            xi.item.MUNDUS_SHIELD, -- Mundus Shield
            xi.item.MALIYAKALEYA_ORB, -- Maliya. Coral Orb
            xi.item.HEPATIZON_INGOT, -- Hepatizon Ingot
            xi.item.BERYLLIUM_INGOT, -- Beryllium Ingot
            xi.item.PIECE_OF_EXALTED_LUMBER, -- Exalted Lumber
            xi.item.SPOOL_OF_SIFS_MACRAME, -- Sif's Macrame
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
