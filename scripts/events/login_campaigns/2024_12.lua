-- Source: documentation/Login_Campaign_History_Source.txt, December 2024 - Campaign No.138.
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
            xi.item.FLASK_OF_PEST_REPELLENT, -- Pest Repellent
            xi.item.ATHENA_ORB, -- Athena Orb
            xi.item.CRACKED_NUT, -- Cracked Nut
            xi.item.SEASONING_STONE, -- Seasoning Stone
            xi.item.FOSSILIZED_FANG, -- Fossilized Fang
            xi.item.FOSSILIZED_BONE, -- Fossilized Bone
            xi.item.PINCH_OF_PUNGENT_POWDER, -- Pungent Powder
            xi.item.PINCH_OF_PUNGENT_POWDER_II, -- Pungent Powder II
            xi.item.TROTH, -- Troth
            xi.item.GLINTING_SHIELD, -- Glinting Shield
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
            xi.item.CIPHER_OF_ZEIDS_ALTER_EGO, -- Cipher: Zeid
            xi.item.CIPHER_OF_LIONS_ALTER_EGO, -- Cipher: Lion
            xi.item.CIPHER_OF_NAJAS_ALTER_EGO, -- Cipher: Naja
            xi.item.CIPHER_OF_LEHKOS_ALTER_EGO, -- Cipher: Lehko
            xi.item.CIPHER_OF_LUZAFS_ALTER_EGO, -- Cipher: Luzaf
            xi.item.CIPHER_OF_NAJELITHS_ALTER_EGO, -- Cipher: Najelith
            xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO, -- Cipher: Domina
            xi.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO, -- Cipher: S. Sibyl
            xi.item.CIPHER_OF_KARAHAS_ALTER_EGO, -- Cipher: Karaha
            xi.item.CIPHER_OF_AREUHATS_ALTER_EGO, -- Cipher: Areuhat
            xi.item.CIPHER_OF_UKAS_ALTER_EGO, -- Cipher: Uka
            xi.item.CIPHER_OF_KUYINS_ALTER_EGO, -- Cipher: Kuyin
            xi.item.CIPHER_OF_ABENZIOS_ALTER_EGO, -- Cipher: Abenzio
            xi.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO, -- Cipher: Rughadjeen
            xi.item.CIPHER_OF_LHES_ALTER_EGO, -- Cipher: Lhe
            xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO, -- Cipher: Mayakov
            xi.item.CIPHER_OF_BRYGIDS_ALTER_EGO, -- Cipher: Brygid
            xi.item.CIPHER_OF_MILDAURIONS_ALTER_EGO, -- Cipher: Mildaurion
            xi.item.CIPHER_OF_RONGELOUTSS_ALTER_EGO, -- Cipher: Rongelouts
            xi.item.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO, -- Cipher: Robel-Akbel
            xi.item.CIPHER_OF_ULLEGORES_ALTER_EGO, -- Cipher: Ullegore
            xi.item.CIPHER_OF_TEODORS_ALTER_EGO, -- Cipher: Teodor
            xi.item.CIPHER_OF_DARRCUILNS_ALTER_EGO, -- Cipher: Darrcuiln
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.FRAYED_POUCH_OF_BIRTH, -- Frayed Pouch (B)
            xi.item.FRAYED_POUCH_OF_ADVANCEMENT, -- Frayed Pouch (A)
            xi.item.FRAYED_POUCH_OF_GLORY, -- Frayed Pouch (G)
            xi.item.FRAYED_POUCH_OF_DECAY, -- Frayed Pouch (D)
            xi.item.FRAYED_POUCH_OF_RUIN, -- Frayed Pouch (R)
            xi.item.FRAYED_SACK_OF_DEVIOUSNESS, -- Frayed Sack (D)
            xi.item.FRAYED_SACK_OF_LIMINALITY, -- Frayed Sack (L)
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1, -- Rem's Tale Ch.1
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2, -- Rem's Tale Ch.2
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3, -- Rem's Tale Ch.3
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4, -- Rem's Tale Ch.4
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5, -- Rem's Tale Ch.5
            xi.item.ETCHED_MEMORY, -- Etched Memory
            xi.item.CIPHER_OF_SHANTOTTOS_ALTER_EGO_II, -- Cipher: Shantotto II
            xi.item.PAINTING_OF_BLUEBLADE_FELL, -- Blueblade Fell
            xi.item.IXION_NOTEBOOK, -- ♪Ixion
            xi.item.DENIM_PANTS, -- Denim Pants
            xi.item.YAGYU_SHORTBLADE, -- Yagyu Shortblade
            xi.item.ERUDITES_STAFF, -- Erudite's Staff
            xi.item.CHOCOBO_CHAIR_II, -- Chocobo Chair II
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.KYUKOTO, -- Kyukoto
        },
    },

    [17] =
    {
        ['price'] = 750,
        ['items'] =
        {
            xi.item.COPY_OF_MELODIOUS_PLANS, -- Melodious Plans
            xi.item.TIMBRE_CASE_KIT, -- Timbre Case Kit
            xi.item.MUSICHINERY_KIT, -- Musichinery Kit
            xi.item.JUG_OF_HONEY_WINE, -- Honey Wine
            xi.item.BEASTLY_SHANK, -- Beastly Shank
            xi.item.CLUMP_OF_BLUE_PONDWEED, -- Blue Pondweed
            xi.item.BRIGANDS_CHART, -- Brigand's Chart
            xi.item.PIRATES_CHART, -- Pirate's Chart
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6, -- Rem's Tale Ch.6
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7, -- Rem's Tale Ch.7
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8, -- Rem's Tale Ch.8
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9, -- Rem's Tale Ch.9
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10, -- Rem's Tale Ch.10
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
            xi.item.FRAYED_SACK_OF_FECUNDITY, -- Frayed Sack (Pel)
            xi.item.CODEX_OF_ETCHINGS, -- Codex of Etchings
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
            xi.item.IMPISH_BOX, -- Impish Box
        },
    },

}

return prizes
