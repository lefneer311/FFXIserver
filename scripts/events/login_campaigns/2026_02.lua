-- Source: documentation/Login_Campaign_History_Source.txt, February 2026 - Campaign No.152.
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
            xi.item.TROTH, -- Troth
            xi.item.TARAZACUM_ORB, -- Tarazacum Orb
        },
    },

    [5] =
    {
        ['price'] = 10,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.HEARTBEATER, -- Heartbeater
            xi.item.ZINNIA_ORB, -- Zinnia Orb
            xi.item.CIPHER_OF_MARGRETS_ALTER_EGO, -- Cipher: Margret
            xi.item.CIPHER_OF_KARAHAS_ALTER_EGO, -- Cipher: Karaha
            xi.item.CIPHER_OF_LIONS_ALTER_EGO, -- Cipher: Lion
            xi.item.CIPHER_OF_NAJAS_ALTER_EGO, -- Cipher: Naja
            xi.item.CIPHER_OF_LHUS_ALTER_EGO, -- Cipher: Lhu
            xi.item.CIPHER_OF_UKAS_ALTER_EGO, -- Cipher: Uka
            xi.item.CIPHER_OF_AREUHATS_ALTER_EGO, -- Cipher: Areuhat
            xi.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO, -- Cipher: S. Sibyl
            xi.item.CIPHER_OF_KUYINS_ALTER_EGO, -- Cipher: Kuyin
            xi.item.CIPHER_OF_BRYGIDS_ALTER_EGO, -- Cipher: Brygid
            xi.item.CIPHER_OF_MNEJINGS_ALTER_EGO, -- Cipher: Mnejing
            xi.item.CIPHER_OF_AMCHUCHUS_ALTER_EGO, -- Cipher: Amchuchu
            xi.item.CIPHER_OF_OVJANGS_ALTER_EGO, -- Cipher: Ovjang
            xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO, -- Cipher: Domina
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
            xi.item.DHALMEL_TROUSERS, -- Dhalmel Trousers
            xi.item.ARTEMISS_BOW, -- Artemis's Bow
            xi.item.ARTHROS_CAP, -- Arthro's Cap
            xi.item.CHOCOBO_MASQUE, -- Chocobo Masque
            xi.item.CHOCOBO_SUIT, -- Chocobo Suit
            xi.item.MOUNT_DOLL, -- ♪Doll
            xi.item.MITHKABOB_SHIRT, -- Mithkabob Shirt
            xi.item.WIVRE_NOTEBOOK, -- ♪Wivre
            xi.item.BESIGILED_TABLE, -- Besigiled Table
            xi.item.PRISMATIC_CHEST, -- Prismatic Chest
            xi.item.SHEET_OF_NEAR_EAST_TUNES, -- Near East Tunes
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.COPY_OF_MELODIOUS_PLANS, -- Melodious Plans
            xi.item.TIMBRE_CASE_KIT, -- Timbre Case Kit
            xi.item.MUSICHINERY_KIT, -- Musichinery Kit
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
            xi.item.FISHERMANS_FEAST, -- Fisherman's Feast
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
            xi.item.MARS_ORB, -- Mars Orb
        },
    },

}

return prizes
