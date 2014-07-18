select u.id as "user_id", min(a.timestamp_from) as "signup_date" from "user" u 
join activity a on u.id = a.user_id
where action_id = 1
group by u.id
order by min(a.timestamp_from)