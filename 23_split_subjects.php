<?php

	$link = mysql_connect('localhost', 'root', '');
	mysql_select_db('data_migration', $link);
	$response = mysql_query('SELECT * from subjects_raw;');

	$count = 0;
	while (($row = mysql_fetch_assoc($response))){

		$subjects = $row["subjects"];
		$subjects_array = explode(';', $subjects);
		$resource_id = $row["resource_id"];
		$subject_count = 1;
		foreach($subjects_array as $subject){

			$query = 'UPDATE subjects_raw SET subject_' . $subject_count . ' = "' . $subject . '" WHERE resource_id = ' . $resource_id . ';';
			$update_response = mysql_query($query);

			if (!$update_response) {
		     	$message  = 'Invalid query: ' . mysql_error() . "\n";
		     	$message .= 'Whole query: ' . $query;
		     	die($message);
		 	}

			if($update_response){
				$count ++;
			}

			$subject_count ++;
		}

	}

	echo $count . ' records updated\n';

?>