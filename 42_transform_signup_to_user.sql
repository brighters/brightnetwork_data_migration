update users u
join user_signup_date_raw ur on u.resource_id = ur.user_id
set u.signup_date = ur.signup_date