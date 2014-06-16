<?php

	$link = mysql_connect('localhost', 'root', '');
	mysql_select_db('data_migration', $link);
	$response = mysql_query('SELECT distinct(user_id) from a_levels_raw;');

	$userRowCount = 0;
	while ($row = mysql_fetch_assoc($response)){

		// work through each user
		$user_id = $row['user_id'];

		// get their a level subjects and grades
		$query = 'SELECT grade, a_level from a_levels_raw where user_id = "' . $user_id .'";';
		$a_levels_grades_and_subjects = mysql_query($query);
		if (!$a_levels_grades_and_subjects) {
	     	$message  = 'Invalid query: ' . mysql_error() . "\n";
	     	$message .= 'Whole query: ' . $query;
	     	die($message);
		 }

		
		// work through each subject and grade pair
		$subjectGradeCount = 1;
		while ($grade_subject = mysql_fetch_assoc($a_levels_grades_and_subjects)){

			// table only accepts 5 subjects
			if ($subjectGradeCount > 5){
				break;
			}
			$grade = $grade_subject['grade'];
			$subject = $grade_subject['a_level'];
			$subjectColumnName = 'a_level_subject_' . $subjectGradeCount;
			$gradeColumnName = 'a_level_grade_' . $subjectGradeCount;

			$query = 'UPDATE users SET ' . $subjectColumnName . ' = "' . $subject . '", ' . $gradeColumnName . ' = "' . $grade . '" WHERE resource_id = "' . $user_id . '";';
			$user_update_response = mysql_query($query);
			if (!$user_update_response) {
	     		$message  = 'Invalid query: ' . mysql_error() . "\n";
	     		$message .= 'Whole query: ' . $query;
	     		die($message);
		 	}
			$subjectGradeCount ++;
		}

		echo '.';

	$userRowCount ++;	

	}

	echo $userRowCount . ' user records updated \n';

?>