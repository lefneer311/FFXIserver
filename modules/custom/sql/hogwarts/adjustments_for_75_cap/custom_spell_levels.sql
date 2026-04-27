-- LandSandBoat spell level adjustments
-- These updates edit the `jobs` binary field in `spell_list`.
-- Apply after your normal SQL import.

START TRANSACTION;

UPDATE `spell_list` SET `jobs` = 0x000000004A0000000000000000000000000000000000 WHERE `spellid` = 473 AND `name` = 'refresh_ii'; -- RDM 82 -> 74
UPDATE `spell_list` SET `jobs` = 0x00000000490000000000000000000000000000000000 WHERE `spellid` = 493 AND `name` = 'temper'; -- RDM 95 -> 73
UPDATE `spell_list` SET `jobs` = 0x000000004B0000000000000000000000000000000000 WHERE `spellid` = 511 AND `name` = 'haste_ii'; -- RDM 96 -> 75
UPDATE `spell_list` SET `jobs` = 0x000000004B0000000000000000000000000000000000 WHERE `spellid` = 846 AND `name` = 'flurry_ii'; -- RDM 96 -> 75
UPDATE `spell_list` SET `jobs` = 0x00000000000028000000000000000000000000000000 WHERE `spellid` = 310 AND `name` = 'enlight'; -- PLD 85 -> 40
UPDATE `spell_list` SET `jobs` = 0x0000000000003E000000000000000000000000000058 WHERE `spellid` = 476 AND `name` = 'crusade'; -- PLD 88 -> 62
UPDATE `spell_list` SET `jobs` = 0x00000000000000280000000000000000000000000000 WHERE `spellid` = 311 AND `name` = 'endark'; -- DRK 85 -> 40
UPDATE `spell_list` SET `jobs` = 0x000000000000003E0000000000000000000000000000 WHERE `spellid` = 243 AND `name` = 'absorb-attri'; -- DRK 91 -> 62
UPDATE `spell_list` SET `jobs` = 0x0000000000000000004A000000000000000000000000 WHERE `spellid` = 470 AND `name` = 'sentinels_scherzo'; -- BRD 82 -> 74
UPDATE `spell_list` SET `jobs` = 0x0000000000000000004B000000000000000000000000 WHERE `spellid` = 472 AND `name` = 'pining_nocturne'; -- BRD 95 -> 75
UPDATE `spell_list` SET `jobs` = 0x0000000000000000000000004B000000000000000000 WHERE `spellid` = 340 AND `name` = 'utsusemi_san'; -- NIN 0 -> 75

-- Notes:
-- Missing spell row in current base: honor_march
-- Missing spell row in current base: aria_of_passion
-- Corsair Rolls are job abilities in `sql/abilities.sql`, not entries in `sql/spell_list.sql`.
-- No scroll/item level column exists in the current base SQL for learnable magic scrolls,
-- so lowering a spell's required job level does not require an item SQL change.

-- LandSandBoat spell cast-level adjustments
-- These updates edit only the relevant job byte inside `spell_list`.`jobs`.
-- Apply after your normal SQL import.

-- Job byte positions in `spell_list`.`jobs` (1-based for MySQL INSERT):
--  1 WAR  2 MNK  3 WHM  4 BLM  5 RDM  6 THF  7 PLD  8 DRK  9 BST 10 BRD 11 RNG
-- 12 SAM 13 NIN 14 DRG 15 SMN 16 BLU 17 COR 18 PUP 19 DNC 20 SCH 21 GEO 22 RUN

-- RDM
UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 5, 1, CHAR(74))
WHERE `spellid` = 473 AND `name` = 'refresh_ii';
-- refresh_ii: RDM 82 -> 74

UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 5, 1, CHAR(73))
WHERE `spellid` = 493 AND `name` = 'temper';
-- temper: RDM 95 -> 73

UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 5, 1, CHAR(75))
WHERE `spellid` = 511 AND `name` = 'haste_ii';
-- haste_ii: RDM 96 -> 75

UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 5, 1, CHAR(75))
WHERE `spellid` = 846 AND `name` = 'flurry_ii';
-- flurry_ii: RDM 96 -> 75

-- PLD
UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 7, 1, CHAR(40))
WHERE `spellid` = 310 AND `name` = 'enlight';
-- enlight: PLD 85 -> 40

UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 7, 1, CHAR(62))
WHERE `spellid` = 476 AND `name` = 'crusade';
-- crusade: PLD 88 -> 62
-- Preserves any other job access already on the row (such as RUN, if present).

-- DRK
UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 8, 1, CHAR(40))
WHERE `spellid` = 311 AND `name` = 'endark';
-- endark: DRK 85 -> 40

UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 8, 1, CHAR(62))
WHERE `spellid` = 243 AND `name` = 'absorb-attri';
-- absorb-attri: DRK 91 -> 62

-- BRD
UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 10, 1, CHAR(74))
WHERE `spellid` = 470 AND `name` = 'sentinels_scherzo';
-- sentinels_scherzo: BRD 82 -> 74

UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 10, 1, CHAR(75))
WHERE `spellid` = 472 AND `name` = 'pining_nocturne';
-- pining_nocturne: BRD 95 -> 75

-- NIN
UPDATE `spell_list`
SET `jobs` = INSERT(`jobs`, 13, 1, CHAR(75))
WHERE `spellid` = 340 AND `name` = 'utsusemi_san';
-- utsusemi_san: NIN 0 -> 75

COMMIT;
