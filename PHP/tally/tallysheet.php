<?
/*
	Author: Ched Cheatham
	Email:ched.cheatham@mindrally.com
	Customer:Spirit of America - Montgomery, Alabama
	Date:September 24, 2005
	Purpose:
	ToDo:
*/

include 'include/authcheck.php';

//this redirect is to clear the get var form the URL
if(isset($_POST['cancel'])){
	header ("Location: ". $_SERVER['SCRIPT_NAME'] . "?sectionid=" . $_POST['sectionid']);
	break;
}

//database connection create
$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ("wwwspir_soa");

//add new ordertaker 
if(isset($_POST['add'])){		
	$query = "insert into ordertaker (name,fk_sectionid) values(";
	$query .= "'" .  $_POST['name'] . "',";
	$query .= "'" .  $_POST['sectionid'] . "'";
	$query .= ")";
	$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'New Order Taker Added';
	$newordertakerid = mysql_insert_id();

	// Add each product to new ordertaker
	$getproducts = "select o_p.fk_productid
	from organization_product o_p, organization_productset o_ps
	where o_ps.fk_organizationid = o_p.fk_organizationid
	and o_p.fk_organizationid = " .  $_SESSION['organizationid'];
	$getproducts_result = mysql_query($getproducts ) or die('Query failed: ' . mysql_error());
	
	while ($productRecords = mysql_fetch_array($getproducts_result , MYSQL_ASSOC)) {
		$query = "insert into ordertaker_product (fk_ordertakerid,fk_productid) values(";
		$query .= "'" . $newordertakerid . "',";
		$query .= "'" . $productRecords['fk_productid'] . "'";
		$query .= ")";
		$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());		
	}

	$a_workingaddsetkeys = array_keys($_POST['products']);
	$a_workingaddsetvalues = array_values($_POST['products']);

	for ($i = 0; ; $i++) {
	   if ($i == count($a_workingaddsetkeys)) {
		   break;
	   }
		$query = "update ordertaker_product ";
		$query .= "set unitcount = " . "'" . $a_workingaddsetvalues[$i] . "'";
		$query .= " where fk_ordertakerid = " . "'" . $newordertakerid . "'";
		$query .= " and fk_productid = " . "'" . $a_workingaddsetkeys[$i] . "'";
		$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	 }
	$systemMessage = 'New Order Taker Added Successfully';
	header ("Location: ". $_SERVER['SCRIPT_NAME'] . "?sectionid=" . $_POST['sectionid']);
	break;
} 

//edit ordertaker
if(isset($_POST['edit_x'])){
	$query = "update ordertaker ";
		$query .= "set name = " . "'" . $_POST['name'] . "'";
		$query .= " where ordertakerid = " . "'" . $_POST['ordertakerid'] . "'";
		$result = mysql_query($query) or die('Query failed: ' . mysql_error());
		
		$a_workingeditsetkeys = array_keys($_POST['products']);
		$a_workingeditsetvalues = array_values($_POST['products']);
	
		for ($i = 0; ; $i++) {
		   if ($i == count($a_workingeditsetkeys)) {
			   break;
		   }
			$query = "update ordertaker_product ";
			$query .= "set unitcount = " . "'" . $a_workingeditsetvalues[$i] . "'";
			$query .= " where fk_ordertakerid = " . "'" . $_POST['ordertakerid'] . "'";
			$query .= " and fk_productid = " . "'" . $a_workingeditsetkeys[$i] . "'";
			$result = mysql_query($query) or die('Query failed: ' . mysql_error());
		}
	$systemMessage = 'Order Taker Updated Successfully';
	header ("Location: ". $_SERVER['SCRIPT_NAME'] . "?sectionid=" . $_POST['sectionid']);
	break;
	
} 

//delete orderatekr
if(isset($_GET['delete'])){
	$query = "delete from ordertaker_product ";
	$query .= " where fk_ordertakerid = " . "'" . $_GET['delete'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	
	$query = "delete from ordertaker ";
	$query .= " where ordertakerid = " . "'" . $_GET['delete'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	
	$systemMessage = 'Order Taker Removed Successfully';
	header ("Location: ". $_SERVER['SCRIPT_NAME'] . "?sectionid=" . $_GET['sectionid']);
	break;
}  

//page queries
$getpageheaderdata= "select c.title, c.body from content c where c.contentid = 3";
$getpageheaderdata_result = mysql_query($getpageheaderdata) or die('Query failed: ' . mysql_error());
$pageheaderdata = mysql_fetch_array($getpageheaderdata_result  , MYSQL_ASSOC);

$getpagefooterdata= "select c.title, c.body from content c where c.contentid = 4";
$getpagefooterdata_result = mysql_query($getpagefooterdata) or die('Query failed: ' . mysql_error());
$pagefooterdata = mysql_fetch_array($getpagefooterdata_result  , MYSQL_ASSOC);

$getprintinstructions = "select c.title, c.body from content c where c.contentid = 6";
$getprintinstructions_result = mysql_query($getprintinstructions) or die('Query failed: ' . mysql_error());
$printinstructions = mysql_fetch_array($getprintinstructions_result  , MYSQL_ASSOC);


$getproductlist = "select o.company, p.name, p.productid, sum(ot_p.unitcount) as totalproductunits, (sum(ot_p.unitcount) * o_p.productprice) as totalproductmoney ,p.sku, p.columncolorcssclass, o_p.productprice
from organization o, product p, organization_product o_p, ordertaker_product ot_p, ordertaker ot ,section s
where o_p.fk_organizationid = o.organizationid
and o_p.fk_productid = p.productid
and ot_p.fk_productid = o_p.fk_productid
and ot.ordertakerid = ot_p.fk_ordertakerid
and ot.fk_sectionid = s.sectionid
and o.organizationid = s.fk_organizationid
and s.sectionid = '" . $_GET['sectionid'] . "' " .  "and o.organizationid = '" . $_SESSION['organizationid'] . "' group by p.productid";
$getproductlist_result = mysql_query($getproductlist) or die('Query failed: ' . mysql_error());

$getorganizationdata= "select IF(LENGTH(o.company) > 0, o.company, o.custnum) as company, s.name as sectionname
from organization o ,section s
where o.organizationid = s.fk_organizationid
and s.sectionid = '" . $_GET['sectionid'] . "'";
$getorganizationdata_result = mysql_query($getorganizationdata) or die('Query failed: ' . mysql_error());
$organizationdata = mysql_fetch_array($getorganizationdata_result  , MYSQL_ASSOC);
					
$getproductsetdata = "select p.productid, p.sku, p.columncolorcssclass,p.name 
from organization o, product p, organization_product o_p, productset ps, organization_productset o_ps
where o_p.fk_organizationid = o.organizationid
and o_ps.fk_productsetid = p.fk_productsetid
and o_p.fk_productid = p.productid
and o.organizationid ='" . $_SESSION['organizationid'] . "' group by p.productid";
$getproductsetdata_result = mysql_query($getproductsetdata) or die('Query failed: ' . mysql_error());	


$getordertakers = "select ot.name, ot.ordertakerid, s.name as sectionname
from ordertaker ot, section s
where ot.fk_sectionid = s.sectionid
and s.sectionid = '" . $_GET['sectionid'] . "' order by ordertakerid desc";
$getordertakers_result = mysql_query($getordertakers) or die('Query failed: ' . mysql_error());
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spirit of America</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" href="style.css" media="screen" rel="stylesheet">
<link type="text/css" href="print.css" media="print" rel="stylesheet">

<script language="javascript">
function printWindow() {
	bV = parseInt(navigator.appVersion);
	if (bV >= 4){ 
		confirm('<?  echo $printinstructions['title'] .  ': ' . $printinstructions['body']  ?>');
		window.print();
	}
}

function submitFormOnEnter(){
	if (window.event.keyCode == 13){
		document.ordertakerform.submit();
	}
	if (window.event.keyCode == 27){
		document.cancelform.submit();
	}
}
</script>

</head>
<body <? if(isset($_GET['action'])) echo('OnLoad=document.ordertakerform.name.focus();') ?>>
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
				<tr>
					<td colspan="3"><h1><a href="group.php"><img src="images/editOrg.gif" border="0"> <?  echo $organizationdata['company'] ?></a> > <?  echo $organizationdata['sectionname'] ?></h1></td>
				</tr>
				
				<tr>
					<td colspan="3"><p class="doNotPrint"><?  echo $pageheaderdata['body'] ?></p><br></td>
				</tr>
				<tr>
					<td colspan="3">
						<p class="doNotPrint">
							<span style="font-size:12px; color:#CC0000">Click To:&nbsp;</span>	
							<a href="?action=add&sectionid=<?  echo $_GET['sectionid'] ?>"><img src="images/addOT.gif" border="0" alt="Add An Order Taker">&nbsp;Add An Order Taker</a>  |
							<a href="group.php"><img src="images/group.gif" border="0" alt="Edit Class/Group">&nbsp;Edit Class/Group</a>  | 
							<a href="organization.php"><img src="images/editOrg.gif" border="0" align="middle" alt="Edit Organization">&nbsp;Edit Organization</a>  |
							<a href="javascript:printWindow();"><img src="images/print.gif" border="0" Click To Print>&nbsp;Print this page</a> |
							<!-- <a href="help.php" target="_blank"><img src="images/help.gif" border="0" alt="Click For Help">&nbsp;Get Help</a>-->
							<a href="mailto:feedback@spirit-of-america.com?subject=Tally Tool Web Comments">Send Feedback</a>
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					
						<table cellpadding="0" cellspacing="0" border="0" id="content" width="95%">
							<tr class="topBar">	
								<td background="images/pattern.gif" rowspan="2" align="left" valign="middle">
									&nbsp;&nbsp;<img src="images/editOT.gif" border="0" alt="Edit Order Taker"> = Edit Order Taker<br>
									&nbsp;&nbsp;<img src="images/deleteOT.gif" border="0" alt="Delete Order Taker"> = Delete Order Taker
								</td>
									<? while ($productsetproductlist = mysql_fetch_array($getproductsetdata_result  , MYSQL_ASSOC)) { ?>
										<td width="3%" class="<? echo $productsetproductlist['columncolorcssclass'] ?>"><p><? echo $productsetproductlist['name'] ?></p></td>
									<?  } 
										mysql_data_seek($getproductsetdata_result, 0);
									?>							
								<td background="images/pattern.gif" colspan="4" rowspan="2">&nbsp;</td>
							</tr>	
							<tr class="topBar">
									<? while ($productsetproductlist = mysql_fetch_array($getproductsetdata_result  , MYSQL_ASSOC)) { ?>
										<td class="<?  echo $productsetproductlist['columncolorcssclass'] ?>" height="10" align="center"><p>(<? echo $productsetproductlist['sku'] ?>)</p></td>
									<?  
										} 
										mysql_data_seek($getproductsetdata_result, 0);
									?>
							</tr>
							
							<tr class="prodNumb">
								<td width="15%"><p><a href="?action=add&sectionid=<?  echo $_GET['sectionid'] ?>"><img src="images/addOT.gif" border="0" align="Add Order Taker"></a> &nbsp;&nbsp;ORDER TAKER</p></td>
								<td colspan="<? echo mysql_num_rows($getproductsetdata_result) ?>">&nbsp;</td>
								<td width="3%" align="center"><p>UNIT TOTAL</p></td>
								<td align="right" width="4%"><p>MONEY TOTAL</p></td>
								<td width="1%" align="center"><p>DELV</p></td>
							</tr>
							<?  if(isset($_GET['action']) && $_GET['action'] == 'add'){ ?>							
								
							<tr>
								<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post" name="ordertakerform">
								<input type="hidden" name="sectionid" value="<? echo $_GET['sectionid'] ?>">
								<td valign="middle"><p><a href="javascript:document.cancelform.submit()"><img src="images/cancelBtn.gif" border="0"></a>&nbsp;&nbsp;<input type="text" name="name" size="35" value="" onKeyPress="if(window.event.keyCode==27){document.cancelform.submit();};"></p></td>
								<? while ($productsetproductlist = mysql_fetch_array($getproductsetdata_result  , MYSQL_ASSOC)) { ?>
								<td align="center">
									<p>
										<input type="text" name="<? echo 'products['  .  $productsetproductlist['productid'] . ']' ?>" size="6" value="" width="1">
									</p>
								</td>
								<?  } ?>
								<td align="center"><strong><input type="image" src="images/saveBtn.gif">&nbsp;</strong></td>
								<td align="right"><p><strong>&nbsp;&nbsp;</strong></p></td>
								<td><p>&nbsp;&nbsp;</p></td>
									<input type="hidden" name="add" value="add">
								</form>
							</tr>
							<?  } ?>
							<?  
								$recordcount = 0;
								$totalmoney = 0;
								$totalunits = 0;
								//this array is initialized with 0 for each product to hold the UNIT total per ordertaker calculation to display at the end of the tally
								$a_totalordertakerunitcount= array();	
								for ($i = 0; ; $i++) {
								   if ($i == mysql_num_rows($getproductlist_result)) {
									   break;
								   }
								   $a_totalordertakerunitcount[$i] = 0;
								}
								
								//this array is initialized with 0 for each product to hold the MONEY total per ordertaker calculation to display at the end of the tally
								$a_totalordertakermoney= array();	
								for ($i = 0; ; $i++) {
								   if ($i == mysql_num_rows($getproductlist_result)) {
									   break;
								   }
								   $a_totalordertakermoney[$i] = 0;
								}
	
							 ?>							
							<? while ($ordertakerRecords = mysql_fetch_array($getordertakers_result  , MYSQL_ASSOC)) { ?>
								<?  
									$getordertakercounts = "select ot_p.fk_ordertakerid as ordertakerid, 
									p.productid, p.casecount, ot_p.unitcount, o_p.productprice, o.organizationid
									from product p, ordertaker_product ot_p, organization_product o_p, 
									organization_productset o_ps, organization o, productset ps, section s, ordertaker ot
									where o.organizationid = o_p.fk_organizationid
									and s.fk_organizationid = o.organizationid
									and ot.fk_sectionid = s.sectionid
									and o_ps.fk_organizationid = o.organizationid
									and o_ps.fk_productsetid = ps.productsetid
									and o_ps.fk_productsetid = p.fk_productsetid
									and o_ps.fk_organizationid = o_p.fk_organizationid
									and p.fk_productsetid = ps.productsetid
									and o_p.fk_productid = p.productid
									and o_p.fk_productid = ot_p.fk_productid
									and ot_p.fk_productid = p.productid
									and ot_p.fk_ordertakerid = ot.ordertakerid
									and ot_p.fk_ordertakerid = "  . $ordertakerRecords['ordertakerid']  . " order by p.productid";
									$getordertakercounts_result = mysql_query($getordertakercounts) or die('Query failed: ' . mysql_error());
								?>							
								<? if(isset($_GET['action']) && $_GET['action'] == 'edit' && isset($_GET['ordertakerid']) && $_GET['ordertakerid'] == $ordertakerRecords['ordertakerid']){ ?>
							<tr>
								<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post" name="ordertakerform">
								<input type="hidden" name="sectionid" value="<? echo $_GET['sectionid'] ?>">
								<input type="hidden" name="ordertakerid" value="<? echo $ordertakerRecords['ordertakerid'] ?>">
								<td valign="middle"><p>	<input type="text" name="name" size="35" value="<? echo $ordertakerRecords['name'] ?>">&nbsp;&nbsp;<a href="javascript:document.cancelform.submit()"><img src="images/cancelBtn.gif" border="0"></a></p></td>
								
								<? while ($ordertakerCounts = mysql_fetch_array($getordertakercounts_result  , MYSQL_ASSOC)) { ?>
									<td align="center">
										<p>
											<input type="text" name="<? echo 'products['  .  $ordertakerCounts['productid'] . ']' ?>" size="6" value="<?  echo  $ordertakerCounts['unitcount'] ?>" width="1">
										</p>
									</td>
								<?  
									$a_totalordertakerunitcount[$recordcount] =+ $ordertakerCounts['unitcount'];
									$a_totalordertakermoney[$recordcount] =+ ($ordertakerCounts['unitcount'] * $ordertakerCounts['productprice']);
									} 
								?>
								
								<td align="center"><strong><input name="edit" type="image" src="images/saveBtn.gif" value="Save">&nbsp;</strong></td>
								<td align="right"><p><strong>&nbsp;</strong></p></td>
								<td><p>&nbsp;&nbsp;</p></td>
									<input type="hidden" name="edit" value="edit">
								</form>
							</tr>
							 <?  } 
								else{
							  ?>
							  <tr>
								<td height="10" valign="middle">
								<p>
									<a href="?sectionid=<? echo $_GET['sectionid'] ?>&delete=<? echo $ordertakerRecords['ordertakerid'] ?>" onClick="return confirm('Are you sure you want to delete <?  echo $ordertakerRecords['name'] ?> ');"> &nbsp;<img src="images/deleteOT.gif" border="0" alt="Delete Order Taker"></a>
									<a href="?action=edit&sectionid=<? echo $_GET['sectionid'] ?>&ordertakerid=<? echo $ordertakerRecords['ordertakerid'] ?>"> <img src="images/editOT.gif" border="0" alt="Edit Order Taker"> <? echo $ordertakerRecords['name'] ?></a>
								</p>
								</td>								
								<? while ($ordertakerCounts = mysql_fetch_array($getordertakercounts_result  , MYSQL_ASSOC)) { ?>
									<td align="center"><p><?  echo  $ordertakerCounts['unitcount'] ?></p></td>
								<?  
									$a_totalordertakerunitcount[$recordcount] = $a_totalordertakerunitcount[$recordcount] + $ordertakerCounts['unitcount'];
									$a_totalordertakermoney[$recordcount] = $a_totalordertakermoney[$recordcount] + ($ordertakerCounts['unitcount'] * $ordertakerCounts['productprice']);
									} 
								?>								
								<td align="center"><strong><p><?  echo $a_totalordertakerunitcount[$recordcount] ?></p></strong></td>
								<td align="right"><strong><p><?  echo money_format('$%#4n',$a_totalordertakermoney[$recordcount]) ?></p></strong></td>
								<td align="center">&nbsp;&nbsp;</td>
							</tr>
							  <?  
							  	
							  	$recordcount++;
								} 
								?>							  
							<?  
								} 	mysql_data_seek($getproductsetdata_result, 0);				
							?>
							<? if(mysql_num_rows($getordertakers_result) != 0){ ?> 
							<tr id="bottombar">
								<td background="images/pattern.gif"><p>TOTAL BY PRODUCT</p></td>
								<? 
									$totalmoney = 0;
									$totalunits = 0;
									
									while ($productlist = mysql_fetch_array($getproductlist_result  , MYSQL_ASSOC)) { 
										$totalmoney = $totalmoney + $productlist['totalproductmoney'];
										$totalunits = $totalunits + $productlist['totalproductunits'];
								?>
								
										<td class="<?  echo $productlist['columncolorcssclass'] ?>" align="center"><p><? echo $productlist['totalproductunits'] ?></p></td>
								<?  } ?>

								<td background="images/pattern.gif" align="center"><p><?  echo $totalunits  ?></p></td>
								<td background="images/pattern.gif" align="right"><p><?  echo money_format('$%#4n',$totalmoney)  ?></p></td>
								<td background="images/pattern.gif">&nbsp;&nbsp;</td>
							</tr>
							<? } ?>
						</table>
						<br>
						<p class="doNotPrint"><?  echo $pagefooterdata['body'] ?></p>
					</td>
					
				</tr>
				
			</table>
			
		</td>
	</tr>
</table>
<form name="cancelform" action="<?  echo $_SERVER['SCRIPT_NAME'] ?>?sectionid=<? echo $_GET['sectionid'] ?>" method="post">
	<input type="hidden" name="sectionid" value="<? echo $_GET['sectionid'] ?>">
	<input type="hidden" name="cancel" value="cancel">
</form>
</body>
</html>
<?  
	mysql_close($dbconn); 
	mysql_free_result($getproductlist_result); 
	mysql_free_result($getordertakers_result);
	mysql_free_result($getproductsetdata_result);
	mysql_free_result($getorganizationdata_result);      
?>