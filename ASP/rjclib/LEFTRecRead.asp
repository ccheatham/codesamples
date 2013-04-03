<%@ Language=VBScript %>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListRRCats
' Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspListRRCats
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<body bgColor="#cccccc">
<br><center><img SRC="images/rjcLOGOnew.gif" WIDTH="100" HEIGHT="60"></center>
<h5 align="Center"><u>Recommended Reading</u></h5>
<table WIDTH="200" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="2" height="100">
<%If rsReturn.EOF Then
	Response.Write "<br><br><center><font face=""Arial"" size=""2"" color=""Red""><b>0 found.</font></b>"
Else
%>

<%Do Until (rsReturn.EOF)%>
		<tr>
		<td height="4">
			&nbsp;<img SRC="images/rjcBULLET.gif" WIDTH="4" HEIGHT="4">&nbsp;&nbsp;<a href="ListRecRead.asp?strName=<%=rsReturn("Category")%>" target="MAIN"><%=rsReturn("Category")%></a>
		</td>
		</tr>
<%
rsReturn.MoveNext
Loop
End If
%>
<br>
<form action="AddRRCat.asp" method="POST">
<th align="left"></th>
<tr><td valign="middle">&nbsp;<img SRC="images/rjcBULLET.gif" WIDTH="4" HEIGHT="4">&nbsp;&nbsp;<input type="text" size="17" maxlength="50" name="newcat"><input type="image" value="img" src="images/addCAT.gif" WIDTH="35" HEIGHT="12"></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
</form>
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
			<a HREF="LEFTSoftware.asp" target="LEFT">&nbsp;<img SRC="images/rjcbullet.gif" border="0" WIDTH="4" HEIGHT="4">&nbsp;&nbsp;Software Library</a><br>
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
<%
Set objDE = Nothing
rsReturn.Close
%>