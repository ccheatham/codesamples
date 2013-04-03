<CFQUERY NAME="pubsQry" DATASOURCE="#request.mctDSN#" DBTYPE="ODBC">
	SELECT *
	FROM publications
	ORDER by pub_dt DESC
</CFQUERY>

<cfparam name="article_scan" default="no">

<HTML>
<HEAD>
  <STYLE type="text/css">
  <!--
A.roll:hover {color: 660066;}
A.roll:visited {color: 660066;}
A.roll:visited:hover {color: 660066;}

A:hover {color: 660066;}

TABLE{font-family: times new roman, times, arial, helvetica, sans-serif; 
        font-size: 14px;        
        text-indent: 0em;
       
        }

P {font-family: times new roman, times, arial, helvetica, sans-serif; 
        font-size: 11pt;        
        text-indent: 0em;
       
        }

P.nav {font-family: times, arial, helvetica, sans-serif;
        font-size: 10pt;
        text-indent: 0em;
        text-align: center;
       }

--></STYLE>

<SCRIPT LANGUAGE="JavaScript"> 
  <!--
  function openWindow(myLink,windowName)
  {
  if(! window.focus)return;
  var myWin=window.open("image_upload.cfm",windowName,"screenX=100,screenY=100,height=250,width=425,scrollbars=no,resizable=no");
  myWin.focus();
  myLink.target=windowName;
  }
  
  //-->



  </SCRIPT>
  <TITLE>McAlpine Tankersley: Publications Content Management</TITLE>
</HEAD>
<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="#663300"
vlink="#666666"><cfform action="index.cfm?action=add">
<CENTER>
  <TABLE BORDER="0" CELLPADDING="2" ALIGN="Center">
    <TR>
      <TD><P ALIGN=Center>
	  <IMG height=40 src="../../McT_with_ribbon.gif" width=517>
<BR>Publications Content Management</TD>
    </TR>
    <TR>
      <TD><p>Add a Publication to the Database:</p>
	  <TABLE BORDER="1" CELLSPACING="0" CELLPADDING="4" ALIGN="center" WIDTH="100%">
	  <tr><td><p>Magazine</p></td><td><p>Publication Date</p></td><td><p>Date (mm-dd-yyyy)</p></td><td><p>Article Name (no quotes!)</p></td><td><p>Featured</p></td><td><p>Home City</p></td><td><p>Home State</p></td><!--- <td><img src="articleicon.gif" width="14" height="17" alt="click for article" border="0"></td> ---></tr>
	 
	 
	 <tr bgcolor="CCCC99"><td><cfinput type="text" name="magazine"  size="25" required="yes" message = "You must enter a magazine name..." maxlength="100"></td><td><cfinput type="text" name="publication_date"  required="yes" message = "You must provide a publish date for this publication..." size="10" maxlength="45"></td><td><cfinput type="text" name="pub_dt"  required="yes" message = "You must provide a real date for this publication (mm-yyyy)..." size="10" maxlength="10"></td><td><input type="text" name="article_name"  size="25" maxlength="50"></td><td><input type="text" name="home"  size="15" maxlength="25"></td><td><input type="text" name="home_city"  size="10" maxlength="50"></td><td><input type="text" name="home_state"  size="10" maxlength="50"></td><!---<td> <input type="checkbox" onclick="openWindow('image_upload.cfm','image_upload')" name="article_scan" value="1"> </td>---></tr>
	
</table><br><div align="center"><input type="submit" value="add new publication to database"><BR><BR></div></cfform></td>
    <TR>
      <TD><p>Edit a publication - click magazine name to edit copy, click publication status (yes/no) to upload image(s):</p>
	  <TABLE BORDER="1" CELLSPACING="0" CELLPADDING="4" ALIGN="center" WIDTH="100%">
	  <tr bgcolor="CCCC99"><td width="25%">Magazine</td><td>Publication Date</td><td>Month-Year</td><td>Article Name</td><td>Featured</td><td>Home City &amp; State</td><td><img src="articleicon.gif" width="14" height="17" alt="click for article" border="0"></td><td>Portfolio Position<!--- <img src="../images/portfolio.gif" width="14" height="17" alt="in portfolio" border="0"> ---></td></tr>
	  <cfoutput query = "pubsQry">
	 
	 <tr <cfif #pubsqry.currentrow# mod 2 is 0> bgcolor="##e9e9c8"</cfif>><td><a href="edit.cfm?pubID=#pubID#">#magazine#</a></td>
	 <td>#publication_date#</td><td>#pub_dt#</td><td><cfif #article_name# is not "">"#article_name#"<cfelse>&nbsp;</cfif></td><td><CFIF #home# is not "">#home#<cfelse>&nbsp;</cfif></td><td><CFIF #home_city# is not "">#home_city#, #home_state#<cfelse>&nbsp;</cfif></td>
	 <td><a href="index.cfm?action=newupload&pubID=#pubID#" <!--- onclick="openWindow(this,'image_upload') "--->>#YesNoFormat(article_scan)#</a></td>
	 <td><cfif portfolioPosition GT 0><a href="edit.cfm?pubID=#pubID#"><img src="#request.portfolioImagesDir##portfolioPosition#_on.jpg" border="0"></a></cfif></td>
	 </tr>
     </cfoutput>
	 </table>
      </TD>
    </TR>
    <TR>
      <TD><P ALIGN=Right>
	
	</TD>
    </TR>
  </TABLE>
</CENTER>
</BODY></HTML>
