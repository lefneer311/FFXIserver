-- Source: documentation/Login_Campaign_History_Source.txt, August 2024 - Campaign No.134.
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
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            xi.item.DRILL_CALAMARY, -- Drill Calamary
            xi.item.DWARF_PUGIL, -- Dwarf Pugil
            xi.item.MELON_SLICER, -- Melon Slicer
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
            xi.item.MOUNT_COEURL, -- ♪Coeurl
            xi.item.MOUNT_ADAMANTOISE, -- ♪Adamantoise
            xi.item.RED_RAPTOR_NOTEBOOK, -- ♪Red Raptor
            xi.item.NOBLE_CHOCOBO_NOTEBOOK, -- ♪Noble Chocobo
        },
    },

    [9] =
    {
        ['price'] = 300,
        ['items'] =
        {
            xi.item.CIPHER_OF_SHANTOTTOS_ALTER_EGO_II, -- Cipher: Shantotto II
            xi.item.ZANMATO, -- Zanmato
            xi.item.SHA_WUJINGS_LANCE, -- Sha Wujing's Lance
            xi.item.SILVER_GUN, -- Silver Gun
            xi.item.POISON_AXE, -- Poison Axe
            xi.item.MAGICIANS_ROD, -- Magician's Rod
            xi.item.SEIKA_UCHIWA, -- Seika Uchiwa
            xi.item.FANCY_GILET, -- Fancy Gilet
            xi.item.FANCY_TOP, -- Fancy Top
            xi.item.FANCY_TRUNKS, -- Fancy Trunks
            xi.item.FANCY_SHORTS, -- Fancy Shorts
            xi.item.POROGGO_FLEECE, -- Poroggo Fleece
            xi.item.AGEIST, -- Ageist
            xi.item.LION_STATUE, -- Lion Statue
            xi.item.ARCIELA_STATUE, -- Arciela Statue
            xi.item.CRIMSON_CHEST, -- Crimson Chest
            xi.item.HANDFUL_OF_ADOULINIAN_TOMATOES, -- Ado. Tomatoes
            xi.item.MOOGLE_BED, -- Moogle Bed
            xi.item.LEAFKIN_BED, -- Leafkin Bed
            xi.item.COLIBRI_BED, -- Colibri Bed
        },
    },

    [13] =
    {
        ['price'] = 500,
        ['items'] =
        {
            xi.item.MOG_KUPON_A_AGK, -- Kupon A-AGK
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
            xi.item.FRAYED_SACK_OF_PLENTY, -- Frayed Sack (Fer)
            xi.item.FRAYED_SACK_OF_OPULENCE, -- Frayed Sack (Tau)
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
