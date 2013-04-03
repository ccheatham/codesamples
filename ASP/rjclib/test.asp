<table width="400" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#cccccccc"><tr><td>
<form action="addBKcat.asp" method="POST" id="form1" name="form1">
<table>


	<tr>
	<td align="left">ADD Category</td>
	<td></td>
	</tr>
	<tr>
	<td align="left"><input type="Text" name="newcat" size="25" maxlength="40"></td>
	<td align="left"><input type="image" value="img" src="images/add.gif" id="image1" name="image1" WIDTH="65" HEIGHT="19"></td>
</tr>
</form>
<form action="remBKcat.asp" method="POST">
<tr>
	<td align="left">DELETE Category</td>
	<td></td>
	</tr>
	<tr>
	<td align="left">
	<select name="Category">
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spListBKCatsAll%>
<%
'Dim a variable for resultset
Dim rsReturn1
Set rsReturn1 = objDe.rsspListBKCatsAll
%> 
<%Do Until (rsReturn1.EOF)%>
	<option VALUE="<%=rsReturn1("category")%>"><%=rsReturn1("category")%>
	<%
	rsReturn1.MoveNext
	Loop
	%>
</select></td>
<td align="left"><input type="image" value="img" src="images/remove.gif" WIDTH="65" HEIGHT="19"></td></tr>

</table>
</form>

<table width="600">
<form action="addBKprod.asp" method="POST" id="form2" name="form2">

<tr>
	<td align="left">New Book Name</td>
	<td align="left">Book Description</td>
	<td align="left">Book Categories</td>
	<td align="left">Copies</td>
	<td></td>
	</tr>
	<tr>
	<td align="left"><input type="Text" name="BookName" size="25" maxlength="100"></td>
	<td><input type="text" Name="Description"></td>
	<td align="left">
	<select name="Category">
	<%rsReturn1.Movefirst%>
	<%Do Until (rsReturn1.EOF)%>
	
	<option VALUE="<%=rsReturn1("category")%>"><%=rsReturn1("category")%>
	<%
	rsReturn1.MoveNext
	Loop
	%>
	</select></td>
	<td align="Left"><input type="Text" name="Copies" size="2" maxlength="2" value="1"></td>
	<td align="Left"></td>
</tr>
<tr><td><input type="image" value="img" src="images/add.gif" id="image2" name="image2" WIDTH="65" HEIGHT="19"></td></tr>
	</table></td></tr></table>
	</form>
