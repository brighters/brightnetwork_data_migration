update users u
join profile_images_raw p on u.resource_id = p.user_id
set u.profile_image = concat('http://www.brightnetwork.co.uk/sites/default/files/pictures/', p.filename)