<?php 
	require 'config.php';
?><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
		<title>Maps Test</title>
		<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=<?php echo $api_key; ?>&amp;sensor=false" type="text/javascript"></script>

		<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/gmaps.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="style.css" type="text/css" media="screen" title="no title" charset="utf-8">
	</head>
	<body id="index">
    <div id="map_canvas" style="width: 70%; height: 100%; float:left; border: 1px solid black;"></div>
		<div id="sidebar">
	    <div id="theater_list" style="height:50%; border; 1px solid black;"></div>
	    <div id="route" style="height:50%; border; 1px solid black;"></div>			
		</div>
			
		<div id="spinner" style="display: none; position: absolute; height: 100%; width: 100%; vertical-align: middle;">
			<div style="line-height: 125px; text-align: center;">
				<img id="loader-anim" src="images/ajax-loader.gif" alt="waiting to load...">
			</div>
		</div>
				
	</body>
</html>