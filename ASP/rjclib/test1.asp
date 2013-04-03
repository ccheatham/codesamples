<%@ Language=VBScript %>

<%
intCopies	= Request.Form("Copies")
strName		= Request.Form("Name")
strDate		= Request.Form("Date")
strProduct	= Request.Form("Product")
%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spInsertCheckOutInfo strName,strProduct,strDate%>
<%intCopies = intCopies - 1%>
<%objDe.spUpdateCopies intCopies,strProduct%>



<%'Response.Redirect("default.asp")%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>
</BODY>
</HTML>