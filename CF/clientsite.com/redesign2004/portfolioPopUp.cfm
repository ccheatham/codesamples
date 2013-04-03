<cfparam name="url.architectureId">
<cfquery name="getArchitechtureInfo" datasource="#request.mctDSN#">
select * 
from publications
where pubid = #url.architectureId#
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <TITLE>McAlpine/Tankersley</TITLE>
  
  <link href="mct.css" type=text/css rel=stylesheet>
<style type="text/css">
body {margin: 0; padding: 0;
		background: #CCCCBB;
		background-repeat: no-repeat;
		background-position: center center;
		background-attachment: fixed;}
		
.border {border: 1px solid #8E8E87;}	
</style>
</HEAD>
<BODY BGCOLOR="#CCCCBB" TEXT="#000000" LINK="#7f7f7f">

<cfoutput>
<table width="0" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>&nbsp;</td>
    <td align="center"><img src="http://mcalpinetankersley.com/small_McT_with_ribbon.gif" border="0">
	<br />
	<img src="http://mcalpinetankersley.com/architecture_without_ribbon.gif" border="0">
	<br />
	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center"><img src="#getArchitechtureInfo.portfolioPosition#.jpg"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center">#getArchitechtureInfo.home_city#, #getArchitechtureInfo.home_state#
	<br /><br /><cfif getArchitechtureInfo.article_scan><a href="http://mcalpinetankersley.com/gallery.cfm?pubid=#getArchitechtureInfo.pubid#" target="_blank">This here has been in a magazine :)</a></cfif>
	
	</td>
    <td>&nbsp;</td>
  </tr>
</table>
</cfoutput>
</body>
</html>
