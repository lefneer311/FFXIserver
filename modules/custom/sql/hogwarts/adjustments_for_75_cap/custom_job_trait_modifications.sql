-- =====================================================================
-- Idempotent trait patch:
--   1) UPDATE existing row if present
--
-- Natural key used for existence checks:
--   traitid + job + level + rank + modifier
-- =====================================================================
START TRANSACTION;

UPDATE `traits` SET `level` = 75 WHERE `job` = 1 AND `name` = 'smite' AND `rank` = 3 AND `level` = 95;
UPDATE `traits` SET `level` = 1 WHERE `job` = 2 AND `name` = 'martial arts' AND `rank` = 1 AND `level` = 1;
UPDATE `traits` SET `level` = 16 WHERE `job` = 2 AND `name` = 'martial arts' AND `rank` = 2 AND `level` = 16;
UPDATE `traits` SET `level` = 31 WHERE `job` = 2 AND `name` = 'martial arts' AND `rank` = 3 AND `level` = 31;
UPDATE `traits` SET `level` = 46 WHERE `job` = 2 AND `name` = 'martial arts' AND `rank` = 4 AND `level` = 46;
UPDATE `traits` SET `level` = 61 WHERE `job` = 2 AND `name` = 'martial arts' AND `rank` = 5 AND `level` = 61;
UPDATE `traits` SET `level` = 75 WHERE `job` = 2 AND `name` = 'martial arts' AND `rank` = 6 AND `level` = 75;
UPDATE `traits` SET `level` = 75 WHERE `job` = 2 AND `name` = 'martial arts' AND `rank` = 7 AND `level` = 82;
UPDATE `traits` SET `level` = 71 WHERE `job` = 2 AND `name` = 'smite' AND `rank` = 2 AND `level` = 80;
UPDATE `traits` SET `level` = 40 WHERE `job` = 6 AND `name` = 'crit. atk. bonus' AND `rank` = 1 AND `level` = 78;
UPDATE `traits` SET `level` = 50 WHERE `job` = 6 AND `name` = 'crit. atk. bonus' AND `rank` = 2 AND `level` = 84;
UPDATE `traits` SET `level` = 61 WHERE `job` = 6 AND `name` = 'crit. atk. bonus' AND `rank` = 3 AND `level` = 91;
UPDATE `traits` SET `level` = 72 WHERE `job` = 6 AND `name` = 'crit. atk. bonus' AND `rank` = 4 AND `level` = 97;
UPDATE `traits` SET `level` = 20 WHERE `job` = 6 AND `name` = 'dual wield' AND `rank` = 1 AND `level` = 83;
UPDATE `traits` SET `level` = 45 WHERE `job` = 6 AND `name` = 'dual wield' AND `rank` = 2 AND `level` = 90;
UPDATE `traits` SET `level` = 65 WHERE `job` = 6 AND `name` = 'dual wield' AND `rank` = 3 AND `level` = 98;
UPDATE `traits` SET `level` = 40 WHERE `job` = 9 AND `name` = 'stout servant' AND `rank` = 1 AND `level` = 78;
UPDATE `traits` SET `level` = 55 WHERE `job` = 9 AND `name` = 'stout servant' AND `rank` = 2 AND `level` = 88;
UPDATE `traits` SET `level` = 62 WHERE `job` = 9 AND `name` = 'stout servant' AND `rank` = 3 AND `level` = 98;
UPDATE `traits` SET `level` = 45 WHERE `job` = 11 AND `name` = 'damage limit+' AND `rank` = 1 AND `level` = 30;
UPDATE `traits` SET `level` = 60 WHERE `job` = 11 AND `name` = 'damage limit+' AND `rank` = 2 AND `level` = 60;
UPDATE `traits` SET `level` = 75 WHERE `job` = 11 AND `name` = 'damage limit+' AND `rank` = 3 AND `level` = 90;
UPDATE `traits` SET `level` = 50 WHERE `job` = 11 AND `name` = 'conserve tp' AND `rank` = 1 AND `level` = 80;
UPDATE `traits` SET `level` = 65 WHERE `job` = 11 AND `name` = 'conserve tp' AND `rank` = 2 AND `level` = 91;
UPDATE `traits` SET `level` = 30 WHERE `job` = 12 AND `name` = 'skillchain bonus' AND `rank` = 1 AND `level` = 78;
UPDATE `traits` SET `level` = 50 WHERE `job` = 12 AND `name` = 'skillchain bonus' AND `rank` = 2 AND `level` = 88;
UPDATE `traits` SET `level` = 70 WHERE `job` = 12 AND `name` = 'skillchain bonus' AND `rank` = 3 AND `level` = 98;
UPDATE `traits` SET `level` = 35 WHERE `job` = 13 AND `name` = 'tactical parry' AND `rank` = 1 AND `level` = 77;
UPDATE `traits` SET `level` = 55 WHERE `job` = 13 AND `name` = 'tactical parry' AND `rank` = 2 AND `level` = 87;
UPDATE `traits` SET `level` = 70 WHERE `job` = 13 AND `name` = 'tactical parry' AND `rank` = 3 AND `level` = 97;
UPDATE `traits` SET `level` = 68 WHERE `job` = 14 AND `name` = 'strafe' AND `rank` = 4 AND `level` = 80;
UPDATE `traits` SET `level` = 71 WHERE `job` = 14 AND `name` = 'smite' AND `rank` = 2 AND `level` = 80;
UPDATE `traits` SET `level` = 63 WHERE `job` = 14 AND `name` = 'crit. def. bonus' AND `rank` = 1 AND `level` = 85;
UPDATE `traits` SET `level` = 75 WHERE `job` = 14 AND `name` = 'crit. def. bonus' AND `rank` = 2 AND `level` = 95;
UPDATE `traits` SET `level` = 30 WHERE `job` = 15 AND `name` = 'blood boon' AND `rank` = 1 AND `level` = 60;
UPDATE `traits` SET `level` = 40 WHERE `job` = 15 AND `name` = 'blood boon' AND `rank` = 2 AND `level` = 70;
UPDATE `traits` SET `level` = 55 WHERE `job` = 15 AND `name` = 'blood boon' AND `rank` = 3 AND `level` = 80;
UPDATE `traits` SET `level` = 65 WHERE `job` = 15 AND `name` = 'blood boon' AND `rank` = 4 AND `level` = 90;
UPDATE `traits` SET `level` = 55 WHERE `job` = 15 AND `name` = 'stout servant' AND `rank` = 1 AND `level` = 85;
UPDATE `traits` SET `level` = 74 WHERE `job` = 15 AND `name` = 'stout servant' AND `rank` = 2 AND `level` = 95;
UPDATE `traits` SET `level` = 15 WHERE `job` = 17 AND `name` = 'rapid shot' AND `rank` = 1 AND `level` = 15;
UPDATE `traits` SET `level` = 62 WHERE `job` = 17 AND `name` = 'rapid shot' AND `rank` = 2 AND `level` = 91;
UPDATE `traits` SET `level` = 15 WHERE `job` = 18 AND `name` = 'stout servant' AND `rank` = 1 AND `level` = 78;
UPDATE `traits` SET `level` = 45 WHERE `job` = 18 AND `name` = 'stout servant' AND `rank` = 2 AND `level` = 88;
UPDATE `traits` SET `level` = 65 WHERE `job` = 18 AND `name` = 'stout servant' AND `rank` = 3 AND `level` = 98;
UPDATE `traits` SET `level` = 50 WHERE `job` = 18 AND `name` = 'tactical guard' AND `rank` = 1 AND `level` = 80;
UPDATE `traits` SET `level` = 70 WHERE `job` = 18 AND `name` = 'tactical guard' AND `rank` = 2 AND `level` = 90;
UPDATE `traits` SET `level` = 10 WHERE `job` = 18 AND `name` = 'martial arts' AND `rank` = 1 AND `level` = 25;
UPDATE `traits` SET `level` = 25 WHERE `job` = 18 AND `name` = 'martial arts' AND `rank` = 2 AND `level` = 50;
UPDATE `traits` SET `level` = 45 WHERE `job` = 18 AND `name` = 'martial arts' AND `rank` = 3 AND `level` = 75;
UPDATE `traits` SET `level` = 60 WHERE `job` = 18 AND `name` = 'martial arts' AND `rank` = 4 AND `level` = 87;
UPDATE `traits` SET `level` = 75 WHERE `job` = 18 AND `name` = 'martial arts' AND `rank` = 5 AND `level` = 97;
UPDATE `traits` SET `level` = 30 WHERE `job` = 19 AND `name` = 'tactical parry' AND `rank` = 1 AND `level` = 77;
UPDATE `traits` SET `level` = 40 WHERE `job` = 19 AND `name` = 'tactical parry' AND `rank` = 2 AND `level` = 84;
UPDATE `traits` SET `level` = 55 WHERE `job` = 19 AND `name` = 'tactical parry' AND `rank` = 3 AND `level` = 91;
UPDATE `traits` SET `level` = 70 WHERE `job` = 19 AND `name` = 'tactical parry' AND `rank` = 4 AND `level` = 97;
UPDATE `traits` SET `level` = 55 WHERE `job` = 19 AND `name` = 'conserve tp' AND `rank` = 1 AND `level` = 77;
UPDATE `traits` SET `level` = 65 WHERE `job` = 19 AND `name` = 'conserve tp' AND `rank` = 2 AND `level` = 87;
UPDATE `traits` SET `level` = 75 WHERE `job` = 19 AND `name` = 'conserve tp' AND `rank` = 3 AND `level` = 97;
UPDATE `traits` SET `level` = 50 WHERE `job` = 19 AND `name` = 'crit. atk. bonus' AND `rank` = 1 AND `level` = 80;
UPDATE `traits` SET `level` = 60 WHERE `job` = 19 AND `name` = 'crit. atk. bonus' AND `rank` = 2 AND `level` = 88;
UPDATE `traits` SET `level` = 70 WHERE `job` = 19 AND `name` = 'crit. atk. bonus' AND `rank` = 3 AND `level` = 99;
UPDATE `traits` SET `level` = 15 WHERE `job` = 19 AND `name` = 'skillchain bonus' AND `rank` = 1 AND `level` = 45;
UPDATE `traits` SET `level` = 25 WHERE `job` = 19 AND `name` = 'skillchain bonus' AND `rank` = 2 AND `level` = 58;
UPDATE `traits` SET `level` = 45 WHERE `job` = 19 AND `name` = 'skillchain bonus' AND `rank` = 3 AND `level` = 71;
UPDATE `traits` SET `level` = 63 WHERE `job` = 19 AND `name` = 'skillchain bonus' AND `rank` = 4 AND `level` = 84;
UPDATE `traits` SET `level` = 74, `rank` = 5 WHERE `job` = 19 AND `name` = 'skillchain bonus' AND `rank` = 4 AND `level` = 97;
UPDATE `traits` SET `level` = 40 WHERE `job` = 20 AND `name` = 'occult acumen' AND `rank` = 1 AND `level` = 78;
UPDATE `traits` SET `level` = 55 WHERE `job` = 20 AND `name` = 'occult acumen' AND `rank` = 2 AND `level` = 88;
UPDATE `traits` SET `level` = 70 WHERE `job` = 20 AND `name` = 'occult acumen' AND `rank` = 3 AND `level` = 98;
UPDATE `traits` SET `level` = 25 WHERE `job` = 20 AND `name` = 'conserve mp' AND `rank` = 1 AND `level` = 25;
UPDATE `traits` SET `level` = 36 WHERE `job` = 20 AND `name` = 'mag. burst bonus' AND `rank` = 1 AND `level` = 79;
UPDATE `traits` SET `level` = 48 WHERE `job` = 20 AND `name` = 'mag. burst bonus' AND `rank` = 2 AND `level` = 89;
UPDATE `traits` SET `level` = 60 WHERE `job` = 20 AND `name` = 'mag. burst bonus' AND `rank` = 3 AND `level` = 99;

COMMIT;
