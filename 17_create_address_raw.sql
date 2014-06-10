delimiter $$

CREATE TABLE `address_raw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `address` mediumtext,
  `mailing_street` varchar(100) DEFAULT NULL,
  `mailing_city` varchar(100) DEFAULT NULL,
  `mailing_country` varchar(100) DEFAULT NULL,
  `mailing_postcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8$$

