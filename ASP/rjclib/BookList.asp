<%@ Language=VBScript %>

<!--#INCLUDE FILE ="incDE.asp"-->
<%
' Gets book names with Tracking ID
objDe.spListBooks%>

<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: Book List
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......:
 
' Dim a variable for resultset
Dim rsReturn

Set rsReturn = objDe.rsspListBooks
If rsReturn.EOF Then
Response.Write("<BR><CENTER><h5>0 Books Found</h5></CENTER>")
Else
Dim TID
Dim BookName
Dim Description
%> 
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
<!---Java function used for launch of comment window --->
<script language="javascript">
<!--
function Openme2(newin) {
    flyout=window.open(newin,"flyout","resizable=no,scrollbars=no,width=320,height=600,top=0,left=0")
}
// -->
</script>
</head>
<body>
<form>

<br>
<h3 align="center">Complete Book List</h3>

<table WIDTH="500" ALIGN="center" BORDER="0" CELLSPACING="1" CELLPADDING="1">
	<tr>
		<td>Listed below are all of the items in the RJC Dallas Library.  As an RJC employee
		these books, tapes, etc. are available for you to check out.  However, the check out process
		must be completed by an office personnel. Availablity of an item is indicated by 
		the icon to the right.  The icon on the left (&nbsp;<img SRC="images/comment1.gif" ALT="Comment Icon" WIDTH="12" HEIGHT="10">&nbsp;) is there for you to make or view comments
		about the given item.</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
<br>
<table border="0" align="center" cellpadding="1" cellspacing="1">

<tr>
<td></td>
<td align="center" width="55"><strong><u>TID</u></strong><br><br></td>
<td><strong><u>Book</u></strong><br><br></td>
<td><strong><u>Description</u></strong><br><br></td>
<td></td>
</tr>
<%
' Dispalys book names with Tracking ID 

rsReturn.MoveFirst%>
<%Do Until rsReturn.EOF%>
<tr>
<%
TID				= rsReturn("TrackNumberLeft")& "-"& rsReturn("TrackNumberRight")
BookName		= rsReturn("BookName")
Description		= rsReturn("Description")

%>
<td height="0" valign="baseline">
<a href="javascript:"onclick="Openme2('FrameComments.asp?TID=<%=TID%>&amp;BookName=<%=replace(replace(BookName,"'","")," ","%20")%>')"><img src="images/comment1.gif"  WIDTH="12" HEIGHT="10"  border="0"></a></td>
<td>
<img SRC="images/bullet.gif" WIDTH="8" HEIGHT="11">&nbsp;<strong><%=TID%></strong></td>
<td width="400"><%=BookName%></td>
<td><%=Description%></td>
<%
' Look to see if there are copies available
' If there are copies available the it 
' displays the CHECKOUT icon
' if not then displays UNAVAILABLE icon
If rsReturn("CopiesAvail") > 0 Then%>
<td><a HREF="logon.asp?TID=<%=TID%>&amp;BookName=<%=BookName%>"><img SRC="images/check.gif" border="0" WIDTH="13" HEIGHT="11"></a></td>
<%Else%>
<td><img SRC="images/nocheck.gif" WIDTH="13" HEIGHT="11"></td>
<%End If%>
</tr>
<%rsReturn.MoveNext%>
<%Loop%>
</table>
<!--#INCLUDE file ="incfooter.htm"-->
</form>
</body>
</html>
<%
rsReturn.Close
Set objDE = Nothing
End If
%>


