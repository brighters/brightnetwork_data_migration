<?php
/**
 * Created by PhpStorm.
 * User: thomasbrightwell
 * Date: 16/06/2014
 * Time: 15:07
 */

    // connect to the server through local ssh tunnel ssh -L localhost:5400:localhost:5432 user@brightnetwork.co.uk
    $psql_resource = pg_connect('host=localhost port=5400 dbname=website user=super password=************');

    $mysql_resource = mysql_connect('localhost', 'root', '');
    mysql_select_db('data_migration');

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
        echo "Grabbing profile image for user " . $user_id . "\n";
        $query = 'select \'.\' || ft.extension as "extension", r.id as "user_id", data from resource r
                            join connection c on r.id = c.resource_id_from
                            join resource rfile on c.resource_id_to = rfile.id and rfile.resource_type_id = 16
                            join file f on rfile.id = f.resource_id
                            join file_type ft on f.file_type_id = ft.id
                            where r.resource_type_id = 38 and r.id = ' . $user_id;

        echo "Grabbing salesforce_id for user " . $user_id . "\n";
        $salesforce_id_query = mysql_query('select salesforce_id from users where resource_id = ' . $user_id);
        $salesforce_id_query_row = mysql_fetch_assoc($salesforce_id_query);
        $salesforce_id = $salesforce_id_query_row['salesforce_id'];  // only need the first one
        echo "Salesforce_id is " . $salesforce_id . "\n";

        $fileResponse = pg_query($query);
        $fileData = pg_fetch_array($fileResponse); // only need the first one because this is always the largest format
        $data = pg_unescape_bytea($fileData['data']);
        $filename = "images/" . $salesforce_id . $fileData['extension'];
        echo "Opening file " . $filename . "\n";
        $fileHandle = fopen($filename, 'w');
        fwrite($fileHandle, $data);
        fclose($fileHandle);
        echo "Closing file " . $filename . "\n";
    }



