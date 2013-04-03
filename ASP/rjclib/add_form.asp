<%@ Language=VBScript %>
<%
Dim Error
error = Request.QueryString("Error")
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<br><center><img SRC="images/LMCtitbar.gif" WIDTH="350" HEIGHT="32"></center>
<body>
<br>
<table width="210" border="0" cellspacing="2" cellpadding="2" align="center" height="50" bgcolor="#cccccccc">

</table>
<table width="400" border="1" align="center" cellpadding="0" cellspacing="0" rules="none" bgcolor="#cccccccc">
<tr><td><table align="center"><tr><td align="center"><br><img SRC="images/ManageSoftware.gif" WIDTH="219" HEIGHT="25"></td></tr>
<tr><td align="center"><a HREF="CheckedOutList.asp"><strong>View Software Check Out List</strong></a></td></tr>
</table></td></tr><tr><td><form action="addcat.asp" method="POST">
<table>
<tr>
	<td align="left">ADD Category</td>
	<td></td>
	</tr>
	<tr>
	<td align="left"><input type="Text" name="newcat" size="25" maxlength="40"></td>
	<td align="left"><input type="image" value="img" src="images/add.gif" id="image1" name="image1" WIDTH="65" HEIGHT="19"></td>
</tr>
</form>
<form action="remcat.asp" method="POST" id="form2" name="form2">
<tr>
	<td align="left">DELETE Category</td>
	<td></td>
	</tr>
	<tr>
	<td align="left">
	<select name="Category">
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListCatsAll%>
<%
'Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspListCatsAll
%> 
<%Do Until (rsReturn.EOF)%>
	<option VALUE="<%=rsReturn("category")%>"><%=rsReturn("category")%>
	<%
	rsReturn.MoveNext
	Loop
	%>
</select></td>
<td align="left"><input type="image" value="img" src="images/remove.gif" WIDTH="65" HEIGHT="19"></td></tr>

</table>
</form>

<table width="600" border="0" align="center">
<form action="addprod.asp" method="POST" id="form2" name="form2">

<tr>
	<td align="left">ADD Product</td>
	<td align="left">Product Categories</td>
	<td align="left">Manufacturer</td>
	<td align="left">Media</td>
	<td align="left">Copies</td>
	</tr>
	<tr>
	<td align="right"><input type="Text" name="newprod" size="25" maxlength="100"></td>
	<td align="right">
	<select name="Category">
	<%rsReturn.Movefirst%>
	<%Do Until (rsReturn.EOF)%>
	
	<option VALUE="<%=rsReturn("category")%>"><%=rsReturn("category")%>
	<%
	rsReturn.MoveNext
	Loop
	%>
	</select></td>
	
	<td align="right"><select id="select2" name="Manufacturer">
	<option VALUE="Microsoft">Microsoft
	<option VALUE="Borland">Borland
	<option VALUE="Powersoft">Powersoft
	<option VALUE="Sheridan">Sheridan
	<option VALUE="VideoSoft">VideoSoft
	<option VALUE="Sun">Sun
	<option VALUE="Microhelp">Microhelp
	<option VALUE="Other">Other
	</select>
	</td>
	
	<td align="right"><select id="select2" name="Media">
	<option VALUE="CD-ROM">CD-ROM
	<option VALUE="3-1/2">3-1/2
	</select>
	</td>
	
	<td align="right"><input type="Text" name="Copies" size="2" maxlength="2" value="1"></td>
	<td align="right"><input type="image" value="img" src="images/add.gif" id="image1" name="image1" WIDTH="65" HEIGHT="19"></td>
</tr>
	</table></td></tr></table>
	</form>




<table width="400" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#cccccccc" rules="none">
<tr><td><table align="center"><tr><td align="center"><br><img SRC="images/ManageBooks.gif" WIDTH="219" HEIGHT="25"></td></tr>
<tr><td align="center"><a HREF="BKCheckedOutList.asp"><strong>View Book Check Out List</strong></a></td></tr>
</table></td></tr>
<tr><td>
<form action="addBKcat.asp" method="POST" id="form1" name="form1">
<table>


	<tr>
	<td align="left">ADD Category</td>
	<td></td>
	</tr>
	<tr>
	<td align="left"><input type="Text" name="newcat" size="25" maxlength="40"></td>
	<td align="left"><input type="image" value="img" src="images/add.gif" id="image1" name="image1" WIDTH="65" HEIGHT="19"></td>
</tr>
</form>
<form action="remBKcat.asp" method="POST" id="form3" name="form3">
<tr>
	<td align="left">DELETE Category</td>
	<td></td>
	</tr>
	<tr>
	<td align="left">
	<select name="Category">
<%objDe.spListBKCatsAll%>
<%
'Dim a variable for resultset
Dim rsReturn1
Set rsReturn1 = objDe.rsspListBKCatsAll
%> 
<%Do Until (rsReturn1.EOF)%>
	<option VALUE="<%=rsReturn1("category")%>"><%=rsReturn1("category")%>
	<%
	rsReturn1.MoveNext
	Loop
	%>
</select></td>
<td align="left"><input type="image" value="img" src="images/remove.gif" id="image3" name="image3" WIDTH="65" HEIGHT="19"></td></tr>

</table>
</form>

<table width="600">
<form action="addBKprod.asp" method="POST" id="form2" name="form2">

<tr>
	<td align="left">New Book Name</td>
	<td align="left">Book Description</td>
	<td align="left">Book Categories</td>
	<td align="left">Copies</td>
	<td></td>
	</tr>
	<tr>
	<td align="left"><input type="Text" name="BookName" size="25" maxlength="100"></td>
	<td><input type="text" Name="Description"></td>
	<td align="left">
	<select name="Category">
	<%rsReturn1.Movefirst%>
	<%Do Until (rsReturn1.EOF)%>
	
	<option VALUE="<%=rsReturn1("category")%>"><%=rsReturn1("category")%>
	<%
	rsReturn1.MoveNext
	Loop
	%>
	</select></td>
	<td align="Left"><input type="Text" name="Copies" size="2" maxlength="2" value="1"></td>
	<td align="Left"><input type="image" value="img" src="images/add.gif" id="image2" name="image2" WIDTH="65" HEIGHT="19"></td>
</tr>
<tr><td align=left>Send Email About NEW PRODUCT&nbsp;</td><td align=left><INPUT type="checkbox" name="sendmail" checked></td></tr>
<tr><td></td></tr>
	</table></td></tr></table>
	</form>
<form action="AddUser.asp" method="post">
<h3 align="center">Add Admin User</h3>
<h6 align="center"><%=error%></h6>
<table width="210" border="1" cellspacing="2" cellpadding="2" align="center" height="50" bgcolor="#cccccccc" rules="none">
<tr>
	<td>Username:</td>
	<td><input type="text" name="AdminUser" size="20" maxlength="20"></td>
</tr>
<tr>
	<td>Password:</td>
	<td><input type="password" name="password1" size="10" maxlength="20"></td>
</tr>
<tr>
	<td>Re-Type Password:</td>
	<td><input type="password" name="password2" size="10" maxlength="20"></td>
	</tr>
	<tr><td></td><td><input type="image" value="img" src="images/adduser.gif" WIDTH="65" HEIGHT="19"></td></tr>
</table>
</form>
<%
If Session("strProduct") > "" Then
%>
<table width="210" border="0" cellspacing="2" cellpadding="2" align="center" height="50" bgcolor="#cccccccc">
<tr><td><a HREF="checkout1.asp">Check Out</a></td></tr>
<%End If%>

	</body>
	</html>
<a HREF="main.asp">MAIN</a>
<%rsReturn.Close
Set objDE = Nothing
%>
