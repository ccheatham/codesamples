<%@ Language=VBScript %>
<!--#INCLUDE FILE ="incDE.asp"-->
<%
' Get items and names from UserCheckOut Table
objDe.spListCheckedOutItems%>

<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: Shows software that is currently checked out
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......:


' Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspListCheckedOutItems
%>
<%
' Looks to see if there are any records
If rsReturn.EOF Then%>

<body>
<br><br><br>
<center><strong><h6>THERE ARE NO ITEMS CURRENTLY CHECKED OUT</h6></strong></center>
<%
' Lists any Items w/ names of checked out items

Else%>
<h3 align="center">Product Check Out List</h3>
<table WIDTH="700" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td align="center"><strong><u>Name</u></strong></td>
		<td align="center"><strong><u>Item</u></strong></td>
		<td align="center"><strong><u>Date</u></strong></td>
		<td align="center">&nbsp;</td>
	</tr>
	<%rsReturn.MoveFirst%>
	<%Do Until rsReturn.EOF%>
	<tr>
		<td><%=rsReturn("strName")%></td>
		<td><%=rsReturn("ProductName")%></td>
		<td align="center"><%=rsReturn("strdate")%></td>
		<td align="center"><a HREF="checkin.asp?coID=<%=rsReturn("coID")%>&ProductID=<%=rsReturn("ProductID")%>"><img SRC="images/checkinarrow.GIF" border="0" WIDTH="20" HEIGHT="11"></a></td>
	</tr>
	<%rsReturn.MoveNext%>
	<%Loop%>
</table>
<%
End If
Set objDe = Nothing
rsReturn.Close
%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
</head>
<p>&nbsp;</p>

</body>
</html>
