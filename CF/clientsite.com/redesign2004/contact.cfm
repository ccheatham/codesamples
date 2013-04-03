<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>McAlpine Tankersley Architecture</title>
<link href="mct.css" type=text/css rel=stylesheet>
<style type="text/css">
body {margin: 0; padding: 0;
		background: #CCCCBB url("background.gif");
		background-repeat: no-repeat;
		background-position: center center;
		background-attachment: fixed;}
		
.border {border: 1px solid #8E8E87;}	
</style><SCRIPT language="JavaScript">

<!--// shhh.... be vewy vewy quiet... we're hunting wabbits
                
   function emailCheck () {
var str = document.forms[0].email.value;
var emailPat=/^(.+)@(.+)$/
var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
var validChars="\[^\\s" + specialChars + "\]"
var quotedUser="(\"[^\"]*\")"
var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
var atom=validChars + '+'
var word="(" + atom + "|" + quotedUser + ")"
var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
var matchArray=str.match(emailPat)
if (matchArray==null) {
  alert("Email address seems incorrect (check @ and .'s)")
return false
}
var user=matchArray[1]
var domain=matchArray[2]
if (user.match(userPat)==null) {
   alert("The email username doesn't seem to be valid.")
   return false
}
var IPArray=domain.match(ipDomainPat)
if (IPArray!=null) {
   for (var i=1;i<=4;i++) {
    if (IPArray[i]>255) {
        alert("Destination IP address is invalid!")
return false
   }
   }
   return true
}
var domainArray=domain.match(domainPat)
if (domainArray==null) {
alert("The domain name in your email address doesn't seem to be valid.")
   return false
}
var atomPat=new RegExp(atom,"g")
var domArr=domain.match(atomPat)
var len=domArr.length
if (domArr[domArr.length-1].length<2 || 
   domArr[domArr.length-1].length>3) {
   alert("Email addresses must end in a three-letter domain, or two letter country.")
   return false
}
if (len<2) {
   var errStr="This email address is missing a hostname!"
  alert(errStr)
   return false
}
return true;
}


                      //-->

</SCRIPT>






</head>

<body>
<div align="center"><table width="100%" BORDER="0" CELLPADDING="0" ALIGN="Center">
 <TR>
      <TD><cfinclude template="header.cfm"></TD>
    </TR>
<tr>
	<td><TABLE BORDER="0" CELLPADDING="0" ALIGN="Center" width="450">
   
	<tr><td>
	
	
	<CFFORM ACTION="contact_process.cfm" METHOD="POST">
		   
		  
		<cfoutput><input type="Hidden" name="dt" value="#Dateformat(Now())#"></cfoutput>


<table width="500" cellpadding="3" border="0" class="border" align="left">
<tr><td colspan = "3"><p><span class = "title">Contact Us: </span> We would love to hear from you...</p>
	
	</td></tr>
<tr><td rowspan="10"><img src="puppy_pedistal.jpg" alt="" border="0"></td>
	<td align="right">  <span class="form">
		  Name:</span></td>
	<td align="left"><CFINPUT TYPE="text" NAME="name" class="input" SIZE="35" MAXLENGTH="50" required="yes" message="We must have your name">
</td>
</tr>
<tr>
	<td align="right">  <span class="form">
		  Title:</span></td>
	<td align="left"><CFINPUT TYPE="text" NAME="title" class="input" SIZE="35" MAXLENGTH="50">
		</td>
</tr>
<tr>
	<td align="right"> <span class="form">
		  Company:</span></td>
	<td align="left">  <CFINPUT TYPE="text" NAME="company" class="input" SIZE="35" MAXLENGTH="50">
		</td>
</tr>
<tr>
	<td align="right">  <span class="form">
		  Address:</span></td>
	<td align="left">  <CFINPUT TYPE="text" NAME="address" class="input" SIZE="35" MAXLENGTH="50" required="yes" message="We must have your address">
		</td>
</tr>
<tr>
	<td align="right">  <span class="form">
		  City:</span></td>
	<td align="left"><CFINPUT TYPE="text" NAME="city" class="input" SIZE="35" MAXLENGTH="50" required="yes" message="We must have your city">  
		</td>
</tr>
<tr>
	<td align="right">   <span class="form">
		  State:</span></td>
	<td align="left"> <CFINPUT TYPE="text" NAME="state" class="input" SIZE="3" required="yes" message="We must have your state">
		</td>
</tr>
<tr>
	<td align="right">   <span class="form">
		  Zip:</span></td>
	<td align="left">  <CFINPUT TYPE="text" NAME="zip" class="input" SIZE="5" MAXLENGTH="50" required="yes" message="We must have your zipcode">
		</td>
</tr>
<tr>
	<td align="right"> <span class="form">
		  Phone:</span></td>
	<td align="left">  <CFINPUT TYPE="text" NAME="phone" class="input" SIZE="35" MAXLENGTH="20">
		</td>
</tr>
<tr>
	<td align="right">  <span class="form">
		  FAX: </span></td>
	<td align="left">  <CFINPUT TYPE="text" class="input" sIZE="35" NAME="fax" MAXLENGTH="50">
		</td>
</tr>
<tr>
	<td align="right">  <span class="form">
		  Email: </span></td>
	<td align="left">  <CFINPUT TYPE="text" class="input" NAME="email" SIZE="35" MAXLENGTH="50" required="yes" message="We need a valid email address..." ONVALIDATE="emailCheck">
		 </td>
</tr>

<tr>

	<td colspan = "2" align="right" background="trans.gif">  <span class="form">
		  We occasionally send out communiques,<br> would you care to receive?: </span></td>
	<td align="left" background="trans.gif">&nbsp;&nbsp;&nbsp;y:<CFINPUT TYPE="radio" NAME="optin" VALUE="1" checked> n:<CFINPUT TYPE="radio" NAME="optin" VALUE="0">
		 
		 </td>
</tr>

<tr>

	<td colspan = "2" align="right" background="trans.gif">
		<span class="form">How did you hear about us?</span>
	</td>
	<td align="left" background="trans.gif">
		<select name="how" class="input">
			<option value="search_engine">Search Engine</option>
			<option value="post_card">Post Card</option>
			<option value="other" selected>Other</option>
		</select>
	</td>
</tr>



<CFINPUT TYPE="radio" NAME="how" VALUE="search_engine"><B>S</B>earch Engine?
		  <CFINPUT TYPE="radio" NAME="how" VALUE="post_card"><B>P</B>ost Card?
		  <CFINPUT TYPE="radio" NAME="how" VALUE="other" checked><B>O</B>ther?
		  

<tr><td valign="top"><span class = "address">McAlpine Tankersley Architecture<br>One Dexter Avenue<br>Montgomery, Alabama 36104<br>
V: 334/262.8315 <br>F: 334/262.8311</span></td>
	<td align="right" valign="top"><span class="form">
		  Comments:</span>  </td>
	<td align="left" valign="top">  <TEXTAREA NAME="comments" class="input" ROWS="5" COLS="32"></TEXTAREA>
		 </td>
</tr>


<tr><td colspan = "2">&nbsp; </td>
	<td align="left">    
		 <div align="left"> <INPUT TYPE=submit class="input" VALUE="Send"></div>
		 </td>
	
</tr>
</table>






</CFFORM></td></tr>
	
	</table>
</td>
</tr>
</table></div>



<cfinclude template="footer.cfm">
</body>
</html>
