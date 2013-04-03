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

include 'include/authcheck.php';

$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ("wwwspir_soa"); 
if(isset($_POST['searchbtn']) && strlen($_POST['searchcriteria'])){
	$getorganizations = "select o.organizationid, IF(LENGTH(o.company) > 0,o.company, o.custnum) as company, ps.name as productsetname, ps.code, o.custnum, o.phone, date_format(o.importdate,'%c/%d/%y') as importdate
	from organization o, organization_productset o_ps, productset ps 
	where o.organizationid = o_ps.fk_organizationid
	and o_ps.fk_productsetid = ps.productsetid ";
	if(trim($_POST['searchcriteria']) !== '*'){
		$getorganizations .= " and o.custnum LIKE '" .  trim($_POST['searchcriteria']) . "%' ";
	}
	$getorganizations .= " order by ps.code, o.custnum";
	$getorganizations_result = mysql_query($getorganizations) or die('Query failed: ' . mysql_error());
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spirit of America</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<SCRIPT LANGUAGE="JavaScript">
function printWindow() {
bV = parseInt(navigator.appVersion);
if (bV >= 4) window.print();
}
function chkSearchBox(){
	if(document.searchform.searchcriteria.value.length > 0){		
		document.searchform.searchbtn.disabled = false;
	}
}
</script>

<link type="text/css" href="../style.css" media="screen" rel="stylesheet">
<link type="text/css" href="../print.css" media="print" rel="stylesheet">
</head>
<body  OnLoad="document.searchform.searchcriteria.focus();">
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
					<td colspan="2"><h1>Search/View Organizations</h1></td>
				</tr>
				  <tr>
				  <td>
					<p class="doNotPrint">
						Customer records in the system can be searched for by customer number.  To return all of <br>
						the Customer records from the system a wild card * (asterisk) variable can be used in the search box.<br> 
					</p>					
					<br>
				  </td>
				  </tr>
				<tr class="doNotPrint">
					<td>
						<form name="searchform" action ="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post">
						<table>
							<td align="right"><p>Search by Customer Number:</p></td>
							<td align="left">
							<p class="doNotPrint">
								<input name="searchcriteria" type="text" size="10">
								&nbsp;&nbsp;
								<input name="searchbtn" type="submit" value="search">
							</p>
							<font color="#990000" style="font-size:8px">(ex.  use * wildcard, 132220, or 13 returns all records where the customer number starts with 13)</font>
							</td>
						</table>
						</form> 
					</td>
				</tr>
				
				<tr><td align="center" colspan="2"><?  if(isset($_POST['searchbtn']) && strlen($_POST['searchcriteria'])) echo 'There were ' . mysql_num_rows($getorganizations_result) . ' matching record(s) found!' ?></td></tr>
				<? if(isset($_POST['searchbtn']) &&  strlen($_POST['searchcriteria'])  && mysql_num_rows($getorganizations_result) != 0){ ?>
				<tr id="remove">
					<td colspan="2">
						<p><a href="javascript:printWindow()"><img src="../images/print.gif" border="0"> Print this page</a></p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					
						<table cellpadding="0" cellspacing="0" border="0" id="content" width="95%">
													
							<tr class="prodNumb">
								<td width="17%"><p>ORGANIZATION</p></td>
								<td width="8%"><p>PHONE</p></td>
								<td width="4%"><p>CUST NUM</p></td>
								<td width="15%"><p>PRODUCT SET</p></td>
								<td width="9%"><p>CODE</p></td>
								<td width="5%" align="center"><p>TOTAL UNITS</p></td>
								<td width="7%" align="center"><p>IMPORTED</p></td>						
								<td width="10%"><p>DETAILS</p></td>
							</tr>
						<?  
							$unittotal = 0; 
							$totalmoney = 0.00;
							$grandunittotal = 0; 
							$grandtotalmoney = 0.00;
						?>
						<? 
							if(mysql_num_rows($getorganizations_result) != 0){
							while ($organizations = mysql_fetch_array($getorganizations_result, MYSQL_ASSOC)) { 
						?>
							
							<?  
							$organizationdetails = "select IF(LENGTH(o.company) > 0,o.company, o.custnum) as company,
							o.organizationid, o.phone,
							IF(sum(ot_p.unitcount) > 0,sum(ot_p.unitcount),0) as totalproductunits,
							(sum(ot_p.unitcount) * o_p.productprice) as totalproductmoney,
							ps.name as productsetname
							from organization o, product p, organization_product o_p, ordertaker_product ot_p, ordertaker ot ,section s, productset ps, organization_productset o_ps
							where o_p.fk_organizationid = o.organizationid
							and ps.productsetid = o_ps.fk_productsetid
							and o_ps.fk_organizationid = o.organizationid
							and o_p.fk_productid = p.productid
							and ot_p.fk_productid = o_p.fk_productid
							and ot.ordertakerid = ot_p.fk_ordertakerid
							and ot.fk_sectionid = s.sectionid
							and o.organizationid = s.fk_organizationid
							and o.organizationid = '" . $organizations['organizationid'] . "' group by o.organizationid";
							$organizationdetails_result = mysql_query($organizationdetails) or die('Query failed: ' . mysql_error());
							$organizationdetail = mysql_fetch_array($organizationdetails_result, MYSQL_ASSOC);
							?>		
							<? if(mysql_num_rows($organizationdetails_result) != 0){ ?>
							<?  
								$unittotal =+ $organizationdetail['totalproductunits']; 
								$totalmoney =+ $organizationdetail['totalproductmoney'];
							?>				
							<tr>
								<td>
									<p>
										<a href="organization.php?organizationid=<? echo $organizations['organizationid'] ?>"><img src="../images/editOrgSm.gif" border="0"> <? echo $organizations['company'] ?></a>
									</p>
								</td>
								<td><p><? echo $organizations['phone'] ?>&nbsp;</p></td>
								<td><p><? echo $organizations['custnum'] ?></p></td>
								<td><p><? echo $organizationdetail['productsetname'] ?></p></td>
								<td><p><? echo $organizations['code'] ?></p></td>
								<td align="center"><p><? echo $organizationdetail['totalproductunits'] ?></p></td>
								<td align="center"><p><?=$organizations['importdate']; ?></p></td>
								<td><p><a href="../group.php?organizationid=<?  echo  $organizations['organizationid'] ?>">Click for Detials</a></p></td>
							</tr>
							<?  
								$grandunittotal  = ($grandunittotal  + $unittotal); 
								$grandtotalmoney = ($grandtotalmoney + $totalmoney);
								} else {
							?>
							<tr>
								<td>
									<p>
										<a href="organization.php?organizationid=<? echo $organizations['organizationid'] ?>"><img src="../images/editOrgSm.gif" border="0"> 
										<? echo $organizations['company'] ?></a>
									</p>
								</td>
								<td><p><? echo $organizations['phone'] ?>&nbsp;</p></td>
								<td><p><? echo $organizations['custnum'] ?></p></td>
								<td><p><? echo $organizations['productsetname'] ?></p></td>
								<td><p><? echo $organizations['code'] ?></p></td>
								<td align="center"><p>0</p></td>
								<td align="center"><p><?=$organizations['importdate']; ?></p></td>
								<td><p><a href="../group.php?organizationid=<?  echo  $organizations['organizationid'] ?>">Click for Detials</a></p></td>
							</tr>
							<?  
								}
								mysql_free_result($organizationdetails_result); 
							}
							mysql_free_result($getorganizations_result); 
						}	
						?>
							<tr id="bottombar">
								<td colspan="4"><p>SEARCH CRITERIA TOTAL</p></td>
								<td>&nbsp;</td>
								<td align="center"><p><?  echo $grandunittotal ?></p></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<?  } ?>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
<?  
	mysql_close($dbconn); 
	 
?>