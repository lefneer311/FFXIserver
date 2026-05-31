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

xi.voidwatch.currency =
{
    conquestPoints = 'conquestPoints',
    cruor          = 'cruor',
    gil            = 'gil',
    voidstones     = 'voidstones',
}

xi.voidwatch.var =
{
    nextVoidstone = xi.voidwatch.varPrefix .. 'NextVoidstone',
    pyxisPrefix   = xi.voidwatch.varPrefix .. 'Pyxis:',
    riftInitiator = xi.voidwatch.varPrefix .. 'RiftInitiator',
    riftNpc       = xi.voidwatch.varPrefix .. 'RiftNpc',
    riftPyxis     = xi.voidwatch.varPrefix .. 'RiftPyxis',
}

xi.voidwatch.voidstone =
{
    baseCapacity = 3,
    baseInterval = 20 * 60 * 60,
    explorationReduction = 4 * 60 * 60,
}

xi.voidwatch.teleport =
{
    starterCost = 1000,
}

xi.voidwatch.purveyor =
{
    conquestPointCost = 2000,
    phaseDisplacerCost = 20000,
}

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

    phaseDisplacer = xi.item.PHASE_DISPLACER,
    voiddust       = xi.item.POUCH_OF_VOIDDUST,
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

xi.voidwatch.purveyorStock =
{
    { id = xi.voidwatch.items.cells.COBALT  , cost = xi.voidwatch.purveyor.conquestPointCost , currency = xi.voidwatch.currency.conquestPoints },
    { id = xi.voidwatch.items.cells.RUBICUND, cost = xi.voidwatch.purveyor.conquestPointCost , currency = xi.voidwatch.currency.conquestPoints },
    { id = xi.voidwatch.items.cells.XANTHOUS, cost = xi.voidwatch.purveyor.conquestPointCost , currency = xi.voidwatch.currency.conquestPoints },
    { id = xi.voidwatch.items.cells.JADE    , cost = xi.voidwatch.purveyor.conquestPointCost , currency = xi.voidwatch.currency.conquestPoints },
    { id = xi.voidwatch.items.voiddust      , cost = xi.voidwatch.purveyor.conquestPointCost , currency = xi.voidwatch.currency.conquestPoints },
    { id = xi.voidwatch.items.phaseDisplacer, cost = xi.voidwatch.purveyor.phaseDisplacerCost, currency = xi.voidwatch.currency.gil            },
}

xi.voidwatch.starterRifts =
{
    [17191577] = { route = routeName.SANDORIA, tier = 1, nm = 'Sarimanok'     , mob = 17191335, pyxis = 17191580 },
    [17191578] = { route = routeName.SANDORIA, tier = 1, nm = 'Sarimanok'     , mob = 17191336, pyxis = 17191581 },
    [17191579] = { route = routeName.SANDORIA, tier = 1, nm = 'Sarimanok'     , mob = 17191337, pyxis = 17191582 },
    [17212116] = { route = routeName.BASTOK  , tier = 1, nm = 'Sallow Seymour', mob = 17211882, pyxis = 17212119 },
    [17212117] = { route = routeName.BASTOK  , tier = 1, nm = 'Sallow Seymour', mob = 17211883, pyxis = 17212120 },
    [17212118] = { route = routeName.BASTOK  , tier = 1, nm = 'Sallow Seymour', mob = 17211884, pyxis = 17212121 },
}

local function printStarterOfficerMessage(player, message)
    local channel = xi.msg and xi.msg.channel and xi.msg.channel.SYSTEM_3 or nil

    player:printToPlayer(message, channel)
end

function xi.voidwatch.getHeldVoidstoneCount(player)
    if not player then
        return 0
    end

    local count = 0

    for _, keyItem in ipairs(xi.voidwatch.keyItems.voidstones) do
        if player:hasKeyItem(keyItem) then
            count = count + 1
        end
    end

    return count
end

function xi.voidwatch.getNextVoidstoneKeyItem(player)
    if not player then
        return nil
    end

    for _, keyItem in ipairs(xi.voidwatch.keyItems.voidstones) do
        if not player:hasKeyItem(keyItem) then
            return keyItem
        end
    end

    return nil
end

function xi.voidwatch.getVoidstoneCapacity(player)
    if not player then
        return xi.voidwatch.voidstone.baseCapacity
    end

    local capacity = xi.voidwatch.voidstone.baseCapacity

    for _, keyItem in ipairs(xi.voidwatch.keyItems.periapts.frontiers) do
        if player:hasKeyItem(keyItem) then
            capacity = capacity + 1
        end
    end

    return math.min(capacity, #xi.voidwatch.keyItems.voidstones)
end

function xi.voidwatch.getVoidstoneInterval(player)
    local interval = xi.voidwatch.voidstone.baseInterval

    if player then
        for _, keyItem in ipairs(xi.voidwatch.keyItems.periapts.exploration) do
            if player:hasKeyItem(keyItem) then
                interval = interval - xi.voidwatch.voidstone.explorationReduction
            end
        end
    end

    return math.max(interval, xi.voidwatch.voidstone.explorationReduction)
end

function xi.voidwatch.getVoidstoneStock(player)
    if not player then
        return 0
    end

    return player:getCurrency(xi.voidwatch.currency.voidstones)
end

function xi.voidwatch.setVoidstoneStock(player, stock)
    if player then
        player:setCurrency(xi.voidwatch.currency.voidstones, math.max(stock, 0))
    end
end

function xi.voidwatch.getTotalVoidstones(player)
    return xi.voidwatch.getHeldVoidstoneCount(player) + xi.voidwatch.getVoidstoneStock(player)
end

function xi.voidwatch.canReceiveVoidstoneKeyItem(player)
    return xi.voidwatch.getHeldVoidstoneCount(player) < xi.voidwatch.getVoidstoneCapacity(player) and
        xi.voidwatch.getNextVoidstoneKeyItem(player) ~= nil
end

function xi.voidwatch.addVoidstoneKeyItem(player)
    if not xi.voidwatch.canReceiveVoidstoneKeyItem(player) then
        return false, nil
    end

    local keyItem = xi.voidwatch.getNextVoidstoneKeyItem(player)
    player:addKeyItem(keyItem)

    return true, keyItem
end

function xi.voidwatch.getVoidstoneKeyItemToSpend(player)
    if not player then
        return nil
    end

    for _, keyItem in ipairs(xi.voidwatch.keyItems.voidstones) do
        if player:hasKeyItem(keyItem) then
            return keyItem
        end
    end

    return nil
end

function xi.voidwatch.spendVoidstone(player)
    local keyItem = xi.voidwatch.getVoidstoneKeyItemToSpend(player)

    if not keyItem then
        return false, nil
    end

    player:delKeyItem(keyItem)

    return true, keyItem
end

function xi.voidwatch.syncVoidstoneStock(player, now)
    if not xi.voidwatch.hasBaseRequirements(player) then
        return 0, xi.voidwatch.getVoidstoneStock(player)
    end

    local currentTime = now or GetSystemTime()
    local capacity = xi.voidwatch.getVoidstoneCapacity(player)
    local heldCount = xi.voidwatch.getHeldVoidstoneCount(player)
    local stock = xi.voidwatch.getVoidstoneStock(player)
    local total = heldCount + stock
    local nextTime = player:getCharVar(xi.voidwatch.var.nextVoidstone)
    local interval = xi.voidwatch.getVoidstoneInterval(player)

    if total >= capacity then
        if nextTime ~= 0 then
            player:setCharVar(xi.voidwatch.var.nextVoidstone, 0)
        end

        return 0, stock
    end

    if nextTime <= 0 then
        player:setCharVar(xi.voidwatch.var.nextVoidstone, currentTime + interval)
        return 0, stock
    end

    if currentTime < nextTime then
        return 0, stock
    end

    local earned = math.floor((currentTime - nextTime) / interval) + 1
    earned = math.min(earned, capacity - total)

    if earned <= 0 then
        return 0, stock
    end

    stock = stock + earned
    xi.voidwatch.setVoidstoneStock(player, stock)

    if heldCount + stock >= capacity then
        player:setCharVar(xi.voidwatch.var.nextVoidstone, 0)
    else
        player:setCharVar(xi.voidwatch.var.nextVoidstone, nextTime + earned * interval)
    end

    return earned, stock
end

function xi.voidwatch.withdrawVoidstones(player)
    if not xi.voidwatch.hasBaseRequirements(player) then
        return 0
    end

    local issued = 0
    local stock = xi.voidwatch.getVoidstoneStock(player)

    while stock > 0 and xi.voidwatch.canReceiveVoidstoneKeyItem(player) do
        local added = xi.voidwatch.addVoidstoneKeyItem(player)

        if not added then
            break
        end

        issued = issued + 1
        stock = stock - 1
    end

    xi.voidwatch.setVoidstoneStock(player, stock)

    return issued
end

local function isSingleVoiddustTrade(trade)
    return trade and
        trade:getSlotCount() == 1 and
        trade:getItemId(0) == xi.voidwatch.items.voiddust and
        trade:getItemQty(xi.voidwatch.items.voiddust) == 1
end

function xi.voidwatch.onOfficerTrade(player, npc, trade)
    if not xi.voidwatch.isEnabled() then
        printStarterOfficerMessage(player, xi.voidwatch.starterOfficerMessage.DISABLED)
        return
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        printStarterOfficerMessage(player, xi.voidwatch.starterOfficerMessage.REQUIREMENTS)
        return
    end

    if not isSingleVoiddustTrade(trade) then
        printStarterOfficerMessage(player, xi.voidwatch.starterOfficerMessage.TRADE)
        return
    end

    if not xi.voidwatch.canReceiveVoidstoneKeyItem(player) then
        printStarterOfficerMessage(player, xi.voidwatch.starterOfficerMessage.FULL)
        return
    end

    trade:confirmItem(xi.voidwatch.items.voiddust, 1)
    local _, keyItem = xi.voidwatch.addVoidstoneKeyItem(player)
    player:confirmTrade()

    local ID = zones[player:getZoneID()]
    player:messageSpecial(ID.text.KEYITEM_OBTAINED, keyItem)
end

xi.voidwatch.riftMessage =
{
    DISABLED     = 'Voidwatch is currently disabled.',
    REQUIREMENTS = 'You must be level 75 and possess an adventurer\'s certificate to initiate this Voidwatch operation.',
    ABYSSITE     = 'Your stratum abyssite is not yet strong enough to initiate this operation.',
    VOIDSTONE    = 'A voidstone is required to initiate this Voidwatch operation.',
    BUSY         = 'A Voidwatch notorious monster is already present at this rift.',
    INITIATED    = 'A Voidwatch notorious monster materializes from the rift.',
    INVALID      = 'This planar rift is not ready for Voidwatch operations.',
}

local function printRiftMessage(player, message)
    local channel = xi.msg and xi.msg.channel and xi.msg.channel.SYSTEM_3 or nil

    player:printToPlayer(message, channel)
end

local function getRiftMessageForStatus(status)
    if status == 'disabled' then
        return xi.voidwatch.riftMessage.DISABLED
    elseif status == 'requirements' then
        return xi.voidwatch.riftMessage.REQUIREMENTS
    elseif status == 'abyssite' then
        return xi.voidwatch.riftMessage.ABYSSITE
    elseif status == 'voidstone' then
        return xi.voidwatch.riftMessage.VOIDSTONE
    elseif status == 'busy' then
        return xi.voidwatch.riftMessage.BUSY
    end

    return xi.voidwatch.riftMessage.INVALID
end

function xi.voidwatch.getStarterRift(riftNpcId)
    return xi.voidwatch.starterRifts[riftNpcId]
end

function xi.voidwatch.getStarterRiftByPyxis(pyxisNpcId)
    for riftNpcId, rift in pairs(xi.voidwatch.starterRifts) do
        if rift.pyxis == pyxisNpcId then
            return riftNpcId, rift
        end
    end

    return nil, nil
end

function xi.voidwatch.getPyxisRewardVar(pyxisNpcId)
    return string.format('%s%s', xi.voidwatch.var.pyxisPrefix, pyxisNpcId)
end

function xi.voidwatch.setPyxisRewardEligible(player, pyxisNpcId)
    if player and pyxisNpcId then
        player:setCharVar(xi.voidwatch.getPyxisRewardVar(pyxisNpcId), 1)
    end
end

function xi.voidwatch.hasPyxisRewardEligible(player, pyxisNpcId)
    return player and pyxisNpcId and player:getCharVar(xi.voidwatch.getPyxisRewardVar(pyxisNpcId)) == 1
end

function xi.voidwatch.clearPyxisRewardEligible(player, pyxisNpcId)
    if player and pyxisNpcId then
        player:setCharVar(xi.voidwatch.getPyxisRewardVar(pyxisNpcId), 0)
    end
end

function xi.voidwatch.canInitiateStarterRift(player, riftNpcId)
    if not xi.voidwatch.isEnabled() then
        return false, 'disabled', nil
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        return false, 'requirements', nil
    end

    local rift = xi.voidwatch.getStarterRift(riftNpcId)

    if not rift then
        return false, 'invalid', nil
    end

    if not xi.voidwatch.canInitiateTier(player, rift.route, rift.tier) then
        return false, 'abyssite', rift
    end

    if not xi.voidwatch.getVoidstoneKeyItemToSpend(player) then
        return false, 'voidstone', rift
    end

    local mob = GetMobByID and GetMobByID(rift.mob) or nil

    if mob and mob:isSpawned() then
        return false, 'busy', rift
    end

    return true, 'available', rift
end

function xi.voidwatch.initiateStarterRift(player, riftNpcId)
    local canInitiate, status, rift = xi.voidwatch.canInitiateStarterRift(player, riftNpcId)

    if not canInitiate then
        return false, status, rift, nil
    end

    local spent, keyItem = xi.voidwatch.spendVoidstone(player)

    if not spent then
        return false, 'voidstone', rift, nil
    end

    local mob = SpawnMob(rift.mob)

    if not mob then
        return false, 'invalid', rift, keyItem
    end

    mob:setLocalVar(xi.voidwatch.var.riftInitiator, player:getID())
    mob:setLocalVar(xi.voidwatch.var.riftNpc, riftNpcId)
    mob:setLocalVar(xi.voidwatch.var.riftPyxis, rift.pyxis or 0)
    mob:updateClaim(player)

    return true, 'initiated', rift, keyItem
end

function xi.voidwatch.onStarterRiftTrigger(player, npc)
    local initiated, status = xi.voidwatch.initiateStarterRift(player, npc:getID())

    if initiated then
        printRiftMessage(player, xi.voidwatch.riftMessage.INITIATED)
    else
        printRiftMessage(player, getRiftMessageForStatus(status))
    end
end

function xi.voidwatch.onNMDeath(mob, player)
    if not mob then
        return false, 'invalid', nil
    end

    local riftNpcId = mob:getLocalVar(xi.voidwatch.var.riftNpc)
    local rift = xi.voidwatch.getStarterRift(riftNpcId)

    if not rift then
        return false, 'invalid', nil
    end

    local initiatorId = mob:getLocalVar(xi.voidwatch.var.riftInitiator)
    local creditPlayer = nil

    if player and player:getID() == initiatorId then
        creditPlayer = player
    elseif GetPlayerByID then
        creditPlayer = GetPlayerByID(initiatorId)
    end

    if not creditPlayer then
        return false, 'no_initiator', rift
    end

    xi.voidwatch.setCompletedNM(creditPlayer, rift.route, rift.nm)
    xi.voidwatch.setPyxisRewardEligible(creditPlayer, rift.pyxis)

    return true, 'completed', rift
end

function xi.voidwatch.clearNMState(mob)
    if mob then
        mob:setLocalVar(xi.voidwatch.var.riftInitiator, 0)
        mob:setLocalVar(xi.voidwatch.var.riftNpc, 0)
        mob:setLocalVar(xi.voidwatch.var.riftPyxis, 0)
    end
end

xi.voidwatch.pyxisMessage =
{
    DISABLED     = 'Voidwatch is currently disabled.',
    REQUIREMENTS = 'You must be level 75 and possess an adventurer\'s certificate to inspect this Riftworn Pyxis.',
    ELIGIBLE     = 'The Riftworn Pyxis hums softly. Full Voidwatch rewards are not yet implemented.',
    NO_REWARD    = 'The Riftworn Pyxis is silent. No Voidwatch reward is available for you.',
    INVALID      = 'This Riftworn Pyxis is not ready for Voidwatch operations.',
}

local function printPyxisMessage(player, message)
    local channel = xi.msg and xi.msg.channel and xi.msg.channel.SYSTEM_3 or nil

    player:printToPlayer(message, channel)
end

function xi.voidwatch.inspectStarterPyxis(player, pyxisNpcId)
    if not xi.voidwatch.isEnabled() then
        return false, 'disabled', nil
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        return false, 'requirements', nil
    end

    local _, rift = xi.voidwatch.getStarterRiftByPyxis(pyxisNpcId)

    if not rift then
        return false, 'invalid', nil
    end

    if not xi.voidwatch.hasPyxisRewardEligible(player, pyxisNpcId) then
        return false, 'no_reward', rift
    end

    xi.voidwatch.clearPyxisRewardEligible(player, pyxisNpcId)

    return true, 'eligible', rift
end

local function getPyxisMessageForStatus(status)
    if status == 'disabled' then
        return xi.voidwatch.pyxisMessage.DISABLED
    elseif status == 'requirements' then
        return xi.voidwatch.pyxisMessage.REQUIREMENTS
    elseif status == 'no_reward' then
        return xi.voidwatch.pyxisMessage.NO_REWARD
    end

    return xi.voidwatch.pyxisMessage.INVALID
end

function xi.voidwatch.onStarterPyxisTrigger(player, npc)
    local eligible, status = xi.voidwatch.inspectStarterPyxis(player, npc:getID())

    if eligible then
        printPyxisMessage(player, xi.voidwatch.pyxisMessage.ELIGIBLE)
    else
        printPyxisMessage(player, getPyxisMessageForStatus(status))
    end
end

xi.voidwatch.purveyorMessage =
{
    DISABLED     = 'Voidwatch is currently disabled.',
    REQUIREMENTS = 'You must be level 75 and possess an adventurer\'s certificate to purchase Voidwatch supplies.',
    SHOP         = 'Voidwatch cells, Voiddust, and phase displacers are available for purchase.',
    INVALID      = 'That Voidwatch supply item is not available from this purveyor.',
    NO_PAYMENT   = 'You do not possess enough currency for that Voidwatch supply item.',
    NO_SPACE     = 'You cannot carry any more Voidwatch supply items.',
    PURCHASE     = 'Voidwatch supply item purchased.',
}

local function printPurveyorMessage(player, message)
    local channel = xi.msg and xi.msg.channel and xi.msg.channel.SYSTEM_3 or nil

    player:printToPlayer(message, channel)
end

function xi.voidwatch.getPurveyorItem(itemId)
    for _, stockItem in ipairs(xi.voidwatch.purveyorStock) do
        if stockItem.id == itemId then
            return stockItem
        end
    end

    return nil
end

function xi.voidwatch.getPurveyorStock(player)
    if not xi.voidwatch.hasBaseRequirements(player) then
        return {}
    end

    return xi.voidwatch.purveyorStock
end

local function getPurveyorCurrency(player, currency)
    if currency == xi.voidwatch.currency.conquestPoints then
        return player:getCP()
    elseif currency == xi.voidwatch.currency.gil then
        return player:getGil()
    end

    return 0
end

local function chargePurveyorCurrency(player, currency, cost)
    if currency == xi.voidwatch.currency.conquestPoints then
        player:delCP(cost)
    elseif currency == xi.voidwatch.currency.gil then
        player:delGil(cost)
    end
end

function xi.voidwatch.purchasePurveyorItem(player, itemId, quantity)
    if not xi.voidwatch.isEnabled() then
        return false, 'disabled', nil
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        return false, 'requirements', nil
    end

    local stockItem = xi.voidwatch.getPurveyorItem(itemId)

    if not stockItem then
        return false, 'invalid', nil
    end

    local purchaseQuantity = math.max(quantity or 1, 1)
    local totalCost = stockItem.cost * purchaseQuantity

    if getPurveyorCurrency(player, stockItem.currency) < totalCost then
        return false, 'no_payment', stockItem
    end

    if player:getFreeSlotsCount() == 0 then
        return false, 'no_space', stockItem
    end

    if not player:addItem(stockItem.id, purchaseQuantity) then
        return false, 'no_space', stockItem
    end

    chargePurveyorCurrency(player, stockItem.currency, totalCost)

    return true, 'purchased', stockItem
end

local function getPurveyorMessageForStatus(status)
    if status == 'disabled' then
        return xi.voidwatch.purveyorMessage.DISABLED
    elseif status == 'requirements' then
        return xi.voidwatch.purveyorMessage.REQUIREMENTS
    elseif status == 'no_payment' then
        return xi.voidwatch.purveyorMessage.NO_PAYMENT
    elseif status == 'no_space' then
        return xi.voidwatch.purveyorMessage.NO_SPACE
    end

    return xi.voidwatch.purveyorMessage.INVALID
end

function xi.voidwatch.onStarterPurveyorTrigger(player, npc, itemId, quantity)
    if not itemId then
        if not xi.voidwatch.isEnabled() then
            printPurveyorMessage(player, xi.voidwatch.purveyorMessage.DISABLED)
        elseif not xi.voidwatch.hasBaseRequirements(player) then
            printPurveyorMessage(player, xi.voidwatch.purveyorMessage.REQUIREMENTS)
        else
            printPurveyorMessage(player, xi.voidwatch.purveyorMessage.SHOP)
        end

        return
    end

    local purchased, status, stockItem = xi.voidwatch.purchasePurveyorItem(player, itemId, quantity)

    if purchased then
        local ID = zones[player:getZoneID()]
        player:messageSpecial(ID.text.ITEM_OBTAINED, stockItem.id)
    else
        printPurveyorMessage(player, getPurveyorMessageForStatus(status))
    end
end

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

function xi.voidwatch.upgradeAbyssite(player, routeId)
    if not xi.voidwatch.isEnabled() then
        return false, 'disabled', nil, nil
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        return false, 'requirements', nil, nil
    end

    local currentTier = xi.voidwatch.getPlayerAbyssiteTier(player, routeId)

    if currentTier == 0 then
        return false, 'no_abyssite', nil, nil
    end

    if currentTier >= xi.voidwatch.getRouteMaxTier(routeId) then
        return false, 'maximum', xi.voidwatch.getAbyssiteForTier(routeId, currentTier), nil
    end

    if not xi.voidwatch.isTierComplete(player, routeId, currentTier) then
        return false, 'incomplete', xi.voidwatch.getAbyssiteForTier(routeId, currentTier), nil
    end

    local currentKeyItem = xi.voidwatch.getAbyssiteForTier(routeId, currentTier)
    local nextKeyItem = xi.voidwatch.getAbyssiteForTier(routeId, currentTier + 1)

    if not currentKeyItem or not nextKeyItem then
        return false, 'invalid', currentKeyItem, nextKeyItem
    end

    player:delKeyItem(currentKeyItem)
    player:addKeyItem(nextKeyItem)

    return true, 'upgraded', currentKeyItem, nextKeyItem
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

xi.voidwatch.starterOfficerMessage =
{
    DISABLED     = 'Voidwatch is currently disabled.',
    REQUIREMENTS = 'You must be level 75 and possess an adventurer\'s certificate to begin Voidwatch operations.',
    ALREADY      = 'You have already received the stratum abyssite issued by this officer.',
    INVALID      = 'This officer is not ready to issue Voidwatch operations.',
    NO_STONES    = 'No voidstones are currently available.',
    STONES       = 'Voidstones have been issued from your stock.',
    VOIDSTONE    = 'A voidstone has been issued.',
    FULL         = 'You cannot carry any more voidstones.',
    TRADE        = 'Trade one pouch of Voiddust to receive a voidstone.',
}

xi.voidwatch.starterRoutes =
{
    [xi.voidwatch.routeName.SANDORIA] = true,
    [xi.voidwatch.routeName.BASTOK  ] = true,
    [xi.voidwatch.routeName.WINDURST] = true,
}

xi.voidwatch.starterRefinerRoutes =
{
    xi.voidwatch.routeName.SANDORIA,
    xi.voidwatch.routeName.BASTOK,
    xi.voidwatch.routeName.WINDURST,
}

xi.voidwatch.starterTeleportDestinations =
{
    { id = 'sandoria_east_ronfaure'      , route = routeName.SANDORIA, tier = 1, zone = xi.zone.EAST_RONFAURE           , x =  288.000, y = -61.000, z =  368.000, rot = 128 },
    { id = 'sandoria_east_ronfaure_s'    , route = routeName.SANDORIA, tier = 1, zone = xi.zone.EAST_RONFAURE_S         , x =  288.000, y = -61.000, z =  368.000, rot = 128 },
    { id = 'sandoria_ordelles_caves'     , route = routeName.SANDORIA, tier = 2, zone = xi.zone.ORDELLES_CAVES          , x = -200.000, y =  32.000, z =   -2.000, rot =   0 },
    { id = 'sandoria_jugner_forest'      , route = routeName.SANDORIA, tier = 3, zone = xi.zone.JUGNER_FOREST           , x =   78.000, y =   0.000, z =  118.000, rot = 224 },
    { id = 'sandoria_jugner_forest_s'    , route = routeName.SANDORIA, tier = 3, zone = xi.zone.JUGNER_FOREST_S         , x =   78.000, y =   0.000, z =  118.000, rot = 224 },
    { id = 'sandoria_ranperres_tomb'     , route = routeName.SANDORIA, tier = 4, zone = xi.zone.KING_RANPERRES_TOMB     , x = -115.000, y =   9.000, z =   60.000, rot =   0 },

    { id = 'bastok_north_gustaberg'      , route = routeName.BASTOK  , tier = 1, zone = xi.zone.NORTH_GUSTABERG         , x =  798.000, y =   0.000, z =  440.000, rot = 160 },
    { id = 'bastok_north_gustaberg_s'    , route = routeName.BASTOK  , tier = 1, zone = xi.zone.NORTH_GUSTABERG_S       , x =  798.000, y =   0.000, z =  440.000, rot = 160 },
    { id = 'bastok_gusgen_mines'         , route = routeName.BASTOK  , tier = 2, zone = xi.zone.GUSGEN_MINES            , x =   40.000, y = -11.000, z =  436.000, rot =  64 },
    { id = 'bastok_pashhow_marshlands'   , route = routeName.BASTOK  , tier = 3, zone = xi.zone.PASHHOW_MARSHLANDS      , x = -420.000, y =  24.150, z = -230.000, rot =  64 },
    { id = 'bastok_pashhow_marshlands_s' , route = routeName.BASTOK  , tier = 3, zone = xi.zone.PASHHOW_MARSHLANDS_S    , x = -420.000, y =  24.150, z = -230.000, rot =  64 },
    { id = 'bastok_dangruf_wadi'         , route = routeName.BASTOK  , tier = 4, zone = xi.zone.DANGRUF_WADI            , x = -157.000, y =   4.000, z = -164.000, rot =   0 },

    { id = 'windurst_west_sarutabaruta'  , route = routeName.WINDURST, tier = 1, zone = xi.zone.WEST_SARUTABARUTA       , x =  120.000, y =   4.000, z = -440.000, rot =   0 },
    { id = 'windurst_west_sarutabaruta_s', route = routeName.WINDURST, tier = 1, zone = xi.zone.WEST_SARUTABARUTA_S     , x =  120.000, y =   4.000, z = -440.000, rot =   0 },
    { id = 'windurst_shakhrami'          , route = routeName.WINDURST, tier = 2, zone = xi.zone.MAZE_OF_SHAKHRAMI       , x =  134.000, y =  20.000, z =  -89.000, rot =   0 },
    { id = 'windurst_meriphataud'        , route = routeName.WINDURST, tier = 3, zone = xi.zone.MERIPHATAUD_MOUNTAINS   , x =  200.000, y =   0.000, z = -520.000, rot =   0 },
    { id = 'windurst_meriphataud_s'      , route = routeName.WINDURST, tier = 3, zone = xi.zone.MERIPHATAUD_MOUNTAINS_S , x =  200.000, y =   0.000, z = -520.000, rot =   0 },
    { id = 'windurst_outer_horutoto'     , route = routeName.WINDURST, tier = 4, zone = xi.zone.OUTER_HORUTOTO_RUINS    , x = -260.000, y =   0.000, z =  740.000, rot =   0 },
}

function xi.voidwatch.isStarterRoute(routeId)
    return xi.voidwatch.starterRoutes[routeId] == true
end

function xi.voidwatch.getStarterAbyssite(routeId)
    if not xi.voidwatch.isStarterRoute(routeId) then
        return nil
    end

    return xi.voidwatch.getAbyssiteForTier(routeId, 1)
end

function xi.voidwatch.hasStarterAbyssite(player, routeId)
    return xi.voidwatch.getPlayerAbyssiteTier(player, routeId) > 0
end

function xi.voidwatch.grantStarterAbyssite(player, routeId)
    if not xi.voidwatch.isEnabled() then
        return false, 'disabled', nil
    end

    if not xi.voidwatch.isStarterRoute(routeId) then
        return false, 'invalid', nil
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        return false, 'requirements', nil
    end

    if xi.voidwatch.hasStarterAbyssite(player, routeId) then
        return false, 'already', xi.voidwatch.getStarterAbyssite(routeId)
    end

    local keyItem = xi.voidwatch.getStarterAbyssite(routeId)
    player:addKeyItem(keyItem)

    return true, 'granted', keyItem
end

function xi.voidwatch.onStarterOfficerTrigger(player, npc, routeId)
    local granted, status, keyItem = xi.voidwatch.grantStarterAbyssite(player, routeId)

    if granted then
        local ID = zones[player:getZoneID()]
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, keyItem)
    elseif status ~= 'already' then
        local message = xi.voidwatch.starterOfficerMessage.INVALID

        if status == 'disabled' then
            message = xi.voidwatch.starterOfficerMessage.DISABLED
        elseif status == 'requirements' then
            message = xi.voidwatch.starterOfficerMessage.REQUIREMENTS
        end

        printStarterOfficerMessage(player, message)
        return
    end

    xi.voidwatch.syncVoidstoneStock(player)
    local issued = xi.voidwatch.withdrawVoidstones(player)

    if issued > 0 then
        printStarterOfficerMessage(player, xi.voidwatch.starterOfficerMessage.STONES)
    elseif status == 'already' then
        printStarterOfficerMessage(player, xi.voidwatch.starterOfficerMessage.NO_STONES)
    end
end

xi.voidwatch.refinerMessage =
{
    DISABLED     = 'Voidwatch is currently disabled.',
    REQUIREMENTS = 'You must be level 75 and possess an adventurer\'s certificate to have your stratum abyssites examined.',
    NO_ABYSSITE  = 'No starter-city stratum abyssite is available for examination.',
    INCOMPLETE   = 'Defeat all required Voidwatch notorious monsters for your current starter-city stratum before requesting examination.',
    MAXIMUM      = 'Your starter-city stratum abyssites are already at their current maximum tiers.',
    INVALID      = 'This Atmacite Refiner is not ready to examine that stratum abyssite.',
    TELEPORT     = 'The Atmacite Refiner sends you to a Voidwatch operation site.',
    NO_CRUOR     = 'You do not possess enough cruor for that teleportation service.',
    NO_TELEPORT  = 'No starter-city Voidwatch teleport destination is available.',
}

local function printRefinerMessage(player, message)
    local channel = xi.msg and xi.msg.channel and xi.msg.channel.SYSTEM_3 or nil

    player:printToPlayer(message, channel)
end

local function getRefinerMessageForStatus(status)
    if status == 'disabled' then
        return xi.voidwatch.refinerMessage.DISABLED
    elseif status == 'requirements' then
        return xi.voidwatch.refinerMessage.REQUIREMENTS
    elseif status == 'no_abyssite' then
        return xi.voidwatch.refinerMessage.NO_ABYSSITE
    elseif status == 'incomplete' then
        return xi.voidwatch.refinerMessage.INCOMPLETE
    elseif status == 'maximum' then
        return xi.voidwatch.refinerMessage.MAXIMUM
    elseif status == 'no_cruor' then
        return xi.voidwatch.refinerMessage.NO_CRUOR
    elseif status == 'no_teleport' then
        return xi.voidwatch.refinerMessage.NO_TELEPORT
    end

    return xi.voidwatch.refinerMessage.INVALID
end

function xi.voidwatch.getStarterTeleportDestination(destinationId)
    for _, destination in ipairs(xi.voidwatch.starterTeleportDestinations) do
        if destination.id == destinationId then
            return destination
        end
    end

    return nil
end

function xi.voidwatch.getStarterTeleportDestinations(player)
    local destinations = {}

    if not xi.voidwatch.hasBaseRequirements(player) then
        return destinations
    end

    for _, destination in ipairs(xi.voidwatch.starterTeleportDestinations) do
        if xi.voidwatch.canInitiateTier(player, destination.route, destination.tier) then
            table.insert(destinations, destination)
        end
    end

    return destinations
end

function xi.voidwatch.canUseStarterTeleportDestination(player, destinationId)
    if not xi.voidwatch.isEnabled() then
        return false, 'disabled', nil
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        return false, 'requirements', nil
    end

    local destination = xi.voidwatch.getStarterTeleportDestination(destinationId)

    if not destination then
        return false, 'invalid', nil
    end

    local routeTier = xi.voidwatch.getPlayerAbyssiteTier(player, destination.route)

    if routeTier == 0 then
        return false, 'no_teleport', destination
    elseif routeTier < destination.tier then
        return false, 'incomplete', destination
    end

    return true, 'available', destination
end

function xi.voidwatch.teleportToStarterDestination(player, destinationId)
    local canUse, status, destination = xi.voidwatch.canUseStarterTeleportDestination(player, destinationId)

    if not canUse then
        return false, status, destination
    end

    if player:getCurrency(xi.voidwatch.currency.cruor) < xi.voidwatch.teleport.starterCost then
        return false, 'no_cruor', destination
    end

    player:delCurrency(xi.voidwatch.currency.cruor, xi.voidwatch.teleport.starterCost)
    player:setPos(destination.x, destination.y, destination.z, destination.rot, destination.zone)

    return true, 'teleported', destination
end

function xi.voidwatch.examineStarterAbyssites(player)
    if not xi.voidwatch.isEnabled() then
        return false, 'disabled', nil, nil, nil
    end

    if not xi.voidwatch.hasBaseRequirements(player) then
        return false, 'requirements', nil, nil, nil
    end

    local hasAbyssite = false
    local hasIncomplete = false
    local hasMaximum = false

    for _, routeId in ipairs(xi.voidwatch.starterRefinerRoutes) do
        local tier = xi.voidwatch.getPlayerAbyssiteTier(player, routeId)

        if tier > 0 then
            hasAbyssite = true

            if xi.voidwatch.canUpgradeAbyssite(player, routeId) then
                local upgraded, status, oldKeyItem, newKeyItem = xi.voidwatch.upgradeAbyssite(player, routeId)
                return upgraded, status, routeId, oldKeyItem, newKeyItem
            elseif tier >= xi.voidwatch.getRouteMaxTier(routeId) then
                hasMaximum = true
            else
                hasIncomplete = true
            end
        end
    end

    if not hasAbyssite then
        return false, 'no_abyssite', nil, nil, nil
    elseif hasIncomplete then
        return false, 'incomplete', nil, nil, nil
    elseif hasMaximum then
        return false, 'maximum', nil, nil, nil
    end

    return false, 'invalid', nil, nil, nil
end

function xi.voidwatch.onStarterRefinerTrigger(player, npc, destinationId)
    if destinationId then
        local teleported, status = xi.voidwatch.teleportToStarterDestination(player, destinationId)

        if teleported then
            printRefinerMessage(player, xi.voidwatch.refinerMessage.TELEPORT)
        else
            printRefinerMessage(player, getRefinerMessageForStatus(status))
        end

        return
    end

    local upgraded, status, _, oldKeyItem, newKeyItem = xi.voidwatch.examineStarterAbyssites(player)

    if upgraded then
        local ID = zones[player:getZoneID()]
        player:messageSpecial(ID.text.KEYITEM_LOST, oldKeyItem)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, newKeyItem)
    else
        printRefinerMessage(player, getRefinerMessageForStatus(status))
    end
end
