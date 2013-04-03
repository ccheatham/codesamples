<? 
/*
	Author: Ched Cheatham
	Email:ched.cheatham@mindrally.com
	Customer:Spirit of America - Montgomery, Alabama
	Date:September 24, 2005
	Purpose:
	ToDo:
	Add error checking for file uploaded.
*/
$systemmessage = '';
if(isset($_POST['login'])){
	$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
	mysql_select_db ("wwwspir_soa"); 
	$query = "SELECT * FROM adminuser where username ='" . $_POST['soaUsername'] . "' and password = '" . $_POST['soaPassword'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	if(mysql_num_rows($result)){
		$thisRecord = mysql_fetch_array($result, MYSQL_ASSOC); 
		session_start();
		$_SESSION['bIsAdmin'] = 1;
		$_SESSION['username'] = $thisRecord['username'];
		$_SESSION['roles'] = $thisRecord['roles'];
		header ("Location: organizationlist.php");
	}
	else{
		$systemmessage = '<p style="color=red;">Improper Credentials, please try again.</p>';
	}
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spirit of America</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" href="../style.css" media="all" rel="stylesheet">
</head>

<body OnLoad="document.login.soaUsername.focus();">
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="container">
	<?  include 'http://' . $_SERVER["HTTP_HOST"] . '/tally/include/header.php' ?>
	
	<tr>
		<!--- nested table is where content goes --->
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td>
						<?  echo $systemmessage ?>
						<form action="login.php" method="post" name="login">
							<table cellpadding="0" cellspacing="0" border="0" width="500" class="content">
								<tr>
									<td bgcolor="#cccccc" colspan="2"><p><strong>LOGIN</strong></p></td>
								</tr>
								<tr>
									<td background="../images/pattern.gif" width="25%"><p>User Name:</p></td>
									<td><input type="text" name="soaUsername" size="20"></td>
								</tr>
								
								<tr>
									<td background="../images/pattern.gif"><p>Password:</p></td>
									<td><input type="password" name="soaPassword" size="20"></td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td align="left"><p><input name="login" type="submit" value="Login"></p><br></td>
						<td></td>
					</tr>
							
				</form>
						
					</td>
				</tr>
				
			</table>
		</td>
	</tr>
</table>
</body>
</html>
