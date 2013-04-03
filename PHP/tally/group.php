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

if(isset($_POST['cancel'])){
	header ("Location: ". $_SERVER['SCRIPT_NAME']);
	break;
}

$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ("wwwspir_soa");

// delete group (also known as a section)
if(isset($_GET['deletesectionid'])){
	$query = "delete ordertaker_product, ordertaker from ordertaker_product ot_p, ordertaker ot	
	where ot.ordertakerid = ot_p.fk_ordertakerid
	and ot.fk_sectionid =" . "'" . $_GET['deletesectionid'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	
	$query = "delete from section ";
	$query .= " where sectionid = " . "'" . $_GET['deletesectionid'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'Group Removed Successfully';
	header ("Location: ". $_SERVER['SCRIPT_NAME']);
	break;
}

// edit group 
if(isset($_POST['edit'])){
	$query = "update section ";
	$query .= "set name = " . "'" . $_POST['name'] . "'";
	$query .= " where sectionid = " . "'" . $_POST['sectionid'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'Group Edited Successfully';
	header ("Location: ". $_SERVER['SCRIPT_NAME']);
	break;
}  

//add new group
if(isset($_POST['add'])){	
	$query = "insert into section (name,fk_organizationid) values(";
	$query .= "'" .  $_POST['name'] . "',";
	$query .= "'" .  $_SESSION['organizationid'] . "'";
	$query .= ")";
	$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'Group Added Successfully';
	header ("Location: ". $_SERVER['SCRIPT_NAME']);
	break;
}  

// page queries 
$getpageheaderdata= "select c.title, c.body from content c where c.contentid = 1";
$getpageheaderdata_result = mysql_query($getpageheaderdata) or die('Query failed: ' . mysql_error());
$pageheaderdata = mysql_fetch_array($getpageheaderdata_result  , MYSQL_ASSOC);

$getpagefooterdata= "select c.title, c.body from content c where c.contentid = 2";
$getpagefooterdata_result = mysql_query($getpagefooterdata) or die('Query failed: ' . mysql_error());
$pagefooterdata = mysql_fetch_array($getpagefooterdata_result  , MYSQL_ASSOC);

$getprintinstructions = "select c.title, c.body from content c where c.contentid = 6";
$getprintinstructions_result = mysql_query($getprintinstructions) or die('Query failed: ' . mysql_error());
$printinstructions = mysql_fetch_array($getprintinstructions_result  , MYSQL_ASSOC);

$getorganizationdata= "select IF(LENGTH(o.company) > 0, o.company, o.custnum) as company, o.custnum from organization o where o.organizationid = '" . $_SESSION['organizationid'] . "'";
$getorganizationdata_result = mysql_query($getorganizationdata) or die('Query failed: ' . mysql_error());
$organizationdata = mysql_fetch_array($getorganizationdata_result  , MYSQL_ASSOC);

$getproductsetdata = "select p.productid, p.sku, p.columncolorcssclass,p.name 
from organization o, product p, organization_product o_p, productset ps, organization_productset o_ps
where o_p.fk_organizationid = o.organizationid
and o_ps.fk_productsetid = p.fk_productsetid
and o_p.fk_productid = p.productid
and o.organizationid ='" . $_SESSION['organizationid'] . "' group by p.productid";
$getproductsetdata_result = mysql_query($getproductsetdata) or die('Query failed: ' . mysql_error());	

$getgroups = "select * from section where fk_organizationid = '" . $_SESSION['organizationid'] . "' order by sectionid desc";
$getgroups_result = mysql_query($getgroups) or die('Query failed: ' . mysql_error());
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
			//alert('You pressed ' + window.event.keyCode);
			document.groupform.submit();
		}
	}
</script>

</head>
<body <? if(isset($_GET['action'])) echo('OnLoad=document.groupform.name.focus();') ?>>
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
					<td colspan="3"><h1><img src="images/org.gif" border="0"> <?  echo $organizationdata['company'] ?></h1></td>
				</tr>
				<tr>
					<td colspan="3"><p class="doNotPrint"><?  echo $pageheaderdata['body'] ?></p><br></td>
				</tr>
				<tr>
					<td colspan="3">
						<p class="doNotPrint">
							<span style="font-size:12px; color:#CC0000">Click To:&nbsp;</span>	
							<a href="?action=add"><img src="images/addGroup.gif" border="0" alt="Add A Group">&nbsp;Add A Class/Group</a>  |
							<a href="organization.php"><img src="images/editOrg.gif" border="0" align="middle" alt="Edit Organization">&nbsp;Edit Organization</a>  |
							<a href="javascript:printWindow();"><img src="images/print.gif" border="0" alt="Click To Print">&nbsp;Print this page</a>  |
							<!-- <a href="help.php" target="_blank"><img src="images/help.gif" border="0" alt="Click For Help">&nbsp;Get Help</a>-->
							<a href="mailto:feedback@spirit-of-america.com?subject=Tally Tool Web Comments">Send Feedback</a>
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<table cellpadding="0" cellspacing="0" border="0" id="content" width="95%">
							<tr class="topBar">	
								<td background="images/pattern.gif" rowspan="2" align="left" valign="middle">
									&nbsp;&nbsp;<img src="images/editGroup.gif" border="0" alt="Edit Group"> = Edit Group<br>
									&nbsp;&nbsp;<img src="images/deleteGroup.gif" border="0" alt="Delete Group"> = Delete Group
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
								<td width="15%"><p><a href="?action=add"><img src="images/addGroup.gif" border="0"></a> &nbsp;&nbsp;&nbsp;CLASS/GROUP NAME</p></td>
								<td colspan="<? echo mysql_num_rows($getproductsetdata_result) ?>">&nbsp;</td>
								<td width="1%" align="center"><p>TOTAL</p></td>
								<td align="right" width="4%"><p>TOTAL</p></td>
							</tr>
							<?  if(isset($_GET['action']) && $_GET['action'] == 'add'){ ?>
							<tr>
								<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post" name="groupform">
								<td valign="middle">
									<p>
										<input name="name" type="text" size="35"> 
										&nbsp;&nbsp;<a href="javascript:document.groupform.submit()"><img src="images/addBtn.gif" border="0"></a>
										&nbsp;&nbsp;<a href="javascript:document.cancelform.submit()"><img src="images/cancelBtn.gif" border="0"></a>
									</p>
								</td>
									<input type="hidden" name="add" value="add">
								</form>
									<? while ($productsetproductlist = mysql_fetch_array($getproductsetdata_result  , MYSQL_ASSOC)) { ?>
										<td align="center"><p>0</p></td>
									<?  
										} 
										mysql_data_seek($getproductsetdata_result, 0);
									?>
									<td align="center"><strong><p>0</p></strong></td>
									<td align="center"><strong><p>$0.00</p></strong></td>
							</tr>
							<?  } 
								
							?>
							<? while ($groupRecords = mysql_fetch_array($getgroups_result  , MYSQL_ASSOC)) { ?>
								<?  
									$totalmoney = 0;
									$totalunits = 0;
									$getthisgroupdata = "select s.sectionid, 
									p.productid, p.casecount, o_p.productprice, o.organizationid,  ot_p.unitcount,
									sum(ot_p.unitcount) as totalproductunitcount, (sum(ot_p.unitcount) * o_p.productprice) as totalproductmoney,
									(casecount - MOD(sum(ot_p.unitcount),p.casecount)) as requiredextraunits,
									((casecount - MOD(sum(ot_p.unitcount),p.casecount)) + sum(ot_p.unitcount)) as newproducttotal,
									(((casecount - MOD(sum(ot_p.unitcount),p.casecount)) + sum(ot_p.unitcount)) / p.casecount) as totalcases
									from product p, organization_product o_p, organization_productset o_ps, ordertaker_product ot_p,
									organization o, productset ps, section s, ordertaker ot
									where o.organizationid = o_p.fk_organizationid
									and s.fk_organizationid = o.organizationid
									and ot.fk_sectionid = s.sectionid
									and ot_p.fk_ordertakerid = ot.ordertakerid
									and ot_p.fk_productid = p.productid
									and o_ps.fk_organizationid = o.organizationid
									and o_ps.fk_productsetid = ps.productsetid
									and o_ps.fk_productsetid = p.fk_productsetid
									and o_ps.fk_organizationid = o_p.fk_organizationid
									and p.fk_productsetid = ps.productsetid
									and o_p.fk_productid = p.productid 
									and s.sectionid = '" . $groupRecords['sectionid'] . "' group by p.productid";
									$getthisgroupdata_result = mysql_query($getthisgroupdata) or die('Query failed: ' . mysql_error());	
								 ?>
								<? if(isset($_GET['action']) && $_GET['action'] == 'edit' && isset($_GET['sectionid']) && $_GET['sectionid'] == $groupRecords['sectionid']){ ?>
									<tr>
										<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post" name="groupform">
										<td valign="middle">
											<p>
												<input name="sectionid" type="hidden" value="<?  echo  $groupRecords['sectionid'] ?>">
												<input name="name" type="text" size="35" value="<?  echo  $groupRecords['name'] ?>" onKeyPress="javascript:submitFormOnEnter();"> 
												&nbsp;&nbsp;<a href="javascript:document.groupform.submit()"><img src="images/addBtn.gif" border="0"></a>
												&nbsp;&nbsp;<a href="javascript:document.cancelform.submit()"><img src="images/cancelBtn.gif" border="0"></a>
											</p>
										</td>
											<input type="hidden" name="edit" value="edit">
										</form>
										<? 
											if(mysql_num_rows($getthisgroupdata_result) != 0){ 
												
												while ($thisgroupdata = mysql_fetch_array($getthisgroupdata_result  , MYSQL_ASSOC)) { 
													$totalmoney =+ $thisgroupdata['totalproductmoney'];
													$totalunits =+ $thisgroupdata['totalproductunitcount'];
										?>
											<td align="center"><p><?  echo  $thisgroupdata['totalproductunitcount'] ?></p></td>
										<?  
												}	
											} 
											else {
											
										?>	
										<? while ($productsetproductlist = mysql_fetch_array($getproductsetdata_result  , MYSQL_ASSOC)) { ?>
										<td align="center"><p>0</p></td>
										<?  
											} 
											mysql_data_seek($getproductsetdata_result, 0);
										?>
										<? 
											
											}
										?>
										<td align="center"><strong><p>-</p></strong></td>
										<td align="center"><strong><p>-</p></strong></td>
									</tr>								
							 <?  } 
								else{
							  ?>
									<tr>
										<td valign="middle">
										<p>
											<a href="?deletesectionid=<?  echo  $groupRecords['sectionid'] ?>" onClick="javascript:return confirm('Are you sure you want to remove this group and all associated ordertakers? ');"><img src="images/deleteGroup.gif" border="0" alt="Delete Group"></a>
											<a href="?action=edit&sectionid=<?  echo  $groupRecords['sectionid'] ?>"><img src="images/editGroup.gif" border="0" alt="Edit Group"></a>	&nbsp;&nbsp;<a href="tallysheet.php?sectionid=<?  echo  $groupRecords['sectionid'] ?>"><?  echo $groupRecords['name'] ?></a>
										</p>
										</td>
										<? 
											if(mysql_num_rows($getthisgroupdata_result) != 0){ 
												while ($thisgroupdata = mysql_fetch_array($getthisgroupdata_result  , MYSQL_ASSOC)) { 
													$totalmoney += $thisgroupdata['totalproductmoney'];
													$totalunits += $thisgroupdata['totalproductunitcount'];
										
										?>
											<td align="center"><p><?  echo  $thisgroupdata['totalproductunitcount'] ?></p></td>
										<?  
												}	
											} 
											else {
											
										?>	
										<? while ($productsetproductlist = mysql_fetch_array($getproductsetdata_result  , MYSQL_ASSOC)) { ?>
										<td align="center"><p>0</p></td>
										<?  
											} 
											mysql_data_seek($getproductsetdata_result, 0);
										?>
										<? 
											}
										?>
										<td align="center"><strong><p><?  echo  $totalunits ?></p></strong></td>
										<td align="right"><strong><p><?  echo  money_format('$%#4n',$totalmoney) ?></p></strong></td>
									</tr>	
								<?  } ?>
							<?  } ?>
							<? if(mysql_num_rows($getgroups_result) != 0){  ?>
							
							<?   
								$getthisorganizationdata = "select s.sectionid, 
								p.productid, p.casecount, o_p.productprice, o.organizationid,  ot_p.unitcount,
								sum(ot_p.unitcount) as totalproductunitcount, (sum(ot_p.unitcount) * o_p.productprice) as totalproductmoney,
								IF(MOD((casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount)),p.casecount)=0,0,(casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount))) as requiredextraunits,
								(IF(MOD((casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount)),p.casecount)=0,0,(casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount))) * o_p.productprice) as totalextraproductmoney,
								(IF(MOD((casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount)),p.casecount)=0,0,(casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount))) + sum(ot_p.unitcount)) as newproducttotal,
								(round(((IF(MOD((casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount)),p.casecount)=0,0,(casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount))) + sum(ot_p.unitcount))  / p.casecount),0)) as totalcases
								from product p, organization_product o_p, organization_productset o_ps, ordertaker_product ot_p,
								organization o, productset ps, section s, ordertaker ot
								where o.organizationid = o_p.fk_organizationid
								and s.fk_organizationid = o.organizationid
								and ot.fk_sectionid = s.sectionid
								and ot_p.fk_ordertakerid = ot.ordertakerid
								and ot_p.fk_productid = p.productid
								and o_ps.fk_organizationid = o.organizationid
								and o_ps.fk_productsetid = ps.productsetid
								and o_ps.fk_productsetid = p.fk_productsetid
								and o_ps.fk_organizationid = o_p.fk_organizationid
								and p.fk_productsetid = ps.productsetid
								and o_p.fk_productid = p.productid 
								and o.organizationid  = '" . $_SESSION['organizationid'] . "' 
								group by p.productid";
								$getthisorganizationdata_result = mysql_query($getthisorganizationdata) or die('Query failed: ' . mysql_error());
							?>
							<? if(mysql_num_rows($getthisorganizationdata_result) != 0){  ?>
							<?  $grandtotal = 0; ?>
							<tr class="background">
								<td><p>PRODUCT TOTAL</p></td>

								<? 
									$grandtotalproductcount = 0;
									$grandtotalproductmoney = 0;
									while ($getthisorganizationdata = mysql_fetch_array($getthisorganizationdata_result  , MYSQL_ASSOC)) { ?>
									<td align="center"><p><?  echo  $getthisorganizationdata['totalproductunitcount'] ?></p></td>
								<?  
									$grandtotalproductmoney += $getthisorganizationdata['totalproductmoney'];
									$grandtotalproductcount += $getthisorganizationdata['totalproductunitcount'];
									} 
									mysql_data_seek($getthisorganizationdata_result, 0);
									$grandtotal = $grandtotal + $grandtotalproductmoney;
								?>

								<td align="center"><p><?  echo  $grandtotalproductcount ?></p></td>
								<td align="right"><p><?  echo  money_format('$%#4n',$grandtotalproductmoney) ?></p></td>
							</tr>
							
							<tr class="background">
								<td><p>ROUNDING UNITS</p></td>
								<? 
									$grandtotalextraproductcount = 0;
									$grandtotalextraproductmoney = 0;
									while ($getthisorganizationdata = mysql_fetch_array($getthisorganizationdata_result  , MYSQL_ASSOC)) { ?>
									<td align="center"><p><?  echo  $getthisorganizationdata['requiredextraunits'] ?></p></td>
								<?  
									$grandtotalextraproductcount += $getthisorganizationdata['requiredextraunits'];
									$grandtotalextraproductmoney += $getthisorganizationdata['totalextraproductmoney'];
									} 
									mysql_data_seek($getthisorganizationdata_result, 0);
								?>

								<td align="center"><p><?  echo  $grandtotalextraproductcount ?></p></td>
								<td align="right"><p><?  echo  money_format('$%#4n',$grandtotalextraproductmoney) ?></p></td>
							</tr>
							<tr class="background2">
								<td><p>FINAL UNIT TOTAL</p></td>
								<? 
									$grandtotalfinalproductcount = 0;
									$grandtotalfinalproductmoney = 0;
									while ($getthisorganizationdata = mysql_fetch_array($getthisorganizationdata_result  , MYSQL_ASSOC)) { ?>
									<td align="center"><p><?  echo  $getthisorganizationdata['newproducttotal'] ?></p></td>
								<?  
									$grandtotalfinalproductcount += $getthisorganizationdata['newproducttotal'];
									$grandtotalfinalproductmoney += $getthisorganizationdata['totalextraproductmoney'];
									} 
									mysql_data_seek($getthisorganizationdata_result, 0);
									$grandtotal = $grandtotal + $grandtotalfinalproductmoney;
								?>

								<td align="center"><p><?  echo  $grandtotalfinalproductcount ?></p></td>
								<td align="right"><p><?  echo money_format('$%#4n',$grandtotal)  ?></p></td>
							</tr>
							
							<tr class="background">
								<td><p>TOTAL CASES</p></td>
								<? 
									$grandtotalfinalproductcasescount = 0;
									$grandtotalfinalproductmoney = 0;
									while ($getthisorganizationdata = mysql_fetch_array($getthisorganizationdata_result  , MYSQL_ASSOC)) { ?>
									<td align="center"><p><?  echo  $getthisorganizationdata['totalcases'] ?></p></td>
								<?  
									$grandtotalfinalproductcasescount += $getthisorganizationdata['totalcases'];
									//$grandtotalfinalproductmoney += $getthisorganizationdata['totalextraproductmoney'];
									} 
									mysql_free_result($getthisorganizationdata_result); 
								?>

								<td align="center"><p><?  echo  $grandtotalfinalproductcasescount ?></p></td>
								<td align="right"><p><?  echo money_format('$%#4n',$grandtotal)  ?></p></td>
							</tr>
							<?  } ?>
							<?  
									mysql_free_result($getgroups_result);
								} 
							?>
						</table>
					</td>
				</tr>
				
				<tr>
					<td><p><span style="color: #FF0000;"><?  echo $pagefooterdata['body'] ?></span></p><br></td>
				</tr>
				
			</table>
		</td>
	</tr>
</table>
</body>
</html>
<form name="cancelform" action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post">
	<input type="hidden" name="cancel" value="cancel">
</form>
<? 
	mysql_close($dbconn);
?>
