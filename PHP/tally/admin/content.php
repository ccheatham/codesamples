<?  
/*
	Author: Ched Cheatham
	Email:ched.cheatham@mindrally.com
	Customer:Spirit of America - Montgomery, Alabama
	Date:September 24, 2005
	Purpose:
	ToDo:
*/

// Page variable initialization
include 'include/authcheck.php';
$tablewidth = 400;
if(isset($_POST['cancel_x'])){
	header ("Location: ". $_SERVER['SCRIPT_NAME']);
	break;
}
$systemMessage = '';
$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ("wwwspir_soa");

// edit group 
if(isset($_POST['save_x'])){
	$query = "update content ";
	$query .= "set title = " . "'" . $_POST['title'] . "', ";
	$query .= "body = " . "'" . $_POST['body'] . "'";
	$query .= " where contentid = " . "'" . $_POST['contentid'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'Content Updated';
}  

// page queries 
$getpagecontentdata= "select contentid, UPPER(c.label) as label, c.title, c.body from content c";
$getpagecontentdata_result = mysql_query($getpagecontentdata) or die('Query failed: ' . mysql_error());

mysql_close($dbconn);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spirit of America</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" href="../style.css" media="all" rel="stylesheet">
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="container" align="center">
	<?  include 'http://' . $_SERVER["HTTP_HOST"] . '/tally/include/header.php' ?>
	<tr>
		<!--- nested table is where content goes --->
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
				<td colspan="2">
					<? include 'include/adminnav.php'; ?>
				</td>
				</tr>
							
				<tr>
					<td colspan="2"><h1>Manage Content</h1><br>
						<p>
							Each editable content section below represents the copy that customers will see in each given area.  
						</p>					
						<br>
						<? 
							if(isset($systemMessage) && strlen($systemMessage)){ 
								echo( '<p><font color=red><b></b><br>' . $systemMessage . '<br>'); 
							} 
						?>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
					
					<? while ($contentdata = mysql_fetch_array($getpagecontentdata_result  , MYSQL_ASSOC)) { ?>
					<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post">
					<input type="hidden" size="20" name="contentid" value="<?  echo $contentdata['contentid'] ?>">
						<table cellpadding="0" cellspacing="0" border="0" id="content" width="<? echo $tablewidth ?>">
							<tr>
								<td bgcolor="#cccccc" colspan="2">
									<p>
										<strong>
											<?  echo $contentdata['label'] ?>
										</strong>
										<br><br><br>
											<input name="save" type="image" src="../images/saveBtn.gif" border="0"><input name="cancel" type="image" src="../images/cancelBtn.gif" border="0">
									</p>
								</td>
							</tr>

							<tr>
								<td background="../images/pattern.gif"><p><strong>TITLE</strong></p></td>
								<td><input type="text" size="70" name="title" value="<?  echo $contentdata['title'] ?>"></td>
							</tr>
							
							<tr>
								<td background="../images/pattern.gif"><p><strong>BODY</strong></p></td>
								<td><textarea cols="75" rows="15" name="body"><?  echo $contentdata['body'] ?></textarea></td>
							</tr>
						</table>
						</form>
						<?  } ?>
						
					</td>
				</tr>
				
			</table>
		</td>
	</tr>
</table>
</body>
</html>
