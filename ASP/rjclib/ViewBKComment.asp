<%@ Language=VBScript %>
<%
Dim CommentID
CommentID = Request.QueryString("CommentID")


%>


<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListBKCommentsBYCommentID CommentID%>

<%
'Dim a variable for resultset

Dim rsReturn

Set rsReturn = objDe.rsspListBKCommentsBYCommentID
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<body rightmargin=0 topmargin=0 bottommargin=0 leftmargin=0>
<table WIDTH="306" BGCOLOR="#cccccccc" ALIGN="center" BORDER="1" CELLSPACING="1" CELLPADDING="1" height="150" rules=none>
	<TR>
		<TD height=10><STRONG><%=rsReturn("strName")%> says .....</STRONG></TD>
	</TR>
	<TR>
		<TD align=left valign=top><%=rsReturn("Comment")%></TD>
	</TR>
</TABLE>
</body>
</html>
