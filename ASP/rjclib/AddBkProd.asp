<%@ Language=VBScript %>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListBKProductsBYTrackID%>
<%Session("sendmail") = Request.Form("sendmail")%>
<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: 
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......: 
' Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspListBKProductsBYTrackID
If rsReturn.EOF = False Then
rsReturn.MoveLast
End If
strNumber = rsReturn("TrackNumberLeft")& "-" & rsReturn("TrackNumberRight")
rsReturn.Close
strLeft = Left(strNumber,4)
strRight = Right(strNumber,2)
intLeft = CInt(strLeft)
intRight = CInt(strRight)

If intLeft = 9999 Then
intLeft = 1
intRight = intRight + 1
Else
intLeft = intLeft + 1
End If
strLeft = Trim(CStr(intLeft))
strRight = Trim(CStr(intRight))

If Len(strRight) = 1 Then
strRight  = "0" & strRight
End If

If Len(strLeft) = 1 Then
strLeft = "000" & strLeft
ElseIf Len(strLeft) = 2 Then
strLeft = "00" & strLeft
ElseIf Len(strLeft) = 3 Then
strLeft = "0" & strLeft
End If

%>
<%
Dim BookName
Dim Category
Dim Description
Dim Copies
Dim CopiesAvail
	BookName = Request.Form("BookName")
	Category = Request.Form("Category")
	Description = Request.Form("Description")
	Copies = Request.Form("Copies")
	CopiesAvail = Request.Form("Copies")
%>
<%objDe.spInsertBKProduct strLeft,strRight,BookName,Category,Description,Copies,CopiesAvail%>
<%
Set objDE = Nothing
Response.Redirect("NewTID.asp")
%>
