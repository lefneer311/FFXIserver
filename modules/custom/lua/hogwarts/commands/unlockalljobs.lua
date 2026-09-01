-----------------------------------
-- func: unlockalljobs [player]
-- desc: Unlocks all jobs and marks their unlock quests complete.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!unlockalljobs (player)')
end

local function completeQuestIfNeeded(player, logId, questId)
    local status = player:getQuestStatus(logId, questId)

    if status == xi.questStatus.QUEST_AVAILABLE then
        player:addQuest(logId, questId)
        player:completeQuest(logId, questId)
    elseif status == xi.questStatus.QUEST_ACCEPTED then
        player:completeQuest(logId, questId)
    end
end

local function giveKeyItemIfNeeded(player, keyItem)
    if not player:hasKeyItem(keyItem) then
        player:addKeyItem(keyItem)
    end
end

local function cleanupJobUnlockVars(player)
    player:setCharVar('ChaosbringerKills', 0)

    player:setCharVar('GEO_DWL_Triggered', 0)
    player:setCharVar('GEO_DWL_Luopan', 0)

    player:setCharVar('RUN_COTR', 0)
end

local function cleanupJobUnlockKeyItems(player)
    local keyItems =
    {
        xi.ki.BOOK_OF_TASKS,
        xi.ki.BOOK_OF_THE_EAST,
        xi.ki.BOOK_OF_THE_WEST,
        xi.ki.KNIGHTS_SOUL,

        xi.ki.FISTFUL_OF_HOMELAND_SOIL,
        xi.ki.LUOPAN,

        xi.ki.YAHSE_WILDFLOWER_PETAL,
    }

    for _, keyItem in ipairs(keyItems) do
        if player:hasKeyItem(keyItem) then
            player:delKeyItem(keyItem)
        end
    end
end

local function unlockAllJobs(player)
    -- Subjob.
    player:unlockJob(0)

    -- Advanced jobs.
    local jobs =
    {
        xi.job.PLD,
        xi.job.DRK,
        xi.job.BST,
        xi.job.BRD,
        xi.job.RNG,
        xi.job.SAM,
        xi.job.NIN,
        xi.job.DRG,
        xi.job.SMN,
        xi.job.BLU,
        xi.job.COR,
        xi.job.PUP,
        xi.job.DNC,
        xi.job.SCH,
        xi.job.GEO,
        xi.job.RUN,
    }

    for _, jobId in ipairs(jobs) do
        player:unlockJob(jobId)
    end

    -- Quest completion records for retail job unlock quests.
    completeQuestIfNeeded(player, xi.questLog.SANDORIA, xi.quest.id.sandoria.A_KNIGHTS_TEST)
    completeQuestIfNeeded(player, xi.questLog.BASTOK, xi.quest.id.bastok.BLADE_OF_DARKNESS)
    completeQuestIfNeeded(player, xi.questLog.JEUNO, xi.quest.id.jeuno.PATH_OF_THE_BEASTMASTER)
    completeQuestIfNeeded(player, xi.questLog.JEUNO, xi.quest.id.jeuno.PATH_OF_THE_BARD)
    completeQuestIfNeeded(player, xi.questLog.WINDURST, xi.quest.id.windurst.THE_FANGED_ONE)
    completeQuestIfNeeded(player, xi.questLog.OUTLANDS, xi.quest.id.outlands.FORGE_YOUR_DESTINY)
    completeQuestIfNeeded(player, xi.questLog.BASTOK, xi.quest.id.bastok.AYAME_AND_KAEDE)
    completeQuestIfNeeded(player, xi.questLog.JEUNO, xi.quest.id.jeuno.THE_OLD_MONUMENT)
    completeQuestIfNeeded(player, xi.questLog.JEUNO, xi.quest.id.jeuno.SAVE_MY_SON)
    completeQuestIfNeeded(player, xi.questLog.WINDURST, xi.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)
    completeQuestIfNeeded(player, xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.AN_EMPTY_VESSEL)
    completeQuestIfNeeded(player, xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW)
    completeQuestIfNeeded(player, xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.NO_STRINGS_ATTACHED)
    completeQuestIfNeeded(player, xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.A_LITTLE_KNOWLEDGE)
    completeQuestIfNeeded(player, xi.questLog.ADOULIN, xi.quest.id.adoulin.DANCES_WITH_LUOPANS)
    completeQuestIfNeeded(player, xi.questLog.ADOULIN, xi.quest.id.adoulin.CHILDREN_OF_THE_RUNE)

    -- Job gesture key items.
    local jobGestureKeyItems =
    {
        xi.ki.JOB_GESTURE_PALADIN,
        xi.ki.JOB_GESTURE_DARK_KNIGHT,
        xi.ki.JOB_GESTURE_BEASTMASTER,
        xi.ki.JOB_GESTURE_BARD,
        xi.ki.JOB_GESTURE_RANGER,
        xi.ki.JOB_GESTURE_SAMURAI,
        xi.ki.JOB_GESTURE_NINJA,
        xi.ki.JOB_GESTURE_DRAGOON,
        xi.ki.JOB_GESTURE_SUMMONER,
        xi.ki.JOB_GESTURE_BLUE_MAGE,
        xi.ki.JOB_GESTURE_CORSAIR,
        xi.ki.JOB_GESTURE_PUPPETMASTER,
        xi.ki.JOB_GESTURE_DANCER,
        xi.ki.JOB_GESTURE_SCHOLAR,
        xi.ki.JOB_GESTURE_GEOMANCER,
        xi.ki.JOB_GESTURE_RUNE_FENCER,
    }

    for _, keyItem in ipairs(jobGestureKeyItems) do
        giveKeyItemIfNeeded(player, keyItem)
    end

    -- Quest-specific permanent key items / starter rewards where unlock scripts grant them.
    giveKeyItemIfNeeded(player, xi.ki.MARK_OF_ZAHAK)

    if not player:hasItem(xi.item.MATRE_BELL) then
        player:addItem(xi.item.MATRE_BELL)
    end

    cleanupJobUnlockVars(player)
    cleanupJobUnlockKeyItems(player)
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

    unlockAllJobs(targ)

    if targ:getID() == player:getID() then
        player:printToPlayer('All jobs unlocked.')
    else
        player:printToPlayer(string.format('All jobs unlocked for %s.', targ:getName()))
        targ:printToPlayer('All jobs unlocked.')
    end
end

return commandObj