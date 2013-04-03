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
<%If catname = "" Then
Response.Redirect("LEFTRecRead.asp")
End If%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListRRCatsbyCat catname%>
<%Set rsReturn = objDe.rsspListRRCatsbyCat%>

<%If (rsReturn.EOF) Then %>

<%objDe.spInsertRRCategory catname%>

<%
Set objDE = Nothing
%>

<%Response.Redirect("LEFTRecRead.asp")%>

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

