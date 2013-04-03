<cfquery name="EntryQry" datasource="#request.mctDSN#" dbtype="ODBC">
SELECT *
From contacts
ORDER By ID

</cfquery>

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

<html>
<head>
	<title>McAlpine Tankersley Architecture Guestbook / <cfoutput>#Dateformat(Now())# #TimeFormat(Now())#</cfoutput></title>
</head>

<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="663300"
vlink="666666">

<p><br><cfoutput query="EntryQry"><LI><b><font face="book antiqua, times new roman"><a href="Guestdetail.cfm?id=#ID#" target="detail">Entry No.#ID# / #date#</a></font></b></cfoutput>

</body>
</html>
