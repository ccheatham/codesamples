<%@ Language=VBScript %>
<%
Dim password1,password2,adminuser
password1 = CStr(Request.Form("password1"))
password2 = CStr(Request.Form("password2"))
adminuser = Request.Form("adminuser")
%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListAdminUsers%>

<%
'Dim a variable for resultset
Dim rsReturn
Set rsReturn = objDe.rsspListAdminUsers
%> 

<%
Do Until rsReturn.EOF

If adminuser = rsReturn("AdminUser") Then%>
<script language = javascript>
		var mvar;
		var strhref;
		
		mvar="* The Username you selected is already in use *";
		mvar=escape(mvar);
		
		strhref="add_form.asp?error=";
		strhref=strhref+mvar;
		
		location.href=strhref;
		
	</script>

<%Exit Do
rsReturn.Close
Response.End
End If
rsReturn.MoveNext
Loop

%>

<%
If password1 = "" Then%>
	<script language = javascript>
		var mvar;
		var strhref;
		
		mvar="* Passwords can not be blank *";
		mvar=escape(mvar);
		
		strhref="add_form.asp?error=";
		strhref=strhref+mvar;
		
		location.href=strhref;
		
	</script>
<%
Else
If password1 = password2 Then%>

<%objDe.spAddAdminUser adminuser, password1%>
<%Response.Redirect("logon.asp")%>
<%
Else%>
	<script language = javascript>
		var mvar;
		var strhref;
		
		mvar="* Passwords do not match *";
		mvar=escape(mvar);
		
		strhref="add_form.asp?error=";
		strhref=strhref+mvar;
		
		location.href=strhref;
		
	</script>
<%
End If

End If
%>


<%
rsReturn.Close
Set objDE = Nothing
%>