<%@ Language=VBScript %>

<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: Book Checkout step 2
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......: 

' Form variables come from
' BookCheckout1.asp

Dim strName	
Dim strDate	
Dim BookName
Dim TID	
	strName			= Request.Form("Name")
	strDate			= Request.Form("strDate")
	BookName		= Request.Form("BookName")
	TID				= Request.Form("TID")
%>

<%
' Looks to see if the name field in BKCheckOut1.asp is populated
' Returns arror to BKcheckout1.asp if not

If strName = "" Then%>
<script language = javascript>
		var mvar;
		var strhref;
		
		mvar="* You must enter a NAME to check this book out *";
		mvar=escape(mvar);
		
		strhref="bookcheckout1.asp?error=";
		strhref=strhref+mvar;
		
		location.href=strhref;
		
	</script>
<%
' Looks to see if the item has already been checked out
' Returns arror to BKcheckout1.asp if so
' If the user were to submit to this page and check ut an item
' then Session("CheckedOut") is set to TRUE (at the bottom of this page)
' This prevents users from using the back button of their browser
' then re-submiting this page
ElseIf Session("CheckedOut") = "True" Then%>
<script language = javascript>
		var mvar;
		var strhref;
		
		mvar="* Book Already Checked Out *";
		mvar=escape(mvar);
		
		strhref="bookcheckout1.asp?error=";
		strhref=strhref+mvar;
		
		location.href=strhref;
		
	</script> 
<%Else%>
<%
TrackNumberLeft   = Left(TID,4) 
TrackNumberRight  = Right(TID,2)
%>
<!--#INCLUDE FILE ="incDE.asp"-->


<%
' Connection to BK_Products table is established by TID pieces

objDe.spGetBKCopiesByTID TrackNumberLeft,TrackNumberRight%>

<%
'Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspGetBKCopiesByTID
%>
<%
' recordset value is converted to an integer

intCopiesAvail = CInt(rsReturn("CopiesAvail"))
%>
<%
' then deincremented by one to show item is checkedout
intCopiesAvail = Cint(intCopiesAvail) - 1%>
<%
' New value is put into table showing item is checkedout
objDe.spUpdateBKCopies intCopiesAvail,TrackNumberLeft,TrackNumberRight%>
<%
' New value is put into table showing item is checkedout
objDe.spInsertBKCheckOutInfo strName,BookName,strDate,TID%>
<%Set objDe = Nothing%>
<%
Session("CheckedOut") = "True"
Response.Redirect("BKcheckedoutlist.asp")
%>
<%End If%>
