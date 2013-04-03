<%@ Language=VBScript %>
<!--#INCLUDE FILE ="incDBCONN.asp"-->
<%
	SQLQuery = "SELECT * FROM SW_Categories ORDER BY Category"
	Set Cats = dbConn.Execute(SQLQuery)%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<body bgColor="#cccccc">
<%
If Cats.EOF Then
	Response.Write "<br><br><center><font face=""Arial"" size=""2"" color=""Red""><b>0 found.</font></b>"
Else
%>
<br><center><img SRC="images/rjcLOGOnew.gif" WIDTH="100" HEIGHT="60"></center>
<h5 align="Center"><u>Software Library</u></h5>
	<table WIDTH="200" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="2" height="100">
<%Do Until (Cats.EOF)%>
		<tr>
		<td height="4">
			&nbsp;<img SRC="images/rjcBULLET.gif" WIDTH="4" HEIGHT="4">&nbsp;&nbsp;<a href="prodlist.asp?Name=<%=Cats("Category")%>" target="MAIN"><%=Cats("Category")%></a>
		</td>
		</tr>
<%
Cats.MoveNext
Loop
End If
%>
		<tr>
		<td>
			<hr size="1" width="180">
		</td>
		</tr>
		<tr>
		<td>
			<a HREF="BookList.asp" target="MAIN">&nbsp;<img SRC="images/rjcbullet.gif" border="0" WIDTH="4" HEIGHT="4">&nbsp;&nbsp;Book Library</a><br>
		</td>
		</tr>
			<tr>
		<td>
			<a HREF="LEFTRecRead.asp" target="LEFT">&nbsp;<img SRC="images/rjcbullet.gif" border="0" WIDTH="4" HEIGHT="4">&nbsp;&nbsp;Recommended Reading</a><br>
		</td>
		</tr>
		<tr>
		<td>
			<a HREF="logon.asp" target="MAIN" title="Library Administration">&nbsp;<img SRC="images/rjcbullet.gif" border="0" WIDTH="4" HEIGHT="4">&nbsp;&nbsp;Library Admin</a>
		</td>
		</tr>
		<tr>
		<td>
			<hr size="1" width="180">
		</td>
		</tr>
	</table>



</body>
</html>
<!--#INCLUDE FILE ="incDBCONNclose.asp"-->
