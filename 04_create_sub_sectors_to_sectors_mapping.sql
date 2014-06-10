delimiter $$

CREATE TABLE `sub_sector_to_sector_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_sector_id` int(11) DEFAULT NULL,
  `sub_sector_name` varchar(100) DEFAULT NULL,
  `sector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8$$

