-- Source: documentation/Login_Campaign_History_Source.txt, January 2026 - Campaign No.151.
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
            xi.item.CRACKED_NUT, -- Cracked Nut
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.PINCH_OF_PUNGENT_POWDER, -- Pungent Powder
            xi.item.PINCH_OF_PUNGENT_POWDER_II, -- Pungent Powder II
            xi.item.FAR_EAST_HEARTH, -- Far East Hearth
            xi.item.CAIT_SITH_GUARD, -- Cait Sith Guard
        },
    },

    [5] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.ASTRAL_CUBE, -- Astral Cube
            xi.item.RHAPSODY_SHIRT, -- Rhapsody Shirt
            xi.item.CIPHER_OF_ELIVIRAS_ALTER_EGO, -- Cipher: Elivira
            xi.item.CIPHER_OF_MAKKIS_ALTER_EGO, -- Cipher: Makki
            xi.item.CIPHER_OF_NOILLURIES_ALTER_EGO, -- Cipher: Noillurie
            xi.item.CIPHER_OF_CIDS_ALTER_EGO, -- Cipher: Cid
            xi.item.CIPHER_OF_MILDAURIONS_ALTER_EGO, -- Cipher: Mildaurion
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO, -- Cipher: Mayakov
            xi.item.CIPHER_OF_MORIMARS_ALTER_EGO, -- Cipher: Morimar
            xi.item.CIPHER_OF_KORU_MORUS_ALTER_EGO, -- Cipher: Koru-Moru
            xi.item.CIPHER_OF_QULTADAS_ALTER_EGO, -- Cipher: Qultada
            xi.item.CIPHER_OF_KINGS_ALTER_EGO, -- Cipher: King
            xi.item.CIPHER_OF_RAHALS_ALTER_EGO, -- Cipher: Rahal
            xi.item.CIPHER_OF_KUKKIS_ALTER_EGO, -- Cipher: Kukki
            xi.item.CIPHER_OF_LEONOYNES_ALTER_EGO, -- Cipher: Leonoyne
            xi.item.CIPHER_OF_KAYEELS_ALTER_EGO, -- Cipher: Kayeel
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
            xi.item.SHEET_OF_DIVINE_TUNES, -- Sheet of Divine Tunes
            xi.item.MOUNT_TULFAIRE, -- ♪Tulfaire
            xi.item.MOUNT_SPHEROID, -- ♪Spheroid
            xi.item.MOUNT_RAAZ, -- ♪Raaz
            xi.item.ARK_TACHI, -- Ark Tachi
            xi.item.ARK_TABAR, -- Ark Tabar
            xi.item.ARK_SCYTHE, -- Ark Scythe
            xi.item.ARK_SABER, -- Ark Saber
            xi.item.ARK_SWORD, -- Ark Sword
            xi.item.MODEL_SYNERGY_FURNACE, -- Model Synergy Furnace
            xi.item.ADENIUM_MASQUE, -- Adenium Masque
            xi.item.ADENIUM_SUIT, -- Adenium Suit
            xi.item.FELINE_HAGOITA, -- Feline Hagoita
            xi.item.KNIT_CAP, -- Knit Cap
            xi.item.LIZARD_FANGS, -- Lizard Fangs
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
            xi.item.VIAL_OF_BLACK_BEETLE_BLOOD, -- Black Beetle Blood
            xi.item.PHOENIX_FEATHER, -- Phoenix Feather
            xi.item.SQUARE_OF_DAMASCENE_CLOTH, -- Damascene Cloth
            xi.item.SPOOL_OF_MALBORO_FIBER, -- Malboro Fiber
            xi.item.PIECE_OF_OXBLOOD, -- Oxblood
            xi.item.KULKULKANS_FANG, -- Kukulkan's Fang
            xi.item.TWO_LEAF_CHLORIS_BUD, -- Two-leaf Chloris Bud
            xi.item.GLAVOID_SHELL, -- Glavoid Shell
            xi.item.HELM_OF_BRIAREUS, -- Helm of Briareus
            xi.item.CARABOSSES_GEM, -- Carabosse's Gem
            xi.item.ITZPAPALOTLS_SCALE, -- Itzpapalotl's Scale
            xi.item.ULHUADSHIS_FANG, -- Ulhuadshi's Fang
            xi.item.CIREIN_CROINS_LANTERN, -- Cirein-croin's Lantern
            xi.item.SOBEKS_SKIN, -- Sobek's Skin
            xi.item.BUKHISS_WING, -- Bukhis's Wing
            xi.item.SEDNAS_TUSK, -- Sedna's Tusk
            xi.item.ORTHRUSS_CLAW, -- Orthrus's Claw
            xi.item.DRAGUAS_SCALE, -- Dragua's Scale
            xi.item.APADEMAKS_HORN, -- Apademak's Horn
            xi.item.AZDAJAS_HORN, -- Azdaja's Horn
            xi.item.ISGEBINDS_HEART, -- Isgebind's Heart
            xi.item.ALFARDS_FANG, -- Alfard's Fang
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
            xi.item.FISTFUL_OF_MURKY_MATTER, -- Murky Matter
        },
    },

}

return prizes
