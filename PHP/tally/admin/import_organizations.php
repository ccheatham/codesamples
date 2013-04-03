<?php 
/*
	Author: Ched Cheatham
	Email:ched.cheatham@mindrally.com
	Customer:Spirit of America - Montgomery, Alabama
	Date:September 24, 2005
	Purpose:Parse CSV To MySQL
	ToDo:
	Add error checking for file uploaded.
*/
include 'include/authcheck.php';
$importfields = 'firstname,lastname,company,addr,addr2,city,state,zipcode,custnum,phone';
if(isset($_POST['importorgs']) && strlen($_FILES['userfile'])){
	$recordsEnterCount = 0;
	$systemMessage = '';
	//$uploaddir = '/home/wwwspir/public_html/tally/import_files/';
	//$uploadfile = $uploaddir . basename($_FILES['userfile']['name']);
	//move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile);
	
	$dbh=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
	mysql_select_db ("wwwspir_soa"); 
	
	$row = 0;
	$handle = fopen($_FILES['userfile']['tmp_name'], "r");
	while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
		/*
		if(implode(",", $data) !== $importfields){
			$systemMessage = 'Data file is not in the proper format!';
			fclose($handle);
			mysql_close($dbh);
			break;
		}
		*/
		//CBC this implode is used to make a list of the array of data in order to figure out if it is the header of the CSV is being imported
		
		// PART 1 - Here all of the products from a productset are gathered so that a many-tomany table can be populated for the purpose of price restructuring per org
		$getproducts = "select * from product where fk_productsetid = " . $_POST['fk_productsetid'];
		$getproducts_result = mysql_query($getproducts) or die('Query failed: ' . mysql_error());
		
		$num = count($data);
		if(implode(",", $data) !== $importfields){
			$chkquery = "select custnum from organization where custnum= " . $data[8];
			$result = mysql_query($chkquery) or die('Query failed: ' . mysql_error());
			if(!mysql_num_rows($result)){
				$recordsEnterCount++;
				$query = "insert into organization (importdate, $importfields) values(";
				$query .= "now(),";
				for ($c=0; $c < $num; $c++) {
					//this replace checks for single ticks and escapes them with two single ticks
					$thisdata = str_replace("'","''",$data[$c]);
					if(($num-1) !== $c){
						$query .= "'" . $thisdata . "',";
					}
					else{
						$query .= "'" . $thisdata . "'";
					}
			   }
				$query .= ")";
				$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());
				$neworganizationid = mysql_insert_id();
				$query = "insert into organization_productset (fk_organizationid,fk_productsetid) values(";
				$query .= "'" . $neworganizationid . "',";
				$query .= "'" . $_POST['fk_productsetid'] . "'";
				$query .= ")";
				$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());
				
				// PART 2 - Here all of the products from a productset are gathered so that a many-to many table can be populated for the purpose of price restructuring per org
				while ($thisProductRecord = mysql_fetch_array($getproducts_result , MYSQL_ASSOC)) {
					$query = "insert into organization_product (fk_organizationid,fk_productid,productprice) values(";
					$query .= "'" . $neworganizationid . "',";
					$query .= "'" . $thisProductRecord['productid'] . "',";
					$query .= "'" . $thisProductRecord['defaultprice'] . "'";
					$query .= ")";
					$insertrecord = mysql_query($query) or die('Query failed: ' . mysql_error());	
				}
				
			  $row++; 
			}
	  	}
	}
	fclose($handle);
	mysql_close($dbh);
}
else{
	$dbconn=mysql_connect ("localhost", "wwwspir_WEB", "xml123") or die ('I cannot connect to the database because: ' . mysql_error());
	mysql_select_db ("wwwspir_soa"); 
	$getproductset = "select distinct ps.productsetid, ps.name, ps.bdefault from productset ps, product p where p.fk_productsetid = ps.productsetid";
	$getproductset_result = mysql_query($getproductset) or die('Query failed: ' . mysql_error());
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spirit of America</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" href="../style.css" media="all" rel="stylesheet">
<script language="javascript">

function chkForPath(){
	if(document.importform.userfile.value.length > 0){		
		document.importform.importorgs.disabled = false;
	}
}

</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="container" align="center">
  <?  include 'http://' . $_SERVER["HTTP_HOST"] . '/tally/include/header.php' ?>
  <tr>
    <td colspan="2">
		<? include 'include/adminnav.php'; ?>
	</td>
  </tr>
  <tr>
    <td><h1>Import Organizations</h1></td>
  </tr>
  <tr>
  <tr>
  <td>
  	<p>
		Click browse to locate an exported MOM CSV file on your local machine.  The CSV file should be<br> 
		in the specifed format below.  Errors may occur if the file you are importing is	not in the correct format.  This <br>
		system does not support XLS (Microsoft Excel) files for import, however using the Save As feature of Excel  <br>
		you can save a file as CSV. 
		<br>T<strong>he CSV Header Descriptor shoud have the following data elements: </strong>
		<br>
		<?  echo $importfields ?> 
	</p>					
	<br>
  </td>
  </tr>
  <!--- nested table is where content goes --->
  <td>
  	<? 
		if(isset($systemMessage) && strlen($systemMessage)){ 
			echo( '<p><font color=red><b>ERROR MESSAGE:</b><br>' . $systemMessage . '<br>'); 
			echo( '<br>The very top line of you data file should look like the following:<br>' . $importfields . '<br>' .
			implode(",", $data) .
			'<br>
			<a href="import_organizations.php"> Click to import another file.</a>
			<br><br><br><br></font></p>'); 
		} 
	?>
  <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    
    <td>
<? if(!isset($_POST['importorgs'])) { ?>
     <form action="<? $_SERVER['SCRIPT_FILENAME'] ?>" method="POST" enctype="multipart/form-data" name="importform">
	 <input type="hidden" name="MAX_FILE_SIZE" value="3000000" />

    <table cellpadding="0" cellspacing="0" border="0" width="500" class="content">
      <tr>
        <td background="../images/pattern.gif"><p>Select Product Set</p></td>
        <td>
			<p>	
            <select name="fk_productsetid">
				<? while ($thisRecord = mysql_fetch_array($getproductset_result , MYSQL_ASSOC)) { ?>
 					<option value="<? echo $thisRecord['productsetid']; ?>" <? if($thisRecord['bdefault']) echo 'selected'; ?>><? echo $thisRecord['name']; ?></option>
				<? 
					} 
					mysql_close($dbconn);
				?>
            </select>
          </p>
		  </td>
      </tr>
      <tr>
        <td background="../images/pattern.gif"> 
		<p>Send this file:</p>
                   
          </td>
		  
          <td> 
		
		  	<p>
              <input name="userfile" type="file" onChange="chkForPath();" />
            </p>
        
      		</td>
      
      </tr>
      <tr><td colspan="2" align="center"> <input name="importorgs" type="submit" value="Import Organizations" disabled="true" /></td></tr>
    </table>
	</form>
	<? 
		}
	else{
		if(isset($systemMessage) && !strlen($systemMessage)){ 
	 ?>
	 <p>
	  There where <? echo($recordsEnterCount); ?> of <? echo($row); ?> records imported into the database!
	  <br>
	  There where <? echo(($row - $recordsEnterCount)); ?> customer records already in the database!
	  <br>
	  <br>
	  <a href="import_organizations.php"> Click to import another file.</a>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 </p>
	 
	 
	 <?
	 	} 
	 } 
	 

	 ?>
    </td>
    
    </tr>
    
  </table>
  </td>
  
  </tr>
  
</table>
</body>
</html>