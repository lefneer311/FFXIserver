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
local menu   = {}
local page1  = {}
local page2  = {}
local page3  = {}
local page4  = {}
local page5  = {}
local page6  = {}
local page7  = {}
local page8  = {}
local page9  = {}
local page10 = {}

-- We need just a tiny delay to let the previous menu context be cleared out
-- 'New pages' are actually just whole new menus!
local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'Hunt Master Menu',
    options = {},
}

page1 =
{
    {
        '[60+] - Hunt Master',
        function(playerArg)
            playerArg:setPos(-287.3790, -20.9100, 86.2606, 27, 256)
            playerArg:printToPlayer('Warping to the Hunt Master NPC~\nThey sell rare items for your hunts!\nThey also offer special quests.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
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
        'Aht Urgan Kings (1)',
        function(playerArg)
            menu.options = page2
            delaySendMenu(playerArg)
        end,
    },
}

page2 =
{
    {
        '[HNM75+] - Cerberus',
        function(playerArg)
            playerArg:setPos(-287.3790, -20.9100, 86.2606, 27, 127)
            playerArg:printToPlayer('Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Hydra',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 128)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Khimaira',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Ground Kings',
        function(playerArg)
            menu.options = page1
            delaySendMenu(playerArg)
        end,
    },
    {
        'Aht Urgan Kings (2)',
        function(playerArg)
            menu.options = page3
            delaySendMenu(playerArg)
        end,
    },
}

page3 =
{
    {
        '[HNM75+] - Gurfurlur the Menacing',
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
        '[HNM75+] - Gulool Ja Ja',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Aht Urgan Kings (1)',
        function(playerArg)
            menu.options = page2
            delaySendMenu(playerArg)
        end,
    },
    {
        'Sky Kings (1)',
        function(playerArg)
            menu.options = page4
            delaySendMenu(playerArg)
        end,
    },
}

page4 =
{
    {
        '[HNM75+] - Motherglobe',
        function(playerArg)
            playerArg:setPos(-81, 32, 2, 27, 178)
            playerArg:printToPlayer('Warping to The Shrine of Ru\'Avitau~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Steam Cleaner',
        function(playerArg)
            playerArg:setPos(-220, -5, 60, 0, 178)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Seiryu',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Aht Urgan Kings (2)',
        function(playerArg)
            menu.options = page3
            delaySendMenu(playerArg)
        end,
    },
    {
        'Sky Kings (2)',
        function(playerArg)
            menu.options = page5
            delaySendMenu(playerArg)
        end,
    },
}

page5 =
{
    {
        '[HNM75+] - Faust',
        function(playerArg)
            playerArg:setPos(-287.3790, -20.9100, 86.2606, 27, 127)
            playerArg:printToPlayer('Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Brigandish Blade',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 128)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Suzaku',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Sky Kings (1)',
        function(playerArg)
            menu.options = page4
            delaySendMenu(playerArg)
        end,
    },
    {
        'Sky Kings (3)',
        function(playerArg)
            menu.options = page6
            delaySendMenu(playerArg)
        end,
    },
}

page6 =
{
    {
        '[HNM75+] - Ullikummi',
        function(playerArg)
            playerArg:setPos(-287.3790, -20.9100, 86.2606, 27, 127)
            playerArg:printToPlayer('Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Despot',
        function(playerArg)
            playerArg:setPos(20, -5, 140, 0, 178)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Byakko',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Sky Kings (2)',
        function(playerArg)
            menu.options = page5
            delaySendMenu(playerArg)
        end,
    },
    {
        'Sky Kings (4)',
        function(playerArg)
            menu.options = page7
            delaySendMenu(playerArg)
        end,
    },
}

page7 =
{
    {
        '[HNM75+] - Olla Grande',
        function(playerArg)
            playerArg:setPos(-287.3790, -20.9100, 86.2606, 27, 127)
            playerArg:printToPlayer('Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Zipacna',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 128)
            playerArg:printToPlayer('Warping to Valley of Sorrow~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Genbu',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 154)
            playerArg:printToPlayer('Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        '[HNM75+] - Kirin',
        function(playerArg)
            playerArg:setPos(-81, 32, 2, 27, 178)
            playerArg:printToPlayer('Warping to The Shrine of Ru\'Avitau~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', xi.msg.channel.SYSTEM_1)
        end,
    },
    {
        'Sky Kings (3)',
        function(playerArg)
            menu.options = page6
            delaySendMenu(playerArg)
        end,
    },
    {
        'Sea Kings (1)',
        function(playerArg)
            menu.options = page8
            delaySendMenu(playerArg)
        end,
    },
}

commandObj.onTrigger = function (player)
    menu.options = page1
    delaySendMenu(player)
end

return commandObj
