select r.id as "resource_id", ARRAY_TO_STRING(ARRAY_AGG(DISTINCT s.name),';') AS "subject" from resource r 
join connection c on r.id = c.resource_id_from
join subject s on c.resource_id_to = s.id
where r.resource_type_id = 38
group by r.id
order by r.id