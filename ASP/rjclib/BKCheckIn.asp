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
Dim COID
Dim TID
COID				= Request.QueryString("coID")
TID					= Request.QueryString("TID")
TrackNumberLeft		= Left(TID,4)
TrackNumberRight	= Right(TID,2)
%>
<!--#INCLUDE FILE ="incDE.asp"-->

<%
' Gets copies available by TrackingID 
objDe.spGetBKCopiesByTID TrackNumberLeft, TrackNumberRight
Dim rsReturn

Set rsReturn = objDe.rsspGetBKCopiesByTID
%>
<%intCopiesIN = rsReturn("CopiesAvail")%> 
<%
' Change to an integer
' then increment by one
intCopiesIN = Cint(intCopiesIN) + 1%>
<%
' then put new value into copies available
objDe.spUpdateBKCopies intCopiesIN,TrackNumberLeft,TrackNumberRight%>
<%
' then remove checked out item from
' UserCheckOut table
objDe.spRemoveCheckedBKOutEntry COID%>
<%Set objDe = Nothing%>
<%Response.Redirect("BKcheckedoutlist.asp")%>