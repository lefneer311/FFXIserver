-----------------------------------
-- func: telelist
-- desc:
--   !telelist
--   !telelist set #
--   !telelist go #
--   !telelist clear #
--
-- Base-branch friendly:
-- - No direct SQL from Lua; uses CharVars for persistence.
-- - Stores up to 15 slots per character.
--
-- Casting / animation:
-- - Total "cast" time: CAST_TOTAL_MS
-- - t=0.0s: casting pose start (white for set, black for go)
-- - t=CAST_PREP_MS: casting pose stop + completion flash (magic finish anim)
-- - t=CAST_TOTAL_MS: effect (save location / teleport)
-- - Cancel if player moves (or changes zone) during cast.
--
-- Notes:
-- - Uses a cast sequence token to avoid timer race conditions.
-- - GO does not play any ITEM_FINISH / item-use animation.
-- - Chat output is consolidated as much as possible to reduce SystemMessage headers.
-----------------------------------

---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's', -- parse "set 1" / "go 1" from one raw string
}

-- =========================================================
-- CONFIG
-- =========================================================
local MAX_SLOTS = 15

-- timing: 0.0s prep pose, CAST_PREP_MS completion flash, CAST_TOTAL_MS effect
local CAST_PREP_MS  = 2000
local CAST_TOTAL_MS = 4000

-- Cancel cast if moved more than this many yalms
local MOVE_CANCEL_DISTANCE = 0.75
local MOVE_CANCEL_DISTANCE_SQ = MOVE_CANCEL_DISTANCE * MOVE_CANCEL_DISTANCE

-- Action types
local ACTION_MAGIC_FINISH = 266

-- Completion flash animation (you selected 1; 122 caused the doll to disappear)
local ANIM_FINISH_FLASH = 1

-- LocalVars used for "casting lock" and sequence
local CAST_LOCK = 'telelist_cast_lock'
local CAST_SEQ  = 'telelist_cast_seq'

-- Optional: zone denylist beyond instance/battlefield checks
local BLOCKED_ZONE_IDS =
{
    -- [zoneId] = true,
}

-- We store XYZ as milli-units (x*1000) in ints to avoid float/string parsing issues
local POS_SCALE = 1000

-- Output handling for character limit
local LIST_SLOTS_PER_MESSAGE = 5 -- 15 slots -> 3 messages


-- =========================================================
-- OUTPUT (Yellow)
-- =========================================================
local function telePrint(player, msg)
    -- Yellow system text. Client may show a SystemMessage banner per message batch.
    player:printToPlayer(msg, xi.msg.channel.SYSTEM_3)
end

-- =========================================================
-- HELPERS
-- =========================================================
local function usage(player)
    -- One message block (still multiple lines, but one print)
    telePrint(player,
        '!telelist\n' ..
        '!telelist set #\n' ..
        '!telelist go #\n' ..
        '!telelist clear #'
    )
end

local function parseArgs(args)
    -- Returns: subcmd (string|nil), slot (number|nil)
    if args == nil then
        return nil, nil
    end

    args = tostring(args)
    args = args:gsub('^%s+', ''):gsub('%s+$', '')
    if args == '' then
        return nil, nil
    end

    local subcmd, slotStr = args:match('^(%S+)%s*(%S*)$')
    if subcmd == nil then
        return nil, nil
    end

    subcmd = string.lower(subcmd)
    local slot = tonumber(slotStr)

    return subcmd, slot
end

local function isBlockedZone(player)
    local zid = player:getZoneID()

    if BLOCKED_ZONE_IDS[zid] then
        return true
    end

    if player.getBattlefield ~= nil and player:getBattlefield() ~= nil then
        return true
    end

    if player.getInstance ~= nil and player:getInstance() ~= nil then
        return true
    end

    return false
end

local function isCastingTelelist(player)
    return player:getLocalVar(CAST_LOCK) > 0
end

-- Sequence-based cast start/stop to avoid timer races and stale timers.
local function beginTelelistCast(player)
    local seq = player:getLocalVar(CAST_SEQ) + 1
    player:setLocalVar(CAST_SEQ, seq)
    player:setLocalVar(CAST_LOCK, 1)
    return seq
end

local function endTelelistCast(player, seq)
    if player:getLocalVar(CAST_SEQ) == seq then
        player:setLocalVar(CAST_LOCK, 0)
    end
end

local function isSameCast(player, seq)
    return player:getLocalVar(CAST_SEQ) == seq and player:getLocalVar(CAST_LOCK) > 0
end

local function getPosSnapshot(player)
    return {
        zoneid = player:getZoneID(),
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
    }
end

local function movedTooFar(player, snap)
    if player:getZoneID() ~= snap.zoneid then
        return true
    end

    local dx = player:getXPos() - snap.x
    local dy = player:getYPos() - snap.y
    local dz = player:getZPos() - snap.z
    return (dx * dx + dy * dy + dz * dz) > MOVE_CANCEL_DISTANCE_SQ
end

-- Try to derive a readable zone “name” from xi.zone enum key
local function zoneNameFromId(zoneid)
    if xi ~= nil and xi.zone ~= nil then
        for k, v in pairs(xi.zone) do
            if v == zoneid and type(k) == 'string' then
                return (k:gsub('_', ' '))
            end
        end
    end
    return string.format('Zone %u', zoneid)
end

-- =========================================================
-- CASTING POSE ANIMS (prep/stop/interrupt)
-- =========================================================
local function playPrepWhite(player)
    player:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_START)
end

local function playStopWhite(player)
    player:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_STOP)
end

local function playInterruptWhite(player)
    player:entityAnimationPacket(xi.animationString.CAST_WHITE_MAGIC_INTERRUPT)
end

local function playPrepBlack(player)
    player:entityAnimationPacket(xi.animationString.CAST_BLACK_MAGIC_START)
end

local function playStopBlack(player)
    player:entityAnimationPacket(xi.animationString.CAST_BLACK_MAGIC_STOP)
end

local function playInterruptBlack(player)
    player:entityAnimationPacket(xi.animationString.CAST_BLACK_MAGIC_INTERRUPT)
end

local function playFinishFlash(player)
    player:injectActionPacket(player:getID(), ACTION_MAGIC_FINISH, ANIM_FINISH_FLASH, 0, 0, 0, 10, 1)
end

-- =========================================================
-- CHARVAR STORAGE
-- =========================================================
local function key(slot, suffix)
    return string.format('[TELELIST]%02u_%s', slot, suffix)
end

local function clearSlot(player, slot)
    player:setCharVar(key(slot, 'ZONE'), 0)
    player:setCharVar(key(slot, 'X'), 0)
    player:setCharVar(key(slot, 'Y'), 0)
    player:setCharVar(key(slot, 'Z'), 0)
    player:setCharVar(key(slot, 'R'), 0)
end

local function saveSlot(player, slot, zoneid, x, y, z, rot)
    player:setCharVar(key(slot, 'ZONE'), zoneid)
    player:setCharVar(key(slot, 'X'), math.floor(x * POS_SCALE + 0.5))
    player:setCharVar(key(slot, 'Y'), math.floor(y * POS_SCALE + 0.5))
    player:setCharVar(key(slot, 'Z'), math.floor(z * POS_SCALE + 0.5))
    player:setCharVar(key(slot, 'R'), rot)
end

local function loadSlot(player, slot)
    local zoneid = player:getCharVar(key(slot, 'ZONE'))
    if zoneid == nil or zoneid == 0 then
        return nil
    end

    local xiInt = player:getCharVar(key(slot, 'X')) or 0
    local yiInt = player:getCharVar(key(slot, 'Y')) or 0
    local ziInt = player:getCharVar(key(slot, 'Z')) or 0
    local rot   = player:getCharVar(key(slot, 'R')) or 0

    return {
        zoneid = zoneid,
        x = xiInt / POS_SCALE,
        y = yiInt / POS_SCALE,
        z = ziInt / POS_SCALE,
        rot = rot,
    }
end

-- =========================================================
-- COMMAND
-- =========================================================
commandObj.onTrigger = function(player, args)
    local subcmd, slot = parseArgs(args)

	-- LIST (batched: 5 slots per message => 3 messages)
	if subcmd == nil then
		local totalMsgs = math.ceil(MAX_SLOTS / LIST_SLOTS_PER_MESSAGE)
		local msgIndex = 0

		for startSlot = 1, MAX_SLOTS, LIST_SLOTS_PER_MESSAGE do
			msgIndex = msgIndex + 1

			local lines = {}
			if msgIndex == 1 then
				lines[#lines + 1] = 'Telelist locations:'
			else
				lines[#lines + 1] = string.format('Telelist locations (cont. %u/%u):', msgIndex, totalMsgs)
			end

			local endSlot = math.min(startSlot + LIST_SLOTS_PER_MESSAGE - 1, MAX_SLOTS)
			for i = startSlot, endSlot do
				local row = loadSlot(player, i)
				if row ~= nil then
					lines[#lines + 1] = string.format(
						'#%02u - %s; X:%d Y:%d Z:%d Rot:%d',
						i,
						zoneNameFromId(row.zoneid),
						math.floor(row.x + 0.5),
						math.floor(row.y + 0.5),
						math.floor(row.z + 0.5),
						math.floor((row.rot or 0) + 0.5)
					)
				else
					lines[#lines + 1] = string.format('#%02u - (empty)', i)
				end
			end

			telePrint(player, table.concat(lines, '\n'))
		end

		return
	end

    -- CLEAR (one message)
    if subcmd == 'clear' then
        if isCastingTelelist(player) then
            telePrint(player, 'You are busy.')
            return
        end

        clearSlot(player, slot)
        telePrint(player, string.format('Telepoint %u cleared.', slot))
        return
    end

    -- SET
    if subcmd == 'set' then
        if isCastingTelelist(player) then
            telePrint(player, 'You are busy.')
            return
        end

        if isBlockedZone(player) then
            telePrint(player, 'You cannot use !telelist here.')
            return
        end

        -- Start (one message)
        telePrint(player, 'Memorizing the area precisely...')
        local seq = beginTelelistCast(player)

        playPrepWhite(player)
        local snap = getPosSnapshot(player)

        -- Capture location now
        local saveZone = player:getZoneID()
        local saveX    = player:getXPos()
        local saveY    = player:getYPos()
        local saveZ    = player:getZPos()
        local saveRot  = player:getRotPos()

        -- Stage 2: stop pose + finish flash
        player:timer(CAST_PREP_MS, function(p)
            if p == nil then return end
            if not isSameCast(p, seq) then return end

            if movedTooFar(p, snap) then
                playInterruptWhite(p)
                endTelelistCast(p, seq)
                telePrint(p, 'Casting canceled.')
                return
            end

            playStopWhite(p)
            playFinishFlash(p)
        end)

        -- Stage 3: commit save (one message on success)
        player:timer(CAST_TOTAL_MS, function(p)
            if p == nil then return end
            if not isSameCast(p, seq) then return end

            if movedTooFar(p, snap) then
                playInterruptWhite(p)
                endTelelistCast(p, seq)
                telePrint(p, 'Casting canceled.')
                return
            end

            if isBlockedZone(p) then
                endTelelistCast(p, seq)
                telePrint(p, 'You cannot use !telelist here.')
                return
            end

            saveSlot(p, slot, saveZone, saveX, saveY, saveZ, saveRot)
            telePrint(p, string.format('Telepoint %u set.', slot))
            endTelelistCast(p, seq)
        end)

        return
    end

    -- GO
    if subcmd == 'go' then
        if isCastingTelelist(player) then
            telePrint(player, 'You are busy.')
            return
        end

        if isBlockedZone(player) then
            telePrint(player, 'You cannot use !telelist here.')
            return
        end

        local row = loadSlot(player, slot)
        if row == nil then
            telePrint(player, 'No telepoint stored in that slot.')
            return
        end

        local destZoneId = row.zoneid
        local destZoneName = zoneNameFromId(destZoneId)

        -- Start (one message)
        telePrint(player, string.format('Returning to your memorized location: #%u - %s.', slot, destZoneName))

        local seq = beginTelelistCast(player)

        playPrepBlack(player)
        local snap = getPosSnapshot(player)

        -- Stage 2: stop pose + finish flash (no item-use animation)
        player:timer(CAST_PREP_MS, function(p)
            if p == nil then return end
            if not isSameCast(p, seq) then return end

            if movedTooFar(p, snap) then
                playInterruptBlack(p)
                endTelelistCast(p, seq)
                telePrint(p, 'Casting canceled.')
                return
            end

            playStopBlack(p)
            playFinishFlash(p)
        end)

        -- Stage 3: zone (no extra success message to avoid another SystemMessage header)
        player:timer(CAST_TOTAL_MS, function(p)
            if p == nil then return end
            if not isSameCast(p, seq) then return end

            if movedTooFar(p, snap) then
                playInterruptBlack(p)
                endTelelistCast(p, seq)
                telePrint(p, 'Casting canceled.')
                return
            end

            if isBlockedZone(p) then
                endTelelistCast(p, seq)
                telePrint(p, 'You cannot use !telelist here.')
                return
            end

            p:setPos(row.x, row.y, row.z, row.rot or 0, destZoneId)
            endTelelistCast(p, seq)
        end)

        return
    end

    usage(player)
end

return commandObj
