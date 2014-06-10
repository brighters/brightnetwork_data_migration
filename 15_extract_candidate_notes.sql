select r.id as "resource_id", m.content as "notes" from resource r 
join connection c on r.id = c.resource_id_from
join multimedia m on c.resource_id_to = m.id and m.multimedia_type_id = 33
where r.resource_type_id = 38
order by r.id