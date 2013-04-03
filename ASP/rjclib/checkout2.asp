<%@ Language=VBScript %>

<%
intCopies	= Request.Form("Copies")
strName		= Request.Form("Name")
strDate		= Request.Form("Date")
ProductID	= Request.Form("ProductID")
ProductName = Request.Form("ProductName")
%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spInsertCheckOutInfo strName,ProductID,ProductName,strDate%>
<%intCopies = Cint(intCopies) - 1%>
<%objDe.spUpdateCopies intCopies,ProductID%>
<%Response.Redirect("checkedoutlist.asp")%>

