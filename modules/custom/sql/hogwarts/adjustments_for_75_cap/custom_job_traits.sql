-- =====================================================================
-- Idempotent trait patch:
--   1) UPDATE existing row if present
--   2) INSERT row if it does not already exist
--
-- Natural key used for existence checks:
--   traitid + job + level + rank + modifier
-- =====================================================================

START TRANSACTION;

-- =====================================================================
-- THF
-- =====================================================================

UPDATE `traits`
SET `name`='dual wield', `value`=30, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=18 AND `job`=6 AND `level`=74 AND `rank`=4 AND `modifier`=259;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 18,'dual wield',6,74,4,259,30,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=18 AND `job`=6 AND `level`=74 AND `rank`=4 AND `modifier`=259
);

-- =====================================================================
-- SCH
-- =====================================================================

UPDATE `traits`
SET `name`='conserve mp', `value`=28, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=13 AND `job`=20 AND `level`=50 AND `rank`=2 AND `modifier`=296;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 13,'conserve mp',20,50,2,296,28,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=13 AND `job`=20 AND `level`=50 AND `rank`=2 AND `modifier`=296
);

-- =====================================================================
-- RDM
-- =====================================================================

UPDATE `traits`
SET `name`='fencer', `value`=200, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=20 AND `rank`=1 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,20,1,903,200,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=20 AND `rank`=1 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=3, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=20 AND `rank`=1 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,20,1,904,3,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=20 AND `rank`=1 AND `modifier`=904
);

UPDATE `traits`
SET `name`='fencer', `value`=300, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=35 AND `rank`=2 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,35,2,903,300,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=35 AND `rank`=2 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=5, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=35 AND `rank`=2 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,35,2,904,5,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=35 AND `rank`=2 AND `modifier`=904
);

UPDATE `traits`
SET `name`='fencer', `value`=400, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=45 AND `rank`=3 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,45,3,903,400,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=45 AND `rank`=3 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=7, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=45 AND `rank`=3 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,45,3,904,7,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=45 AND `rank`=3 AND `modifier`=904
);

UPDATE `traits`
SET `name`='fencer', `value`=450, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=55 AND `rank`=4 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,55,4,903,450,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=55 AND `rank`=4 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=9, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=55 AND `rank`=4 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,55,4,904,9,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=55 AND `rank`=4 AND `modifier`=904
);

UPDATE `traits`
SET `name`='fencer', `value`=500, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=71 AND `rank`=5 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,71,5,903,500,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=71 AND `rank`=5 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=10, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=5 AND `level`=71 AND `rank`=5 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',5,71,5,904,10,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=5 AND `level`=71 AND `rank`=5 AND `modifier`=904
);

-- =====================================================================
-- BST
-- =====================================================================

UPDATE `traits`
SET `name`='stout servant', `value`=12, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=103 AND `job`=9 AND `level`=70 AND `rank`=4 AND `modifier`=0;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 103,'stout servant',9,70,4,0,12,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=103 AND `job`=9 AND `level`=70 AND `rank`=4 AND `modifier`=0
);

UPDATE `traits`
SET `name`='stout servant', `value`=15, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=103 AND `job`=9 AND `level`=75 AND `rank`=5 AND `modifier`=0;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 103,'stout servant',9,75,5,0,15,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=103 AND `job`=9 AND `level`=75 AND `rank`=5 AND `modifier`=0
);

-- =====================================================================
-- BRD
-- =====================================================================

UPDATE `traits`
SET `name`='fencer', `value`=200, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=26 AND `rank`=1 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,26,1,903,200,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=26 AND `rank`=1 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=3, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=26 AND `rank`=1 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,26,1,904,3,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=26 AND `rank`=1 AND `modifier`=904
);

UPDATE `traits`
SET `name`='fencer', `value`=300, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=42 AND `rank`=2 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,42,2,903,300,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=42 AND `rank`=2 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=5, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=42 AND `rank`=2 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,42,2,904,5,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=42 AND `rank`=2 AND `modifier`=904
);

UPDATE `traits`
SET `name`='fencer', `value`=400, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=61 AND `rank`=3 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,61,3,903,400,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=61 AND `rank`=3 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=7, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=61 AND `rank`=3 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,61,3,904,7,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=61 AND `rank`=3 AND `modifier`=904
);

UPDATE `traits`
SET `name`='fencer', `value`=450, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=73 AND `rank`=4 AND `modifier`=903;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,73,4,903,450,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=73 AND `rank`=4 AND `modifier`=903
);

UPDATE `traits`
SET `name`='fencer', `value`=9, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=107 AND `job`=10 AND `level`=73 AND `rank`=4 AND `modifier`=904;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 107,'fencer',10,73,4,904,9,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=107 AND `job`=10 AND `level`=73 AND `rank`=4 AND `modifier`=904
);

-- =====================================================================
-- RNG
-- =====================================================================

UPDATE `traits`
SET `name`='true shot', `value`=1000, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=11 AND `level`=45 AND `rank`=1 AND `modifier`=506;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',11,45,1,506,1000,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=11 AND `level`=45 AND `rank`=1 AND `modifier`=506
);

UPDATE `traits`
SET `name`='true shot', `value`=103, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=11 AND `level`=45 AND `rank`=1 AND `modifier`=507;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',11,45,1,507,103,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=11 AND `level`=45 AND `rank`=1 AND `modifier`=507
);

UPDATE `traits`
SET `name`='true shot', `value`=1000, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=11 AND `level`=60 AND `rank`=2 AND `modifier`=506;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',11,60,2,506,1000,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=11 AND `level`=60 AND `rank`=2 AND `modifier`=506
);

UPDATE `traits`
SET `name`='true shot', `value`=105, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=11 AND `level`=60 AND `rank`=2 AND `modifier`=507;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',11,60,2,507,105,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=11 AND `level`=60 AND `rank`=2 AND `modifier`=507
);

UPDATE `traits`
SET `name`='true shot', `value`=1000, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=11 AND `level`=75 AND `rank`=3 AND `modifier`=506;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',11,75,3,506,1000,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=11 AND `level`=75 AND `rank`=3 AND `modifier`=506
);

UPDATE `traits`
SET `name`='true shot', `value`=107, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=11 AND `level`=75 AND `rank`=3 AND `modifier`=507;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',11,75,3,507,107,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=11 AND `level`=75 AND `rank`=3 AND `modifier`=507
);

-- =====================================================================
-- COR
-- =====================================================================

UPDATE `traits`
SET `name`='true shot', `value`=1000, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=17 AND `level`=50 AND `rank`=1 AND `modifier`=506;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',17,50,1,506,1000,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=17 AND `level`=50 AND `rank`=1 AND `modifier`=506
);

UPDATE `traits`
SET `name`='true shot', `value`=103, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=17 AND `level`=50 AND `rank`=1 AND `modifier`=507;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',17,50,1,507,103,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=17 AND `level`=50 AND `rank`=1 AND `modifier`=507
);

UPDATE `traits`
SET `name`='true shot', `value`=1000, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=17 AND `level`=70 AND `rank`=2 AND `modifier`=506;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',17,70,2,506,1000,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=17 AND `level`=70 AND `rank`=2 AND `modifier`=506
);

UPDATE `traits`
SET `name`='true shot', `value`=105, `content_tag`=NULL, `meritid`=0
WHERE `traitid`=139 AND `job`=17 AND `level`=70 AND `rank`=2 AND `modifier`=507;

INSERT INTO `traits` (`traitid`,`name`,`job`,`level`,`rank`,`modifier`,`value`,`content_tag`,`meritid`)
SELECT 139,'true shot',17,70,2,507,105,NULL,0
WHERE NOT EXISTS (
    SELECT 1 FROM `traits`
    WHERE `traitid`=139 AND `job`=17 AND `level`=70 AND `rank`=2 AND `modifier`=507
);

COMMIT;
