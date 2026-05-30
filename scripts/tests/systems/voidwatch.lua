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

end)
