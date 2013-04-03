<HTML>
<HEAD>
  <META name="description" content="Described as 'nurturing, compassionate, soulful', McAlpine Tankersley's architecture, wedding historical precedence with modern living, strives to create 'The Inheritable House'.">
  <META name="keywords" content="McAlpine Tankersley Architecture, McAlpine Tankersley, Bobby McAlpine, Robert Frank McAlpine, Greg Tankersley, Residential Architects, Southern Architects, Southern Residential Architects, House Designs, Southern House Designs, House Plans">
  <!-- LWT/KBK New Media for McAlpine Tankersley -->
  <STYLE type="text/css"><!--
A.roll:hover {color: 666666;}
A.roll:visited {color: 663300;}
A.roll:visited:hover {color: 663300;}

A:hover {color: 666666;}

P {font-family: book antiqua, times new roman, times, arial, helvetica, sans-serif; 
        font-size: 12pt;        
        text-indent: 0em;
        color: 333333;
        }

P.nav {font-family: times new roman, times, arial, helvetica, sans-serif;
        font-size: 10pt;
        text-indent: 0em;
        text-align: center;
       }

--></STYLE>

 <SCRIPT language="JavaScript">

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
   alert("The username doesn't seem to be valid.")
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
alert("The domain name doesn't seem to be valid.")
   return false
}
var atomPat=new RegExp(atom,"g")
var domArr=domain.match(atomPat)
var len=domArr.length
if (domArr[domArr.length-1].length<2 || 
   domArr[domArr.length-1].length>3) {
   alert("The address must end in a three-letter domain, or two letter country.")
   return false
}
if (len<2) {
   var errStr="This address is missing a hostname!"
  alert(errStr)
   return false
}
return true;
}


                      //-->

</SCRIPT>
   <TITLE>m c a l p i n e | t a n k e r s l e y | a r c h i t e c t u r e</TITLE>
</HEAD>
<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="663300"
vlink="666666">
<CENTER>
  <TABLE BORDER="0" CELLPADDING="3" ALIGN="Center" width="100%">
    <TR>
      <TD><CFFORM ACTION="ProcessGuestbook.cfm" METHOD="POST">
	  <CENTER>
	    <TABLE BORDER="0" CELLPADDING="2" ALIGN="Center">
	      <TR>
		<TD COLSPAN=2><IMG WIDTH="517" HEIGHT="40" SRC="McT_with_ribbon.gif">
		  <P ALIGN=Center>
		  <IMG WIDTH="215" HEIGHT="46" BORDER="0" SRC="guestbook2.gif"></TD>
	      </TR>
	      <TR>
		<TD>
		  <P ALIGN=Right>
		  <B>Y</B>our<B> N</B>ame:</TD>
		<TD VALIGN="Bottom">
		  <CFINPUT TYPE="text" NAME="name" SIZE="30" required="yes" message="You must fill in your name..."></TD>
	      </TR>
		  <TR>
		<TD>
		  <P ALIGN=Right>
		  <B>Y</B>our<B> E</B>mail:</TD>
		<TD VALIGN="Bottom">
		  <CFINPUT TYPE="text" NAME="email" SIZE="30" onvalidate="emailCheck"></TD>
	      </TR>
	      <TR>
		<TD><B></B>
		  <P ALIGN=Right>
		  <B>H</B>ow did you find our website?:</TD>
		<TD VALIGN="Bottom"><P>
		  <P><cfoutput><input type="Hidden" name="date" value="#Dateformat(Now())#"></cfoutput>
		  <CFINPUT TYPE="radio" NAME="how" VALUE="search_engine"><B>S</B>earch Engine?
		  <CFINPUT TYPE="radio" NAME="how" VALUE="post_card"><B>P</B>ost Card?
		  <CFINPUT TYPE="radio" NAME="how" VALUE="other" checked><B>O</B>ther?</TD>
	      </TR>
	      <TR>
		<TD VALIGN="top">
		  <P ALIGN=Right>
		  <B>C</B>omments:</TD>
		<TD VALIGN="Bottom"><TEXTAREA NAME="comments" ROWS="5" COLS="30"></TEXTAREA></TD>
	      </TR>
	      <TR VALIGN="Top">
		<TD valign="top" width="200"></TD>
		<TD width="317"><P>
		  <P>
		  <INPUT TYPE=submit VALUE="send"></TD>
	      </TR>
	    </TABLE>
	  </CENTER>
	</CFFORM>
      </TD>
    </TR>
    <TR>
      <TD><P ALIGN=center>
	<IMG SRC="architecture_with_ribbon.gif" WIDTH="515" HEIGHT="38">
	</TD>
    </TR>
    <TR>
      <TD align="right"></TD>
    </TR>
  </TABLE>
</CENTER>
<P>

</BODY></HTML>
