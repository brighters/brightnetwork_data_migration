update users u
join cvs_raw cr on u.resource_id = cr.user_id
set u.cv = cr.filename