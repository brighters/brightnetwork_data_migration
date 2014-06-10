delimiter $$

CREATE TABLE `subjects_raw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `subjects` varchar(200) DEFAULT NULL,
  `subject_1` varchar(100) DEFAULT NULL,
  `subject_2` varchar(100) DEFAULT NULL,
  `subject_3` varchar(100) DEFAULT NULL,
  `subject_4` varchar(100) DEFAULT NULL,
  `subject_5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

