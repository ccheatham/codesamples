<?php 
/*
	Author: Ched Cheatham
	Email:ched.cheatham@mindrally.com
	Customer:Spirit of America - Montgomery, Alabama
	Date:September 24, 2005
	Purpose:
*/
include 'include/authcheck.php';

$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ("wwwspir_soa"); 

if(isset($_POST['save_x'])){
	//array_walk($_POST, 'trim_value');
	$query = "update organization ";
	$query .= "set company = " . "'" . $_POST['company'] . "',";
	$query .= "addr = " . "'" . $_POST['addr'] . "',";
	$query .= "addr2 = " . "'" . $_POST['addr2'] . "',";
	//$query .= "city = " . "'" . $_POST['city'] . "',";
	//$query .= "state = " . "'" . $_POST['state'] . "',";
	//$query .= "custnum = " . "'" . $_POST['custnum'] . "',";
	//$query .= "zipcode = " . "'" . $_POST['zipcode'] . "',";
	$query .= "firstname = " . "'" . $_POST['firstname'] . "',";
	$query .= "lastname = " . "'" . $_POST['lastname'] . "',";
	$query .= "phone = " . "'"  . $_POST['phone'] . "',";
	$query .= "contactcellphone = " . "'"  . $_POST['contactcellphone'] . "',";
	$query .= "contactdaytimephone = " . "'"  . $_POST['contactdaytimephone'] . "',";
	$query .= "contactphone = " . "'"  . $_POST['contactphone'] . "',";
	$query .= "primaryemail = " . "'" . $_POST['primaryemail'] . "'";
	$query .= " where organizationid = " . "'" . $_SESSION['organizationid'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$status = 'updated';
} 


if(isset($_POST['editproductset_x'])){		
		$a_workingeditsetkeys = array_keys($_POST['productprice']);
		$a_workingeditsetvalues = array_values($_POST['productprice']);
	
		for ($i = 0; ; $i++) {
		   if ($i == count($a_workingeditsetkeys)) {
			   break;
		   }
			$query = "update organization_product ";
			$query .= "set productprice = " . "'" . $a_workingeditsetvalues[$i] . "'";
			$query .= " where fk_organizationid = " . "'" . $_SESSION['organizationid'] . "'";
			$query .= " and fk_productid = " . "'" . $a_workingeditsetkeys[$i] . "'";
			$result = mysql_query($query) or die('Query failed: ' . mysql_error());
		}
		$systemMessage = 'Prices Updated';
} 


$getorganizationinformation = "select o.* from organization o where organizationid = " . "'" . $_SESSION['organizationid'] . "'";
$getorganizationinformation_result = mysql_query($getorganizationinformation) or die('Query failed: ' . mysql_error());
$thisOrganization = mysql_fetch_array($getorganizationinformation_result, MYSQL_ASSOC);


//page queries
$getorganizationinpagedata= "select c.title, c.body from content c where c.contentid = 7";
$getorganizationinpagedata_result = mysql_query($getorganizationinpagedata) or die('Query failed: ' . mysql_error());
$organizationinpagedata = mysql_fetch_array($getorganizationinpagedata_result  , MYSQL_ASSOC);



$getorganizationproductsets = "select ps.* 
from organization o, organization_productset o_ps, productset ps
where o.organizationid = o_ps.fk_organizationid
and o_ps.fk_productsetid = ps.productsetid
and organizationid = " . "'" . $_SESSION['organizationid'] . "'";
$getorganizationproductsets_result = mysql_query($getorganizationproductsets) or die('Query failed: ' . mysql_error());



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
					<td colspan="3">
						<? include 'include/nav.php'; ?>
					</td>
				</tr>
				<tr class="orgDetails">
					<td colspan="2"><h1><a href="group.php"><img src="images/editOrg.gif" border="0"> <?  echo $thisOrganization['company'] ?></a></h1></td>
				</tr>
				<tr>
					<td colspan="2">
						<p class="doNotPrint">
							<?=$organizationinpagedata['body'];?>
						</p>  
						<br>
						<br>
					</td>
				</tr>
				<tr>
					<td valign="middle" colspan="2">
						<p>
							<a href="group.php"><img src="images/group.gif" border="0">&nbsp;Edit Class/Group</a> |
							<a href="mailto:spiritofamerica@spirit-of-america.com?subject=Tally Tool Web Comments">Send Feedback</a>
						</p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post">
							
							<table cellpadding="0" cellspacing="0" border="0" class="content" width="500">
								
								<tr>
									<td colspan="2" bgcolor="#cccccc"><p><strong>COMPANY INFORMATION</strong></p></td>
								</tr>
								<tr>
									<td background="images/pattern.gif" width="25%"><p>Customer Number: </p></td>
									<td> <input type="text" name="custnum" size="6" value="<?  echo $thisOrganization['custnum'] ?>" disabled></td>
								</tr>
								
								<tr>
									<td background="images/pattern.gif"><p>Organization Name: </p></td>
									<td> <input type="text" name="company" size="30" value="<?  echo $thisOrganization['company'] ?>"></td>
								</tr>
								<tr>
									<td background="images/pattern.gif"><p>Phone: </p></td>
									<td>
										<input type="text" name="phone" size="30" value="<?  echo $thisOrganization['phone'] ?>"> 
									</td>
								</tr>
								<tr>
									<td background="images/pattern.gif"><p>Address 1: </p></td>
									<td><input type="text" name="addr" size="80" value="<?  echo $thisOrganization['addr'] ?>"></td>
								</tr>
								
								<tr>
									<td background="images/pattern.gif"><p>Address 2: </p></td>
									<td><input type="text" name="addr2" size="80" value="<?  echo $thisOrganization['addr2'] ?>"></td>
								</tr>
								
								<tr>
									<td background="images/pattern.gif"><p>City: </p></td>
									<td><input type="text" name="city" size="30" value="<?  echo $thisOrganization['city'] ?>" disabled></td>
								</tr>
								
								<tr>
									<td background="images/pattern.gif"><p>State: </p></td>
									<td><input type="text" name="state" size="2" maxlength="2" value="<?  echo $thisOrganization['state'] ?>" disabled></td>
								</tr>
								
								<tr>
									<td background="images/pattern.gif"><p>Zip: </p></td>
									<td><input type="text" name="zipcode" size="10" value="<?  echo $thisOrganization['zipcode'] ?>" disabled></td>
								</tr>
								
								<tr>
									<td background="images/pattern.gif"><p>Country: </p></td>
									<td><input type="text" name="country" size="30" value="<?  echo $thisOrganization['country'] ?>" disabled></td>
								</tr>
							</table>
							
							<table cellpadding="0" cellspacing="0" border="0" class="content" width="500">
								<tr>
									<td colspan="2" bgcolor="#cccccc"><p><strong>CONTACT PERSON</strong></p></td>
								</tr>
								<tr>
									<td background="images/pattern.gif" width="25%"><p>First Name: </p></td>
									<td>
										<input type="text" name="firstname" size="30" value="<?  echo $thisOrganization['firstname'] ?>"> 
									</td>
								</tr>
								
								<tr>
									<td background="images/pattern.gif"><p>Last Name: </p></td>
									<td>
										<input type="text" name="lastname" size="30" value="<?  echo $thisOrganization['lastname'] ?>"> 
									</td>
								</tr>
								<tr>
									<td background="images/pattern.gif"><p>Primary Email: </p></td>
									<td>
										<input type="text" name="primaryemail" size="50" value="<?  echo $thisOrganization['primaryemail'] ?>"> 
									</td>
								</tr>
								<tr>
									<td background="images/pattern.gif"><p>Phone: </p></td>
									<td>
										<input type="text" name="contactphone" size="30" value="<?  echo $thisOrganization['contactphone'] ?>"> 
									</td>
								</tr>
								<tr>
									<td background="images/pattern.gif"><p>Daytime Phone: </p></td>
									<td>
										<input type="text" name="contactdaytimephone" size="30" value="<?  echo $thisOrganization['contactdaytimephone'] ?>"> 
									</td>
								</tr>
								<tr>
									<td background="images/pattern.gif"><p>Cell Phone: </p></td>
									<td>
										<input type="text" name="contactcellphone" size="30" value="<?  echo $thisOrganization['contactcellphone'] ?>"> 
									</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="500">
								<tr>
									<td align="right" colspan="2"><p><input name="save" type="image" src="images/saveBtn.gif" value="Save"></p><br></td>
								</tr>
							</table>
							</form>
							
							<? while ($organizationproductsets = mysql_fetch_array($getorganizationproductsets_result, MYSQL_ASSOC)) { ?>
							<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post">
							<input name="productsetid" type="hidden" size="4" name="value" value="<? echo $organizationproductsets['productsetid'] ?>"> 
							<table cellpadding="0" cellspacing="0" border="0" width="500" class="content">
								<tr>
									<td bgcolor="#cccccc" colspan="4"><p><strong><? echo strtoupper($organizationproductsets['name'] . ' Products') ?></strong></p></td>
								</tr>
								
								<tr class="prodNumb">
									<td width="20%"><p>NUMBER</p></td>
									<td width="45%"><p>NAME</p></td>
									<td width="20%" align="center"><p>UNITS PER CASE</p></td>
									<td width="30%" align="right"><p>UNIT PRICE</p></td>
								</tr>
								<?  
									$getproductsetproducts = "select p.productid, p.name as productname, p.sku, o_p.productprice, ps.productsetid, p.casecount
									from product p, productset ps, organization_productset o_ps, organization_product o_p
									where p.fk_productsetid = ps.productsetid
									and o_p.fk_productid = p.productid
									and o_ps.fk_productsetid = ps.productsetid
									and o_ps.fk_organizationid = o_p.fk_organizationid
									and ps.productsetid =  '" .  $organizationproductsets['productsetid'] . "' and o_ps.fk_organizationid = '" . $_SESSION['organizationid'] . "' group by p.productid";
									$getproductsetproducts_result = mysql_query($getproductsetproducts) or die('Query failed: ' . mysql_error());
								
								 ?>
								
								<? while ($productRecords = mysql_fetch_array($getproductsetproducts_result , MYSQL_ASSOC)) { ?>
								<tr>	
									<td><p><? echo $productRecords['sku'] ?></p></td>								
									<td><p><? echo $productRecords['productname'] ?></p></td>
									<td align="center"><p><? echo $productRecords['casecount'] ?></p></td>
									<td align="right">
										<p>
											$<input name="<? echo 'productprice['  .  $productRecords['productid'] . ']' ?>" type="text" size="4" value="<? echo $productRecords['productprice'] ?>"> 
										</p>
									</td>
								</tr>
								<?  } 
								?>		
														
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="500">
								<tr>
									<td align="right">
										<p>
											<input name="editproductset" type="image" src="images/saveBtn.gif" value="Save">
										</p><br>
									</td>
								</tr>
							</table>
							</form>
							<?  } ?>	
							
							</table>
						
					</td>
				</tr>
				
			</table>
		</td>
	</tr>
</table>
</body>
</html>


