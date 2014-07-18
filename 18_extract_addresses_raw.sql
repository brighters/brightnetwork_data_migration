select r.id as "resource_id", l.address from resource r 
join connection c on r.id = c.resource_id_from
join location l on c.resource_id_to = l.id
where r.resource_type_id = 38
order by r.id