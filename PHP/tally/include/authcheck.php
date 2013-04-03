<? 
session_start();
if(isset($_SESSION['username']) && isset($_GET['organizationid'])){
	$_SESSION['organizationid'] = $_GET['organizationid'];
}
if(!isset($_SESSION['organizationid'])){
	header ("Location: login.php");
}
if(isset($_GET['logout']) && $_GET['logout'] == 1){
	unset($_SESSION['organizationid']);
	if(isset($_SESSION['username'])){
		unset($_SESSION['username']);
		header ("Location: ../tally/admin/login.php");	
	}
	if(isset($_SESSION['custnum'])){
		unset($_SESSION['custnum']);
		header ("Location: login.php");	
	}
}
?>