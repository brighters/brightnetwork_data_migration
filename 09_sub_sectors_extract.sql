select r.id as "resource_id", ot.id as "sub_sector_id", ot.name as "sub_sector" from resource r 
join connection c on r.id = c.resource_id_from
join organisation_type ot on c.resource_id_to = ot.id
where r.resource_type_id = 38
order by r.id