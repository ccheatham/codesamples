<%@ Language=VBScript %>
<%
ProductID = Request.QueryString("ProductID")

%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
</head>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListProduct ProductID%>
<%objDe.spListCatsAll%>

<%
'Dim a variable for resultset
Dim rsReturn
Dim rsReturn2
Set rsReturn = objDe.rsspListProduct
Set rsReturn2 = objDe.rsspListCatsAll
%>
<h3 align=center>Edit Software Product<h3>
<FORM action="changeSW_Product.asp" method=POST>
<center>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
<INPUT type="hidden" name=ProductID value="<%=ProductID%>">
<tr>
<td><strong><u>Product</u></strong><br><br></td>
<td><INPUT type="text" id=text1 name=ProductName value="<%=rsReturn("ProductName")%>" maxlength=100 size=50></td>
</tr>

<tr>
<td><strong><u>Category</u></strong><br><br></td>
<td><select name="Category">
	<%rsReturn2.Movefirst%>
	<%Do Until (rsReturn2.EOF)%>
	
	<%If rsReturn("Category") = rsReturn2("category") Then %>
	<option VALUE="<%=rsReturn2("category")%>" selected><%=rsReturn2("category")%>
	<%Else%>
	<option VALUE="<%=rsReturn2("category")%>"><%=rsReturn2("category")%>
	<%End If%>
	
	<%
	rsReturn2.MoveNext
	Loop
	%>
	</select></td></tr>

<tr>
<td><strong><u>Manufacturer</u></strong><br><br></td>
<td><select name="Manufacturer">

	<%If rsReturn("Manufacturer") = "Microsoft" Then %>
	<option VALUE="Microsoft" selected>Microsoft
	<%Else%>
	<option VALUE="Microsoft">Microsoft
	<%End If%>
	
	<%If rsReturn("Manufacturer") = "Borland" Then %>
	<option VALUE="Borland" selected>Borland
	<%Else%>
	<option VALUE="Borland">Borland
	<%End If%>
	
	<%If rsReturn("Manufacturer") = "Powersoft" Then %>
	<option VALUE="Powersoft" selected>Powersoft
	<%Else%>
	<option VALUE="Powersoft">Powersoft
	<%End If%>
	
	<%If rsReturn("Manufacturer") = "Sheridan" Then %>
	<option VALUE="Sheridan" selected>Sheridan
	<%Else%>
	<option VALUE="Sheridan">Sheridan
	<%End If%>
	
	<%If rsReturn("Manufacturer") = "VideoSoft" Then %>
	<option VALUE="VideoSoft" selected>VideoSoft
	<%Else%>
	<option VALUE="VideoSoft">VideoSoft
	<%End If%>
	
	<%If rsReturn("Manufacturer") = "Sun" Then %>
	<option VALUE="Sun" selected>Sun
	<%Else%>
	<option VALUE="Sun">Sun
	<%End If%>
	
	<%If rsReturn("Manufacturer") = "Microhelp" Then %>
	<option VALUE="Microhelp" selected>Microhelp
	<%Else%>
	<option VALUE="Microhelp">Microhelp
	<%End If%>
	
	<%If rsReturn("Manufacturer") = "Other" Then %>
	<option VALUE="Other" selected>Other
	<%Else%>
	<option VALUE="Other">Other
	<%End If%>
	</select>
	</td></tr>

<tr>
<td><strong><u>Media</u></strong><br><br></td>
<td>
<select name="Media">
	<%If rsReturn("Media") = "CD-ROM" Then %>
	<option VALUE="CD-ROM" selected>CD-ROM
	<%Else%>
	<option VALUE="CD-ROM">CD-ROM
	<%End If%>
	
	<%If rsReturn("Media") = "3-1/2" Then %>
	<option VALUE="3-1/2" selected>3-1/2
	<%Else%>
	<option VALUE="3-1/2">3-1/2
	<%End If%>
	</select>
	</td>
</tr>
<tr>
<td><strong><u>Copies</u></strong><br><br></td>
<td><INPUT type="text" id=text1 name=Copies value="<%=rsReturn("Copies")%>" size=2 maxlength=2>
<INPUT type="hidden" name=CopiesAvailable value="<%=rsReturn("CopiesAvailable")%>">
<INPUT type="hidden" name=OldCopies value="<%=rsReturn("Copies")%>">
</td>
</tr>

<tr>
<td><INPUT type="submit" value="Update">
</FORM>
</td>
<td>
<form method=post action="delSW_Product.asp">
<INPUT type="hidden" name=ProductID value="<%=ProductID%>">
<INPUT type="submit" value="Delete" >
</form>
</td>
</tr>

</table>
</center>
</body>
</html>
<%rsReturn.Close
rsReturn2.Close
Set objDE = Nothing
%>