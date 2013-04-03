<%@ Language=VBScript %>

<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: remove checkout info
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......:
coID		= Request.QueryString("coID")
ProductID = Request.QueryString("ProductID")
ProductID = CInt(ProductID)
%>
<!--#INCLUDE FILE ="incDE.asp"-->

<%
' Gets copies available by product
objDe.spGetCopies ProductID
Dim rsReturn

Set rsReturn = objDe.rsspGetCopies


%>
<%intCopiesIN = rsReturn("CopiesAvailable")%> 
<%
' Change to an integer
' then increment by one
intCopiesIN = CInt(intCopiesIN) + 1%>
<%'ProductID = CInt("ProductID")%>
<%
' then put new value into copies available
objDe.spUpdateCopies intCopiesIN,ProductID%>
<%
' then remove checked out item from
' UserCheckOut table
objDe.spRemoveCheckedOutEntry coID%>
<%
Set objDe = Nothing
rsReturn.Close
%>
<%Response.Redirect("checkedoutlist.asp")%>