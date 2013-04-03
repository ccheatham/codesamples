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

// Page variable initialization
?>
<table cellpadding="0" cellspacing="0" border="0" width="98%">
  <tr class="orgDetails">
    <td>
		<p>
			<img src="http://<?  echo $_SERVER["HTTP_HOST"] ?>/tally/images/orgs.gif" /> <a href="/tally/admin/organizationlist.php">Organizations</a> | 
			<img src="http://<?  echo $_SERVER["HTTP_HOST"] ?>/tally/images/productset.gif" /> <a href="/tally/admin/productsetlist.php">Product Sets</a> | 
			<img src="http://<?  echo $_SERVER["HTTP_HOST"] ?>/tally/images/importorg.gif" /> <a href="/tally/admin/import_organizations.php">Import Organizations</a> | 
			<img src="http://<?  echo $_SERVER["HTTP_HOST"] ?>/tally/images/editContent.gif" /> <a href="/tally/admin/content.php">Manage Content</a>
		</p>
	</td>
    <td align="right" id="logout">
		<p>
			You are logged in as <strong><?  echo $_SESSION['username'] ?></strong> | <a href="?logout=1">Logout</a>
		</p>
		<br />
		<p>
			<?=date("F j, Y, g:i a T"); ?>
		</p>
	</td>
  </tr
 ></table>
 
 