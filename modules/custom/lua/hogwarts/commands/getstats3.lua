-----------------------------------
-- func: getstats3
-- desc: prints stats of cursor target into chatlog, for debugging.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

-- function onTrigger(player, extendedMode)
commandObj.onTrigger = function(player)
    local target = player:getCursorTarget()
    if target == nil then
        player:printToPlayer('Target something first.')
        return
    end

    local targetType = target:getObjType()

    if targetType == xi.objType.NPC then
        player:printToPlayer('Target something other than an NPC..They don\'t have stats!')
        return
    end

    player:printToPlayer(string.format('MainJob(jID: %s) LV: %i / SubJob(jID: %s) LV: %i ',
        target:getMainJob(), target:getMainLvl(), target:getSubJob(), target:getSubLvl()), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('-------------------- | Basic Stats | --------------------'), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('HP: %i/%i  MP: %i/%i (current/max) ',
        target:getHP(), target:getMaxHP(), target:getMP(), target:getMaxMP()), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('STR: [%i] | DEX: [%i] | VIT: [%i] | AGI: [%i]',
        target:getStat(xi.mod.STR), target:getStat(xi.mod.DEX), target:getStat(xi.mod.VIT), target:getStat(xi.mod.AGI)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('MND: [%i] | INT: [%i] | CHR: [%i] ',
        target:getStat(xi.mod.MND), target:getStat(xi.mod.INT), target:getStat(xi.mod.CHR)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Food Accuracy Bonus: [%i%%] | Accuracy Base: [%i] | Total Accuracy: [%i]',
        target:getMod(xi.mod.FOOD_ACCP), target:getMod(xi.mod.ACC), target:getStat(xi.mod.ACC)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Food Accuracy Bonus: [%i%%] | RAccuracy Base: [%i] | Total RAccuracy: [%i]',
        target:getMod(xi.mod.FOOD_ACCP), target:getMod(xi.mod.RACC), target:getStat(xi.mod.RACC)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('EVA Base: [%i] | EVA Total: [%i] | Magic EVA Base: [%i]',
        target:getMod(xi.mod.EVA), target:getStat(xi.mod.EVA), target:getMod(xi.mod.MEVA)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Attack Base: %i ', target:getMod(xi.mod.ATT)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Total Attack: %i ', target:getStat(xi.mod.ATT)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Defense Base: %i ', target:getMod(xi.mod.DEF)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Total Defense: %i ', target:getStat(xi.mod.DEF)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Magic Attack bonus: %i ', target:getMod(xi.mod.MATT)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Magic Defense bonus: %i ', target:getMod(xi.mod.MDEF)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Magic Accuracy bonus: %i ', target:getMod(xi.mod.MACC)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Total Subtle Blow: %i ', target:getMod(xi.mod.SUBTLE_BLOW)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Total Store TP: %i ', target:getMod(xi.mod.STORETP)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('-------------------- | Enspell Mods | ---------------------'), xi.msg.channel.SYSTEM_3)
	player:printToPlayer(string.format('EnSpell: [%i] | EnSpell Dmg Bonus [%i%%] | Enspell DMG [%i] ', 
		target:getMod(xi.mod.ENSPELL), target:getMod(xi.mod.ENSPELL_DMG_BONUS), target:getMod(xi.mod.ENSPELL_DMG)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('-------------------- | Multi Strikes | --------------------'), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Double Attack: [%i] | Triple Attack: [%i] | Quad Attack: [%i]',
        target:getMod(xi.mod.DOUBLE_ATTACK), target:getMod(xi.mod.TRIPLE_ATTACK), target:getMod(xi.mod.QUAD_ATTACK)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('----------------- | Cast / Recast Mods | -----------------'), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Fast Cast: [%i] | Quick Magic: [%i]',
        target:getMod(xi.mod.FASTCAST), target:getMod(xi.mod.QUICK_MAGIC)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Haste Magic: [%i] | Haste Ability: [%i] | Haste Gear: [%i]',
        target:getMod(xi.mod.HASTE_MAGIC), target:getMod(xi.mod.HASTE_ABILITY), target:getMod(xi.mod.HASTE_GEAR)), xi.msg.channel.SYSTEM_3)
    player:printToPlayer(string.format('Spell Interrupt: [%i] | UFast Cast: [%i]',
        target:getMod(xi.mod.SPELLINTERRUPT), target:getMod(xi.mod.UFASTCAST)), xi.msg.channel.SYSTEM_3)
	
	-- player:printToPlayer('Cannot easily and accurately get Magic Evasion with current methods.')

    if targetType == xi.objType.PC then
        player:printToPlayer(string.format('%s\'s base Treasure Hunter with current equipment: %i', target:getName(), target:getMod(xi.mod.TREASURE_HUNTER)), xi.msg.channel.SYSTEM_3)
    elseif targetType == xi.objType.PET then
        -- not needed yet, but we don't want to run MOB so just die in empty conditionals
    elseif targetType == xi.objType.TRUST then
        -- see above
    elseif targetType == xi.objType.FELLOW then
        -- see above
    elseif targetType == xi.objType.MOB then
        player:printToPlayer(string.format('Mob\'s current Treasure Hunter Tier: %i', target:getTHlevel()), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('Battletime: %i ', target:getBattleTime()), xi.msg.channel.SYSTEM_3)
        -- Todo: check if raged and/or how long mobs ragetimer is.
    end

	local effects = target:getStatusEffects()
	if effects and #effects > 0 then
		player:printToPlayer('------------------- | Status Effects | -------------------', xi.msg.channel.SYSTEM_3)
		for _, eff in ipairs(effects) do
			player:printToPlayer(string.format(
				'EffectID: %i Power: %i SubPower: %i Tier: %i',
				eff:getType(), eff:getPower(), eff:getSubPower(), eff:getTier()
			), xi.msg.channel.SYSTEM_3)
		end
	end

    --[[ future use: print resistances etc..
    if extendedMode then
        -- That'll be pretty spammy.. Maybe NOT print everything and make it a choice which 'page' of stats to print.
    end
    ]]
end

return commandObj
