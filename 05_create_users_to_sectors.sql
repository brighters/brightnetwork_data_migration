delimiter $$

CREATE TABLE `users_to_sectors` (
  `users_to_sectors_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_resource_id` int(11) DEFAULT NULL,
  `user_salesforce_id` int(11) DEFAULT NULL,
  `sector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`users_to_sectors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

