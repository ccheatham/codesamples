<cfquery name="EntryQry" datasource="#request.mctDSN#" dbtype="ODBC">
SELECT * from contacts
where ID=#ID#
</cfquery>
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
   <TITLE>m c a l p i n e | t a n k e r s l e y | a r c h i t e c t u r e</TITLE>
</HEAD>
<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="663300"
vlink="666666"><P><BR>
<CENTER>
 <TABLE BORDER=1 CELLPADDING="2" ALIGN="Center">
  
  <TR>
    <TD colspan="2" bgcolor="999999"><b><FONT face="MS Sans Serif, arial,helvetica"
	  size="2"><p><b>Guestbook Entry:<cfoutput query="EntryQry"> #ID# - Posted on #date#</font></b></p></TD>
   
  </TR>
  <TR>
    <TD colspan="2"><p>Name:&nbsp;&nbsp; <font color="##ffffff">#name#</font></p></TD>
    
  </TR>
  <TR>
    <TD colspan="2"><p>Email Address:&nbsp;&nbsp; <font color="##ffffff"> <A href="mailto:#email#">#email#</a></font></p></TD>
    
  </TR>
  <TR>
    <TD colspan="2"><p>Comments:&nbsp;&nbsp; <font color="##ffffff"> #comments#</font></p></TD>
    
  </TR>
   <TR>
    <TD colspan="2"><p>How did you find our website?: &nbsp;&nbsp; <font color="##ffffff">#how#</font></p></TD></TR></cfoutput>
    
  
  
</TABLE>
<P ALIGN=Center>
	<a href="http://www.mcalpinetankersley.com" target="_top"><img src="translogo.gif" width=165 height=155 border=0 alt="home"></a>
</body>
</html>

