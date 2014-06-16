select 
r.id as "user_id",
k.code as "code"
from resource r
join connection c on r.id = c.resource_id_from
join resource rkeyword on c.resource_id_to = rkeyword.id
join keyword k on rkeyword.id = k.id
where rkeyword.resource_type_id = 21 and k.code = 'not_eligible_to_work_in_the_uk'