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

$systemMessage = '';
$action = 'add';
$tablewidth = 580;
$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ("wwwspir_soa"); 
	
if(isset($_POST['cancel_x'])){
	header ("Location: productsetlist.php");
	break;
}  

if(isset($_POST['bdefault'])){ 
	//Only one product default can be chosen so when one is selected all others are reset to prepare to mark the new one
	$query = "update productset set bdefault = 0";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'New Product Set Default Set';
	$bdefault = 1; 
} 
else{
	$bdefault = 0;
}

if(isset($_POST['editproduct_x'])){
	$query = "update product ";
	$query .= "set sku = " . "'" . $_POST['sku'] . "',";
	$query .= "columncolorcssclass = " . "'" . $_POST['columncolorcssclass'] . "',";
	$query .= "name = " . "'" . $_POST['name'] . "',";
	$query .= "defaultprice = " . "'" . $_POST['defaultprice'] . "',";
	$query .= "casecount = '" . $_POST['casecount'] . "'";
	$query .= " where productid = " . "'" . $_POST['productid'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'Product Updated';
	$_GET['productsetid'] = $_POST['productsetid'];
}  

if(isset($_POST['addproduct_x'])){	
	$query = "insert into product (fk_productsetid,sku,columncolorcssclass,name,defaultprice,casecount) values(";
	$query .= "'" . $_POST['productsetid'] . "',";
	$query .= "'" . $_POST['sku'] . "',";
	$query .= "'" . $_POST['columncolorcssclass'] . "',";
	$query .= "'" . $_POST['name'] . "',";
	$query .= "'" . $_POST['defaultprice'] . "',";
	$query .= "'" . $_POST['casecount'] . "'";
	$query .= ")";
	$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'New Product Added';
	$_GET['productsetid'] = $_POST['productsetid'];
}  

if(isset($_POST['edit_x'])){
	$query = "update productset ";
	$query .= "set name = " . "'" . $_POST['productsetname'] . "',";
	$query .= "code = " . "'" . $_POST['code'] . "',";
	$query .= "bdefault = '" . $bdefault . "'";
	$query .= " where productsetid = " . "'" . $_POST['productsetid'] . "'";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'Product Set Updated';
	$_GET['productsetid'] = $_POST['productsetid'];
}  

if(isset($_POST['add_x'])){
	$query = "insert into productset (code,name,bdefault) values(";
	$query .= "'" . $_POST['code'] . "',";
	$query .= "'" . $_POST['productsetname'] . "',";
	$query .= "'" . $bdefault . "'";
	$query .= ")";
	$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());
	$systemMessage = 'New Product Set Added';
	$_GET['productsetid'] = mysql_insert_id();

}  

if(isset($_GET['productsetid'])){
	
	$getproductset = "select ps.*, count(o_ps.fk_organizationid) as usedcount 
	from productset ps 
	left join organization_productset o_ps on o_ps.fk_productsetid = 
	ps.productsetid where ps.productsetid = '" . $_GET['productsetid'] . "' group by ps.productsetid ";
	$getproductset_result = mysql_query($getproductset) or die('Query failed: ' . mysql_error());
	
	if(mysql_num_rows($getproductset_result)){
		$thisRecord = mysql_fetch_array($getproductset_result, MYSQL_ASSOC);
		$_POST['productsetname'] = $thisRecord['name'];
		$_POST['code'] = $thisRecord['code'];
		$_POST['usedcount'] = $thisRecord['usedcount'];
		$bdefault = $thisRecord['bdefault'];
	};
	
	$getproducts = "select * from product where fk_productsetid =" . $_GET['productsetid'] . " order by productid";
	$getproducts_results = mysql_query($getproducts) or die('Query failed: ' . mysql_error());
	
	$action = 'edit';
}
else{
	//Initilaize to add new product set
	$_POST['productsetname'] ='';
	$_POST['code'] = '';
	$bdefault = 0;
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
<body  OnLoad="document.productset.code.focus();">
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="container" align="center">
 <?  include 'http://' . $_SERVER["HTTP_HOST"] . '/tally/include/header.php' ?>
  <tr>
	<td colspan="2">
		<? include 'include/adminnav.php'; ?>
	</td>
</tr>
  <tr>
    <td><h1><img src="../images/productset.gif"> Add/Edit Product Set</h1></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td align="center"></td>
  </tr>
  <tr>
    <!--- nested table is where content goes --->
    <td><table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
        
        <td>
        
        <table cellpadding="0" cellspacing="0" border="0" width="<? echo $tablewidth ?>">
          <tr>
            <td colspan="2" align="center"><? echo($systemMessage); ?></td>
          </tr>
        </table>
        <form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post" name="productset">
        <? if(isset($_GET['productsetid'])){ ?>
        <input name="productsetid" type="hidden" value="<?  echo($_GET['productsetid']) ?>">
        <? } ?>
        <table cellpadding="0" cellspacing="0" border="0" width="<? echo $tablewidth ?>" class="content">
          <tr>
            <td bgcolor="#cccccc" colspan="2"><p><strong>PRODUCT SET INFORMATION</strong></p></td>
          </tr>
		   <tr>
            <td background="../images/pattern.gif"><p>Product Set Code</p></td>
            <td><input type="text" name="code" size="15" value="<?  echo($_POST['code']); ?>">&nbsp;&nbsp;(Code used to track product sets internally)</td>
          </tr>
          <tr>
            <td background="../images/pattern.gif"><p>Name of Product Set</p></td>
            <td><input type="text" name="productsetname" size="60" value="<?  echo($_POST['productsetname']); ?>"></td>
          </tr>
          <tr>
            <td background="../images/pattern.gif"><p>Make Default</p></td>
            <td><input type="checkbox" name="bdefault" <? if ($bdefault) echo ' checked'; ?>></td>
          </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" width="<? echo $tablewidth ?>">
			<tr>
				 <td align="right" colspan="2"><p>
					  <input name="<? echo($action); ?>" type="image" src="../images/saveBtn.gif">&nbsp;&nbsp;<input name="cancel" type="image" src="../images/cancelBtn.gif">
					</p>
					<br>
				</td>
			</tr>
		</table>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" width="<? echo $tablewidth ?>">
			<tr>
				<td>
					<p>
						Products should be added to the product set in the sequence required for tally sheets and reports. 
					</p>
				</td>
			</tr>
		</table>
		<?  if($action == 'edit'){ ?>
		<form action="<?  echo $_SERVER['SCRIPT_NAME'] ?>" method="post">
			<input name="productsetid" type="hidden" value="<?  echo $_GET['productsetid'] ?>">
			
		<table cellpadding="0" cellspacing="0" border="0" width="<? echo $tablewidth ?>" class="content">
          <tr>
            <td bgcolor="#cccccc" colspan="2"><p><strong>PRODUCT SET</strong></p></td>
         	<td bgcolor="#cccccc" colspan="4" align="right"><p><? if(isset($_POST['usedcount']) && !$_POST['usedcount'] && !isset($_GET['addproduct'])){ ?><a href="?addproduct=1&productsetid=<?  echo $_GET['productsetid'] ?>"><img src="../images/addBtn.gif" border="0"></a><? } ?></p></td>
		 </tr>
          <tr class="prodNumb">  	
            <td><p>SKU</p></td>
			 <td><p>COLOR</p></td>
            <td><p>PRODUCT NAME</p></td>
            <td align="right"><p>DEFAULT UNIT PRICE</p></td>
			<td align="center"><p>UNITS IN CASE</p></td>
			<td>&nbsp;</td>
          </tr>
		  
		<? if(isset($_GET['addproduct'])){ ?>
				
		   <tr>			
			<td>
				<p>
					<input type="text" size="7" value="" name="sku">
				</p>
			</td>
			<td>
				<p>
				<select name="columncolorcssclass">
				<option class="prodA" value="prodA">Red Orange</option>
				<option class="prodB" value="prodB">Blue</option>
				<option class="prodC" value="prodC">Orange</option>
				<option class="prodD" value="prodD">Green</option>
				<option class="prodE" value="prodE">Red</option>
				<option class="prodF" value="prodF">Yellow</option>
				</select>
				</p>
			</td>
			<td>
				<p>
					<input type="text" size="40" value="" name="name">
				</p>
			</td>
			<td align="right">
				<p>
					<input type="text" size="8" value="0.00" name="defaultprice">
				</p>
			 </td>
			 <td align="center">
				<p>
					<input type="text" size="1" value="1" name="casecount">
				</p>
			 </td>
			<td align="right">
				<input name="addproduct" type="image" src="../images/saveBtn.gif">&nbsp;&nbsp;<a href="?productsetid=<?  echo $_GET['productsetid'] ?>"><img src="../images/cancelBtn.gif" border="0"></a>
			</td>
		  </tr>
		<? } ?>			
		<? while ($productRecords = mysql_fetch_array($getproducts_results , MYSQL_ASSOC)) { ?>				
		  <? if(isset($_GET['productsetid']) && $productRecords['productid'] == $_GET['editproductid']){ ?>
			  			<input name="productid" type="hidden" value="<?  echo($_GET['editproductid']) ?>">
				  <tr>
					<td>
						<p>
							<input type="text" size="7" value="<?  echo $productRecords['sku'] ?>" name="sku">
						</p>
					</td>
					<td>
					<p>
					<select name="columncolorcssclass">
					<option  class="prodA" value="prodA" <?  if( $productRecords['columncolorcssclass'] == 'prodA'){ ?> selected<? }?>>Red Orange</option>
					<option class="prodB" value="prodB"<?  if( $productRecords['columncolorcssclass'] == 'prodB'){ ?> selected<? }?>>Blue</option>
					<option class="prodC" value="prodC"<?  if( $productRecords['columncolorcssclass'] == 'prodC'){ ?> selected<? }?>>Orange</option>
					<option class="prodD" value="prodD"<?  if( $productRecords['columncolorcssclass'] == 'prodD'){ ?> selected<? }?>>Green</option>
					<option class="prodE" value="prodE"<?  if( $productRecords['columncolorcssclass'] == 'prodE'){ ?> selected<? }?>>Red</option>
					<option class="prodF" value="prodF"<?  if( $productRecords['columncolorcssclass'] == 'prodF'){ ?> selected<? }?>>Yellow</option>
					</select>
					</p>
				</td>
					<td>
						<p>
							<input type="text" size="40" value="<? echo $productRecords['name'] ?>" name="name">
						</p>
					</td>
					<td align="right">
						<p>
							<input type="text" size="8" value="<? echo $productRecords['defaultprice'] ?>" name="defaultprice">
						</p>
					 </td>
					 <td align="center">
						<p>
							<input type="text" size="1" value="<? echo $productRecords['casecount'] ?>" name="casecount">
						</p>
					 </td>
					 <td align="right">
						<input name="editproduct" type="image" src="../images/saveBtn.gif">&nbsp;&nbsp;<a href="?productsetid=<?  echo $_GET['productsetid'] ?>"><img src="../images/cancelBtn.gif" border="0"></a>
					</td>
				  </tr>
			  
		  <?  } 
		  	else{
		  ?>
		  <tr>
			<td>
				<p>
					<?  echo $productRecords['sku'] ?>
				</p>
			</td>
			<td class="<?  echo $productRecords['columncolorcssclass'] ?>">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<p>
					<?  echo $productRecords['name'] ?>
				</p>
			</td>
            <td align="right">
				<p>
					<?  echo '$' . $productRecords['defaultprice'] ?>
				</p>
			 </td>
			 <td align="center">
				<p>
					<?  echo $productRecords['casecount'] ?>
				</p>
			 </td>
			 <td align="right">
				<a href="?editproductid=<?  echo $productRecords['productid'] ?>&productsetid=<?  echo $productRecords['fk_productsetid'] ?>"><img src="../images/editBtn.gif" border="0"></a>&nbsp;&nbsp;
			</td>
          </tr>
		  <? 
				}		  
			} 
			?>
		  
        </table>
		<?  
		} 
		?>
        </td>       
        </tr>      
      </table>
	  </form>
    </td>
  </tr>
</table>
</td>
</tr>
</table>
</body>
</html>
<?  mysql_close($dbconn); ?>