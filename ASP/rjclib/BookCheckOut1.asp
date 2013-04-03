<%@ Language=VBScript %>

<%
AdminUser = Request.Form("AdminUser")
Password  = Request.Form("password")
%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spCheckForAdminUser AdminUser,Password%>

<%
'Dim a variable for resultset

Dim rsReturn

Set rsReturn = objDe.rsspCheckForAdminUser%>
<%If (rsReturn.EOF) Then
Response.Redirect("loginerror.asp")
Else
%>


<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: 
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......: 
	'Error gets populated from the page 
	'that Bookcheckout1.asp gets posted to
	'see javascript in Bookcheckout2.asp 
	'SessionVariables com from logon.asp 
Dim Error
Dim BookName
Dim TID
	error = Request.QueryString("Error")
	' BookName is set in logon.asp as a user begins the book checkout 
	BookName = Request.Form("BookName")
	' CheckedOut Session Var is to protect from resubmition
	' If the user accidentally goes BACK in the browser 
	Session("CheckedOut") = "False"
	' TID is set in logon.asp as a user begins the book checkout 
	' Process TID is the Tracking ID
	' TID = rsReturn("TrackNumberLeft")& "-"& rsReturn("TrackNumberRight")
	TID = Request.Form("TID")
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
</head>
<body>

<%
strDate = Month(Now) & "/" & Day(Now) & "/" & Year(Now)
%>
<!---Variables are passed to checkout2.asp via the form below--->
<form action="BookCheckOut2.asp" method="POST">
<INPUT type="hidden"  name="TID" Value="<%=TID%>" >
<INPUT type="hidden"  name="BookName" Value="<%=BookName%>" >
<br><h3 align="center">Book Check Out</h3><br>
<center><h6><%=Error%></h6></center>
<table WIDTH="400" ALIGN="center" BORDER="1" CELLSPACING="3" CELLPADDING="3" bgcolor="#cccccc" rules=none>
	<tr>
		<td align="right"></td>
		<td><strong>Date:</strong><input type="text" value="<%=strDate%>" name="strDate"></td>
	</tr>
		<td></td>
		<td></td>
		<td></td>
	<tr>
	<td></td>
		<td><strong>Item to be checked out:</strong></td></tr>
		<tr><td></td><td><%=BookName%></td></tr>
				<tr><td width=100><strong>Check out to:</strong></td>
		<td><input type="text" name="Name" maxlength="50" size="30"></td></tr>
	<tr>
		<td></td>
		<td></td>
		<td><input type="image" value="img" src="images/checkout1.gif" id="image2" name="image2" WIDTH="65" HEIGHT="19"></td></tr>
</table>
</form>
</body>
</html>
<!--#INCLUDE file ="incfooter.htm"-->
<%End If%>