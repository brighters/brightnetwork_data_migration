delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_subjects`()
BEGIN
SET @maxid = (select max(resource_id) from users);

INSERT INTO users (resource_id, undergrad_subject_1, undergrad_subject_2, undergrad_subject_3, undergrad_subject_4, undergrad_subject_5) 
(select sr.resource_id, sr.subject_1, sr.subject_2, sr.subject_3, sr.subject_4, sr.subject_5 from subjects_raw sr)
ON DUPLICATE KEY UPDATE 
    users.undergrad_subject_1 = sr.subject_1,
    users.undergrad_subject_2 = sr.subject_2,
    users.undergrad_subject_3 = sr.subject_3,
    users.undergrad_subject_4 = sr.subject_4,
    users.undergrad_subject_5 = sr.subject_5;

DELETE from users where resource_id > @maxid;
END$$

