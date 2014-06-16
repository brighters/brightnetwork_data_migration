SELECT 
user_to_school.resource_id_from, 
user_to_school.resource_id_to,
user_to_school.id,
to_qualification.resource_id_from,
to_qualification.resource_id_to,
to_qualification.id,
to_course.resource_id_from,
to_course.resource_id_to,
to_course.id,
to_subject.resource_id_from,
to_subject.resource_id_to,
to_subject.id,
to_grade.resource_id_from,
to_grade.resource_id_to,
to_grade.id,
g.name,
s.name
from connection user_to_school 
join resource rschool on user_to_school.resource_id_to = rschool.id and rschool.resource_type_id = 33
join connection to_qualification on user_to_school.id = to_qualification.resource_id_from
join connection to_course on to_qualification.id = to_course.resource_id_from
join connection to_subject on to_course.id = to_subject.resource_id_from
join connection to_grade on to_subject.id = to_grade.resource_id_from
join grade g on to_grade.resource_id_to = g.id
join subject s on to_subject.resource_id_to = s.id
where user_to_school.resource_id_from = 2431647