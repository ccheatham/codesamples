<%@ Language=VBScript %>

<%
AdminUser = Request.Form("AdminUser")
Password  = Request.Form("password")
strCopies=Request.Form("Copies")
ProductID=Request.Form("ProductID")

%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spCheckForAdminUser AdminUser,Password%>
<%objDe.spGetProductsByProductID ProductID%>
<%
'Dim a variable for resultset

Dim rsReturn

Set rsReturn = objDe.rsspCheckForAdminUser%>
<%If (rsReturn.EOF) Then
Response.Redirect("loginerror.asp")
Else
%>
<%
Set rsReturn1 = objDe.rsspGetProductsByProductID
%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
</HEAD>
<BODY>

<%
ProductName=rsReturn1("ProductName")

strDate = Month(Now) & "/" & Day(Now) & "/" & Year(Now)
%>
<FORM action="checkout2.asp" method=POST>
<INPUT type="hidden"  name=ProductName value="<%=ProductName%>">
<INPUT type="hidden" value=<%=strCopies%> name=Copies maxlength=100 size=100>
<INPUT type="hidden" value=<%=ProductID%> name=ProductID size=100 maxlength=100>
<BR><h3 align=center>Product Check Out</h3><BR>
<TABLE WIDTH=400
 ALIGN=center BORDER=0 CELLSPACING=3 CELLPADDING=3 bgcolor=#cccccc>
 <tr>
		<TD  align=right></TD>
		<TD><STRONG>Date:</STRONG><INPUT type="text" value=<%=strDate%> name=Date></TD></tr>
	</TR>
	<TR>
		<TD><STRONG>Product to be checked out:</STRONG></TD>
		<TD><%=ProductName%></TD></tr>
				<tr><TD><STRONG>Check out to:</STRONG></TD>
		<TD><INPUT type="text" name=Name maxlength=50 size=30></TD></tr>
		
</TABLE>
<center>
<input type=Submit Value=Checkout>

</center>

</FORM>


</BODY>
</HTML>
<%End If%>
<%
Set objDe = Nothing
rsReturn.Close
rsReturn1.Close
%>