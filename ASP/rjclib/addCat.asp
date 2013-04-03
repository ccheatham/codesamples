<%@ Language=VBScript %>
<%
Dim catname
catname = Request.Form("newcat")
%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListCats catname%>
<%Set rsReturn = objDe.rsspListCats%>
<%
If (rsReturn.EOF) Then %>

<%objDe.spInsertCategory catname%>

<%
Set objDE = Nothing
%>

<%Response.Redirect("add_FORM.asp")%>


<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>
<%Else%>
<h6>Category Already Exists.</h6>
<%End If%>


</BODY>
</HTML>

