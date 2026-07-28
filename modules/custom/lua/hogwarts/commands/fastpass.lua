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

-- We need just a tiny delay to let the previous menu context be cleared out
-- 'New pages' are actually just whole new menus!
local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'Fast Pass Menu',
    options = {},
}

page1 =
{
    {
        'Warp to Jeuno',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 245)
            playerArg:printToPlayer('Warping to Lower Jeuno', xi.msg.channel.NS_SAY)
        end,
    },
    {
        'Warp to San d\'Oria',
        function(playerArg)
            playerArg:setPos(0, 2, 0, 63, 230)
            playerArg:printToPlayer('Warping to San d\'Oria', xi.msg.channel.NS_SAY)
        end,
    },
    {
        'Warp to Bastok',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 235)
            playerArg:printToPlayer('Warping to Bastok', xi.msg.channel.NS_SAY)
        end,
    },
    {
        'Warp to Windurst',
        function(playerArg)
            playerArg:setPos(0, 0, 0, 0, 241)
            playerArg:printToPlayer('Warping to Windurst', xi.msg.channel.NS_SAY)
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
        'Warp to Adoulin',
        function(playerArg)
            playerArg:printToPlayer('Warping to Adoulin', xi.msg.channel.NS_SAY)
            playerArg:setPos(41.3317, 0, -20.5118, 129, 256)
        end,
    },
    {
        'Previous Page',
        function(playerArg)
            menu.options = page1
            delaySendMenu(playerArg)
        end,
    },
}

commandObj.onTrigger = function (player)
    menu.options = page1
    delaySendMenu(player)
end

return commandObj