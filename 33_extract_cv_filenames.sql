select r.id || '.' || ft.extension as "filename", r.id as "user_id" from resource r
                            join connection c on r.id = c.resource_id_from
                            join resource rfile on c.resource_id_to = rfile.id and rfile.resource_type_id = 10
                            join file f on rfile.id = f.resource_id
                            join file_type ft on f.file_type_id = ft.id
                            where r.resource_type_id = 38