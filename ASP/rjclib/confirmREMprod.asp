<%@ Language=VBScript %>
<%
Dim Cat
Cat = Request.QueryString("Category")%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spRemCatandProd Cat%>
<% Set objDE = Nothing %>

<%Response.Redirect("add_FORM.asp")%>