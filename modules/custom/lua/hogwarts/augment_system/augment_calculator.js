<script>
(function waitForAugmentPlannerRoot() {
  const root = document.getElementById("augment-planner-root");

  if (!root) {
    setTimeout(waitForAugmentPlannerRoot, 100);
    return;
  }

  const MAX_RANK = 5;
  const AUGMENTS_PER_SLOT = 4;
  const STORAGE_KEY = "hogwartsAugmentPlannerBuildV1";

  const GEAR_SLOTS = [
    "Main", "Sub", "Ranged", "Ammo",
    "Head", "Neck", "Ear 1", "Ear 2",
    "Body", "Hands", "Ring 1", "Ring 2",
    "Back", "Waist", "Legs", "Feet"
  ];

  const AUGMENTS = [
  {
    "id": "t0_m856_a68_q2",
    "materialItemID": 856,
    "augmentID": 68,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Rabbit Hide",
    "rank": 0,
    "name": "Accuracy/Attack +1",
    "description": "Accuracy/Attack +1"
  },
  {
    "id": "t0_m922_a69_q2",
    "materialItemID": 922,
    "augmentID": 69,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Bat Wing",
    "rank": 0,
    "name": "Ranged Accuracy/Ranged Attack +1",
    "description": "Ranged Accuracy/Ranged Attack +1"
  },
  {
    "id": "t0_m912_a134_q2",
    "materialItemID": 912,
    "augmentID": 134,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Beehive Chip",
    "rank": 0,
    "name": "Magic Defense Bonus +1",
    "description": "Magic Defense Bonus +1"
  },
  {
    "id": "t0_m768_a131_q2",
    "materialItemID": 768,
    "augmentID": 131,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Flint Stone",
    "rank": 0,
    "name": "Magic Accuracy/Magic Attack Bonus +1",
    "description": "Magic Accuracy/Magic Attack Bonus +1"
  },
  {
    "id": "t0_m839_a33_q2",
    "materialItemID": 839,
    "augmentID": 33,
    "requiredQty": 2,
    "power": 2,
    "materialName": "Crawler Cocoon",
    "rank": 0,
    "name": "Defense +3",
    "description": "Defense +3"
  },
  {
    "id": "t0_m846_a142_q2",
    "materialItemID": 846,
    "augmentID": 142,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Insect Wing",
    "rank": 0,
    "name": "Store TP +1",
    "description": "Store TP +1"
  },
  {
    "id": "t0_m847_a195_q2",
    "materialItemID": 847,
    "augmentID": 195,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Bird Feather",
    "rank": 0,
    "name": "Subtle Blow +1",
    "description": "Subtle Blow +1"
  },
  {
    "id": "t0_m852_a140_q2",
    "materialItemID": 852,
    "augmentID": 140,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Lizard Skin",
    "rank": 0,
    "name": "Fast Cast +1%",
    "description": "Fast Cast +1%"
  },
  {
    "id": "t0_m889_a31_q2",
    "materialItemID": 889,
    "augmentID": 31,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Beetle Shell",
    "rank": 0,
    "name": "Evasion +1",
    "description": "Evasion +1"
  },
  {
    "id": "t0_m4096_a512_q1",
    "materialItemID": 4096,
    "augmentID": 512,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Fire Crystal",
    "rank": 0,
    "name": "STR +1",
    "description": "STR +1"
  },
  {
    "id": "t0_m4097_a516_q1",
    "materialItemID": 4097,
    "augmentID": 516,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Ice Crystal",
    "rank": 0,
    "name": "INT +1",
    "description": "INT +1"
  },
  {
    "id": "t0_m4098_a515_q1",
    "materialItemID": 4098,
    "augmentID": 515,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Wind Crystal",
    "rank": 0,
    "name": "AGI +1",
    "description": "AGI +1"
  },
  {
    "id": "t0_m4099_a514_q1",
    "materialItemID": 4099,
    "augmentID": 514,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Earth Crystal",
    "rank": 0,
    "name": "VIT +1",
    "description": "VIT +1"
  },
  {
    "id": "t0_m4100_a513_q1",
    "materialItemID": 4100,
    "augmentID": 513,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Lightning Crystal",
    "rank": 0,
    "name": "DEX +1",
    "description": "DEX +1"
  },
  {
    "id": "t0_m4101_a517_q1",
    "materialItemID": 4101,
    "augmentID": 517,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Water Crystal",
    "rank": 0,
    "name": "MND +1",
    "description": "MND +1"
  },
  {
    "id": "t0_m4102_a518_q1",
    "materialItemID": 4102,
    "augmentID": 518,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Light Crystal",
    "rank": 0,
    "name": "CHR +1",
    "description": "CHR +1"
  },
  {
    "id": "t0_m4103_a17_q1",
    "materialItemID": 4103,
    "augmentID": 17,
    "requiredQty": 1,
    "power": 3,
    "materialName": "Dark Crystal",
    "rank": 0,
    "name": "HP/MP +4",
    "description": "HP/MP +4"
  },
  {
    "id": "t0_m895_a796_q1",
    "materialItemID": 895,
    "augmentID": 796,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Ram Horn",
    "rank": 0,
    "name": "All Elemental Resist +1",
    "description": "All Elemental Resist +1"
  },
  {
    "id": "t0_m859_a137_q1",
    "materialItemID": 859,
    "augmentID": 137,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Ram Skin",
    "rank": 0,
    "name": "Regen +1",
    "description": "Regen +1"
  },
  {
    "id": "t0_m627_a362_q2",
    "materialItemID": 627,
    "augmentID": 362,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Maple Sugar",
    "rank": 0,
    "name": "Magic Damage +1",
    "description": "Magic Damage +1"
  },
  {
    "id": "t1_m856_a68_q7",
    "materialItemID": 856,
    "augmentID": 68,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Rabbit Hide",
    "rank": 1,
    "name": "Accuracy/Attack +3",
    "description": "Accuracy/Attack +3"
  },
  {
    "id": "t1_m922_a69_q7",
    "materialItemID": 922,
    "augmentID": 69,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Bat Wing",
    "rank": 1,
    "name": "Ranged Accuracy/Ranged Attack +3",
    "description": "Ranged Accuracy/Ranged Attack +3"
  },
  {
    "id": "t1_m912_a134_q7",
    "materialItemID": 912,
    "augmentID": 134,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Beehive Chip",
    "rank": 1,
    "name": "Magic Defense Bonus +2",
    "description": "Magic Defense Bonus +2"
  },
  {
    "id": "t1_m768_a131_q7",
    "materialItemID": 768,
    "augmentID": 131,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Flint Stone",
    "rank": 1,
    "name": "Magic Accuracy/Magic Attack Bonus +3",
    "description": "Magic Accuracy/Magic Attack Bonus +3"
  },
  {
    "id": "t1_m839_a33_q7",
    "materialItemID": 839,
    "augmentID": 33,
    "requiredQty": 7,
    "power": 8,
    "materialName": "Crawler Cocoon",
    "rank": 1,
    "name": "Defense +9",
    "description": "Defense +9"
  },
  {
    "id": "t1_m846_a142_q7",
    "materialItemID": 846,
    "augmentID": 142,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Insect Wing",
    "rank": 1,
    "name": "Store TP +3",
    "description": "Store TP +3"
  },
  {
    "id": "t1_m847_a195_q7",
    "materialItemID": 847,
    "augmentID": 195,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Bird Feather",
    "rank": 1,
    "name": "Subtle Blow +3",
    "description": "Subtle Blow +3"
  },
  {
    "id": "t1_m852_a140_q7",
    "materialItemID": 852,
    "augmentID": 140,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Lizard Skin",
    "rank": 1,
    "name": "Fast Cast +3%",
    "description": "Fast Cast +3%"
  },
  {
    "id": "t1_m889_a31_q7",
    "materialItemID": 889,
    "augmentID": 31,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Beetle Shell",
    "rank": 1,
    "name": "Evasion +3",
    "description": "Evasion +3"
  },
  {
    "id": "t1_m4096_a512_q7",
    "materialItemID": 4096,
    "augmentID": 512,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Fire Crystal",
    "rank": 1,
    "name": "STR +2",
    "description": "STR +2"
  },
  {
    "id": "t1_m4097_a516_q7",
    "materialItemID": 4097,
    "augmentID": 516,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Ice Crystal",
    "rank": 1,
    "name": "INT +2",
    "description": "INT +2"
  },
  {
    "id": "t1_m4098_a515_q7",
    "materialItemID": 4098,
    "augmentID": 515,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Wind Crystal",
    "rank": 1,
    "name": "AGI +2",
    "description": "AGI +2"
  },
  {
    "id": "t1_m4099_a514_q7",
    "materialItemID": 4099,
    "augmentID": 514,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Earth Crystal",
    "rank": 1,
    "name": "VIT +2",
    "description": "VIT +2"
  },
  {
    "id": "t1_m4100_a513_q7",
    "materialItemID": 4100,
    "augmentID": 513,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Lightning Crystal",
    "rank": 1,
    "name": "DEX +2",
    "description": "DEX +2"
  },
  {
    "id": "t1_m4101_a517_q7",
    "materialItemID": 4101,
    "augmentID": 517,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Water Crystal",
    "rank": 1,
    "name": "MND +2",
    "description": "MND +2"
  },
  {
    "id": "t1_m4102_a518_q7",
    "materialItemID": 4102,
    "augmentID": 518,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Light Crystal",
    "rank": 1,
    "name": "CHR +2",
    "description": "CHR +2"
  },
  {
    "id": "t1_m4103_a17_q7",
    "materialItemID": 4103,
    "augmentID": 17,
    "requiredQty": 7,
    "power": 7,
    "materialName": "Dark Crystal",
    "rank": 1,
    "name": "HP/MP +8",
    "description": "HP/MP +8"
  },
  {
    "id": "t1_m895_a796_q7",
    "materialItemID": 895,
    "augmentID": 796,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Ram Horn",
    "rank": 1,
    "name": "All Elemental Resist +3",
    "description": "All Elemental Resist +3"
  },
  {
    "id": "t1_m859_a137_q7",
    "materialItemID": 859,
    "augmentID": 137,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Ram Skin",
    "rank": 1,
    "name": "Regen +2",
    "description": "Regen +2"
  },
  {
    "id": "t1_m841_a41_q7",
    "materialItemID": 841,
    "augmentID": 41,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Yagudo Feather",
    "rank": 1,
    "name": "Critical Hit Chance +1%",
    "description": "Critical Hit Chance +1%"
  },
  {
    "id": "t1_m505_a40_q7",
    "materialItemID": 505,
    "augmentID": 40,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Sheepskin",
    "rank": 1,
    "name": "Enmity -3",
    "description": "Enmity -3"
  },
  {
    "id": "t1_m560_a143_q7",
    "materialItemID": 560,
    "augmentID": 143,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Zeruhn Soot",
    "rank": 1,
    "name": "Double Attack +2%",
    "description": "Double Attack +2%"
  },
  {
    "id": "t1_m4370_a362_q2",
    "materialItemID": 4370,
    "augmentID": 362,
    "requiredQty": 2,
    "power": 2,
    "materialName": "Honey",
    "rank": 1,
    "name": "Magic Damage +3",
    "description": "Magic Damage +3"
  },
  {
    "id": "t1_m4374_a329_q2",
    "materialItemID": 4374,
    "augmentID": 329,
    "requiredQty": 2,
    "power": 2,
    "materialName": "Sleepshroom",
    "rank": 1,
    "name": "Cure Potency +2%",
    "description": "Cure Potency +2%"
  },
  {
    "id": "t1_m884_a194_q2",
    "materialItemID": 884,
    "augmentID": 194,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Black Tiger Fang",
    "rank": 1,
    "name": "Kick Attacks +1",
    "description": "Kick Attacks +1"
  },
  {
    "id": "t1_m501_a151_q2",
    "materialItemID": 501,
    "augmentID": 151,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Quadav Helm",
    "rank": 1,
    "name": "Martial Arts +1",
    "description": "Martial Arts +1"
  },
  {
    "id": "t1_m953_a146_q2",
    "materialItemID": 953,
    "augmentID": 146,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Treant Bulb",
    "rank": 1,
    "name": "Dual Wield +1",
    "description": "Dual Wield +1"
  },
  {
    "id": "t1_m858_a39_q2",
    "materialItemID": 858,
    "augmentID": 39,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Wolf Hide",
    "rank": 1,
    "name": "Enmity +3",
    "description": "Enmity +3"
  },
  {
    "id": "t1_m4373_a145_q2",
    "materialItemID": 4373,
    "augmentID": 145,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Woozyshroom",
    "rank": 1,
    "name": "Counter +1",
    "description": "Counter +1"
  },
  {
    "id": "t1_m1016_a139_q2",
    "materialItemID": 1016,
    "augmentID": 139,
    "requiredQty": 2,
    "power": 2,
    "materialName": "Remi Shell",
    "rank": 1,
    "name": "Rapid Shot +3%",
    "description": "Rapid Shot +3%"
  },
  {
    "id": "t1_m498_a363_q2",
    "materialItemID": 498,
    "augmentID": 363,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Yagudo Bead Necklace",
    "rank": 1,
    "name": "Block Rate +1",
    "description": "Block Rate +1"
  },
  {
    "id": "t1_m4387_a1472_q2",
    "materialItemID": 4387,
    "augmentID": 1472,
    "requiredQty": 2,
    "power": 0,
    "materialName": "Wild Onion",
    "rank": 1,
    "name": "Parry Rate +1",
    "description": "Parry Rate +1"
  },
  {
    "id": "t2_m856_a68_q12",
    "materialItemID": 856,
    "augmentID": 68,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Rabbit Hide",
    "rank": 2,
    "name": "Accuracy/Attack +5",
    "description": "Accuracy/Attack +5"
  },
  {
    "id": "t2_m922_a69_q12",
    "materialItemID": 922,
    "augmentID": 69,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Bat Wing",
    "rank": 2,
    "name": "Ranged Accuracy/Ranged Attack +5",
    "description": "Ranged Accuracy/Ranged Attack +5"
  },
  {
    "id": "t2_m912_a134_q12",
    "materialItemID": 912,
    "augmentID": 134,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Beehive Chip",
    "rank": 2,
    "name": "Magic Defense Bonus +3",
    "description": "Magic Defense Bonus +3"
  },
  {
    "id": "t2_m768_a131_q12",
    "materialItemID": 768,
    "augmentID": 131,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Flint Stone",
    "rank": 2,
    "name": "Magic Accuracy/Magic Attack Bonus +5",
    "description": "Magic Accuracy/Magic Attack Bonus +5"
  },
  {
    "id": "t2_m839_a33_q12",
    "materialItemID": 839,
    "augmentID": 33,
    "requiredQty": 12,
    "power": 14,
    "materialName": "Crawler Cocoon",
    "rank": 2,
    "name": "Defense +15",
    "description": "Defense +15"
  },
  {
    "id": "t2_m846_a142_q12",
    "materialItemID": 846,
    "augmentID": 142,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Insect Wing",
    "rank": 2,
    "name": "Store TP +5",
    "description": "Store TP +5"
  },
  {
    "id": "t2_m847_a195_q12",
    "materialItemID": 847,
    "augmentID": 195,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Bird Feather",
    "rank": 2,
    "name": "Subtle Blow +5",
    "description": "Subtle Blow +5"
  },
  {
    "id": "t2_m852_a140_q12",
    "materialItemID": 852,
    "augmentID": 140,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Lizard Skin",
    "rank": 2,
    "name": "Fast Cast +5%",
    "description": "Fast Cast +5%"
  },
  {
    "id": "t2_m889_a31_q12",
    "materialItemID": 889,
    "augmentID": 31,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Beetle Shell",
    "rank": 2,
    "name": "Evasion +5",
    "description": "Evasion +5"
  },
  {
    "id": "t2_m4104_a512_q1",
    "materialItemID": 4104,
    "augmentID": 512,
    "requiredQty": 1,
    "power": 2,
    "materialName": "Fire Cluster",
    "rank": 2,
    "name": "STR +3",
    "description": "STR +3"
  },
  {
    "id": "t2_m4105_a516_q1",
    "materialItemID": 4105,
    "augmentID": 516,
    "requiredQty": 1,
    "power": 2,
    "materialName": "Ice Cluster",
    "rank": 2,
    "name": "INT +3",
    "description": "INT +3"
  },
  {
    "id": "t2_m4106_a515_q1",
    "materialItemID": 4106,
    "augmentID": 515,
    "requiredQty": 1,
    "power": 2,
    "materialName": "Wind Cluster",
    "rank": 2,
    "name": "AGI +3",
    "description": "AGI +3"
  },
  {
    "id": "t2_m4107_a514_q1",
    "materialItemID": 4107,
    "augmentID": 514,
    "requiredQty": 1,
    "power": 2,
    "materialName": "Earth Cluster",
    "rank": 2,
    "name": "VIT +3",
    "description": "VIT +3"
  },
  {
    "id": "t2_m4108_a513_q1",
    "materialItemID": 4108,
    "augmentID": 513,
    "requiredQty": 1,
    "power": 2,
    "materialName": "Lightning Cluster",
    "rank": 2,
    "name": "DEX +3",
    "description": "DEX +3"
  },
  {
    "id": "t2_m4109_a517_q1",
    "materialItemID": 4109,
    "augmentID": 517,
    "requiredQty": 1,
    "power": 2,
    "materialName": "Water Cluster",
    "rank": 2,
    "name": "MND +3",
    "description": "MND +3"
  },
  {
    "id": "t2_m4110_a518_q1",
    "materialItemID": 4110,
    "augmentID": 518,
    "requiredQty": 1,
    "power": 2,
    "materialName": "Light Cluster",
    "rank": 2,
    "name": "CHR +3",
    "description": "CHR +3"
  },
  {
    "id": "t2_m4111_a17_q1",
    "materialItemID": 4111,
    "augmentID": 17,
    "requiredQty": 1,
    "power": 11,
    "materialName": "Dark Cluster",
    "rank": 2,
    "name": "HP/MP +12",
    "description": "HP/MP +12"
  },
  {
    "id": "t2_m895_a796_q12",
    "materialItemID": 895,
    "augmentID": 796,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Ram Horn",
    "rank": 2,
    "name": "All Elemental Resist +5",
    "description": "All Elemental Resist +5"
  },
  {
    "id": "t2_m859_a137_q12",
    "materialItemID": 859,
    "augmentID": 137,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Ram Skin",
    "rank": 2,
    "name": "Regen +3",
    "description": "Regen +3"
  },
  {
    "id": "t2_m841_a41_q12",
    "materialItemID": 841,
    "augmentID": 41,
    "requiredQty": 12,
    "power": 1,
    "materialName": "Yagudo Feather",
    "rank": 2,
    "name": "Critical Hit Chance +2%",
    "description": "Critical Hit Chance +2%"
  },
  {
    "id": "t2_m505_a40_q12",
    "materialItemID": 505,
    "augmentID": 40,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Sheepskin",
    "rank": 2,
    "name": "Enmity -5",
    "description": "Enmity -5"
  },
  {
    "id": "t2_m560_a143_q12",
    "materialItemID": 560,
    "augmentID": 143,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Zeruhn Soot",
    "rank": 2,
    "name": "Double Attack +3%",
    "description": "Double Attack +3%"
  },
  {
    "id": "t2_m4370_a362_q12",
    "materialItemID": 4370,
    "augmentID": 362,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Honey",
    "rank": 2,
    "name": "Magic Damage +5",
    "description": "Magic Damage +5"
  },
  {
    "id": "t2_m4374_a329_q12",
    "materialItemID": 4374,
    "augmentID": 329,
    "requiredQty": 12,
    "power": 3,
    "materialName": "Sleepshroom",
    "rank": 2,
    "name": "Cure Potency +4%",
    "description": "Cure Potency +4%"
  },
  {
    "id": "t2_m884_a194_q12",
    "materialItemID": 884,
    "augmentID": 194,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Black Tiger Fang",
    "rank": 2,
    "name": "Kick Attacks +3",
    "description": "Kick Attacks +3"
  },
  {
    "id": "t2_m501_a151_q12",
    "materialItemID": 501,
    "augmentID": 151,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Quadav Helm",
    "rank": 2,
    "name": "Martial Arts +3",
    "description": "Martial Arts +3"
  },
  {
    "id": "t2_m953_a146_q12",
    "materialItemID": 953,
    "augmentID": 146,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Treant Bulb",
    "rank": 2,
    "name": "Dual Wield +3",
    "description": "Dual Wield +3"
  },
  {
    "id": "t2_m858_a39_q12",
    "materialItemID": 858,
    "augmentID": 39,
    "requiredQty": 12,
    "power": 4,
    "materialName": "Wolf Hide",
    "rank": 2,
    "name": "Enmity +5",
    "description": "Enmity +5"
  },
  {
    "id": "t2_m4373_a145_q12",
    "materialItemID": 4373,
    "augmentID": 145,
    "requiredQty": 12,
    "power": 1,
    "materialName": "Woozyshroom",
    "rank": 2,
    "name": "Counter +2",
    "description": "Counter +2"
  },
  {
    "id": "t2_m1016_a139_q12",
    "materialItemID": 1016,
    "augmentID": 139,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Remi Shell",
    "rank": 2,
    "name": "Rapid Shot +6%",
    "description": "Rapid Shot +6%"
  },
  {
    "id": "t2_m498_a363_q12",
    "materialItemID": 498,
    "augmentID": 363,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Yagudo Bead Necklace",
    "rank": 2,
    "name": "Block Rate +3",
    "description": "Block Rate +3"
  },
  {
    "id": "t2_m4387_a1472_q12",
    "materialItemID": 4387,
    "augmentID": 1472,
    "requiredQty": 12,
    "power": 2,
    "materialName": "Wild Onion",
    "rank": 2,
    "name": "Parry Rate +3",
    "description": "Parry Rate +3"
  },
  {
    "id": "t2_m4368_a138_q12",
    "materialItemID": 4368,
    "augmentID": 138,
    "requiredQty": 12,
    "power": 0,
    "materialName": "Two-Leaf Mandragora Bud",
    "rank": 2,
    "name": "Refresh +1",
    "description": "Refresh +1"
  },
  {
    "id": "t2_m1126_a353_q3",
    "materialItemID": 1126,
    "augmentID": 353,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Beastmen Seal",
    "rank": 2,
    "name": "Critical Damage +1%",
    "description": "Critical Damage +1%"
  },
  {
    "id": "t3_m940_a68_q3",
    "materialItemID": 940,
    "augmentID": 68,
    "requiredQty": 3,
    "power": 6,
    "materialName": "Revival Root",
    "rank": 3,
    "name": "Accuracy/Attack +7",
    "description": "Accuracy/Attack +7"
  },
  {
    "id": "t3_m955_a69_q3",
    "materialItemID": 955,
    "augmentID": 69,
    "requiredQty": 3,
    "power": 6,
    "materialName": "Golem Shard",
    "rank": 3,
    "name": "Ranged Accuracy/Ranged Attack +7",
    "description": "Ranged Accuracy/Ranged Attack +7"
  },
  {
    "id": "t3_m1165_a134_q3",
    "materialItemID": 1165,
    "augmentID": 134,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Doll Shard",
    "rank": 3,
    "name": "Magic Defense Bonus +4",
    "description": "Magic Defense Bonus +4"
  },
  {
    "id": "t3_m954_a131_q3",
    "materialItemID": 954,
    "augmentID": 131,
    "requiredQty": 3,
    "power": 6,
    "materialName": "Magic Pot Shard",
    "rank": 3,
    "name": "Magic Accuracy/Magic Attack Bonus +7",
    "description": "Magic Accuracy/Magic Attack Bonus +7"
  },
  {
    "id": "t3_m857_a33_q3",
    "materialItemID": 857,
    "augmentID": 33,
    "requiredQty": 3,
    "power": 20,
    "materialName": "Dhalmel Hide",
    "rank": 3,
    "name": "Defense +21",
    "description": "Defense +21"
  },
  {
    "id": "t3_m928_a143_q3",
    "materialItemID": 928,
    "augmentID": 143,
    "requiredQty": 3,
    "power": 4,
    "materialName": "Bomb Ash",
    "rank": 3,
    "name": "Double Attack +5%",
    "description": "Double Attack +5%"
  },
  {
    "id": "t3_m920_a362_q3",
    "materialItemID": 920,
    "augmentID": 362,
    "requiredQty": 3,
    "power": 6,
    "materialName": "Malboro Vine",
    "rank": 3,
    "name": "Magic Damage +7",
    "description": "Magic Damage +7"
  },
  {
    "id": "t3_m894_a140_q3",
    "materialItemID": 894,
    "augmentID": 140,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Beetle Jaw",
    "rank": 3,
    "name": "Fast Cast +8%",
    "description": "Fast Cast +8%"
  },
  {
    "id": "t3_m1118_a31_q3",
    "materialItemID": 1118,
    "augmentID": 31,
    "requiredQty": 3,
    "power": 6,
    "materialName": "Antican Pauldron",
    "rank": 3,
    "name": "Evasion +7",
    "description": "Evasion +7"
  },
  {
    "id": "t3_m1121_a896_q3",
    "materialItemID": 1121,
    "augmentID": 896,
    "requiredQty": 3,
    "power": 1,
    "materialName": "Antican Robe",
    "rank": 3,
    "name": "Enspell Damage +2",
    "description": "Enspell Damage +2"
  },
  {
    "id": "t3_m938_a53_q3",
    "materialItemID": 938,
    "augmentID": 53,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Papaka Grass",
    "rank": 3,
    "name": "Spell Interruption Rate -8%",
    "description": "Spell Interruption Rate -8%"
  },
  {
    "id": "t3_m893_a54_q3",
    "materialItemID": 893,
    "augmentID": 54,
    "requiredQty": 3,
    "power": 1,
    "materialName": "Giant Femur",
    "rank": 3,
    "name": "Physical Damage Taken -2%",
    "description": "Physical Damage Taken -2%"
  },
  {
    "id": "t3_m1985_a55_q3",
    "materialItemID": 1985,
    "augmentID": 55,
    "requiredQty": 3,
    "power": 1,
    "materialName": "Helmet Mole",
    "rank": 3,
    "name": "Magic Damage Taken -2%",
    "description": "Magic Damage Taken -2%"
  },
  {
    "id": "t3_m1836_a37_q1",
    "materialItemID": 1836,
    "augmentID": 37,
    "requiredQty": 1,
    "power": 4,
    "materialName": "Marble",
    "rank": 3,
    "name": "Magic Evasion +5",
    "description": "Magic Evasion +5"
  },
  {
    "id": "t3_m2539_a198_q3",
    "materialItemID": 2539,
    "augmentID": 198,
    "requiredQty": 3,
    "power": 1,
    "materialName": "Dhalmel Hair",
    "rank": 3,
    "name": "Zanshin +2%",
    "description": "Zanshin +2%"
  },
  {
    "id": "t3_m838_a49_q3",
    "materialItemID": 838,
    "augmentID": 49,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Spider Web",
    "rank": 3,
    "name": "Haste +1%",
    "description": "Haste +1%"
  },
  {
    "id": "t3_m1154_a144_q3",
    "materialItemID": 1154,
    "augmentID": 144,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Three-Leaf Mandragora Bud",
    "rank": 3,
    "name": "Triple Attack +1%",
    "description": "Triple Attack +1%"
  },
  {
    "id": "t3_m568_a148_q1",
    "materialItemID": 568,
    "augmentID": 148,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Goblin Die",
    "rank": 3,
    "name": "Gilfinder +1",
    "description": "Gilfinder +1"
  },
  {
    "id": "t3_m4104_a512_q3",
    "materialItemID": 4104,
    "augmentID": 512,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Fire Cluster",
    "rank": 3,
    "name": "STR +4",
    "description": "STR +4"
  },
  {
    "id": "t3_m4105_a516_q3",
    "materialItemID": 4105,
    "augmentID": 516,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Ice Cluster",
    "rank": 3,
    "name": "INT +4",
    "description": "INT +4"
  },
  {
    "id": "t3_m4106_a515_q3",
    "materialItemID": 4106,
    "augmentID": 515,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Wind Cluster",
    "rank": 3,
    "name": "AGI +4",
    "description": "AGI +4"
  },
  {
    "id": "t3_m4107_a514_q3",
    "materialItemID": 4107,
    "augmentID": 514,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Earth Cluster",
    "rank": 3,
    "name": "VIT +4",
    "description": "VIT +4"
  },
  {
    "id": "t3_m4108_a513_q3",
    "materialItemID": 4108,
    "augmentID": 513,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Lightning Cluster",
    "rank": 3,
    "name": "DEX +4",
    "description": "DEX +4"
  },
  {
    "id": "t3_m4109_a517_q3",
    "materialItemID": 4109,
    "augmentID": 517,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Water Cluster",
    "rank": 3,
    "name": "MND +4",
    "description": "MND +4"
  },
  {
    "id": "t3_m4110_a518_q3",
    "materialItemID": 4110,
    "augmentID": 518,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Light Cluster",
    "rank": 3,
    "name": "CHR +4",
    "description": "CHR +4"
  },
  {
    "id": "t3_m4111_a17_q3",
    "materialItemID": 4111,
    "augmentID": 17,
    "requiredQty": 3,
    "power": 15,
    "materialName": "Dark Cluster",
    "rank": 3,
    "name": "HP/MP +16",
    "description": "HP/MP +16"
  },
  {
    "id": "t3_m873_a928_q1",
    "materialItemID": 873,
    "augmentID": 928,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Red Chip",
    "rank": 3,
    "name": "Fire Affinity +1",
    "description": "Fire Affinity +1"
  },
  {
    "id": "t3_m475_a933_q1",
    "materialItemID": 475,
    "augmentID": 933,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Blue Chip",
    "rank": 3,
    "name": "Water Affinity +1",
    "description": "Water Affinity +1"
  },
  {
    "id": "t3_m476_a931_q1",
    "materialItemID": 476,
    "augmentID": 931,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Yellow Chip",
    "rank": 3,
    "name": "Earth Affinity +1",
    "description": "Earth Affinity +1"
  },
  {
    "id": "t3_m477_a930_q1",
    "materialItemID": 477,
    "augmentID": 930,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Green Chip",
    "rank": 3,
    "name": "Wind Affinity +1",
    "description": "Wind Affinity +1"
  },
  {
    "id": "t3_m478_a929_q1",
    "materialItemID": 478,
    "augmentID": 929,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Clear Chip",
    "rank": 3,
    "name": "Ice Affinity +1",
    "description": "Ice Affinity +1"
  },
  {
    "id": "t3_m479_a932_q1",
    "materialItemID": 479,
    "augmentID": 932,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Purple Chip",
    "rank": 3,
    "name": "Lightning Affinity +1",
    "description": "Lightning Affinity +1"
  },
  {
    "id": "t3_m480_a934_q1",
    "materialItemID": 480,
    "augmentID": 934,
    "requiredQty": 1,
    "power": 0,
    "materialName": "White Chip",
    "rank": 3,
    "name": "Light Affinity +1",
    "description": "Light Affinity +1"
  },
  {
    "id": "t3_m481_a935_q1",
    "materialItemID": 481,
    "augmentID": 935,
    "requiredQty": 1,
    "power": 0,
    "materialName": "Black Chip",
    "rank": 3,
    "name": "Dark Affinity +1",
    "description": "Dark Affinity +1"
  },
  {
    "id": "t3_m772_a294_q3",
    "materialItemID": 772,
    "augmentID": 294,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Green Rock",
    "rank": 3,
    "name": "Summoning Magic Skill +4",
    "description": "Summoning Magic Skill +4"
  },
  {
    "id": "t3_m769_a291_q3",
    "materialItemID": 769,
    "augmentID": 291,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Red Rock",
    "rank": 3,
    "name": "Enfeebling Magic Skill +4",
    "description": "Enfeebling Magic Skill +4"
  },
  {
    "id": "t3_m770_a299_q3",
    "materialItemID": 770,
    "augmentID": 299,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Blue Rock",
    "rank": 3,
    "name": "Blue Magic Skill +4",
    "description": "Blue Magic Skill +4"
  },
  {
    "id": "t3_m774_a290_q3",
    "materialItemID": 774,
    "augmentID": 290,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Purple Rock",
    "rank": 3,
    "name": "Enhancing Magic Skill +4",
    "description": "Enhancing Magic Skill +4"
  },
  {
    "id": "t3_m771_a289_q3",
    "materialItemID": 771,
    "augmentID": 289,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Yellow Rock",
    "rank": 3,
    "name": "Healing Magic Skill +4",
    "description": "Healing Magic Skill +4"
  },
  {
    "id": "t3_m773_a292_q3",
    "materialItemID": 773,
    "augmentID": 292,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Translucent Rock",
    "rank": 3,
    "name": "Elemental Magic Skill +4",
    "description": "Elemental Magic Skill +4"
  },
  {
    "id": "t3_m775_a293_q3",
    "materialItemID": 775,
    "augmentID": 293,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Black Rock",
    "rank": 3,
    "name": "Dark Magic Skill +4",
    "description": "Dark Magic Skill +4"
  },
  {
    "id": "t3_m776_a288_q3",
    "materialItemID": 776,
    "augmentID": 288,
    "requiredQty": 3,
    "power": 3,
    "materialName": "White Rock",
    "rank": 3,
    "name": "Divine Magic Skill +4",
    "description": "Divine Magic Skill +4"
  },
  {
    "id": "t4_m838_a49_q7",
    "materialItemID": 838,
    "augmentID": 49,
    "requiredQty": 7,
    "power": 1,
    "materialName": "Spider Web",
    "rank": 4,
    "name": "Haste +2%",
    "description": "Haste +2%"
  },
  {
    "id": "t4_m4104_a512_q7",
    "materialItemID": 4104,
    "augmentID": 512,
    "requiredQty": 7,
    "power": 4,
    "materialName": "Fire Cluster",
    "rank": 4,
    "name": "STR +5",
    "description": "STR +5"
  },
  {
    "id": "t4_m4105_a516_q7",
    "materialItemID": 4105,
    "augmentID": 516,
    "requiredQty": 7,
    "power": 4,
    "materialName": "Ice Cluster",
    "rank": 4,
    "name": "INT +5",
    "description": "INT +5"
  },
  {
    "id": "t4_m4106_a515_q7",
    "materialItemID": 4106,
    "augmentID": 515,
    "requiredQty": 7,
    "power": 4,
    "materialName": "Wind Cluster",
    "rank": 4,
    "name": "AGI +5",
    "description": "AGI +5"
  },
  {
    "id": "t4_m4107_a514_q7",
    "materialItemID": 4107,
    "augmentID": 514,
    "requiredQty": 7,
    "power": 4,
    "materialName": "Earth Cluster",
    "rank": 4,
    "name": "VIT +5",
    "description": "VIT +5"
  },
  {
    "id": "t4_m4108_a513_q7",
    "materialItemID": 4108,
    "augmentID": 513,
    "requiredQty": 7,
    "power": 4,
    "materialName": "Lightning Cluster",
    "rank": 4,
    "name": "DEX +5",
    "description": "DEX +5"
  },
  {
    "id": "t4_m4109_a517_q7",
    "materialItemID": 4109,
    "augmentID": 517,
    "requiredQty": 7,
    "power": 4,
    "materialName": "Water Cluster",
    "rank": 4,
    "name": "MND +5",
    "description": "MND +5"
  },
  {
    "id": "t4_m4110_a518_q7",
    "materialItemID": 4110,
    "augmentID": 518,
    "requiredQty": 7,
    "power": 4,
    "materialName": "Light Cluster",
    "rank": 4,
    "name": "CHR +5",
    "description": "CHR +5"
  },
  {
    "id": "t4_m4111_a17_q7",
    "materialItemID": 4111,
    "augmentID": 17,
    "requiredQty": 7,
    "power": 19,
    "materialName": "Dark Cluster",
    "rank": 4,
    "name": "HP/MP +20",
    "description": "HP/MP +20"
  },
  {
    "id": "t4_m4508_a138_q12",
    "materialItemID": 4508,
    "augmentID": 138,
    "requiredQty": 12,
    "power": 1,
    "materialName": "Royal Jelly",
    "rank": 4,
    "name": "Refresh +2",
    "description": "Refresh +2"
  },
  {
    "id": "t4_m1154_a144_q7",
    "materialItemID": 1154,
    "augmentID": 144,
    "requiredQty": 7,
    "power": 2,
    "materialName": "Three-Leaf Mandragora Bud",
    "rank": 4,
    "name": "Triple Attack +3%",
    "description": "Triple Attack +3%"
  },
  {
    "id": "t4_m4369_a354_q3",
    "materialItemID": 4369,
    "augmentID": 354,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Four-Leaf Mandragora Bud",
    "rank": 4,
    "name": "Quadruple Attack +1%",
    "description": "Quadruple Attack +1%"
  },
  {
    "id": "t4_m1126_a147_q9",
    "materialItemID": 1126,
    "augmentID": 147,
    "requiredQty": 9,
    "power": 0,
    "materialName": "Beastmen's Seal",
    "rank": 4,
    "name": "Treasure Hunter +1",
    "description": "Treasure Hunter +1"
  },
  {
    "id": "t4_m3297_a740_q30",
    "materialItemID": 3297,
    "augmentID": 740,
    "requiredQty": 30,
    "power": 11,
    "materialName": "Flame Geode",
    "rank": 4,
    "name": "Melee Weapon Damage +12",
    "description": "Melee Weapon Damage +12"
  },
  {
    "id": "t4_m3298_a139_q10",
    "materialItemID": 3298,
    "augmentID": 139,
    "requiredQty": 10,
    "power": 9,
    "materialName": "Snow Geode",
    "rank": 4,
    "name": "Rapid Shot +10%",
    "description": "Rapid Shot +10%"
  },
  {
    "id": "t4_m3299_a746_q30",
    "materialItemID": 3299,
    "augmentID": 746,
    "requiredQty": 30,
    "power": 11,
    "materialName": "Breeze Geode",
    "rank": 4,
    "name": "Ranged Weapon Damage +12",
    "description": "Ranged Weapon Damage +12"
  },
  {
    "id": "t4_m3300_a368_q10",
    "materialItemID": 3300,
    "augmentID": 368,
    "requiredQty": 10,
    "power": 0,
    "materialName": "Soil Geode",
    "rank": 4,
    "name": "Phalanx Received +1",
    "description": "Phalanx Received +1"
  },
  {
    "id": "t4_m3301_a41_q10",
    "materialItemID": 3301,
    "augmentID": 41,
    "requiredQty": 10,
    "power": 2,
    "materialName": "Thunder Geode",
    "rank": 4,
    "name": "Critical Hit Chance +3%",
    "description": "Critical Hit Chance +3%"
  },
  {
    "id": "t4_m3302_a371_q10",
    "materialItemID": 3302,
    "augmentID": 371,
    "requiredQty": 10,
    "power": 1,
    "materialName": "Aqua Geode",
    "rank": 4,
    "name": "Regen Potency +2",
    "description": "Regen Potency +2"
  },
  {
    "id": "t4_m3303_a1248_q10",
    "materialItemID": 3303,
    "augmentID": 1248,
    "requiredQty": 10,
    "power": 9,
    "materialName": "Light Geode",
    "rank": 4,
    "name": "Enhancing Magic Duration +10%",
    "description": "Enhancing Magic Duration +10%"
  },
  {
    "id": "t4_m3304_a1158_q10",
    "materialItemID": 3304,
    "augmentID": 1158,
    "requiredQty": 10,
    "power": 1,
    "materialName": "Shadow Geode",
    "rank": 4,
    "name": "Occ. Resist Status Ailments +2",
    "description": "Occ. Resist Status Ailments +2"
  },
  {
    "id": "t4_m1114_a899_q3",
    "materialItemID": 1114,
    "augmentID": 899,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Qdv. Mage Blood",
    "rank": 4,
    "name": "Enspell Damage +1%",
    "description": "Enspell Damage +1%"
  },
  {
    "id": "t4_m1150_a756_q1",
    "materialItemID": 1150,
    "augmentID": 756,
    "requiredQty": 1,
    "power": 31,
    "materialName": "Snobby Letter",
    "rank": 4,
    "name": "Melee Weapon Delay -32",
    "description": "Melee Weapon Delay -32"
  },
  {
    "id": "t4_m1619_a764_q3",
    "materialItemID": 1619,
    "augmentID": 764,
    "requiredQty": 3,
    "power": 31,
    "materialName": "Hippogryph Feather",
    "rank": 4,
    "name": "Ranged Weapon Delay -32",
    "description": "Ranged Weapon Delay -32"
  },
  {
    "id": "t4_m554_a153_q3",
    "materialItemID": 554,
    "augmentID": 153,
    "requiredQty": 3,
    "power": 2,
    "materialName": "Gold Orcmask",
    "rank": 4,
    "name": "Shield Mastery +3",
    "description": "Shield Mastery +3"
  },
  {
    "id": "t4_m1649_a251_q3",
    "materialItemID": 1649,
    "augmentID": 251,
    "requiredQty": 3,
    "power": 2,
    "materialName": "Scarlet Stone",
    "rank": 4,
    "name": "Daken +3",
    "description": "Daken +3"
  },
  {
    "id": "t4_m5154_a145_q3",
    "materialItemID": 5154,
    "augmentID": 145,
    "requiredQty": 3,
    "power": 2,
    "materialName": "Tavnazian Liver",
    "rank": 4,
    "name": "Counter +3",
    "description": "Counter +3"
  },
  {
    "id": "t5_m4104_a512_q12",
    "materialItemID": 4104,
    "augmentID": 512,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Fire Cluster",
    "rank": 5,
    "name": "STR +6",
    "description": "STR +6"
  },
  {
    "id": "t5_m4105_a516_q12",
    "materialItemID": 4105,
    "augmentID": 516,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Ice Cluster",
    "rank": 5,
    "name": "INT +6",
    "description": "INT +6"
  },
  {
    "id": "t5_m4106_a515_q12",
    "materialItemID": 4106,
    "augmentID": 515,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Wind Cluster",
    "rank": 5,
    "name": "AGI +6",
    "description": "AGI +6"
  },
  {
    "id": "t5_m4107_a514_q12",
    "materialItemID": 4107,
    "augmentID": 514,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Earth Cluster",
    "rank": 5,
    "name": "VIT +6",
    "description": "VIT +6"
  },
  {
    "id": "t5_m4108_a513_q12",
    "materialItemID": 4108,
    "augmentID": 513,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Lightning Cluster",
    "rank": 5,
    "name": "DEX +6",
    "description": "DEX +6"
  },
  {
    "id": "t5_m4109_a517_q12",
    "materialItemID": 4109,
    "augmentID": 517,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Water Cluster",
    "rank": 5,
    "name": "MND +6",
    "description": "MND +6"
  },
  {
    "id": "t5_m4110_a518_q12",
    "materialItemID": 4110,
    "augmentID": 518,
    "requiredQty": 12,
    "power": 5,
    "materialName": "Light Cluster",
    "rank": 5,
    "name": "CHR +6",
    "description": "CHR +6"
  },
  {
    "id": "t5_m4111_a17_q12",
    "materialItemID": 4111,
    "augmentID": 17,
    "requiredQty": 12,
    "power": 23,
    "materialName": "Dark Cluster",
    "rank": 5,
    "name": "HP/MP +24",
    "description": "HP/MP +24"
  },
  {
    "id": "t5_m1691_a33_q3",
    "materialItemID": 1691,
    "augmentID": 33,
    "requiredQty": 3,
    "power": 29,
    "materialName": "Giant Scale",
    "rank": 5,
    "name": "Defense +30",
    "description": "Defense +30"
  },
  {
    "id": "t5_m3541_a39_q3",
    "materialItemID": 3541,
    "augmentID": 39,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Seasoning Stone",
    "rank": 5,
    "name": "Enmity +8",
    "description": "Enmity +8"
  },
  {
    "id": "t5_m2151_a40_q3",
    "materialItemID": 2151,
    "augmentID": 40,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Marid Hide",
    "rank": 5,
    "name": "Enmity -8",
    "description": "Enmity -8"
  },
  {
    "id": "t5_m1619_a37_q3",
    "materialItemID": 1619,
    "augmentID": 37,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Hippogryph Feather",
    "rank": 5,
    "name": "Magic Evasion +8",
    "description": "Magic Evasion +8"
  },
  {
    "id": "t5_m4526_a362_q3",
    "materialItemID": 4526,
    "augmentID": 362,
    "requiredQty": 1,
    "power": 9,
    "materialName": "Silkworm Egg",
    "rank": 5,
    "name": "Magic Damage +10",
    "description": "Magic Damage +10"
  },
  {
    "id": "t5_m1980_a1158_q3",
    "materialItemID": 1980,
    "augmentID": 1158,
    "requiredQty": 3,
    "power": 2,
    "materialName": "Antican Acid",
    "rank": 5,
    "name": "Occ. Resist Status Ailments +3",
    "description": "Occ. Resist Status Ailments +3"
  },
  {
    "id": "t5_m842_a69_q3",
    "materialItemID": 842,
    "augmentID": 69,
    "requiredQty": 3,
    "power": 9,
    "materialName": "Giant Bird Feather",
    "rank": 5,
    "name": "Ranged Accuracy/Ranged Attack +10",
    "description": "Ranged Accuracy/Ranged Attack +10"
  },
  {
    "id": "t5_m557_a131_q3",
    "materialItemID": 557,
    "augmentID": 131,
    "requiredQty": 3,
    "power": 9,
    "materialName": "Ahriman Lens",
    "rank": 5,
    "name": "Magic Accuracy/Magic Attack Bonus +10",
    "description": "Magic Accuracy/Magic Attack Bonus +10"
  },
  {
    "id": "t5_m1666_a896_q3",
    "materialItemID": 1666,
    "augmentID": 896,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Chameleon Diamond",
    "rank": 5,
    "name": "Enspell Damage +4",
    "description": "Enspell Damage +4"
  },
  {
    "id": "t5_m5115_a68_q3",
    "materialItemID": 5115,
    "augmentID": 68,
    "requiredQty": 3,
    "power": 9,
    "materialName": "R. Moko Grass",
    "rank": 5,
    "name": "Accuracy/Attack +10",
    "description": "Accuracy/Attack +10"
  },
  {
    "id": "t5_m1612_a212_q3",
    "materialItemID": 1612,
    "augmentID": 212,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Radiant Memory",
    "rank": 5,
    "name": "Recycle +8",
    "description": "Recycle +8"
  },
  {
    "id": "t5_m1608_a215_q3",
    "materialItemID": 1608,
    "augmentID": 215,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Fleeting Memory",
    "rank": 5,
    "name": "Ninja Tool Expertise +8",
    "description": "Ninja Tool Expertise +8"
  },
  {
    "id": "t5_m1611_a899_q3",
    "materialItemID": 1611,
    "augmentID": 899,
    "requiredQty": 3,
    "power": 1,
    "materialName": "Shimmering Memory",
    "rank": 5,
    "name": "Enspell Damage +2%",
    "description": "Enspell Damage +2%"
  },
  {
    "id": "t5_m1609_a140_q3",
    "materialItemID": 1609,
    "augmentID": 140,
    "requiredQty": 3,
    "power": 9,
    "materialName": "Profane Memory",
    "rank": 5,
    "name": "Fast Cast +10%",
    "description": "Fast Cast +10%"
  },
  {
    "id": "t5_m1610_a42_q3",
    "materialItemID": 1610,
    "augmentID": 42,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Startling Memory",
    "rank": 5,
    "name": "Enemy Critical Hit Rate -1%",
    "description": "Enemy Critical Hit Rate -1%"
  },
  {
    "id": "t5_m1607_a338_q3",
    "materialItemID": 1607,
    "augmentID": 338,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Bitter Memory",
    "rank": 5,
    "name": "Barrage +1",
    "description": "Barrage +1"
  },
  {
    "id": "t5_m1772_a286_q3",
    "materialItemID": 1772,
    "augmentID": 286,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Super Cermet",
    "rank": 5,
    "name": "Shield Skill +8",
    "description": "Shield Skill +8"
  },
  {
    "id": "t5_m5116_a31_q3",
    "materialItemID": 5116,
    "augmentID": 31,
    "requiredQty": 3,
    "power": 9,
    "materialName": "Cavorting Worm",
    "rank": 5,
    "name": "Evasion +10",
    "description": "Evasion +10"
  },
  {
    "id": "t5_m906_a287_q3",
    "materialItemID": 906,
    "augmentID": 287,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Starmite Shell",
    "rank": 5,
    "name": "Parry Skill +8",
    "description": "Parry Skill +8"
  },
  {
    "id": "t5_m896_a71_q3",
    "materialItemID": 896,
    "augmentID": 71,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Scorpion Shell",
    "rank": 5,
    "name": "Damage Taken -1%",
    "description": "Damage Taken -1%"
  },
  {
    "id": "t5_m886_a137_q3",
    "materialItemID": 886,
    "augmentID": 137,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Demon Skull",
    "rank": 5,
    "name": "Regen +4",
    "description": "Regen +4"
  },
  {
    "id": "t5_m2150_a232_q3",
    "materialItemID": 2150,
    "augmentID": 232,
    "requiredQty": 3,
    "power": 0,
    "materialName": "Colibri Feather",
    "rank": 5,
    "name": "True Shot +1",
    "description": "True Shot +1"
  },
  {
    "id": "t5_m2157_a251_q3",
    "materialItemID": 2157,
    "augmentID": 251,
    "requiredQty": 3,
    "power": 2,
    "materialName": "Imp Horn",
    "rank": 5,
    "name": "Daken +3",
    "description": "Daken +3"
  },
  {
    "id": "t5_m2171_a211_q3",
    "materialItemID": 2171,
    "augmentID": 211,
    "requiredQty": 3,
    "power": 4,
    "materialName": "Colibri Beak",
    "rank": 5,
    "name": "Snapshot +4",
    "description": "Snapshot +4"
  },
  {
    "id": "t5_m924_a796_q3",
    "materialItemID": 924,
    "augmentID": 796,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Fiend Blood",
    "rank": 5,
    "name": "All Elemental Resist +8",
    "description": "All Elemental Resist +8"
  },
  {
    "id": "t5_m897_a124_q3",
    "materialItemID": 897,
    "augmentID": 124,
    "requiredQty": 3,
    "power": 9,
    "materialName": "Scorpion Claw",
    "rank": 5,
    "name": "Pet: Acc+10 R.Acc+10 Atk.+10 R.Atk.+10",
    "description": "Pet: Acc+10 R.Acc+10 Atk.+10 R.Atk.+10"
  },
  {
    "id": "t5_m2524_a330_q3",
    "materialItemID": 2524,
    "augmentID": 330,
    "requiredQty": 3,
    "power": 9,
    "materialName": "Peiste Stinger",
    "rank": 5,
    "name": "Pet: Magic Accuracy/Magic Attack Bonus +10",
    "description": "Pet: Magic Accuracy/Magic Attack Bonus +10"
  },
  {
    "id": "t5_m1685_a112_q3",
    "materialItemID": 1685,
    "augmentID": 112,
    "requiredQty": 3,
    "power": 1,
    "materialName": "Warding Oil",
    "rank": 5,
    "name": "Pet: Damage Taken -2%",
    "description": "Pet: Damage Taken -2%"
  },
  {
    "id": "t5_m1116_a110_q3",
    "materialItemID": 1116,
    "augmentID": 110,
    "requiredQty": 3,
    "power": 3,
    "materialName": "Manticore Hide",
    "rank": 5,
    "name": "Pet: Regen +4",
    "description": "Pet: Regen +4"
  },
  {
    "id": "t5_m1123_a123_q3",
    "materialItemID": 1123,
    "augmentID": 123,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Manticore Fang",
    "rank": 5,
    "name": "Pet: Double Attack +8%",
    "description": "Pet: Double Attack +8%"
  },
  {
    "id": "t5_m1117_a104_q3",
    "materialItemID": 1117,
    "augmentID": 104,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Manticore Leather",
    "rank": 5,
    "name": "Pet: Enmity +8",
    "description": "Pet: Enmity +8"
  },
  {
    "id": "t5_m2371_a105_q3",
    "materialItemID": 2371,
    "augmentID": 105,
    "requiredQty": 3,
    "power": 7,
    "materialName": "Manticore Hair",
    "rank": 5,
    "name": "Pet: Enmity -8",
    "description": "Pet: Enmity -8"
  },
  {
    "id": "t5_m902_a321_q3",
    "materialItemID": 902,
    "augmentID": 321,
    "requiredQty": 3,
    "power": 1,
    "materialName": "Demon Horn",
    "rank": 5,
    "name": "Avatar Perpetuation Cost -2",
    "description": "Avatar Perpetuation Cost -2"
  },
  {
    "id": "t5_m2147_a126_q3",
    "materialItemID": 2147,
    "augmentID": 126,
    "requiredQty": 3,
    "power": 9,
    "materialName": "Marid Tusk",
    "rank": 5,
    "name": "Pet: Magic Damage +10",
    "description": "Pet: Magic Damage +10"
  },
  {
    "id": "t5_m2835_a334_q1",
    "materialItemID": 2835,
    "augmentID": 334,
    "requiredQty": 1,
    "power": 7,
    "materialName": "Dahu Hair",
    "rank": 5,
    "name": "Magic Defense Bonus +8",
    "description": "Magic Defense Bonus +8"
  },
  {
    "id": "t5_m1127_a132_q3",
    "materialItemID": 1127,
    "augmentID": 132,
    "requiredQty": 3,
    "power": 2,
    "materialName": "Kindred Seal",
    "rank": 5,
    "name": "Dbl.Atk. +3% / Crit.hit rate +3%",
    "description": "Dbl.Atk. +3% / Crit.hit rate +3%"
  }
];

  const NONE_AUGMENT = {
    id: "none",
    augmentID: null,
    rank: 0,
    name: "None",
    description: "None",
    materialName: "",
    materialItemID: null,
    requiredQty: 0,
    stats: {}
  };

  const state = { rank: MAX_RANK, slots: {} };

  function normalizeStatName(name) {
    return name
      .replace(/Dbl\.Atk\./gi, "Double Attack")
      .replace(/Crit\.hit rate/gi, "Critical Hit Rate")
      .replace(/Acc\./g, "Accuracy")
      .replace(/R\.Acc\./g, "Ranged Accuracy")
      .replace(/Atk\./g, "Attack")
      .replace(/R\.Atk\./g, "Ranged Attack")
      .replace(/M\.Acc\./g, "Magic Accuracy")
      .replace(/M\.Atk\./g, "Magic Attack")
      .replace(/\s+/g, " ")
      .trim();
  }

  function addStat(stats, name, value) {
    const cleaned = normalizeStatName(name);
    if (!cleaned) return;
    stats[cleaned] = (stats[cleaned] || 0) + value;
  }

  function parseStats(description) {
    const stats = {};
    let desc = description.replace(/Pet: Acc\+10 R\.Acc\+10 Atk\.\+10 R\.Atk\.\+10/i, "Pet: Accuracy +10 / Pet: Ranged Accuracy +10 / Pet: Attack +10 / Pet: Ranged Attack +10");

    const pieces = desc
      .replace(/,/g, " /")
      .split(/\s+\/\s+|\s*\/\s*/)
      .map(piece => piece.trim())
      .filter(Boolean);

    for (let i = 0; i < pieces.length; i++) {
      const piece = pieces[i];
      const match = piece.match(/^(.+?)\s*([+-])\s*(\d+)%?$/);
      if (match) {
        addStat(stats, match[1], (match[2] === "-" ? -1 : 1) * Number(match[3]));
        continue;
      }

      const compact = piece.match(/^(.+?)([+-])(\d+)%?$/);
      if (compact) {
        addStat(stats, compact[1], (compact[2] === "-" ? -1 : 1) * Number(compact[3]));
      }
    }

    return stats;
  }

  AUGMENTS.forEach(augment => {
    augment.stats = parseStats(augment.description);
  });

  function buildShell() {
    root.innerHTML = `
      <style>
        #augment-planner-root { max-width: 1280px; margin: 0 auto; }
        .ap-card { border: 1px solid #ccc; border-radius: 8px; padding: 1rem; margin: 1rem 0; background: rgba(255,255,255,0.03); }
        .ap-header { border-bottom: 2px solid #1e70bf; margin-bottom: 1rem; }
        .ap-header h1 { margin-bottom: .25rem; }
        .ap-controls { display: flex; gap: .75rem; align-items: center; flex-wrap: wrap; }
        .ap-controls select, .ap-controls button, .ap-slot select { padding: .35rem; }
        .ap-grid { display: grid; grid-template-columns: minmax(0, 2fr) minmax(320px, 1fr); gap: 1rem; }
        .ap-slot { display: grid; grid-template-columns: 120px 1fr; gap: .75rem; align-items: start; border: 1px solid #ddd; border-radius: 8px; padding: .75rem; margin-bottom: .75rem; }
        .ap-slot-name { font-weight: 700; }
        .ap-selects { display: grid; grid-template-columns: repeat(4, minmax(160px, 1fr)); gap: .5rem; }
        .ap-item-summary { grid-column: 2; font-size: .92rem; opacity: .92; padding-top: .25rem; }
        .ap-list-line { display: flex; justify-content: space-between; gap: 1rem; border-bottom: 1px dotted #bbb; padding: .2rem 0; }
        .ap-muted { opacity: .75; }
        .ap-export { width: 100%; min-height: 180px; font-family: ui-monospace, Consolas, monospace; }
        .ap-button-row { display: flex; gap: .5rem; flex-wrap: wrap; margin-top: .5rem; }
        .ap-warning { color: #b45309; font-size: .9rem; margin-top: .25rem; }
        @media (max-width: 950px) { .ap-grid { grid-template-columns: 1fr; } .ap-selects { grid-template-columns: 1fr; } .ap-slot { grid-template-columns: 1fr; } .ap-item-summary { grid-column: 1; } }
      </style>

      <div class="ap-header">
        <h1>Custom Augment Planner</h1>
        <p>Plan a hypothetical retail-slot equipment set with up to four augments per item.</p>
      </div>

      <div class="ap-card ap-controls">
        <label><strong>Highest unlocked rank:</strong> <select id="ap-rank"></select></label>
        <button id="ap-reset" type="button">Reset Build</button>
        <button id="ap-save" type="button">Download JSON</button>
        <span id="ap-save-status" class="ap-muted"></span>
      </div>

      <div class="ap-grid">
        <div class="ap-card">
          <h2>Equipment Augments</h2>
          <div id="ap-slots"></div>
        </div>
        <div>
          <div class="ap-card">
            <h2>Total Bonuses</h2>
            <div id="ap-totals"></div>
          </div>
          <div class="ap-card">
            <h2>Materials Needed</h2>
            <div id="ap-materials"></div>
          </div>
          <div class="ap-card">
            <h2>Build Export / Import</h2>
            <textarea id="ap-export" class="ap-export"></textarea>
            <div class="ap-button-row">
              <button id="ap-copy" type="button">Copy Build</button>
              <button id="ap-import" type="button">Import From Box</button>
            </div>
          </div>
        </div>
      </div>`;
  }

  function initState() {
    GEAR_SLOTS.forEach(slot => {
      state.slots[slot] = Array(AUGMENTS_PER_SLOT).fill("none");
    });

    try {
      const saved = JSON.parse(localStorage.getItem(STORAGE_KEY));
      if (saved && saved.slots) {
        state.rank = Number(saved.rank || MAX_RANK);
        GEAR_SLOTS.forEach(slot => {
          if (Array.isArray(saved.slots[slot])) {
            state.slots[slot] = saved.slots[slot].slice(0, AUGMENTS_PER_SLOT);
            while (state.slots[slot].length < AUGMENTS_PER_SLOT) state.slots[slot].push("none");
          }
        });
      }
    } catch (e) {}
  }

  function getAugment(id) {
    if (id === "none") return NONE_AUGMENT;
    return AUGMENTS.find(a => a.id === id) || NONE_AUGMENT;
  }

  function getAvailableAugments() {
    return [NONE_AUGMENT].concat(AUGMENTS.filter(a => a.rank <= state.rank));
  }

  function formatStatValue(value) {
    return value > 0 ? "+" + value : String(value);
  }

  function summarizeAugmentIds(ids) {
    const totals = {};
    ids.forEach(id => {
      const augment = getAugment(id);
      Object.entries(augment.stats || {}).forEach(([stat, value]) => {
        totals[stat] = (totals[stat] || 0) + value;
      });
    });
    return totals;
  }

  function renderStatList(container, totals, emptyText) {
    const entries = Object.entries(totals).sort((a, b) => a[0].localeCompare(b[0]));
    container.innerHTML = "";
    if (entries.length === 0) {
      container.innerHTML = `<span class="ap-muted">${emptyText}</span>`;
      return;
    }
    entries.forEach(([stat, value]) => {
      const line = document.createElement("div");
      line.className = "ap-list-line";
      line.innerHTML = `<span>${stat}</span><strong>${formatStatValue(value)}</strong>`;
      container.appendChild(line);
    });
  }

  function selectedAugmentIDsForSlot(slot) {
    return state.slots[slot]
      .map(id => getAugment(id).augmentID)
      .filter(id => id !== null);
  }

  function renderRankSelector() {
    const rankSelect = document.getElementById("ap-rank");
    rankSelect.innerHTML = "";
    for (let rank = 0; rank <= MAX_RANK; rank++) {
      const option = document.createElement("option");
      option.value = rank;
      option.textContent = "Rank " + rank;
      rankSelect.appendChild(option);
    }
    rankSelect.value = state.rank;
    rankSelect.addEventListener("change", function () {
      state.rank = Number(rankSelect.value);
      pruneUnavailableSelections();
      renderAll();
    });
  }

  function pruneUnavailableSelections() {
    const availableIds = new Set(getAvailableAugments().map(a => a.id));
    GEAR_SLOTS.forEach(slot => {
      state.slots[slot] = state.slots[slot].map(id => availableIds.has(id) ? id : "none");
    });
  }

  function renderSlots() {
    const container = document.getElementById("ap-slots");
    const available = getAvailableAugments();
    container.innerHTML = "";

    GEAR_SLOTS.forEach(slot => {
      const row = document.createElement("div");
      row.className = "ap-slot";

      const slotName = document.createElement("div");
      slotName.className = "ap-slot-name";
      slotName.textContent = slot;
      row.appendChild(slotName);

      const selects = document.createElement("div");
      selects.className = "ap-selects";

      const selectedAugmentIDs = selectedAugmentIDsForSlot(slot);

      for (let index = 0; index < AUGMENTS_PER_SLOT; index++) {
        const select = document.createElement("select");
        select.dataset.slot = slot;
        select.dataset.index = index;

        const currentID = state.slots[slot][index];
        const currentAugmentID = getAugment(currentID).augmentID;

        available.forEach(augment => {
          const option = document.createElement("option");
          option.value = augment.id;
          option.textContent = augment.id === "none"
            ? "None"
            : `[R${augment.rank}] ${augment.description}`;

          const duplicateOnSameItem = augment.augmentID !== null &&
            augment.augmentID !== currentAugmentID &&
            selectedAugmentIDs.includes(augment.augmentID);

          if (duplicateOnSameItem) {
            option.disabled = true;
          }

          select.appendChild(option);
        });

        select.value = currentID;
        select.addEventListener("change", function () {
          state.slots[slot][index] = select.value;
          renderAll();
        });
        selects.appendChild(select);
      }

      row.appendChild(selects);

      const summary = document.createElement("div");
      summary.className = "ap-item-summary";
      const itemTotals = summarizeAugmentIds(state.slots[slot]);
      const parts = Object.entries(itemTotals).sort((a, b) => a[0].localeCompare(b[0])).map(([stat, value]) => `${stat} ${formatStatValue(value)}`);
      summary.innerHTML = parts.length ? `<strong>${slot} totals:</strong> ${parts.join(", ")}` : `<span class="ap-muted">No augments selected for ${slot}.</span>`;
      row.appendChild(summary);

      container.appendChild(row);
    });
  }

  function calculateTotalStats() {
    const allSelected = [];
    GEAR_SLOTS.forEach(slot => allSelected.push(...state.slots[slot]));
    return summarizeAugmentIds(allSelected);
  }

  function calculateMaterials() {
    const materials = {};
    GEAR_SLOTS.forEach(slot => {
      state.slots[slot].forEach(id => {
        const augment = getAugment(id);
        if (augment.id === "none") return;
        const key = augment.materialItemID + "|" + augment.materialName;
        if (!materials[key]) {
          materials[key] = { materialItemID: augment.materialItemID, materialName: augment.materialName, requiredQty: 0 };
        }
        materials[key].requiredQty += augment.requiredQty;
      });
    });
    return materials;
  }

  function renderTotals() {
    renderStatList(document.getElementById("ap-totals"), calculateTotalStats(), "No augments selected.");
  }

  function renderMaterials() {
    const materials = calculateMaterials();
    const container = document.getElementById("ap-materials");
    container.innerHTML = "";
    const entries = Object.values(materials).sort((a, b) => a.materialName.localeCompare(b.materialName));
    if (entries.length === 0) {
      container.innerHTML = `<span class="ap-muted">No materials required yet.</span>`;
      return;
    }
    entries.forEach(item => {
      const line = document.createElement("div");
      line.className = "ap-list-line";
      line.innerHTML = `<span>${item.materialName} <span class="ap-muted">(#${item.materialItemID})</span></span><strong>${item.requiredQty}</strong>`;
      container.appendChild(line);
    });
  }

  function buildExportObject() {
    const namedSlots = {};
    GEAR_SLOTS.forEach(slot => {
      namedSlots[slot] = state.slots[slot].map(id => {
        const augment = getAugment(id);
        return augment.id === "none" ? "None" : augment.description;
      });
    });
    return {
      rank: state.rank,
      slots: state.slots,
      displaySlots: namedSlots,
      totals: calculateTotalStats(),
      materials: Object.values(calculateMaterials())
    };
  }

  function renderExport() {
    document.getElementById("ap-export").value = JSON.stringify(buildExportObject(), null, 2);
  }

  function renderAll() {
    renderRankSelectorValueOnly();
    renderSlots();
    renderTotals();
    renderMaterials();
    renderExport();
  }

  function renderRankSelectorValueOnly() {
    const rankSelect = document.getElementById("ap-rank");
    if (rankSelect) rankSelect.value = state.rank;
  }

  function bindButtons() {
    document.getElementById("ap-reset").addEventListener("click", function () {
      state.rank = MAX_RANK;
      GEAR_SLOTS.forEach(slot => state.slots[slot] = Array(AUGMENTS_PER_SLOT).fill("none"));
      renderAll();
    });

    document.getElementById("ap-save").addEventListener("click", function () {
      const exportObject = buildExportObject();
      const json = JSON.stringify(exportObject, null, 2);
      const blob = new Blob([json], { type: "application/json" });
      const url = URL.createObjectURL(blob);

      const now = new Date();
      const timestamp = now.toISOString().slice(0, 19).replace(/[:T]/g, "-");

      const link = document.createElement("a");
      link.href = url;
      link.download = "augment-planner-build-" + timestamp + ".json";
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);

      URL.revokeObjectURL(url);

      const status = document.getElementById("ap-save-status");
      status.textContent = "Downloaded JSON.";
      setTimeout(() => status.textContent = "", 1500);
    });

    document.getElementById("ap-copy").addEventListener("click", function () {
      const box = document.getElementById("ap-export");
      box.select();
      document.execCommand("copy");
    });

    document.getElementById("ap-import").addEventListener("click", function () {
      try {
        const imported = JSON.parse(document.getElementById("ap-export").value);
        if (!imported || !imported.slots) throw new Error("Missing slots");
        state.rank = Number(imported.rank || MAX_RANK);
        GEAR_SLOTS.forEach(slot => {
          state.slots[slot] = Array.isArray(imported.slots[slot]) ? imported.slots[slot].slice(0, AUGMENTS_PER_SLOT) : Array(AUGMENTS_PER_SLOT).fill("none");
          while (state.slots[slot].length < AUGMENTS_PER_SLOT) state.slots[slot].push("none");
        });
        pruneUnavailableSelections();
        renderAll();
      } catch (e) {
        alert("Could not import build JSON.");
      }
    });
  }

  buildShell();
  initState();
  renderRankSelector();
  bindButtons();
  pruneUnavailableSelections();
  renderAll();
})();
</script>