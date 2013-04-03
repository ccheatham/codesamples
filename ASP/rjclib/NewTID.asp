<%@ Language=VBScript %>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListBKProductsBYTrackID%>
<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: Returns the new TID assigned to 
							   ' the last book added 
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......: 

Dim TID
'Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspListBKProductsBYTrackID
rsReturn.MoveLast
TID = rsReturn("TrackNumberLeft")& "-" & rsReturn("TrackNumberRight")
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<BR><BR><BR><BR>
<TABLE WIDTH=300 BGCOLOR=#cccccccc ALIGN=center BORDER=1 CELLSPACING=1 CELLPADDING=1 rules=none>
	<TR>
		<TD><STRONG>TID#:</STRONG></TD>
		<TD><FONT color=red><STRONG><%=TID%></STRONG></FONT></TD>
	</TR>
	<TR>
		<TD><STRONG>Book:</STRONG></TD>
		<TD><%=rsReturn("BookName")%></TD>
	</TR>
	<TR>
		<TD><STRONG>Category:</STRONG></TD>
		<TD><%=rsReturn("Category")%></TD>
	</TR>
	<TR>
		<TD><STRONG>Description</STRONG></TD>
		<TD><%=rsReturn("Description")%></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD><A HREF="add_form.asp"><STRONG>Continue</STRONG></A></TD>
	</TR>
	</TABLE>
	
	<BR><BR><BR>
	<!---Shoot email to RJC Consultants letting them know a new book is inthe library--->
<%
If Session("sendmail") = "on" then 	
eSender = "RJCLibrary"
eRecipient = "RJCDAL@rjconsult.com"
eSubject = "New Book in RJC Library!"
eData = rsReturn("BookName")&  " has been added to the  Technical Library! Visit http://iis4dev.dallas.rjconsult.com/rjclib"
Set email = Server.CreateObject("CDONTS.NewMail")
Email.Send eSender, eRecipient, eSubject, eData
	If Err <> 0 Then
	Response.Write "Email was not sent due to the following error: " & Err.Description
	Else 
	Response.Write "<center><EM>The Practice has been notified of this addition to the Library.</EM></center>"
	End If 

End If

%>

<%Set Session("sendmail") = Nothing%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%rsReturn.Close
%>
</body>
	</html>