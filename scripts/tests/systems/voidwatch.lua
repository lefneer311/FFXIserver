require('scripts/globals/voidwatch/voidwatch')

describe('Voidwatch', function()
    it('honors the main settings toggle at runtime', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH

        xi.settings.main.ENABLE_VOIDWATCH = 0
        assert(not xi.voidwatch.isEnabled())

        xi.settings.main.ENABLE_VOIDWATCH = 1
        assert(xi.voidwatch.isEnabled())

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('checks base participant requirements', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local hasCertificate = true
        local level = xi.voidwatch.minimumLevel
        local player =
        {
            getMainLvl = function()
                return level
            end,

            hasKeyItem = function(_, keyItem)
                return hasCertificate and keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        assert(xi.voidwatch.hasBaseRequirements(player))

        level = xi.voidwatch.minimumLevel - 1
        assert(not xi.voidwatch.hasBaseRequirements(player))

        level = xi.voidwatch.minimumLevel
        hasCertificate = false
        assert(not xi.voidwatch.hasBaseRequirements(player))

        hasCertificate = true
        xi.settings.main.ENABLE_VOIDWATCH = 0
        assert(not xi.voidwatch.hasBaseRequirements(player))

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('defines internally consistent route tiers and abyssites', function()
        local nmNames = {}

        for routeId, route in pairs(xi.voidwatch.routes) do
            assert(route.name ~= nil)
            assert(#route.tiers > 0)

            if route.stratum then
                assert(#xi.voidwatch.getAbyssites(routeId) == xi.voidwatch.getRouteMaxTier(routeId))
            end

            for tier, ops in ipairs(route.tiers) do
                assert(tier > 0)
                assert(#ops > 0)

                for _, op in ipairs(ops) do
                    assert(op.nm ~= nil)
                    assert(op.zone ~= nil)
                    assert(nmNames[op.nm] == nil)
                    nmNames[op.nm] = true

                    local foundRouteId, foundTier, foundOp = xi.voidwatch.findOpByNM(op.nm)
                    assert(foundRouteId == routeId)
                    assert(foundTier == tier)
                    assert(foundOp == op)
                end
            end
        end
    end)

    it('reports starter city routes with four abyssite tiers', function()
        assert(xi.voidwatch.getRouteMaxTier(xi.voidwatch.routeName.SANDORIA) == 4)
        assert(xi.voidwatch.getRouteMaxTier(xi.voidwatch.routeName.BASTOK  ) == 4)
        assert(xi.voidwatch.getRouteMaxTier(xi.voidwatch.routeName.WINDURST) == 4)

        assert(xi.voidwatch.getAbyssiteForTier(xi.voidwatch.routeName.SANDORIA, 1) == xi.keyItem.CRIMSON_STRATUM_ABYSSITE)
        assert(xi.voidwatch.getAbyssiteForTier(xi.voidwatch.routeName.BASTOK  , 1) == xi.keyItem.INDIGO_STRATUM_ABYSSITE )
        assert(xi.voidwatch.getAbyssiteForTier(xi.voidwatch.routeName.WINDURST, 1) == xi.keyItem.JADE_STRATUM_ABYSSITE   )
    end)

    it('maps starter city routes to initial abyssites', function()
        assert(xi.voidwatch.getStarterAbyssite(xi.voidwatch.routeName.SANDORIA) == xi.keyItem.CRIMSON_STRATUM_ABYSSITE)
        assert(xi.voidwatch.getStarterAbyssite(xi.voidwatch.routeName.BASTOK  ) == xi.keyItem.INDIGO_STRATUM_ABYSSITE )
        assert(xi.voidwatch.getStarterAbyssite(xi.voidwatch.routeName.WINDURST) == xi.keyItem.JADE_STRATUM_ABYSSITE   )
        assert(xi.voidwatch.getStarterAbyssite(xi.voidwatch.routeName.JEUNO) == nil)
    end)

    it('grants starter abyssites idempotently when requirements are met', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }

        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            addKeyItem = function(_, keyItem)
                keyItems[keyItem] = true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1

        local granted, status, keyItem = xi.voidwatch.grantStarterAbyssite(player, xi.voidwatch.routeName.SANDORIA)
        assert(granted)
        assert(status == 'granted')
        assert(keyItem == xi.keyItem.CRIMSON_STRATUM_ABYSSITE)
        assert(player:hasKeyItem(xi.keyItem.CRIMSON_STRATUM_ABYSSITE))

        granted, status, keyItem = xi.voidwatch.grantStarterAbyssite(player, xi.voidwatch.routeName.SANDORIA)
        assert(not granted)
        assert(status == 'already')
        assert(keyItem == xi.keyItem.CRIMSON_STRATUM_ABYSSITE)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('reports disabled content from starter officer triggers', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local printedMessage = nil
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,

            printToPlayer = function(_, message)
                printedMessage = message
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 0
        xi.voidwatch.onStarterOfficerTrigger(player, nil, xi.voidwatch.routeName.WINDURST)

        assert(printedMessage == xi.voidwatch.starterOfficerMessage.DISABLED)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('blocks starter abyssite grants when disabled or requirements are missing', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local hasCertificate = true
        local level = xi.voidwatch.minimumLevel
        local addedKeyItem = nil
        local player =
        {
            getMainLvl = function()
                return level
            end,

            hasKeyItem = function(_, keyItem)
                return hasCertificate and keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,

            addKeyItem = function(_, keyItem)
                addedKeyItem = keyItem
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 0
        local granted, status = xi.voidwatch.grantStarterAbyssite(player, xi.voidwatch.routeName.BASTOK)
        assert(not granted)
        assert(status == 'disabled')
        assert(addedKeyItem == nil)

        xi.settings.main.ENABLE_VOIDWATCH = 1
        level = xi.voidwatch.minimumLevel - 1
        granted, status = xi.voidwatch.grantStarterAbyssite(player, xi.voidwatch.routeName.BASTOK)
        assert(not granted)
        assert(status == 'requirements')
        assert(addedKeyItem == nil)

        level = xi.voidwatch.minimumLevel
        hasCertificate = false
        granted, status = xi.voidwatch.grantStarterAbyssite(player, xi.voidwatch.routeName.BASTOK)
        assert(not granted)
        assert(status == 'requirements')
        assert(addedKeyItem == nil)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

        it('calculates voidstone capacity and recharge interval from periapts', function()
        local keyItems =
        {
            [xi.keyItem.VIVID_PERIAPT_OF_FRONTIERS] = true,
            [xi.keyItem.NEUTRAL_PERIAPT_OF_FRONTIERS] = true,
            [xi.keyItem.VIVID_PERIAPT_OF_EXPLORATION] = true,
        }

        local player =
        {
            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        assert(xi.voidwatch.getVoidstoneCapacity(player) == 5)
        assert(xi.voidwatch.getVoidstoneInterval(player) == 16 * 60 * 60)

        keyItems[xi.keyItem.DUSKY_PERIAPT_OF_EXPLORATION] = true
        assert(xi.voidwatch.getVoidstoneInterval(player) == 12 * 60 * 60)
    end)

    it('syncs voidstone stock up to player capacity', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }
        local stock = 0
        local charVars = {}
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            getCurrency = function(_, currency)
                assert(currency == xi.voidwatch.currency.voidstones)
                return stock
            end,

            setCurrency = function(_, currency, value)
                assert(currency == xi.voidwatch.currency.voidstones)
                stock = value
            end,

            getCharVar = function(_, varName)
                return charVars[varName] or 0
            end,

            setCharVar = function(_, varName, value)
                charVars[varName] = value
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1

        local earned = xi.voidwatch.syncVoidstoneStock(player, 100)
        assert(earned == 0)
        assert(stock == 0)
        assert(charVars[xi.voidwatch.var.nextVoidstone] == 100 + xi.voidwatch.voidstone.baseInterval)

        earned = xi.voidwatch.syncVoidstoneStock(player, 100 + xi.voidwatch.voidstone.baseInterval * 2)
        assert(earned == 2)
        assert(stock == 2)
        assert(charVars[xi.voidwatch.var.nextVoidstone] == 100 + xi.voidwatch.voidstone.baseInterval * 3)

        earned = xi.voidwatch.syncVoidstoneStock(player, 100 + xi.voidwatch.voidstone.baseInterval * 4)
        assert(earned == 1)
        assert(stock == 3)
        assert(charVars[xi.voidwatch.var.nextVoidstone] == 0)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('withdraws stored voidstones into key items without exceeding capacity', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }
        local stock = 4
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            addKeyItem = function(_, keyItem)
                keyItems[keyItem] = true
            end,

            getCurrency = function()
                return stock
            end,

            setCurrency = function(_, _, value)
                stock = value
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1

        local issued = xi.voidwatch.withdrawVoidstones(player)
        assert(issued == xi.voidwatch.voidstone.baseCapacity)
        assert(stock == 1)
        assert(player:hasKeyItem(xi.keyItem.VOIDSTONE1))
        assert(player:hasKeyItem(xi.keyItem.VOIDSTONE2))
        assert(player:hasKeyItem(xi.keyItem.VOIDSTONE3))
        assert(not player:hasKeyItem(xi.keyItem.VOIDSTONE4))

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('accepts a single Voiddust trade for one carried voidstone', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }
        local confirmedTrade = false
        local confirmedItem = nil
        local obtainedKeyItem = nil
        local originalZones = zones
        zones = zones or {}
        local originalZoneEntry = zones[xi.zone.SOUTHERN_SAN_DORIA]
        zones[xi.zone.SOUTHERN_SAN_DORIA] = originalZoneEntry or { text = { KEYITEM_OBTAINED = 0 } }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            addKeyItem = function(_, keyItem)
                keyItems[keyItem] = true
            end,

            confirmTrade = function()
                confirmedTrade = true
            end,

            getZoneID = function()
                return xi.zone.SOUTHERN_SAN_DORIA
            end,

            messageSpecial = function(_, _, keyItem)
                obtainedKeyItem = keyItem
            end,
        }
        local trade =
        {
            getSlotCount = function()
                return 1
            end,

            getItemId = function()
                return xi.voidwatch.items.voiddust
            end,

            getItemQty = function(_, itemId)
                return itemId == xi.voidwatch.items.voiddust and 1 or 0
            end,

            confirmItem = function(_, itemId, quantity)
                confirmedItem = { itemId = itemId, quantity = quantity }
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        xi.voidwatch.onOfficerTrade(player, nil, trade)

        assert(confirmedTrade)
        assert(confirmedItem.itemId == xi.voidwatch.items.voiddust)
        assert(confirmedItem.quantity == 1)
        assert(obtainedKeyItem == xi.keyItem.VOIDSTONE1)
        assert(player:hasKeyItem(xi.keyItem.VOIDSTONE1))

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
        zones[xi.zone.SOUTHERN_SAN_DORIA] = originalZoneEntry
        zones = originalZones
    end)

    it('covers each starter route with starter refiner examination order', function()
        local coveredRoutes = {}

        for _, routeId in ipairs(xi.voidwatch.starterRefinerRoutes) do
            coveredRoutes[routeId] = true
        end

        assert(coveredRoutes[xi.voidwatch.routeName.SANDORIA])
        assert(coveredRoutes[xi.voidwatch.routeName.BASTOK])
        assert(coveredRoutes[xi.voidwatch.routeName.WINDURST])
        assert(not coveredRoutes[xi.voidwatch.routeName.JEUNO])
    end)

    it('reports disabled content from starter refiner triggers', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local printedMessage = nil
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,

            printToPlayer = function(_, message)
                printedMessage = message
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 0
        xi.voidwatch.onStarterRefinerTrigger(player, nil)

        assert(printedMessage == xi.voidwatch.refinerMessage.DISABLED)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('blocks starter refiner examination when base requirements are missing', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local printedMessage = nil
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel - 1
            end,

            hasKeyItem = function()
                return false
            end,

            printToPlayer = function(_, message)
                printedMessage = message
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        xi.voidwatch.onStarterRefinerTrigger(player, nil)

        assert(printedMessage == xi.voidwatch.refinerMessage.REQUIREMENTS)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('reports no current starter abyssite during starter refiner examination', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local upgraded, status = xi.voidwatch.examineStarterAbyssites(player)

        assert(not upgraded)
        assert(status == 'no_abyssite')

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('reports incomplete starter tiers during starter refiner examination', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.CRIMSON_STRATUM_ABYSSITE] = true,
        }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            getCharVar = function()
                return 0
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local upgraded, status = xi.voidwatch.examineStarterAbyssites(player)

        assert(not upgraded)
        assert(status == 'incomplete')

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('upgrades completed starter abyssites and replaces the previous key item', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.CRIMSON_STRATUM_ABYSSITE] = true,
        }
        local charVars = {}
        local lostKeyItem = nil
        local obtainedKeyItem = nil
        local originalZones = zones
        zones = zones or {}
        local originalZoneEntry = zones[xi.zone.SOUTHERN_SAN_DORIA]
        zones[xi.zone.SOUTHERN_SAN_DORIA] = originalZoneEntry or { text = { KEYITEM_LOST = 0, KEYITEM_OBTAINED = 1 } }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            addKeyItem = function(_, keyItem)
                keyItems[keyItem] = true
            end,

            delKeyItem = function(_, keyItem)
                keyItems[keyItem] = nil
            end,

            getCharVar = function(_, varName)
                return charVars[varName] or 0
            end,

            setCharVar = function(_, varName, value)
                charVars[varName] = value
            end,

            getZoneID = function()
                return xi.zone.SOUTHERN_SAN_DORIA
            end,

            messageSpecial = function(_, message, keyItem)
                if message == zones[xi.zone.SOUTHERN_SAN_DORIA].text.KEYITEM_LOST then
                    lostKeyItem = keyItem
                elseif message == zones[xi.zone.SOUTHERN_SAN_DORIA].text.KEYITEM_OBTAINED then
                    obtainedKeyItem = keyItem
                end
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        xi.voidwatch.setCompletedNM(player, xi.voidwatch.routeName.SANDORIA, 'Sarimanok')
        xi.voidwatch.setCompletedNM(player, xi.voidwatch.routeName.SANDORIA, 'Cottus')
        xi.voidwatch.onStarterRefinerTrigger(player, nil)

        assert(lostKeyItem == xi.keyItem.CRIMSON_STRATUM_ABYSSITE)
        assert(obtainedKeyItem == xi.keyItem.CRIMSON_STRATUM_ABYSSITE_II)
        assert(not player:hasKeyItem(xi.keyItem.CRIMSON_STRATUM_ABYSSITE))
        assert(player:hasKeyItem(xi.keyItem.CRIMSON_STRATUM_ABYSSITE_II))

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
        zones[xi.zone.SOUTHERN_SAN_DORIA] = originalZoneEntry
        zones = originalZones
    end)

    it('reports maximum starter abyssite tiers as a no-op', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.JADE_STRATUM_ABYSSITE_IV] = true,
        }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local upgraded, status = xi.voidwatch.examineStarterAbyssites(player)

        assert(not upgraded)
        assert(status == 'maximum')
        assert(player:hasKeyItem(xi.keyItem.JADE_STRATUM_ABYSSITE_IV))

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('defines starter refiner teleport destinations for starter route tiers', function()
        local destinationIds = {}

        for _, destination in ipairs(xi.voidwatch.starterTeleportDestinations) do
            assert(destination.id ~= nil)
            assert(destinationIds[destination.id] == nil)
            destinationIds[destination.id] = true

            assert(xi.voidwatch.isStarterRoute(destination.route))
            assert(destination.tier > 0)
            assert(destination.tier <= xi.voidwatch.getRouteMaxTier(destination.route))
            assert(destination.zone ~= nil)
            assert(xi.voidwatch.getStarterTeleportDestination(destination.id) == destination)
        end

        assert(destinationIds.sandoria_east_ronfaure)
        assert(destinationIds.bastok_north_gustaberg)
        assert(destinationIds.windurst_west_sarutabaruta)
    end)

    it('filters starter refiner teleport destinations by current abyssite tier', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.CRIMSON_STRATUM_ABYSSITE_II] = true,
        }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local destinations = xi.voidwatch.getStarterTeleportDestinations(player)
        local destinationIds = {}

        for _, destination in ipairs(destinations) do
            destinationIds[destination.id] = true
        end

        assert(destinationIds.sandoria_east_ronfaure)
        assert(destinationIds.sandoria_east_ronfaure_s)
        assert(destinationIds.sandoria_ordelles_caves)
        assert(not destinationIds.sandoria_jugner_forest)
        assert(not destinationIds.bastok_north_gustaberg)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('rejects starter refiner teleport destinations when disabled or requirements are missing', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.INDIGO_STRATUM_ABYSSITE] = true,
        }
        local level = xi.voidwatch.minimumLevel
        local player =
        {
            getMainLvl = function()
                return level
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 0
        local canUse, status = xi.voidwatch.canUseStarterTeleportDestination(player, 'bastok_north_gustaberg')
        assert(not canUse)
        assert(status == 'disabled')

        xi.settings.main.ENABLE_VOIDWATCH = 1
        level = xi.voidwatch.minimumLevel - 1
        canUse, status = xi.voidwatch.canUseStarterTeleportDestination(player, 'bastok_north_gustaberg')
        assert(not canUse)
        assert(status == 'requirements')

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('reports no starter refiner teleport access without a starter abyssite', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local destinations = xi.voidwatch.getStarterTeleportDestinations(player)
        local canUse, status = xi.voidwatch.canUseStarterTeleportDestination(player, 'windurst_west_sarutabaruta')

        assert(#destinations == 0)
        assert(not canUse)
        assert(status == 'no_teleport')

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('blocks starter refiner teleport destinations above the current abyssite tier', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.JADE_STRATUM_ABYSSITE] = true,
        }
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local canUse, status = xi.voidwatch.canUseStarterTeleportDestination(player, 'windurst_shakhrami')

        assert(not canUse)
        assert(status == 'incomplete')

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('does not charge cruor or move the player when starter refiner teleport cruor is insufficient', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.INDIGO_STRATUM_ABYSSITE] = true,
        }
        local cruor = xi.voidwatch.teleport.starterCost - 1
        local moved = false
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            getCurrency = function(_, currency)
                assert(currency == xi.voidwatch.currency.cruor)
                return cruor
            end,

            delCurrency = function()
                error('Cruor should not be charged for a failed teleport.')
            end,

            setPos = function()
                moved = true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local teleported, status = xi.voidwatch.teleportToStarterDestination(player, 'bastok_north_gustaberg')

        assert(not teleported)
        assert(status == 'no_cruor')
        assert(cruor == xi.voidwatch.teleport.starterCost - 1)
        assert(not moved)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('charges cruor and moves the player for valid starter refiner teleports', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.INDIGO_STRATUM_ABYSSITE] = true,
        }
        local initialCruor = xi.voidwatch.teleport.starterCost + 500
        local cruor = initialCruor
        local movedTo = nil
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            getCurrency = function(_, currency)
                assert(currency == xi.voidwatch.currency.cruor)
                return cruor
            end,

            delCurrency = function(_, currency, amount)
                assert(currency == xi.voidwatch.currency.cruor)
                cruor = cruor - amount
            end,

            setPos = function(_, x, y, z, rot, zone)
                movedTo = { x = x, y = y, z = z, rot = rot, zone = zone }
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local teleported, status, destination = xi.voidwatch.teleportToStarterDestination(player, 'bastok_north_gustaberg')

        assert(teleported)
        assert(status == 'teleported')
        assert(cruor == initialCruor - xi.voidwatch.teleport.starterCost)
        assert(movedTo.x == destination.x)
        assert(movedTo.y == destination.y)
        assert(movedTo.z == destination.z)
        assert(movedTo.rot == destination.rot)
        assert(movedTo.zone == xi.zone.NORTH_GUSTABERG)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('defines starter purveyor stock for Voidwatch cells, Voiddust, and phase displacers', function()
        local expectedItems =
        {
            [xi.item.COBALT_CELL] = true,
            [xi.item.RUBICUND_CELL] = true,
            [xi.item.XANTHOUS_CELL] = true,
            [xi.item.JADE_CELL] = true,
            [xi.item.POUCH_OF_VOIDDUST] = true,
            [xi.item.PHASE_DISPLACER] = true,
        }

        for _, stockItem in ipairs(xi.voidwatch.purveyorStock) do
            assert(expectedItems[stockItem.id])
            assert(stockItem.cost > 0)
            assert(stockItem.currency == xi.voidwatch.currency.conquestPoints or stockItem.currency == xi.voidwatch.currency.gil)
            expectedItems[stockItem.id] = nil
        end

        for itemId, _ in pairs(expectedItems) do
            error(string.format('Missing purveyor stock item %u.', itemId))
        end
    end)

    it('blocks starter purveyor purchases when disabled or requirements are missing', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }
        local level = xi.voidwatch.minimumLevel
        local player =
        {
            getMainLvl = function()
                return level
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 0
        local purchased, status = xi.voidwatch.purchasePurveyorItem(player, xi.item.COBALT_CELL)
        assert(not purchased)
        assert(status == 'disabled')

        xi.settings.main.ENABLE_VOIDWATCH = 1
        level = xi.voidwatch.minimumLevel - 1
        purchased, status = xi.voidwatch.purchasePurveyorItem(player, xi.item.COBALT_CELL)
        assert(not purchased)
        assert(status == 'requirements')

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('rejects invalid starter purveyor item selections before charging currency', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local charged = false
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,

            getCP = function()
                return 999999
            end,

            delCP = function()
                charged = true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local purchased, status = xi.voidwatch.purchasePurveyorItem(player, xi.item.CATS_EYE)

        assert(not purchased)
        assert(status == 'invalid')
        assert(not charged)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('does not charge starter purveyor currency when payment or inventory space is insufficient', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local conquestPoints = xi.voidwatch.purveyor.conquestPointCost - 1
        local charged = false
        local freeSlots = 1
        local addItemSucceeds = true
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,

            getCP = function()
                return conquestPoints
            end,

            delCP = function()
                charged = true
            end,

            getFreeSlotsCount = function()
                return freeSlots
            end,

            addItem = function()
                return addItemSucceeds
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local purchased, status = xi.voidwatch.purchasePurveyorItem(player, xi.item.COBALT_CELL)
        assert(not purchased)
        assert(status == 'no_payment')
        assert(not charged)

        conquestPoints = xi.voidwatch.purveyor.conquestPointCost
        freeSlots = 0
        purchased, status = xi.voidwatch.purchasePurveyorItem(player, xi.item.COBALT_CELL)
        assert(not purchased)
        assert(status == 'no_space')
        assert(not charged)

        freeSlots = 1
        addItemSucceeds = false
        purchased, status = xi.voidwatch.purchasePurveyorItem(player, xi.item.COBALT_CELL)
        assert(not purchased)
        assert(status == 'no_space')
        assert(not charged)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('adds starter purveyor items and charges only after a successful purchase', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local initialConquestPoints = xi.voidwatch.purveyor.conquestPointCost * 3
        local conquestPoints = initialConquestPoints
        local addedItem = nil
        local addedQuantity = nil
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,

            getCP = function()
                return conquestPoints
            end,

            delCP = function(_, amount)
                conquestPoints = conquestPoints - amount
            end,

            getFreeSlotsCount = function()
                return 1
            end,

            addItem = function(_, itemId, quantity)
                addedItem = itemId
                addedQuantity = quantity
                return true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local purchased, status, stockItem = xi.voidwatch.purchasePurveyorItem(player, xi.item.JADE_CELL, 3)

        assert(purchased)
        assert(status == 'purchased')
        assert(stockItem.id == xi.item.JADE_CELL)
        assert(addedItem == xi.item.JADE_CELL)
        assert(addedQuantity == 3)
        assert(conquestPoints == initialConquestPoints - xi.voidwatch.purveyor.conquestPointCost * 3)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('sells phase displacers from starter purveyors for gil', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local initialGil = xi.voidwatch.purveyor.phaseDisplacerCost
        local gil = initialGil
        local player =
        {
            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItem == xi.keyItem.ADVENTURERS_CERTIFICATE
            end,

            getGil = function()
                return gil
            end,

            delGil = function(_, amount)
                gil = gil - amount
            end,

            getFreeSlotsCount = function()
                return 1
            end,

            addItem = function(_, itemId, quantity)
                assert(itemId == xi.item.PHASE_DISPLACER)
                assert(quantity == 1)
                return true
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local purchased, status, stockItem = xi.voidwatch.purchasePurveyorItem(player, xi.item.PHASE_DISPLACER)

        assert(purchased)
        assert(status == 'purchased')
        assert(stockItem.currency == xi.voidwatch.currency.gil)
        assert(gil == initialGil - xi.voidwatch.purveyor.phaseDisplacerCost)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('defines a starter San d\'Oria rift slice for Sarimanok', function()
        local expectedMobIds =
        {
            [17191335] = 17191580,
            [17191336] = 17191581,
            [17191337] = 17191582,
        }

        for riftNpcId, rift in pairs(xi.voidwatch.starterRifts) do
            assert(riftNpcId >= 17191577)
            assert(rift.route == xi.voidwatch.routeName.SANDORIA)
            assert(rift.tier == 1)
            assert(rift.nm == 'Sarimanok')
            assert(rift.pyxis == expectedMobIds[rift.mob])
            assert(select(2, xi.voidwatch.getStarterRiftByPyxis(rift.pyxis)) == rift)

            local routeId, tier, op = xi.voidwatch.findOpByNM(rift.nm)
            assert(routeId == rift.route)
            assert(tier == rift.tier)
            assert(op.zone == xi.zone.EAST_RONFAURE)

            expectedMobIds[rift.mob] = nil
        end

        for mobId, _ in pairs(expectedMobIds) do
            error(string.format('Missing starter rift mob ID %u.', mobId))
        end
    end)

    it('validates starter rift disabled, requirement, abyssite, and voidstone failures', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local originalGetMobByID = GetMobByID
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.CRIMSON_STRATUM_ABYSSITE] = true,
            [xi.keyItem.VOIDSTONE1] = true,
        }
        local level = xi.voidwatch.minimumLevel
        local player =
        {
            getMainLvl = function()
                return level
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,
        }

        GetMobByID = function()
            return
            {
                isSpawned = function()
                    return false
                end,
            }
        end

        xi.settings.main.ENABLE_VOIDWATCH = 0
        local canInitiate, status = xi.voidwatch.canInitiateStarterRift(player, 17191577)
        assert(not canInitiate)
        assert(status == 'disabled')

        xi.settings.main.ENABLE_VOIDWATCH = 1
        level = xi.voidwatch.minimumLevel - 1
        canInitiate, status = xi.voidwatch.canInitiateStarterRift(player, 17191577)
        assert(not canInitiate)
        assert(status == 'requirements')

        level = xi.voidwatch.minimumLevel
        keyItems[xi.keyItem.CRIMSON_STRATUM_ABYSSITE] = nil
        canInitiate, status = xi.voidwatch.canInitiateStarterRift(player, 17191577)
        assert(not canInitiate)
        assert(status == 'abyssite')

        keyItems[xi.keyItem.CRIMSON_STRATUM_ABYSSITE] = true
        keyItems[xi.keyItem.VOIDSTONE1] = nil
        canInitiate, status = xi.voidwatch.canInitiateStarterRift(player, 17191577)
        assert(not canInitiate)
        assert(status == 'voidstone')

        GetMobByID = originalGetMobByID
        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('spends a voidstone and records starter rift NM spawn state', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local originalGetMobByID = GetMobByID
        local originalSpawnMob = SpawnMob
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
            [xi.keyItem.CRIMSON_STRATUM_ABYSSITE] = true,
            [xi.keyItem.VOIDSTONE1] = true,
        }
        local mobLocalVars = {}
        local claimedBy = nil
        local player =
        {
            getID = function()
                return 1001
            end,

            getMainLvl = function()
                return xi.voidwatch.minimumLevel
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            delKeyItem = function(_, keyItem)
                keyItems[keyItem] = nil
            end,
        }

        GetMobByID = function(mobId)
            assert(mobId == 17191335)
            return
            {
                isSpawned = function()
                    return false
                end,
            }
        end

        SpawnMob = function(mobId)
            assert(mobId == 17191335)
            return
            {
                setLocalVar = function(_, name, value)
                    mobLocalVars[name] = value
                end,

                updateClaim = function(_, claimant)
                    claimedBy = claimant
                end,
            }
        end

        xi.settings.main.ENABLE_VOIDWATCH = 1
        local initiated, status, rift, keyItem = xi.voidwatch.initiateStarterRift(player, 17191577)

        assert(initiated)
        assert(status == 'initiated')
        assert(rift.nm == 'Sarimanok')
        assert(keyItem == xi.keyItem.VOIDSTONE1)
        assert(not keyItems[xi.keyItem.VOIDSTONE1])
        assert(mobLocalVars[xi.voidwatch.var.riftInitiator] == 1001)
        assert(mobLocalVars[xi.voidwatch.var.riftNpc] == 17191577)
        assert(mobLocalVars[xi.voidwatch.var.riftPyxis] == 17191580)
        assert(claimedBy == player)

        SpawnMob = originalSpawnMob
        GetMobByID = originalGetMobByID
        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

    it('marks the initiator complete and pyxis-eligible when a starter rift NM dies', function()
        local charVars = {}
        local player =
        {
            getID = function()
                return 1001
            end,

            setCharVar = function(_, name, value)
                charVars[name] = value
            end,
        }
        local mob =
        {
            getLocalVar = function(_, name)
                if name == xi.voidwatch.var.riftInitiator then
                    return 1001
                elseif name == xi.voidwatch.var.riftNpc then
                    return 17191577
                end

                return 0
            end,
        }

        local completed, status, rift = xi.voidwatch.onNMDeath(mob, player)

        assert(completed)
        assert(status == 'completed')
        assert(rift.nm == 'Sarimanok')
        assert(charVars[xi.voidwatch.getCompletionVar(xi.voidwatch.routeName.SANDORIA, 'Sarimanok')] == 1)
        assert(charVars[xi.voidwatch.getPyxisRewardVar(17191580)] == 1)
    end)

    it('gates starter pyxis placeholder rewards by content, requirements, and eligibility', function()
        local originalValue = xi.settings.main.ENABLE_VOIDWATCH
        local charVars =
        {
            [xi.voidwatch.getPyxisRewardVar(17191580)] = 1,
        }
        local keyItems =
        {
            [xi.keyItem.ADVENTURERS_CERTIFICATE] = true,
        }
        local level = xi.voidwatch.minimumLevel
        local player =
        {
            getMainLvl = function()
                return level
            end,

            hasKeyItem = function(_, keyItem)
                return keyItems[keyItem] == true
            end,

            getCharVar = function(_, name)
                return charVars[name] or 0
            end,

            setCharVar = function(_, name, value)
                charVars[name] = value
            end,
        }

        xi.settings.main.ENABLE_VOIDWATCH = 0
        local eligible, status = xi.voidwatch.inspectStarterPyxis(player, 17191580)
        assert(not eligible)
        assert(status == 'disabled')
        assert(charVars[xi.voidwatch.getPyxisRewardVar(17191580)] == 1)

        xi.settings.main.ENABLE_VOIDWATCH = 1
        level = xi.voidwatch.minimumLevel - 1
        eligible, status = xi.voidwatch.inspectStarterPyxis(player, 17191580)
        assert(not eligible)
        assert(status == 'requirements')

        level = xi.voidwatch.minimumLevel
        eligible, status = xi.voidwatch.inspectStarterPyxis(player, 17191583)
        assert(not eligible)
        assert(status == 'invalid')

        charVars[xi.voidwatch.getPyxisRewardVar(17191580)] = 0
        eligible, status = xi.voidwatch.inspectStarterPyxis(player, 17191580)
        assert(not eligible)
        assert(status == 'no_reward')

        charVars[xi.voidwatch.getPyxisRewardVar(17191580)] = 1
        eligible, status = xi.voidwatch.inspectStarterPyxis(player, 17191580)
        assert(eligible)
        assert(status == 'eligible')
        assert(charVars[xi.voidwatch.getPyxisRewardVar(17191580)] == 0)

        xi.settings.main.ENABLE_VOIDWATCH = originalValue
    end)

end)
