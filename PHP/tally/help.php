<?
/*
	Author: Ched Cheatham
	Email:ched.cheatham@mindrally.com
	Customer:Spirit of America - Montgomery, Alabama
	Date:September 24, 2005
	Purpose:
	ToDo:
*/
//page queries
$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ("wwwspir_soa");

$gethelpdata= "select c.title, c.body from content c where c.contentid = 5";
$gethelpdata_result = mysql_query($gethelpdata) or die('Query failed: ' . mysql_error());
$helpdata = mysql_fetch_array($gethelpdata_result  , MYSQL_ASSOC);


?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spirit of America</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" href="style.css" media="all" rel="stylesheet">
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="container" align="center">
<?  include 'http://' . $_SERVER["HTTP_HOST"] . '/tally/include/header.php' ?>
	<tr>
		<!--- nested table is where content goes --->
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td>
						<?  echo  $helpdata['body'] ?>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
