select distinct on (r.id) r.id as "resource_id",
u.forename, 
u.surname, 
ug.name as "gender",
cast(date_part('day', u.date_of_birth) AS INT) as "day_of_birth", 
cast(date_part('month', u.date_of_birth) AS INT) as "month_of_birth", 
cast(date_part('year', u.date_of_graduation) AS INT) as "graduation_year",
e.email
from resource r
join "user" u on r.id = u.id
join user_gender ug on u.user_gender_id = ug.id
join connection c on r.id = c.resource_id_from
join email e on c.resource_id_to = e.id
where r.resource_status_id = 1
order by r.id asc