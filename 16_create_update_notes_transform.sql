delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_notes`()
BEGIN
SET @maxid = (select max(resource_id) from users);

INSERT INTO users (resource_id, notes) (select nr.resource_id, nr.notes from notes_raw nr)
ON DUPLICATE KEY UPDATE users.notes = nr.notes;

DELETE from users where resource_id > @maxid;
END$$

