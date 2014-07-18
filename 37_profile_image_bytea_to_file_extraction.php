<?php
/**
 * Created by PhpStorm.
 * User: thomasbrightwell
 * Date: 16/06/2014
 * Time: 15:07
 */

    // connect to the server through local ssh tunnel ssh -L localhost:5400:localhost:5432 user@brightnetwork.co.uk
    $resource = pg_connect('host=localhost port=5400 dbname=website user=super password=************');

    // grab all the user IDs
    $userResponse = pg_query('select distinct(r.id) from resource r
                            join connection c on r.id = c.resource_id_from
                            join resource rfile on c.resource_id_to = rfile.id and rfile.resource_type_id = 16
                            join file f on rfile.id = f.resource_id
                            join file_type ft on f.file_type_id = ft.id
                            where r.resource_type_id = 38');

    // need to work through one by one to handle data
    while($user = pg_fetch_array($userResponse)){
        $user_id = $user['id'];
        $query = 'select r.id || \'.\' || ft.extension as "filename", r.id as "user_id", data from resource r
                            join connection c on r.id = c.resource_id_from
                            join resource rfile on c.resource_id_to = rfile.id and rfile.resource_type_id = 16
                            join file f on rfile.id = f.resource_id
                            join file_type ft on f.file_type_id = ft.id
                            where r.resource_type_id = 38 and r.id = ' . $user_id;

        $fileResponse = pg_query($query);
        $fileData = pg_fetch_array($fileResponse); // only need the first one because this is always the largest format
        $data = pg_unescape_bytea($fileData['data']);
        $filename = $fileData['filename'];
        $fileHandle = fopen($filename, 'w');
        fwrite($fileHandle, $data);
        fclose($fileHandle);
    }



