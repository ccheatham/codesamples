<%@ Language=VBScript %>

<%
Dim catname
catname = Request.QueryString("strName")
%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListRRProducts catname%>

<%
' Orignial Author............: Ched Cheatham
' Project....................: RJC Library
' Creation Date..............: Feb 23, 1999
' Description................: Product List
' Posts......................: 
' Modified By................: 
' Modifcation Date...........: 
' Modifcation Comments.......:

' Dim a variable for resultset

Dim rsReturn
Set rsReturn = objDe.rsspListRRProducts
Dim Product,Author,Title
%> 
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link REL="stylesheet" HREF="RjcLibSTYLE.css" TYPE="text/css">
</head>
<body>
<br>
<h3 align="center">
<%=catname%></h3>
<TABLE WIDTH=600
 BORDER=0 CELLSPACING=0 CELLPADDING=0 align=center>
	<TR>
		<TD align=center>To add to this list use the form at the bottom of this page.</TD>
	</TR>
</TABLE>
<BR><BR>
<table width="600" border="0" align="center" cellpadding="1" cellspacing="1">

<tr>
<td></td>
<td><strong><u>Recommended Reading For
            <%=catname%></u></strong><br><br></td>
</tr>
    <%Do Until rsReturn.EOF%>

    <%

Product		= rsReturn("ProductName")
Author		= rsReturn("RecBy")
Title		= rsReturn("Title1")
Category	= rsReturn("Category")
%>

    <TR>
<th><img SRC="images/bullet.gif" WIDTH="8" HEIGHT="11">&nbsp;&nbsp;</th>
<th align=left><STRONG>
            <%=Title%></STRONG></th>
<tr>
<td></td>
<td align=left valign=top>
            <%=Product%></td>
        <%rsReturn.MoveNext%>
    
</tr>
    <%Loop%>
    
</table>
<FORM action="AddRRProd.asp" method=post>
<INPUT type="hidden" name=RecCat value="<%=catname%>">
<TABLE WIDTH=600 BGCOLOR=#cccccc ALIGN=center BORDER=1 CELLSPACING=1 CELLPADDING=1 rules=none>
    <th align=left></th>
	<TR>
		<TD><EM><STRONG>&nbsp;&nbsp;&nbsp;Use this form to add recommended readings for <%=catname%> to this list.</STRONG></EM></TD>
	</TR>
  	<th align=left>&nbsp;Recommenders Name:</th>
	<TR>
		<TD><INPUT name="RecName" size=30 maxlength=50 ></TD>
	</TR>
    <TR>
	<th align=left>&nbsp;Title</th>
	<tr><td><INPUT name="RecTitle" size=30 maxlength=50 ></td></tr>
    <TR>
	<th align=left>&nbsp;Recommended Reading:</th>
	<TR>
		<TD><TEXTAREA cols=80 name=RecText rows=5>
</TEXTAREA></TD>
	</TR>
	<tr><td>For URL's to be linked in your comment you must put the address in both places indicated by "Web Address" in the example below.  You can highlight the example then drag and drop it into the text field in this form.  You can then modify it.<BR>EXAMPLE:  <<samp>a href="WebAddress">Web Address<</samp>/a></td></tr>     
	<tr><td><input type="image" value = "img" src="images/add.gif" id="image2" name="image2" 
            WIDTH="65" HEIGHT="19"></td></tr>
       </TABLE>
</FORM>


<!--#INCLUDE file ="incfooter.htm"-->
</body>
</html>
<%
rsReturn.Close
Set objDE = Nothing
%>