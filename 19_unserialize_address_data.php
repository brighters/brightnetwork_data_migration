<?php

	$link = mysql_connect('localhost', 'root', '');
	mysql_select_db('data_migration', $link);
	$response = mysql_query('SELECT * from address_raw;');

	$count = 0;
	while (($row = mysql_fetch_assoc($response))){
		$address_object = unserialize($row["address"]);
		$mailing_street = $address_object["line_1"];
		if($address_object["line_2"]!=''){
			$mailing_street = $mailing_street . ' ' . $address_object["line_2"];
		}
		if($address_object["line_3"]!=''){
			$mailing_street = $mailing_street . ' ' . $address_object["line_3"];
		}
		$mailing_city = $address_object["city"];
		$mailing_country = $address_object["country"];
		$mailing_postcode = $address_object["postcode"];
		$resource_id = $row["resource_id"];
		$query = 'UPDATE address_raw SET mailing_street = "' . $mailing_street . '", 
		mailing_city = "' . $mailing_city . '", 
		mailing_country = "' . $mailing_country . '", 
		mailing_postcode = "' . $mailing_postcode . '"
		WHERE resource_id = ' . $resource_id . ';';

		$update_response = mysql_query($query);
		//var_dump($row);
		//var_dump($address_object);

		if (!$update_response) {
	     	$message  = 'Invalid query: ' . mysql_error() . "\n";
	     	$message .= 'Whole query: ' . $query;
	     	die($message);
		 }

		if($update_response){
			$count ++;
		}

	}

	echo $count . ' records updated\n';

?>
