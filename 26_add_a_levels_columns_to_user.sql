ALTER TABLE `data_migration`.`users` ADD COLUMN `a_level_subject_1` VARCHAR(100) NULL  AFTER `password` , ADD COLUMN `a_level_subject_2` VARCHAR(100) NULL  AFTER `a_level_subject_1` , ADD COLUMN `a_level_subject_3` VARCHAR(100) NULL  AFTER `a_level_subject_2` , ADD COLUMN `a_level_subject_4` VARCHAR(100) NULL  AFTER `a_level_subject_3` , ADD COLUMN `a_level_subject_5` VARCHAR(100) NULL  AFTER `a_level_subject_4` , ADD COLUMN `a_level_grade_1` VARCHAR(2) NULL  AFTER `a_level_subject_5` , ADD COLUMN `a_level_grade_2` VARCHAR(2) NULL  AFTER `a_level_grade_1` , ADD COLUMN `a_level_grade_3` VARCHAR(2) NULL  AFTER `a_level_grade_2` , ADD COLUMN `a_level_grade_4` VARCHAR(2) NULL  AFTER `a_level_grade_3` , ADD COLUMN `a_level_grade_5` VARCHAR(2) NULL  AFTER `a_level_grade_4` ;
ALTER TABLE `data_migration`.`users` CHANGE COLUMN `a_level_grade_1` `a_level_grade_1` VARCHAR(20) NULL DEFAULT NULL  , CHANGE COLUMN `a_level_grade_2` `a_level_grade_2` VARCHAR(20) NULL DEFAULT NULL  , CHANGE COLUMN `a_level_grade_3` `a_level_grade_3` VARCHAR(20) NULL DEFAULT NULL  , CHANGE COLUMN `a_level_grade_4` `a_level_grade_4` VARCHAR(20) NULL DEFAULT NULL  , CHANGE COLUMN `a_level_grade_5` `a_level_grade_5` VARCHAR(20) NULL DEFAULT NULL  ;

