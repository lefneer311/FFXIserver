---------------------------------------------------------------------------------------------------
-- func: multi function shop
-- desc: shop with misc items for players
---------------------------------------------------------------------------------------------------
require('scripts/globals/shop')

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
};

local priceAF1 = 150000
local priceAF2 = 250000
local priceAF3 = 450000
local priceAFP1 = 600000
local priceReAF = 1000000
local priceReAFP1 = 3000000
local priceReAFP2 = 5000000
local priceReAFP3 = 7500000
local priceRelic = 700000
local priceRelicP1 = 800000
local priceRelicP2 = 900000
local priceReRelic = 1000000
local priceReRelicP1 = 3000000
local priceReRelicP2 = 5000000
local priceReRelicP3 = 7500000
local priceEmp = 1000000
local priceEmpP1 = 1500000
local priceEmpP2 = 2000000
local priceReEmp = 3000000
local priceReEmpP1 = 4500000
local priceReEmpP2 = 6500000
local priceReEmpP3 = 9000000
local priceRelicWp = 12500000
local priceRelicWp99 = 22500000
local priceMythicWp = 12500000
local priceMythicWp99 = 22500000
local priceEmpWp = 15000000
local priceEmpWp99 = 30000000
local priceAeonWp = 57500000

commandObj.onTrigger = function (player)
    player:printToPlayer('Job Shop.', 0xF);
    if(player:getMainJob() == xi.job.WAR) then -- WAR
        local stock =
        {
            -- AF1
            11988,priceAF1, -- Fighter's Torque
            16678,priceAF2, -- Razor Axe
            12511,priceAF3, -- Fighter's Mask
            12638,priceAF3, -- Fighter's Lorica
            13961,priceAF3, -- Fighter's Mufflers
            14214,priceAF3, -- Fighter's Cuisses
            14089,priceAF3, -- Fighter's Calligae
			-- AF1 +1
			15225,priceAFP1, -- Fighter's Mask +1
			14473,priceAFP1, -- Fighter's Lorica +1
			14890,priceAFP1, -- Fighter's Mufflers +1
			15561,priceAFP1, -- Fighter's Cuisses +1
			15352,priceAFP1, -- Fighter's Calligae +1
			-- AF1 Reforged
			27663,priceReAF, -- Pummeler's Mask
			27807,priceReAF, -- Pummeler's Lorica
			27943,priceReAF, -- Pummeler's Mufflers
			28090,priceReAF, -- Pummeler's Cuisses
			28223,priceReAF, -- Pummeler's Calligae
			-- AF1 Reforged +1
			27684,priceReAFP1, -- Pummeler's Mask +1
			27828,priceReAFP1, -- Pummeler's Lorica +1
			27964,priceReAFP1, -- Pummeler's Mufflers +1
			28111,priceReAFP1, -- Pummeler's Cuisses +1
			28244,priceReAFP1, -- Pummeler's Calligae +1
			-- AF1 Reforged +2
			23040,priceReAFP2, -- Pummeler's Mask +2
			23107,priceReAFP2, -- Pummeler's Lorica +2
			23174,priceReAFP2, -- Pummeler's Mufflers +2
			23241,priceReAFP2, -- Pummeler's Cuisses +2
			23308,priceReAFP2, -- Pummeler's Calligae +2
			-- AF1 Reforged +3
			23375,priceReAFP3, -- Pummeler's Mask +3
			23442,priceReAFP3, -- Pummeler's Lorica +3
			23509,priceReAFP3, -- Pummeler's Mufflers +3
			23576,priceReAFP3, -- Pummeler's Cuisses +3
			23643,priceReAFP3, -- Pummeler's Calligae +3
			-- Relic
			15871,priceRelic, -- Warrior's Stone
			15072,priceRelic, -- Warrior's Mask
			15087,priceRelic, -- Warrior's Lorica
			15102,priceRelic, -- Warrior's Mufflers
			15117,priceRelic, -- Warrior's Cuisses
			15132,priceRelic, -- Warrior's Calligae
			-- Relic +1
			15245,priceRelicP1, -- Warrior's Mask +1
			14500,priceRelicP1, -- Warrior's Lorica +1
			14909,priceRelicP1, -- Warrior's Mufflers +1
			15580,priceRelicP1, -- Warrior's Cuisses +1
			15665,priceRelicP1, -- Warrior's Calligae +1
			-- Relic +2
			10650,priceRelicP2, -- Warrior's Mask +2
			10670,priceRelicP2, -- Warrior's Lorica +2
			10690,priceRelicP2, -- Warrior's Mufflers +2
			10710,priceRelicP2, -- Warrior's Cuisses +2
			10730,priceRelicP2, -- Warrior's Calligae +2
			-- Relic Reforged
			26624,priceReRelic, -- Agoge Mask
			26800,priceReRelic, -- Agoge Lorica
			26976,priceReRelic, -- Agoge Mufflers
			27152,priceReRelic, -- Agoge Cuisses
			27328,priceReRelic, -- Agoge Calligae
			-- Relic Reforged +1
			26625,priceReRelicP1, -- Agoge Mask +1
			26801,priceReRelicP1, -- Agoge Lorica +1
			26977,priceReRelicP1, -- Agoge Mufflers +1
			27153,priceReRelicP1, -- Agoge Cuisses +1
			27329,priceReRelicP1, -- Agoge Calligae +1
			-- Relic Reforged +2
			23063,priceReRelicP2, -- Agoge Mask +2
			23130,priceReRelicP2, -- Agoge Lorica +2
			23197,priceReRelicP2, -- Agoge Mufflers +2
			23264,priceReRelicP2, -- Agoge Cuisses +2
			23331,priceReRelicP2, -- Agoge Calligae +2
			-- Relic Reforged +3
			23398,priceReRelicP3, -- Agoge Mask +3
			23465,priceReRelicP3, -- Agoge Lorica +3
			23532,priceReRelicP3, -- Agoge Mufflers +3
			23599,priceReRelicP3, -- Agoge Cuisses +3
			23666,priceReRelicP3, -- Agoge Calligae +3
			-- Empyrean
			11591,priceEmp, -- Ravager's Gorget
			19253,priceEmp, -- Ravager's Orb
			11703,priceEmp, -- Ravager's Earring
			12008,priceEmp, -- Ravager's Mask
			12028,priceEmp, -- Ravager's Lorica
			12048,priceEmp, -- Ravager's Mufflers
			12068,priceEmp, -- Ravager's Cuisses
			12088,priceEmp, -- Ravager's Calligae
			-- Empyrean +1
			11164,priceEmpP1, -- Ravager's Mask +1
			11184,priceEmpP1, -- Ravager's Lorica +1
			11204,priceEmpP1, -- Ravager's Mufflers +1
			11224,priceEmpP1, -- Ravager's Cuisses +1
			11244,priceEmpP1, -- Ravager's Calligae +1
			-- Empyrean +2
			11064,priceEmpP2, -- Ravager's Mask +2
			11084,priceEmpP2, -- Ravager's Lorica +2
			11104,priceEmpP2, -- Ravager's Mufflers +2
			11124,priceEmpP2, -- Ravager's Cuisses +2
			11144,priceEmpP2, -- Ravager's Calligae +2
			-- Empyrean Reforged
			26740,priceReEmp, -- Boii Mask
			26898,priceReEmp, -- Boii Lorica
			27052,priceReEmp, -- Boii Mufflers
			27237,priceReEmp, -- Boii Cuisses
			27411,priceReEmp, -- Boii Calligae
			-- Empyrean Reforged +1
			26741,priceReEmpP1, -- Boii Mask +1
			26899,priceReEmpP1, -- Boii Lorica +1
			27053,priceReEmpP1, -- Boii Mufflers +1
			27238,priceReEmpP1, -- Boii Cuisses +1
			27412,priceReEmpP1, -- Boii Calligae +1
			-- Empyrean Reforged +2
			23085,priceReEmpP2, -- Boii Mask +2
			23152,priceReEmpP2, -- Boii Lorica +2
			23219,priceReEmpP2, -- Boii Mufflers +2
			23286,priceReEmpP2, -- Boii Cuisses +2
			23353,priceReEmpP2, -- Boii Calligae +2
			-- Empyrean Reforged +3
			23420,priceReEmpP3, -- Boii Mask +3
			23487,priceReEmpP3, -- Boii Lorica +3
			23554,priceReEmpP3, -- Boii Mufflers +3
			23621,priceReEmpP3, -- Boii Cuisses +3
			23688,priceReEmpP3, -- Boii Calligae +3
			-- Ultimate Weapons (REAM)
			18294,priceRelicWp, -- Bravua
			19751,priceRelicWp99, -- Bravua 99
			18282,priceRelicWp, -- Ragnarok
			19749,priceRelicWp99, -- Ragnarok 99
			18991,priceMythicWp, -- Conqueror
			19819,priceMythicWp99, -- Conqueror 99
			19539,priceEmpWp, -- Ukonvasara
			19810,priceEmpWp99, -- Ukonvasara 99
			19537,priceEmpWp, -- Caladbolg
			19808,priceEmpWp99, -- Caladbolg 99
			19538,priceEmpWp, -- Farsha
			19809,priceEmpWp99, -- Farsha 99
			20843,priceAeonWp, -- Chango
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.MNK) then -- MNK
        local stock =
        {
            -- AF1
            11989,priceAF1, -- Temple Torque
            17478,priceAF2, -- Beat Cesti
            12512,priceAF3, -- Temple Crown
            12639,priceAF3, -- Temple Cyclas
            13962,priceAF3, -- Temple Gloves
            14215,priceAF3, -- Temple Hose
            14090,priceAF3, -- Temple Gaiters
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.WHM) then -- WHM
        local stock =
        {
            -- AF1
            11990,priceAF1, -- Healer's Torque
            17422,priceAF2, -- Blessed Hammer
            13855,priceAF3, -- Healer's Cap
            12640,priceAF3, -- Healer's Briault
            13963,priceAF3, -- Healer's Mitts
            14216,priceAF3, -- Healer's Pantaloons
            14091,priceAF3, -- Healer's Duckbills
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.BLM) then -- BLM
        local stock =
        {
            -- AF1
            11991,priceAF1, -- Wizard's Torque
            17423,priceAF2, -- Casting Wand
            13856,priceAF3, -- Wizard's Petasos
            12641,priceAF3, -- Wizard's Coat
            13964,priceAF3, -- Wizard's Gloves
            14217,priceAF3, -- Wizard's Tonban
            14092,priceAF3, -- Wizard's Sabots
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.RDM) then -- RDM
        local stock =
        {
            -- AF1
            11992,priceAF1, -- Warlock Torque
            16829,priceAF2, -- Fencing Degen
            12513,priceAF3, -- Warlock Chapeau
            12642,priceAF3, -- Warlock Tabard
            13965,priceAF3, -- Warlock Gloves
            14218,priceAF3, -- Warlock Tights
            14093,priceAF3, -- Warlock Boots
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.THF) then -- THF
        local stock =
        {
            -- AF1
            11993,priceAF1, -- Rogue's Torque
            16764,priceAF2, -- Marauder's Knife
            12514,priceAF3, -- Rogue's Bonnet
            12643,priceAF3, -- Rogue's Vest
            13966,priceAF3, -- Rogue's Armlets
            14219,priceAF3, -- Rogue's Culottes
            14094,priceAF3, -- Rogue's Poulaines
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.PLD) then -- PLD
        local stock =
        {
            -- AF1
            11994,priceAF1, -- Gallant Torque
            17643,priceAF2, -- Honor Sword
            12515,priceAF3, -- Gallant Coronet
            12644,priceAF3, -- Gallant Surcoat
            13967,priceAF3, -- Gallant Gauntlets
            14220,priceAF3, -- Gallant Breeches
            14095,priceAF3, -- Gallant Leggings
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.DRK) then -- DRK
        local stock =
        {
            -- AF1
            11995,priceAF1, -- Chaos Torque
            16798,priceAF2, -- Raven Scythe
            12516,priceAF3, -- Chaos Burgeonet
            12645,priceAF3, -- Chaos Cuirass
            13968,priceAF3, -- Chaos Gauntlets
            14221,priceAF3, -- Chaos Flanchard
            14096,priceAF3, -- Chaos Sollerets
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.BST) then -- BST
        local stock =
        {
            -- AF1
            11996,priceAF1, -- Beast Torque
            16680,priceAF2, -- Barbaroi Axe
            12517,priceAF3, -- Beast Helm
            12646,priceAF3, -- Beast Jackcoat
            14958,priceAF3, -- Beast Gloves
            14222,priceAF3, -- Beast Trousers
            14097,priceAF3, -- Beast Gaiters
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.BRD) then -- BRD
        local stock =
        {
            -- AF1
            11997,priceAF1, -- Choral Torque
            16766,priceAF2, -- Paper Knife
            13857,priceAF3, -- Choral Roundlet
            12647,priceAF3, -- Choral Justaucorps
            13970,priceAF3, -- Choral Cuffs
            14223,priceAF3, -- Choral Cannions
            14098,priceAF3, -- Choral Slippers
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

        elseif(player:getMainJob() == xi.job.RNG) then -- RNG
        local stock =
        {
            -- AF1
            11998,priceAF1, -- Hunter's Torque
            17188,priceAF2, -- Sniping Bow
            12518,priceAF3, -- Hunter's Beret
            12648,priceAF3, -- Hunter's Jerkin
            13971,priceAF3, -- Hunter's Bracers
            14224,priceAF3, -- Hunter's Braccae
            14099,priceAF3, -- Hunter's Socks
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.SAM) then -- SAM
        local stock =
        {
            11999,priceAF1, -- Myochin Torque
            17812,priceAF2, -- Magoroku
            13868,priceAF3, -- Myochin Kabuto
            13781,priceAF3, -- Myochin Domaru
            13972,priceAF3, -- Myochin Kote
            14225,priceAF3, -- Myochin Haidate
            14100,priceAF3, -- Myochin Sune-Ate
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.NIN) then -- NIN
        local stock =
        {
            -- AF1
            12000,priceAF1, -- Ninja Shusa
            17771,priceAF2, -- Anju
            17772,priceAF2, -- Zushio
            13869,priceAF3, -- Ninja Hatsuburi
            13782,priceAF3, -- Ninja Chainmail
            13973,priceAF3, -- Ninja Tekko
            14226,priceAF3, -- Ninja Hakama
            14101,priceAF3, -- Ninja Kyahan
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.DRG) then -- DRG
        local stock =
        {
            -- AF1
            12001,priceAF1, -- Drachen Torque
            16887,priceAF2, -- Peregrine
            12519,priceAF3, -- Drachen Armet
            12649,priceAF3, -- Drachen Mail
            13974,priceAF3, -- Drachen Finger Gauntlets
            14227,priceAF3, -- Drachen Brais
            14102,priceAF3, -- Drachen Greaves
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.SMN) then -- SMN
        local stock =
        {
            -- AF1
            12002,priceAF1, -- Evoker's Torque
            17532,priceAF2, -- Kukulcan's Staff
            12520,priceAF3, -- Evoker's Horn
            12650,priceAF3, -- Evoker's Doublet
            13975,priceAF3, -- Evoker's Bracers
            14228,priceAF3, -- Evoker's Spats
            14103,priceAF3, -- Evoker's Pigaches
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.BLU) then -- BLU
        local stock =
        {
            -- AF1
            12003,priceAF1, -- Magus Torque
            17717,priceAF2, -- Immortal's Scimitar
            15265,priceAF3, -- Magus Keffiyeh
            14521,priceAF3, -- Magus Jubbah
            14928,priceAF3, -- Magus Bazubands
            15600,priceAF3, -- Magus Shalwar
            15684,priceAF3, -- Magus Charuqs
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.COR) then -- COR
        local stock =
        {
            -- AF1
            12004,priceAF1, -- Corsair's Torque
            18702,priceAF2, -- Trump Gun
            15266,priceAF3, -- Corsair's Tricorne
            14522,priceAF3, -- Corsair's Frac
            14929,priceAF3, -- Corsair's Gants
            15601,priceAF3, -- Corsair's Culottes
            15685,priceAF3, -- Corsair's Bottes
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.PUP) then -- PUP
        local stock =
        {
        -- AF1
            12005,priceAF1, -- Puppetry Torque
            17858,priceAF2, -- Turbo Animator
            15267,priceAF3, -- Puppetry Taj
            14523,priceAF3, -- Puppetry Tobe
            14930,priceAF3, -- Puppetry Dastanas
            15602,priceAF3, -- Puppetry Churidars
            15686,priceAF3, -- Puppetry Babouches
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.DNC) then -- DNC
        local stock =
        {
            -- AF1 Male
            12006,priceAF1, -- Dancer's Torque
            19203,priceAF2, -- War Hoop
            16138,priceAF3, -- Dancer's Tiara
            14578,priceAF3, -- Dancer's Casaque
            15002,priceAF3, -- Dancer's Bangles
            15659,priceAF3, -- Dancer's Tights
            15746,priceAF3, -- Dancer's Shoes
            -- AF1 Female
            16139,priceAF3, -- Dancer's Tiara
            14579,priceAF3, -- Dancer's Casaque
            15003,priceAF3, -- Dancer's Bangles
            15660,priceAF3, -- Dancer's Tights
            15747,priceAF3, -- Dancer's Shoes
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.SCH) then -- SCH
        local stock =
        {
            -- AF1
            12007,priceAF1, -- Scholar's Torque
            6058,priceAF2, -- Klimaform
            16140,priceAF3, -- Scholar's Mortarboard
            14580,priceAF3, -- Scholar's Gown
            15004,priceAF3, -- Scholar's Bracers
            16311,priceAF3, -- Scholar's Pants
            15748,priceAF3, -- Scholar's Loafers
			-- AF1 +1
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			00000,priceAFP1, -- Name
			-- AF1 Reforged
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			00000,priceReAF, -- Name
			-- AF1 Reforged +1
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			00000,priceReAFP1, -- Name
			-- AF1 Reforged +2
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			00000,priceReAFP2, -- Name
			-- AF1 Reforged +3
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			00000,priceReAFP3, -- Name
			-- Relic
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			00000,priceRelic, -- Name
			-- Relic +1
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			00000,priceRelicP1, -- Name
			-- Relic +2
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			00000,priceRelicP2, -- Name
			-- Relic Reforged
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			00000,priceReRelic, -- Name
			-- Relic Reforged +1
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			00000,priceReRelicP1, -- Name
			-- Relic Reforged +2
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			00000,priceReRelicP2, -- Name
			-- Relic Reforged +3
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			00000,priceReRelicP3, -- Name
			-- Empyrean
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			00000,priceEmp, -- Name
			-- Empyrean +1
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			00000,priceEmpP1, -- Name
			-- Empyrean +2
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			00000,priceEmpP2, -- Name
			-- Empyrean Reforged
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			00000,priceReEmp, -- Name
			-- Empyrean Reforged +1
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			00000,priceReEmpP1, -- Name
			-- Empyrean Reforged +2
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			00000,priceReEmpP2, -- Name
			-- Empyrean Reforged +3
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			00000,priceReEmpP3, -- Name
			-- Ultimate Weapons (REAM)
			00000,priceRelicWp, -- Name
			00000,priceMythicWp, -- Name
			00000,priceEmpWp, -- Name
			00000,priceAeonWp, -- Name
        }
        xi.shop.general(player, stock);

    elseif(player:getMainJob() == xi.job.GEO) then -- GEO
        error(player, 'No content for GEO.');
		return;
    elseif(player:getMainJob() == xi.job.RUN) then -- RUN
        error(player, 'No content for RUN');
		return;
    end
end

return commandObj