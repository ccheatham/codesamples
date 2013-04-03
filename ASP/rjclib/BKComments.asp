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
Dim BookName
Dim TID
BookName = Session("BookName")
TID	= Session("TID")
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" bgcolor="#cccccccc">

<table WIDTH="320" BGCOLOR="#cccccccc" ALIGN="center" BORDER="1" CELLSPACING="1" CELLPADDING="1" rules="none" height="0">
	<tr>
		<td height="10"><img SRC="images/commentsBAR.GIF" WIDTH="219" HEIGHT="25"></td>
	</tr>
	<tr><td align="center"><strong><font color="#007066"><%=BookName%></font></strong></td></tr>
	<form action="addcomment.asp" method="POST" id="form1" name="form1">
<input type="hidden" name="TID" value="<%=TID%>">
<th align="left">&nbsp;&nbsp;Enter Your Name:</th>
<tr><td height="0"><input type="text" name="strName" maxlength="50" size="40"></td></tr>	
<th align="left">&nbsp;&nbsp;Enter Your Comments:</th><tr>
		<td align="center" valign="middle" height="0"><textarea rows="7" cols="37" name="Comments">

</textarea><br><font color="#007066">255 character field</font></td>
	</tr>
	<tr>
		<td><input type="image" value="img" src="images/add.gif" WIDTH="65" HEIGHT="19" id="image1" name="image1"></td>
	</tr>
</form>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListBKComments TID%>

<%
'Dim a variable for resultset

Dim rsReturn

Set rsReturn = objDe.rsspListBKComments
%>
<tr><td>
<table BORDER="0">
<%If rsReturn.EOF Then%>
<tr><td>No Comments</td></tr>
<%Else%>
<tr><td><strong>Comments By:</strong></td></tr>
<%Do Until rsReturn.EOF%>

	<tr>
	<td>
	<a HREF="ViewBKComment.asp?CommentID=<%=rsReturn("CommentID")%>" target="BOTTOM"><img SRC="images/view.gif" border="0" WIDTH="25" HEIGHT="8"></a>&nbsp;&nbsp;&nbsp;&nbsp;<%=rsReturn("strName")%>
	</td>
	</tr>
	<%rsReturn.MoveNext%>
	<%Loop%>
<%
End If
'Set Session("TID") = Nothing
'Set Session("BookName") = Nothing
rsReturn.Close
Set objDE = Nothing
%>
</table></tr></td>	
</table>
</body>
</html>
