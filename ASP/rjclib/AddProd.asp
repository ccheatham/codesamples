<%@ Language=VBScript %>
<%
Dim ProdName,CatName
catname =  Request.Form("Category")
prodname = Request.Form("newprod") 
Manuf = Request.Form("Manufacturer")
Media = Request.Form("Media")
Copies = Request.Form("Copies")
CopiesAvail = Request.Form("Copies")

%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spInsertProduct catname,prodname,Manuf,Media,Copies,CopiesAvail%>
<%Response.Redirect("add_FORM.asp")%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<P>&nbsp;</P>

</BODY>
</HTML>
