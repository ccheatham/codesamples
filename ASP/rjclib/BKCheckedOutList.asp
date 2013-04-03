<%@ Language=VBScript %>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListCheckedOutBKItems%>

<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: 
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......: 
'Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspListCheckedOutBKItems
%>
<%If rsReturn.EOF Then%>

<body>
<br><br><br>
<center><strong><h6>THERE ARE NO BOOKS CURRENTLY CHECKED OUT</h6></strong></center>
<%Else%>
<h3 align="center">Book Check Out List</h3><br>
<h6 align="center">Items in <strong>RED</strong> have been out over 60 Days</h6>
<table WIDTH="650" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td align="center"><strong><u>TID</u></strong></td>
		<td align="center"><strong><u>Name</u></strong></td>
		<td align="center"><strong><u>Item</u></strong></td>
		<td align="center"><strong><u>Date</u></strong></td>
		<td align="center">&nbsp;</td>
	</tr>
	<%rsReturn.MoveFirst%>
	<%Do Until rsReturn.EOF%>
	
	<%
	vDate = CDate(rsReturn("strDate"))
	
	
	%>
	<tr>
		<td><strong><%=rsReturn("TID")%></strong></td>
		<%If  vDate + 60 > Date() Then%>
		<td><%=rsReturn("strName")%></td>
		<td><%=rsReturn("BookName")%></td>
		<td><%=(vDate)%></td>
		<%Else%>
		<td><strong><font color="orangered"><%=rsReturn("strName")%></font></strong></td>
		<td><strong><font color="orangered"><%=rsReturn("BookName")%></font></strong></td>
		<td><strong><font color="orangered"><%=(vDate)%></font></strong></td>
		<%End If%>
		<td align="center"><a HREF="BKcheckin.asp?coID=<%=rsReturn("coID")%>&amp;TID=<%=rsReturn("TID")%>"><img SRC="images/checkinarrow.GIF" border="0" WIDTH="20" HEIGHT="11"></a></td>
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
