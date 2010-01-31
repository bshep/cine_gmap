<?php 
	error_reporting(E_ALL);

	require 'config.php';
	
	mysql_connect($db_host, $db_user, $db_pass);
	mysql_select_db($db_name);
	
	$query = "SELECT theater.*, lat,`long` as lon FROM theater INNER JOIN theater_info ON theater.name = theater_info.name";
	
	$res = mysql_query($query);
	
	if(!$res) {
		die('Invalid query: ' . mysql_error());
	}
	
	$output = array();
	
	while( $row = mysql_fetch_assoc($res)) {
		// print_r($row);
		$output[] = $row;
	}
	// print_r($output);
	print json_encode($output);
?>