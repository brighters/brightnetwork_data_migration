delimiter $$

CREATE TABLE `sub_sectors_raw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `sub_sector` varchar(100) DEFAULT NULL,
  `sub_sector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

