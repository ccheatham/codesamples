<%@ Language=VBScript %>
<%
Dim TID
Dim BookName

TID					= Request.QueryString("TID")
BookName			= Request.QueryString("BookName")
Session("BookName") = BookName
Session("TID")		= TID
%>
<frameset  rows="75%,*">
    <frame name="TOP" src="BKComments.asp" marginwidth="10" marginheight="10" scrolling="no" frameborder="no" noresize>
    <frame name="BOTTOM" src="BLANK.htm" marginwidth="10" marginheight="10" scrolling="yes" frameborder="no" noresize>
</frameset>