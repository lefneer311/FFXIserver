-----------------------------------
-- Voidwatch Global
-----------------------------------
require('scripts/enum/item')
require('scripts/enum/key_item')
require('scripts/enum/zone')
-----------------------------------
xi = xi or {}
xi.voidwatch = xi.voidwatch or {}

xi.voidwatch.varPrefix = '[Voidwatch]'
xi.voidwatch.minimumLevel = 75

xi.voidwatch.stratum =
{
    CRIMSON  = 1,
    INDIGO   = 2,
    JADE     = 3,
    WHITE    = 4,
    ASHEN    = 5,
    HYACINTH = 6,
    AMBER    = 7,
}

xi.voidwatch.routeName =
{
    SANDORIA   = 'sandoria'  ,
    BASTOK     = 'bastok'    ,
    WINDURST   = 'windurst'  ,
    JEUNO      = 'jeuno'     ,
    ZILART     = 'zilart'    ,
    TAVNAZIA   = 'tavnazia'  ,
    AHT_URHGAN = 'ahtUrhgan' ,
    PROVENANCE = 'provenance',
}

xi.voidwatch.alignment =
{
    RED    = 1,
    BLUE   = 2,
    GREEN  = 3,
    YELLOW = 4,
    WHITE  = 5,
}

xi.voidwatch.items =
{
    cells =
    {
        COBALT   = xi.item.COBALT_CELL  ,
        RUBICUND = xi.item.RUBICUND_CELL,
        XANTHOUS = xi.item.XANTHOUS_CELL,
        JADE     = xi.item.JADE_CELL    ,
    },

    voiddust = xi.item.POUCH_OF_VOIDDUST,
}

xi.voidwatch.keyItems =
{
    adventurersCertificate = xi.keyItem.ADVENTURERS_CERTIFICATE,

    voidstones =
    {
        xi.keyItem.VOIDSTONE1,
        xi.keyItem.VOIDSTONE2,
        xi.keyItem.VOIDSTONE3,
        xi.keyItem.VOIDSTONE4,
        xi.keyItem.VOIDSTONE5,
        xi.keyItem.VOIDSTONE6,
    },

    stratum =
    {
        [xi.voidwatch.stratum.CRIMSON] =
        {
            xi.keyItem.CRIMSON_STRATUM_ABYSSITE    ,
            xi.keyItem.CRIMSON_STRATUM_ABYSSITE_II ,
            xi.keyItem.CRIMSON_STRATUM_ABYSSITE_III,
            xi.keyItem.CRIMSON_STRATUM_ABYSSITE_IV ,
        },

        [xi.voidwatch.stratum.INDIGO] =
        {
            xi.keyItem.INDIGO_STRATUM_ABYSSITE    ,
            xi.keyItem.INDIGO_STRATUM_ABYSSITE_II ,
            xi.keyItem.INDIGO_STRATUM_ABYSSITE_III,
            xi.keyItem.INDIGO_STRATUM_ABYSSITE_IV ,
        },

        [xi.voidwatch.stratum.JADE] =
        {
            xi.keyItem.JADE_STRATUM_ABYSSITE    ,
            xi.keyItem.JADE_STRATUM_ABYSSITE_II ,
            xi.keyItem.JADE_STRATUM_ABYSSITE_III,
            xi.keyItem.JADE_STRATUM_ABYSSITE_IV ,
        },

        [xi.voidwatch.stratum.WHITE] =
        {
            xi.keyItem.WHITE_STRATUM_ABYSSITE    ,
            xi.keyItem.WHITE_STRATUM_ABYSSITE_II ,
            xi.keyItem.WHITE_STRATUM_ABYSSITE_III,
            xi.keyItem.WHITE_STRATUM_ABYSSITE_IV ,
            xi.keyItem.WHITE_STRATUM_ABYSSITE_V  ,
            xi.keyItem.WHITE_STRATUM_ABYSSITE_VI ,
        },

        [xi.voidwatch.stratum.ASHEN] =
        {
            xi.keyItem.ASHEN_STRATUM_ABYSSITE    ,
            xi.keyItem.ASHEN_STRATUM_ABYSSITE_II ,
            xi.keyItem.ASHEN_STRATUM_ABYSSITE_III,
        },

        [xi.voidwatch.stratum.HYACINTH] =
        {
            xi.keyItem.HYACINTH_STRATUM_ABYSSITE   ,
            xi.keyItem.HYACINTH_STRATUM_ABYSSITE_II,
        },

        [xi.voidwatch.stratum.AMBER] =
        {
            xi.keyItem.AMBER_STRATUM_ABYSSITE   ,
            xi.keyItem.AMBER_STRATUM_ABYSSITE_II,
        },
    },

    periapts =
    {
        emergence =
        {
            xi.keyItem.PERIAPT_OF_EMERGENCE1,
            xi.keyItem.PERIAPT_OF_EMERGENCE2,
            xi.keyItem.PERIAPT_OF_EMERGENCE3,
        },

        guidance     = xi.keyItem.PERIAPT_OF_GUIDANCE   ,
        percipience  = xi.keyItem.PERIAPT_OF_PERCIPIENCE,
        recompense   = xi.keyItem.PERIAPT_OF_RECOMPENSE ,
        sapience     = xi.keyItem.PERIAPT_OF_SAPIENCE   ,
        clarity      = xi.keyItem.PERIAPT_OF_CLARITY    ,

        frontiers =
        {
            xi.keyItem.VIVID_PERIAPT_OF_FRONTIERS  ,
            xi.keyItem.DUSKY_PERIAPT_OF_FRONTIERS  ,
            xi.keyItem.NEUTRAL_PERIAPT_OF_FRONTIERS,
        },

        exploration =
        {
            xi.keyItem.VIVID_PERIAPT_OF_EXPLORATION,
            xi.keyItem.DUSKY_PERIAPT_OF_EXPLORATION,
        },
    },

    atmacites =
    {
        xi.keyItem.ATMACITE_OF_DEVOTION     ,
        xi.keyItem.ATMACITE_OF_PERSISTENCE  ,
        xi.keyItem.ATMACITE_OF_EMINENCE     ,
        xi.keyItem.ATMACITE_OF_ONSLAUGHT    ,
        xi.keyItem.ATMACITE_OF_INCURSION    ,
        xi.keyItem.ATMACITE_OF_ENTICEMENT   ,
        xi.keyItem.ATMACITE_OF_DESTRUCTION  ,
        xi.keyItem.ATMACITE_OF_TEMPERANCE   ,
        xi.keyItem.ATMACITE_OF_DISCIPLINE   ,
        xi.keyItem.ATMACITE_OF_COERCION     ,
        xi.keyItem.ATMACITE_OF_FINESSE      ,
        xi.keyItem.ATMACITE_OF_LATITUDE     ,
        xi.keyItem.ATMACITE_OF_MYSTICISM    ,
        xi.keyItem.ATMACITE_OF_RAPIDITY     ,
        xi.keyItem.ATMACITE_OF_PREPAREDNESS ,
        xi.keyItem.ATMACITE_OF_DELUGES      ,
        xi.keyItem.ATMACITE_OF_UNITY        ,
        xi.keyItem.ATMACITE_OF_EXHORTATION  ,
        xi.keyItem.ATMACITE_OF_SKYBLAZE     ,
        xi.keyItem.ATMACITE_OF_THE_SLAYER   ,
        xi.keyItem.ATMACITE_OF_THE_ADAMANT  ,
        xi.keyItem.ATMACITE_OF_THE_VALIANT  ,
        xi.keyItem.ATMACITE_OF_THE_SHREWD   ,
        xi.keyItem.ATMACITE_OF_THE_VANGUARD ,
        xi.keyItem.ATMACITE_OF_ASSAILMENT   ,
        xi.keyItem.ATMACITE_OF_CATAPHRACT   ,
        xi.keyItem.ATMACITE_OF_THE_PARAPET  ,
        xi.keyItem.ATMACITE_OF_IMPERIUM     ,
        xi.keyItem.ATMACITE_OF_THE_SOLIPSIST,
        xi.keyItem.ATMACITE_OF_PROVENANCE   ,
        xi.keyItem.ATMACITE_OF_DARK_DESIGNS ,
        xi.keyItem.ATMACITE_OF_THE_FORAGER  ,
        xi.keyItem.ATMACITE_OF_GLACIERS     ,
        xi.keyItem.ATMACITE_OF_AFFINITY     ,
        xi.keyItem.ATMACITE_OF_THE_DEPTHS   ,
        xi.keyItem.ATMACITE_OF_THE_ASSASSIN ,
        xi.keyItem.ATMACITE_OF_APLOMB       ,
        xi.keyItem.ATMACITE_OF_THE_TROPICS  ,
        xi.keyItem.ATMACITE_OF_CURSES       ,
        xi.keyItem.ATMACITE_OF_PRESERVATION ,
    },

    petrifacts =
    {
        BEGUILING = xi.keyItem.BEGUILING_PETRIFACT,
        SEDUCTIVE = xi.keyItem.SEDUCTIVE_PETRIFACT,
        MADDENING = xi.keyItem.MADDENING_PETRIFACT,
    },

    corundums =
    {
        xi.keyItem.KUPOFRIEDS_CORUNDUM_1,
        xi.keyItem.KUPOFRIEDS_CORUNDUM_2,
        xi.keyItem.KUPOFRIEDS_CORUNDUM_3,
    },
}

local routeName = xi.voidwatch.routeName
local stratum   = xi.voidwatch.stratum

xi.voidwatch.routes =
{
    [routeName.SANDORIA] =
    {
        name = 'San d\'Oria'     ,
        stratum = stratum.CRIMSON,
        tiers =
        {
            [1] =
            {
                { nm = 'Sarimanok', zone = xi.zone.EAST_RONFAURE   },
                { nm = 'Cottus'   , zone = xi.zone.EAST_RONFAURE_S },
            },
            [2] =
            {
                { nm = 'Krabimanjaro', zone = xi.zone.ORDELLES_CAVES },
            },
            [3] =
            {
                { nm = 'Belphoebe'  , zone = xi.zone.JUGNER_FOREST   },
                { nm = 'Kholomodumo', zone = xi.zone.JUGNER_FOREST_S },
            },
            [4] =
            {
                { nm = 'Hahava', zone = xi.zone.KING_RANPERRES_TOMB },
            },
        },
    },

    [routeName.BASTOK] =
    {
        name = 'Bastok'         ,
        stratum = stratum.INDIGO,
        tiers =
        {
            [1] =
            {
                { nm = 'Sallow Seymour', zone = xi.zone.NORTH_GUSTABERG   },
                { nm = 'Ushumgal'      , zone = xi.zone.NORTH_GUSTABERG_S },
            },
            [2] =
            {
                { nm = 'Lorbulcrud', zone = xi.zone.GUSGEN_MINES },
            },
            [3] =
            {
                { nm = 'Murk-veined Baneberry', zone = xi.zone.PASHHOW_MARSHLANDS   },
                { nm = 'Melancholic Moira'    , zone = xi.zone.PASHHOW_MARSHLANDS_S },
            },
            [4] =
            {
                { nm = 'Celaeno', zone = xi.zone.DANGRUF_WADI },
            },
        },
    },

    [routeName.WINDURST] =
    {
        name = 'Windurst'     ,
        stratum = stratum.JADE,
        tiers =
        {
            [1] =
            {
                { nm = 'Virvatuli' , zone = xi.zone.WEST_SARUTABARUTA   },
                { nm = 'Pancimanci', zone = xi.zone.WEST_SARUTABARUTA_S },
            },
            [2] =
            {
                { nm = 'Ogbunabali', zone = xi.zone.MAZE_OF_SHAKHRAMI },
            },
            [3] =
            {
                { nm = 'Lord Asag', zone = xi.zone.MERIPHATAUD_MOUNTAINS   },
                { nm = 'Akupara'  , zone = xi.zone.MERIPHATAUD_MOUNTAINS_S },
            },
            [4] =
            {
                { nm = 'Voidwrought', zone = xi.zone.OUTER_HORUTOTO_RUINS },
            },
        },
    },

    [routeName.JEUNO] =
    {
        name = 'Jeuno'         ,
        stratum = stratum.WHITE,
        tiers =
        {
            [1] =
            {
                { nm = 'Cherufe'   , zone = xi.zone.BATALLIA_DOWNS         },
                { nm = 'Taweret'   , zone = xi.zone.BATALLIA_DOWNS_S       },
                { nm = 'Yatagarasu', zone = xi.zone.ROLANBERRY_FIELDS      },
                { nm = 'Agathos'   , zone = xi.zone.ROLANBERRY_FIELDS_S    },
                { nm = 'Goji'      , zone = xi.zone.SAUROMUGUE_CHAMPAIGN   },
                { nm = 'Gugalanna' , zone = xi.zone.SAUROMUGUE_CHAMPAIGN_S },
            },
            [2] =
            {
                { nm = 'Gasha'          , zone = xi.zone.THE_ELDIEME_NECROPOLIS   },
                { nm = 'Giltine'        , zone = xi.zone.THE_ELDIEME_NECROPOLIS_S },
                { nm = 'Mellonia'       , zone = xi.zone.CRAWLERS_NEST            },
                { nm = 'Nympha Eunomia' , zone = xi.zone.CRAWLERS_NEST_S          },
                { nm = 'Roly-Poly'      , zone = xi.zone.GARLAIGE_CITADEL         },
                { nm = 'Laidly Laurence', zone = xi.zone.GARLAIGE_CITADEL_S       },
            },
            [3] =
            {
                { nm = 'Kaggen', zone = xi.zone.QUFIM_ISLAND          },
                { nm = 'Akvan' , zone = xi.zone.LOWER_DELKFUTTS_TOWER },
                { nm = 'Pil'   , zone = xi.zone.BEHEMOTHS_DOMINION    },
            },
            [4] =
            {
                { nm = 'Lancing Lamorak', zone = xi.zone.WEST_RONFAURE     },
                { nm = 'Bhishani'       , zone = xi.zone.SOUTH_GUSTABERG   },
                { nm = 'Rw Nw Prt M Hrw', zone = xi.zone.EAST_SARUTABARUTA },
            },
            [5] =
            {
                { nm = 'Stachysaurus' , zone = xi.zone.LA_THEINE_PLATEAU   },
                { nm = 'Gwynn Ap Nudd', zone = xi.zone.KONSCHTAT_HIGHLANDS },
                { nm = 'Smierc'       , zone = xi.zone.TAHRONGI_CANYON     },
            },
            [6] =
            {
                { nm = 'Gaunab'     , zone = xi.zone.VUNKERL_INLET_S      },
                { nm = 'Ocythoe'    , zone = xi.zone.GRAUBERG_S           },
                { nm = 'Kalasutrax' , zone = xi.zone.FORT_KARUGO_NARUGO_S },
                { nm = 'Ig-Alima'   , zone = xi.zone.VALKURM_DUNES        },
                { nm = 'Botulus Rex', zone = xi.zone.BUBURIMU_PENINSULA   },
            },
        },
    },

    [routeName.ZILART] =
    {
        name = 'Zilart'        ,
        stratum = stratum.ASHEN,
        tiers =
        {
            [1] =
            {
                { nm = 'Holy Moly'           , zone = xi.zone.YUHTUNGA_JUNGLE       },
                { nm = 'Neith'               , zone = xi.zone.TEMPLE_OF_UGGALEPIH   },
                { nm = 'Sabotender Campeador', zone = xi.zone.WESTERN_ALTEPA_DESERT },
                { nm = 'Tangaroa'            , zone = xi.zone.KUFTAL_TUNNEL         },
            },
            [2] =
            {
                { nm = 'Cath Palug'      , zone = xi.zone.THE_SANCTUARY_OF_ZITAH },
                { nm = 'Ildebrann'       , zone = xi.zone.IFRITS_CAULDRON        },
                { nm = 'Malleator Maurok', zone = xi.zone.QUICKSAND_CAVES        },
                { nm = 'Modron'          , zone = xi.zone.THE_BOYAHDA_TREE       },
                { nm = 'Mimic King'      , zone = xi.zone.ROMAEVE                },
            },
            [3] =
            {
                { nm = 'Aello' , zone = xi.zone.RUAUN_GARDENS          },
                { nm = 'Qilin' , zone = xi.zone.THE_SHRINE_OF_RUAVITAU },
                { nm = 'Uptala', zone = xi.zone.VELUGANNON_PALACE      },
            },
        },
    },

    [routeName.TAVNAZIA] =
    {
        name = 'Tavnazia'         ,
        stratum = stratum.HYACINTH,
        tiers =
        {
            [1] =
            {
                { nm = 'Fjalar'     , zone = xi.zone.ATTOHWA_CHASM    },
                { nm = 'Abununnu'   , zone = xi.zone.LUFAISE_MEADOWS  },
                { nm = 'Isarukitsck', zone = xi.zone.ULEGUERAND_RANGE },
            },
            [2] =
            {
                { nm = 'Bismarck' , zone = xi.zone.BIBIKI_BAY      },
                { nm = 'Tsui-Goab', zone = xi.zone.MISAREAUX_COAST },
            },
        },
    },

    [routeName.AHT_URHGAN] =
    {
        name = 'Aht Urhgan'    ,
        stratum = stratum.AMBER,
        tiers =
        {
            [1] =
            {
                { nm = 'Dimgruzub' , zone = xi.zone.ARRAPAGO_REEF },
                { nm = 'Brekekekex', zone = xi.zone.CAEDARVA_MIRE },
                { nm = 'Vanasarvik', zone = xi.zone.MOUNT_ZHAYOLM },
            },
            [2] =
            {
                { nm = 'Morta'   , zone = xi.zone.AYDEEWA_SUBTERRANE },
                { nm = 'Yalungur', zone = xi.zone.MAMOOK             },
            },
        },
    },

    [routeName.PROVENANCE] =
    {
        name = 'Provenance',
        tiers =
        {
            [1] =
            {
                { nm = 'Beguiling Radiance', zone = xi.zone.PROVENANCE, adds = { 'Pil', 'Sarbaz' } },
                { nm = 'Maddening Radiance', zone = xi.zone.PROVENANCE, adds = { 'Shah', 'Wazir' } },
                { nm = 'Seductive Radiance', zone = xi.zone.PROVENANCE, adds = { 'Asb', 'Rukh' } }  ,
            },
            [2] =
            {
                { nm = 'Provenance Watcher', zone = xi.zone.PROVENANCE },
            },
        },
    },
}

function xi.voidwatch.isEnabled()
    return xi.settings and xi.settings.main and xi.settings.main.ENABLE_VOIDWATCH == 1
end

function xi.voidwatch.hasBaseRequirements(player)
    return xi.voidwatch.isEnabled() and
        player ~= nil and
        player:getMainLvl() >= xi.voidwatch.minimumLevel and
        player:hasKeyItem(xi.voidwatch.keyItems.adventurersCertificate)
end

function xi.voidwatch.getRoute(routeId)
    return xi.voidwatch.routes[routeId]
end

function xi.voidwatch.getRouteMaxTier(routeId)
    local route = xi.voidwatch.getRoute(routeId)

    if not route then
        return 0
    end

    return #route.tiers
end

function xi.voidwatch.getAbyssites(routeId)
    local route = xi.voidwatch.getRoute(routeId)

    if not route or not route.stratum then
        return {}
    end

    return xi.voidwatch.keyItems.stratum[route.stratum] or {}
end

function xi.voidwatch.getAbyssiteForTier(routeId, tier)
    return xi.voidwatch.getAbyssites(routeId)[tier]
end

function xi.voidwatch.getPlayerAbyssiteTier(player, routeId)
    if not player then
        return 0
    end

    local tier = 0

    for currentTier, keyItem in ipairs(xi.voidwatch.getAbyssites(routeId)) do
        if player:hasKeyItem(keyItem) then
            tier = currentTier
        end
    end

    return tier
end

function xi.voidwatch.canInitiateTier(player, routeId, tier)
    return xi.voidwatch.isEnabled() and xi.voidwatch.getPlayerAbyssiteTier(player, routeId) >= tier
end

function xi.voidwatch.getCompletionVar(routeId, nmName)
    return string.format('%s%s:%s', xi.voidwatch.varPrefix, routeId, nmName)
end

function xi.voidwatch.hasCompletedNM(player, routeId, nmName)
    return player and player:getCharVar(xi.voidwatch.getCompletionVar(routeId, nmName)) == 1
end

function xi.voidwatch.setCompletedNM(player, routeId, nmName)
    if player then
        player:setCharVar(xi.voidwatch.getCompletionVar(routeId, nmName), 1)
    end
end

function xi.voidwatch.isTierComplete(player, routeId, tier)
    local route = xi.voidwatch.getRoute(routeId)

    if not player or not route or not route.tiers[tier] then
        return false
    end

    for _, op in ipairs(route.tiers[tier]) do
        if not xi.voidwatch.hasCompletedNM(player, routeId, op.nm) then
            return false
        end
    end

    return true
end

function xi.voidwatch.canUpgradeAbyssite(player, routeId)
    local tier = xi.voidwatch.getPlayerAbyssiteTier(player, routeId)

    return tier > 0 and tier < xi.voidwatch.getRouteMaxTier(routeId) and xi.voidwatch.isTierComplete(player, routeId, tier)
end

function xi.voidwatch.findOpByNM(nmName)
    for routeId, route in pairs(xi.voidwatch.routes) do
        for tier, ops in ipairs(route.tiers) do
            for _, op in ipairs(ops) do
                if op.nm == nmName then
                    return routeId, tier, op
                end
            end
        end
    end

    return nil, nil, nil
end
