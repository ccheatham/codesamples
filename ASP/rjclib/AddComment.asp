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
Dim strName
Dim TID
Dim Comment
strName		= Request.Form("strName")
TID			= Request.Form("TID")
Comment	= Request.Form("Comments")
%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spInsertBKComments strName,TID,Comment%>
<%
Set objDE = Nothing
Response.Redirect("BKComments.asp")
%>