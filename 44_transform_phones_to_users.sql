update users u
join phones_raw pr on u.resource_id = pr.user_id
set u.contact_number = pr.phone