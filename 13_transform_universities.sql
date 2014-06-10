DELIMITER $$
CREATE PROCEDURE update_universities()
BEGIN
SET @maxid = (select max(resource_id) from users);

INSERT INTO users (resource_id, university) (select ur.resource_id, ur.university from universities_raw ur)
ON DUPLICATE KEY UPDATE users.university = ur.university;

DELETE from users where resource_id >= @maxid;
END $$

DELIMITER ;