-----------------------------------
-- func: menu_paginated
-- desc: Shows a paginated test menu with two pages, an option per page.
-- note: title and options are required.
--     : onStart, onCancelled, and onEnd are optional.
--     : You must provide at least one option.
--     : Incorrectly creating or configuring a menu
--     : will not result in a crash or broken menus,
--     : but will produce scary looking warnings in
--     : the log.
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

-- Forward declarations (required)
local menu  = {}
local page1 = {}
local page2 = {}
local page3 = {}
local page4 = {}
local page5 = {}
local page6 = {}
local page7 = {}

-- We need just a tiny delay to let the previous menu context be cleared out
-- 'New pages' are actually just whole new menus!
local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'Exp Camp Warps',
    options = {},
}

page1 =
{
    {
        '[Lvl 10+] - Maze of Shakrami',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 198)
            playerArg:printToPlayer('Warping to Maze of Shakrami!\nStart with page 1 for Bats and Goblins.\nMove to page 2 until you\'re around level 21-23, then go to Qufim Island.', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[Lvl 22+] - Qufim Island',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 126)
            playerArg:printToPlayer('Warping to Qufim Island!\nStart with page 1 for Crabs and Worms.\nMove to page 4 until you\'re around level 34-36, then go to Crawler\'s Nest.', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[Lvl 34+] - Crawler\'s Nest',
        function(playerArg)
            playerArg:setPos(355.4599, -32.2770, -21.8604, 121, 197)
            playerArg:printToPlayer('Warping to Crawler\'s Nest!\nSelect Page 1 for Crawlers and Bees and just keep looping through them as they respawn.\nStay here until you\'re around level 48-52', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[Lvl 50+] - Boyahda Tree',
        function(playerArg)
            playerArg:setPos(73.6183, 8.8763, 141.6751, 112, 153)
            playerArg:printToPlayer('Warping to The Boyahda Tree!\nSelect Page 4 for Bunnies and Mandragoras, and be careful to avoid links!\nStay here until you\'re around level 58-62.', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Next Page',
        function(playerArg)
            menu.options = page2
            delaySendMenu(playerArg)
        end,
    },
}

page2 =
{
    {
        '[Lvl 58+] - Cape Terrigan',
        function(playerArg)
            playerArg:setPos(-187.4578, 8.0204, -69.2232, 250, 113)
            playerArg:printToPlayer('Warping to Cape Terrigan!\nSelect Page 1 for Lizards and Bunnies! Beware the Goblins and Undead.\nStay here until you\'re around level 66+.\nYou can stretch this exp camp to level 70 if you prefer.', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[Lvl 68+] - Ru\'Aun Sky Gardens',
        function(playerArg)
            playerArg:setPos(-15.0910, -54.1600, -595.9494, 216, 130)
            playerArg:printToPlayer('Warping to Ru\'Aun Gardens!\nSelect Page 3 for Dolls and teleport to the main island ahead.\nDolls link via sight and magic!\nThey also take extra damage from blunt weapons.', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[Lvl 78+] - Misareaux Coast',
        function(playerArg)
            playerArg:setPos(-55.2106, -30.7498, 265.1300, 226, 25)
            playerArg:printToPlayer('Warping to Misareaux Coast!\nThere are no pages here- Just fight the birds.\nThey take extra damage from piercing weapons!', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Previous Page',
        function(playerArg)
            menu.options = page1
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next Page',
        function(playerArg)
            menu.options = page3
            delaySendMenu(playerArg)
        end,
    },
}

page3 =
{
    {
        '[Lvl 74+] - Shrine of Ru\'Avitau (1)',
        function(playerArg)
            playerArg:setPos(15.7187, 0.0456, 109.3171, 31, 178)
            playerArg:printToPlayer('Warping to The Shrine of Ru\'Avitau!\nSelect Page 6 for Golems and run a circuit for respawns.\nCAUTION: They will link if you use magic!\nStay here until you\'re around level 90+.', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[Lvl 90+] - Shrine of Ru\'Avitau (2)',
        function(playerArg)
            playerArg:setPos(23.4383, 31.8747, 48.6558, 223, 178)
            playerArg:printToPlayer('Warping to The Shrine of Ru\'Avitau!\nSelect Page 6 for Golems from the Ru\'Avitau (1) location.\nCAUTION: They will link if you use magic!\nStay here until you\'re around level 99+.', xi.msg.channel.SYSTEM_1)
        end,
    },
	{
        '[Lvl 99+] - Reisenjima',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 291)
            playerArg:printToPlayer('Warping to Reisenjima!\nThe monsters here are great for limit points!', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Previous Page',
        function(playerArg)
            menu.options = page2
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next Page',
        function(playerArg)
            menu.options = page4
            delaySendMenu(playerArg)
        end,
    },
}

page4 =
{
    {
        '[HNM75+] - King Behemoth',
        function(playerArg)
            playerArg:setPos(-287.3790, -20.9100, 86.2606, 27, 127)
            playerArg:printToPlayer('Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Aspidochelone',
        function(playerArg)
            playerArg:setPos(6.8051, -2.0505, -50.9096, 161, 128)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Nidhogg',
        function(playerArg)
            playerArg:setPos(54.0806, 6.3735, 19.5784, 237, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Previous Page',
        function(playerArg)
            menu.options = page3
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next Page',
        function(playerArg)
            menu.options = page5
            delaySendMenu(playerArg)
        end,
    },
}

page5 =
{
    {
        '[HNM75+] - Cerberus',
        function(playerArg)
            playerArg:setPos(330.7935, -24.1025, -46.3887, 105, 61)
            playerArg:printToPlayer('Warping to Mount Zhayolm~\nCerberus spawns every 1-3 days.\nYou\'ll know if he\'s up!\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Medusa',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 54)
            playerArg:printToPlayer('Warping to Arrapago Reef~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Hydra',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 51)
            playerArg:printToPlayer('Warping to Wajaom Woodlands~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Previous Page',
        function(playerArg)
            menu.options = page4
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next Page',
        function(playerArg)
            menu.options = page6
            delaySendMenu(playerArg)
        end,
    },
}

page6 =
{
    {
        '[HNM75+] - Reisenjima Henge',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 292)
            playerArg:printToPlayer('Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Reisenjima Sanctorium',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 293)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - ',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Previous Page',
        function(playerArg)
            menu.options = page5
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next Page',
        function(playerArg)
            menu.options = page7
            delaySendMenu(playerArg)
        end,
    },
}

page7 =
{
    {
        '[HNM75+] - Cerberus',
        function(playerArg)
            playerArg:setPos(-287.3790, -20.9100, 86.2606, 27, 127)
            playerArg:printToPlayer('Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Medusa',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 128)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - ',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Previous Page',
        function(playerArg)
            menu.options = page6
            delaySendMenu(playerArg)
        end,
    },
}

commandObj.onTrigger = function (player)
    menu.options = page1
    delaySendMenu(player)
end

return commandObj