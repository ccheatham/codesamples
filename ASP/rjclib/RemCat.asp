<%@ Language=VBScript %>

<%
Dim Cat,Product

Cat = Request.Form("Category")


%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListProducts Cat%>

<%
Dim rsReturn
Set rsReturn = objDe.rsspListProducts
If rsReturn.EOF Then%>
<%objDE.spRemCatandProd Cat%>
<%
rsReturn.Close
Set objDE = Nothing
%>

<%Response.Redirect("add_FORM.asp")%>
<%Else%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
</HEAD>
<BODY> 

<FORM action="confirmREMprod.asp?Category=<%=Cat%>" method=POST>
<table width=600 align=center cellpadding=0 cellspacing=0>
<td>Please confirm the deletion of the following products accociated with <%=Cat%>.</td>
<%Do Until rsReturn.EOF%>

<%Product = rsReturn("ProductName")%>
<tr>
<td><%=Product%></td>
</tr>
<%rsReturn.MoveNext%>
<%Loop%>
<tr><td><INPUT type="submit" value="Confirm"></td></tr>
</FORM>
</table>
<%End If%>
</BODY>
</HTML>
<%
rsReturn.Close
Set objDE = Nothing
%>
