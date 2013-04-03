<%@ Language=VBScript %>
<%
ProductID		= Request.Form("ProductID")
%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spDeleteSW_Product ProductID%>
<%Response.Redirect("main.asp")%>

