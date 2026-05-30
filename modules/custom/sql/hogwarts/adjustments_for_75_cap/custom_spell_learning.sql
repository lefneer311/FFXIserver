-- Reference / verification file for spell-learning items
-- Current base SQL stores scroll->spell linkage through item_basic.subid = spell_list.spellid.
-- It does not store a separate learn-level on the item row, so there is nothing to update here for the requested spell-level changes.
-- These SELECTs are included so you can quickly verify the linked items that teach each affected spell.

SELECT 4850 AS itemid, 'scroll_of_refresh_ii' AS item_name, 473 AS taught_spellid, 'refresh_ii' AS taught_spell;
SELECT 4705 AS itemid, 'scroll_of_temper' AS item_name, 493 AS taught_spellid, 'temper' AS taught_spell;
SELECT 4692 AS itemid, 'scroll_of_haste_ii' AS item_name, 847 AS taught_spellid, 'haste_ii' AS taught_spell;
SELECT 5105 AS itemid, 'scroll_of_flurry_ii' AS item_name, 846 AS taught_spellid, 'flurry_ii' AS taught_spell;
SELECT 4706 AS itemid, 'scroll_of_enlight' AS item_name, 310 AS taught_spellid, 'enlight' AS taught_spell;
SELECT 5103 AS itemid, 'scroll_of_crusade' AS item_name, 476 AS taught_spellid, 'crusade' AS taught_spell;
SELECT 4707 AS itemid, 'scroll_of_endark' AS item_name, 311 AS taught_spellid, 'endark' AS taught_spell;
SELECT 4887 AS itemid, 'scroll_of_absorb-attri' AS item_name, 243 AS taught_spellid, 'absorb-attri' AS taught_spell;
SELECT 5078 AS itemid, 'scroll_of_sentinels_scherzo' AS item_name, 470 AS taught_spellid, 'sentinels_scherzo' AS taught_spell;
SELECT 5080 AS itemid, 'scroll_of_pining_nocturne' AS item_name, 472 AS taught_spellid, 'pining_nocturne' AS taught_spell;
-- No matching learn-item row found in current base SQL for: honor_march
-- No matching learn-item row found in current base SQL for: aria_of_passion
-- No matching learn-item row found in current base SQL for: utsusemi_san
