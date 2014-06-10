delimiter $$

CREATE TABLE `users` (
  `resource_id` int(11) NOT NULL,
  `salesforce_id` int(11) DEFAULT NULL,
  `forename` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `day_of_birth` int(11) DEFAULT NULL,
  `graduation_year` year(4) DEFAULT NULL,
  `university` varchar(100) DEFAULT NULL,
  `mailing_country` varchar(45) DEFAULT NULL,
  `mailing_street` varchar(100) DEFAULT NULL,
  `mailing_city` varchar(45) DEFAULT NULL,
  `mailing_postcode` varchar(45) DEFAULT NULL,
  `notes` longtext,
  `month_of_birth` int(11) DEFAULT NULL,
  `right_to_work_in_uk` int(11) DEFAULT NULL,
  `undergrad_subject_1` varchar(45) DEFAULT NULL,
  `undergrad_subject_2` varchar(45) DEFAULT NULL,
  `undergrad_subject_3` varchar(45) DEFAULT NULL,
  `undergrad_subject_4` varchar(45) DEFAULT NULL,
  `undergrad_subject_5` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

