<CFQUERY NAME="GetPubImages" DATASOURCE="#request.mctDSN#">
	SELECT * 
	FROM images
	WHERE pubID = #url.pubID#
		AND sortorder <> 'X'
	ORDER BY sortorder
</CFQUERY>
	
<CFQUERY NAME="GetPubInfo" DATASOURCE="#request.mctDSN#">
	SELECT *
	FROM publications
	WHERE pubID = #url.pubID#
</CFQUERY>

<html>
<head>
 <STYLE type="text/css">
  <!--
A.roll:hover {color: 660066;}
A.roll:visited {color: 660066;}
A.roll:visited:hover {color: 660066;}

A:hover {color: 660066;}

TABLE{font-family:  times new roman, times, arial, helvetica, sans-serif; 
        font-size: 12px;        
        text-indent: 0em;
       
        }

P {font-family: times new roman, times, arial, helvetica, sans-serif; 
        font-size: 11pt;        
        text-indent: 0em;
       
        }

P.center {font-family: times, arial, helvetica, sans-serif;
        font-size: 11pt;
        text-indent: 0em;
        text-align: center;
		font-weight: bold;
       }

--></STYLE>

	<title>McAlpine Tankersley: Image Upload</title>
</head>

<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="#663300"
vlink="#666666">
<div align="center"><table>
<TR>
      <TD><P ALIGN=Center>
	<IMG height=40 src="../../McT_with_ribbon.gif" width=517><br><br></TD>
    </TR>
<tr>
	<td>
	<CFOUTPUT>
		<p class="center">“#GetPubInfo.article_name#” from #GetPubInfo.magazine# - #getpubInfo.publication_date#</p>
	<form action="index.cfm?action=upload&pubID=#url.pubID#" ENCTYPE="multipart/form-data" method="post">
	</CFOUTPUT>
	<div align="center">
<table> 
<tr>
	<td><p class="center">Image File to Upload:</p></td>
	<td><div align="center"><input name="imagefile" size="20" type="file"></div></td>
</tr>
<tr>
	<td colspan=2><div align="center"><input type="submit" name="upload" value="upload this file"></div></td>
	
</tr>
</table>

		<input type="hidden" name="pubID" <cfoutput>value="#URL.pubID#"</cfoutput>>
	</form>
</td></table>
</div>

<CFIF GetPubImages.RecordCount>
<HR>
<CFOUTPUT>
	<FORM ACTION="index.cfm?action=sort&pubID=#url.pubID#" METHOD="post"> 
</CFOUTPUT>
	<BR>
	<div align="center"><a href="../../publications.cfm">View Live Publications Page</a><BR><BR>
		current file(s)<BR>
		
		<TABLE border>
		<TR><TD valign="top"><p align="center">Sort:</p></TD><TD>&nbsp;</TD></TR>
		<cfoutput query="GetPubImages">
			<TR>
			<TD valign="top">
			<INPUT TYPE="text" NAME="sortList" VALUE="#sortorder#" SIZE="3" MAXLENGTH="2">
			<INPUT TYPE="hidden" NAME="sortList" VALUE="#imageID#;">
			</TD>
			<TD ALIGN="center"><img src="#acmsURLStart#images/#imagefile#"><BR>
			<i>#imagefile#</i></TD>
			</TR>
		</cfoutput>
		<TR><TD COLSPAN="2" ALIGN="center"><INPUT TYPE="submit" NAME="re-sort" VALUE="Change Image Sorting"></TD></TR>
		</TABLE>
	</div>
</FORM>
</CFIF>


</body>
</html>
