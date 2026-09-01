-- LandSandBoat job ability level/recast adjustments
-- Generated against the current base SQL layout.
-- Apply after your normal SQL import.

START TRANSACTION;

UPDATE `abilities` SET `CE` = 300 WHERE `abilityId` = 35 AND `name` = 'provoke';
UPDATE `abilities` SET `VE` = 5400 WHERE `abilityId` = 35 AND `name` = 'provoke';
UPDATE `abilities` SET `VE` = 1800 WHERE `abilityId` = 40 AND `name` = 'counterstance';
UPDATE `abilities` SET `CE` = 1800 WHERE `abilityId` = 22 AND `name` = 'invincible';
UPDATE `abilities` SET `VE` = 18000 WHERE `abilityId` = 22 AND `name` = 'invincible';
UPDATE `abilities` SET `CE` = 450 WHERE `abilityId` = 46 AND `name` = 'shield_bash';
UPDATE `abilities` SET `VE` = 5400 WHERE `abilityId` = 46 AND `name` = 'shield_bash';
UPDATE `abilities` SET `CE` = 450 WHERE `abilityId` = 48 AND `name` = 'sentinel';
UPDATE `abilities` SET `VE` = 3600 WHERE `abilityId` = 48 AND `name` = 'sentinel';
UPDATE `abilities` SET `CE` = 1 WHERE `abilityId` = 255 AND `name` = 'divine_emblem';
UPDATE `abilities` SET `VE` = 3600 WHERE `abilityId` = 255 AND `name` = 'divine_emblem';
UPDATE `abilities` SET `recastTime` = 60 WHERE `abilityId` = 255 AND `name` = 'divine_emblem';
UPDATE `abilities` SET `CE` = 900 WHERE `abilityId` = 255 AND `name` = 'palisade';
UPDATE `abilities` SET `VE` = 1800 WHERE `abilityId` = 255 AND `name` = 'palisade';
UPDATE `abilities` SET `recastTime` = 300 WHERE `abilityId` = 255 AND `name` = 'palisade';
UPDATE `abilities` SET `CE` = 1800 WHERE `abilityId` = 255 AND `name` = 'intervene';
UPDATE `abilities` SET `VE` = 4500 WHERE `abilityId` = 255 AND `name` = 'intervene';
UPDATE `abilities` SET `recastTime` = 900 WHERE `abilityId` = 255 AND `name` = 'intervene';

UPDATE `spell_list` SET `CE` = 900 WHERE `spellId` = 112 AND `name` = 'flash';
UPDATE `spell_list` SET `VE` = 3600 WHERE `spellId` = 112 AND `name` = 'flash';

COMMIT;
