<CFQUERY NAME="editpubsQry" DATASOURCE="#request.mctDSN#" DBTYPE="ODBC">
	SELECT *
	FROM publications
	WHERE pubID=#pubID#
</CFQUERY>

<HTML>
<HEAD>
  <STYLE type="text/css"><!--
A.roll:hover {color: 666666;}
A.roll:visited {color: 663300;}
A.roll:visited:hover {color: 663300;}

A:hover {color: 666666;}

TABLE {font-family:times new roman, times, arial, helvetica, sans-serif; 
        font-size: 10pt;        
        text-indent: 0em;
        color: 333333;
        }

P {font-family: times new roman, times, arial, helvetica, sans-serif; 
        font-size: 11pt;        
        text-indent: 0em;
        color: 333333;
        }

P.nav {font-family: times new roman, times, arial, helvetica, sans-serif;
        font-size: 10pt;
        text-indent: 0em;
        text-align: center;
       }

--></STYLE>
  <TITLE>McAlpine Tankersley: Publications Content Management</TITLE>
</HEAD>
<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="#663300"
vlink="#666666">
<CFOUTPUT>
<FORM ACTION="index.cfm?action=update&pubID=#pubID#" METHOD="post">

</CFOUTPUT>
<CENTER>
  <TABLE BORDER="0" CELLPADDING="2" ALIGN="Center">
    <TR>
      <TD><P ALIGN=Center>
	<IMG height=40 src="../../McT_with_ribbon.gif" width=517></TD>
    </TR>
    <TR>
      <TD><p>You can make changes to the data inside these fields, or delete the record entirely:</p>
	  <TABLE BORDER="1" CELLSPACING="0" CELLPADDING="4" ALIGN="center" WIDTH="100%">
	  <tr><td><p>Magazine</p></td><td><p>Publication Date</p></td><td><p>Real Date (mm-dd-yyyy)</p></td><td><p>Article Name</p></td><td><p>Featured</p></td><td><p>Home City</p></td><td><p>Home State</p></td><td><img src="articleicon.gif" width="14" height="17" alt="click for article" border="0"></td><td>Portfolio Position</td></tr>
	
	<cfoutput query = "editpubsQry">
	 <input type="hidden" name="article_scan"  value="#article_scan#" size="25" maxlength="50">
	 <tr bgcolor="CCCC99"><td><input type="text" name="magazine" value="#magazine#" size="25" maxlength="100"></td><td><input type="text" name="publication_date"  value="#publication_date#" size="10" maxlength="35"></td><td><input type="text" name="pub_dt"  value="#pub_dt#" size="10" maxlength="10"></td><td><input type="text" name="article_name"  value="#article_name#" size="25" maxlength="50"></td><td><input type="text" name="home"  value="#home#" size="15" maxlength="25"></td><td><input type="text" name="home_city"  value="#home_city#" size="10" maxlength="50"></td><td><input type="text" name="home_state"  value="#home_state#" size="10" maxlength="50"></td>
	 <td><a href="image_form.cfm?pubID=#pubID#">#YesNoFormat(article_scan)#</a></td>
     <td><input name="portfolioPosition" value="#portfolioPosition#" size="1"></td>
	 </tr>
	 </cfoutput>

	</table><p><input type="checkbox" name="delete" value="delete">Delete this record?</p><input type="submit" value="Submit Changes/Deletions"></form></td>
    <TR>
      <TD>
      </TD>
    </TR>
    <TR>
      <TD><P ALIGN=Right>
	
	</TD>
    </TR>
  </TABLE>
</CENTER>
</BODY></HTML>
