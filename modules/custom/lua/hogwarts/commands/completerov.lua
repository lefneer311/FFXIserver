-----------------------------------
-- func: completerov (player)
-- desc: Completes all Rhapsodies of Vana'diel missions and grants RoV key item rewards.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local rovLog = xi.mission.log_id.ROV
local rov = xi.mission.id.rov

local rovMissions =
{
    rov.RHAPSODIES_OF_VANADIEL,
    rov.RESONANCE,
    rov.EMISSARY_FROM_THE_SEAS,
    rov.SET_FREE,
    rov.THE_BEGINNING,
    rov.FLAMES_OF_PRAYER,
    rov.THE_PATH_UNTRAVELED,
    rov.AT_THE_HEAVENS_DOOR,
    rov.THE_LIONS_ROAR,
    rov.EDDIES_OF_DESPAIR_I,
    rov.A_LAND_AFTER_TIME,
    rov.FATES_CALL,
    rov.WHAT_LIES_BEYOND,
    rov.THE_TIES_THAT_BIND,
    rov.IMPURITY,
    rov.THE_LOST_AVATAR,
    rov.VOLTO_OSCURO,
    rov.RING_MY_BELL,
    rov.SPIRITS_AWOKEN,
    rov.CRASHING_WAVES,
    rov.CALL_TO_SERVE,
    rov.NUMBERING_DAYS,
    rov.INESCAPABLE_BINDS,
    rov.DESERT_WINDS,
    rov.EVER_FORWARD,
    rov.THE_ENDLESS_SKY,
    rov.APHMAUS_LIGHT,
    rov.REUNITED,
    rov.TAKE_WING,
    rov.PRIME_NUMBER,
    rov.FROM_THE_RUINS,
    rov.CAUTERIZE,
    rov.UNCERTAIN_DESTINATIONS,
    rov.GANGED_UP_ON,
    rov.SACRIFICE,
    rov.SOMBER_DREAMS,
    rov.OF_LIGHT_AND_DARKNESS,
    rov.TEMPORARY_FAREWELLS,
    rov.BRUSHING_UP,
    rov.KEEP_ON_GIVING,
    rov.PAST_IMPERFECT,
    rov.THE_CURSED_TEMPLE,
    rov.WISDOM_OF_OUR_FOREFATHERS,
    rov.WHERE_DIVINITIES_COLLIDE,
    rov.VISIONS_OF_DREAD,
    rov.TO_THE_SKIES,
    rov.ESCHA_RUAUN,
    rov.THE_DECISIVE_HEROINE,
    rov.FALL_FROM_GRACE,
    rov.BANISHING_THE_DARKNESS,
    rov.OVER_THE_RAINBOW,
    rov.CACOPHONOUS_DISCORD,
    rov.EDDIES_OF_DESPAIR_II,
    rov.PRETENDER_TO_THE_THRONE,
    rov.BANISHED,
    rov.CALL_OF_THE_VOID,
    rov.BOTH_PATHS_TAKEN,
    rov.THE_MAN_BEHIND_THE_MASK,
    rov.UNCERTAIN_FUTURES,
    rov.DARKNESS_BECKONS,
    rov.THE_BREWING_STORM,
    rov.THE_RIVER_RUNS_RED,
    rov.THE_CRUCIBLE,
    rov.FORWARD_THINKING,
    rov.TEARS_OF_THE_GENERALS,
    rov.WHAT_HE_LEFT_BEHIND,
    rov.GONE_BUT_NOT_FORGOTTEN,
    rov.AUGUST_ARTIFACTS,
    rov.SOLEMNITY,
    rov.EYES_ON_YOU,
    rov.EXPLORING_THE_RUINS,
    rov.BECOME_SOMETHING_MORE,
    rov.UNSHAKABLE_NIGHTMARES,
    rov.WHAT_REMAINS_OF_HOPE,
    rov.DEATH_CARES_NOT,
    rov.NO_TIME_LIKE_THE_FUTURE,
    rov.SIN,
    rov.PENANCE,
    rov.VESSEL_OF_LIGHT,
    rov.THE_LIFESTREAM_OF_REISENJIMA,
    rov.FROM_WEST_TO_EAST,
    rov.GOOD_THINGS_COME_IN_THREES,
    rov.TACKLING_THE_PROBLEM,
    rov.WAY_TO_DIVINITY,
    rov.THE_WINDS_OF_TIME,
    rov.CALM_AFTER_THE_STORM,
    rov.NARY_A_CLOUD_IN_SIGHT,
    rov.AN_UNENDING_SONG,
    rov.A_DEEP_SLEEP,
    rov.GUARDIANS,
    rov.IROHA_IN_DISTRESS,
    rov.ABSOLUTE_TRUST,
    rov.THE_ORBS_RADIANCE,
    rov.A_RHAPSODY_FOR_THE_AGES,
}

local rovKeyItems =
{
    xi.ki.GILGAMESHS_INTRODUCTORY_LETTER,
    xi.ki.RHAPSODY_IN_WHITE,
    xi.ki.RHAPSODY_IN_UMBER,
    xi.ki.RHAPSODY_IN_AZURE,
    xi.ki.RHAPSODY_IN_CRIMSON,
    xi.ki.RHAPSODY_IN_EMERALD,
    xi.ki.RHAPSODY_IN_MAUVE,
    xi.ki.RHAPSODY_IN_FUCHSIA,
    xi.ki.RHAPSODY_IN_PUCE,
    xi.ki.DIMENSIONAL_COMPASS,
    xi.ki.SCINTILLATING_RHAPSODY,
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!completerov (player)')
end

local function addKeyItemIfMissing(player, keyItemId)
    if keyItemId ~= nil and not player:hasKeyItem(keyItemId) then
        player:addKeyItem(keyItemId)
    end
end

commandObj.onTrigger = function(player, target)
    local targ = player

    if target ~= nil then
        targ = GetPlayerByName(target)

        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    for _, missionId in ipairs(rovMissions) do
        if not targ:hasCompletedMission(rovLog, missionId) then
            targ:completeMission(rovLog, missionId)
        end

        targ:clearVarsWithPrefix(xi.mission.getVarPrefix(rovLog, missionId))
    end

    for _, keyItemId in ipairs(rovKeyItems) do
        addKeyItemIfMissing(targ, keyItemId)
    end

    targ:setMissionStatus(rovLog, 0)
    targ:setCharVar('Mission[13][30]wasBlocked', 0)
    targ:addMission(rovLog, rov.A_RHAPSODY_FOR_THE_AGES)

    player:printToPlayer(string.format('Completed all RoV missions and granted RoV key items for %s.', targ:getName()))
end

return commandObj