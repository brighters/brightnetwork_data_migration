select u.id as "user_id", p.number_computed as "phone" from "user" u
join resource r on u.id = r.id
join connection c on r.id = c.resource_id_from
join phone p on c.resource_id_to = p.id