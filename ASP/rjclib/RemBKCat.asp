<%@ Language=VBScript %>

<%
Dim Cat,BookName

Cat = Request.Form("Category")


%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListBKProducts Cat%>

<%
Dim rsReturn
Set rsReturn = objDe.rsspListBKProducts
If rsReturn.EOF Then%>
<%objDE.spRemBKCatandProd Cat%>
<%
rsReturn.Close
Set objDE = Nothing
%>

<%Response.Redirect("add_FORM.asp")%>
<%Else%>
	<html>
	<head>
	<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<link rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
	</head>
	<body> 

	<form action="confirmREMprod.asp?Category=<%=Cat%>" method="POST" id=form1 name=form1>
		<table width="600" align="center" cellpadding="0" cellspacing="0">
		<br><br><br>
		<td><h6>Please confirm the deletion of the following products accociated with <%=Cat%>.</h6></td>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td><strong><u>Product Name</u></strong><br><br></td></tr>
			<%Do Until rsReturn.EOF%>
			<%BookName = rsReturn("BookName")%>
			<tr>
			<td><%=BookName%></td>
			</tr>
			<%rsReturn.MoveNext%>
			<%Loop%>
		<tr><td align="Center"><input type="image" value="img" src="images/confirm.gif" id="image2" name="image2" WIDTH="65" HEIGHT="19"></td></tr>
		<tr><td><br><br></td></tr>
		<tr><td><br></td></tr>
		<tr><td><br></td></tr>
	</form>
	</table>
<%End If%>
</body>
</html>
<%
rsReturn.Close
Set objDE = Nothing
%>
