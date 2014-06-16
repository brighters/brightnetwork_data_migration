update users u
join eligibility_raw er on u.resource_id = er.user_id
set u.right_to_work_in_uk = 0