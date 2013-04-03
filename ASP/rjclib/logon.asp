<%@ Language=VBScript %>
<%
ProductID = Request.QueryString("ProductID")
strCopies = Request.QueryString("CopiesAvail")
strBookName = Request.QueryString("BookName")
intTID = Request.QueryString("TID")

%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
</head>
<body>
<%If ProductID = "" And strBookName = "" Then%>
<form action="login.asp" method="post">
<%Else
If ProductID = "" Then
%>
<form action="BookCheckOut1.asp" method="post" id=form1 name=form1>
<INPUT type="hidden"  name=BookName value=<%=strBookName%>>
<INPUT type="hidden"  name=TID value="<%=intTID%>">	
<%Else%>

<form action="checkout1.asp" method="post" id=form1 name=form1>
<INPUT type="hidden"  name=ProductName value=<%=ProductName%>>
<INPUT type="hidden"  name=ProductID value=<%=ProductID%>>
<INPUT type="hidden"  name=Copies value=<%=strCopies%>>
<%End If%>
<%End If%>
<table width="240" border="1" cellspacing="2" cellpadding="2" align="center" bgcolor="#cccccccc" rules="none">
<b><center><h3>Library Management Logon</h3></center></b>
<tr>
	<td><b>Username:</b></td>
	<td><input name="AdminUser" size="10" maxlength="10"></td>
</tr>
<tr>
	<td><b>Password:</b></td>
	<td><input type="password" name="password" size="10" maxlength="10"></td>
</tr>
<tr><td></td><td><input type="image" value="img" src="images/login.gif" WIDTH="65" HEIGHT="19"></td></tr>
</table>
</form>
</body>
</html>
