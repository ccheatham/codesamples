<? 
session_start();
if(!isset($_SESSION['username'])){
	header ("Location: login.php");
}
if(isset($_GET['logout']) && $_GET['logout'] == 1){
	unset($_SESSION['username']);
	unset($_SESSION['bIsAdmin']);
	unset($_SESSION['roles']);
	header ("Location: login.php");
}
?>