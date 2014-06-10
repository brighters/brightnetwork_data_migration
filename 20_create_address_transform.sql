DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_addresses`()
BEGIN
SET @maxid = (select max(resource_id) from users);

INSERT INTO users (resource_id, mailing_street, mailing_city, mailing_country, mailing_postcode) 
(select ar.resource_id, ar.mailing_street, ar.mailing_city, ar.mailing_country, ar.mailing_postcode from address_raw ar)
ON DUPLICATE KEY UPDATE 
    users.mailing_street = ar.mailing_street,
    users.mailing_city = ar.mailing_city,
    users.mailing_country = ar.mailing_country,
    users.mailing_postcode = ar.mailing_postcode;

DELETE from users where resource_id > @maxid;
END$$