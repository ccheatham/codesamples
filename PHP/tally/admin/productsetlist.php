<?php 
/*
	Author: Ched Cheatham
	Email:ched.cheatham@mindrally.com
	Customer:Spirit of America - Montgomery, Alabama
	Date:September 24, 2005
	Purpose:
	ToDo:
	Add error checking for file uploaded.
*/
include 'include/authcheck.php';
$systemMessage = '';

	$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
	mysql_select_db ("wwwspir_soa"); 
	$getproductset = "select ps.*, count(p.fk_productsetid) as productcount
	from productset ps 
	left join product p on p.fk_productsetid = ps.productsetid 
	group by ps.productsetid";
	$getproductset_result = mysql_query($getproductset) or die('Query failed: ' . mysql_error());

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
					<td><h1><img src="../images/productset.gif"> Product Sets</h1></td>
				</tr>
				
				  <tr>
				  <td>
					<p>
						Click on a product set below to manage associated products.  The product set marked as <br>
						'Default' is the product set that will be automatically selected in Import Organizations. The number <br>
						of associated products is indicated after the product set name.
					</p>				
					<br>
				  </td>
				  </tr>
					  <tr>
				  <td>
					<p>
						<a href="productset.php"><img src="../images/addProds.gif" border="0"> Add Product Set</a>
					</p>					
					<br>
				  </td>
				  </tr>
				<tr>
					<td colspan="2">
						<table cellpadding="0" cellspacing="0" border="0" id="content" width="500">
													
							<tr class="prodNumb">
								<td width="45%"><p>PRODUCT SET NAME</p></td>
								<td width="5%"><p>PRODUCTS</p></td>
								<td width="25%"><p>CODE</p></td>
								<td width="20%"><p>DEFAULT</p></td>
							</tr>
						<? while ($thisRecord = mysql_fetch_array($getproductset_result , MYSQL_ASSOC)) { ?>
							<tr>
								<td>
								<p>
									<a href="productset.php?productsetid=<? echo $thisRecord['productsetid']; ?>"><img src="../images/editProds.gif" border="0"> <? echo $thisRecord['name']; ?></a>
								</p>
								</td>
								<td align="center"><?  echo $thisRecord['productcount'] ?></p></td>
								<td><p><? echo $thisRecord['code'] ?>&nbsp;</p></td>
								<td><p><? if($thisRecord['bdefault']) echo 'Default'; ?>&nbsp;</p></td>
							</tr>
						<? 
							} 
							mysql_close($dbconn);
						?>
						</table>
					</td>
				</tr>
				
			</table>
		</td>
	</tr>
</table>
</body>
</html>
