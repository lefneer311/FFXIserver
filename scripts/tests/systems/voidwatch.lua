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

end)
