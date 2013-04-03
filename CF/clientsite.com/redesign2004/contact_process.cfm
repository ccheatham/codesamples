<CFQUERY DATASOURCE = "#request.mctDSN#">
INSERT INTO contacts(dt,name,title,company,address,city,state,zip,phone,fax,email,optin,comments,how)
VALUES('#FORM.dt#','#FORM.name#','#FORM.title#','#FORM.company#','#FORM.address#','#form.city#','#form.state#','#form.zip#','#form.phone#','#form.fax#','#form.email#','#form.optin#','#form.comments#','#form.how#')
</CFQUERY>


<CFMAIL
	FROM = "feedback@mcalpinetankersley.com"
	TO = "kris@lwtkbk.com"
	SUBJECT = "Email from McAlpine Tankersley Website"
>
#name# has filled out the comment form at your Web site:
====================================

Name: #name#
Title: #title#
Company: #company#
Address: #address#
City, State: #city#, #state#, #zip#
Phone: #phone#
Fax: #fax#
Email: #email#

Postcards and email?: <cfif form.optin is 1>Yes!<cfelse>No, thank you.</cfif>
Comments: #comments#
How did you hear about us? #how#



</CFMAIL>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>McAlpine Tankersley Architecture</title>
<link href="mct.css" type=text/css rel=stylesheet>
<style type="text/css">
body {margin: 0; padding: 0;
		background: #CCCCBB url("background.gif");
		background-repeat: no-repeat;
		background-position: center center;
		background-attachment: fixed;}
		
.border {border: 1px solid #8E8E87;}	
</style>
</head>

<body>


<div align="center"><TABLE BORDER="0" CELLPADDING="0" ALIGN="Center" width="450">
    <TR>
      <TD><cfinclude template="header.cfm"></TD>
    </TR>
	
	<tr><td><p class ="nav">Thank you!</p></td></tr>
	</table></div>
<cfinclude template="footer.cfm">
</body>
</html>