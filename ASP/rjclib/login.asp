<%@ Language=VBScript %>

<%
AdminUser = Request.Form("AdminUser")
Password  = Request.Form("password")
%>

<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spCheckForAdminUser AdminUser,Password%>

<%
'Dim a variable for resultset

Dim rsReturn

Set rsReturn = objDe.rsspCheckForAdminUser%>
<%If (rsReturn.EOF) Then%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="RjcLibSTYLE.css">
</HEAD>
<BODY>
<TABLE WIDTH=400 ALIGN=center BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR>
		<TD><h6>Username not found AND/OR password incorrect.</h6></TD>
	</TR>
<TR>
		<TD><BR><BR><A HREF="logon.asp">TRY AGAIN</A></TD>
	</TR>
</TABLE>

</BODY>
</HTML>
<%Else
Response.Redirect("add_form.asp")
End If
%>
<%Set objDE = Nothing%>