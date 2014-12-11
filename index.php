<!DOCTYPE HTML>
<html>
	<head>
		<title>Bootstrap test</title>
		<meta name "viewport" content "width=device-width, initial-scale=1.0">
		<link href = "css/bootstrap.min.css" rel = "stylesheet">
		<link href = "css/styles.css" rel = "stylesheet">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<?php 
			include 'connect.php';
		?>
	</head>
	<body>
<div class="container">
	<div class="row">
		<div class="col-lg-3">
		<?php include 'displayCategories.php';?>
		</div>
	</div>
</div>	
	
		
	</body>

</html>