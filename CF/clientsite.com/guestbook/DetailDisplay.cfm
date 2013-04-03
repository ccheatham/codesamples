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
  <META name="keywords" content="McAlpine Tankersley Architecture, McAlpine Tankersley, Bobby McAlpine, Robert Frank McAlpine, Greg Tankersley, Residential Architects, Southern Architects, Southern Residential Architects, House Designs, Southern House Designs, House Plans">
  <TITLE>m c a l p i n e | t a n k e r s l e y | a r c h i t e c t u r e</TITLE>
</HEAD>
<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="663300"
vlink="666666"><P><BR>
<CENTER>
 <TABLE BORDER=1 CELLPADDING="2" ALIGN="Center" WIDTH="500">
  
  <TR>
    <TD colspan="2" bgcolor="999999"><b><FONT face="MS Sans Serif, arial,helvetica"
	  size="2">PAT SIMPSON SURVEY ENTRY NO.<cfoutput query="SurveyQry"> #ID#  Posted on #date#</font></b></TD>
   
  </TR>
  <TR>
    <TD colspan="2"><FONT face="MS Sans Serif,arial,helvetica" size="2"><A href="mailto:#email#">#email#</A></FONT></TD>
    
  </TR>
  <TR>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2">How often do you watch HGTV?</font></TD>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2" color=##336600><b>#howoftenwatching#</b></font></TD>
  </TR>
  <TR>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2">Which shows do you watch on HGTV?</font></TD>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2" color=##336600>"Fix It Up!"?:<b>#fixitup#</b><BR>"Before &amp; After"?: <b>#beforeandafter#</b><BR>Other: <b>#othershows#</b></font></TD>
  </TR>
  <TR>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2">Which topics would you be interested in?</font></TD>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2" color=##336600>"Easy Home Fixes"?: <b>#EZHomeFixes#</b><BR>"Easy Outdoor Projects"?: <b>#EZOutdoorProjects#</b><BR>"Gazebos"?: <b>#gazebos#</b><br>Door Installation?: <b>#DoorInstallation#</b><br>PaintingTechniques?: <b>#PaintingTechniques#</b><br>
 Other: <b>#othertopics#</b></font></TD>
  </TR>
  <TR>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2">Would you be willing to pay $19.95 for each tape?:</font></TD>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2" color=##336600><b>#pay#</b>&nbsp;</font></TD>
  </TD>
  </TR>
    <TR>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2">Comments:</font></TD>
    <TD><FONT face="MS Sans Serif, arial,helvetica"
	  size="2" color=##336600><b>#comments#</b>&nbsp;</font></TD>
  </cfoutput>
</TD>
  </TR>
</TABLE>
<BR>
      <BR>  
      <P ALIGN=Center>
      <FONT face="helvetica, arial" size="2"><A HREF="../index.html"><IMG WIDTH="54"
	  HEIGHT="55" BORDER="0" SRC="tiny_sg.gif" ALT="Home"></A></FONT>
      <P ALIGN=Center>
      <B> <FONT face="helvetica, arial" size="2"><A HREF="/pat/onlocation.html">Pat
      On Location</A> / <A HREF="/pat/interview.html">The Pat Simpson Interview</A><BR>
      <A HREF="/pat/appearances.html" onclick="openAppearances(this,'Special_Appearances')">Special
      Appearances</A></FONT></B><BR>
      <FONT face="helvetica, arial" size="2"><B><A HREF="../about.html">about us</A>
      / <A HREF="../television.html">programming for television</A><BR>
      <A HREF="../video.html">audio &amp; video production</A> /
      <A HREF="../eventplanning.html">event planning</A> /
      <A HREF="../graphicdesign.html">graphic design</A></B></FONT>
      <DIV ALIGN=Center>
	<FONT face="helvetica, arial" size="2"><B>&copy; 1999 The Simpson Group,
	Inc.<BR>
	P.O. Box 1521 <BR>
	Griffin, Georgia 30224<BR>
	770.229.5000 | Fax 770.227.4893<BR>
	Email:
	<A HREF="mailto:info@thesimpsongroup.com">info@thesimpsongroup.com</A><BR>
	All Rights Reserved Worldwide</B></FONT>
      </DIV>
</CENTER><BR>
</body>
</html>

