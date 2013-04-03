<cfinsert datasource="#request.mctDSN#" dbtype="ODBC" tablename="contacts">

<CFMAIL
	FROM ="#email#"
	TO = "kris@lwtkbk.com,richard@mcalpinetankersley.com"
	SUBJECT = "Guestbook Entry"
>
Name: #name#
How Did You Find Our Website?: #how#
Comments: #comments#

</CFMAIL> 

<HTML>
<HEAD>
<META HTTP-EQUIV="Refresh" CONTENT="5; URL=http://www.mcalpinetankersley.com">
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
vlink="666666">
<table BORDER="0" CELLPADDING="2" ALIGN="Center" width="517" height="100%">
<tr>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td><DIV ALIGN=Center>
	<IMG SRC="McT_with_ribbon.gif" WIDTH="517" HEIGHT="40" BORDER="0" ALT="McAlpine Tankersley"><BR>
	<BR>
	<a href="http://www.mcalpinetankersley.com/"><IMG SRC="translogo.gif" WIDTH="165" HEIGHT="155" border="0"></a>
	<P ALIGN=center>
	thank you!
	<P ALIGN=center>
	<IMG SRC="architecture_with_ribbon.gif" WIDTH="515" HEIGHT="38"><BR><BR>
	</div></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
</tr>
</table>


</BODY></HTML>
