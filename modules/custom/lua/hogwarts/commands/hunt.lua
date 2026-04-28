-----------------------------------
-- func: hunt
-- desc: Paginated hunt teleport menu with delayed teleport casting.
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

local menu   = {}
local page1  = {}
local page2  = {}
local page3  = {}
local page4  = {}
local page5  = {}
local page6  = {}
local page7  = {}
local page8  = {}

local CAST_PREP_MS  = 2000
local CAST_TOTAL_MS = 4000

local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

local function beginHuntWarp(player, message, x, y, z, rot, zone)
    player:printToPlayer(message, xi.msg.channel.SYSTEM_1)
    player:entityAnimationPacket(xi.animationString.CAST_BLACK_MAGIC_START)

    player:timer(CAST_PREP_MS, function(playerArg)
        if playerArg == nil then
            return
        end

        playerArg:entityAnimationPacket(xi.animationString.CAST_BLACK_MAGIC_STOP)
        playerArg:injectActionPacket(playerArg:getID(), 266, 1, 0, 0, 0, 10, 1)
    end)

    player:timer(CAST_TOTAL_MS, function(playerArg)
        if playerArg == nil then
            return
        end

        playerArg:setPos(x, y, z, rot, zone)
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
            beginHuntWarp(playerArg, 'Warping to the Hunt Master NPC~\nThey sell rare items for your hunts!\nThey also offer special quests.\n', -287.379, -20.910, 86.261, 27, 256)
        end,
    },
    {
        '[HNM75+] - King Behemoth',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Behemoth\'s Dominion~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -267.469, -19.831, 73.674, 127, 127)
        end,
    },
    {
        '[HNM75+] - Aspidochelone',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Valley of Sorrows~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 19.000, 0.089, 14.000, 117, 128)
        end,
    },
    {
        '[HNM75+] - Nidhogg',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Dragon\'s Aery~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 78.000, 6.000, 34.000, 127, 154)
        end,
    },
    { 'Aht Urhgan Kings (1)',   function(playerArg) menu.options = page2 delaySendMenu(playerArg) end },
}

page2 =
{
    {
        '[HNM75+] - Cerberus',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Mount Zhayolm~\nThere is no way to force spawn the HNM.\nCerberus respawns in 48-72 hours.\n', 316.000, -23.000, -84.000, 127, 61)
        end,
    },
    {
        '[HNM75+] - Hydra',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Wajaom Woodlands~\nThere is no way to force spawn the HNM.\nHydra respawns in 48-72 hours.\n', -282.000, -24.000, -1.000, 127, 51)
        end,
    },
    {
        '[HNM75+] - Khimaira',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Caedarva Mire~\nThere is no way to force spawn the HNM.\nKhimaira respawns in 48-72 hours.\n', 603.887, -16.140, 414.765, 255, 79)
        end,
    },
    { 'Ground Kings',           function(playerArg) menu.options = page1 delaySendMenu(playerArg) end },
    { 'Aht Urhgan Kings (2)',   function(playerArg) menu.options = page3 delaySendMenu(playerArg) end },
}

page3 =
{
    {
        '[HNM75+] - Gurfurlur the Menacing',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Halvung~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -59.000, -23.000, 3.000, 195, 62)
        end,
    },
    {
        '[HNM75+] - Medusa',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Arrapago Reef~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 382.057, -10.668, -16.824, 71, 54)
        end,
    },
    {
        '[HNM75+] - Gulool Ja Ja',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Mamook~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -301.000, 15.000, -380.000, 1, 65)
        end,
    },
    { 'Aht Urhgan Kings (1)',   function(playerArg) menu.options = page2 delaySendMenu(playerArg) end },
    { 'Sky Kings (1)',          function(playerArg) menu.options = page4 delaySendMenu(playerArg) end },
}

page4 =
{
    {
        '[HNM75+] - Motherglobe',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to The Shrine of Ru\'Avitau~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -81.000, 32.000, 2.000, 27, 178)
        end,
    },
    {
        '[HNM75+] - Steam Cleaner',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ve\'Lugannon Palace~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 317.000, -1.000, 361.000, 65, 177)
        end,
    },
    {
        '[HNM75+] - Seiryu',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ru\'Aun Gardens~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 580.835, -70.220, -84.529, 134, 130)
        end,
    },
    { 'Aht Urhgan Kings (2)',   function(playerArg) menu.options = page3 delaySendMenu(playerArg) end },
    { 'Sky Kings (2)',          function(playerArg) menu.options = page5 delaySendMenu(playerArg) end },
}

page5 =
{
    {
        '[HNM75+] - Faust',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to The Shrine of Ru\'Avitau~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 740.000, -0.463, -99.000, 192, 178)
        end,
    },
    {
        '[HNM75+] - Brigandish Blade',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ve\'Lugannon Palace~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -1.000, -1.000, -283.000, 63, 177)
        end,
    },
    {
        '[HNM75+] - Suzaku',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ru\'Aun Gardens~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -520.836, -70.220, -271.516, 242, 130)
        end,
    },
    { 'Sky Kings (1)',          function(playerArg) menu.options = page4 delaySendMenu(playerArg) end },
    { 'Sky Kings (3)',          function(playerArg) menu.options = page6 delaySendMenu(playerArg) end },
}

page6 =
{
    {
        '[HNM75+] - Ullikummi',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to The Shrine of Ru\'Avitau~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 739.000, -99.000, -581.000, 195, 178)
        end,
    },
    {
        '[HNM75+] - Despot',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ru\'Aun Gardens~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -0.100, -42.000, -291.000, 114, 130)
        end,
    },
    {
        '[HNM75+] - Byakko',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ru\'Aun Gardens~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -419.403, -70.200, 410.956, 30, 130)
        end,
    },
    { 'Sky Kings (2)',          function(playerArg) menu.options = page5 delaySendMenu(playerArg) end },
    { 'Sky Kings (4)',          function(playerArg) menu.options = page7 delaySendMenu(playerArg) end },
}

page7 =
{
    {
        '[HNM75+] - Olla Grande',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to The Shrine of Ru\'Avitau~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 851.000, -1.000, 92.000, 113, 178)
        end,
    },
    {
        '[HNM75+] - Zipacna',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ve\'Lugannon Palace~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', -195.000, -0.500, 396.000, 1, 177)
        end,
    },
    {
        '[HNM75+] - Genbu',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to Ru\'Aun Gardens~\nTrade to the ??? to spawn the HNM.\nThe ??? respawns in 5 minutes.\n', 261.868, -70.219, 526.413, 90, 130)
        end,
    },
    {
        '[HNM75+] - Kirin',
        function(playerArg)
            beginHuntWarp(playerArg, 'Warping to The Shrine of Ru\'Avitau~\nTrade to the ??? to spawn Kirin.\nThe ??? respawns in 5 minutes.\n', -90.377, 32.575, 5.507, 25, 178)
        end,
    },
    { 'Sky Kings (3)',          function(playerArg) menu.options = page6 delaySendMenu(playerArg) end },
    { 'Sea Kings (1)',          function(playerArg) menu.options = page8 delaySendMenu(playerArg) end },
}

page8 =
{
    {
        'Sea Kings Coming Soon',
        function(playerArg)
            playerArg:printToPlayer('Sea Kings page is reserved for your next set of targets.', xi.msg.channel.SYSTEM_1)
        end,
    },
    { 'Sky Kings (4)',          function(playerArg) menu.options = page7 delaySendMenu(playerArg) end },
}

commandObj.onTrigger = function(player)
    menu.options = page1
    delaySendMenu(player)
end

return commandObj
