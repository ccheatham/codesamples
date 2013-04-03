<%@ Language=VBScript %>
<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: 
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......: 
Dim catname
catname = Request.Form("newcat")
%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListBKCats catname%>
<%Set rsReturn = objDe.rsspListBKCats%>
<%
If (rsReturn.EOF) Then %>

<%objDe.spInsertBKCategory catname%>

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
