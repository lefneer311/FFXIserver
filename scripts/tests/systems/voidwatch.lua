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
end)
