<%@ Language=VBScript %>

<%
Dim prodname
prodname = Request.QueryString("Name")
%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListProducts prodname%>

<%
'Dim a variable for resultset

Dim rsReturn

Set rsReturn = objDe.rsspListProducts
If rsReturn.EOF Then
Response.Write("<BR><CENTER><h5>0 Products Found</h5></CENTER>")
Else
Dim Product,Manuf,Media,Copies,CopiesAvail
%> 
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<body>
<br>
<h3 align="center"><%=prodname%> List</h3>
<br>
<table width="650" border="0" align="center" cellpadding="1" cellspacing="1">

<tr>
<td><strong><u>Product</u></strong><br><br></td>
<td><strong><u>Maker</u></strong><br><br></td>
<td><strong><u>Copies</u></strong><br><br></td>
<td><strong><u>In</u></strong><br><br></td>
<td></td>
</tr>

<%Do Until rsReturn.EOF%>
<tr>
<%
ProductID   = rsReturn("ProductID")
Product		= rsReturn("ProductName")
Manuf		= rsReturn("Manufacturer")
Media		= rsReturn("Media")
Copies		= rsReturn("Copies")
CopiesAvail	= rsReturn("CopiesAvailable")
%>

<td><img SRC="images/bullet.gif" WIDTH="8" HEIGHT="11">&nbsp;<%=Product%></td>
<td><%=Manuf%></td>
<td align="center"><%=Copies%></td>
<td align="center"><%=CopiesAvail%></td>
<%If CopiesAvail > 0 Then%>
<td align="center"><a HREF="logon.asp?ProductID=<%=ProductID%>&CopiesAvail=<%=CopiesAvail%>"><img SRC="images/check.gif" border="0" WIDTH="13" HEIGHT="11"></a></td>
<%Else%>
<td align="center"><img SRC="images/nocheck.gif" WIDTH="13" HEIGHT="11"></td>

<%End If%>
<%
If Left(Application("aINTERNALIP"),8) = Left(Request.ServerVariables("REMOTE_ADDR"),8)Then
%>
<td><a HREF="editSW_Product.asp?ProductID=<%=ProductID%>">edit</a></td>
<%End If%>

</tr>
<%rsReturn.MoveNext%>
<%Loop%>
</table>
<%End If%>
<br>
<hr width="600">
<!--#INCLUDE file ="incfooter.htm"-->
</body>
</html>
<%
rsReturn.Close
Set objDE = Nothing
%>