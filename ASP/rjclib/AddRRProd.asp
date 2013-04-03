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
RecCat =  Request.Form("RecCat")
RecText = Request.Form("RecText") 
RecTitle = Request.Form("RecTitle")
RecName = Request.Form("RecName")
%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spInsertRRProduct RecCat,RecText,RecName,RecTitle%>

<html>
<head>
<title></title>
<meta http-equiv="refresh" content="1; url=main.asp">
</head>
<body>

</body>
</html>