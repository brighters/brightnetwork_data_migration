select r.id as "resource_id", uni.name as "university" from resource r 
join connection c on r.id = c.resource_id_from
join university uni on c.resource_id_to = uni.id
where r.resource_type_id = 38
order by r.id